Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A7710ED643
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 09:48:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C3010ED42;
	Fri, 27 Mar 2026 09:48:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jij1Cq54";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E0E710ED41;
 Fri, 27 Mar 2026 09:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774604915; x=1806140915;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=/JIwlO4nTsmvvSG+E65J95ghv5fNU/TrmxOeRrQxHzY=;
 b=Jij1Cq54+trD8IN1uIbz7hJTLSLRZdF5BYibc01YdcI5qC8weUEjjXRo
 TUoaiZXMBoPL+58hJUF++md7MT+Te0HnLHEO6/0FRqV1L8cwuGV5UXyeA
 FPqWEY+UbuSFgxTEzTJWKOvx/bwUjsWIercpFtNiO+ebeEzYsHYPJtLuq
 5NCvp3/D4R+t/YFSiaJ2/92hW6xsL3To5N6U2pX9VpwqV+P6Zd0aisOQZ
 nAPRjVK/PccnvVIXYJumpPhZUamXRHPRADmYLQyz9eo9s2BLj/JnaHFVy
 gODLDSxGSFWTQl7HZYKtYo2rXZaIJjIbPBrEbzm95sMU61G/l/d7cwD7N A==;
X-CSE-ConnectionGUID: wUz2wqovTVeeMN+bDo9dWw==
X-CSE-MsgGUID: yevknxkDQPK+y1QYgj7FyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="101135312"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; d="scan'208";a="101135312"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 02:48:34 -0700
X-CSE-ConnectionGUID: +a2WscDKSnqf0uvtNhz0JQ==
X-CSE-MsgGUID: rtbIa0/5QjmELAeXcB/kLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; d="scan'208";a="222394480"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 02:48:34 -0700
Date: Fri, 27 Mar 2026 10:48:32 +0100 (CET)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Nemesa Garg <nemesa.garg@intel.com>
Subject: Re: [PATCH 8/9] drm/i915/pfit: Call intel_pfit_compute_config()
 unconditionally on (e)DP/HDMI
In-Reply-To: <20260326223139.19116-9-ville.syrjala@linux.intel.com>
Message-ID: <c84bfc6d-628d-570c-501e-8237e9f80e3c@intel.com>
References: <20260326223139.19116-1-ville.syrjala@linux.intel.com>
 <20260326223139.19116-9-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1443810664-1774604914=:356608"
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

--8323329-1443810664-1774604914=:356608
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 26 Mar 2026, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> We now have three different reasons for calling
> intel_pfit_compute_config():
> - actual pfit scaling/centering
> - YCbCr 4:2:0 output
> - sharpness filter
>
> So let's just all the intel_pfit_compute_config() from

typo: s/all/call/

> both the DP and HDMI code. Both gmch and ilk+ pfit code
> should be capable of judging whether anything actually
> needs the pfit.
>
> The only slightly questionable thing in the gmch code is
> the dithering knob, but that's only a thing on gen2/3 which
> don't even have HDMI/DP outputs, and so not an issue here.
>
> Cc: Nemesa Garg <nemesa.garg@intel.com>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Michał Grzelak <michal.grzelak@intel.com>

BR,
Michał
--8323329-1443810664-1774604914=:356608--
