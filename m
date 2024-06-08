Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E52C25B76
	for <intel-xe@archiver.kernel.org>; Sat,  8 Jun 2024 11:45:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAE5E10E0AC;
	Sat,  8 Jun 2024 11:45:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Poi3pAe/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE32B10E0AC
 for <intel-xe@lists.freedesktop.org>; Sat,  8 Jun 2024 11:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717847133; x=1749383133;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=e3eYKkY+X+yctDdzOAQRq16O6DLV2hvzvnGD8bzpkbM=;
 b=Poi3pAe/wMCDEAekrWJBU2aVYN6SMZdN/nol3R0IIJ+uDCUzh+dIfxMV
 /hFiTlplTfOWM5uPpAfVe4zMKa8khqySG4BGFs35CRxmO8f1q3Dd5QlpA
 yEB1+ZyA6IwnwBTY/4b39fwNnIdPg6G6uysSfC4enuoCou7HCY4DsoNSi
 Osd6mbWDYjCQu2CaX47s1qKAUSTViB72JGI6ZEPkgoIkyjDkLVt7Ey3Vc
 JYJV74Puy3M6zIAeboaseLz1Qbh2xxfEQuJMQ8xrZq8vnH4ajyGQDB1l4
 QhQbqo9a2q6Rm9eVqwmUWb2SnBY/yjtEB4PyabQLb7evawIlYA8fK1Y6W Q==;
X-CSE-ConnectionGUID: 9FjQIIorQTSX2nbFErC0Sg==
X-CSE-MsgGUID: pMvqnHjlRUacMiQTAkmEvw==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14305877"
X-IronPort-AV: E=Sophos;i="6.08,223,1712646000"; d="scan'208";a="14305877"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2024 04:45:32 -0700
X-CSE-ConnectionGUID: zAtJGmzmT1C2hPwORPrQ5Q==
X-CSE-MsgGUID: lL/NAIRNQxStcyvJoQOUnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,223,1712646000"; d="scan'208";a="38430396"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa007.fm.intel.com with ESMTP; 08 Jun 2024 04:45:30 -0700
Received: from [10.245.82.128] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.82.128])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 7FA7327BAF;
 Sat,  8 Jun 2024 12:45:24 +0100 (IST)
Message-ID: <3facdf80-ca8a-41ee-9f5c-59b9c1e41beb@intel.com>
Date: Sat, 8 Jun 2024 13:45:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/17] drm/xe/oa: Override GuC RC with OA on PVC
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, intel-xe@lists.freedesktop.org
References: <20240607204322.1966831-1-ashutosh.dixit@intel.com>
 <20240607204322.1966831-16-ashutosh.dixit@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240607204322.1966831-16-ashutosh.dixit@intel.com>
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



On 07.06.2024 22:43, Ashutosh Dixit wrote:
> On PVC, a w/a resets RCS/CCS before it goes into RC6. This breaks OA since
> OA does not expect engine resets during its use. Fix it by disabling RC6.
> 
> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c   | 57 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_pc.h   |  3 ++
>  drivers/gpu/drm/xe/xe_oa.c       | 23 +++++++++++++
>  drivers/gpu/drm/xe/xe_oa_types.h |  3 ++
>  4 files changed, 86 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 508f0d39b4ad..9f9a4132c399 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -24,6 +24,7 @@
>  #include "xe_map.h"
>  #include "xe_mmio.h"
>  #include "xe_pcode.h"
> +#include "xe_pm.h"
>  
>  #define MCHBAR_MIRROR_BASE_SNB	0x140000
>  
> @@ -191,6 +192,27 @@ static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
>  	return ret;
>  }
>  
> +static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
> +{
> +	struct xe_guc_ct *ct = &pc_to_guc(pc)->ct;
> +	int ret;

Xe driver BKM is to keep var declarations in reversed xmas tree order

> +	u32 action[] = {
> +		GUC_ACTION_HOST2GUC_PC_SLPC_REQUEST,
> +		SLPC_EVENT(SLPC_EVENT_PARAMETER_UNSET, 1),
> +		id,
> +	};
> +
> +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
> +		return -EAGAIN;
> +
> +	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> +	if (ret)
> +		drm_err(&pc_to_xe(pc)->drm, "GuC PC unset param failed: %pe",
> +			ERR_PTR(ret));

please use xe_gt_err(gt, ...)

hmm, but I can see right now that this is a common mistake in this file,
likely we need to fix that first

> +
> +	return ret;
> +}
> +
>  static int pc_action_setup_gucrc(struct xe_guc_pc *pc, u32 mode)
>  {
>  	struct xe_guc_ct *ct = &pc_to_guc(pc)->ct;
> @@ -773,6 +795,41 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
>  	return 0;
>  }
>  
> +/**
> + * xe_guc_pc_override_gucrc_mode - override GUCRC mode
> + * @pc: Xe_GuC_PC instance
> + * @mode: new value of the mode.
> + *
> + * Return: 0 on success, negative error code on error
> + */
> +int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mode)
> +{
> +	int ret;
> +
> +	xe_pm_runtime_get(pc_to_xe(pc));
> +	ret = pc_action_set_param(pc, SLPC_PARAM_PWRGATE_RC_MODE, mode);
> +	xe_pm_runtime_put(pc_to_xe(pc));
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_guc_pc_unset_gucrc_mode - unset GUCRC mode override
> + * @pc: Xe_GuC_PC instance
> + *
> + * Return: 0 on success, negative error code on error
> + */
> +int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc)
> +{
> +	int ret;
> +
> +	xe_pm_runtime_get(pc_to_xe(pc));
> +	ret = pc_action_unset_param(pc, SLPC_PARAM_PWRGATE_RC_MODE);
> +	xe_pm_runtime_put(pc_to_xe(pc));
> +
> +	return ret;
> +}
> +
>  static void pc_init_pcode_freq(struct xe_guc_pc *pc)
>  {
>  	u32 min = DIV_ROUND_CLOSEST(pc->rpn_freq, GT_FREQUENCY_MULTIPLIER);
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index 532cac985a6d..eb5bba9f0736 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -9,11 +9,14 @@
>  #include <linux/types.h>
>  
>  struct xe_guc_pc;
> +#include "abi/guc_actions_slpc_abi.h"

bad order (all #includes shall be before forward decls) but...

that's unfortunate that you need ABI definitions here at all (as slpc
gucrc modes were defined as enum not plain values) but maybe it would be
sufficient to just use forward declaration of that enum:

	enum slpc_gucrc_mode;

>  
>  int xe_guc_pc_init(struct xe_guc_pc *pc);
>  int xe_guc_pc_start(struct xe_guc_pc *pc);
>  int xe_guc_pc_stop(struct xe_guc_pc *pc);
>  int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
> +int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mode);
> +int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc);
>  
>  u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc);
>  int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq);
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 5cb0cbb58a1d..c89b11f5e01e 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -24,6 +24,7 @@
>  #include "xe_force_wake.h"
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
> +#include "xe_guc_pc.h"
>  #include "xe_lrc.h"
>  #include "xe_macros.h"
>  #include "xe_mmio.h"
> @@ -815,6 +816,10 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>  	xe_pm_runtime_put(stream->oa->xe);
>  
> +	/* Wa_1509372804:pvc: Unset the override of GUCRC mode to enable rc6 */
> +	if (stream->override_gucrc)
> +		XE_WARN_ON(xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));

that doesn't look like a good pattern, more clear way would be:

	if (...) {
		err = xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc);
		xe_gt_WARN(gt, err, "explain what just happen");
	}

> +
>  	xe_oa_free_configs(stream);
>  }
>  
> @@ -1303,6 +1308,21 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
>  		goto exit;
>  	}
>  
> +	/*
> +	 * Wa_1509372804:pvc
> +	 *
> +	 * GuC reset of engines causes OA to lose configuration
> +	 * state. Prevent this by overriding GUCRC mode.
> +	 */
> +	if (stream->oa->xe->info.platform == XE_PVC) {
> +		ret = xe_guc_pc_override_gucrc_mode(&gt->uc.guc.pc,
> +						    SLPC_GUCRC_MODE_GUCRC_NO_RC6);
> +		if (ret)
> +			goto err_free_configs;
> +
> +		stream->override_gucrc = true;
> +	}
> +
>  	/* Take runtime pm ref and forcewake to disable RC6 */
>  	xe_pm_runtime_get(stream->oa->xe);
>  	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> @@ -1349,6 +1369,9 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
>  err_fw_put:
>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>  	xe_pm_runtime_put(stream->oa->xe);
> +	if (stream->override_gucrc)
> +		XE_WARN_ON(xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));

ditto

> +err_free_configs:
>  	xe_oa_free_configs(stream);
>  exit:
>  	return ret;
> diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
> index 7f7c84e4b3a6..7775fe91616f 100644
> --- a/drivers/gpu/drm/xe/xe_oa_types.h
> +++ b/drivers/gpu/drm/xe/xe_oa_types.h
> @@ -220,6 +220,9 @@ struct xe_oa_stream {
>  	/** @poll_period_ns: hrtimer period for checking OA buffer for available data */
>  	u64 poll_period_ns;
>  
> +	/** @override_gucrc: GuC RC has been overridden for the OA stream */
> +	bool override_gucrc;
> +
>  	/** @oa_status: temporary storage for oa_status register value */
>  	u32 oa_status;
>  };
