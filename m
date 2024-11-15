Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49484D68BC1
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 14:40:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 107FF10E872;
	Fri, 15 Nov 2024 14:40:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ijHMZanH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE9210E872
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Nov 2024 14:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731681655; x=1763217655;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7P6k4DFLqZAAleyaMXHQaPp5bHzCdaUzE0LJYDX0pZQ=;
 b=ijHMZanHeFf0lDeRh8fdRf3wtgXsuCCYK0ThxKs5ctK1mC1iBlNL1vZF
 o2LIxZTbkSntq0wIZjqhQCC+L8rndsuPUdrhhfXmkvjwpsVRuKZngsWYf
 l7u4/9OWL2n6KGZCoK/pyq/G7l3Zxq2zENmhlyVQKW9fFl+RY0CVGKr/I
 1gqElSk5fk6sTRchj405mwbp/Pr1eiGFqp3rIA8ozFaiLZEfoT0it1BnH
 JySYoCHMidqR6Dy6PG9+QJ4MZH5LFzvqR+UI8OOpJoCuo+kL47sOTuGXq
 yzipLhlJC0doHxnY56Pany/gp0LqcJgS8qTVPF9Wl1Ya8aZR6zzpSlgEc w==;
X-CSE-ConnectionGUID: pkMG+6/kSMWPG5Wgwjsh8A==
X-CSE-MsgGUID: +gccwHXFRGGtqCH4WF/pWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="31824769"
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="31824769"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 06:40:54 -0800
X-CSE-ConnectionGUID: nDMwdGkmSDKe2cM83IFVRw==
X-CSE-MsgGUID: UzpE+uQzQ1qvcYQEzrdMDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="93595315"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 06:40:52 -0800
Date: Fri, 15 Nov 2024 16:40:49 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com
Subject: Re: [PATCH v1] drm/xe/throttle: Log throttle reasons
Message-ID: <ZzddcQoXLFGNwfOZ@black.fi.intel.com>
References: <20241115125614.857611-1-raag.jadav@intel.com>
 <d81e0758-95f7-44bd-a899-252b0b9a60ad@intel.com>
 <85a5e0y5dq.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85a5e0y5dq.wl-ashutosh.dixit@intel.com>
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

On Fri, Nov 15, 2024 at 05:48:49AM -0800, Dixit, Ashutosh wrote:
> On Fri, 15 Nov 2024 05:12:08 -0800, Michal Wajdeczko wrote:
> > On 15.11.2024 13:56, Raag Jadav wrote:
> > > Log throttle register MMIO reads which will be useful for debugging.
> > >
> > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_gt_throttle.c | 9 ++++++---
> > >  1 file changed, 6 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.c b/drivers/gpu/drm/xe/xe_gt_throttle.c
> > > index 03b225364101..0ce21ffc08dc 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_throttle.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_throttle.c
> > > @@ -37,15 +37,18 @@ dev_to_gt(struct device *dev)
> > >
> > >  u32 xe_gt_throttle_get_limit_reasons(struct xe_gt *gt)
> > >  {
> > > +	struct xe_device *xe = gt_to_xe(gt);
> > > +	bool media = xe_gt_is_media_type(gt);
> 
> Also not sure what the point of these new variables is, previous code is
> fine. I actually prefer it to the new code.
> 
> So this patch should be just a single line of xe_gt_dbg, IMO.

We normally have temp variables for repeated uses. Makes the rest a bit
easier on the eyes.

Raag

> > >	u32 reg;
> > >
> > > -	xe_pm_runtime_get(gt_to_xe(gt));
> > > -	if (xe_gt_is_media_type(gt))
> > > +	xe_pm_runtime_get(xe);
> > > +	if (media)
> > >		reg = xe_mmio_read32(&gt->mmio, MTL_MEDIA_PERF_LIMIT_REASONS);
> > >	else
> > >		reg = xe_mmio_read32(&gt->mmio, GT0_PERF_LIMIT_REASONS);
> > > -	xe_pm_runtime_put(gt_to_xe(gt));
> > > +	xe_pm_runtime_put(xe);
> > >
> > > +	drm_dbg(&xe->drm, "%s reg: 0x%x\n", media ? "media" : "gt", reg);
> >
> > we prefer GT oriented logs, so this should be:
> >
> >	xe_gt_dbg(gt, "....
> >
> > >	return reg;
> > >  }
> > >
> >
