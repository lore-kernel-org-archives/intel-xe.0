Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D1CD35688
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 07:15:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47CE710E237;
	Wed, 28 Jan 2026 07:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OfoRz0SH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC1910E10A;
 Wed, 28 Jan 2026 07:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769584535; x=1801120535;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gURkbEP+6BQ2GIyBqD5vUzXffhloZZkaIza9UvVs5YQ=;
 b=OfoRz0SHOK3rYXmK7gkYL8QbFcBVIMI4HfWo0FYCiHFpMoXmJq3iHYcp
 mwStGSjJqQqac+lC5Cxd62rZ24pRedGQhgfeGAccN88LHRf97GaLnxDYh
 5vvr+c52pvGMm/j9SpCHKjyhMFj13Q4lR35W3zgbgLaseMrAKrC4YxIo7
 pO85NIUFWE4TlSFpbhwNvfgeiKYc8rMQOKP6XRTY6uNIlGMEcXtENslnp
 ccw15VwjQJU0Y0eRCxQY7F/rQ+7k7eiswpItYDrVi9isU1R0HOQANTqJI
 yo7Wl+rLSqlO8DK0f07NH4wpgZOE9P7iHxU3BnUurd3tJcVmsQxvNSafk g==;
X-CSE-ConnectionGUID: PvgTy7kKQ9OSgitsr7M4Jw==
X-CSE-MsgGUID: NAksh7HqRYSNXlX0uLrDJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="82220484"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="82220484"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 23:15:35 -0800
X-CSE-ConnectionGUID: Rto8Q8NLS0OjI0jx2OJ07g==
X-CSE-MsgGUID: 8IOlEiECQwy0PuG1pUieTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="207435650"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 23:15:31 -0800
Date: Wed, 28 Jan 2026 08:15:28 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 simona.vetter@ffwll.ch, airlied@gmail.com, pratik.bari@intel.com,
 joshua.santosh.ranjan@intel.com, ashwin.kumar.kulkarni@intel.com,
 shubham.kumar@intel.com, ravi.kishore.koppuravuri@intel.com
Subject: Re: [PATCH v4 2/4] drm/xe/xe_drm_ras: Add support for drm ras
Message-ID: <aXm3kI6tAJkrO30F@black.igk.intel.com>
References: <20260119040023.2821518-6-riana.tauro@intel.com>
 <20260119040023.2821518-8-riana.tauro@intel.com>
 <aW-039yu1OXXSrdz@black.igk.intel.com>
 <cddd882c-348c-416b-aeb2-f92d3b7f41c8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cddd882c-348c-416b-aeb2-f92d3b7f41c8@intel.com>
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

On Wed, Jan 28, 2026 at 12:21:18PM +0530, Riana Tauro wrote:
> On 1/20/2026 10:31 PM, Raag Jadav wrote:
> > On Mon, Jan 19, 2026 at 09:30:24AM +0530, Riana Tauro wrote:
> > > Allocate correctable, uncorrectable nodes for every xe device
> > > Each node contains error classes, counters and respective
> > > query counter functions.
> > 
> > ...
> > 
> > > +static int hw_query_error_counter(struct xe_drm_ras_counter *info,
> > > +				  u32 error_id, const char **name, u32 *val)
> > > +{
> > > +	if (error_id < DRM_XE_RAS_ERROR_CLASS_GT || error_id >= DRM_XE_RAS_ERROR_CLASS_MAX)
> > 
> > This looks like it can be in_range().
> 
> in_range has start+len. Should again use count here.
> This seems simpler

I just had another look at this and wondering if we really need lower
bound check? error_id is already unsigned right?

Raag

> > > +		return -EINVAL;
> > > +
> > > +	if (!info[error_id].name)
> > > +		return -ENOENT;
> > > +
> > > +	*name = info[error_id].name;
> > > +	*val = atomic64_read(&info[error_id].counter);
> > > +
> > > +	return 0;
> > > +}
