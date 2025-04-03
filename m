Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80937C3601A
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 15:46:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4472810E257;
	Thu,  3 Apr 2025 15:46:10 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20DD510E24F;
 Thu,  3 Apr 2025 15:46:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Preparations_fo?=
 =?utf-8?q?r_making_struct_xe=5Fggtt_private=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 03 Apr 2025 15:46:09 -0000
Message-ID: <174369516912.33532.13436560303687458159@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250403124520.470916-1-dev@lankhorst.se>
In-Reply-To: <20250403124520.470916-1-dev@lankhorst.se>
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

Series: drm/xe: Preparations for making struct xe_ggtt private.
URL   : https://patchwork.freedesktop.org/series/147214/
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
commit da6d5ac4276e7770fe14722273e33b50df68545f
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Thu Apr 3 14:45:20 2025 +0200

    drm/xe: Implement a helper for reading out a GGTT PTE at a specified offset
    
    Split the GGTT PTE readout to a separate function, this is useful for
    adding testcases in the next commit, and also cleaner than manually
    reading out GGTT.
    
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch cd154f63df817bc5b06c5f16a025189cd00bcc02 drm-intel
d29d45731375 drm/xe: Use xe_ggtt_map_bo_unlocked for resume
6143560da4f0 drm/xe: Add xe_ggtt_might_lock
99faad6ca5bb drm/xe: Add xe_ggtt_alloc
-:32: WARNING:LINE_SPACING: Missing a blank line after declarations
#32: FILE: drivers/gpu/drm/xe/xe_ggtt.c:174:
+	struct xe_ggtt *ggtt = drmm_kzalloc(&tile_to_xe(tile)->drm, sizeof(*ggtt), GFP_KERNEL);
+	if (ggtt)

total: 0 errors, 1 warnings, 0 checks, 45 lines checked
2ff2f0272475 drm/xe/display: Remove dereferences of ggtt for tile id
8ecc43bdac55 drm/xe/ggtt: Seperate flags and address in PTE encoding
-:4: WARNING:TYPO_SPELLING: 'Seperate' may be misspelled - perhaps 'Separate'?
#4: 
Subject: [PATCH] drm/xe/ggtt: Seperate flags and address in PTE encoding
                              ^^^^^^^^

-:54: WARNING:LINE_SPACING: Missing a blank line after declarations
#54: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:66:
+			u64 addr = xe_bo_addr(bo, src_idx * XE_PAGE_SIZE, XE_PAGE_SIZE);
+			iosys_map_wr(map, *dpt_ofs, u64, pte | addr);

-:250: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#250: FILE: drivers/gpu/drm/xe/xe_ggtt.c:648:
+		     xe_res_next(&cur, XE_PAGE_SIZE)) {
+

total: 0 errors, 2 warnings, 1 checks, 266 lines checked
da6d5ac4276e drm/xe: Implement a helper for reading out a GGTT PTE at a specified offset


