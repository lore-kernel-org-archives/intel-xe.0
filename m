Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E5FC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 14:51:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1557A10ED98;
	Fri, 19 Apr 2024 14:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WhhdX24P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6171910ED98
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 14:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713538278; x=1745074278;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=J+yxO5YKEtSAAjbfh2OcdeI3DJVLvcLPbsr1GjRByUc=;
 b=WhhdX24PqlCGVfA3wlrTWMbKwr0ard08vXVRC9W9EBkgc+OQazr6QECm
 SyKcM6Z6dVMuAeclVhuf8je/5SO71TnlEQkx8m54i31ZsYA3nQc68Nf1U
 vrxHbNIbkHIrB0ujv5DLfx9OrfGOV9RmnjIbLBpdcHCP9N27MzLXw1tSm
 wivvbh2rSr0FsG8Zf92Jn6uimRLSMcni4FL9KHcE44fxCzbfBreczkd5G
 805x5GdFIdXL0rvkWyf3bG25/YD06Xjl6kokVedEuE94swHDR6OSnRpVA
 hQS0cVThHy6gJ6kwrpwj1QmvlGGQzjBBuQ8bx8fcpxoAFv1EYHe6d0vSC A==;
X-CSE-ConnectionGUID: wABlqsCkRcCl6P46qeTSew==
X-CSE-MsgGUID: X3W3gOmER5maUaRw3cPXfw==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="20565130"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="20565130"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 07:51:18 -0700
X-CSE-ConnectionGUID: c3oCWipfR+u7dTytEx61rw==
X-CSE-MsgGUID: YJpnhw/RTomb3SaNqr7RmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="28001732"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Apr 2024 07:51:18 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 07:51:17 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 07:51:16 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Apr 2024 07:51:16 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Apr 2024 07:51:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BZMlKsRFY6WFIXlAr0fQKgp83Je5FPx0BsPs05Vmq+WmgCI5tDH3H4FJ18oSRfQa7w0E95ptrodvWcx0yaRVnawSu4xzYctccDHSyUE+qzkPr/2ghqqsp7W92LQprL2qm6C5gQdhHgUJrrzQk5YmvUEodoQ2Oq2i+vVm59D7AjUuoGVZnpvH7DDEfmKb+yzEEoLzPkKdqE0N5neTtjMwN3TQxl1bOx8dplJQONbC30BBOxFBrQJ0yCGHIP5QJ/24o81x7gwkX9BcnQYdcSBhPfdTh28yyMxgrTZvsm5hN3kkveGAftVLaV/qFxam7aKe3kIUx5J8Frtm3oWDhmkrTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bMGeYgpXgFPfRyz2/pZslc2OQ+kgm9wBlrFFnGepp3o=;
 b=b3f7I2RHY2cHPh61Q7iu1NMeQ+ydjPI57Uo3q8SkGP3O/O1wUR1Qqzl0Z7kuPgB1BGbmH/JV1UCG6s7lPiDhOSGl7iDb/S7DNQKufp+NTRoFGiSkrRSSszDfPn86janzC4bUY3fpQIirtAUL6k3UldBtDCxufeicKp7RejsekUbv4h+vrLaNi/Z/VbfWPFQt+aqzLSgtd5xx2ET3YlkG1PFdmqG4QSi1RsfynY6tIaUHWihJFcMKj2BWyutcOnd63ZTR/LUR4ElENFBRpv1FiqSc2TH16Api6xgRPIyaC1P5rlNfsHPB6BLi9SncJrLZxk0Z8WFWHfQ/wCQpy/+S7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by DS7PR11MB6151.namprd11.prod.outlook.com (2603:10b6:8:9c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.12; Fri, 19 Apr
 2024 14:51:13 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7472.037; Fri, 19 Apr 2024
 14:51:13 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 09/13] drm/xe: Add vm_bind_ioctl_ops_fini helper
Thread-Topic: [PATCH 09/13] drm/xe: Add vm_bind_ioctl_ops_fini helper
Thread-Index: AQHaiwmi/GLOoMXxhUGHWTANpi5hJbFvu8nQ
Date: Fri, 19 Apr 2024 14:51:12 +0000
Message-ID: <SA1PR11MB6991800372D3482C293DF146920D2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240410054056.478023-1-matthew.brost@intel.com>
 <20240410054056.478023-10-matthew.brost@intel.com>
In-Reply-To: <20240410054056.478023-10-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|DS7PR11MB6151:EE_
x-ms-office365-filtering-correlation-id: 20af83f0-ebc3-4273-06a2-08dc6080286d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: +vphEyos1nWZcHo1uMgFfhyofhtnA3TJ1RQDmNOg8+W4rL0vHiL+omzKfLRiH+ESvPz0pmLfe0Nkjy1XEiCtEHafdTzO/J7o/b2yqFx2yCyV6eTtwwMwSQvs9DUDQlgNsLUAuUYRX3IdoX2ug6yOB5b7qBla8XU/n55y8gKXVCS8MrmRKZnrv3IQlAYEi1YKH53TksPT0g/a7R1xNNRnXaApSol+c3PKjVAl/Kb+CjuUVBuWrpeTicd3F5rGoSS7nD4NGPUYUaBwws04XXGArongT+Ee3etjNpT8BLamIvP+gyuU74w+INM+2eXI5yhPieJh6m9JJRVJo4LqMREqN4MC7CpB/CkjUjWaBoFu/EiRoxwDL9woZyaKeJb6FsvcUu0jbHDyUSqiNaI8hgDtGMJP57dWN9A8OTuN/1+y+IFP5Nj9z0Bmy6UC4paVbf0fH+jQ02zqQ559SkKgZJdqzxwfZ3skTdS8VwIHHXPheQff+i17YGQIsnlsHiwN6roCllcq109WocR9Ss3DCaIWvhOJYA8NyUOCupMm5amO3zQHEbpKmT0hi3ZNf7GQ9Q9IzsbrqIsbaBw8Ef+60uVeRV58mgLKq7BCDrJnNHpGsEluK8ptqN8r59MKIZtC91fm18KIsrLZRZw56tKnS1r0m6cxx04MaXZ7xa2xu9UgOFlfEv+jeT6KzhW7k508uix+zL+A570FdcTzVcl/eY7PibELqa/RP5qR12bt5ghgqJg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3/mMEtqNgwDvnrqkcLvrrOuNMazxCtm7kXKpucO1HMJpZR3m51VWmGSBNh/j?=
 =?us-ascii?Q?cKSEEsdQ2Sh3a7tb12yAtUZRjBw1TbFZMfaeAujW4bj3ARya03zoiYK+T390?=
 =?us-ascii?Q?mOAEbvbaZf4/oiMryDM0warACfla78GeaQcVFcqrT/zvA+46dDYIjjPk3Kog?=
 =?us-ascii?Q?dWJ00Oq3WiIx9L5RHkjnfSmlXb0IQtduNrlxbM1L9BkdIV8pUGb3ige8iFrY?=
 =?us-ascii?Q?ktSCS3pv8mEPEq7p1wLciS0G/hbZ9eqUIynnh+8Ye1MwYnb8GZUEwhRqtf2q?=
 =?us-ascii?Q?0y/KFgl1IWn2gVSfOORfIuxfpvn3RUO4e23LOuRhu0PcA6kdyF3b4hCkkvKr?=
 =?us-ascii?Q?Nze3LGhRJiVhNBrRfPH8loPQaDmKfuuYvISJxKT6wOEDJ2TJN4AGpF8o2uC4?=
 =?us-ascii?Q?w9WQSkh23UDnlvUS7mSWAEch1C0s7S/dUzyRyT7Z8Mckuqb2LnxZGLVykF2l?=
 =?us-ascii?Q?k6EB11O7tfQQaa7UTXxFkK5FhkWwdkJSMsJXIMwHyNcFIUIeoB5jrEmJJ0yC?=
 =?us-ascii?Q?j4cJK4kUytcbCe5SvYQhcwcVpt2Pv8Vxg7ub5XaTpnB6GPervO+UwQ7u29Ly?=
 =?us-ascii?Q?8b25yEukooIMCRuHC0B1cgPfpgnKv83bNd3C+CA2zznVEjO8I51ZSGYW9uYZ?=
 =?us-ascii?Q?X/V4YjMWKOlzg89xZCwkoEfYB3Rczh0LCS8/P81QakJCfdXFMVfMD2yKXWlU?=
 =?us-ascii?Q?bwmCQGH7KmDSljq3egQKSdly6Qzp8pjLgBbYCug2m6A/0mRdPfjYV+5oM7sd?=
 =?us-ascii?Q?Kn4i9boJNdAnTSBNwyUZmD3WDzs7oJUGxo3GMGWz2xUfn24oLM0vMcJG++ZH?=
 =?us-ascii?Q?9F+/RBhln15qbBM4JMyt/DWcnWERHVKAgP2vddN1l4Qo52M8Ul68ZdC+rY3G?=
 =?us-ascii?Q?7xEzjlWkM3bVAbbYt4znuUr+qcVIIaxWsHjYEWAb3kLFZv8nn+Jq+P5f3SWw?=
 =?us-ascii?Q?tfCvqkiiTIpUuHjLm/R8ofijQTo/XRFkmHV300yo3cShbFBHe9n6uzla+Dy/?=
 =?us-ascii?Q?63CLVNOF80HK6phpKX9MgxgNgGb9aaF6wxQBoLYQYSqhXknoN7UriWOPa/64?=
 =?us-ascii?Q?Xl3bJPct05eOHkvt6bzBCv2XJpartDPJo2b+E1vrF4npUnoXBvhKDTjAsx+j?=
 =?us-ascii?Q?zbWyCnW2/FpSa1TteIOaRuq+xsS6gC0ptURT1vZ2KI261MHdaxF267XCTk9Y?=
 =?us-ascii?Q?3z7lseLqq4bqHPuH7gjh6CvoWhoOUd7beVRU9H85B8SR9vnwshx7+YxxcUW4?=
 =?us-ascii?Q?GxY+h07/815HrXcJ7DYWAF7jcbu3200oDk7y4Ijiwu7mY7uqtZGvh8aR6gkQ?=
 =?us-ascii?Q?j15meDgJ9IDOWRcDQMfEfNyO+Jpr965d4GIynevvHWoXiNWCVvkP4hxT9kK7?=
 =?us-ascii?Q?6eqQNedHT1kFGoNC2SaaTjNcM1h7+Uadfgo/WyUFaJ1OmVQY7wVat8F+Q+oV?=
 =?us-ascii?Q?d1rsQlXMRcam1LSt2hTV1ghmN033z6o+xGkiKq1pRTzTte7hd86BXU90f9hf?=
 =?us-ascii?Q?Gdhed8ROlWZRNbZP5FUiszt4YJxtZ3QL1g9q0DKRCiS3XYFiZIUfDDQ5yNpd?=
 =?us-ascii?Q?FG1EJOXKMS2bu4T+84Q=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20af83f0-ebc3-4273-06a2-08dc6080286d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2024 14:51:12.9693 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DH/w8AmTFeG3AaHAz/DN7IVscNPcGSO5EiSFXSjJ72MHPs3k34p1eR34qV3npDc0Z6ERHqzed8nCSAuop/3tbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6151
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

It is a nice clean up. Patch is:

Reviewed-by: Oak Zeng <oak.zeng@intel.com>

> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Wednesday, April 10, 2024 1:41 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Brost, Matthew <matthew.brost@intel.com>; Zeng, Oak
> <oak.zeng@intel.com>
> Subject: [PATCH 09/13] drm/xe: Add vm_bind_ioctl_ops_fini helper
>=20
> Simplify VM bind code by signaling out-fences / destroying VMAs in a
> single location. Will help with transition single job for many bind ops.
>=20
> v2:
>  - s/vm_bind_ioctl_ops_install_fences/vm_bind_ioctl_ops_fini (Oak)
>  - Set last fence in vm_bind_ioctl_ops_fini (Oak)
>=20
> Cc: Oak Zeng <oak.zeng@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 62 +++++++++++++++-----------------------
>  1 file changed, 24 insertions(+), 38 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 09871538484b..97384c77f662 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1748,7 +1748,7 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct
> xe_exec_queue *q,
>  	struct dma_fence *fence =3D NULL;
>  	struct dma_fence **fences =3D NULL;
>  	struct dma_fence_array *cf =3D NULL;
> -	int cur_fence =3D 0, i;
> +	int cur_fence =3D 0;
>  	int number_tiles =3D hweight8(vma->tile_present);
>  	int err;
>  	u8 id;
> @@ -1806,10 +1806,6 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct
> xe_exec_queue *q,
>=20
>  	fence =3D cf ? &cf->base : !fence ?
>  		xe_exec_queue_last_fence_get(wait_exec_queue, vm) :
> fence;
> -	if (last_op) {
> -		for (i =3D 0; i < num_syncs; i++)
> -			xe_sync_entry_signal(&syncs[i], fence);
> -	}
>=20
>  	return fence;
>=20
> @@ -1833,7 +1829,7 @@ xe_vm_bind_vma(struct xe_vma *vma, struct
> xe_exec_queue *q,
>  	struct dma_fence **fences =3D NULL;
>  	struct dma_fence_array *cf =3D NULL;
>  	struct xe_vm *vm =3D xe_vma_vm(vma);
> -	int cur_fence =3D 0, i;
> +	int cur_fence =3D 0;
>  	int number_tiles =3D hweight8(tile_mask);
>  	int err;
>  	u8 id;
> @@ -1880,12 +1876,6 @@ xe_vm_bind_vma(struct xe_vma *vma, struct
> xe_exec_queue *q,
>  		}
>  	}
>=20
> -	if (last_op) {
> -		for (i =3D 0; i < num_syncs; i++)
> -			xe_sync_entry_signal(&syncs[i],
> -					     cf ? &cf->base : fence);
> -	}
> -
>  	return cf ? &cf->base : fence;
>=20
>  err_fences:
> @@ -1937,20 +1927,11 @@ xe_vm_bind(struct xe_vm *vm, struct xe_vma
> *vma, struct xe_exec_queue *q,
>  		if (IS_ERR(fence))
>  			return fence;
>  	} else {
> -		int i;
> -
>  		xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
>=20
>  		fence =3D xe_exec_queue_last_fence_get(wait_exec_queue,
> vm);
> -		if (last_op) {
> -			for (i =3D 0; i < num_syncs; i++)
> -				xe_sync_entry_signal(&syncs[i], fence);
> -		}
>  	}
>=20
> -	if (last_op)
> -		xe_exec_queue_last_fence_set(wait_exec_queue, vm,
> fence);
> -
>  	return fence;
>  }
>=20
> @@ -1960,7 +1941,6 @@ xe_vm_unbind(struct xe_vm *vm, struct xe_vma
> *vma,
>  	     u32 num_syncs, bool first_op, bool last_op)
>  {
>  	struct dma_fence *fence;
> -	struct xe_exec_queue *wait_exec_queue =3D
> to_wait_exec_queue(vm, q);
>=20
>  	xe_vm_assert_held(vm);
>  	xe_bo_assert_held(xe_vma_bo(vma));
> @@ -1969,10 +1949,6 @@ xe_vm_unbind(struct xe_vm *vm, struct xe_vma
> *vma,
>  	if (IS_ERR(fence))
>  		return fence;
>=20
> -	xe_vma_destroy(vma, fence);
> -	if (last_op)
> -		xe_exec_queue_last_fence_set(wait_exec_queue, vm,
> fence);
> -
>  	return fence;
>  }
>=20
> @@ -2127,17 +2103,7 @@ xe_vm_prefetch(struct xe_vm *vm, struct
> xe_vma *vma,
>  		return xe_vm_bind(vm, vma, q, xe_vma_bo(vma), syncs,
> num_syncs,
>  				  vma->tile_mask, true, first_op, last_op);
>  	} else {
> -		struct dma_fence *fence =3D
> -			xe_exec_queue_last_fence_get(wait_exec_queue,
> vm);
> -		int i;
> -
> -		/* Nothing to do, signal fences now */
> -		if (last_op) {
> -			for (i =3D 0; i < num_syncs; i++)
> -				xe_sync_entry_signal(&syncs[i], fence);
> -		}
> -
> -		return fence;
> +		return xe_exec_queue_last_fence_get(wait_exec_queue,
> vm);
>  	}
>  }
>=20
> @@ -2939,6 +2905,26 @@ static struct dma_fence *ops_execute(struct
> xe_vm *vm,
>  	return fence;
>  }
>=20
> +static void vm_bind_ioctl_ops_fini(struct xe_vm *vm, struct xe_vma_ops
> *vops,
> +				   struct dma_fence *fence)
> +{
> +	struct xe_exec_queue *wait_exec_queue =3D
> to_wait_exec_queue(vm, vops->q);
> +	struct xe_vma_op *op;
> +	int i;
> +
> +	list_for_each_entry(op, &vops->list, link) {
> +		if (op->base.op =3D=3D DRM_GPUVA_OP_UNMAP)
> +			xe_vma_destroy(gpuva_to_vma(op-
> >base.unmap.va), fence);
> +		else if (op->base.op =3D=3D DRM_GPUVA_OP_REMAP)
> +			xe_vma_destroy(gpuva_to_vma(op-
> >base.remap.unmap->va),
> +				       fence);
> +	}
> +	for (i =3D 0; i < vops->num_syncs; i++)
> +		xe_sync_entry_signal(vops->syncs + i, fence);
> +	xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
> +	dma_fence_put(fence);
> +}
> +
>  static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
>  				     struct xe_vma_ops *vops)
>  {
> @@ -2963,7 +2949,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm
> *vm,
>  			xe_vm_kill(vm, false);
>  			goto unlock;
>  		} else {
> -			dma_fence_put(fence);
> +			vm_bind_ioctl_ops_fini(vm, vops, fence);
>  		}
>  	}
>=20
> --
> 2.34.1

