Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CAEC77B7A
	for <intel-xe@archiver.kernel.org>; Tue, 23 May 2023 06:52:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9DBE10E3DA;
	Tue, 23 May 2023 06:52:58 +0000 (UTC)
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A2310E3DA
 for <intel-xe@lists.freedesktop.org>; Tue, 23 May 2023 06:52:56 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-6af78ce91b1so1458262a34.1
 for <intel-xe@lists.freedesktop.org>; Mon, 22 May 2023 23:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684824775; x=1687416775;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ap3qxmfIn4CE1BBCwSQWYJ+fFLrjccoDkDah8O5a39E=;
 b=M+apbuPt+hMLu4D76TW2xmSFWoRzTnELnCO/IYy6V2PdWkPXH+SgT7eA+MV92Ll6BA
 XE0t5Eh2UgMQToGF4XhL6KryIKojDkK+3CUFSNpq86aDsqAQ2FBUBZRx02fu3M4CA43A
 QI5GS6DwySl/kqiOzFroncYBLsFRl5ReGg7Wx8Wvdb5pa64MGrjkk6WUuk3JYTzsh5EE
 mwrtVOFbKQLHUu/GDvjaegsYZg/QxFlTdAi2MYKuSqXjlS+nRRV4iv1L4yN7UTtuA/Am
 duH2EIMUo3jiS+UJi7LlrrkPhDziRmysTd8qJclRl/Pr9GBlPUBXA8G3eFgqCddJLMrZ
 0dLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684824775; x=1687416775;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ap3qxmfIn4CE1BBCwSQWYJ+fFLrjccoDkDah8O5a39E=;
 b=XbngOKHggzBGJsdf0Yo3VH6QVRklHUYCWBUCsujYVhtirqQhMHwRziUhu2Rv8H3T6s
 0iq5AiRnpHNRAgKLwSj8jS1InhmJKwocXbT+M/49+J1uC30QefswuHhwrEFmRB3sJJ5V
 UrSEKURmOmMK/Q6Tjmljth4qnM/2nkzlOlnnxMsDpq8zHA+DH7M6Y1j5YZw1RdeGwGhC
 4u3TcMMJLqAz0En3MmUaRcWWAAu67Vz2z55wgMsezt1kGXpNn7HQ6yiFECj2ISzNhhDh
 5OCi6yKbCkprwMb/1qQX4yxEH1TfuZSdzBaYfFgPAHGx1QV20a3V4BdiSrAuFaTfolLF
 7X2A==
X-Gm-Message-State: AC+VfDzI+zHLRcSLgW3alzHQqiOwpJdambFvZWZAy/ydq1uEHkdg/qDo
 kMytrtXQuiwX4r/ge3YKJVzN0W5uhgbMBPJJ1Q7kll79WZA=
X-Google-Smtp-Source: ACHHUZ5PtXEPAOfAId22a5DtIgiaRsBK9St9ursE7US0WDgJfzFrsya18ins4ORICn3InGXCjpJ0USV4FVyYlYptnAI=
X-Received: by 2002:a05:6808:8f1:b0:398:2484:f783 with SMTP id
 d17-20020a05680808f100b003982484f783mr1483768oic.7.1684824774650; Mon, 22 May
 2023 23:52:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230523054404.4011148-1-matthew.brost@intel.com>
 <20230523054404.4011148-9-matthew.brost@intel.com>
 <CA+aRtua3TQh0kh6CaEA=oE1OPrSGXFBUJY2FwXp8MZ+EYasG8Q@mail.gmail.com>
In-Reply-To: <CA+aRtua3TQh0kh6CaEA=oE1OPrSGXFBUJY2FwXp8MZ+EYasG8Q@mail.gmail.com>
From: Christopher Snowhill <kode54@gmail.com>
Date: Mon, 22 May 2023 23:52:43 -0700
Message-ID: <CA+aRtuYm7G8F8JhDKQiuKVBKmkYahVGghee+5tDY4ht4pG3jfA@mail.gmail.com>
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

On Mon, May 22, 2023 at 11:38=E2=80=AFPM Christopher Snowhill <kode54@gmail=
.com> wrote:
>
> On Mon, May 22, 2023 at 10:44=E2=80=AFPM Matthew Brost <matthew.brost@int=
el.com> wrote:
> >
> > Use the TTM LRU bulk move for BOs tied to a VM. Update the bulk moves
> > LRU position on every exec.
> >
> > v2: Bulk move for compute VMs, remove bulk LRU in xe_gem_object_free
> >
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_bo.c       | 24 ++++++++++++++++++++----
> >  drivers/gpu/drm/xe/xe_bo.h       |  4 ++--
> >  drivers/gpu/drm/xe/xe_dma_buf.c  |  2 +-
> >  drivers/gpu/drm/xe/xe_exec.c     |  6 ++++++
> >  drivers/gpu/drm/xe/xe_vm.c       |  4 ++++
> >  drivers/gpu/drm/xe/xe_vm_types.h |  3 +++
> >  6 files changed, 36 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index c82e995df779..22cf65bd63fe 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -968,6 +968,16 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_ob=
ject *ttm_bo)
> >
> >  static void xe_gem_object_free(struct drm_gem_object *obj)
> >  {
> > +       struct xe_bo *bo =3D gem_to_xe_bo(obj);
> > +
> > +       if (bo->vm && !xe_vm_in_fault_mode(bo->vm) && xe_bo_is_user(bo)=
) {
> > +               struct ww_acquire_ctx ww;
> > +
> > +               xe_bo_lock(bo, &ww, 0, false);
> > +               ttm_bo_set_bulk_move(&bo->ttm, NULL);
> > +               xe_bo_unlock(bo, &ww);
> > +       }
> > +
> >         /* Our BO reference counting scheme works as follows:
> >          *
> >          * The gem object kref is typically used throughout the driver,
> > @@ -1081,8 +1091,8 @@ void xe_bo_free(struct xe_bo *bo)
> >
> >  struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo=
 *bo,
> >                                     struct xe_gt *gt, struct dma_resv *=
resv,
> > -                                   size_t size, enum ttm_bo_type type,
> > -                                   u32 flags)
> > +                                   struct ttm_lru_bulk_move *bulk, siz=
e_t size,
> > +                                   enum ttm_bo_type type, u32 flags)
> >  {
> >         struct ttm_operation_ctx ctx =3D {
> >                 .interruptible =3D true,
> > @@ -1149,7 +1159,10 @@ struct xe_bo *__xe_bo_create_locked(struct xe_de=
vice *xe, struct xe_bo *bo,
> >                 return ERR_PTR(err);
> >
> >         bo->created =3D true;
> > -       ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
> > +       if (bulk)
> > +               ttm_bo_set_bulk_move(&bo->ttm, bulk);
> > +       else
> > +               ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
> >
> >         return bo;
> >  }
> > @@ -1219,7 +1232,10 @@ xe_bo_create_locked_range(struct xe_device *xe,
> >                 }
> >         }
> >
> > -       bo =3D __xe_bo_create_locked(xe, bo, gt, vm ? &vm->resv : NULL,=
 size,
> > +       bo =3D __xe_bo_create_locked(xe, bo, gt, vm ? &vm->resv : NULL,
> > +                                  vm && !xe_vm_in_fault_mode(vm) &&
> > +                                  flags & XE_BO_CREATE_USER_BIT ?
> > +                                  &vm->lru_bulk_move : NULL, size,
> >                                    type, flags);
> >         if (IS_ERR(bo))
> >                 return bo;
> > diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> > index 7e111332c35a..f7562012b836 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.h
> > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > @@ -81,8 +81,8 @@ void xe_bo_free(struct xe_bo *bo);
> >
> >  struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo=
 *bo,
> >                                     struct xe_gt *gt, struct dma_resv *=
resv,
> > -                                   size_t size, enum ttm_bo_type type,
> > -                                   u32 flags);
> > +                                   struct ttm_lru_bulk_move *bulk, siz=
e_t size,
> > +                                   enum ttm_bo_type type, u32 flags);
> >  struct xe_bo *
> >  xe_bo_create_locked_range(struct xe_device *xe,
> >                           struct xe_gt *gt, struct xe_vm *vm,
> > diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dm=
a_buf.c
> > index 9b252cc782b7..975dee1f770f 100644
> > --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> > +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> > @@ -199,7 +199,7 @@ xe_dma_buf_init_obj(struct drm_device *dev, struct =
xe_bo *storage,
> >         int ret;
> >
> >         dma_resv_lock(resv, NULL);
> > -       bo =3D __xe_bo_create_locked(xe, storage, NULL, resv, dma_buf->=
size,
> > +       bo =3D __xe_bo_create_locked(xe, storage, NULL, resv, NULL, dma=
_buf->size,
> >                                    ttm_bo_type_sg, XE_BO_CREATE_SYSTEM_=
BIT);
> >         if (IS_ERR(bo)) {
> >                 ret =3D PTR_ERR(bo);
> > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.=
c
> > index ff4df00f20a2..b2dcf34af16b 100644
> > --- a/drivers/gpu/drm/xe/xe_exec.c
> > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > @@ -395,6 +395,12 @@ int xe_exec_ioctl(struct drm_device *dev, void *da=
ta, struct drm_file *file)
> >         xe_sched_job_push(job);
> >         xe_vm_reactivate_rebind(vm);
> >
> > +       if (!err && !xe_vm_no_dma_fences(vm)) {
> > +               spin_lock(&xe->ttm.lru_lock);
> > +               ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
> > +               spin_unlock(&xe->ttm.lru_lock);
> > +       }
> > +
> >  err_repin:
> >         if (!xe_vm_no_dma_fences(vm))
> >                 up_read(&vm->userptr.notifier_lock);
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 0398da1ef1e2..a5d65d0325d6 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -629,6 +629,10 @@ static void preempt_rebind_work_func(struct work_s=
truct *w)
> >
> >  #undef retry_required
> >
> > +       spin_lock(&vm->xe->ttm.lru_lock);
> > +       ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
> > +       spin_unlock(&vm->xe->ttm.lru_lock);
> > +
> >         /* Point of no return. */
> >         arm_preempt_fences(vm, &preempt_fences);
> >         resume_and_reinstall_preempt_fences(vm);
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_v=
m_types.h
> > index fada7896867f..d3e99f22510d 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -164,6 +164,9 @@ struct xe_vm {
> >         /** Protects @rebind_list and the page-table structures */
> >         struct dma_resv resv;
> >
> > +       /** @lru_bulk_move: Bulk LRU move list for this VM's BOs */
> > +       struct ttm_lru_bulk_move lru_bulk_move;
> > +
> >         u64 size;
> >         struct rb_root vmas;
> >
> > --
> > 2.34.1
>
> Something in this patch version, either moving the cleanup to
> gem_free, or the move_tail later in the patch set, causes kmscube to
> deadlock on terminate, forcing me to reboot the machine. Reboot got
> stuck when it tried to terminate my user session, so I had to press
> the reset button.

Verified, substituting patch 8 of 8 from v1 results in cleanly
terminating kmscube.
