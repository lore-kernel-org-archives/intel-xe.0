Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC721D3B7E2
	for <intel-xe@archiver.kernel.org>; Mon,  8 Dec 2025 13:33:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C16B10E39C;
	Mon,  8 Dec 2025 13:33:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FCxLghVu";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B74310E17E
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Dec 2025 13:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765200828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DSGQbJU62dXQ3/HgjxN8bSIZFSLSDYlIc/2r8ds+EZA=;
 b=FCxLghVuG/Lw/OMNwlontVGcDIxnBbBw3fzCFbWmAW2EYSu3prUtWT5p6L8ouXwoFKhhhh
 ctXnfMWBoMze63hflcD/0Ii1ycry7CAtraCcz7EkUUJTY41QHlF/Qmx53kgT1PMmnHsAu1
 ujLigLR2n3rroxUdnGVNnT7lb4hYxEc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-282-fGjL60VcMEGGb-aRpOboVQ-1; Mon, 08 Dec 2025 08:33:41 -0500
X-MC-Unique: fGjL60VcMEGGb-aRpOboVQ-1
X-Mimecast-MFC-AGG-ID: fGjL60VcMEGGb-aRpOboVQ_1765200820
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4775e00b16fso28293165e9.2
 for <intel-xe@lists.freedesktop.org>; Mon, 08 Dec 2025 05:33:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765200820; x=1765805620;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DSGQbJU62dXQ3/HgjxN8bSIZFSLSDYlIc/2r8ds+EZA=;
 b=EuOQG4WyHoIUul0D+J4z7GcsMBhOoftxdyXS8e96flfHYgpAyg3w4djkArnyYMRIWo
 lr0vuAMrTrlJ6JCqCIknaZh01FI3TNiso0zPWnbPvr2N9jbsdreHAYkQVw/T4WEcN7Aa
 TkGyimeFKtz/JKnuj3qK28fm3cl1H/iC2kIvublLCnOVcWqthPCP/Wn9XDQNbdUQ1AGl
 Fxh67orKebwiQoE3ZPhK1TDzHtNq4igRBzjcQB1mevI9umpQgpWLSQObJc7xf/R4rnmn
 SDk4gY8oiI03U88TT+x+7xjSfZvtMya6AFIGRAf6HofXk0EPaWo3/2j5R5Mly1Wf9pY/
 ByeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBVg7Lj5ltLCeqR89PaTpsEWdol0690DTZtIKn0gk3bGUVTtZ3Quv5yNRd0Elk6D6n2rbmI+6bRQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/dwitvDu8+TKmhyOIG6UhgscBKnjgaix8g6Ns8KWGwGgO05Cq
 v0fm1xn3zho615PqZeTA6pApi/EzmLKGqjouQA61eknieOAn9fAhGM7XdfDn3P2/eNOz+EfKkzr
 U1ypLBN7qMCym3A2cgrztU+ofScEiL7dnt0jZwoDf08EgeW4MIJyFCe6IFozUeLXjPE8J
X-Gm-Gg: ASbGncvd43HJghDSpdsjwYfgJhwxgzaIkI6RgE4BNFkeFjUAjVlFNpgGDVSunvUDJRu
 uf188ATWf/N04rukHZFfA5aY7HfBL2FFdlspybaIWjD5avY97sJvVXH8BUp2BF1wo7lK+gT4+dc
 u2eRwxwwU9ZcIAUHIkf3p/o2g/YY4uWaRJQ0AbdqS1BVuXaFGrw2bpczuqCSyDHqXpkQPYqO8FM
 zSxAU7aIDUMCF3TuRM1pBIz6hgGy0ZbJLC1URYiEwzJP6kf4EzxGLufmjkH7QUY75xIRdu8J5j6
 0sSw1NHioIMoFfF7BHRCrOZuOAKROq5FpuWwdKm7s2QIFrud0XmRKgpXZ3IGdvkQN5+qntf7vVA
 zfLwieJQU69/owqu6s+ZucgJqmmsD6KzSfK3xFaelG+m15pKpJj/ZyYuQ
X-Received: by 2002:a05:600c:210b:b0:479:3a86:dc1d with SMTP id
 5b1f17b1804b1-4793a86dcdemr51002955e9.37.1765200820254; 
 Mon, 08 Dec 2025 05:33:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHG9Wp4LLK9NpwUtuvkgaCMkhjD1nMtiCuk0IpeJ5VFbyDPOOzWg9H7FTZmnxbEDz6XeHEpHA==
X-Received: by 2002:a05:600c:210b:b0:479:3a86:dc1d with SMTP id
 5b1f17b1804b1-4793a86dcdemr51002805e9.37.1765200819760; 
 Mon, 08 Dec 2025 05:33:39 -0800 (PST)
Received: from ?IPv6:2001:16b8:3d03:eb00:dc87:649d:b5b:d46f?
 ([2001:16b8:3d03:eb00:dc87:649d:b5b:d46f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4792b157783sm137987045e9.5.2025.12.08.05.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Dec 2025 05:33:39 -0800 (PST)
Message-ID: <aeaced5616f80e4e59f6cbdce77ab22365ce1901.camel@redhat.com>
Subject: Re: [PATCH v7 2/9] drm/sched: Add pending job list iterator
From: Philipp Stanner <pstanner@redhat.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Alex
 Deucher <alexdeucher@gmail.com>
Cc: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 dakr@kernel.org
Date: Mon, 08 Dec 2025 14:33:37 +0100
In-Reply-To: <3f71a73a-8360-409c-8a51-55c37230d4cf@amd.com>
References: <20251201183954.852637-1-matthew.brost@intel.com>
 <20251201183954.852637-3-matthew.brost@intel.com>
 <0088fe0dd0d62b876d77b0f9e3a1c7586bdc5557.camel@redhat.com>
 <CADnq5_Pv20j+oSSFvfauUKvH8LUiVMCz2jgQyrDMw3CKACLNgQ@mail.gmail.com>
 <3f71a73a-8360-409c-8a51-55c37230d4cf@amd.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 05I0e99RtJLzmayTYpj5kujIPGgdPIagVFBWkJw3_-Q_1765200820
X-Mimecast-Originator: redhat.com
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

On Fri, 2025-12-05 at 10:19 +0100, Christian K=C3=B6nig wrote:
> On 12/4/25 17:04, Alex Deucher wrote:
> > On Wed, Dec 3, 2025 at 4:24=E2=80=AFAM Philipp Stanner <pstanner@redhat=
.com> wrote:
> > >=20
> > > +Cc Alex, Christian, Danilo
> > >=20
> > >=20
> > > On Mon, 2025-12-01 at 10:39 -0800, Matthew Brost wrote:
> > > > Stop open coding pending job list in drivers. Add pending job list
> > > > iterator which safely walks DRM scheduler list asserting DRM schedu=
ler
> > > > is stopped.
> > > >=20
> > > > v2:
> > > > =C2=A0- Fix checkpatch (CI)
> > > > v3:
> > > > =C2=A0- Drop locked version (Christian)
> > > > v4:
> > > > =C2=A0- Reorder patch (Niranjana)
> > >=20
> > > Same with the changelog.
> > >=20
> > > >=20
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@i=
ntel.com>
> > > > ---
> > > > =C2=A0include/drm/gpu_scheduler.h | 50 ++++++++++++++++++++++++++++=
+++++++++
> > > > =C2=A01 file changed, 50 insertions(+)
> > > >=20
> > > > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_schedule=
r.h
> > > > index 385bf34e76fe..9d228513d06c 100644
> > > > --- a/include/drm/gpu_scheduler.h
> > > > +++ b/include/drm/gpu_scheduler.h
> > > > @@ -730,4 +730,54 @@ static inline bool drm_sched_job_is_signaled(s=
truct drm_sched_job *job)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 dma_fence_is_signaled(&s_fence->finished);
> > > > =C2=A0}
> > > >=20
> > > > +/**
> > > > + * struct drm_sched_pending_job_iter - DRM scheduler pending job i=
terator state
> > > > + * @sched: DRM scheduler associated with pending job iterator
> > > > + */
> > > > +struct drm_sched_pending_job_iter {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gpu_scheduler *sched;
> > > > +};
> > > > +
> > > > +/* Drivers should never call this directly */
> > > > +static inline struct drm_sched_pending_job_iter
> > > > +__drm_sched_pending_job_iter_begin(struct drm_gpu_scheduler *sched=
)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_pending_job_iter iter =
=3D {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 .sched =3D sched,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 };
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 WARN_ON(!drm_sched_is_stopped(sched));
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 return iter;
> > > > +}
> > > > +
> > > > +/* Drivers should never call this directly */
> > > > +static inline void
> > > > +__drm_sched_pending_job_iter_end(const struct drm_sched_pending_jo=
b_iter iter)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 WARN_ON(!drm_sched_is_stopped(iter.sched)=
);
> > > > +}
> > > > +
> > > > +DEFINE_CLASS(drm_sched_pending_job_iter, struct drm_sched_pending_=
job_iter,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __drm_sched=
_pending_job_iter_end(_T),
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __drm_sched=
_pending_job_iter_begin(__sched),
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_=
gpu_scheduler *__sched);
> > > > +static inline void *
> > > > +class_drm_sched_pending_job_iter_lock_ptr(class_drm_sched_pending_=
job_iter_t *_T)
> > > > +{ return _T; }
> > > > +#define class_drm_sched_pending_job_iter_is_conditional false
> > > > +
> > > > +/**
> > > > + * drm_sched_for_each_pending_job() - Iterator for each pending jo=
b in scheduler
> > > > + * @__job: Current pending job being iterated over
> > > > + * @__sched: DRM scheduler to iterate over pending jobs
> > > > + * @__entity: DRM scheduler entity to filter jobs, NULL indicates =
no filter
> > > > + *
> > > > + * Iterator for each pending job in scheduler, filtering on an ent=
ity, and
> > > > + * enforcing scheduler is fully stopped
> > > > + */
> > > > +#define drm_sched_for_each_pending_job(__job, __sched, __entity)=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 scoped_guard(drm_sched_pending_job_iter, =
(__sched))=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 list_for_each_entry((__job), &(__sched)->pending_list, list)=C2=A0=
=C2=A0=C2=A0 \
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for_each_if(!(__enti=
ty) || (__job)->entity =3D=3D (__entity))
> > > > +
> > > > =C2=A0#endif
> > >=20
> > >=20
> > > See my comments in the first patch. The docu doesn't mention at all w=
hy
> > > this new functionality exists and when and why users would be expecte=
d
> > > to use it.
> > >=20
> > > As far as I remember from XDC, both AMD and Intel overwrite a timed o=
ut
> > > jobs buffer data in the rings on GPU reset. To do so, the driver need=
s
> > > the timedout job (passed through timedout_job() callback) and then
> > > needs all the pending non-broken jobs.
> > >=20
> > > AFAICS your patch provides a generic iterator over the entire
> > > pending_list. How is a driver then supposed to determine which are th=
e
> > > non-broken jobs (just asking, but that needs to be documented)?
> > >=20
> > > Could it make sense to use a different iterator which only returns jo=
bs
> > > of not belonging to the same context as the timedout-one?
> > >=20
> > > Those are important questions that need to be addressed before mergin=
g
> > > that.
> > >=20
> > > And if this works canonically (i.e., for basically everyone), it need=
s
> > > to be documented in drm_sched_resubmit_jobs() that this iterator is n=
ow
> > > the canonical way of handling timeouts.
> > >=20
> > > Moreover, btw, just yesterday I added an entry to the DRM todo list
> > > which addresses drm_sched_resubmit_jobs(). If we merge this, that ent=
ry
> > > would have to be removed, too.
> > >=20
> > >=20
> > > @AMD: Would the code Matthew provides work for you? Please give your
> > > input. This is very important common infrastructure.
> >=20
> > I don't think drm_sched_resubmit_jobs() can work for us without major
> > rework.=C2=A0 For our kernel queues, we have a single queue on which jo=
bs
> > for different clients are scheduled.=C2=A0 When we reset the queue, we =
lose
> > all jobs on the queue and have to re-emit the non-guilty ones.=C2=A0 We=
 do
> > this at the ring level, i.e., we save the packets directly from the
> > ring and then re-emit the packets for the non-guilty contexts to the
> > freshly reset ring.=C2=A0 This avoids running run_job() again which wou=
ld
> > issue new fences and race with memory management, etc.
> >=20
> > I think the following would be workable:
> > 1. driver job_timedout() callback flags the job as bad. resets the bad
> > queue, and calls drm_sched_resubmit_jobs()
> > 2. drm_sched_resubmit_jobs() walks the pending list and calls
> > run_job() for every job
>=20
> Calling run_job() multiple times was one of the worst ideas I have ever s=
een.
>=20
> The problem here is that you need a transactional approach to the interna=
l driver state which is modified by ->run_job().
>=20
> So for example if you have:
> ->run_job(A)
> ->run_job(B)
> ->run_job(C)
>=20
> And after a reset you find that you need to re-submit only job B and A & =
C are filtered then that means that your driver state needs to get back bef=
ore running job A.
>=20
> > 2. driver run_job() callback looks to see if we already ran this job
> > and uses the original fence rather than allocating a new one
>=20
> Nope, the problem is *all* drivers *must* use the original fence. Otherwi=
se you always run into trouble.
>=20
> We should not promote a driver interface which makes it extremely easy to=
 shoot down the whole system.
>=20
> > 3. driver run_job() callback checks to see if the job is guilty or
> > from the same context and if so, sets an error on the fences and
> > submits only the fence packet to the queue so that any follow up jobs
> > will properly synchronize if they need to wait on the fence from the
> > bad job.
> > 4. driver run_job() callback will submit the full packet stream for
> > non-guilty contexts
> >=20
> > I guess we could use the iterator and implement that logic in the
> > driver directly rather than using drm_sched_resubmit_jobs().
>=20
> Yeah, exactly that's the way to go.

Sorry, I guess my message was confusing.

I don't mean anyone to use drm_sched_resubmit_jobs() at all. That
function is deprecated, and since there are still users, we can't
easily modify it.
I just mentioned that function because its docstring should inform
about what users should do *instead* of calling that function.
Currently, it's just marked as deprecated without providing users with
an alternative.

Anyways.
So can you take a look at Matthew's iterator and see if that will work
for you?

If we'd end up with an at least mostly-generic solution for resubmits
that's in use in both Xe and amdgpu, that would be a huge leap forward.


P.

>=20
> Christian.
>=20
> >=20
> > Alex
>=20

