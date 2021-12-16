/*
 * Copyright (C) 2008 The Android Open Source Project
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

package com.android.internal.view;

import android.os.Bundle;
import android.view.KeyEvent;
import android.view.inputmethod.CompletionInfo;
import android.view.inputmethod.CorrectionInfo;
import android.view.inputmethod.ExtractedTextRequest;
import android.view.inputmethod.InputContentInfo;

import com.android.internal.infra.AndroidFuture;
import com.android.internal.inputmethod.InputConnectionCommandHeader;

/**
 * Interface from an input method to the application, allowing it to perform
 * edits on the current input field and other interactions with the application.
 * {@hide}
 */
 oneway interface IInputContext {
    void getTextBeforeCursor(in InputConnectionCommandHeader header, int length, int flags,
            in AndroidFuture future /* T=CharSequence */);

    void getTextAfterCursor(in InputConnectionCommandHeader header, int length, int flags,
            in AndroidFuture future /* T=CharSequence */);

    void getCursorCapsMode(in InputConnectionCommandHeader header, int reqModes,
            in AndroidFuture future /* T=Integer */);

    void getExtractedText(in InputConnectionCommandHeader header, in ExtractedTextRequest request,
            int flags, in AndroidFuture future /* T=ExtractedText */);

    void deleteSurroundingText(in InputConnectionCommandHeader header, int beforeLength,
            int afterLength);
    void deleteSurroundingTextInCodePoints(in InputConnectionCommandHeader header, int beforeLength,
            int afterLength);

    void setComposingText(in InputConnectionCommandHeader header, CharSequence text,
            int newCursorPosition);

    void finishComposingText(in InputConnectionCommandHeader header);

    void commitText(in InputConnectionCommandHeader header, CharSequence text,
            int newCursorPosition);

    void commitCompletion(in InputConnectionCommandHeader header, in CompletionInfo completion);

    void commitCorrection(in InputConnectionCommandHeader header, in CorrectionInfo correction);

    void setSelection(in InputConnectionCommandHeader header, int start, int end);

    void performEditorAction(in InputConnectionCommandHeader header, int actionCode);

    void performContextMenuAction(in InputConnectionCommandHeader header, int id);

    void beginBatchEdit(in InputConnectionCommandHeader header);

    void endBatchEdit(in InputConnectionCommandHeader header);

    void sendKeyEvent(in InputConnectionCommandHeader header, in KeyEvent event);

    void clearMetaKeyStates(in InputConnectionCommandHeader header, int states);

    void performSpellCheck(in InputConnectionCommandHeader header);

    void performPrivateCommand(in InputConnectionCommandHeader header, String action,
            in Bundle data);

    void setComposingRegion(in InputConnectionCommandHeader header, int start, int end);

    void getSelectedText(in InputConnectionCommandHeader header, int flags,
            in AndroidFuture future /* T=CharSequence */);

    void requestCursorUpdates(in InputConnectionCommandHeader header, int cursorUpdateMode,
            int imeDisplayId, in AndroidFuture future /* T=Boolean */);

    void commitContent(in InputConnectionCommandHeader header, in InputContentInfo inputContentInfo,
            int flags, in Bundle opts, in AndroidFuture future /* T=Boolean */);

    void getSurroundingText(in InputConnectionCommandHeader header, int beforeLength,
            int afterLength, int flags, in AndroidFuture future /* T=SurroundingText */);

    void setImeConsumesInput(in InputConnectionCommandHeader header, boolean imeConsumesInput);
}
