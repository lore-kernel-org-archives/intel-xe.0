Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0616C25B7E
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 08:03:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7064610E42C;
	Tue,  4 Jun 2024 08:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GALynr/O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D7B10E42C
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jun 2024 08:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717488237; x=1749024237;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=GHdIZSf0JKn/Cefyisx+KQn4jbH3c0JuomH3yd3uZ/4=;
 b=GALynr/OMFo9XC5c4Rc/XKbBwDtr+Z1FwsQFnw/Nc2nXfjkzQCfg2kY+
 lOpeYFQLnNI/3FXxz0ysIYBJp0uSZsVObNpWavOqS6m0+LI0aVP1Kfnp2
 8Fnvm//JwEoE5CTYm4KADJ607sJTm/9eBwTx0yIOZFJt+NTRVKvrPAJtO
 ubxEZsF4VmLX27GxtU+ftmCvJuYjYpezNBtI0/IvFEK1rkfzo4oCK9N74
 iUUHge+KX70b8hiryXJJSVdAbhkQKJwgRxvfEmsobOLo6nBFwolylFLWc
 1DSulKGDaJJkoSVRD81lhSFyUb8iNktvb0OMkVBoqE68fh9U0ctzc0K2s A==;
X-CSE-ConnectionGUID: 9UObihizT6GYCYLHMtZKrg==
X-CSE-MsgGUID: USy0tqRFRTqMVxh/tjvKzA==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="13824584"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="13824584"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 01:03:56 -0700
X-CSE-ConnectionGUID: 7fsmIUo0QAaBr+xec+YPGQ==
X-CSE-MsgGUID: NIMsWpi0S/mRLQDAsU3VhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="68330381"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.102])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 01:03:54 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: gregory.f.germano@intel.com, Vitasta Wattal <vitasta.wattal@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>
Subject: Re: [PATCH] drm/xe/bmg: Add PCI IDs
In-Reply-To: <20240603145430.1260817-1-balasubramani.vivekanandan@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240603145430.1260817-1-balasubramani.vivekanandan@intel.com>
Date: Tue, 04 Jun 2024 11:03:51 +0300
Message-ID: <87mso1cexk.fsf@intel.com>
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

On Mon, 03 Jun 2024, Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com> wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
>
> Add the initial set of device IDs for Battlemage.
>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Please note that since commit 54836ee194f9 ("drm/i915/display: change
display probe to identify GMD ID based platforms") you'll also need to
add the PCI IDs to i915_pciids.h and add the platform desc in
i915/display/intel_display_device.c for display probe.

BR,
Jani.

> ---
>  drivers/gpu/drm/xe/xe_pci.c   | 3 ++-
>  include/drm/intel/xe_pciids.h | 7 +++++++
>  2 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 5655222aa4e1..ebff5ea79b1d 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -340,7 +340,7 @@ static const struct xe_device_desc lnl_desc = {
>  	.require_force_probe = true,
>  };
>  
> -static const struct xe_device_desc bmg_desc __maybe_unused = {
> +static const struct xe_device_desc bmg_desc = {
>  	DGFX_FEATURES,
>  	PLATFORM(BATTLEMAGE),
>  	.has_display = true,
> @@ -391,6 +391,7 @@ static const struct pci_device_id pciidlist[] = {
>  	XE_PVC_IDS(INTEL_VGA_DEVICE, &pvc_desc),
>  	XE_MTL_IDS(INTEL_VGA_DEVICE, &mtl_desc),
>  	XE_LNL_IDS(INTEL_VGA_DEVICE, &lnl_desc),
> +	XE_BMG_IDS(INTEL_VGA_DEVICE, &bmg_desc),
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(pci, pciidlist);
> diff --git a/include/drm/intel/xe_pciids.h b/include/drm/intel/xe_pciids.h
> index c7fc288dacee..73d972a8aca1 100644
> --- a/include/drm/intel/xe_pciids.h
> +++ b/include/drm/intel/xe_pciids.h
> @@ -208,4 +208,11 @@
>  	MACRO__(0x64A0, ## __VA_ARGS__), \
>  	MACRO__(0x64B0, ## __VA_ARGS__)
>  
> +#define XE_BMG_IDS(MACRO__, ...) \
> +	MACRO__(0xE202, ## __VA_ARGS__), \
> +	MACRO__(0xE20B, ## __VA_ARGS__), \
> +	MACRO__(0xE20C, ## __VA_ARGS__), \
> +	MACRO__(0xE20D, ## __VA_ARGS__), \
> +	MACRO__(0xE212, ## __VA_ARGS__)
> +
>  #endif

-- 
Jani Nikula, Intel
