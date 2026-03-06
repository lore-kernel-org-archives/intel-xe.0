Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 752F4F513F7
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 05:13:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 376EC10E144;
	Fri,  6 Mar 2026 05:13:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nbQYGjds";
	dkim-atps=neutral
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com
 [74.125.224.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D205C10E144
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Mar 2026 05:13:56 +0000 (UTC)
Received: by mail-yx1-f53.google.com with SMTP id
 956f58d0204a3-64ca6595c8aso8630777d50.0
 for <intel-xe@lists.freedesktop.org>; Thu, 05 Mar 2026 21:13:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772774035; cv=none;
 d=google.com; s=arc-20240605;
 b=RhxVgXecEEbirhxTzpP4WoIhRb59eBlCDWN226BAHVDFB5CYMi1Arv8aWaScSEr1JT
 kpQc8a7XxMxfv0lDCwl4ef7lf89kA/EcQ8uQ7W0vNZPk7vdLIWxbYIq8eP1AqjF7MVBJ
 LewvczJ93tFvGVBWBnz6ocoWsQJSsZeRweb/03zMAgmMRMewRBi87fFKOWUQ9hS7dsE7
 GZGYz7QTsX3q15jzmFJ403T3m4aWeJDaMTX3eTmjvdOkPDqYqJ8vEZS+jXqxRjahUEvA
 m9g+EOwTylXzvjJgIcENb8BplleyKsx8vNL35KsntIqbZJRM85kn5ZLSShItLcFBGdSl
 HH6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Aeg81OAdBIECWrvoahs6hoKf8VftrdXMvcYbwTs9CXg=;
 fh=C47EgP1DR6w7lbU4jZY1olHD7tM2NzqFoNKjQQEpCUE=;
 b=Cwaf2REch8fOQE6MXb300XbFlRUcyhbLiTfTPrd8erFmzDHYeybJGQ242uUhAgwQc/
 v2gC8Q7is3dzxq85Tow2wk79DlmJjRAWJxza3M5pXn7o53mOJt1wDF9YjNnwOUGp/Yqk
 xAU3MIvc2fdN2RU4dlqiWl5k7Z+XoZAKeixpt/5YKB8LLOXVzFErgZXVik++3+/NMyyB
 vx++nhcmrCoNcpQtVeSQ/L+OeVgZ/NJGEBY+rF1T7hWTLlft4FdoXrHieXZ4OvIBb5K9
 L5HaGrIi4Y6vrtRWAXosIV2BMhrRvd/YTiJueKF6M3XuC8R/EKMUFAwFx2ue/OTgfoCO
 YlFw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772774035; x=1773378835; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Aeg81OAdBIECWrvoahs6hoKf8VftrdXMvcYbwTs9CXg=;
 b=nbQYGjdswfFPa0IMfXao+5iitlVC102xs4elWdF/P6qdRMJpNgAy7HWNj8+6aR+7Km
 QSzU1AbS2xiuKs3LvS/KED19a4yqsqe0NiMUmXEWh5Ma6s1TIzXtRXWc7uz20VjftmiV
 Ibk4hM86lxotHvyCc/xfKJAVq4KxxQg/qlK3QexwjfxLiMqb9soQCgl9QPPRaqaQ5hcQ
 GvkFXonVBV2+hhqc0V1/M/EnKtPrAywYXQLLxox4sCvu57x/MfcKK/od5+NP4EmQlXFj
 LHHR2FpGIbvbwEaOYYWvrFi5wg9rffhdZdWN6kKQcgrGfSflgX9FrpHCVJYGII2qGcqk
 to4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772774035; x=1773378835;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Aeg81OAdBIECWrvoahs6hoKf8VftrdXMvcYbwTs9CXg=;
 b=SNKrMoOqKpYnAldUP/yNuDyxePEj+mDxRxpmcSs7ECHiFQUf0PX6KfUwQyTvcQznw6
 WSBrhcSro+6FxqZV68j5rnqKDHGX2WumEi/eiJOix3lE5IlTeZIzHkUtaMh1FXFcFHWN
 2Q/eIuJuC96x4mY52wxo5n7ILM+06azL+qS5ojPEVlzB25qf4jL6LDMVpHjdd0U9fhx2
 al6Rr9i+f9PBNx9O+eSs/CbLbturU2StUVNv15UlNebluxPY9hh7tNY0edBzwzPYiuLN
 LtFQJkJRQKFAFD9Bd38vwIEEbsNHyJW9vEecZ54gK4QL+6Fu0YOA7W66SU9hWv3uumnu
 4vvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+/C0d7lEXgalznyrd25pPXsItvIUUtk6kFjpoaXktG0OZDlUPJwPjwIlHnR4xWU3VFc1LkOULWA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzF5LP2Bse2SNQgHP14suFUsPmapOLa3Z2BK4Gmer+mfliXOaV6
 DP3LhioOt1kBUFV5ekKwpeAKD9j4/ws3mW/Iiy7VOq9i8UygZHeigxOSOLgbEZ94iJaxugecM+G
 pWu7H8Fps14veTa9aBy5FKU1smE9dWkw=
X-Gm-Gg: ATEYQzxE9BKqxvAwjzaHosD8KS/teiv53eSCUFWxWpzrAAyaM2QFjFh6aUfyfxjCKMF
 T67bqophbi/U68nswwtYEgUNBN6Icc6v45i4UFXdLVNtRhTmJsTEbjvD3ZYWtANcZP+AOexVM/S
 dwTem1/gr8g29IN6brjZB3onwQXtyJqVXT9nzxkJd+8KMyu9b+uVuS89YF1A/CmUArodR9L+3Sl
 5qNun6LP+LvAVeuHWQdwy1boj36QRDvdzwZ/l84qlBbrB8maeSeExfGAQEc4kJ8ItOSJQeKHm8T
 HVl2bZewyjxGdr79o6E2UJW7N2s4ma3y/0mgC3FKeO402Zu3r+NMyNv60p3kK/bxPQvjKLr7
X-Received: by 2002:a53:e194:0:b0:64a:d6eb:6e with SMTP id
 956f58d0204a3-64d1436ec4fmr661372d50.80.1772774035461; 
 Thu, 05 Mar 2026 21:13:55 -0800 (PST)
MIME-Version: 1.0
References: <CAPaKu7RbCtkz1BbX57+CebB2uepyCAi-3QzBy8BDGngCJ-Du0w@mail.gmail.com>
 <aajkqXZDGUFPlq1o@lstrano-desk.jf.intel.com> <20260305092711.20069ca1@fedora>
 <aalWTOZSNYcKpvdd@lstrano-desk.jf.intel.com> <20260305115201.6fb044f0@fedora>
 <aans5SMXDbwhpqY8@lstrano-desk.jf.intel.com>
In-Reply-To: <aans5SMXDbwhpqY8@lstrano-desk.jf.intel.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 5 Mar 2026 21:13:44 -0800
X-Gm-Features: AaiRm50Ava_52GoNBjmjZmWYjMucAtvsQvpabz93ob-KeH2kqNS05-Ap8VySKB0
Message-ID: <CAPaKu7SXsCv=G+O38unCsdrUNeeOmbopRdBpjqP+Qxp+EP9JtA@mail.gmail.com>
Subject: Re: drm_sched run_job and scheduling latency
To: Matthew Brost <matthew.brost@intel.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
 ML dri-devel <dri-devel@lists.freedesktop.org>, intel-xe@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, open list <linux-kernel@vger.kernel.org>,
 tj@kernel.org
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

On Thu, Mar 5, 2026 at 12:52=E2=80=AFPM Matthew Brost <matthew.brost@intel.=
com> wrote:
>
> On Thu, Mar 05, 2026 at 11:52:01AM +0100, Boris Brezillon wrote:
> > On Thu, 5 Mar 2026 02:09:16 -0800
> > Matthew Brost <matthew.brost@intel.com> wrote:
> >
> > > On Thu, Mar 05, 2026 at 09:27:11AM +0100, Boris Brezillon wrote:
> > >
> > > I addressed most of your comments in a chained reply to Phillip, but =
I
> > > guess he dropped some of your email and thus missed those. Responding
> > > below.
> > >
> > > > Hi Matthew,
> > > >
> > > > On Wed, 4 Mar 2026 18:04:25 -0800
> > > > Matthew Brost <matthew.brost@intel.com> wrote:
> > > >
> > > > > On Wed, Mar 04, 2026 at 02:51:39PM -0800, Chia-I Wu wrote:
> > > > > > Hi,
> > > > > >
> > > > > > Our system compositor (surfaceflinger on android) submits gpu j=
obs
> > > > > > from a SCHED_FIFO thread to an RT gpu queue. However, because
> > > > > > workqueue threads are SCHED_NORMAL, the scheduling latency from=
 submit
> > > > > > to run_job can sometimes cause frame misses. We are seeing this=
 on
> > > > > > panthor and xe, but the issue should be common to all drm_sched=
 users.
> > > > > >
> > > > >
> > > > > I'm going to assume that since this is a compositor, you do not p=
ass
> > > > > input dependencies to the page-flip job. Is that correct?
> > > > >
> > > > > If so, I believe we could fairly easily build an opt-in DRM sched=
 path
> > > > > that directly calls run_job in the exec IOCTL context (I assume t=
his is
> > > > > SCHED_FIFO) if the job has no dependencies.
> > > >
> > > > I guess by ::run_job() you mean something slightly more involved th=
at
> > > > checks if:
> > > >
> > > > - other jobs are pending
> > > > - enough credits (AKA ringbuf space) is available
> > > > - and probably other stuff I forgot about
> > > >
> > > > >
> > > > > This would likely break some of Xe=E2=80=99s submission-backend a=
ssumptions
> > > > > around mutual exclusion and ordering based on the workqueue, but =
that
> > > > > seems workable. I don=E2=80=99t know how the Panthor code is stru=
ctured or
> > > > > whether they have similar issues.
> > > >
> > > > Honestly, I'm not thrilled by this fast-path/call-run_job-directly =
idea
> > > > you're describing. There's just so many things we can forget that w=
ould
> > > > lead to races/ordering issues that will end up being hard to trigge=
r and
> > > > debug. Besides, it doesn't solve the problem where your gfx pipelin=
e is
> > > > fully stuffed and the kernel has to dequeue things asynchronously. =
I do
> > > > believe we want RT-prio support in that case too.
> > > >
> > >
> > > My understanding of SurfaceFlinger is that it never waits on input
> > > dependencies from rendering applications, since those may not signal =
in
> > > time for a page flip. Because of that, you can=E2=80=99t have the job=
(s) that
> > > draw to the screen accept input dependencies. Maybe I have that
> > > wrong=E2=80=94but I've spoken to the Google team several times about =
issues with
> > > SurfaceFlinger, and that was my takeaway.
> > >
> > > So I don't think the kernel should ever have to dequeue things
> > > asynchronously, at least for SurfaceFlinger.
> >
> > There's still the contention coming from the ring buffer size, which ca=
n
> > prevent jobs from being queued directly to the HW, though, admittedly,
> > if the HW is not capable of compositing the frame faster than the
> > refresh rate, and guarantee an almost always empty ringbuffer, fixing
> > the scheduling prio is probably pointless.
> >
> > > If there is another RT use
> > > case that requires input dependencies plus the kernel dequeuing thing=
s
> > > asynchronously, I agree this wouldn=E2=80=99t help=E2=80=94but my sug=
gestion also isn=E2=80=99t
> > > mutually exclusive with other RT rework either.
> >
> > Yeah, dunno. It just feels like another hack on top of the already quit=
e
> > convoluted design that drm_sched has become.
> >
>
> I agree we wouldn't want this to become some wild hack.
>
> I could actually see this helping in other very timing-sensitive
> paths=E2=80=94for example, page-fault paths where a copy job needs to be =
issued
> as part of the fault resolution to a dedicated kernel queue. I=E2=80=99ve=
 seen
> noise in fault profiling caused by delays in the scheduler workqueue,
> which needs to program the job to the device. In paths like this, every
> microsecond matters, as even minor improvements have real-world impacts
> on performance numbers. This will become even more noticeable as
> CPU<->GPU bus speeds increase. In this case, typically copy jobs have
> no input dependencies, thus the desire is to program the ring as quickly
> as possible.
>
> > >
> > > > >
> > > > > I can try to hack together a quick PoC to see what this would loo=
k like
> > > > > and give you something to test.
> > > > >
> > > > > > Using a WQ_HIGHPRI workqueue helps, but it is still not RT (and=
 won't
> > > > > > meet future android requirements). It seems either workqueue ne=
eds to
> > > > > > gain RT support, or drm_sched needs to support kthread_worker.
> > > > >
> > > > > +Tejun to see if RT workqueue is in the plans.
> > > >
> > > > Dunno how feasible that is, but that would be my preferred option.
> > > >
> > > > >
> > > > > >
> > > > > > I know drm_sched switched from kthread_worker to workqueue for =
better
> > > > > > scaling when xe was introduced. But if drm_sched can support ei=
ther
> > > > > > workqueue or kthread_worker during drm_sched_init, drivers can
> > > > > > selectively use kthread_worker only for RT gpu queues. And beca=
use
> > > > > > drivers require CAP_SYS_NICE for RT gpu queues, this should not=
 cause
> > > > > > scaling issues.
> > > > > >
> > > > >
> > > > > I don=E2=80=99t think having two paths will ever be acceptable, n=
or do I think
> > > > > supporting a kthread would be all that easy. For example, in Xe w=
e queue
> > > > > additional work items outside of the scheduler on the queue for o=
rdering
> > > > > reasons =E2=80=94 we=E2=80=99d have to move all of that code down=
 into DRM sched or
> > > > > completely redesign our submission model to avoid this. I=E2=80=
=99m not sure if
> > > > > other drivers also do this, but it is allowed.
> > > >
> > > > Panthor doesn't rely on the serialization provided by the single-th=
read
> > > > workqueue, Panfrost might rely on it though (I don't remember). I a=
gree
> > > > that maintaining a thread and workqueue based scheduling is not ide=
al
> > > > though.
> > > >
> > > > >
> > > > > > Thoughts? Or perhaps this becomes less of an issue if all drm_s=
ched
> > > > > > users have concrete plans for userspace submissions..
> > > > >
> > > > > Maybe some day....
> > > >
> > > > I've yet to see a solution where no dma_fence-based signalization i=
s
> > > > involved in graphics workloads though (IIRC, Arm's solution still
> > > > needs the kernel for that). Until that happens, we'll still need th=
e
> > > > kernel to signal fences asynchronously when the job is done, which =
I
> > > > suspect will cause the same kind of latency issue...
> > > >
> > >
> > > I don't think that is the problem here. Doesn=E2=80=99t the job that =
draws the
> > > frame actually draw it, or does the display wait on the draw job=E2=
=80=99s fence
> > > to signal and then do something else?
> >
> > I know close to nothing about SurfaceFlinger and very little about
> > compositors in general, so I'll let Chia answer that one. What's sure
>
> I think Chia input would good, as if SurfaceFlinger jobs have input
> dependencies this entire suggestion doesn't make any sense.
>
> > is that, on regular page-flips (don't remember what async page-flips
> > do), the display drivers wait on the fences attached to the buffer to
> > signal before doing the flip.
>
> I think SurfaceFlinger is different compared to Wayland/X11 use cases,
> as maintaining a steady framerate is the priority above everything else
> (think phone screens, which never freeze, whereas desktops do all the
> time). So I believe SurfaceFlinger decides when it will submit the job
> to draw a frame, without directly passing in application dependencies
> into the buffer/job being drawn. Again, my understanding here may be
> incorrect...
That is correct. SurfaceFlinger only ever latches buffers whose
associated fences have signaled, and sends down the buffers to gpu for
composition or to the display for direct scanout. That might also be
how modern wayland compositors work nowadays? It sounds bad to let a
low fps app slow down system composition.

In theory, the gpu driver should not see input dependencies ever. I
will need to check if there are corner cases.


>
> >
> > > (Sorry=E2=80=94I know next to nothing
> > > about display.) Either way, fences should be signaled in IRQ handlers=
,
> >
> > In Panthor they are not, but that's probably something for us to
> > address.
Yeah, I am also looking into signaling fences from the (threaded) irq handl=
er.

> >
> > > which presumably don=E2=80=99t have the same latency issues as workqu=
eues, but I
> > > could be mistaken.
> >
> > Might have to do with the mental model I had of this "reconcile
> > Usermode queues with dma_fence signaling" model, where I was imagining
> > a SW job queue (based on drm_sched too) that would wait on HW fences to
> > be signal and would as a result signal the dma_fence attached to the
> > job. So the queueing/dequeuing of these jobs would still happen through
> > drm_sched, with the same scheduling prio issue. This being said, those
>
> Yes, if jobs have unmet dependencies, the bypass path doesn=E2=80=99t hel=
p with
> the DRM scheduler workqueue context switches being slow as that path
> needs to be taken in taken in this cases.
>
> Also, to bring up something insane we certainly wouldn=E2=80=99t want to =
do:
> calling run_job when dependencies are resolved in the fence callback,
> since we could be in an IRQ handler.
>
> Matt
>
> > jobs would likely be dependency less, so more likely to hit your
> > fast-path-run-job.
