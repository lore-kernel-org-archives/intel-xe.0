Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B54C02192
	for <intel-xe@archiver.kernel.org>; Wed,  5 Feb 2025 13:14:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AED810E1EA;
	Wed,  5 Feb 2025 13:14:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bQyT4CJT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4352A10E7B0
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Feb 2025 13:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738761259; x=1770297259;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+lSH3vkQOq3tHFUJjrbn02S2GMjxFWgiWhzE+Xj3Ngc=;
 b=bQyT4CJTl0ZkyBjIpjn/583omsu6GBZmAgdYItcesSzN8fGN9shrNdVR
 +ND33PBo38KhGyGOdFCfCXb8BzptzR3chTAC6P9emaoMfDMM+eI8/roMT
 sQu9dtoH4OisITDW94G8rvtTKl9ZaInxw7oFSLP52D+UUvZhiOu1tTYL2
 HrO9Cx39cU7JS3NRJV8akbd/yfyELsBECWtDNN+IFnL895hNipE+MGmPz
 Ryelc/6YAZkyyzZLdoXy0VZAqp7DqZErMCiYi6/eH68mEIt/UAhPljFPm
 +FsdHBnNq4dr2SBlBy6Lu6VVUc7ZSQorYguMnD3OFeIOoSBRrz9ZX7snV Q==;
X-CSE-ConnectionGUID: 36VVbybKSBmTNT1eCDH0YQ==
X-CSE-MsgGUID: 3twXs70QSXmAgDwz60BkxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39225121"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; d="scan'208";a="39225121"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 05:14:19 -0800
X-CSE-ConnectionGUID: Z24a+3ECT+iUGmNjp+FUNQ==
X-CSE-MsgGUID: iYoMzxnuROCU0qZ9XKKtuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; d="scan'208";a="111475932"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.246.213])
 ([10.245.246.213])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 05:14:17 -0800
Message-ID: <68c890a3baff21199f6aca82dccdd024f56de199.camel@linux.intel.com>
Subject: Re: [PATCH 3/3] drm/xe: Allow scratch page under fault mode for
 certain platform
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Oak Zeng <oak.zeng@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, jonathan.cavitt@intel.com
Date: Wed, 05 Feb 2025 14:14:15 +0100
In-Reply-To: <20250204184558.4181478-3-oak.zeng@intel.com>
References: <20250204184558.4181478-1-oak.zeng@intel.com>
 <20250204184558.4181478-3-oak.zeng@intel.com>
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

On Tue, 2025-02-04 at 13:45 -0500, Oak Zeng wrote:
> Normally scratch page is not allowed when a vm is operate under page
> fault mode, i.e., in the existing codes,
> DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE
> and DRM_XE_VM_CREATE_FLAG_FAULT_MODE are mutual exclusive. The reason
> is fault mode relies on recoverable page to work, while scratch page
> can mute recoverable page fault.
>=20
> On xe2 and xe3, out of bound prefetch can cause page fault and
> further
> system hang because xekmd can't resolve such page fault. SYCL and OCL
> language runtime requires out of bound prefetch to be silently
> dropped
> without causing any functional problem, thus the existing behavior
> doesn't meet language runtime requirement.
>=20
> At the same time, HW prefetching can cause page fault interrupt. Due
> to
> page fault interrupt overhead (i.e., need Guc and KMD involved to fix
> the page fault), HW prefetching can be slowed by many orders of
> magnitude.
>=20
> Fix those problems by allowing scratch page under fault mode for xe2
> and
> xe3. With scratch page in place, HW prefetching could always hit
> scratch
> page instead of causing interrupt.
>=20
> A side effect is, scratch page could hide application program error.
> Application out of bound accesses are hided
s/hided/hidden/

>  by scratch page mapping,
> instead of get reported to user.
>=20
> igt test: https://patchwork.freedesktop.org/series/144334/. Test
> result on
> BMG:
>=20
> root@DUT1130BMGFRD:/home/szeng/dii-tools/igt-public/build/tests#
> ./xe_exec_fault_mode --run-subtest scratch-fault
> IGT-Version: 1.30-gde1a3cb42 (x86_64) (Linux: 6.13.0-xe x86_64)
> Using IGT_SRANDOM=3D1738684805 for randomisation
> Opened device: /dev/dri/card0
> Starting subtest: scratch-fault
> Subtest scratch-fault: SUCCESS (0.080s)
>=20
> Without this series, the test result is:
>=20
> root@DUT1130BMGFRD:/home/szeng/dii-tools/igt-public/build/tests#
> ./xe_exec_fault_mode --run-subtest scratch-fault
> IGT-Version: 1.30-gde1a3cb42 (x86_64) (Linux: 6.13.0-xe x86_64)
> Using IGT_SRANDOM=3D1738686046 for randomisation
> Opened device: /dev/dri/card0
> Starting subtest: scratch-fault
> (xe_exec_fault_mode:5047) CRITICAL: Test assertion failure function
> test_exec, file ../tests/intel/xe_exec_fault_mode.c:349:
> (xe_exec_fault_mode:5047) CRITICAL: Failed assertion:
> __xe_wait_ufence(fd, &exec_sync[i], 0xdeadbeefdeadbeefull,
> exec_queues[i % n_exec_queues], &timeout) =3D=3D 0
> (xe_exec_fault_mode:5047) CRITICAL: Last errno: 62, Timer expired
> (xe_exec_fault_mode:5047) CRITICAL: error: -62 !=3D 0
> Stack trace:
> =C2=A0 #0 ../lib/igt_core.c:2266 __igt_fail_assert()
> =C2=A0 #1 ../tests/intel/xe_exec_fault_mode.c:346 test_exec()
> =C2=A0 #2 ../tests/intel/xe_exec_fault_mode.c:537
> __igt_unique____real_main407()
> =C2=A0 #3 ../tests/intel/xe_exec_fault_mode.c:407 main()
> =C2=A0 #4 ../sysdeps/nptl/libc_start_call_main.h:74
> __libc_start_call_main()
> =C2=A0 #5 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
> =C2=A0 #6 [_start+0x2e]
> Subtest scratch-fault failed.
>=20
> v2: Refine commit message (Thomas)
>=20
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_vm.c | 9 +++++----
> =C2=A01 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 813d893d9b63..c0372f083d42 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1752,6 +1752,11 @@ int xe_vm_create_ioctl(struct drm_device *dev,
> void *data,
> =C2=A0	if (XE_IOCTL_DBG(xe, args->extensions))
> =C2=A0		return -EINVAL;
> =C2=A0
> +	if (XE_IOCTL_DBG(xe, args->flags &
> DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE &&
> +			 args->flags &
> DRM_XE_VM_CREATE_FLAG_FAULT_MODE &&
> +			 !(NEEDS_SCRATCH(xe))))
> +		return -EINVAL;
> +

We should probably move this test to where the old test were below,
since the WA below enables scratch pages.

/Thomas


> =C2=A0	if (XE_WA(xe_root_mmio_gt(xe), 14016763929))
> =C2=A0		args->flags |=3D DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE;
> =C2=A0
> @@ -1765,10 +1770,6 @@ int xe_vm_create_ioctl(struct drm_device *dev,
> void *data,
> =C2=A0	if (XE_IOCTL_DBG(xe, args->flags &
> ~ALL_DRM_XE_VM_CREATE_FLAGS))
> =C2=A0		return -EINVAL;
> =C2=A0
> -	if (XE_IOCTL_DBG(xe, args->flags &
> DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE &&
> -			 args->flags &
> DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
> -		return -EINVAL;
> -
> =C2=A0	if (XE_IOCTL_DBG(xe, !(args->flags &
> DRM_XE_VM_CREATE_FLAG_LR_MODE) &&
> =C2=A0			 args->flags &
> DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
> =C2=A0		return -EINVAL;

