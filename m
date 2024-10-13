Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ECE7CF2579
	for <intel-xe@archiver.kernel.org>; Sun, 13 Oct 2024 17:40:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1842010E0DC;
	Sun, 13 Oct 2024 17:40:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MT3zvf9r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 784F310E0DC
 for <intel-xe@lists.freedesktop.org>; Sun, 13 Oct 2024 17:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728841237; x=1760377237;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=RcFag9WYXQVvGBIDP/+gYURWo7xOveJkF73saaMBP58=;
 b=MT3zvf9rPko0vDJP6pfQ5yJxY0tc76ysuDJ+O4+X9O5TuZj78ze3GhNm
 DHIOI8NpkLZlaI40y4HWw6J0AK1VdwrdUniOJoUMbfYcbDh+7HB2jdvl/
 Lt979lQgbtiG6HDgEg9Bcgq+ddRokRdybBUFdgYKK8P8Wb8EnG1a2RUxd
 IHC3XBs8+hh9DQl7JXO0CBdx4/jqzhvfvZHpbTZEqq0Drrwvs+w7VF1oN
 w5NomooRZHRIPNhl0YcPZKMZ38BaVX4WUnlFKfCowmBl34eLHe/KWm17D
 AlMH0IWnAgda5Rrd54ZT6mAt/kYnjv8zjoN8IQ9pBkPkv/FjuvwWf7w85 Q==;
X-CSE-ConnectionGUID: pNxNrU3PQLqy49jqFDoTTw==
X-CSE-MsgGUID: R6+5TToZTciE16ZQ3xB+Vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="39572910"
X-IronPort-AV: E=Sophos;i="6.11,201,1725346800"; d="scan'208";a="39572910"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2024 10:39:27 -0700
X-CSE-ConnectionGUID: JPKR2xrpSg6XwcbYxY4tFQ==
X-CSE-MsgGUID: wRwkoiasRZCPB9FjyL2Yng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,201,1725346800"; d="scan'208";a="77231391"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa009.jf.intel.com with ESMTP; 13 Oct 2024 10:39:25 -0700
Received: from [10.245.97.255] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.97.255])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 7633227BD1;
 Sun, 13 Oct 2024 18:39:22 +0100 (IST)
Message-ID: <eb9a0ff3-3d5b-406d-85f3-cf38ddd5f0e0@intel.com>
Date: Sun, 13 Oct 2024 19:39:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] drm/xe/vf: Send RESFIX_DONE message at end of VF
 restore
To: Tomasz Lis <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
References: <20241007201631.3369513-1-tomasz.lis@intel.com>
 <20241007201631.3369513-3-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20241007201631.3369513-3-tomasz.lis@intel.com>
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



On 07.10.2024 22:16, Tomasz Lis wrote:
> After restore, GuC will not answer to any messages from VF KMD until
> fixups are applied. When that is done, VF KMD sends RESFIX_DONE
> message to GuC, at which point GuC resumes normal operation.

maybe we can add some small DOC section with sequence diagram?

> 
> This patch implements sending the RESFIX_DONE message at end of
> post-migration recovery.
> 
> v2: keep pm ref during whole recovery, style fixes (Michal)
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 38 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 36 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h           |  1 +
>  drivers/gpu/drm/xe/xe_guc.c                   |  3 +-
>  drivers/gpu/drm/xe/xe_sriov_vf.c              | 23 +++++++++++
>  5 files changed, 100 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> index b6a1852749dd..0b28659d94e9 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> @@ -501,6 +501,44 @@
>  #define VF2GUC_VF_RESET_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
>  #define VF2GUC_VF_RESET_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
>  
> +/**
> + * DOC: VF2GUC_NOTIFY_RESFIX_DONE
> + *
> + * This action is used by VF to notify the GuC that the VF KMD has completed
> + * post-migration recovery steps.
> + *
> + * This message must be sent as `MMIO HXG Message`_.
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 27:16 | DATA0 = MBZ                                                  |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE` = 0x5508    |
> + *  +---+-------+--------------------------------------------------------------+
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_GUC_                                 |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  27:0 | DATA0 = MBZ                                                  |
> + *  +---+-------+--------------------------------------------------------------+
> + */
> +#define GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE		0x5508u
> +
> +#define VF2GUC_NOTIFY_RESFIX_DONE_REQUEST_MSG_LEN	GUC_HXG_REQUEST_MSG_MIN_LEN
> +#define VF2GUC_NOTIFY_RESFIX_DONE_REQUEST_MSG_0_MBZ	GUC_HXG_REQUEST_MSG_0_DATA0
> +
> +#define VF2GUC_NOTIFY_RESFIX_DONE_RESPONSE_MSG_LEN	GUC_HXG_RESPONSE_MSG_MIN_LEN
> +#define VF2GUC_NOTIFY_RESFIX_DONE_RESPONSE_MSG_0_MBZ	GUC_HXG_RESPONSE_MSG_0_DATA0
> +
>  /**
>   * DOC: VF2GUC_QUERY_SINGLE_KLV
>   *
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 38dd17f278de..01e5ff661437 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -224,6 +224,42 @@ int xe_gt_sriov_vf_bootstrap(struct xe_gt *gt)
>  	return 0;
>  }
>  
> +static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
> +{
> +	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
> +		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
> +		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE),
> +	};
> +	int ret;
> +
> +	ret = xe_guc_mmio_send(guc, request, ARRAY_SIZE(request));
> +
> +	return ret > 0 ? -EPROTO : ret;
> +}
> +
> +/**
> + * xe_gt_sriov_vf_notify_resfix_done - Notify GuC about resource fixups apply completed.
> + * @gt: the &xe_gt struct instance linked to target GuC
> + *
> + * Returns: 0 if the operation completed successfully, or a negative error
> + * code otherwise.
> + */
> +int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt)
> +{
> +	struct xe_guc *guc = &gt->uc.guc;
> +	int err;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	err = guc_action_vf_notify_resfix_done(guc);
> +	if (unlikely(err))
> +		xe_gt_sriov_err(gt, "Failed to notify GuC about resource fixup done (%pe)\n",
> +				ERR_PTR(err));
> +
> +	return err;
> +}
> +
>  static int guc_action_query_single_klv(struct xe_guc *guc, u32 key,
>  				       u32 *value, u32 value_len)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index 9959a296b221..912d20814261 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -17,6 +17,7 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
>  int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>  int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>  int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
> +int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
>  void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>  
>  u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index fb5704526954..e563fd2f818f 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -939,7 +939,8 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  
>  	BUILD_BUG_ON(VF_SW_FLAG_COUNT != MED_VF_SW_FLAG_COUNT);
>  
> -	xe_assert(xe, !xe_guc_ct_enabled(&guc->ct));
> +	/* this call can happen with CTB enabled during VF migration */
> +	xe_assert(xe, IS_SRIOV_VF(xe) || !xe_guc_ct_enabled(&guc->ct));

I would drop this assert completely and do that in a separate patch

>  	xe_assert(xe, len);
>  	xe_assert(xe, len <= VF_SW_FLAG_COUNT);
>  	xe_assert(xe, len <= MED_VF_SW_FLAG_COUNT);
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index b8c54926bdaa..c8cbd17d88d3 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -8,6 +8,8 @@
>  #include "xe_assert.h"
>  #include "xe_device.h"
>  #include "xe_gt_sriov_printk.h"
> +#include "xe_gt_sriov_vf.h"
> +#include "xe_pm.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_vf.h"
>  #include "xe_sriov_printk.h"
> @@ -23,10 +25,31 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
>  	INIT_WORK(&xe->sriov.vf.migration.worker, migration_worker_func);
>  }
>  
> +/*
> + * vf_post_migration_notify_resfix_done - Notify all GuCs about resource fixups apply finished.
> + * @xe: the &xe_device struct instance

I'm still not convinced that we need this quasi-kernel-doc for static
function ... maybe just give it a more descriptive name?

	vf_post_migration_notify_all_guc_resfix_done

> + */
> +static void vf_post_migration_notify_resfix_done(struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +	int err, num_sent = 0;
> +
> +	for_each_gt(gt, xe, id) {
> +		err = xe_gt_sriov_vf_notify_resfix_done(gt);
> +		if (!err)
> +			num_sent++;
> +	}
> +	drm_dbg(&xe->drm, "sent %d VF resource fixups done notifications\n", num_sent);

hmm, is this message really so useful? maybe just add separate
xe_gt_sriov_dbg_verbose() to xe_gt_sriov_vf_notify_resfix_done() so we
will see each notification (and we can easily count to two if needed)

> +}
> +
>  static void vf_post_migration_recovery(struct xe_device *xe)
>  {
>  	drm_dbg(&xe->drm, "migration recovery in progress\n");
> +	xe_pm_runtime_get(xe);
>  	/* FIXME: add the recovery steps */
> +	vf_post_migration_notify_resfix_done(xe);
> +	xe_pm_runtime_put(xe);
>  	drm_notice(&xe->drm, "migration recovery ended\n");
>  }
>  

