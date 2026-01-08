Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD79D1D493
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 20:32:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8089B10E7C5;
	Thu,  8 Jan 2026 20:32:08 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EACB10E223;
 Thu,  8 Jan 2026 20:32:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Testing_entire_GGTT_priva?=
 =?utf-8?q?tization_preparation_series=2E_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 08 Jan 2026 20:32:07 -0000
Message-ID: <176790432764.138403.6761506292054233782@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260108202531.671690-1-dev@lankhorst.se>
In-Reply-To: <20260108202531.671690-1-dev@lankhorst.se>
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

Series: Testing entire GGTT privatization preparation series. (rev3)
URL   : https://patchwork.freedesktop.org/series/159797/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9f1cb6875f3f9eb0925ed50c16100322a2df513c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7719c2b961ed324984bb291ded6159811fca46a4
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Thu Jan 8 21:25:30 2026 +0100

    drm/xe: Remove xe_ggtt_node_allocated
    
    With the intermediate state gone, no longer useful. Just check against
    NULL.
    
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch 44b04b02003c7b6060dbad7fc5a0de537d395b77 drm-intel
889496739c19 drm/xe: Start using ggtt->start in preparation of balloon removal
-:115: CHECK:SPACING: No space is necessary after a cast
#115: FILE: drivers/gpu/drm/xe/xe_ggtt.c:331:
+		ggtt_size = (gsm_size / 8) * (u64) XE_PAGE_SIZE - ggtt_start;

total: 0 errors, 0 warnings, 1 checks, 187 lines checked
0901d6228f0c drm/xe: Convert xe_fb_pin to use a callback for insertion into GGTT
-:190: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#190: FILE: drivers/gpu/drm/xe/xe_ggtt.c:640:
+static int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
 			       u32 size, u32 align, u32 mm_flags)

-:203: WARNING:LONG_LINE_COMMENT: line length of 120 exceeds 100 columns
#203: FILE: drivers/gpu/drm/xe/xe_ggtt.c:681:
+ * xe_ggtt_node_insert_transform(), or xe_ggtt_node_insert_balloon_locked() will ensure the node is inserted or reserved

total: 0 errors, 1 warnings, 1 checks, 314 lines checked
855bf1bca3e5 drm/xe: Add xe_ggtt_node_addr() to avoid dereferencing xe_ggtt_node
e6aa760c4817 drm/xe/display: Avoid dereferencing xe_ggtt_node
-:9: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#9: 
Also sneak in a xe_bo_size() for stolen, too small to put as separate commit.

total: 0 errors, 1 warnings, 0 checks, 40 lines checked
803cb541be0f drm/xe: Do not dereference ggtt_node in xe_bo.c
d4abba8cf182 drm/xe: Improve xe_gt_sriov_pf_config GGTT handling
f6435a8df9b1 drm/xe: Privatize xe_ggtt_node
83f465f14233 drm/xe: Make xe_ggtt_node offset relative to starting offset
-:53: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#53: FILE: drivers/gpu/drm/xe/xe_ggtt.c:583:
+			 xe_ggtt_node_addr(node), xe_ggtt_node_addr(node) + node->base.size, ERR_PTR(err)))

total: 0 errors, 1 warnings, 0 checks, 68 lines checked
dc254e3c1349 drm/xe: Rewrite GGTT VF initialisation
-:18: WARNING:BAD_SIGN_OFF: Co-developed-by: must be immediately followed by Signed-off-by:
#18: 
Co-developed-by: Matthew Brost <matthew.brost@intel.com>


-:61: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#61: FILE: drivers/gpu/drm/xe/xe_ggtt.c:357:
+			xe_tile_err(ggtt->tile, "tile%u: Invalid GGTT configuration: %#llx-%#llx\n",
+				     ggtt->tile->id, ggtt_start, ggtt_start + ggtt_size - 1);

total: 0 errors, 1 warnings, 1 checks, 540 lines checked
44750a8e3569 drm/xe: Move struct xe_ggtt to xe_ggtt.c
-:46: ERROR:CODE_INDENT: code indent should use tabs where possible
#46: FILE: drivers/gpu/drm/xe/xe_ggtt.c:112:
+        /** @start: Start offset of GGTT */$

total: 1 errors, 0 warnings, 0 checks, 142 lines checked
28c8eb81802c drm/xe: Make xe_ggtt_node_insert return a node
7719c2b961ed drm/xe: Remove xe_ggtt_node_allocated


