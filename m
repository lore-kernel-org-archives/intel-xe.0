Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EECC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 15:51:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1FDC10F185;
	Tue, 16 Apr 2024 15:51:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BBFeHUi0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D48C410F182
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 15:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713282691; x=1744818691;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=O0fYDdYYk7ej+assWfpLRGZqTRajbA0efPX63cMmoiM=;
 b=BBFeHUi0B56CzaxLtRZklXSxo50N1Hw+Dp+XCK2KBCTj85Iule7DabnL
 nl+MiG3KpmxGhw6MKXFCLyLCRsvrcM65ShxuRMEpjcOrtX6Owdu47hC97
 t+vvEseS6O7mSxIuFY55tId9nCwr41Hh6tOiHDTUwSyXOhvGUL2YSojnR
 AIl2vI1l0jq8Jc1GY8JpI7ZRcnNNqcOWk36A29do6SodPYEa3eGZ0Xf7G
 bf6vdgnEvkiXH07MDVC5fxtjO2y4Dw61h3HRX8ljY1PZF214Wv1tsuWbR
 pKbUR5lf5q7iMWrN11OkE7vJQJ4l8pA9GJHC7H8sZomBic7nS8TZ/T/dJ Q==;
X-CSE-ConnectionGUID: Y3dSYgfASzKyUhAJZKNJ+Q==
X-CSE-MsgGUID: kTMZwNFSSt2pUIf7ppOluQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="26192091"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="26192091"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 08:51:28 -0700
X-CSE-ConnectionGUID: HOKVRVyzRIqaDg9SxPMBLw==
X-CSE-MsgGUID: HuMlVHsuQUCm5NJNOhr79g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="26958523"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 08:51:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 08:51:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 08:51:26 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 08:51:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LYys/ieymHsCx6IrJLGtKqa8x4Svkmq7PK3q6vnVaDE5hS712ozDj7ioev87HBTF9RxrcO8HPcgaoHzcnhZ9Bxc6IdSk1dDqAlHElmvuVc6vNTPPB0mPbrsGsb3HRyJrkxnF1q2x7ZSB/DS41dQhKi2q8i2+WcfZwkjpbVT2Fl9ZvvvpkLKCXrfEtCayF01Q92D6d8z211Wp6OvOY4hPI2ZgAffI1CGUpzuYgBMbFpiYMcGeri5OkuXMH/gXP0wGWsgXOvceuSXZk979VW2uHOP6GnPvAQ/BXNgTb00uZ1CubysbnwfUtMp1xBixY1Zpej9n19iUB2XpACp/SJWIyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rWjKqmEw8aIN94ooFcKDbbiD+k2RvhJ+XJAQ74JCZg8=;
 b=jZ6+9Cyu+waZz1750gExw1XlbgTLfBI64T+8stAhjl/KNcalX4L00HDjAM0w6UDgrKkm9y0+6QR3ln2MoMzoKpqzb4vhVh87HWq+VMMIr4kti8tBiNWxk05tttrR5RCRWDzZalX168KselGNjG2Hwg2lwQ1w4G/dDg1weknJn1jObMWGOJt5/BfjiLC5YLTDtN7POU/I44ZLG5RjGKXUSsD1tVutjdYnAiyNPWQsCoC9FSqSW4yFDk3kVVBFJICMCxKNjsnbQwbQzfLYJHxvdWlo7dBWBNckG7b1HTa0a9Mz60rTIC145LcpWIWrkxt/hKPFFLPtXOuRnEV2AoSoyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by SA0PR11MB4767.namprd11.prod.outlook.com (2603:10b6:806:97::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.29; Tue, 16 Apr
 2024 15:51:24 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Tue, 16 Apr 2024
 15:51:24 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 01/13] drm/xe: Lock all gpuva ops during VM bind IOCTL
Thread-Topic: [PATCH 01/13] drm/xe: Lock all gpuva ops during VM bind IOCTL
Thread-Index: AQHaiwme933Fwvd50EaGbjvGNwfAqbFrBfOg
Date: Tue, 16 Apr 2024 15:51:24 +0000
Message-ID: <SA1PR11MB6991AC5A46A3177C4742AEE292082@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240410054056.478023-1-matthew.brost@intel.com>
 <20240410054056.478023-2-matthew.brost@intel.com>
In-Reply-To: <20240410054056.478023-2-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|SA0PR11MB4767:EE_
x-ms-office365-filtering-correlation-id: 0e89bef5-b356-4c4d-041a-08dc5e2d11c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eyLxXLobxfksxhqDQ5KuKk+IzaefXHLO8GC8SXiwUd5tw/fux4aYqo2FKI6RHMqSNea9G1eWhKQfCyHCNHnOmrQCywfCwF416CyjWjM8ZnPD3SgcJW4pWHQN9jT40XZ6AElNZQfzAwyErCtU/IyO+7xGfLLQJrEmLQd6ANtHPY4gkwzU1/kh9nRawbm64LAqcZv0ehnYcOkUYShWXwa2F183sImf9BwqAgnGpazy/6Xuo52WJrnDgf7/lqQKJPrECzMoMGBpl2ybcM1ELWHk4lMsWeucWNLQ8dgM3jxF/DqLgTsP7pT3TV5R4fZ0mXHtyQJNiIs9FXBBy3Y9MwbPUeLq+ycTi7f5knr5O2+j8zgeszdHAWkyGfo1LviXB4JYQ4175LbvCZabRH3jCiAS+Ma149t6cqN6KxKAS8Ak6X1kiUEVZ/5hrmsWyZYlkKT0hRdUBzNczCUY7g32lsHvF6CHZFIRv4+fflXk0peyNvNPD3O+ujDRisxs+mtR4XB4t+RkLnoSXRjK3BN2BXQuAo+tFi1X+XkAqTtsx9EKwEqSf59Ct6FKvZdmsTjNsi9+hTLNdamjp8BfsSB0Jvv7LVkswr7e8V4MA7+7H81jyljNxQq99fiw8J8llGpF2EfgddEXRw8ZXciHfY/k0DeOg5jct3BlGDcbOOto92Jrq01sdo5+jiv/KnrgIovHgfjasidrkPqX/aUYdUGQKZS0M3qzd5DOzCsjWJ8N+I9vjSI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3dTs4ydw27j6lxWfcVNOFy623W9OJAUmShB/PKXskBlKQ7gy0+MD88HZb8D7?=
 =?us-ascii?Q?Q5JexKEhGK6wfRYKHzqcykUNFkSO6AWAL/yUsVA/ivGLYquu1YDlsjg+LBNX?=
 =?us-ascii?Q?5VK1Z3SppyljYiXfKa8jXd592Bg3t9+f+29Bd3Jrepu3k+IpGdlYrUP7BFmh?=
 =?us-ascii?Q?PIt4zmG9vxv32LHyOFtkP498DIjUt7VP3Q0eq4/FM54lBvmZ06DHJ6MWExDD?=
 =?us-ascii?Q?GAfossJ7BmX21goWsKE6SJ0dcDbSbLboKlNfxtwvmFJ7q+gFfmuNZ/GzIntP?=
 =?us-ascii?Q?vD4dQoGbseFYg7KSZFeJstCSysGnFDOfDXTxz+YVWKxce8dErHxA/xyZCISQ?=
 =?us-ascii?Q?IEtsmDyH5cTmJEBYJLiGcqc49fDdNtIOAOAUsSnlFFaBqrgjARF0XPCwAAW3?=
 =?us-ascii?Q?u3xgC70wIaXyF0ylZJJPS7oGNDu9Yf2ueRg/bcX/Aa3DZYnzsJJtnyDQSy52?=
 =?us-ascii?Q?IC1Vs+8KdLm6+iPY8vu61H0+ZnNbFtX7QVrjv6fcgOm8I/nCUE7WykSWoUUm?=
 =?us-ascii?Q?/8AFDq7Q9SnsPN1jy7EkXvzH42z68m9QxsjU+6XuJnDZer5gyv+7ZlUk56DH?=
 =?us-ascii?Q?mLf57uMdDf7MdI7ms3IKtDenoiSY7l4GqiWw+c4js8VnVj0sr95jhBcj8x7K?=
 =?us-ascii?Q?sZbE2lp/knp4PS3udENaTdGmm4hz8pmT9ThqCO9LSlT9b97WwZelCBW6j1QF?=
 =?us-ascii?Q?IDwSzcflEZVExCcZaQF9HZAmBy7GUDCuXuI3U3tNZ1MhUErbbi2iYn362CXo?=
 =?us-ascii?Q?2FCHq/mZZ1VmdsyM7f9P3/SrofLaLdPJfsxfFad2JHBzf1htgt7/PDD453E7?=
 =?us-ascii?Q?2vGDCPsEFOnLOE2sYKifrNfjT16n4CZTlCztcl2MKt4FSnjQocXOw4OKR2Vz?=
 =?us-ascii?Q?fVJDZDSVIG24wL6UZOM0OHJhqkSM/NlsnIHIKRzJleHCCgRclM9H3f3MPkMq?=
 =?us-ascii?Q?Zh2uGThWdL9oL97/uzAfQMZDRkoo0L+uMqaLOupMISf4D6KzNG2oIXAgHoW4?=
 =?us-ascii?Q?CyX1A8aAvZmBr2RohqFgZRlQ/N0OR966BOqLHp7ky/fid6gn8d4QWmPOGgM3?=
 =?us-ascii?Q?fcw0EkVB5ryLEw5/qxm4vmxh5/QMtYHW7ZT0xHHLiN0fza70+fsgpxvVo/q6?=
 =?us-ascii?Q?niPw6EnZZBZRJd0SNOI/qLL6LmOHwzIxnrRtPms0F9ntTXAiui/N5wguEEb3?=
 =?us-ascii?Q?5D1h+BUGjRyNZMe4i4ic1hVA6OSnkQDSbslwFevEXPIZ691eRtdz+s/LDi3m?=
 =?us-ascii?Q?nue5dIQcyv9YSLZTrHSIAo1WhPcN32Q/TE02F/u4/Aa6YLUKkjroQzq8o95i?=
 =?us-ascii?Q?h4CEVED4SFmiUCENxYOktoCvkXve508GvyQ5KHPwaFg/vUcGIhU+BC/smiI3?=
 =?us-ascii?Q?uvOud4Zkgejxu6WqGvFxteHvtMOdDmS5Q3r+ixEnnEvfYyr4s6NdAS9ND9EA?=
 =?us-ascii?Q?QAjRzf8cWcv9seUj9/iNQEko8idSEQL28mNtHq5CwoLbJhNYC2ZOCM7ScyOV?=
 =?us-ascii?Q?LOX3CCU/PGpYiSpdbYJ5YDCVllJcAKlCFhV9/aoaMmKHHr3clTeOtJ1hRj9M?=
 =?us-ascii?Q?nN7f9OepoZPP8MNxhk8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e89bef5-b356-4c4d-041a-08dc5e2d11c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2024 15:51:24.4257 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zy9npXOhW3bsRsKJnCU8u9Q68+/9gBkVo7iniAQd0cd8ZyVmeE8ZUBbjscJ656xK7rAsTAnlrR8wFRAV2y1D6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4767
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
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Wednesday, April 10, 2024 1:41 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Brost, Matthew <matthew.brost@intel.com>; Zeng, Oak
> <oak.zeng@intel.com>
> Subject: [PATCH 01/13] drm/xe: Lock all gpuva ops during VM bind IOCTL
>=20
> Lock all BOs used in gpuva ops and validate all BOs in a single step
> during the VM bind IOCTL.
>=20
> This help with the transition to making all gpuva ops in a VM bind IOCTL
> a single atomic job which is required for proper error handling.
>=20
> v2:
>  - Better commit message (Oak)
>  - s/op_lock/op_lock_and_prep, few other renames too (Oak)
>  - Use DRM_EXEC_IGNORE_DUPLICATES flag in drm_exec_init (local testing)
>  - Do not reserve slots in locking step (direction based on series from T=
homas)
>=20
> Cc: Oak Zeng <oak.zeng@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 147 +++++++++++++++++++++++++++----------
>  1 file changed, 107 insertions(+), 40 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 66b70fd3d105..6375c136e21a 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -414,19 +414,23 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
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
> @@ -656,7 +660,7 @@ static void preempt_rebind_work_func(struct
> work_struct *w)
>=20
>  	if (err) {
>  		drm_warn(&vm->xe->drm, "VM worker error: %d\n", err);
> -		xe_vm_kill(vm);
> +		xe_vm_kill(vm, true);
>  	}
>  	up_write(&vm->lock);
>=20
> @@ -1876,17 +1880,9 @@ static int xe_vm_bind(struct xe_vm *vm, struct
> xe_vma *vma, struct xe_exec_queue
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

In this original code, bo validate is conditional to this immediate bind fl=
ag. This flag is from DRM_XE_VM_BIND_FLAG_IMMEDIATE. It seems later in this=
 patch, the immediate flag is not used any more... can you explain? See bel=
ow

> -		if (err)
> -			return err;
> -	}
> -
>  	return __xe_vm_bind(vm, vma, q, syncs, num_syncs, immediate,
> first_op,
>  			    last_op);
>  }
> @@ -2539,17 +2535,13 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm
> *vm, struct xe_exec_queue *q,
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
>=20
> -	err =3D xe_vm_lock_vma(exec, vma);
> -	if (err)
> -		return err;
> -
>  	xe_vm_assert_held(vm);
>  	xe_bo_assert_held(xe_vma_bo(vma));
>=20
> @@ -2630,19 +2622,10 @@ static int op_execute(struct drm_exec *exec,
> struct xe_vm *vm,
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
> @@ -2807,29 +2790,113 @@ static void vm_bind_ioctl_ops_unwind(struct
> xe_vm *vm,
>  	}
>  }
>=20
> +static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *v=
ma,
> +				 bool validate)
> +{
> +	struct xe_bo *bo =3D xe_vma_bo(vma);
> +	int err =3D 0;
> +
> +	if (bo) {
> +		if (!bo->vm)
> +			err =3D drm_exec_prepare_obj(exec, &bo->ttm.base, 0);
> +		if (!err && validate)
> +			err =3D xe_bo_validate(bo, xe_vma_vm(vma), true);
> +	}
> +
> +	return err;
> +}
> +
> +static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
> +			    struct xe_vma_op *op)
> +{
> +	int err =3D 0;
> +
> +	switch (op->base.op) {
> +	case DRM_GPUVA_OP_MAP:
> +		err =3D vma_lock_and_validate(exec, op->map.vma,
> +					    !xe_vm_in_fault_mode(vm));

I meant here, should the last parameter be: !xe_vm_in_fault_mode(vm) && IMM=
EDIATE flag? Or maybe the IMMEDIATE flag is deleted? I did see it in xe_vm.=
c:

2796 #define SUPPORTED_FLAGS \
2797     (DRM_XE_VM_BIND_FLAG_READONLY | \
2798      DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
2799      DRM_XE_VM_BIND_FLAG_NULL | \

Oak


> +		break;
> +	case DRM_GPUVA_OP_REMAP:
> +		err =3D vma_lock_and_validate(exec,
> +					    gpuva_to_vma(op-
> >base.remap.unmap->va),
> +					    false);
> +		if (!err && op->remap.prev)
> +			err =3D vma_lock_and_validate(exec, op->remap.prev,
> true);
> +		if (!err && op->remap.next)
> +			err =3D vma_lock_and_validate(exec, op->remap.next,
> true);
> +		break;
> +	case DRM_GPUVA_OP_UNMAP:
> +		err =3D vma_lock_and_validate(exec,
> +					    gpuva_to_vma(op->base.unmap.va),
> +					    false);
> +		break;
> +	case DRM_GPUVA_OP_PREFETCH:
> +		err =3D vma_lock_and_validate(exec,
> +					    gpuva_to_vma(op-
> >base.prefetch.va), true);
> +		break;
> +	default:
> +		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> +	}
> +
> +	return err;
> +}
> +
> +static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
> +					   struct xe_vm *vm,
> +					   struct list_head *ops_list)
> +{
> +	struct xe_vma_op *op;
> +	int err;
> +
> +	err =3D drm_exec_prepare_obj(exec, xe_vm_obj(vm), 0);
> +	if (err)
> +		return err;
> +
> +	list_for_each_entry(op, ops_list, link) {
> +		err =3D op_lock_and_prep(exec, vm, op);
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
> +		err =3D vm_bind_ioctl_ops_lock_and_prep(&exec, vm, ops_list);
> +		drm_exec_retry_on_contention(&exec);
> +		if (err)
> +			goto unlock;
> +
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
>  #define SUPPORTED_FLAGS	\
> --
> 2.34.1

