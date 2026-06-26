Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27077CD4F26
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jun 2026 07:48:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D863810E31A;
	Fri, 26 Jun 2026 07:48:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hCDA52NK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1758D10E31A;
 Fri, 26 Jun 2026 07:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782460097; x=1813996097;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=siPuG3qtDuR2mX/9xs387a7uvoOm0ztGnIno3erBd2s=;
 b=hCDA52NKT9Unj9Mz8sin2ZBOhNedIVTOPy2fV7/7CeYzWAamaD0hz5W1
 j+1ldxFMZZCRxLiObfxQuzQROjO9LJGohf7UJmGTyayxPsQ6WjhbtliYw
 znv52cw30FI91BvbNDyhEi7BsOaQsMh/MQqRiUPIowz3P+StrJIDm7YKH
 WDXEbz3tKHiDYNEPjuBMbBc/saIUNKsPv78qK70e9j4ZYa1+tPysb4yOT
 ptrCVFkocLDTTJ1zJQDb5FRk1sj140Wv0tVuQb8mZM0oL7Sf1bJFkjTPY
 dcfhoyst7sAk5u9hFpkdjjUIzvEAREWz58wxUgXwIbXZGRAhpxO6G92Su A==;
X-CSE-ConnectionGUID: mgVVJ50dRleGCUG9+F0rgA==
X-CSE-MsgGUID: M+zUrk0dROipOnMIKUpkxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="108799026"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="108799026"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 00:48:16 -0700
X-CSE-ConnectionGUID: p3jMWxyXRnGpGRybgIUvNw==
X-CSE-MsgGUID: PeCt/gEzR+K/eXoEkiwWRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="253181800"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 00:48:16 -0700
Date: Fri, 26 Jun 2026 09:48:13 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 5/6] drm/{i915, xe}: move opregion cleanup to
 intel_display_driver_remove_nogem()
In-Reply-To: <8ccd49a5945e0560ba22079d686db1268e8e9f7f.1781549229.git.jani.nikula@intel.com>
Message-ID: <7e5883c3-d4d5-fe72-35c9-c72350456ee7@intel.com>
References: <cover.1781549229.git.jani.nikula@intel.com>
 <8ccd49a5945e0560ba22079d686db1268e8e9f7f.1781549229.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-928124701-1782460096=:605841"
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

--8323329-928124701-1782460096=:605841
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 15 Jun 2026, Jani Nikula wrote:
> The intel_opregion_cleanup() call should really be in display. Move it
> at the end of intel_display_driver_probe_noirq().
>
> For xe, this is a completely non-functional change now that the
> noirq/nogem cleanup calls are in the right order.
>
> For i915, this only changes the relative order of
> intel_opregion_cleanup() and i915_perf_fini(), which should be of no
> consequence.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³

> ---
> drivers/gpu/drm/i915/display/intel_display_driver.c | 2 ++
> drivers/gpu/drm/i915/i915_driver.c                  | 3 ---
> drivers/gpu/drm/xe/display/xe_display.c             | 1 -
> 3 files changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
> index 15a61f171d73..a1c91fbf737c 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_driver.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
> @@ -662,6 +662,8 @@ void intel_display_driver_remove_nogem(struct intel_display *display)
> 	intel_display_power_driver_remove(display);
>
> 	intel_bios_driver_remove(display);
> +
> +	intel_opregion_cleanup(display);
> }
>
> void intel_display_driver_unregister(struct intel_display *display)
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index 05fdcba7b2dc..68ab96b8195b 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -586,13 +586,10 @@ ALLOW_ERROR_INJECTION(i915_driver_hw_probe, ERRNO);
>  */
> static void i915_driver_hw_remove(struct drm_i915_private *dev_priv)
> {
> -	struct intel_display *display = dev_priv->display;
> 	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
>
> 	i915_perf_fini(dev_priv);
>
> -	intel_opregion_cleanup(display);
> -
> 	pci_disable_msi(pdev);
> }
>
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index 0d93784754c1..8be3e600838b 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -84,7 +84,6 @@ static void xe_display_fini_early(void *arg)
> 	intel_hpd_cancel_work(display);
> 	intel_display_driver_remove_noirq(display);
> 	intel_display_driver_remove_nogem(display);
> -	intel_opregion_cleanup(display);
> 	intel_display_power_cleanup(display);
> }
>
> -- 
> 2.47.3
>
>
--8323329-928124701-1782460096=:605841--
