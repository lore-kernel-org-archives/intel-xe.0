Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5635DCD37BE
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 14:41:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C8A10E7B2;
	Mon, 11 May 2026 14:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JtcCKlmk";
	dkim-atps=neutral
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com
 [209.85.221.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8750110E1C0
 for <intel-xe@lists.freedesktop.org>; Fri,  8 May 2026 06:48:39 +0000 (UTC)
Received: by mail-vk1-f180.google.com with SMTP id
 71dfb90a1353d-575602688deso550787e0c.1
 for <intel-xe@lists.freedesktop.org>; Thu, 07 May 2026 23:48:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778222918; cv=none;
 d=google.com; s=arc-20240605;
 b=kTwxmbIrfGlAJgCMx5EBw86QyJbIoV1bbkPcKrirL8i1mNgNqG1ofW2cAL0+rhTSrR
 6xgi5T1Ils2ZghlAiB0AS57KwLzKaQgtogGGrCSLHE5I6buWSoL6cGSU7888bEcqLmWa
 luCcABDeJIXWBqU8XCxh4Xg4qL9FJqXOu819BJr40Rw2diWPsdQpbJtfadk1G17Ks98a
 TfVyzX56upI3NRdqCLgs3BAlxWwscBu/jxHWV0s1q9Bh/g7/aZGzc+thw5guhTnOBevV
 HuAAGvIz3H2CVyAADwXHTEVbstOgMQkIJXjU43Yp/U23JENJlNJwGDaPr4Z37YwD9p3s
 Qc8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=PlYtjNBoIg67o0Kg+ur2eEMfxgNBWO5gDdNf6ayVmuQ=;
 fh=5rdAm7ayLNz/ieRGY4M0Pw1DDMrqF0QSGiKuATF7Qp4=;
 b=OMsEaDuEKjlqULHErL19EjdDaOoFK1gVc0As+5vRcFZ9vqNF4jYk7aCRXPfIYI/8t0
 wCyG/LX8s+I3uWOoybXd8Df2Hgve+HeDGQRgtU6h1JpnXDfHUxaVE+Ri3bNWmnGI0VZu
 DDC198yqOub+xP7DAiOgDYYuwFwnRkW3fmf4ote5OhK3m521EuKl+aeWMm2QZGmTi+q1
 wzFusJfUNW8dy2k5VdodI6ENaBv0kwS1Jw+D7nc4BjipFVtD6lMMTOZX7E74+sk58aA6
 GE7dIH14N6Pp7RofoD8xaIOEQ8qLIJRlycj72wm4JaezEmmv2/IbeFvGmj7hqABQW/hR
 MkRw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778222918; x=1778827718; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PlYtjNBoIg67o0Kg+ur2eEMfxgNBWO5gDdNf6ayVmuQ=;
 b=JtcCKlmkUlX956Co5Z66Q8YnvMz/hGVppgjHPlwUYmmxAdt0mwQ16oy0DLytBxAn2o
 SpZshPVlTLuCdV+oniFUz1tdwCVJiKWmvQ2W3WKt7cbMIkiZ4WSlT1HDIpTqRrOQbgRF
 D1Y0h7w0F+LSvShm+xXmZz7hjnPpNRAJLtATYSoX3w2G5to+nq6REgu0bw9eyzlyu8DN
 4AD/y5hVcCLbuJR+8eJasXgvSz3bJP7ZI0U0jSgtPeQCZF0qWj6rb2yJZIr05y8XEGG2
 f53uqQP3jNwdfaTEEvWoAWZJRQUGxN0qYAQQbfdzfTjvgXMTYn3+zHFVTdvzUNdmYpvB
 ghEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778222918; x=1778827718;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PlYtjNBoIg67o0Kg+ur2eEMfxgNBWO5gDdNf6ayVmuQ=;
 b=Jjk9SksLTnsFF4g/8eOuXNI/jAS6HpE1r55XdRC2R4teHQQKpgo4PZKUYlRlzCsTWU
 R6LBTh70Vs7tOEiIcUFeQVmfeK0jI3fHBndCToL7kzlxERbOUojgpM9rNiRktabuk0mH
 Zh7TY/v0lB90q678pCSumle9aHrJ4HQrJ1yR9q2+q6b6rFVKv3ljc//xJVxDrMIOlXec
 Nv8PvrYeRtY0Quabu/EF7xpwnm6iKkJmSCq68cWubvXrKBgo6ADcZ+rRTDJ1dFvivlVw
 Rt3EqPJS5UpaKGyGb7Ze5TH2T2TI9X5S8Q3xcq7m/6VyR7gvtdsjWtszdCLbuFul6oaz
 dGdg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+RTymdu2DTR0/5Cj47l+nBPAPQnRukp07O/l54dkYJkLyhuzzjggRFOGwoWsL1GGVH4Wg1Zf+XNw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbupksdvgnXiKu7WLzl8MxdJMryeCNZsWkvoexhrb6eEFEBzDN
 qVkMq9IzowISLkX1TAutJ5/COBYuESEtvfbsxOP4Ie4/gI4SaVgl917VLklnA5En1iKe/wpZoQ/
 +v48wCg5tPizPRGoodqRm1v/WgIufcw==
X-Gm-Gg: Acq92OFR5TatDb4zLHkXYm7OP2UqPM2mapca3xenaULms/gJ02bH4PCRSRvKDXpkSQ2
 I8C5KGX133t8tQO+1tPPWXUbcedh9Km+Dk4IlxS4HZ9vmK33AO18l/kvFrQ/lyJK44vHiY1vEmY
 yveYpw7i83In0JZE5a7KlYkIoP10vPq0Rk437pwfdReYujvPFyN1qUUYF5X+7H6BBHQE6Hnt0xJ
 53xLZ30r4YvIfWT90c9hq2SXDDIRg5KDuhV/NIwDpu/959IGzaYzGOpcCJL+ze/tg1cJMA3ID9U
 AxUcAwBLpYKOvK22aYlg3hk4lhnNqxfUvS0wzsZB
X-Received: by 2002:a05:6122:1b8f:b0:56f:6d11:b962 with SMTP id
 71dfb90a1353d-575593b49e7mr6099620e0c.2.1778222918094; Thu, 07 May 2026
 23:48:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260507055352.61017-1-adhikari.resume@gmail.com>
 <8bad8080780f3a1c2c45cc1385322edf09284414.camel@linux.intel.com>
 <afyhiigGVX3skCfF@gsse-cloud1.jf.intel.com>
In-Reply-To: <afyhiigGVX3skCfF@gsse-cloud1.jf.intel.com>
From: Ramesh Adhikari <adhikari.resume@gmail.com>
Date: Fri, 8 May 2026 12:18:26 +0530
X-Gm-Features: AVHnY4Jg5ClrapY2lCPUaUxnqA7l_ozgRBzQN6dwp_dL-l4wXRzx-bvdqR2AQfw
Message-ID: <CAC-THR-bZD8s0Pcs=ezyirUk7L-3O+YiLsj_TY0V0jyA46ok1Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/xe: Add bounds check for num_binds to prevent
 memory exhaustion
To: Matthew Brost <matthew.brost@intel.com>
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com, 
 stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 11 May 2026 14:41:03 +0000
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

Hi Matthew,



When I was tracing through the code, I found that vm_bind_ioctl_ops_create
allocates about 160 bytes per bind (drm_gpuva_ops + xe_vma_op) in the loop,
and those allocations use GFP_KERNEL without __GFP_ACCOUNT. That's separate
from the main arrays you already have protected with __GFP_ACCOUNT.

At 2048 binds that's only 320KB unaccounted, which is why I thought it was
safe to start conservative. But you're right - at 64k binds it would still
only be about 10MB unaccounted, which is probably fine and won't force
unnecessary fallbacks.

Should I send a v4 with 64k? Or do you think the loop allocations I found
need a different approach?

Thanks,
Ramesh

On Thu, May 7, 2026 at 7:58=E2=80=AFPM Matthew Brost <matthew.brost@intel.c=
om> wrote:
>
> On Thu, May 07, 2026 at 08:47:07AM +0200, Thomas Hellstr=C3=B6m wrote:
> > On Thu, 2026-05-07 at 11:23 +0530, Ramesh Adhikari wrote:
> > > The xe_vm_bind_ioctl function accepts user-controlled num_binds
> > > without
> > > bounds checking, allowing arbitrarily large memory allocations. This
> > > follows the same vulnerability pattern that was fixed for num_syncs
> > > in
> > > commit 8e461304009d ("drm/xe: Limit num_syncs to prevent huge
> > > allocations").
> > >
> > > Add DRM_XE_MAX_BINDS (2048) limit and validate num_binds before
> > > allocation.
> > >
> > > v2: Increased limit from 1024 to 2048 based on Mesa source analysis:
> > >     - Mesa's maximum usage: 960 binds (conformance test dEQP-VK)
> > >     - Confirmed by Intel Mesa developer in commit ba6bbdc
> >
> > Please use the standard way of referring to commits.
> >
> > This is the maximum usage in the conformance suite. That commit does
> > not mention maximum usage for applications in the wild, for which we
> > can't have any regressions.
> >
>
> I still think 1k, 2k to artifically too low. The Vk interface for array
> of binds doesn't have a limit nor do sync interface either. In case of
> sync I believe we found a typical max usage of of something like 10 but
> set artifical limit to 1k just be paranoid. I'd up the limit beyond 1k
> or 2k to prevent seemly valid use cases from forcing a split fallback in
> user space. Even if each individual bind maps to 4k internal (usually
> this just a handfull of bytes for the PTE writes) - 2k binds would 8M of
> temporary memory. Ofc we can increase this future but I really don't see
> the downside of starting with something larger now.
>
> Matt
>
> >
> > >     - 2048 provides 2.13x safety margin while limiting allocation to
> > > 64KB
> > >     - Prevents unbounded allocation (attacker could send 268M binds =
=3D
> > > 18.8GB)
> >
> > Referring to my previous email, it actually looks like most if not all
> > allocations in this path use __GFP_ACCOUNT | __GFP_RETRY_MAYFAIL |
> > __GFP_NOWARN, Did you actually verify that a malicious bind
> > significantly can exceed the cgroup limits?
> >
> >
> > >
> > > Cc: stable@vger.kernel.org
> > >
> > > Signed-off-by: Ramesh <adhikari.resume@gmail.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_vm.c | 5 +++++
> > >  include/uapi/drm/xe_drm.h  | 1 +
> > >  2 files changed, 6 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index a717a2b8dea..1ff66874f43 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -3841,6 +3841,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> > > void *data, struct drm_file *file)
> > >             return -EINVAL;
> > >
> > >     err =3D vm_bind_ioctl_check_args(xe, vm, args, &bind_ops);
> > > +
> > > +   if (XE_IOCTL_DBG(xe, args->num_binds > DRM_XE_MAX_BINDS)) {
> > > +           err =3D -EINVAL;
> >
> > If we end up concluding that this is indeed needed, we should return
> > -ENOBUFS here to trigger a graceful retry.
> >
> > Thanks,
> > Thomas
> >
> >
> > > +           goto put_vm;
> > > +   }
> > >     if (err)
> > >             goto put_vm;
> > >
> > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > index ae2fda23ce7..e666b73c81d 100644
> > > --- a/include/uapi/drm/xe_drm.h
> > > +++ b/include/uapi/drm/xe_drm.h
> > > @@ -1606,6 +1606,7 @@ struct drm_xe_exec {
> > >     __u32 exec_queue_id;
> > >
> > >  #define DRM_XE_MAX_SYNCS 1024
> > > +#define DRM_XE_MAX_BINDS 2048
> > >     /** @num_syncs: Amount of struct drm_xe_sync in array. */
> > >     __u32 num_syncs;
> > >
