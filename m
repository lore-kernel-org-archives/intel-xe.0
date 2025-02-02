Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA05C0218F
	for <intel-xe@archiver.kernel.org>; Sun,  2 Feb 2025 08:09:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0377C10E08E;
	Sun,  2 Feb 2025 08:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JzMwIQNy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D6810E08E
 for <intel-xe@lists.freedesktop.org>; Sun,  2 Feb 2025 08:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738483766; x=1770019766;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dkVagEjVvg5R2cbTrOCYJEu/17A2loLrvxOMV6fA47M=;
 b=JzMwIQNyykbMFV2277gsIpQYiw1zvd7O813D2hgnnMEhkIz76+uKCvfu
 gbApHdjaqUCoEGJVnVDPhJxNzfrsgs1t+IWiWeqYhYS1epB+8VjCL8fCE
 oaxuGG8rgpom/3/YCoCi7xTygNuiUXKLyyIRxzsR4iEZ2WjebTB125PqA
 1BWUiwOLKb5p3G3FWAwWUYZVYDmnV8q1Om8Y098O4j0ciZKZoFBGBsC8N
 NxADq8kUc52wrQ9CcfqsnO1s09Ps9b+447Yhs1l5Q9tCw+XaRUcq5WQlW
 vzXONQZP1JN+nS/fpA1PaxKcn244D5DQ1+K8eXw9Fh5fUwoHMZ8v21gWA Q==;
X-CSE-ConnectionGUID: phNeW+IySlGnFMlLu3UbgQ==
X-CSE-MsgGUID: /h8bg5UeQTSscfxZCBQ46Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11333"; a="38880693"
X-IronPort-AV: E=Sophos;i="6.13,253,1732608000"; d="scan'208";a="38880693"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2025 00:09:26 -0800
X-CSE-ConnectionGUID: ZpZTEN7gRn+YmqleEs2mpg==
X-CSE-MsgGUID: Jgb+zvJRTgqAPYabkYjK2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="140881537"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2025 00:09:23 -0800
Date: Sun, 2 Feb 2025 10:09:21 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: Re: [PATCH 5/7] drm/xe: Cleanup unwind of gt initialization
Message-ID: <Z58oMTJcu1E0WiCK@black.fi.intel.com>
References: <20250131223140.4144292-1-lucas.demarchi@intel.com>
 <20250131223140.4144292-6-lucas.demarchi@intel.com>
 <Z52-Mp78y2jELsmp@black.fi.intel.com>
 <lliho4ci6gi5spxxelttgqntbh7rxr4utg4dgfevlrdy54phrh@2k4mjuofaqye>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lliho4ci6gi5spxxelttgqntbh7rxr4utg4dgfevlrdy54phrh@2k4mjuofaqye>
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

On Sat, Feb 01, 2025 at 09:55:47AM -0600, Lucas De Marchi wrote:
> On Sat, Feb 01, 2025 at 08:24:50AM +0200, Raag Jadav wrote:
> > On Fri, Jan 31, 2025 at 02:31:38PM -0800, Lucas De Marchi wrote:
> > > Move the xe_gt_remove() to be handled by xe_gt.c itself so the caller,
> > > xe_device_probe() doesn't have to unwind the gt loop. It's also more in
> > > line with the xe_device_probe() style.
> > > 
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_device.c | 21 ++-----------------
> > >  drivers/gpu/drm/xe/xe_gt.c     | 37 ++++++++++++++++------------------
> > >  drivers/gpu/drm/xe/xe_gt.h     |  1 -
> > >  3 files changed, 19 insertions(+), 40 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > index e519f435b1606..bea626f6b4cbf 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -743,7 +743,6 @@ int xe_device_probe(struct xe_device *xe)
> > >  	struct xe_tile *tile;
> > >  	struct xe_gt *gt;
> > >  	int err;
> > > -	u8 last_gt;
> > >  	u8 id;
> > > 
> > >  	xe_pat_init_early(xe);
> > > @@ -851,18 +850,16 @@ int xe_device_probe(struct xe_device *xe)
> > >  		return err;
> > > 
> > >  	for_each_gt(gt, xe, id) {
> > > -		last_gt = id;
> > > -
> > >  		err = xe_gt_init(gt);
> > >  		if (err)
> > > -			goto err_fini_gt;
> > > +			return err;
> > 
> > So it's either all or nothing? Can't we operate with atleast what we have?
> 
> it was already like that, this is just moving the check to be in a
> better place.
> 
> But yes, we've decided long ago that it's better to fail early and fix
> it rather than having semi-working driver in production.

Sure, makes sense.

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
