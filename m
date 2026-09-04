Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6D6C79F80
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 09:57:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 521E810FA12;
	Fri,  4 Sep 2026 09:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gUusjUFZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5254310FA12;
 Fri,  4 Sep 2026 09:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788515823; x=1820051823;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=4/WEBURPsrnJZrXrrbkeepdSzGJCtU2JE5Th6TshCKM=;
 b=gUusjUFZ6gFqHIg5W97SNG0807Sj6lhoAG8fb8zXbKPlEft8BYxd2EQ2
 FMylVhaDTGk7Q5zpE9GC3kMr4UYWx91CPr2aOgVHQT+wBFouwpuGOvXL0
 67JQpJnF/k9UdXLKzbpSkgcvXh7DTbA3/ke0zMX43x8XmkZqpakC+YQPz
 EiawgAUx8RCzdcgla1DyFrWp+wLzgvToVXUuI3DDeUeSbDbAZBSJQRnvi
 lJHBQeS5IXJsvJ+nqTfgL0v3I1oWxbnnd/bt+SZoiBWDTSpNi3PM4yyjd
 Mxg0mXrovFNp9nNcwl/KjF2+x3H6yiyiQT8qAcStPNwde/5mJsWKB19oq w==;
X-CSE-ConnectionGUID: qAS4J615RB650Ma0KKt+SA==
X-CSE-MsgGUID: UKZgj7/KSeSbZRfBrUwNnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="92834786"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="92834786"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 02:57:03 -0700
X-CSE-ConnectionGUID: E8zy2l7USN6VTG1eutRPwA==
X-CSE-MsgGUID: S3SrwWK8RnO3RdO+4O71lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="275278086"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.29])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 02:57:01 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, imre.deak@intel.com,
 jouni.hogander@intel.com
Subject: Re: [PATCH v2 3/5] drm/i915/irq: conditional HPD IRQ resets based
 on PME capability
In-Reply-To: <20260903080410.489411-4-vinod.govindapillai@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260903080410.489411-1-vinod.govindapillai@intel.com>
 <20260903080410.489411-4-vinod.govindapillai@intel.com>
Date: Fri, 04 Sep 2026 12:56:58 +0300
Message-ID: <37c640934163bd6849303500f4e7662e49b4d784@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 03 Sep 2026, Vinod Govindapillai <vinod.govindapillai@intel.com> wrote:
> If a device supports generating PME from HPDs, resetting HPD IRQs
> will be counter productive as HPDs itself will be lost. During
> suspend routines, all the IRQs are reset. So if the device is
> capable of generating PME rom HPDs, keep the HPD related IRQs from
> reset based on the PME capability of the device on a target power
> state. PME capability will be assessed and updated separately.
>
> Bspec: 52979, 52980, 68857, 68867, 68970
> Assisted-by: GitHub_Copilot:claude-opus-5
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>  .../gpu/drm/i915/display/intel_display_irq.c  | 20 ++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/gpu/drm/i915/display/intel_display_irq.c
> index a59b75830bd1..fc50b19d5ddf 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_irq.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
> @@ -22,6 +22,7 @@
>  #include "intel_fdi_regs.h"
>  #include "intel_fifo_underrun.h"
>  #include "intel_gmbus.h"
> +#include "intel_hotplug.h"
>  #include "intel_hotplug_irq.h"
>  #include "intel_lpe_audio.h"
>  #include "intel_parent.h"
> @@ -2217,8 +2218,11 @@ static void gen11_display_irq_reset(struct intel_display *display)
>  	enum pipe pipe;
>  	u32 trans_mask = BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
>  		BIT(TRANSCODER_C) | BIT(TRANSCODER_D);
> +	/* If HPD can generate PME, we don't want to reset HPD related IRQs */

Please don't add comments in the middle of the declarations. IMO it's a
distraction rather than helpful.

To be fair, one comment like this here or there would be fine, but it
takes only a few to set an example both for humans and the language
models to start littering the declarations with comments, and I don't
want that.

> +	bool keep_hpd = intel_hpd_can_generate_pme(display);

	bool reset_hpd = !intel_hpd_can_generate_pme(display);

IMO this would be more clear.

> -	intel_de_write(display, GEN11_DISPLAY_INT_CTL, 0);
> +	if (!keep_hpd)
> +		intel_de_write(display, GEN11_DISPLAY_INT_CTL, 0);
>  
>  	if (DISPLAY_VER(display) >= 12) {
>  		enum transcoder trans;
> @@ -2250,13 +2254,15 @@ static void gen11_display_irq_reset(struct intel_display *display)
>  	irq_reset(display, GEN8_DE_PORT_IRQ_REGS);
>  	irq_reset(display, GEN8_DE_MISC_IRQ_REGS);
>  
> -	if (DISPLAY_VER(display) >= 14)
> -		irq_reset(display, PICAINTERRUPT_IRQ_REGS);
> -	else
> -		irq_reset(display, GEN11_DE_HPD_IRQ_REGS);
> +	if (!keep_hpd) {
> +		if (DISPLAY_VER(display) >= 14)
> +			irq_reset(display, PICAINTERRUPT_IRQ_REGS);
> +		else
> +			irq_reset(display, GEN11_DE_HPD_IRQ_REGS);
>  
> -	if (INTEL_PCH_TYPE(display) >= PCH_ICP)
> -		irq_reset(display, SDE_IRQ_REGS);
> +		if (INTEL_PCH_TYPE(display) >= PCH_ICP)
> +			irq_reset(display, SDE_IRQ_REGS);
> +	}
>  }
>  
>  void gen8_irq_power_well_post_enable(struct intel_display *display,

-- 
Jani Nikula, Intel
