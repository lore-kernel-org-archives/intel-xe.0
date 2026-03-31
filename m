Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D94110F92EB
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 18:53:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F099510ED09;
	Tue, 31 Mar 2026 18:53:12 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 198DC10ED09;
 Tue, 31 Mar 2026 18:53:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/uapi=3A_Update_xe?=
 =?utf-8?q?=5Fdrm=2Eh_documentation_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 31 Mar 2026 18:53:11 -0000
Message-ID: <177498319108.419941.18269868651226315059@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260331172049.3053871-7-shuicheng.lin@intel.com>
In-Reply-To: <20260331172049.3053871-7-shuicheng.lin@intel.com>
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

Series: drm/xe/uapi: Update xe_drm.h documentation (rev2)
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
commit dbf47dfc035705bd62d29ad39b816c8c4bb59849
Author: Shuicheng Lin <shuicheng.lin@intel.com>
Date:   Tue Mar 31 17:20:55 2026 +0000

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
    
    Assisted-by: GitHub Copilot:claude-opus-4.6
    Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
+ /mt/dim checkpatch 779129c7868f4c7205901d6e57b25de52b411d1c drm-intel
5bcb69fbe054 drm/xe/uapi: Fix typos and spelling errors in xe_drm.h documentation
-:16: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#16: 
Assisted-by: GitHub Copilot:claude-opus-4.6

-:16: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-opus-4.6'
#16: 
Assisted-by: GitHub Copilot:claude-opus-4.6

total: 1 errors, 1 warnings, 0 checks, 46 lines checked
5dc63d029f43 drm/xe/uapi: Fix grammar errors in xe_drm.h documentation
-:19: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#19: 
Assisted-by: GitHub Copilot:claude-opus-4.6

-:19: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-opus-4.6'
#19: 
Assisted-by: GitHub Copilot:claude-opus-4.6

total: 1 errors, 1 warnings, 0 checks, 81 lines checked
f47bfd3064ac drm/xe/uapi: Fix wrong names and references in xe_drm.h
-:26: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#26: 
Assisted-by: GitHub Copilot:claude-opus-4.6

-:26: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-opus-4.6'
#26: 
Assisted-by: GitHub Copilot:claude-opus-4.6

total: 1 errors, 1 warnings, 0 checks, 104 lines checked
4d5ccee5ad3f drm/xe/uapi: Fix code examples in xe_drm.h documentation
-:16: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#16: 
Assisted-by: GitHub Copilot:claude-opus-4.6

-:16: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-opus-4.6'
#16: 
Assisted-by: GitHub Copilot:claude-opus-4.6

total: 1 errors, 1 warnings, 0 checks, 36 lines checked
dbf47dfc0357 drm/xe/uapi: Fix doc formatting and completeness in xe_drm.h
-:16: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#16: 
Assisted-by: GitHub Copilot:claude-opus-4.6

-:16: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-opus-4.6'
#16: 
Assisted-by: GitHub Copilot:claude-opus-4.6

total: 1 errors, 1 warnings, 0 checks, 37 lines checked


