Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8369DCD5BB8
	for <intel-xe@archiver.kernel.org>; Sat, 23 May 2026 19:31:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B7E10E110;
	Sat, 23 May 2026 19:31:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d/WCmwMl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B90A10E104;
 Sat, 23 May 2026 19:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779564689; x=1811100689;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=/iGspXgC7ZDHSV1foM2oyEdGZm85AZPgaD8Rt1zViX0=;
 b=d/WCmwMlC0nRhz/CESfHsZhKUX1lVtvC/CSV/BhAWYtBVQ3FWVgOw7nf
 7H+amFaTP8YIZw4StQenYh7pNP9bzNzgkAn//aEttcIrJiIutLtChuWAK
 cz8to93Wb8oMFiYinmSbGJICwiE3bgUm7XUnWtAowmetRA40vnUawJQQ+
 IGGTvsBU6XWOJCMCS5rU6a0p91gi+c0EVSY8YFVOWW0Y/y5f7AztlX3cb
 NXvlEln8krnsipWaw6Lp18oApXS+SUWz3XhE0ZRR/40r0df9UUMPCkiwD
 4L1nvzIOPHq/MzVPHP8r9qDAwaftbRj/eMwbWgwZ33vuHB7z0ueM5hHTN A==;
X-CSE-ConnectionGUID: cz7FTtjfT3qV84Q8ThsBmA==
X-CSE-MsgGUID: oKNGtsxoRnSnCP8RU1p/3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="105915696"
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; d="scan'208";a="105915696"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2026 12:31:29 -0700
X-CSE-ConnectionGUID: YbKnvG0jTJ2Rj2UJDLq9bw==
X-CSE-MsgGUID: luSURWn6TG+PiDPrA8gTGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; d="scan'208";a="241418551"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2026 12:31:26 -0700
Date: Sat, 23 May 2026 21:31:25 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 04/10] drm/i915/bw: Fix 'deinterleave' rounding direction
In-Reply-To: <20260522200346.17377-5-ville.syrjala@linux.intel.com>
Message-ID: <6c2864e4-3477-cfc2-82dc-449c0c2d4452@intel.com>
References: <20260522200346.17377-1-ville.syrjala@linux.intel.com>
 <20260522200346.17377-5-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="8323329-1626585555-1779532671=:1544314"
Content-ID: <55158c0e-f24a-1f8e-dd62-03ec8b6cabc2@intel.com>
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

--8323329-1626585555-1779532671=:1544314
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <a4a9d843-0995-099a-47b9-ca0e796968ce@intel.com>

On Fri, 22 May 2026, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> For some reason we're rounding up when calcualting the deinterleave

s/calcualting/calculating

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³

> value. But the spec says we should round down. Fix it.
>
> But I suppose this doesn't actually matter since the deinterleave
> values should always be power of two. The only exception is therefore
> the deinterleave==1 case, which gets handled by the max(..., 1).
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
> drivers/gpu/drm/i915/display/intel_bw.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
> index bbaafcc1b6be..da294c1722b1 100644
> --- a/drivers/gpu/drm/i915/display/intel_bw.c
> +++ b/drivers/gpu/drm/i915/display/intel_bw.c
> @@ -607,7 +607,7 @@ static int tgl_get_bw_info(struct intel_display *display,
> 	qi.deinterleave = qi.deinterleave ? : DIV_ROUND_UP(num_channels, is_y_tile ? 4 : 2);
>
> 	if (num_channels < qi.max_numchannels && DISPLAY_VER(display) >= 12)
> -		qi.deinterleave = max(DIV_ROUND_UP(qi.deinterleave, 2), 1);
> +		qi.deinterleave = max(qi.deinterleave / 2, 1);
>
> 	if (DISPLAY_VER(display) >= 12 && num_channels > qi.max_numchannels)
> 		drm_warn(display->drm, "Number of channels exceeds max number of channels.");
> -- 
> 2.52.0
>
>
--8323329-1626585555-1779532671=:1544314--
