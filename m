Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F2BC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 03:17:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A51C710ED6F;
	Tue, 16 Apr 2024 03:17:47 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6D810E909;
 Tue, 16 Apr 2024 03:17:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Per_client_usag?=
 =?utf-8?q?e?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Apr 2024 03:17:46 -0000
Message-ID: <171323746639.1424598.8586497192939690178@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240416030454.3739862-1-lucas.demarchi@intel.com>
In-Reply-To: <20240416030454.3739862-1-lucas.demarchi@intel.com>
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

Series: drm/xe: Per client usage
URL   : https://patchwork.freedesktop.org/series/132477/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35057f376b5337039b258ae4c66ed9218f4b3fb8
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2797c619f7ae7ece8e38c38079ca6711fe41ade9
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Mon Apr 15 20:04:54 2024 -0700

    HACK: simple gputop-like impl in python
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 5f7597e990bea547bd1261170497e7476fb781bb drm-intel
85365847056a drm/xe/lrc: Add helper to capture context timestamp
d182c2488219 drm/xe: Add helper to capture context runtime
04c34ca451d9 drm/xe: Promote xe_hw_engine_class_to_str()
0fda308cec94 drm/xe: Add XE_ENGINE_CLASS_OTHER to str conversion
2f07c3f1d009 drm/xe: Add helper to capture engine timestamp
c2bc78b97a7d drm/xe/client: Print runtime to fdinfo
-:49: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#49: 
Test-with: https://lore.kernel.org/igt-dev/20240405060056.59379-1-lucas.demarchi@intel.com/

-:81: ERROR:CODE_INDENT: code indent should use tabs where possible
#81: FILE: drivers/gpu/drm/xe/xe_drm_client.c:187:
+        [XE_ENGINE_CLASS_RENDER] = XE_HW_ENGINE_RCS_MASK,$

-:81: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#81: FILE: drivers/gpu/drm/xe/xe_drm_client.c:187:
+        [XE_ENGINE_CLASS_RENDER] = XE_HW_ENGINE_RCS_MASK,$

-:82: ERROR:CODE_INDENT: code indent should use tabs where possible
#82: FILE: drivers/gpu/drm/xe/xe_drm_client.c:188:
+        [XE_ENGINE_CLASS_VIDEO_DECODE] = XE_HW_ENGINE_VCS_MASK,$

-:82: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#82: FILE: drivers/gpu/drm/xe/xe_drm_client.c:188:
+        [XE_ENGINE_CLASS_VIDEO_DECODE] = XE_HW_ENGINE_VCS_MASK,$

-:83: ERROR:CODE_INDENT: code indent should use tabs where possible
#83: FILE: drivers/gpu/drm/xe/xe_drm_client.c:189:
+        [XE_ENGINE_CLASS_VIDEO_ENHANCE] = XE_HW_ENGINE_VECS_MASK,$

-:83: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#83: FILE: drivers/gpu/drm/xe/xe_drm_client.c:189:
+        [XE_ENGINE_CLASS_VIDEO_ENHANCE] = XE_HW_ENGINE_VECS_MASK,$

-:84: ERROR:CODE_INDENT: code indent should use tabs where possible
#84: FILE: drivers/gpu/drm/xe/xe_drm_client.c:190:
+        [XE_ENGINE_CLASS_COPY] = XE_HW_ENGINE_BCS_MASK,$

-:84: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#84: FILE: drivers/gpu/drm/xe/xe_drm_client.c:190:
+        [XE_ENGINE_CLASS_COPY] = XE_HW_ENGINE_BCS_MASK,$

-:85: ERROR:CODE_INDENT: code indent should use tabs where possible
#85: FILE: drivers/gpu/drm/xe/xe_drm_client.c:191:
+        [XE_ENGINE_CLASS_OTHER] = XE_HW_ENGINE_GSCCS_MASK,$

-:85: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#85: FILE: drivers/gpu/drm/xe/xe_drm_client.c:191:
+        [XE_ENGINE_CLASS_OTHER] = XE_HW_ENGINE_GSCCS_MASK,$

-:86: ERROR:CODE_INDENT: code indent should use tabs where possible
#86: FILE: drivers/gpu/drm/xe/xe_drm_client.c:192:
+        [XE_ENGINE_CLASS_COMPUTE] = XE_HW_ENGINE_CCS_MASK,$

-:86: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#86: FILE: drivers/gpu/drm/xe/xe_drm_client.c:192:
+        [XE_ENGINE_CLASS_COMPUTE] = XE_HW_ENGINE_CCS_MASK,$

total: 6 errors, 7 warnings, 0 checks, 104 lines checked
2797c619f7ae HACK: simple gputop-like impl in python
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:9: ERROR:EXECUTE_PERMISSIONS: do not set execute permissions for source files
#9: FILE: pyfdinfo

-:9: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#9: 
new file mode 100755

-:15: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 2
#15: FILE: pyfdinfo:2:
+

total: 1 errors, 3 warnings, 0 checks, 113 lines checked


