Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0E4C3600C
	for <intel-xe@archiver.kernel.org>; Tue,  8 Apr 2025 13:34:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D64F910E268;
	Tue,  8 Apr 2025 13:34:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NLddwPbt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FB1010E268
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Apr 2025 13:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744119284; x=1775655284;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=k1IrgHxANz4XIREhmp2Bwgj2Lqj/dpSucZPGANzeiGE=;
 b=NLddwPbtRitp9qBr6eGqyImVwcgAHCpd5/K6kzozfIEJU5rldnN1JAXI
 ZdACrw6RIaFZJG5K2i3KTAVSkni9hcsw+wM4pqAiRIuVwcIEcGyIpMdqH
 PPAOcmmShGmcEjrzskySrm5yPzzWT6qhDEfOAKwC1+MIMtY1PHzUdRhna
 9CMkQzpznuo1lR/WDq6lCb+SKuXO7+nKkv8T1DSlHKfusCTQssL9OgCgj
 VTZAb+ZlTKaKjUPg6ODXOSjzzcJ7/WVKTE9mTjysZoBFlPovJmql1TCeb
 A2a6dIcJI/nVMnDK0RcvHXoHYEKOQgzyELx1QtWs9Pr4sKmjBShkyb0/d w==;
X-CSE-ConnectionGUID: 6ZmoS37jTcGW430jN25uKw==
X-CSE-MsgGUID: T2iykgDNQXGfDPRlXgEA+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="48260435"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="48260435"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 06:34:44 -0700
X-CSE-ConnectionGUID: bBUmytNCSYmwB9KZLIHAEQ==
X-CSE-MsgGUID: MVyl9lSJSfKfkVAPk4mSpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="128265794"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa007.fm.intel.com with ESMTP; 08 Apr 2025 06:34:42 -0700
Received: from [10.245.96.73] (mwajdecz-MOBL.ger.corp.intel.com [10.245.96.73])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id CEBB034322;
 Tue,  8 Apr 2025 14:34:40 +0100 (IST)
Message-ID: <b999151b-923d-457b-97eb-ef656cd7c1d3@intel.com>
Date: Tue, 8 Apr 2025 15:34:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/4] drm/xe/guc: Introduce enum with offsets for
 context register H2Gs
To: Tomasz Lis <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250403184055.2317409-1-tomasz.lis@intel.com>
 <20250403184055.2317409-4-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250403184055.2317409-4-tomasz.lis@intel.com>
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



On 03.04.2025 20:40, Tomasz Lis wrote:
> Some GuC messages are constructed with incrementing dword counter
> rather than referencing specific DWORDs, as described in GuC interface
> specification.
> 
> This change introduces the definitions of DWORD numbers for parameters
> which will need to be referenced in a CTB parser to be added in a
> following patch. To ensure correctness of these DWORDs, verification
> in form of asserts was added to the message construction code.
> 
> v2: Renamed enum members, added ones for single context registration,
>   modified asserts to check values rather than indexes.
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_actions_abi.h | 29 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 22 ++++++++++++++++++
>  2 files changed, 51 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> index 448afb86e05c..64c71526356e 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> @@ -161,6 +161,35 @@ enum xe_guc_preempt_options {
>  	XE_GUC_PREEMPT_OPTION_DROP_SUBMIT_Q = 0x8,
>  };
>  
> +enum xe_guc_register_context_param_offsets {
> +	XE_GUC_REGISTER_CONTEXT_DATA_0_MBZ = 0,
> +	XE_GUC_REGISTER_CONTEXT_DATA_1_FLAGS,
> +	XE_GUC_REGISTER_CONTEXT_DATA_2_CONTEXT_INDEX,
> +	XE_GUC_REGISTER_CONTEXT_DATA_3_ENGINE_CLASS,
> +	XE_GUC_REGISTER_CONTEXT_DATA_4_ENGINE_SUBMIT_MASK,
> +	XE_GUC_REGISTER_CONTEXT_DATA_5_WQ_DESC_ADDR_LOWER,
> +	XE_GUC_REGISTER_CONTEXT_DATA_6_WQ_DESC_ADDR_UPPER,
> +	XE_GUC_REGISTER_CONTEXT_DATA_7_WQ_BUF_BASE_LOWER,
> +	XE_GUC_REGISTER_CONTEXT_DATA_8_WQ_BUF_BASE_UPPER,
> +	XE_GUC_REGISTER_CONTEXT_DATA_9_WQ_BUF_SIZE,
> +	XE_GUC_REGISTER_CONTEXT_DATA_10_HW_LRC_ADDR,
> +};
> +
> +enum xe_guc_register_context_multi_lrc_param_offsets {
> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_0_MBZ = 0,
> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_1_FLAGS,
> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_2_PARENT_CONTEXT,
> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_3_ENGINE_CLASS,
> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_4_ENGINE_SUBMIT_MASK,
> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_5_WQ_DESC_ADDR_LOWER,
> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_6_WQ_DESC_ADDR_UPPER,
> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_7_WQ_BUF_BASE_LOWER,
> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_8_WQ_BUF_BASE_UPPER,
> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_9_WQ_BUF_SIZE,
> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_10_NUM_CTXS,
> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_11_HW_LRC_ADDR,
> +};
> +
>  enum xe_guc_report_status {
>  	XE_GUC_REPORT_STATUS_UNKNOWN = 0x0,
>  	XE_GUC_REPORT_STATUS_ACKED = 0x1,
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 31bc2022bfc2..63ef06d3a28f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -485,6 +485,18 @@ static void __register_mlrc_exec_queue(struct xe_guc *guc,
>  		action[len++] = upper_32_bits(xe_lrc_descriptor(lrc));
>  	}
>  

nit: if we want to keep these asserts then small comment saying

	/* explicitly checks some fields that we might fixup later */

will not hurt

> +	xe_gt_assert(guc_to_gt(guc),
> +		     action[XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_5_WQ_DESC_ADDR_LOWER]
> +		     == info->wq_desc_lo);
> +	xe_gt_assert(guc_to_gt(guc),
> +		     action[XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_7_WQ_BUF_BASE_LOWER]
> +		     == info->wq_base_lo);
> +	xe_gt_assert(guc_to_gt(guc),
> +		     action[XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_10_NUM_CTXS]
> +		     == q->width);
> +	xe_gt_assert(guc_to_gt(guc),
> +		     action[XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_11_HW_LRC_ADDR]
> +		     == info->hwlrca_lo);

maybe we can spare one line in each assert by:

xe_gt_assert(guc_to_gt(guc), info->hwlrca_lo ==
	action[XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_11_HW_LRC_ADDR]);

or by introducing:

	xe_guc_assert(guc, cond)

or by ignoring 100 column limit - it will not be first time in xe ;)

>  	xe_gt_assert(guc_to_gt(guc), len <= MAX_MLRC_REG_SIZE);
>  #undef MAX_MLRC_REG_SIZE
>  
> @@ -509,6 +521,16 @@ static void __register_exec_queue(struct xe_guc *guc,
>  		info->hwlrca_hi,
>  	};
>  
> +	xe_gt_assert(guc_to_gt(guc),
> +		     action[XE_GUC_REGISTER_CONTEXT_DATA_5_WQ_DESC_ADDR_LOWER]
> +		     == info->wq_desc_lo);
> +	xe_gt_assert(guc_to_gt(guc),
> +		     action[XE_GUC_REGISTER_CONTEXT_DATA_7_WQ_BUF_BASE_LOWER]
> +		     == info->wq_base_lo);
> +	xe_gt_assert(guc_to_gt(guc),
> +		     action[XE_GUC_REGISTER_CONTEXT_DATA_10_HW_LRC_ADDR]
> +		     == info->hwlrca_lo);
> +
>  	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
>  }
>  

otherwise, since I don't have better ideas for enum names, LGTM

