Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDDA8C54FB3
	for <intel-xe@archiver.kernel.org>; Mon, 26 May 2025 16:29:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC52910E32E;
	Mon, 26 May 2025 16:29:35 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD23110E162;
 Mon, 26 May 2025 16:29:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/ggtt=3A_Stop_relyi?=
 =?utf-8?q?ng_on_GGTT_internals=2E_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 May 2025 16:29:34 -0000
Message-ID: <174827697476.20795.1591645002052658193@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250505121924.921544-1-dev@lankhorst.se>
In-Reply-To: <20250505121924.921544-1-dev@lankhorst.se>
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

Series: drm/xe/ggtt: Stop relying on GGTT internals. (rev2)
URL   : https://patchwork.freedesktop.org/series/148602/
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
commit 26692f6d365fec51104bc20f7e90afdff1996590
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Mon May 5 14:19:23 2025 +0200

    drm/xe: Do not rely on GGTT internals in xe_guc_buf kunit tests
    
    Add a function to init ggtt for kunit, and use the GGTT function for
    initialising the GGTT node without populating it. This
    prevents the test from ever knowing about struct xe_ggtt.
    
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch 3e019cc3eaffcb7022b9de66871eabdefd6e06ff drm-intel
5dff1543ba9a drm/xe: Use xe_ggtt_map_bo_unlocked for resume
fad0d8011609 drm/xe: Add xe_ggtt_might_lock
90f495e884fe drm/xe: Add xe_ggtt_alloc
-:33: WARNING:LINE_SPACING: Missing a blank line after declarations
#33: FILE: drivers/gpu/drm/xe/xe_ggtt.c:174:
+	struct xe_ggtt *ggtt = drmm_kzalloc(&tile_to_xe(tile)->drm, sizeof(*ggtt), GFP_KERNEL);
+	if (ggtt)

total: 0 errors, 1 warnings, 0 checks, 45 lines checked
464d65899cc1 drm/xe/display: Remove dereferences of ggtt for tile id
243983a9e8e7 drm/xe/ggtt: Seperate flags and address in PTE encoding
-:4: WARNING:TYPO_SPELLING: 'Seperate' may be misspelled - perhaps 'Separate'?
#4: 
Subject: [PATCH] drm/xe/ggtt: Seperate flags and address in PTE encoding
                              ^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 180 lines checked
2bde82bef70b drm/xe/display: Dont poke into GGTT internals to fill a DPT
-:55: WARNING:LINE_SPACING: Missing a blank line after declarations
#55: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:66:
+			u64 addr = xe_bo_addr(bo, src_idx * XE_PAGE_SIZE, XE_PAGE_SIZE);
+			iosys_map_wr(map, *dpt_ofs, u64, pte | addr);

total: 0 errors, 1 warnings, 0 checks, 79 lines checked
bd9b31a53a43 drm/xe/display: Convert GGTT mapping to use pte_encode_flags
5adee4366979 drm/xe: Remove pte_encode_bo callback
8a54f432b15b drm/xe: Implement a helper for reading out a GGTT PTE at a specified offset
26692f6d365f drm/xe: Do not rely on GGTT internals in xe_guc_buf kunit tests


