Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A29C5B572
	for <intel-xe@archiver.kernel.org>; Mon, 17 Aug 2026 10:19:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA0410E3FF;
	Mon, 17 Aug 2026 10:19:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kgBvBI2k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7391F10E3FF;
 Mon, 17 Aug 2026 10:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786961965; x=1818497965;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=j3Wqb19F4eVale9EqNKcg3HmcBwsy9fpsuNBrzR05tQ=;
 b=kgBvBI2kUC++D2n+2H6NyQzUpE3ti3uEY8D8w1wwfWr9CDQbxe56XZJW
 Q+lDYM0KWBJuyC6hv8EFU6OHYbKuD2Ov1bGJ9bG51SUwSKrsMiu/F6xCf
 TH0Zjr1sWvPrCgBtgQR6/jDqvfdxlrT6tlhg3zw+AZL37zUN47RIsOKBn
 XUjmssC3QDA0SkBKS6XkbSQ0OotifHu+as1w1YJRfyVxJxDuNZUsEeYq6
 5LaJXpwfR62srBCUHz3HfVyAvojc+P4NTdwEaSCgT7A26JeFdvhHsfYLl
 NoqrHCUtotnSJSNL/ZvfeF/mVL22m0882ysMIgWZ5KQ0DKznil7THucyX g==;
X-CSE-ConnectionGUID: XMRkF8dwSCigaTq3SUaFWg==
X-CSE-MsgGUID: C16thN5IQM6lvwngLv+ODA==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="87558759"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="87558759"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 03:19:25 -0700
X-CSE-ConnectionGUID: Xs3X0c6ISPGtrcYl9nBlvQ==
X-CSE-MsgGUID: NCaVdfqhQXuSTxt1gOspKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="268717810"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.110])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 03:19:23 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, imre.deak@intel.com
Subject: Re: [RFC PATCH 2/5] drm/i915/display: add pme_capable() to the
 parent interface
In-Reply-To: <20260816224005.886035-3-vinod.govindapillai@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260816224005.886035-1-vinod.govindapillai@intel.com>
 <20260816224005.886035-3-vinod.govindapillai@intel.com>
Date: Mon, 17 Aug 2026 13:19:20 +0300
Message-ID: <bb80200efea31ed150318deaa8622d8efddb2666@intel.com>
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
> Add a provision to query the optional pme_capability to the parent
> interface so that it could be called independently from xe or i915
> based on the implementation.

But do we need this? Display has all the information to call
pci_dev_run_wake() directly, without going through the parent interface.

The only difference is this is not being set up for i915.

BR,
Jani.

>
> Assisted-by: GitHub_Copilot:claude-opus-5
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_rpm.c | 7 +++++++
>  drivers/gpu/drm/i915/display/intel_display_rpm.h | 1 +
>  include/drm/intel/display_parent_interface.h     | 1 +
>  3 files changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_rpm.c b/drivers/gpu/drm/i915/display/intel_display_rpm.c
> index 0a331f89b4db..73d85384474e 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_rpm.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_rpm.c
> @@ -46,6 +46,13 @@ bool intel_display_rpm_suspended(struct intel_display *display)
>  	return display->parent->rpm->suspended(display->drm);
>  }
>  
> +bool intel_display_rpm_pme_capable(struct intel_display *display)
> +{
> +	const struct intel_display_rpm_interface *rpm = display->parent->rpm;
> +
> +	return rpm->pme_capable && rpm->pme_capable(display->drm);
> +}
> +
>  void assert_display_rpm_held(struct intel_display *display)
>  {
>  	display->parent->rpm->assert_held(display->drm);
> diff --git a/drivers/gpu/drm/i915/display/intel_display_rpm.h b/drivers/gpu/drm/i915/display/intel_display_rpm.h
> index 6ef48515f84b..2d4071fb9282 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_rpm.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_rpm.h
> @@ -21,6 +21,7 @@ void intel_display_rpm_put(struct intel_display *display, struct ref_tracker *wa
>  
>  /* Only for special cases. */
>  bool intel_display_rpm_suspended(struct intel_display *display);
> +bool intel_display_rpm_pme_capable(struct intel_display *display);
>  
>  void assert_display_rpm_held(struct intel_display *display);
>  void intel_display_rpm_assert_block(struct intel_display *display);
> diff --git a/include/drm/intel/display_parent_interface.h b/include/drm/intel/display_parent_interface.h
> index d7d06dcaa699..563de403b102 100644
> --- a/include/drm/intel/display_parent_interface.h
> +++ b/include/drm/intel/display_parent_interface.h
> @@ -196,6 +196,7 @@ struct intel_display_rpm_interface {
>  	void (*put_unchecked)(const struct drm_device *drm);
>  
>  	bool (*suspended)(const struct drm_device *drm);
> +	bool (*pme_capable)(const struct drm_device *drm); /* Optional */
>  	void (*assert_held)(const struct drm_device *drm);
>  	void (*assert_block)(const struct drm_device *drm);
>  	void (*assert_unblock)(const struct drm_device *drm);

-- 
Jani Nikula, Intel
