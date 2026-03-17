Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CAF7FF6E8B
	for <intel-xe@archiver.kernel.org>; Tue, 17 Mar 2026 22:06:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5171010E1C6;
	Tue, 17 Mar 2026 22:06:55 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFEE910E1C6;
 Tue, 17 Mar 2026 22:06:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Fix_mismatched_?=
 =?utf-8?q?include_guards_in_header_files_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Mar 2026 22:06:53 -0000
Message-ID: <177378521393.368406.4198104663437148150@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260317215732.2208976-7-shuicheng.lin@intel.com>
In-Reply-To: <20260317215732.2208976-7-shuicheng.lin@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: Fix mismatched include guards in header files (rev2)
URL   : https://patchwork.freedesktop.org/series/163295/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 18ee4c0abd65f2afd2b31d241bc3b300916a5a40
Author: Shuicheng Lin <shuicheng.lin@intel.com>
Date:   Tue Mar 17 21:57:21 2026 +0000

    drm/xe: Normalize double-underscore include guards to single-underscore
    
    Six headers use __XE_<NAME>_H__ (double-underscore prefix and suffix)
    as their include guards. Normalize them to the single-underscore
    _XE_<NAME>_H_ convention used by the rest of the xe codebase.
    
    Files fixed:
      - xe_eu_stall.h:     __XE_EU_STALL_H__     -> _XE_EU_STALL_H_
      - xe_nvm.h:          __XE_NVM_H__          -> _XE_NVM_H_
      - xe_pxp.h:          __XE_PXP_H__          -> _XE_PXP_H_
      - xe_pxp_debugfs.h:  __XE_PXP_DEBUGFS_H__ -> _XE_PXP_DEBUGFS_H_
      - xe_pxp_submit.h:   __XE_PXP_SUBMIT_H__  -> _XE_PXP_SUBMIT_H_
      - xe_pxp_types.h:    __XE_PXP_TYPES_H__   -> _XE_PXP_TYPES_H_
    
    No functional change.
    
    Suggested-by: Nitin Gote <nitin.r.gote@intel.com>
    Assisted-by: GitHub Copilot:claude-opus-4.6
    Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
+ /mt/dim checkpatch 14efcb821ecb1a7935a3148109e7903839243d53 drm-intel
51b2297b2520 drm/xe: Add missing include guards to unprotected headers
-:17: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#17: 
Assisted-by: GitHub Copilot:claude-opus-4.6

-:17: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-opus-4.6'
#17: 
Assisted-by: GitHub Copilot:claude-opus-4.6

total: 1 errors, 1 warnings, 0 checks, 28 lines checked
1986015dc1c6 drm/xe: Add missing _H to include guard suffixes
-:26: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#26: 
Assisted-by: GitHub Copilot:claude-opus-4.6

-:26: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-opus-4.6'
#26: 
Assisted-by: GitHub Copilot:claude-opus-4.6

total: 1 errors, 1 warnings, 0 checks, 100 lines checked
bb9a9020d21a drm/xe: Add missing trailing underscore to include guards
-:12: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#12: 
  - xe_guc_capture_types.h: _XE_GUC_CAPTURE_TYPES_H -> _XE_GUC_CAPTURE_TYPES_H_

-:19: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#19: 
Assisted-by: GitHub Copilot:claude-opus-4.6

-:19: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-opus-4.6'
#19: 
Assisted-by: GitHub Copilot:claude-opus-4.6

total: 1 errors, 2 warnings, 0 checks, 40 lines checked
f844aceee925 drm/xe: Add missing leading underscore to include guards
-:17: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#17: 
Assisted-by: GitHub Copilot:claude-opus-4.6

-:17: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-opus-4.6'
#17: 
Assisted-by: GitHub Copilot:claude-opus-4.6

total: 1 errors, 1 warnings, 0 checks, 20 lines checked
18ee4c0abd65 drm/xe: Normalize double-underscore include guards to single-underscore
-:22: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#22: 
Assisted-by: GitHub Copilot:claude-opus-4.6

-:22: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-opus-4.6'
#22: 
Assisted-by: GitHub Copilot:claude-opus-4.6

total: 1 errors, 1 warnings, 0 checks, 79 lines checked


