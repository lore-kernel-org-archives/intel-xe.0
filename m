Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458DFC7EE23
	for <intel-xe@archiver.kernel.org>; Wed, 24 May 2023 05:02:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0A4F10E574;
	Wed, 24 May 2023 05:02:09 +0000 (UTC)
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B2110E574
 for <intel-xe@lists.freedesktop.org>; Wed, 24 May 2023 05:02:05 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-390723f815fso227327b6e.3
 for <intel-xe@lists.freedesktop.org>; Tue, 23 May 2023 22:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684904525; x=1687496525;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7v2JZQ1QNoq/uXWMgd8NxveLBUpL6Q4LTEjwUBt7Z/o=;
 b=jB90Ox0NaCXxaDfsSn8ghsRp3YA9DT9cES2om82tuN2fOuIM9Ra6rUI/ZcI3WUjP2h
 y5n6xADtrGdLbAlsmMaP5qanSyGdX/4JPKzdbV5yjRsWroF6XAdxO9AdxLitcPf5xKWq
 fcuB+Y+wcFdKqeBbJcW1pBQcTV3mv3sMIYIaMPI74OaE5RMEenPI6lEb72PLIRpP83da
 ntfZe2Lomz8FrS6vUe/M/mSaNCfRQAlORdi0N2cySbvz87fPk7dX94hxmAdEpie+9p/S
 2oRAOoWQPBGWU/j7wMT52miomwB9ylN6unsTDXeqaJWxZ8gJS5k7zF5oJlO1uA2IkCWu
 wqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684904525; x=1687496525;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7v2JZQ1QNoq/uXWMgd8NxveLBUpL6Q4LTEjwUBt7Z/o=;
 b=IucJWystbBdZDzwg/hbqYuKsO0Xs+zF4hvDF1/AchMo3NC8HDgWf421l2nYqz3vnm/
 HkWJuP8c6zWv2HFtAJuZatYrPNpvUUAnDGFCMsm9aNfvae0CXWaGgKA0oY8gnAQZ3wz4
 FQ3sHyFTj5XDAiWNi7d9hyfnjAuN1vUWgYLFWdgdTj5H8hQ+NOp55B7//qMVU6n3XB/M
 llHjMdKeAgUTypRAeA0STN4BMCQuDn0UNfjsWHiqBQJHarIdDG5HVVPz9qMIiPlyXB+q
 ZV+zqn4kebTqFWjVzNRr9jZktPhO0lIrfe3y11hL1VofZWjvzM+gKAqQJMCm2p99TNDv
 vVjA==
X-Gm-Message-State: AC+VfDzuID63dAYcfmmpMMYzL76oMPgud/ybVYmW2C/4xXORhMO06NHg
 KmiCb0O6QBoYSrpU5xT1uBqHc+4feodFrPTN23g15brOfymegjXm
X-Google-Smtp-Source: ACHHUZ6PuXUERJFjsz08haiWJ+XGnTUyPq8XCqx4skeudzlBrEKZ30tnvoSjwjLUxi/1k651BBpPc5T8Ft49Ap8BwC8=
X-Received: by 2002:aca:910:0:b0:398:f41:cd0c with SMTP id
 16-20020aca0910000000b003980f41cd0cmr4608800oij.5.1684904524531; 
 Tue, 23 May 2023 22:02:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230523054404.4011148-1-matthew.brost@intel.com>
 <20230523054404.4011148-9-matthew.brost@intel.com>
 <CA+aRtua3TQh0kh6CaEA=oE1OPrSGXFBUJY2FwXp8MZ+EYasG8Q@mail.gmail.com>
 <CA+aRtuYm7G8F8JhDKQiuKVBKmkYahVGghee+5tDY4ht4pG3jfA@mail.gmail.com>
 <ZGzBvl8NwKQlUzTi@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZGzBvl8NwKQlUzTi@DUT025-TGLU.fm.intel.com>
From: Christopher Snowhill <kode54@gmail.com>
Date: Tue, 23 May 2023 22:01:53 -0700
Message-ID: <CA+aRtuYyMaSRcAouAx4f_YkD3AB6V2iG+Sg4+ozjfgaA1kDRvQ@mail.gmail.com>
To: Matthew Brost <matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH v2 8/8] drm/xe: VM LRU bulk move
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, May 23, 2023 at 6:38=E2=80=AFAM Matthew Brost <matthew.brost@intel.=
com> wrote:
>
> On Mon, May 22, 2023 at 11:52:43PM -0700, Christopher Snowhill wrote:
> > On Mon, May 22, 2023 at 11:38=E2=80=AFPM Christopher Snowhill <kode54@g=
mail.com> wrote:
> > >
> > > On Mon, May 22, 2023 at 10:44=E2=80=AFPM Matthew Brost <matthew.brost=
@intel.com> wrote:
> > > >
> > > > Use the TTM LRU bulk move for BOs tied to a VM. Update the bulk mov=
es
> > > > LRU position on every exec.
> > > >
> > > > v2: Bulk move for compute VMs, remove bulk LRU in xe_gem_object_fre=
e
> > > >
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_bo.c       | 24 ++++++++++++++++++++----
> > > >  drivers/gpu/drm/xe/xe_bo.h       |  4 ++--
> > > >  drivers/gpu/drm/xe/xe_dma_buf.c  |  2 +-
> > > >  drivers/gpu/drm/xe/xe_exec.c     |  6 ++++++
> > > >  drivers/gpu/drm/xe/xe_vm.c       |  4 ++++
> > > >  drivers/gpu/drm/xe/xe_vm_types.h |  3 +++
> > > >  6 files changed, 36 insertions(+), 7 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.=
c
> > > > index c82e995df779..22cf65bd63fe 100644
> > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > @@ -968,6 +968,16 @@ static void xe_ttm_bo_destroy(struct ttm_buffe=
r_object *ttm_bo)
> > > >
> > > >  static void xe_gem_object_free(struct drm_gem_object *obj)
> > > >  {
> > > > +       struct xe_bo *bo =3D gem_to_xe_bo(obj);
> > > > +
> > > > +       if (bo->vm && !xe_vm_in_fault_mode(bo->vm) && xe_bo_is_user=
(bo)) {
> > > > +               struct ww_acquire_ctx ww;
> > > > +
> > > > +               xe_bo_lock(bo, &ww, 0, false);
> > > > +               ttm_bo_set_bulk_move(&bo->ttm, NULL);
> > > > +               xe_bo_unlock(bo, &ww);
> > > > +       }
> > > > +
> > > >         /* Our BO reference counting scheme works as follows:
> > > >          *
> > > >          * The gem object kref is typically used throughout the dri=
ver,
> > > > @@ -1081,8 +1091,8 @@ void xe_bo_free(struct xe_bo *bo)
> > > >
> > > >  struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct x=
e_bo *bo,
> > > >                                     struct xe_gt *gt, struct dma_re=
sv *resv,
> > > > -                                   size_t size, enum ttm_bo_type t=
ype,
> > > > -                                   u32 flags)
> > > > +                                   struct ttm_lru_bulk_move *bulk,=
 size_t size,
> > > > +                                   enum ttm_bo_type type, u32 flag=
s)
> > > >  {
> > > >         struct ttm_operation_ctx ctx =3D {
> > > >                 .interruptible =3D true,
> > > > @@ -1149,7 +1159,10 @@ struct xe_bo *__xe_bo_create_locked(struct x=
e_device *xe, struct xe_bo *bo,
> > > >                 return ERR_PTR(err);
> > > >
> > > >         bo->created =3D true;
> > > > -       ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
> > > > +       if (bulk)
> > > > +               ttm_bo_set_bulk_move(&bo->ttm, bulk);
> > > > +       else
> > > > +               ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
> > > >
> > > >         return bo;
> > > >  }
> > > > @@ -1219,7 +1232,10 @@ xe_bo_create_locked_range(struct xe_device *=
xe,
> > > >                 }
> > > >         }
> > > >
> > > > -       bo =3D __xe_bo_create_locked(xe, bo, gt, vm ? &vm->resv : N=
ULL, size,
> > > > +       bo =3D __xe_bo_create_locked(xe, bo, gt, vm ? &vm->resv : N=
ULL,
> > > > +                                  vm && !xe_vm_in_fault_mode(vm) &=
&
> > > > +                                  flags & XE_BO_CREATE_USER_BIT ?
> > > > +                                  &vm->lru_bulk_move : NULL, size,
> > > >                                    type, flags);
> > > >         if (IS_ERR(bo))
> > > >                 return bo;
> > > > diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.=
h
> > > > index 7e111332c35a..f7562012b836 100644
> > > > --- a/drivers/gpu/drm/xe/xe_bo.h
> > > > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > > > @@ -81,8 +81,8 @@ void xe_bo_free(struct xe_bo *bo);
> > > >
> > > >  struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct x=
e_bo *bo,
> > > >                                     struct xe_gt *gt, struct dma_re=
sv *resv,
> > > > -                                   size_t size, enum ttm_bo_type t=
ype,
> > > > -                                   u32 flags);
> > > > +                                   struct ttm_lru_bulk_move *bulk,=
 size_t size,
> > > > +                                   enum ttm_bo_type type, u32 flag=
s);
> > > >  struct xe_bo *
> > > >  xe_bo_create_locked_range(struct xe_device *xe,
> > > >                           struct xe_gt *gt, struct xe_vm *vm,
> > > > diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/x=
e_dma_buf.c
> > > > index 9b252cc782b7..975dee1f770f 100644
> > > > --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> > > > +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> > > > @@ -199,7 +199,7 @@ xe_dma_buf_init_obj(struct drm_device *dev, str=
uct xe_bo *storage,
> > > >         int ret;
> > > >
> > > >         dma_resv_lock(resv, NULL);
> > > > -       bo =3D __xe_bo_create_locked(xe, storage, NULL, resv, dma_b=
uf->size,
> > > > +       bo =3D __xe_bo_create_locked(xe, storage, NULL, resv, NULL,=
 dma_buf->size,
> > > >                                    ttm_bo_type_sg, XE_BO_CREATE_SYS=
TEM_BIT);
> > > >         if (IS_ERR(bo)) {
> > > >                 ret =3D PTR_ERR(bo);
> > > > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_e=
xec.c
> > > > index ff4df00f20a2..b2dcf34af16b 100644
> > > > --- a/drivers/gpu/drm/xe/xe_exec.c
> > > > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > > > @@ -395,6 +395,12 @@ int xe_exec_ioctl(struct drm_device *dev, void=
 *data, struct drm_file *file)
> > > >         xe_sched_job_push(job);
> > > >         xe_vm_reactivate_rebind(vm);
> > > >
> > > > +       if (!err && !xe_vm_no_dma_fences(vm)) {
> > > > +               spin_lock(&xe->ttm.lru_lock);
> > > > +               ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
> > > > +               spin_unlock(&xe->ttm.lru_lock);
> > > > +       }
> > > > +
> > > >  err_repin:
> > > >         if (!xe_vm_no_dma_fences(vm))
> > > >                 up_read(&vm->userptr.notifier_lock);
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.=
c
> > > > index 0398da1ef1e2..a5d65d0325d6 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > @@ -629,6 +629,10 @@ static void preempt_rebind_work_func(struct wo=
rk_struct *w)
> > > >
> > > >  #undef retry_required
> > > >
> > > > +       spin_lock(&vm->xe->ttm.lru_lock);
> > > > +       ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
> > > > +       spin_unlock(&vm->xe->ttm.lru_lock);
> > > > +
> > > >         /* Point of no return. */
> > > >         arm_preempt_fences(vm, &preempt_fences);
> > > >         resume_and_reinstall_preempt_fences(vm);
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/=
xe_vm_types.h
> > > > index fada7896867f..d3e99f22510d 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > > @@ -164,6 +164,9 @@ struct xe_vm {
> > > >         /** Protects @rebind_list and the page-table structures */
> > > >         struct dma_resv resv;
> > > >
> > > > +       /** @lru_bulk_move: Bulk LRU move list for this VM's BOs */
> > > > +       struct ttm_lru_bulk_move lru_bulk_move;
> > > > +
> > > >         u64 size;
> > > >         struct rb_root vmas;
> > > >
> > > > --
> > > > 2.34.1
> > >
> > > Something in this patch version, either moving the cleanup to
> > > gem_free, or the move_tail later in the patch set, causes kmscube to
> > > deadlock on terminate, forcing me to reboot the machine. Reboot got
> > > stuck when it tried to terminate my user session, so I had to press
> > > the reset button.
> >
>
> Any chance you have a dmesg for the deadlock on terminate? Hoping it
> gives some clues to the issue.
>
> > Verified, substituting patch 8 of 8 from v1 results in cleanly
> > terminating kmscube.
>
> It was Thomas's suggestion to move this from close to free, this is a
> fairly old patch and couldn't recall why it was in close rather than
> free. Now I think about this, I believe originally this was in free but
> moved to close to fix a bug, will try to remind why it needs to be in
> close.
>
> Matt

It actually goes zombie/defunct on termination. I couldn't backtrace
it, so I had to wait for the kernel to spew forth a backtrace of its
own from the hung kworker processes that caused them to be stuck:

[  245.565723] INFO: task kworker/14:1:130 blocked for more than 122 second=
s.
[  245.566642]       Tainted: P        W  OE
6.3.0-1-drm-xe-next-git-g48a7045a0879-dirty #6
[  245.567413] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[  245.568207] task:kworker/14:1    state:D stack:0     pid:130
ppid:2      flags:0x00004000
[  245.568216] Workqueue: events __guc_engine_fini_async [xe]
[  245.568392] Call Trace:
[  245.568394]  <TASK>
[  245.568398]  __schedule+0x443/0x1400
[  245.568408]  ? check_preempt_curr+0x5e/0x70
[  245.568415]  ? try_to_wake_up+0x263/0x610
[  245.568421]  schedule+0x5e/0xd0
[  245.568426]  schedule_preempt_disabled+0x15/0x30
[  245.568431]  __ww_mutex_lock.constprop.0+0x539/0x940
[  245.568439]  ttm_eu_reserve_buffers+0x1f4/0x2f0 [ttm
bea26c7978113683d7615187c2f4d33b4f3ad4a6]
[  245.568462]  xe_vm_lock+0xe3/0x110 [xe
35c5fcb454ded180c3570d3957d73eb524fe3f0d]
[  245.568653]  xe_lrc_finish+0x62/0x130 [xe
35c5fcb454ded180c3570d3957d73eb524fe3f0d]
[  245.568827]  xe_engine_fini+0x2f/0x90 [xe
35c5fcb454ded180c3570d3957d73eb524fe3f0d]
[  245.568989]  process_one_work+0x1c4/0x3d0
[  245.568996]  worker_thread+0x51/0x390
[  245.569012]  ? __pfx_worker_thread+0x10/0x10
[  245.569018]  kthread+0xdb/0x110
[  245.569022]  ? __pfx_kthread+0x10/0x10
[  245.569026]  ret_from_fork+0x29/0x50
[  245.569036]  </TASK>
[  245.569051] INFO: task kworker/14:3:488 blocked for more than 122 second=
s.
[  245.569963]       Tainted: P        W  OE
6.3.0-1-drm-xe-next-git-g48a7045a0879-dirty #6
[  245.570782] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[  245.571592] task:kworker/14:3    state:D stack:0     pid:488
ppid:2      flags:0x00004000
[  245.571599] Workqueue: events __guc_engine_fini_async [xe]
[  245.571768] Call Trace:
[  245.571769]  <TASK>
[  245.571772]  __schedule+0x443/0x1400
[  245.571777]  ? load_balance+0x18d/0xe20
[  245.571785]  schedule+0x5e/0xd0
[  245.571790]  schedule_preempt_disabled+0x15/0x30
[  245.571794]  __ww_mutex_lock.constprop.0+0x539/0x940
[  245.571802]  ttm_eu_reserve_buffers+0x1f4/0x2f0 [ttm
bea26c7978113683d7615187c2f4d33b4f3ad4a6]
[  245.571823]  xe_vm_lock+0xe3/0x110 [xe
35c5fcb454ded180c3570d3957d73eb524fe3f0d]
[  245.572012]  xe_lrc_finish+0x62/0x130 [xe
35c5fcb454ded180c3570d3957d73eb524fe3f0d]
[  245.572185]  xe_engine_fini+0x2f/0x90 [xe
35c5fcb454ded180c3570d3957d73eb524fe3f0d]
[  245.572378]  process_one_work+0x1c4/0x3d0
[  245.572385]  worker_thread+0x51/0x390
[  245.572391]  ? __pfx_worker_thread+0x10/0x10
[  245.572396]  kthread+0xdb/0x110
[  245.572400]  ? __pfx_kthread+0x10/0x10
[  245.572404]  ret_from_fork+0x29/0x50
[  245.572412]  </TASK>
[  245.572552] INFO: task kmscub:traceq0:8581 blocked for more than 122 sec=
onds.
[  245.573498]       Tainted: P        W  OE
6.3.0-1-drm-xe-next-git-g48a7045a0879-dirty #6
[  245.574336] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[  245.575151] task:kmscub:traceq0  state:D stack:0     pid:8581
ppid:8170   flags:0x00004002
[  245.575158] Call Trace:
[  245.575159]  <TASK>
[  245.575161]  __schedule+0x443/0x1400
[  245.575167]  ? asm_sysvec_call_function_single+0x1a/0x20
[  245.575174]  schedule+0x5e/0xd0
[  245.575179]  schedule_preempt_disabled+0x15/0x30
[  245.575183]  __ww_mutex_lock.constprop.0+0x539/0x940
[  245.575191]  ttm_eu_reserve_buffers+0x1f4/0x2f0 [ttm
bea26c7978113683d7615187c2f4d33b4f3ad4a6]
[  245.575212]  xe_bo_lock+0xaf/0xe0 [xe
35c5fcb454ded180c3570d3957d73eb524fe3f0d]
[  245.575373]  xe_gem_object_free+0xb4/0x100 [xe
35c5fcb454ded180c3570d3957d73eb524fe3f0d]
[  245.575532]  xe_vma_destroy_late+0xc4/0xf0 [xe
35c5fcb454ded180c3570d3957d73eb524fe3f0d]
[  245.575726]  xe_vm_close_and_put+0x191/0x490 [xe
35c5fcb454ded180c3570d3957d73eb524fe3f0d]
[  245.575913]  ? xa_find+0x92/0x100
[  245.575921]  xe_file_close+0x196/0x200 [xe
35c5fcb454ded180c3570d3957d73eb524fe3f0d]
[  245.576081]  drm_file_free+0x219/0x270
[  245.576088]  drm_release_noglobal+0x1f/0x70
[  245.576093]  __fput+0x86/0x250
[  245.576099]  task_work_run+0x5a/0x90
[  245.576104]  do_exit+0x342/0xaf0
[  245.576109]  ? __futex_unqueue+0x29/0x40
[  245.576115]  ? futex_unqueue+0x3c/0x60
[  245.576121]  do_group_exit+0x31/0x80
[  245.576125]  get_signal+0x9a5/0x9e0
[  245.576133]  arch_do_signal_or_restart+0x3e/0x270
[  245.576141]  exit_to_user_mode_prepare+0x185/0x1e0
[  245.576148]  syscall_exit_to_user_mode+0x1b/0x40
[  245.576155]  do_syscall_64+0x6c/0x90
[  245.576161]  ? exc_page_fault+0x7c/0x180
[  245.576166]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
[  245.576174] RIP: 0033:0x7f8956f44f0e
[  245.576179] RSP: 002b:00007f892b7fdcb0 EFLAGS: 00000246 ORIG_RAX:
00000000000000ca
[  245.576184] RAX: fffffffffffffe00 RBX: 0000000000000000 RCX: 00007f8956f=
44f0e
[  245.576187] RDX: 0000000000000000 RSI: 0000000000000189 RDI: 000055c8c22=
459c8
[  245.576190] RBP: 0000000000000000 R08: 0000000000000000 R09: 00000000fff=
fffff
[  245.576192] R10: 0000000000000000 R11: 0000000000000246 R12: 00000000000=
00000
[  245.576194] R13: 000055c8c2245978 R14: 0000000000000000 R15: 000055c8c22=
459c8
[  245.576201]  </TASK>
