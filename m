Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70544C02194
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 09:29:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 319AA10E2E0;
	Thu,  6 Feb 2025 09:29:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VsHG7nhD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD6B010E2E0
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Feb 2025 09:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738834194; x=1770370194;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=rado7OUV4gPMfEIqkQ8NC56VUk+oujd3/38nr2dFpQo=;
 b=VsHG7nhDRvBj5ENpyLJatgRQEO6Rc6eQIrnn8+syXIcHE8KgGBPEk7tI
 5I9hqa0mKNg8YQC/BTintJiQ6wUpL4r46y7qgic5Q7S9BBpE79f6v5jxq
 oCRpBAXznY1+31tbUCmiBVJPtoknLx7Vmm/oeltDoqfhtevsWvYnXefyj
 BiWibk+frcjKmW301M+hm3KA7/LBJ8F5JMcQceI04TzsrjXWyGcs87OQh
 q2vb8fNM39ZBb+KeMl8xzVwYlfcn9c7Tixr0RHaXRErxR8+VIDvIJ2bCU
 0nkEjHc7y7jOeXC0Qy68CKsip+bAlVy2uUJhpzfWl6qIYb/uObc9FIHEd Q==;
X-CSE-ConnectionGUID: F5vFC66OR0yHCc0KooFZ0Q==
X-CSE-MsgGUID: whVwhIFnQPO2ybJbcxC/Mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38629049"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="38629049"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 01:29:52 -0800
X-CSE-ConnectionGUID: l92k+7EnRT+R3fph7Eq4Gg==
X-CSE-MsgGUID: DX/jOfq+SPC+KmtRrslSDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="142042962"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.246.47])
 ([10.245.246.47])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 01:29:50 -0800
Message-ID: <98073717d6ba2fe5de729315e165f7d77f850c45.camel@linux.intel.com>
Subject: Re: [PATCH 3/3] drm/xe: Allow scratch page under fault mode for
 certain platform
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Cc: "Brost, Matthew" <matthew.brost@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Date: Thu, 06 Feb 2025 10:29:47 +0100
In-Reply-To: <MN2PR11MB4728736D182B9C0671A8501692F62@MN2PR11MB4728.namprd11.prod.outlook.com>
References: <20250204184558.4181478-1-oak.zeng@intel.com>
 <20250204184558.4181478-3-oak.zeng@intel.com>
 <68c890a3baff21199f6aca82dccdd024f56de199.camel@linux.intel.com>
 <MN2PR11MB4728736D182B9C0671A8501692F62@MN2PR11MB4728.namprd11.prod.outlook.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
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

On Thu, 2025-02-06 at 01:54 +0000, Zeng, Oak wrote:
>=20
>=20
> > -----Original Message-----
> > From: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Sent: February 5, 2025 8:14 AM
> > To: Zeng, Oak <oak.zeng@intel.com>; intel-xe@lists.freedesktop.org
> > Cc: Brost, Matthew <matthew.brost@intel.com>; Cavitt, Jonathan
> > <jonathan.cavitt@intel.com>
> > Subject: Re: [PATCH 3/3] drm/xe: Allow scratch page under fault
> > mode for certain platform
> >=20
> > On Tue, 2025-02-04 at 13:45 -0500, Oak Zeng wrote:
> > > Normally scratch page is not allowed when a vm is operate under
> > page
> > > fault mode, i.e., in the existing codes,
> > > DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE
> > > and DRM_XE_VM_CREATE_FLAG_FAULT_MODE are mutual
> > exclusive. The reason
> > > is fault mode relies on recoverable page to work, while scratch
> > > page
> > > can mute recoverable page fault.
> > >=20
> > > On xe2 and xe3, out of bound prefetch can cause page fault and
> > > further
> > > system hang because xekmd can't resolve such page fault. SYCL and
> > OCL
> > > language runtime requires out of bound prefetch to be silently
> > > dropped
> > > without causing any functional problem, thus the existing
> > > behavior
> > > doesn't meet language runtime requirement.
> > >=20
> > > At the same time, HW prefetching can cause page fault interrupt.
> > Due
> > > to
> > > page fault interrupt overhead (i.e., need Guc and KMD involved to
> > fix
> > > the page fault), HW prefetching can be slowed by many orders of
> > > magnitude.
> > >=20
> > > Fix those problems by allowing scratch page under fault mode for
> > xe2
> > > and
> > > xe3. With scratch page in place, HW prefetching could always hit
> > > scratch
> > > page instead of causing interrupt.
> > >=20
> > > A side effect is, scratch page could hide application program
> > > error.
> > > Application out of bound accesses are hided
> > s/hided/hidden/
> >=20
> > > =C2=A0by scratch page mapping,
> > > instead of get reported to user.
> > >=20
> > > igt test: https://patchwork.freedesktop.org/series/144334/. Test
> > > result on
> > > BMG:
> > >=20
> > > root@DUT1130BMGFRD:/home/szeng/dii-tools/igt-
> > public/build/tests#
> > > ./xe_exec_fault_mode --run-subtest scratch-fault
> > > IGT-Version: 1.30-gde1a3cb42 (x86_64) (Linux: 6.13.0-xe x86_64)
> > > Using IGT_SRANDOM=3D1738684805 for randomisation
> > > Opened device: /dev/dri/card0
> > > Starting subtest: scratch-fault
> > > Subtest scratch-fault: SUCCESS (0.080s)
> > >=20
> > > Without this series, the test result is:
> > >=20
> > > root@DUT1130BMGFRD:/home/szeng/dii-tools/igt-
> > public/build/tests#
> > > ./xe_exec_fault_mode --run-subtest scratch-fault
> > > IGT-Version: 1.30-gde1a3cb42 (x86_64) (Linux: 6.13.0-xe x86_64)
> > > Using IGT_SRANDOM=3D1738686046 for randomisation
> > > Opened device: /dev/dri/card0
> > > Starting subtest: scratch-fault
> > > (xe_exec_fault_mode:5047) CRITICAL: Test assertion failure
> > function
> > > test_exec, file ../tests/intel/xe_exec_fault_mode.c:349:
> > > (xe_exec_fault_mode:5047) CRITICAL: Failed assertion:
> > > __xe_wait_ufence(fd, &exec_sync[i], 0xdeadbeefdeadbeefull,
> > > exec_queues[i % n_exec_queues], &timeout) =3D=3D 0
> > > (xe_exec_fault_mode:5047) CRITICAL: Last errno: 62, Timer expired
> > > (xe_exec_fault_mode:5047) CRITICAL: error: -62 !=3D 0
> > > Stack trace:
> > > =C2=A0 #0 ../lib/igt_core.c:2266 __igt_fail_assert()
> > > =C2=A0 #1 ../tests/intel/xe_exec_fault_mode.c:346 test_exec()
> > > =C2=A0 #2 ../tests/intel/xe_exec_fault_mode.c:537
> > > __igt_unique____real_main407()
> > > =C2=A0 #3 ../tests/intel/xe_exec_fault_mode.c:407 main()
> > > =C2=A0 #4 ../sysdeps/nptl/libc_start_call_main.h:74
> > > __libc_start_call_main()
> > > =C2=A0 #5 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
> > > =C2=A0 #6 [_start+0x2e]
> > > Subtest scratch-fault failed.
> > >=20
> > > v2: Refine commit message (Thomas)
> > >=20
> > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > > ---
> > > =C2=A0drivers/gpu/drm/xe/xe_vm.c | 9 +++++----
> > > =C2=A01 file changed, 5 insertions(+), 4 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > b/drivers/gpu/drm/xe/xe_vm.c
> > > index 813d893d9b63..c0372f083d42 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -1752,6 +1752,11 @@ int xe_vm_create_ioctl(struct
> > drm_device *dev,
> > > void *data,
> > > =C2=A0	if (XE_IOCTL_DBG(xe, args->extensions))
> > > =C2=A0		return -EINVAL;
> > >=20
> > > +	if (XE_IOCTL_DBG(xe, args->flags &
> > > DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE &&
> > > +			 args->flags &
> > > DRM_XE_VM_CREATE_FLAG_FAULT_MODE &&
> > > +			 !(NEEDS_SCRATCH(xe))))
> > > +		return -EINVAL;
> > > +
> >=20
> > We should probably move this test to where the old test were below,
> > since the WA below enables scratch pages.
>=20
>=20
> Below wa code is for dg2.
> If we move this test below the wa code, then on dg2, if people create
> vm
> With FAULT_MODE | LR_MODE, above check would fail user.

Though on DG2 we don't support fault mode.

>=20
> So I do think we should keep this check above wa codes.

I think what matters here is readability of the code. A naive reader
(like me in this case) would start to wonder why enabling scratch pages
*after* the sanity check for them is done, and whether that is a bug or
an oversight, and that would require looking up what the WA actually
means.

So IMO in general sanity checks should be done after all implicit
enabling of flags if at all possible. And if not, they should be
accompanied by a comment that explains why the enabling of the flag is
not included in the sanity check.

/Thomas


>=20
> Oak
>=20
>=20
> >=20
> > /Thomas
> >=20
> >=20
> > > =C2=A0	if (XE_WA(xe_root_mmio_gt(xe), 14016763929))
> > > =C2=A0		args->flags |=3D
> > DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE;
> > >=20
> > > @@ -1765,10 +1770,6 @@ int xe_vm_create_ioctl(struct
> > drm_device *dev,
> > > void *data,
> > > =C2=A0	if (XE_IOCTL_DBG(xe, args->flags &
> > > ~ALL_DRM_XE_VM_CREATE_FLAGS))
> > > =C2=A0		return -EINVAL;
> > >=20
> > > -	if (XE_IOCTL_DBG(xe, args->flags &
> > > DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE &&
> > > -			 args->flags &
> > > DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
> > > -		return -EINVAL;
> > > -
> > > =C2=A0	if (XE_IOCTL_DBG(xe, !(args->flags &
> > > DRM_XE_VM_CREATE_FLAG_LR_MODE) &&
> > > =C2=A0			 args->flags &
> > > DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
> > > =C2=A0		return -EINVAL;
>=20

