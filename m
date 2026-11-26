Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE16606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 17:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HDp4ELLq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D05E011263D;
	Thu, 26 Nov 2026 17:37:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A430112356;
 Thu, 26 Nov 2026 17:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795714624; x=1827250624;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=QcFTfyb34G4hnDe1ZANT0JG0JNox67y0juLeRA0HLAU=;
 b=HDp4ELLqK3kreItcOjRuhAwqk4+aMBXHjKdNsZ+8IpKNopQF5eUFJtPK
 b33cEI8fwQ1zByyUQfM36LsXPRJhmBa2oKleNNLmqb0wzCrDpXQnGobFh
 22CBjg64YHns7NK8hojT24lYXFzjICv1Pz6JdmznaiMCyGPnQHEafl/Ag
 v0Tc/TibqRaBk6qhBjYSGsMVZts4mrBzdeCIx+nY/rYCqBkLUtnqT+Opm
 sIEsedy8V4kXb0uQ5NW9xJzYWsHsayIOdOV7reRizmH6oAubH8hXM+jO/
 GgYyXMBF4c1KlrVByV53O6f2UbMB+6ML2CPmw7bncuRvw42YuySds3PHl Q==;
X-CSE-ConnectionGUID: JPDQOr3rS0miAMqQ0hnHRA==
X-CSE-MsgGUID: lpLSArngSGaTjXTvW6AqRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4514220"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4514220"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 09:37:03 -0800
X-CSE-ConnectionGUID: niGXRtRsR8yYFYeJIGtgZw==
X-CSE-MsgGUID: FV5a44ORQxi+VxfgIiPt6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12380611"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.221])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 09:37:03 -0800
Date: Thu, 26 Nov 2026 19:36:58 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe: remove unused fake uncore lock
Message-ID: <awhuOnl0kFqDBqOS@intel.com>
References: <20261124134850.1520247-1-jani.nikula@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261124134850.1520247-1-jani.nikula@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 03:48:50PM +0200, Jani Nikula wrote:
> The xe fake uncore lock usage was removed in commit 527a438bf738
> ("drm/i915/de: Introduce display->mmio.lock"). Remove the lock too.
> 
> Keep the now empty uncore sub-struct in struct xe_device for a while
> longer, as we're still using container_of() to get from the uncore
> pointer to xe_device in the xe compat uncore code.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/xe/display/xe_display.c | 3 ---
>  drivers/gpu/drm/xe/xe_device_types.h    | 1 -
>  2 files changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index 0236f69a0f88..b1a6008bf15c 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -85,9 +85,6 @@ int xe_display_init_early(struct xe_device *xe)
>  	if (!xe->info.probe_display)
>  		return 0;
>  
> -	/* Fake uncore lock */
> -	spin_lock_init(&xe->uncore.lock);
> -
>  	intel_display_driver_early_probe(display);
>  
>  	intel_display_device_info_runtime_init(display);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 8f2a31949073..f624c717aebf 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -637,7 +637,6 @@ struct xe_device {
>  	 */
>  
>  	struct intel_uncore {
> -		spinlock_t lock;
>  	} uncore;
>  #endif
>  };
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
