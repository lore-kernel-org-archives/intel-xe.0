Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3CD7CF9C69
	for <intel-xe@archiver.kernel.org>; Mon, 23 Sep 2024 11:55:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86CD610E1D0;
	Mon, 23 Sep 2024 11:55:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I32Kjvan";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B49C210E1D0
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Sep 2024 11:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727092512; x=1758628512;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=fbh6FA/HRveA/rin4I5UIRE7TFp99mkmR1T2E4Vz9sE=;
 b=I32Kjvan/mT6DfkfxIscP5CHiHPpIKKGIAwU7MX7iBxJ5baRvsQU/d2t
 qz+gbrqO+Iw9cctMI21hxbHfXxsluhSYkPNMVFg94nHzdOHeSQh7D03Xg
 su7GCAUHaL6rGVAoR4DQ6MSVhutNyg7gNW3ffSpoMWznl9KYiLCr/cAzr
 /4GbBMXZ6RU4W4Gx/MbLnoSCe7vTiGykxKwit/Ye2fr0zp7Zu5g5mb0Jb
 dWygDFS0qaCcz0Xedej1+mi/SW1qakG2Kj7Ncp5fbYUw4XKtCsa35p09c
 /Z96LRPTrP6CjyGD6zellRkxAOVryHb816kuNpp0QiBiVO+5l1Dygz68/ w==;
X-CSE-ConnectionGUID: BHWuFcQVRWyGxUuT0uDEHg==
X-CSE-MsgGUID: foOWKJdER6uBFP5gzlI9UA==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="26190065"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="26190065"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 04:55:11 -0700
X-CSE-ConnectionGUID: WU1AQzY6TFqCM/fbOgKQEA==
X-CSE-MsgGUID: mXsTcqlYTF+lE9ZqfJCKVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="71320212"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa010.fm.intel.com with ESMTP; 23 Sep 2024 04:55:09 -0700
Received: from [10.245.84.117] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.84.117])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 6A6AD27BC1;
 Mon, 23 Sep 2024 12:55:08 +0100 (IST)
Message-ID: <02158df1-ea94-4fb2-a649-3e3f38ff8d64@intel.com>
Date: Mon, 23 Sep 2024 13:55:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/xe/vf: Send RESFIX_DONE message at end of VF
 restore
To: Tomasz Lis <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
References: <20240920222926.846985-1-tomasz.lis@intel.com>
 <20240920222926.846985-3-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240920222926.846985-3-tomasz.lis@intel.com>
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



On 21.09.2024 00:29, Tomasz Lis wrote:
> After restore, GuC will not answer to any messages from VF KMD until
> fixups are applied. When that is done, VF KMD sends RESFIX_DONE
> message to GuC, at which point GuC resumes normal operation.
> 
> This patch implements sending the RESFIX_DONE message at end of
> post-migration recovery.
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 38 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 33 ++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h           |  1 +
>  drivers/gpu/drm/xe/xe_sriov_vf.c              | 23 +++++++++++
>  4 files changed, 95 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> index b6a1852749dd..74874bbba10c 100644
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
> +#define GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE		0x5508

please make it unsigned (like all newer definitions)	0x5508u

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
> index d3baba50f085..08b5f6912923 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -223,6 +223,39 @@ int xe_gt_sriov_vf_bootstrap(struct xe_gt *gt)
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

don't forget about "Return:"

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
> index e541ce57bec2..97e8c76a641a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -17,6 +17,7 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
>  int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>  int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>  int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
> +int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
>  
>  u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index b068c57b2bdc..459fa936aaba 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -7,8 +7,10 @@
>  
>  #include "xe_assert.h"
>  #include "xe_device.h"
> +#include "xe_gt_sriov_vf.h"
>  #include "xe_guc_ct.h"
>  #include "xe_module.h"
> +#include "xe_pm.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_vf.h"
>  #include "xe_sriov_printk.h"
> @@ -20,10 +22,31 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
>  	INIT_WORK(&xe->sriov.vf.migration_worker, migration_worker_func);
>  }
>  
> +/*
> + * vf_post_migration_notify_resfix_done - Notify all GuCs about resource fixups apply finished.
> + * @xe: the &xe_device struct instance
> + */
> +static void vf_post_migration_notify_resfix_done(struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +	int err, num_sent = 0;
> +
> +	xe_pm_runtime_get(xe);

maybe pm_get/put can done once inside the top level recovery function:
vf_post_migration_recovery()

> +	for_each_gt(gt, xe, id) {
> +		err = xe_gt_sriov_vf_notify_resfix_done(gt);
> +		if (!err)
> +			num_sent++;
> +	}
> +	xe_pm_runtime_put(xe);
> +	drm_dbg(&xe->drm, "sent %d VF resource fixups done notifications\n", num_sent);

hmm, so what's the plan for handling the cases when one or all
notify-fixup-done fail? are we going wedge or will silently ignore like
here?

> +}
> +
>  static void vf_post_migration_recovery(struct xe_device *xe)
>  {
>  	drm_dbg(&xe->drm, "migration recovery in progress\n");
>  	/* FIXME: add the recovery steps */
> +	vf_post_migration_notify_resfix_done(xe);

hmm, shouldn't we have some kind of guard to actually track whether we
succeed with the fixups and only then send notify-done?

otherwise in addition that we're already cheating the user with below
message 'recovery-completed', now we cheating the GuC that 'fixup-done'

there likely always be a cases where something went wrong, so we either
end up with reset or wedge, so maybe we should also start with that and
only send 'fixup-done' when passing all post-migration steps

>  	drm_notice(&xe->drm, "migration recovery completed\n");
>  }
>  

