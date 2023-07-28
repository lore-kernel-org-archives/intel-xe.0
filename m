Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14648C00528
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jul 2023 12:13:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CCE510E6F1;
	Fri, 28 Jul 2023 12:13:36 +0000 (UTC)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F395910E1FA
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jul 2023 12:13:33 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4fe0eb0ca75so3581770e87.2
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jul 2023 05:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690546412; x=1691151212;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RYI9AzCATMJ/ScjNAw8fbtgButFJQeQn68/6oVcpDig=;
 b=pMaSgPtPPCglGRdQCdK7DSepERp5nWKKtJEb+GNmkztdvH1pPsE5EPpDG3gZJcwYei
 aEZ5vMscXep91s0yGpZ6lrfQeUtnxsu7PM2xdi7cQEJWcyYdFqk8RWyxsrqvisubW7j7
 UBmiwhucspxQ9fX7dO3svhehtewGet9CNtKBT/phX0ixJPjH2pVR+2lLHs3GGNsrKxKM
 HZ9hgW4Fcboew2KbENUmcRMkrLvLxSCKN3hw/uXUWC98mpUWYSsmQaD7B9T46i7Dityx
 ay+5+ufl1pgHrbqN4cTjALb4n1HaLt1DKOv/eiXaf56GAdkD9nupd0zA2MVb1ElpBfUo
 tkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690546412; x=1691151212;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RYI9AzCATMJ/ScjNAw8fbtgButFJQeQn68/6oVcpDig=;
 b=UZxIxK2l5A9mwQyfnWlS+rNkcylHmfAsy/r8QW9xjK5/XmTPp4sj6uR0ORmnyQNEMm
 5BLJulco6Qyy40WnNpsco3eNjUm0DRhtOELApePNevDj5OTZLlDnjKPlb2dW3Ly3quLM
 /5utSUQNLGwmJzqFXwVOsIv0DGcpXJ4ZQTArsDRdtfiy7PNy+jDV67ucyE0cBqo5pRoX
 C0G3JuwLGKPZzQRrpc1vW09aByN+uZ/GhhrwjrHOu+kalsr+13RspLRfYdYl7RE0xvRC
 IAh5lH7C7UTj4ywVz2CvnkcoOdzusIZTOHCXZ2brd4RG6hsFo+3w+bS/4ElBSnw/Hrt5
 ES5A==
X-Gm-Message-State: ABy/qLY0Aq9I3umB8Fu7L310qiNWGOeptbLU9j9iwNli39XcwHdvbO3x
 SzUYkgbgbrFSkUJAjaKJWqEfUlzch8CLvpmwFeIiH1nIvfw=
X-Google-Smtp-Source: APBJJlHJhgD+fLOYmw7rWtl65hYP8rNj+N0oiaPhrMhBJXATYY9FV4B0Cy+C2Lr9nRHlkMfuBNcMjsyvQgL425YGULs=
X-Received: by 2002:a19:504e:0:b0:4fd:cfeb:4785 with SMTP id
 z14-20020a19504e000000b004fdcfeb4785mr1425525lfj.53.1690546411822; Fri, 28
 Jul 2023 05:13:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230727183423.538211-1-matthew.brost@intel.com>
In-Reply-To: <20230727183423.538211-1-matthew.brost@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 28 Jul 2023 13:13:04 +0100
Message-ID: <CAM0jSHOqXiks=o91pS=Wcr7ihyJVS74oWeegQR3BSWuThP4Rdw@mail.gmail.com>
To: Matthew Brost <matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-xe] [PATCH] drm/xe: Remove unnecessary memory barriers
 related to wait queue
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

On Thu, 27 Jul 2023 at 19:34, Matthew Brost <matthew.brost@intel.com> wrote:
>
> These not needed per the wait queue doc, remove them.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c     | 3 ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 9 +--------
>  2 files changed, 1 insertion(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index cb75db30800c..3f58902b6be3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -308,7 +308,6 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>         spin_unlock_irq(&ct->fast_lock);
>         mutex_unlock(&ct->lock);
>
> -       smp_mb();
>         wake_up_all(&ct->wq);
>         drm_dbg(&xe->drm, "GuC CT communication channel enabled\n");
>
> @@ -820,8 +819,6 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>         g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
>
>         g2h_fence->done = true;
> -       smp_mb();

Hmm, pretty sure we still need barriers such that done = 1 is seen to
happen after the stores for fail, error, hint, retry etc, and then ofc
a matching barrier on the reader side. The barriers in wake_up_all()
vs wait_event() won't ensure that. So something like:

parse_g2h_response():
/*
 * Pairs with guc_ct_send_recv().
 *
 * The ordering of g2h_fence.done vs wake_up_all() and
 * wait_event_timeout() is already handled by that api. However here we
 * also have the added dependency of ordering the g2h_fence.done after
 * the previous stores, like with g2h_fence.retry, g2h_fence.fail etc.
 * which we need to handle ourselves.
 */
smp_wmb();
WRITE_ONCE(g2h_fence->done, true);
wake_up_all(&ct->g2h_fence_wq);


guc_ct_send_recv():
ret = wait_event_timeout(ct->g2h_fence_wq, READ_ONCE(g2h_fence.done), HZ);
if (!ret) {
}

/* Pairs with parse_g2h_response(). */
smp_rmb();
if (READ_ONCE(g2h_fence.retry)) {
}

if (READ_ONCE(g2h_fence.fail)) {
}

But AFAICT there also seems to be scary lifetime issues in here. The
g2h_fence is allocated on the stack, and goes out of scope when
returning from guc_ct_send_recv(), however if the wait_event timedout
we don't know if parse_g2h_response() will still run before we remove
the fence from the xarray. I think we need to grab the ct->mutex to
serialize the operations. Also if we have to acquire ct->mutex anyway
it might be worth seeing if we can drop the scary shared memory access
outside locks stuff here.

> -
>         wake_up_all(&ct->g2h_fence_wq);
>
>         return 0;
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 6cb64a097297..d623cd9f6cc4 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -705,7 +705,6 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
>         int ret;
>
>         set_min_preemption_timeout(guc, e);
> -       smp_rmb();
>         ret = wait_event_timeout(guc->ct.wq, !engine_pending_enable(e) ||
>                                  guc_read_stopped(guc), HZ * 5);
>         if (!ret) {
> @@ -888,7 +887,6 @@ guc_engine_timedout_job(struct drm_sched_job *drm_job)
>                  * error) messages which can cause the schedule disable to get
>                  * lost. If this occurs, trigger a GT reset to recover.
>                  */
> -               smp_rmb();
>                 ret = wait_event_timeout(guc->ct.wq,
>                                          !engine_pending_disable(e) ||
>                                          guc_read_stopped(guc), HZ * 5);
> @@ -1008,7 +1006,6 @@ static void suspend_fence_signal(struct xe_engine *e)
>         XE_BUG_ON(!e->guc->suspend_pending);
>
>         e->guc->suspend_pending = false;

Probably a good idea to use WRITE_ONCE/READ_ONCE. Even if it is not
strictly needed from the compiler pov, it at the very least documents
that we are accessing shared memory outside of proper locking.




> -       smp_wmb();
>         wake_up(&e->guc->suspend_wait);
>  }
>
> @@ -1392,7 +1389,6 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc)
>          * and releasing any TDRs waiting on guc->submission_state.stopped.
>          */
>         ret = atomic_fetch_or(1, &guc->submission_state.stopped);
> -       smp_wmb();
>         wake_up_all(&guc->ct.wq);
>
>         return ret;
> @@ -1521,17 +1517,14 @@ int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>         if (engine_pending_enable(e)) {
>                 e->guc->resume_time = ktime_get();
>                 clear_engine_pending_enable(e);
> -               smp_wmb();
>                 wake_up_all(&guc->ct.wq);
>         } else {
>                 clear_engine_pending_disable(e);
>                 if (e->guc->suspend_pending) {
>                         suspend_fence_signal(e);
>                 } else {
> -                       if (engine_banned(e)) {
> -                               smp_wmb();
> +                       if (engine_banned(e))
>                                 wake_up_all(&guc->ct.wq);
> -                       }
>                         deregister_engine(guc, e);
>                 }
>         }
> --
> 2.34.1
>
