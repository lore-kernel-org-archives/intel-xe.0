Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFFBC05023
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 14:22:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E713110FF28;
	Fri, 19 Apr 2024 14:22:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JIKi0y1p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ECEF10F392
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 14:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713536561; x=1745072561;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=c7rtoDiLHzPm2ppe0vEG9DQrz3Le7M5j+80JaJmUWRY=;
 b=JIKi0y1pbSm23qXeuXNvDlkW35vHLeyVIJFG1F1RWZntJ5Zyu48VWNJL
 +yR7nUuqjvRGWmQQ7P3ZPzIXuiOHldLCkBTYq0Efi+AcAtFbjCg5atKnj
 ifzBfFvSzaHcLV8vSjP9clq9BQtryLbrxwnYhCxQsPevPkwZ0J2j8zctT
 ws1HFyfYG3Iur7SQ7ZglAA5lhh3ySoiLcpFyndU6zmSDmTTwq/IkqDe8J
 C0x6n9lOXWwGARGo/nx/J4dxF8Amqn2swAeXCXdb+CVnbh14Wa5b2sAbl
 1TVdzx0OKWK1w2PuJ1WSlalZdTkMASSg70wmrenFThyZ4qXE4ZG/Tfqoh g==;
X-CSE-ConnectionGUID: WByHIIooQfiCWfDls+BFqQ==
X-CSE-MsgGUID: hdI0x+t0QXidNybCXsGgkg==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="9000396"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="9000396"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 07:22:40 -0700
X-CSE-ConnectionGUID: nvwIIV99SXSYikSzi0CXFA==
X-CSE-MsgGUID: DN7cnPsFRaKDxQDQbw/cDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23848518"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Apr 2024 07:22:41 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 07:22:40 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Apr 2024 07:22:40 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Apr 2024 07:22:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+sPPLpgubzyGuf9a91jkpUVG5bKZfqZgHq0tk42gNlTXzf2CwK7C5ZuzBjxxcxE1bzuUD9rn5wY0aPIpmShlh9aVR9QL0vnVS0F99qcIkOkVNgQEort0qoIxLbLLVRKpixoeqwKDOXnXnDF6uVCraQuqQn7fLgPnn6DTwmge95RyPFsxz+kFs3K5ZSoradCNawcMQpgo/CvFw+OhAcmNOl+89PMl8woRM+iElxWCtUneOFmChzc8RhuvSsJC/q203ebAnGq37DWMdSGexuUOSKJ+fKCwwd4Oya+aLpunEaBOruSXs4fFF92uUIBZ2qJth7n6+1PTD2LO/JvXktUNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b1j9EGY/gwLhf+683On9EZn3/xpJ6TpAdz+Un9OD/y4=;
 b=lIVESQPoLCHJOfce41v+FYkBYaEO7oh1DXe2E7kTyAf5UVXfVb6h8Co++0m92RPYgHH5nbeuYNvDiPitcFDSLNWh1+28Xl+FI4HE+jMJChV7iVHkir7O2oih6ZwJa2e0lc0JUltso+bs3+wdTQ2e/JdWTFC9ffUo8FGnx97l1mWYO9lgOByUcEATaSYPPpl/lbvpVXWRoxd3THjXcpLerHGwa9p1UqhmP1SUdvtfgVtC+gXfiPfp50Gm2NJ9umWXaznQpzoceONl56squunqw2+Cuqp6kfarOD+WBlM/IUvUnUiQi0bJ8nnGLAC+dBUSMZHp2Vltzrf3Coe5606TXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by SJ2PR11MB7600.namprd11.prod.outlook.com (2603:10b6:a03:4cd::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.30; Fri, 19 Apr
 2024 14:22:29 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7472.037; Fri, 19 Apr 2024
 14:22:29 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH 07/13] drm/xe: Use xe_vma_ops to implement page fault
 rebinds
Thread-Topic: [PATCH 07/13] drm/xe: Use xe_vma_ops to implement page fault
 rebinds
Thread-Index: AQHaiwmqfSY5i5CekUmmm75hwPUqw7Fvswew
Date: Fri, 19 Apr 2024 14:22:29 +0000
Message-ID: <SA1PR11MB6991E56CAC410886AAFB0A82920D2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240410054056.478023-1-matthew.brost@intel.com>
 <20240410054056.478023-8-matthew.brost@intel.com>
In-Reply-To: <20240410054056.478023-8-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|SJ2PR11MB7600:EE_
x-ms-office365-filtering-correlation-id: aaa92f1a-7801-4936-af8c-08dc607c2513
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nClcy4wwxzY4zfPQbUQsf5fPh2pz7IOvpy+guuwsp9xZ193oMbo4HfAXHsmZmGPRFFvuZsyQycnfTTbZV/JE/SglSW66jL2WBVV27bU6tGF9niYVMugZBqcjeS/ugbR6a1poSMRKtH0AqZRa7L+mI8oYoPWDXfwbVZvHWFGjcNxK3rboyWvHNHTzFEtCnVCB9oEILfKeN7Scm6vwODCDLr3WwCNB9GJiXB9fURagfZNa1PuTtyWBIhtV9VoE6mtJIJwjjUYPlIpfW8iTmo76DFh412OJgtABNdDDTUVedfsMQ6BDrK5wvIaGr+/AKVtZnN3byKMCmVzdUaIBrEW4p94SRGPeSWxFs1ckY5Vasxkcl5XVFy7pq7JpC+cHCnYZGq1cl9088V5bNAdvQo6pI1ea2VGVYF7gE72fMsEWmcXJKMNo+qQ+/IZC5xlg1m8T8rt3MrmBQ9b5eCZJ24Zc+jnXAGgGxJScCnLy5s9CpIuhaTOS3Beh7UmafMHiOMUx4HJcebqU97UKN93c1bM7FK0CxLcpAJKuGBSVgoFtYH2NojA/26Ln6wveBt3w/Q/Oyz+BnYc/eNP0qbcz3uZpugzPvpsYQ97O2tRn4HpFNiPu2Cb56DqzpRoSCCKubyh+cVwX//9xF9O2rBWR6C0tTlqoqQHhjsfVl2fYKC3ZY7yaBltHt6wq+OAhcdS1yoAjKls0vsgzGnTAI1/6btKhqw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rDK+FlJpqKE+/H4zdWw//SVbXDynks+A4MZpWuYVd0i3hT1e31MMLaHxC4rO?=
 =?us-ascii?Q?CBjX0hQL/zk48ZzSw6TLERddmxtqw6IgAu0SwZn0ZdsiCYnWBGIfAoJjVXDw?=
 =?us-ascii?Q?9N4yvoSovKEpkkUddptsqH5tmlXJdU6/xAh9KhYbP28/CkSeEtLBLD6U3kft?=
 =?us-ascii?Q?rczkBMJQPygYYAi7d+HGGb2CRHpShCErJTbdaYlgnIYmoMB021hN5F0u+1vI?=
 =?us-ascii?Q?67lqimvtx1Tl9wMl18t19rQC1Psdhs2EJaUK3FMR5+CRYfGQnpdKFOHCsNNR?=
 =?us-ascii?Q?ORrHHhgjyvU0rQm+Eaz3MhGjlqLLLz7sjo7uJBhVsQF/TOKZqrgGFWDGYmDN?=
 =?us-ascii?Q?skMAk7XyDKImbT/LVaNxSScLUF3IPrA8bdHZyFKYHgozSN4zHcEbXNU9K4PI?=
 =?us-ascii?Q?yLoZQCyrEbvE6PCogRJQDvoWiFJU6bFkY6X+3B9NQqkXSInxA4esrCXl1nwr?=
 =?us-ascii?Q?D1mEwKum3vRr3iqz/Y8N9ldu7cclTstScwCBBUlAfbsP36CpUwpq+1cU4n+l?=
 =?us-ascii?Q?ahvqu3uKSszYdjRsLXM0bcFEB6vvKaWah5unFc6HoKGFSIG79L20R0aWk04y?=
 =?us-ascii?Q?nQhwlMxKaF24IwZcbr2jjN4qKsHiKqGmzYMDL9mV/lD+WO6Zi14M448jMgxM?=
 =?us-ascii?Q?ytv7wItwcue259iNl8jNwZhmy7ZmAyNMgHunX2dd+ZTsRJY1+kQwaUTpZ+dV?=
 =?us-ascii?Q?DWvA2l+kzfMI+woo7hFkNfNBGI44fQVYVQ0rum2+MrppxZ9CcvacI6/1GANo?=
 =?us-ascii?Q?PXF7CeBTfFDaVVcA6RlaPVzcr2H2szDECcxAePkczwh2oPmEAH73VPWLmcOR?=
 =?us-ascii?Q?y7OvNNnSQUK4EV8bacnsvr8Wz5tmqRyNQcAnwuNVq0028b7de6pGpixou6Fc?=
 =?us-ascii?Q?0HpTKbwxa1tcG4XkRwUp5Qw+YF+UOm+eTLbpWyNFndmWWUuHhz6MSotzRLCk?=
 =?us-ascii?Q?2rZIakOs1ZRb/gpiTplS5659bHmhMNJXLSaNVRPQX7ek4IhUjAxxCxgJcPtJ?=
 =?us-ascii?Q?e0clmkGcjLZyEMDnnrtG/9iQBPtwCAzo8MTippIsasXfFBGrpPLrG+OdGF0t?=
 =?us-ascii?Q?50rm2xVsRI3g8mIdOnkuX26UhN2PEKyr6quuKbOqrhGlUN9xwE0KGO2D4969?=
 =?us-ascii?Q?eJMT2E1AlCvI0sNVzsZj4KY1FhDsnlpnuALh0Nt7HONJ6uxtZKyOFwSrS8Kx?=
 =?us-ascii?Q?A21RvS8UQrBRaI3lRG6Fx4G7cZIhaPkemcOzMiYuVf4FGqb87pr/LH0RjIav?=
 =?us-ascii?Q?+IKrp7H5bEnsnPXoda81GbiApelXqKSTe4yBHkdyOhV5ftzC5Lert6OipZKF?=
 =?us-ascii?Q?MInHy58p+D0EwkID3Mrg2OI42GQWJMnTeagP2ijm01RYmNdDlgR5MeTwmUbo?=
 =?us-ascii?Q?va5MuQpomtNH6jmYsUAKbBzn0gN0LxPoUE9eTev8vUglDorSDyy/5fsElcTq?=
 =?us-ascii?Q?LwbjNd0BHjtMPs/LMc7kUAFX7yWiNBkApDJ7OCCXI1l0gZSnbtEG7NqF6V34?=
 =?us-ascii?Q?re6zp7VL5eKIzWRQEnr/txe2H6I2tcMoFaYXE1qjfO5eAsUBlW8jj6cI0DHZ?=
 =?us-ascii?Q?vWgpcRnYFdfwfjR9wLs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaa92f1a-7801-4936-af8c-08dc607c2513
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2024 14:22:29.3681 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /z71+RDteZuiRQvUV44/A2EIfiya3dF2dt9brDm3zzm5Pl1YOdBGfci91BTzdVJN1DANS+ZjD39hPXNY6nXyZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7600
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Matthew Brost
> Sent: Wednesday, April 10, 2024 1:41 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Brost, Matthew <matthew.brost@intel.com>
> Subject: [PATCH 07/13] drm/xe: Use xe_vma_ops to implement page fault
> rebinds
>=20
> All page tables updates are moving to a xe_vma_ops interface to
> implement 1 job per VM bind IOCTL.

Can you explain why using xe_vma_ops interface is necessary even to bind on=
e vma? I understand it make sense to use this interface to bind multiple vm=
as. See also below


 Add xe_vma_rebind function which is
> implemented using xe_vma_ops interface. Use xe_vma_rebind in page
> faults
> for rebinds.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 16 ++++----
>  drivers/gpu/drm/xe/xe_vm.c           | 57 +++++++++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_vm.h           |  2 +
>  drivers/gpu/drm/xe/xe_vm_types.h     |  2 +
>  4 files changed, 58 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index fa9e9853c53b..040dd142c49c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -19,7 +19,6 @@
>  #include "xe_guc.h"
>  #include "xe_guc_ct.h"
>  #include "xe_migrate.h"
> -#include "xe_pt.h"
>  #include "xe_trace.h"
>  #include "xe_vm.h"
>=20
> @@ -204,15 +203,14 @@ static int handle_pagefault(struct xe_gt *gt, struc=
t
> pagefault *pf)
>  		drm_exec_retry_on_contention(&exec);
>  		if (ret)
>  			goto unlock_dma_resv;
> -	}
>=20
> -	/* Bind VMA only to the GT that has faulted */
> -	trace_xe_vma_pf_bind(vma);
> -	fence =3D __xe_pt_bind_vma(tile, vma, xe_tile_migrate_engine(tile),
> NULL, 0,
> -				 vma->tile_present & BIT(tile->id));
> -	if (IS_ERR(fence)) {
> -		ret =3D PTR_ERR(fence);
> -		goto unlock_dma_resv;
> +		/* Bind VMA only to the GT that has faulted */
> +		trace_xe_vma_pf_bind(vma);
> +		fence =3D xe_vma_rebind(vm, vma, BIT(tile->id));
> +		if (IS_ERR(fence)) {
> +			ret =3D PTR_ERR(fence);
> +			goto unlock_dma_resv;
> +		}
>  	}
>=20
>  	/*
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 8f5b24c8f6cd..54a69fbfbb00 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -815,6 +815,7 @@ static void xe_vm_populate_rebind(struct
> xe_vma_op *op, struct xe_vma *vma,
>  				  u8 tile_mask)
>  {
>  	INIT_LIST_HEAD(&op->link);
> +	op->tile_mask =3D tile_mask;
>  	op->base.op =3D DRM_GPUVA_OP_MAP;
>  	op->base.map.va.addr =3D vma->gpuva.va.addr;
>  	op->base.map.va.range =3D vma->gpuva.va.range;
> @@ -893,6 +894,33 @@ int xe_vm_rebind(struct xe_vm *vm, bool
> rebind_worker)
>  	return err;
>  }
>=20
> +struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma,
> u8 tile_mask)


I try to figure out why this function is necessary. We are only binding one=
 vma here. Why we need to create xe_vma_ops list? We are only adding one vm=
a to this list....

Oak

> +{
> +	struct dma_fence *fence =3D NULL;
> +	struct xe_vma_ops vops;
> +	struct xe_vma_op *op, *next_op;
> +	int err;
> +
> +	lockdep_assert_held(&vm->lock);
> +	xe_vm_assert_held(vm);
> +	xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
> +
> +	xe_vma_ops_init(&vops);
> +
> +	err =3D xe_vm_ops_add_rebind(&vops, vma, tile_mask);
> +	if (err)
> +		return ERR_PTR(err);
> +
> +	fence =3D ops_execute(vm, &vops);
> +
> +	list_for_each_entry_safe(op, next_op, &vops.list, link) {
> +		list_del(&op->link);
> +		kfree(op);
> +	}
> +
> +	return fence;
> +}
> +
>  static void xe_vma_free(struct xe_vma *vma)
>  {
>  	if (xe_vma_is_userptr(vma))
> @@ -1796,7 +1824,7 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct
> xe_exec_queue *q,
>  static struct dma_fence *
>  xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
>  	       struct xe_sync_entry *syncs, u32 num_syncs,
> -	       bool first_op, bool last_op)
> +	       u8 tile_mask, bool first_op, bool last_op)
>  {
>  	struct xe_tile *tile;
>  	struct dma_fence *fence;
> @@ -1804,7 +1832,7 @@ xe_vm_bind_vma(struct xe_vma *vma, struct
> xe_exec_queue *q,
>  	struct dma_fence_array *cf =3D NULL;
>  	struct xe_vm *vm =3D xe_vma_vm(vma);
>  	int cur_fence =3D 0, i;
> -	int number_tiles =3D hweight8(vma->tile_mask);
> +	int number_tiles =3D hweight8(tile_mask);
>  	int err;
>  	u8 id;
>=20
> @@ -1818,7 +1846,7 @@ xe_vm_bind_vma(struct xe_vma *vma, struct
> xe_exec_queue *q,
>  	}
>=20
>  	for_each_tile(tile, vm->xe, id) {
> -		if (!(vma->tile_mask & BIT(id)))
> +		if (!(tile_mask & BIT(id)))
>  			goto next;
>=20
>  		fence =3D __xe_pt_bind_vma(tile, vma, q ? q : vm->q[id],
> @@ -1886,7 +1914,7 @@ find_ufence_get(struct xe_sync_entry *syncs, u32
> num_syncs)
>  static struct dma_fence *
>  xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct
> xe_exec_queue *q,
>  	   struct xe_bo *bo, struct xe_sync_entry *syncs, u32 num_syncs,
> -	   bool immediate, bool first_op, bool last_op)
> +	   u8 tile_mask, bool immediate, bool first_op, bool last_op)
>  {
>  	struct dma_fence *fence;
>  	struct xe_exec_queue *wait_exec_queue =3D
> to_wait_exec_queue(vm, q);
> @@ -1902,8 +1930,8 @@ xe_vm_bind(struct xe_vm *vm, struct xe_vma
> *vma, struct xe_exec_queue *q,
>  	vma->ufence =3D ufence ?: vma->ufence;
>=20
>  	if (immediate) {
> -		fence =3D xe_vm_bind_vma(vma, q, syncs, num_syncs,
> first_op,
> -				       last_op);
> +		fence =3D xe_vm_bind_vma(vma, q, syncs, num_syncs,
> tile_mask,
> +				       first_op, last_op);
>  		if (IS_ERR(fence))
>  			return fence;
>  	} else {
> @@ -2095,7 +2123,7 @@ xe_vm_prefetch(struct xe_vm *vm, struct xe_vma
> *vma,
>=20
>  	if (vma->tile_mask !=3D (vma->tile_present & ~vma->tile_invalidated))
> {
>  		return xe_vm_bind(vm, vma, q, xe_vma_bo(vma), syncs,
> num_syncs,
> -				  true, first_op, last_op);
> +				  vma->tile_mask, true, first_op, last_op);
>  	} else {
>  		struct dma_fence *fence =3D
>  			xe_exec_queue_last_fence_get(wait_exec_queue,
> vm);
> @@ -2408,10 +2436,15 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm
> *vm, struct xe_exec_queue *q,
>  	struct xe_device *xe =3D vm->xe;
>  	struct xe_vma_op *last_op =3D NULL;
>  	struct drm_gpuva_op *__op;
> +	struct xe_tile *tile;
> +	u8 id, tile_mask =3D 0;
>  	int err =3D 0;
>=20
>  	lockdep_assert_held_write(&vm->lock);
>=20
> +	for_each_tile(tile, vm->xe, id)
> +		tile_mask |=3D 0x1 << id;
> +
>  	drm_gpuva_for_each_op(__op, ops) {
>  		struct xe_vma_op *op =3D gpuva_op_to_vma_op(__op);
>  		struct xe_vma *vma;
> @@ -2428,6 +2461,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm
> *vm, struct xe_exec_queue *q,
>  		}
>=20
>  		op->q =3D q;
> +		op->tile_mask =3D tile_mask;
>=20
>  		switch (op->base.op) {
>  		case DRM_GPUVA_OP_MAP:
> @@ -2574,6 +2608,7 @@ static struct dma_fence *op_execute(struct xe_vm
> *vm, struct xe_vma *vma,
>  		fence =3D xe_vm_bind(vm, vma, op->q, xe_vma_bo(vma),
>  				   op->syncs, op->num_syncs,
>  				   op->map.immediate
> || !xe_vm_in_fault_mode(vm),
> +				   op->tile_mask,
>  				   op->flags & XE_VMA_OP_FIRST,
>  				   op->flags & XE_VMA_OP_LAST);
>  		break;
> @@ -2600,7 +2635,9 @@ static struct dma_fence *op_execute(struct xe_vm
> *vm, struct xe_vma *vma,
>  			dma_fence_put(fence);
>  			fence =3D xe_vm_bind(vm, op->remap.prev, op->q,
>  					   xe_vma_bo(op->remap.prev), op-
> >syncs,
> -					   op->num_syncs, true, false,
> +					   op->num_syncs,
> +					   op->remap.prev->tile_mask, true,
> +					   false,
>  					   op->flags & XE_VMA_OP_LAST
> && !next);
>  			op->remap.prev->gpuva.flags &=3D
> ~XE_VMA_LAST_REBIND;
>  			if (IS_ERR(fence))
> @@ -2614,8 +2651,8 @@ static struct dma_fence *op_execute(struct xe_vm
> *vm, struct xe_vma *vma,
>  			fence =3D xe_vm_bind(vm, op->remap.next, op->q,
>  					   xe_vma_bo(op->remap.next),
>  					   op->syncs, op->num_syncs,
> -					   true, false,
> -					   op->flags & XE_VMA_OP_LAST);
> +					   op->remap.next->tile_mask, true,
> +					   false, op->flags &
> XE_VMA_OP_LAST);
>  			op->remap.next->gpuva.flags &=3D
> ~XE_VMA_LAST_REBIND;
>  			if (IS_ERR(fence))
>  				break;
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 306cd0934a19..204a4ff63f88 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -208,6 +208,8 @@ int __xe_vm_userptr_needs_repin(struct xe_vm
> *vm);
>  int xe_vm_userptr_check_repin(struct xe_vm *vm);
>=20
>  int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker);
> +struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma,
> +				u8 tile_mask);
>=20
>  int xe_vm_invalidate_vma(struct xe_vma *vma);
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> b/drivers/gpu/drm/xe/xe_vm_types.h
> index 149ab892967e..e9cd6da6263a 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -343,6 +343,8 @@ struct xe_vma_op {
>  	struct list_head link;
>  	/** @flags: operation flags */
>  	enum xe_vma_op_flags flags;
> +	/** @tile_mask: Tile mask for operation */
> +	u8 tile_mask;
>=20
>  	union {
>  		/** @map: VMA map operation specific data */
> --
> 2.34.1

