Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91EA2C79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 14:10:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D20810EC12;
	Tue,  8 Sep 2026 14:10:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZFMuxi/+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62AC110EC12;
 Tue,  8 Sep 2026 14:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788876655; x=1820412655;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=B/1K5p3WJGU2CrbI+/NXgUwm1oRIoQkhbMPfoTs3Iqg=;
 b=ZFMuxi/+bA3YmNk96dmwXNG1+P1fQRQw2J/TV60VaZq8lbju+qYpT30x
 3BEyp2tqCyq3sh4+N7gsu/hAqa2j5MbNse3EckwbhG/qke1t6imRoIpMu
 gt8IlaRgDYn/ESkfizWaQgDeK7TEwd0Gsw6E1Sx9lufaKfIogh81B5otw
 BhplINoTh6nDdrpwCRlS0EmfMge4aqcZbWUQOJ/ozy6/p60SymHtOAmWJ
 lnaUYngVca27ZQlMC+yW37eWVf8eNtHaq/l4MxULzwPi/SXJO/hV0B9x1
 rgQ5UBBMlHZn64UICHVRoVN96WJFarzt9e8BJKbzJy6bhxVTBYD+yOOfY w==;
X-CSE-ConnectionGUID: JyN930SMRZuAPLY+r+3l0Q==
X-CSE-MsgGUID: wOyyiBhQQCKwI0rYhogb7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="88429074"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="88429074"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 07:10:55 -0700
X-CSE-ConnectionGUID: TB1m8VxvQfGIpKiHqdJ8sg==
X-CSE-MsgGUID: LG7PCybiQyGEbuCnKn4Dpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="268451291"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.140])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 07:10:54 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: suraj.kandpal@intel.com
Subject: Re: [PATCH v3 1/1] drm/i915/display: Implement Wa_16024710867
In-Reply-To: <20260203084937.1447834-2-mitulkumar.ajitkumar.golani@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260203084937.1447834-1-mitulkumar.ajitkumar.golani@intel.com>
 <20260203084937.1447834-2-mitulkumar.ajitkumar.golani@intel.com>
Date: Tue, 08 Sep 2026 17:10:51 +0300
Message-ID: <9eeb256c9e8626e7118adb0c58d985ef5d727c69@intel.com>
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

On Tue, 03 Feb 2026, Mitul Golani <mitulkumar.ajitkumar.golani@intel.com> wrote:
> Defeature port sync feature for xe3lpd onwards.
>
> --v1:
> - Use xe3lpd naming (Suraj)
> - Use IS_DISPLAY_VER (Suraj)
>
> --v2:
> - Comments update and Adding Bspec link (Suraj)
>
> Bspec: 69965
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

This regresses [1] and probably needs to be reverted.

BR,
Jani.


[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8991


> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index d8739e2bb004..f92323664162 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -4588,8 +4588,10 @@ intel_ddi_port_sync_transcoders(const struct intel_crtc_state *ref_crtc_state,
>  	/*
>  	 * We don't enable port sync on BDW due to missing w/as and
>  	 * due to not having adjusted the modeset sequence appropriately.
> +	 * From, xe3lpd onwards we have defeatured this with reference to
> +	 * Wa_16024710867
>  	 */
> -	if (DISPLAY_VER(display) < 9)
> +	if (!IS_DISPLAY_VER(display, 9, 20))
>  		return 0;
>  
>  	if (!intel_crtc_has_type(ref_crtc_state, INTEL_OUTPUT_DP))

-- 
Jani Nikula, Intel
