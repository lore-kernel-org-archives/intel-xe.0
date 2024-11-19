Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A976D6C281
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 18:51:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2347910E69E;
	Tue, 19 Nov 2024 18:51:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VQWpgSop";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C808D10E69E
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Nov 2024 18:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732042295; x=1763578295;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QcNfKRqc04pSR73hE2gu5rZWxVvjZ0J5LkIcNCFTZjQ=;
 b=VQWpgSopv0mKe6J+Rumd7iihM9OM/WqmOPYu3IGyoc6UAXECPa5TuLnR
 /0F08xParP9GALrbEBXEBxA03J7OLB95pZwu7RdNBBwN0b3g8vOSjJ+8O
 yNQ+xXEPGCMIlbXgKSrN82+Ib9jDieVCrZBu/ruJhqnLXaB4IwgCKtLaZ
 TKd5YBit48XPSYz4cyOY1XS9I0nL6ZrjUXedPb500MjV7UHILltJypZsr
 Dt89d72kRlXAgyWCmALPp7kat495sG14m/+ftoIHigCAb1URYhkTb6IT8
 ZV1o2LdvXPGad4lMi5+OfeiXrDssEKw4ZXrjsrvg2/1fkh2g5wCTLR8L/ w==;
X-CSE-ConnectionGUID: aLA9/fBuSuaThGSmlHKPqw==
X-CSE-MsgGUID: HeRSRRs2SnKn13R/XLpJ4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="31443229"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="31443229"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 10:51:31 -0800
X-CSE-ConnectionGUID: RjlKlNiTQeK3pANMZ+nbOw==
X-CSE-MsgGUID: ySp1yO/CQ+C2ZDu3zguJSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="89595546"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 10:51:30 -0800
Date: Tue, 19 Nov 2024 20:51:26 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 anshuman.gupta@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v1] drm/xe/throttle: Log throttle reasons
Message-ID: <ZzzeLi2tunanog9F@black.fi.intel.com>
References: <20241115125614.857611-1-raag.jadav@intel.com>
 <ZzenBqroyv4N4r47@lstrano-desk.jf.intel.com>
 <857c94xo0w.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <857c94xo0w.wl-ashutosh.dixit@intel.com>
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

On Fri, Nov 15, 2024 at 12:03:43PM -0800, Dixit, Ashutosh wrote:
> On Fri, 15 Nov 2024 11:54:46 -0800, Matthew Brost wrote:
> > On Fri, Nov 15, 2024 at 06:26:14PM +0530, Raag Jadav wrote:
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
> > How often does this happen? i.e. Is this common enough that it will spam
> > dmesg when running IGTs. I find messages which spam dmesg very annoying.
> > See this patch [1] I posted to remove one of these.
> 
> How about reading via debugfs as in i915? Also, looks like we don't have a
> means to clear the top 16 'latched' bits yet?

It seems the latched bits are only for logging and don't have any effect
on lower bits which indicate realtime throttling.

We can add them if we care about history, although I'm not sure if that's
the usecase.

Raag
