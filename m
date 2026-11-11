Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14300606A324
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 05:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j1m1TRys
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD74B10E197;
	Wed, 11 Nov 2026 05:41:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B0D110E197
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Nov 2026 05:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794375659; x=1825911659;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AZtj8Rvv4TBkgaRBUDbiOGZNmUzUi3puiCaEq+Gxt+8=;
 b=j1m1TRysO10stlEi8vqdvVLd/AvjzxaVu9SJRetWFghV3z/fi+i1iPOS
 FThFojxFJokUl2ChmVkTaZteBHhy2Qt7AhULpbaHT3KGrVV2JfGoaqhv6
 g/b80LBVZie7BYJMZEYYAlnzu5syXkVBA6+T8FRFufYM269GRDnsg6LzB
 qQIsaaeHcy5eJU2FdbLdnkOm91WOt+lY8nbDucXXpYd+pPtiHpJM3j9ok
 w6Etn9slUFgZF1OyeDqLImMshjrO9LATStkmqFKJsskfpFciBHAPGdkr/
 galyEEYAW3frvJDDP6eqIdP4oYOgs2wFEhjiSuJx7RB8rIsIJiqG9+YcK Q==;
X-CSE-ConnectionGUID: uKOgF2P9RXiHsQEc+aXA1A==
X-CSE-MsgGUID: u9ndkLXfScmr3rtVBXBuyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3137521"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3137521"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 21:40:59 -0800
X-CSE-ConnectionGUID: XF6zg286QEO3s5C8o88LcQ==
X-CSE-MsgGUID: OLMFyO+5TtGEBD4lcAoymg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8665713"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 21:40:58 -0800
Date: Wed, 11 Nov 2026 06:40:54 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 mallesh.koujalagi@intel.com, badal.nilawar@intel.com
Subject: Re: [PATCH v4 2/8] drm/xe/hw_error: Initialize hw_error_work per tile
Message-ID: <avP_5gPyp1iSFP0Q@black.igk.intel.com>
References: <20261106071944.2693854-10-riana.tauro@intel.com>
 <20261106071944.2693854-12-riana.tauro@intel.com>
 <avMQ0euV7JlPysFr@black.igk.intel.com>
 <f16bdbfd-919f-471f-a954-d5e0a7f36159@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f16bdbfd-919f-471f-a954-d5e0a7f36159@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 10:15:26AM +0530, Tauro, Riana wrote:
> On 10-11-2026 18:10, Raag Jadav wrote:
> > On Fri, Nov 06, 2026 at 12:49:47PM +0530, Riana Tauro wrote:
> > > From: Raag Jadav <raag.jadav@intel.com>
> > > 
> > > Since hw_error_work is now being reused generically, initialize it per tile
> > > so that we don't hit uninitialized work for non-root tile. While at it,
> > > disable hw_error_work on fini to prevent UAF during unwind.
> > > 
> > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> > > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > > ---
> > > v2: add dgfx and sriov check (Sashiko)
> > > 
> > > v3: retain original patch and fix unload issue in later patches
> > > ---
> > >   drivers/gpu/drm/xe/xe_hw_error.c | 20 ++++++++++++++++++--
> > >   1 file changed, 18 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> > > index a934b649575c..f7031b341ce0 100644
> > > --- a/drivers/gpu/drm/xe/xe_hw_error.c
> > > +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> > > @@ -537,6 +537,19 @@ static void process_hw_errors(struct xe_device *xe)
> > >   	}
> > >   }
> > > +static void hw_error_fini(void *arg)
> > > +{
> > > +	struct xe_device *xe = arg;
> > > +	struct xe_tile *tile;
> > > +	u8 id;
> > > +
> > > +	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
> > Why is this needed? fini is not even registered for these cases.
> > Not everything is a bug because AI says so :)
> 
> This is added so that it can be re-used in error_detected in patch [7/8]

Which sounds like this should be introduced in the patch which reuses it.

Raag

> > > +		return;
> > > +
> > > +	for_each_tile(tile, xe, id)
> > > +		disable_work_sync(&tile->hw_error_work);
> > > +}
> > > +
> > >   /**
> > >    * xe_hw_error_init - Initialize hw errors
> > >    * @xe: xe device instance
> > > @@ -546,12 +559,15 @@ static void process_hw_errors(struct xe_device *xe)
> > >    */
> > >   void xe_hw_error_init(struct xe_device *xe)
> > >   {
> > > -	struct xe_tile *tile = xe_device_get_root_tile(xe);
> > > +	struct xe_tile *tile;
> > > +	u8 id;
> > >   	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
> > >   		return;
> > > -	INIT_WORK(&tile->hw_error_work, hw_error_work);
> > > +	for_each_tile(tile, xe, id)
> > > +		INIT_WORK(&tile->hw_error_work, hw_error_work);
> > >   	process_hw_errors(xe);
> > > +	devm_add_action_or_reset(xe->drm.dev, hw_error_fini, xe);
> > >   }
> > > -- 
> > > 2.47.1
> > > 
