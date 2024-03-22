Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59532C47DD9
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 16:11:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20DF61125BD;
	Fri, 22 Mar 2024 16:11:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rx7lhlue";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11A91125BD
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 16:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711123910; x=1742659910;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jWV4qM2LKXlVJKwMnakIhe6f8WqwPtRb8lWnTRQSo1A=;
 b=Rx7lhluea+UsiDgQ+nKahwEW+2MGaVGFE4O/gRazGm2GK6LmvLkNiKnv
 rxWOEGx8tbkAwscDFoUySkxqeL/t1xFmsAe1Uvgu8rRGX2jsYS4Lb5970
 2nDLvgsrdH9n//rlwNMiLuNTTqbIWPkNO8zp0YUwXSf1T9GVTdg/LrQ+X
 SWi9vgRnIaUGQhfvCR5iBXdhl+AuXOPOIIJTHQ3K7Uxp0Xal3zWQU1yMV
 dOfgNDwa6v8T456NRTUtOdbtZek0xaEciJXTSt3bX4EnmkPRAV5SvIL52
 rt/lH6OYWVZuMUCedajCgFAf9LjpPcW98NcG91qRSrMaySaMGBMZa5oNy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="23634620"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="23634620"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 09:11:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="45941006"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2024 09:11:49 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 09:11:48 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Mar 2024 09:11:48 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 09:11:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OSRjoiomjtlnZEdR5oOsqEaIYnLhbFUGa9pUqlJUcjeBoPudKxii1vf31E7neAXnIhjGRp7bsqxVSYzEmvV53ddLkFbdpOdE01wQwdL3oVo00RdDw5NZC/jrM6k61KbOUeQ4YXZncSyuIY5wJLcfRosi8z0VPYfNaI9rTwHe5oj4ZaclNRy9WNlfIKt9/70ShavmabYP9RkpMz9cKQUmcCNbBW3voB58Yx3kY2IhsVFF/xqjKpoXIS7hY2XYb5Jzrs8/iI4Hjumue4P2J8oMeXpOM5nDOZYd7B0xghrm0m9bJq0MlPVlTREX1exwYrqnMBF+qrax3FRKj06Civ65pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MeL2HeFix5lCphKAqx/ucEHOP3EpxHS2IlTcICZBhb4=;
 b=S018O8QOD40Hs4Wyjy5z8IIqhVHw6QVVXwd65w4O8b4fpL45iPYIsV+Gb7vm8i7JjR6yc6GO8Fvo1LJPf7JqCaZYycrYjmewD6Rd4e/h749/kXMjtq9+DKL0Wj9Nzmw7nKRW+pZFhJlyudvXq67iYF0WErjKkv/2hRDfk8OKXYVfSyk0ripMebPYlFZaZSSf3i1PpGMzxEm7rGMf+rHRN+CjxDd6vZjHnm/hyE1a8xflcEqcxMopjqdnzVHobsHPKPDfMG2GEDlOKJtvHg0UMQZIQMsAAwbMbHW/lE/p2tTH3G4953d1pQR+gX8W4gfOKfz6IBBrMK52IML2F2CN6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by PH8PR11MB7141.namprd11.prod.outlook.com (2603:10b6:510:22f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12; Fri, 22 Mar
 2024 16:11:41 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Fri, 22 Mar 2024
 16:11:41 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH v4 02/30] drm/xe: Add ops_execute function which returns a
 fence
Thread-Topic: [PATCH v4 02/30] drm/xe: Add ops_execute function which returns
 a fence
Thread-Index: AQHacRanQPPItcHGAUmHxaGgsV+USbFD9Tbg
Date: Fri, 22 Mar 2024 16:11:41 +0000
Message-ID: <SA1PR11MB69911B8FE510C66BEBA9F32D92312@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
 <20240308050806.577176-3-matthew.brost@intel.com>
In-Reply-To: <20240308050806.577176-3-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|PH8PR11MB7141:EE_
x-ms-office365-filtering-correlation-id: 986d6059-bd5f-4432-9306-08dc4a8ac2a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mG0QDFqZu0hU1Wm6hSyylVUCRpX5zl38VUPoJCOj/l8MdftNqWrCQ0Iw/7RMps4FIW6kfFjtEtdOr3wTHgewxoHxiEzYE9/1+ZnGPxOQxGCNjM/BFEVQy1e/EzmFJziDE9Ku7XH51KOTDtb+jzCe8lRkA+hrNwae8aOxfsiRqEf/XvHAY8KSQQiYK2jzepBdQyhvKMIiB50QDqtLNxS/ouhgFI8RUWNH3q0nfujsRlJ/6DAgelWFPONVi4FwaNJP4mch5D3Xy4Mu19PPY5DjVSwJ8JTNDO5QO1TFzMkyNESRJzdZ3mxhTEiCymvPFNZVYiU0P/oY59JLIfuPVkv6s95g7QMn5cCGpNBdoNJObg7pGpOlNuK8KeVVTqMsAnthdcN5eYnnmWqdTZVCpGzUcE6zCQ4qAM0ifACstHK9d21PJaXP/T0Iqvp5691k1Frflr3t23js9BEdTECDVnNYS4lf7mYWV738Rc6+ei/yTJ/xHXUdKBzNEb7Yh8OH0jnL/BnagezjF8eDj+N0xOiGLoXnMj6ZAublsYfdDkRPmm7K/yYTJrMYXTqHwABEvoA7zsXLr8u69M5bbxdvPpbGQ6wjn5kkOrIUfg2W0DoA4N1bi264Epeg3NbX+F8nuWCf9g9DRKJ7PTvlTPHhb4HnbT3RhiAoeoH7f+IfVMWA8MxotoS5ISxS9TFtWLz1stJU1/LjXXyAswfJ79mrbDvScQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4/+hFGLs61gg4ide7/WlO/yUSm9dphaOzDf+V4RGIPXgLOF0GGu/H+ujGCTe?=
 =?us-ascii?Q?KzADrTToxHqAxidjJiJuC/wBegnsRAFwjSs0VUOV9M148K7IhM/ORiSQufqb?=
 =?us-ascii?Q?kfzmJ5MtUqd60/iPja+I8ZqrPT7NBb7LOvLP2cryyMKDeK9cghpxZnmDoJcf?=
 =?us-ascii?Q?PPSEqLD3sifuOpf157UlR9lLhBuHhzTTDE1InkSo5RCf5LRaVCwYR+0VW5bP?=
 =?us-ascii?Q?rQDkMlvbi19IcKcDPW2833qiYAXLXs3y3kCGt7st7YRNsj8HYy8PsONaHb6s?=
 =?us-ascii?Q?ZI2768Hg8uvOUkxLT5s6lKJx7XdhcKT6l3tfoi5BDDN3lmjjtL3G00qoxJr8?=
 =?us-ascii?Q?sdVBg3klYTAgYMnqsRjoYcMyK4eAl3AcpAM+z84h/qlZUndgNhDMJzy0CGUU?=
 =?us-ascii?Q?2LJpsdvnuoDTsAw8HgM9/NnxUFa0eqIrguSo1PHWGtOezx9eUz1avckkXjXI?=
 =?us-ascii?Q?BtEizVIR1SouVO+cQ6mKtS65/v9DVVbU81h10D5G09C6dWdyspAXfPOJhbCY?=
 =?us-ascii?Q?gmh9DIdpR7hToim7l4Wd6SwVxmUvIOLi1+2l7qWWay7fRAqn50j+P1rlcm3e?=
 =?us-ascii?Q?jqrLGDXhoX24P2uNmytZx+IxkwXYpXC5C2xZSnebhItoKrwRnb1P0xpH/Kdj?=
 =?us-ascii?Q?o3iX5iwRXiAbdDN+IETqxRgQ/g4OLC5Z+jnnsmDb1fSsQInn9hlOA9vMhxp7?=
 =?us-ascii?Q?A+rAVFdxhLBWb00s9NUS+YL/DVQCyj0E1qn8Vk53VE4R2KwIX5Fjzh+B3aoG?=
 =?us-ascii?Q?tokQJz3n2JrpeXwZ3uJOJa8Zrup90QlWyfUDCM3gihpr0jEpy5meld6FE/Gw?=
 =?us-ascii?Q?Hzi7lEPHdiIOjF3P+mw8d8s+Adsb4GBPzbwGTnLnE7qDYcUx6n2Gw7y3AR0/?=
 =?us-ascii?Q?7/Y/BKkHyIaavq0H871NoqFk9h2472aHWZqxTQ+FHvHh/yMBarW2HPFgY9Mx?=
 =?us-ascii?Q?5Kur09Ctq7jmtfAfxeGdfMVY9Jy/6aMz9bI50B1wM60Xdaxd+ProKIiscH+o?=
 =?us-ascii?Q?nzcSLVrQ9LElkCX26IYmPkSdx8a+uAyhE5vWt40sWaNt/plNMMinoGyC3aM/?=
 =?us-ascii?Q?YFobRFnOA7Wy99zXbxhJR0fm8X06qKc0e+DYo9gtdrsH1+HEsuJFw9w4mnBq?=
 =?us-ascii?Q?YdzbCJ4btIunagaz0grdV7/fswaB726v+y2xa/OrR9E+PUsADHDzmdHOlsKt?=
 =?us-ascii?Q?SqSfl1AZbc2wzQB5xHcmiwNZtB7C4n6u029TaLBnzOB3mMGqFJI+tSl08SMZ?=
 =?us-ascii?Q?MxGIfO+yvgEen1fjlhkkwqueo3x2rLr5pj70OGiAXkccsM1DN7hYj+eQZ6Tf?=
 =?us-ascii?Q?wSaeuQiNMD+cbnnc+JSUMAh3tH2Ag/p62j6mCH9dEHP2PyH7Vg/nyqZbKppn?=
 =?us-ascii?Q?1JdN4zlzdkUd26snS/j035JInQm0smwNjZL2/FWubE8ALbsIIJXCi6jwyR/q?=
 =?us-ascii?Q?fyOa2K0ajWvy2GBL781ZtN0gC2hvxL0yzXeWrmQYwWggLAtYOxTN3niQSKT9?=
 =?us-ascii?Q?pWff1AhyEGswV3boMj6gbVKOV6W+rKLpi4FXBf5yybeVCt1jImQuStIzGjWT?=
 =?us-ascii?Q?1gBgmATueZOSQxl5qYY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 986d6059-bd5f-4432-9306-08dc4a8ac2a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2024 16:11:41.0754 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IVZc3mryXwhlJfluNAJCFPKf9XB3FKZemi884z+bFtQxrJZ6yHyB2rpf7DFFZT8rwJkMhmrDFHOvnKI4oC1PRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7141
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
> Subject: [PATCH v4 02/30] drm/xe: Add ops_execute function which returns =
a
> fence
>=20
> Add ops_execute function which returns a fence. This will be helpful to
> initiate all binds (VM bind IOCTL, rebinds in exec IOCTL, rebinds in
> preempt rebind worker, and rebinds in pagefaults) via a gpuva ops list.
> Returning a fence is needed in various paths.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 211 +++++++++++++++++++------------------
>  1 file changed, 111 insertions(+), 100 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 3b5dc6de07f7..fb73afcab3b7 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1789,16 +1789,17 @@ find_ufence_get(struct xe_sync_entry *syncs, u32
> num_syncs)
>  	return NULL;
>  }
>=20
> -static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
> -			struct xe_exec_queue *q, struct xe_sync_entry *syncs,
> -			u32 num_syncs, bool immediate, bool first_op,
> -			bool last_op)
> +static struct dma_fence *
> +xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct xe_exec_queue *q=
,
> +	   struct xe_bo *bo, struct xe_sync_entry *syncs, u32 num_syncs,
> +	   bool immediate, bool first_op, bool last_op)
>  {
>  	struct dma_fence *fence;
>  	struct xe_exec_queue *wait_exec_queue =3D to_wait_exec_queue(vm,
> q);
>  	struct xe_user_fence *ufence;
>=20
>  	xe_vm_assert_held(vm);
> +	xe_bo_assert_held(bo);
>=20
>  	ufence =3D find_ufence_get(syncs, num_syncs);
>  	if (vma->ufence && ufence)
> @@ -1810,7 +1811,7 @@ static int __xe_vm_bind(struct xe_vm *vm, struct
> xe_vma *vma,
>  		fence =3D xe_vm_bind_vma(vma, q, syncs, num_syncs, first_op,
>  				       last_op);
>  		if (IS_ERR(fence))
> -			return PTR_ERR(fence);
> +			return fence;
>  	} else {
>  		int i;
>=20
> @@ -1825,26 +1826,14 @@ static int __xe_vm_bind(struct xe_vm *vm, struct
> xe_vma *vma,
>=20
>  	if (last_op)
>  		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
> -	dma_fence_put(fence);
> -
> -	return 0;
> -}
> -
> -static int xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct
> xe_exec_queue *q,
> -		      struct xe_bo *bo, struct xe_sync_entry *syncs,
> -		      u32 num_syncs, bool immediate, bool first_op,
> -		      bool last_op)
> -{
> -	xe_vm_assert_held(vm);
> -	xe_bo_assert_held(bo);
>=20
> -	return __xe_vm_bind(vm, vma, q, syncs, num_syncs, immediate,
> first_op,
> -			    last_op);
> +	return fence;
>  }
>=20
> -static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
> -			struct xe_exec_queue *q, struct xe_sync_entry *syncs,
> -			u32 num_syncs, bool first_op, bool last_op)
> +static struct dma_fence *
> +xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
> +	     struct xe_exec_queue *q, struct xe_sync_entry *syncs,
> +	     u32 num_syncs, bool first_op, bool last_op)
>  {
>  	struct dma_fence *fence;
>  	struct xe_exec_queue *wait_exec_queue =3D to_wait_exec_queue(vm,
> q);
> @@ -1854,14 +1843,13 @@ static int xe_vm_unbind(struct xe_vm *vm, struct
> xe_vma *vma,
>=20
>  	fence =3D xe_vm_unbind_vma(vma, q, syncs, num_syncs, first_op,
> last_op);
>  	if (IS_ERR(fence))
> -		return PTR_ERR(fence);
> +		return fence;
>=20
>  	xe_vma_destroy(vma, fence);
>  	if (last_op)
>  		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
> -	dma_fence_put(fence);
>=20
> -	return 0;
> +	return fence;
>  }
>=20
>  #define ALL_DRM_XE_VM_CREATE_FLAGS
> (DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE | \
> @@ -2004,10 +1992,11 @@ static const u32 region_to_mem_type[] =3D {
>  	XE_PL_VRAM1,
>  };
>=20
> -static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
> -			  struct xe_exec_queue *q, u32 region,
> -			  struct xe_sync_entry *syncs, u32 num_syncs,
> -			  bool first_op, bool last_op)
> +static struct dma_fence *
> +xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
> +	       struct xe_exec_queue *q, u32 region,
> +	       struct xe_sync_entry *syncs, u32 num_syncs,
> +	       bool first_op, bool last_op)
>  {
>  	struct xe_exec_queue *wait_exec_queue =3D to_wait_exec_queue(vm,
> q);
>  	int err;
> @@ -2017,27 +2006,24 @@ static int xe_vm_prefetch(struct xe_vm *vm, struc=
t
> xe_vma *vma,
>  	if (!xe_vma_has_no_bo(vma)) {
>  		err =3D xe_bo_migrate(xe_vma_bo(vma),
> region_to_mem_type[region]);
>  		if (err)
> -			return err;
> +			return ERR_PTR(err);
>  	}
>=20
>  	if (vma->tile_mask !=3D (vma->tile_present & ~vma->usm.tile_invalidated=
))
> {
>  		return xe_vm_bind(vm, vma, q, xe_vma_bo(vma), syncs,
> num_syncs,
>  				  true, first_op, last_op);
>  	} else {
> +		struct dma_fence *fence =3D
> +			xe_exec_queue_last_fence_get(wait_exec_queue, vm);
>  		int i;
>=20
>  		/* Nothing to do, signal fences now */
>  		if (last_op) {
> -			for (i =3D 0; i < num_syncs; i++) {
> -				struct dma_fence *fence =3D
> -
> 	xe_exec_queue_last_fence_get(wait_exec_queue, vm);
> -
> +			for (i =3D 0; i < num_syncs; i++)
>  				xe_sync_entry_signal(&syncs[i], NULL, fence);
> -				dma_fence_put(fence);
> -			}
>  		}
>=20
> -		return 0;
> +		return fence;
>  	}
>  }
>=20
> @@ -2484,10 +2470,10 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm
> *vm, struct xe_exec_queue *q,
>  	return 0;
>  }
>=20
> -static int op_execute(struct xe_vm *vm, struct xe_vma *vma,
> -		      struct xe_vma_op *op)
> +static struct dma_fence *op_execute(struct xe_vm *vm, struct xe_vma *vma=
,
> +				    struct xe_vma_op *op)
>  {
> -	int err;
> +	struct dma_fence *fence =3D NULL;
>=20
>  	lockdep_assert_held_write(&vm->lock);
>  	xe_vm_assert_held(vm);
> @@ -2495,11 +2481,11 @@ static int op_execute(struct xe_vm *vm, struct
> xe_vma *vma,
>=20
>  	switch (op->base.op) {
>  	case DRM_GPUVA_OP_MAP:
> -		err =3D xe_vm_bind(vm, vma, op->q, xe_vma_bo(vma),
> -				 op->syncs, op->num_syncs,
> -				 !xe_vm_in_fault_mode(vm),
> -				 op->flags & XE_VMA_OP_FIRST,
> -				 op->flags & XE_VMA_OP_LAST);
> +		fence =3D xe_vm_bind(vm, vma, op->q, xe_vma_bo(vma),
> +				   op->syncs, op->num_syncs,
> +				   !xe_vm_in_fault_mode(vm),
> +				   op->flags & XE_VMA_OP_FIRST,
> +				   op->flags & XE_VMA_OP_LAST);
>  		break;
>  	case DRM_GPUVA_OP_REMAP:
>  	{
> @@ -2509,37 +2495,39 @@ static int op_execute(struct xe_vm *vm, struct
> xe_vma *vma,
>  		if (!op->remap.unmap_done) {
>  			if (prev || next)
>  				vma->gpuva.flags |=3D XE_VMA_FIRST_REBIND;
> -			err =3D xe_vm_unbind(vm, vma, op->q, op->syncs,
> -					   op->num_syncs,
> -					   op->flags & XE_VMA_OP_FIRST,
> -					   op->flags & XE_VMA_OP_LAST &&
> -					   !prev && !next);
> -			if (err)
> +			fence =3D xe_vm_unbind(vm, vma, op->q, op->syncs,
> +					     op->num_syncs,
> +					     op->flags & XE_VMA_OP_FIRST,
> +					     op->flags & XE_VMA_OP_LAST &&
> +					     !prev && !next);
> +			if (IS_ERR(fence))
>  				break;
>  			op->remap.unmap_done =3D true;
>  		}
>=20
>  		if (prev) {
>  			op->remap.prev->gpuva.flags |=3D XE_VMA_LAST_REBIND;
> -			err =3D xe_vm_bind(vm, op->remap.prev, op->q,
> -					 xe_vma_bo(op->remap.prev), op->syncs,
> -					 op->num_syncs, true, false,
> -					 op->flags & XE_VMA_OP_LAST
> && !next);
> +			dma_fence_put(fence);


So you drop the previous fence. I assume in later operation, we will need t=
o wait dma-fence for the previous operation to complete. Is it safe to only=
 wait for the last fence? Shouldn't we wait all the fences, such as chain t=
he fences in some way?

> +			fence =3D xe_vm_bind(vm, op->remap.prev, op->q,
> +					   xe_vma_bo(op->remap.prev), op-
> >syncs,
> +					   op->num_syncs, true, false,
> +					   op->flags & XE_VMA_OP_LAST
> && !next);
>  			op->remap.prev->gpuva.flags &=3D
> ~XE_VMA_LAST_REBIND;
> -			if (err)
> +			if (IS_ERR(fence))
>  				break;
>  			op->remap.prev =3D NULL;
>  		}
>=20
>  		if (next) {
>  			op->remap.next->gpuva.flags |=3D XE_VMA_LAST_REBIND;
> -			err =3D xe_vm_bind(vm, op->remap.next, op->q,
> -					 xe_vma_bo(op->remap.next),
> -					 op->syncs, op->num_syncs,
> -					 true, false,
> -					 op->flags & XE_VMA_OP_LAST);
> +			dma_fence_put(fence);


Same comment as above
> +			fence =3D xe_vm_bind(vm, op->remap.next, op->q,
> +					   xe_vma_bo(op->remap.next),
> +					   op->syncs, op->num_syncs,
> +					   true, false,
> +					   op->flags & XE_VMA_OP_LAST);
>  			op->remap.next->gpuva.flags &=3D
> ~XE_VMA_LAST_REBIND;
> -			if (err)
> +			if (IS_ERR(fence))
>  				break;
>  			op->remap.next =3D NULL;
>  		}
> @@ -2547,34 +2535,36 @@ static int op_execute(struct xe_vm *vm, struct
> xe_vma *vma,
>  		break;
>  	}
>  	case DRM_GPUVA_OP_UNMAP:
> -		err =3D xe_vm_unbind(vm, vma, op->q, op->syncs,
> -				   op->num_syncs, op->flags &
> XE_VMA_OP_FIRST,
> -				   op->flags & XE_VMA_OP_LAST);
> +		fence =3D xe_vm_unbind(vm, vma, op->q, op->syncs,
> +				     op->num_syncs, op->flags &
> XE_VMA_OP_FIRST,
> +				     op->flags & XE_VMA_OP_LAST);
>  		break;
>  	case DRM_GPUVA_OP_PREFETCH:
> -		err =3D xe_vm_prefetch(vm, vma, op->q, op->prefetch.region,
> -				     op->syncs, op->num_syncs,
> -				     op->flags & XE_VMA_OP_FIRST,
> -				     op->flags & XE_VMA_OP_LAST);
> +		fence =3D xe_vm_prefetch(vm, vma, op->q, op->prefetch.region,
> +				       op->syncs, op->num_syncs,
> +				       op->flags & XE_VMA_OP_FIRST,
> +				       op->flags & XE_VMA_OP_LAST);
>  		break;
>  	default:
>  		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
>  	}
>=20
> -	if (err)
> +	if (IS_ERR(fence))
>  		trace_xe_vma_fail(vma);
>=20
> -	return err;
> +	return fence;
>  }
>=20
> -static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
> -			       struct xe_vma_op *op)
> +static struct dma_fence *
> +__xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
> +		    struct xe_vma_op *op)
>  {
> +	struct dma_fence *fence;
>  	int err;
>=20
>  retry_userptr:
> -	err =3D op_execute(vm, vma, op);
> -	if (err =3D=3D -EAGAIN) {
> +	fence =3D op_execute(vm, vma, op);
> +	if (IS_ERR(fence) && PTR_ERR(fence) =3D=3D -EAGAIN) {
>  		lockdep_assert_held_write(&vm->lock);
>=20
>  		if (op->base.op =3D=3D DRM_GPUVA_OP_REMAP) {
> @@ -2591,22 +2581,24 @@ static int __xe_vma_op_execute(struct xe_vm *vm,
> struct xe_vma *vma,
>  			if (!err)
>  				goto retry_userptr;
>=20
> +			fence =3D ERR_PTR(err);
>  			trace_xe_vma_fail(vma);
>  		}
>  	}
>=20
> -	return err;
> +	return fence;
>  }
>=20
> -static int xe_vma_op_execute(struct xe_vm *vm, struct xe_vma_op *op)
> +static struct dma_fence *
> +xe_vma_op_execute(struct xe_vm *vm, struct xe_vma_op *op)
>  {
> -	int ret =3D 0;
> +	struct dma_fence *fence =3D ERR_PTR(-ENOMEM);
>=20
>  	lockdep_assert_held_write(&vm->lock);
>=20
>  	switch (op->base.op) {
>  	case DRM_GPUVA_OP_MAP:
> -		ret =3D __xe_vma_op_execute(vm, op->map.vma, op);
> +		fence =3D __xe_vma_op_execute(vm, op->map.vma, op);
>  		break;
>  	case DRM_GPUVA_OP_REMAP:
>  	{
> @@ -2619,23 +2611,23 @@ static int xe_vma_op_execute(struct xe_vm *vm,
> struct xe_vma_op *op)
>  		else
>  			vma =3D op->remap.next;
>=20
> -		ret =3D __xe_vma_op_execute(vm, vma, op);
> +		fence =3D __xe_vma_op_execute(vm, vma, op);
>  		break;
>  	}
>  	case DRM_GPUVA_OP_UNMAP:
> -		ret =3D __xe_vma_op_execute(vm, gpuva_to_vma(op-
> >base.unmap.va),
> -					  op);
> +		fence =3D __xe_vma_op_execute(vm, gpuva_to_vma(op-
> >base.unmap.va),
> +					    op);
>  		break;
>  	case DRM_GPUVA_OP_PREFETCH:
> -		ret =3D __xe_vma_op_execute(vm,
> -					  gpuva_to_vma(op->base.prefetch.va),
> -					  op);
> +		fence =3D __xe_vma_op_execute(vm,
> +					    gpuva_to_vma(op->base.prefetch.va),
> +					    op);
>  		break;
>  	default:
>  		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
>  	}
>=20
> -	return ret;
> +	return fence;
>  }
>=20
>  static void xe_vma_op_cleanup(struct xe_vm *vm, struct xe_vma_op *op)
> @@ -2803,11 +2795,35 @@ static int vm_bind_ioctl_ops_lock(struct drm_exec
> *exec,
>  	return 0;
>  }
>=20
> +static struct dma_fence *ops_execute(struct xe_vm *vm,
> +				     struct list_head *ops_list,
> +				     bool cleanup)
> +{
> +	struct xe_vma_op *op, *next;
> +	struct dma_fence *fence =3D NULL;
> +
> +	list_for_each_entry_safe(op, next, ops_list, link) {
> +		if (!IS_ERR(fence)) {
> +			dma_fence_put(fence);
> +			fence =3D xe_vma_op_execute(vm, op);

So you only return the fence of the last operation. In the later on codes, =
do you use fence to wait for *all* operations to finish?

> +		}
> +		if (IS_ERR(fence)) {
> +			drm_warn(&vm->xe->drm, "VM op(%d) failed with %ld",
> +				 op->base.op, PTR_ERR(fence));
> +			fence =3D ERR_PTR(-ENOSPC);

So even if there is error, you don't break the loop. Is it to perform the c=
leanup below?

Once error happen for one operation, you seem to print the same error messa=
ge for all the rest operations....because fence =3D xe_vma_op_execute(vm, o=
p) is not called anymore after the first error


Oak

> +		}
> +		if (cleanup)
> +			xe_vma_op_cleanup(vm, op);
> +	}
> +
> +	return fence;
> +}
> +
>  static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
>  				     struct list_head *ops_list)
>  {
>  	struct drm_exec exec;
> -	struct xe_vma_op *op, *next;
> +	struct dma_fence *fence;
>  	int err;
>=20
>  	lockdep_assert_held_write(&vm->lock);
> @@ -2820,19 +2836,14 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm
> *vm,
>  		if (err)
>  			goto unlock;
>=20
> -		list_for_each_entry_safe(op, next, ops_list, link) {
> -			err =3D xe_vma_op_execute(vm, op);
> -			if (err) {
> -				drm_warn(&vm->xe->drm, "VM op(%d) failed
> with %d",
> -					 op->base.op, err);
> -				/*
> -				 * FIXME: Killing VM rather than proper error
> handling
> -				 */
> -				xe_vm_kill(vm, false);
> -				err =3D -ENOSPC;
> -				goto unlock;
> -			}
> -			xe_vma_op_cleanup(vm, op);
> +		fence =3D ops_execute(vm, ops_list, true);
> +		if (IS_ERR(fence)) {
> +			err =3D PTR_ERR(fence);
> +			/* FIXME: Killing VM rather than proper error handling */
> +			xe_vm_kill(vm, false);
> +			goto unlock;
> +		} else {
> +			dma_fence_put(fence);
>  		}
>  	}
>=20
> --
> 2.34.1

