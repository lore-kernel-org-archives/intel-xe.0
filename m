Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE65D2C55E
	for <intel-xe@archiver.kernel.org>; Tue, 22 Oct 2024 14:19:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4A110E698;
	Tue, 22 Oct 2024 14:19:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DqnxunAj";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C92F610E698
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Oct 2024 14:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729606763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y98CrFQDkXNy/UAa9BjJgvPTjzbP0v4IYXWhWTBzEbE=;
 b=DqnxunAjXk8qT0RffSLgud9vNljv9Lzq0/zfjtHJnFMVYIZTMdXB+D0lZH88eNesOh5qVd
 xIaxcGV1lbxYt6n5z7FWYZjUd5XSrrmeX6PR+no7K2EWsX9cYV5dNVv9kykpnpr4k4fu1W
 dELGbylJ5GkCHeVl5hti8nbk0Sz8eg8=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-lkrIb2eDNnycgf9SIAVCGQ-1; Tue, 22 Oct 2024 10:19:21 -0400
X-MC-Unique: lkrIb2eDNnycgf9SIAVCGQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7b14073eabdso317637385a.3
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Oct 2024 07:19:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729606761; x=1730211561;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y98CrFQDkXNy/UAa9BjJgvPTjzbP0v4IYXWhWTBzEbE=;
 b=Fx8uLyHI+LGkBrUs/qx4R+GHibpVzujURJCzbsYDC4+Wh4QqrIyuTJ6oD/c+qzxxBL
 NViXPxTle2xoms1a5SDZHFGgG34Y1DDg5TgbSHB78HPYcEQmfRyqHf4BAuo+Pu+4W0h9
 ahejX+CHeSWv8D7OcIQV30VKetLndhV3sanYSmOJbSuJdbiVHsnq0tlWG9O2Kbipgwf1
 byrh92f1RitGas8J9GvLvhaTe6JQpZ8p1DGXIfKu2sMrHMGsLhXYlTNhssxE6QgQIFfh
 A6uNKvy5NrwXeXIlhszfovp0uHmXVcemdn44huKkWPezF83yvvBT9+Og/HldYc8kJZoJ
 XVfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzyRjUti+toibvxc+UESKJylIvjr5eKdFWk2AyGO3jaGzf53p3xX9BqL2MDVyjqN3mFdoiJ5PVeQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywxdkt/MVruRQDif9zl0Hf8pnXMqlo1i8rBrLYLzm4QV2W1z8T/
 Dn1E3lNHqh8dOQNuhwQktLxuUx/JTxybd2Ddn+RCmlXouGCKvtsYGemMBs/ZTRecT4ydgCGxdz+
 REdn66uW603uoeW86/Y8sckcrckIJSJpOIxki14oisuj43J/+x0uFjImMRzQhYX0u
X-Received: by 2002:a05:620a:1a28:b0:7b1:49ae:ee04 with SMTP id
 af79cd13be357-7b157b66f59mr1786854385a.26.1729606761068; 
 Tue, 22 Oct 2024 07:19:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEY8/mopR2C491/PNaDbJE7YMzIVfSCkHtU+lG8+iK/YoPd6tqBhKTvET36l9kMpOvhnmevbA==
X-Received: by 2002:a05:620a:1a28:b0:7b1:49ae:ee04 with SMTP id
 af79cd13be357-7b157b66f59mr1786851785a.26.1729606760611; 
 Tue, 22 Oct 2024 07:19:20 -0700 (PDT)
Received: from dhcp-64-16.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b165a71023sm283242385a.105.2024.10.22.07.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2024 07:19:20 -0700 (PDT)
Message-ID: <a5dd3b1d6b8da184ed16f5653faca95163b79340.camel@redhat.com>
Subject: Re: [PATCH 1/4] drm/sched: Mark scheduler work queues with
 WQ_MEM_RECLAIM
From: Philipp Stanner <pstanner@redhat.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: dakr@kernel.org, Luben Tuikov <ltuikov89@gmail.com>
Date: Tue, 22 Oct 2024 16:19:18 +0200
In-Reply-To: <20241021175705.1584521-2-matthew.brost@intel.com>
References: <20241021175705.1584521-1-matthew.brost@intel.com>
 <20241021175705.1584521-2-matthew.brost@intel.com>
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

On Mon, 2024-10-21 at 10:57 -0700, Matthew Brost wrote:
> DRM scheduler work queues are used to submit jobs, jobs are in the
> path

"scheduler work queues" is very generic, how about
"drm_gpu_scheduler.submit_wq is used to submit jobs, [...]"

> or dma-fences, and dma-fences are in the path of reclaim. Mark

s/or/of

> scheduler
> work queues with WQ_MEM_RECLAIM so these work queues can continue to
> make forward progress during reclaim.

It is just *one* queue (per scheduler) really, isn't it?

If the change above is applied, could just say: "Create the work queue
with WQ_MEM_RECLAIM so it can continue [...]"

So for my understanding: is this a performance optimization or is it a
bug? IOW, would forward progress just be delayed or entirely prevented?
Would be cool to state that a bit more clearly in the commit message.

Work-queue docu says "MUST":

``WQ_MEM_RECLAIM`` All wq which might be used in the memory reclaim
paths **MUST** have this flag set. The wq is guaranteed to have at
least one execution context regardless of memory pressure.

So it seems to me that this fixes a bug? Should it be backported in
your opinion?


>=20
> Cc: Luben Tuikov <ltuikov89@gmail.com>

btw., how did you send this email? I couldn't find Luben on CC. Added
him.

Thx,
P.

> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Philipp Stanner <pstanner@redhat.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index 6e4d004d09ce..567811957c0f 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1275,10 +1275,10 @@ int drm_sched_init(struct drm_gpu_scheduler
> *sched,
> =C2=A0 sched->own_submit_wq =3D false;
> =C2=A0 } else {
> =C2=A0#ifdef CONFIG_LOCKDEP
> - sched->submit_wq =3D alloc_ordered_workqueue_lockdep_map(name, 0,
> + sched->submit_wq =3D alloc_ordered_workqueue_lockdep_map(name,
> WQ_MEM_RECLAIM,
> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &drm_sched_lockdep_map);
> =C2=A0#else
> - sched->submit_wq =3D alloc_ordered_workqueue(name, 0);
> + sched->submit_wq =3D alloc_ordered_workqueue(name, WQ_MEM_RECLAIM);
> =C2=A0#endif
> =C2=A0 if (!sched->submit_wq)
> =C2=A0 return -ENOMEM;

