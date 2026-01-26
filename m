Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 837ABCF65DB
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jan 2026 10:52:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4122E10E042;
	Mon, 26 Jan 2026 10:52:20 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04CC310E042;
 Mon, 26 Jan 2026 10:52:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Privatize_struc?=
 =?utf-8?q?t_xe=5Fggtt=2E_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 Jan 2026 10:52:19 -0000
Message-ID: <176942473901.192124.14643240598037367366@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260126104604.988024-1-dev@lankhorst.se>
In-Reply-To: <20260126104604.988024-1-dev@lankhorst.se>
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

Series: drm/xe: Privatize struct xe_ggtt. (rev4)
URL   : https://patchwork.freedesktop.org/series/160006/
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
commit e180aa19c443ba52f37255295c32cda7ea6723ee
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Mon Jan 26 11:46:04 2026 +0100

    drm/xe: Remove xe_ggtt_node_allocated
    
    With the intermediate state gone, no longer useful. Just check against
    NULL where needed.
    
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch faba79e95e439dbfce95931729875fcdcc211172 drm-intel
18c99f0f1058 drm/xe: Make xe_ggtt_node offset relative to starting offset
-:63: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#63: FILE: drivers/gpu/drm/xe/xe_ggtt.c:583:
+			 xe_ggtt_node_addr(node), xe_ggtt_node_addr(node) + node->base.size, ERR_PTR(err)))

total: 0 errors, 1 warnings, 0 checks, 141 lines checked
7ed0983b846e drm/xe: Rewrite GGTT VF initialization
-:18: WARNING:BAD_SIGN_OFF: Co-developed-by: must be immediately followed by Signed-off-by:
#18: 
Co-developed-by: Matthew Brost <matthew.brost@intel.com>


total: 0 errors, 1 warnings, 0 checks, 540 lines checked
a8a18370c92a drm/xe: Move struct xe_ggtt to xe_ggtt.c
-:46: ERROR:CODE_INDENT: code indent should use tabs where possible
#46: FILE: drivers/gpu/drm/xe/xe_ggtt.c:111:
+        /** @start: Start offset of GGTT */$

total: 1 errors, 0 warnings, 0 checks, 142 lines checked
24c9d993bafa drm/xe: Make xe_ggtt_node_insert return a node
e180aa19c443 drm/xe: Remove xe_ggtt_node_allocated


