Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2EF8C36010
	for <intel-xe@archiver.kernel.org>; Fri,  4 Apr 2025 21:04:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 955D310E347;
	Fri,  4 Apr 2025 21:04:58 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB3B710E33E;
 Fri,  4 Apr 2025 21:04:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Cleanup_GGTT_us?=
 =?utf-8?q?age_outside_of_xe=5Fggtt=2Ec?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 04 Apr 2025 21:04:57 -0000
Message-ID: <174380069795.39706.6546774569575571719@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250404205028.620300-1-dev@lankhorst.se>
In-Reply-To: <20250404205028.620300-1-dev@lankhorst.se>
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

Series: drm/xe: Cleanup GGTT usage outside of xe_ggtt.c
URL   : https://patchwork.freedesktop.org/series/147281/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7f1ba551a1a2ab36786d6e6b680679ca9df7a78e
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Fri Apr 4 22:50:28 2025 +0200

    drm/xe: Implement a helper for reading out a GGTT PTE at a specified offset
    
    Split the GGTT PTE readout to a separate function, this is useful for
    adding testcases in the next commit, and also cleaner than manually
    reading out GGTT.
    
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch ebade66890117778809714085d5151b0050488a8 drm-intel
2b6856af3833 drm/xe: Use xe_ggtt_map_bo_unlocked for resume
ea06c84bf754 drm/xe: Add xe_ggtt_might_lock
4832cb913804 drm/xe: Add xe_ggtt_alloc
-:32: WARNING:LINE_SPACING: Missing a blank line after declarations
#32: FILE: drivers/gpu/drm/xe/xe_ggtt.c:174:
+	struct xe_ggtt *ggtt = drmm_kzalloc(&tile_to_xe(tile)->drm, sizeof(*ggtt), GFP_KERNEL);
+	if (ggtt)

total: 0 errors, 1 warnings, 0 checks, 45 lines checked
b189ab8e4f20 drm/xe/display: Remove dereferences of ggtt for tile id
88e3a657f7b6 drm/xe/ggtt: Seperate flags and address in PTE encoding
-:4: WARNING:TYPO_SPELLING: 'Seperate' may be misspelled - perhaps 'Separate'?
#4: 
Subject: [PATCH] drm/xe/ggtt: Seperate flags and address in PTE encoding
                              ^^^^^^^^

-:160: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#160: FILE: drivers/gpu/drm/xe/xe_ggtt.c:662:
+		     xe_res_next(&cur, XE_PAGE_SIZE)) {
+

total: 0 errors, 1 warnings, 1 checks, 187 lines checked
7a230e6038b7 drm/xe/display: Dont poke into GGTT internals to fill a DPT
-:54: WARNING:LINE_SPACING: Missing a blank line after declarations
#54: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:66:
+			u64 addr = xe_bo_addr(bo, src_idx * XE_PAGE_SIZE, XE_PAGE_SIZE);
+			iosys_map_wr(map, *dpt_ofs, u64, pte | addr);

total: 0 errors, 1 warnings, 0 checks, 79 lines checked
799603496c45 drm/xe/display: Convert GGTT mapping to use pte_encode_flags
13efa9ee4ec1 drm/xe: Remove pte_encode_bo callback
7f1ba551a1a2 drm/xe: Implement a helper for reading out a GGTT PTE at a specified offset


