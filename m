Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3FFC2D0CD
	for <intel-xe@archiver.kernel.org>; Mon, 19 May 2025 20:23:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFDEA10E2D8;
	Mon, 19 May 2025 20:23:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LwzgbwYK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74B2810E2D8
 for <intel-xe@lists.freedesktop.org>; Mon, 19 May 2025 20:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747686221; x=1779222221;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=MABjTjUlHWo8IUwV9RgkULanN6sEhT1psbMXJHlbOCw=;
 b=LwzgbwYKuKxCiAO+fPrdsNhBtCoSHtihlLjF4etcqUH4HwUDsjoKgUEA
 Bq8ZmqOAXIMo9ilwmh6wl8s5WhSYLUIcBi4rKqw++vX0vkYIZhR18HCoB
 GZcWI1CMCVAyxNbsOrFEYVZ6tloH5wggrQXxY4lKlFZvnyacownGzrKgn
 oqB8y5k+9RsXiOcBiTh2zVXpefU/wVdfMys8SsnVtoswpLUbLNOTWqM3X
 tKAk2IBBejMjcLtIEOPsIqRSWNfCRnd31qodxDKHPZZICZtvI5qqVS2DI
 0SzMqCmaZ4ZIUEkuShuEyxWuk1iIyGvN4V4O9ObvrhEHoafsBPLJdlVKZ g==;
X-CSE-ConnectionGUID: jcw1fv1RRYiOWcFmRSF5Tw==
X-CSE-MsgGUID: FzwH7KPbTeKiiIgU+hvkVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49703536"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="49703536"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 13:23:41 -0700
X-CSE-ConnectionGUID: UjjSm2gRSkKjY+SR0fa3wQ==
X-CSE-MsgGUID: cFHxFvoERQyAz89r85dvpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="139889072"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa008.fm.intel.com with ESMTP; 19 May 2025 13:23:40 -0700
Received: from [10.245.97.58] (unknown [10.245.97.58])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id DD2BA3497F;
 Mon, 19 May 2025 21:23:38 +0100 (IST)
Message-ID: <5557aa24-ce65-41d5-84db-2a97076a53f6@intel.com>
Date: Mon, 19 May 2025 22:23:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/vf: Fail migration recovery if fixups needed
 but platform not supported
To: Tomasz Lis <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
References: <20250515111229.815047-1-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250515111229.815047-1-tomasz.lis@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 15.05.2025 13:12, Tomasz Lis wrote:
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
>   perform any recovery steps if the recovery is bound to fail
> v3: Use SRIOV-specific logging, fix typos
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov_vf.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 2674fa948fda..b578d171eb83 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -123,6 +123,15 @@
>   *      |                               |                               |
>   */
>  
> +static bool vf_migration_supported(struct xe_device *xe)
> +{
> +	/*
> +	 * TODO: Add conditions to allow specific platforms, when they're
> +	 * supported at production quality.
> +	 */
> +	return IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV);

if we want this feature to be at least lightly tested by our CI then it
should be CONFIG_DRM_XE_DEBUG instead, with that fixed or clarified

	Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> +}
> +
>  static void migration_worker_func(struct work_struct *w);
>  
>  /**
> @@ -132,6 +141,9 @@ static void migration_worker_func(struct work_struct *w);
>  void xe_sriov_vf_init_early(struct xe_device *xe)
>  {
>  	INIT_WORK(&xe->sriov.vf.migration.worker, migration_worker_func);
> +
> +	if (!vf_migration_supported(xe))
> +		xe_sriov_info(xe, "migration not supported by this module version\n");
>  }
>  
>  /**
> @@ -236,6 +248,11 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>  		goto defer;
>  	if (unlikely(err))
>  		goto fail;
> +	if (!vf_migration_supported(xe)) {
> +		xe_sriov_err(xe, "migration not supported by this module version\n");
> +		err = -ENOTRECOVERABLE;
> +		goto fail;
> +	}
>  
>  	need_fixups = vf_post_migration_fixup_ggtt_nodes(xe);
>  	/* FIXME: add the recovery steps */

