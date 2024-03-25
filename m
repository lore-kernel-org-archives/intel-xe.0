Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD6DC54E64
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 20:37:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 427A510E431;
	Mon, 25 Mar 2024 20:37:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DkBoNBLY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE0A10E431
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 20:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711399052; x=1742935052;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9JgkPuZT5Z3XzAm8xa7oPJSK8CCdvs/0Ghh22mZDbVY=;
 b=DkBoNBLYoX7A81ExqlUPY3xLzZAqjYFHldwgMBvGrJYfxIqSt3uYB8f/
 ii8gLxu9mGD8cus36CESjp1xKNV5bG0TA4TsXc9OWQHEw8dhz0epBaVBs
 sczqJOQyktO6YbfnxE/VxmGvKVVrJVGczaXSc873wWygaceBnqFyFBcwa
 nr/dodCqO/Z4zXJOuyQ8FMXHz7lAvA6AXhXMCLTArpqYP+NR+2YehL9fM
 OOutHYxCasfm9n0lVaBmLtt+ulpS1QII2GkAW0fWOdmyivXHqne8B5bP0
 naqmQg9mb7snCRCL6cCE4jxRg3XiWngJF2vCXWQrdVg7xflGMZru8MCG6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6606867"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="6606867"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 13:37:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; d="scan'208";a="15790630"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 13:37:31 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 13:37:30 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 13:37:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 13:37:30 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 13:37:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NyvDXTaHb8ctFlm5Z0RosoQ9lmNpHZmU4eFYMlP+iGfXH+7I2s/1XX359GWa+h08DmuBapn8tEdQu5C/wzOLmTi58kOx1LWZbYvIHnKZ4Vo1hfwqOb5p/JGa9jPo011xGs348lb9O75pVEYymxMTCzDT6l3yMvoSsoV+DS3W7zzdUi4/9gDsKOk3VFxDsh+t6MqZAZHXAIqurK0NDNHMln2vUHZPG882s/+m3n2DuHxdm3MhI6k4hTTOoTTuAu2Uf5a68ycttrLAKeioP1aYrxO/P3c3xvNO1lCeEVJ4SIRza7h81Aqyt4sWqV8OloGke28mzOBpoIGIc4kgVjzexw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Krt9lWaiJe4bkW10kPGzqCggC/0YvPBYBJimGuGmRo=;
 b=MfqsFHkPTOeeqnHAK3tp3AEqqPLcArWqj3Yr7NZMy6vIAme5F8pRas4m4WQpQArAUReYIkUZ+3FQc2GM/H8eQxlJt5gTvDUtaRmJ00O4hQu/pklfg/HPF4MLSsUlPuiIcKXAt7N+pXCRXkc2tvM76ALgZKBhQfpYj/RlyDuQSDDaGPThzta75AC0gnqwmD3ahZPGo7vZ8OOc5t/LPBmEy1SMkIJYisdW/wH2m3aggkURefWhN0ezVJnUxoRInkBzTUUPRqVbfkN976aENurwHsudVOLg6ex2u4hGN9aV9xPKghri8H9apQCRCCxWXMN2euQXLGLQVkf37TDedsILLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by DM4PR11MB6285.namprd11.prod.outlook.com (2603:10b6:8:a8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 20:37:28 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Mon, 25 Mar 2024
 20:37:28 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH v4 12/30] drm/xe: Move ufence check to op_lock
Thread-Topic: [PATCH v4 12/30] drm/xe: Move ufence check to op_lock
Thread-Index: AQHacRaojlb0cyoTyky55Go2Q5MDKbFJBh/A
Date: Mon, 25 Mar 2024 20:37:28 +0000
Message-ID: <SA1PR11MB6991D7D3A5598E5F6492C1B192362@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
 <20240308050806.577176-13-matthew.brost@intel.com>
In-Reply-To: <20240308050806.577176-13-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|DM4PR11MB6285:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nGRwwNAk4N7pP4J/Wm2p/Auoi79lDFluJeNep6kEOV2vk8LmYG62Q3e+PQXKnKkQB+Yym1A8rvdWVm+aWzclACHW7xYlp5yoT5/oXnoqMXCtfpGkwbnr+kjBk8eRBWrKv53fiJnXSatFX/EjPqBxLzepce07FIfiB4yjBCKAErzPahW1E3YkM3N/kZMVEbvWRsm5pa/lmkpkUpsszPMtLbAYfR3sBkefGzPMzNfusexbIHPOzfYdBNl2zn+D2Yziy75Z+S171qqjCmlXceqYaNKMLT+A/26O2ERHskuTdlcHA+dA9MM5NfLxeSgkHfqJA6WUiLHveCjWzcom/jUDkMWcEGNRwFw3EpuaT1qYZYRTwEYsB+11rGEvoaOtColYsIlv1u0RSlIRO+PYp4Dr4l4mv82IC1n2gp3KoD0FDOAc4ZT8BUcddvyVvOfxka0g9QBuHWpsf3kIGc938wqKSgMP7orUssOIZyck7gMFyT/YJ543ipML72CYK85jYitinHL05ZmmgV8fE2u0Y5FQ/QnpL18NsL4TCZyrGhmgrHyuVaILDQNF5+Uju8XVsxL0mRjlNI5DPtfDfbxXqAIztr3GVYM6q2rJ8px96uVzlO1H/199jYAlaR0WCHB2s9aoWeplVD3sV7Dl2nFC6RxAyIVhHuM2D2pSCfbY5JPs6EM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LQ3usPfPplDIQ+GU/lh53d0ir1BpPrko4DegZM8HrNxCn606wGlwqxN78GN9?=
 =?us-ascii?Q?GSntj1NU+92hfygO1FYC91oZIu7N9aIfO0ITsV5Qeq8F4OKbARPxhvUqtDSa?=
 =?us-ascii?Q?yN8I2FTePTgYQvszWZIvsLIIwkKPkowAwOrDNXU3lgerMPWNi5ncuBaGxk4h?=
 =?us-ascii?Q?FLkCfCdQ22ZnWN4cArM79IEdJ0UCH1bY+/nXDe0x9u1l9UQKqOVkkPDfltBV?=
 =?us-ascii?Q?LsccTvXEJ2+L/PBgInNASMWtuOUThucZJ2VPzgKjN+0zsvW+NKVplqzDhKOD?=
 =?us-ascii?Q?v4uI5bLn+AFrffyI/yHsOzGGSpb0aqlp9dLrnKV9+hYe7jSRK8wYsPoRn+NE?=
 =?us-ascii?Q?n639XBBJSR50/OB4QTiyhuXveUxZHL/ExHfstcMP0BtveVUwpCdbSyd12975?=
 =?us-ascii?Q?Pv6eDk946N7OS5CBszY8/Qj5UJJDNMCSBmG3pltPhWgHwrR/JHcEdk4wcBtw?=
 =?us-ascii?Q?6IaxwNz8a9GPQGzr42+iysL/tYxN5nKef218a3xeT4xfbGLWd/yMqqnZ5bQk?=
 =?us-ascii?Q?j2mmndhx7STAKS1eS80jEkM6Ovt3edQXkTv8460UCZJgIg9sbGOKppE0eXH5?=
 =?us-ascii?Q?fDv4Vd8dy+SFVpyYx3i/kCRRd6ZkgJc0AAc6xHEXmxQQ4vFIuy0dv/i5/ejX?=
 =?us-ascii?Q?MTDVgBvhS7FeIm4+LBdFaOQvrNTcPcaZeQh8+HyKOwij7mTyZFhoqetUajT3?=
 =?us-ascii?Q?lDQ3MeNaSQt5Rh66hfPstVeKCQqHLzkNDwsviIzCg/lODh7bkiV25FHRT+ni?=
 =?us-ascii?Q?guX9XpTwNm3dFpM/tiKqOfnFBkmtHaMKDk6/ZcouQqjwMN/rdcEVgYnazBYn?=
 =?us-ascii?Q?oJCxhzlo9eG9DbVaZyENCVWrWy59boVXJc/+SaSdixOITppN7dkhA2rJTxDk?=
 =?us-ascii?Q?UzBm08+mixTHnx2EyLpI3kU5mto5haElrIX1GIwNVPrZz6jjGfX9urJAY7yo?=
 =?us-ascii?Q?4F6QSiPMuRpCX60J87UiCc3J/y9YZJ9XVZ0UntgOvJV3qyulkn+MoLmRUawF?=
 =?us-ascii?Q?CHWHO2dKIDySKT8yaB66PHS0UogMKARWZvbnCVZv5PBmHRUI8QfpPNjisywC?=
 =?us-ascii?Q?/OElxDNvKjp3h6aBSJ/lG254hgSM79EmBZi6SPilx+aGsjEHNT02l8zLa/Rc?=
 =?us-ascii?Q?VJ/jxz3LH+drAyiNiBgFEedveTXvWjbJL95yB6/O6jwRijNy0pbRY+e5Tm0w?=
 =?us-ascii?Q?+wnlTaCFfjcHE5QkUkA6mLyxII4qzM9apx6zm1RYKf5Zva2DSSTYjfrvDLs6?=
 =?us-ascii?Q?KpZxAmOuhVAGSatE5eWLzVEje7/5cLb3juAHjNkinQGV8H45LMCmSSiNqHMV?=
 =?us-ascii?Q?a5TmgQlu6TL5FliS622jq7SjBzN+4hihYgSs75y2Z0NMpHrma8CmDZlhYj4g?=
 =?us-ascii?Q?OL4K0DmQnDDipiXLttcdcKwocZP238jYMKVd3yG/bQ22wBSxpYRseZyQuqBT?=
 =?us-ascii?Q?QPxwQe8e3gQwRwmfBzi43DOzahkVy4d+XI0k1bPudbebsL/KSXDeVbrLMWhd?=
 =?us-ascii?Q?Tw1WacdhAHlcKCqJjUJWzejh+kdExaa2bUTWKqzINW9VPzfnQ6g7ZA4mbjLq?=
 =?us-ascii?Q?xYYFaFr2fSuLswfqNTg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db4dad62-5c2b-4a57-2b9d-08dc4d0b6308
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2024 20:37:28.0646 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tWqK3g0xsRk0mJ72KCZrZ9+kzIOU4z+0YiR2yLqAq8L8hdpO8QwkStSH4w5IK546k2hnxwrwOxesvfSomec6hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6285
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

Patch makes sense to me. See one comment inline

> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matt=
hew
> Brost
> Sent: Friday, March 8, 2024 12:08 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Brost, Matthew <matthew.brost@intel.com>
> Subject: [PATCH v4 12/30] drm/xe: Move ufence check to op_lock
>=20
> Rather than checking for an unsignaled ufence ay unbind time, check for
> this during the op_lock function. This will help with the transition to
> job 1 per VM bind IOCTL.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 33 +++++++++++++++++++++++----------
>  1 file changed, 23 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 4432531f39fe..5767955529dd 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1665,16 +1665,6 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct
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
> @@ -2721,6 +2711,21 @@ static int vma_lock(struct drm_exec *exec, struct
> xe_vma *vma, bool validate)
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
>  static int op_lock(struct drm_exec *exec, struct xe_vm *vm,
>  		   struct xe_vma_op *op)
>  {
> @@ -2731,6 +2736,10 @@ static int op_lock(struct drm_exec *exec, struct x=
e_vm
> *vm,
>  		err =3D vma_lock(exec, op-
> >map.vma, !xe_vm_in_fault_mode(vm));
>  		break;
>  	case DRM_GPUVA_OP_REMAP:
> +		err =3D check_ufence(gpuva_to_vma(op->base.remap.unmap-
> >va));

This is another reason we need to rename op_lock...

Oak

> +		if (err)
> +			break;
> +
>  		err =3D vma_lock(exec, gpuva_to_vma(op->base.remap.unmap-
> >va),
>  			       false);
>  		if (!err && op->remap.prev)
> @@ -2739,6 +2748,10 @@ static int op_lock(struct drm_exec *exec, struct x=
e_vm
> *vm,
>  			err =3D vma_lock(exec, op->remap.next, true);
>  		break;
>  	case DRM_GPUVA_OP_UNMAP:
> +		err =3D check_ufence(gpuva_to_vma(op->base.unmap.va));
> +		if (err)
> +			break;
> +
>  		err =3D vma_lock(exec, gpuva_to_vma(op->base.unmap.va), false);
>  		break;
>  	case DRM_GPUVA_OP_PREFETCH:
> --
> 2.34.1

