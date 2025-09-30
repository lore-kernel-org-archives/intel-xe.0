Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CAACCA468
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 15:09:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3609310E5F9;
	Tue, 30 Sep 2025 15:09:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="xHSqQ+l3";
	dkim-atps=neutral
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com
 [209.85.215.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 666B910E5F7
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 15:09:04 +0000 (UTC)
Received: by mail-pg1-f202.google.com with SMTP id
 41be03b00d2f7-b5a013bc46dso2594386a12.1
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 08:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1759244944; x=1759849744;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=7ODp4hXf78r1NKAjPiKA6rGoEALXfFCwoofnk7fPCbI=;
 b=xHSqQ+l3Ar3yufjpEBVCqGzqODJ2NJbWCU7rj/4kei7HUp/24ImC4WmewSiwkQfAZF
 kSkvho/9XFJV/HNZ+axbq05wRLrg7vxKncqE362/DVNOuMgPpdi5qFJAMc0cFoVObqqD
 /E2WKYCM12tO3pGnMe1EmzaQ712q3immjqxnGHEEpi6NCmuHNGvxp9ShvS7iBFvo5I6a
 Kk25gnGIv4Pt2F0U3lxdk0ZubjR3jZVc+1MdOmvFrxGlGoQMEWizZf21Vj6+zjzwhxXi
 KRTCmSUfr2R4QxzbWdaZgd/0Uj4KaHy28wAWbgHs6ZVUHX3SMmgoO/s6Nef/g6LHKBqV
 9rQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759244944; x=1759849744;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=7ODp4hXf78r1NKAjPiKA6rGoEALXfFCwoofnk7fPCbI=;
 b=hmqKNrU1jOsD7jQUUtvQ/R+wpSLgQLKQzIeAL9zYQjAquXbHnVDhL5WeJJvZqFL+1a
 EMKfyZ7LwBN5Nb2qIaZBiqnXVCnJGJwyvLuKbvSlQMw6aHrxuhO+6EIMkJWUcr3sgb9s
 TIoIJzWfhU2lLLYKivIWX92495J+BcOgrH75MQ9MxojXpkIXHRwGuCb6RgwQT4/rOC1o
 mUBDD783VsHkd0orRoEiX9EXigRMsB4f7J/pbgz8s3oeE0wJZ3gPKC2egwRNb+0bXjT6
 7sxH1H8qwYFBieZqoHdhZU71Qr7JvSkkcsLna1PXRTVsBteqJpl1SlpkSl8dA65lbMUm
 8ibw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVExNY//x+DqAfk3Yam1Yz5qoJ3/uxl6cSXsaCI71vQrhFx2dZeYXmDtQH7MtUEx8MEYl/dv+WyVQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvrmvbH9bPCLG4VdfHg3qAUOc8JM+8SMr4a4r8Jsz3PdYx9Eml
 JlkY/kXJatg0/dV/itqXlrpbdkYEmCCD12xw5wvHXesjV1C9PGI09oAOL98Duz2GpBwY2lZbdqE
 8wqLRxA==
X-Google-Smtp-Source: AGHT+IHxOlAKDce6G3e7ntXQKt1wX4suXvuZZH7i/V1r3vdMpd8L8snRXlRR+/0n5jye/ZH4eRkU+hrWbKw=
X-Received: from pjrv6.prod.google.com ([2002:a17:90a:bb86:b0:329:f232:dac7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3e85:b0:31f:5ebe:fa1c
 with SMTP id 98e67ed59e1d1-3342a7ba512mr24538137a91.0.1759244943821; Tue, 30
 Sep 2025 08:09:03 -0700 (PDT)
Date: Tue, 30 Sep 2025 08:09:02 -0700
In-Reply-To: <25af94f5-79e3-4005-964e-e77b1320a16e@linux.intel.com>
Mime-Version: 1.0
References: <70b64347-2aca-4511-af78-a767d5fa8226@intel.com>
 <25af94f5-79e3-4005-964e-e77b1320a16e@linux.intel.com>
Message-ID: <aNvyjkuDLOfxAANd@google.com>
Subject: Re: REGRESSION on linux-next (next-20250919)
From: Sean Christopherson <seanjc@google.com>
To: Dapeng Mi <dapeng1.mi@linux.intel.com>
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
 Suresh Kumar Kurmi <suresh.kumar.kurmi@intel.com>,
 Jani Saarinen <jani.saarinen@intel.com>, 
 lucas.demarchi@intel.com, linux-perf-users@vger.kernel.org, 
 kvm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
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

On Tue, Sep 30, 2025, Dapeng Mi wrote:
>=20
> On 9/30/2025 1:30 PM, Borah, Chaitanya Kumar wrote:
> > Hello Sean,
> >
> > Hope you are doing well. I am Chaitanya from the linux=C2=A0graphics te=
am in=20
> > Intel.
> >
> > This mail is regarding a regression we are seeing in our CI runs[1] on
> > linux-next repository.
> >
> > Since the version next-20250919=C2=A0[2], we are seeing the following r=
egression
> >
> > ```````````````````````````````````````````````````````````````````````=
``````````
> > <4>[   10.973827] ------------[ cut here ]------------
> > <4>[   10.973841] WARNING: arch/x86/events/core.c:3089 at=20
> > perf_get_x86_pmu_capability+0xd/0xc0, CPU#15: (udev-worker)/386
> > ...
> > <4>[   10.974028] Call Trace:
> > <4>[   10.974030]  <TASK>
> > <4>[   10.974033]  ? kvm_init_pmu_capability+0x2b/0x190 [kvm]
> > <4>[   10.974154]  kvm_x86_vendor_init+0x1b0/0x1a40 [kvm]
> > <4>[   10.974248]  vmx_init+0xdb/0x260 [kvm_intel]
> > <4>[   10.974278]  ? __pfx_vt_init+0x10/0x10 [kvm_intel]
> > <4>[   10.974296]  vt_init+0x12/0x9d0 [kvm_intel]
> > <4>[   10.974309]  ? __pfx_vt_init+0x10/0x10 [kvm_intel]
> > <4>[   10.974322]  do_one_initcall+0x60/0x3f0
> > <4>[   10.974335]  do_init_module+0x97/0x2b0
> > <4>[   10.974345]  load_module+0x2d08/0x2e30
> > <4>[   10.974349]  ? __kernel_read+0x158/0x2f0
> > <4>[   10.974370]  ? kernel_read_file+0x2b1/0x320
> > <4>[   10.974381]  init_module_from_file+0x96/0xe0
> > <4>[   10.974384]  ? init_module_from_file+0x96/0xe0
> > <4>[   10.974399]  idempotent_init_module+0x117/0x330
> > <4>[   10.974415]  __x64_sys_finit_module+0x73/0xe0
> > ...
> > ```````````````````````````````````````````````````````````````````````=
``````````
> > Details log can be found in [3].
> >
> > After bisecting the tree, the following patch [4] seems to be the first=
=20
> > "bad" commit
> >
> > ```````````````````````````````````````````````````````````````````````=
``````````````````````````````````
> >  From 51f34b1e650fc5843530266cea4341750bd1ae37 Mon Sep 17 00:00:00 2001
> >
> > From: Sean Christopherson <seanjc@google.com>
> >
> > Date: Wed, 6 Aug 2025 12:56:39 -0700
> >
> > Subject: KVM: x86/pmu: Snapshot host (i.e. perf's) reported PMU capabil=
ities
> >
> > Take a snapshot of the unadulterated PMU capabilities provided by perf =
so
> > that KVM can compare guest vPMU capabilities against hardware capabilit=
ies
> > when determining whether or not to intercept PMU MSRs (and RDPMC).
> > ```````````````````````````````````````````````````````````````````````=
``````````````````````````````````
> >
> > We also verified that if we revert the patch the issue is not seen.
> >
> > Could you please check why the patch causes this regression and provide=
=20
> > a fix if necessary?
>=20
> Hi Chaitanya,
>=20
> I suppose you found this warning on a hybrid client platform, right? It
> looks the warning is triggered by the below=C2=A0WARN_ON_ONCE()=C2=A0in
> perf_get_x86_pmu_capability() function.
>=20
> =C2=A0 if (WARN_ON_ONCE(cpu_feature_enabled(X86_FEATURE_HYBRID_CPU)) ||
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 !x86_pmu_initialized()) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(cap, 0, sizeof(*cap));
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
> =C2=A0 =C2=A0 }
>=20
> The below change should fix it (just building, not test it). I would run =
a
> full scope vPMU test after I come back from China national day's holiday.

I have access to a hybrid system, I'll also double check there (though I'm =
99.9%
certain you've got it right).

> Thanks.
>=20
> diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
> index cebce7094de8..6d87c25226d8 100644
> --- a/arch/x86/kvm/pmu.c
> +++ b/arch/x86/kvm/pmu.c
> @@ -108,8 +108,6 @@ void kvm_init_pmu_capability(struct kvm_pmu_ops *pmu_=
ops)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool is_intel =3D boot_cpu_data.x86_vendor =
=3D=3D X86_VENDOR_INTEL;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 int min_nr_gp_ctrs =3D pmu_ops->MIN_NR_GP_COU=
NTERS;
>=20
> -=C2=A0 =C2=A0 =C2=A0 =C2=A0perf_get_x86_pmu_capability(&kvm_host_pmu);
> -
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Hybrid PMUs don't play nice with virt=
ualization without careful
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* configuration by userspace, and KVM's=
 APIs for reporting supported
> @@ -120,6 +118,8 @@ void kvm_init_pmu_capability(struct kvm_pmu_ops *pmu_=
ops)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enable_pmu =3D fa=
lse;
>=20
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (enable_pmu) {
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0perf_get_x86_pmu_=
capability(&kvm_host_pmu);
> +
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* WARN if p=
erf did NOT disable hardware PMU if the number of
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* architect=
urally required GP counters aren't present, i.e. if

If we go this route, then the !enable_pmu path should explicitly zero kvm_h=
ost_pmu
so that the behavior is consistent userspace loads kvm.ko with enable_pmu=
=3D0,
versus enable_pmu being cleared because of lack of support.

	if (!enable_pmu) {
		memset(&kvm_host_pmu, 0, sizeof(kvm_host_pmu));
		memset(&kvm_pmu_cap, 0, sizeof(kvm_pmu_cap));
		return;
	}

The alternative would be keep kvm_host_pmu valid at all times for !HYBRID, =
which
is what I intended with the bad patch, but that too would lead to inconsist=
ent
behavior.  So I think it makes sense to go with Dapeng's approach; we can a=
lways
revisit this if some future thing in KVM _needs_ kvm_host_pmu even with ena=
ble_pmu=3D0.=20

	if (cpu_feature_enabled(X86_FEATURE_HYBRID_CPU)) {
		enable_pmu =3D false;
		memset(&kvm_host_pmu, 0, sizeof(kvm_host_pmu));
	} else {
		perf_get_x86_pmu_capability(&kvm_host_pmu);
	}
