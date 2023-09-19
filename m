Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02AD3CD54B0
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 10:30:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFEA010E283;
	Tue, 19 Sep 2023 10:30:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D606E10E283
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 10:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695119421; x=1726655421;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Sg95C9XufFT4Iy4pGAVthOQXuu6W0vNOXahrC3yJ1To=;
 b=Wxtfu7kferfsIQQRNUkLng1OkwvzcKc64CrQ+z3qqc4esQKhcQfJotVJ
 ckryND1q05hjrNCt+ESSUxyta/ksFMoHn7BRqdwctKCpqwi9FwsYORzpa
 CORSxcIG4YGYjU4x+KPIvfpi5vSiVIGUX5kr9PXKqeaEhr/YL+KYd5uZJ
 Fo+sBlOFdtPb6LWPzO2MDiZKHWxweUm/69qaGz4qyUvnwMZrSlRpJ/4wd
 +e7I0iGoqOyEfgGSPaBpp/Oo6Un8BR1XR/inh7wmPSnQ6OsEF+WubiI7X
 zEU30yfD+iEIzpzJCMmGrL8kcBFYVxNwv0JKzf3qc3mfc1idqOM/UKOjS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="377215187"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="377215187"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 03:30:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="722821007"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="722821007"
Received: from tjquresh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.37.227])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 03:30:19 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Uma Shankar <uma.shankar@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20230918173711.625930-3-uma.shankar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230918173711.625930-1-uma.shankar@intel.com>
 <20230918173711.625930-3-uma.shankar@intel.com>
Date: Tue, 19 Sep 2023 13:30:16 +0300
Message-ID: <87h6nqtpzb.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Add wrapper function for VGA
 decode setup
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

On Mon, 18 Sep 2023, Uma Shankar <uma.shankar@intel.com> wrote:
> Some of the VGA functionality is not needed by the Intel
> Xe driver. Adding a wrapper function for VGA decode setup.
>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  drivers/gpu/drm/xe/display/ext/i915_utils.c | 5 +++++
>  drivers/gpu/drm/xe/xe_display.h             | 1 +
>  2 files changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/display/ext/i915_utils.c b/drivers/gpu/drm/xe/display/ext/i915_utils.c
> index 981edc2788bc..aa3e9ad718c3 100644
> --- a/drivers/gpu/drm/xe/display/ext/i915_utils.c
> +++ b/drivers/gpu/drm/xe/display/ext/i915_utils.c
> @@ -20,3 +20,8 @@ int __i915_inject_probe_error(struct drm_i915_private *i915, int err,
>  {
>  	return 0;
>  }
> +
> +unsigned int intel_gmch_vga_set_decode(struct pci_dev *pdev, bool enable_decode)
> +{
> +	return -EIO;
> +}

We don't really want to add anything new to i915_utils.c. It's just
temporary cruft that had to be taken from i915 to make the rest compile.

> diff --git a/drivers/gpu/drm/xe/xe_display.h b/drivers/gpu/drm/xe/xe_display.h
> index 03b7ea9268d4..d7a200e6ec30 100644
> --- a/drivers/gpu/drm/xe/xe_display.h
> +++ b/drivers/gpu/drm/xe/xe_display.h
> @@ -38,6 +38,7 @@ void xe_display_pm_suspend(struct xe_device *xe);
>  void xe_display_pm_suspend_late(struct xe_device *xe);
>  void xe_display_pm_resume_early(struct xe_device *xe);
>  void xe_display_pm_resume(struct xe_device *xe);
> +unsigned int intel_gmch_vga_set_decode(struct pci_dev *pdev, bool enable_decode);

We also don't want to add random declarations in xe_display.h either...

BR,
Jani.

>  
>  #else

-- 
Jani Nikula, Intel
