Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C676FCD4F54
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 13:39:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88AF510FF50;
	Fri, 29 May 2026 13:39:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cr3/12cz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534A910FF50;
 Fri, 29 May 2026 13:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780061960; x=1811597960;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=aBPByKGo1nl4MibvShhSxdeLKeGQ+5pagZDlJd2omoM=;
 b=Cr3/12czPgmH2uYbLScFfIwGtjru13DJQwKyolLs2DSGXyBM/pm8qM2R
 pKlidhxpgABtaFeaIPuvZzKz2FpydpcSL6Gme7jFCeCUXxouMrNXG2+hY
 yKzu4j2Ygj2orVSGK+hIaPE19AWEvVucdYV4dgjIwSCr3RsV6bsLRREFC
 /WTH9FDuaGig7laiNFdd3/IKGWihYxDlDaIvzfzYAPnYAmMcJqyljn5Gk
 cFh9kqLADObpgfPHBWUEKUo7qnlT++LUXkIj8hDzfccCfsiaW/brbxTSz
 HlScqheisT92IV2GWICXtj9FF+UC8YCsTw5+NZp80vhMf+QV2/zUVbIIx Q==;
X-CSE-ConnectionGUID: E8P9AnUgRZ6a0T9QW4Q9jw==
X-CSE-MsgGUID: bKXFVmWgSnG0lBX3BoiQzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="80941286"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="80941286"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 06:39:20 -0700
X-CSE-ConnectionGUID: OHJKGF/DTzadIZgN1JcswA==
X-CSE-MsgGUID: +KhA34nASVOlR1oO6rMD8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="242952605"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.147])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 06:39:15 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, ville.syrjala@intel.com,
 matthew.d.roper@intel.com, shawn.c.lee@intel.com
Subject: Re: [PATCH] drm/i915/display: update BW buddy initialization for
 LPDDR4 and LPDDR5
In-Reply-To: <20260528182601.205595-1-vinod.govindapillai@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260528182601.205595-1-vinod.govindapillai@intel.com>
Date: Fri, 29 May 2026 16:39:13 +0300
Message-ID: <d661dae5343e317fdf286194af4c5e707cbeea97@intel.com>
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

On Thu, 28 May 2026, Vinod Govindapillai <vinod.govindapillai@intel.com> wrote:
> Pcode reports the number of subchannels for LPDDR4 and LPDDR5.
> But the page mask selection table is based on the channels. So
> adjust the number of channels for LPDDR4 and LPDDR5 so that the
> correct page mask can be picked. There are two subchannels per
> channel.

IMO the parsing of the information belongs in intel_dram.c. If you get
subchannels from pcode or where ever, intel_dram.c should figure it out,
and store the number of channels in ->num_channels.

If we need the subchannel info separately, we'll need to add the
subchannel info in struct dram_info.

BR,
Jani.



>
> Bspec: 68871
> Suggested-by: Ville Syrjala <ville.syrjala@intel.com>
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_power.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
> index 2e51dfcd5dce..758ce1287cac 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_power.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_power.c
> @@ -1614,12 +1614,18 @@ static void tgl_bw_buddy_init(struct intel_display *display)
>  	const struct dram_info *dram_info = intel_dram_info(display);
>  	const struct buddy_page_mask *table;
>  	unsigned long abox_mask = DISPLAY_INFO(display)->abox_mask;
> +	u8 channels = dram_info->num_channels;
>  	int config, i;
>  
>  	/* BW_BUDDY registers are not used on dgpu's beyond DG1 */
>  	if (display->platform.dgfx && !display->platform.dg1)
>  		return;
>  
> +	/* For LPDDR4 / LPDDR5, pcode reports subchannels. */
> +	if (dram_info->type == INTEL_DRAM_LPDDR4 ||
> +	    dram_info->type == INTEL_DRAM_LPDDR5)
> +		channels /= 2;
> +
>  	if (intel_display_wa(display, INTEL_DISPLAY_WA_1409767108))
>  		/* Wa_1409767108 */
>  		table = wa_1409767108_buddy_page_masks;
> @@ -1627,7 +1633,7 @@ static void tgl_bw_buddy_init(struct intel_display *display)
>  		table = tgl_buddy_page_masks;
>  
>  	for (config = 0; table[config].page_mask != 0; config++)
> -		if (table[config].num_channels == dram_info->num_channels &&
> +		if (table[config].num_channels == channels &&
>  		    table[config].type == dram_info->type)
>  			break;

-- 
Jani Nikula, Intel
