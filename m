Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D70F9FC5915
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 12:13:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9284D10E911;
	Thu, 26 Feb 2026 12:13:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KqTQj6lW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED7210E911
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 12:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772108033; x=1803644033;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=PqrcW3ORFupUHMi5n5VuFCKI+UFTZFbOHqsbTt/Gm44=;
 b=KqTQj6lWXGjscJQadT5JaP1gpNhSc9Rws1oMgL1Q7rttNMwkbAPR35MD
 uQ0SKowh5daP/+PRP5PGRnTKB1SW8s7McNNfckDVn5HbrLRxb5J0MqOQ4
 9Cbr1MZKsEt6VfLt1cHMs4MMKSXA/awFfX9MEYlA9CDPqb8x+TPwfYtRy
 DDbiPbt32tsakivf5AtTmq+oOLoK3kwcJfeBaiYx+mcQ4jQJMkOza1hSr
 AV3q3Jd55t0D0AzM/Dbk4lGpYvJ6ZJzHYpiHIysHqoDNs/VDtyo5zWrJ7
 2siqw6EbpwLJbwj+uNSnEspJiZdTlpDogHys82STtmT1csTgLUZrelado w==;
X-CSE-ConnectionGUID: MqtjD5MORHGTNTgo602gNQ==
X-CSE-MsgGUID: mchjKD9LR6KWFnihtQmizg==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="90575276"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="90575276"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 04:13:53 -0800
X-CSE-ConnectionGUID: 1RSbZqJcTOeragUDmAGdgw==
X-CSE-MsgGUID: Gy6RKTCCSrOuHiTFF4Yiqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="254311155"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 04:13:50 -0800
Date: Thu, 26 Feb 2026 13:13:47 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com
Subject: Re: [PATCH v1 5/6] drm/xe/bo_evict: Introduce xe_bo_restore_map()
Message-ID: <aaA4-xRVWO9M24r2@black.igk.intel.com>
References: <20260224102618.3105171-1-raag.jadav@intel.com>
 <20260224102618.3105171-6-raag.jadav@intel.com>
 <aZ4iGmnnvHK2fZ9M@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aZ4iGmnnvHK2fZ9M@lstrano-desk.jf.intel.com>
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

On Tue, Feb 24, 2026 at 02:11:38PM -0800, Matthew Brost wrote:
> On Tue, Feb 24, 2026 at 03:55:18PM +0530, Raag Jadav wrote:
> > In preparation of usecases which require remapping kernel bos after FLR,
> > introduce xe_bo_restore_map() helper.
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_bo_evict.c | 34 ++++++++++++++++++++++++--------
> >  drivers/gpu/drm/xe/xe_bo_evict.h |  2 ++
> >  2 files changed, 28 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
> > index 7661fca7f278..0624c3039cd7 100644
> > --- a/drivers/gpu/drm/xe/xe_bo_evict.c
> > +++ b/drivers/gpu/drm/xe/xe_bo_evict.c
> > @@ -189,14 +189,8 @@ int xe_bo_evict_all(struct xe_device *xe)
> >  				     xe_bo_evict_pinned);
> >  }
> >  
> > -static int xe_bo_restore_and_map_ggtt(struct xe_bo *bo)
> > +static int xe_bo_map_ggtt(struct xe_bo *bo)
> >  {
> > -	int ret;
> > -
> > -	ret = xe_bo_restore_pinned(bo);
> > -	if (ret)
> > -		return ret;
> > -
> >  	if (bo->flags & XE_BO_FLAG_GGTT) {
> >  		struct xe_tile *tile;
> >  		u8 id;
> > @@ -212,6 +206,30 @@ static int xe_bo_restore_and_map_ggtt(struct xe_bo *bo)
> >  	return 0;
> >  }
> >  
> > +int xe_bo_restore_map(struct xe_device *xe)
> 
> Kernel doc. Maybe also explain why this function is needed during PCIe
> FLR in both the commit message and the kernel doc. I assume it’s
> something along the lines of: “During PCIe FLR we repopulate the GGTTs
> for any kernel BOs required for driver restart that lost GGTTs across FLR."
> 
> Just guessing on above but if we had kernel doc I wouldn't have to.
> 
> > +{
> > +	int ret;
> > +
> > +	ret = xe_bo_apply_to_pinned(xe, &xe->pinned.early.kernel_bo_present,
> > +				    &xe->pinned.early.kernel_bo_present, xe_bo_map_ggtt);
> > +	if (!ret)
> > +		ret = xe_bo_apply_to_pinned(xe, &xe->pinned.late.kernel_bo_present,
> > +					    &xe->pinned.late.kernel_bo_present, xe_bo_map_ggtt);
> > +
> > +	return ret;
> > +}
> > +
> > +static int xe_bo_restore_and_map_ggtt(struct xe_bo *bo)
> > +{
> > +	int ret;
> > +
> > +	ret = xe_bo_restore_pinned(bo);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return xe_bo_map_ggtt(bo);
> > +}
> > +
> >  /**
> >   * xe_bo_restore_early - restore early phase kernel BOs to VRAM
> >   *
> > @@ -270,7 +288,7 @@ int xe_bo_restore_late(struct xe_device *xe)
> >  	return ret;
> >  }
> >  
> > -static void xe_bo_pci_dev_remove_pinned(struct xe_device *xe)
> > +void xe_bo_pci_dev_remove_pinned(struct xe_device *xe)
> 
> Same as above for kernel doc, commit message, reasoning.

Will do.

> Patch looks sane enough though.

Thanks.

Raag

> >  {
> >  	struct xe_tile *tile;
> >  	unsigned int id;
> > diff --git a/drivers/gpu/drm/xe/xe_bo_evict.h b/drivers/gpu/drm/xe/xe_bo_evict.h
> > index e8385cb7f5e9..d4f5b87243e7 100644
> > --- a/drivers/gpu/drm/xe/xe_bo_evict.h
> > +++ b/drivers/gpu/drm/xe/xe_bo_evict.h
> > @@ -14,7 +14,9 @@ int xe_bo_notifier_prepare_all_pinned(struct xe_device *xe);
> >  void xe_bo_notifier_unprepare_all_pinned(struct xe_device *xe);
> >  int xe_bo_restore_early(struct xe_device *xe);
> >  int xe_bo_restore_late(struct xe_device *xe);
> > +int xe_bo_restore_map(struct xe_device *xe);
> >  
> > +void xe_bo_pci_dev_remove_pinned(struct xe_device *xe);
> >  void xe_bo_pci_dev_remove_all(struct xe_device *xe);
> >  
> >  int xe_bo_pinned_init(struct xe_device *xe);
> > -- 
> > 2.43.0
> > 
