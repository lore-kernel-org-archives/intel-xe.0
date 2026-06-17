Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22481CD98E4
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 11:38:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFFE510EFB4;
	Wed, 17 Jun 2026 11:38:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dzAaN8YX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F9DD10EFB4;
 Wed, 17 Jun 2026 11:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781696300; x=1813232300;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=1U9KKPgGmyjcqMbOe5Px70RiIF+afP1QiBox3D0vvxI=;
 b=dzAaN8YXuqU7GRhc+uVBFd6IviemKqM8kc1kmPVJ+OystFiRDPSA1lI/
 GxyB+mF3vTaCFnruOKg2yZwWirp6CXQaXxplnNVJjzD0DSPvpyhMmwOH1
 xe7nw7PM4CRvfWF9trt25uR3RDqJ0OMfVxk0KjeIn84GJOsf6Ca5VNurZ
 TcykwPSDCqA81rnJVeM+NGTTe8CK/KGIOFSnCsPTnI7Y23lpJiNzFVbdV
 IhXSZU+wHgtpIBsB3goPMV42NdupRbpAp/hZYZ2YIkwTrqVERsMjNzsuL
 R5Rc0Rshjb0lovRaExcLpX6D7TBAIsw6u5C/wCHr2uo5UgXp5IDL1L5DZ A==;
X-CSE-ConnectionGUID: BBpHRK6xTAKy90RsOFT1AA==
X-CSE-MsgGUID: IWvpcR3GRJabeZj4XycqnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="99898372"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="99898372"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 04:38:20 -0700
X-CSE-ConnectionGUID: 5LRS2+tnSEKCFI+wYxS6OA==
X-CSE-MsgGUID: uZ9icDdpRjaEznkloO3ApQ==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.158])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 04:38:18 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, ville.syrjala@linux.intel.com,
 matthew.d.roper@intel.com, shawn.c.lee@intel.com
Subject: Re: [PATCH v2] drm/i915/display: update to the BW buddy configuration
In-Reply-To: <20260616184131.295013-1-vinod.govindapillai@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260616184131.295013-1-vinod.govindapillai@intel.com>
Date: Wed, 17 Jun 2026 14:38:15 +0300
Message-ID: <4abfacf0bf38d230f5b5ed6236d2f28cd9a77f3e@intel.com>
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

On Tue, 16 Jun 2026, Vinod Govindapillai <vinod.govindapillai@intel.com> wrote:
> Bspec has been updated for xe2_lpd+ platforms on how to handle
> the bw buddy prgramming in case no matching memory configuration
> is found w.r.t the current page mask table. The recommendation
> is to keep the default settings for the related registers as it
> is without explicitly disabling the bw buddy.
>
> v2: removed extra explanation
>
> Bspec: 68871
> Suggested-by: Ville Syrjala <ville.syrjala@intel.com>
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_power.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
> index 2e51dfcd5dce..3d348c5decee 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_power.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_power.c
> @@ -1634,9 +1634,12 @@ static void tgl_bw_buddy_init(struct intel_display *display)
>  	if (table[config].page_mask == 0) {
>  		drm_dbg_kms(display->drm,
>  			    "Unknown memory configuration; disabling address buddy logic.\n");

The debug logging becomes misleading for display >= 20.

BR,
Jani.

> -		for_each_set_bit(i, &abox_mask, BITS_PER_TYPE(abox_mask))
> -			intel_de_write(display, BW_BUDDY_CTL(i),
> -				       BW_BUDDY_DISABLE);
> +
> +		if (DISPLAY_VER(display) < 20) {
> +			for_each_set_bit(i, &abox_mask, BITS_PER_TYPE(abox_mask))
> +				intel_de_write(display, BW_BUDDY_CTL(i),
> +					       BW_BUDDY_DISABLE);
> +		}
>  	} else {
>  		for_each_set_bit(i, &abox_mask, BITS_PER_TYPE(abox_mask)) {
>  			intel_de_write(display, BW_BUDDY_PAGE_MASK(i),

-- 
Jani Nikula, Intel
