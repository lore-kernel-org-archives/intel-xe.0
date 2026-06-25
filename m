Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFDBECDE001
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 15:28:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A4FC10F30E;
	Thu, 25 Jun 2026 15:28:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mR+mD8iv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9045A10F30E;
 Thu, 25 Jun 2026 15:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782401280; x=1813937280;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=vfCzvBFrq4aqLZUqAlJsgQ9pz1xMZKJQzgI6UmSmEI4=;
 b=mR+mD8iv39CCTKUdUp5Pt6+kTmy+y4gsl2SODq2DTwts3rzPTel3jakx
 WZbBd+tB7g0l5cV6ZoF8C4XyhDfxRybwXhDOrH3SKxjqZTg8tgXEYuzrj
 zT2i9nwSmUHFkhfPClg+ouHvqlT6rtu1V8MsAKQhuYHCMxRXXHz9RyGZM
 x0vavCCWUGQQ3PUdlHs1IjJgcG1wjeG3ZF2W2U2G8N/zHYkbthjL0VIlS
 0bpLgTx40ZgMgAKKyr4cDGoSj3gf62hQOAVVVAKZtRL0Ju+X/KFQ903P4
 mEEeaX7OyIf+Bq2oxVv6drJARWElzVt8r1xM5jjlG/5fY0dHupx2y7Vv3 A==;
X-CSE-ConnectionGUID: EkzuD6E4Sbi+i2BQOKQAlA==
X-CSE-MsgGUID: PbIqhp8QTGiXXI2bxjshgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="83057522"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; d="scan'208";a="83057522"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 08:27:59 -0700
X-CSE-ConnectionGUID: cwTZChLfQoOZDlSBPHTQUA==
X-CSE-MsgGUID: qoEYF/gQQV+BhVfiKIQ0ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; d="scan'208";a="251337583"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 08:27:58 -0700
Date: Thu, 25 Jun 2026 17:27:55 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Martin Hodo <martin.hodo@intel.com>, stable@vger.kernel.org, 
 Animesh Manna <animesh.manna@intel.com>, 
 =?ISO-8859-15?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@intel.com>
Subject: Re: [PATCH] drm/i915/bios: range check LFP Data Block panel_type2
In-Reply-To: <20260625135130.1067872-1-jani.nikula@intel.com>
Message-ID: <37079a8c-8eb7-aaa0-ed21-594f413210a2@intel.com>
References: <20260625135130.1067872-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-253770812-1782401279=:605841"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-253770812-1782401279=:605841
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 25 Jun 2026, Jani Nikula wrote:
> While the panel_type from LFP Data Block is range checked, panel_type2
> is not. Add a few helpers for range checking, and use them to not only
> check panel_type2, but also imrove clarity and correctness in the panel

typo: s/imrove/improve/

> type selection.
>
> Discovered using AI-assisted static analysis confirmed by Intel Product
> Security.
>
> Reported-by: Martin Hodo <martin.hodo@intel.com>
> Fixes: 6434cf630086 ("drm/i915/bios: calculate panel type as per child device index in VBT")
> Cc: <stable@vger.kernel.org> # v6.0+
> Cc: Animesh Manna <animesh.manna@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Michał Grzelak <michal.grzelak@intel.com>

BR,
Michał

> ---
> drivers/gpu/drm/i915/display/intel_bios.c | 29 +++++++++++++++++------
> 1 file changed, 22 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
> index 15ebadc72b88..0c420019e46a 100644
> --- a/drivers/gpu/drm/i915/display/intel_bios.c
> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
> @@ -623,6 +623,16 @@ get_lfp_data_tail(const struct bdb_lfp_data *data,
> 		return NULL;
> }
>
> +static bool is_panel_type_valid(int panel_type)
> +{
> +	return panel_type >= 0 && panel_type < 16;
> +}
> +
> +static bool is_panel_type_valid_or_pnp(int panel_type)
> +{
> +	return is_panel_type_valid(panel_type) || panel_type == 0xff;
> +}
> +
> static int opregion_get_panel_type(struct intel_display *display,
> 				   const struct intel_bios_encoder_data *devdata,
> 				   const struct drm_edid *drm_edid, bool use_fallback)
> @@ -640,15 +650,21 @@ static int vbt_get_panel_type(struct intel_display *display,
> 	if (!lfp_options)
> 		return -1;
>
> -	if (lfp_options->panel_type > 0xf &&
> -	    lfp_options->panel_type != 0xff) {
> +	if (!is_panel_type_valid_or_pnp(lfp_options->panel_type)) {
> 		drm_dbg_kms(display->drm, "Invalid VBT panel type 0x%x\n",
> 			    lfp_options->panel_type);
> 		return -1;
> 	}
>
> -	if (devdata && devdata->child.handle == DEVICE_HANDLE_LFP2)
> +	if (devdata && devdata->child.handle == DEVICE_HANDLE_LFP2) {
> +		if (!is_panel_type_valid_or_pnp(lfp_options->panel_type2)) {
> +			drm_dbg_kms(display->drm, "Invalid VBT panel type 2 0x%x\n",
> +				    lfp_options->panel_type2);
> +			return -1;
> +		}
> +
> 		return lfp_options->panel_type2;
> +	}
>
> 	drm_WARN_ON(display->drm,
> 		    devdata && devdata->child.handle != DEVICE_HANDLE_LFP1);
> @@ -762,13 +778,12 @@ static int get_panel_type(struct intel_display *display,
> 				    panel_types[i].name, panel_types[i].panel_type);
> 	}
>
> -	if (panel_types[PANEL_TYPE_OPREGION].panel_type >= 0)
> +	if (is_panel_type_valid(panel_types[PANEL_TYPE_OPREGION].panel_type))
> 		i = PANEL_TYPE_OPREGION;
> 	else if (panel_types[PANEL_TYPE_VBT].panel_type == 0xff &&
> -		 panel_types[PANEL_TYPE_PNPID].panel_type >= 0)
> +		 is_panel_type_valid(panel_types[PANEL_TYPE_PNPID].panel_type))
> 		i = PANEL_TYPE_PNPID;
> -	else if (panel_types[PANEL_TYPE_VBT].panel_type != 0xff &&
> -		 panel_types[PANEL_TYPE_VBT].panel_type >= 0)
> +	else if (is_panel_type_valid(panel_types[PANEL_TYPE_VBT].panel_type))
> 		i = PANEL_TYPE_VBT;
> 	else
> 		i = PANEL_TYPE_FALLBACK;
> -- 
> 2.47.3
>
>
--8323329-253770812-1782401279=:605841--
