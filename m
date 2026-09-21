Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B8AC982ED
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 18:06:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A53710E3E0;
	Mon, 21 Sep 2026 18:06:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D3LeC+IT";
	dkim-atps=neutral
Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com
 [74.125.224.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56FB110E3DE
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 18:06:44 +0000 (UTC)
Received: by mail-yx2-f12.google.com with SMTP id
 956f58d0204a3-66e50968489so3071716d50.0
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 11:06:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790014003; cv=none;
 d=google.com; s=arc-20260327;
 b=WGTNi1mfidWb3vV6WF3uAVXnofPMAxwe8jS0amY7crbz3MS0K0JV3vxRXTFwofeQur
 ozGM+kk2AvC6pTWrQTdpQF3wyUC5rVge2iThtJBTS6pWAaJoYrp3L57Hjira5XZSnXiW
 nvTvGl32wxEQDxOIuItVJHsWdCwewpysEdSmuiQXJ5A4SQLd9TdlXqnKjP0b5TLOnEjB
 5LMYTwIlC+WJ4PTi8+XNI6M/yn+n/v7ZJuFuIy+kDSGTq/gWfD+w8S1d5WjB8UBFbbGW
 c0W8qAFSuZiRTSYvgx8u/RSEYGR/BuX4upY7dmXznEObgy8QV8KHPsQJ6EWfsDZTHvwO
 EDjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=sJ0h1jdEQlFqYQBAS/+8z8pXil8LZGs34IzYcXcWRMU=;
 fh=/oe6XVzzJWJTH1XBcpaK4Yrtk3Moj7rEq3xAprf0tR0=;
 b=U1Gr34rD2HPDaZ61E63nTjCuCVVPZqyeSm2nqh9sVDhpHLLCo19n6s2GqjQUhd+3HV
 lbOMVIVdeiyFpM2eaNdAgvaqbgyHfvwgFBsLHEpxn96rD5iGWL81h8u6DGCVKBO1zqhT
 l6tsGYB1HTIrykhU0mGR0l7UYrBStZzWNMnBTlVf9lPpwlg+ETam/iHQ1fHmwLLk2zod
 i1Fl3dlug9CYY5SGG3AaEQstCt+lzFYruoCpgu2H+tQpCDZZQVqB5NPvscag3N1UZ55V
 Fyn2kdApvm9C9eP1E1XOZ44oRc86jngW+Dt/3Qo/vf6R6sI0oo/0jQPYwv9iciyHM5Xq
 bxjw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790014003; x=1790618803; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=sJ0h1jdEQlFqYQBAS/+8z8pXil8LZGs34IzYcXcWRMU=;
 b=D3LeC+ITXdBccZaJOIELIXE/RNkKxeTA/cgXdUX6OKkVTr+ycU8rIS6DtOxiTJeihU
 t2NX0xWXEfhGCbKMOd8N/sdfZQND9j/t0ucuhcUf0REeR8l7+Zgvn9Jh84fLhnf9g90v
 81rDKyCiYiK0zc4riYfAkk8M31WarQI8FedwAaLL4pb27e9fmsRqfnMoeydT0qXL2pR9
 iiA2B6xO5Aeb6BHwvcoM97lTGsdSEz6mpmfJNbn7kd+HHWTMS1O/Oj4z/yd6LxDSCQjI
 wrw4qiGLcA4sNR8nk+hyrWpekhtLV0ibUg8RIV8pyDTNC0M/p5MM9qzL7vbeUDLc0xrZ
 UDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790014003; x=1790618803;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=sJ0h1jdEQlFqYQBAS/+8z8pXil8LZGs34IzYcXcWRMU=;
 b=HrehoACIiA3ckzc6GP6WDLdG6DfBoLRQbE9ZVHwQ2O5ongMIrsPF/Rmz1F22pr6oKU
 LO6sJ9OpuP3QYktVHRKncackKR3WKHT70Blp7uvHkmAgzKm4Gyn/zwZPdZQroo9/qYeZ
 VARZOvgqfLG2DgLwGGxjMdWJON4X4tlJOvgyOm/dmq/vOZEc6Z+AB5cgYMi1pP5e85uo
 1N+If7DHqlMwz6FpLuqskl/2WL2JHsNisFbDAb4JCydn5/rqIbT8nArcLWsp0LA3dUpy
 cEY66rhNumW0RG6modWEBqDcR+VC9mcXHZnGtIiYi9kr/UMnrPh11L9PeLykbVYBCyvw
 6DNA==
X-Gm-Message-State: AFuF++ksRhXls/4FoGEM5rC5NXgMU+Llue8xc3SRl6WehmMSNEl9wcKm
 QWg8UESUhDKkhBs0soectnbpfB6btEBMHJx3vQx2IU9C3yZvMAX/YjENRaXl7L/QTXPfQVoeOOi
 aicXtUnz6xXgD4bvu/xWWcerf8/SZ+wM=
X-Gm-Gg: AYBFou1r+swseH2Mk79ReyAcjdKKcCC/ke6fWfaWyTW0uYxSh+QKpTycFqGcGsDbm+5
 OOEAAonP7zDLGUBCoiuh5b/67wCd209PiO94PZyXNbzv+EvssmAnZPT/EP9PINXDvWozRc9rpwx
 +bE+j7OSIkv+aamTGBTqVCBbsXuqlLXqfrSiCN+ZXyWlfyfsNbCoy/SfNV/uGN5Kmv47gqMVHcr
 rlPsvX+qmXlyh2KqCM8729rAmkRm3AMunKcrR2Tg9JFx30+9/J9QmQeZSIs2fI/oS0OGMQKx/5e
 WxvLaCNsmVXTStgxtukGciOfMTdgD1UCHcTz+V4NYXLxbJ1i/kMKYmoAeICgB/t3FmCb2oXFoUb
 VK2267fbjvIjRjXRWr0cbswwZZJrTnwR4RU0TBgKbEg==
X-Received: by 2002:a05:690e:c45:b0:671:70d2:5284 with SMTP id
 956f58d0204a3-6717fd9c671mr4252567d50.71.1790014002927; Mon, 21 Sep 2026
 11:06:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260917163553.1742580-1-talesam@gmail.com>
 <20260917163553.1742580-2-talesam@gmail.com>
 <aq20tufDkY17Ed3p@gsse-cloud1.jf.intel.com>
In-Reply-To: <aq20tufDkY17Ed3p@gsse-cloud1.jf.intel.com>
From: =?UTF-8?B?VGFsZXMgQS4gTWVuZG9uw6dh?= <talesam@gmail.com>
Date: Mon, 21 Sep 2026 15:06:32 -0300
X-Gm-Features: AcwNN1UuaONuTLZpEyHfH31skpvYtZ3ayazk_VR6W6hDqMnVreaDucxu6xgJ5E0
Message-ID: <CAHBRX4EdA4NvC_mMYnMuSTmaHqBx+YKgyjM6YM+6BntuEnjp3A@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] drm/xe: Capture devcoredump on TLB invalidation
 timeout
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, daniele.ceraolospurio@intel.com, 
 stuart.summers@intel.com, julia.filipchuk@intel.com, 
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com, 
 jani.nikula@intel.com, navonjohnlukose@gmail.com, 
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Sep 18, 2026 at 03:02:00PM -0700, Matthew Brost wrote:
> With your v5 fix Sashiko pointed out:
>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Thanks. That fix is in: seqno_recv is now sampled inside pending_lock in
xe_tlb_inval_fence_timeout() and passed to xe_devcoredump_gt() by value,
so the capture itself - which takes sleeping locks - still runs outside
the lock. v5 goes out this week carrying your tag on this patch.

Tales

Em sex., 18 de set. de 2026 =C3=A0s 19:02, Matthew Brost
<matthew.brost@intel.com> escreveu:
>
> On Thu, Sep 17, 2026 at 01:35:51PM -0300, Tales A. Mendon=C3=A7a wrote:
> > TLB invalidation timeouts currently leave no record of the firmware
> > state behind: there is no exec queue or job to blame, so nothing calls
> > xe_devcoredump() and the GuC log content at the time of the hang is
> > lost.
> >
> > Add xe_devcoredump_gt(), a variant of xe_devcoredump() for hangs that
> > are not tied to an exec queue or job. It captures the GuC log and CT
> > state of the affected GT, reusing the existing snapshot machinery and
> > the "only first snapshot" policy, and hook it up to the TLB invalidatio=
n
> > timeout path.
> >
> > This was instrumental in diagnosing GuC TLB invalidation ack stalls on
> > ARL (see Link), where the invalidation request is consumed from the H2G
> > CTB immediately but the ack G2H only arrives ~2.3s later, after the
> > timeout has already fired.
> >
> > Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8678
> > Signed-off-by: Tales A. Mendon=C3=A7a <talesam@gmail.com>
>
> With your v5 fix Sashiko pointed out:
>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>
> > ---
> >  drivers/gpu/drm/xe/xe_devcoredump.c | 46 ++++++++++++++++-------------
> >  drivers/gpu/drm/xe/xe_devcoredump.h | 15 +++++++---
> >  drivers/gpu/drm/xe/xe_tlb_inval.c   | 20 +++++++++++++
> >  3 files changed, 56 insertions(+), 25 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/x=
e_devcoredump.c
> > index 5f2b90b18f9..6bee8933f95 100644
> > --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> > +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> > @@ -74,11 +74,6 @@ static struct xe_device *coredump_to_xe(const struct=
 xe_devcoredump *coredump)
> >       return container_of(coredump, struct xe_device, devcoredump);
> >  }
> >
> > -static struct xe_guc *exec_queue_to_guc(struct xe_exec_queue *q)
> > -{
> > -     return &q->gt->uc.guc;
> > -}
> > -
> >  static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
> >                                    ssize_t start,
> >                                    struct xe_devcoredump *coredump)
> > @@ -323,40 +318,44 @@ static void xe_devcoredump_deferred_snap_work(str=
uct work_struct *work)
> >  }
> >
> >  static void devcoredump_snapshot(struct xe_devcoredump *coredump,
> > +                              struct xe_gt *gt,
> >                                struct xe_exec_queue *q,
> >                                struct xe_sched_job *job)
> >  {
> >       struct xe_devcoredump_snapshot *ss =3D &coredump->snapshot;
> > -     struct xe_guc *guc =3D exec_queue_to_guc(q);
> > +     struct xe_guc *guc =3D &gt->uc.guc;
> >       const char *process_name =3D "no process";
> >       bool cookie;
> >
> >       ss->snapshot_time =3D ktime_get_real();
> >       ss->boot_time =3D ktime_get_boottime();
> >
> > -     if (q->vm && q->vm->xef) {
> > +     if (q && q->vm && q->vm->xef) {
> >               process_name =3D q->vm->xef->process_name;
> >               ss->pid =3D q->vm->xef->pid;
> >       }
> >
> >       strscpy(ss->process_name, process_name);
> >
> > -     ss->gt =3D q->gt;
> > +     ss->gt =3D gt;
> >       INIT_WORK(&ss->work, xe_devcoredump_deferred_snap_work);
> >
> >       /* keep going if fw fails as we still want to save the memory and=
 SW data */
> > -     CLASS(xe_force_wake, fw_ref)(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
> > +     CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> >
> >       cookie =3D dma_fence_begin_signalling();
> >
> >       ss->guc.log =3D xe_guc_log_snapshot_capture(&guc->log, true);
> >       ss->guc.ct =3D xe_guc_ct_snapshot_capture(&guc->ct);
> > -     ss->ge =3D xe_guc_exec_queue_snapshot_capture(q);
> > -     if (job)
> > -             ss->job =3D xe_sched_job_snapshot_capture(job);
> > -     ss->vm =3D xe_vm_snapshot_capture(q->vm);
> >
> > -     xe_engine_snapshot_capture_for_queue(q);
> > +     if (q) {
> > +             ss->ge =3D xe_guc_exec_queue_snapshot_capture(q);
> > +             if (job)
> > +                     ss->job =3D xe_sched_job_snapshot_capture(job);
> > +             ss->vm =3D xe_vm_snapshot_capture(q->vm);
> > +
> > +             xe_engine_snapshot_capture_for_queue(q);
> > +     }
> >
> >       queue_work(system_dfl_wq, &ss->work);
> >
> > @@ -364,19 +363,24 @@ static void devcoredump_snapshot(struct xe_devcor=
edump *coredump,
> >  }
> >
> >  /**
> > - * xe_devcoredump - Take the required snapshots and initialize coredum=
p device.
> > - * @q: The faulty xe_exec_queue, where the issue was detected.
> > - * @job: The faulty xe_sched_job, where the issue was detected.
> > + * __xe_devcoredump - Take the required snapshots and initialize cored=
ump device.
> > + * @gt: The GT where the issue was detected.
> > + * @q: The faulty xe_exec_queue, where the issue was detected, may be =
NULL for
> > + *     hangs that are not tied to an exec queue (e.g. TLB invalidation
> > + *     timeouts); in that case only the GT-level state (GuC log and CT=
 state)
> > + *     is captured.
> > + * @job: The faulty xe_sched_job, where the issue was detected, may be=
 NULL.
> >   * @fmt: Printf format + args to describe the reason for the core dump
> >   *
> >   * This function should be called at the crash time within the seriali=
zed
> >   * gt_reset. It is skipped if we still have the core dump device avail=
able
> >   * with the information of the 'first' snapshot.
> >   */
> > -__printf(3, 4)
> > -void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job,=
 const char *fmt, ...)
> > +__printf(4, 5)
> > +void __xe_devcoredump(struct xe_gt *gt, struct xe_exec_queue *q,
> > +                   struct xe_sched_job *job, const char *fmt, ...)
> >  {
> > -     struct xe_device *xe =3D gt_to_xe(q->gt);
> > +     struct xe_device *xe =3D gt_to_xe(gt);
> >       struct xe_devcoredump *coredump =3D &xe->devcoredump;
> >       va_list varg;
> >
> > @@ -394,7 +398,7 @@ void xe_devcoredump(struct xe_exec_queue *q, struct=
 xe_sched_job *job, const cha
> >       coredump->snapshot.reason =3D kvasprintf(GFP_ATOMIC, fmt, varg);
> >       va_end(varg);
> >
> > -     devcoredump_snapshot(coredump, q, job);
> > +     devcoredump_snapshot(coredump, gt, q, job);
> >
> >       drm_info(&xe->drm, "Xe device coredump has been created\n");
> >       drm_info(&xe->drm, "Check your /sys/class/drm/card%d/device/devco=
redump/data\n",
> > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.h b/drivers/gpu/drm/xe/x=
e_devcoredump.h
> > index 5391a80a4d1..bc4800b3a3f 100644
> > --- a/drivers/gpu/drm/xe/xe_devcoredump.h
> > +++ b/drivers/gpu/drm/xe/xe_devcoredump.h
> > @@ -11,15 +11,17 @@
> >  struct drm_printer;
> >  struct xe_device;
> >  struct xe_exec_queue;
> > +struct xe_gt;
> >  struct xe_sched_job;
> >
> >  #ifdef CONFIG_DEV_COREDUMP
> > -void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job,=
 const char *fmt, ...);
> > +void __xe_devcoredump(struct xe_gt *gt, struct xe_exec_queue *q,
> > +                   struct xe_sched_job *job, const char *fmt, ...);
> >  int xe_devcoredump_init(struct xe_device *xe);
> >  #else
> > -static inline void xe_devcoredump(struct xe_exec_queue *q,
> > -                               struct xe_sched_job *job,
> > -                               const char *fmt, ...)
> > +static inline void __xe_devcoredump(struct xe_gt *gt, struct xe_exec_q=
ueue *q,
> > +                                 struct xe_sched_job *job,
> > +                                 const char *fmt, ...)
> >  {
> >  }
> >
> > @@ -29,6 +31,11 @@ static inline int xe_devcoredump_init(struct xe_devi=
ce *xe)
> >  }
> >  #endif
> >
> > +#define xe_devcoredump(_q, _job, _fmt, ...) \
> > +     __xe_devcoredump((_q)->gt, _q, _job, _fmt, ##__VA_ARGS__)
> > +#define xe_devcoredump_gt(_gt, _fmt, ...) \
> > +     __xe_devcoredump(_gt, NULL, NULL, _fmt, ##__VA_ARGS__)
> > +
> >  void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix, =
char suffix,
> >                          const void *blob, size_t offset, size_t size);
> >
> > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_=
tlb_inval.c
> > index 7c3bf32d925..7a0c04fac60 100644
> > --- a/drivers/gpu/drm/xe/xe_tlb_inval.c
> > +++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
> > @@ -5,6 +5,7 @@
> >
> >  #include <drm/drm_managed.h>
> >
> > +#include "xe_devcoredump.h"
> >  #include "xe_device_types.h"
> >  #include "xe_force_wake.h"
> >  #include "xe_gt_stats.h"
> > @@ -29,6 +30,12 @@
> >
> >  #define FENCE_STACK_BIT              DMA_FENCE_FLAG_USER_BITS
> >
> > +/* The frontend is only ever embedded in a GT */
> > +static struct xe_gt *tlb_inval_to_gt(struct xe_tlb_inval *tlb_inval)
> > +{
> > +     return container_of(tlb_inval, struct xe_gt, tlb_inval);
> > +}
> > +
> >  static void xe_tlb_inval_fence_fini(struct xe_tlb_inval_fence *fence)
> >  {
> >       if (WARN_ON_ONCE(!fence->tlb_inval))
> > @@ -73,6 +80,7 @@ static void xe_tlb_inval_fence_timeout(struct work_st=
ruct *work)
> >       struct xe_device *xe =3D tlb_inval->xe;
> >       struct xe_tlb_inval_fence *fence, *next;
> >       long timeout_delay =3D tlb_inval->ops->timeout_delay(tlb_inval);
> > +     int timedout_seqno =3D 0;
> >
> >       tlb_inval->ops->flush(tlb_inval);
> >
> > @@ -90,6 +98,8 @@ static void xe_tlb_inval_fence_timeout(struct work_st=
ruct *work)
> >                       "TLB invalidation fence timeout, seqno=3D%d recv=
=3D%d",
> >                       fence->seqno, tlb_inval->seqno_recv);
> >
> > +             timedout_seqno =3D fence->seqno;
> > +
> >               fence->base.error =3D -ETIME;
> >               xe_tlb_inval_fence_signal(fence);
> >       }
> > @@ -97,6 +107,16 @@ static void xe_tlb_inval_fence_timeout(struct work_=
struct *work)
> >               queue_delayed_work(tlb_inval->timeout_wq, &tlb_inval->fen=
ce_tdr,
> >                                  timeout_delay);
> >       spin_unlock_irq(&tlb_inval->pending_lock);
> > +
> > +     /*
> > +      * Capture the GuC log and CT state so the firmware side of the h=
ang
> > +      * can be inspected; there is no queue or job to blame here. Must=
 be
> > +      * outside pending_lock as the capture takes sleeping locks.
> > +      */
> > +     if (timedout_seqno)
> > +             xe_devcoredump_gt(tlb_inval_to_gt(tlb_inval),
> > +                               "TLB invalidation fence timeout, seqno=
=3D%d recv=3D%d",
> > +                               timedout_seqno, tlb_inval->seqno_recv);
> >  }
> >
> >  /**
> > --
> > 2.55.0
> >



--=20
Com os cumprimentos,

Tales A. Mendon=C3=A7a
talesam.org
communitybig.org
