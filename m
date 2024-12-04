Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE93E77170
	for <intel-xe@archiver.kernel.org>; Wed,  4 Dec 2024 19:32:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E5C810E1B9;
	Wed,  4 Dec 2024 19:32:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IOOMNpVH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1247C10E1B9
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Dec 2024 19:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733340753; x=1764876753;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Czu9o0S4rwl8SEfiJsmh0Fk3T432v0TN97mz+4BzZh4=;
 b=IOOMNpVHmz/Gq1OkFLtnOiCg4nkylw2iUfR/tp390xOUAphSmHzQ49EB
 QKMc/mj+SfY+7BSE8NUAGkU9ZiA0m0df3tjakxqsvj3J7h0Bk+FRHrD1c
 5VHV6ltYVlXy3lobTw3OjX3rRX3R/cKHCF2R4Tl8RUcKODD/T6O9IPR3O
 LPSbv44D5LDl7r8DApKL5IJAF9Mi8r2/pO9KAmhZzB5PLtfoq94K8liRk
 itIAuSNaOJjgWL30WtelKjzqYHCrv4xFoBSpNYmX0SvqSi8w1MHiW4Emf
 vyF9Ix2xuRGl9WUu4Qe+mC8XY/sR4wuobE9t38kyK6VAl1suYscV+UT2T w==;
X-CSE-ConnectionGUID: 7jsqbypfTySwxycJ/U8Bew==
X-CSE-MsgGUID: Qc40OBqMT524Or4oWzwxrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="51163625"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; d="scan'208";a="51163625"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 11:32:33 -0800
X-CSE-ConnectionGUID: vdNfw2TvSRqHmGFnGSk6IA==
X-CSE-MsgGUID: 5x7ErvTDT6uSZ/AJyXOteQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; d="scan'208";a="98675660"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.108.58])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 11:32:32 -0800
Date: Wed, 4 Dec 2024 13:32:24 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ilia Levi <ilia.levi@intel.com>
Cc: intel-xe@lists.freedesktop.org, piotr.piorkowski@intel.com, 
 michal.wajdeczko@intel.com, koby.elbaz@intel.com, yaron.avizrat@intel.com
Subject: Re: [PATCH] drm/xe: Use managed BO in memirq
Message-ID: <wfxrzo3ykhim6lz74ppzgojajgxhieyel54e3q22k3o56cw6kv@xpudxueattu2>
References: <20241204111655.1293-1-ilia.levi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20241204111655.1293-1-ilia.levi@intel.com>
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

On Wed, Dec 04, 2024 at 01:16:55PM +0200, Ilia Levi wrote:
>When probe has an error, the current scheme causes a page fault during
>resource unwinding. This happens because GTTMMADR_BAR gets unmapped
>before the allocated BO is released via drmm. Switching to a managed BO
>that is released via devm solves this ordering issue.
>
>Signed-off-by: Ilia Levi <ilia.levi@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_memirq.c | 23 +++++++----------------
> 1 file changed, 7 insertions(+), 16 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
>index 51dc90906003..404fa2a456d5 100644
>--- a/drivers/gpu/drm/xe/xe_memirq.c
>+++ b/drivers/gpu/drm/xe/xe_memirq.c
>@@ -155,13 +155,6 @@ static const char *guc_name(struct xe_guc *guc)
>  *
>  */
>
>-static void __release_xe_bo(struct drm_device *drm, void *arg)
>-{
>-	struct xe_bo *bo = arg;
>-
>-	xe_bo_unpin_map_no_vm(bo);
>-}
>-
> static inline bool hw_reports_to_instance_zero(struct xe_memirq *memirq)
> {
> 	/*
>@@ -184,14 +177,12 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
> 	BUILD_BUG_ON(!IS_ALIGNED(XE_MEMIRQ_SOURCE_OFFSET(0), SZ_64));
> 	BUILD_BUG_ON(!IS_ALIGNED(XE_MEMIRQ_STATUS_OFFSET(0), SZ_4K));
>
>-	/* XXX: convert to managed bo */
>-	bo = xe_bo_create_pin_map(xe, tile, NULL, bo_size,
>-				  ttm_bo_type_kernel,
>-				  XE_BO_FLAG_SYSTEM |
>-				  XE_BO_FLAG_GGTT |
>-				  XE_BO_FLAG_GGTT_INVALIDATE |
>-				  XE_BO_FLAG_NEEDS_UC |
>-				  XE_BO_FLAG_NEEDS_CPU_ACCESS);
>+	bo = xe_managed_bo_create_pin_map(xe, tile, bo_size,
>+					  XE_BO_FLAG_SYSTEM |
>+					  XE_BO_FLAG_GGTT |
>+					  XE_BO_FLAG_GGTT_INVALIDATE |
>+					  XE_BO_FLAG_NEEDS_UC |
>+					  XE_BO_FLAG_NEEDS_CPU_ACCESS);
> 	if (IS_ERR(bo)) {
> 		err = PTR_ERR(bo);
> 		goto out;
>@@ -215,7 +206,7 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
> 		     xe_bo_ggtt_addr(bo), bo_size, XE_MEMIRQ_SOURCE_OFFSET(0),
> 		     XE_MEMIRQ_STATUS_OFFSET(0));
>
>-	return drmm_add_action_or_reset(&xe->drm, __release_xe_bo, memirq->bo);
>+	return 0;
>
> out:
> 	memirq_err(memirq, "Failed to allocate memirq page (%pe)\n", ERR_PTR(err));
>-- 
>2.43.2
>
