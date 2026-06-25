Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C179CDE00C
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 22:32:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAEB610F3C7;
	Thu, 25 Jun 2026 22:32:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IX77Gk+A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EFE910F3C6;
 Thu, 25 Jun 2026 22:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782426747; x=1813962747;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=RoZQ7yo0f6ql9S534EkukX/USan0WbtA48/jgUjKhD4=;
 b=IX77Gk+AeZKFE2uBUa/Vtcm/IR9UQphYZVGP/EMQwhDNjwOa7n5ffztY
 RUG5THLdsEETR/NqEfM8yeYjBpTMQUD7SmElLWi2rH49YB/7aYwpcb9ol
 NSU168SOhWzU+7W6exeIIxpSLqifhPrqKoFZYKmLGMdWlrN+VeW4UPK02
 H1dEFh+wM2uisL38g0m1Z7ugaeIx9tSVBpOzJHc4FHV/h5ZXJRofq+fCa
 japBovYPKsebyDuoHQkEyAg1DZDWMB7QIaS8lxhTBKPCPn7RBkoaIYSsK
 NFVfi6MWguWRrnTShHopI8V4bn941u293EHGXaPyLBKtsiKCjQC9MnbcK w==;
X-CSE-ConnectionGUID: RK14J6XsRLSuIpgj3zX7VA==
X-CSE-MsgGUID: G/FlLfPXTGil1qg+3Ls0mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="100774422"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="100774422"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 15:32:26 -0700
X-CSE-ConnectionGUID: rGvusdQnSeOZmFzkbUwHwA==
X-CSE-MsgGUID: 4yP4tTnNT6+o2Gkpfw1/ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="253012046"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 15:32:25 -0700
Date: Fri, 26 Jun 2026 00:32:23 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 1/6] drm/i915: move intel_display_device_probe() call a
 level higher
In-Reply-To: <c97a8790a5cb1f6b10061286adad8148972c5b3b.1781549229.git.jani.nikula@intel.com>
Message-ID: <4fa75253-f400-a127-11e4-e0733c7775ec@intel.com>
References: <cover.1781549229.git.jani.nikula@intel.com>
 <c97a8790a5cb1f6b10061286adad8148972c5b3b.1781549229.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-344787606-1782426746=:605841"
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

--8323329-344787606-1782426746=:605841
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 15 Jun 2026, Jani Nikula wrote:
> Having display probe be called from i915_driver_create() is slightly

to my ear it sounds better with s/be/been/, but am very unsure.

> misleading, and an artefact from the past. Move the
> intel_display_device_probe() call a level higher.
>
> Use the shared PCI disable error path while at it.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³

> ---
> drivers/gpu/drm/i915/i915_driver.c | 19 +++++++++----------
> 1 file changed, 9 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index 0520cd124686..a69eb3a84005 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -802,7 +802,6 @@ i915_driver_create(struct pci_dev *pdev, const struct pci_device_id *ent)
> 	const struct intel_device_info *match_info =
> 		(struct intel_device_info *)ent->driver_data;
> 	struct drm_i915_private *i915;
> -	struct intel_display *display;
>
> 	i915 = devm_drm_dev_alloc(&pdev->dev, &i915_drm_driver,
> 				  struct drm_i915_private, drm);
> @@ -817,12 +816,6 @@ i915_driver_create(struct pci_dev *pdev, const struct pci_device_id *ent)
> 	/* Set up device info and initial runtime info. */
> 	intel_device_info_driver_create(i915, pdev->device, match_info);
>
> -	display = intel_display_device_probe(pdev, &parent);
> -	if (IS_ERR(display))
> -		return ERR_CAST(display);
> -
> -	i915->display = display;
> -
> 	return i915;
> }
>
> @@ -851,11 +844,17 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>
> 	i915 = i915_driver_create(pdev, ent);
> 	if (IS_ERR(i915)) {
> -		pci_disable_device(pdev);
> -		return PTR_ERR(i915);
> +		ret = PTR_ERR(i915);
> +		goto out_pci_disable;
> 	}
>
> -	display = i915->display;
> +	display = intel_display_device_probe(pdev, &parent);
> +	if (IS_ERR(display)) {
> +		ret = PTR_ERR(display);
> +		goto out_pci_disable;
> +	}
> +
> +	i915->display = display;
>
> 	ret = i915_driver_early_probe(i915);
> 	if (ret < 0)
> -- 
> 2.47.3
>
>
--8323329-344787606-1782426746=:605841--
