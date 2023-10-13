Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E428DCDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 17:23:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F64B10E04B;
	Fri, 13 Oct 2023 17:23:25 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1281810E04B;
 Fri, 13 Oct 2023 17:23:24 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 1091AAA915;
 Fri, 13 Oct 2023 17:23:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: maarten.lankhorst@linux.intel.com
Date: Fri, 13 Oct 2023 17:23:24 -0000
Message-ID: <169721780406.31157.6107969755568592554@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231013152142.52869-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20231013152142.52869-1-maarten.lankhorst@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_RF?=
 =?utf-8?q?C_for_discussion_of_devcoredump_uapi=2E?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: RFC for discussion of devcoredump uapi.
URL   : https://patchwork.freedesktop.org/series/125124/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6b11c459aaaeac43bd6a5984588ef176f62204e8
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Fri Oct 13 17:21:42 2023 +0200

    drm/xe: Almost implement snapshot support
    
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch 037b6c8b23818fa71223e996c68a4f55f2d91338 drm-intel
0d3bc6313 drm/xe: Add uapi for dumpable bos
-:136: WARNING:TYPO_SPELLING: 'informations' may be misspelled - perhaps 'information'?
#136: FILE: include/uapi/drm/xe_drm.h:651:
+	 * See the NOTE there for more informations.
 	                               ^^^^^^^^^^^^

-:141: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Maarten Lankhorst <dev@lankhorst.se>' != 'Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>'

total: 0 errors, 2 warnings, 0 checks, 99 lines checked
d1f0086ab drm/xe: Annotate each dumpable vma as such
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 90 lines checked
0889b6672 drm/xe: Add vm snapshot mutex for easily taking a vm snapshot during devcoredump
-:8: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 50 lines checked
6b11c459a drm/xe: Almost implement snapshot support
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:78: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u64' over 'uint64_t'
#78: FILE: drivers/gpu/drm/xe/xe_vm.c:3733:
+		uint64_t ofs, bo_ofs;

-:128: WARNING:LINE_SPACING: Missing a blank line after declarations
#128: FILE: drivers/gpu/drm/xe/xe_vm.c:3783:
+		struct xe_bo *bo = snap->snap[i].bo;
+		if (snap->snap[i].data)

-:141: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (16, 16)
#141: FILE: drivers/gpu/drm/xe/xe_vm.c:3796:
+		if (0)
+		xe_map_memcpy_from(xe_bo_device(bo), snap->snap[i].data,

-:147: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#147: FILE: drivers/gpu/drm/xe/xe_vm.c:3802:
+			uint32_t *x = snap->snap[i].data + j;

-:150: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#150: FILE: drivers/gpu/drm/xe/xe_vm.c:3805:
+				   snap->snap[i].ofs + j, x[0], x[1], x[2], x[3], x[4], x[5], x[6], x[7],

total: 0 errors, 4 warnings, 2 checks, 149 lines checked


