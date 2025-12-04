Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B655D216A5
	for <intel-xe@archiver.kernel.org>; Thu,  4 Dec 2025 16:04:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E3F10E94D;
	Thu,  4 Dec 2025 16:04:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DFvzm82l";
	dkim-atps=neutral
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE2B10E204
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Dec 2025 16:04:14 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-7b8c7a4f214so120615b3a.2
 for <intel-xe@lists.freedesktop.org>; Thu, 04 Dec 2025 08:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764864254; x=1765469054; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h9XAD36IjWaQ1p3osiLJ/jBzK4APVeT1MPMLfXvV3Uw=;
 b=DFvzm82li7hGGWXKCRW3JTFJFfFE7aJ/zIpnpjEW03BMSaYEEe1uNrF9PSKHqlTy3H
 b5zBzbO+GnytO0hxrCp1LVthN3kjh1lIUkdIRa/pMQ0UWpK2Aoqs+QcqfWVkqVNrEnMi
 em455aB67TuEg2QDE9Aq0eRwyTPskq2YI10+3CCi6h0M5SH4sm8ZuObrruxt5RvE60/P
 k1gw1zkKdDHgkV4KhkvooZtKKNfbGubT07sF3fitRLX0MgHCbrUJr2iTATPF0RLkdlJE
 oD2yGCKQxSI5k+/dy/hHsU9jM2cIYKCQkZPN3Lsaehf8mk8kZ/bg2hPa0n8fWo/pu8Dp
 dDgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764864254; x=1765469054;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=h9XAD36IjWaQ1p3osiLJ/jBzK4APVeT1MPMLfXvV3Uw=;
 b=VExYdlH6urKEV+Xek3OEaOSZt46sp8Qx+/CJHi/D8GpWPRzkbQZUOeficoSmrcUkiB
 YI/6jswJ7zppnso61XyB1T5WfCDuGIQ0JZeDX2mtGj0ug5rZ0J163uUEyVyJljF74CHB
 s/w4Sb0b7uYSCsz/vvYGYi24t6nHEVtUkRMqBhmeO1S6PLq1VEgHr+n6JTxD+iPz1Q0P
 JzeSmytn5ZAX4X4o4tYrC6TO+Fn7s9BvC4pcOXKcbYeIH1pVEncs4nuQFQi3/Ny+gP9K
 9UvldMc1RlZ0pNcAYpCTxpYzqZH6+ouTg5C8FKUTHNIBUXstdCU6YIOI+M5gfVDICOc5
 jJdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnw33WczW8Nk5pvDuxkIC7fJ6qHRKojRpvR4gArbu4p2VEChQWW/BAQWvuPkYrjoIko2A95u0Vdg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuAa3czTCfbzmkabeNdJFssinzJqMgPWMcbt80oBXjhhHgUqe6
 +MOG0T9+laP5A/nToXd6LKFrZ8PViHMojILsv8LRi+1uMWSHgPtUZFQPPsfedOga/dyYJlb1jRl
 FA81/yPxui6KIakD2NY4SjPwZXW4odXk=
X-Gm-Gg: ASbGncvYhDMn9fjDxpnQ82UqlW7qFLHhJ0x5y2T9Kp0G8mW4LkMPjVaDSqC87PIsz70
 0ra5rjjuWEPDB1MqSqH/Ck07dAHXmR9e/Td/3OpRA0IKsRdF8cvft/MjEFxLJc/IjiPlezfSZgZ
 9Z3s05Gzrpj49x1bAYa5lvSzxmzRHZBAvj+PBB67qm9462HUBxwqaiaw5L3Lj84O63hoXeo30tE
 xGUQhiXQmGJqZA07KLOjLHBsmK9Kdg6AzJil/jKlYruZgrIxw5OHrd3ii/cHLVn9H/H0i5/F2bn
 xKfXuw==
X-Google-Smtp-Source: AGHT+IFo/0O3VZ0JYxttJZg3OwclhElvPtC74OYJfv+64UdlIzP+re1aV/OlqYA2hCWkso6DJsvYiwoXztgALGknudw=
X-Received: by 2002:a05:7022:529:b0:11a:2020:ac85 with SMTP id
 a92af1059eb24-11df259c23bmr4130506c88.4.1764864253959; Thu, 04 Dec 2025
 08:04:13 -0800 (PST)
MIME-Version: 1.0
References: <20251201183954.852637-1-matthew.brost@intel.com>
 <20251201183954.852637-3-matthew.brost@intel.com>
 <0088fe0dd0d62b876d77b0f9e3a1c7586bdc5557.camel@redhat.com>
In-Reply-To: <0088fe0dd0d62b876d77b0f9e3a1c7586bdc5557.camel@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 4 Dec 2025 11:04:02 -0500
X-Gm-Features: AWmQ_bnWAWiWiC33qR9yjiJ8M5zCFX_zhpJblXYWs1p6UR9cSMkrAObCpco-LaA
Message-ID: <CADnq5_Pv20j+oSSFvfauUKvH8LUiVMCz2jgQyrDMw3CKACLNgQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/9] drm/sched: Add pending job list iterator
To: Philipp Stanner <pstanner@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org
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

On Wed, Dec 3, 2025 at 4:24=E2=80=AFAM Philipp Stanner <pstanner@redhat.com=
> wrote:
>
> +Cc Alex, Christian, Danilo
>
>
> On Mon, 2025-12-01 at 10:39 -0800, Matthew Brost wrote:
> > Stop open coding pending job list in drivers. Add pending job list
> > iterator which safely walks DRM scheduler list asserting DRM scheduler
> > is stopped.
> >
> > v2:
> >  - Fix checkpatch (CI)
> > v3:
> >  - Drop locked version (Christian)
> > v4:
> >  - Reorder patch (Niranjana)
>
> Same with the changelog.
>
> >
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel=
.com>
> > ---
> >  include/drm/gpu_scheduler.h | 50 +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 50 insertions(+)
> >
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index 385bf34e76fe..9d228513d06c 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -730,4 +730,54 @@ static inline bool drm_sched_job_is_signaled(struc=
t drm_sched_job *job)
> >               dma_fence_is_signaled(&s_fence->finished);
> >  }
> >
> > +/**
> > + * struct drm_sched_pending_job_iter - DRM scheduler pending job itera=
tor state
> > + * @sched: DRM scheduler associated with pending job iterator
> > + */
> > +struct drm_sched_pending_job_iter {
> > +     struct drm_gpu_scheduler *sched;
> > +};
> > +
> > +/* Drivers should never call this directly */
> > +static inline struct drm_sched_pending_job_iter
> > +__drm_sched_pending_job_iter_begin(struct drm_gpu_scheduler *sched)
> > +{
> > +     struct drm_sched_pending_job_iter iter =3D {
> > +             .sched =3D sched,
> > +     };
> > +
> > +     WARN_ON(!drm_sched_is_stopped(sched));
> > +     return iter;
> > +}
> > +
> > +/* Drivers should never call this directly */
> > +static inline void
> > +__drm_sched_pending_job_iter_end(const struct drm_sched_pending_job_it=
er iter)
> > +{
> > +     WARN_ON(!drm_sched_is_stopped(iter.sched));
> > +}
> > +
> > +DEFINE_CLASS(drm_sched_pending_job_iter, struct drm_sched_pending_job_=
iter,
> > +          __drm_sched_pending_job_iter_end(_T),
> > +          __drm_sched_pending_job_iter_begin(__sched),
> > +          struct drm_gpu_scheduler *__sched);
> > +static inline void *
> > +class_drm_sched_pending_job_iter_lock_ptr(class_drm_sched_pending_job_=
iter_t *_T)
> > +{ return _T; }
> > +#define class_drm_sched_pending_job_iter_is_conditional false
> > +
> > +/**
> > + * drm_sched_for_each_pending_job() - Iterator for each pending job in=
 scheduler
> > + * @__job: Current pending job being iterated over
> > + * @__sched: DRM scheduler to iterate over pending jobs
> > + * @__entity: DRM scheduler entity to filter jobs, NULL indicates no f=
ilter
> > + *
> > + * Iterator for each pending job in scheduler, filtering on an entity,=
 and
> > + * enforcing scheduler is fully stopped
> > + */
> > +#define drm_sched_for_each_pending_job(__job, __sched, __entity)      =
       \
> > +     scoped_guard(drm_sched_pending_job_iter, (__sched))              =
       \
> > +             list_for_each_entry((__job), &(__sched)->pending_list, li=
st)    \
> > +                     for_each_if(!(__entity) || (__job)->entity =3D=3D=
 (__entity))
> > +
> >  #endif
>
>
> See my comments in the first patch. The docu doesn't mention at all why
> this new functionality exists and when and why users would be expected
> to use it.
>
> As far as I remember from XDC, both AMD and Intel overwrite a timed out
> jobs buffer data in the rings on GPU reset. To do so, the driver needs
> the timedout job (passed through timedout_job() callback) and then
> needs all the pending non-broken jobs.
>
> AFAICS your patch provides a generic iterator over the entire
> pending_list. How is a driver then supposed to determine which are the
> non-broken jobs (just asking, but that needs to be documented)?
>
> Could it make sense to use a different iterator which only returns jobs
> of not belonging to the same context as the timedout-one?
>
> Those are important questions that need to be addressed before merging
> that.
>
> And if this works canonically (i.e., for basically everyone), it needs
> to be documented in drm_sched_resubmit_jobs() that this iterator is now
> the canonical way of handling timeouts.
>
> Moreover, btw, just yesterday I added an entry to the DRM todo list
> which addresses drm_sched_resubmit_jobs(). If we merge this, that entry
> would have to be removed, too.
>
>
> @AMD: Would the code Matthew provides work for you? Please give your
> input. This is very important common infrastructure.

I don't think drm_sched_resubmit_jobs() can work for us without major
rework.  For our kernel queues, we have a single queue on which jobs
for different clients are scheduled.  When we reset the queue, we lose
all jobs on the queue and have to re-emit the non-guilty ones.  We do
this at the ring level, i.e., we save the packets directly from the
ring and then re-emit the packets for the non-guilty contexts to the
freshly reset ring.  This avoids running run_job() again which would
issue new fences and race with memory management, etc.

I think the following would be workable:
1. driver job_timedout() callback flags the job as bad. resets the bad
queue, and calls drm_sched_resubmit_jobs()
2. drm_sched_resubmit_jobs() walks the pending list and calls
run_job() for every job
2. driver run_job() callback looks to see if we already ran this job
and uses the original fence rather than allocating a new one
3. driver run_job() callback checks to see if the job is guilty or
from the same context and if so, sets an error on the fences and
submits only the fence packet to the queue so that any follow up jobs
will properly synchronize if they need to wait on the fence from the
bad job.
4. driver run_job() callback will submit the full packet stream for
non-guilty contexts

I guess we could use the iterator and implement that logic in the
driver directly rather than using drm_sched_resubmit_jobs().

Alex
