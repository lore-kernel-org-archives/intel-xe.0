Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C32AC3ABAA
	for <intel-xe@archiver.kernel.org>; Fri,  2 May 2025 12:32:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD4F210E8F3;
	Fri,  2 May 2025 12:32:52 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 981B010E8DA;
 Fri,  2 May 2025 12:32:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Preparations_to_make_stru?=
 =?utf-8?q?ct_xe=5Fggtt_private=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 02 May 2025 12:32:51 -0000
Message-ID: <174618917162.35129.15194132587250636821@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250502103638.521845-1-dev@lankhorst.se>
In-Reply-To: <20250502103638.521845-1-dev@lankhorst.se>
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

Series: Preparations to make struct xe_ggtt private.
URL   : https://patchwork.freedesktop.org/series/148546/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 49d675d829fc7b88fd360ac1e6ad672fbb0990b4
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Fri May 2 12:36:37 2025 +0200

    drm/xe: Do not rely on GGTT internals in xe_guc_buf kunit tests
    
    Add a function to init ggtt for kunit, and use the GGTT function for
    initialising the GGTT node without populating it. This
    prevents the test from ever knowing about struct xe_ggtt.
    
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch 5303c0e49b49fe27639ba8b2c178931bc22344a2 drm-intel
59bebe63ab43 drm/xe: Use xe_ggtt_map_bo_unlocked for resume
0baeb15e6634 drm/xe: Add xe_ggtt_might_lock
e64bc6d51998 drm/xe: Add xe_ggtt_alloc
-:33: WARNING:LINE_SPACING: Missing a blank line after declarations
#33: FILE: drivers/gpu/drm/xe/xe_ggtt.c:174:
+	struct xe_ggtt *ggtt = drmm_kzalloc(&tile_to_xe(tile)->drm, sizeof(*ggtt), GFP_KERNEL);
+	if (ggtt)

total: 0 errors, 1 warnings, 0 checks, 45 lines checked
ad252c57fa5f drm/xe/display: Remove dereferences of ggtt for tile id
a86c2d2831d1 drm/xe/ggtt: Seperate flags and address in PTE encoding
-:4: WARNING:TYPO_SPELLING: 'Seperate' may be misspelled - perhaps 'Separate'?
#4: 
Subject: [PATCH] drm/xe/ggtt: Seperate flags and address in PTE encoding
                              ^^^^^^^^

-:160: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#160: FILE: drivers/gpu/drm/xe/xe_ggtt.c:662:
+		     xe_res_next(&cur, XE_PAGE_SIZE)) {
+

total: 0 errors, 1 warnings, 1 checks, 187 lines checked
48b3d07c731e drm/xe/display: Dont poke into GGTT internals to fill a DPT
-:54: WARNING:LINE_SPACING: Missing a blank line after declarations
#54: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:66:
+			u64 addr = xe_bo_addr(bo, src_idx * XE_PAGE_SIZE, XE_PAGE_SIZE);
+			iosys_map_wr(map, *dpt_ofs, u64, pte | addr);

total: 0 errors, 1 warnings, 0 checks, 79 lines checked
ddb6822dfb79 drm/xe/display: Convert GGTT mapping to use pte_encode_flags
2f8c6695f2ea drm/xe: Remove pte_encode_bo callback
8ebe7f3de4db drm/xe: Implement a helper for reading out a GGTT PTE at a specified offset
49d675d829fc drm/xe: Do not rely on GGTT internals in xe_guc_buf kunit tests


