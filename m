Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F8BCCD184
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 13:49:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D6210E5F3;
	Tue, 21 Oct 2025 13:49:16 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C4F710E5F1;
 Tue, 21 Oct 2025 13:49:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Privatize_struc?=
 =?utf-8?q?t_xe=5Fggtt=5Fnode=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 21 Oct 2025 13:49:15 -0000
Message-ID: <176105455510.37279.17109915176499807182@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251021121814.2193153-9-dev@lankhorst.se>
In-Reply-To: <20251021121814.2193153-9-dev@lankhorst.se>
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

Series: drm/xe: Privatize struct xe_ggtt_node.
URL   : https://patchwork.freedesktop.org/series/156258/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
8677d3b99d5fd579c143b22605d99121e2482e8a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 637e845a6d4be33d9246678a8816b4e3a388e865
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Tue Oct 21 14:18:21 2025 +0200

    drm/xe: Privatize xe_ggtt_node
    
    Nothing requires it any more, make the member private.
    
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch 5b93624944844e355037231c08ee088d33b4cf3b drm-intel
aa6499207b84 drm/xe: Start using ggtt->start in preparation of balloon removal
-:102: CHECK:SPACING: No space is necessary after a cast
#102: FILE: drivers/gpu/drm/xe/xe_ggtt.c:320:
+		ggtt_size = (gsm_size / 8) * (u64) XE_PAGE_SIZE - ggtt_start;

total: 0 errors, 0 warnings, 1 checks, 179 lines checked
e6012d21f21a drm/xe: Convert xe_fb_pin to use a callback for insertion into GGTT
-:195: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#195: FILE: drivers/gpu/drm/xe/xe_ggtt.c:627:
+static int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
 			       u32 size, u32 align, u32 mm_flags)

-:208: WARNING:LONG_LINE_COMMENT: line length of 120 exceeds 100 columns
#208: FILE: drivers/gpu/drm/xe/xe_ggtt.c:668:
+ * xe_ggtt_node_insert_transform(), or xe_ggtt_node_insert_balloon_locked() will ensure the node is inserted or reserved

total: 0 errors, 1 warnings, 1 checks, 317 lines checked
3ed7ecc2f11f drm/xe: Add xe_ggtt_node_addr() to avoid dereferencing xe_ggtt_node
44cfb77b36a0 drm/xe/display: Avoid dereferencing xe_ggtt_node
-:9: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#9: 
Also sneak in a xe_bo_size() for stolen, too small to put as separate commit.

-:13: WARNING:BAD_SIGN_OFF: Duplicate signature
#13: 
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

total: 0 errors, 2 warnings, 0 checks, 40 lines checked
068765adeabd drm/xe: Do not dereference ggtt_node in xe_bo.c
b507fa1c66ee drm/xe: Improve xe_gt_sriov_pf_config GGTT handling
-:11: WARNING:BAD_SIGN_OFF: Duplicate signature
#11: 
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

total: 0 errors, 1 warnings, 0 checks, 62 lines checked
637e845a6d4b drm/xe: Privatize xe_ggtt_node
-:10: WARNING:BAD_SIGN_OFF: Duplicate signature
#10: 
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

total: 0 errors, 1 warnings, 0 checks, 55 lines checked


