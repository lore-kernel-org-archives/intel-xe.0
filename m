Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C707C83F33
	for <intel-xe@archiver.kernel.org>; Tue,  5 Sep 2023 15:41:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF26110E096;
	Tue,  5 Sep 2023 15:41:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EFAB10E096
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Sep 2023 15:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693928498; x=1725464498;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=OnAPegan3kI7T9CgLhEZ3uB3e4v9xNV4iCwI4NBF8js=;
 b=ZpOTfi5Uf4yWORtYc05FIP6qic6QATU/Wsc5zDJn4X9KBWTHf+VRMUTy
 AfQthTL/QUMd2s+hgpLd4Fqja7l7Dp69WqsYLsv+9iHlVqTj8dPLf3RCq
 JQjXtwwbUaY+F3UKTY59GE/F0MW1MwTOe+AftPTmc6L25laslMKR2A9wR
 GvvhMyI0t+7dqaEMaQSLqxH3e+d18D3NMkAmqbh3V+H5oYaNURfrXXvrk
 LayZdwc89mLmNDR81mg//p9JeFBi3zygDufEDyqQ52l089bZXi9fdjZdm
 BzPQEkMlQ72GuutAv1k+/1hXvVRadGtemKanwQ3jHoJ97df9a/eCTnSkJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="375717454"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="375717454"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 08:41:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="744305137"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="744305137"
Received: from mkuoppal-desk.fi.intel.com (HELO localhost) ([10.237.72.193])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 08:41:35 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20230905143144.1706967-2-lucas.demarchi@intel.com>
References: <20230905143144.1706967-1-lucas.demarchi@intel.com>
 <20230905143144.1706967-2-lucas.demarchi@intel.com>
Date: Tue, 05 Sep 2023 18:39:31 +0300
Message-ID: <87a5u0d3yk.fsf@mkuoppal-desk>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe/reg_sr: Simplify check for masked
 registers
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Lucas De Marchi <lucas.demarchi@intel.com> writes:

> For all RTP actions, clr_bits is a superset of the bits being modified.
> That's also why the check for "changing all bits" can be done with
> `clr_bits + 1`. So always use clr_bits for setting the upper bits of a
> masked register.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_reg_sr.c    | 8 ++++----
>  drivers/gpu/drm/xe/xe_rtp_types.h | 5 ++++-
>  2 files changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index 7c88352636d2..264520015861 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -153,15 +153,15 @@ static void apply_one_mmio(struct xe_gt *gt, struct xe_reg_sr_entry *entry)
>  	u32 val;
>  
>  	/*
> -	 * If this is a masked register, need to figure what goes on the upper
> -	 * 16 bits: it's either the clr_bits (when using FIELD_SET and WR) or
> -	 * the set_bits, when using SET.
> +	 * If this is a masked register, need to set the upper 16 bits.
> +	 * Set them to clr_bits since that is always a superset of the bits
> +	 * being modified.
>  	 *
>  	 * When it's not masked, we have to read it from hardware, unless we are
>  	 * supposed to set all bits.
>  	 */
>  	if (reg.masked)
> -		val = (entry->clr_bits ?: entry->set_bits) << 16;
> +		val = entry->clr_bits << 16;

Makes sense but should we consider also making sure in the
setup side that the set_bits stays withing low if masked is set.
So that we dont accidantally trample the upper parts.

+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -80,6 +80,9 @@ static bool compatible_entries(const struct
xe_reg_sr_entry *e1,
        if (e1->reg.raw != e2->reg.raw)
                        return false;

+       if (e1->reg.masked != e2->reg.masked)
+               return false;
+
        return true;
         }

@@ -104,6 +107,14 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
                        goto fail;
                                        }

+               if (XE_WARN_ON(e->reg.masked &&
+                              upper_32_bits(e->clr_bits |
+                                            e->set_bits |
+                                            e->read_mask))) {
+                       ret = -EINVAL;
+                       goto fail;
+               }
+
                pentry->clr_bits |= e->clr_bits;

Something like this?

-Mika


>  	else if (entry->clr_bits + 1)
>  		val = (reg.mcr ?
>  		       xe_gt_mcr_unicast_read_any(gt, reg_mcr) :
> diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
> index d170532a98a5..637acc7626a4 100644
> --- a/drivers/gpu/drm/xe/xe_rtp_types.h
> +++ b/drivers/gpu/drm/xe/xe_rtp_types.h
> @@ -22,7 +22,10 @@ struct xe_gt;
>  struct xe_rtp_action {
>  	/** @reg: Register */
>  	struct xe_reg		reg;
> -	/** @clr_bits: bits to clear when updating register */
> +	/**
> +	 * @clr_bits: bits to clear when updating register. It's always a
> +	 * superset of bits being modified
> +	 */
>  	u32			clr_bits;
>  	/** @set_bits: bits to set when updating register */
>  	u32			set_bits;
> -- 
> 2.40.1
