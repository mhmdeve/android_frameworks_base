/*
 * Copyright (C) 2021 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.android.wm.shell.splitscreen;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.Region;
import android.util.AttributeSet;
import android.view.View;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.android.internal.R;

/** View for drawing split outline. */
public class OutlineView extends View {
    private final Paint mPaint = new Paint();
    private final Rect mBounds = new Rect();

    public OutlineView(@NonNull Context context) {
        super(context);
    }

    public OutlineView(@NonNull Context context,
            @Nullable AttributeSet attrs) {
        super(context, attrs);
    }

    public OutlineView(@NonNull Context context, @Nullable AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    public OutlineView(@NonNull Context context, @Nullable AttributeSet attrs, int defStyleAttr,
            int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
    }

    @Override
    protected void onFinishInflate() {
        super.onFinishInflate();
        mPaint.setStyle(Paint.Style.STROKE);
        mPaint.setStrokeWidth(getResources()
                .getDimension(R.dimen.accessibility_focus_highlight_stroke_width));
    }

    void updateOutlineBounds(Rect bounds, int color) {
        if (mBounds.equals(bounds) && mPaint.getColor() == color) return;
        mBounds.set(bounds);
        mPaint.setColor(color);
    }

    @Override
    protected void onDraw(Canvas canvas) {
        if (mBounds.isEmpty()) return;
        final Path path = new Region(mBounds).getBoundaryPath();
        canvas.drawPath(path, mPaint);
    }
}
