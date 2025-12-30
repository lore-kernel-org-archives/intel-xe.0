Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A832FEE0215
	for <intel-xe@archiver.kernel.org>; Tue, 30 Dec 2025 15:43:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F23510E522;
	Tue, 30 Dec 2025 15:43:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="NNXqtuFH";
	dkim-atps=neutral
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15AB210E919
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Dec 2025 15:43:04 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-595825c8eb3so10216678e87.0
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Dec 2025 07:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1767109382; x=1767714182; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UuyGl/AZyQjVQCbBt2jNVWaKpqTC2aRWnYus6/cTMyo=;
 b=NNXqtuFHhX/RciLxSOU8WO4NWw9X6Oiy1WcU9FuKWNI1GDSUKGW/r09fmf3vPADu2i
 qWEtnAVpnHcJSXR0wGd/ek7cwwx9HelwbSoIAzO0McW9dCVacFtf6LMKOvHSXQlSRM+s
 39zX/VGqWlBRwBd5Hsjl6UVP1mte7aU3xNs5FLqBKmbfXK2waZAvJRszJwuvx5vdny1t
 IsoNaHneiwn6CTUDkp15jjO1U+J1omxxu2PHIkI0WkimQak2KM5t1yF4iMqZCp1lorMF
 LfZBsX5jIoYcIARzGPCp0AgXwQC3EboYxDNuDBB/cYR5UFtRooDT/5NTByClKJn/F9eA
 A0kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767109382; x=1767714182;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UuyGl/AZyQjVQCbBt2jNVWaKpqTC2aRWnYus6/cTMyo=;
 b=Yds/Er48Z1QDmBOvsY5VD+zJpL3EM8wLjnOHBWq5w3ut6H7oBBhGDT2+6amAy/5xOP
 wlJ89HuSsg9I6cjlyc+CRFkn8/MLUJZzXYvX596wLLxCf5Tpx2UUA4lfl8MSmDK08Qnz
 SD2chJ8cVwPH5oBcd0K1MMtqXFQOMsFH73PBSysE+7U1krP0hPWCz7hClVt4U/Fd1TI4
 5FeOOY2Bf614GZ6CLEpADPeoDY7Le/rkkWh0ZcXtzZjITCnwYAFhwIZGFX3ZTsuV1aom
 +pj7u9U1vGdhO8TAGBfyFTr890vAA1GCmhXZ+s2grcC4tnB96UZud0i90yskCFBEyP0C
 mL2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXR7xAsUyZPZqLmmgzq85FTFawk/t76YRVIJkg5E7v6k8LR/OWJgez62gj2/bhgC6bhSR+4+uEzdQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+CSi/Hs61h+CumNcb9M7YmSVZTug8CmEKoi6sUMKpGwv8A+99
 nSJxWwuD6lOxh0+WBgfbZMYSM7/t0U8K2OTmtW3Fy+IsAkghG67/T0IN2UbglJ9u3FzRX2ICTNw
 tHsYBf1xfI4nT1BwNJey+lgwrrhyR8vQJHBkJiaOcDQ==
X-Gm-Gg: AY/fxX7zdo9m98wpQWR9ykavgX1uOS5jeKdBYre6+WujHsd0WF1PO8l1FSm5Rnkaeii
 VR17OOwtxTeDqiqUQ9LxuF7Tt7EqcoeTJNTLyZlJnulvITNwyDdBFwBO7bz6EPyoqLX+4XkA+u9
 rv/klUlFTTF6+y40759Jx03/nXze8ADkZNOMgf9vpTfy1DMBdgqWkRbh8qz5JS3q8F3SnuiQK4K
 Pvy9IZj58x8V04J9Ezk5KEwJtd8Y8npSzqsdYGgc/PHMMfov3yQ7ejNDzontbxpB1oQGdp7DoIB
 YxWgppskHYSCN43rNm2GACtb1IQa
X-Google-Smtp-Source: AGHT+IEiOszR/dmQ0W8nUyVU4uBq5XZYn2gxKvCzyxC/HCbTuL0COEdCVgq6omNZBz4cUy/uqnELRTwGsOtKMT1/IoE=
X-Received: by 2002:a05:6512:1591:b0:595:8350:5812 with SMTP id
 2adb3069b0e04-59a17d4c7b9mr9199283e87.36.1767109382190; Tue, 30 Dec 2025
 07:43:02 -0800 (PST)
MIME-Version: 1.0
References: <20251224160026.124106-1-marco.crivellari@suse.com>
 <aUwwunqiFw3YdKUo@lstrano-desk.jf.intel.com>
In-Reply-To: <aUwwunqiFw3YdKUo@lstrano-desk.jf.intel.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Tue, 30 Dec 2025 16:42:51 +0100
X-Gm-Features: AQt7F2poId7AdIkEB8ZF9b6jvFxVwtgIxfRSZm5wlbmusfrccxCifnR4zP7eTFs
Message-ID: <CAAofZF7H_sPKh=oG7C=fN-mtevZjZ038DjOL0rwDVuOib9p4Dw@mail.gmail.com>
Subject: Re: [PATCH] drm/xe: Replace use of system_wq with system_percpu_wq
To: Matthew Brost <matthew.brost@intel.com>
Cc: linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>, 
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
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

On Wed, Dec 24, 2025 at 7:28=E2=80=AFPM Matthew Brost <matthew.brost@intel.=
com> wrote:
> [...]
> >  drivers/gpu/drm/xe/xe_tlb_inval.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_=
tlb_inval.c
> > index 918a59e686ea..b2cf6e17fbc5 100644
> > --- a/drivers/gpu/drm/xe/xe_tlb_inval.c
> > +++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
> > @@ -94,7 +94,7 @@ static void xe_tlb_inval_fence_timeout(struct work_st=
ruct *work)
> >               xe_tlb_inval_fence_signal(fence);
> >       }
> >       if (!list_empty(&tlb_inval->pending_fences))
> > -             queue_delayed_work(system_wq, &tlb_inval->fence_tdr,
> > +             queue_delayed_work(system_percpu_wq, &tlb_inval->fence_td=
r,
>
> Actually system_wq or system_percpu_wq doesn't work here as this is the
> fence signaling path. We should use one Xe's ordered work queues which
> is properly setup to be reclaim same.

Hi,

So only for this specific workqueue we should use for example this, instead=
:

462     /** @ordered_wq: used to serialize compute mode resume */
463     struct workqueue_struct *ordered_wq;

I noticed this has been allocated using:

 490     xe->ordered_wq =3D alloc_ordered_workqueue("xe-ordered-wq", 0);

Using alloc_ordered_workqueue() makes this workqueue to be unbound.

569 #define alloc_ordered_workqueue(fmt, flags, args...)            \
570     alloc_workqueue(fmt, WQ_UNBOUND | __WQ_ORDERED | (flags), 1, ##args=
)

So this patch should be split in 2:
- 1 patch with Xe's ordered workqueue, changing the behavior to
unbound "implicitly"
- 1 patch changing system_wq with the new per-cpu wq (system_percpu_wq).

To keep this workqueue per-cpu we can use xe->unordered_wq, that makes use =
of
alloc_workqueue() without specifying flags (eg. WQ_UNBOUND or the new
WQ_PERCPU),
making this workqueue per-cpu.

Would this sound reasonable to you?

Thanks!
--=20

Marco Crivellari

L3 Support Engineer
