Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF44C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 19:27:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33AAF113F45;
	Thu, 18 Apr 2024 19:27:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OLu6Vk+6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5FA6113F44
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Apr 2024 19:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713468448; x=1745004448;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=4V6eFQKz5yJYBzvYfwivWu/rs3ZUYvwfx8QpVk2HQbk=;
 b=OLu6Vk+6ubZEQ/3rTpLubCrMYyYDUDPifZ/5yB7v3YrV3VSGQA6yvIDf
 5WuPKquhMOqGMkeeOlvYFVgR7tpSK1qx4+T7rKNYEewOb+mZ6y0fFtlKm
 6cvuLS+qrZX4ibbqENerls9qicWrzq3xU/EQxdV54T9g/+2ySGnsYXdob
 8CJOZzFBWBa9ZzLhlKmSRtyBUzHJlHBEJSgnrIOAG0JGyaeJ+tF+bOU6+
 Pp2J3AmSmcO7gqhDqbsILGPP0PqtojOzrPqkNPXu6Spf+10wK2GMFI1bG
 Vl46wbflGr93LDEqehlHiE3eK/M/wcu34R5b8LhknltI2F1SjjxtSxFRE Q==;
X-CSE-ConnectionGUID: rkl4BunYR1KZKs3FQzmrUg==
X-CSE-MsgGUID: Hl6tehffS2S2BgyeFm/D9Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8967387"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="8967387"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 12:27:27 -0700
X-CSE-ConnectionGUID: aAHXi9ctRoSgWg9Nqeu0KQ==
X-CSE-MsgGUID: c6zVvcQRShKeryARkoZZdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23154550"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Apr 2024 12:27:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 12:27:26 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 12:27:26 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 12:27:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eI1O2WfFtJisP71nbmGHNn/Y5YtItrx16PIl3G1fzhlNKkQEfHBDN9QsUI148ZR6pyC+WMCzsepVuprh8yKeZOMS6IRBogW2lZ9EQaGmD7ML4a2IvZUALslzFySt0Kb6cP/AH37Y5Or7VeiqnmnXIDfTHjPTLVQK8nTtPkQyMXeGOwJFGjunF7OPBjmG+JUdX4UwrQziT+6JbeNL97u1NvdgWZQVK/c9kOzXLJm1vBD4+FFjMleeqyhndyB1JHpWc9+RHYolo2GHOZbM5XEQRAbeLsxFQvfWblzC1t2TEYeDRCtn+DSuJKVqJbw76hCOkhonlfrxRyhZNMTeLmrLhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgta1u222XIrKUk3OmtDeyvJSJFqXkNObEFL0KmYKmc=;
 b=dG+oCK82DhFEUjkQ+YFAr7Dk6WSec3MZgAHSKFIzE1PeFKgaVHw63brtEUM47I068Wq0ICNmNtYaRVD71SouFOTq2xESB1D1atCdxKpMDwTWTjSFJz/se8J3GoHwrhsiWe1ltf3XIxqK6pXFVZeVIn68ZE9M7YRpJlELICPWGDgs+MaBd2y4y0ox7k5Vz8+iLh9Rd/dVoelWSmsEVekeq1kc0omoqsYO1LtynGmFdyuueLqV41Ww4uTwgQCfLdtz5Bv3rnGn9dW+6LNVWYhSg25/HwSI43wfMVMkQqqe1npqR7S6QhdoN5H3S8lnO2clg1LTv1PH2IxkxphmXOOOuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by LV8PR11MB8557.namprd11.prod.outlook.com (2603:10b6:408:1e8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.29; Thu, 18 Apr
 2024 19:27:14 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 19:27:13 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 03/13] drm/xe: Move migrate to prefetch to
 op_lock_and_prep function
Thread-Topic: [PATCH 03/13] drm/xe: Move migrate to prefetch to
 op_lock_and_prep function
Thread-Index: AQHaiwmiIx9LRT85vUqUHit7j/MI87FudSJQ
Date: Thu, 18 Apr 2024 19:27:13 +0000
Message-ID: <SA1PR11MB699182390BCE532BD3E5939A920E2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240410054056.478023-1-matthew.brost@intel.com>
 <20240410054056.478023-4-matthew.brost@intel.com>
In-Reply-To: <20240410054056.478023-4-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|LV8PR11MB8557:EE_
x-ms-office365-filtering-correlation-id: 504dbbd1-6cf4-41c0-4ef8-08dc5fdd8d17
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FPGDFlebBU5wEGyAacRR90sqtyEqENhxEDSBUCGSau/AXdtcEtpFJ4OxBbz5u3xtxROZ7Up49QAgkVX/bjWa+ZPGKxwhJ/X3QInHfk+HjumUjLC3USqr9LaWkfEw7NtnIvnKTN57GRNxBvCk2Kt3YMIsB/svJTq8SAHdtDM83x7pY24gnuS+nMVLGucs4Ebtjqh0UeUJF/jvgtoeyhyOK5oSk8UP+7Md13xMFg+kIRHf6/X95du8FjT7C858Y9hrh77bgtCUgcGbPJT4dkujv70IWInEqITBatWP8L7UB5hACn2VIEaPnpj7pCRGs9Kjo3MgcmXGtcsCzLOW7Ev3X5dB0ls+Cr5eG3DClTvfhEXXtejt9HnTC6U+oADPzbe5oUgJa+ZEyRUl9BngfkAvj7kvJ+G+CXd3R9rE8sQTgVozh9mymUa6VWIpSYyU7r+Z3XD2zonFLz/2DmgXDF0rRh8565ffZYZ9BFPOjob7PvIUaS0CuLLTJiFm5AO2gy0B7sn+l/Npwv2cbF41CiRuaeSspuIUNHqwHqzDwkq1hOEsANA5N2on7aWZOpjE5F1AM78MpzbeUmbEfx+RzES8yX76DuozFd3h+mjJjjcVvInop+CM/SLiMREY0yFPYfks0cAzb7ramkaYB98FoazAe1XTL/oIQ/HNySs7VSyNg0OwcDN/xGdxtOUTxZT7+Y/fsK6yy1QKrhkbwBuOjmomtFc4TXgt1B6ZXfdNuFUXGVc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mPTpSaypnd4UeAbqHkejTapvAUkiltiKBPYJbSP3RwjAT65lQEY2XosIQwIW?=
 =?us-ascii?Q?8tKj8Rx0RMwkmsGDescYsAI57B0qOZPLyZECWhK/IdolLY7HQ9quPRiF6+Fl?=
 =?us-ascii?Q?Ex/EdLqdQVuLBa63QpcWEpbDEFmvKtEo1j7ocTOdR/gt7E13lYe8RE/5yuyT?=
 =?us-ascii?Q?nnyTmivDpts29HHByEUQVI2qTQp4Qx8VqEwvVKVn/qfsHYUgnaNQQGmSLWKH?=
 =?us-ascii?Q?iUUmqByMdgMwz9nvCenNm5xrvU4D2PdTywzcxZ1VG9lZD+PXC4zdpAlUeFia?=
 =?us-ascii?Q?M6D8CoBBTh4x5y99ESMYtD0NtjCL2kNbXGz0R9m9HEQoIWCX9dsKhgAWpRxn?=
 =?us-ascii?Q?h0ZdbS5N6O1CC2A3w4WWxI6HyauOPfTRYuLKviHXaKTs3lHh6pXhxoCa/h2Q?=
 =?us-ascii?Q?EHinTpl1HW9kPFB9jwHCLoT3eoSDgTyYUsx+qAn9qdeBHBGbcMszsImN9FwA?=
 =?us-ascii?Q?UJ1Agx603AuRuMyQZvcOkAbeUk0voXgDZBEbJrMvtrHDAyQKFKVnaUDSdj7F?=
 =?us-ascii?Q?G7zXNw95jWq4vSu8GkQlhI0pYv7phVF7JL5bmeD8M3thR5qV5QWN2l/umsBN?=
 =?us-ascii?Q?FpzKWzjgjbUtoxqdQxDB6ZhZ5Vd45iPvUpTIsBnjn7QiDRgQylex6UTi9Ie5?=
 =?us-ascii?Q?VpQVGIsNu+2yPwv0XdvuLbljOc8KhWPRJXshAh2uCSMQU+1X1Why7KdQmjVj?=
 =?us-ascii?Q?FoduIHwo1zN08xtje4u7yUAS9QPh5wOI5GsgAJaJxVhJ/jmmeBsOTHyoijTH?=
 =?us-ascii?Q?CeZLctNgG1qaoh1DSOmd/6yx0DqJHCkw6PoZ/kEpBoPyZobYavJIKWZ9sT95?=
 =?us-ascii?Q?DSIrEqdc1eMKWprm+61wKO45Id3vNOjZdNCrefqn5InR52iYvozT6Dc9USfc?=
 =?us-ascii?Q?Svkl0Y7KfXB6bYDURRlGHO7F5lhi4pFEOf12sY+FVhujG8O7Vermc/+q59tX?=
 =?us-ascii?Q?3xflV7thZd6o/b0x/+WCIMefJmGq9etPMyIm1sGLwCynijyJJv3ekJGJCHUH?=
 =?us-ascii?Q?HmMi5ER5Vq8mWSxQwRiA+ZS9SzIATeX8OA4o0GeOkB3F/WP8SPL5UhyCVcE8?=
 =?us-ascii?Q?P0CI8iwPCVQgSPjZ+9NeLbgqsG+Dqtz1ZrBPyTFwLHCNJCkAMotIHu0hVkTh?=
 =?us-ascii?Q?EARgwtpr/wmgEb9387BQbbvJCpGOl0CQ4rGtLfNvgHF7RTjHcQtTniPGtTyv?=
 =?us-ascii?Q?4bn5Bzc6UfFTj31HIAJJCL0L2lPD2rsPAgRauWc4YjdOy+E6hj1O0Zuh7jpb?=
 =?us-ascii?Q?kUB5+vuCmB8esfbgfT+a/4iNz3I2jasXjkHTa671g6dgAlzXd+ERGcU8fwrY?=
 =?us-ascii?Q?CqKrqV/a7wW7GryjeSESK+fpvMH61+GRMkgrkGXxGdYU379ewSbmAVjPGieV?=
 =?us-ascii?Q?KOk2V7gtUeKvfZ7sZHC92O+awQuF4ghWfw36t7/oghVlZebEtYyMlQMo4fKK?=
 =?us-ascii?Q?BMc6a5dmIk5BzfwkTQUCBvorxEVOEyfq/PhUGY1rlljNt+DQwfb3vLvwYub0?=
 =?us-ascii?Q?LjULM2YiXRFFJIqo/3pbo2wDRp+FtAzPYYJ9f0xA5Y10RliBNWJKtM8I9Rfq?=
 =?us-ascii?Q?b2pcDTKuodLfRxhV2JQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 504dbbd1-6cf4-41c0-4ef8-08dc5fdd8d17
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2024 19:27:13.9122 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fED9nce19GcKURlWnc9jhUILBE0QiNy4VAC/UNPRDJQb5Edpyf1fLjvdl/GyggJK+wXgTraPzUziQ2iFeaEDIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8557
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
> Subject: [PATCH 03/13] drm/xe: Move migrate to prefetch to
> op_lock_and_prep function
>=20
> All non-binding operations in VM bind IOCTL should be in the lock and
> prepare step rather than the execution step. Move prefetch to conform to
> this pattern.
>=20
> v2:
>  - Rebase
>  - New function names (Oak)
>  - Update stale comment (Oak)
>=20
> Cc: Oak Zeng <oak.zeng@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 84c6b10b4b78..2c0521573154 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2039,20 +2039,10 @@ static const u32 region_to_mem_type[] =3D {
>=20
>  static struct dma_fence *
>  xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
> -	       struct xe_exec_queue *q, u32 region,
> -	       struct xe_sync_entry *syncs, u32 num_syncs,
> -	       bool first_op, bool last_op)
> +	       struct xe_exec_queue *q, struct xe_sync_entry *syncs,
> +	       u32 num_syncs, bool first_op, bool last_op)


I am wondering, do you still need this function? The original prefetch func=
tion is migration + vm_bind. Now you moved the migration to lock_and_prepar=
e step, only vm bind left...

Even if you keep this function, we should change the name... it is not a pr=
efetch anymore...

Oak

>  {
>  	struct xe_exec_queue *wait_exec_queue =3D
> to_wait_exec_queue(vm, q);
> -	int err;
> -
> -	xe_assert(vm->xe, region < ARRAY_SIZE(region_to_mem_type));
> -
> -	if (!xe_vma_has_no_bo(vma)) {
> -		err =3D xe_bo_migrate(xe_vma_bo(vma),
> region_to_mem_type[region]);
> -		if (err)
> -			return ERR_PTR(err);
> -	}
>=20
>  	if (vma->tile_mask !=3D (vma->tile_present & ~vma->tile_invalidated))
> {
>  		return xe_vm_bind(vm, vma, q, xe_vma_bo(vma), syncs,
> num_syncs,
> @@ -2592,8 +2582,7 @@ static struct dma_fence *op_execute(struct xe_vm
> *vm, struct xe_vma *vma,
>  				     op->flags & XE_VMA_OP_LAST);
>  		break;
>  	case DRM_GPUVA_OP_PREFETCH:
> -		fence =3D xe_vm_prefetch(vm, vma, op->q, op-
> >prefetch.region,
> -				       op->syncs, op->num_syncs,
> +		fence =3D xe_vm_prefetch(vm, vma, op->q, op->syncs, op-
> >num_syncs,
>  				       op->flags & XE_VMA_OP_FIRST,
>  				       op->flags & XE_VMA_OP_LAST);
>  		break;
> @@ -2823,9 +2812,20 @@ static int op_lock_and_prep(struct drm_exec
> *exec, struct xe_vm *vm,
>  					    false);
>  		break;
>  	case DRM_GPUVA_OP_PREFETCH:
> +	{
> +		struct xe_vma *vma =3D gpuva_to_vma(op->base.prefetch.va);
> +		u32 region =3D op->prefetch.region;
> +
> +		xe_assert(vm->xe, region <=3D
> ARRAY_SIZE(region_to_mem_type));
> +
>  		err =3D vma_lock_and_validate(exec,
> -					    gpuva_to_vma(op-
> >base.prefetch.va), true);
> +					    gpuva_to_vma(op-
> >base.prefetch.va),
> +					    false);
> +		if (!err && !xe_vma_has_no_bo(vma))
> +			err =3D xe_bo_migrate(xe_vma_bo(vma),
> +					    region_to_mem_type[region]);
>  		break;
> +	}
>  	default:
>  		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
>  	}
> --
> 2.34.1

