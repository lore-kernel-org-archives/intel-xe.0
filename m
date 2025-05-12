Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E4DC3ABC3
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 08:25:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72DDA10E31D;
	Mon, 12 May 2025 08:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OYVWg30A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B80A10E306
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 08:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747038307; x=1778574307;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/rkrgQn46XY30q4AFn3V1WSQSW9qbtv3Nw0PknsfIQs=;
 b=OYVWg30AFFjpB58jmuQ+orveMcCD3IZV5QHkemcC7vcs3xSdA2WtKQMR
 tBMPNvwHf8+nDMIyMWULpnRKlvmTfvCeQrVUEz2DFTfNRFFclAambotjk
 mQqx1vL6iSoZf2DN9vWcBbL2If0w8ejZfdgUlGF+ZGiioCgINCo7JdqCc
 zMt23A5erbFcAgFsExSFBPNBF72/qHnQ5Gbcu47CxQH/Tf/yKdqbq1uWf
 BXRA1Xc4jR53BNrvgaxyoBG0eO8TmqJLAG9HplypnrMkWpBdUzB++oPXG
 IutFuN5BmWiM6ff8+lFE3NLj9dxPmjEotAkOCZIx/GOkkr13ekykfJUa/ w==;
X-CSE-ConnectionGUID: FgxaMtplT96EJ9EwsNcnfw==
X-CSE-MsgGUID: ht5vPfNMTq2Mcd5UlvZpZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="52471600"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; d="scan'208";a="52471600"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 01:25:07 -0700
X-CSE-ConnectionGUID: Oc1KM+26Tiq5VWP1qkCshQ==
X-CSE-MsgGUID: sRvCDk5nR4SQznacSWUZgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; d="scan'208";a="137770028"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa010.fm.intel.com with ESMTP; 12 May 2025 01:25:06 -0700
Received: from [10.245.96.179] (unknown [10.245.96.179])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id EC36133BE1;
 Mon, 12 May 2025 09:25:04 +0100 (IST)
Message-ID: <dcd7a4ab-1733-4f4d-a286-ca5bd2ac6a63@intel.com>
Date: Mon, 12 May 2025 10:25:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/xe/vf: Disallow setting wedged_mode=2
To: Lukasz Laguna <lukasz.laguna@intel.com>, intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com
References: <20250424143043.937-1-lukasz.laguna@intel.com>
 <20250424143043.937-4-lukasz.laguna@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250424143043.937-4-lukasz.laguna@intel.com>
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



On 24.04.2025 16:30, Lukasz Laguna wrote:
> In wedged_mode=2, engine resets need to be disabled, which requires
> changing the GuC reset policy. VFs are not permitted to do that.
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c | 3 +++
>  drivers/gpu/drm/xe/xe_device.c  | 5 ++++-
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 2e6d8744003b..369bb2103e4c 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -169,6 +169,9 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>  	if (xe->wedged.mode == wedged_mode)
>  		return size;
>  
> +	if (wedged_mode == 2 && IS_SRIOV_VF(xe))

maybe it is worth to add some helper to sanitize wedged_mode same logic
is now used in two places (here and in xe_device_probe_early below)

and with patch 4/4 this will be even more needed

> +		return -EPERM;
> +
>  	xe_pm_runtime_get(xe);
>  	for_each_gt(gt, xe, id) {
>  		ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads);
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index d2de6936cc20..13430538f861 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -731,9 +731,12 @@ int xe_device_probe_early(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> +	xe->wedged.mode = 1; /* default */
> +
>  	if (xe_modparam.wedged_mode > 2) {
>  		drm_dbg(&xe->drm, "Used wedged_mode value is invalid. Setting default (1)\n");
> -		xe->wedged.mode = 1; /* default */

this was just added in patch 1/4
please avoid changing same line in one series

> +	} else if (xe_modparam.wedged_mode == 2 && IS_SRIOV_VF(xe)) {
> +		drm_dbg(&xe->drm, "Can't set wedged_mode=2 when running as VF. Setting default (1)\n");

"wedged_mode: unsupported mode (%u) for VF, using default (%u)"

>  	} else {
>  		xe->wedged.mode = xe_modparam.wedged_mode;
>  	}

