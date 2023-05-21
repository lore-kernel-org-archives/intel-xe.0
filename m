Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF929C7EE23
	for <intel-xe@archiver.kernel.org>; Sun, 21 May 2023 12:32:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8703410E1CE;
	Sun, 21 May 2023 12:32:41 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA43810E1CE
 for <intel-xe@lists.freedesktop.org>; Sun, 21 May 2023 12:32:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 965DA60CA3
 for <intel-xe@lists.freedesktop.org>; Sun, 21 May 2023 12:32:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1B5EC4339C
 for <intel-xe@lists.freedesktop.org>; Sun, 21 May 2023 12:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684672358;
 bh=xR2+fpG3PJrbPVY5ligT/mNqndd6o/nWTowAipVz4j8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XMSHbKc67HeApedaEFKzweUO6mYIadctIJ5ZEHPujG7c8wqHI7lunwGgQQevU+u4n
 q2UovUNa5tEboiYWQPLxPZZEqqNHJv3H6NpQ/kbozou+U6wU2waEatWG2tZ55I4tWB
 oby8Q9ZK5sas52u20Q7XY+kHA1l/B5E1kdecwHkshaccgUiP0W5G+v1js1qo/wm+hG
 nCij5989AC7YCvYyHup8LG/WKKnqDRu5xmvflpJWwmxRqMru6bdTVYq3SsffFQi5az
 k1iJfz0VlT7k/pkACexL+CkXjfxOYF1/kvnD1GOyv9Xm4nr3oXE/19/chSed6vr8cd
 ZAh3Gvv3WEPoQ==
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-561da492bcbso62407707b3.3
 for <intel-xe@lists.freedesktop.org>; Sun, 21 May 2023 05:32:37 -0700 (PDT)
X-Gm-Message-State: AC+VfDwURgE/UXDviHnogzKVgXcnHglLmuuvo0BuvpkBaAPDW7F5yMgp
 Xaij1euNMVYvwLJQuyOTnA8rnc7G1CTwZyX6f4s=
X-Google-Smtp-Source: ACHHUZ4FADRTpiHlXm56cqyOLb7jRwkGxAGNl1NqrSPwyerqp6hR2+cgQPEe4d9iI3NImFR9TFvxS4TQs6IqaHE1YDs=
X-Received: by 2002:a81:6d85:0:b0:561:b476:6c4f with SMTP id
 i127-20020a816d85000000b00561b4766c4fmr8990899ywc.36.1684672356853; Sun, 21
 May 2023 05:32:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-12-matthew.brost@intel.com>
In-Reply-To: <20230502001727.3211096-12-matthew.brost@intel.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Sun, 21 May 2023 15:32:10 +0300
X-Gmail-Original-Message-ID: <CAFCwf13sC-O_5oEXBDW-i858_cH0+BU1sW67vyDqGr9V_5oOtw@mail.gmail.com>
Message-ID: <CAFCwf13sC-O_5oEXBDW-i858_cH0+BU1sW67vyDqGr9V_5oOtw@mail.gmail.com>
To: Matthew Brost <matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: intel-xe@lists.freedesktop.org,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Sun, May 21, 2023 at 3:18=E2=80=AFPM Matthew Brost <matthew.brost@intel.=
com> wrote:
>
> We have 256 doorbells (on most platforms) that we can allocate to bypass
> using the H2G channel for submission. This will avoid contention on the
> CT mutex.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Suggested-by: Faith Ekstrand <faith.ekstrand@collabora.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_guc_regs.h    |   1 +
>  drivers/gpu/drm/xe/xe_guc.c              |   6 +
>  drivers/gpu/drm/xe/xe_guc_engine_types.h |   7 +
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 295 ++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_guc_submit.h       |   1 +
>  drivers/gpu/drm/xe/xe_guc_types.h        |   4 +
>  drivers/gpu/drm/xe/xe_trace.h            |   5 +
>  7 files changed, 315 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/r=
egs/xe_guc_regs.h
> index 37e0ac550931..11b117293a62 100644
> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> @@ -109,6 +109,7 @@ struct guc_doorbell_info {
>
>  #define DIST_DBS_POPULATED                     XE_REG(0xd08)
>  #define   DOORBELLS_PER_SQIDI_MASK             REG_GENMASK(23, 16)
> +#define          DOORBELLS_PER_SQIDI_SHIFT             16
>  #define   SQIDIS_DOORBELL_EXIST_MASK           REG_GENMASK(15, 0)
>
>  #define GUC_BCS_RCS_IER                                XE_REG(0xC550)
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 89d20faced19..0c87f78a868b 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -297,6 +297,12 @@ int xe_guc_init(struct xe_guc *guc)
>   */
>  int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>  {
> +       int ret;
> +
> +       ret =3D xe_guc_submit_init_post_hwconfig(guc);
> +       if (ret)
> +               return ret;
> +
>         return xe_guc_ads_init_post_hwconfig(&guc->ads);
>  }
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_types.h b/drivers/gpu/drm/x=
e/xe_guc_engine_types.h
> index 5d83132034a6..420b7f53e649 100644
> --- a/drivers/gpu/drm/xe/xe_guc_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_engine_types.h
> @@ -12,6 +12,7 @@
>  #include <drm/gpu_scheduler.h>
>
>  struct dma_fence;
> +struct xe_bo;
>  struct xe_engine;
>
>  /**
> @@ -37,6 +38,10 @@ struct xe_guc_engine {
>         struct work_struct fini_async;
>         /** @resume_time: time of last resume */
>         u64 resume_time;
> +       /** @doorbell_bo: BO for memory doorbell */
> +       struct xe_bo *doorbell_bo;
> +       /** @doorbell_offset: MMIO doorbell offset */
> +       u32 doorbell_offset;
>         /** @state: GuC specific state for this xe_engine */
>         atomic_t state;
>         /** @wqi_head: work queue item tail */
> @@ -45,6 +50,8 @@ struct xe_guc_engine {
>         u32 wqi_tail;
>         /** @id: GuC id for this xe_engine */
>         u16 id;
> +       /** @doorbell_id: doorbell id */
> +       u16 doorbell_id;
>         /** @suspend_wait: wait queue used to wait on pending suspends */
>         wait_queue_head_t suspend_wait;
>         /** @suspend_pending: a suspend of the engine is pending */
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 0a41f5d04f6d..1b6f36b04cd1 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -13,7 +13,10 @@
>
>  #include <drm/drm_managed.h>
>
> +#include "regs/xe_guc_regs.h"
>  #include "regs/xe_lrc_layout.h"
> +
> +#include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_engine.h"
>  #include "xe_force_wake.h"
> @@ -26,12 +29,22 @@
>  #include "xe_lrc.h"
>  #include "xe_macros.h"
>  #include "xe_map.h"
> +#include "xe_mmio.h"
>  #include "xe_mocs.h"
>  #include "xe_ring_ops_types.h"
>  #include "xe_sched_job.h"
>  #include "xe_trace.h"
>  #include "xe_vm.h"
>
> +#define HAS_GUC_MMIO_DB(xe) (IS_DGFX(xe) || GRAPHICS_VERx100(xe) >=3D 12=
50)
> +#define HAS_GUC_DIST_DB(xe) \
> +       (GRAPHICS_VERx100(xe) >=3D 1200 && !HAS_GUC_MMIO_DB(xe))
> +
> +#define GUC_NUM_HW_DOORBELLS 256
> +
> +#define GUC_MMIO_DB_BAR_OFFSET SZ_4M
> +#define GUC_MMIO_DB_BAR_SIZE SZ_4M
> +
>  static struct xe_gt *
>  guc_to_gt(struct xe_guc *guc)
>  {
> @@ -63,6 +76,7 @@ engine_to_guc(struct xe_engine *e)
>  #define ENGINE_STATE_SUSPENDED         (1 << 5)
>  #define ENGINE_STATE_RESET             (1 << 6)
>  #define ENGINE_STATE_KILLED            (1 << 7)
> +#define ENGINE_STATE_DB_REGISTERED     (1 << 8)
>
>  static bool engine_registered(struct xe_engine *e)
>  {
> @@ -179,6 +193,16 @@ static void set_engine_killed(struct xe_engine *e)
>         atomic_or(ENGINE_STATE_KILLED, &e->guc->state);
>  }
>
> +static bool engine_doorbell_registered(struct xe_engine *e)
> +{
> +       return atomic_read(&e->guc->state) & ENGINE_STATE_DB_REGISTERED;
> +}
> +
> +static void set_engine_doorbell_registered(struct xe_engine *e)
> +{
> +       atomic_or(ENGINE_STATE_DB_REGISTERED, &e->guc->state);
> +}
> +
>  static bool engine_killed_or_banned(struct xe_engine *e)
>  {
>         return engine_killed(e) || engine_banned(e);
> @@ -190,6 +214,7 @@ static void guc_submit_fini(struct drm_device *drm, v=
oid *arg)
>
>         xa_destroy(&guc->submission_state.engine_lookup);
>         ida_destroy(&guc->submission_state.guc_ids);
> +       ida_destroy(&guc->submission_state.doorbell_ids);
>         bitmap_free(guc->submission_state.guc_ids_bitmap);
>  }
>
> @@ -230,6 +255,7 @@ int xe_guc_submit_init(struct xe_guc *guc)
>         mutex_init(&guc->submission_state.lock);
>         xa_init(&guc->submission_state.engine_lookup);
>         ida_init(&guc->submission_state.guc_ids);
> +       ida_init(&guc->submission_state.doorbell_ids);
>
>         spin_lock_init(&guc->submission_state.suspend.lock);
>         guc->submission_state.suspend.context =3D dma_fence_context_alloc=
(1);
> @@ -243,6 +269,237 @@ int xe_guc_submit_init(struct xe_guc *guc)
>         return 0;
>  }
>
> +int xe_guc_submit_init_post_hwconfig(struct xe_guc *guc)
> +{
> +       if (HAS_GUC_DIST_DB(guc_to_xe(guc))) {
> +               u32 distdbreg =3D xe_mmio_read32(guc_to_gt(guc),
> +                                              DIST_DBS_POPULATED.reg);
> +               u32 num_sqidi =3D
> +                       hweight32(distdbreg & SQIDIS_DOORBELL_EXIST_MASK)=
;
> +               u32 doorbells_per_sqidi =3D
> +                       ((distdbreg >> DOORBELLS_PER_SQIDI_SHIFT) &
> +                        DOORBELLS_PER_SQIDI_MASK) + 1;
> +
> +               guc->submission_state.num_doorbells =3D
> +                       num_sqidi * doorbells_per_sqidi;
> +       } else {
> +               guc->submission_state.num_doorbells =3D GUC_NUM_HW_DOORBE=
LLS;
> +       }
> +
> +       return 0;
> +}
> +
> +static bool alloc_doorbell_id(struct xe_guc *guc, struct xe_engine *e)
> +{
> +       int ret;
> +
> +       lockdep_assert_held(&guc->submission_state.lock);
> +
> +       e->guc->doorbell_id =3D GUC_NUM_HW_DOORBELLS;
> +       ret =3D ida_simple_get(&guc->submission_state.doorbell_ids, 0,
> +                            guc->submission_state.num_doorbells, GFP_NOW=
AIT);
> +       if (ret < 0)
> +               return false;
> +
> +       e->guc->doorbell_id =3D ret;
> +
> +       return true;
> +}
> +
> +static void release_doorbell_id(struct xe_guc *guc, struct xe_engine *e)
> +{
> +       mutex_lock(&guc->submission_state.lock);
> +       ida_simple_remove(&guc->submission_state.doorbell_ids,
> +                         e->guc->doorbell_id);
> +       mutex_unlock(&guc->submission_state.lock);
> +
> +       e->guc->doorbell_id =3D GUC_NUM_HW_DOORBELLS;
> +}
> +
> +static int allocate_doorbell(struct xe_guc *guc, u16 guc_id, u16 doorbel=
l_id,
> +                            u64 gpa, u32 gtt_addr)
> +{
> +       u32 action[] =3D {
> +               XE_GUC_ACTION_ALLOCATE_DOORBELL,
> +               guc_id,
> +               doorbell_id,
> +               lower_32_bits(gpa),
> +               upper_32_bits(gpa),
> +               gtt_addr
> +       };
> +
> +       return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action))=
;
> +}
> +
> +static void deallocate_doorbell(struct xe_guc *guc, u16 guc_id)
> +{
> +       u32 action[] =3D {
> +               XE_GUC_ACTION_DEALLOCATE_DOORBELL,
> +               guc_id
> +       };
> +
> +       xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
> +}
> +
> +static bool has_doorbell(struct xe_engine *e)
> +{
> +       return e->guc->doorbell_id !=3D GUC_NUM_HW_DOORBELLS;
> +}
> +
> +#define doorbell_read(guc_, e_, field_) ({                     \
> +       struct iosys_map _vmap =3D (e_)->guc->doorbell_bo->vmap;  \
> +       iosys_map_incr(&_vmap, (e_)->guc->doorbell_offset);     \
> +       xe_map_rd_field(guc_to_xe((guc_)), &_vmap, 0,           \
> +                                 struct guc_doorbell_info, field_); \
> +       })
> +#define doorbell_write(guc_, e_, field_, val_) ({              \
> +       struct iosys_map _vmap =3D (e_)->guc->doorbell_bo->vmap;  \
> +       iosys_map_incr(&_vmap, (e_)->guc->doorbell_offset);     \
> +       xe_map_wr_field(guc_to_xe((guc_)), &_vmap, 0,           \
> +                                 struct guc_doorbell_info, field_, val_)=
; \
> +       })
> +
> +static void init_doorbell(struct xe_guc *guc, struct xe_engine *e)
> +{
> +       struct xe_device *xe =3D guc_to_xe(guc);
> +
> +       /* GuC does the initialization with distributed and MMIO doorbell=
s */
> +       if (!HAS_GUC_DIST_DB(xe) && !HAS_GUC_MMIO_DB(xe)) {
> +               doorbell_write(guc, e, db_status, GUC_DOORBELL_ENABLED);
> +               doorbell_write(guc, e, cookie, 0);
> +       }
> +}
> +
> +static void fini_doorbell(struct xe_guc *guc, struct xe_engine *e)
> +{
> +       if (!HAS_GUC_MMIO_DB(guc_to_xe(guc)) &&
> +           xe_device_mem_access_ongoing(guc_to_xe(guc)))
> +               doorbell_write(guc, e, db_status, GUC_DOORBELL_DISABLED);
> +}
> +
> +static void destroy_doorbell(struct xe_guc *guc, struct xe_engine *e)
> +{
> +       if (has_doorbell(e)) {
> +               release_doorbell_id(guc, e);
> +               xe_bo_unpin_map_no_vm(e->guc->doorbell_bo);
> +       }
> +}
> +
> +static void ring_memory_doorbell(struct xe_guc *guc, struct xe_engine *e=
)
> +{
> +       u32 cookie;
> +
> +       cookie =3D doorbell_read(guc, e, cookie);
> +       doorbell_write(guc, e, cookie, cookie + 1 ?: cookie + 2);
> +
> +       XE_WARN_ON(doorbell_read(guc, e, db_status) !=3D GUC_DOORBELL_ENA=
BLED);
> +}
> +
> +#define GUC_MMIO_DOORBELL_RING_ACK     0xACEDBEEF
> +#define GUC_MMIO_DOORBELL_RING_NACK    0xDEADBEEF
> +static void ring_mmio_doorbell(struct xe_guc *guc, u32 doorbell_offset)
> +{
> +       u32 db_value;
> +
> +       db_value =3D xe_mmio_read32(guc_to_gt(guc), GUC_MMIO_DB_BAR_OFFSE=
T +
> +                                 doorbell_offset);
> +
> +       /*
> +        * The read from the doorbell page will return ack/nack. We don't=
 remove
> +        * doorbells from active clients so we don't expect to ever get a=
 nack.
> +        * XXX: if doorbell is lost, re-acquire it?
> +        */
> +       XE_WARN_ON(db_value =3D=3D GUC_MMIO_DOORBELL_RING_NACK);
> +       XE_WARN_ON(db_value !=3D GUC_MMIO_DOORBELL_RING_ACK);
> +}
> +
> +static void ring_doorbell(struct xe_guc *guc, struct xe_engine *e)
> +{
> +       XE_BUG_ON(!has_doorbell(e));
> +
> +       if (HAS_GUC_MMIO_DB(guc_to_xe(guc)))
> +               ring_mmio_doorbell(guc, e->guc->doorbell_offset);
> +       else
> +               ring_memory_doorbell(guc, e);
> +
> +       trace_xe_engine_ring_db(e);
> +}
> +
> +static void register_engine(struct xe_engine *e);
> +
> +static int create_doorbell(struct xe_guc *guc, struct xe_engine *e, bool=
 init)
> +{
> +       struct xe_gt *gt =3D guc_to_gt(guc);
> +       struct xe_device *xe =3D gt_to_xe(gt);
> +       u64 gpa;
> +       u32 gtt_addr;
> +       int ret;
> +
> +       XE_BUG_ON(!has_doorbell(e));
> +
> +       if (HAS_GUC_MMIO_DB(xe)) {
> +               e->guc->doorbell_offset =3D PAGE_SIZE * e->guc->doorbell_=
id;
I think there is an implied assumption here (and in the code below)
that PAGE_SIZE is always 4KB, which is problematic in non-x86
architectures.
If there is no limitation on xe being used solely on x86_64, then I
think it would be better to change this to SZ_4K

> +               gpa =3D GUC_MMIO_DB_BAR_OFFSET + e->guc->doorbell_offset;
> +               gtt_addr =3D 0;
> +       } else {
> +               struct xe_bo *bo;
> +
> +               if (!e->guc->doorbell_bo) {
> +                       bo =3D xe_bo_create_pin_map(xe, gt, NULL, PAGE_SI=
ZE,
> +                                                 ttm_bo_type_kernel,
> +                                                 XE_BO_CREATE_VRAM_IF_DG=
FX(gt) |
> +                                                 XE_BO_CREATE_GGTT_BIT);
> +                       if (IS_ERR(bo))
> +                               return PTR_ERR(bo);
> +
> +                       e->guc->doorbell_bo =3D bo;
> +               } else {
> +                       bo =3D e->guc->doorbell_bo;
> +               }
> +
> +               init_doorbell(guc, e);
> +               gpa =3D xe_bo_main_addr(bo, PAGE_SIZE);
> +               gtt_addr =3D xe_bo_ggtt_addr(bo);
> +       }
> +
> +       if (init && e->flags & ENGINE_FLAG_KERNEL)
> +               return 0;
> +
> +       register_engine(e);
> +       ret =3D allocate_doorbell(guc, e->guc->id, e->guc->doorbell_id, g=
pa,
> +                               gtt_addr);
> +       if (ret < 0) {
> +               fini_doorbell(guc, e);
> +               return ret;
> +       }
> +
> +       /*
> +        * In distributed doorbells, guc is returning the cacheline selec=
ted
> +        * by HW as part of the 7bit data from the allocate doorbell comm=
and:
> +        *  bit [22]   - Cacheline allocated
> +        *  bit [21:16] - Cacheline offset address
> +        * (bit 21 must be zero, or our assumption of only using half a p=
age is
> +        * no longer correct).
> +        */
> +       if (HAS_GUC_DIST_DB(xe)) {
> +               u32 dd_cacheline_info;
> +
> +               XE_WARN_ON(!(ret & BIT(22)));
> +               XE_WARN_ON(ret & BIT(21));
> +
> +               dd_cacheline_info =3D FIELD_GET(GENMASK(21, 16), ret);
> +               e->guc->doorbell_offset =3D dd_cacheline_info * cache_lin=
e_size();
I don't understand something. We have 256 doorbells, but here you
overrun the doorbell_offset, where dd_cacheline_info can be 0-31
(because bit 21 is always 0).
This has overlap... Some doorbells will get the same address.
> +
> +               /* and verify db status was updated correctly by the guc =
fw */
> +               XE_WARN_ON(doorbell_read(guc, e, db_status) !=3D
> +                          GUC_DOORBELL_ENABLED);
> +       }
> +
> +       set_engine_doorbell_registered(e);
> +
> +       return 0;
> +}
> +
>  static int alloc_guc_id(struct xe_guc *guc, struct xe_engine *e)
>  {
>         int ret;
> @@ -623,6 +880,7 @@ static void submit_engine(struct xe_engine *e)
>         u32 num_g2h =3D 0;
>         int len =3D 0;
>         bool extra_submit =3D false;
> +       bool enable =3D false;
>
>         XE_BUG_ON(!engine_registered(e));
>
> @@ -642,6 +900,7 @@ static void submit_engine(struct xe_engine *e)
>                 num_g2h =3D 1;
>                 if (xe_engine_is_parallel(e))
>                         extra_submit =3D true;
> +               enable =3D true;
>
>                 e->guc->resume_time =3D RESUME_PENDING;
>                 set_engine_pending_enable(e);
> @@ -653,7 +912,10 @@ static void submit_engine(struct xe_engine *e)
>                 trace_xe_engine_submit(e);
>         }
>
> -       xe_guc_ct_send(&guc->ct, action, len, g2h_len, num_g2h);
> +       if (enable || !engine_doorbell_registered(e))
> +               xe_guc_ct_send(&guc->ct, action, len, g2h_len, num_g2h);
> +       else
> +               ring_doorbell(guc, e);
>
>         if (extra_submit) {
>                 len =3D 0;
> @@ -678,8 +940,17 @@ guc_engine_run_job(struct drm_sched_job *drm_job)
>         trace_xe_sched_job_run(job);
>
>         if (!engine_killed_or_banned(e) && !xe_sched_job_is_error(job)) {
> -               if (!engine_registered(e))
> -                       register_engine(e);
> +               if (!engine_registered(e)) {
> +                       if (has_doorbell(e)) {
> +                               int err =3D create_doorbell(engine_to_guc=
(e), e,
> +                                                         false);
> +
> +                               /* Not fatal, but let's warn */
> +                               XE_WARN_ON(err);
> +                       } else {
> +                               register_engine(e);
> +                       }
> +               }
>                 if (!lr)        /* Written in IOCTL */
>                         e->ring_ops->emit_job(job);
>                 submit_engine(e);
> @@ -722,6 +993,11 @@ static void disable_scheduling_deregister(struct xe_=
guc *guc,
>         MAKE_SCHED_CONTEXT_ACTION(e, DISABLE);
>         int ret;
>
> +       if (has_doorbell(e)) {
> +               fini_doorbell(guc, e);
> +               deallocate_doorbell(guc, e->guc->id);
> +       }
> +
>         set_min_preemption_timeout(guc, e);
>         smp_rmb();
>         ret =3D wait_event_timeout(guc->ct.wq, !engine_pending_enable(e) =
||
> @@ -958,6 +1234,7 @@ static void __guc_engine_fini_async(struct work_stru=
ct *w)
>                 cancel_work_sync(&ge->lr_tdr);
>         if (e->flags & ENGINE_FLAG_PERSISTENT)
>                 xe_device_remove_persistent_engines(gt_to_xe(e->gt), e);
> +       destroy_doorbell(guc, e);
>         release_guc_id(guc, e);
>         drm_sched_entity_fini(&ge->entity);
>         drm_sched_fini(&ge->sched);
> @@ -1136,6 +1413,7 @@ static int guc_engine_init(struct xe_engine *e)
>         struct xe_guc_engine *ge;
>         long timeout;
>         int err;
> +       bool create_db =3D false;
>
>         XE_BUG_ON(!xe_device_guc_submission_enabled(guc_to_xe(guc)));
>
> @@ -1177,8 +1455,17 @@ static int guc_engine_init(struct xe_engine *e)
>         if (guc_read_stopped(guc))
>                 drm_sched_stop(sched, NULL);
>
> +       create_db =3D alloc_doorbell_id(guc, e);
> +
>         mutex_unlock(&guc->submission_state.lock);
>
> +       if (create_db) {
> +               /* Error isn't fatal as we don't need a doorbell */
> +               err =3D create_doorbell(guc, e, true);
> +               if (err)
> +                       release_doorbell_id(guc, e);
> +       }
> +
>         switch (e->class) {
>         case XE_ENGINE_CLASS_RENDER:
>                 sprintf(e->name, "rcs%d", e->guc->id);
> @@ -1302,7 +1589,7 @@ static int guc_engine_set_job_timeout(struct xe_eng=
ine *e, u32 job_timeout_ms)
>  {
>         struct drm_gpu_scheduler *sched =3D &e->guc->sched;
>
> -       XE_BUG_ON(engine_registered(e));
> +       XE_BUG_ON(engine_registered(e) && !has_doorbell(e));
>         XE_BUG_ON(engine_banned(e));
>         XE_BUG_ON(engine_killed(e));
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_g=
uc_submit.h
> index 8002734d6f24..bada6c02d6aa 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -13,6 +13,7 @@ struct xe_engine;
>  struct xe_guc;
>
>  int xe_guc_submit_init(struct xe_guc *guc);
> +int xe_guc_submit_init_post_hwconfig(struct xe_guc *guc);
>  void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
>
>  int xe_guc_submit_reset_prepare(struct xe_guc *guc);
> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_gu=
c_types.h
> index ac7eec28934d..9ee4d572f4e0 100644
> --- a/drivers/gpu/drm/xe/xe_guc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> @@ -36,10 +36,14 @@ struct xe_guc {
>                 struct xarray engine_lookup;
>                 /** @guc_ids: used to allocate new guc_ids, single-lrc */
>                 struct ida guc_ids;
> +               /** @doorbell_ids: use to allocate new doorbells */
> +               struct ida doorbell_ids;
>                 /** @guc_ids_bitmap: used to allocate new guc_ids, multi-=
lrc */
>                 unsigned long *guc_ids_bitmap;
>                 /** @stopped: submissions are stopped */
>                 atomic_t stopped;
> +               /** @num_doorbells: number of doorbels */
> +               int num_doorbells;
>                 /** @lock: protects submission state */
>                 struct mutex lock;
>                 /** @suspend: suspend fence state */
> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.=
h
> index 02861c26e145..38e9d7c6197b 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -149,6 +149,11 @@ DEFINE_EVENT(xe_engine, xe_engine_submit,
>              TP_ARGS(e)
>  );
>
> +DEFINE_EVENT(xe_engine, xe_engine_ring_db,
> +            TP_PROTO(struct xe_engine *e),
> +            TP_ARGS(e)
> +);
> +
>  DEFINE_EVENT(xe_engine, xe_engine_scheduling_enable,
>              TP_PROTO(struct xe_engine *e),
>              TP_ARGS(e)
> --
> 2.34.1
>
>
