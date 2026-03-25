Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F901106B519
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 12:23:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 022F010E6E3;
	Wed, 25 Mar 2026 12:23:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MyOdzKvD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E82F210E6E3;
 Wed, 25 Mar 2026 12:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774441408; x=1805977408;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=SXzqTzJQD3TxxDQXtWXF4HyijregFhsdrNqLWjzCalM=;
 b=MyOdzKvDF3v4/Jek9Loi8BCH4AbuU5yvHf1hW9w7wRMXGogpszNrLJTE
 8W4hzXbXiUlmNL82rc2KLO2aygGfvCF38YRnpJhuT9YLHkayVUzUM6JAY
 DouwSaJNtx9+epfC161RSX1MS/R+5FLxasLZWXG1VSYSAUpjpgMceku8J
 SJYn51JHD9Nl+rXBaH2Pp93i5Ufg0UcLbI8lFFVYHP/4x+43KCEvE7z/I
 Im8OV94ua/ci7guZ97yDkWqqGBrM8BuGOPF5Dp6cYp1bliNcgnpmFXseS
 7Gpv6+lq+1kFL4pS4XZR6yqah/lovz9cWXLCbWwWaQTFR+H67UieRbRdw g==;
X-CSE-ConnectionGUID: d0Gct3XFTGOIMRgU4y5p9Q==
X-CSE-MsgGUID: hMs1hdJlS62+tVTgrYjgjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75666236"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="75666236"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 05:23:27 -0700
X-CSE-ConnectionGUID: GTO3ZVTMR/Wy582Wb6aZow==
X-CSE-MsgGUID: oWc4N53vQWGY4lXgG2wuJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="229599417"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.117])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 05:23:24 -0700
Date: Wed, 25 Mar 2026 14:23:21 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 sowmiya.s@intel.com, uma.shankar@intel.com, swati2.sharma@intel.com,
 chaitanya.kumar.borah@intel.com, arun.r.murthy@intel.com
Subject: Re: [PATCH v3 14/26] drm/i915/writeback: Define function to destroy
 writeback connector
Message-ID: <acPTufY6SO5nWnh0@intel.com>
References: <20260325110744.1096786-1-suraj.kandpal@intel.com>
 <20260325110744.1096786-15-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260325110744.1096786-15-suraj.kandpal@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Wed, Mar 25, 2026 at 04:37:32PM +0530, Suraj Kandpal wrote:
> Define function to destroy the drm_writbeack_connector and
> drm_connector associated with it.
> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_writeback.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_writeback.c b/drivers/gpu/drm/i915/display/intel_writeback.c
> index e677cdfa6207..86b53e4603ae 100644
> --- a/drivers/gpu/drm/i915/display/intel_writeback.c
> +++ b/drivers/gpu/drm/i915/display/intel_writeback.c
> @@ -161,6 +161,12 @@ intel_writeback_detect(struct drm_connector *connector,
>  	return connector_status_connected;
>  }
>  
> +static void intel_writeback_connector_destroy(struct drm_connector *connector)
> +{
> +	drm_connector_cleanup(connector);
> +	kfree(connector);
> +}

Please squash with the patch that added the init/allocation.

> +
>  static const struct drm_encoder_funcs drm_writeback_encoder_funcs = {
>  	.destroy = drm_encoder_cleanup,
>  };
> @@ -170,6 +176,7 @@ const struct drm_connector_funcs conn_funcs = {
>  	.fill_modes = drm_helper_probe_single_connector_modes,
>  	.atomic_duplicate_state = intel_digital_connector_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +	.destroy = intel_writeback_connector_destroy,
>  };
>  
>  static const struct drm_connector_helper_funcs conn_helper_funcs = {
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
