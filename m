Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D17CDE008
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jun 2026 07:49:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F219E10E31A;
	Fri, 26 Jun 2026 07:49:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IVwuTMjl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE31C10E31A;
 Fri, 26 Jun 2026 07:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782460154; x=1813996154;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=hOYWas3URVRrBb7LGITlzC99DRG/yfe3gkr2jnrg6FM=;
 b=IVwuTMjlK6pH+yu5EBE2U77PROpDIfyzLWWQonlc1B69RiZ1/nreuhjJ
 C3jfSs5eSlI88QsLOPC455E+UaIkjwiEVhSGIfSYgbD6Q6JjXp7rQ3jt9
 IigYUR9GhpQASKnHmk9WLMvybpWdbK4iwlxHhr/jdsNXOAgWHa+Zzs7L7
 ssjAa8W1OgdDybf84uDqp02ahuMKrcmYwzCr1qoInDNsvI3LPIFb5R+SL
 q/FIFSrph/63P38dyJrzy3WLf3iwKuoZCx4yxVlX7P2v/OXGSxJ3ySiBu
 1x8hnxQGAqyfcXpHtbUJ0VBZ4oqpJG0S/GhURK+Hu9SDM+CdRK96KC+HO w==;
X-CSE-ConnectionGUID: 8VMSKZk6SeSjG9Dn3TjiRg==
X-CSE-MsgGUID: A7tiZYfQRtC+QpiY0Uu3Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="94400610"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="94400610"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 00:49:14 -0700
X-CSE-ConnectionGUID: 8Q8adguQSGqBZFX8t4psIg==
X-CSE-MsgGUID: 8xJB3NL1T5yWR0mkgiTBRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="255685278"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 00:49:13 -0700
Date: Fri, 26 Jun 2026 09:49:10 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 6/6] drm/{i915, xe}: move intel_hpd_cancel_work() to
 intel_display_driver_remove_noirq()
In-Reply-To: <6be8d033a6c8d0038dc14100d3ee6612d6204770.1781549229.git.jani.nikula@intel.com>
Message-ID: <93ef2e02-d60e-80f3-f892-30e3b72adcb6@intel.com>
References: <cover.1781549229.git.jani.nikula@intel.com>
 <6be8d033a6c8d0038dc14100d3ee6612d6204770.1781549229.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-843812408-1782460153=:605841"
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

--8323329-843812408-1782460153=:605841
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 15 Jun 2026, Jani Nikula wrote:
> intel_hpd_cancel_work() gets called before
> intel_display_driver_remove_noirq(). Move it there.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³

> ---
> drivers/gpu/drm/i915/display/intel_display_driver.c | 2 ++
> drivers/gpu/drm/i915/i915_driver.c                  | 1 -
> drivers/gpu/drm/xe/display/xe_display.c             | 1 -
> 3 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
> index a1c91fbf737c..bb5301b90231 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_driver.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
> @@ -622,6 +622,8 @@ void intel_display_driver_remove_noirq(struct intel_display *display)
> 	if (!HAS_DISPLAY(display))
> 		return;
>
> +	intel_hpd_cancel_work(display);
> +
> 	intel_display_driver_suspend_access(display);
>
> 	/*
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index 68ab96b8195b..3ac7dc66085f 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -948,7 +948,6 @@ void i915_driver_remove(struct drm_i915_private *i915)
> 	intel_display_driver_remove(display);
>
> 	intel_irq_uninstall(i915);
> -	intel_hpd_cancel_work(display);
>
> 	intel_display_driver_remove_noirq(display);
>
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index 8be3e600838b..92a4573db28a 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -81,7 +81,6 @@ static void xe_display_fini_early(void *arg)
> 	if (!xe->info.probe_display)
> 		return;
>
> -	intel_hpd_cancel_work(display);
> 	intel_display_driver_remove_noirq(display);
> 	intel_display_driver_remove_nogem(display);
> 	intel_display_power_cleanup(display);
> -- 
> 2.47.3
>
>
--8323329-843812408-1782460153=:605841--
