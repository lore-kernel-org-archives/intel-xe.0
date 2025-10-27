Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191F0CCF9EC
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 11:14:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC20410E458;
	Mon, 27 Oct 2025 11:14:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RiwWMFrt";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F05610E077
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 11:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761563642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WRLalohHy3rCCuGjzo0HJo/EkbqNms9MJsxQtpyysMc=;
 b=RiwWMFrt2NMpdLQkVR+EXcoFfv/SN9FyX6lA6WHwIZt3T/Khuv3FIBhrr2aX2RvL5a8Ndr
 E0c69thP01kW9ppGFsaC1Xi7rirDT8OKVIJVYHBK30Ili/v3sn/IIVnu99sibMfj9YiZda
 aLXjtKLv69REJXvRDzNuRncUvHg4OCI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-28-TXdUAkm2PO-vh_UEBVA1_g-1; Mon, 27 Oct 2025 07:14:01 -0400
X-MC-Unique: TXdUAkm2PO-vh_UEBVA1_g-1
X-Mimecast-MFC-AGG-ID: TXdUAkm2PO-vh_UEBVA1_g_1761563640
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-b4635c413a7so335842466b.1
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 04:14:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761563640; x=1762168440;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ED6aJ6VtNbe3dTLwkfXNyk6CAnAGzuoKM+uc6M/7ELA=;
 b=RfiYqGoOupoG2gq7VcWxCOhWD/C6aCz3ee2P6nFZBwAt8bIdIoclCT1JFpo8sTjHkq
 /pKrHmR7wWBulxoVuBko5qvT5syIOt1qIO6QxLV6UqpiFJrlZhD0PONeccdUCeQzRrMA
 OS1fnSVA+1LSAJAmEl+9tDH38a+jGATJduHGXqnvtxXKZZElNAy2tHHG3gNjPha814dO
 pfYNQUWLhhq147nX6LbPGIfrTGnIDZU7AL/u/DG4sQrLm7oRgdm5pWTHZApvrUDYH659
 NfzNIujqGbC5NyQhJsI2QmCaErm7iPQv5EENKrXnR1FqLU+MtJcFET5GEgtobcFCtFVL
 M7LA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5HxJHSWFPUOYgPvBahxOIjTUhXJwWB7ojU6j00ZhjVF9+lfFes6uZmZXz6zWRplVx6Z4YdnL54w==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLIIJSg0SNAHOgkKVu1cPHb1xSAMa+V1wSiMT5muZ+wwspOskE
 RliM3zsO0nJN1MTgwqpvT8JPSWP0u3KPbnhUMAJ2cw3OPEaWPh/gNh05BjGUgxWo8MQdtXFRs0A
 q7eTwhOWbKDcTyozHax71c/hQ6VU0Kg7au/QG3Annw3UOCg6gCsh0K81VGdw7f2ySh1wc
X-Gm-Gg: ASbGncuRjP0GPP3RrnDsz5kHOKWmZecEIqfgHyKGin1F9xuHUVoj2clQ/0jZF4GKsrt
 WHsQIjDUDtvW+4IUctNuAPzCbESfuwciThnUZBbuRL+8U3X6KCMCJgEGutp/78RLDaQO5NiKWyi
 v8hDeeSqkNDesKod0fSo4UyHlRRDB6TEgwTXQ0yzVg1M8ZHeL3KKLnInLSxapN3VeB1TP3vp41P
 wsLbr8fpUoxvqI1rTNf5ffElLPvF2IpqkizRc9tehigOWJn8E7mxoNA3iVTn29Q8qnEtfaHiy7d
 DJSv3XVQkrKxmNbQjuq+lxRxjxdb5tFoRXf8oI1d9hrHyhPyWK+uguHK++e5WAoKXsRh5TOEl9c
 THHDhFIsnTzj2mueHaLvNhlBxMbMm9ZVzX3Ip5F5AjqDVug==
X-Received: by 2002:a17:906:f59f:b0:b40:cfe9:ed2c with SMTP id
 a640c23a62f3a-b6d700613a8mr1017087866b.64.1761563640171; 
 Mon, 27 Oct 2025 04:14:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFM5QX7q+ulmwr25IwswirGQJy8OMcID1rEEuQvZTUQ/p5vsFN8TPgYvpCoC3nOmLXfz83gsw==
X-Received: by 2002:a17:906:f59f:b0:b40:cfe9:ed2c with SMTP id
 a640c23a62f3a-b6d700613a8mr1017085966b.64.1761563639732; 
 Mon, 27 Oct 2025 04:13:59 -0700 (PDT)
Received: from ?IPv6:2001:16b8:3d68:200:6e75:6a50:1d0f:8f29?
 ([2001:16b8:3d68:200:6e75:6a50:1d0f:8f29])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d853f97f7sm725914266b.51.2025.10.27.04.13.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 04:13:59 -0700 (PDT)
Message-ID: <537bdebf2112a080ae92526ecfa41d63668d90a3.camel@redhat.com>
Subject: Re: [RFC PATCH 3/3] drm/sched: Prevent adding dependencies to an
 armed job
From: Philipp Stanner <pstanner@redhat.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: jiangshanlai@gmail.com, tj@kernel.org, simona.vetter@ffwll.ch, 
 christian.koenig@amd.com, dakr@kernel.org
Date: Mon, 27 Oct 2025 12:13:58 +0100
In-Reply-To: <20251021213952.746900-4-matthew.brost@intel.com>
References: <20251021213952.746900-1-matthew.brost@intel.com>
 <20251021213952.746900-4-matthew.brost@intel.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lOWwXbEeeNZ9rQJFyPNCYiOwyM7XgzqfdU1z-9Nzo6M_1761563640
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

I've got a kernel.org addr by now by the way

On Tue, 2025-10-21 at 14:39 -0700, Matthew Brost wrote:
> According to the DMA scheduler documentation, once a job is armed, it
> must be pushed. Drivers should avoid calling the failing code path that
> attempts to add dependencies after a job has been armed.
>=20

Why is that a "failing code path"?

The issue with adding callbacks is that adding them to an already
signaled fence is a bad idea. I'm not sure if it's illegal, though.
dma_fence_add_cb() merely returns an error then, but the driver could
in priniciple then execute its cb code itself.

And even if we agree that this is a hard rule that must be followed,
then drm_sched_job_arm() *might* not be the right place, because just
because a job is armed doesn't mean that its fence is about to get
signaled. drm_sched_entity_push_job() would be the critical place.


>  This change
> enforces that rule.
>=20
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 7 ++++++-
> =C2=A01 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index 676484dd3ea3..436cb2844161 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -873,7 +873,8 @@ EXPORT_SYMBOL(drm_sched_job_arm);
> =C2=A0 * @job: scheduler job to add the dependencies to
> =C2=A0 * @fence: the dma_fence to add to the list of dependencies.
> =C2=A0 *
> - * Note that @fence is consumed in both the success and error cases.
> + * Note that @fence is consumed in both the success and error cases. Thi=
s
> + * function cannot be called if the job is armed.
> =C2=A0 *
> =C2=A0 * Returns:
> =C2=A0 * 0 on success, or an error on failing to expand the array.
> @@ -886,6 +887,10 @@ int drm_sched_job_add_dependency(struct drm_sched_jo=
b *job,
> =C2=A0=09u32 id =3D 0;
> =C2=A0=09int ret;
> =C2=A0
> +=09/* Do not allow additional dependencies when job is armed */
> +=09if (WARN_ON_ONCE(job->sched))

One would probably want an 'armed' boolean for that. At the very least
one wants to document in the struct's docstring that job->sched has
this semantic meaning. Otherwise it's only obvious for people who have
been hacking on the scheduler for years.


By the way I think that we use WARN_ON*() too much in DRM. It generates
difficult to read, non-descriptive error messages compared to
dev_warn() and similar helpers, and it's often a bit overkill. I would
only use it when there is no other choice, such as in an interrupt-
handler or widely used void func() where you cannot simply add a return
code.


P.

> +=09=09return -EINVAL;


> +
> =C2=A0=09if (!fence)
> =C2=A0=09=09return 0;
> =C2=A0

