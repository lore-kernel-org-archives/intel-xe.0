Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 917BBC6FD20
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 06:42:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4633510E138;
	Fri, 24 Mar 2023 06:42:40 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA66710E138
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 06:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679640158; x=1711176158;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zy902arrP7v5ftb8zrdT6RwSN1Ve8ezQKr+nNp3Bhlc=;
 b=luGsWB6bdOPxGLZdZJHV12SBCbeCEPitaMGhMjivFOEENA4CrkhtPHdv
 Dve6aIwKHPqA7V6iXKa+KazzvrnHZccn4BDqdfqRGI8enhUgS3Fl/B1tW
 lzYFdSjTZOl3Jod3QZy5xqCvlM5SHblL9VudWORhDLgzN4IM3eesRNaLI
 qvxJUsPeqNKu2B+CwGI/o7dXQc7yGLttAUGu9elGBSc4L8tYG6jesWiXk
 t9xZqLkS9guy2Vaw8lCHtLY7hzBaw2/VRza41xTEty25BNswe1bxl0Z7I
 hvPOCoLVgEGqPbKMxQ5VulhgEyAXK0JwHpGdM0PtHYJa5hohiqWRMssda g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="342095902"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; d="scan'208";a="342095902"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 23:42:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="659944613"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; d="scan'208";a="659944613"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga006.jf.intel.com with ESMTP; 23 Mar 2023 23:42:36 -0700
Received: from maurocar-mobl2 (hvanhaar-mobl.ger.corp.intel.com [10.252.27.89])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id B0A05580BF1;
 Thu, 23 Mar 2023 23:42:35 -0700 (PDT)
Date: Fri, 24 Mar 2023 07:42:33 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <20230324074233.292b4f1d@maurocar-mobl2>
In-Reply-To: <20230324012329.1195977-1-matthew.brost@intel.com>
References: <20230324012329.1195977-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Use fast virtual copy engine for
 migrate engine on PVC
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
Cc: intel-xe@lists.freedesktop.org, Bruce Chang <yu.bruce.chang@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 23 Mar 2023 18:23:29 -0700
Matthew Brost <matthew.brost@intel.com> wrote:

> Some copy hardware engine instances are faster than others on PVC, use a
> virtual engine of these plus the reserved instance for the migrate
> engine on PVC. The idea being if a fast instance is available it will be
> used and the throughput of kernel copies, clears, and pagefault
> servicing will be higher.
> 
> v2: Include local change of correct mask for fast instances
> 
> Cc: Bruce Chang <yu.bruce.chang@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_engine.h    |  2 ++
>  drivers/gpu/drm/xe/xe_hw_engine.c | 20 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_migrate.c   |  7 ++++---
>  3 files changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_engine.h b/drivers/gpu/drm/xe/xe_engine.h
> index 1cf7f23c4afd..0a9c35ea3d34 100644
> --- a/drivers/gpu/drm/xe/xe_engine.h
> +++ b/drivers/gpu/drm/xe/xe_engine.h
> @@ -26,6 +26,8 @@ void xe_engine_destroy(struct kref *ref);
>  
>  struct xe_engine *xe_engine_lookup(struct xe_file *xef, u32 id);
>  
> +u32 xe_hw_engine_fast_copy_logical_mask(struct xe_gt *gt);
> +
>  static inline struct xe_engine *xe_engine_get(struct xe_engine *engine)
>  {
>  	kref_get(&engine->refcount);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 63a4efd5edcc..d2b43b189b14 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -600,3 +600,23 @@ bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe)
>  	return xe->info.supports_usm && hwe->class == XE_ENGINE_CLASS_COPY &&
>  		hwe->instance == gt->usm.reserved_bcs_instance;
>  }
> +
> +u32 xe_hw_engine_fast_copy_logical_mask(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_hw_engine *hwe;
> +	const u32 fast_physical_mask = 0xab;	/* 0, 1, 3, 5, 7 */

Since this is PVC-only, I would use, instead:

	const u32 pvc_fast_physical_mask = BIT(0) | BIT(1) | BIT(3) | BIT(5) | BIT(7);

as:
 - it would avoid the comment;
 - it will document that other GPU models may need different physical masks.


> +	u32 fast_logical_mask = 0;
> +	enum xe_hw_engine_id id;
> +
> +	/* XXX: We only support this function on PVC for now */
> +	XE_BUG_ON(!(xe->info.platform == XE_PVC));

Why bug on? Since this future is PVC only (for now), other platforms
may not need. So, I would do, instead (as before):

	if (!(xe->info.platform == XE_PVC))
		return (hwe->logical_instance);

perhaps calling a drm_dbg() to report it, just in case newer platforms
might require it as well.

> +
> +	for_each_hw_engine(hwe, gt, id) {
> +		if ((fast_physical_mask | gt->usm.reserved_bcs_instance) &
> +		    BIT(hwe->instance))
> +			fast_logical_mask |= hwe->logical_instance;
> +	}
> +
> +	return fast_logical_mask;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 11c8af9c6c92..4a7fec5d619d 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -345,11 +345,12 @@ struct xe_migrate *xe_migrate_init(struct xe_gt *gt)
>  							   XE_ENGINE_CLASS_COPY,
>  							   gt->usm.reserved_bcs_instance,
>  							   false);
> -		if (!hwe)
> +		u32 logical_mask = xe_hw_engine_fast_copy_logical_mask(gt);
> +
> +		if (!hwe || !logical_mask)
>  			return ERR_PTR(-EINVAL);
>  
> -		m->eng = xe_engine_create(xe, vm,
> -					  BIT(hwe->logical_instance), 1,
> +		m->eng = xe_engine_create(xe, vm, logical_mask, 1,
>  					  hwe, ENGINE_FLAG_KERNEL);
>  	} else {
>  		m->eng = xe_engine_create_class(xe, gt, vm,
