Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC56C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 14:24:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 948D010E0C2;
	Fri, 19 Apr 2024 14:24:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nbv+7NEl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 938B810E0C2
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 14:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713536662; x=1745072662;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=WkoWjr5VdWVrUVq3JnFbW/qhb/nsDX4St9L/p40zJuQ=;
 b=nbv+7NElSmOQ2EYYJMUum6V0qp0dw3mKLPvdmeIYnMKvKMzZS88W6yPl
 022rQNfwxCr027fQyS7u3nZ6ozF3RU2zYrkgjb6nQV2TU9Rb2uezTCBUU
 9c8n/peukA/lbAcgcKw52yiuBOsahBIDUTk76NQb2qvDLwMUk69E0zmLD
 x8qvjFgRWh7iQaenPZljYw/fPSSi4VKpj/vj7SIFUCv4uQZvVCRPcEhqt
 gK1+mk5n1OSDHJdStsl3w0cUNCdsXH4tHIFiA9LYagZt9Q9L90sh6kHcK
 KQoX8dD8+3k61S9zrkOMvZjtj27rVzaw0d2WAOgXureo3D+vQK2XfY9cl A==;
X-CSE-ConnectionGUID: BfAeq6MfTjCSO/jbDhjKQA==
X-CSE-MsgGUID: OMlXzj7tRHq2DijLlqA9Ng==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="20561037"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="20561037"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 07:24:21 -0700
X-CSE-ConnectionGUID: 7KIwWD1+TFeNkh+BDFmuiA==
X-CSE-MsgGUID: zblrodp1So6ilzZT/Hnh8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="54549234"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Apr 2024 07:24:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 07:24:18 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 07:24:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Apr 2024 07:24:18 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Apr 2024 07:24:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lz/iuQ4u35N9a9+YnVY1L4OaWzMv2mYsjzqRVfEtDvkKmiIjcNHaB/CkCgY+UUMwYtx+1YzBUFyVJ5+qtY0vexNCN0yg9gOLkLPxDC5xIZ/JyOQ4LEgj98VXzeD95cjFGwWNkJCh2AuS5XiLiAdvqiH8Vx5iQ7USTNKmyijscyNmT8rrZwEPYSmm5RRNoIlzH5LBoLCGrDyCX2/bfKXtI1TT651rA0Gz631l6+th5EExXeKRQC5Y44AWGtfhSPmtZwXoe6aEDS3rfLDeiDvXJq7fWzC9Ga0jevLiwlHn+fH9qwfs6SF99tQZ7EoFk8B3kp3N6jMRMADUN4rVvT3rng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5rT9ceqRnsBUyiLUu2Ag6VD8576uYr69AEBIbm4DVu8=;
 b=XfljIQNfUwiBo9gaw6BPqdqexjX8oeR8OlTlUWve3RPSBmVVRFdqOOBvxs9ZqOoDmGS3MN7i6ZJ6V78ThEgXE0L7cBRv6SyVNX9HKvQ9uTwSAa6trQy2Y7JnJOkvJG4j5yR5K80eVqSffyzs+HdHGiOk1UMTUa12cyAf5oG3m93XdpWqDtXBf4Luptplmi/AElJlnHN5vjHrfXNTyFqM2B655MzQi4V2GR/JA/v82GUI9HnY8v0y59CuS0JaDwz7b2VPjZ9wd1rTipLC/jyf6jxQp5xiD5OhCZCdJux/Rbxf6EycnPOZc7PjvWNhSTzpg72TwENQdW+zphRUWcJ+Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by CY8PR11MB7292.namprd11.prod.outlook.com (2603:10b6:930:9c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Fri, 19 Apr
 2024 14:24:14 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7472.037; Fri, 19 Apr 2024
 14:24:14 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 08/13] drm/xe: Add some members to xe_vma_ops
Thread-Topic: [PATCH 08/13] drm/xe: Add some members to xe_vma_ops
Thread-Index: AQHaiwmjlGssZSEMjE6HlQF/fF/pdrFvtFbA
Date: Fri, 19 Apr 2024 14:24:14 +0000
Message-ID: <SA1PR11MB6991AFDC840FE82CB3596EEF920D2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240410054056.478023-1-matthew.brost@intel.com>
 <20240410054056.478023-9-matthew.brost@intel.com>
In-Reply-To: <20240410054056.478023-9-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|CY8PR11MB7292:EE_
x-ms-office365-filtering-correlation-id: f31b7cf6-213d-4cef-6075-08dc607c6383
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CwoVQCUYlr6tGaMoDbflODYNbkkQCCHRKFDEJWUamb6p5JwUchTUuwcSQMxVjgpL+FeNfo/AhxwdEgF/Vw/ecdKNN8XN77MUVS4s1Em1JnlWspLQ8NSGJXWFq7ZWlpwlaTMwMkaz+IsXqkMVUjGYi0Kv5C07MvJH3QUZO3Rp1yYPQienqchjMH/WszYGHSO/1afTo7vCF2+zpROKGZJFKdnne4b0k8Y1J5K3uAuDCLdLMlBN+molqiwYvJfAYsyeWEcb1MKyTCfSN111X8CXBT52/U/IqRXetfRk5eOYANZBhjlbdIS17BGmxS4HIlp+t0tZ3Xjhfm8NcPXkAHU7Meb4QKXS2mH0zUWiDh4sYdOyIZDz912c/b91H3x4By77d0gcb96NnvS3Ao6Djr+olL1Zw+OwmAMNm8shyKxqwFBBv0468ae8UFB/P0gs1q7V0SG7ZeR/TJ0UQSgHUK8kMPhQuoswwb/3mOkP1FhGvepSmZMMASDeoxKuZc7nPNTo7ohduKmh2+O1jqie0rIKz4VMZNKAAd0Ix+t9TAL/R05Me+7x4VMBZoKFN8MKeg4cFyM8h4jCt2eT/Fv0+YdUytPnu7fPhhR5lwjj1DQR1mMpj1/sRZFNcqzq6cfIPSBHYGt+94O1CMp7banKJt3l+VDzVmqR4HHu1+jxG143fR0zW7Xpdh6ZJwL+LdJLMCzEovuUbFkIXe100Z3d+nVb+HskBUM9pfUFPMCbwDdekjM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MRT9E8NMmoGmoOr5wtWtHUXIekqcTxr4SYh7OdB9gQ+xbrhy7c03RQP2qlGs?=
 =?us-ascii?Q?JYP0mAEs95it/eO96BjOhe6skbicYCz6Ewd7DUKLbIcPQ+tAgO/70VqO+E92?=
 =?us-ascii?Q?8KAQairUXvWCPPajKaPrIburD64Da43eGJB5g3LumdRCnl5BwaFIcDnC45vc?=
 =?us-ascii?Q?mmOFO75zcbvcbiDLfuahiQLEvpGRJx9o4e87XEOsPuSrG/Dk1if2AfyEcELE?=
 =?us-ascii?Q?Z8Lm8ZBEyJ+eYJjx0s3ji6oivXFDfMtHkLNKS80dYxrdGLThBR/eUg3gDKWu?=
 =?us-ascii?Q?mEMGOME4xh+i6/OmtsgMG9qcCSgz0VP0YTTkC89uS9hrNEzzana5IMoVEE0p?=
 =?us-ascii?Q?CZxocSOJk6M8uaT0ncq1FDUk7uHjwcXOscrr/AmwfsB7Bk+nUGMUkyUEgpPa?=
 =?us-ascii?Q?UFCqUU5iLj8SScOnWp6lBjc9LouhZflctNDk9pIaG+f10rYzOuiKOBHDxrcx?=
 =?us-ascii?Q?5RBX36OHNhDyvca/sd/Lar4PG8xdsY5ZdNPt1klgA+/wfrpSco180XlGhZOy?=
 =?us-ascii?Q?5CJsMhBoCOGiiTjq3cLDs8Lchf3JBR+nN+aIVx1XguO2E7CFfhw1OIW50/I4?=
 =?us-ascii?Q?mcGWIqcxYQYgYBKABUPXJ7hQ6FREqCv+a9iP5LlX4ExuZ/YA7/KpMs0s6pQi?=
 =?us-ascii?Q?eYGRKIKsygGcA3KyYf3n/44TaA5ATmNtLvSGqmU48awus7D+F/dy8tAetggl?=
 =?us-ascii?Q?MUezK8bP2O+i5HP+t191YkdcIxHWgcDEVGP51+yCjuC/C0EGhTui1VNsY01a?=
 =?us-ascii?Q?EqfZyv2k9Jgo+KrNfjaDbJL1ANdlUr99ExE6A7t5f3gwe9JRJ+6W1Te2FVwr?=
 =?us-ascii?Q?zJhiAg0L/cBXVKv+9+lcquLuQZTJTyZyZQMXyE3mkP9xojDQkOKxsRa6o/Yg?=
 =?us-ascii?Q?WqegFZkIRhOvcnQDk5W8gNtCkrLxV7LnlrTqqS5v0026unnRrQUHS5oDjvHg?=
 =?us-ascii?Q?24zL5gQerqahTr5M0Mjv5GX/hpbejgDjSDME/1HAr65nUEon/sjYcSIXbfUL?=
 =?us-ascii?Q?0vIvIUBvNaUWvhaFrrp8ye9QrXPLB/wR1gwqPHEE7wfT6aVyAOS15vFuaE2o?=
 =?us-ascii?Q?Lyu16M+irbMecVL3tCyYT+fVHXZamd+weWQZ68HGpXakfk2SmkiUm/ugremU?=
 =?us-ascii?Q?uZDDtl+n8n7WIBLLK0hvsKA0d9X6yirJ0PNJr6j5bDAUq0hNG9HDSIzf/83o?=
 =?us-ascii?Q?sM+GrD4AguZfYpDHz4Wyk6KInKIKqivfKEgbrsk8mes+WBvZybXxe+pF/tWP?=
 =?us-ascii?Q?DVbjn8o5SdiUNJKg5c13wpZah6AEFrc8h5Tbdi/dQ73kGau95thrWflehE1L?=
 =?us-ascii?Q?fzq85Ahn2q7QRDW0wyhun9Pnql+8fqfEDuAKz0D3o5IDE0MBk9cPJpXVJbf7?=
 =?us-ascii?Q?Fox+1xdermywIMPIBTfYakq1yAm7vYvQ6eMWVcQ1pClejYezVPosJuFYptjQ?=
 =?us-ascii?Q?wp7jvHy1eTdOtQiDa0M3MsiVPnqi4OcRx0x4cuVoFmepLdubHGAiGz5FeT3R?=
 =?us-ascii?Q?P6924XA5xloGqvnwNRrhJg2bpWoAD1OYHXC6BHauAVNjHksRQ1DrrnHDHh4p?=
 =?us-ascii?Q?VRvvf1138JFOy4YL/KM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f31b7cf6-213d-4cef-6075-08dc607c6383
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2024 14:24:14.1447 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A1XRVSSBr4nEB6sVHMDmrVHa8ARFBlI0OtgEZz4/iPDNFZlwa96hZXib+UrOzK2Bn1qaH65PoGnXgGZLnpalnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7292
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

This patch is:

Reviewed-by: Oak Zeng <oak.zeng@intel.com>

> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Wednesday, April 10, 2024 1:41 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Brost, Matthew <matthew.brost@intel.com>; Zeng, Oak
> <oak.zeng@intel.com>
> Subject: [PATCH 08/13] drm/xe: Add some members to xe_vma_ops
>=20
> This will help with moving to single jobs for many bind operations.
>=20
> v2:
>  - Rebase
>=20
> Cc: Oak Zeng <oak.zeng@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c       | 19 ++++++++++++++-----
>  drivers/gpu/drm/xe/xe_vm_types.h |  8 ++++++++
>  2 files changed, 22 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 54a69fbfbb00..09871538484b 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -844,7 +844,9 @@ static int xe_vm_ops_add_rebind(struct xe_vma_ops
> *vops, struct xe_vma *vma,
>=20
>  static struct dma_fence *ops_execute(struct xe_vm *vm,
>  				     struct xe_vma_ops *vops);
> -static void xe_vma_ops_init(struct xe_vma_ops *vops);
> +static void xe_vma_ops_init(struct xe_vma_ops *vops, struct xe_vm *vm,
> +			    struct xe_exec_queue *q,
> +			    struct xe_sync_entry *syncs, u32 num_syncs);
>=20
>  int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
>  {
> @@ -859,7 +861,7 @@ int xe_vm_rebind(struct xe_vm *vm, bool
> rebind_worker)
>  	    list_empty(&vm->rebind_list))
>  		return 0;
>=20
> -	xe_vma_ops_init(&vops);
> +	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
>=20
>  	xe_vm_assert_held(vm);
>  	list_for_each_entry(vma, &vm->rebind_list, combined_links.rebind)
> {
> @@ -905,7 +907,7 @@ struct dma_fence *xe_vma_rebind(struct xe_vm
> *vm, struct xe_vma *vma, u8 tile_ma
>  	xe_vm_assert_held(vm);
>  	xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
>=20
> -	xe_vma_ops_init(&vops);
> +	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
>=20
>  	err =3D xe_vm_ops_add_rebind(&vops, vma, tile_mask);
>  	if (err)
> @@ -3115,9 +3117,16 @@ static int vm_bind_ioctl_signal_fences(struct
> xe_vm *vm,
>  	return err;
>  }
>=20
> -static void xe_vma_ops_init(struct xe_vma_ops *vops)
> +static void xe_vma_ops_init(struct xe_vma_ops *vops, struct xe_vm *vm,
> +			    struct xe_exec_queue *q,
> +			    struct xe_sync_entry *syncs, u32 num_syncs)
>  {
> +	memset(vops, 0, sizeof(*vops));
>  	INIT_LIST_HEAD(&vops->list);
> +	vops->vm =3D vm;
> +	vops->q =3D q;
> +	vops->syncs =3D syncs;
> +	vops->num_syncs =3D num_syncs;
>  }
>=20
>  int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file
> *file)
> @@ -3284,7 +3293,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void
> *data, struct drm_file *file)
>  		goto free_syncs;
>  	}
>=20
> -	xe_vma_ops_init(&vops);
> +	xe_vma_ops_init(&vops, vm, q, syncs, num_syncs);
>  	for (i =3D 0; i < args->num_binds; ++i) {
>  		u64 range =3D bind_ops[i].range;
>  		u64 addr =3D bind_ops[i].addr;
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> b/drivers/gpu/drm/xe/xe_vm_types.h
> index e9cd6da6263a..ce1a63a5e3e7 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -360,6 +360,14 @@ struct xe_vma_op {
>  struct xe_vma_ops {
>  	/** @list: list of VMA operations */
>  	struct list_head list;
> +	/** @vm: VM */
> +	struct xe_vm *vm;
> +	/** @q: exec queue these operations */
> +	struct xe_exec_queue *q;
> +	/** @syncs: syncs these operation */
> +	struct xe_sync_entry *syncs;
> +	/** @num_syncs: number of syncs */
> +	u32 num_syncs;
>  };
>=20
>  #endif
> --
> 2.34.1

