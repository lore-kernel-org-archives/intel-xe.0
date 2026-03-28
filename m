Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5FF310F3DE9
	for <intel-xe@archiver.kernel.org>; Sat, 28 Mar 2026 16:30:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D04910EFD4;
	Sat, 28 Mar 2026 16:30:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bK2t/jqj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B73D010EFCF;
 Sat, 28 Mar 2026 16:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774715437; x=1806251437;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=iRcr7p7TIWrIrT6vJ5nikcYcaK//I/3BXBTJ41hjWeg=;
 b=bK2t/jqjl4ZMjolQegjx6gS28oqVa//iv8jf3KcIWVmbJDY0ROzpQnsu
 goyALrWQF2ReZqQ+WYMGM5ephGeMoiEkql2+jz7xNe4z/l1BUPiZRNcbJ
 BzpNhdj5TMbjyKvP3Bsu8l+7W+Q9wycTfVc21OOkKoQ70dZu9NWw7ybGC
 NQK+SpBRrQdbwQ0osa/O6Mg8z7PUuanh03ZVkQd/15CNEApnekid5Y3m4
 T1QxMjJHoz4oUe3V9U52NnCDKvp//zMdbauLTCwBeKvGJ1SNF3vjKFqkt
 6EZUEb+YmQROZy0vnzFr6htMlT08dAyThGtPHVLjPqTkhaQ1WnkDL3wUF w==;
X-CSE-ConnectionGUID: xQLB6M2oTLeO2nIsG4mURA==
X-CSE-MsgGUID: 4qcMeADDRVSPl9xmSrbv+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="74947562"
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; d="scan'208";a="74947562"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2026 09:30:37 -0700
X-CSE-ConnectionGUID: CdoFGhZ8RP+Jh3eeYGVu2w==
X-CSE-MsgGUID: rUhidBJlSyqRxLYlpvFDfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; d="scan'208";a="230074010"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2026 09:30:35 -0700
Date: Sat, 28 Mar 2026 17:30:33 +0100 (CET)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Luca Coelho <luciano.coelho@intel.com>
Subject: Re: [v2,2/9] drm/i915/scaler: Adjust pipe scaler scale factors for
 4:2:0 ouput
In-Reply-To: <20251029084647.4165-3-ville.syrjala@linux.intel.com>
Message-ID: <b5cc9b5d-37f3-f3df-5319-ca1efab873cd@intel.com>
References: <20251029084647.4165-3-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1429774218-1774715436=:601923"
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

--8323329-1429774218-1774715436=:601923
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

Nit: title: s/ouput/output/

On Wed, 29 Oct 2025, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> 4:2:0 output effectively involves an extra downscale factor of
> 2x2 due to the chroma downsampling. Adjust the stored scaler
> scale factors accodingly.

Even nitter nit: s/accodingly/accordingly

If this was already pushed then please disregard the comment.

Reviewed-by: Michał Grzelak <michal.grzelak@intel.com>

BR,
Michał

>
> Reviewed-by: Luca Coelho <luciano.coelho@intel.com>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
> drivers/gpu/drm/i915/display/skl_scaler.c | 9 +++++++++
> 1 file changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
> index 640c65818f8a..e8a8facdc300 100644
> --- a/drivers/gpu/drm/i915/display/skl_scaler.c
> +++ b/drivers/gpu/drm/i915/display/skl_scaler.c
> @@ -499,6 +499,15 @@ static int intel_atomic_setup_scaler(struct intel_crtc_state *crtc_state,
>
> 			return -EINVAL;
> 		}
> +
> +		/*
> +		 * For the purposes of prefill 4:2:0 chroma
> +		 * subsampling is considered a 2x2 downscale.
> +		 */
> +		if (crtc_state->output_format == INTEL_OUTPUT_FORMAT_YCBCR420) {
> +			hscale <<= 1;
> +			vscale <<= 1;
> +		}
> 	}
>
> 	scaler_state->scalers[*scaler_id].hscale = hscale;
>
--8323329-1429774218-1774715436=:601923--
