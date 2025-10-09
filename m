Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B74A9CCD184
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 12:58:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CDAA10EA43;
	Thu,  9 Oct 2025 12:58:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="k62qs1D2";
	dkim-atps=neutral
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com
 [209.85.214.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B66C10EA3A
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 12:58:38 +0000 (UTC)
Received: by mail-pl1-f201.google.com with SMTP id
 d9443c01a7336-268149e1c28so17722915ad.1
 for <intel-xe@lists.freedesktop.org>; Thu, 09 Oct 2025 05:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1760014718; x=1760619518;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=rW1G3rL+KumF5u3WwLC+tOU95q8htP+/xpt0iPYfuBA=;
 b=k62qs1D2p102nxI4hl14dMPrFs2fYA918kOM6BTBCEzvWTmLd2m4zXhvxw+2gkTr47
 9Ax5Dvhrf6/nX7x+tUA7RJZ8VkkKeafwuuGQDm2+jhVK/AN96aJiSKuBrvWoic0di2P1
 cn4BVtiMfEaJGU1lYhGM+Tfj0WoVSBCFIMdP+qImpGuWxi4EMtMXbrmwITcFpi+dtXHW
 t3b0HyHjDbANMwVml5bldXoSeqy8qpzvG+0fY3SLvn+eQ4HNEMtMjB1P4kQbE4DWGk4k
 cGuAjzxX0PCwAB1tnWi4BaXO8KjO6x9/RT/Aw0C1McrOnhxA7b0mJwFQFnLlTcOow88t
 EY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760014718; x=1760619518;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=rW1G3rL+KumF5u3WwLC+tOU95q8htP+/xpt0iPYfuBA=;
 b=HurbFAwpo49N/FiNoCmhmXHCIlQPyfPoC6lNJemKE6jiG9L04IeuDxtGISCN1ao2Gt
 vTtOukTMD7hnDWmr3yeFqTsSYCW18ARgyLvM29NbhYG9yPIwsHZaWAFKkWCGCccRQHSb
 NwMaXQj37mtyD9vLpYXtqKcvT+TNqj3AHk11HM+Rlng+uVeGEPENyyyeib+x/NdJ37JZ
 8SjGkJWJwAKpLzTQj2HWzjK9JN67Zl1+Gs+g287LVsuarjBnsMg9kcelxJ9oilCoHDqU
 Zu52/UrIPVlCXqRR0p1kkl6ej0TKJev/19T0Suz25SUrgo2cbNULMBOxVlnyxdAem2Mk
 Jfgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcB4K6GUzLn/w3g3l2/6XDSH+q2/BOkKwu/dDY029rdrmUujwDL9Te0t5yAMeEMAfrkKZrclPyeA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQDXc2owz6o4YFOoQaivQgl/oqa9cwpJaWGxAWmI+O2XhgGciA
 xt9emH1G6ah/BtebAFSkAzZ3mHNZuoFm3dydp4Y4h3H06G+qvhYVHRK6XB+PNCWt28+k/EKGUkr
 gq4Cmgw==
X-Google-Smtp-Source: AGHT+IH7h/AMFky1MZe0POKihyk6CBGGTuNOR3bkBF5NzMdZe3AIhToBPbzyEpzWmh5xCsVBnvVH62o1WfY=
X-Received: from plbkv14.prod.google.com ([2002:a17:903:28ce:b0:268:eb:3b3b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ef10:b0:271:5bde:697e
 with SMTP id d9443c01a7336-29027213340mr92639575ad.3.1760014717676; Thu, 09
 Oct 2025 05:58:37 -0700 (PDT)
Date: Thu, 9 Oct 2025 05:58:35 -0700
In-Reply-To: <e9e8f087-60f6-455a-b0e0-e5c29fc54129@linux.intel.com>
Mime-Version: 1.0
References: <70b64347-2aca-4511-af78-a767d5fa8226@intel.com>
 <25af94f5-79e3-4005-964e-e77b1320a16e@linux.intel.com>
 <aNvyjkuDLOfxAANd@google.com>
 <3bbc4e6d-9f52-483c-a25d-166dca62fb25@intel.com>
 <00d0f3f3-d2b4-4885-9a49-5e6f8390142b@intel.com>
 <e9e8f087-60f6-455a-b0e0-e5c29fc54129@linux.intel.com>
Message-ID: <aOexe4LNpmJnHTm9@google.com>
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

On Thu, Oct 09, 2025, Dapeng Mi wrote:
>=20
> On 10/7/2025 2:22 PM, Borah, Chaitanya Kumar wrote:
> > Hi,
> >
> > On 10/6/2025 1:33 PM, Borah, Chaitanya Kumar wrote:
> >> Thank you for your responses.
> >>
> >> Following change fixes the issue for us.
> >>
> >>
> >> diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
> >> index 40ac4cb44ed2..487ad19a236e 100644
> >> --- a/arch/x86/kvm/pmu.c
> >> +++ b/arch/x86/kvm/pmu.c
> >> @@ -108,16 +108,18 @@ void kvm_init_pmu_capability(const struct=20
> >> kvm_pmu_ops *pmu_ops)
> >>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool is_intel =3D boot_cpu=
_data.x86_vendor =3D=3D X86_VENDOR_INTEL;
> >>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int min_nr_gp_ctrs =3D pmu=
_ops->MIN_NR_GP_COUNTERS;
> >>
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf_get_x86_pmu_capability(&kvm=
_host_pmu);
> >> -
> >>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> >>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Hybrid PMUs don't =
play nice with virtualization without careful
> >>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * configuration by u=
serspace, and KVM's APIs for reporting=20
> >> supported
> >>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * vPMU features do n=
ot account for hybrid PMUs.=C2=A0 Disable vPMU=20
> >> support
> >>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * for hybrid PMUs un=
til KVM gains a way to let userspace opt-in.
> >>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (cpu_feature_enabled(X86_FEAT=
URE_HYBRID_CPU))
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (cpu_feature_enabled(X86_FEAT=
URE_HYBRID_CPU)) {
> >>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 enable_pmu =3D false;
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 memset(&kvm_host_pmu, 0, sizeof(kvm_host_pmu));
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 perf_get_x86_pmu_capability(&kvm_host_pmu);
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > Can we expect a formal patch soon?
>=20
> I'd like to post a patch to fix this tomorrow if Sean has no bandwidth on
> this. Thanks.

Sorry, my bad, I was waiting for you to post a patch, but that wasn't at al=
l
clear.  So yeah, go ahead and post one :-)
