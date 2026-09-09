Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3CEC79FAD
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 06:12:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4549210E315;
	Wed,  9 Sep 2026 06:12:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ADj+/GqX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8BC810E315
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 06:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788934331; x=1820470331;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=b2cuXOXQpwfsfwB4RwUVV4PfrsG8736W0OcDo4ZQGtQ=;
 b=ADj+/GqXyvWxoEPq1m37TWGU1gs+N8bgZ0PdPcIu+HzIMGqXfS3xice+
 kOYaqv7vkWiE96i53H6W0NvS0p5VjT7uWs0Ayihb1XzTPRfC2Mqf34zcE
 NQNJpit55ieBh+hlJpUomQzfA9C77xkE741T5AuQwsRTYqDx6LZMRp50/
 hJl1PB19orFTo4VGPryLQ5rg0jiXsNnkwW+zfcU0Gi24GfeM5KyTkcYEx
 ofNXz/Puf2H/iBQz5jpCaAPGXxOiqin/U4dApMtg+RFo+fnQc7vV1rSEm
 rpJTJmFEUtpVbVVIEb7TGRZ0Q/k2z6HH9yEkjRrpNccuxdpxd7AoymlPY w==;
X-CSE-ConnectionGUID: /OiLiGwhS0i8deWI2IvAcA==
X-CSE-MsgGUID: yRO332t3Tw6Oh8aVynK3qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="88284597"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="88284597"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 23:12:09 -0700
X-CSE-ConnectionGUID: PB4tD5eKSWeZtXkxfUBiVg==
X-CSE-MsgGUID: zyC1HvTpTvizPJ/SCq1qYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="269471294"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 23:12:06 -0700
Date: Wed, 9 Sep 2026 08:12:03 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, michal.wajdeczko@intel.com,
 himal.prasad.ghimiray@intel.com, arvind.yadav@intel.com,
 syed.abdul.muqthyar.ahmed@intel.com, nitin.r.gote@intel.com
Subject: Re: [PATCH v3 02/12] drm/xe/cper: Retrieve the error counter record
 for CPER reporting
Message-ID: <aqD4syBajVA2sZPy@black.igk.intel.com>
References: <20260906172604.2215987-14-badal.nilawar@intel.com>
 <20260906172604.2215987-16-badal.nilawar@intel.com>
 <ap_gdX1GeLLatl2H@black.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ap_gdX1GeLLatl2H@black.igk.intel.com>
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

On Tue, Sep 08, 2026 at 12:16:27PM +0200, Raag Jadav wrote:
> On Sun, Sep 06, 2026 at 10:56:07PM +0530, Badal Nilawar wrote:
> > Retrieve error counter record required to build a CPER record when
> > one not provided by the caller.
> > 
> > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_cper.c |  15 ++++++
> >  drivers/gpu/drm/xe/xe_ras.c  | 100 ++++++++++++++++++++++-------------
> >  drivers/gpu/drm/xe/xe_ras.h  |   3 ++
> >  3 files changed, 80 insertions(+), 38 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> > index e8017e3ee3a0..f04a91223a43 100644
> > --- a/drivers/gpu/drm/xe/xe_cper.c
> > +++ b/drivers/gpu/drm/xe/xe_cper.c
> > @@ -9,6 +9,8 @@
> >  
> >  #include "xe_cper.h"
> >  #include "xe_device.h"
> > +#include "xe_printk.h"
> > +#include "xe_ras.h"
> >  #include "xe_ras_types.h"
> >  
> >  /**
> > @@ -26,6 +28,8 @@ void xe_emit_hardware_error_cper(struct pci_dev *pdev, int cper_sev, enum xe_sig
> >  				 struct xe_ras_get_counter_response *response)
> >  {
> >  	struct xe_device *xe = pdev_to_xe_device(pdev);
> > +	struct xe_ras_get_counter_response local_resp = {};
> > +	struct xe_ras_get_counter_response *counter_response = response;
> >  
> >  	if (!xe)
> >  		return;
> > @@ -33,5 +37,16 @@ void xe_emit_hardware_error_cper(struct pci_dev *pdev, int cper_sev, enum xe_sig
> >  	if ((int)sigid >= INTEL_SIGID_GPU_XE_HARDWARE_START)
> >  		return;
> >  
> > +	if (!counter || !xe_ras_counter_is_valid(xe, counter))
> 
> Why? Should we even be at this point without a valid counter?

ras_counter_is_valid() is already part of get_counter() and !counter
should be covered by IS_ERR_OR_NULL() in patch 1, which makes the entire
condition redundant.

> > +		return;
> > +
> > +	if (!counter_response) {
> > +		counter_response = &local_resp;
> > +		if (xe_ras_get_counter_response(xe, counter, counter_response)) {
> 
> Dumb question, shouldn't the whole xe_emit_hardware_error_cper() be the
> consequence of get_counter() and not the other way around?

Thanks for the offline pointers. From what I understand this is diverging
from the original hw cper design and correct for whatever we have in place.

Raag

> > +			xe_err(xe, "[RAS]: CPER: failed to get counter, skipping record\n");
> > +			return;
> > +		}
> > +	}
> > +
> >  	/* TODO */
> >  }
