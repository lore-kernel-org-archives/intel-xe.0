Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B8AC3ABBE
	for <intel-xe@archiver.kernel.org>; Tue,  6 May 2025 21:48:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA72910E119;
	Tue,  6 May 2025 21:48:36 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD6810E119;
 Tue,  6 May 2025 21:48:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/ggtt=3A_Stop_relyi?=
 =?utf-8?q?ng_on_GGTT_internals=2E_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 May 2025 21:48:35 -0000
Message-ID: <174656811521.53100.7600410566300424232@c664b1dc75d1>
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
commit 7545878852524a94cc2c285888d0aa6218cd0bb1
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Mon May 5 14:19:23 2025 +0200

    drm/xe: Do not rely on GGTT internals in xe_guc_buf kunit tests
    
    Add a function to init ggtt for kunit, and use the GGTT function for
    initialising the GGTT node without populating it. This
    prevents the test from ever knowing about struct xe_ggtt.
    
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch 842c3c276c106040f9b96d72b9df35ed6aed9ae9 drm-intel
8da2a342b6b7 drm/xe: Use xe_ggtt_map_bo_unlocked for resume
cef6b6dd9913 drm/xe: Add xe_ggtt_might_lock
f5f96cacbe72 drm/xe: Add xe_ggtt_alloc
-:33: WARNING:LINE_SPACING: Missing a blank line after declarations
#33: FILE: drivers/gpu/drm/xe/xe_ggtt.c:174:
+	struct xe_ggtt *ggtt = drmm_kzalloc(&tile_to_xe(tile)->drm, sizeof(*ggtt), GFP_KERNEL);
+	if (ggtt)

total: 0 errors, 1 warnings, 0 checks, 45 lines checked
2a277f4e2b74 drm/xe/display: Remove dereferences of ggtt for tile id
c18793572cf9 drm/xe/ggtt: Seperate flags and address in PTE encoding
-:4: WARNING:TYPO_SPELLING: 'Seperate' may be misspelled - perhaps 'Separate'?
#4: 
Subject: [PATCH] drm/xe/ggtt: Seperate flags and address in PTE encoding
                              ^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 180 lines checked
0b6ea3193142 drm/xe/display: Dont poke into GGTT internals to fill a DPT
-:54: WARNING:LINE_SPACING: Missing a blank line after declarations
#54: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:66:
+			u64 addr = xe_bo_addr(bo, src_idx * XE_PAGE_SIZE, XE_PAGE_SIZE);
+			iosys_map_wr(map, *dpt_ofs, u64, pte | addr);

total: 0 errors, 1 warnings, 0 checks, 79 lines checked
e1e9d69011d7 drm/xe/display: Convert GGTT mapping to use pte_encode_flags
75697d8741ae drm/xe: Remove pte_encode_bo callback
e1f820befe01 drm/xe: Implement a helper for reading out a GGTT PTE at a specified offset
754587885252 drm/xe: Do not rely on GGTT internals in xe_guc_buf kunit tests


