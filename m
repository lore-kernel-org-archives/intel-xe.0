Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C87BC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 14:57:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E52710E62D;
	Fri, 19 Apr 2024 14:57:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RPpcawlH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 754A110E62D
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 14:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713538620; x=1745074620;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dhcqcZeTX8Wb0eUG4AeG8DHQbHFQZCzy4qcJhfmp06w=;
 b=RPpcawlHsQc84OnAi3hSnaXwNQPxJc/NdtikA+JuRSXuOHpsdL9BFnj5
 qEMUBx09Pt+NGgA6QK4qlMPAXN/H4HRCmauLnV6Vtx3B3bOiDWQY9t62S
 Q9A9wdEs4EZ7qXSRKlVf+DL57lNlQNc4xJITkhU2bkGCN6YF08vjp7n++
 WbdV9J4xbwbRTJL1r5tg+1+wuxH+HvnqF4b07VD44BQQUir4gYOseqBUj
 sMh22ipAecGGX0YtX/lyPIIGYLcWrXTlBFeJsEwdoXUDabTGKkjvcrVB/
 vmjreknWjTyOYylLM87WcLAZKZmyYE3DhMozAQ7NMnSiVFo5ao7qerUXc g==;
X-CSE-ConnectionGUID: q62NJDUPTHC5FDHd6j1waQ==
X-CSE-MsgGUID: TDlkVMQvS0y8On1NMq4Guw==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="20283423"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="20283423"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 07:57:00 -0700
X-CSE-ConnectionGUID: vMseuABcSeKBVxSnLZ1f6g==
X-CSE-MsgGUID: 09Jat7hRSxGBewWWGvLksQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="23796494"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Apr 2024 07:57:00 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 07:56:59 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Apr 2024 07:56:59 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Apr 2024 07:56:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XVBpR5AHhamiJPWORNJxosTiqYpTSmMgstrOsGi84e8MMV81EK/EPCSaUypdqIcVGSV4omqR6gyji46qqg5bhYBjxfaVCgGQQM1MliCgm8BFpwVDd9YP7TV46zXaIvqAd/4cvyO3r3p103MBzNqwa2hb5Yt/SdKGkLpyVdJOO7vgsawhghnhWbQtl9BTx4bXuAebO3aUOB+9iwILjVlZRaaSP7PDCiCIW6r4b0S3AbsXvKIqMoaYKYUX0VXz5xmvDMmTPCijDeybCsI11R0xgY/7BPSa10OxuQ8lkBGnoL9+LxsCwxPbtAbHxzAlDT5oz29sk7W08TuwIvT56yM14g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lNrcyLngbT1jUXKMgFamWP9hmWhYgCeJbR+6WAG9LzM=;
 b=MdxBK6TqprxWqOf3iUdB22uHqBvk7FqFKnjqu9szQbQBUiXt6p614LhpSCm1Fr2wf/gb2X9jXGKzts+Nf6OqyHir99Nwy1/hJZh7y10DeehrSp7VMDD+gaOxVjBWB6BMYZYLjgGEs5645g2EwuekNi6/gyuIdme4OiStVaY8B/T0YQOMSOT3AoSiygMnC5qDJIhlzDJmIC6wWi1rm3ZFPZupFVXk52ZBa7u7sfDHH+ZIJYzyyhDuL40Lu0JPTBx5XFiv9PoPPLhxnwPYJyPNuFI513jTjVTy+ObNdyyge2lae5H2Oa+CF4g+TidyesWS7Tx1iTwzhOkFEU7TqD17yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by MW6PR11MB8389.namprd11.prod.outlook.com (2603:10b6:303:23d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.11; Fri, 19 Apr
 2024 14:56:57 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7472.037; Fri, 19 Apr 2024
 14:56:57 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH 10/13] drm/xe: Move ufence check to op_lock
Thread-Topic: [PATCH 10/13] drm/xe: Move ufence check to op_lock
Thread-Index: AQHaiwmq+e5z9x1g20GIbgP7yczPZLFvvVVQ
Date: Fri, 19 Apr 2024 14:56:57 +0000
Message-ID: <SA1PR11MB69910F19616829F8DF7F83AC920D2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240410054056.478023-1-matthew.brost@intel.com>
 <20240410054056.478023-11-matthew.brost@intel.com>
In-Reply-To: <20240410054056.478023-11-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|MW6PR11MB8389:EE_
x-ms-office365-filtering-correlation-id: 5013c432-c53a-4367-8c3c-08dc6080f5c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: z6uYK5XAEnR+arY2xa43hwMv/S8ewBX3CSLdRFVZ4WeOhpCojT+lUeEixvwXSW2zGylSRtxH+LB+HHz7RFMdAe1g9cMochUVidX4kijSRsABFMfahhNVumfAleRMM2L355M7id0zjAKJNpRwb5gY82RnnShLDdkW/woc+dcvbhPYn99FbFH9VT/kCvdLvZkGyCrHiICX+nWQUKwrx5rxCDFLi8g9LPyNdKqZoZOlljUwqY0ycPAWAjVDKmLGcHplqaooZ9ixPc41gFGQ5395+lGxuhPbdp2moKcxYdPSyo8hesOFfQ0kAwFJO62mSgaKVVo4agLE5JQfym73b87uOeC5NcVbRum3FD83T+oUQWVJQ3oTDHTuPCxZTiPeiYp21s2QJGQ4DJ7XSLcBq88TfBsXZJPePlGNzETUdKI6h8Lu4gYdZhOAb/4ip9Tb/BnLVZLdqLiyvKpvQTz3s759ASUw8Bznj+0Xg5H8MVAuDpIsiHdcMC723JW7lcg4Nxj3hiWMMhpPweITkZ2/6kMFOw+hBAaTLkPc4QagvDDdaZj8AZAZ0mSzEygJHIkyYC410ghMpmWg63bfUoMQ5NcZRCkKJVEO+Vt/CCPcu1dLRaa3OutsMK02/OP7hczyOvMmGWAoJvh6XoVIYDLz3NSXCKi8YdMMKlaV4E4G3AjBwboQQOCUKZcSN84D7qBiD5BMQxYgBslVb/aWZltEP/4yoQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?j0LR8tGT+ALuGfa2xqcXHVqQibgtjwWfZiDDLKbLEgJZOpCiEjqwEk+wpfzT?=
 =?us-ascii?Q?JgGoom45xMoKatVIMVYxbYhVca1J/xKIxb4P9uLFT1QEz9aRFtRIwjrJajKv?=
 =?us-ascii?Q?kWu9wpcwl8gWfJFZUFHSzAiidPsTXNkZFGlc/up6wNJ8YNpA6quoZ+V8gGNt?=
 =?us-ascii?Q?+5xiYP7WmasgHZ2UUZhqifobRGjcbLGSzqI+WAKrUPRTK1BgdHYX1Yf6Wk+O?=
 =?us-ascii?Q?OuMt+Proa7x8BbYXQgtUpFWfAWMzAuRcYLAuKOcr4Xkhcb/OcpfCqrqxPNFy?=
 =?us-ascii?Q?YfwckE6Xvxm2f3MxDnAMJ4+8YsrqHAeMCvZQOCDOPXU52xpycqIAwwihGm6P?=
 =?us-ascii?Q?Jh2WHG9TIV8tl5BD4Ad+sPYxsezZ00orRbg6Tvnj8cZIUpZerBI8dRvwyI4A?=
 =?us-ascii?Q?NxWdrJJlrXxf6P/aCUV98q6F5J4+8wCIl3NOUEAIQR5CPsl2CLb66QBsOPBs?=
 =?us-ascii?Q?QE6PBX1dDYCX/4xb8VtHrK/hPgLi2NW5KH3zDLRgpA2AVjGExbdQFGfxmv4E?=
 =?us-ascii?Q?LN38vOAIIqQDg47lxqwM05e3ernL9CYanCkef6aRktEs5zqmYm0hhbUu7QV+?=
 =?us-ascii?Q?fl3JKjH2u9nQprVH/RSOuxJRrCYRXMowTRmj+zcMB/RKG6x7y4+muVLbsgGl?=
 =?us-ascii?Q?19LoelJlNQ/nPajobrqm8AL5o8O+t1V/G8flUBVaUGQVCixsqHq+zJK02dwL?=
 =?us-ascii?Q?Q+y5XyZShuNlbnvqejpu/zX2XUBkMAJ7KTL9jGQx2B85fg540SdFhge6gEh/?=
 =?us-ascii?Q?NnQG969sgE2obP654NWQdQ7V9fOlFsXfueT81CY0jdMDOvJ/qV27qpMEVAhg?=
 =?us-ascii?Q?ons9m9q++KA0GybvekMljRfvK8rJfAoCORcKdHVVYRW23L/PDE1O+s6fFyaJ?=
 =?us-ascii?Q?PDPk1J7SxOQeYysj8OeUfTnMjrZ8rEjLeyM349u+qkTOVyOpezLtMiQoQi7F?=
 =?us-ascii?Q?LojM8Rs4aC6uM/W6bqkHlBXsI+OUzgb19+bK61gyIq5cMWFPlDHzTjhQjWHu?=
 =?us-ascii?Q?lyiq6AKODxUajHrUlBfbEacIA5uYhjg841Xw5Q3rLWrpppdKaj/QjkBSVnuF?=
 =?us-ascii?Q?HmcwsgZ8SO4h6Zhz7NhbFmdg88BXe+2YRb8ntgttOK8adjL4/N/zaYsnjNju?=
 =?us-ascii?Q?i36XMKjVWUElumatQTavDYKGY5dwqjWI5bCvcgfHjHBWAGPV60iae8wFYBJj?=
 =?us-ascii?Q?SmLNbxikOD/l8vT5ZFPdXZ2eC9TvTEryhHOgM+WFATUt0FSzxHUkS5VxoK5u?=
 =?us-ascii?Q?zeADPEzQqFsFe7Z5Fcf1ZU47wz7bjDTKnketNg1tvZpYG8YiqBkImOdLsakj?=
 =?us-ascii?Q?usIE3JIZV4hXufXEztcX8mBZXOPH56b6ygRKsq56gFG+E/7CNuSTxw5em8KH?=
 =?us-ascii?Q?q5VR4vVMh1EX1+2hzJIYBvU16ExqTeUuQROJhIUeVHVuHoF5w7W4CLmGESPZ?=
 =?us-ascii?Q?MmdMg2ZUCdOy8gHK6+ieBB7rlJgzU1uIF2aGzgqjDdPamkzcMeajmpgUEtNb?=
 =?us-ascii?Q?WH8OhgQlz91TQ8SDIlUR7vaQOfoZKgYIg8VY/W3qHHnJW1qcLcTe7wpur3sH?=
 =?us-ascii?Q?EgsogE0cFxtCOmGcB3k=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5013c432-c53a-4367-8c3c-08dc6080f5c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2024 14:56:57.4984 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /qiMz84vH+UJyHTczjbyxyFi5JOyFNzleGvKeLvDaNGmgfTb2LJYWnnB8mWmdVucP8W/2jH2IVPVqf+MUQIJDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8389
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

There is a typo in the commit message. Other that patch looks good.

Reviewed-by: Oak Zeng <oak.zeng@intel.com>

> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Matthew Brost
> Sent: Wednesday, April 10, 2024 1:41 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Brost, Matthew <matthew.brost@intel.com>
> Subject: [PATCH 10/13] drm/xe: Move ufence check to op_lock
>=20
> Rather than checking for an unsignaled ufence ay

At

Oak


 unbind time, check for
> this during the op_lock function. This will help with the transition to
> job 1 per VM bind IOCTL.
>=20
> v2:
>  - Rebase
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 33 +++++++++++++++++++++++----------
>  1 file changed, 23 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 97384c77f662..0319e70577fe 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1755,16 +1755,6 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct
> xe_exec_queue *q,
>=20
>  	trace_xe_vma_unbind(vma);
>=20
> -	if (vma->ufence) {
> -		struct xe_user_fence * const f =3D vma->ufence;
> -
> -		if (!xe_sync_ufence_get_status(f))
> -			return ERR_PTR(-EBUSY);
> -
> -		vma->ufence =3D NULL;
> -		xe_sync_ufence_put(f);
> -	}
> -
>  	if (number_tiles > 1) {
>  		fences =3D kmalloc_array(number_tiles, sizeof(*fences),
>  				       GFP_KERNEL);
> @@ -2819,6 +2809,21 @@ static int vma_lock_and_validate(struct drm_exec
> *exec, struct xe_vma *vma,
>  	return err;
>  }
>=20
> +static int check_ufence(struct xe_vma *vma)
> +{
> +	if (vma->ufence) {
> +		struct xe_user_fence * const f =3D vma->ufence;
> +
> +		if (!xe_sync_ufence_get_status(f))
> +			return -EBUSY;
> +
> +		vma->ufence =3D NULL;
> +		xe_sync_ufence_put(f);
> +	}
> +
> +	return 0;
> +}
> +
>  static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  			    struct xe_vma_op *op)
>  {
> @@ -2830,6 +2835,10 @@ static int op_lock_and_prep(struct drm_exec
> *exec, struct xe_vm *vm,
>  					    !xe_vm_in_fault_mode(vm));
>  		break;
>  	case DRM_GPUVA_OP_REMAP:
> +		err =3D check_ufence(gpuva_to_vma(op->base.remap.unmap-
> >va));
> +		if (err)
> +			break;
> +
>  		err =3D vma_lock_and_validate(exec,
>  					    gpuva_to_vma(op-
> >base.remap.unmap->va),
>  					    false);
> @@ -2839,6 +2848,10 @@ static int op_lock_and_prep(struct drm_exec
> *exec, struct xe_vm *vm,
>  			err =3D vma_lock_and_validate(exec, op->remap.next,
> true);
>  		break;
>  	case DRM_GPUVA_OP_UNMAP:
> +		err =3D check_ufence(gpuva_to_vma(op->base.unmap.va));
> +		if (err)
> +			break;
> +
>  		err =3D vma_lock_and_validate(exec,
>  					    gpuva_to_vma(op-
> >base.unmap.va),
>  					    false);
> --
> 2.34.1

