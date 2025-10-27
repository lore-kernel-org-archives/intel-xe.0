Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0ED8CCF9E0
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 11:03:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A2610E438;
	Mon, 27 Oct 2025 11:03:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RwWC71/r";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B4610E069
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 11:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761563019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hjJGd+xRluh8TvgBIIOUFgfphdYzFcE/H2vX7k9zbLs=;
 b=RwWC71/rUtvY33zJ0vhpOjUJNzwDFpjg3dImhDjg+TvO/1BFkBsa3okxL6zWjALkOPI78L
 aoRbktXaG1PUYdqybTGfnmw3mni3pRR+kEY/GdL3kteUmZEWUOSSpypfSjJL8OBaevROns
 LSct+KlKUdqGtP9r0dNCxeMaqYSlpJA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-416--zJdeFWRPUGakfdqlRAUmg-1; Mon, 27 Oct 2025 07:03:36 -0400
X-MC-Unique: -zJdeFWRPUGakfdqlRAUmg-1
X-Mimecast-MFC-AGG-ID: -zJdeFWRPUGakfdqlRAUmg_1761563015
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-b6d7ad47b58so231524266b.1
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 04:03:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761563015; x=1762167815;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3VOA8iwb+iUQs8ydqbBHXT4w/Fw9C+W1CtV9KYqI4ew=;
 b=AYZ404efYCTZNewzmCBpE/shFhp0QPd/7xhXcAO+3UDax1KbeFYL0+FK2KiEADzTsv
 6AolX5znelBv3V0bZBu1QLDSDySlT+R0daVmK21vPjidhsCP/kchiYJm3PD0TXfzEKCd
 R7R5p9QqoPabkpSEmPRkGga2CsBraU36F05Yl3s3t4Bmy7RSnFkcG6THdSsCuDHtyb6S
 4WsBtPaN7TZ5HGy/iswmWuFcvX8uPw3Z74fYN3InkNbnD+umTJ1EnyqlvbarhI6SiSAP
 voT805oES3gI3AOUr6NvKSdYwVq7fHquqQDSgpBXx5QcdD5EP+JxKHz5NcpkG7RjtI6z
 eCkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/2/8XtQPzEqK1QMUZhY9Rm8WpJnmi0gQACF44ShyoN2IUABSy+w2UxHYJQEwfhmse6AUCeBmC2g==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCmGU2ssOdLAHKj+4sz8RmtUElg/ZePydT1ciT3vm8g929fiLz
 Jw2qghmW/7q//BZRrDvxwIT/Os9o703QX1jEmM9jMhieCN8o3IO6rvRgpF7rqQguwX/2BzZi50V
 1/Z6b0RzL5El0EVfm/9x2kscg8a7gNrERgDpLX7DdW2j83GtYJ/7Lhe255ck5y1txSPSR
X-Gm-Gg: ASbGncvj9YFKucslTryA8jIxlHHpoS1Yx0O1WYHuWyk3hhB4v9j3LL0sUo5Gn/num/Y
 P143ga1eRlEVtst52RYc3vwgCqYeFll60flSr2FPB8GJEMbpos0L/qh7LwDsqv1mcql4SLJbOym
 UOcvgpcaXFYNTQHc1AavENGXBMAAQ4YkoQPd2/ao21CMyNWa4W/Wboox0zhWOwMDDTJZocjFfxa
 0ZSnE0ZcqDBMXg+f8vQwnK4b+vfJXGLAFWF+2NnpY8cUWaEZSQawW2xuXeQI/lvAIjrzKI48wgW
 NLKK91AwRh2PgGn94g7odU0stUI5LxXFCp9riCp8Wa+HYictx8jF4rMDsF/ptr6tyGOhkab3df3
 uZ3n8ew03u4mFi/jGBBk1l5LWDRJoYm5gkNpn4Lr9RIKGJw==
X-Received: by 2002:a17:907:9481:b0:b6d:7231:3276 with SMTP id
 a640c23a62f3a-b6d723137b3mr1153496866b.19.1761563015421; 
 Mon, 27 Oct 2025 04:03:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUFMg6uHtWQ6nsuokdIYUmtrDteINde4b5Wb2IzCEGU0OYXwFstexCQN3pMUgJ+f03YLyzNw==
X-Received: by 2002:a17:907:9481:b0:b6d:7231:3276 with SMTP id
 a640c23a62f3a-b6d723137b3mr1153494666b.19.1761563015048; 
 Mon, 27 Oct 2025 04:03:35 -0700 (PDT)
Received: from ?IPv6:2001:16b8:3d68:200:6e75:6a50:1d0f:8f29?
 ([2001:16b8:3d68:200:6e75:6a50:1d0f:8f29])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d8533e7c6sm715209066b.16.2025.10.27.04.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 04:03:34 -0700 (PDT)
Message-ID: <2336a1282aa6a44f23a9100d2553b8032f44f3bd.camel@redhat.com>
Subject: Re: [RFC PATCH 2/3] drm/sched: Taint workqueues with reclaim
From: Philipp Stanner <pstanner@redhat.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: jiangshanlai@gmail.com, tj@kernel.org, simona.vetter@ffwll.ch, 
 christian.koenig@amd.com, dakr@kernel.org
Date: Mon, 27 Oct 2025 12:03:33 +0100
In-Reply-To: <20251021213952.746900-3-matthew.brost@intel.com>
References: <20251021213952.746900-1-matthew.brost@intel.com>
 <20251021213952.746900-3-matthew.brost@intel.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UuedfIeUG65IcABAarDRfruq0M1CsHwsgFEgWE8AZoI_1761563015
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

On Tue, 2025-10-21 at 14:39 -0700, Matthew Brost wrote:
> Multiple drivers seemingly do not understand the role of DMA fences in
> the reclaim path. As a result,=C2=A0
>=20

result of what? The "role of DMA fences"?

> DRM scheduler workqueues, which are part
> of the fence signaling path, must not allocate memory.
>=20

Should be phrased differently. The actual rule here is "The GPU
scheduler's workqueues can be used for memory reclaim. Because of that,
work items on these queues must not allocate memory."

--

In general, I often read in commits or discussions about this or that
"rule", especially "DMA fence rules", but they're often not detailed
very much.


P.

>  This patch
> teaches lockdep to recognize these rules in order to catch driver-side
> bugs.
>=20
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index c39f0245e3a9..676484dd3ea3 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1368,6 +1368,9 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,=
 const struct drm_sched_init_
> =C2=A0=09atomic64_set(&sched->job_id_count, 0);
> =C2=A0=09sched->pause_submit =3D false;
> =C2=A0
> +=09taint_reclaim_workqueue(sched->submit_wq, GFP_KERNEL);
> +=09taint_reclaim_workqueue(sched->timeout_wq, GFP_KERNEL);
> +
> =C2=A0=09sched->ready =3D true;
> =C2=A0=09return 0;
> =C2=A0Out_unroll:

