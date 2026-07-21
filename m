Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930A3C4452B
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 16:34:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3643D10E303;
	Tue, 21 Jul 2026 16:34:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gVjZ73qb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42EC510E303
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 16:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784651671; x=1816187671;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1XBRxC90DaVCGsfC0sZreamrrDyaIWHJaCcRq2ilXJ0=;
 b=gVjZ73qbPMw/2wPIHBWFT1yfmgY8euoOUaEBIOURp0C7UxlvWgk0ziSL
 prOIoq8VYXbotjmBsyMxZofxvkMOo7WPAY36N8c7g2xkUE5sNMwLU/a2C
 9mr0tx28rP4fkM/nR53HmIxyWXQgwlz2K1Kso6BGZ2SDqbWYknoUwDsn/
 K9LgUGBYUrNSUgrgD/eUP5NiNdTxO4YRs6qse7YyIkiS2DqKS0nHTe/Qt
 apoWJCTmF+U6l9IE5nChl6xh7A+X+l2ntgogAm7fqYysDXUmdi4GqPeSo
 UY7IHAvV59hByL3ydryMXTBMLeiSTkTSQjZcEq0zd2oRWuplO0GXJ81Wd w==;
X-CSE-ConnectionGUID: 5CYuO6daTUG8LmSIZyHSPg==
X-CSE-MsgGUID: 5RJWzbSrRES/mPJ8fdzIjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="85116538"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="85116538"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 09:34:31 -0700
X-CSE-ConnectionGUID: TVUtnF15SMWrzhUTAr1I9A==
X-CSE-MsgGUID: ep8jCfr/RYmS9MFGXFKpKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="258463043"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 09:34:30 -0700
Date: Tue, 21 Jul 2026 18:34:26 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v1] drm/xe/ras: Validate sysctrl response
Message-ID: <al-fkj2s1NMPXF6s@black.igk.intel.com>
References: <20260721082953.640497-1-raag.jadav@intel.com>
 <c5b868e0-1fcd-4e40-bf21-182ae918dcca@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c5b868e0-1fcd-4e40-bf21-182ae918dcca@intel.com>
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

On Tue, Jul 21, 2026 at 07:20:20PM +0530, Tauro, Riana wrote:
> On 21-07-2026 13:59, Raag Jadav wrote:
> > Validate errors raised by sysctrl firmware instead of blindly trusting
> > them.
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_ras.c | 30 ++++++++++++++++++++++++++++++
> >   1 file changed, 30 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> > index 5e294e9f8f99..e0bcd39e3b3a 100644
> > --- a/drivers/gpu/drm/xe/xe_ras.c
> > +++ b/drivers/gpu/drm/xe/xe_ras.c
> > @@ -156,6 +156,24 @@ static inline const char *comp_to_str(u8 component)
> >   	return xe_ras_components[component];
> >   }
> > +static bool ras_error_is_valid(struct xe_device *xe, struct xe_ras_error_class *error)
> 
> parameter "counter"  to maintain consistency with rest of the code.
> Same with the function name

Sure.

> > +{
> > +	u8 severity = error->common.severity;
> > +	u8 component = error->common.component;
> > +
> > +	if (severity == XE_RAS_SEV_NOT_SUPPORTED || severity >= XE_RAS_SEV_MAX) {
> > +		xe_err(xe, "sysctrl: unexpected severity %u\n", severity);
> > +		return false;
> > +	}
> > +
> > +	if (component == XE_RAS_COMP_NOT_SUPPORTED || component >= XE_RAS_COMP_MAX) {
> > +		xe_err(xe, "sysctrl: unexpected component %u\n", component);
> > +		return false;
> > +	}
> > +
> > +	return true;
> > +}
> > +
> >   static struct pci_dev *find_usp_dev(struct pci_dev *pdev)
> >   {
> >   	struct pci_dev *vsp;
> > @@ -327,6 +345,9 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
> >   		severity = errors[id].common.severity;
> >   		component = errors[id].common.component;
> > +		if (!ras_error_is_valid(xe, &errors[id]))
> > +			continue;
> > +
> >   		xe_warn(xe, "[RAS]: %s %s detected\n",
> >   			comp_to_str(component), sev_to_str(severity));
> >   	}
> > @@ -358,6 +379,9 @@ static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter,
> >   		return -EIO;
> >   	}
> > +	if (!ras_error_is_valid(xe, &response.counter))
> > +		return -EBADMSG;
> 
> -EIO would be a better error code to user indicating sysctrl error.

The response size is as expected, so I/O did happen. It's just the contents
are corrupted, a better fit for -EBADMSG.

> >   	common = &response.counter.common;
> >   	*value = response.value;
> > @@ -422,6 +446,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
> >   			component = arr->counter.common.component;
> >   			severity = arr->counter.common.severity;
> > +			if (!ras_error_is_valid(xe, &arr->counter))
> > +				break;
> 
> Shouldn't this be continue?

Fair.

Raag
