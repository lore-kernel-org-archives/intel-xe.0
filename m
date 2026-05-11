Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5F7CD37BE
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 13:07:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E1E910E706;
	Mon, 11 May 2026 13:07:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g+uiuIcY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71ABC10E706;
 Mon, 11 May 2026 13:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778504843; x=1810040843;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ogYjY741qoQvXqyY4ZUd6kgeJ3h6QvYrCvj0x5HCycI=;
 b=g+uiuIcYfMXA793+pnurXzv8lcKEugiJtDamWfU0rGd5MzPCDwNzvPsH
 p28N8ZUuj9Taazde/8EJE3Y+mxZU+SeCVQSCGEDO8ts/bnMCdqNAJlt1s
 FEq/II8GP56YgZcwu9Zjukw+nWxhSL4hDA9sUuIVybfgs3V6mW/mSsb5E
 k1ioZne8C2UPnxCDfL2MMD8LeZcN1lvvR5CyJpCvMFxO7Q3+3vFBEY2ua
 dF+j3Cupe4irDL2utAEv4SgT4ULrZ+nB0+G9U4IiYhqpi9JxjkRXfWcIZ
 PCFFHUcP97+mL4VOcbBN/bI0vj8HgNG1TLVonItHhnw9dg9xuUdrI1mP6 g==;
X-CSE-ConnectionGUID: n0qOjiWYQCuKw5F5TlbYbA==
X-CSE-MsgGUID: ugLQjx76SDiJoOUiqEa+cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79251035"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="79251035"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 06:07:22 -0700
X-CSE-ConnectionGUID: g5D1RE3KQeOmpFAOPwBAbA==
X-CSE-MsgGUID: OrxaRDV4QNmr823kZNsfrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="239261713"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.50])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 06:07:20 -0700
Date: Mon, 11 May 2026 16:07:17 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 mitulkumar.ajitkumar.golani@intel.com
Subject: Re: [PATCH 3/4] drm/i915/dp: Set sdp_type in AS SDP unpack
Message-ID: <agHUheerJ2lqOtdB@intel.com>
References: <20260511123218.1589830-1-ankit.k.nautiyal@intel.com>
 <20260511123218.1589830-4-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260511123218.1589830-4-ankit.k.nautiyal@intel.com>
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

On Mon, May 11, 2026 at 06:02:17PM +0530, Ankit Nautiyal wrote:
> Add sdp_type in AS SDP unpack. Since the field sdp_type is not compared
> in intel_compare_dp_as_sdp() it doesn't throw up any mismatch error yet.
> 
> In the subsequent change this field will be added along with other missing
> fields for comparison.
> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index fa3b0a1b6bc1..52ee17e9f210 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -5366,6 +5366,7 @@ int intel_dp_as_sdp_unpack(struct drm_dp_as_sdp *as_sdp,
>  	if ((sdp->sdp_header.HB3 & 0x3F) != 9)
>  		return -EINVAL;
>  
> +	as_sdp->sdp_type = sdp->sdp_header.HB1;
>  	as_sdp->length = sdp->sdp_header.HB3 & DP_AS_SDP_LENGTH_MASK;
>  	as_sdp->revision = sdp->sdp_header.HB2;
>  	as_sdp->mode = sdp->db[0] & DP_AS_SDP_OPERATION_MODE_MASK;
> -- 
> 2.45.2

-- 
Ville Syrjälä
Intel
