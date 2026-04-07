Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9B1FB5190
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 03:51:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B9A210E321;
	Tue,  7 Apr 2026 03:51:16 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2552110E31D;
 Tue,  7 Apr 2026 03:51:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/uapi=3A_Update_xe?=
 =?utf-8?q?=5Fdrm=2Eh_documentation_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 07 Apr 2026 03:51:16 -0000
Message-ID: <177553387613.435999.8866125013357952173@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260407030046.3394004-1-shuicheng.lin@intel.com>
In-Reply-To: <20260407030046.3394004-1-shuicheng.lin@intel.com>
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

Series: drm/xe/uapi: Update xe_drm.h documentation (rev3)
URL   : https://patchwork.freedesktop.org/series/161217/
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
commit ddf2fa4b7986ce066c4581255615a09165349519
Author: Shuicheng Lin <shuicheng.lin@intel.com>
Date:   Tue Apr 7 03:00:46 2026 +0000

    drm/xe/uapi: Fix doc formatting and completeness in xe_drm.h
    
    - Fix missing leading space before closing */ in
      comment block
    - Add DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY to the
      IOCTL overview list
    - Add missing query types to the device query doc list:
      DRM_XE_DEVICE_QUERY_UC_FW_VERSION,
      DRM_XE_DEVICE_QUERY_OA_UNITS,
      DRM_XE_DEVICE_QUERY_EU_STALL
    - Fix ioctl's -> ioctls (not possessive, 2 occurrences)
    - Remove duplicate parameter docs from
      drm_xe_mem_range_attr overview (already documented
      as inline member comments)
    - Fix extra whitespace before /** on 2 lines in
      drm_xe_mem_range_attr
    - Add missing blank line before DRM_XE_VM_BIND_FLAG_DECOMPRESS
      bullet to fix RST block quote warning
    
    v3: more fix (item 4 to 7).
    
    Assisted-by: GitHub Copilot:claude-opus-4.6
    Cc: Xin Wang <x.wang@intel.com>
    Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
+ /mt/dim checkpatch 7b7217a9e27a82ef10be22ab3a55ad5bbc849688 drm-intel
5c4d9ee21c06 drm/xe/uapi: Fix typos and spelling errors in xe_drm.h documentation
-:16: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#16: 
Assisted-by: GitHub Copilot:claude-opus-4.6

-:16: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-opus-4.6'
#16: 
Assisted-by: GitHub Copilot:claude-opus-4.6

total: 1 errors, 1 warnings, 0 checks, 46 lines checked
a5ace148c114 drm/xe/uapi: Fix grammar errors in xe_drm.h documentation
-:19: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#19: 
Assisted-by: GitHub Copilot:claude-opus-4.6

-:19: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-opus-4.6'
#19: 
Assisted-by: GitHub Copilot:claude-opus-4.6

total: 1 errors, 1 warnings, 0 checks, 81 lines checked
d4536a52e564 drm/xe/uapi: Fix wrong names and references in xe_drm.h
-:25: WARNING:TYPO_SPELLING: 'seperate' may be misspelled - perhaps 'separate'?
#25: 
    split cross-reference fix to seperate patch.
                                 ^^^^^^^^

-:27: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#27: 
Assisted-by: GitHub Copilot:claude-opus-4.6

-:27: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-opus-4.6'
#27: 
Assisted-by: GitHub Copilot:claude-opus-4.6

total: 1 errors, 2 warnings, 0 checks, 96 lines checked
d244d20a5051 drm/xe/uapi: Fix kernel-doc cross-reference syntax in xe_drm.h
-:27: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#27: 
Assisted-by: GitHub Copilot:claude-opus-4.6

-:27: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-opus-4.6'
#27: 
Assisted-by: GitHub Copilot:claude-opus-4.6

total: 1 errors, 1 warnings, 0 checks, 288 lines checked
1c0e434c2db1 drm/xe/uapi: Fix code examples in xe_drm.h documentation
-:20: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#20: 
Assisted-by: GitHub Copilot:claude-opus-4.6

-:20: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-opus-4.6'
#20: 
Assisted-by: GitHub Copilot:claude-opus-4.6

total: 1 errors, 1 warnings, 0 checks, 49 lines checked
ddf2fa4b7986 drm/xe/uapi: Fix doc formatting and completeness in xe_drm.h
-:25: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#25: 
Assisted-by: GitHub Copilot:claude-opus-4.6

-:25: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-opus-4.6'
#25: 
Assisted-by: GitHub Copilot:claude-opus-4.6

total: 1 errors, 1 warnings, 0 checks, 67 lines checked


