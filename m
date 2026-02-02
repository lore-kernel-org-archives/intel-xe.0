Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5E5E7DEF7
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 15:59:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A1D810E501;
	Mon,  2 Feb 2026 15:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bLnWEpOr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D4F710E2C7;
 Mon,  2 Feb 2026 15:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770047946; x=1801583946;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=now4Clu5N5gbAmnGKtrYocKeik7ZL8yAoJiN5ItWphU=;
 b=bLnWEpOrza1OtdlyLLXj7u+imeP4DxzenyOGK88LNhLV3r3LqkhIlij8
 Oow5IPIweFQm225ig1v7nyVUnrsSA6UskS77LlvEi48BzQDM/QixP/i1c
 H4m7COCi75ECEH+JTnntefduNMYgYU2adJcoQP/nPipaXtC4CGlz5Lr/9
 lhbPaehBtUaidIBP+stHHawJU3tIo1JUXgOgFhPCnzdyMiIOnsD7bjOOZ
 EZ5mFq//p3bAFn+dtRe9Q3e0AQgupX8+FM3lmD8Dv70UqLiuPODMmDTHC
 Gl2M5OML8jUmvEMVZoTD6XjAKvqBtX+ulBXANz+fhX/gxpQMj/kwG1YPw g==;
X-CSE-ConnectionGUID: 58G7Bf7KQJK5iNpMUJMyvA==
X-CSE-MsgGUID: NUEC0t+TTiiJPnFkpGpOhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="81520585"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="81520585"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 07:59:06 -0800
X-CSE-ConnectionGUID: CxVZ3B3lQhyFzkUHijMUkg==
X-CSE-MsgGUID: PgYHqFNRQDORji0fP00lVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="213671687"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.247])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 07:59:04 -0800
Date: Mon, 2 Feb 2026 17:59:01 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jouni.hogander@intel.com,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Subject: Re: [PATCH 1/4] drm/i915/dp: Fix readback for target_rr in Adaptive
 Sync SDP
Message-ID: <aYDJxSzXFI3nmyqB@intel.com>
References: <20251111093007.3771409-1-ankit.k.nautiyal@intel.com>
 <20251111093007.3771409-2-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251111093007.3771409-2-ankit.k.nautiyal@intel.com>
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

On Tue, Nov 11, 2025 at 03:00:04PM +0530, Ankit Nautiyal wrote:
> Correct the bit-shift logic to properly readback the 10 bit target_rr from
> DB3 and DB4.
> 
> v2: Align the style with readback for vtotal. (Ville)
> 
> Fixes: 12ea89291603 ("drm/i915/dp: Add Read/Write support for Adaptive Sync SDP")
> Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 0ec82fcbcf48..92a553a76b57 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4997,7 +4997,7 @@ int intel_dp_as_sdp_unpack(struct drm_dp_as_sdp *as_sdp,
>  	as_sdp->length = sdp->sdp_header.HB3 & DP_ADAPTIVE_SYNC_SDP_LENGTH;
>  	as_sdp->mode = sdp->db[0] & DP_ADAPTIVE_SYNC_SDP_OPERATION_MODE;
>  	as_sdp->vtotal = (sdp->db[2] << 8) | sdp->db[1];
> -	as_sdp->target_rr = (u64)sdp->db[3] | ((u64)sdp->db[4] & 0x3);
> +	as_sdp->target_rr = ((sdp->db[4] & 0x3) << 8) | sdp->db[3];
>  	as_sdp->target_rr_divider = sdp->db[4] & 0x20 ? true : false;
>  
>  	return 0;
> -- 
> 2.45.2

-- 
Ville Syrjälä
Intel
