Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F578CE8E62
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 11:27:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE4510E900;
	Thu, 24 Oct 2024 11:27:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OAeeLjeh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 426D810E900
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Oct 2024 11:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729769246; x=1761305246;
 h=message-id:date:mime-version:subject:to:references:cc:
 from:in-reply-to:content-transfer-encoding;
 bh=g3u2+Qq8fgzNLRWcdosQvcmXV/yaw/JDH9YvS+OmLZ8=;
 b=OAeeLjehkjO4JweHiccPzmttWI0ldee6JV9PADQ29ngzpp5lNXnHm901
 WgRZ/uf1qHFkBgaxE2tLdjlhiFNP1iFnEed3xv1Vwdhp3ctbLMGL5bDkO
 Fj6Absr3ZzLuCcOsFwFrOxL6qMbW8q8VtN/NkysOhRo0pqldjxEtnqtQh
 R3cRIXSp1hkGS63RZjhCwuXA+S7YPNmj0yOavQhDTPvSk5im3yzxTCHZN
 HBeJK8wXcxtpvyEVSsE4SkSkAmpjfp8RcGmPomLB5M8mEYUzVY28YHF9B
 q7MLJQ99li+CJAxTa2YNwHREpLOcPbqqEsAESTKnkyCdmdzX7qn+yfev9 w==;
X-CSE-ConnectionGUID: ieMIAYaRS/6HtG8S46gorQ==
X-CSE-MsgGUID: P5xquZ3PThWPXm5QqlGNgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="33192817"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="33192817"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 04:27:26 -0700
X-CSE-ConnectionGUID: 1671UAAxRxy9LAFNb+xRyQ==
X-CSE-MsgGUID: B8RzWUQHSgqo6dYJuLTbVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="80736418"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.128.192])
 ([10.245.128.192])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 04:27:25 -0700
Message-ID: <a6db328f-54ef-4941-99cf-b7da52287345@linux.intel.com>
Date: Thu, 24 Oct 2024 13:27:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] drm/xe/guc: Fix missing init value and add
 register order check
To: Zhanjun Dong <zhanjun.dong@intel.com>, intel-xe@lists.freedesktop.org
References: <20241023192307.746525-1-zhanjun.dong@intel.com>
Content-Language: en-US
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "Everest K.C." <everestkc@everestkc.com.np>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241023192307.746525-1-zhanjun.dong@intel.com>
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

Hi Zhanjun,

There is a earlier patch regarding list->list check which is reviewed but not merged yet,

https://patchwork.freedesktop.org/patch/621250/?series=139810&rev=5


Could you please rebase your change on top of that  and may be carry that along as

the latest rev of that patch is not sent to xe so CI report is missing.


Regards,

Nirmoy

On 10/23/2024 9:23 PM, Zhanjun Dong wrote:
> Fix missing initial value for last_value.
> For GuC capture register definition, it is required to define 64bit
> register in a pair of 2 consecutive 32bit register entries, low first,
> then hi. Add code to check this order.
>
> Fixes: 0f1fdf559225 ("drm/xe/guc: Save manual engine capture into capture list")
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_capture.c | 26 +++++++++++++++++++++++---
>  1 file changed, 23 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index 8b6cb786a2aa..d7ff7dd60a1d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -102,6 +102,7 @@ struct __guc_capture_parsed_output {
>   *                   A 64 bit register define requires 2 consecutive entries,
>   *                   with low dword first and hi dword the second.
>   *     2. Register name: null for incompleted define
> + *     3. Incorrect order will trigger XE_WARN.
>   */
>  #define COMMON_XELP_BASE_GLOBAL \
>  	{ FORCEWAKE_GT,			REG_32BIT,	0,	0,	"FORCEWAKE_GT"}
> @@ -1678,10 +1679,10 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
>  	struct xe_devcoredump *devcoredump = &xe->devcoredump;
>  	struct xe_devcoredump_snapshot *devcore_snapshot = &devcoredump->snapshot;
>  	struct gcap_reg_list_info *reginfo = NULL;
> -	u32 last_value, i;
> -	bool is_ext;
> +	u32 i, last_value = 0;
> +	bool is_ext, low32_ready = false;
>  
> -	if (!list || list->num_regs == 0)
> +	if (!list || !list->list || list->num_regs == 0)
>  		return;
>  	XE_WARN_ON(!devcore_snapshot->matched_node);
>  
> @@ -1706,11 +1707,27 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
>  		value = reg->value;
>  		if (reg_desc->data_type == REG_64BIT_LOW_DW) {
>  			last_value = value;
> +
> +			/*
> +			 * A 64 bit register define requires 2 consecutive
> +			 * entries in register list, with low dword first
> +			 * and hi dword the second, like:
> +			 *  { XXX_REG_LO(0), REG_64BIT_LOW_DW, 0, 0, NULL},
> +			 *  { XXX_REG_HI(0), REG_64BIT_HI_DW,  0, 0, "XXX_REG"},
> +			 *
> +			 * Incorrect order will trigger XE_WARN.
> +			 */
> +			XE_WARN_ON(low32_ready); /* Possible double low here */
> +			low32_ready = true;
>  			/* Low 32 bit dword saved, continue for high 32 bit */
>  			continue;
>  		} else if (reg_desc->data_type == REG_64BIT_HI_DW) {
>  			u64 value_qw = ((u64)value << 32) | last_value;
>  
> +			/* Incorrect 64bit register order. Possible missing low */
> +			XE_WARN_ON(!low32_ready);
> +			low32_ready = false;
> +
>  			drm_printf(p, "\t%s: 0x%016llx\n", reg_desc->regname, value_qw);
>  			continue;
>  		}
> @@ -1727,6 +1744,9 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
>  			drm_printf(p, "\t%s: 0x%08x\n", reg_desc->regname, value);
>  		}
>  	}
> +
> +	/* Incorrect 64bit register order. Possible missing high */
> +	XE_WARN_ON(low32_ready);
>  }
>  
>  /**
