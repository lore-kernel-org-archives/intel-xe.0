Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B84EB28D1
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 06:32:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FAB110E390;
	Fri,  6 Feb 2026 06:32:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UhrTMFQM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1507110E390
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Feb 2026 06:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770359536; x=1801895536;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=v3cZPUE8mHEpxMap/5lEHgQsHLArRwMiig2aoX7aYYM=;
 b=UhrTMFQMnK3BJBUVD4HBHl1zhd05t9whcX+h/63vhd5o1VhBpGj11Yy5
 EUoMUs7rpcLt1piBuRNNAf6tBNVBXjNVH5kpPiaKKcykTiftF1oLTXvuD
 zqjRhRUdaVpLAmO0IpJm9jTPaAmGhphu07uFuiKpgxBfiRXB5DR0jC/1m
 jJSAXpejSrXVps7QpZtAIq3EEJKpkUjXhX4KsqYwhQo+4pbnKuwghJe+O
 LFeeF2Kv/N9PHAY33R9UkMTcKhhUuG3/pcn6dlt7CtNgBBbZX1rSDS8cs
 O+EnhzzDZjB3WvVE2YKZpoS3ZszqmAtvcLfco8g64ZRVmEYIV4VuhpvA1 g==;
X-CSE-ConnectionGUID: 0FYJSppjQ9iSY+Hf6oHxXA==
X-CSE-MsgGUID: nFOwJsTlQPiubRGVkcaBTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="82200042"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="82200042"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 22:32:14 -0800
X-CSE-ConnectionGUID: +apuYaIBRIqy5RkouFeU/A==
X-CSE-MsgGUID: MNyeTPutTqaelAuQTODWyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="215752936"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 22:32:12 -0800
Date: Fri, 6 Feb 2026 07:32:08 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 riana.tauro@intel.com, michal.wajdeczko@intel.com,
 matthew.d.roper@intel.com, lukasz.laguna@intel.com
Subject: Re: [PATCH v1] drm/xe: Send unknown recovery method for
 XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET
Message-ID: <aYWK6DK4F7qIhsok@black.igk.intel.com>
References: <20260205111836.1628965-1-raag.jadav@intel.com>
 <aYUfpZOEIHl3i_kf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYUfpZOEIHl3i_kf@intel.com>
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

On Thu, Feb 05, 2026 at 05:54:29PM -0500, Rodrigo Vivi wrote:
> On Thu, Feb 05, 2026 at 04:48:35PM +0530, Raag Jadav wrote:
> > XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging hangs,
> > so wedge the device without any recovery method (unknown) and have it
> > available to the user for debugging.
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index b1241fa4c3d6..815f0b0c9dfd 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -1326,8 +1326,15 @@ void xe_device_declare_wedged(struct xe_device *xe)
> >  		xe_gt_declare_wedged(gt);
> >  
> >  	if (xe_device_wedged(xe)) {
> > +		/*
> > +		 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging hangs,
> > +		 * so wedge the device without any recovery method and have it available
> > +		 * to the user for debugging.
> 
> agree....
> 
> > +		 */
> > +		if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> > +			xe_device_set_wedged_method(xe, 0);
> 
> but why not using the already defined:
> 
> #define DRM_WEDGE_RECOVERY_NONE    BIT(0)  /* optional telemetry collection */

We originally added this for AMD usecase, and it doesn't strictly speaking
means 'wedged'.

Documentation/gpu/drm-uapi.rst +441

"The only exception to this is ``WEDGED=none``, which signifies that the device
was temporarily 'wedged' at some point but was recovered from driver context
using device specific methods like reset."

Raag

> >  		/* If no wedge recovery method is set, use default */
> > -		if (!xe->wedged.method)
> > +		else if (!xe->wedged.method)
> >  			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
> >  						    DRM_WEDGE_RECOVERY_BUS_RESET);
> >  
> > -- 
> > 2.43.0
> > 
