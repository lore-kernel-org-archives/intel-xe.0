Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19015C43327
	for <intel-xe@archiver.kernel.org>; Thu,  2 Jul 2026 15:50:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A16B310F4C0;
	Thu,  2 Jul 2026 15:50:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hnc37yJs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD50210F4A5;
 Thu,  2 Jul 2026 15:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783007425; x=1814543425;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=pZBRFryFAMj/reTfghpbggtXrocNDS7CrxAInItgCtc=;
 b=Hnc37yJsqn9gD6mQf94Gladx0TLOvswyr2cCI3hb9rFPUBeD1cNhckrw
 Tm29z9YngOr7Nmbp+OWplKvBQ8o1GVJXNLs8MHjWCPTsAteGI7hhYtY4H
 UNX12tbvfLYYVz3LsoJzkEX25tvZxOrxRBcvCtuojvEee0gpuY8UmKHlu
 XZF7PsOxOkUKXvPA6y8OFB+RCv2x0DdAMF75aMDrv9gDa2FHyXXOFmXnR
 y+ZhrN/2HqFkDq/zxLt/2089DI8WiyrymPw2GWj1ZygKtNuifClVWHzG0
 y2nV7ZPswOdqNT9abQKgn413FoHonMpjbqlUaKe5LJqBRvceetLPS51zN A==;
X-CSE-ConnectionGUID: vfsGI5E9RkCS+kIqwgNOAQ==
X-CSE-MsgGUID: laNfaxv+TNGvNaQitXxgeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="94919849"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; d="scan'208";a="94919849"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 08:50:25 -0700
X-CSE-ConnectionGUID: EcR+EufuQEW0zrLurpguBQ==
X-CSE-MsgGUID: EHLUPoofRea97+roMHBH2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; d="scan'208";a="253049976"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.43])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 08:50:22 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com, suraj.kandpal@intel.com, Ankit Nautiyal
 <ankit.k.nautiyal@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH] Revert "drm/i915/psr: Allow SCL=0 on platforms with
 always-on VRR TG"
In-Reply-To: <20260622101736.2389991-1-ankit.k.nautiyal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260622101736.2389991-1-ankit.k.nautiyal@intel.com>
Date: Thu, 02 Jul 2026 18:50:19 +0300
Message-ID: <51f6951d566ceda03eb47402904f8fe91c7a9f38@intel.com>
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

On Mon, 22 Jun 2026, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
> This reverts commit 4f1cab2e4863d96ce13b8d94151f4848e38c3d5b.
>
> Allowing SCL=0 on platforms with always-on VRR timing generator is
> causing underruns and other issues on PTL in some cases.
>
> SCL still needs to be non-zero in certain scenarios. Revert for now
> until this is better understood.
>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

This would've needed

Fixes: 4f1cab2e4863 ("drm/i915/psr: Allow SCL=0 on platforms with always-on VRR TG")

to have it be picked up for v7.2-rc2. Please talk to Joonas to ensure it
gets picked up for -rc3.

BR,
Jani.

> ---
>  drivers/gpu/drm/i915/display/intel_psr.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
> index 911afb9cb24e..92af21d823a3 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr.c
> +++ b/drivers/gpu/drm/i915/display/intel_psr.c
> @@ -1405,9 +1405,6 @@ int _intel_psr_min_set_context_latency(const struct intel_crtc_state *crtc_state
>  	    needs_panel_replay)
>  		return 0;
>  
> -	if (intel_vrr_always_use_vrr_tg(display))
> -		return 0;
> -
>  	return 1;
>  }

-- 
Jani Nikula, Intel
