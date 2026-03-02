Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6674CD58E42
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 01:17:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 253D010E356;
	Mon,  2 Mar 2026 01:17:48 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2129010E356;
 Mon,  2 Mar 2026 01:17:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_ice=3A_use_better_bitmap_?=
 =?utf-8?q?API?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Yury Norov" <ynorov@nvidia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Mar 2026 01:17:46 -0000
Message-ID: <177241426610.301331.489433350484023557@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260302011159.61778-1-ynorov@nvidia.com>
In-Reply-To: <20260302011159.61778-1-ynorov@nvidia.com>
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

Series: ice: use better bitmap API
URL   : https://patchwork.freedesktop.org/series/162389/
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
commit cbe5b275aeb701746bd7dc64be4b1b0b58f60e76
Author: Yury Norov <ynorov@nvidia.com>
Date:   Sun Mar 1 20:11:58 2026 -0500

    drm/xe: switch xe_pagefault_queue_init() to using bitmap_weighted_or()
    
    The function calls bitmap_or() immediately followed by bitmap_weight().
    Switch to using the dedicated bitmap_weighted_or() and save one bitmap
    traverse.
    
    Signed-off-by: Yury Norov <ynorov@nvidia.com>
+ /mt/dim checkpatch 1ad945dbcb06504e1d9796cac1588c31b4ee62e9 drm-intel
2520ef85b854 bitmap: introduce bitmap_weighted_xor()
-:28: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#28: FILE: include/linux/bitmap.h:173:
+unsigned int __bitmap_weighted_xor(unsigned long *dst, const unsigned long *bitmap1,
+				  const unsigned long *bitmap2, unsigned int nbits);

-:38: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#38: FILE: include/linux/bitmap.h:360:
+unsigned int bitmap_weighted_xor(unsigned long *dst, const unsigned long *src1,
+				const unsigned long *src2, unsigned int nbits)

-:60: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#60: FILE: lib/bitmap.c:365:
+unsigned int __bitmap_weighted_xor(unsigned long *dst, const unsigned long *bitmap1,
+				  const unsigned long *bitmap2, unsigned int bits)

total: 0 errors, 0 warnings, 3 checks, 46 lines checked
288c544e7dd9 ice: use bitmap_weighted_xor() in ice_find_free_recp_res_idx()
0cc07095c3b2 ice: use bitmap_empty() in ice_vf_has_no_qs_ena
cbe5b275aeb7 drm/xe: switch xe_pagefault_queue_init() to using bitmap_weighted_or()
-:23: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#23: FILE: drivers/gpu/drm/xe/xe_pagefault.c:298:
+		num_dss = bitmap_weighted_or(all_dss, gt->fuse_topo.g_dss_mask,
 			  gt->fuse_topo.c_dss_mask, XE_MAX_DSS_FUSE_BITS);

total: 0 errors, 0 warnings, 1 checks, 11 lines checked


