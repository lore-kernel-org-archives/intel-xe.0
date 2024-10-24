Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21069CE8E8A
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 15:35:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB2D410E964;
	Thu, 24 Oct 2024 15:35:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KaMzF3R2";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D91810E964
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Oct 2024 15:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729784152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t4NZF8/bs+vu0Kkuk8ifz5Ec7BVfb01ZqQ5W8OsPstM=;
 b=KaMzF3R2qz/nowWhD61DoQNLyFX4cmN5TNyh3kZUO9j1rwh/cX40AbF7V3rDp4QPJFf7Wq
 41V9UJv4Nz7qn3gL0/VuiOtBp90iEub4uXeiHKLYKa11caoG/CSvTRN4Gg0yXbvjerWAbx
 PNJtOCVaKQGIpTikQTDFQbgU1EmXEuo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-235-vLf_yEl8NIu_RFcN8gLFqQ-1; Thu, 24 Oct 2024 11:35:50 -0400
X-MC-Unique: vLf_yEl8NIu_RFcN8gLFqQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4315a0f25afso8676165e9.3
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Oct 2024 08:35:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729784149; x=1730388949;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4XHA5y9pXsuyiZijcWa6Y104RyTQrImtABY3rWqXeDQ=;
 b=I85Ult+7j1/R0qHLAcLEhiKgIUDF5OKemMREVDhDcL/gsmW0biDVX3wxbSqT6gP641
 V4M9MwvxmDnSGxTTQEtbv15jFIE+ofGgnUt8KN/5BSGNTfXumnH3C4qWr+9I/OHMFYYa
 mt02D3Wl4NLn4GmlcT1g5QTk9iUtltQHfynpPF27XG2Yd2MfnSn1wrh7qt07UAilN2at
 XUuPASORtoF3FqW1dxq7kT1bI1BremD8+CDSNYweyCdT5qNHiOoAjonwod8zJpWnHrzj
 Y1l9CkY93V3zmYkBauomfCi3tG5LP4rVl6Z0CC4og/+ZPzXC8zRM5TFpunlXFwmv9Nz8
 jftg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5cxvJxlHXjPqC0j0nq/dUzLzXNY6GcW5w6qextHG5TPuJDk6PQcNXeTBJhFniOmLgkWLpY7BWWQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyW0erwNXjeMp1qHPOxHZ+IpgGyNPB2HOhNuUxy3fe3XX9xUMx2
 YR4OQpctNSGjzHEZMs5iQLhivxhiBJHrDNJ0zNeC4IFdBqrW/2VtvQhjVuNukc6mJf2gpqlVqRS
 Y5xrsqvehmN70bFKc1sx6SG7aTMrVQL5HupLXpzN2rRLPRMLvlP8LfyVGMoUKm3ZM
X-Received: by 2002:a05:600c:1552:b0:42c:b750:1a1e with SMTP id
 5b1f17b1804b1-4318beb62e6mr21588115e9.0.1729784149178; 
 Thu, 24 Oct 2024 08:35:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQIGl94tHwG/Emnz8l7XEWUupX4uA5SZbIzVOXuAA62Ha/Qm5zJGncyBGFc7PBnWa0i/sIYA==
X-Received: by 2002:a05:600c:1552:b0:42c:b750:1a1e with SMTP id
 5b1f17b1804b1-4318beb62e6mr21587895e9.0.1729784148778; 
 Thu, 24 Oct 2024 08:35:48 -0700 (PDT)
Received: from dhcp-64-16.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ee0a5c529sm11567974f8f.62.2024.10.24.08.35.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 08:35:48 -0700 (PDT)
Message-ID: <eb625699d08db636e19c5141f681759849ff4a63.camel@redhat.com>
Subject: Re: [PATCH v2] drm/sched: Mark scheduler work queues with
 WQ_MEM_RECLAIM
From: Philipp Stanner <pstanner@redhat.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: dakr@kernel.org, ltuikov89@gmail.com
Date: Thu, 24 Oct 2024 17:35:47 +0200
In-Reply-To: <20241023235917.1836428-1-matthew.brost@intel.com>
References: <20241023235917.1836428-1-matthew.brost@intel.com>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
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

On Wed, 2024-10-23 at 16:59 -0700, Matthew Brost wrote:
> drm_gpu_scheduler.submit_wq is used to submit jobs, jobs are in the
> path
> of dma-fences, and dma-fences are in the path of reclaim. Mark
> scheduler
> work queue with WQ_MEM_RECLAIM to ensure forward progress during
> reclaim; without WQ_MEM_RECLAIM, work queues cannot make forward
> progress during reclaim.
>=20
> v2:
> =C2=A0- Fixes tags (Philipp)
> =C2=A0- Reword commit message (Philipp)
>=20
> Cc: Luben Tuikov <ltuikov89@gmail.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Philipp Stanner <pstanner@redhat.com>
> Cc: stable@vger.kernel.org
> Fixes: 34f50cc6441b ("drm/sched: Use drm sched lockdep map for
> submit_wq")
> Fixes: a6149f039369 ("drm/sched: Convert drm scheduler to use a work
> queue rather than kthread")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 5 +++--
> =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index 540231e6bac6..df0a5abb1400 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1283,10 +1283,11 @@ int drm_sched_init(struct drm_gpu_scheduler
> *sched,
> =C2=A0=09=09sched->own_submit_wq =3D false;
> =C2=A0=09} else {
> =C2=A0#ifdef CONFIG_LOCKDEP
> -=09=09sched->submit_wq =3D
> alloc_ordered_workqueue_lockdep_map(name, 0,
> +=09=09sched->submit_wq =3D
> alloc_ordered_workqueue_lockdep_map(name,
> +=09=09=09=09=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0
> =C2=A0=C2=A0 WQ_MEM_RECLAIM,
> =C2=A0=09=09=09=09=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0
> =C2=A0=C2=A0 &drm_sched_lockdep_map);
> =C2=A0#else
> -=09=09sched->submit_wq =3D alloc_ordered_workqueue(name, 0);
> +=09=09sched->submit_wq =3D alloc_ordered_workqueue(name,
> WQ_MEM_RECLAIM);
> =C2=A0#endif
> =C2=A0=09=09if (!sched->submit_wq)
> =C2=A0=09=09=09return -ENOMEM;


Cool, thx =E2=80=93 looks good from my POV.

Since you now sent this patch as a single one, what would be the
preferred merge plan for this? Your XE-Series doesn't depend on this
IIUC, so should we take this patch here separately into drm-misc-next?


Regards,
P.

