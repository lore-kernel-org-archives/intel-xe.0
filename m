Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A4D606A32C
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 17:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kxX/X9M/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB86112F14;
	Fri,  6 Nov 2026 17:00:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9C1B112F14;
 Fri,  6 Nov 2026 17:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793984423; x=1825520423;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ZyNjiipB/bRbjWUbs5fx3kv2juSrPi5BR5NXEaWemVM=;
 b=kxX/X9M/LbNl6175t5+WGuD2l4TKri9VES64/PkBJd7FBNuqbL0pMQfi
 08Z03AgKCIHUte1qQKma9eEbG6QNjtgSABT0G8nvfvmPhUcHbKXVqQ/Bz
 BL+bSSDkT6UoeG8lwnhc68jetntEu20jQX1DzAN5nAU1LQJdktErt1ZRj
 nmAV/st/bkA9JjnUfU085/+uAA8pyCZEoiG+ENkhlZYg+g2FyLQHGEb7N
 hB6lYGT4Z2U0fLbcH9rRtjjYw9df8qEFszn81OcnlY7aaoyxEo/nfJilP
 KyMrVwHgJFY8JmEXqEHkg+3mHX6+JEzq/9IWWqDxIeLqQ1DiZK4DTp6yR w==;
X-CSE-ConnectionGUID: W6QZvvwcQx2uFe/WPjEA3Q==
X-CSE-MsgGUID: 3IYZTPtLTD6iAHBURo8WMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2686385"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2686385"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 09:00:22 -0800
X-CSE-ConnectionGUID: HjugyGdYQv+aihcUYGbA+w==
X-CSE-MsgGUID: fTC+MJALRBeXo4wmS6/AnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="9078053"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 09:00:20 -0800
Date: Fri, 6 Nov 2026 19:00:17 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Maarten Lankhorst <dev@lankhorst.se>,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH 4/5] drm/i915/irq: Keep GSE interrupts masked if display
 is not present
Message-ID: <au4HoWDpe4Ovuzd7@intel.com>
References: <20261105203427.8696-1-ville.syrjala@linux.intel.com>
 <20261105203427.8696-5-ville.syrjala@linux.intel.com>
 <5f09f7ca44f89e67ec100eb4714f314c1da4eb4f@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f09f7ca44f89e67ec100eb4714f314c1da4eb4f@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 11:25:09AM +0200, Jani Nikula wrote:
> On Thu, 05 Nov 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > Display is the only current user of GSE interrupts. Keep the
> > GSE interrupt masked on icl+ if there is no display.
> >
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> xe could use the same treatment.

Didn't even realize xe was enabling this. Ugh. The GSE irq
handler is currently called xe_disaplay_irq_enable()? What?

xe's interrupt handlers also look quite expensive because
all the master bits are checked in the non-inlined sub handler
functions. So no matter how many actual interrupt bits are set
you always pay the cost of a dozen redundant function calls.
At least it filters out the entire tile if nothing happened
on it.

I suppose the "just function calls in the top level handler"
approach does keep the code looking fairly neat. But for
efficiency those should probably be static inlines so you
don't pay the extra function call cost for every bit you
want to check. Might have to think about using that approach
for the display irq code actually...

I also don't know why xe has all those weird probe_display
checks in the display irq stuff. Why would display irqs
even be unmasked if there is no display?

Anyways, for now I'll just stick to fixing up the GSE
stuff in xe.

> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> 
> > ---
> >  drivers/gpu/drm/i915/i915_irq.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
> > index 823d97284d78..5476472d33bd 100644
> > --- a/drivers/gpu/drm/i915/i915_irq.c
> > +++ b/drivers/gpu/drm/i915/i915_irq.c
> > @@ -36,6 +36,7 @@
> >  #include <drm/intel/display_parent_interface.h>
> >  #include <drm/intel/intel_gmd_interrupt_regs.h>
> >  
> > +#include "display/intel_display_device.h"
> >  #include "display/intel_display_irq.h"
> >  
> >  #include "gt/intel_breadcrumbs.h"
> > @@ -727,9 +728,13 @@ static void gen8_irq_postinstall(struct drm_i915_private *dev_priv)
> >  
> >  static void gen11_gu_misc_irq_postinstall(struct drm_i915_private *dev_priv)
> >  {
> > +	struct intel_display *display = dev_priv->display;
> >  	struct intel_gt *gt = to_gt(dev_priv);
> >  	struct intel_uncore *uncore = gt->uncore;
> > -	u32 gu_misc_masked = GEN11_GU_MISC_GSE;
> > +	u32 gu_misc_masked = 0;
> > +
> > +	if (intel_display_device_present(display))
> > +		gu_misc_masked |= GEN11_GU_MISC_GSE;
> >  
> >  	gen2_irq_init(uncore, GEN11_GU_MISC_IRQ_REGS, ~gu_misc_masked, gu_misc_masked);
> >  }
> 
> -- 
> Jani Nikula, Intel

-- 
Ville Syrjälä
Intel
