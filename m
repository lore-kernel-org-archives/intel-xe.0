Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B61C54E66
	for <intel-xe@archiver.kernel.org>; Tue, 12 Mar 2024 10:09:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C200112D7B;
	Tue, 12 Mar 2024 10:09:56 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC7D112D78;
 Tue, 12 Mar 2024 10:09:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/display=3A_fix_pot?=
 =?utf-8?q?ential_overflow_when_multiplying_2_u32?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 12 Mar 2024 10:09:54 -0000
Message-ID: <171023819497.694325.15294818518758127550@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240312095441.3684038-1-arun.r.murthy@intel.com>
In-Reply-To: <20240312095441.3684038-1-arun.r.murthy@intel.com>
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

Series: drm/xe/display: fix potential overflow when multiplying 2 u32
URL   : https://patchwork.freedesktop.org/series/131013/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9bb2a8a17457065eb398a81e8fd9aec2b519fd6
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 01509f955224fa629873d9f222f07287c71630e5
Author: Arun R Murthy <arun.r.murthy@intel.com>
Date:   Tue Mar 12 15:24:41 2024 +0530

    drm/xe/display: fix potential overflow when multiplying 2 u32
    
    Multiplying XE_PAGE_SIZE with another u32 and the product stored in
    u64 can potentially lead to overflow. Change one of the value to u64 so
    as to perform 64 bit arithmetic operation as the product is u64.
    
    Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
+ /mt/dim checkpatch 61fa386186cb302cf26e29aef76d5b1a6ffe57ad drm-intel
01509f955224 drm/xe/display: fix potential overflow when multiplying 2 u32
-:31: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#31: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:65:
+				     pte_encode_bo(bo, src_idx * (u64)XE_PAGE_SIZE,
 				     xe->pat.idx[XE_CACHE_WB]));

total: 0 errors, 0 warnings, 1 checks, 38 lines checked


