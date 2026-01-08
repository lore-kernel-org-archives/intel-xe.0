Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D40D185C2
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 10:40:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 445A310E32C;
	Thu,  8 Jan 2026 10:40:42 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 277D910E32A;
 Thu,  8 Jan 2026 10:40:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Privatize_struc?=
 =?utf-8?q?t_xe=5Fggtt=5Fnode=2E_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 08 Jan 2026 10:40:41 -0000
Message-ID: <176786884116.136184.14351810225401109503@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260108101014.579906-9-dev@lankhorst.se>
In-Reply-To: <20260108101014.579906-9-dev@lankhorst.se>
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

Series: drm/xe: Privatize struct xe_ggtt_node. (rev2)
URL   : https://patchwork.freedesktop.org/series/156258/
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
commit c2bf49c644f02ef78be452d1f5fe481537217804
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Thu Jan 8 11:10:22 2026 +0100

    drm/xe: Privatize xe_ggtt_node
    
    Nothing requires it any more, make the member private.
    
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch 580c8957e96b7372e82590d1b1e6c2842c245077 drm-intel
04e0c5a6b4e3 drm/xe: Start using ggtt->start in preparation of balloon removal
-:115: CHECK:SPACING: No space is necessary after a cast
#115: FILE: drivers/gpu/drm/xe/xe_ggtt.c:331:
+		ggtt_size = (gsm_size / 8) * (u64) XE_PAGE_SIZE - ggtt_start;

total: 0 errors, 0 warnings, 1 checks, 187 lines checked
4a461e0a0d7a drm/xe: Convert xe_fb_pin to use a callback for insertion into GGTT
-:190: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#190: FILE: drivers/gpu/drm/xe/xe_ggtt.c:640:
+static int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
 			       u32 size, u32 align, u32 mm_flags)

-:203: WARNING:LONG_LINE_COMMENT: line length of 120 exceeds 100 columns
#203: FILE: drivers/gpu/drm/xe/xe_ggtt.c:681:
+ * xe_ggtt_node_insert_transform(), or xe_ggtt_node_insert_balloon_locked() will ensure the node is inserted or reserved

total: 0 errors, 1 warnings, 1 checks, 314 lines checked
513cc38e3a97 drm/xe: Add xe_ggtt_node_addr() to avoid dereferencing xe_ggtt_node
770cabb5eb17 drm/xe/display: Avoid dereferencing xe_ggtt_node
-:9: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#9: 
Also sneak in a xe_bo_size() for stolen, too small to put as separate commit.

total: 0 errors, 1 warnings, 0 checks, 40 lines checked
d57dd1e5fa35 drm/xe: Do not dereference ggtt_node in xe_bo.c
ae5ee32ffe07 drm/xe: Improve xe_gt_sriov_pf_config GGTT handling
c2bf49c644f0 drm/xe: Privatize xe_ggtt_node


