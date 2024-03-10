Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E14CC54791
	for <intel-xe@archiver.kernel.org>; Sun, 10 Mar 2024 17:44:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D0EB10E085;
	Sun, 10 Mar 2024 17:44:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mDv7lnUK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D4510E085
 for <intel-xe@lists.freedesktop.org>; Sun, 10 Mar 2024 17:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710092646; x=1741628646;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wc1p9jJ2PCg/b0bq8CwNrFoQNKCuYy6vbebcDfRJhJ0=;
 b=mDv7lnUKPRxqSLUtEQHGgLRL+3uUzcgdb3+b8qdisKXUld9eOdkdI/LX
 TsQW5wOp6nAxeiOrz2Z5POojJaXQgzoslDuXNLaxHwUKXHCzJMm6jEekV
 EWs/UJAKXSBBAl4ijuBkAS0KmOXjFkIBXOslpeYDk1/rATrzix6OqJHge
 Iid+b9vyrTGJhPHvwdne60JXLbP7+GwO1BCk4HD8ER0EVbT0Bmd3qUqHD
 5JDmfDJKPt3kP7nOcgbTLuy4TtCLlOefptwU8eSjCQolo7sneZpdC0jR7
 rriD0qUemlt9Pnp9GKMXTrVUBA7MAeubNL4/QnasucdnAc/Hyz5hxcoG1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="15893606"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; d="scan'208";a="15893606"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2024 10:44:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; d="scan'208";a="11007133"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Mar 2024 10:44:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 10 Mar 2024 10:44:04 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 10 Mar 2024 10:44:04 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 10 Mar 2024 10:44:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TnC22hpI8gEt/xdcz/WidQEG+OW2VQqkuj/Z+IWHc0byYH9+iqeluAntnsiaUI/sOXSjS7ZRCpEaJx7DOa5OukInEV2rxSLJJDY6sjAlhgr0kHsYqzcSIniZ3V22yDjS8HQdS75eJITXjr3fOwyByJgmA50eWOtEkrM34fy6kkG04EmA5phabXuOvEl+ZYW3nd32s4OiuhNIq77zNKb6nEILNgZ6qOxHfv61Ks0v1Pr90gp/iONgzj/CIIqAnSLkYBtJ6tWmxPVXE2+5vd1JLaoggR+oKFvcOBizDGStqszH/VvsHqkET4GdvOmmLvqFoVB4GuRnK0IA1b06OFje5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2G4G2Y7s+E3S+Asq+HYgrjQL9Gx0nmYiplrDq/xpn/A=;
 b=IeFvdk0OShzbUjpdK+2rqcSs6+My3TzJxjWKFrp7TXWb5MGwmSEjUOh+41NQ4iURuT3+ZJqra2bNogPOKsUFLD3w0RTou50fryWNNtqSxs+6gAZ/0TwdG6zxkubLWA7VCy7qKhUxt2gtmsvcw9ktFHTMats85jllv1u5WSVWRDFalAqSPz4dzSGKFtueDmFKhfrIE5UthFMTuIFw9RIw/c4fkgefbnlbdSE8G2HJIQMlqSURIzdG0IU+eYG7XHwN4P9PAjXsfijmldu2qgxVDfiyW2kUGY895845tAIIkF0oZnRFAg+HPk3ptyEamz/Uyo3LXHdrFPfe1lxCulLubQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by CH0PR11MB5265.namprd11.prod.outlook.com (2603:10b6:610:e0::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.16; Sun, 10 Mar
 2024 17:44:00 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%4]) with mapi id 15.20.7362.017; Sun, 10 Mar 2024
 17:44:00 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH v4 01/30] drm/xe: Lock all gpuva ops during VM bind IOCTL
Thread-Topic: [PATCH v4 01/30] drm/xe: Lock all gpuva ops during VM bind IOCTL
Thread-Index: AQHacRabrjz3DDGVyUKATKk5TSOMG7ExN58A
Date: Sun, 10 Mar 2024 17:44:00 +0000
Message-ID: <SA1PR11MB6991E7ECA4A2ADD89DA05C1792252@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
 <20240308050806.577176-2-matthew.brost@intel.com>
In-Reply-To: <20240308050806.577176-2-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|CH0PR11MB5265:EE_
x-ms-office365-filtering-correlation-id: 59875b12-b7e3-477a-0452-08dc4129ab4f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fPqMC06phmLRMJHXADpprMyufmp8CqCnLlvqrBwzUmVVDEVDXzUGwcCAoKKln59D5k0tRE5fDV5rkZDfZOLRmlkcPQ9twNLBj/xp/X6C6AdT9BSs/5r0PoidfueRqsa8/8LDthfLydfzKZjftwrmvXptTITK8weHRbn3CzSetwyHNLlZoG2YiwlKrhEl9egxUVVuFSHrv6oElR6Oh1/bGlIIU84MhsFEyI5bAAAteSG6VXW64f8djfdMMNzaiyDZwsynUCcAVIFU/+0nZVp7EQoUiPl6mt8sG/Dq9tLTctkm/Nau3nq61+kjXVL5Ke6gv8HUio9Sgz3xksd1h0IaMCT6wvlAdd3LVZVFvkC+ulOXpiyidGBOYrO48QR0yYxJkSg2fh3kWmEl3POUdS+MGXCZjJKk3roqi4J0DG5ZGvrTb3iZHkQ9oah/J3/lChg4PG7YIPhejDY0euoRXX0EDP2lfnRSn07Td8dwU6Rs8o5TBcxG2BsItZ4YAXBTTvZBCSvsIE5EYQsbezCIWsPUr3ptKJFpl8XnPwbdmTzSI/T9JcpK8pDQ5XuJVm1GxkcbH0Kd3y9pTA8bK45gQcWJfOhUTwdDNLHMStF4NMtMaYdr3ontvYmiMVr0s/eIJUys0Eoc6XisOw7NaLuASGZT+v6tlQeCHDWNrN6LCsSu8nOI5eX+G5anMpSQbLjAYIBRTglyTfH5CXwf3b50q5LV8fJOqsM5fAkfjwCzgI+AnaU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JfuRIiQafudo6yC+jTpOQBecz2mVEhMRx0qh3gu91d84dFx9ygSNkFlRd4bi?=
 =?us-ascii?Q?iidFV5fcOn64y3JfRd9FZ+aI0S5zi/jOJlmSBOk5V3Sam/cKW5dhR1pD3rBP?=
 =?us-ascii?Q?G2oSbkB0dnzlHgFhDekanAWpHdKzyp0+R324IHuangHWbxlJy0jh/u5DI4dw?=
 =?us-ascii?Q?XG0xR2cYf0CYigKsZLMFZ3ODQdySnyBjIqhvtRKM2M4q+3koCQdLhwRAiP2V?=
 =?us-ascii?Q?eBOcEGZICPLoE3fdQYR4Nu+QOtSrkZA8SwlWww4H/gEQBTakCM7M2Sf9cfGB?=
 =?us-ascii?Q?OpyNaa+T9FLHb8ZL/z92/zaqMH7MR2l/awOkGwlFFhtOwHa9bLOL0XsrssWt?=
 =?us-ascii?Q?sh1NvcW7tdyfk1L9+tCuZEIJGquqhjN6pZ4q8cTNo1aovXE9qr+qBVcLwHXz?=
 =?us-ascii?Q?lq/m/gJi4c/CXLGslXh3qXX60t7j48ihGBH3Q5NWckcKpWm6Ibi2NfpJHmpn?=
 =?us-ascii?Q?SFo2Nxrgn8TrqMdSNcFGF942Xo54LUk+h6ANuA2uHLujDb6tNayEhb0K8Wuw?=
 =?us-ascii?Q?ALhlmtSUIQRviwhaLtvem2a5fcaEejVFieE9KAmvJjqNDQuoD6s6Zw+t2rrG?=
 =?us-ascii?Q?eEUXVgNkuJpf+k4S6D3jDPjz+7WcfS9ZfI0xWI5EzSTy3nfDyXuniBr/kQdC?=
 =?us-ascii?Q?mdrvKQH+9KJrKd8lRSQGpGukAXmLhIwoQDozpKuYo/C5to3jbVyv3PVu/+Yu?=
 =?us-ascii?Q?ySfaswMthPpaTPeoo6Oaug3gSTEmJlvozRNjjmfewJb8GC7pDR77hNzV+DGy?=
 =?us-ascii?Q?fVpRqrkIgoxL2k60R1t2b4hMIIBJdrZDWw+TeDuf2GTvg/XWF2TvM1IiudKX?=
 =?us-ascii?Q?0DzJ1wqWenqLPbbbT0HU8IZmsuCCGvLgKN1RgGntnhTo5+sxsM87c5wl1DR0?=
 =?us-ascii?Q?UDSwischyr+9jkpGOhbfjytDa2Tlv2e6BDKB0NM9wgJZSSj81jYQV82mR6pF?=
 =?us-ascii?Q?kfLWBtMkX5PhuaOGsaVhbPRvQrKDbXCbUadwUgiWnhiKwvNGKsm59GAr5Eki?=
 =?us-ascii?Q?WqU/feKtvQz44cHZzLQDODpEqvuI7knARC5sX3FCXSJkARXQGWqCOWSTVJCa?=
 =?us-ascii?Q?dZVRjVlFVBtruZbyJmpHzg7XSBMF9bXaHtHiB8kI4kFVci7ZDufRZgLByQX/?=
 =?us-ascii?Q?zk5OqygmzbPItfssJlfDw6UTmFCM72N7ZBN4eTdLA51A7X5uBoLRcqbYPzmm?=
 =?us-ascii?Q?2QM26wIW5uyd+LB4Hq03OyrHxMitPOgqiekY8mk1pf7iNKTyuHfNCS6rTGba?=
 =?us-ascii?Q?SRETt/v8Wab8IH4KcQel9tYuc6FnhVD6TJ3Tb2B73TUM5x80mRGb+YJ+5u9o?=
 =?us-ascii?Q?rSktTYPEmquHjFBB0N9wpDOu/cZ4ESqZviL+/Iz/FMcVMGdKM2yPKb1SBf0m?=
 =?us-ascii?Q?M3Gn/1IYnsuodH2kU+Ob0Bp3P51YLRh0hJrI6rswP/u+Qz8vffT4Pqgem5vA?=
 =?us-ascii?Q?MgrNifcq5ikAggWWIbr5MDaX8pHoxf/ELCf2qUgtZ4zvT+C4k7jWacZq2LjK?=
 =?us-ascii?Q?FZDygJ7/PedrppNf7GQXXANMz/kNXtpRNb8JtuFIEL+E3GSYQpDHrsozXudy?=
 =?us-ascii?Q?pnWhd1j6TA0XtDxLQzeRONulAT+3fNAGHwy2DmjL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59875b12-b7e3-477a-0452-08dc4129ab4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2024 17:44:00.2737 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RbPNmuZldVtjgdyQ9L6Rz0+Dw6yhRQ7cRL5PwecMHQgdkLLV7zMLz7obN6O5FpchtHRfrZCouqtHAwdi/k56TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5265
X-OriginatorOrg: intel.com
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



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matt=
hew
> Brost
> Sent: Friday, March 8, 2024 12:08 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Brost, Matthew <matthew.brost@intel.com>
> Subject: [PATCH v4 01/30] drm/xe: Lock all gpuva ops during VM bind IOCTL
>=20
> Lock all gpuva ops

Can we have a better wording? Better to say locking all Bos used in gpuva o=
ps?=20

Or maybe lock ops by locking and validating all Bos used in ops.

 and validate all BOs in a single step durin the VM
> bind IOCTL. This help with the transition to making all gpuva ops in a
> VM bind IOCTL a single atomic job.

Can you also explain, why you want bind to be a atomic job?=20

My guess is, bind ioctl can end up with a series of operations, if some (no=
t all) of those operations fail in the middle, it is hard to revert the suc=
cessful operations before failure.=20
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 142 ++++++++++++++++++++++++++-----------
>  1 file changed, 101 insertions(+), 41 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 643b3701a738..3b5dc6de07f7 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -413,19 +413,23 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
>=20
>  #define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
>=20
> -static void xe_vm_kill(struct xe_vm *vm)
> +static void xe_vm_kill(struct xe_vm *vm, bool unlocked)
>  {
>  	struct xe_exec_queue *q;
>=20
>  	lockdep_assert_held(&vm->lock);
>=20
> -	xe_vm_lock(vm, false);
> +	if (unlocked)
> +		xe_vm_lock(vm, false);
> +

Can you explain why we need xe_vm_lock in the first place here?=20

My understanding is, xe_vm_lock protect gpu page table update. Below kill f=
unction eventually calls into guc_exec_queue_kill where I don't see any pag=
e table operation there. So I doubt whether we need the lock in the first p=
lace.

>  	vm->flags |=3D XE_VM_FLAG_BANNED;
>  	trace_xe_vm_kill(vm);
>=20
>  	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link)
>  		q->ops->kill(q);
> -	xe_vm_unlock(vm);
> +
> +	if (unlocked)
> +		xe_vm_unlock(vm);
>=20
>  	/* TODO: Inform user the VM is banned */
>  }
> @@ -621,7 +625,7 @@ static void preempt_rebind_work_func(struct work_stru=
ct
> *w)
>=20
>  	if (err) {
>  		drm_warn(&vm->xe->drm, "VM worker error: %d\n", err);
> -		xe_vm_kill(vm);
> +		xe_vm_kill(vm, true);
>  	}
>  	up_write(&vm->lock);
>=20
> @@ -1831,17 +1835,9 @@ static int xe_vm_bind(struct xe_vm *vm, struct xe_=
vma
> *vma, struct xe_exec_queue
>  		      u32 num_syncs, bool immediate, bool first_op,
>  		      bool last_op)
>  {
> -	int err;
> -
>  	xe_vm_assert_held(vm);
>  	xe_bo_assert_held(bo);
>=20
> -	if (bo && immediate) {
> -		err =3D xe_bo_validate(bo, vm, true);
> -		if (err)
> -			return err;
> -	}
> -
>  	return __xe_vm_bind(vm, vma, q, syncs, num_syncs, immediate, first_op,
>  			    last_op);
>  }
> @@ -2488,17 +2484,12 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *=
vm,
> struct xe_exec_queue *q,
>  	return 0;
>  }
>=20
> -static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
> -		      struct xe_vma *vma, struct xe_vma_op *op)
> +static int op_execute(struct xe_vm *vm, struct xe_vma *vma,
> +		      struct xe_vma_op *op)
>  {
>  	int err;
>=20
>  	lockdep_assert_held_write(&vm->lock);
> -
> -	err =3D xe_vm_prepare_vma(exec, vma, 1);
> -	if (err)
> -		return err;
> -
>  	xe_vm_assert_held(vm);
>  	xe_bo_assert_held(xe_vma_bo(vma));
>=20
> @@ -2579,19 +2570,10 @@ static int op_execute(struct drm_exec *exec, stru=
ct
> xe_vm *vm,
>  static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
>  			       struct xe_vma_op *op)
>  {
> -	struct drm_exec exec;
>  	int err;
>=20
>  retry_userptr:
> -	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
> -	drm_exec_until_all_locked(&exec) {
> -		err =3D op_execute(&exec, vm, vma, op);
> -		drm_exec_retry_on_contention(&exec);
> -		if (err)
> -			break;
> -	}
> -	drm_exec_fini(&exec);
> -
> +	err =3D op_execute(vm, vma, op);
>  	if (err =3D=3D -EAGAIN) {
>  		lockdep_assert_held_write(&vm->lock);
>=20
> @@ -2756,29 +2738,107 @@ static void vm_bind_ioctl_ops_unwind(struct xe_v=
m
> *vm,
>  	}
>  }
>=20
> +static int vma_lock(struct drm_exec *exec, struct xe_vma *vma, bool vali=
date)
> +{
> +	struct xe_bo *bo =3D xe_vma_bo(vma);
> +	int err =3D 0;
> +
> +	if (bo) {
> +		if (!bo->vm)
> +			err =3D drm_exec_prepare_obj(exec, &bo->ttm.base, 1);
> +		if (!err && validate)
> +			err =3D xe_bo_validate(bo, xe_vma_vm(vma), true);
> +	}
> +
> +	return err;
> +}
> +
> +static int op_lock(struct drm_exec *exec, struct xe_vm *vm,
> +		   struct xe_vma_op *op)
> +{
> +	int err =3D 0;
> +
> +	switch (op->base.op) {
> +	case DRM_GPUVA_OP_MAP:
> +		err =3D vma_lock(exec, op->map.vma, !xe_vm_in_fault_mode(vm));
> +		break;
> +	case DRM_GPUVA_OP_REMAP:
> +		err =3D vma_lock(exec, gpuva_to_vma(op->base.remap.unmap->va),
> +			       false);
> +		if (!err && op->remap.prev)
> +			err =3D vma_lock(exec, op->remap.prev, true);
> +		if (!err && op->remap.next)
> +			err =3D vma_lock(exec, op->remap.next, true);
> +		break;
> +	case DRM_GPUVA_OP_UNMAP:
> +		err =3D vma_lock(exec, gpuva_to_vma(op->base.unmap.va), false);
> +		break;
> +	case DRM_GPUVA_OP_PREFETCH:
> +		err =3D vma_lock(exec, gpuva_to_vma(op->base.prefetch.va), true);
> +		break;
> +	default:
> +		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> +	}
> +
> +	return err;
> +}
> +
> +static int vm_bind_ioctl_ops_lock(struct drm_exec *exec,
> +				  struct xe_vm *vm,
> +				  struct list_head *ops_list)
> +{
> +	struct xe_vma_op *op;
> +	int err;
> +
> +	err =3D drm_exec_prepare_obj(exec, xe_vm_obj(vm), 1);
> +	if (err)
> +		return err;
> +
> +	list_for_each_entry(op, ops_list, link) {
> +		err =3D op_lock(exec, vm, op);
> +		if (err)
> +			return err;
> +	}
> +
> +	return 0;
> +}
> +
>  static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
>  				     struct list_head *ops_list)
>  {
> +	struct drm_exec exec;
>  	struct xe_vma_op *op, *next;
>  	int err;
>=20
>  	lockdep_assert_held_write(&vm->lock);
>=20
> -	list_for_each_entry_safe(op, next, ops_list, link) {
> -		err =3D xe_vma_op_execute(vm, op);
> -		if (err) {
> -			drm_warn(&vm->xe->drm, "VM op(%d) failed with %d",
> -				 op->base.op, err);
> -			/*
> -			 * FIXME: Killing VM rather than proper error handling
> -			 */
> -			xe_vm_kill(vm);
> -			return -ENOSPC;
> +	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
> +		      DRM_EXEC_IGNORE_DUPLICATES, 0);
> +	drm_exec_until_all_locked(&exec) {
> +		err =3D vm_bind_ioctl_ops_lock(&exec, vm, ops_list);
> +		drm_exec_retry_on_contention(&exec);
> +		if (err)
> +			goto unlock;
> +

Do you need below ops inside the drm_exec_until_all_locked loop? After you =
locked all objects, you can close the drm_exec_until_all_locked loop, then =
perform below out of drm_exec_until_all_locked loop.=20

Oak=20

> +		list_for_each_entry_safe(op, next, ops_list, link) {
> +			err =3D xe_vma_op_execute(vm, op);
> +			if (err) {
> +				drm_warn(&vm->xe->drm, "VM op(%d) failed
> with %d",
> +					 op->base.op, err);
> +				/*
> +				 * FIXME: Killing VM rather than proper error
> handling
> +				 */
> +				xe_vm_kill(vm, false);
> +				err =3D -ENOSPC;
> +				goto unlock;
> +			}
> +			xe_vma_op_cleanup(vm, op);
>  		}
> -		xe_vma_op_cleanup(vm, op);
>  	}
>=20
> -	return 0;
> +unlock:
> +	drm_exec_fini(&exec);
> +	return err;
>  }
>=20
>  #define SUPPORTED_FLAGS	(DRM_XE_VM_BIND_FLAG_NULL | \
> --
> 2.34.1

