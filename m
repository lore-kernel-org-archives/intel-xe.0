Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7271E7717F
	for <intel-xe@archiver.kernel.org>; Tue, 10 Dec 2024 14:30:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D78010E8F1;
	Tue, 10 Dec 2024 14:30:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oAF2ZHa8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAAD410E8F3
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Dec 2024 14:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733841019; x=1765377019;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LakIltT9bfxgCJvOvcadSKeNOv5YcZBOjMPtC0dIuGk=;
 b=oAF2ZHa81bGhs1JMzs+VOEAz6cM1ywp4FEs+Rubbz5YQI9PjjQwM3egj
 h+N6XA+Yy86nl/RI9i3tOLQnScuyE0JHFe/63zMIfYp4YdwcXCoy4547P
 lKN1TMnuxTKp9hZyIjZDfzm4A9JU+01sSsTgQz5Y9N9JJ0qPl6RM8P65i
 qCLhjGDZJiF5RWl0Rru8s0sTamU/V8zQuq4T9TPGmSZR+bf9kpWeOqBXK
 qx/VHVxUgFTrvajsR3Sv4oKVcYhqPWwAnhOdWELalrLE4NVc4als8B9Pe
 n60iXRYPHefDu/AWayei/obXAYHjOSnDY8xziYBwHeVKVknydUNJEuq77 g==;
X-CSE-ConnectionGUID: 4jJEyOSqQMS58qYy5iCeYg==
X-CSE-MsgGUID: i176B4EmQwyyFeOgpo3AAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34238963"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="34238963"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 06:30:19 -0800
X-CSE-ConnectionGUID: fs99sHDCRRG30PFvYZPAFg==
X-CSE-MsgGUID: ckNZc2Q1Qg2lx3RhB0C1aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="100236422"
Received: from inaky-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.109.171])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 06:30:19 -0800
Date: Tue, 10 Dec 2024 06:30:14 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org, Ilia Levi <ilia.levi@intel.com>
Subject: Re: [PATCH 06/11] drm/xe: Defer memirq init until needed
Message-ID: <5kgerssh6hqzxwbuh3ixwfvko4hlfv56qs2wjt754oy2zcnmsu@vfou4q5iq6dg>
References: <20241210083111.230484-1-dev@lankhorst.se>
 <20241210083111.230484-7-dev@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20241210083111.230484-7-dev@lankhorst.se>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Dec 10, 2024 at 09:31:06AM +0100, Maarten Lankhorst wrote:
>memirqs require allocations into GGTT, which we cannot use until
>after display is enabled.
>
>Now that the initialisation of interrupts is postponed, move memirq
>init too.
>
>Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

Cc: Ilia Levi <ilia.levi@intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

assuming the first patches are applied first.

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_device.c | 4 ----
> drivers/gpu/drm/xe/xe_tile.c   | 7 +++++++
> 2 files changed, 7 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index c9c0b74c74ddb..4c46809472ae4 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -41,7 +41,6 @@
> #include "xe_hw_engine_group.h"
> #include "xe_hwmon.h"
> #include "xe_irq.h"
>-#include "xe_memirq.h"
> #include "xe_mmio.h"
> #include "xe_module.h"
> #include "xe_oa.h"
>@@ -675,9 +674,6 @@ int xe_device_probe(struct xe_device *xe)
> 		err = xe_ggtt_init_early(tile->mem.ggtt);
> 		if (err)
> 			return err;
>-		err = xe_memirq_init(&tile->memirq);
>-		if (err)
>-			return err;
> 	}
>
> 	for_each_gt(gt, xe, id) {
>diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
>index 2825553b568f7..d07c1fba793ca 100644
>--- a/drivers/gpu/drm/xe/xe_tile.c
>+++ b/drivers/gpu/drm/xe/xe_tile.c
>@@ -10,6 +10,7 @@
> #include "xe_device.h"
> #include "xe_ggtt.h"
> #include "xe_gt.h"
>+#include "xe_memirq.h"
> #include "xe_migrate.h"
> #include "xe_pcode.h"
> #include "xe_sa.h"
>@@ -179,6 +180,12 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
>
> int xe_tile_init(struct xe_tile *tile)
> {
>+	int err;
>+
>+	err = xe_memirq_init(&tile->memirq);
>+	if (err)
>+		return err;
>+
> 	tile->mem.kernel_bb_pool = xe_sa_bo_manager_init(tile, SZ_1M, 16);
> 	if (IS_ERR(tile->mem.kernel_bb_pool))
> 		return PTR_ERR(tile->mem.kernel_bb_pool);
>-- 
>2.45.2
>
