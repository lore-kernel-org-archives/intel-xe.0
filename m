Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84923CD11DD
	for <intel-xe@archiver.kernel.org>; Wed, 27 Mar 2024 02:40:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D01010F70D;
	Wed, 27 Mar 2024 02:40:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n/3r4l0f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D25BF10F70D
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Mar 2024 02:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711507223; x=1743043223;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GyF4mmw8lyg1V6PgIFMYnvkDzhzTqexcOVsGaK/3KCw=;
 b=n/3r4l0fKQYrjLgr74mSM5g6maAGH/3d6PtYfaOUVoL6KBVMdVauoovZ
 eFf51ndbFdMk/ZNHe+6qYNRlkLqyLAcCNSE3PlYjwjvdbW5pgpXQ2TEOP
 lFN524JFvLGVSDnb2qb4WqgWLU4v+bGgvk9s3XZk7sHis5w3i22GsBMtQ
 QoeonYQh5/qq2SJgwV2QvcqS1o/8f+eA37qJW7K/O48Y6RhdGxL96mSZS
 YNFqP0dQu/Qa1ELUrSpEueut/QnOR/iEzhvTBQ4LAcYN+x56RcRP5lR3+
 6me44+Y4XOBZxjVvSUlWqXPFYndNfPS/oxV/Bx3nCBrb5k77+PT2cP2p9 Q==;
X-CSE-ConnectionGUID: Bmq/+VrZRrq4Xu4RKohh4Q==
X-CSE-MsgGUID: m5EU9QmoSVuCepYxOjubcA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6798749"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="6798749"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 19:40:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; d="scan'208";a="20702295"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2024 19:40:17 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 19:40:14 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 19:40:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Mar 2024 19:40:14 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Mar 2024 19:40:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jWhyAVtiD9xn1oDUaC874nIM8+Dr7PoDawfVyuI7lGIayXp0m/e76lh+LbAAiLpBoG7YWm5K0CW+VqiKnCe/2srIHp/xSwZI537FEmKrm+Jeo0nvKAdLPZThHme3WDwrKGUqkki7aQTjlytZS/f7ve6wawMHMoY/U2ZCOOjtSbmHMWlCVYKGF7RgPPhZty8xw2qpth+DAVFjWIaKbire96bYXiqT9vVnzySqHpQk7Lujb3BUuBHZNyuc08wyuhr9MtQecjMylbdw94iQIquRmtflSE+Of5VLPZhSDhvBEeiJ9V8eSGNJmsysyTSCZ8RUi50+DBpiYJM6+Tvnn0KZTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5KXUBVA0oidcru2vZSmZeDqjiXiR2w+cQ3OU4jcdVAg=;
 b=Z94ti5n+ukbjbRNXvckhcl0oWXiHGG+OioSwgWPEC2Nm4RcYTnOc2sOfb3n7VjGyy0lK51PhExsRMVcctekwuY8TSjPgOWBKttpT1PPfreU1qVifjPRgggkUvsZT+YKqsSKD5rbMlsgXBvxwAUDQ+aofCtu6bCeQ6mC3/mBv509OcfvBFddt4wG49GSSl7gUBEdjM62xSXt+RDyGY4hqgYA9WVenOBY3uATD94apY2fXDmuNf3awONLPTbMgXJi4muvn2sNLhQ/okgZz60uSh/2bhKrwZhE+vrnAzfDMxHFSEH2VdPzVspSXW0Yg2HKjVuKxqvow+AKOLymsHXBXcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by PH0PR11MB5830.namprd11.prod.outlook.com (2603:10b6:510:129::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Wed, 27 Mar
 2024 02:40:06 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Wed, 27 Mar 2024
 02:40:05 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH v4 18/30] drm/xe: Convert multiple bind ops into single job
Thread-Topic: [PATCH v4 18/30] drm/xe: Convert multiple bind ops into single
 job
Thread-Index: AQHacRaqAt5NgnkrjE69gwSutMoO67FJX+AA
Date: Wed, 27 Mar 2024 02:40:05 +0000
Message-ID: <SA1PR11MB6991BFD96547D3D199CC604692342@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
 <20240308050806.577176-19-matthew.brost@intel.com>
In-Reply-To: <20240308050806.577176-19-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|PH0PR11MB5830:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WLtneCVnxATusH8Hw5K3UQi1AstZ/XfUshZiIuGbNjgoxBVYZ6XBg6zBsd493HOKGI1FEXewi83J9J+jV78dsyaJ0GCPwmpWrOklZM+fRcvLCCxUkZiq+JT+BZ3ezBI8awpZn57/EBoFU4AWL90C2LAbyrQAr9iHsnk2c/Dv35xUN3SC87J2aoR/3Jvm0WHuX5hGEpGYxsC/pWSO7zCN8W0JsRWBjFoVFsJPdaXU3YQcnHb48FXhQj3Vti1OWE+gl9B+ppAfK1S247a0ha+lJucAg+yHwbp/w0O0BkQZS+6fDGjbs1jgdRRzmNMfQW4tZVo1UOanSjaD4gW09TQMVzeiMrFPZfXF86xjBA40RL/ie9rsnqPOQ0lpZLD9cVmMg4p61fxikhduC9/ENnQeeigZ4ywYDWqIuG54fHzm7WPUEg45Ujku6b4DAWKDI+WbCBlsJZdRmVyQnOPqeJGFDBr7U0T+YYh7nU+HuR0EWm1lO/C6eGSypkS/NcgG6ZZb0IDJzN3GpniZFvPBHY8aqVij9zCaxc+uQK2ltZMsdbn2JBvgrrkOzUAa0I+KdD54ygrGQwuJ11UcOF/kvTgHwwGC2ulDjfo1m8/sH5TYSd5Za79Yeq/RVuikg7+ykm9eTm+vha2XdMa0X67Kinni2ELFP+O0m9H7AvNwyyBOwm0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9B/MCO6PToWygPBA6bAF46pQvrILL5VwqHdLM5qTD77vBGI71iCy27t2OdcU?=
 =?us-ascii?Q?LtTS2Znr4drS9Bao2eumbMBGxuNCGdIpjJLeVrpjmwZqqlkrG82f6uketjKQ?=
 =?us-ascii?Q?nxZ/s9hMa7Bx/gNd/7soKdPcNeC2ceEOmu7iDNTCvj5IgLX33yIrcNkp6+eY?=
 =?us-ascii?Q?HlScXMZwfolLPEG3WH+f1Buc86jpQlyfrMMYQ2D70ZSuXWc6P9m6Z5foASXv?=
 =?us-ascii?Q?IszzZINwVdV97wGBLrSFSvAKJ86U+zRgtgZdj/bS8PdA1aSho80ASXj3cef8?=
 =?us-ascii?Q?gmsxRV0D7pZR6gYO/7Jen4MXgS80cLLnRgNRzWoIX5OthhfKf25LpDLHliC/?=
 =?us-ascii?Q?S8qosTV1Sce+s02uvEeb+Q5esMwAdsbkImAnapkiLKtRzVFWLvSxUrC3yNc2?=
 =?us-ascii?Q?Q/hLMwr6qrDdKxK3hCSBIZzDmM8uCNG7bDLnoNSYT7HBRA43VzY8RKZhoPBg?=
 =?us-ascii?Q?SOjJJM1cMMK7Pd1TYWIdyQUtj4FJ2lDTrzuGEUcAw2gIiOksRODUGyPf4S5X?=
 =?us-ascii?Q?dTCq6dGvUdtg/3JtTsIc5I0W4ktBpco+spGhX+21mqILpEiSYNvLhYnGwCdF?=
 =?us-ascii?Q?a54TVGGJ4Pe0nnsGp0sQTUiPhPVzgkTC/Tqjz5ANUpWR3TgTWrnY90ONk5/E?=
 =?us-ascii?Q?NQzAEL5CudXyyR2+NP2m/nOWuC10n6FNAOo/AwBC0DZZ7n8p47SfX4uTiMDe?=
 =?us-ascii?Q?oYi/0iBJBTBAa7n9xPFO+1CZLSRB/D8cFE/tdSzJFWsuBEVLFAD4bbGwHpD4?=
 =?us-ascii?Q?MNE3JfmKGT2Ga5fDWuDk0JsQkV4H4fIW7/Io1Ig9gxI2kx6tWLLvri2o+QAA?=
 =?us-ascii?Q?aXMGJ4hoBGV402i5EJhCTus4VxJC0Wex45B5x3W0e3oJXN74twKpPSI5JZmO?=
 =?us-ascii?Q?gXkuj15lkAg/4Rh6T6aG2kdv69Xt1bBr30q1BCIPmy7u9lzpQJLVXBJ6oQuW?=
 =?us-ascii?Q?1wGAi5PKecxi27LHIDBLAdWGWyJCjjZzjToi6Xf4bJB9bm6aUTg9WDsJvDnV?=
 =?us-ascii?Q?HNSfxbQiMVhRfe0kljMLz9+RbhXAXORBtfb952NF770b2NaTKN1AwK3vm1AA?=
 =?us-ascii?Q?BngIVb8SvcwWp+C6kwEixQYz4aYcGORsNIbgJk2MqTKVY6KUe2GmGOtguEIi?=
 =?us-ascii?Q?S49ziQaH81afQCvR16v0a1MysMFcH0+1X6M0iRsmM5nTCtKE7pYgNOP0WJu1?=
 =?us-ascii?Q?ol+aDlMFwXVRoZpOUdJI4NpRIJUQxIJRwedRAxEmRj6DtNgzNXf/ZMqJF8hH?=
 =?us-ascii?Q?oLmTg3NxQvBJUrUYEe8Oimmy3Wk7SB9xMS0jMOeGdj1NL5HiNjkGxGdEYkcB?=
 =?us-ascii?Q?Ru7iWgWDc8LU+2DLapTfw3/FYb0PvU2HEef6XE/Q1LpKQGmzZVqLsCGH9p18?=
 =?us-ascii?Q?Vjt6Lz2wKtfFvSp/C6Lm7ckvL4i5AvO5sGw7Y1tL6AqPac0Xi58qAdA0g6bd?=
 =?us-ascii?Q?bm9Qsd5sJSQfqsoLqqpPrlKDIxPrNUo0MgL1TKTPzZUxz4x28ICFB9bI84yw?=
 =?us-ascii?Q?hsfiY4JtAlXBr07eDwHSNL2NXPK6Pwle0dOxQYCDvZSMOQYKYCIRTbyfq/yX?=
 =?us-ascii?Q?DNxZLYdrsjPP0F69lv8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73c3cc23-f0df-4948-1bfe-08dc4e0735c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2024 02:40:05.3053 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dD4iqcSFJMSBgM58f67eRZ9zlykZVMrT7uemrA7y3yEJiPSr3pMfZMKTK9Wb7QA5Wt8br8Ah6wMKItMfVPpMRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5830
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

Hi Matt,

This patch is very big to review. I wasn't able to look the whole patch. Se=
e some comments inline for now. I need to continue it.

Is it possible to divide into small patches?

> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matt=
hew
> Brost
> Sent: Friday, March 8, 2024 12:08 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Brost, Matthew <matthew.brost@intel.com>
> Subject: [PATCH v4 18/30] drm/xe: Convert multiple bind ops into single j=
ob
>=20
> This aligns with the uAPI of an array of binds or single bind that
> results in multiple GPUVA ops to be considered a single atomic
> operations.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo_types.h     |    2 +
>  drivers/gpu/drm/xe/xe_exec.c         |   25 +-
>  drivers/gpu/drm/xe/xe_gt_pagefault.c |    6 +-
>  drivers/gpu/drm/xe/xe_migrate.c      |  298 ++++----
>  drivers/gpu/drm/xe/xe_migrate.h      |   32 +-
>  drivers/gpu/drm/xe/xe_pt.c           | 1018 ++++++++++++++++----------
>  drivers/gpu/drm/xe/xe_pt.h           |    7 +
>  drivers/gpu/drm/xe/xe_pt_types.h     |   34 +
>  drivers/gpu/drm/xe/xe_vm.c           |  533 ++++----------
>  drivers/gpu/drm/xe/xe_vm.h           |    5 +-
>  drivers/gpu/drm/xe/xe_vm_types.h     |   29 +-
>  11 files changed, 969 insertions(+), 1020 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h
> b/drivers/gpu/drm/xe/xe_bo_types.h
> index 14ef13b7b421..1ff5b5a68adc 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -77,6 +77,8 @@ struct xe_bo {
>  	} props;
>  	/** @freed: List node for delayed put. */
>  	struct llist_node freed;
> +	/** @update_index: Update index if PT BO */
> +	int update_index;
>  	/** @created: Whether the bo has passed initial creation */
>  	bool created;
>=20
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 952496c6260d..4feff67620c4 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -294,30 +294,9 @@ int xe_exec_ioctl(struct drm_device *dev, void *data=
,
> struct drm_file *file)
>  		err =3D PTR_ERR(rebind_fence);
>  		goto err_put_job;
>  	}
> +	dma_fence_put(rebind_fence);
>=20
> -	/*
> -	 * We store the rebind_fence in the VM so subsequent execs don't get
> -	 * scheduled before the rebinds of userptrs / evicted BOs is complete.
> -	 */
> -	if (rebind_fence) {
> -		dma_fence_put(vm->rebind_fence);
> -		vm->rebind_fence =3D rebind_fence;
> -	}
> -	if (vm->rebind_fence) {
> -		if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> -			     &vm->rebind_fence->flags)) {
> -			dma_fence_put(vm->rebind_fence);
> -			vm->rebind_fence =3D NULL;
> -		} else {
> -			dma_fence_get(vm->rebind_fence);
> -			err =3D drm_sched_job_add_dependency(&job->drm,
> -							   vm->rebind_fence);
> -			if (err)
> -				goto err_put_job;
> -		}
> -	}
> -
> -	/* Wait behind munmap style rebinds */
> +	/* Wait for rebinds */
>  	if (!xe_vm_in_lr_mode(vm)) {
>  		err =3D drm_sched_job_add_resv_dependencies(&job->drm,
>  							  xe_vm_resv(vm),


Can you explain why you can wait for rebind using above codes? I understand=
 here we make all the fences in vm reservation object a dependency of the j=
ob. But did we add rebind_fence to vm's reservation object? I can't find su=
ch code in this patch


> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 878e234166aa..bd8688b2f462 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -208,9 +208,9 @@ static int handle_pagefault(struct xe_gt *gt, struct
> pagefault *pf)
>=20
>  	/* Bind VMA only to the GT that has faulted */
>  	trace_xe_vma_pf_bind(vma);
> -	xe_vm_populate_dummy_rebind(vm, vma);
> -	vm->dummy_ops.op.tile_mask =3D BIT(tile->id);
> -	vm->dummy_ops.op.q =3D xe_tile_migrate_exec_queue(tile);
> +	xe_vm_populate_dummy_rebind(vm, vma, BIT(tile->id));
> +	vm->dummy_ops.vops.pt_update_ops[tile->id].q =3D
> +		xe_tile_migrate_exec_queue(tile);

I guess I will ignore all those dummy_rebind/dummy_ops code for now.


>  	fence =3D xe_vm_ops_execute(vm, &vm->dummy_ops.vops);
>  	if (IS_ERR(fence)) {
>  		ret =3D PTR_ERR(fence);
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> b/drivers/gpu/drm/xe/xe_migrate.c
> index 3fd76f912fda..cc0499f3702c 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1106,6 +1106,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrat=
e
> *m,
>  }
>=20
>  static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 pp=
gtt_ofs,
> +			  const struct xe_vm_pgtable_update_op *pt_op,
>  			  const struct xe_vm_pgtable_update *update,
>  			  struct xe_migrate_pt_update *pt_update)
>  {
> @@ -1140,8 +1141,12 @@ static void write_pgtable(struct xe_tile *tile, st=
ruct
> xe_bb *bb, u64 ppgtt_ofs,
>  		bb->cs[bb->len++] =3D MI_STORE_DATA_IMM |
> MI_SDI_NUM_QW(chunk);
>  		bb->cs[bb->len++] =3D lower_32_bits(addr);
>  		bb->cs[bb->len++] =3D upper_32_bits(addr);
> -		ops->populate(pt_update, tile, NULL, bb->cs + bb->len, ofs,
> chunk,
> -			      update);
> +		if (pt_op->bind)
> +			ops->populate(pt_update, tile, NULL, bb->cs + bb->len,
> +				      ofs, chunk, update);
> +		else
> +			ops->clear(pt_update, tile, NULL, bb->cs + bb->len,
> +				   ofs, chunk, update);
>=20
>  		bb->len +=3D chunk * 2;
>  		ofs +=3D chunk;
> @@ -1166,114 +1171,58 @@ struct migrate_test_params {
>=20
>  static struct dma_fence *
>  xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
> -			       struct xe_vm *vm, struct xe_bo *bo,
> -			       const struct  xe_vm_pgtable_update *updates,
> -			       u32 num_updates, bool wait_vm,
>  			       struct xe_migrate_pt_update *pt_update)
>  {
>  	XE_TEST_DECLARE(struct migrate_test_params *test =3D
>  			to_migrate_test_params
>  			(xe_cur_kunit_priv(XE_TEST_LIVE_MIGRATE));)
>  	const struct xe_migrate_pt_update_ops *ops =3D pt_update->ops;
> -	struct dma_fence *fence;
> +	struct xe_vm *vm =3D pt_update->vops->vm;
> +	struct xe_vm_pgtable_update_ops *pt_update_ops =3D
> +		&pt_update->vops->pt_update_ops[pt_update->tile_id];
>  	int err;
> -	u32 i;
> +	u32 j, i;
>=20
>  	if (XE_TEST_ONLY(test && test->force_gpu))
>  		return ERR_PTR(-ETIME);
>=20
> -	if (bo && !dma_resv_test_signaled(bo->ttm.base.resv,
> -					  DMA_RESV_USAGE_KERNEL))
> -		return ERR_PTR(-ETIME);
> -
> -	if (wait_vm && !dma_resv_test_signaled(xe_vm_resv(vm),
> -					       DMA_RESV_USAGE_BOOKKEEP))
> -		return ERR_PTR(-ETIME);
> -
>  	if (ops->pre_commit) {
>  		pt_update->job =3D NULL;
>  		err =3D ops->pre_commit(pt_update);
>  		if (err)
>  			return ERR_PTR(err);
>  	}
> -	for (i =3D 0; i < num_updates; i++) {
> -		const struct xe_vm_pgtable_update *update =3D &updates[i];
> -
> -		ops->populate(pt_update, m->tile, &update->pt_bo->vmap,
> NULL,
> -			      update->ofs, update->qwords, update);
> -	}
> -
> -	if (vm) {
> -		trace_xe_vm_cpu_bind(vm);
> -		xe_device_wmb(vm->xe);
> -	}
> -
> -	fence =3D dma_fence_get_stub();
> -
> -	return fence;
> -}
> -
> -static bool no_in_syncs(struct xe_vm *vm, struct xe_exec_queue *q,
> -			struct xe_sync_entry *syncs, u32 num_syncs)
> -{
> -	struct dma_fence *fence;
> -	int i;
>=20
> -	for (i =3D 0; i < num_syncs; i++) {
> -		fence =3D syncs[i].fence;
> -
> -		if (fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> -				       &fence->flags))
> -			return false;
> -	}
> -	if (q) {
> -		fence =3D xe_exec_queue_last_fence_get(q, vm);
> -		if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
> -			dma_fence_put(fence);
> -			return false;
> +	for (j =3D 0; j < pt_update_ops->num_ops; ++j) {
> +		const struct xe_vm_pgtable_update_op *pt_op =3D
> +			&pt_update_ops->ops[j];
> +
> +		for (i =3D 0; i < pt_op->num_entries; i++) {
> +			const struct xe_vm_pgtable_update *update =3D
> +				&pt_op->entries[i];
> +
> +			if (pt_op->bind)
> +				ops->populate(pt_update, m->tile,
> +					      &update->pt_bo->vmap, NULL,
> +					      update->ofs, update->qwords,
> +					      update);
> +			else
> +				ops->clear(pt_update, m->tile,
> +					   &update->pt_bo->vmap, NULL,
> +					   update->ofs, update->qwords, update);
>  		}
> -		dma_fence_put(fence);
>  	}
>=20
> -	return true;
> +	trace_xe_vm_cpu_bind(vm);
> +	xe_device_wmb(vm->xe);
> +
> +	return dma_fence_get_stub();
>  }
>=20
> -/**
> - * xe_migrate_update_pgtables() - Pipelined page-table update
> - * @m: The migrate context.
> - * @vm: The vm we'll be updating.
> - * @bo: The bo whose dma-resv we will await before updating, or NULL if
> userptr.
> - * @q: The exec queue to be used for the update or NULL if the default
> - * migration engine is to be used.
> - * @updates: An array of update descriptors.
> - * @num_updates: Number of descriptors in @updates.
> - * @syncs: Array of xe_sync_entry to await before updating. Note that wa=
its
> - * will block the engine timeline.
> - * @num_syncs: Number of entries in @syncs.
> - * @pt_update: Pointer to a struct xe_migrate_pt_update, which contains
> - * pointers to callback functions and, if subclassed, private arguments =
to
> - * those.
> - *
> - * Perform a pipelined page-table update. The update descriptors are typ=
ically
> - * built under the same lock critical section as a call to this function=
. If
> - * using the default engine for the updates, they will be performed in t=
he
> - * order they grab the job_mutex. If different engines are used, externa=
l
> - * synchronization is needed for overlapping updates to maintain page-ta=
ble
> - * consistency. Note that the meaing of "overlapping" is that the update=
s
> - * touch the same page-table, which might be a higher-level page-directo=
ry.
> - * If no pipelining is needed, then updates may be performed by the cpu.
> - *
> - * Return: A dma_fence that, when signaled, indicates the update complet=
ion.
> - */
> -struct dma_fence *
> -xe_migrate_update_pgtables(struct xe_migrate *m,
> -			   struct xe_vm *vm,
> -			   struct xe_bo *bo,
> -			   struct xe_exec_queue *q,
> -			   const struct xe_vm_pgtable_update *updates,
> -			   u32 num_updates,
> -			   struct xe_sync_entry *syncs, u32 num_syncs,
> -			   struct xe_migrate_pt_update *pt_update)
> +static struct dma_fence *
> +__xe_migrate_update_pgtables(struct xe_migrate *m,
> +			     struct xe_migrate_pt_update *pt_update,
> +			     struct xe_vm_pgtable_update_ops *pt_update_ops)

Maybe rename this function to _gpu?

>  {
>  	const struct xe_migrate_pt_update_ops *ops =3D pt_update->ops;
>  	struct xe_tile *tile =3D m->tile;
> @@ -1282,59 +1231,45 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>  	struct xe_sched_job *job;
>  	struct dma_fence *fence;
>  	struct drm_suballoc *sa_bo =3D NULL;
> -	struct xe_vma *vma =3D pt_update->vma;
>  	struct xe_bb *bb;
> -	u32 i, batch_size, ppgtt_ofs, update_idx, page_ofs =3D 0;
> +	u32 i, j, batch_size =3D 0, ppgtt_ofs, update_idx, page_ofs =3D 0;
> +	u32 num_updates =3D 0, current_update =3D 0;
>  	u64 addr;
>  	int err =3D 0;
> -	bool usm =3D !q && xe->info.has_usm;
> -	bool first_munmap_rebind =3D vma &&
> -		vma->gpuva.flags & XE_VMA_FIRST_REBIND;
> -	struct xe_exec_queue *q_override =3D !q ? m->q : q;
> -	u16 pat_index =3D xe->pat.idx[XE_CACHE_WB];
> +	bool is_migrate =3D pt_update_ops->q =3D=3D m->q;
> +	bool usm =3D is_migrate && xe->info.has_usm;
>=20
> -	/* Use the CPU if no in syncs and engine is idle */
> -	if (no_in_syncs(vm, q, syncs, num_syncs) &&
> xe_exec_queue_is_idle(q_override)) {
> -		fence =3D  xe_migrate_update_pgtables_cpu(m, vm, bo, updates,
> -							num_updates,
> -							first_munmap_rebind,
> -							pt_update);
> -		if (!IS_ERR(fence) || fence =3D=3D ERR_PTR(-EAGAIN))
> -			return fence;
> +	for (i =3D 0; i < pt_update_ops->num_ops; ++i) {
> +		struct xe_vm_pgtable_update_op *pt_op =3D &pt_update_ops-
> >ops[i];
> +		struct xe_vm_pgtable_update *updates =3D pt_op->entries;
> +
> +		num_updates +=3D pt_op->num_entries;
> +		for (j =3D 0; j < pt_op->num_entries; ++j) {
> +			u32 num_cmds =3D DIV_ROUND_UP(updates[j].qwords,
> 0x1ff);
> +
> +			/* align noop + MI_STORE_DATA_IMM cmd prefix */
> +			batch_size +=3D 4 * num_cmds + updates[j].qwords * 2;
> +		}
>  	}
>=20
>  	/* fixed + PTE entries */
>  	if (IS_DGFX(xe))
> -		batch_size =3D 2;
> +		batch_size +=3D 2;
>  	else
> -		batch_size =3D 6 + num_updates * 2;
> +		batch_size +=3D 6 + num_updates * 2;
>=20
> -	for (i =3D 0; i < num_updates; i++) {
> -		u32 num_cmds =3D DIV_ROUND_UP(updates[i].qwords,
> MAX_PTE_PER_SDI);
> -
> -		/* align noop + MI_STORE_DATA_IMM cmd prefix */
> -		batch_size +=3D 4 * num_cmds + updates[i].qwords * 2;
> -	}
> -
> -	/*
> -	 * XXX: Create temp bo to copy from, if batch_size becomes too big?
> -	 *
> -	 * Worst case: Sum(2 * (each lower level page size) + (top level page s=
ize))
> -	 * Should be reasonably bound..
> -	 */
> -	xe_tile_assert(tile, batch_size < SZ_128K);
> -
> -	bb =3D xe_bb_new(gt, batch_size, !q && xe->info.has_usm);
> +	bb =3D xe_bb_new(gt, batch_size, usm);
>  	if (IS_ERR(bb))
>  		return ERR_CAST(bb);
>=20
>  	/* For sysmem PTE's, need to map them in our hole.. */
>  	if (!IS_DGFX(xe)) {
>  		ppgtt_ofs =3D NUM_KERNEL_PDE - 1;
> -		if (q) {
> -			xe_tile_assert(tile, num_updates <=3D
> NUM_VMUSA_WRITES_PER_UNIT);
> +		if (!is_migrate) {
> +			u32 num_units =3D DIV_ROUND_UP(num_updates,
> +
> NUM_VMUSA_WRITES_PER_UNIT);
>=20
> -			sa_bo =3D drm_suballoc_new(&m->vm_update_sa, 1,
> +			sa_bo =3D drm_suballoc_new(&m->vm_update_sa,
> num_units,
>  						 GFP_KERNEL, true, 0);
>  			if (IS_ERR(sa_bo)) {
>  				err =3D PTR_ERR(sa_bo);
> @@ -1354,14 +1289,26 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>  		bb->cs[bb->len++] =3D ppgtt_ofs * XE_PAGE_SIZE + page_ofs;
>  		bb->cs[bb->len++] =3D 0; /* upper_32_bits */
>=20
> -		for (i =3D 0; i < num_updates; i++) {
> -			struct xe_bo *pt_bo =3D updates[i].pt_bo;
> +		for (i =3D 0; i < pt_update_ops->num_ops; ++i) {
> +			struct xe_vm_pgtable_update_op *pt_op =3D
> +				&pt_update_ops->ops[i];
> +			struct xe_vm_pgtable_update *updates =3D pt_op-
> >entries;
>=20
> -			xe_tile_assert(tile, pt_bo->size =3D=3D SZ_4K);
> +			for (j =3D 0; j < pt_op->num_entries; ++j, ++current_update)
> {
> +				struct xe_vm *vm =3D pt_update->vops->vm;
> +				struct xe_bo *pt_bo =3D updates[j].pt_bo;
>=20
> -			addr =3D vm->pt_ops->pte_encode_bo(pt_bo, 0,
> pat_index, 0);
> -			bb->cs[bb->len++] =3D lower_32_bits(addr);
> -			bb->cs[bb->len++] =3D upper_32_bits(addr);
> +				xe_tile_assert(tile, pt_bo->size =3D=3D SZ_4K);
> +
> +				/* Map a PT at most once */
> +				if (pt_bo->update_index < 0)
> +					pt_bo->update_index =3D current_update;
> +
> +				addr =3D vm->pt_ops->pte_encode_bo(pt_bo, 0,
> +								 XE_CACHE_WB,
> 0);
> +				bb->cs[bb->len++] =3D lower_32_bits(addr);
> +				bb->cs[bb->len++] =3D upper_32_bits(addr);
> +			}
>  		}
>=20
>  		bb->cs[bb->len++] =3D MI_BATCH_BUFFER_END;
> @@ -1369,22 +1316,39 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>=20
>  		addr =3D xe_migrate_vm_addr(ppgtt_ofs, 0) +
>  			(page_ofs / sizeof(u64)) * XE_PAGE_SIZE;
> -		for (i =3D 0; i < num_updates; i++)
> -			write_pgtable(tile, bb, addr + i * XE_PAGE_SIZE,
> -				      &updates[i], pt_update);
> +		for (i =3D 0; i < pt_update_ops->num_ops; ++i) {
> +			struct xe_vm_pgtable_update_op *pt_op =3D
> +				&pt_update_ops->ops[i];
> +			struct xe_vm_pgtable_update *updates =3D pt_op-
> >entries;
> +
> +			for (j =3D 0; j < pt_op->num_entries; ++j) {
> +				struct xe_bo *pt_bo =3D updates[j].pt_bo;
> +
> +				write_pgtable(tile, bb, addr +
> +					      pt_bo->update_index *
> XE_PAGE_SIZE,
> +					      pt_op, &updates[j], pt_update);
> +			}
> +		}
>  	} else {
>  		/* phys pages, no preamble required */
>  		bb->cs[bb->len++] =3D MI_BATCH_BUFFER_END;
>  		update_idx =3D bb->len;
>=20
> -		for (i =3D 0; i < num_updates; i++)
> -			write_pgtable(tile, bb, 0, &updates[i], pt_update);
> +		for (i =3D 0; i < pt_update_ops->num_ops; ++i) {
> +			struct xe_vm_pgtable_update_op *pt_op =3D
> +				&pt_update_ops->ops[i];
> +			struct xe_vm_pgtable_update *updates =3D pt_op-
> >entries;
> +
> +			for (j =3D 0; j < pt_op->num_entries; ++j)
> +				write_pgtable(tile, bb, 0, pt_op, &updates[j],
> +					      pt_update);
> +		}
>  	}
>=20
> -	if (!q)
> +	if (is_migrate)
>  		mutex_lock(&m->job_mutex);
>=20
> -	job =3D xe_bb_create_migration_job(q ?: m->q, bb,
> +	job =3D xe_bb_create_migration_job(pt_update_ops->q, bb,
>  					 xe_migrate_batch_base(m, usm),
>  					 update_idx);
>  	if (IS_ERR(job)) {
> @@ -1392,32 +1356,6 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>  		goto err_bb;
>  	}
>=20
> -	/* Wait on BO move */
> -	if (bo) {
> -		err =3D job_add_deps(job, bo->ttm.base.resv,
> -				   DMA_RESV_USAGE_KERNEL);
> -		if (err)
> -			goto err_job;
> -	}
> -
> -	/*
> -	 * Munmap style VM unbind, need to wait for all jobs to be complete /
> -	 * trigger preempts before moving forward
> -	 */
> -	if (first_munmap_rebind) {
> -		err =3D job_add_deps(job, xe_vm_resv(vm),
> -				   DMA_RESV_USAGE_BOOKKEEP);
> -		if (err)
> -			goto err_job;
> -	}
> -
> -	err =3D xe_sched_job_last_fence_add_dep(job, vm);
> -	for (i =3D 0; !err && i < num_syncs; i++)
> -		err =3D xe_sync_entry_add_deps(&syncs[i], job);
> -
> -	if (err)
> -		goto err_job;
> -
>  	if (ops->pre_commit) {
>  		pt_update->job =3D job;
>  		err =3D ops->pre_commit(pt_update);
> @@ -1428,7 +1366,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>  	fence =3D dma_fence_get(&job->drm.s_fence->finished);
>  	xe_sched_job_push(job);
>=20
> -	if (!q)
> +	if (is_migrate)
>  		mutex_unlock(&m->job_mutex);
>=20
>  	xe_bb_free(bb, fence);
> @@ -1439,7 +1377,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>  err_job:
>  	xe_sched_job_put(job);
>  err_bb:
> -	if (!q)
> +	if (is_migrate)
>  		mutex_unlock(&m->job_mutex);
>  	xe_bb_free(bb, NULL);
>  err:
> @@ -1447,6 +1385,38 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>  	return ERR_PTR(err);
>  }
>=20
> +/**
> + * xe_migrate_update_pgtables() - Pipelined page-table update
> + * @m: The migrate context.
> + * @pt_update: PT update arguments
> + *
> + * Perform a pipelined page-table update. The update descriptors are typ=
ically
> + * built under the same lock critical section as a call to this function=
. If
> + * using the default engine for the updates, they will be performed in t=
he
> + * order they grab the job_mutex. If different engines are used, externa=
l
> + * synchronization is needed for overlapping updates to maintain page-ta=
ble
> + * consistency. Note that the meaing of "overlapping" is that the update=
s
> + * touch the same page-table, which might be a higher-level page-directo=
ry.
> + * If no pipelining is needed, then updates may be performed by the cpu.
> + *
> + * Return: A dma_fence that, when signaled, indicates the update complet=
ion.
> + */
> +struct dma_fence *
> +xe_migrate_update_pgtables(struct xe_migrate *m,
> +			   struct xe_migrate_pt_update *pt_update)
> +
> +{
> +	struct xe_vm_pgtable_update_ops *pt_update_ops =3D
> +		&pt_update->vops->pt_update_ops[pt_update->tile_id];
> +	struct dma_fence *fence;
> +
> +	fence =3D  xe_migrate_update_pgtables_cpu(m, pt_update);

So now by default you use cpu to update page table first. Only if there is =
error you fall back to gpu page table update. Should we also consider perfo=
rmance here? For example, consider page table is usually in vram, isn't cpu=
 writing to page table is usually slower than gpu writing?

> +	if (!IS_ERR(fence))
> +		return fence;
> +
> +	return __xe_migrate_update_pgtables(m, pt_update, pt_update_ops);
> +}
> +
>  /**
>   * xe_migrate_wait() - Complete all operations using the xe_migrate cont=
ext
>   * @m: Migrate context to wait for.
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h
> b/drivers/gpu/drm/xe/xe_migrate.h
> index 9935ce336bae..bd8eba1d3552 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -47,6 +47,24 @@ struct xe_migrate_pt_update_ops {
>  			 struct xe_tile *tile, struct iosys_map *map,
>  			 void *pos, u32 ofs, u32 num_qwords,
>  			 const struct xe_vm_pgtable_update *update);
> +	/**
> +	 * @clear: Clear a command buffer or page-table with ptes.
> +	 * @pt_update: Embeddable callback argument.
> +	 * @tile: The tile for the current operation.
> +	 * @map: struct iosys_map into the memory to be populated.
> +	 * @pos: If @map is NULL, map into the memory to be populated.
> +	 * @ofs: qword offset into @map, unused if @map is NULL.
> +	 * @num_qwords: Number of qwords to write.
> +	 * @update: Information about the PTEs to be inserted.
> +	 *
> +	 * This interface is intended to be used as a callback into the
> +	 * page-table system to populate command buffers or shared
> +	 * page-tables with PTEs.
> +	 */
> +	void (*clear)(struct xe_migrate_pt_update *pt_update,
> +		      struct xe_tile *tile, struct iosys_map *map,
> +		      void *pos, u32 ofs, u32 num_qwords,
> +		      const struct xe_vm_pgtable_update *update);
>=20
>  	/**
>  	 * @pre_commit: Callback to be called just before arming the
> @@ -67,14 +85,10 @@ struct xe_migrate_pt_update_ops {
>  struct xe_migrate_pt_update {
>  	/** @ops: Pointer to the struct xe_migrate_pt_update_ops callbacks */
>  	const struct xe_migrate_pt_update_ops *ops;
> -	/** @vma: The vma we're updating the pagetable for. */
> -	struct xe_vma *vma;
> +	/** @vops: VMA operations */
> +	struct xe_vma_ops *vops;
>  	/** @job: The job if a GPU page-table update. NULL otherwise */
>  	struct xe_sched_job *job;
> -	/** @start: Start of update for the range fence */
> -	u64 start;
> -	/** @last: Last of update for the range fence */
> -	u64 last;
>  	/** @tile_id: Tile ID of the update */
>  	u8 tile_id;
>  };
> @@ -96,12 +110,6 @@ struct xe_vm *xe_migrate_get_vm(struct xe_migrate
> *m);
>=20
>  struct dma_fence *
>  xe_migrate_update_pgtables(struct xe_migrate *m,
> -			   struct xe_vm *vm,
> -			   struct xe_bo *bo,
> -			   struct xe_exec_queue *q,
> -			   const struct xe_vm_pgtable_update *updates,
> -			   u32 num_updates,
> -			   struct xe_sync_entry *syncs, u32 num_syncs,
>  			   struct xe_migrate_pt_update *pt_update);
>=20
>  void xe_migrate_wait(struct xe_migrate *m);
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index a878e2217c7f..5a8523d0a049 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -8,12 +8,14 @@
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_drm_client.h"
> +#include "xe_exec_queue.h"
>  #include "xe_gt.h"
>  #include "xe_gt_tlb_invalidation.h"
>  #include "xe_migrate.h"
>  #include "xe_pt_types.h"
>  #include "xe_pt_walk.h"
>  #include "xe_res_cursor.h"
> +#include "xe_sync.h"
>  #include "xe_trace.h"
>  #include "xe_ttm_stolen_mgr.h"
>  #include "xe_vm.h"
> @@ -324,6 +326,7 @@ xe_pt_new_shared(struct xe_walk_update *wupd, struct
> xe_pt *parent,
>  	entry->pt =3D parent;
>  	entry->flags =3D 0;
>  	entry->qwords =3D 0;
> +	entry->pt_bo->update_index =3D -1;
>=20
>  	if (alloc_entries) {
>  		entry->pt_entries =3D kmalloc_array(XE_PDES,
> @@ -831,9 +834,7 @@ static void xe_pt_commit_locks_assert(struct xe_vma
> *vma)
>=20
>  	lockdep_assert_held(&vm->lock);
>=20
> -	if (xe_vma_is_userptr(vma))
> -		lockdep_assert_held_read(&vm->userptr.notifier_lock);
> -	else if (!xe_vma_is_null(vma))
> +	if (!xe_vma_is_userptr(vma) && !xe_vma_is_null(vma))
>  		dma_resv_assert_held(xe_vma_bo(vma)->ttm.base.resv);
>=20
>  	xe_vm_assert_held(vm);
> @@ -855,10 +856,8 @@ static void xe_pt_commit_bind(struct xe_vma *vma,
>  		if (!rebind)
>  			pt->num_live +=3D entries[i].qwords;
>=20
> -		if (!pt->level) {
> -			kfree(entries[i].pt_entries);
> +		if (!pt->level)
>  			continue;
> -		}
>=20
>  		pt_dir =3D as_xe_pt_dir(pt);
>  		for (j =3D 0; j < entries[i].qwords; j++) {
> @@ -871,10 +870,18 @@ static void xe_pt_commit_bind(struct xe_vma *vma,
>=20
>  			pt_dir->children[j_] =3D &newpte->base;
>  		}
> -		kfree(entries[i].pt_entries);
>  	}
>  }
>=20
> +static void xe_pt_free_bind(struct xe_vm_pgtable_update *entries,
> +			    u32 num_entries)
> +{
> +	u32 i;
> +
> +	for (i =3D 0; i < num_entries; i++)
> +		kfree(entries[i].pt_entries);
> +}
> +
>  static int
>  xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma,
>  		   struct xe_vm_pgtable_update *entries, u32 *num_entries)
> @@ -893,12 +900,13 @@ xe_pt_prepare_bind(struct xe_tile *tile, struct xe_=
vma
> *vma,
>=20
>  static void xe_vm_dbg_print_entries(struct xe_device *xe,
>  				    const struct xe_vm_pgtable_update *entries,
> -				    unsigned int num_entries)
> +				    unsigned int num_entries, bool bind)
>  #if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM))
>  {
>  	unsigned int i;
>=20
> -	vm_dbg(&xe->drm, "%u entries to update\n", num_entries);
> +	vm_dbg(&xe->drm, "%s: %u entries to update\n", bind ? "bind" :
> "unbind",
> +	       num_entries);
>  	for (i =3D 0; i < num_entries; i++) {
>  		const struct xe_vm_pgtable_update *entry =3D &entries[i];
>  		struct xe_pt *xe_pt =3D entry->pt;
> @@ -919,66 +927,122 @@ static void xe_vm_dbg_print_entries(struct xe_devi=
ce
> *xe,
>  {}
>  #endif
>=20
> -#ifdef CONFIG_DRM_XE_USERPTR_INVAL_INJECT
> +static int job_add_deps(struct xe_sched_job *job, struct dma_resv *resv,
> +			enum dma_resv_usage usage)
> +{
> +	return drm_sched_job_add_resv_dependencies(&job->drm, resv,
> usage);
> +}
>=20
> -static int xe_pt_userptr_inject_eagain(struct xe_userptr_vma *uvma)
> +static bool no_in_syncs(struct xe_sync_entry *syncs, u32 num_syncs)
>  {
> -	u32 divisor =3D uvma->userptr.divisor ? uvma->userptr.divisor : 2;
> -	static u32 count;
> +	int i;
>=20
> -	if (count++ % divisor =3D=3D divisor - 1) {
> -		struct xe_vm *vm =3D xe_vma_vm(&uvma->vma);
> +	for (i =3D 0; i < num_syncs; i++) {
> +		struct dma_fence *fence =3D syncs[i].fence;
>=20
> -		uvma->userptr.divisor =3D divisor << 1;
> -		spin_lock(&vm->userptr.invalidated_lock);
> -		list_move_tail(&uvma->userptr.invalidate_link,
> -			       &vm->userptr.invalidated);
> -		spin_unlock(&vm->userptr.invalidated_lock);
> -		return true;
> +		if (fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> +				       &fence->flags))
> +			return false;
>  	}
>=20
> -	return false;
> +	return true;
>  }
>=20
> -#else
> -
> -static bool xe_pt_userptr_inject_eagain(struct xe_userptr_vma *uvma)
> +static int vma_add_deps(struct xe_vma *vma, struct xe_sched_job *job)


From the implementation, it seems this is adding vma as a job's dependency.=
..but the function name says add dependency to vma...

>  {
> -	return false;
> +	struct xe_bo *bo =3D xe_vma_bo(vma);
> +
> +	xe_bo_assert_held(bo);
> +
> +	if (bo && !bo->vm) {
> +		if (!job) {
> +			if (!dma_resv_test_signaled(bo->ttm.base.resv,
> +						    DMA_RESV_USAGE_KERNEL))
> +				return -ETIME;
> +		} else {
> +			return job_add_deps(job, bo->ttm.base.resv,
> +					    DMA_RESV_USAGE_KERNEL);
> +		}
> +	}
> +
> +	return 0;
>  }
>=20
> -#endif
> +static int op_add_deps(struct xe_vm *vm, struct xe_vma_op *op,
> +		       struct xe_sched_job *job)
> +{
> +	int err =3D 0;
>=20
> -/**
> - * struct xe_pt_migrate_pt_update - Callback argument for pre-commit cal=
lbacks
> - * @base: Base we derive from.
> - * @bind: Whether this is a bind or an unbind operation. A bind operatio=
n
> - *        makes the pre-commit callback error with -EAGAIN if it detects=
 a
> - *        pending invalidation.
> - * @locked: Whether the pre-commit callback locked the userptr notifier =
lock
> - *          and it needs unlocking.
> - */
> -struct xe_pt_migrate_pt_update {
> -	struct xe_migrate_pt_update base;
> -	bool bind;
> -	bool locked;
> -};
> +	switch (op->base.op) {
> +	case DRM_GPUVA_OP_MAP:
> +		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
> +			break;
> +
> +		err =3D vma_add_deps(op->map.vma, job);
> +		break;
> +	case DRM_GPUVA_OP_REMAP:
> +		if (op->remap.prev)
> +			err =3D vma_add_deps(op->remap.prev, job);
> +		if (!err && op->remap.next)
> +			err =3D vma_add_deps(op->remap.next, job);
> +		break;
> +	case DRM_GPUVA_OP_UNMAP:
> +		break;
> +	case DRM_GPUVA_OP_PREFETCH:
> +		err =3D vma_add_deps(gpuva_to_vma(op->base.prefetch.va), job);
> +		break;
> +	default:
> +		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> +	}
> +
> +	return err;
> +}
>=20
> -/*
> - * This function adds the needed dependencies to a page-table update job
> - * to make sure racing jobs for separate bind engines don't race writing
> - * to the same page-table range, wreaking havoc. Initially use a single
> - * fence for the entire VM. An optimization would use smaller granularit=
y.
> - */
>  static int xe_pt_vm_dependencies(struct xe_sched_job *job,
> -				 struct xe_range_fence_tree *rftree,
> -				 u64 start, u64 last)
> +				 struct xe_vm *vm,
> +				 struct xe_vma_ops *vops,
> +				 struct xe_vm_pgtable_update_ops
> *pt_update_ops,
> +				 struct xe_range_fence_tree *rftree)
>  {
>  	struct xe_range_fence *rtfence;
>  	struct dma_fence *fence;
> -	int err;
> +	struct xe_vma_op *op;
> +	int err =3D 0, i;
> +
> +	xe_vm_assert_held(vm);
> +
> +	if (!job && !no_in_syncs(vops->syncs, vops->num_syncs))
> +		return -ETIME;
> +
> +	if (!job && !xe_exec_queue_is_idle(pt_update_ops->q))
> +		return -ETIME;
>=20
> -	rtfence =3D xe_range_fence_tree_first(rftree, start, last);
> +	if (pt_update_ops->wait_vm_bookkeep) {
> +		if (!job) {
> +			if (!dma_resv_test_signaled(xe_vm_resv(vm),
> +
> DMA_RESV_USAGE_BOOKKEEP))
> +				return -ETIME;
> +		} else {
> +			err =3D job_add_deps(job, xe_vm_resv(vm),
> +					   DMA_RESV_USAGE_BOOKKEEP);
> +			if (err)
> +				return err;
> +		}
> +	} else if (pt_update_ops->wait_vm_kernel) {
> +		if (!job) {
> +			if (!dma_resv_test_signaled(xe_vm_resv(vm),
> +						    DMA_RESV_USAGE_KERNEL))
> +				return -ETIME;
> +		} else {
> +			err =3D job_add_deps(job, xe_vm_resv(vm),
> +					   DMA_RESV_USAGE_KERNEL);
> +			if (err)
> +				return err;
> +		}
> +	}
> +
> +	rtfence =3D xe_range_fence_tree_first(rftree, pt_update_ops->start,
> +					    pt_update_ops->last);
>  	while (rtfence) {
>  		fence =3D rtfence->fence;
>=20
> @@ -996,80 +1060,136 @@ static int xe_pt_vm_dependencies(struct
> xe_sched_job *job,
>  				return err;
>  		}
>=20
> -		rtfence =3D xe_range_fence_tree_next(rtfence, start, last);
> +		rtfence =3D xe_range_fence_tree_next(rtfence,
> +						   pt_update_ops->start,
> +						   pt_update_ops->last);
>  	}
>=20
> -	return 0;
> +	list_for_each_entry(op, &vops->list, link) {
> +		err =3D op_add_deps(vm, op, job);
> +		if (err)
> +			return err;
> +	}
> +
> +	for (i =3D 0; job && !err && i < vops->num_syncs; i++)
> +		err =3D xe_sync_entry_add_deps(&vops->syncs[i], job);
> +
> +	return err;
>  }
>=20
>  static int xe_pt_pre_commit(struct xe_migrate_pt_update *pt_update)
>  {
> -	struct xe_range_fence_tree *rftree =3D
> -		&xe_vma_vm(pt_update->vma)->rftree[pt_update->tile_id];
> +	struct xe_vma_ops *vops =3D pt_update->vops;
> +	struct xe_vm *vm =3D vops->vm;
> +	struct xe_range_fence_tree *rftree =3D &vm->rftree[pt_update->tile_id];
> +	struct xe_vm_pgtable_update_ops *pt_update_ops =3D
> +		&vops->pt_update_ops[pt_update->tile_id];
> +
> +	return xe_pt_vm_dependencies(pt_update->job, vm, pt_update->vops,
> +				     pt_update_ops, rftree);
> +}
> +
> +#ifdef CONFIG_DRM_XE_USERPTR_INVAL_INJECT
> +
> +static bool xe_pt_userptr_inject_eagain(struct xe_userptr_vma *uvma)
> +{
> +	u32 divisor =3D uvma->userptr.divisor ? uvma->userptr.divisor : 2;
> +	static u32 count;
> +
> +	if (count++ % divisor =3D=3D divisor - 1) {
> +		uvma->userptr.divisor =3D divisor << 1;
> +		return true;
> +	}
>=20
> -	return xe_pt_vm_dependencies(pt_update->job, rftree,
> -				     pt_update->start, pt_update->last);
> +	return false;
>  }
>=20
> -static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_upda=
te)
> +#else
> +
> +static bool xe_pt_userptr_inject_eagain(struct xe_userptr_vma *uvma)
>  {
> -	struct xe_pt_migrate_pt_update *userptr_update =3D
> -		container_of(pt_update, typeof(*userptr_update), base);
> -	struct xe_userptr_vma *uvma =3D to_userptr_vma(pt_update->vma);
> -	unsigned long notifier_seq =3D uvma->userptr.notifier_seq;
> -	struct xe_vm *vm =3D xe_vma_vm(&uvma->vma);
> -	int err =3D xe_pt_vm_dependencies(pt_update->job,
> -					&vm->rftree[pt_update->tile_id],
> -					pt_update->start,
> -					pt_update->last);
> +	return false;
> +}
>=20
> -	if (err)
> -		return err;
> +#endif
>=20
> -	userptr_update->locked =3D false;
> +static void vma_check_userptr(struct xe_vm *vm, struct xe_vma *vma)
> +{
> +	struct xe_userptr_vma *uvma =3D to_userptr_vma(vma);
> +	unsigned long notifier_seq =3D uvma->userptr.notifier_seq;
>=20
> -	/*
> -	 * Wait until nobody is running the invalidation notifier, and
> -	 * since we're exiting the loop holding the notifier lock,
> -	 * nobody can proceed invalidating either.
> -	 *
> -	 * Note that we don't update the vma->userptr.notifier_seq since
> -	 * we don't update the userptr pages.
> -	 */
> -	do {
> -		down_read(&vm->userptr.notifier_lock);
> -		if (!mmu_interval_read_retry(&uvma->userptr.notifier,
> -					     notifier_seq))
> -			break;
> +	lockdep_assert_held_read(&vm->userptr.notifier_lock);
>=20
> -		up_read(&vm->userptr.notifier_lock);
> +	if (uvma->userptr.initial_bind || xe_vm_in_fault_mode(vm))
> +		return;
>=20
> -		if (userptr_update->bind)
> -			return -EAGAIN;
> +	if (!mmu_interval_read_retry(&uvma->userptr.notifier,
> +				     notifier_seq) &&
> +	    !xe_pt_userptr_inject_eagain(uvma))
> +		return;

After this, we need to retry the get_user_pages_fast thing but I don't see =
how this is achieved...

Oak

>=20
> -		notifier_seq =3D mmu_interval_read_begin(&uvma-
> >userptr.notifier);
> -	} while (true);
> +	spin_lock(&vm->userptr.invalidated_lock);
> +	list_move_tail(&uvma->userptr.invalidate_link,
> +		       &vm->userptr.invalidated);
> +	spin_unlock(&vm->userptr.invalidated_lock);
>=20
> -	/* Inject errors to test_whether they are handled correctly */
> -	if (userptr_update->bind && xe_pt_userptr_inject_eagain(uvma)) {
> -		up_read(&vm->userptr.notifier_lock);
> -		return -EAGAIN;
> +	if (xe_vm_in_preempt_fence_mode(vm)) {
> +		struct dma_resv_iter cursor;
> +		struct dma_fence *fence;
> +
> +		dma_resv_iter_begin(&cursor, xe_vm_resv(vm),
> +				    DMA_RESV_USAGE_BOOKKEEP);
> +		dma_resv_for_each_fence_unlocked(&cursor, fence)
> +			dma_fence_enable_sw_signaling(fence);
> +		dma_resv_iter_end(&cursor);
>  	}
> +}
>=20
> -	userptr_update->locked =3D true;
> +static void op_check_userptr(struct xe_vm *vm, struct xe_vma_op *op)
> +{
> +	lockdep_assert_held_read(&vm->userptr.notifier_lock);
>=20
> -	return 0;
> +	switch (op->base.op) {
> +	case DRM_GPUVA_OP_MAP:
> +		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
> +			break;
> +
> +		vma_check_userptr(vm, op->map.vma);
> +		break;
> +	case DRM_GPUVA_OP_REMAP:
> +		if (op->remap.prev)
> +			vma_check_userptr(vm, op->remap.prev);
> +		if (op->remap.next)
> +			vma_check_userptr(vm, op->remap.next);
> +		break;
> +	case DRM_GPUVA_OP_UNMAP:
> +		break;
> +	case DRM_GPUVA_OP_PREFETCH:
> +		vma_check_userptr(vm, gpuva_to_vma(op->base.prefetch.va));
> +		break;
> +	default:
> +		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> +	}
>  }
>=20
> -static const struct xe_migrate_pt_update_ops bind_ops =3D {
> -	.populate =3D xe_vm_populate_pgtable,
> -	.pre_commit =3D xe_pt_pre_commit,
> -};
> +static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_upda=
te)
> +{
> +	struct xe_vm *vm =3D pt_update->vops->vm;
> +	struct xe_vma_ops *vops =3D pt_update->vops;
> +	struct xe_vma_op *op;
> +	int err;
>=20
> -static const struct xe_migrate_pt_update_ops userptr_bind_ops =3D {
> -	.populate =3D xe_vm_populate_pgtable,
> -	.pre_commit =3D xe_pt_userptr_pre_commit,
> -};
> +	err =3D xe_pt_pre_commit(pt_update);
> +	if (err)
> +		return err;
> +
> +	down_read(&vm->userptr.notifier_lock);
> +
> +	list_for_each_entry(op, &vops->list, link)
> +		op_check_userptr(vm, op);
> +
> +	return 0;
> +}
>=20
>  struct invalidation_fence {
>  	struct xe_gt_tlb_invalidation_fence base;
> @@ -1166,181 +1286,6 @@ static int invalidation_fence_init(struct xe_gt *=
gt,
>  	return ret && ret !=3D -ENOENT ? ret : 0;
>  }
>=20
> -static void xe_pt_calc_rfence_interval(struct xe_vma *vma,
> -				       struct xe_pt_migrate_pt_update *update,
> -				       struct xe_vm_pgtable_update *entries,
> -				       u32 num_entries)
> -{
> -	int i, level =3D 0;
> -
> -	for (i =3D 0; i < num_entries; i++) {
> -		const struct xe_vm_pgtable_update *entry =3D &entries[i];
> -
> -		if (entry->pt->level > level)
> -			level =3D entry->pt->level;
> -	}
> -
> -	/* Greedy (non-optimal) calculation but simple */
> -	update->base.start =3D ALIGN_DOWN(xe_vma_start(vma),
> -					0x1ull << xe_pt_shift(level));
> -	update->base.last =3D ALIGN(xe_vma_end(vma),
> -				  0x1ull << xe_pt_shift(level)) - 1;
> -}
> -
> -/**
> - * __xe_pt_bind_vma() - Build and connect a page-table tree for the vma
> - * address range.
> - * @tile: The tile to bind for.
> - * @vma: The vma to bind.
> - * @q: The exec_queue with which to do pipelined page-table updates.
> - * @syncs: Entries to sync on before binding the built tree to the live =
vm tree.
> - * @num_syncs: Number of @sync entries.
> - * @rebind: Whether we're rebinding this vma to the same address range
> without
> - * an unbind in-between.
> - *
> - * This function builds a page-table tree (see xe_pt_stage_bind() for mo=
re
> - * information on page-table building), and the xe_vm_pgtable_update ent=
ries
> - * abstracting the operations needed to attach it to the main vm tree. I=
t
> - * then takes the relevant locks and updates the metadata side of the ma=
in
> - * vm tree and submits the operations for pipelined attachment of the
> - * gpu page-table to the vm main tree, (which can be done either by the
> - * cpu and the GPU).
> - *
> - * Return: A valid dma-fence representing the pipelined attachment opera=
tion
> - * on success, an error pointer on error.
> - */
> -struct dma_fence *
> -__xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct
> xe_exec_queue *q,
> -		 struct xe_sync_entry *syncs, u32 num_syncs,
> -		 bool rebind)
> -{
> -	struct xe_vm_pgtable_update entries[XE_VM_MAX_LEVEL * 2 + 1];
> -	struct xe_pt_migrate_pt_update bind_pt_update =3D {
> -		.base =3D {
> -			.ops =3D xe_vma_is_userptr(vma) ? &userptr_bind_ops :
> &bind_ops,
> -			.vma =3D vma,
> -			.tile_id =3D tile->id,
> -		},
> -		.bind =3D true,
> -	};
> -	struct xe_vm *vm =3D xe_vma_vm(vma);
> -	u32 num_entries;
> -	struct dma_fence *fence;
> -	struct invalidation_fence *ifence =3D NULL;
> -	struct xe_range_fence *rfence;
> -	int err;
> -
> -	bind_pt_update.locked =3D false;
> -	xe_bo_assert_held(xe_vma_bo(vma));
> -	xe_vm_assert_held(vm);
> -
> -	vm_dbg(&xe_vma_vm(vma)->xe->drm,
> -	       "Preparing bind, with range [%llx...%llx) engine %p.\n",
> -	       xe_vma_start(vma), xe_vma_end(vma), q);
> -
> -	err =3D xe_pt_prepare_bind(tile, vma, entries, &num_entries);
> -	if (err)
> -		goto err;
> -	xe_tile_assert(tile, num_entries <=3D ARRAY_SIZE(entries));
> -
> -	xe_vm_dbg_print_entries(tile_to_xe(tile), entries, num_entries);
> -	xe_pt_calc_rfence_interval(vma, &bind_pt_update, entries,
> -				   num_entries);
> -
> -	/*
> -	 * If rebind, we have to invalidate TLB on !LR vms to invalidate
> -	 * cached PTEs point to freed memory. on LR vms this is done
> -	 * automatically when the context is re-enabled by the rebind worker,
> -	 * or in fault mode it was invalidated on PTE zapping.
> -	 *
> -	 * If !rebind, and scratch enabled VMs, there is a chance the scratch
> -	 * PTE is already cached in the TLB so it needs to be invalidated.
> -	 * on !LR VMs this is done in the ring ops preceding a batch, but on
> -	 * non-faulting LR, in particular on user-space batch buffer chaining,
> -	 * it needs to be done here.
> -	 */
> -	if ((rebind && !xe_vm_in_lr_mode(vm) && !vm->batch_invalidate_tlb)
> ||
> -	    (!rebind && xe_vm_has_scratch(vm) &&
> xe_vm_in_preempt_fence_mode(vm))) {
> -		ifence =3D kzalloc(sizeof(*ifence), GFP_KERNEL);
> -		if (!ifence)
> -			return ERR_PTR(-ENOMEM);
> -	}
> -
> -	rfence =3D kzalloc(sizeof(*rfence), GFP_KERNEL);
> -	if (!rfence) {
> -		kfree(ifence);
> -		return ERR_PTR(-ENOMEM);
> -	}
> -
> -	fence =3D xe_migrate_update_pgtables(tile->migrate,
> -					   vm, xe_vma_bo(vma), q,
> -					   entries, num_entries,
> -					   syncs, num_syncs,
> -					   &bind_pt_update.base);
> -	if (!IS_ERR(fence)) {
> -		bool last_munmap_rebind =3D vma->gpuva.flags &
> XE_VMA_LAST_REBIND;
> -		LLIST_HEAD(deferred);
> -		int err;
> -
> -		err =3D xe_range_fence_insert(&vm->rftree[tile->id], rfence,
> -					    &xe_range_fence_kfree_ops,
> -					    bind_pt_update.base.start,
> -					    bind_pt_update.base.last, fence);
> -		if (err)
> -			dma_fence_wait(fence, false);
> -
> -		/* TLB invalidation must be done before signaling rebind */
> -		if (ifence) {
> -			int err =3D invalidation_fence_init(tile->primary_gt,
> -							  ifence, fence,
> -							  xe_vma_start(vma),
> -							  xe_vma_end(vma),
> -							  xe_vma_vm(vma)-
> >usm.asid);
> -			if (err) {
> -				dma_fence_put(fence);
> -				kfree(ifence);
> -				return ERR_PTR(err);
> -			}
> -			fence =3D &ifence->base.base;
> -		}
> -
> -		/* add shared fence now for pagetable delayed destroy */
> -		dma_resv_add_fence(xe_vm_resv(vm), fence, !rebind &&
> -				   last_munmap_rebind ?
> -				   DMA_RESV_USAGE_KERNEL :
> -				   DMA_RESV_USAGE_BOOKKEEP);
> -
> -		if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
> -			dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv,
> fence,
> -					   DMA_RESV_USAGE_BOOKKEEP);
> -		xe_pt_commit_bind(vma, entries, num_entries, rebind,
> -				  bind_pt_update.locked ? &deferred : NULL);
> -
> -		/* This vma is live (again?) now */
> -		vma->tile_present |=3D BIT(tile->id);
> -
> -		if (bind_pt_update.locked) {
> -			to_userptr_vma(vma)->userptr.initial_bind =3D true;
> -			up_read(&vm->userptr.notifier_lock);
> -			xe_bo_put_commit(&deferred);
> -		}
> -		if (!rebind && last_munmap_rebind &&
> -		    xe_vm_in_preempt_fence_mode(vm))
> -			xe_vm_queue_rebind_worker(vm);
> -	} else {
> -		kfree(rfence);
> -		kfree(ifence);
> -		if (bind_pt_update.locked)
> -			up_read(&vm->userptr.notifier_lock);
> -		xe_pt_abort_bind(vma, entries, num_entries);
> -	}
> -
> -	return fence;
> -
> -err:
> -	return ERR_PTR(err);
> -}
> -
>  struct xe_pt_stage_unbind_walk {
>  	/** @base: The pagewalk base-class. */
>  	struct xe_pt_walk base;
> @@ -1491,8 +1436,8 @@ xe_migrate_clear_pgtable_callback(struct
> xe_migrate_pt_update *pt_update,
>  				  void *ptr, u32 qword_ofs, u32 num_qwords,
>  				  const struct xe_vm_pgtable_update *update)
>  {
> -	struct xe_vma *vma =3D pt_update->vma;
> -	u64 empty =3D __xe_pt_empty_pte(tile, xe_vma_vm(vma), update->pt-
> >level);
> +	struct xe_vm *vm =3D pt_update->vops->vm;
> +	u64 empty =3D __xe_pt_empty_pte(tile, vm, update->pt->level);
>  	int i;
>=20
>  	if (map && map->is_iomem)
> @@ -1536,144 +1481,443 @@ xe_pt_commit_unbind(struct xe_vma *vma,
>  	}
>  }
>=20
> -static const struct xe_migrate_pt_update_ops unbind_ops =3D {
> -	.populate =3D xe_migrate_clear_pgtable_callback,
> +static void
> +xe_pt_update_ops_rfence_interval(struct xe_vm_pgtable_update_ops
> *pt_update_ops,
> +				 struct xe_vma *vma)
> +{
> +	u32 current_op =3D pt_update_ops->current_op;
> +	struct xe_vm_pgtable_update_op *pt_op =3D &pt_update_ops-
> >ops[current_op];
> +	int i, level =3D 0;
> +	u64 start, last;
> +
> +	for (i =3D 0; i < pt_op->num_entries; i++) {
> +		const struct xe_vm_pgtable_update *entry =3D &pt_op->entries[i];
> +
> +		if (entry->pt->level > level)
> +			level =3D entry->pt->level;
> +	}
> +
> +	/* Greedy (non-optimal) calculation but simple */
> +	start =3D ALIGN_DOWN(xe_vma_start(vma), 0x1ull << xe_pt_shift(level));
> +	last =3D ALIGN(xe_vma_end(vma), 0x1ull << xe_pt_shift(level)) - 1;
> +
> +	if (start < pt_update_ops->start)
> +		pt_update_ops->start =3D start;
> +	if (last > pt_update_ops->last)
> +		pt_update_ops->last =3D last;
> +}
> +
> +static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
> +			   struct xe_vm_pgtable_update_ops *pt_update_ops,
> +			   struct xe_vma *vma)
> +{
> +	u32 current_op =3D pt_update_ops->current_op;
> +	struct xe_vm_pgtable_update_op *pt_op =3D &pt_update_ops-
> >ops[current_op];
> +	struct llist_head *deferred =3D &pt_update_ops->deferred;
> +	int err;
> +
> +	xe_bo_assert_held(xe_vma_bo(vma));
> +
> +	vm_dbg(&xe_vma_vm(vma)->xe->drm,
> +	       "Preparing bind, with range [%llx...%llx)\n",
> +	       xe_vma_start(vma), xe_vma_end(vma) - 1);
> +
> +	pt_op->bind =3D true;
> +	pt_op->rebind =3D BIT(tile->id) & vma->tile_present;
> +
> +	err =3D xe_pt_prepare_bind(tile, vma, pt_op->entries,
> +				 &pt_op->num_entries);
> +	if (!err) {
> +		xe_tile_assert(tile, pt_op->num_entries <=3D
> +			       ARRAY_SIZE(pt_op->entries));
> +		xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
> +					pt_op->num_entries, true);
> +
> +		xe_pt_update_ops_rfence_interval(pt_update_ops, vma);
> +		++pt_update_ops->current_op;
> +		pt_update_ops->needs_userptr_lock |=3D
> xe_vma_is_userptr(vma);
> +
> +		/*
> +		 * If rebind, we have to invalidate TLB on !LR vms to invalidate
> +		 * cached PTEs point to freed memory. on LR vms this is done
> +		 * automatically when the context is re-enabled by the rebind
> +		 * worker, or in fault mode it was invalidated on PTE zapping.
> +		 *
> +		 * If !rebind, and scratch enabled VMs, there is a chance the
> +		 * scratch PTE is already cached in the TLB so it needs to be
> +		 * invalidated. on !LR VMs this is done in the ring ops
> +		 * preceding a batch, but on non-faulting LR, in particular on
> +		 * user-space batch buffer chaining, it needs to be done here.
> +		 */
> +		pt_update_ops->needs_invalidation |=3D
> +			(pt_op->rebind && xe_vm_in_lr_mode(vm) &&
> +			!vm->batch_invalidate_tlb) ||
> +			(!pt_op->rebind && vm->scratch_pt[tile->id] &&
> +			 xe_vm_in_preempt_fence_mode(vm));
> +
> +		/* FIXME: Don't commit right away */
> +		xe_pt_commit_bind(vma, pt_op->entries, pt_op->num_entries,
> +				  pt_op->rebind, deferred);
> +	}
> +
> +	return err;
> +}
> +
> +static int unbind_op_prepare(struct xe_tile *tile,
> +			     struct xe_vm_pgtable_update_ops *pt_update_ops,
> +			     struct xe_vma *vma)
> +{
> +	u32 current_op =3D pt_update_ops->current_op;
> +	struct xe_vm_pgtable_update_op *pt_op =3D &pt_update_ops-
> >ops[current_op];
> +	struct llist_head *deferred =3D &pt_update_ops->deferred;
> +
> +	xe_bo_assert_held(xe_vma_bo(vma));
> +
> +	vm_dbg(&xe_vma_vm(vma)->xe->drm,
> +	       "Preparing unbind, with range [%llx...%llx)\n",
> +	       xe_vma_start(vma), xe_vma_end(vma) - 1);
> +
> +	pt_op->bind =3D false;
> +	pt_op->rebind =3D false;
> +
> +	pt_op->num_entries =3D xe_pt_stage_unbind(tile, vma, pt_op->entries);
> +
> +	xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
> +				pt_op->num_entries, false);
> +	xe_pt_update_ops_rfence_interval(pt_update_ops, vma);
> +	++pt_update_ops->current_op;
> +	pt_update_ops->needs_userptr_lock |=3D xe_vma_is_userptr(vma);
> +	pt_update_ops->needs_invalidation =3D true;
> +
> +	/* FIXME: Don't commit right away */
> +	xe_pt_commit_unbind(vma, pt_op->entries, pt_op->num_entries,
> +			    deferred);
> +
> +	return 0;
> +}
> +
> +static int op_prepare(struct xe_vm *vm,
> +		      struct xe_tile *tile,
> +		      struct xe_vm_pgtable_update_ops *pt_update_ops,
> +		      struct xe_vma_op *op)
> +{
> +	int err =3D 0;
> +
> +	xe_vm_assert_held(vm);
> +
> +	switch (op->base.op) {
> +	case DRM_GPUVA_OP_MAP:
> +		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
> +			break;
> +
> +		err =3D bind_op_prepare(vm, tile, pt_update_ops, op->map.vma);
> +		pt_update_ops->wait_vm_kernel =3D true;
> +		break;
> +	case DRM_GPUVA_OP_REMAP:
> +		err =3D unbind_op_prepare(tile, pt_update_ops,
> +					gpuva_to_vma(op->base.remap.unmap-
> >va));
> +
> +		if (!err && op->remap.prev) {
> +			err =3D bind_op_prepare(vm, tile, pt_update_ops,
> +					      op->remap.prev);
> +			pt_update_ops->wait_vm_bookkeep =3D true;
> +		}
> +		if (!err && op->remap.next) {
> +			err =3D bind_op_prepare(vm, tile, pt_update_ops,
> +					      op->remap.next);
> +			pt_update_ops->wait_vm_bookkeep =3D true;
> +		}
> +		break;
> +	case DRM_GPUVA_OP_UNMAP:
> +		err =3D unbind_op_prepare(tile, pt_update_ops,
> +					gpuva_to_vma(op->base.unmap.va));
> +		break;
> +	case DRM_GPUVA_OP_PREFETCH:
> +		err =3D bind_op_prepare(vm, tile, pt_update_ops,
> +				      gpuva_to_vma(op->base.prefetch.va));
> +		pt_update_ops->wait_vm_kernel =3D true;
> +		break;
> +	default:
> +		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> +	}
> +
> +	return err;
> +}
> +
> +static void
> +xe_pt_update_ops_init(struct xe_vm_pgtable_update_ops *pt_update_ops)
> +{
> +	init_llist_head(&pt_update_ops->deferred);
> +	pt_update_ops->start =3D ~0x0ull;
> +	pt_update_ops->last =3D 0x0ull;
> +}
> +
> +/**
> + * xe_pt_update_ops_prepare() - Prepare PT update operations
> + * @tile: Tile of PT update operations
> + * @vops: VMA operationa
> + *
> + * Prepare PT update operations which includes updating internal PT stat=
e,
> + * allocate memory for page tables, populate page table being pruned in,=
 and
> + * create PT update operations for leaf insertion / removal.
> + *
> + * Return: 0 on success, negative error code on error.
> + */
> +int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vo=
ps)
> +{
> +	struct xe_vm_pgtable_update_ops *pt_update_ops =3D
> +		&vops->pt_update_ops[tile->id];
> +	struct xe_vma_op *op;
> +	int err;
> +
> +	lockdep_assert_held(&vops->vm->lock);
> +	xe_vm_assert_held(vops->vm);
> +
> +	xe_pt_update_ops_init(pt_update_ops);
> +
> +	list_for_each_entry(op, &vops->list, link) {
> +		err =3D op_prepare(vops->vm, tile, pt_update_ops, op);
> +
> +		if (err)
> +			return err;
> +	}
> +
> +	xe_tile_assert(tile, pt_update_ops->current_op =3D=3D
> +		       pt_update_ops->num_ops);
> +
> +	return 0;
> +}
> +
> +static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
> +			   struct xe_vm_pgtable_update_ops *pt_update_ops,
> +			   struct xe_vma *vma, struct dma_fence *fence)
> +{
> +	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
> +		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
> +				   pt_update_ops->wait_vm_bookkeep ?
> +				   DMA_RESV_USAGE_KERNEL :
> +				   DMA_RESV_USAGE_BOOKKEEP);
> +	vma->tile_present |=3D BIT(tile->id);
> +	if (xe_vma_is_userptr(vma)) {
> +		lockdep_assert_held_read(&vm->userptr.notifier_lock);
> +		to_userptr_vma(vma)->userptr.initial_bind =3D true;
> +	}
> +
> +	/*
> +	 * Kick rebind worker if this bind triggers preempt fences and not in
> +	 * the rebind worker
> +	 */
> +	if (pt_update_ops->wait_vm_bookkeep &&
> +	    xe_vm_in_preempt_fence_mode(vm) &&
> +	    !current->mm)
> +		xe_vm_queue_rebind_worker(vm);
> +}
> +
> +static void unbind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
> +			     struct xe_vm_pgtable_update_ops *pt_update_ops,
> +			     struct xe_vma *vma, struct dma_fence *fence)
> +{
> +	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
> +		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
> +				   pt_update_ops->wait_vm_bookkeep ?
> +				   DMA_RESV_USAGE_KERNEL :
> +				   DMA_RESV_USAGE_BOOKKEEP);
> +	vma->tile_present &=3D ~BIT(tile->id);
> +	if (!vma->tile_present) {
> +		list_del_init(&vma->combined_links.rebind);
> +		if (xe_vma_is_userptr(vma)) {
> +			lockdep_assert_held_read(&vm->userptr.notifier_lock);
> +
> +			spin_lock(&vm->userptr.invalidated_lock);
> +			list_del_init(&to_userptr_vma(vma)-
> >userptr.invalidate_link);
> +			spin_unlock(&vm->userptr.invalidated_lock);
> +		}
> +	}
> +}
> +
> +static void op_commit(struct xe_vm *vm,
> +		      struct xe_tile *tile,
> +		      struct xe_vm_pgtable_update_ops *pt_update_ops,
> +		      struct xe_vma_op *op, struct dma_fence *fence)
> +{
> +	xe_vm_assert_held(vm);
> +
> +	switch (op->base.op) {
> +	case DRM_GPUVA_OP_MAP:
> +		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
> +			break;
> +
> +		bind_op_commit(vm, tile, pt_update_ops, op->map.vma, fence);
> +		break;
> +	case DRM_GPUVA_OP_REMAP:
> +		unbind_op_commit(vm, tile, pt_update_ops,
> +				 gpuva_to_vma(op->base.remap.unmap->va),
> fence);
> +
> +		if (op->remap.prev)
> +			bind_op_commit(vm, tile, pt_update_ops, op-
> >remap.prev,
> +				       fence);
> +		if (op->remap.next)
> +			bind_op_commit(vm, tile, pt_update_ops, op-
> >remap.next,
> +				       fence);
> +		break;
> +	case DRM_GPUVA_OP_UNMAP:
> +		unbind_op_commit(vm, tile, pt_update_ops,
> +				 gpuva_to_vma(op->base.unmap.va), fence);
> +		break;
> +	case DRM_GPUVA_OP_PREFETCH:
> +		bind_op_commit(vm, tile, pt_update_ops,
> +			       gpuva_to_vma(op->base.prefetch.va), fence);
> +		break;
> +	default:
> +		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> +	}
> +}
> +
> +static const struct xe_migrate_pt_update_ops migrate_ops =3D {
> +	.populate =3D xe_vm_populate_pgtable,
> +	.clear =3D xe_migrate_clear_pgtable_callback,
>  	.pre_commit =3D xe_pt_pre_commit,
>  };
>=20
> -static const struct xe_migrate_pt_update_ops userptr_unbind_ops =3D {
> -	.populate =3D xe_migrate_clear_pgtable_callback,
> +static const struct xe_migrate_pt_update_ops userptr_migrate_ops =3D {
> +	.populate =3D xe_vm_populate_pgtable,
> +	.clear =3D xe_migrate_clear_pgtable_callback,
>  	.pre_commit =3D xe_pt_userptr_pre_commit,
>  };
>=20
>  /**
> - * __xe_pt_unbind_vma() - Disconnect and free a page-table tree for the =
vma
> - * address range.
> - * @tile: The tile to unbind for.
> - * @vma: The vma to unbind.
> - * @q: The exec_queue with which to do pipelined page-table updates.
> - * @syncs: Entries to sync on before disconnecting the tree to be destro=
yed.
> - * @num_syncs: Number of @sync entries.
> + * xe_pt_update_ops_run() - Run PT update operations
> + * @tile: Tile of PT update operations
> + * @vops: VMA operationa
>   *
> - * This function builds a the xe_vm_pgtable_update entries abstracting t=
he
> - * operations needed to detach the page-table tree to be destroyed from =
the
> - * man vm tree.
> - * It then takes the relevant locks and submits the operations for
> - * pipelined detachment of the gpu page-table from  the vm main tree,
> - * (which can be done either by the cpu and the GPU), Finally it frees t=
he
> - * detached page-table tree.
> + * Run PT update operations which includes committing internal PT state
> changes,
> + * creating job for PT update operations for leaf insertion / removal, a=
nd
> + * installing job fence in various places.
>   *
> - * Return: A valid dma-fence representing the pipelined detachment opera=
tion
> - * on success, an error pointer on error.
> + * Return: fence on success, negative ERR_PTR on error.
>   */
>  struct dma_fence *
> -__xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct
> xe_exec_queue *q,
> -		   struct xe_sync_entry *syncs, u32 num_syncs)
> +xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>  {
> -	struct xe_vm_pgtable_update entries[XE_VM_MAX_LEVEL * 2 + 1];
> -	struct xe_pt_migrate_pt_update unbind_pt_update =3D {
> -		.base =3D {
> -			.ops =3D xe_vma_is_userptr(vma) ? &userptr_unbind_ops :
> -			&unbind_ops,
> -			.vma =3D vma,
> -			.tile_id =3D tile->id,
> -		},
> -	};
> -	struct xe_vm *vm =3D xe_vma_vm(vma);
> -	u32 num_entries;
> -	struct dma_fence *fence =3D NULL;
> -	struct invalidation_fence *ifence;
> +	struct xe_vm *vm =3D vops->vm;
> +	struct xe_vm_pgtable_update_ops *pt_update_ops =3D
> +		&vops->pt_update_ops[tile->id];
> +	struct dma_fence *fence;
> +	struct invalidation_fence *ifence =3D NULL;
>  	struct xe_range_fence *rfence;
> +	struct xe_vma_op *op;
> +	int err =3D 0;
> +	struct xe_migrate_pt_update update =3D {
> +		.ops =3D pt_update_ops->needs_userptr_lock ?
> +			&userptr_migrate_ops :
> +			&migrate_ops,
> +		.vops =3D vops,
> +		.tile_id =3D tile->id
> +	};
>=20
> -	LLIST_HEAD(deferred);
> -
> -	xe_bo_assert_held(xe_vma_bo(vma));
> +	lockdep_assert_held(&vm->lock);
>  	xe_vm_assert_held(vm);
>=20
> -	vm_dbg(&xe_vma_vm(vma)->xe->drm,
> -	       "Preparing unbind, with range [%llx...%llx) engine %p.\n",
> -	       xe_vma_start(vma), xe_vma_end(vma), q);
> -
> -	num_entries =3D xe_pt_stage_unbind(tile, vma, entries);
> -	xe_tile_assert(tile, num_entries <=3D ARRAY_SIZE(entries));
> -
> -	xe_vm_dbg_print_entries(tile_to_xe(tile), entries, num_entries);
> -	xe_pt_calc_rfence_interval(vma, &unbind_pt_update, entries,
> -				   num_entries);
> -
> -	ifence =3D kzalloc(sizeof(*ifence), GFP_KERNEL);
> -	if (!ifence)
> -		return ERR_PTR(-ENOMEM);
> +	if (pt_update_ops->needs_invalidation) {
> +		ifence =3D kzalloc(sizeof(*ifence), GFP_KERNEL);
> +		if (!ifence)
> +			return ERR_PTR(-ENOMEM);
> +	}
>=20
>  	rfence =3D kzalloc(sizeof(*rfence), GFP_KERNEL);
>  	if (!rfence) {
> -		kfree(ifence);
> -		return ERR_PTR(-ENOMEM);
> +		err =3D -ENOMEM;
> +		goto free_ifence;
>  	}
>=20
> -	/*
> -	 * Even if we were already evicted and unbind to destroy, we need to
> -	 * clear again here. The eviction may have updated pagetables at a
> -	 * lower level, because it needs to be more conservative.
> -	 */
> -	fence =3D xe_migrate_update_pgtables(tile->migrate,
> -					   vm, NULL, q ? q :
> -					   vm->q[tile->id],
> -					   entries, num_entries,
> -					   syncs, num_syncs,
> -					   &unbind_pt_update.base);
> -	if (!IS_ERR(fence)) {
> -		int err;
> -
> -		err =3D xe_range_fence_insert(&vm->rftree[tile->id], rfence,
> -					    &xe_range_fence_kfree_ops,
> -					    unbind_pt_update.base.start,
> -					    unbind_pt_update.base.last, fence);
> -		if (err)
> -			dma_fence_wait(fence, false);
> +	fence =3D xe_migrate_update_pgtables(tile->migrate, &update);
> +	if (IS_ERR(fence)) {
> +		err =3D PTR_ERR(fence);
> +		goto free_rfence;
> +	}
> +
> +	err =3D xe_range_fence_insert(&vm->rftree[tile->id], rfence,
> +				    &xe_range_fence_kfree_ops,
> +				    pt_update_ops->start,
> +				    pt_update_ops->last, fence);
> +	if (err)
> +		dma_fence_wait(fence, false);
>=20
> -		/* TLB invalidation must be done before signaling unbind */
> +	/* tlb invalidation must be done before signaling rebind */
> +	if (ifence) {
>  		err =3D invalidation_fence_init(tile->primary_gt, ifence, fence,
> -					      xe_vma_start(vma),
> -					      xe_vma_end(vma),
> -					      xe_vma_vm(vma)->usm.asid);
> -		if (err) {
> -			dma_fence_put(fence);
> -			kfree(ifence);
> -			return ERR_PTR(err);
> -		}
> +					      pt_update_ops->start,
> +					      pt_update_ops->last,
> +					      vm->usm.asid);
> +		if (err)
> +			goto put_fence;
>  		fence =3D &ifence->base.base;
> +	}
>=20
> -		/* add shared fence now for pagetable delayed destroy */
> -		dma_resv_add_fence(xe_vm_resv(vm), fence,
> -				   DMA_RESV_USAGE_BOOKKEEP);
> +	dma_resv_add_fence(xe_vm_resv(vm), fence,
> +			   pt_update_ops->wait_vm_bookkeep ?
> +			   DMA_RESV_USAGE_KERNEL :
> +			   DMA_RESV_USAGE_BOOKKEEP);
>=20
> -		/* This fence will be installed by caller when doing eviction */
> -		if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
> -			dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv,
> fence,
> -					   DMA_RESV_USAGE_BOOKKEEP);
> -		xe_pt_commit_unbind(vma, entries, num_entries,
> -				    unbind_pt_update.locked ? &deferred : NULL);
> -		vma->tile_present &=3D ~BIT(tile->id);
> -	} else {
> -		kfree(rfence);
> -		kfree(ifence);
> -	}
> +	list_for_each_entry(op, &vops->list, link)
> +		op_commit(vops->vm, tile, pt_update_ops, op, fence);
>=20
> -	if (!vma->tile_present)
> -		list_del_init(&vma->combined_links.rebind);
> +	if (pt_update_ops->needs_userptr_lock)
> +		up_read(&vm->userptr.notifier_lock);
>=20
> -	if (unbind_pt_update.locked) {
> -		xe_tile_assert(tile, xe_vma_is_userptr(vma));
> +	return fence;
>=20
> -		if (!vma->tile_present) {
> -			spin_lock(&vm->userptr.invalidated_lock);
> -			list_del_init(&to_userptr_vma(vma)-
> >userptr.invalidate_link);
> -			spin_unlock(&vm->userptr.invalidated_lock);
> -		}
> +put_fence:
> +	if (pt_update_ops->needs_userptr_lock)
>  		up_read(&vm->userptr.notifier_lock);
> -		xe_bo_put_commit(&deferred);
> +	dma_fence_put(fence);
> +free_rfence:
> +	kfree(rfence);
> +free_ifence:
> +	kfree(ifence);
> +
> +	return ERR_PTR(err);
> +}
> +
> +/**
> + * xe_pt_update_ops_fini() - Finish PT update operations
> + * @tile: Tile of PT update operations
> + * @vops: VMA operations
> + *
> + * Finish PT update operations by committing to destroy page table memor=
y
> + */
> +void xe_pt_update_ops_fini(struct xe_tile *tile, struct xe_vma_ops *vops=
)
> +{
> +	struct xe_vm_pgtable_update_ops *pt_update_ops =3D
> +		&vops->pt_update_ops[tile->id];
> +	int i;
> +
> +	lockdep_assert_held(&vops->vm->lock);
> +	xe_vm_assert_held(vops->vm);
> +
> +	/* FIXME: Not 100% correct */
> +	for (i =3D 0; i < pt_update_ops->num_ops; ++i) {
> +		struct xe_vm_pgtable_update_op *pt_op =3D &pt_update_ops-
> >ops[i];
> +
> +		if (pt_op->bind)
> +			xe_pt_free_bind(pt_op->entries, pt_op->num_entries);
>  	}
> +	xe_bo_put_commit(&vops->pt_update_ops[tile->id].deferred);
> +}
>=20
> -	return fence;
> +/**
> + * xe_pt_update_ops_abort() - Abort PT update operations
> + * @tile: Tile of PT update operations
> + * @vops: VMA operationa
> + *
> + *  Abort PT update operations by unwinding internal PT state
> + */
> +void xe_pt_update_ops_abort(struct xe_tile *tile, struct xe_vma_ops *vop=
s)
> +{
> +	lockdep_assert_held(&vops->vm->lock);
> +	xe_vm_assert_held(vops->vm);
> +
> +	/* FIXME: Just kill VM for now + cleanup PTs */
> +	xe_bo_put_commit(&vops->pt_update_ops[tile->id].deferred);
> +	xe_vm_kill(vops->vm, false);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
> index 71a4fbfcff43..cbf8170d89cc 100644
> --- a/drivers/gpu/drm/xe/xe_pt.h
> +++ b/drivers/gpu/drm/xe/xe_pt.h
> @@ -17,6 +17,7 @@ struct xe_sync_entry;
>  struct xe_tile;
>  struct xe_vm;
>  struct xe_vma;
> +struct xe_vma_ops;
>=20
>  /* Largest huge pte is currently 1GiB. May become device dependent. */
>  #define MAX_HUGEPTE_LEVEL 2
> @@ -34,6 +35,12 @@ void xe_pt_populate_empty(struct xe_tile *tile, struct
> xe_vm *vm,
>=20
>  void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *defer=
red);
>=20
> +int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vo=
ps);
> +struct dma_fence *xe_pt_update_ops_run(struct xe_tile *tile,
> +				       struct xe_vma_ops *vops);
> +void xe_pt_update_ops_fini(struct xe_tile *tile, struct xe_vma_ops *vops=
);
> +void xe_pt_update_ops_abort(struct xe_tile *tile, struct xe_vma_ops *vop=
s);
> +
>  struct dma_fence *
>  __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct
> xe_exec_queue *q,
>  		 struct xe_sync_entry *syncs, u32 num_syncs,
> diff --git a/drivers/gpu/drm/xe/xe_pt_types.h
> b/drivers/gpu/drm/xe/xe_pt_types.h
> index 2093150f461e..16252f1be055 100644
> --- a/drivers/gpu/drm/xe/xe_pt_types.h
> +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> @@ -86,4 +86,38 @@ struct xe_vm_pgtable_update_op {
>  	bool rebind;
>  };
>=20
> +/** struct xe_vm_pgtable_update_ops: page table update operations */
> +struct xe_vm_pgtable_update_ops {
> +	/** @ops: operations */
> +	struct xe_vm_pgtable_update_op *ops;
> +	/** @deferred: deferred list to destroy PT entries */
> +	struct llist_head deferred;
> +	/** @q: exec queue for PT operations */
> +	struct xe_exec_queue *q;
> +	/** @start: start address of ops */
> +	u64 start;
> +	/** @last: last address of ops */
> +	u64 last;
> +	/** @num_ops: number of operations */
> +	u32 num_ops;
> +	/** @current_op: current operations */
> +	u32 current_op;
> +	/** @needs_userptr_lock: Needs userptr lock */
> +	bool needs_userptr_lock;
> +	/** @needs_invalidation: Needs invalidation */
> +	bool needs_invalidation;
> +	/**
> +	 * @wait_vm_bookkeep: PT operations need to wait until VM is idle
> +	 * (bookkeep dma-resv slots are idle) and stage all future VM activity
> +	 * behind these operations (install PT operations into VM kernel
> +	 * dma-resv slot).
> +	 */
> +	bool wait_vm_bookkeep;
> +	/**
> +	 * @wait_vm_kernel: PT operations need to wait until VM kernel dma-
> resv
> +	 * slots are idle.
> +	 */
> +	bool wait_vm_kernel;
> +};
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 72e9bdab79d5..47658465b735 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -413,7 +413,7 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
>=20
>  #define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
>=20
> -static void xe_vm_kill(struct xe_vm *vm, bool unlocked)
> +void xe_vm_kill(struct xe_vm *vm, bool unlocked)
>  {
>  	struct xe_exec_queue *q;
>=20
> @@ -577,13 +577,9 @@ static void preempt_rebind_work_func(struct
> work_struct *w)
>  		err =3D PTR_ERR(rebind_fence);
>  		goto out_unlock;
>  	}
> +	dma_fence_put(rebind_fence);
>=20
> -	if (rebind_fence) {
> -		dma_fence_wait(rebind_fence, false);
> -		dma_fence_put(rebind_fence);
> -	}
> -
> -	/* Wait on munmap style VM unbinds */
> +	/* Wait on rebinds */
>  	wait =3D dma_resv_wait_timeout(xe_vm_resv(vm),
>  				     DMA_RESV_USAGE_KERNEL,
>  				     false, MAX_SCHEDULE_TIMEOUT);
> @@ -759,11 +755,35 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
>   * xe_vm_populate_dummy_rebind() - Populate dummy rebind VMA ops
>   * @vm: The VM.
>   * @vma: VMA to populate dummy VMA ops
> + * @tile_mask: tile mask for VMA ops
>   *
>   * Populate dummy VMA ops which can be used to issue a rebind for the VM=
A
>   */
> -void xe_vm_populate_dummy_rebind(struct xe_vm *vm, struct xe_vma *vma)
> +void xe_vm_populate_dummy_rebind(struct xe_vm *vm, struct xe_vma *vma,
> +				 u8 tile_mask)
>  {
> +	int i;
> +
> +	for (i =3D 0; i < XE_MAX_TILES_PER_DEVICE; ++i) {
> +		if (BIT(i) & tile_mask) {
> +			struct xe_vm_pgtable_update_op *pt_op =3D
> +				vm->dummy_ops.vops.pt_update_ops[i].ops;
> +
> +			memset(&vm->dummy_ops.vops.pt_update_ops[i], 0,
> +			       sizeof(vm->dummy_ops.vops.pt_update_ops[i]));
> +			vm->dummy_ops.vops.pt_update_ops[i].ops =3D pt_op;
> +			vm->dummy_ops.vops.pt_update_ops[i].num_ops =3D 1;
> +
> +			/*
> +			 * Wait for VM to be idle / schedule execs + resume
> +			 * behind rebinds
> +			 */
> +			vm-
> >dummy_ops.vops.pt_update_ops[i].wait_vm_bookkeep =3D
> +				true;
> +		} else {
> +			vm->dummy_ops.vops.pt_update_ops[i].num_ops =3D 0;
> +		}
> +	}
>  	vm->dummy_ops.op.base.op =3D DRM_GPUVA_OP_MAP;
>  	vm->dummy_ops.op.base.map.va.addr =3D vma->gpuva.va.addr;
>  	vm->dummy_ops.op.base.map.va.range =3D vma->gpuva.va.range;
> @@ -797,7 +817,7 @@ struct dma_fence *xe_vm_rebind(struct xe_vm *vm,
> bool rebind_worker)
>  		else
>  			trace_xe_vma_rebind_exec(vma);
>=20
> -		xe_vm_populate_dummy_rebind(vm, vma);
> +		xe_vm_populate_dummy_rebind(vm, vma, vma->tile_present);
>  		fence =3D xe_vm_ops_execute(vm, &vm->dummy_ops.vops);
>  		if (IS_ERR(fence))
>  			return fence;
> @@ -1653,7 +1673,6 @@ static void vm_destroy_work_func(struct work_struct
> *w)
>  		XE_WARN_ON(vm->pt_root[id]);
>=20
>  	trace_xe_vm_free(vm);
> -	dma_fence_put(vm->rebind_fence);
>  	xe_vma_ops_fini(&vm->dummy_ops.vops);
>  	kfree(vm);
>  }
> @@ -1691,147 +1710,6 @@ to_wait_exec_queue(struct xe_vm *vm, struct
> xe_exec_queue *q)
>  	return q ? q : vm->q[0];
>  }
>=20
> -static struct dma_fence *
> -xe_vm_unbind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
> -		 struct xe_sync_entry *syncs, u32 num_syncs,
> -		 bool first_op, bool last_op)
> -{
> -	struct xe_vm *vm =3D xe_vma_vm(vma);
> -	struct xe_exec_queue *wait_exec_queue =3D to_wait_exec_queue(vm,
> q);
> -	struct xe_tile *tile;
> -	struct dma_fence *fence =3D NULL;
> -	struct dma_fence **fences =3D NULL;
> -	struct dma_fence_array *cf =3D NULL;
> -	int cur_fence =3D 0;
> -	int number_tiles =3D hweight8(vma->tile_present);
> -	int err;
> -	u8 id;
> -
> -	trace_xe_vma_unbind(vma);
> -
> -	if (number_tiles > 1) {
> -		fences =3D kmalloc_array(number_tiles, sizeof(*fences),
> -				       GFP_KERNEL);
> -		if (!fences)
> -			return ERR_PTR(-ENOMEM);
> -	}
> -
> -	for_each_tile(tile, vm->xe, id) {
> -		if (!(vma->tile_present & BIT(id)))
> -			goto next;
> -
> -		fence =3D __xe_pt_unbind_vma(tile, vma, q ? q : vm->q[id],
> -					   first_op ? syncs : NULL,
> -					   first_op ? num_syncs : 0);
> -		if (IS_ERR(fence)) {
> -			err =3D PTR_ERR(fence);
> -			goto err_fences;
> -		}
> -
> -		if (fences)
> -			fences[cur_fence++] =3D fence;
> -
> -next:
> -		if (q && vm->pt_root[id] && !list_empty(&q->multi_gt_list))
> -			q =3D list_next_entry(q, multi_gt_list);
> -	}
> -
> -	if (fences) {
> -		cf =3D dma_fence_array_create(number_tiles, fences,
> -					    vm->composite_fence_ctx,
> -					    vm->composite_fence_seqno++,
> -					    false);
> -		if (!cf) {
> -			--vm->composite_fence_seqno;
> -			err =3D -ENOMEM;
> -			goto err_fences;
> -		}
> -	}
> -
> -	fence =3D cf ? &cf->base : !fence ?
> -		xe_exec_queue_last_fence_get(wait_exec_queue, vm) : fence;
> -
> -	return fence;
> -
> -err_fences:
> -	if (fences) {
> -		while (cur_fence)
> -			dma_fence_put(fences[--cur_fence]);
> -		kfree(fences);
> -	}
> -
> -	return ERR_PTR(err);
> -}
> -
> -static struct dma_fence *
> -xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
> -	       struct xe_sync_entry *syncs, u32 num_syncs,
> -	       u8 tile_mask, bool first_op, bool last_op)
> -{
> -	struct xe_tile *tile;
> -	struct dma_fence *fence;
> -	struct dma_fence **fences =3D NULL;
> -	struct dma_fence_array *cf =3D NULL;
> -	struct xe_vm *vm =3D xe_vma_vm(vma);
> -	int cur_fence =3D 0;
> -	int number_tiles =3D hweight8(vma->tile_mask);
> -	int err;
> -	u8 id;
> -
> -	trace_xe_vma_bind(vma);
> -
> -	if (number_tiles > 1) {
> -		fences =3D kmalloc_array(number_tiles, sizeof(*fences),
> -				       GFP_KERNEL);
> -		if (!fences)
> -			return ERR_PTR(-ENOMEM);
> -	}
> -
> -	for_each_tile(tile, vm->xe, id) {
> -		if (!(tile_mask & BIT(id)))
> -			goto next;
> -
> -		fence =3D __xe_pt_bind_vma(tile, vma, q ? q : vm->q[id],
> -					 first_op ? syncs : NULL,
> -					 first_op ? num_syncs : 0,
> -					 vma->tile_present & BIT(id));
> -		if (IS_ERR(fence)) {
> -			err =3D PTR_ERR(fence);
> -			goto err_fences;
> -		}
> -
> -		if (fences)
> -			fences[cur_fence++] =3D fence;
> -
> -next:
> -		if (q && vm->pt_root[id] && !list_empty(&q->multi_gt_list))
> -			q =3D list_next_entry(q, multi_gt_list);
> -	}
> -
> -	if (fences) {
> -		cf =3D dma_fence_array_create(number_tiles, fences,
> -					    vm->composite_fence_ctx,
> -					    vm->composite_fence_seqno++,
> -					    false);
> -		if (!cf) {
> -			--vm->composite_fence_seqno;
> -			err =3D -ENOMEM;
> -			goto err_fences;
> -		}
> -	}
> -
> -	return cf ? &cf->base : fence;
> -
> -err_fences:
> -	if (fences) {
> -		while (cur_fence)
> -			dma_fence_put(fences[--cur_fence]);
> -		kfree(fences);
> -	}
> -
> -	return ERR_PTR(err);
> -}
> -
>  static struct xe_user_fence *
>  find_ufence_get(struct xe_sync_entry *syncs, u32 num_syncs)
>  {
> @@ -1847,47 +1725,6 @@ find_ufence_get(struct xe_sync_entry *syncs, u32
> num_syncs)
>  	return NULL;
>  }
>=20
> -static struct dma_fence *
> -xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct xe_exec_queue *q=
,
> -	   struct xe_bo *bo, struct xe_sync_entry *syncs, u32 num_syncs,
> -	   u8 tile_mask, bool immediate, bool first_op, bool last_op)
> -{
> -	struct dma_fence *fence;
> -	struct xe_exec_queue *wait_exec_queue =3D to_wait_exec_queue(vm,
> q);
> -
> -	xe_vm_assert_held(vm);
> -	xe_bo_assert_held(bo);
> -
> -	if (immediate) {
> -		fence =3D xe_vm_bind_vma(vma, q, syncs, num_syncs, tile_mask,
> -				       first_op, last_op);
> -		if (IS_ERR(fence))
> -			return fence;
> -	} else {
> -		xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
> -		fence =3D xe_exec_queue_last_fence_get(wait_exec_queue, vm);
> -	}
> -
> -	return fence;
> -}
> -
> -static struct dma_fence *
> -xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
> -	     struct xe_exec_queue *q, struct xe_sync_entry *syncs,
> -	     u32 num_syncs, bool first_op, bool last_op)
> -{
> -	struct dma_fence *fence;
> -
> -	xe_vm_assert_held(vm);
> -	xe_bo_assert_held(xe_vma_bo(vma));
> -
> -	fence =3D xe_vm_unbind_vma(vma, q, syncs, num_syncs, first_op,
> last_op);
> -	if (IS_ERR(fence))
> -		return fence;
> -
> -	return fence;
> -}
> -
>  #define ALL_DRM_XE_VM_CREATE_FLAGS
> (DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE | \
>  				    DRM_XE_VM_CREATE_FLAG_LR_MODE | \
>  				    DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
> @@ -2028,21 +1865,6 @@ static const u32 region_to_mem_type[] =3D {
>  	XE_PL_VRAM1,
>  };
>=20
> -static struct dma_fence *
> -xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
> -	       struct xe_exec_queue *q, struct xe_sync_entry *syncs,
> -	       u32 num_syncs, bool first_op, bool last_op)
> -{
> -	struct xe_exec_queue *wait_exec_queue =3D to_wait_exec_queue(vm,
> q);
> -
> -	if (vma->tile_mask !=3D (vma->tile_present & ~vma->usm.tile_invalidated=
))
> {
> -		return xe_vm_bind(vm, vma, q, xe_vma_bo(vma), syncs,
> num_syncs,
> -				  vma->tile_mask, true, first_op, last_op);
> -	} else {
> -		return xe_exec_queue_last_fence_get(wait_exec_queue, vm);
> -	}
> -}
> -
>  static void prep_vma_destroy(struct xe_vm *vm, struct xe_vma *vma,
>  			     bool post_commit)
>  {
> @@ -2334,7 +2156,6 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm=
,
> struct xe_exec_queue *q,
>  				   struct xe_vma_ops *vops, bool last)
>  {
>  	struct xe_device *xe =3D vm->xe;
> -	struct xe_vma_op *last_op =3D NULL;
>  	struct drm_gpuva_op *__op;
>  	struct xe_tile *tile;
>  	u8 id, tile_mask =3D 0;
> @@ -2348,19 +2169,10 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm
> *vm, struct xe_exec_queue *q,
>  	drm_gpuva_for_each_op(__op, ops) {
>  		struct xe_vma_op *op =3D gpuva_op_to_vma_op(__op);
>  		struct xe_vma *vma;
> -		bool first =3D list_empty(&vops->list);
>  		unsigned int flags =3D 0;
>=20
>  		INIT_LIST_HEAD(&op->link);
>  		list_add_tail(&op->link, &vops->list);
> -
> -		if (first) {
> -			op->flags |=3D XE_VMA_OP_FIRST;
> -			op->num_syncs =3D num_syncs;
> -			op->syncs =3D syncs;
> -		}
> -
> -		op->q =3D q;
>  		op->tile_mask =3D tile_mask;
>=20
>  		switch (op->base.op) {
> @@ -2471,196 +2283,21 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm
> *vm, struct xe_exec_queue *q,
>  		}
>  		case DRM_GPUVA_OP_UNMAP:
>  		case DRM_GPUVA_OP_PREFETCH:
> +			/* FIXME: Need to skip some prefetch ops */
>  			xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
>  			break;
>  		default:
>  			drm_warn(&vm->xe->drm, "NOT POSSIBLE");
>  		}
>=20
> -		last_op =3D op;
> -
>  		err =3D xe_vma_op_commit(vm, op);
>  		if (err)
>  			return err;
>  	}
>=20
> -	/* FIXME: Unhandled corner case */
> -	XE_WARN_ON(!last_op && last && !list_empty(&vops->list));
> -
> -	if (!last_op)
> -		return 0;
> -
> -	if (last) {
> -		last_op->flags |=3D XE_VMA_OP_LAST;
> -		last_op->num_syncs =3D num_syncs;
> -		last_op->syncs =3D syncs;
> -	}
> -
>  	return 0;
>  }
>=20
> -static struct dma_fence *op_execute(struct xe_vm *vm, struct xe_vma *vma=
,
> -				    struct xe_vma_op *op)
> -{
> -	struct dma_fence *fence =3D NULL;
> -
> -	lockdep_assert_held(&vm->lock);
> -	xe_vm_assert_held(vm);
> -	xe_bo_assert_held(xe_vma_bo(vma));
> -
> -	switch (op->base.op) {
> -	case DRM_GPUVA_OP_MAP:
> -		/* FIXME: Override vma->tile_mask for page faults */
> -		fence =3D xe_vm_bind(vm, vma, op->q, xe_vma_bo(vma),
> -				   op->syncs, op->num_syncs,
> -				   op->map.immediate,
> -				   op->tile_mask,
> -				   op->flags & XE_VMA_OP_FIRST,
> -				   op->flags & XE_VMA_OP_LAST);
> -		break;
> -	case DRM_GPUVA_OP_REMAP:
> -	{
> -		bool prev =3D !!op->remap.prev;
> -		bool next =3D !!op->remap.next;
> -
> -		if (!op->remap.unmap_done) {
> -			if (prev || next)
> -				vma->gpuva.flags |=3D XE_VMA_FIRST_REBIND;
> -			fence =3D xe_vm_unbind(vm, vma, op->q, op->syncs,
> -					     op->num_syncs,
> -					     op->flags & XE_VMA_OP_FIRST,
> -					     op->flags & XE_VMA_OP_LAST &&
> -					     !prev && !next);
> -			if (IS_ERR(fence))
> -				break;
> -			op->remap.unmap_done =3D true;
> -		}
> -
> -		if (prev) {
> -			op->remap.prev->gpuva.flags |=3D XE_VMA_LAST_REBIND;
> -			dma_fence_put(fence);
> -			fence =3D xe_vm_bind(vm, op->remap.prev, op->q,
> -					   xe_vma_bo(op->remap.prev), op-
> >syncs,
> -					   op->num_syncs, op->remap.prev-
> >tile_mask,
> -					   true, false,
> -					   op->flags & XE_VMA_OP_LAST
> && !next);
> -			op->remap.prev->gpuva.flags &=3D
> ~XE_VMA_LAST_REBIND;
> -			if (IS_ERR(fence))
> -				break;
> -			op->remap.prev =3D NULL;
> -		}
> -
> -		if (next) {
> -			op->remap.next->gpuva.flags |=3D XE_VMA_LAST_REBIND;
> -			dma_fence_put(fence);
> -			fence =3D xe_vm_bind(vm, op->remap.next, op->q,
> -					   xe_vma_bo(op->remap.next),
> -					   op->syncs, op->num_syncs,
> -					   op->remap.next->tile_mask, true, false,
> -					   op->flags & XE_VMA_OP_LAST);
> -			op->remap.next->gpuva.flags &=3D
> ~XE_VMA_LAST_REBIND;
> -			if (IS_ERR(fence))
> -				break;
> -			op->remap.next =3D NULL;
> -		}
> -
> -		break;
> -	}
> -	case DRM_GPUVA_OP_UNMAP:
> -		fence =3D xe_vm_unbind(vm, vma, op->q, op->syncs,
> -				     op->num_syncs, op->flags &
> XE_VMA_OP_FIRST,
> -				     op->flags & XE_VMA_OP_LAST);
> -		break;
> -	case DRM_GPUVA_OP_PREFETCH:
> -		fence =3D xe_vm_prefetch(vm, vma, op->q, op->syncs, op-
> >num_syncs,
> -				       op->flags & XE_VMA_OP_FIRST,
> -				       op->flags & XE_VMA_OP_LAST);
> -		break;
> -	default:
> -		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> -	}
> -
> -	if (IS_ERR(fence))
> -		trace_xe_vma_fail(vma);
> -
> -	return fence;
> -}
> -
> -static struct dma_fence *
> -__xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
> -		    struct xe_vma_op *op)
> -{
> -	struct dma_fence *fence;
> -	int err;
> -
> -retry_userptr:
> -	fence =3D op_execute(vm, vma, op);
> -	if (IS_ERR(fence) && PTR_ERR(fence) =3D=3D -EAGAIN) {
> -		lockdep_assert_held(&vm->lock);
> -
> -		if (op->base.op =3D=3D DRM_GPUVA_OP_REMAP) {
> -			if (!op->remap.unmap_done)
> -				vma =3D gpuva_to_vma(op->base.remap.unmap-
> >va);
> -			else if (op->remap.prev)
> -				vma =3D op->remap.prev;
> -			else
> -				vma =3D op->remap.next;
> -		}
> -
> -		if (xe_vma_is_userptr(vma)) {
> -			err =3D xe_vma_userptr_pin_pages(to_userptr_vma(vma));
> -			if (!err)
> -				goto retry_userptr;
> -
> -			fence =3D ERR_PTR(err);
> -			trace_xe_vma_fail(vma);
> -		}
> -	}
> -
> -	return fence;
> -}
> -
> -static struct dma_fence *
> -xe_vma_op_execute(struct xe_vm *vm, struct xe_vma_op *op)
> -{
> -	struct dma_fence *fence =3D ERR_PTR(-ENOMEM);
> -
> -	lockdep_assert_held(&vm->lock);
> -
> -	switch (op->base.op) {
> -	case DRM_GPUVA_OP_MAP:
> -		fence =3D __xe_vma_op_execute(vm, op->map.vma, op);
> -		break;
> -	case DRM_GPUVA_OP_REMAP:
> -	{
> -		struct xe_vma *vma;
> -
> -		if (!op->remap.unmap_done)
> -			vma =3D gpuva_to_vma(op->base.remap.unmap->va);
> -		else if (op->remap.prev)
> -			vma =3D op->remap.prev;
> -		else
> -			vma =3D op->remap.next;
> -
> -		fence =3D __xe_vma_op_execute(vm, vma, op);
> -		break;
> -	}
> -	case DRM_GPUVA_OP_UNMAP:
> -		fence =3D __xe_vma_op_execute(vm, gpuva_to_vma(op-
> >base.unmap.va),
> -					    op);
> -		break;
> -	case DRM_GPUVA_OP_PREFETCH:
> -		fence =3D __xe_vma_op_execute(vm,
> -					    gpuva_to_vma(op->base.prefetch.va),
> -					    op);
> -		break;
> -	default:
> -		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> -	}
> -
> -	return fence;
> -}
> -
>  static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
>  			     bool post_commit, bool prev_post_commit,
>  			     bool next_post_commit)
> @@ -2837,6 +2474,32 @@ static int vm_bind_ioctl_ops_lock(struct drm_exec
> *exec,
>  	return 0;
>  }
>=20
> +static int vm_ops_setup_tile_args(struct xe_vm *vm, struct xe_vma_ops *v=
ops)
> +{
> +	struct xe_exec_queue *q =3D vops->q;
> +	struct xe_tile *tile;
> +	int number_tiles =3D 0;
> +	u8 id;
> +
> +	for_each_tile(tile, vm->xe, id) {
> +		if (vops->pt_update_ops[id].num_ops)
> +			++number_tiles;
> +
> +		if (vops->pt_update_ops[id].q)
> +			continue;
> +
> +		if (q) {
> +			vops->pt_update_ops[id].q =3D q;
> +			if (vm->pt_root[id] && !list_empty(&q->multi_gt_list))
> +				q =3D list_next_entry(q, multi_gt_list);
> +		} else {
> +			vops->pt_update_ops[id].q =3D vm->q[id];
> +		}
> +	}
> +
> +	return number_tiles;
> +}
> +
>  /**
>   * xe_vm_ops_execute() - Execute VMA ops
>   * @vm: The VM.
> @@ -2848,21 +2511,81 @@ static int vm_bind_ioctl_ops_lock(struct drm_exec
> *exec,
>   */
>  struct dma_fence *xe_vm_ops_execute(struct xe_vm *vm, struct xe_vma_ops
> *vops)
>  {
> -	struct xe_vma_op *op, *next;
> +	struct xe_tile *tile;
>  	struct dma_fence *fence =3D NULL;
> +	struct dma_fence **fences =3D NULL;
> +	struct dma_fence_array *cf =3D NULL;
> +	int number_tiles =3D 0, current_fence =3D 0, err;
> +	u8 id;
> +
> +	number_tiles =3D vm_ops_setup_tile_args(vm, vops);
> +	if (number_tiles =3D=3D 0)
> +		return ERR_PTR(-ENODATA);
> +
> +	if (number_tiles > 1) {
> +		fences =3D kmalloc_array(number_tiles, sizeof(*fences),
> +				       GFP_KERNEL);
> +		if (!fences)
> +			return ERR_PTR(-ENOMEM);
> +	}
> +
> +	for_each_tile(tile, vm->xe, id) {
> +		if (!vops->pt_update_ops[id].num_ops)
> +			continue;
>=20
> -	list_for_each_entry_safe(op, next, &vops->list, link) {
> -		if (!IS_ERR(fence)) {
> -			dma_fence_put(fence);
> -			fence =3D xe_vma_op_execute(vm, op);
> +		err =3D xe_pt_update_ops_prepare(tile, vops);
> +		if (err) {
> +			fence =3D ERR_PTR(err);
> +			goto err_out;
>  		}
> -		if (IS_ERR(fence)) {
> -			drm_warn(&vm->xe->drm, "VM op(%d) failed with %ld",
> -				 op->base.op, PTR_ERR(fence));
> -			fence =3D ERR_PTR(-ENOSPC);
> +	}
> +
> +	for_each_tile(tile, vm->xe, id) {
> +		if (!vops->pt_update_ops[id].num_ops)
> +			continue;
> +
> +		fence =3D xe_pt_update_ops_run(tile, vops);
> +		if (IS_ERR(fence))
> +			goto err_out;
> +
> +		if (fences)
> +			fences[current_fence++] =3D fence;
> +	}
> +
> +	if (fences) {
> +		cf =3D dma_fence_array_create(number_tiles, fences,
> +					    vm->composite_fence_ctx,
> +					    vm->composite_fence_seqno++,
> +					    false);
> +		if (!cf) {
> +			--vm->composite_fence_seqno;
> +			fence =3D ERR_PTR(-ENOMEM);
> +			goto err_out;
>  		}
> +		fence =3D &cf->base;
> +	}
> +
> +	for_each_tile(tile, vm->xe, id) {
> +		if (!vops->pt_update_ops[id].num_ops)
> +			continue;
> +
> +		xe_pt_update_ops_fini(tile, vops);
>  	}
>=20
> +	return fence;
> +
> +err_out:
> +	for_each_tile(tile, vm->xe, id) {
> +		if (!vops->pt_update_ops[id].num_ops)
> +			continue;
> +
> +		xe_pt_update_ops_abort(tile, vops);
> +	}
> +	while (current_fence)
> +		dma_fence_put(fences[--current_fence]);
> +	kfree(fences);
> +	kfree(cf);
> +
>  	return fence;
>  }
>=20
> @@ -2944,12 +2667,10 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm
> *vm,
>  		fence =3D xe_vm_ops_execute(vm, vops);
>  		if (IS_ERR(fence)) {
>  			err =3D PTR_ERR(fence);
> -			/* FIXME: Killing VM rather than proper error handling */
> -			xe_vm_kill(vm, false);
>  			goto unlock;
> -		} else {
> -			vm_bind_ioctl_ops_install_fences(vm, vops, fence);
>  		}
> +
> +		vm_bind_ioctl_ops_install_fences(vm, vops, fence);
>  	}
>=20
>  unlock:
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index b40160b1be01..8201ecb8f05a 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -262,9 +262,12 @@ static inline struct dma_resv *xe_vm_resv(struct xe_=
vm
> *vm)
>   */
>  #define xe_vm_assert_held(vm) dma_resv_assert_held(xe_vm_resv(vm))
>=20
> -void xe_vm_populate_dummy_rebind(struct xe_vm *vm, struct xe_vma *vma);
> +void xe_vm_populate_dummy_rebind(struct xe_vm *vm, struct xe_vma *vma,
> +				 u8 tile_mask);
>  struct dma_fence *xe_vm_ops_execute(struct xe_vm *vm, struct xe_vma_ops
> *vops);
>=20
> +void xe_vm_kill(struct xe_vm *vm, bool unlocked);
> +
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)
>  #define vm_dbg drm_dbg
>  #else
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> b/drivers/gpu/drm/xe/xe_vm_types.h
> index f5d740dcbba3..83cb13275904 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -166,29 +166,18 @@ struct xe_vma_op_prefetch {
>=20
>  /** enum xe_vma_op_flags - flags for VMA operation */
>  enum xe_vma_op_flags {
> -	/** @XE_VMA_OP_FIRST: first VMA operation for a set of syncs */
> -	XE_VMA_OP_FIRST			=3D BIT(0),
> -	/** @XE_VMA_OP_LAST: last VMA operation for a set of syncs */
> -	XE_VMA_OP_LAST			=3D BIT(1),
>  	/** @XE_VMA_OP_COMMITTED: VMA operation committed */
> -	XE_VMA_OP_COMMITTED		=3D BIT(2),
> +	XE_VMA_OP_COMMITTED		=3D BIT(0),
>  	/** @XE_VMA_OP_PREV_COMMITTED: Previous VMA operation
> committed */
> -	XE_VMA_OP_PREV_COMMITTED	=3D BIT(3),
> +	XE_VMA_OP_PREV_COMMITTED	=3D BIT(1),
>  	/** @XE_VMA_OP_NEXT_COMMITTED: Next VMA operation committed
> */
> -	XE_VMA_OP_NEXT_COMMITTED	=3D BIT(4),
> +	XE_VMA_OP_NEXT_COMMITTED	=3D BIT(2),
>  };
>=20
>  /** struct xe_vma_op - VMA operation */
>  struct xe_vma_op {
>  	/** @base: GPUVA base operation */
>  	struct drm_gpuva_op base;
> -	/** @q: exec queue for this operation */
> -	struct xe_exec_queue *q;
> -	/**
> -	 * @syncs: syncs for this operation, only used on first and last
> -	 * operation
> -	 */
> -	struct xe_sync_entry *syncs;
>  	/** @num_syncs: number of syncs */
>  	u32 num_syncs;
>  	/** @link: async operation link */
> @@ -214,19 +203,14 @@ struct xe_vma_ops {
>  	struct list_head list;
>  	/** @vm: VM */
>  	struct xe_vm *vm;
> -	/** @q: exec queue these operations */
> +	/** @q: exec queue for VMA operations */
>  	struct xe_exec_queue *q;
>  	/** @syncs: syncs these operation */
>  	struct xe_sync_entry *syncs;
>  	/** @num_syncs: number of syncs */
>  	u32 num_syncs;
>  	/** @pt_update_ops: page table update operations */
> -	struct {
> -		/** @ops: operations */
> -		struct xe_vm_pgtable_update_op *ops;
> -		/** @num_ops: number of operations */
> -		u32 num_ops;
> -	} pt_update_ops[XE_MAX_TILES_PER_DEVICE];
> +	struct xe_vm_pgtable_update_ops
> pt_update_ops[XE_MAX_TILES_PER_DEVICE];
>  };
>=20
>  struct xe_vm {
> @@ -283,9 +267,6 @@ struct xe_vm {
>  	 */
>  	struct list_head rebind_list;
>=20
> -	/** @rebind_fence: rebind fence from execbuf */
> -	struct dma_fence *rebind_fence;
> -
>  	/**
>  	 * @destroy_work: worker to destroy VM, needed as a dma_fence
> signaling
>  	 * from an irq context can be last put and the destroy needs to be able
> --
> 2.34.1

