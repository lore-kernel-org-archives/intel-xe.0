Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A99D1266D
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 09:07:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D3610E7CF;
	Wed,  3 Dec 2025 09:07:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XhRGrNWx";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6828A10E7CF
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Dec 2025 09:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764752871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m7n5aJ6gFTsDe7JLqVjWq0Y+bv/8CPCgIBrAWTCTxxE=;
 b=XhRGrNWxGfgz23mYQHlsbyrYuiGqnZdirOBiHOISrAPiYrBIQHhAV7guzWPu0cVfjiCRtd
 CNhwcuMPeb1/PBN9miP/PpBVm+TDtphoSRHmfE9JfhBa3/vRMCwYrb+PLHleJTy75E3PE7
 UW3t1gLTxS3/4vjNnojpI4qAhYjfW1c=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-Btsbdpq0Mm-h6lLA6T7H7g-1; Wed, 03 Dec 2025 04:07:50 -0500
X-MC-Unique: Btsbdpq0Mm-h6lLA6T7H7g-1
X-Mimecast-MFC-AGG-ID: Btsbdpq0Mm-h6lLA6T7H7g_1764752869
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-7dd05696910so2624943b3a.2
 for <intel-xe@lists.freedesktop.org>; Wed, 03 Dec 2025 01:07:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764752869; x=1765357669;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D249A3i69j3/yHAUiWy/B92/l7tH87pW4RORGY2Xp10=;
 b=Wwe0JCdfF5fbYZ8iJx2klEZwuZQPLt+IxgCULA2F3bI1+9YJlEG4ndF4STBtIp5R5b
 8CFvI3FWym/2PmoVT/TxMzJgYioAeMZ8K7FcAIwy79hQyRyJeF/l97KwGHjv6cycV/fH
 Cl2BofHtzBVWBjwv6dXRHMACbIKFHrxCgBUIWL7DQ3Mk6G7myNMoh+vXk+pgrvy7ViiX
 q8gbPENgmUWa5BJ3NDBu8r4fzv3o8aJHDPxnOrZfWiSwuF2V4S7lXu6mPlOL4T1felz5
 m7XsxsTbMfZHJeNzO3UoIZAwU4NAjT+ueAFL9WxAjWKcppKPUNdlN0zhbpmNY+2wQEEC
 rdmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWX/KhMgB/pGNDwKKvvco+6l0eR9jhFRTdO8i6fE6eW9/+Q/KAOSFVdPNb+T1xRPfUcdkvsb7NsdQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCiDBMFPKs3rkowyEH5cF6vr35/GOH6u6Uk75xTKT3OZC5zoct
 eb6r4m8KQvzLUbp/EUXFXwNVupGrU1jicvWxKWzkQHASysLOxyoInk2/SBZlfXBqB5y8ZTfNqq5
 eYzdMX2xPz6PBWqtonQS/O9NwEi/0ic05nMv8+sRvBQA3fe2fJualhJSdS6dXaig+AK3B
X-Gm-Gg: ASbGnctyzmOtKyYntIh6ySD2xkUOwaQ9KIq5OomNrtOJJzM1p+xj4uSQ6WHq56mkxbv
 GDLElmasRaFjEjVZ/aCmkLtPV+rBoqgQ/Q5YSBW+aXifc9AMLc33zmuvYhS8TgK7CooEMyDursN
 TCLGcpQMQZUR3D7IErls2HrfDD1wgm21iyKbVui8DnIvoCflTvHtDxmaW4qKQ7f3pJxaZJpaiER
 uKBvEglgh3ETvXEqSNMFN8c26jvMpiDEbpvXv5tPVzsbZEHw1MGdTplf7nVTig4se5KOI32XSqr
 40TCZzNIPGMN/lcAsoPixW+u/Rf5ufrzJkAxxoc9Je5SlPC6A0ylhM8gQn/J1Q2mu3do9IR1o3u
 tzXG7vBB2hPOvYKJIl1L6EAlUkaZ70iPl1lh/
X-Received: by 2002:a05:6a00:c89:b0:770:fd32:f365 with SMTP id
 d2e1a72fcca58-7e00fbcf100mr1809566b3a.25.1764752869227; 
 Wed, 03 Dec 2025 01:07:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFREZMGminTy30KjTzK+tFQWLS255BWIN1fM3zIPkEwJBk7R36MZ0BaLKjqnEfeX+U64LNB/w==
X-Received: by 2002:a05:6a00:c89:b0:770:fd32:f365 with SMTP id
 d2e1a72fcca58-7e00fbcf100mr1809546b3a.25.1764752868846; 
 Wed, 03 Dec 2025 01:07:48 -0800 (PST)
Received: from [10.200.68.138] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7d15f176096sm19456998b3a.57.2025.12.03.01.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Dec 2025 01:07:48 -0800 (PST)
Message-ID: <0088fe0dd0d62b876d77b0f9e3a1c7586bdc5557.camel@redhat.com>
Subject: Re: [PATCH v7 2/9] drm/sched: Add pending job list iterator
From: Philipp Stanner <pstanner@redhat.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Alex Deucher
 <alexander.deucher@amd.com>,  Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, dakr@kernel.org
Date: Wed, 03 Dec 2025 10:07:37 +0100
In-Reply-To: <20251201183954.852637-3-matthew.brost@intel.com>
References: <20251201183954.852637-1-matthew.brost@intel.com>
 <20251201183954.852637-3-matthew.brost@intel.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XQz6EoUCMI_KY0Aj4j57Hgng3r0pwxk5Sd_iqLDU_ko_1764752869
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

+Cc Alex, Christian, Danilo


On Mon, 2025-12-01 at 10:39 -0800, Matthew Brost wrote:
> Stop open coding pending job list in drivers. Add pending job list
> iterator which safely walks DRM scheduler list asserting DRM scheduler
> is stopped.
>=20
> v2:
> =C2=A0- Fix checkpatch (CI)
> v3:
> =C2=A0- Drop locked version (Christian)
> v4:
> =C2=A0- Reorder patch (Niranjana)

Same with the changelog.

>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.c=
om>
> ---
> =C2=A0include/drm/gpu_scheduler.h | 50 ++++++++++++++++++++++++++++++++++=
+++
> =C2=A01 file changed, 50 insertions(+)
>=20
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 385bf34e76fe..9d228513d06c 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -730,4 +730,54 @@ static inline bool drm_sched_job_is_signaled(struct =
drm_sched_job *job)
> =C2=A0=09=09dma_fence_is_signaled(&s_fence->finished);
> =C2=A0}
> =C2=A0
> +/**
> + * struct drm_sched_pending_job_iter - DRM scheduler pending job iterato=
r state
> + * @sched: DRM scheduler associated with pending job iterator
> + */
> +struct drm_sched_pending_job_iter {
> +=09struct drm_gpu_scheduler *sched;
> +};
> +
> +/* Drivers should never call this directly */
> +static inline struct drm_sched_pending_job_iter
> +__drm_sched_pending_job_iter_begin(struct drm_gpu_scheduler *sched)
> +{
> +=09struct drm_sched_pending_job_iter iter =3D {
> +=09=09.sched =3D sched,
> +=09};
> +
> +=09WARN_ON(!drm_sched_is_stopped(sched));
> +=09return iter;
> +}
> +
> +/* Drivers should never call this directly */
> +static inline void
> +__drm_sched_pending_job_iter_end(const struct drm_sched_pending_job_iter=
 iter)
> +{
> +=09WARN_ON(!drm_sched_is_stopped(iter.sched));
> +}
> +
> +DEFINE_CLASS(drm_sched_pending_job_iter, struct drm_sched_pending_job_it=
er,
> +=09=C2=A0=C2=A0=C2=A0=C2=A0 __drm_sched_pending_job_iter_end(_T),
> +=09=C2=A0=C2=A0=C2=A0=C2=A0 __drm_sched_pending_job_iter_begin(__sched),
> +=09=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gpu_scheduler *__sched);
> +static inline void *
> +class_drm_sched_pending_job_iter_lock_ptr(class_drm_sched_pending_job_it=
er_t *_T)
> +{ return _T; }
> +#define class_drm_sched_pending_job_iter_is_conditional false
> +
> +/**
> + * drm_sched_for_each_pending_job() - Iterator for each pending job in s=
cheduler
> + * @__job: Current pending job being iterated over
> + * @__sched: DRM scheduler to iterate over pending jobs
> + * @__entity: DRM scheduler entity to filter jobs, NULL indicates no fil=
ter
> + *
> + * Iterator for each pending job in scheduler, filtering on an entity, a=
nd
> + * enforcing scheduler is fully stopped
> + */
> +#define drm_sched_for_each_pending_job(__job, __sched, __entity)=09=09\
> +=09scoped_guard(drm_sched_pending_job_iter, (__sched))=09=09=09\
> +=09=09list_for_each_entry((__job), &(__sched)->pending_list, list)=09\
> +=09=09=09for_each_if(!(__entity) || (__job)->entity =3D=3D (__entity))
> +
> =C2=A0#endif


See my comments in the first patch. The docu doesn't mention at all why
this new functionality exists and when and why users would be expected
to use it.

As far as I remember from XDC, both AMD and Intel overwrite a timed out
jobs buffer data in the rings on GPU reset. To do so, the driver needs
the timedout job (passed through timedout_job() callback) and then
needs all the pending non-broken jobs.

AFAICS your patch provides a generic iterator over the entire
pending_list. How is a driver then supposed to determine which are the
non-broken jobs (just asking, but that needs to be documented)?

Could it make sense to use a different iterator which only returns jobs
of not belonging to the same context as the timedout-one?

Those are important questions that need to be addressed before merging
that.

And if this works canonically (i.e., for basically everyone), it needs
to be documented in drm_sched_resubmit_jobs() that this iterator is now
the canonical way of handling timeouts.

Moreover, btw, just yesterday I added an entry to the DRM todo list
which addresses drm_sched_resubmit_jobs(). If we merge this, that entry
would have to be removed, too.


@AMD: Would the code Matthew provides work for you? Please give your
input. This is very important common infrastructure.


Philipp

