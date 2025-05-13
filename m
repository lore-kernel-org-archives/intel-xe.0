Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E9EC3ABCC
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 11:21:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0139C10E375;
	Tue, 13 May 2025 11:21:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gvfN2cDt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A198D10E375
 for <intel-xe@lists.freedesktop.org>; Tue, 13 May 2025 11:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747135296; x=1778671296;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=LZFchvOJoUco4ky1iPhxxyP6KQUvScK5KtPVboenLXA=;
 b=gvfN2cDtDnw+c2cz4CXKKkKtCVNRahoWkN6frSErEu9zDzQVtPie5uf6
 qVd6tOlrf5hdxkOudCqD684V/bA24Kzn9Xczws8W7H6hfJZwggalHw5d5
 WK6rzp38MYFrb2sMI5/1jKCKkghDrRI9/VoP95jT5ZP6S20K0M9xj225N
 8XI2rTaDDNPW3n7Jnxs2OiL80sNOifiO5tJpjqj0nkCdkGbAuy9+O30P3
 pvpGCECksCc2E0oRs7dgjJZt1NIHlfMGg96O+dcsY7Iear1FlEiLqHWWp
 HesYpZGo2ZQLa0caA4ZRDpE1JbO9N/dW84P9vy0jih7UQBCjyTap9+z77 Q==;
X-CSE-ConnectionGUID: qvn+mRCmQoaJRtkOkTz22Q==
X-CSE-MsgGUID: qN0V2Uk2R9SnyoTcdmJfTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48870223"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; d="scan'208";a="48870223"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 04:21:25 -0700
X-CSE-ConnectionGUID: VuniTUXRTV2oP/LmctQC7Q==
X-CSE-MsgGUID: EQwCU7d5S8Obs1g14XCYqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; d="scan'208";a="142794698"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa005.jf.intel.com with ESMTP; 13 May 2025 04:21:22 -0700
Received: from [10.245.114.177] (unknown [10.245.114.177])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 1F8CB33E95;
 Tue, 13 May 2025 12:21:21 +0100 (IST)
Message-ID: <454bf5c7-1d8e-42ba-9443-e7d7f61cc421@intel.com>
Date: Tue, 13 May 2025 13:21:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/vf: Fail migration recovery if fixups needed
 but platform not supported
To: Tomasz Lis <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
References: <20250512230614.571026-1-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250512230614.571026-1-tomasz.lis@intel.com>
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



On 13.05.2025 01:06, Tomasz Lis wrote:
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
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov_vf.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 2674fa948fda..f21f98f5d25f 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -224,6 +224,11 @@ static void vf_post_migration_notify_resfix_done(struct xe_device *xe)
>  	drm_dbg(&xe->drm, "another recovery imminent, skipping notifications\n");
>  }
>  
> +static bool fixups_supported(struct xe_device *xe)
> +{

can we have some TODO comment here explaining what conditions we expect
to be added here? or maybe we can start with CONFIG_XE_DEBUG to indicate
early development phase?

> +	return false;
> +}
> +
>  static void vf_post_migration_recovery(struct xe_device *xe)
>  {
>  	bool need_fixups;
> @@ -243,6 +248,11 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>  		vf_post_migration_fixup_ctb(xe);
>  
>  	vf_post_migration_notify_resfix_done(xe);
> +	if (need_fixups && !fixups_supported(xe)) {
> +		drm_err(&xe->drm, "migration recovery not supported by this module version\n");

we already have drm_err in the fail: section, do we need this extra one?
if yes, can we make the message more specific (and maybe the reason
should be printed in fixups_supported() as for now it's all magic)

also, since support likely will not change between one migration and the
other, maybe it should be just a single drm_info() message printed
during a VF boot that any later migration will fail, without waiting
until the first migration happen to surprise the user

> +		err = -ENOTRECOVERABLE;
> +		goto fail;
> +	}

hmm, and this whole chunk seems to be placed in a wrong place - if
fixups are not supported, why did we attempt to fixup CTB few lines
above and claim that fixups are done? can you please explain

>  	xe_pm_runtime_put(xe);
>  	drm_notice(&xe->drm, "migration recovery ended\n");
>  	return;

