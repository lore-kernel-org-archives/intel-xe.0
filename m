Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD979D68BE3
	for <intel-xe@archiver.kernel.org>; Sat, 16 Nov 2024 05:16:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D99010E11C;
	Sat, 16 Nov 2024 05:16:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M9msX6eV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B0510E11C
 for <intel-xe@lists.freedesktop.org>; Sat, 16 Nov 2024 05:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731734184; x=1763270184;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=m7CgkBNMgvasTHs9y+UCBuGMWlQtT/zTpLpM6UP+Orc=;
 b=M9msX6eVhimHI8610Ce4v9nBWXivyAUYrC9FzdIu/aWxuoqG6hkn0F6v
 KqeFut/geDs1DxBNu31wS3wHs0KeMqdk+ReY3gw9kG4/lWzsT5JXRMnJm
 QujNT7Wo1EZ+EPcAQIEraOmY0BvafGb1oFZALV3h9K6IPXT2c3uDm457W
 q6JayIG7Rp5a4FgCbYpkuxbtH3UE4rHejTmYgNXK+vtBivUVMnzDT83dO
 5BFEjia1x8fZTCR6spekcBKb/B1fjnZbhWS4acYYjy0fzvFftDxI2ePah
 F+6XZAzpMUFHZH71YqMUX5E4sHaPhHAOM1I27UCw5eaZ5I11JSIyqo6DD Q==;
X-CSE-ConnectionGUID: fN5FvTRkSmaxMYQM9OCz6Q==
X-CSE-MsgGUID: BIXBkWyzQ+yYh/RBsizEgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="31593709"
X-IronPort-AV: E=Sophos;i="6.12,158,1728975600"; d="scan'208";a="31593709"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 21:16:23 -0800
X-CSE-ConnectionGUID: Pt1AjKhJR6Gr/mj5qG27aA==
X-CSE-MsgGUID: aOn+o81qSqy/IrLjN4aAHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,158,1728975600"; d="scan'208";a="93585519"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 21:16:21 -0800
Date: Sat, 16 Nov 2024 07:16:18 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com
Subject: Re: [PATCH v1] drm/xe/throttle: Log throttle reasons
Message-ID: <ZzgqondldktBhnbV@black.fi.intel.com>
References: <20241115125614.857611-1-raag.jadav@intel.com>
 <ZzenBqroyv4N4r47@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZzenBqroyv4N4r47@lstrano-desk.jf.intel.com>
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

On Fri, Nov 15, 2024 at 11:54:46AM -0800, Matthew Brost wrote:
> On Fri, Nov 15, 2024 at 06:26:14PM +0530, Raag Jadav wrote:
> > Log throttle register MMIO reads which will be useful for debugging.
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_throttle.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.c b/drivers/gpu/drm/xe/xe_gt_throttle.c
> > index 03b225364101..0ce21ffc08dc 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_throttle.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_throttle.c
> > @@ -37,15 +37,18 @@ dev_to_gt(struct device *dev)
> >  
> >  u32 xe_gt_throttle_get_limit_reasons(struct xe_gt *gt)
> >  {
> > +	struct xe_device *xe = gt_to_xe(gt);
> > +	bool media = xe_gt_is_media_type(gt);
> >  	u32 reg;
> >  
> > -	xe_pm_runtime_get(gt_to_xe(gt));
> > -	if (xe_gt_is_media_type(gt))
> > +	xe_pm_runtime_get(xe);
> > +	if (media)
> >  		reg = xe_mmio_read32(&gt->mmio, MTL_MEDIA_PERF_LIMIT_REASONS);
> >  	else
> >  		reg = xe_mmio_read32(&gt->mmio, GT0_PERF_LIMIT_REASONS);
> > -	xe_pm_runtime_put(gt_to_xe(gt));
> > +	xe_pm_runtime_put(xe);
> >  
> > +	drm_dbg(&xe->drm, "%s reg: 0x%x\n", media ? "media" : "gt", reg);
> 
> How often does this happen? i.e. Is this common enough that it will spam
> dmesg when running IGTs. I find messages which spam dmesg very annoying.
> See this patch [1] I posted to remove one of these.
> 
> Matt
> 
> [1] https://patchwork.freedesktop.org/series/141426/

We're trying to debug a rare issue so I initially only meant it for CI.

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3254
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3147
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2810

But we'll see about merging if it really helps investigate.
I'm not sure if Test-with works with xe, does it?

Raag
