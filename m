Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9ABD0C5F8
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 10:07:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC98610EA66;
	Fri, 25 Oct 2024 10:07:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FHxBGhhu";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C53510EA64
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Oct 2024 10:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729850819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RLWF1XI1IRMUF9kLoHorE6VU6nobmlHGWPnEZ9LtnxM=;
 b=FHxBGhhuUmGHeIoCHhnMm8yGDVB1nV9G3qI4A7NvAoh1JvS6CDnayYOafEA3b/iaB5aOWi
 z6LAyLVIMSQod+VsDlQotViu79lofbiCS0Nxt2bUxgfsHz/LVe1psR/Gr/jx1CNZgCRKzk
 9LZnyqbzilCn9H9LKE5iZgKC65zOls8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-X0jKSS2hMdqTExEdi7XJkg-1; Fri, 25 Oct 2024 06:06:55 -0400
X-MC-Unique: X0jKSS2hMdqTExEdi7XJkg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4314c6ca114so13542975e9.1
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Oct 2024 03:06:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729850814; x=1730455614;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zy9d6cD2pxsXmiDYe52XZxncVOlsF2DUWlmfP7V1zlc=;
 b=kF2UmcSemMO8OiDZoSutAeAhpG7NviCsb2Qn+FvQcCL2MiuhHm+JXaLBorDYa8+Z2f
 FLH8fVqDf3EHFyeZVZDM9Yem7+kAZ7aYfprCMEZBatYY4RxJPqLvGukdR2uEBxcrlbwT
 OvfTIfpElD3jqQ5UC6cIZY2y/EUeRW9NwuJZuZwzwxSYy+eSJjqctT30jj3U192dKeXI
 PUV+ihcwWHViSc6S+xvHKHS2QWSnL5V4bo8+vr+K5CJo2RvrL4hsgj5xp87Oo5m7H3e0
 pmSg9bswVakapNuc6LZvg5J3nbvj7K0YnSuBNFbBa6S6f4m+tDm1PlLn24QxeNU69LxN
 Ngkw==
X-Gm-Message-State: AOJu0YwDrxc/h1E2miF0Ldtd9VQA2YftBLsdbbd1zLowQPLGn4fOuRBw
 ZFbqsUYeeN6FGM7UBlDGmmOufROLFnPRZjP9J8++OskMtQXulnZyOwi6i44Xq5LAuUAJtT2+o9A
 uymrXfY2hbpb7s+pyyvo9s6vaBSlcBg4Fa2G6GkQHlZBcDzpHDXimx9gM0HO0w63k
X-Received: by 2002:a05:600c:1d99:b0:431:5f1c:8359 with SMTP id
 5b1f17b1804b1-4318415f41fmr69264115e9.15.1729850814506; 
 Fri, 25 Oct 2024 03:06:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2nTQwQklAfpLsEicMD9X70tr5FanBA8x8M5m/2RYtiWItp61RQimiawap8ngTujHhoMExZQ==
X-Received: by 2002:a05:600c:1d99:b0:431:5f1c:8359 with SMTP id
 5b1f17b1804b1-4318415f41fmr69263955e9.15.1729850814153; 
 Fri, 25 Oct 2024 03:06:54 -0700 (PDT)
Received: from eisenberg.fritz.box
 (200116b82de5ba00738ac8dadaac7543.dip.versatel-1u1.de.
 [2001:16b8:2de5:ba00:738a:c8da:daac:7543])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4317dde7b70sm93585205e9.1.2024.10.25.03.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 03:06:53 -0700 (PDT)
Message-ID: <7da525c6870619301e226e4830e8355d1419a3e1.camel@redhat.com>
Subject: Re: [PATCH v2] drm/sched: Mark scheduler work queues with
 WQ_MEM_RECLAIM
From: Philipp Stanner <pstanner@redhat.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 dakr@kernel.org, ltuikov89@gmail.com
Date: Fri, 25 Oct 2024 12:06:53 +0200
In-Reply-To: <ZxpsAogpxOjU+58p@DUT025-TGLU.fm.intel.com>
References: <20241023235917.1836428-1-matthew.brost@intel.com>
 <eb625699d08db636e19c5141f681759849ff4a63.camel@redhat.com>
 <ZxpsAogpxOjU+58p@DUT025-TGLU.fm.intel.com>
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

On Thu, 2024-10-24 at 15:47 +0000, Matthew Brost wrote:
> On Thu, Oct 24, 2024 at 05:35:47PM +0200, Philipp Stanner wrote:
> > On Wed, 2024-10-23 at 16:59 -0700, Matthew Brost wrote:
> > > drm_gpu_scheduler.submit_wq is used to submit jobs, jobs are in
> > > the
> > > path
> > > of dma-fences, and dma-fences are in the path of reclaim. Mark
> > > scheduler
> > > work queue with WQ_MEM_RECLAIM to ensure forward progress during
> > > reclaim; without WQ_MEM_RECLAIM, work queues cannot make forward
> > > progress during reclaim.
> > >=20
> > > v2:
> > > =C2=A0- Fixes tags (Philipp)
> > > =C2=A0- Reword commit message (Philipp)
> > >=20
> > > Cc: Luben Tuikov <ltuikov89@gmail.com>
> > > Cc: Danilo Krummrich <dakr@kernel.org>
> > > Cc: Philipp Stanner <pstanner@redhat.com>
> > > Cc: stable@vger.kernel.org
> > > Fixes: 34f50cc6441b ("drm/sched: Use drm sched lockdep map for
> > > submit_wq")
> > > Fixes: a6149f039369 ("drm/sched: Convert drm scheduler to use a
> > > work
> > > queue rather than kthread")
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > > =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 5 +++--
> > > =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > index 540231e6bac6..df0a5abb1400 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > @@ -1283,10 +1283,11 @@ int drm_sched_init(struct
> > > drm_gpu_scheduler
> > > *sched,
> > > =C2=A0=09=09sched->own_submit_wq =3D false;
> > > =C2=A0=09} else {
> > > =C2=A0#ifdef CONFIG_LOCKDEP
> > > -=09=09sched->submit_wq =3D
> > > alloc_ordered_workqueue_lockdep_map(name, 0,
> > > +=09=09sched->submit_wq =3D
> > > alloc_ordered_workqueue_lockdep_map(name,
> > > +=09=09=09=09=09=09=09=09=C2=A0
> > > =C2=A0=C2=A0=C2=A0
> > > =C2=A0=C2=A0 WQ_MEM_RECLAIM,
> > > =C2=A0=09=09=09=09=09=09=09=09=C2=A0
> > > =C2=A0=C2=A0=C2=A0
> > > =C2=A0=C2=A0 &drm_sched_lockdep_map);
> > > =C2=A0#else
> > > -=09=09sched->submit_wq =3D alloc_ordered_workqueue(name,
> > > 0);
> > > +=09=09sched->submit_wq =3D alloc_ordered_workqueue(name,
> > > WQ_MEM_RECLAIM);
> > > =C2=A0#endif
> > > =C2=A0=09=09if (!sched->submit_wq)
> > > =C2=A0=09=09=09return -ENOMEM;
> >=20
> >=20
> > Cool, thx =E2=80=93 looks good from my POV.
> >=20
>=20
> Can I get a RB?

Oh, sure:

Reviewed-by: Philipp Stanner <pstanner@redhat.com>

>=20
> > Since you now sent this patch as a single one, what would be the
> > preferred merge plan for this? Your XE-Series doesn't depend on
> > this
> > IIUC, so should we take this patch here separately into drm-misc-
> > next?
> >=20
>=20
> Merge this one to drm-misc and we will backport into drm-xe-next.

OK =E2=80=93 feel free to apply it yourself if you want, then we wouldn't n=
eed
to synchronize

Philipp

>=20
> Matt
>=20
> >=20
> > Regards,
> > P.
> >=20
>=20

