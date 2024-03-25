Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4415AC54E58
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 16:10:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD7010E55C;
	Mon, 25 Mar 2024 16:10:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zqws3W4P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A9710E9A1
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 16:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711383047; x=1742919047;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6K/CPwZoW6z2dMO6Gq169qm9u688Ge5k+ofh5K7YceY=;
 b=Zqws3W4PZanwlGjJcZ8it28xdQWpY/JYPrzvYqPjjrEvrgri5wFf3jXV
 FZTzIFSiL+dvGqUfLzKGO4XT3ZCR0O+ZEJWYTR/lp3cWW0PfiBfI43800
 +dHOM/iudWpcJ2uKpBXqpnKEEHmEadctgHLbvLhZds/83CL7qT6AU0MMf
 ntJ/5T+tTVlqGq8q7pt6EYIBtGmze3zZm8nZ82qYEacfFmel/7bNIwSg+
 fwRPGPem77/gBoY7PkOQ+pXAa873ptWR4Eu1gB9DeCXMVJwOq1LmCwR+Q
 EO+k6/TUOkzK6v7c2pcbN+GxfgP9OUOnZN8/XG1QV3KDX5X0pbFXJqJ/y g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6578414"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="6578414"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 09:10:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="53138302"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 09:10:46 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 09:10:46 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 09:10:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 09:10:45 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 09:10:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g7ZQsob2gqksil9X+I1xisx5dVmWLmpY+aFEzTI9niR64CGthXU8cbX46tq0TVm1UgSIgwArVpW+dZmui//osgw6XCX8xcFJH9BOhLMtJuC13upNrrtuxy9pKQFwvgAA/Aaagb2hb0S8ZEsROYfUXzyk/cylP0Po481101qZmyEi0GjPvXIKVd6l4ialcvLBcjDmHszSHY3fOwzmJTAu9ZMXfXrF1c1bHUj41zAHkQkXlWj3XVlkS4ghSeU9aV1q2RIMb3KRR+rfhf+ihQYQRPZ/1rtn5aHm8S6G2QgAmE+Y60KcX8n1McHyAoI4C/NruRtbAeXcxupxY1kugWp0gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r++V4qa1Lsy0Yvaom1a2tXTrVdf/XEq5tYDu2HzttRc=;
 b=LgJZGeqFF1GzFr4DuZqyiB2kGAg8uOsEhoG6DIQG1E1kG/8DOQ3mytYREPJu2mcM/Wkc/efuvjTFTgrm48hzEvIPSINkhDF2L/TKnvACDvaPOjsz+8RtaJUKq0T8MAhmzssiKJZ+Gxmtds9qZYcsMxT5zcrWTDk8YBrjJhFNETCi5lgXzOPhwX0cu3OLeMW0uGH1u1Qncltr0z01TvhFuvE9cmH8dYBDKjJExu0Z+ZSVl6Xye5zGPc6wtzf/K78G/TL3XULFdvild6aRqFmc35DZrLi2YHYFWiWsxgRReHe7SUh1TZ5/rpb73qXssgIDyYu7uJ5XrLt4d2201T505A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by CY5PR11MB6462.namprd11.prod.outlook.com (2603:10b6:930:32::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 16:10:43 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Mon, 25 Mar 2024
 16:10:43 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH v4 09/30] drm/xe: Add some members to xe_vma_ops
Thread-Topic: [PATCH v4 09/30] drm/xe: Add some members to xe_vma_ops
Thread-Index: AQHacRahYoRPFvmMsUe+fE9+2rJ/2bFIu3rw
Date: Mon, 25 Mar 2024 16:10:43 +0000
Message-ID: <SA1PR11MB6991A089E5EED8337D6F26EE92362@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
 <20240308050806.577176-10-matthew.brost@intel.com>
In-Reply-To: <20240308050806.577176-10-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|CY5PR11MB6462:EE_
x-ms-office365-filtering-correlation-id: 1ae1c0f7-0258-4325-e7b5-08dc4ce61f75
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 82j/D99c7hIoOWD12clQgaFvKgZT2dORi09wAqd7gCqgTzZsjm27Y9JWWKie2AmKcDVTwsNtniOfolpAxlIGRnLHLAjYASqbb19dr4QF4QtFKPk0sS8CwEFW7nvwfMddcQsYKyO+iqAOxttwAoXVUZa5lPBPqvN+YQA5xnBKKGa4zLtuWWa14N2oOGdt6tfedQcnsRZ+f2qQYiVktHZY0n72lL6N9uR6Bf65yd//xZ9ol9MqbMcGjFZdIHVH0h2ZrKXdCyIX8in67koEIJ7gmYcEXtc5sAYMmDgH15KtJpKEuOR23+QYasurWCLpZrJOKwdywxFIK2tFexUxrNP4kKNxbhnfsgdP9gYQ2yqqfkZ5k783C8VIfB4Z1QT1fGfkEg9Q7ZhgZvS3AL3KWxVBxJfBy6mNbxa2TsNuYY/qw9Wq6A5Rwe/HLdCvXYE4oFhs1fDTJFFysNQUDGthyzdYf9SrS+cOyMr+21+Pl7WqtQtQCUCMpnWncS82gwTx7I+tGwuf000ftxFGy+XhRIQe8WvfSwlg3hfOcNc29RLxqs9x/CEiCphxSYtSOE7Dk9XApuzD8rrC9nMd7ETfGJYzVe09RyQaXKfAshkiLxu4Sws1ryfokcVFH0h4GzAgR2OdlQyPLJz7cTVBGkBhSaIryV4b4zxUb6RhxlVEEePhGaH+oEmoVxLaHDX/C7EZrcUa+TTBBi9RZjUdsthc83NLDEWs/fgrDQA6lTM/SV6iZQY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TWL71d/jS0VvmO5su4Obk8CYsBYww0uzrCw0pPCL8JWRKB1WOAUfDpCdHj4K?=
 =?us-ascii?Q?xjSikWFzV0OX/PfE6emfBBgg3sfZYox6zmCNCm75M8F9bhD5OMo+cEzTZ5/e?=
 =?us-ascii?Q?uwZ7aAMIjxuMXJiuKxYjeoq+BetGzNWirP2Mw3Y2LfKS4UPtY46OrNa02G+1?=
 =?us-ascii?Q?seD9O46bjxbyxcgHHVTQmgnBdCqOB8zw9xQWJU6TcIAItATcpXxgMHqErHUB?=
 =?us-ascii?Q?qTItN9bMF8EgDWTbxrqD051d1/pXslbBBL/iTJM3v3VJ5l9z9hkr2+CcjIFK?=
 =?us-ascii?Q?hLUNqdgNFFlUTuxHHNlxbwOfx3/iMPo7J6gSkp9gvCk/RFIRHN9/RppxKPD2?=
 =?us-ascii?Q?eRV5GIASEDCDYA7154YuuQtTQhF1OSU4Hm2BLdwfMznVnUG8QPr40GuEwCs1?=
 =?us-ascii?Q?y2pT1EhHIHzvk23QhKKe2aGxOjOyN7VlcvUgtVsv5nuftBGDwgOD8/DjQsLA?=
 =?us-ascii?Q?Tlq6XzQztGOV2nEDF+4IaQNhwpdrcfPBWrg/H96BbYO5v0aj3j6T5CI9n3Q6?=
 =?us-ascii?Q?acK5Eo0EKH8YlhFEoPfDz4TjrUNXP7Rt4jVfvQquZIG3XfkTNsb+Fgn291cf?=
 =?us-ascii?Q?PxnH55XgdGlLXd6e6CPGIYB+HPVnD4utXPtAxp/ZS0f9PVFIIk+ThXD49/IS?=
 =?us-ascii?Q?S5tSEsBcEA0tM40Txxi3MK8xdI4v8PhXSIcyP67yKuvObhKguIqDUhfBBw7O?=
 =?us-ascii?Q?HbD946/p/23LvIoRR0peAgbFAtL1H4emEY29ztKyvPsSqTnxugtsatdDMvqc?=
 =?us-ascii?Q?YAxqKa1E8BQfBnBhKhgHprNkZ7JJvWb6cw0rX2bd4wnANeenk+1Jld/hvwgl?=
 =?us-ascii?Q?9uwXCxETnbOjQiDMhxIIAPvwkztPgN4j0VPn6yjh1QHmZdQ8YbKf3uBE/siu?=
 =?us-ascii?Q?dcXmZP7TsFV9WSCt8IOmoVSWm8E6qOY7KRkxbp293DTgcsqtwcTwPZZP8shd?=
 =?us-ascii?Q?ZExf2DwbZ7cRVVJ+dHYd0S2UlBCd+cMAtfb0qBTcM/4B8n19BOQyuiwGQVg8?=
 =?us-ascii?Q?p4cydsFrsVyd+MF1ROzRzetmI3gbACtK7M/YwP3w52ijO9E8ZftCYoj5OkAB?=
 =?us-ascii?Q?qBCVCKp5LfXc4OLLN0PlFCj35gY90UN3YmaOks1xa178ExtrYtNJfexongID?=
 =?us-ascii?Q?zPfI6P0bTfNloM0+qimSeMr0g+cBu20UOiTHRv5WqlfP3IEsRUT5fOl51NCK?=
 =?us-ascii?Q?G0Z7gsWWTIjEVhN8y3909bx0hlBihX6KeAwrDVo6sBz5cvwB7vZByRCGfmgP?=
 =?us-ascii?Q?GPTFstecSATSyJH1zHfDPT2QwDMBCik4RElr+6Bs7rY7gIdQBtXPSmxNrvtY?=
 =?us-ascii?Q?MXb4Dq2m3GFsA/s8h2XRWGBD1PDN+eCjfecQnMzd1ZzCMI7hTWMeiZdnsrLD?=
 =?us-ascii?Q?GCQYo/MdftAZE3B7xoB2skMBU7BGTfZNS9Ng89KvhkTe9tsZPwAyNnXEq64B?=
 =?us-ascii?Q?q/V31lUvZ4cJkscXu4CUfDltFYINDUBvdye2auHIyoKVeYR71OZroSii3Dbu?=
 =?us-ascii?Q?g6RhNxi26a5ZmL03wpbJpLR4m88PGm6MASwTbIQEyH7a/yEI9BFduXZcybPD?=
 =?us-ascii?Q?tS8JJ1fC9bPPPpvx+Zc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ae1c0f7-0258-4325-e7b5-08dc4ce61f75
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2024 16:10:43.3399 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CnunJxh3iLYDtAbHh+Pvq0cIk2wMfLZgroSTYMudLQmv2haDzRNRaOkOvstQq1DTsh4Q2Hz5KDM9LQUeh6QTgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6462
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
> Subject: [PATCH v4 09/30] drm/xe: Add some members to xe_vma_ops
>=20
> This will help with moving to single jobs for many bind operations.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c       | 13 ++++++++++---
>  drivers/gpu/drm/xe/xe_vm_types.h |  8 ++++++++
>  2 files changed, 18 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index a6bae2f5e296..f8b27746e5a7 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1307,9 +1307,16 @@ static void xe_vm_free_scratch(struct xe_vm *vm)
>  	}
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
>  struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
> @@ -1333,7 +1340,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u3=
2
> flags)
>  	init_rwsem(&vm->lock);
>  	mutex_init(&vm->snap_mutex);
>=20
> -	xe_vma_ops_init(&vm->dummy_ops.vops);
> +	xe_vma_ops_init(&vm->dummy_ops.vops, vm, NULL, NULL, 0);


You mentioned in previous review, that vm->dummy_ops will be dropped... I g=
uess this line will also be dropped.

Otherwise, this patch looks good to me.

Oak

>  	INIT_LIST_HEAD(&vm->dummy_ops.op.link);
>  	list_add(&vm->dummy_ops.op.link, &vm->dummy_ops.vops.list);
>=20
> @@ -3176,7 +3183,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void
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
> index 0bba5543ac28..f6ea4df64e79 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -211,6 +211,14 @@ struct xe_vma_op {
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
>  struct xe_vm {
> --
> 2.34.1

