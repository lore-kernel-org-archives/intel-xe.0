Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9ACC77B7F
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 20:15:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 519C910E103;
	Tue, 24 Jun 2025 20:15:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aQd2VzKe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B59D810E103
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 20:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750796118; x=1782332118;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FLo3E+9uikdGFwfO7uB4BY+qrJ780tMdaXuACgUlUMM=;
 b=aQd2VzKerFdj4eLnUQ+DtN3I7pU3qZKJOJk2RTC5vlV51rmPFrvlvaqB
 SdntY8Z2DqR/Mgd2N92OQqgnXNtaHJ0tVVjoPovLZ5dhBRHG9pdz43DXH
 s5CrmCSWrfFrTglwxLqhAqQ1U2LTGecochWwqQb/yTBAFD4tRcLoTBXeO
 7J0pu9NmohklsGauWksi9yMeaIeF91ecGff4dDXztE7yR43tFTTAKybdu
 3Ncm4ahYnPz73Z7dYBd0fet1495znriNo1HabiPf6csmFLtMjVqG9lOCZ
 jZwuIQFDi1IShDNqSScWl1RHt2C7XqxTlcrUmuMN2L0v5tjzIq/Uzkjta w==;
X-CSE-ConnectionGUID: kYEVCxf4TjGzlDDzQw47XQ==
X-CSE-MsgGUID: n6E+DXI8TFCnl5Q4Ffq78A==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="55678989"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="55678989"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 13:15:17 -0700
X-CSE-ConnectionGUID: yuYZGnmFSqiH3fZGHk560A==
X-CSE-MsgGUID: 8AndWQx5Q12DGeNdl3YL+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="182898107"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa001.fm.intel.com with ESMTP; 24 Jun 2025 13:15:16 -0700
Received: from [10.246.5.201] (mwajdecz-MOBL.ger.corp.intel.com [10.246.5.201])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id DB5D634948;
 Tue, 24 Jun 2025 21:15:14 +0100 (IST)
Message-ID: <4715fb2c-8176-4ace-a56c-e6dfc2da08c6@intel.com>
Date: Tue, 24 Jun 2025 22:15:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] drm/xe/uc: Disable GuC communication on hardware
 initialization error.
To: Zhanjun Dong <zhanjun.dong@intel.com>, intel-xe@lists.freedesktop.org
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
References: <20250624011735.3976-1-zhanjun.dong@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250624011735.3976-1-zhanjun.dong@intel.com>
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



On 24.06.2025 03:17, Zhanjun Dong wrote:
> Disable GuC communication on Xe micro controller hardware initialization
> error.
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4917
> 
> ---
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> 
> Change list:
> v6: Skip disable ct on xe_guc_enable_communication error
> v5: Set wedge is excessive action, revert back to disable ct
> v4: Fix typo and add new line
> v3: v2 CI re-run
> v2: Remove unnecessary jump to err-out
>     Drop disable ct, switch to set wedge
> ---
>  drivers/gpu/drm/xe/xe_guc.c |  5 +++++
>  drivers/gpu/drm/xe/xe_guc.h |  1 +
>  drivers/gpu/drm/xe/xe_uc.c  | 19 ++++++++++++++-----
>  3 files changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 209e5d53c290..9d7175b16cc7 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1230,6 +1230,11 @@ int xe_guc_enable_communication(struct xe_guc *guc)
>  	return 0;
>  }
>  

each new public function needs to have a proper kernel-doc

> +void xe_guc_disable_communication(struct xe_guc *guc)
> +{
> +	xe_guc_ct_disable(&guc->ct);
> +}
> +
>  int xe_guc_suspend(struct xe_guc *guc)
>  {
>  	struct xe_gt *gt = guc_to_gt(guc);
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index 58338be44558..285c19929f8c 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -33,6 +33,7 @@ int xe_guc_reset(struct xe_guc *guc);
>  int xe_guc_upload(struct xe_guc *guc);
>  int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
>  int xe_guc_enable_communication(struct xe_guc *guc);
> +void xe_guc_disable_communication(struct xe_guc *guc);
>  int xe_guc_suspend(struct xe_guc *guc);
>  void xe_guc_notify(struct xe_guc *guc);
>  int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 3a8751a8b92d..d74bfc7a85d1 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -13,6 +13,7 @@
>  #include "xe_gt_printk.h"
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_guc.h"
> +#include "xe_guc_ct.h"
>  #include "xe_guc_pc.h"
>  #include "xe_guc_engine_activity.h"
>  #include "xe_huc.h"
> @@ -161,15 +162,19 @@ static int vf_uc_init_hw(struct xe_uc *uc)
>  
>  	err = xe_gt_sriov_vf_connect(uc_to_gt(uc));
>  	if (err)
> -		return err;
> +		goto err_out;
>  
>  	uc->guc.submission_state.enabled = true;
>  
>  	err = xe_gt_record_default_lrcs(uc_to_gt(uc));
>  	if (err)
> -		return err;
> +		goto err_out;
>  
>  	return 0;
> +
> +err_out:
> +	xe_guc_disable_communication(&uc->guc);
> +	return err;
>  }
>  
>  /*
> @@ -201,15 +206,15 @@ int xe_uc_init_hw(struct xe_uc *uc)
>  
>  	ret = xe_gt_record_default_lrcs(uc_to_gt(uc));
>  	if (ret)
> -		return ret;
> +		goto err_out;
>  
>  	ret = xe_guc_post_load_init(&uc->guc);
>  	if (ret)
> -		return ret;
> +		goto err_out;
>  
>  	ret = xe_guc_pc_start(&uc->guc.pc);
>  	if (ret)
> -		return ret;
> +		goto err_out;
>  
>  	xe_guc_engine_activity_enable_stats(&uc->guc);
>  
> @@ -221,6 +226,10 @@ int xe_uc_init_hw(struct xe_uc *uc)
>  	xe_gsc_load_start(&uc->gsc);
>  
>  	return 0;
> +
> +err_out:
> +	xe_guc_disable_communication(&uc->guc);
> +	return ret;
>  }
>  
>  int xe_uc_fini_hw(struct xe_uc *uc)

what about doing similar cleanup in xe_guc_min_load_for_hwconfig() where
we also have unbalanced xe_guc_enable_communication() ?


