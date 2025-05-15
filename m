Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 813B0C2D0CD
	for <intel-xe@archiver.kernel.org>; Thu, 15 May 2025 09:51:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 451EF10E7FE;
	Thu, 15 May 2025 09:51:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d4R481kS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E943110E7FE
 for <intel-xe@lists.freedesktop.org>; Thu, 15 May 2025 09:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747302697; x=1778838697;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=VSEJ0DGWA382iHtiU9IFcFe1Apa6n7NFvypMoTlyq7s=;
 b=d4R481kS5D3tcNeAF5p97BPwwZkBR+xeoyPUUGAqVHUItFc4LO6ie7uj
 934uZ8Hs1GiKenRnWQTJ7hTkUmhdAhYpcPSnKoLzQwDMX+y+DsnInhuQO
 e93wkKWpziCtswfnWKpn1RUgYM8ZN/h2Uof/AN28PKymDOYVxkY5PBJ3q
 Osrb84abXMuuZvfXW7s7oDPd4OGbbA0nK1RDfL4n6/mcUDmBQeVZNq3VH
 iL9AHC7Jv+VpC6WpqcrHfLajjgYBSyfloD4OBbKwWOOaQ1UBLCHsPNXoF
 lphQKHOVkQW1GDIkmojpBNLEkgZneH/t9k+vQHgJRGElG7fP+61tS+99H Q==;
X-CSE-ConnectionGUID: Y7LLfPBMRVWWGOtIWiSXCg==
X-CSE-MsgGUID: byTq9zXgTGm9mPifQH0vzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="48914578"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="48914578"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 02:51:37 -0700
X-CSE-ConnectionGUID: wqjhG8lVRH2UpI71wk7mpQ==
X-CSE-MsgGUID: ZRUnllJmRuWGviiONy+M1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="138186048"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa010.jf.intel.com with ESMTP; 15 May 2025 02:51:36 -0700
Received: from [10.245.113.199] (unknown [10.245.113.199])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 3701233BE8;
 Thu, 15 May 2025 10:51:34 +0100 (IST)
Message-ID: <02bab0a3-8f8f-4cca-b100-7e73f7f26f31@intel.com>
Date: Thu, 15 May 2025 11:51:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/vf: Fail migration recovery if fixups needed
 but platform not supported
To: Tomasz Lis <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
References: <20250514221417.810606-1-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250514221417.810606-1-tomasz.lis@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 15.05.2025 00:14, Tomasz Lis wrote:
> The post-migration recovery needs to be fully implemented for a
> specific platform in order to make continuation of workloads
> possible.
> 
> New platforms introduce changes which affect the recovery procedure,
> and without a clear verification of support this leads to errors
> with no straight forward error message explaining the cause.
> 
> This patch fixes that issue - it introduces a message to be logged
> when the current driver is known to not support the current platform.
> 
> Wedging the driver immediately also decreases the amount of
> additional errors which would come afterwards if the driver continued
> operation.
> 
> v2: Show the message during probe as well as during recovery; do not
>   perform any recovery steps if the reovery is bound to fail

typo reovery

> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov_vf.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 2674fa948fda..bb069e4b3823 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -123,6 +123,15 @@
>   *      |                               |                               |
>   */
>  
> +static bool vf_mgration_supported(struct xe_device *xe)

typo mgration

> +{
> +	/*
> +	 * TODO: Add conditions to allow specific platforms, when they're
> +	 * supported at production quality.
> +	 */
> +	return IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV);

maybe in case it's not supported we can print the message right here so
we can avoid two similar calls later on?

> +}
> +
>  static void migration_worker_func(struct work_struct *w);
>  
>  /**
> @@ -132,6 +141,10 @@ static void migration_worker_func(struct work_struct *w);
>  void xe_sriov_vf_init_early(struct xe_device *xe)
>  {
>  	INIT_WORK(&xe->sriov.vf.migration.worker, migration_worker_func);
> +
> +	if (!vf_mgration_supported(xe)) {
> +		drm_info(&xe->drm, "vf migration not supported by this module version\n");

s/vf//VF

or maybe just use xe_sriov_info() which will add "VF: " prefix for you

> +	}
>  }
>  
>  /**
> @@ -236,6 +249,11 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>  		goto defer;
>  	if (unlikely(err))
>  		goto fail;
> +	if (!vf_mgration_supported(xe)) {
> +		drm_err(&xe->drm, "vf migration not supported by this module version\n");

same here (or print inside vf_migration_supported)

> +		err = -ENOTRECOVERABLE;
> +		goto fail;
> +	}
>  
>  	need_fixups = vf_post_migration_fixup_ggtt_nodes(xe);
>  	/* FIXME: add the recovery steps */

