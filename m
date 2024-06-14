Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49491C27C79
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 12:31:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0AFD10ED13;
	Fri, 14 Jun 2024 12:31:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PZhtvMuw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1268F10E083
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 12:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718368283; x=1749904283;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=JrRfve7Ulke4AHaOR7vYsUBd7lgNwkbFHWcmSyYsT+c=;
 b=PZhtvMuwYdrEfxGwxP2UDaGxd6D+oYBJnJvZduk5AmXn4FllXyBRwS06
 Y4LAkWIIGVEfhOT74+B0etTUzqrWXTQLxZNGUBqAnmIemckztVO06m/pp
 xRIPNZEoK5WVP9cHiHMV4bEX5bmkPCZaDheODxHpmJuRit3/a3YG/bvW6
 VuHYz3Az5FSicpzfVkSxwhDv3YRYTFHbBBH9S6xdBs3MpsMZC60Fg1NKz
 lhvBnt9okBHSAo8a7DvxDWKsuGlrQwPzC7RIDupzN9FK9f2aNun18OwEl
 nMr3mDQ3vC3H2gR3Fx4GzYTA75crxy82CbJXiN4s/EWORSnG2iUHFmfA8 g==;
X-CSE-ConnectionGUID: SqpRTbZlT/ClIvLYu4iKhw==
X-CSE-MsgGUID: iDnvP3L+Q2aA7rM4fhxZ8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="18171468"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="18171468"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 05:31:22 -0700
X-CSE-ConnectionGUID: 4LVLMBcxS6inv2CJCOCiXw==
X-CSE-MsgGUID: NyJbuKZGS32Buj7+tAZ+ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="45606599"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa004.jf.intel.com with ESMTP; 14 Jun 2024 05:31:15 -0700
Received: from [10.246.19.248] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.19.248])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 18FC128778;
 Fri, 14 Jun 2024 13:31:11 +0100 (IST)
Message-ID: <16fc6a09-dc8f-49ff-a0a3-6abf49a81c94@intel.com>
Date: Fri, 14 Jun 2024 14:31:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/4] drm/xe/guc: Extract GuC capture lists to register
 snapshot
To: Zhanjun Dong <zhanjun.dong@intel.com>, intel-xe@lists.freedesktop.org
References: <20240607000719.1012422-1-zhanjun.dong@intel.com>
 <20240607000719.1012422-5-zhanjun.dong@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240607000719.1012422-5-zhanjun.dong@intel.com>
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



On 07.06.2024 02:07, Zhanjun Dong wrote:
> Upon the G2H Notify-Err-Capture event, parse through the
> GuC Log Buffer (error-capture-subregion) and generate one or
> more capture-nodes. A single node represents a single "engine-
> instance-capture-dump" and contains at least 3 register lists:
> global, engine-class and engine-instance. An internal link
> list is maintained to store one or more nodes.
> Because the link-list node generation happen before the call
> to devcoredump, duplicate global and engine-class register
> lists for each engine-instance register dump if we find
> dependent-engine resets in a engine-capture-group.
> When xe_devcoredump calls into snapshot_from_capture_engine,
> we detach the matching node (guc-id, LRCA, etc) from the link list
> above and attach it to snapshot_regs structure when have
> matching LRCA/guc-id/engine-instance.
> 
> To avoid dynamically allocate the output nodes during gt reset,
> pre-allocate a fixed number of empty nodes up front (at the
> time of ADS registration) that we can consume from or return to
> an internal cached list of nodes.
> Add guc capture data structure definition.
> 
> Add xe_hw_engine_snapshot_from_capture to take snapshot from capture
> node list.
> Move snapshot register struct out of engine snapshot struct.
> Add offset in snapshot register to register definition list at
> xe_guc_capture.c.
> Snapshot could be split into global, engine class, engine instance
> and steering register zone, few macros defined to separate zones.
> Support combines 2 32bit registers as a 64bit register in snapshot,
> perform endian convert if needed.
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_actions_abi.h  |   7 +
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h      |   2 +
>  drivers/gpu/drm/xe/xe_devcoredump.c       |   4 +
>  drivers/gpu/drm/xe/xe_devcoredump_types.h |   2 +
>  drivers/gpu/drm/xe/xe_guc.h               |  23 +
>  drivers/gpu/drm/xe/xe_guc_capture.c       | 876 +++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_guc_capture.h       |   9 +
>  drivers/gpu/drm/xe/xe_guc_capture_fwif.h  |  45 ++
>  drivers/gpu/drm/xe/xe_guc_ct.c            |   2 +
>  drivers/gpu/drm/xe/xe_guc_fwif.h          |   6 +
>  drivers/gpu/drm/xe/xe_guc_submit.c        |  63 +-
>  drivers/gpu/drm/xe/xe_guc_submit.h        |   2 +
>  drivers/gpu/drm/xe/xe_hw_engine.c         | 218 ++++--
>  drivers/gpu/drm/xe/xe_hw_engine_types.h   | 159 ++--
>  drivers/gpu/drm/xe/xe_lrc.h               |   1 +
>  15 files changed, 1244 insertions(+), 175 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> index 79ba98a169f9..ed1eeea34e8e 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> @@ -182,6 +182,13 @@ enum xe_guc_sleep_state_status {
>  #define GUC_LOG_CONTROL_VERBOSITY_MASK	(0xF << GUC_LOG_CONTROL_VERBOSITY_SHIFT)
>  #define GUC_LOG_CONTROL_DEFAULT_LOGGING	(1 << 8)
>  
> +enum intel_guc_state_capture_event_status {
> +	XE_GUC_STATE_CAPTURE_EVENT_STATUS_SUCCESS = 0x0,
> +	XE_GUC_STATE_CAPTURE_EVENT_STATUS_NOSPACE = 0x1,
> +};
> +
> +#define XE_GUC_STATE_CAPTURE_EVENT_STATUS_MASK      0x000000FF
> +
>  #define XE_GUC_TLB_INVAL_TYPE_SHIFT 0
>  #define XE_GUC_TLB_INVAL_MODE_SHIFT 8
>  /* Flush PPC or SMRO caches along with TLB invalidation request */
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index d09b2473259f..c6bd50738e2b 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -574,4 +574,6 @@
>  #define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
>  #define   GT_RENDER_USER_INTERRUPT		REG_BIT(0)
>  
> +#define SFC_DONE(n)				XE_REG(0x1cc000 + (n) * 0x1000)
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index d7f2d19a77c1..5e80710d3cc8 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -16,6 +16,7 @@
>  #include "xe_force_wake.h"
>  #include "xe_gt.h"
>  #include "xe_gt_printk.h"
> +#include "xe_guc_capture.h"
>  #include "xe_guc_ct.h"
>  #include "xe_guc_submit.h"
>  #include "xe_hw_engine.h"
> @@ -149,10 +150,12 @@ static void xe_devcoredump_free(void *data)
>  		if (coredump->snapshot.hwe[i])
>  			xe_hw_engine_snapshot_free(coredump->snapshot.hwe[i]);
>  	xe_vm_snapshot_free(coredump->snapshot.vm);
> +	xe_guc_capture_free(&coredump->snapshot.gt->uc.guc);
>  
>  	/* To prevent stale data on next snapshot, clear everything */
>  	memset(&coredump->snapshot, 0, sizeof(coredump->snapshot));
>  	coredump->captured = false;
> +	coredump->job = NULL;
>  	drm_info(&coredump_to_xe(coredump)->drm,
>  		 "Xe device coredump has been deleted.\n");
>  }
> @@ -186,6 +189,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>  		put_task_struct(task);
>  
>  	ss->gt = q->gt;
> +	coredump->job = job;
>  	INIT_WORK(&ss->work, xe_devcoredump_deferred_snap_work);
>  
>  	cookie = dma_fence_begin_signalling();
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> index 923cdf72a816..c39ab73a9f6a 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> @@ -61,6 +61,8 @@ struct xe_devcoredump {
>  	bool captured;
>  	/** @snapshot: Snapshot is captured at time of the first crash */
>  	struct xe_devcoredump_snapshot snapshot;
> +	/** @job: Point to the issue job */
> +	struct xe_sched_job *job;
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index ddfa855458ab..e1afda9070f4 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -59,6 +59,29 @@ static inline u16 xe_engine_class_to_guc_class(enum xe_engine_class class)
>  	}
>  }
>  
> +static inline u16 xe_guc_class_to_capture_class(uint class)
> +{
> +	switch (class) {
> +	case GUC_RENDER_CLASS:
> +	case GUC_COMPUTE_CLASS:
> +		return GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE;
> +	case GUC_GSC_OTHER_CLASS:
> +		return GUC_CAPTURE_LIST_CLASS_GSC_OTHER;
> +	case GUC_VIDEO_CLASS:
> +	case GUC_VIDEOENHANCE_CLASS:
> +	case GUC_BLITTER_CLASS:
> +		return class;
> +	default:
> +		XE_WARN_ON(class);
> +		return -1;

it doesn't look like a safe value nor that you handle it correctly

> +	}
> +}
> +
> +static inline u16 xe_engine_class_to_guc_capture_class(enum xe_engine_class class)
> +{
> +	return xe_guc_class_to_capture_class(xe_guc_class_to_capture_class(class));

are you sure this is correct ?

> +}
> +
>  static inline struct xe_gt *guc_to_gt(struct xe_guc *guc)
>  {
>  	return container_of(guc, struct xe_gt, uc.guc);
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index 0c90def290de..f18933503672 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -26,10 +26,13 @@
>  #include "xe_guc_capture_fwif.h"
>  #include "xe_guc_ct.h"
>  #include "xe_guc_log.h"
> +#include "xe_guc_submit_types.h"
>  #include "xe_guc_submit.h"
>  #include "xe_hw_engine_types.h"
> +#include "xe_lrc.h"
>  #include "xe_macros.h"
>  #include "xe_map.h"
> +#include "xe_sched_job.h"
>  
>  /*
>   * Define all device tables of GuC error capture register lists
> @@ -37,28 +40,81 @@
>   *       from the engine-mmio-base
>   */
>  #define COMMON_XELP_BASE_GLOBAL \
> -	{ FORCEWAKE_GT,		    0,      0}
> +	{ FORCEWAKE_GT,				0,	0, "FORCEWAKE_GT",\
> +	  offsetof(struct snapshot_regs, forcewake_gt)	}
>  
>  #define COMMON_BASE_ENGINE_INSTANCE \
> -	{ RING_ESR(0),              0,      0}, \
> -	{ RING_EMR(0),              0,      0}, \
> -	{ RING_EIR(0),              0,      0}, \
> -	{ RING_EXECLIST_STATUS_HI(0), 0,    0}, \
> -	{ RING_EXECLIST_STATUS_LO(0), 0,    0}, \
> -	{ RING_DMA_FADD(0),         0,      0}, \
> -	{ RING_DMA_FADD_UDW(0),     0,      0}, \
> -	{ RING_IPEHR(0),            0,      0}, \
> -	{ RING_BBADDR(0),           0,      0}, \
> -	{ RING_BBADDR_UDW(0),       0,      0}, \
> -	{ RING_ACTHD(0),            0,      0}, \
> -	{ RING_ACTHD_UDW(0),        0,      0}, \
> -	{ RING_START(0),            0,      0}, \
> -	{ RING_HEAD(0),             0,      0}, \
> -	{ RING_TAIL(0),             0,      0}, \
> -	{ RING_CTL(0),              0,      0}, \
> -	{ RING_MI_MODE(0),          0,      0}, \
> -	{ RING_HWS_PGA(0),          0,      0}, \
> -	{ RING_MODE(0),             0,      0}
> +	{ RING_HWSTAM(0),			0,	0, "HWSTAM",\
> +	  offsetof(struct snapshot_regs, ring_hwstam)	}, \
> +	{ RING_HWS_PGA(0),			0,	0, "RING_HWS_PGA",\
> +	  offsetof(struct snapshot_regs, ring_hws_pga)	}, \
> +	{ RING_HEAD(0),				0,	0, "RING_HEAD",\
> +	  offsetof(struct snapshot_regs, ring_head)	}, \
> +	{ RING_TAIL(0),				0,	0, "RING_TAIL",\
> +	  offsetof(struct snapshot_regs, ring_tail)	}, \
> +	{ RING_CTL(0),				0,	0, "RING_CTL",\
> +	  offsetof(struct snapshot_regs, ring_ctl)	}, \
> +	{ RING_MI_MODE(0),			0,	0, "RING_MI_MODE",\
> +	  offsetof(struct snapshot_regs, ring_mi_mode)	}, \
> +	{ RING_MODE(0),				0,	0, "RING_MODE",\
> +	  offsetof(struct snapshot_regs, ring_mode)	}, \
> +	{ RING_ESR(0),				0,	0, "RING_ESR",\
> +	  offsetof(struct snapshot_regs, ring_esr)	}, \
> +	{ RING_EMR(0),				0,	0, "RING_EMR",\
> +	  offsetof(struct snapshot_regs, ring_emr)	}, \
> +	{ RING_EIR(0),				0,	0, "RING_EIR",\
> +	  offsetof(struct snapshot_regs, ring_eir)	}, \
> +	{ RING_IMR(0),				0,	0, "RING_IMR",\
> +	  offsetof(struct snapshot_regs, ring_imr)	}, \
> +	{ RING_IPEHR(0),			0,	0, "IPEHR",\
> +	  offsetof(struct snapshot_regs, ipehr)		}, \
> +	/* 64 bit register - Start */			   \
> +	/* defined XE_GUC_SNAPSHOT_REGS_U64_START_REG_ADDR to the address of 1st register below */ \
> +	/* into xe_hw_engine_types.h				*/ \
> +	{ RING_ACTHD(0),			0,	0, "ACTHD",\
> +	  offsetof(struct snapshot_regs, ring_acthd)	}, \
> +	{ RING_ACTHD_UDW(0),			0,	0, NULL,\
> +	  offsetof(struct snapshot_regs, ring_acthd) + 4}, \
> +	{ RING_BBADDR(0),			0,	0, "RING_BBADDR",\
> +	  offsetof(struct snapshot_regs, ring_bbaddr)	}, \
> +	{ RING_BBADDR_UDW(0),			0,	0, NULL,\
> +	  offsetof(struct snapshot_regs, ring_bbaddr) + 4}, \
> +	{ RING_START(0),			0,	0, "RING_START",\
> +	  offsetof(struct snapshot_regs, ring_start)	}, \
> +	{ RING_START_UDW(0),			0,	0, NULL,\
> +	  offsetof(struct snapshot_regs, ring_start) + 4}, \
> +	{ RING_DMA_FADD(0),			0,	0, "RING_DMA_FADD",\
> +	  offsetof(struct snapshot_regs, ring_dma_fadd)	}, \
> +	{ RING_DMA_FADD_UDW(0),			0,	0, NULL,\
> +	  offsetof(struct snapshot_regs, ring_dma_fadd) + 4}, \
> +	{ RING_EXECLIST_STATUS_LO(0),		0,	0, "RING_EXECLIST_STATUS",\
> +	  offsetof(struct snapshot_regs, ring_execlist_status)}, \
> +	{ RING_EXECLIST_STATUS_HI(0),		0,	0, NULL,\
> +	  offsetof(struct snapshot_regs, ring_execlist_status) + 4}, \
> +	{ RING_EXECLIST_SQ_CONTENTS_LO(0),	0,	0, "RING_EXECLIST_SQ_CONTENTS",\
> +	  offsetof(struct snapshot_regs, ring_execlist_sq_contents)}, \
> +	{ RING_EXECLIST_SQ_CONTENTS_HI(0),	0,	0, NULL,\
> +	  offsetof(struct snapshot_regs, ring_execlist_sq_contents) + 4}, \
> +	/* 64 bit register - End */			   \
> +	/* Extra handling registers */				   \
> +	/* define XE_GUC_SNAPSHOT_EXTRA_OPERATION_REGS_START_REG_ADDR to the address of 1st */ \
> +	/* register below into xe_hw_engine_types.h				*/ \
> +	{ INDIRECT_RING_STATE(0),		0,	0, "INDIRECT_RING_STATE",\
> +	  offsetof(struct snapshot_regs, indirect_ring_state)}
> +
> +#define COMMON_XELP_RC_CLASS \
> +	{ RCU_MODE,				0,	0, "RCU_MODE",\
> +	  offsetof(struct snapshot_regs, rcu_mode)	}
> +
> +#define XELP_DIRECT_READ_VEC_CLASS \
> +	{ SFC_DONE(0),				0,	0, "SFC_DONE[0]", \
> +	  offsetof(struct snapshot_regs, sfc_done_0)	}, \
> +	{ SFC_DONE(1),				0,	0, "SFC_DONE[1]", \
> +	  offsetof(struct snapshot_regs, sfc_done_1)	}, \
> +	{ SFC_DONE(2),				0,	0, "SFC_DONE[2]", \
> +	  offsetof(struct snapshot_regs, sfc_done_2)	}, \
> +	{ SFC_DONE(3),				0,	0, "SFC_DONE[3]", \
> +	  offsetof(struct snapshot_regs, sfc_done_3)	}
>  
>  /* XE_LP Global */
>  static const struct __guc_mmio_reg_descr xe_lp_global_regs[] = {
> @@ -70,6 +126,11 @@ static const struct __guc_mmio_reg_descr xe_rc_inst_regs[] = {
>  	COMMON_BASE_ENGINE_INSTANCE,
>  };
>  
> +/* Render / Compute Per-Engine-Instance */
> +static const struct __guc_mmio_reg_descr xe_rc_class_regs[] = {
> +	COMMON_XELP_RC_CLASS,
> +};
> +
>  /* Media Decode/Encode Per-Engine-Instance */
>  static const struct __guc_mmio_reg_descr xe_vd_inst_regs[] = {
>  	COMMON_BASE_ENGINE_INSTANCE,
> @@ -80,6 +141,11 @@ static const struct __guc_mmio_reg_descr xe_vec_inst_regs[] = {
>  	COMMON_BASE_ENGINE_INSTANCE,
>  };
>  
> +/* Video Enhancement Per-Engine-Class */
> +static const struct __guc_mmio_reg_descr xe_vec_direct_read_regs[] = {
> +	XELP_DIRECT_READ_VEC_CLASS,
> +};
> +
>  /* Blitter Per-Engine-Instance */
>  static const struct __guc_mmio_reg_descr xe_blt_inst_regs[] = {
>  	COMMON_BASE_ENGINE_INSTANCE,
> @@ -112,12 +178,13 @@ static const struct __guc_mmio_reg_descr empty_regs_list[] = {
>  /* List of lists */
>  static const struct __guc_mmio_reg_descr_group xe_lp_lists[] = {
>  	MAKE_REGLIST(xe_lp_global_regs, PF, GLOBAL, 0),
> -	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE),
> +	MAKE_REGLIST(xe_rc_class_regs, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE),
>  	MAKE_REGLIST(xe_rc_inst_regs, PF, ENGINE_INSTANCE,
>  		     GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE),
>  	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_VIDEO),
>  	MAKE_REGLIST(xe_vd_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_VIDEO),
>  	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
> +	MAKE_REGLIST(xe_vec_direct_read_regs, PF, DIRECT_READ, GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
>  	MAKE_REGLIST(xe_vec_inst_regs, PF, ENGINE_INSTANCE,
>  		     GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
>  	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_BLITTER),
> @@ -148,6 +215,7 @@ static const char * const capture_engine_class_names[] = {
>   */
>  #define get_item_with_default(ar, index) (ar[(index) >= ARRAY_SIZE(ar) ? ARRAY_SIZE(ar) -  1 : \
>  									 (index)])
> +static void guc_capture_create_prealloc_nodes(struct xe_guc *guc);
>  
>  static const struct __guc_mmio_reg_descr_group *
>  guc_capture_get_one_list(const struct __guc_mmio_reg_descr_group *reglists,
> @@ -167,6 +235,12 @@ guc_capture_get_one_list(const struct __guc_mmio_reg_descr_group *reglists,
>  	return NULL;
>  }
>  
> +const struct __guc_mmio_reg_descr_group *
> +xe_guc_capture_get_reg_desc_list(u32 owner, u32 type, u32 engine_classid)
> +{
> +	return guc_capture_get_one_list(xe_lp_lists, owner, type, engine_classid);
> +}
> +
>  static struct __guc_mmio_reg_descr_group *
>  guc_capture_get_one_ext_list(struct __guc_mmio_reg_descr_group *reglists,
>  			     u32 owner, u32 type, u32 id)
> @@ -430,6 +504,12 @@ xe_guc_capture_getlist(struct xe_guc *guc, u32 owner, u32 type, u32 classid, voi
>  		return cache->status;
>  	}
>  
> +	/*
> +	 * ADS population of input registers is a good
> +	 * time to pre-allocate cachelist output nodes
> +	 */
> +	guc_capture_create_prealloc_nodes(guc);
> +
>  	ret = xe_guc_capture_getlistsize(guc, owner, type, classid, &size);
>  	if (ret) {
>  		cache->is_valid = true;
> @@ -567,6 +647,756 @@ static void check_guc_capture_size(struct xe_guc *guc)
>  			  buffer_size, spare_size, capture_size);
>  }
>  
> +static void
> +guc_capture_add_node_to_list(struct __guc_capture_parsed_output *node,
> +			     struct list_head *list)
> +{
> +	list_add_tail(&node->link, list);
> +}
> +
> +static void
> +guc_capture_add_node_to_outlist(struct xe_guc_state_capture *guc,
> +				struct __guc_capture_parsed_output *node)
> +{
> +	guc_capture_add_node_to_list(node, &guc->outlist);
> +}
> +
> +static void
> +guc_capture_add_node_to_cachelist(struct xe_guc_state_capture *guc,
> +				  struct __guc_capture_parsed_output *node)
> +{
> +	guc_capture_add_node_to_list(node, &guc->cachelist);
> +}
> +
> +static void
> +guc_capture_init_node(struct xe_guc *guc, struct __guc_capture_parsed_output *node)
> +{
> +	struct guc_mmio_reg *tmp[GUC_CAPTURE_LIST_TYPE_MAX];
> +	int i;
> +
> +	for (i = 0; i < GUC_CAPTURE_LIST_TYPE_MAX; ++i) {
> +		tmp[i] = node->reginfo[i].regs;
> +		memset(tmp[i], 0, sizeof(struct guc_mmio_reg) *
> +		       guc->capture->max_mmio_per_node);
> +	}
> +	memset(node, 0, sizeof(*node));
> +	for (i = 0; i < GUC_CAPTURE_LIST_TYPE_MAX; ++i)
> +		node->reginfo[i].regs = tmp[i];
> +
> +	INIT_LIST_HEAD(&node->link);
> +}
> +
> +/*
> + * KMD Init time flows:
> + * --------------------
> + *     --> alloc A: GuC input capture regs lists (registered to GuC via ADS).
> + *                  xe_guc_ads acquires the register lists by calling
> + *                  xe_guc_capture_list_size and xe_guc_capture_list_get 'n' times,
> + *                  where n = 1 for global-reg-list +
> + *                            num_engine_classes for class-reg-list +
> + *                            num_engine_classes for instance-reg-list
> + *                               (since all instances of the same engine-class type
> + *                                have an identical engine-instance register-list).
> + *                  ADS module also calls separately for PF vs VF.
> + *
> + *     --> alloc B: GuC output capture buf (registered via guc_init_params(log_param))
> + *                  Size = #define CAPTURE_BUFFER_SIZE (warns if on too-small)
> + *                  Note2: 'x 3' to hold multiple capture groups
> + *
> + * GUC Runtime notify capture:
> + * --------------------------
> + *     --> G2H STATE_CAPTURE_NOTIFICATION
> + *                   L--> xe_guc_capture_process
> + *                           L--> Loop through B (head..tail) and for each engine instance's
> + *                                err-state-captured register-list we find, we alloc 'C':
> + *      --> alloc C: A capture-output-node structure that includes misc capture info along
> + *                   with 3 register list dumps (global, engine-class and engine-instance)
> + *                   This node is created from a pre-allocated list of blank nodes in
> + *                   guc->capture->cachelist and populated with the error-capture
> + *                   data from GuC and then it's added into guc->capture->outlist linked
> + *                   list. This list is used for matchup and printout by xe_devcoredump_read
> + *                   and xe_hw_engine_snapshot_print, (when user invokes the devcoredump sysfs).
> + *
> + * GUC --> notify context reset:
> + * -----------------------------
> + *     --> guc_exec_queue_timedout_job
> + *                   L--> xe_devcoredump
> + *                          L--> devcoredump_snapshot(..IS_GUC_CAPTURE)
> + *                               --> xe_hw_engine_snapshot_capture(..IS_GUC_CAPTURE)
> + *                               L--> xe_hw_engine_find_and_copy_guc_capture_snapshot is where
> + *                                    detach C from internal linked list and add it into
> + *                                    xe_hw_engine_snapshot struct (if the context and
> + *                                    engine of the event notification matches a node
> + *                                    in the link list).
> + *
> + * User Sysfs / Debugfs
> + * --------------------
> + *      --> xe_devcoredump_read->
> + *             L--> xxx_snapshot_print
> + *                    L--> xe_hw_engine_snapshot_print
> + *                         register lists values of the xe_hw_engine_snapshot
> + *                         saved from the error-engine-dump.
> + *
> + */
> +
> +static int guc_capture_buf_cnt(struct __guc_capture_bufstate *buf)
> +{
> +	if (buf->wr >= buf->rd)
> +		return (buf->wr - buf->rd);
> +	return (buf->size - buf->rd) + buf->wr;
> +}
> +
> +static int guc_capture_buf_cnt_to_end(struct __guc_capture_bufstate *buf)
> +{
> +	if (buf->rd > buf->wr)
> +		return (buf->size - buf->rd);
> +	return (buf->wr - buf->rd);
> +}
> +
> +/*
> + * GuC's error-capture output is a ring buffer populated in a byte-stream fashion:
> + *
> + * The GuC Log buffer region for error-capture is managed like a ring buffer.
> + * The GuC firmware dumps error capture logs into this ring in a byte-stream flow.
> + * Additionally, as per the current and foreseeable future, all packed error-
> + * capture output structures are dword aligned.
> + *
> + * That said, if the GuC firmware is in the midst of writing a structure that is larger
> + * than one dword but the tail end of the err-capture buffer-region has lesser space left,
> + * we would need to extract that structure one dword at a time straddled across the end,
> + * onto the start of the ring.
> + *
> + * Below function, guc_capture_log_remove_dw is a helper for that. All callers of this
> + * function would typically do a straight-up memcpy from the ring contents and will only
> + * call this helper if their structure-extraction is straddling across the end of the
> + * ring. GuC firmware does not add any padding. The reason for the no-padding is to ease
> + * scalability for future expansion of output data types without requiring a redesign
> + * of the flow controls.
> + */
> +static int
> +guc_capture_log_remove_dw(struct xe_guc *guc, struct __guc_capture_bufstate *buf,
> +			  u32 *dw)
> +{
> +	int tries = 2;
> +	int avail = 0;
> +
> +	if (!guc_capture_buf_cnt(buf))
> +		return 0;
> +
> +	while (tries--) {
> +		avail = guc_capture_buf_cnt_to_end(buf);
> +		if (avail >= sizeof(u32)) {
> +			*dw = xe_map_rd(guc_to_xe(guc), &guc->log.bo->vmap,
> +					buf->data_offset + buf->rd, u32);
> +			buf->rd += 4;
> +			return 4;
> +		}
> +		if (avail)
> +			xe_gt_dbg(guc_to_gt(guc), "Register capture log not dword aligned, skipping.\n");
> +		buf->rd = 0;
> +	}
> +
> +	return 0;
> +}
> +
> +static bool
> +guc_capture_data_extracted(struct xe_guc *guc, struct __guc_capture_bufstate *b,
> +			   int size, void *dest)
> +{
> +	if (guc_capture_buf_cnt_to_end(b) >= size) {
> +		xe_map_memcpy_from(guc_to_xe(guc), dest, &guc->log.bo->vmap,
> +				   b->data_offset + b->rd, size);
> +		b->rd += size;
> +		return true;
> +	}
> +	return false;
> +}
> +
> +static int
> +guc_capture_log_get_group_hdr(struct xe_guc *guc, struct __guc_capture_bufstate *buf,
> +			      struct guc_state_capture_group_header_t *ghdr)
> +{
> +	int read = 0;
> +	int fullsize = sizeof(struct guc_state_capture_group_header_t);
> +
> +	if (fullsize > guc_capture_buf_cnt(buf))
> +		return -1;
> +
> +	if (guc_capture_data_extracted(guc, buf, fullsize, (void *)ghdr))
> +		return 0;
> +
> +	read += guc_capture_log_remove_dw(guc, buf, &ghdr->owner);
> +	read += guc_capture_log_remove_dw(guc, buf, &ghdr->info);
> +	if (read != fullsize)
> +		return -1;
> +
> +	return 0;
> +}
> +
> +static int
> +guc_capture_log_get_data_hdr(struct xe_guc *guc, struct __guc_capture_bufstate *buf,
> +			     struct guc_state_capture_header_t *hdr)
> +{
> +	int read = 0;
> +	int fullsize = sizeof(struct guc_state_capture_header_t);
> +
> +	if (fullsize > guc_capture_buf_cnt(buf))
> +		return -1;
> +
> +	if (guc_capture_data_extracted(guc, buf, fullsize, (void *)hdr))
> +		return 0;
> +
> +	read += guc_capture_log_remove_dw(guc, buf, &hdr->owner);
> +	read += guc_capture_log_remove_dw(guc, buf, &hdr->info);
> +	read += guc_capture_log_remove_dw(guc, buf, &hdr->lrca);
> +	read += guc_capture_log_remove_dw(guc, buf, &hdr->guc_id);
> +	read += guc_capture_log_remove_dw(guc, buf, &hdr->num_mmios);
> +	if (read != fullsize)
> +		return -1;
> +
> +	return 0;
> +}
> +
> +static int
> +guc_capture_log_get_register(struct xe_guc *guc, struct __guc_capture_bufstate *buf,
> +			     struct guc_mmio_reg *reg)
> +{
> +	int read = 0;
> +	int fullsize = sizeof(struct guc_mmio_reg);
> +
> +	if (fullsize > guc_capture_buf_cnt(buf))
> +		return -1;
> +
> +	if (guc_capture_data_extracted(guc, buf, fullsize, (void *)reg))
> +		return 0;
> +
> +	read += guc_capture_log_remove_dw(guc, buf, &reg->offset);
> +	read += guc_capture_log_remove_dw(guc, buf, &reg->value);
> +	read += guc_capture_log_remove_dw(guc, buf, &reg->flags);
> +	read += guc_capture_log_remove_dw(guc, buf, &reg->mask);
> +	if (read != fullsize)
> +		return -1;
> +
> +	return 0;
> +}
> +
> +static struct __guc_capture_parsed_output *
> +guc_capture_get_prealloc_node(struct xe_guc *guc)
> +{
> +	struct __guc_capture_parsed_output *found = NULL;
> +
> +	if (!list_empty(&guc->capture->cachelist)) {
> +		struct __guc_capture_parsed_output *n, *ntmp;
> +
> +		/* get first avail node from the cache list */
> +		list_for_each_entry_safe(n, ntmp, &guc->capture->cachelist, link) {
> +			found = n;
> +			break;
> +		}
> +	} else {
> +		struct __guc_capture_parsed_output *n, *ntmp;
> +
> +		/* traverse down and steal back the oldest node already allocated */
> +		list_for_each_entry_safe(n, ntmp, &guc->capture->outlist, link) {
> +			found = n;
> +		}
> +	}
> +	if (found) {
> +		list_del(&found->link);
> +		guc_capture_init_node(guc, found);
> +	}
> +
> +	return found;
> +}
> +
> +static struct __guc_capture_parsed_output *
> +guc_capture_clone_node(struct xe_guc *guc, struct __guc_capture_parsed_output *original,
> +		       u32 keep_reglist_mask)
> +{
> +	struct __guc_capture_parsed_output *new;
> +	int i;
> +
> +	new = guc_capture_get_prealloc_node(guc);
> +	if (!new)
> +		return NULL;
> +	if (!original)
> +		return new;
> +
> +	new->is_partial = original->is_partial;
> +
> +	/* copy reg-lists that we want to clone */
> +	for (i = 0; i < GUC_CAPTURE_LIST_TYPE_MAX; ++i) {
> +		if (keep_reglist_mask & BIT(i)) {
> +			XE_WARN_ON(original->reginfo[i].num_regs  >
> +				   guc->capture->max_mmio_per_node);
> +
> +			memcpy(new->reginfo[i].regs, original->reginfo[i].regs,
> +			       original->reginfo[i].num_regs * sizeof(struct guc_mmio_reg));
> +
> +			new->reginfo[i].num_regs = original->reginfo[i].num_regs;
> +			new->reginfo[i].vfid  = original->reginfo[i].vfid;
> +
> +			if (i == GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS) {
> +				new->eng_class = original->eng_class;
> +			} else if (i == GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE) {
> +				new->eng_inst = original->eng_inst;
> +				new->guc_id = original->guc_id;
> +				new->lrca = original->lrca;
> +			}
> +		}
> +	}
> +
> +	return new;
> +}
> +
> +static int
> +guc_capture_extract_reglists(struct xe_guc *guc, struct __guc_capture_bufstate *buf)
> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	struct guc_state_capture_group_header_t ghdr = {0};
> +	struct guc_state_capture_header_t hdr = {0};
> +	struct __guc_capture_parsed_output *node = NULL;
> +	struct guc_mmio_reg *regs = NULL;
> +	int i, numlists, numregs, ret = 0;
> +	enum guc_capture_type datatype;
> +	struct guc_mmio_reg tmp;
> +	bool is_partial = false;
> +
> +	i = guc_capture_buf_cnt(buf);
> +	if (!i)
> +		return -ENODATA;
> +
> +	if (i % sizeof(u32)) {
> +		xe_gt_warn(gt, "Got mis-aligned register capture entries\n");
> +		ret = -EIO;
> +		goto bailout;
> +	}
> +
> +	/* first get the capture group header */
> +	if (guc_capture_log_get_group_hdr(guc, buf, &ghdr)) {
> +		ret = -EIO;
> +		goto bailout;
> +	}
> +	/*
> +	 * we would typically expect a layout as below where n would be expected to be
> +	 * anywhere between 3 to n where n > 3 if we are seeing multiple dependent engine
> +	 * instances being reset together.
> +	 * ____________________________________________
> +	 * | Capture Group                            |
> +	 * | ________________________________________ |
> +	 * | | Capture Group Header:                | |
> +	 * | |  - num_captures = 5                  | |
> +	 * | |______________________________________| |
> +	 * | ________________________________________ |
> +	 * | | Capture1:                            | |
> +	 * | |  Hdr: GLOBAL, numregs=a              | |
> +	 * | | ____________________________________ | |
> +	 * | | | Reglist                          | | |
> +	 * | | | - reg1, reg2, ... rega           | | |
> +	 * | | |__________________________________| | |
> +	 * | |______________________________________| |
> +	 * | ________________________________________ |
> +	 * | | Capture2:                            | |
> +	 * | |  Hdr: CLASS=RENDER/COMPUTE, numregs=b| |
> +	 * | | ____________________________________ | |
> +	 * | | | Reglist                          | | |
> +	 * | | | - reg1, reg2, ... regb           | | |
> +	 * | | |__________________________________| | |
> +	 * | |______________________________________| |
> +	 * | ________________________________________ |
> +	 * | | Capture3:                            | |
> +	 * | |  Hdr: INSTANCE=RCS, numregs=c        | |
> +	 * | | ____________________________________ | |
> +	 * | | | Reglist                          | | |
> +	 * | | | - reg1, reg2, ... regc           | | |
> +	 * | | |__________________________________| | |
> +	 * | |______________________________________| |
> +	 * | ________________________________________ |
> +	 * | | Capture4:                            | |
> +	 * | |  Hdr: CLASS=RENDER/COMPUTE, numregs=d| |
> +	 * | | ____________________________________ | |
> +	 * | | | Reglist                          | | |
> +	 * | | | - reg1, reg2, ... regd           | | |
> +	 * | | |__________________________________| | |
> +	 * | |______________________________________| |
> +	 * | ________________________________________ |
> +	 * | | Capture5:                            | |
> +	 * | |  Hdr: INSTANCE=CCS0, numregs=e       | |
> +	 * | | ____________________________________ | |
> +	 * | | | Reglist                          | | |
> +	 * | | | - reg1, reg2, ... rege           | | |
> +	 * | | |__________________________________| | |
> +	 * | |______________________________________| |
> +	 * |__________________________________________|
> +	 */
> +	is_partial = FIELD_GET(CAP_GRP_HDR_CAPTURE_TYPE, ghdr.info);
> +	numlists = FIELD_GET(CAP_GRP_HDR_NUM_CAPTURES, ghdr.info);
> +
> +	while (numlists--) {
> +		if (guc_capture_log_get_data_hdr(guc, buf, &hdr)) {
> +			ret = -EIO;
> +			break;
> +		}
> +
> +		datatype = FIELD_GET(CAP_HDR_CAPTURE_TYPE, hdr.info);
> +		if (datatype > GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE) {
> +			/* unknown capture type - skip over to next capture set */
> +			numregs = FIELD_GET(CAP_HDR_NUM_MMIOS, hdr.num_mmios);
> +			while (numregs--) {
> +				if (guc_capture_log_get_register(guc, buf, &tmp)) {
> +					ret = -EIO;
> +					break;
> +				}
> +			}
> +			continue;
> +		} else if (node) {
> +			/*
> +			 * Based on the current capture type and what we have so far,
> +			 * decide if we should add the current node into the internal
> +			 * linked list for match-up when xe_devcoredump calls later
> +			 * (and alloc a blank node for the next set of reglists)
> +			 * or continue with the same node or clone the current node
> +			 * but only retain the global or class registers (such as the
> +			 * case of dependent engine resets).
> +			 */
> +			if (datatype == GUC_CAPTURE_LIST_TYPE_GLOBAL) {
> +				guc_capture_add_node_to_outlist(guc->capture, node);
> +				node = NULL;
> +			} else if (datatype == GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS &&
> +				   node->reginfo[GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS].num_regs) {
> +				/* Add to list, clone node and duplicate global list */
> +				guc_capture_add_node_to_outlist(guc->capture, node);
> +				node = guc_capture_clone_node(guc, node,
> +							      GCAP_PARSED_REGLIST_INDEX_GLOBAL);
> +			} else if (datatype == GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE &&
> +				   node->reginfo[GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE].num_regs) {
> +				/* Add to list, clone node and duplicate global + class lists */
> +				guc_capture_add_node_to_outlist(guc->capture, node);
> +				node = guc_capture_clone_node(guc, node,
> +							      (GCAP_PARSED_REGLIST_INDEX_GLOBAL |
> +							      GCAP_PARSED_REGLIST_INDEX_ENGCLASS));
> +			}
> +		}
> +
> +		if (!node) {
> +			node = guc_capture_get_prealloc_node(guc);
> +			if (!node) {
> +				ret = -ENOMEM;
> +				break;
> +			}
> +			if (datatype != GUC_CAPTURE_LIST_TYPE_GLOBAL)
> +				xe_gt_dbg(gt, "Register capture missing global dump: %08x!\n",
> +					  datatype);
> +		}
> +		node->is_partial = is_partial;
> +		node->reginfo[datatype].vfid = FIELD_GET(CAP_HDR_CAPTURE_VFID, hdr.owner);
> +
> +		switch (datatype) {
> +		case GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE:
> +			node->eng_class = FIELD_GET(CAP_HDR_ENGINE_CLASS, hdr.info);
> +			node->eng_inst = FIELD_GET(CAP_HDR_ENGINE_INSTANCE, hdr.info);
> +			node->lrca = hdr.lrca;
> +			node->guc_id = hdr.guc_id;
> +			break;
> +		case GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS:
> +			node->eng_class = FIELD_GET(CAP_HDR_ENGINE_CLASS, hdr.info);
> +			break;
> +		default:
> +			break;
> +		}
> +
> +		numregs = FIELD_GET(CAP_HDR_NUM_MMIOS, hdr.num_mmios);
> +		if (numregs > guc->capture->max_mmio_per_node) {
> +			xe_gt_dbg(gt, "Register capture list extraction clipped by prealloc!\n");
> +			numregs = guc->capture->max_mmio_per_node;
> +		}
> +		node->reginfo[datatype].num_regs = numregs;
> +		regs = node->reginfo[datatype].regs;
> +		i = 0;
> +		while (numregs--) {
> +			if (guc_capture_log_get_register(guc, buf, &regs[i++])) {
> +				ret = -EIO;
> +				break;
> +			}
> +		}
> +	}
> +
> +bailout:
> +	if (node) {
> +		/* If we have data, add to linked list for match-up when xe_devcoredump calls */
> +		for (i = GUC_CAPTURE_LIST_TYPE_GLOBAL; i < GUC_CAPTURE_LIST_TYPE_MAX; ++i) {
> +			if (node->reginfo[i].regs) {
> +				guc_capture_add_node_to_outlist(guc->capture, node);
> +				node = NULL;
> +				break;
> +			}
> +		}
> +		if (node) /* else return it back to cache list */
> +			guc_capture_add_node_to_cachelist(guc->capture, node);
> +	}
> +	return ret;
> +}
> +
> +static int __guc_capture_flushlog_complete(struct xe_guc *guc)
> +{
> +	u32 action[] = {
> +		XE_GUC_ACTION_LOG_BUFFER_FILE_FLUSH_COMPLETE,
> +		GUC_CAPTURE_LOG_BUFFER
> +	};
> +
> +	return xe_guc_ct_send_g2h_handler(&guc->ct, action, ARRAY_SIZE(action));
> +}
> +
> +static void __guc_capture_process_output(struct xe_guc *guc)
> +{
> +	unsigned int buffer_size, read_offset, write_offset, full_count;
> +	struct xe_uc *uc = container_of(guc, typeof(*uc), guc);
> +	struct guc_log_buffer_state log_buf_state_local;
> +	struct __guc_capture_bufstate buf;
> +	bool new_overflow;
> +	int ret;
> +	u32 log_buf_state_offset;
> +	u32 src_data_offset;
> +
> +	log_buf_state_offset = sizeof(struct guc_log_buffer_state) * GUC_CAPTURE_LOG_BUFFER;
> +	src_data_offset = xe_guc_get_log_buffer_offset(&guc->log, GUC_CAPTURE_LOG_BUFFER);
> +
> +	/*
> +	 * Make a copy of the state structure, inside GuC log buffer
> +	 * (which is uncached mapped), on the stack to avoid reading
> +	 * from it multiple times.
> +	 */
> +	xe_map_memcpy_from(guc_to_xe(guc), &log_buf_state_local, &guc->log.bo->vmap,
> +			   log_buf_state_offset, sizeof(struct guc_log_buffer_state));
> +
> +	buffer_size = xe_guc_get_log_buffer_size(&guc->log, GUC_CAPTURE_LOG_BUFFER);
> +	read_offset = log_buf_state_local.read_ptr;
> +	write_offset = log_buf_state_local.sampled_write_ptr;
> +	full_count = log_buf_state_local.buffer_full_cnt;
> +
> +	/* Bookkeeping stuff */
> +	guc->log.stats[GUC_CAPTURE_LOG_BUFFER].flush += log_buf_state_local.flush_to_file;
> +	new_overflow = xe_guc_check_log_buf_overflow(&guc->log, GUC_CAPTURE_LOG_BUFFER,
> +						     full_count);
> +
> +	/* Now copy the actual logs. */
> +	if (unlikely(new_overflow)) {
> +		/* copy the whole buffer in case of overflow */
> +		read_offset = 0;
> +		write_offset = buffer_size;
> +	} else if (unlikely((read_offset > buffer_size) ||
> +			(write_offset > buffer_size))) {
> +		xe_gt_err(guc_to_gt(guc),
> +			  "Register capture buffer in invalid state: read = 0x%X, size = 0x%X!\n",
> +			  read_offset, buffer_size);
> +		/* copy whole buffer as offsets are unreliable */
> +		read_offset = 0;
> +		write_offset = buffer_size;
> +	}
> +
> +	buf.size = buffer_size;
> +	buf.rd = read_offset;
> +	buf.wr = write_offset;
> +	buf.data_offset = src_data_offset;
> +
> +	if (!xe_guc_read_stopped(guc)) {
> +		do {
> +			ret = guc_capture_extract_reglists(guc, &buf);
> +		} while (ret >= 0);
> +	}
> +
> +	/* Update the state of log buffer err-cap state */
> +	xe_map_wr(guc_to_xe(guc), &guc->log.bo->vmap,
> +		  log_buf_state_offset + offsetof(struct guc_log_buffer_state, read_ptr), u32,
> +		  write_offset);
> +	/* Clear the flush_to_file from local first, the local was loaded by above
> +	 * xe_map_memcpy_from.
> +	 */
> +	log_buf_state_local.flush_to_file = 0;
> +	/* Then write out the "updated local" through xe_map_wr() */
> +	xe_map_wr(guc_to_xe(guc), &guc->log.bo->vmap,
> +		  log_buf_state_offset + offsetof(struct guc_log_buffer_state, flags), u32,
> +		  log_buf_state_local.flags);
> +	__guc_capture_flushlog_complete(guc);
> +}
> +

public functions require kernel-doc

> +void xe_guc_capture_process(struct xe_guc *guc)
> +{
> +	if (guc->capture)
> +		__guc_capture_process_output(guc);
> +}
> +
> +static struct __guc_capture_parsed_output *
> +guc_capture_alloc_one_node(struct xe_guc *guc)
> +{
> +	struct drm_device *drm = guc_to_drm(guc);
> +	struct __guc_capture_parsed_output *new;
> +	int i;
> +
> +	new = drmm_kzalloc(drm, sizeof(*new), GFP_KERNEL);
> +	if (!new)
> +		return NULL;
> +
> +	for (i = 0; i < GUC_CAPTURE_LIST_TYPE_MAX; ++i) {
> +		new->reginfo[i].regs = drmm_kzalloc(drm, guc->capture->max_mmio_per_node *
> +					       sizeof(struct guc_mmio_reg), GFP_KERNEL);
> +		if (!new->reginfo[i].regs) {
> +			while (i)
> +				drmm_kfree(drm, new->reginfo[--i].regs);
> +			drmm_kfree(drm, new);
> +			return NULL;
> +		}
> +	}
> +	guc_capture_init_node(guc, new);
> +
> +	return new;
> +}
> +
> +static void
> +__guc_capture_create_prealloc_nodes(struct xe_guc *guc)
> +{
> +	struct __guc_capture_parsed_output *node = NULL;
> +	int i;
> +
> +	for (i = 0; i < PREALLOC_NODES_MAX_COUNT; ++i) {
> +		node = guc_capture_alloc_one_node(guc);
> +		if (!node) {
> +			xe_gt_warn(guc_to_gt(guc), "Register capture pre-alloc-cache failure\n");
> +			/* dont free the priors, use what we got and cleanup at shutdown */
> +			return;
> +		}
> +		guc_capture_add_node_to_cachelist(guc->capture, node);
> +	}
> +}
> +
> +static int
> +guc_get_max_reglist_count(struct xe_guc *guc)
> +{
> +	int i, j, k, tmp, maxregcount = 0;
> +
> +	for (i = 0; i < GUC_CAPTURE_LIST_INDEX_MAX; ++i) {
> +		for (j = 0; j < GUC_CAPTURE_LIST_TYPE_MAX; ++j) {
> +			for (k = 0; k < GUC_MAX_ENGINE_CLASSES; ++k) {
> +				if (j == GUC_CAPTURE_LIST_TYPE_GLOBAL && k > 0)
> +					continue;
> +
> +				tmp = guc_cap_list_num_regs(guc->capture, i, j, k);
> +				if (tmp > maxregcount)
> +					maxregcount = tmp;
> +			}
> +		}
> +	}
> +	if (!maxregcount)
> +		maxregcount = PREALLOC_NODES_DEFAULT_NUMREGS;
> +
> +	return maxregcount;
> +}
> +
> +static void
> +guc_capture_create_prealloc_nodes(struct xe_guc *guc)
> +{
> +	/* skip if we've already done the pre-alloc */
> +	if (guc->capture->max_mmio_per_node)
> +		return;
> +
> +	guc->capture->max_mmio_per_node = guc_get_max_reglist_count(guc);
> +	__guc_capture_create_prealloc_nodes(guc);
> +}
> +
> +static void cp_reg_to_snapshot(int type, u16 hwe_guc_class, u32 offset, u32 value,
> +			       struct snapshot_regs *regs)
> +{
> +	int i;
> +	const struct __guc_mmio_reg_descr_group *list;
> +
> +	/* Get register list for the type/class */
> +	list = xe_guc_capture_get_reg_desc_list(GUC_CAPTURE_LIST_INDEX_PF, type,
> +						xe_guc_class_to_capture_class(hwe_guc_class));
> +	if (!list)
> +		return;
> +
> +	for (i = 0; i < list->num_regs; i++)
> +		if (offset == list->list[i].reg.addr) {
> +			u32 *field = (u32 *)((uintptr_t)regs + list->list[i].position_in_snapshot);
> +			*field = value;
> +			return;
> +		}
> +}
> +
> +static void guc_capture_parse_reglist(struct __guc_capture_parsed_output *node,
> +				      struct xe_hw_engine_snapshot *snapshot, u16 hwe_guc_class)
> +{
> +	int i, type;
> +
> +	if (!node)
> +		return;
> +
> +	for (type = GUC_CAPTURE_LIST_TYPE_GLOBAL; type < GUC_CAPTURE_LIST_TYPE_MAX; type++) {
> +		struct gcap_reg_list_info *reginfo = &node->reginfo[type];
> +		struct guc_mmio_reg *regs = reginfo->regs;
> +
> +		for (i = 0; i < reginfo->num_regs; i++)
> +			cp_reg_to_snapshot(type, hwe_guc_class, regs[i].offset, regs[i].value,
> +					   &snapshot->reg);
> +	}
> +}
> +
> +/**
> + * xe_hw_engine_find_and_copy_guc_capture_snapshot - Take a engine snapshot from GuC capture.
> + * @hwe: Xe HW Engine.
> + * @snapshot: Xe HW Engine snapshot object to save data, copied from error capture
> + *
> + * This can be printed out in a later stage like during dev_coredump
> + * analysis.
> + *
> + * Returns: None
> + */
> +void
> +xe_hw_engine_find_and_copy_guc_capture_snapshot(struct xe_hw_engine *hwe,
> +						struct xe_hw_engine_snapshot *snapshot)
> +{
> +	struct xe_gt *gt = hwe->gt;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_guc *guc = &gt->uc.guc;
> +	struct __guc_capture_parsed_output *n, *ntmp;
> +	struct xe_devcoredump *devcoredump = &xe->devcoredump;
> +	struct list_head *list = &guc->capture->outlist;
> +	struct xe_sched_job *job = devcoredump->job;
> +	struct xe_guc_submit_exec_queue_snapshot *ge = devcoredump->snapshot.ge;
> +	u16 guc_id = ge->guc.id;
> +	u32 lrca;
> +	u16 hwe_guc_class = xe_engine_class_to_guc_class(hwe->class);
> +
> +	lrca = xe_lrc_ggtt_addr(job->q->lrc[0]) & LRC_GTT_ADDRESS_MASK;
> +
> +	/*
> +	 * Look for a matching GuC reported error capture node from
> +	 * the internal output link-list based on engine class and instance.
> +	 */
> +	list_for_each_entry_safe(n, ntmp, list, link) {
> +		if (n->eng_class == hwe_guc_class && n->eng_inst == hwe->instance &&
> +		    n->guc_id == guc_id && (n->lrca & LRC_GTT_ADDRESS_MASK) == lrca) {
> +			guc_capture_parse_reglist(n, snapshot, hwe_guc_class);
> +			list_del(&n->link);
> +			return;
> +		}
> +	}
> +}
> +
> +void xe_guc_capture_free(struct xe_guc *guc)
> +{
> +	if (guc->capture && !list_empty(&guc->capture->outlist)) {
> +		struct __guc_capture_parsed_output *n, *ntmp;
> +
> +		list_for_each_entry_safe(n, ntmp, &guc->capture->outlist, link) {
> +			list_del(&n->link);
> +			/* put node back to cache list */
> +			/* No need to init here, guc_capture_get_prealloc_node init it later */
> +			guc_capture_add_node_to_cachelist(guc->capture, n);
> +		}
> +	}
> +}
> +
>  int xe_guc_capture_init(struct xe_guc *guc)
>  {
>  	guc->capture = drmm_kzalloc(guc_to_drm(guc), sizeof(*guc->capture), GFP_KERNEL);
> @@ -574,7 +1404,9 @@ int xe_guc_capture_init(struct xe_guc *guc)
>  		return -ENOMEM;
>  
>  	guc->capture->reglists = guc_capture_get_device_reglist(guc);
> -
>  	check_guc_capture_size(guc);
> +	INIT_LIST_HEAD(&guc->capture->outlist);
> +	INIT_LIST_HEAD(&guc->capture->cachelist);
> +
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
> index a62b1dbd47a6..c0bada99c9ec 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.h
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.h
> @@ -10,6 +10,8 @@
>  #include "regs/xe_reg_defs.h"
>  
>  struct xe_guc;
> +struct xe_hw_engine;
> +struct xe_hw_engine_snapshot;
>  
>  /*
>   * struct __guc_mmio_reg_descr / struct __guc_mmio_reg_descr_group
> @@ -25,6 +27,7 @@ struct __guc_mmio_reg_descr {
>  	u32 flags;
>  	u32 mask;
>  	const char *regname;
> +	u32 position_in_snapshot;
>  };
>  
>  struct __guc_mmio_reg_descr_group {
> @@ -36,9 +39,15 @@ struct __guc_mmio_reg_descr_group {
>  	struct __guc_mmio_reg_descr *extlist; /* only used for steered registers */
>  };
>  
> +void xe_guc_capture_process(struct xe_guc *guc);
>  int xe_guc_capture_getlist(struct xe_guc *guc, u32 owner, u32 type, u32 classid, void **outptr);
>  int xe_guc_capture_getlistsize(struct xe_guc *guc, u32 owner, u32 type, u32 classid, size_t *size);
>  int xe_guc_capture_getnullheader(struct xe_guc *guc, void **outptr, size_t *size);
> +const struct __guc_mmio_reg_descr_group *
> +xe_guc_capture_get_reg_desc_list(u32 owner, u32 type, u32 engine_classid);
> +void xe_hw_engine_find_and_copy_guc_capture_snapshot(struct xe_hw_engine *hwe,
> +						     struct xe_hw_engine_snapshot *snapshot);
> +void xe_guc_capture_free(struct xe_guc *guc);
>  int xe_guc_capture_init(struct xe_guc *guc);
>  
>  #endif /* _XE_GUC_CAPTURE_H */
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture_fwif.h b/drivers/gpu/drm/xe/xe_guc_capture_fwif.h
> index 199e3c0108a4..5ef8c20fe9bc 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_capture_fwif.h
> @@ -10,6 +10,51 @@
>  
>  #include "xe_guc_fwif.h"
>  
> +/*
> + * struct __guc_capture_bufstate
> + *
> + * Book-keeping structure used to track read and write pointers
> + * as we extract error capture data from the GuC-log-buffer's
> + * error-capture region as a stream of dwords.
> + */
> +struct __guc_capture_bufstate {
> +	u32 size;
> +	u32 data_offset;
> +	u32 rd;
> +	u32 wr;
> +};
> +
> +/*
> + * struct __guc_capture_parsed_output - extracted error capture node
> + *
> + * A single unit of extracted error-capture output data grouped together
> + * at an engine-instance level. We keep these nodes in a linked list.
> + * See cachelist and outlist below.
> + */
> +struct __guc_capture_parsed_output {
> +	/*
> +	 * A single set of 3 capture lists: a global-list
> +	 * an engine-class-list and an engine-instance list.
> +	 * outlist in __guc_capture_parsed_output will keep
> +	 * a linked list of these nodes that will eventually
> +	 * be detached from outlist and attached into to
> +	 * xe_codedump in response to a context reset
> +	 */
> +	struct list_head link;
> +	bool is_partial;
> +	u32 eng_class;
> +	u32 eng_inst;
> +	u32 guc_id;
> +	u32 lrca;
> +	struct gcap_reg_list_info {
> +		u32 vfid;
> +		u32 num_regs;
> +		struct guc_mmio_reg *regs;
> +	} reginfo[GUC_CAPTURE_LIST_TYPE_MAX];
> +#define GCAP_PARSED_REGLIST_INDEX_GLOBAL   BIT(GUC_CAPTURE_LIST_TYPE_GLOBAL)
> +#define GCAP_PARSED_REGLIST_INDEX_ENGCLASS BIT(GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS)
> +};
> +
>  /*
>   * struct guc_debug_capture_list_header / struct guc_debug_capture_list
>   *
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index c1f258348f5c..865b58bb4fd9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1045,6 +1045,8 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  		/* Selftest only at the moment */
>  		break;
>  	case XE_GUC_ACTION_STATE_CAPTURE_NOTIFICATION:
> +		ret = xe_guc_error_capture_handler(guc, payload, adj_len);
> +		break;
>  	case XE_GUC_ACTION_NOTIFY_FLUSH_LOG_BUFFER_TO_FILE:
>  		/* FIXME: Handle this */
>  		break;
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index 908298791c93..f8f9c76eb7ac 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -206,6 +206,12 @@ enum guc_capture_type {
>  	GUC_CAPTURE_LIST_TYPE_MAX,
>  };
>  
> +/* GuC support limited registers range to be captured for debug purpose,
> + * for unsupported registers, direct read is the only way to save the data.
> + * GuC capture handling will ignore all lists with this type: GUC_CAPTURE_LIST_TYPE_DIRECT_READ
> + */
> +#define GUC_CAPTURE_LIST_TYPE_DIRECT_READ GUC_CAPTURE_LIST_TYPE_MAX
> +
>  /* Class indecies for capture_class and capture_instance arrays */
>  enum {
>  	GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE = 0,
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 47aab04cf34f..f02f4c0c9568 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -25,6 +25,7 @@
>  #include "xe_gt.h"
>  #include "xe_gt_printk.h"
>  #include "xe_guc.h"
> +#include "xe_guc_capture.h"
>  #include "xe_guc_ct.h"
>  #include "xe_guc_exec_queue_types.h"
>  #include "xe_guc_id_mgr.h"
> @@ -769,7 +770,7 @@ static void guc_exec_queue_free_job(struct drm_sched_job *drm_job)
>  	xe_sched_job_put(job);
>  }
>  
> -static int guc_read_stopped(struct xe_guc *guc)
> +int xe_guc_read_stopped(struct xe_guc *guc)
>  {
>  	return atomic_read(&guc->submission_state.stopped);
>  }
> @@ -791,7 +792,7 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
>  	set_min_preemption_timeout(guc, q);
>  	smp_rmb();
>  	ret = wait_event_timeout(guc->ct.wq, !exec_queue_pending_enable(q) ||
> -				 guc_read_stopped(guc), HZ * 5);
> +				 xe_guc_read_stopped(guc), HZ * 5);
>  	if (!ret) {
>  		struct xe_gpu_scheduler *sched = &q->guc->sched;
>  
> @@ -906,7 +907,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>  		 */
>  		ret = wait_event_timeout(guc->ct.wq,
>  					 !exec_queue_pending_disable(q) ||
> -					 guc_read_stopped(guc), HZ * 5);
> +					 xe_guc_read_stopped(guc), HZ * 5);
>  		if (!ret) {
>  			drm_warn(&xe->drm, "Schedule disable failed to respond");
>  			xe_sched_submission_start(sched);
> @@ -929,6 +930,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	int err = -ETIME;
>  	int i = 0;
>  	bool wedged;
> +	bool reset_status = exec_queue_reset(q);
> +	bool guc_en = xe_device_uc_enabled(xe);
>  
>  	/*
>  	 * TDR has fired before free job worker. Common if exec queue
> @@ -948,7 +951,15 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
>  		   "VM job timed out on non-killed execqueue\n");
>  
> -	if (!exec_queue_killed(q))
> +	/* take devcoredump on:
> +	 * 1. GuC not enabled
> +	 * 2. GuC enabled with GuC reset status == 1
> +	 * When GuC enabled, register value is captured by GuC, GuC will notify host
> +	 * with capture notification message, which is right before reset.
> +	 * GuC reset status 1 also means capture ready.
> +	 * If not ready, will take snapshot after wait event within this function.
> +	 */
> +	if (!exec_queue_killed(q) && (!guc_en || (guc_en && reset_status)))
>  		xe_devcoredump(job);
>  
>  	trace_xe_sched_job_timedout(job);
> @@ -996,8 +1007,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  		smp_rmb();
>  		ret = wait_event_timeout(guc->ct.wq,
>  					 !exec_queue_pending_disable(q) ||
> -					 guc_read_stopped(guc), HZ * 5);
> -		if (!ret || guc_read_stopped(guc)) {
> +					 xe_guc_read_stopped(guc), HZ * 5);
> +		if (!ret || xe_guc_read_stopped(guc)) {
>  			drm_warn(&xe->drm, "Schedule disable failed to respond");
>  			xe_sched_add_pending_job(sched, job);
>  			xe_sched_submission_start(sched);
> @@ -1007,6 +1018,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  		}
>  	}
>  
> +	/* When entring this function, if capture/reset not ready, now is time to take snapshot */
> +	if (!exec_queue_killed(q) && guc_en && !reset_status)
> +		xe_devcoredump(job);
> +
>  	/* Stop fence signaling */
>  	xe_hw_fence_irq_stop(q->fence_irq);
>  
> @@ -1112,7 +1127,7 @@ static void suspend_fence_signal(struct xe_exec_queue *q)
>  	struct xe_device *xe = guc_to_xe(guc);
>  
>  	xe_assert(xe, exec_queue_suspended(q) || exec_queue_killed(q) ||
> -		  guc_read_stopped(guc));
> +		  xe_guc_read_stopped(guc));
>  	xe_assert(xe, q->guc->suspend_pending);
>  
>  	q->guc->suspend_pending = false;
> @@ -1128,9 +1143,9 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
>  	if (guc_exec_queue_allowed_to_change_state(q) && !exec_queue_suspended(q) &&
>  	    exec_queue_enabled(q)) {
>  		wait_event(guc->ct.wq, q->guc->resume_time != RESUME_PENDING ||
> -			   guc_read_stopped(guc));
> +			   xe_guc_read_stopped(guc));
>  
> -		if (!guc_read_stopped(guc)) {
> +		if (!xe_guc_read_stopped(guc)) {
>  			MAKE_SCHED_CONTEXT_ACTION(q, DISABLE);
>  			s64 since_resume_ms =
>  				ktime_ms_delta(ktime_get(),
> @@ -1258,7 +1273,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  
>  	q->entity = &ge->entity;
>  
> -	if (guc_read_stopped(guc))
> +	if (xe_guc_read_stopped(guc))
>  		xe_sched_stop(sched);
>  
>  	mutex_unlock(&guc->submission_state.lock);
> @@ -1385,7 +1400,7 @@ static void guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
>  	struct xe_guc *guc = exec_queue_to_guc(q);
>  
>  	wait_event(q->guc->suspend_wait, !q->guc->suspend_pending ||
> -		   guc_read_stopped(guc));
> +		   xe_guc_read_stopped(guc));
>  }
>  
>  static void guc_exec_queue_resume(struct xe_exec_queue *q)
> @@ -1495,7 +1510,7 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc)
>  
>  void xe_guc_submit_reset_wait(struct xe_guc *guc)
>  {
> -	wait_event(guc->ct.wq, !guc_read_stopped(guc));
> +	wait_event(guc->ct.wq, !xe_guc_read_stopped(guc));
>  }
>  
>  void xe_guc_submit_stop(struct xe_guc *guc)
> @@ -1504,7 +1519,7 @@ void xe_guc_submit_stop(struct xe_guc *guc)
>  	unsigned long index;
>  	struct xe_device *xe = guc_to_xe(guc);
>  
> -	xe_assert(xe, guc_read_stopped(guc) == 1);
> +	xe_assert(xe, xe_guc_read_stopped(guc) == 1);
>  
>  	mutex_lock(&guc->submission_state.lock);
>  
> @@ -1542,7 +1557,7 @@ int xe_guc_submit_start(struct xe_guc *guc)
>  	unsigned long index;
>  	struct xe_device *xe = guc_to_xe(guc);
>  
> -	xe_assert(xe, guc_read_stopped(guc) == 1);
> +	xe_assert(xe, xe_guc_read_stopped(guc) == 1);
>  
>  	mutex_lock(&guc->submission_state.lock);
>  	atomic_dec(&guc->submission_state.stopped);
> @@ -1698,8 +1713,6 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  	xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
>  		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
>  
> -	/* FIXME: Do error capture, most likely async */
> -
>  	trace_xe_exec_queue_reset(q);
>  
>  	/*
> @@ -1715,6 +1728,24 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  	return 0;
>  }
>  

missing kerne-doc

> +int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len)

maybe this should be defined as xe_guc_capture_msg_handler() and placed
in xe_guc_capture.c as it doesn't look that it needs anything from
xe_guc_submit.c code

> +{
> +	u32 status;
> +
> +	if (unlikely(len != 1)) {

magic "1"

> +		xe_gt_dbg(guc_to_gt(guc), "Invalid length %u", len);
> +		return -EPROTO;
> +	}
> +
> +	status = msg[0] & XE_GUC_STATE_CAPTURE_EVENT_STATUS_MASK;
> +	if (status == XE_GUC_STATE_CAPTURE_EVENT_STATUS_NOSPACE)
> +		xe_gt_warn(guc_to_gt(guc), "G2H-Error capture no space");

btw, is there anything to capture if GuC reported 'NOSPACE' ?

> +
> +	xe_guc_capture_process(guc);
> +
> +	return 0;
> +}
> +
>  int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>  					       u32 len)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index 4ad5f4c1b084..d92256de473e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -19,12 +19,14 @@ void xe_guc_submit_reset_wait(struct xe_guc *guc);
>  void xe_guc_submit_stop(struct xe_guc *guc);
>  int xe_guc_submit_start(struct xe_guc *guc);
>  
> +int xe_guc_read_stopped(struct xe_guc *guc);
>  int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
>  int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
>  int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len);
>  int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>  					       u32 len);
>  int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len);
> +int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len);
>  
>  struct xe_guc_submit_exec_queue_snapshot *
>  xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 0a83506e1ad8..3bc88fbad952 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -20,6 +20,9 @@
>  #include "xe_gt_printk.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_gt_topology.h"
> +#include "xe_guc.h"
> +#include "xe_guc_capture.h"
> +#include "xe_guc_capture_fwif.h"
>  #include "xe_hw_fence.h"
>  #include "xe_irq.h"
>  #include "xe_lrc.h"
> @@ -287,6 +290,7 @@ static void hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg,
>  static u32 hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg)
>  {
>  	xe_gt_assert(hwe->gt, !(reg.addr & hwe->mmio_base));
> +

unrelated

>  	xe_force_wake_assert_held(gt_to_fw(hwe->gt), hwe->domain);
>  
>  	reg.addr += hwe->mmio_base;
> @@ -825,6 +829,62 @@ xe_hw_engine_snapshot_instdone_capture(struct xe_hw_engine *hwe,
>  	}
>  }
>  
> +static void
> +xe_hw_engine_snapshot_from_hw_by_type(struct xe_hw_engine *hwe,
> +				      struct xe_hw_engine_snapshot *snapshot, int type)
> +{
> +	const struct __guc_mmio_reg_descr_group *list;
> +	u16 capture_class = xe_engine_class_to_guc_capture_class(hwe->class);
> +	int i;
> +
> +	list = xe_guc_capture_get_reg_desc_list(GUC_CAPTURE_LIST_INDEX_PF, type, capture_class);
> +	if (!list)
> +		return;
> +
> +	for (i = 0; i < list->num_regs; i++) {
> +		u32 *field;
> +
> +		/* loop until extra operation registers zone */
> +		if (list->list[i].reg.addr == XE_GUC_SNAPSHOT_EXTRA_OPERATION_REGS_START_REG_ADDR)
> +			break;
> +
> +		field = (u32 *)((uintptr_t)&snapshot->reg +
> +				list->list[i].position_in_snapshot);
> +		if (type == GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE)
> +			*field = hw_engine_mmio_read32(hwe, list->list[i].reg);
> +		else
> +			*field = xe_mmio_read32(hwe->gt, list->list[i].reg);
> +	}
> +}
> +
> +/**

this is static function, no need to have true kernel-doc

> + * xe_hw_engine_snapshot_from_hw - Take a quick engine snapshot from HW.
> + * @hwe: Xe HW Engine.
> + * @snapshot: Point to the Xe HW Engine snapshot object to save data.
> + *
> + * This can be printed out in a later stage like during dev_coredump
> + * analysis.
> + *
> + * Returns: None
> + */
> +static void
> +xe_hw_engine_snapshot_from_hw(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot *snapshot)
> +{
> +	int type;
> +
> +	for (type = GUC_CAPTURE_LIST_TYPE_GLOBAL; type < GUC_CAPTURE_LIST_TYPE_MAX; type++)
> +		xe_hw_engine_snapshot_from_hw_by_type(hwe, snapshot, type);
> +
> +	/* Extra operation required registers zone - start */
> +	if (xe_gt_has_indirect_ring_state(hwe->gt))
> +		snapshot->reg.indirect_ring_state =
> +			hw_engine_mmio_read32(hwe, INDIRECT_RING_STATE(0));
> +	/* Extra operation required registers zone - End */
> +
> +	/* Capture steering registers */
> +	xe_hw_engine_snapshot_instdone_capture(hwe, snapshot);
> +}
> +
>  /**
>   * xe_hw_engine_snapshot_capture - Take a quick snapshot of the HW Engine.
>   * @hwe: Xe HW Engine.
> @@ -839,8 +899,12 @@ struct xe_hw_engine_snapshot *
>  xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>  {
>  	struct xe_hw_engine_snapshot *snapshot;
> +	struct xe_gt *gt = hwe->gt;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_guc *guc = &gt->uc.guc;
>  	size_t len;
> -	u64 val;
> +	u32 i;
> +	bool endian_convert_required;
>  
>  	if (!xe_hw_engine_is_valid(hwe))
>  		return NULL;
> @@ -850,6 +914,9 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>  	if (!snapshot)
>  		return NULL;
>  
> +	i = 0x01020304;
> +	endian_convert_required = (i != le32_to_cpu(i));
> +
>  	/* Because XE_MAX_DSS_FUSE_BITS is defined in xe_gt_types.h and it
>  	 * includes xe_hw_engine_types.h the length of this 3 registers can't be
>  	 * set in struct xe_hw_engine_snapshot, so here doing additional
> @@ -881,62 +948,35 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>  	snapshot->mmio_base = hwe->mmio_base;
>  
>  	/* no more VF accessible data below this point */
> -	if (IS_SRIOV_VF(gt_to_xe(hwe->gt)))
> +	if (IS_SRIOV_VF(xe))
>  		return snapshot;
>  
> -	snapshot->reg.ring_execlist_status =
> -		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_LO(0));
> -	val = hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_HI(0));
> -	snapshot->reg.ring_execlist_status |= val << 32;
> -
> -	snapshot->reg.ring_execlist_sq_contents =
> -		hw_engine_mmio_read32(hwe, RING_EXECLIST_SQ_CONTENTS_LO(0));
> -	val = hw_engine_mmio_read32(hwe, RING_EXECLIST_SQ_CONTENTS_HI(0));
> -	snapshot->reg.ring_execlist_sq_contents |= val << 32;
> -
> -	snapshot->reg.ring_acthd = hw_engine_mmio_read32(hwe, RING_ACTHD(0));
> -	val = hw_engine_mmio_read32(hwe, RING_ACTHD_UDW(0));
> -	snapshot->reg.ring_acthd |= val << 32;
> -
> -	snapshot->reg.ring_bbaddr = hw_engine_mmio_read32(hwe, RING_BBADDR(0));
> -	val = hw_engine_mmio_read32(hwe, RING_BBADDR_UDW(0));
> -	snapshot->reg.ring_bbaddr |= val << 32;
> -
> -	snapshot->reg.ring_dma_fadd =
> -		hw_engine_mmio_read32(hwe, RING_DMA_FADD(0));
> -	val = hw_engine_mmio_read32(hwe, RING_DMA_FADD_UDW(0));
> -	snapshot->reg.ring_dma_fadd |= val << 32;
> -
> -	snapshot->reg.ring_hwstam = hw_engine_mmio_read32(hwe, RING_HWSTAM(0));
> -	snapshot->reg.ring_hws_pga = hw_engine_mmio_read32(hwe, RING_HWS_PGA(0));
> -	snapshot->reg.ring_start = hw_engine_mmio_read32(hwe, RING_START(0));
> -	if (GRAPHICS_VERx100(hwe->gt->tile->xe) >= 2000) {
> -		val = hw_engine_mmio_read32(hwe, RING_START_UDW(0));
> -		snapshot->reg.ring_start |= val << 32;
> -	}
> -	if (xe_gt_has_indirect_ring_state(hwe->gt)) {
> -		snapshot->reg.indirect_ring_state =
> -			hw_engine_mmio_read32(hwe, INDIRECT_RING_STATE(0));
> +	/* Check GuC settings, job is set and capture outlist not empty,
> +	 * otherwise take it from engine
> +	 */
> +	if (xe_device_uc_enabled(xe) && xe->wedged.mode >= 1 &&
> +	    !list_empty(&guc->capture->outlist) && xe->devcoredump.job)
> +		xe_hw_engine_find_and_copy_guc_capture_snapshot(hwe, snapshot);
> +	else
> +		xe_hw_engine_snapshot_from_hw(hwe, snapshot);
> +
> +	/* Read registers defined in "Direct read" list */
> +	xe_hw_engine_snapshot_from_hw_by_type(hwe, snapshot, GUC_CAPTURE_LIST_TYPE_DIRECT_READ);
> +
> +	/* appy mask for ring head and tail */
> +	snapshot->reg.ring_head &= HEAD_ADDR;
> +	snapshot->reg.ring_tail &= TAIL_ADDR;
> +
> +	/* adjust u64 endine in snapshot if needed */
> +	if (endian_convert_required) {
> +		for (i = 0; i < XE_GUC_SNAPSHOT_REGS_U32_START_OFFSET; i += sizeof(u64)) {
> +			u64 *pdata = (u64 *)((ulong)&snapshot->reg + i);
> +			u32 *pl = (u32 *)pdata;
> +			u32 *ph = (u32 *)((ulong)pdata + 4);
> +			*pdata = ((u64)*ph) << 32 | *pl;
> +		}
>  	}
>  
> -	snapshot->reg.ring_head =
> -		hw_engine_mmio_read32(hwe, RING_HEAD(0)) & HEAD_ADDR;
> -	snapshot->reg.ring_tail =
> -		hw_engine_mmio_read32(hwe, RING_TAIL(0)) & TAIL_ADDR;
> -	snapshot->reg.ring_ctl = hw_engine_mmio_read32(hwe, RING_CTL(0));
> -	snapshot->reg.ring_mi_mode =
> -		hw_engine_mmio_read32(hwe, RING_MI_MODE(0));
> -	snapshot->reg.ring_mode = hw_engine_mmio_read32(hwe, RING_MODE(0));
> -	snapshot->reg.ring_imr = hw_engine_mmio_read32(hwe, RING_IMR(0));
> -	snapshot->reg.ring_esr = hw_engine_mmio_read32(hwe, RING_ESR(0));
> -	snapshot->reg.ring_emr = hw_engine_mmio_read32(hwe, RING_EMR(0));
> -	snapshot->reg.ring_eir = hw_engine_mmio_read32(hwe, RING_EIR(0));
> -	snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, RING_IPEHR(0));
> -	xe_hw_engine_snapshot_instdone_capture(hwe, snapshot);
> -
> -	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
> -		snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE);
> -
>  	return snapshot;
>  }
>  
> @@ -993,6 +1033,8 @@ xe_hw_engine_snapshot_instdone_print(struct xe_hw_engine_snapshot *snapshot, str
>  void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
>  				 struct drm_printer *p)
>  {
> +	int i, type;
> +
>  	if (!snapshot)
>  		return;
>  
> @@ -1001,34 +1043,52 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
>  		   snapshot->logical_instance);
>  	drm_printf(p, "\tForcewake: domain 0x%x, ref %d\n",
>  		   snapshot->forcewake.domain, snapshot->forcewake.ref);
> -	drm_printf(p, "\tHWSTAM: 0x%08x\n", snapshot->reg.ring_hwstam);
> -	drm_printf(p, "\tRING_HWS_PGA: 0x%08x\n", snapshot->reg.ring_hws_pga);
> -	drm_printf(p, "\tRING_EXECLIST_STATUS: 0x%016llx\n",
> -		   snapshot->reg.ring_execlist_status);
> -	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS: 0x%016llx\n",
> -		   snapshot->reg.ring_execlist_sq_contents);
> -	drm_printf(p, "\tRING_START: 0x%016llx\n", snapshot->reg.ring_start);
> -	drm_printf(p, "\tRING_HEAD: 0x%08x\n", snapshot->reg.ring_head);
> -	drm_printf(p, "\tRING_TAIL: 0x%08x\n", snapshot->reg.ring_tail);
> -	drm_printf(p, "\tRING_CTL: 0x%08x\n", snapshot->reg.ring_ctl);
> -	drm_printf(p, "\tRING_MI_MODE: 0x%08x\n", snapshot->reg.ring_mi_mode);
> -	drm_printf(p, "\tRING_MODE: 0x%08x\n",
> -		   snapshot->reg.ring_mode);
> -	drm_printf(p, "\tRING_IMR: 0x%08x\n", snapshot->reg.ring_imr);
> -	drm_printf(p, "\tRING_ESR: 0x%08x\n", snapshot->reg.ring_esr);
> -	drm_printf(p, "\tRING_EMR: 0x%08x\n", snapshot->reg.ring_emr);
> -	drm_printf(p, "\tRING_EIR: 0x%08x\n", snapshot->reg.ring_eir);
> -	drm_printf(p, "\tACTHD: 0x%016llx\n", snapshot->reg.ring_acthd);
> -	drm_printf(p, "\tBBADDR: 0x%016llx\n", snapshot->reg.ring_bbaddr);
> -	drm_printf(p, "\tDMA_FADDR: 0x%016llx\n", snapshot->reg.ring_dma_fadd);
> -	drm_printf(p, "\tINDIRECT_RING_STATE: 0x%08x\n",
> -		   snapshot->reg.indirect_ring_state);
> -	drm_printf(p, "\tIPEHR: 0x%08x\n", snapshot->reg.ipehr);
> +
> +	/* Print will include direct read list in this main loop */
> +	for (type = GUC_CAPTURE_LIST_TYPE_GLOBAL; type <= GUC_CAPTURE_LIST_TYPE_DIRECT_READ;
> +	     type++) {
> +		const struct __guc_mmio_reg_descr_group *list;
> +		u16 capture_class = xe_engine_class_to_guc_capture_class(snapshot->hwe->class);
> +
> +		/* Capture engine registers */
> +		list = xe_guc_capture_get_reg_desc_list(GUC_CAPTURE_LIST_INDEX_PF, type,
> +							capture_class);
> +		if (!list)
> +			continue;
> +
> +		/* loop 32bit registers until 64 bit registers */
> +		for (i = 0; i < list->num_regs; i++) {
> +			u32 *field;
> +
> +			if (list->list[i].reg.addr == XE_GUC_SNAPSHOT_REGS_U64_START_REG_ADDR)
> +				break;
> +			field = (u32 *)((uintptr_t)&snapshot->reg +
> +					list->list[i].position_in_snapshot);
> +			drm_printf(p, "\t%s: 0x%08x\n", list->list[i].regname, *field);
> +		}
> +
> +		if (type != GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE)
> +			continue; /* 64bit and special registers is for engine instance only */
> +
> +		/* loop 64 bit registers until special registers */
> +		for (; i < list->num_regs; i += 2) {
> +			u64 *field;
> +
> +			if (list->list[i].reg.addr ==
> +			    XE_GUC_SNAPSHOT_EXTRA_OPERATION_REGS_START_REG_ADDR)
> +				break;
> +			field = (u64 *)((uintptr_t)&snapshot->reg +
> +					list->list[i].position_in_snapshot);
> +			drm_printf(p, "\t%s: 0x%016llx\n", list->list[i].regname, *field);
> +		}
> +
> +		/* Handling special registers - Start */
> +		drm_printf(p, "\tINDIRECT_RING_STATE: 0x%08x\n", snapshot->reg.indirect_ring_state);
> +		/* Handling special registers - End */
> +	}
> +
>  	xe_hw_engine_snapshot_instdone_print(snapshot, p);
>  
> -	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
> -		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
> -			   snapshot->reg.rcu_mode);
>  	drm_puts(p, "\n");
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index 580bbd7e83b2..617101dca272 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -150,6 +150,106 @@ struct xe_hw_engine {
>  	struct xe_hw_engine_class_intf *eclass;
>  };
>  
> +/**
> + * struct xe_hw_engine_snapshot - Hardware engine snapshot
> + *
> + * Contains the snapshot of useful hardware engine info and registers.
> + */
> +struct snapshot_regs {
> +	/* Engine instance type - start */
> +	/* 64 bit registers zone - start */
> +	/*
> +	 * u64 data captured by 2 u32s from GuC or by hw read.
> +	 * Save data into this u64 zone will always write in format of:
> +	 *  offset + 0000: [low 32]
> +	 *  offset + 0004: [high 32]
> +	 * Once all data captured, data will be converted to CPU endian order if needed at the
> +	 * end of xe_hw_engine_snapshot_capture
> +	 */
> +	#define XE_GUC_SNAPSHOT_REGS_U64_START_REG_ADDR RING_ACTHD(0).addr
> +	/** @ring_acthd: RING_ACTHD */
> +	u64 ring_acthd;
> +	/** @ring_bbaddr: RING_BBADDR */
> +	u64 ring_bbaddr;
> +	/** @ring_start: RING_START */
> +	u64 ring_start;
> +	/** @ring_dma_fadd: RING_DMA_FADD */
> +	u64 ring_dma_fadd;
> +	/** @ring_execlist_status: RING_EXECLIST_STATUS */
> +	u64 ring_execlist_status;
> +	/** @ring_execlist_sq_contents: RING_EXECLIST_SQ_CONTENTS */
> +	u64 ring_execlist_sq_contents;
> +	/* 64 bit registers zone - end */
> +
> +	/* 32 bit registers zone - start */
> +	/** @reg.ring_hwstam: RING_HWSTAM */
> +	u32 ring_hwstam;
> +	#define XE_GUC_SNAPSHOT_REGS_U32_START_OFFSET offsetof(struct snapshot_regs, ring_hwstam)
> +
> +	/** @reg.ring_hws_pga: RING_HWS_PGA */
> +	u32 ring_hws_pga;
> +	u32 ring_head;
> +	/** @reg.ring_tail: RING_TAIL */
> +	u32 ring_tail;
> +	/** @reg.ring_ctl: RING_CTL */
> +	u32 ring_ctl;
> +	/** @reg.ring_mi_mode: RING_MI_MODE */
> +	u32 ring_mi_mode;
> +	/** @reg.ring_mode: RING_MODE */
> +	u32 ring_mode;
> +	/** @reg.ring_imr: RING_IMR */
> +	u32 ring_imr;
> +	/** @reg.ring_esr: RING_ESR */
> +	u32 ring_esr;
> +	/** @reg.ring_emr: RING_EMR */
> +	u32 ring_emr;
> +	/** @reg.ring_eir: RING_EIR */
> +	u32 ring_eir;
> +	/** @reg.ipehr: IPEHR */
> +	u32 ipehr;
> +	/* Engine instance type - end */
> +
> +	/* Engine class type - start */
> +	/** @reg.rcu_mode: RCU_MODE */
> +	u32 rcu_mode;
> +	/** @reg.sfc_done_[0-3]: SFC_DONE[0-3] */
> +	u32 sfc_done_0;
> +	u32 sfc_done_1;
> +	u32 sfc_done_2;
> +	u32 sfc_done_3;
> +	/* Engine class type - end */
> +
> +	/* Global type - start */
> +	/** @reg.forcewake_gt: FORCEWAKE_GT */
> +	u32 forcewake_gt;
> +	/* Global type - end */
> +
> +	/* Extra operation Registers zone - start */
> +	/* registers requires extra code to handling */
> +	#define XE_GUC_SNAPSHOT_EXTRA_OPERATION_REGS_START_REG_ADDR INDIRECT_RING_STATE(0).addr
> +	/** @reg.indirect_ring_state: INDIRECT_RING_STATE */
> +	u32 indirect_ring_state;
> +	/* Special registers zone - end */
> +
> +	/* Steering registers */
> +	struct {
> +		/** @reg.instdone.ring: RING_INSTDONE */
> +		u32 ring;
> +		/** @reg.instdone.slice_common: SC_INSTDONE */
> +		u32 *slice_common;
> +		/** @reg.instdone.slice_common_extra: SC_INSTDONE_EXTRA */
> +		u32 *slice_common_extra;
> +		/** @reg.instdone.slice_common_extra2: SC_INSTDONE_EXTRA2 */
> +		u32 *slice_common_extra2;
> +		/** @reg.instdone.sampler: SAMPLER_INSTDONE */
> +		u32 *sampler;
> +		/** @reg.instdone.row: ROW_INSTDONE */
> +		u32 *row;
> +		/** @reg.instdone.geom_svg: INSTDONE_GEOM_SVGUNIT */
> +		u32 *geom_svg;
> +	} instdone;
> +};
> +
>  /**
>   * struct xe_hw_engine_snapshot - Hardware engine snapshot
>   *
> @@ -172,64 +272,7 @@ struct xe_hw_engine_snapshot {
>  	/** @mmio_base: MMIO base address of this hw engine*/
>  	u32 mmio_base;
>  	/** @reg: Useful MMIO register snapshot */
> -	struct {
> -		/** @reg.ring_execlist_status: RING_EXECLIST_STATUS */
> -		u64 ring_execlist_status;
> -		/** @reg.ring_execlist_sq_contents: RING_EXECLIST_SQ_CONTENTS */
> -		u64 ring_execlist_sq_contents;
> -		/** @reg.ring_acthd: RING_ACTHD */
> -		u64 ring_acthd;
> -		/** @reg.ring_bbaddr: RING_BBADDR */
> -		u64 ring_bbaddr;
> -		/** @reg.ring_dma_fadd: RING_DMA_FADD */
> -		u64 ring_dma_fadd;
> -		/** @reg.ring_hwstam: RING_HWSTAM */
> -		u32 ring_hwstam;
> -		/** @reg.ring_hws_pga: RING_HWS_PGA */
> -		u32 ring_hws_pga;
> -		/** @reg.ring_start: RING_START */
> -		u64 ring_start;
> -		/** @reg.ring_head: RING_HEAD */
> -		u32 ring_head;
> -		/** @reg.ring_tail: RING_TAIL */
> -		u32 ring_tail;
> -		/** @reg.ring_ctl: RING_CTL */
> -		u32 ring_ctl;
> -		/** @reg.ring_mi_mode: RING_MI_MODE */
> -		u32 ring_mi_mode;
> -		/** @reg.ring_mode: RING_MODE */
> -		u32 ring_mode;
> -		/** @reg.ring_imr: RING_IMR */
> -		u32 ring_imr;
> -		/** @reg.ring_esr: RING_ESR */
> -		u32 ring_esr;
> -		/** @reg.ring_emr: RING_EMR */
> -		u32 ring_emr;
> -		/** @reg.ring_eir: RING_EIR */
> -		u32 ring_eir;
> -		/** @reg.indirect_ring_state: INDIRECT_RING_STATE */
> -		u32 indirect_ring_state;
> -		/** @reg.ipehr: IPEHR */
> -		u32 ipehr;
> -		/** @reg.rcu_mode: RCU_MODE */
> -		u32 rcu_mode;
> -		struct {
> -			/** @reg.instdone.ring: RING_INSTDONE */
> -			u32 ring;
> -			/** @reg.instdone.slice_common: SC_INSTDONE */
> -			u32 *slice_common;
> -			/** @reg.instdone.slice_common_extra: SC_INSTDONE_EXTRA */
> -			u32 *slice_common_extra;
> -			/** @reg.instdone.slice_common_extra2: SC_INSTDONE_EXTRA2 */
> -			u32 *slice_common_extra2;
> -			/** @reg.instdone.sampler: SAMPLER_INSTDONE */
> -			u32 *sampler;
> -			/** @reg.instdone.row: ROW_INSTDONE */
> -			u32 *row;
> -			/** @reg.instdone.geom_svg: INSTDONE_GEOM_SVGUNIT */
> -			u32 *geom_svg;
> -		} instdone;
> -	} reg;
> +	struct snapshot_regs reg;
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index 882c3437ba5c..8c83601fc695 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -21,6 +21,7 @@ struct xe_lrc_snapshot;
>  struct xe_vm;
>  
>  #define LRC_PPHWSP_SCRATCH_ADDR (0x34 * 4)
> +#define LRC_GTT_ADDRESS_MASK	GENMASK(31, 12)
>  
>  struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
>  			     u32 ring_size);
