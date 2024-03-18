Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED651C54E5D
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 18:21:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B40FF10F827;
	Mon, 18 Mar 2024 18:21:55 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F79710F829;
 Mon, 18 Mar 2024 18:21:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/display=3A_fix_pot?=
 =?utf-8?q?ential_overflow_when_multiplying_2_u32_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 18 Mar 2024 18:21:54 -0000
Message-ID: <171078611432.886689.14263835521523308862@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240318110103.3872169-1-arun.r.murthy@intel.com>
In-Reply-To: <20240318110103.3872169-1-arun.r.murthy@intel.com>
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

Series: drm/xe/display: fix potential overflow when multiplying 2 u32 (rev2)
URL   : https://patchwork.freedesktop.org/series/131013/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9eb1ac8298ef9f9146567c29fa762d8e9efa1ef
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6b7961ce316c3cfd6940d6cabb644ed51e2d77cd
Author: Arun R Murthy <arun.r.murthy@intel.com>
Date:   Mon Mar 18 16:31:03 2024 +0530

    drm/xe/display: fix potential overflow when multiplying 2 u32
    
    Multiplying XE_PAGE_SIZE with another u32 and the product stored in
    u64 can potentially lead to overflow, use mul_u32_u32 instead.
    
    Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
+ /mt/dim checkpatch ce8cc731d53f9197a853b0d00386d7835f2b80e6 drm-intel
6b7961ce316c drm/xe/display: fix potential overflow when multiplying 2 u32
-:20: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#20: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:32:
+			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, mul_u32_u32(src_idx, XE_PAGE_SIZE),

-:30: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#30: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:65:
+				     pte_encode_bo(bo, mul_u32_u32(src_idx, XE_PAGE_SIZE),
 				     xe->pat.idx[XE_CACHE_WB]));

-:47: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#47: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:167:
+			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, mul_u32_u32(src_idx, XE_PAGE_SIZE),

total: 0 errors, 2 warnings, 1 checks, 38 lines checked


