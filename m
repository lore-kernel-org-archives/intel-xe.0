Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA9BC19776
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 10:22:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 415EC10EC59;
	Fri, 28 Feb 2025 10:22:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K1++hAeu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF6410EC59
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Feb 2025 10:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740738124; x=1772274124;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=fiv0SWRJjHLoKWktP6IJc/syIkOS251ieNL5M/7fcMQ=;
 b=K1++hAeuE25blB5+nEiBUe+SBzdYam5kh17WRMj2X/znQuLYzG48AWPz
 fdhfsOOeaX+M8FgR1XlNOWW/F/RxUT7kijDFVVa6s9R790E2PRWENKajm
 qHdvCuO6UqXQjYrnROB4D7GuHa2JdvS6zc2xnXlCIYnow7GkPtc+g0Vwa
 svE3fwHo5aEFv64luqdgTm5oMQP0E/yx9XbznXk6Ig7Ke2bGcYv/YhXi8
 0xKsOuQm39vSDb57VTmzJrHISikfW1Qup2tk8fD+1sMUUwS8B+At0JYhF
 TSophZTEsrze569THTetnz42G0FzprBRsol/Et5Mri4V6Y1gVC6OnfFEb A==;
X-CSE-ConnectionGUID: WfedJ9B4S1avRBuCe2GA2w==
X-CSE-MsgGUID: cbB5F9EcQAqBiYUA5xySiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="53074040"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="53074040"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 02:22:03 -0800
X-CSE-ConnectionGUID: AGz7OI1cRJCBYLcF91W5BQ==
X-CSE-MsgGUID: WgEC1DZcRvGUYf4X1Bn77Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="140532483"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.244.73])
 ([10.245.244.73])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 02:22:03 -0800
Message-ID: <1b66c78c-82d4-4002-9fa4-6f30e97e0268@intel.com>
Date: Fri, 28 Feb 2025 10:21:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe_migrate: Switch from drm to dev managed actions
To: Aradhya Bhatia <aradhya.bhatia@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Cc: Intel XE List <intel-xe@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
References: <20250228065224.320811-1-aradhya.bhatia@intel.com>
 <20250228065224.320811-2-aradhya.bhatia@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250228065224.320811-2-aradhya.bhatia@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 28/02/2025 06:52, Aradhya Bhatia wrote:
> Change the scope of the migrate subsystem to be dev managed instead of
> drm managed.
> 
> The parent pci struct &device, that the xe struct &drm_device is a part
> of, gets removed when a hot unplug is triggered, which causes the
> underlying iommu group to get destroyed as well.

Nice find. But if that's the case then the migrate BO here is just one 
of many where we will see this. Basically all system memory BO can 
suffer from this AFAICT, including userspace owned. So I think we need 
to rather solve this for all, and I don't think we can really tie the 
lifetime of all BOs to devm, so likely need a different approach.

I think we might instead need to teardown all dma mappings when removing 
the device, leaving the BO intact. It looks like there is already a 
helper for this, so maybe something roughly like this:

@@ -980,6 +980,8 @@ void xe_device_remove(struct xe_device *xe)

         drm_dev_unplug(&xe->drm);

+       ttm_device_clear_dma_mappings(&xe->ttm);
+
         xe_display_driver_remove(xe);

         xe_heci_gsc_fini(xe);

But I don't think userptr will be covered by that, just all BOs, so 
likely need an extra step to also nuke all usersptr dma mappings somewhere.

> 
> The migrate subsystem, which handles the lifetime of the page-table tree
> (pt) BO, doesn't get a chance to keep the BO back during the hot unplug,
> as all the references to DRM haven't been put back.
> When all the references to DRM are indeed put back later, the migrate
> subsystem tries to put back the pt BO. Since the underlying iommu group
> has been already destroyed, a kernel NULL ptr dereference takes place
> while attempting to keep back the pt BO.
> 
> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_migrate.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 278bc96cf593..4e23adfa208a 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -97,7 +97,7 @@ struct xe_exec_queue *xe_tile_migrate_exec_queue(struct xe_tile *tile)
>   	return tile->migrate->q;
>   }
>   
> -static void xe_migrate_fini(struct drm_device *dev, void *arg)
> +static void xe_migrate_fini(void *arg)
>   {
>   	struct xe_migrate *m = arg;
>   
> @@ -401,7 +401,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>   	struct xe_vm *vm;
>   	int err;
>   
> -	m = drmm_kzalloc(&xe->drm, sizeof(*m), GFP_KERNEL);
> +	m = devm_kzalloc(xe->drm.dev, sizeof(*m), GFP_KERNEL);
>   	if (!m)
>   		return ERR_PTR(-ENOMEM);
>   
> @@ -455,7 +455,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>   	might_lock(&m->job_mutex);
>   	fs_reclaim_release(GFP_KERNEL);
>   
> -	err = drmm_add_action_or_reset(&xe->drm, xe_migrate_fini, m);
> +	err = devm_add_action_or_reset(xe->drm.dev, xe_migrate_fini, m);
>   	if (err)
>   		return ERR_PTR(err);
>   

