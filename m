Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC605C369AB
	for <intel-xe@archiver.kernel.org>; Thu, 24 Apr 2025 16:41:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A6A10E45F;
	Thu, 24 Apr 2025 16:41:49 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8087A10E45F;
 Thu, 24 Apr 2025 16:41:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/1=5D_drm/xe/svm=3A_PREFETCH_svm_patches_squash_for_CI?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Apr 2025 16:41:48 -0000
Message-ID: <174551290853.7395.14383027616886839146@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250424104817.3791574-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250424104817.3791574-1-himal.prasad.ghimiray@intel.com>
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

Series: series starting with [1/1] drm/xe/svm: PREFETCH svm patches squash for CI
URL   : https://patchwork.freedesktop.org/series/148201/
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
commit e1443ac00a91114850d5d1e11a8d008ba00b0aca
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Thu Apr 24 16:18:17 2025 +0530

    drm/xe/svm: PREFETCH svm patches squash for CI
    
    DO NOT REVIEW
    
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch 6176f71822602f52bc4327965090275c5570ed0d drm-intel
e1443ac00a91 drm/xe/svm: PREFETCH svm patches squash for CI
-:390: CHECK:LOGICAL_CONTINUATIONS: Logical continuations should be on the previous line
#390: FILE: drivers/gpu/drm/xe/xe_svm.c:648:
+	return (range->tile_present & ~range->tile_invalidated & tile_mask) == tile_mask
+		&& (!devmem_only || range->base.flags.has_devmem_pages);

-:1012: ERROR:SPACING: space required before the open brace '{'
#1012: FILE: drivers/gpu/drm/xe/xe_vm.c:2397:
+			if (xe_svm_range_is_valid(svm_range, tile_mask, !!prefetch_region)){

total: 1 errors, 0 warnings, 1 checks, 1215 lines checked


