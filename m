Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8C8C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 16:16:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5AEB113DA1;
	Thu, 18 Apr 2024 16:16:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iUK/W3wE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E6EF113DA3
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Apr 2024 16:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713456981; x=1744992981;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=uLJiXMAVAfq3XE7V08Gh+s3I+YLhtGAMLRH4XL0Iexg=;
 b=iUK/W3wEHjtQHRZ1B4n56BMC8d57TIx+mzsOFsNH6yJ1puEkJscOkmFq
 MEK47nQHjZSsbDYVG2NdQe1xnY9SRehhJ1oFfvdB2IKTW8biKwO0ndqNY
 /DzQi96CCFlxDH2xQRynmZPqdvBFeexmKw9Q45dYhItVg2EZYcNWi0EHw
 o/+56DZuVn2uaXkHZ6qs9+0kls1Fq0hZQBjbog+AI7DEiidAgJMhw/yVM
 AgN1CKSo0nKF0mMYpEW0haZCc04Ohuy9rTN5alwqJa2SGdQjDtD3NM7cC
 JFF66KxW6XpM4RXf40j0a8/ajlAQEB27ix3gk1PNVopuSMpJrYlwCKxhV w==;
X-CSE-ConnectionGUID: q21m7PSyT7ero0zGp9FCHw==
X-CSE-MsgGUID: tyeZH5WhQ8S5FDRT/0Ez5Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="20437141"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="20437141"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 09:16:20 -0700
X-CSE-ConnectionGUID: M2Gx1G3rQ9Su1SXCkyGvlQ==
X-CSE-MsgGUID: hAJq9KDDQoqBKpmxA8dQxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="27482406"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Apr 2024 09:16:19 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 09:16:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 09:16:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 09:16:18 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 09:16:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+iiF9VhCCZlQAVUpzQ5FOd4rDX2GfLM4ni746omM13iQc5+rtNtP0n/xJUJHKJHY1pZeF9qiwAhC2Wd4QID2WGIYoIZm8elKRouKz94U2VsEmdRCzUNdme7DUWRgJtMPIHQeKAgFY4g9Y1QE191qCBX33ZFuRQfLNroKUSxQncacYgZTEubTfp+ZHmzNjhf2sqdlzT9rXU6hzbaPog1oqGFfOijxbxnF318//YqiI0uc9XZ4Po46ZIfClXDQQ8Ne/NqrKwNNMuiqTdukTlqgoyV1J2jxp//ylmqnKF+98/WZxdQNHeRSuxdE7o1TZYpzrEVNY8opPcwzNesOEMLtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0VOs8IUtEIpvSQLr9j0OEJxBWlI2C6r5rVRoWxNUEs=;
 b=ioRn3xFIZZA3bV1rLwSCb1qNQwsYIUKF4wbl4l0wWgLyf0KYDNVo3+lKjo7VNqd2SkaNFAxta4frcBPabdfctSiTbQWYr0DiOzz5YjAqNWbZp1cOBU3ipSqHsZmkzViXWfXFN+6tcHl+sl50FiM9MREZ2gbCdkbCztvQ6mVUppO1pBHML3zgL+wT5A72IZ2O4DbcFGywgJ+Xd3iPL1ZcXUGMKUvSNLfv3N9TT47YbLKZPk/SX1mSZN6WZ1rpxQDMZa+5xl8puHMQHcIQL30uFUiM1J+AfCMKUpJDVBHt5f7c8w+2tLN5TEbCVYx5/n6I5MYKPJwS+VvPJi+q4MFOJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by PH7PR11MB6554.namprd11.prod.outlook.com (2603:10b6:510:1a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Thu, 18 Apr
 2024 16:16:15 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 16:16:15 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 02/13] drm/xe: Add ops_execute function which returns a
 fence
Thread-Topic: [PATCH 02/13] drm/xe: Add ops_execute function which returns a
 fence
Thread-Index: AQHaiwmm2r+3AllXc0e2/xaxJGBOdbFuOgyg
Date: Thu, 18 Apr 2024 16:16:15 +0000
Message-ID: <SA1PR11MB69915478598B96B5553FE726920E2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240410054056.478023-1-matthew.brost@intel.com>
 <20240410054056.478023-3-matthew.brost@intel.com>
In-Reply-To: <20240410054056.478023-3-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|PH7PR11MB6554:EE_
x-ms-office365-filtering-correlation-id: 740781ea-9fd6-4e4c-ad80-08dc5fc2df6d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WaKC9eZ2NUU3+gNCQxh6BRtqOGWDH729Susdo8NoX+Vl20UaZkT0mr6c6WAu2Gi9SoFtMN82/AHQ5qxMLpLHYGLELwLDpNMfzbW46WV4l7dpQYobh2seXEfHdbt3RjaU8y3ib22qQtpm8WkmZAGZYDXPfbSYZVP7yZ6OXhTHoVJNZbFtCIUHQ7Q/dUe4S5t6AWnhc/OuEGXydqNW4dvLIOoKjnzGb88whc/2skW0mRpABAldvgM+Q9FIv7NJj+jiuHqjsbANLmsY7J5HWNOHI0khFX99aAt7PIUtoasYLlQjrT6QUFq4HjrsK+7hd8pb2Dos4APIToRyju+e6HDM46yLeYnYs7gJi49zBn6S0LkZk9iMWORFI63mK2Cn1IOr7HrsT7mZYlE0Y2686oN5YFe8oVBUNeGCfin5PPUm4umyPg6k7eOVbJVeKw9LQc3eU+FuiV90YToGuYEFl18un8U1V57MEnKoV0pVH4iiADf4xCvrzVifAZU95YFAPpLLsRUxpvpNAjPIVJvj319GLPFrRLsazLXPn5oYOCRO1hg1gmOEzo02fa+KP5Gch2zUoTYvsajB3Zz0onlw5SI6mxYel9Hj6UUo68qisgFV6PI44KgV8zBuVQcHMwC0vRXUYTVPYEqnCuggOSf77kqkK6dj9EetBoA9JpmwMltV581fGqvloYniP/tYa0c0/JfmAU5sDCWtix1LxJJI8saa+XMOUCZHAWYPOcXtmHvWWfU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6PBtvuV5IYiHqQdJkX5DrmkhEVm//D+DBuF+VzHn0te/+PHDpOHRTc1tgqLO?=
 =?us-ascii?Q?Mug4Tj0Yddpu+PVl9FFnWjoS3HGMbmlXJU8utJELdhOODlMF5OjfW46KlVkB?=
 =?us-ascii?Q?zp4KBdhP2aP1TXcs2MslOwM/sBehVzVfU12f40ss04SlDC9478NAUHGoqxsC?=
 =?us-ascii?Q?5wZWNdbE+MYI59vDrFqeKZ7gT/tGUeCvvGYpn+dXPWGLvGh4JjaLAJHzTUg+?=
 =?us-ascii?Q?AH00CWUOIK3mJ3xl0EoloWDwwxN+Yxkva9Ec1+R5FJqsYEreu0FGHv7MctFU?=
 =?us-ascii?Q?MkEARNXRf9+PnpOiTrwLXDo5eygAEwDK6RCgYQSZdgPgaiynj/PAeg0HTLZE?=
 =?us-ascii?Q?G7l/48E8uXI5spTmE1fCFQicB5zDWnRrH4tyeYrANxFu5CLB/d0jluotlmNp?=
 =?us-ascii?Q?t70E7gLmSNGEyFeeik3u8paWfn/NTLlhhfo5NB/RdZbiOjM6UhqnbBD2tD6c?=
 =?us-ascii?Q?iX0BdJkLgysuYZgNloxG8/6+whMzzjsKZUppciMJpSaQgtTS4Ses0PArfzic?=
 =?us-ascii?Q?kUklsI4xfHB6QeiOUGRkORaI8JFp4+8MK/PUZf/SUeW16O/6Wbttlw7SkZAm?=
 =?us-ascii?Q?BgkjG0JNDSWZcZJ6qtK0jBKRI2Fw2Rm2xb4Ke+RwUho689QUWXrOFGtqh0YE?=
 =?us-ascii?Q?TNHN1G23z46OmHEtu2HhS54zCim3R0kcTGGMyGFzP/24QalrLWPofjlnN4gg?=
 =?us-ascii?Q?7FpiDhphxQcCAghqGtnBEu7wWNXRWZ2sGIA28q/Y1K3ZrgCUIlmfbyx5EnSi?=
 =?us-ascii?Q?yrHxpw1WJvYKFevYa2v3pMwJ/jTvi1ASdMmDewkZ8rKVVmyxxyq74JuZ/1/f?=
 =?us-ascii?Q?C20k28Ml1TTngWopN8DVYwNh/LokXyZF5B1O9vv+SPHZwuyDUVos0jnd8rCY?=
 =?us-ascii?Q?/gDyGH483mwEqu3VrQ/4bdNL3D/hxKSCcJFlxB4ae4FtFM+Z9ngnnW7KJjRS?=
 =?us-ascii?Q?fjwsHkkO5YpHnFyzotFkWzpkjxX/dOwFv4Bi7G0Ui+npTFMLYJJBjFDchmKH?=
 =?us-ascii?Q?kx851piydvkylTliMGnyV9p3PCDZXIUNltCOMvT0u9TQaaK5jHrrfQffCiS5?=
 =?us-ascii?Q?MEAuLdiQ1djw1TvkBPewQ9Yt1osKWanalgUCTbtgRVzMu6Q4HmgsI0Esrb0V?=
 =?us-ascii?Q?LaH9M4U++9DFBIi3zXg2S4+RGjtz5KIGAek0qxJPIs9MmjM44uHGQ/eUjySp?=
 =?us-ascii?Q?CwYXr7dCjnayCR9+fnwNxyfg+iCQdsd8WdKHsbiMqXlKjjDDRHIC69V6pSRF?=
 =?us-ascii?Q?wCeTLxbP/R+5IosLfY7EwAYaycdd+rtkyW9mCaxR4O7kP7DStXZ5xP9mVxrE?=
 =?us-ascii?Q?XECH89zZRhLXYk2QSpjCzBsu3zYT4MLKnYShHx0nczlKvYbVrAsgMDoY0JP6?=
 =?us-ascii?Q?GnWKbyhcAmkZbWrm+VpyCrjw9gmfrMpAGWUWueuX+ZhK3CWqP+6OTUhtGyCn?=
 =?us-ascii?Q?2gWIrnacx1VWOw9j54J4KqOFH4Ua4a1O9b/y/jdT9n5tJDaTQCDg8jDvPFsb?=
 =?us-ascii?Q?4SUOiD1i3Ewx1Gbzt46lQ0qjuOHxRL5zMtTHYKg5Alency+evxpuoUnFyy1g?=
 =?us-ascii?Q?7U/4nIa9M8B46lH55fw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 740781ea-9fd6-4e4c-ad80-08dc5fc2df6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2024 16:16:15.6217 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DGsk2g4NAWJn+Zn8kBW9Inz/1wB6tQ+mp4i2Txdr9GLDeBYWo/tAgVvJPkL2Il/pOqzefL6nFoqvtsSoVUZ/sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6554
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
> Subject: [PATCH 02/13] drm/xe: Add ops_execute function which returns a
> fence
>=20
> Add ops_execute function which returns a fence. This will be helpful to
> initiate all binds (VM bind IOCTL, rebinds in exec IOCTL, rebinds in
> preempt rebind worker, and rebinds in pagefaults) via a gpuva ops list.
> Returning a fence is needed in various paths.
>=20
> v2:
>  - Rebase
>=20
> Cc: Oak Zeng <oak.zeng@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 211 +++++++++++++++++++------------------
>  1 file changed, 111 insertions(+), 100 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 6375c136e21a..84c6b10b4b78 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1834,16 +1834,17 @@ find_ufence_get(struct xe_sync_entry *syncs,
> u32 num_syncs)
>  	return NULL;
>  }
>=20
> -static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
> -			struct xe_exec_queue *q, struct xe_sync_entry
> *syncs,
> -			u32 num_syncs, bool immediate, bool first_op,
> -			bool last_op)
> +static struct dma_fence *
> +xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct
> xe_exec_queue *q,
> +	   struct xe_bo *bo, struct xe_sync_entry *syncs, u32 num_syncs,
> +	   bool immediate, bool first_op, bool last_op)
>  {
>  	struct dma_fence *fence;
>  	struct xe_exec_queue *wait_exec_queue =3D
> to_wait_exec_queue(vm, q);
>  	struct xe_user_fence *ufence;
>=20
>  	xe_vm_assert_held(vm);
> +	xe_bo_assert_held(bo);
>=20
>  	ufence =3D find_ufence_get(syncs, num_syncs);
>  	if (vma->ufence && ufence)
> @@ -1855,7 +1856,7 @@ static int __xe_vm_bind(struct xe_vm *vm, struct
> xe_vma *vma,
>  		fence =3D xe_vm_bind_vma(vma, q, syncs, num_syncs,
> first_op,
>  				       last_op);
>  		if (IS_ERR(fence))
> -			return PTR_ERR(fence);
> +			return fence;
>  	} else {
>  		int i;
>=20
> @@ -1870,26 +1871,14 @@ static int __xe_vm_bind(struct xe_vm *vm,
> struct xe_vma *vma,
>=20
>  	if (last_op)
>  		xe_exec_queue_last_fence_set(wait_exec_queue, vm,
> fence);
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
> -			struct xe_exec_queue *q, struct xe_sync_entry
> *syncs,
> -			u32 num_syncs, bool first_op, bool last_op)
> +static struct dma_fence *
> +xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
> +	     struct xe_exec_queue *q, struct xe_sync_entry *syncs,
> +	     u32 num_syncs, bool first_op, bool last_op)
>  {
>  	struct dma_fence *fence;
>  	struct xe_exec_queue *wait_exec_queue =3D
> to_wait_exec_queue(vm, q);
> @@ -1899,14 +1888,13 @@ static int xe_vm_unbind(struct xe_vm *vm,
> struct xe_vma *vma,
>=20
>  	fence =3D xe_vm_unbind_vma(vma, q, syncs, num_syncs, first_op,
> last_op);
>  	if (IS_ERR(fence))
> -		return PTR_ERR(fence);
> +		return fence;
>=20
>  	xe_vma_destroy(vma, fence);
>  	if (last_op)
>  		xe_exec_queue_last_fence_set(wait_exec_queue, vm,
> fence);
> -	dma_fence_put(fence);
>=20
> -	return 0;
> +	return fence;
>  }
>=20
>  #define ALL_DRM_XE_VM_CREATE_FLAGS
> (DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE | \
> @@ -2049,10 +2037,11 @@ static const u32 region_to_mem_type[] =3D {
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
>  	struct xe_exec_queue *wait_exec_queue =3D
> to_wait_exec_queue(vm, q);
>  	int err;
> @@ -2062,27 +2051,24 @@ static int xe_vm_prefetch(struct xe_vm *vm,
> struct xe_vma *vma,
>  	if (!xe_vma_has_no_bo(vma)) {
>  		err =3D xe_bo_migrate(xe_vma_bo(vma),
> region_to_mem_type[region]);
>  		if (err)
> -			return err;
> +			return ERR_PTR(err);
>  	}
>=20
>  	if (vma->tile_mask !=3D (vma->tile_present & ~vma->tile_invalidated))
> {
>  		return xe_vm_bind(vm, vma, q, xe_vma_bo(vma), syncs,
> num_syncs,
>  				  true, first_op, last_op);
>  	} else {
> +		struct dma_fence *fence =3D
> +			xe_exec_queue_last_fence_get(wait_exec_queue,
> vm);
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
>  				xe_sync_entry_signal(&syncs[i], fence);
> -				dma_fence_put(fence);
> -			}
>  		}
>=20
> -		return 0;
> +		return fence;
>  	}
>  }
>=20
> @@ -2535,10 +2521,10 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm
> *vm, struct xe_exec_queue *q,
>  	return 0;
>  }
>=20
> -static int op_execute(struct xe_vm *vm, struct xe_vma *vma,
> -		      struct xe_vma_op *op)
> +static struct dma_fence *op_execute(struct xe_vm *vm, struct xe_vma
> *vma,
> +				    struct xe_vma_op *op)
>  {
> -	int err;
> +	struct dma_fence *fence =3D NULL;
>=20
>  	lockdep_assert_held_write(&vm->lock);
>=20
> @@ -2547,11 +2533,11 @@ static int op_execute(struct xe_vm *vm, struct
> xe_vma *vma,
>=20
>  	switch (op->base.op) {
>  	case DRM_GPUVA_OP_MAP:
> -		err =3D xe_vm_bind(vm, vma, op->q, xe_vma_bo(vma),
> -				 op->syncs, op->num_syncs,
> -				 op->map.immediate
> || !xe_vm_in_fault_mode(vm),
> -				 op->flags & XE_VMA_OP_FIRST,
> -				 op->flags & XE_VMA_OP_LAST);
> +		fence =3D xe_vm_bind(vm, vma, op->q, xe_vma_bo(vma),
> +				   op->syncs, op->num_syncs,
> +				   op->map.immediate
> || !xe_vm_in_fault_mode(vm),
> +				   op->flags & XE_VMA_OP_FIRST,
> +				   op->flags & XE_VMA_OP_LAST);
>  		break;
>  	case DRM_GPUVA_OP_REMAP:
>  	{
> @@ -2561,37 +2547,39 @@ static int op_execute(struct xe_vm *vm, struct
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
>  			op->remap.prev->gpuva.flags |=3D
> XE_VMA_LAST_REBIND;
> -			err =3D xe_vm_bind(vm, op->remap.prev, op->q,
> -					 xe_vma_bo(op->remap.prev), op-
> >syncs,
> -					 op->num_syncs, true, false,
> -					 op->flags & XE_VMA_OP_LAST
> && !next);
> +			dma_fence_put(fence);
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
>  			op->remap.next->gpuva.flags |=3D
> XE_VMA_LAST_REBIND;
> -			err =3D xe_vm_bind(vm, op->remap.next, op->q,
> -					 xe_vma_bo(op->remap.next),
> -					 op->syncs, op->num_syncs,
> -					 true, false,
> -					 op->flags & XE_VMA_OP_LAST);
> +			dma_fence_put(fence);
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
> @@ -2599,34 +2587,36 @@ static int op_execute(struct xe_vm *vm, struct
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
> +		fence =3D xe_vm_prefetch(vm, vma, op->q, op-
> >prefetch.region,
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
> @@ -2643,22 +2633,24 @@ static int __xe_vma_op_execute(struct xe_vm
> *vm, struct xe_vma *vma,
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
> @@ -2671,23 +2663,23 @@ static int xe_vma_op_execute(struct xe_vm *vm,
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
> -					  gpuva_to_vma(op-
> >base.prefetch.va),
> -					  op);
> +		fence =3D __xe_vma_op_execute(vm,
> +					    gpuva_to_vma(op-
> >base.prefetch.va),
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
> @@ -2861,11 +2853,35 @@ static int
> vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
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
> +		}
> +		if (IS_ERR(fence)) {
> +			drm_warn(&vm->xe->drm, "VM op(%d) failed
> with %ld",
> +				 op->base.op, PTR_ERR(fence));
> +			fence =3D ERR_PTR(-ENOSPC);

There is a comment before not addressed. Copy as below:


> > Once error happen for one operation, you seem to print the same error
> message for all the rest operations....because fence =3D xe_vma_op_execut=
e(vm,
> op) is not called anymore after the first error
> >
>=20
> Yes.

Is this problematic though? Lets say you have 2 ops in the list and op_exec=
ute failed with op1. You will print as below:

VM op1 failed with xxx
VM op1 failed with xxx



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
> @@ -2878,19 +2894,14 @@ static int vm_bind_ioctl_ops_execute(struct
> xe_vm *vm,
>  		if (err)
>  			goto unlock;
>=20
> -		list_for_each_entry_safe(op, next, ops_list, link) {
> -			err =3D xe_vma_op_execute(vm, op);
> -			if (err) {
> -				drm_warn(&vm->xe->drm, "VM op(%d)
> failed with %d",
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
> +			/* FIXME: Killing VM rather than proper error
> handling */
> +			xe_vm_kill(vm, false);
> +			goto unlock;
> +		} else {
> +			dma_fence_put(fence);

I don't get here. You introduced function ops_execute to return the last fe=
nce of all the operations. But you just put the fence here. Isn't you inten=
d to wait for this fence somehow? What is the point to return a fence from =
ops_execute?

Oak


>  		}
>  	}
>=20
> --
> 2.34.1

