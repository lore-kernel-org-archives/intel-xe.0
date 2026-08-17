Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B76DDC5DF70
	for <intel-xe@archiver.kernel.org>; Mon, 17 Aug 2026 10:17:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C8610E726;
	Mon, 17 Aug 2026 10:17:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ble1LdFO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D9010E721;
 Mon, 17 Aug 2026 10:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786961844; x=1818497844;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=hnmDe2dhkDSO9j9jjb/c2arrQ6taveerGTMNUE2ZMBs=;
 b=ble1LdFOA/w/zPVzsY1m09zpZuQr/Giiwa2tOAeLOXpxeiQRpH/Klp1F
 qytOlU6wff5c7PNojDROVmGsgT2f3Hf1ty5x1CMvzIwuZgYlzPTStSJOR
 VrB+zZDAt8q1Y80ko/jpdgrWR40hDBQVET++GHiFI4IEC3bZ2iWcAXdFL
 rblWH9ZFhm9QsrD8xa8Vn581glEU5SX/INSLtgC1w1KRZEYh86JZjjeV5
 qoKo0z7zY+EBVXuyC46/TFLLqzmZwfIr/qvOPIcL75eNLUJF6Gq+Ixc+e
 9NsV48Q5JZJr7hsK7/KhT1MsYbeky+AMNBDRzQNT5NYqmATt9Bmd7sTOn w==;
X-CSE-ConnectionGUID: jGrquajvS36rqQYWvwJqhw==
X-CSE-MsgGUID: 9eE04MVnQLWwPGrFOD0btA==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="91248045"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="91248045"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 03:17:24 -0700
X-CSE-ConnectionGUID: YOWcWp3ZS+ikHVHxcovg0w==
X-CSE-MsgGUID: 5ODw45Q1Q0iG39gUC/192g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="261132750"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.110])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 03:17:22 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, imre.deak@intel.com
Subject: Re: [RFC PATCH 1/5] drm/xe/pm: add xe_pm_pme_supported() helper
In-Reply-To: <20260816224005.886035-2-vinod.govindapillai@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260816224005.886035-1-vinod.govindapillai@intel.com>
 <20260816224005.886035-2-vinod.govindapillai@intel.com>
Date: Mon, 17 Aug 2026 13:17:19 +0300
Message-ID: <97a6578c8d52c2ae8c179e8be3c1a92359f0e311@intel.com>
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

On Mon, 17 Aug 2026, Vinod Govindapillai <vinod.govindapillai@intel.com> wrote:
> Introduce the helper to check if the device can signal a wakeup event
> while runtime suspended. This can avoid scheduling the HPD polling.
>
> Assisted-by: GitHub_Copilot:claude-opus-5
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pm.c | 21 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pm.h |  1 +
>  2 files changed, 22 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index a5289a9df8d2..635bfb1c7f78 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -937,6 +937,27 @@ bool xe_pm_runtime_resume_and_get(struct xe_device *xe)
>  	return pm_runtime_resume_and_get(xe->drm.dev) >= 0;
>  }
>  
> +/**
> + * xe_pm_pme_supported - Can the device signal PME from its suspend target state?
> + * @xe: xe device instance
> + *
> + * Determine whether the device can generate a Power Management Event while
> + * runtime suspended.
> + *
> + * Return: true if PME is supported from the target state, false otherwise.
> + */
> +bool xe_pm_pme_supported(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +
> +	/*
> +	 * pci_dev_run_wake() checks dev->pme_support, verifies
> +	 * pci_pme_capable() against the state pci_target_state() picks, and
> +	 * walks upstream to confirm the wake can actually be routed.

Is this comment helpful? pci_dev_run_wake() has a kernel-doc comment
that explains what it does?

> +	 */
> +	return pci_dev_run_wake(pdev);
> +}
> +
>  /**
>   * xe_pm_assert_unbounded_bridge - Disable PM on unbounded pcie parent bridge
>   * @xe: xe device instance
> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> index 6d5ab09cb769..16b8699e59ec 100644
> --- a/drivers/gpu/drm/xe/xe_pm.h
> +++ b/drivers/gpu/drm/xe/xe_pm.h
> @@ -30,6 +30,7 @@ bool xe_pm_runtime_get_if_active(struct xe_device *xe);
>  bool xe_pm_runtime_get_if_in_use(struct xe_device *xe);
>  void xe_pm_runtime_get_noresume(struct xe_device *xe);
>  bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
> +bool xe_pm_pme_supported(struct xe_device *xe);
>  void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
>  int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
>  void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);

-- 
Jani Nikula, Intel
