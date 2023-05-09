Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEF1C77B7C
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 13:00:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D4410E0A5;
	Tue,  9 May 2023 13:00:43 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7891910E0A5
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 13:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683637241; x=1715173241;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=YLzZNCnYzGJcaFhxuL0mL5II3WQoqVC5Uu8pt3xjrfg=;
 b=DgOwbWiTOo6i4IZaywbe6WRmNeH3oMJpUanw9SMyK9L3iAhuPfwxiJas
 mG2Mn3FGHBxWWmvqajFGgXosczAZ+yjQYDmyuUkqkXm8gJzadQTt15ckd
 EMRzG2SjtsIR2voJ89/VkykDxUzWv5xUZRYhkwDazRT0tGjTT3vz20sS+
 +KXr/jTecVSOF6LdxsRAAFyEpnBBasgx0DdNSam6tFRjlnFp9klZYgU6t
 wjEFogNLvWwWyxqRCA5A/a5iz32PlO1ceQfibMRKAWoxbFuTqAouNUYkk
 vn/9NseMu5RaeENLJeuCBIG0dkDmYguSGMWwNYvPzGC1FkpeSGrUUKDXj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="349950991"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="349950991"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 06:00:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="698890863"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="698890863"
Received: from jparkkin-mobl.ger.corp.intel.com (HELO [10.249.254.236])
 ([10.249.254.236])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 06:00:21 -0700
Message-ID: <18f0a4c5-78ce-980a-cdbb-be2e31fd261a@linux.intel.com>
Date: Tue, 9 May 2023 15:00:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-12-matthew.brost@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230502001727.3211096-12-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v2 11/31] drm/xe/guc: Use doorbells for
 submission if possible
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
Cc: Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 5/2/23 02:17, Matthew Brost wrote:
> We have 256 doorbells (on most platforms) that we can allocate to bypass
> using the H2G channel for submission. This will avoid contention on the
> CT mutex.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Suggested-by: Faith Ekstrand <faith.ekstrand@collabora.com>

Could we describe in a DOC section how doorbells are distributed and if 
there are any suggestions on how to improve that moving forward?

/Thomas

> ---
>   drivers/gpu/drm/xe/regs/xe_guc_regs.h    |   1 +
>   drivers/gpu/drm/xe/xe_guc.c              |   6 +
>   drivers/gpu/drm/xe/xe_guc_engine_types.h |   7 +
>   drivers/gpu/drm/xe/xe_guc_submit.c       | 295 ++++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_guc_submit.h       |   1 +
>   drivers/gpu/drm/xe/xe_guc_types.h        |   4 +
>   drivers/gpu/drm/xe/xe_trace.h            |   5 +
>   7 files changed, 315 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> index 37e0ac550931..11b117293a62 100644
> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> @@ -109,6 +109,7 @@ struct guc_doorbell_info {
>   
>   #define DIST_DBS_POPULATED			XE_REG(0xd08)
>   #define   DOORBELLS_PER_SQIDI_MASK		REG_GENMASK(23, 16)
> +#define	  DOORBELLS_PER_SQIDI_SHIFT		16
>   #define   SQIDIS_DOORBELL_EXIST_MASK		REG_GENMASK(15, 0)
>   
>   #define GUC_BCS_RCS_IER				XE_REG(0xC550)
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 89d20faced19..0c87f78a868b 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -297,6 +297,12 @@ int xe_guc_init(struct xe_guc *guc)
>    */
>   int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>   {
> +	int ret;
> +
> +	ret = xe_guc_submit_init_post_hwconfig(guc);
> +	if (ret)
> +		return ret;
> +
>   	return xe_guc_ads_init_post_hwconfig(&guc->ads);
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_types.h b/drivers/gpu/drm/xe/xe_guc_engine_types.h
> index 5d83132034a6..420b7f53e649 100644
> --- a/drivers/gpu/drm/xe/xe_guc_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_engine_types.h
> @@ -12,6 +12,7 @@
>   #include <drm/gpu_scheduler.h>
>   
>   struct dma_fence;
> +struct xe_bo;
>   struct xe_engine;
>   
>   /**
> @@ -37,6 +38,10 @@ struct xe_guc_engine {
>   	struct work_struct fini_async;
>   	/** @resume_time: time of last resume */
>   	u64 resume_time;
> +	/** @doorbell_bo: BO for memory doorbell */
> +	struct xe_bo *doorbell_bo;
> +	/** @doorbell_offset: MMIO doorbell offset */
> +	u32 doorbell_offset;
>   	/** @state: GuC specific state for this xe_engine */
>   	atomic_t state;
>   	/** @wqi_head: work queue item tail */
> @@ -45,6 +50,8 @@ struct xe_guc_engine {
>   	u32 wqi_tail;
>   	/** @id: GuC id for this xe_engine */
>   	u16 id;
> +	/** @doorbell_id: doorbell id */
> +	u16 doorbell_id;
>   	/** @suspend_wait: wait queue used to wait on pending suspends */
>   	wait_queue_head_t suspend_wait;
>   	/** @suspend_pending: a suspend of the engine is pending */
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 0a41f5d04f6d..1b6f36b04cd1 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -13,7 +13,10 @@
>   
>   #include <drm/drm_managed.h>
>   
> +#include "regs/xe_guc_regs.h"
>   #include "regs/xe_lrc_layout.h"
> +
> +#include "xe_bo.h"
>   #include "xe_device.h"
>   #include "xe_engine.h"
>   #include "xe_force_wake.h"
> @@ -26,12 +29,22 @@
>   #include "xe_lrc.h"
>   #include "xe_macros.h"
>   #include "xe_map.h"
> +#include "xe_mmio.h"
>   #include "xe_mocs.h"
>   #include "xe_ring_ops_types.h"
>   #include "xe_sched_job.h"
>   #include "xe_trace.h"
>   #include "xe_vm.h"
>   
> +#define HAS_GUC_MMIO_DB(xe) (IS_DGFX(xe) || GRAPHICS_VERx100(xe) >= 1250)
> +#define HAS_GUC_DIST_DB(xe) \
> +	(GRAPHICS_VERx100(xe) >= 1200 && !HAS_GUC_MMIO_DB(xe))
> +
> +#define GUC_NUM_HW_DOORBELLS 256
> +
> +#define GUC_MMIO_DB_BAR_OFFSET SZ_4M
> +#define GUC_MMIO_DB_BAR_SIZE SZ_4M
> +
>   static struct xe_gt *
>   guc_to_gt(struct xe_guc *guc)
>   {
> @@ -63,6 +76,7 @@ engine_to_guc(struct xe_engine *e)
>   #define ENGINE_STATE_SUSPENDED		(1 << 5)
>   #define ENGINE_STATE_RESET		(1 << 6)
>   #define ENGINE_STATE_KILLED		(1 << 7)
> +#define ENGINE_STATE_DB_REGISTERED	(1 << 8)
>   
>   static bool engine_registered(struct xe_engine *e)
>   {
> @@ -179,6 +193,16 @@ static void set_engine_killed(struct xe_engine *e)
>   	atomic_or(ENGINE_STATE_KILLED, &e->guc->state);
>   }
>   
> +static bool engine_doorbell_registered(struct xe_engine *e)
> +{
> +	return atomic_read(&e->guc->state) & ENGINE_STATE_DB_REGISTERED;
> +}
> +
> +static void set_engine_doorbell_registered(struct xe_engine *e)
> +{
> +	atomic_or(ENGINE_STATE_DB_REGISTERED, &e->guc->state);
> +}
> +
>   static bool engine_killed_or_banned(struct xe_engine *e)
>   {
>   	return engine_killed(e) || engine_banned(e);
> @@ -190,6 +214,7 @@ static void guc_submit_fini(struct drm_device *drm, void *arg)
>   
>   	xa_destroy(&guc->submission_state.engine_lookup);
>   	ida_destroy(&guc->submission_state.guc_ids);
> +	ida_destroy(&guc->submission_state.doorbell_ids);
>   	bitmap_free(guc->submission_state.guc_ids_bitmap);
>   }
>   
> @@ -230,6 +255,7 @@ int xe_guc_submit_init(struct xe_guc *guc)
>   	mutex_init(&guc->submission_state.lock);
>   	xa_init(&guc->submission_state.engine_lookup);
>   	ida_init(&guc->submission_state.guc_ids);
> +	ida_init(&guc->submission_state.doorbell_ids);
>   
>   	spin_lock_init(&guc->submission_state.suspend.lock);
>   	guc->submission_state.suspend.context = dma_fence_context_alloc(1);
> @@ -243,6 +269,237 @@ int xe_guc_submit_init(struct xe_guc *guc)
>   	return 0;
>   }
>   
> +int xe_guc_submit_init_post_hwconfig(struct xe_guc *guc)
> +{
> +	if (HAS_GUC_DIST_DB(guc_to_xe(guc))) {
> +		u32 distdbreg = xe_mmio_read32(guc_to_gt(guc),
> +					       DIST_DBS_POPULATED.reg);
> +		u32 num_sqidi =
> +			hweight32(distdbreg & SQIDIS_DOORBELL_EXIST_MASK);
> +		u32 doorbells_per_sqidi =
> +			((distdbreg >> DOORBELLS_PER_SQIDI_SHIFT) &
> +			 DOORBELLS_PER_SQIDI_MASK) + 1;
> +
> +		guc->submission_state.num_doorbells =
> +			num_sqidi * doorbells_per_sqidi;
> +	} else {
> +		guc->submission_state.num_doorbells = GUC_NUM_HW_DOORBELLS;
> +	}
> +
> +	return 0;
> +}
> +
> +static bool alloc_doorbell_id(struct xe_guc *guc, struct xe_engine *e)
> +{
> +	int ret;
> +
> +	lockdep_assert_held(&guc->submission_state.lock);
> +
> +	e->guc->doorbell_id = GUC_NUM_HW_DOORBELLS;
> +	ret = ida_simple_get(&guc->submission_state.doorbell_ids, 0,
> +			     guc->submission_state.num_doorbells, GFP_NOWAIT);
> +	if (ret < 0)
> +		return false;
> +
> +	e->guc->doorbell_id = ret;
> +
> +	return true;
> +}
> +
> +static void release_doorbell_id(struct xe_guc *guc, struct xe_engine *e)
> +{
> +	mutex_lock(&guc->submission_state.lock);
> +	ida_simple_remove(&guc->submission_state.doorbell_ids,
> +			  e->guc->doorbell_id);
> +	mutex_unlock(&guc->submission_state.lock);
> +
> +	e->guc->doorbell_id = GUC_NUM_HW_DOORBELLS;
> +}
> +
> +static int allocate_doorbell(struct xe_guc *guc, u16 guc_id, u16 doorbell_id,
> +			     u64 gpa, u32 gtt_addr)
> +{
> +	u32 action[] = {
> +		XE_GUC_ACTION_ALLOCATE_DOORBELL,
> +		guc_id,
> +		doorbell_id,
> +		lower_32_bits(gpa),
> +		upper_32_bits(gpa),
> +		gtt_addr
> +	};
> +
> +	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
> +}
> +
> +static void deallocate_doorbell(struct xe_guc *guc, u16 guc_id)
> +{
> +	u32 action[] = {
> +		XE_GUC_ACTION_DEALLOCATE_DOORBELL,
> +		guc_id
> +	};
> +
> +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
> +}
> +
> +static bool has_doorbell(struct xe_engine *e)
> +{
> +	return e->guc->doorbell_id != GUC_NUM_HW_DOORBELLS;
> +}
> +
> +#define doorbell_read(guc_, e_, field_) ({			\
> +	struct iosys_map _vmap = (e_)->guc->doorbell_bo->vmap;	\
> +	iosys_map_incr(&_vmap, (e_)->guc->doorbell_offset);	\
> +	xe_map_rd_field(guc_to_xe((guc_)), &_vmap, 0,		\
> +				  struct guc_doorbell_info, field_); \
> +	})
> +#define doorbell_write(guc_, e_, field_, val_) ({		\
> +	struct iosys_map _vmap = (e_)->guc->doorbell_bo->vmap;	\
> +	iosys_map_incr(&_vmap, (e_)->guc->doorbell_offset);	\
> +	xe_map_wr_field(guc_to_xe((guc_)), &_vmap, 0,		\
> +				  struct guc_doorbell_info, field_, val_); \
> +	})
> +
> +static void init_doorbell(struct xe_guc *guc, struct xe_engine *e)
> +{
> +	struct xe_device *xe = guc_to_xe(guc);
> +
> +	/* GuC does the initialization with distributed and MMIO doorbells */
> +	if (!HAS_GUC_DIST_DB(xe) && !HAS_GUC_MMIO_DB(xe)) {
> +		doorbell_write(guc, e, db_status, GUC_DOORBELL_ENABLED);
> +		doorbell_write(guc, e, cookie, 0);
> +	}
> +}
> +
> +static void fini_doorbell(struct xe_guc *guc, struct xe_engine *e)
> +{
> +	if (!HAS_GUC_MMIO_DB(guc_to_xe(guc)) &&
> +	    xe_device_mem_access_ongoing(guc_to_xe(guc)))
> +		doorbell_write(guc, e, db_status, GUC_DOORBELL_DISABLED);
> +}
> +
> +static void destroy_doorbell(struct xe_guc *guc, struct xe_engine *e)
> +{
> +	if (has_doorbell(e)) {
> +		release_doorbell_id(guc, e);
> +		xe_bo_unpin_map_no_vm(e->guc->doorbell_bo);
> +	}
> +}
> +
> +static void ring_memory_doorbell(struct xe_guc *guc, struct xe_engine *e)
> +{
> +	u32 cookie;
> +
> +	cookie = doorbell_read(guc, e, cookie);
> +	doorbell_write(guc, e, cookie, cookie + 1 ?: cookie + 2);
> +
> +	XE_WARN_ON(doorbell_read(guc, e, db_status) != GUC_DOORBELL_ENABLED);
> +}
> +
> +#define GUC_MMIO_DOORBELL_RING_ACK	0xACEDBEEF
> +#define GUC_MMIO_DOORBELL_RING_NACK	0xDEADBEEF
> +static void ring_mmio_doorbell(struct xe_guc *guc, u32 doorbell_offset)
> +{
> +	u32 db_value;
> +
> +	db_value = xe_mmio_read32(guc_to_gt(guc), GUC_MMIO_DB_BAR_OFFSET +
> +				  doorbell_offset);
> +
> +	/*
> +	 * The read from the doorbell page will return ack/nack. We don't remove
> +	 * doorbells from active clients so we don't expect to ever get a nack.
> +	 * XXX: if doorbell is lost, re-acquire it?
> +	 */
> +	XE_WARN_ON(db_value == GUC_MMIO_DOORBELL_RING_NACK);
> +	XE_WARN_ON(db_value != GUC_MMIO_DOORBELL_RING_ACK);
> +}
> +
> +static void ring_doorbell(struct xe_guc *guc, struct xe_engine *e)
> +{
> +	XE_BUG_ON(!has_doorbell(e));
> +
> +	if (HAS_GUC_MMIO_DB(guc_to_xe(guc)))
> +		ring_mmio_doorbell(guc, e->guc->doorbell_offset);
> +	else
> +		ring_memory_doorbell(guc, e);
> +
> +	trace_xe_engine_ring_db(e);
> +}
> +
> +static void register_engine(struct xe_engine *e);
> +
> +static int create_doorbell(struct xe_guc *guc, struct xe_engine *e, bool init)
> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u64 gpa;
> +	u32 gtt_addr;
> +	int ret;
> +
> +	XE_BUG_ON(!has_doorbell(e));
> +
> +	if (HAS_GUC_MMIO_DB(xe)) {
> +		e->guc->doorbell_offset = PAGE_SIZE * e->guc->doorbell_id;
> +		gpa = GUC_MMIO_DB_BAR_OFFSET + e->guc->doorbell_offset;
> +		gtt_addr = 0;
> +	} else {
> +		struct xe_bo *bo;
> +
> +		if (!e->guc->doorbell_bo) {
> +			bo = xe_bo_create_pin_map(xe, gt, NULL, PAGE_SIZE,
> +						  ttm_bo_type_kernel,
> +						  XE_BO_CREATE_VRAM_IF_DGFX(gt) |
> +						  XE_BO_CREATE_GGTT_BIT);
> +			if (IS_ERR(bo))
> +				return PTR_ERR(bo);
> +
> +			e->guc->doorbell_bo = bo;
> +		} else {
> +			bo = e->guc->doorbell_bo;
> +		}
> +
> +		init_doorbell(guc, e);
> +		gpa = xe_bo_main_addr(bo, PAGE_SIZE);
> +		gtt_addr = xe_bo_ggtt_addr(bo);
> +	}
> +
> +	if (init && e->flags & ENGINE_FLAG_KERNEL)
> +		return 0;
> +
> +	register_engine(e);
> +	ret = allocate_doorbell(guc, e->guc->id, e->guc->doorbell_id, gpa,
> +				gtt_addr);
> +	if (ret < 0) {
> +		fini_doorbell(guc, e);
> +		return ret;
> +	}
> +
> +	/*
> +	 * In distributed doorbells, guc is returning the cacheline selected
> +	 * by HW as part of the 7bit data from the allocate doorbell command:
> +	 *  bit [22]   - Cacheline allocated
> +	 *  bit [21:16] - Cacheline offset address
> +	 * (bit 21 must be zero, or our assumption of only using half a page is
> +	 * no longer correct).
> +	 */
> +	if (HAS_GUC_DIST_DB(xe)) {
> +		u32 dd_cacheline_info;
> +
> +		XE_WARN_ON(!(ret & BIT(22)));
> +		XE_WARN_ON(ret & BIT(21));
> +
> +		dd_cacheline_info = FIELD_GET(GENMASK(21, 16), ret);
> +		e->guc->doorbell_offset = dd_cacheline_info * cache_line_size();
> +
> +		/* and verify db status was updated correctly by the guc fw */
> +		XE_WARN_ON(doorbell_read(guc, e, db_status) !=
> +			   GUC_DOORBELL_ENABLED);
> +	}
> +
> +	set_engine_doorbell_registered(e);
> +
> +	return 0;
> +}
> +
>   static int alloc_guc_id(struct xe_guc *guc, struct xe_engine *e)
>   {
>   	int ret;
> @@ -623,6 +880,7 @@ static void submit_engine(struct xe_engine *e)
>   	u32 num_g2h = 0;
>   	int len = 0;
>   	bool extra_submit = false;
> +	bool enable = false;
>   
>   	XE_BUG_ON(!engine_registered(e));
>   
> @@ -642,6 +900,7 @@ static void submit_engine(struct xe_engine *e)
>   		num_g2h = 1;
>   		if (xe_engine_is_parallel(e))
>   			extra_submit = true;
> +		enable = true;
>   
>   		e->guc->resume_time = RESUME_PENDING;
>   		set_engine_pending_enable(e);
> @@ -653,7 +912,10 @@ static void submit_engine(struct xe_engine *e)
>   		trace_xe_engine_submit(e);
>   	}
>   
> -	xe_guc_ct_send(&guc->ct, action, len, g2h_len, num_g2h);
> +	if (enable || !engine_doorbell_registered(e))
> +		xe_guc_ct_send(&guc->ct, action, len, g2h_len, num_g2h);
> +	else
> +		ring_doorbell(guc, e);
>   
>   	if (extra_submit) {
>   		len = 0;
> @@ -678,8 +940,17 @@ guc_engine_run_job(struct drm_sched_job *drm_job)
>   	trace_xe_sched_job_run(job);
>   
>   	if (!engine_killed_or_banned(e) && !xe_sched_job_is_error(job)) {
> -		if (!engine_registered(e))
> -			register_engine(e);
> +		if (!engine_registered(e)) {
> +			if (has_doorbell(e)) {
> +				int err = create_doorbell(engine_to_guc(e), e,
> +							  false);
> +
> +				/* Not fatal, but let's warn */
> +				XE_WARN_ON(err);
> +			} else {
> +				register_engine(e);
> +			}
> +		}
>   		if (!lr)	/* Written in IOCTL */
>   			e->ring_ops->emit_job(job);
>   		submit_engine(e);
> @@ -722,6 +993,11 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
>   	MAKE_SCHED_CONTEXT_ACTION(e, DISABLE);
>   	int ret;
>   
> +	if (has_doorbell(e)) {
> +		fini_doorbell(guc, e);
> +		deallocate_doorbell(guc, e->guc->id);
> +	}
> +
>   	set_min_preemption_timeout(guc, e);
>   	smp_rmb();
>   	ret = wait_event_timeout(guc->ct.wq, !engine_pending_enable(e) ||
> @@ -958,6 +1234,7 @@ static void __guc_engine_fini_async(struct work_struct *w)
>   		cancel_work_sync(&ge->lr_tdr);
>   	if (e->flags & ENGINE_FLAG_PERSISTENT)
>   		xe_device_remove_persistent_engines(gt_to_xe(e->gt), e);
> +	destroy_doorbell(guc, e);
>   	release_guc_id(guc, e);
>   	drm_sched_entity_fini(&ge->entity);
>   	drm_sched_fini(&ge->sched);
> @@ -1136,6 +1413,7 @@ static int guc_engine_init(struct xe_engine *e)
>   	struct xe_guc_engine *ge;
>   	long timeout;
>   	int err;
> +	bool create_db = false;
>   
>   	XE_BUG_ON(!xe_device_guc_submission_enabled(guc_to_xe(guc)));
>   
> @@ -1177,8 +1455,17 @@ static int guc_engine_init(struct xe_engine *e)
>   	if (guc_read_stopped(guc))
>   		drm_sched_stop(sched, NULL);
>   
> +	create_db = alloc_doorbell_id(guc, e);
> +
>   	mutex_unlock(&guc->submission_state.lock);
>   
> +	if (create_db) {
> +		/* Error isn't fatal as we don't need a doorbell */
> +		err = create_doorbell(guc, e, true);
> +		if (err)
> +			release_doorbell_id(guc, e);
> +	}
> +
>   	switch (e->class) {
>   	case XE_ENGINE_CLASS_RENDER:
>   		sprintf(e->name, "rcs%d", e->guc->id);
> @@ -1302,7 +1589,7 @@ static int guc_engine_set_job_timeout(struct xe_engine *e, u32 job_timeout_ms)
>   {
>   	struct drm_gpu_scheduler *sched = &e->guc->sched;
>   
> -	XE_BUG_ON(engine_registered(e));
> +	XE_BUG_ON(engine_registered(e) && !has_doorbell(e));
>   	XE_BUG_ON(engine_banned(e));
>   	XE_BUG_ON(engine_killed(e));
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index 8002734d6f24..bada6c02d6aa 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -13,6 +13,7 @@ struct xe_engine;
>   struct xe_guc;
>   
>   int xe_guc_submit_init(struct xe_guc *guc);
> +int xe_guc_submit_init_post_hwconfig(struct xe_guc *guc);
>   void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
>   
>   int xe_guc_submit_reset_prepare(struct xe_guc *guc);
> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> index ac7eec28934d..9ee4d572f4e0 100644
> --- a/drivers/gpu/drm/xe/xe_guc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> @@ -36,10 +36,14 @@ struct xe_guc {
>   		struct xarray engine_lookup;
>   		/** @guc_ids: used to allocate new guc_ids, single-lrc */
>   		struct ida guc_ids;
> +		/** @doorbell_ids: use to allocate new doorbells */
> +		struct ida doorbell_ids;
>   		/** @guc_ids_bitmap: used to allocate new guc_ids, multi-lrc */
>   		unsigned long *guc_ids_bitmap;
>   		/** @stopped: submissions are stopped */
>   		atomic_t stopped;
> +		/** @num_doorbells: number of doorbels */
> +		int num_doorbells;
>   		/** @lock: protects submission state */
>   		struct mutex lock;
>   		/** @suspend: suspend fence state */
> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> index 02861c26e145..38e9d7c6197b 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -149,6 +149,11 @@ DEFINE_EVENT(xe_engine, xe_engine_submit,
>   	     TP_ARGS(e)
>   );
>   
> +DEFINE_EVENT(xe_engine, xe_engine_ring_db,
> +	     TP_PROTO(struct xe_engine *e),
> +	     TP_ARGS(e)
> +);
> +
>   DEFINE_EVENT(xe_engine, xe_engine_scheduling_enable,
>   	     TP_PROTO(struct xe_engine *e),
>   	     TP_ARGS(e)
