Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5372C54E64
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 21:58:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BDC410E3F5;
	Mon, 25 Mar 2024 21:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TF6W5dda";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA42C10E60E
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 21:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711403897; x=1742939897;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=V+D6x7UV6T9/Bmz3LjmS3ylVyQ/SGS24K7kjygG6U6k=;
 b=TF6W5dda/AroksaOq/7qA733wOcUH92D0LJo6UCZKojrJCrfgs+iBwDG
 osOMNutPg7jtUsMbLZwSoQYrRbRq8YbqjEZoSSYRwt/QGsilPTOKj++YW
 7WEwxIVBT7ezYs8cGtC9CtvgLXr6ALy7Hi+g/F9UXkLcUlt5l/j+0kUSn
 zENBvNeg3DTgclJxuEcJceuqGr8+G4FbBuj6yBUS3sxYisXSY840eBBnp
 7xxsD7VnIoaWjOgrd6Is65CclRtkcylK/LGOHyNC8RkuwghvgiGRndVAA
 XRBaxkp1CcKmakq6u1bhuZQ5l9gJ6S6kQvbWjiZsEU7Ym+FriASKj7RBX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6294147"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="6294147"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 14:58:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; d="scan'208";a="20440186"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 14:58:14 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 14:58:13 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 14:58:12 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 14:58:12 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 14:58:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ECJvF2uF7YDrGlHBdSMy2gSEB5iOQ/W1YatqsBuvOifDxOHhTE0dYlC6yZ5bWzosCrgkwcvEqFWi0lcZbWqYy9zN4SMYitOSoReSta17RziWBlH0gwgCKl+UNZEUkGENiKhhrse+EfPmyXkWROInXYSQ6h+QbkjEe7oX51JIzFY0U38jFZVkU/8WkWpMsz7Tf5kT0AkW9DoNvYtrlACKOsJg2Ei3m4GeCKMXmywb2PVvkJtj8WkedKB55Zbo4q1UCtX/EacxSlsCJ6CsNDLxgWZzYl3l74p6kCwsZHUlxHbPey7Hjfit6NCCSvDOfb/pf9gftDGVsM5QYCANIOZQiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hr0i8JtJTr2vYeVAmQqlB+11k8HtqRehbDLzefZH+bY=;
 b=b+RTaFhB9DstU9o6nSBOQmvMDvR3yy+ZIagTwUDDqkGENZa/HJM+Tm/w5HSE/7pfc6tNhdsEB3sKN7euLdtglDtE4tBA/NJIuM9m6gI1rSzGWCWOP6vwNieXGpAR/4k9LKfv3nPuXx4KvjkuIgVpG4uDcBMKXqcIdAs7nJWRBPjO3Ro1GqsaXg0aOb2b9Arrad6iM9JNDcLEOhtvpjdB+jHA+666zcYwV78B/q4PRNZAd7emhQKYAH4iN5588Kmn3uk17cDP9PG1MUb9vCuuHU6Am8J6MjSSyPkJlHZT8FjA1t25CUrKcR/O75IAZ3mhOZsu7GbMIhw6MmWYln/Y4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by CY5PR11MB6163.namprd11.prod.outlook.com (2603:10b6:930:28::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Mon, 25 Mar
 2024 21:58:10 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Mon, 25 Mar 2024
 21:58:10 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH v4 15/30] drm/xe: Add xe_vm_pgtable_update_op to xe_vma_ops
Thread-Topic: [PATCH v4 15/30] drm/xe: Add xe_vm_pgtable_update_op to
 xe_vma_ops
Thread-Index: AQHacRaqdlyQSmny9Uq76M3Z1UNMlrFJGgyw
Date: Mon, 25 Mar 2024 21:58:10 +0000
Message-ID: <SA1PR11MB6991BD0E93816DCB264C00DA92362@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
 <20240308050806.577176-16-matthew.brost@intel.com>
In-Reply-To: <20240308050806.577176-16-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|CY5PR11MB6163:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O27H2sRBfVFEdvLE72q1e8dJ7hhAjp+Mbkab0ATuG4gspZQ3sbnaoeXrjrrl8/EoMyodEjBBDqwtbXw48corYoKRQj9+tFBl7ZX73tVY4qT7pICv6XdNlkpglZjlMdXl7Qa2H5ikPpo+6vMuHRqMEfuGBg9/jK5lx5kQ3GCTVtZBlLORc6azJwY1t1VSf7H8bCANHoqtXKKiwjR3saIMpMyJ82DDOHXdOeS8QKKJstEzVG/PlSnN0mEFEtSKygszlu0IIOYgJeJUAUUVc926jUc9rhpe0AIQNitqs6KHHwd2eTcaWz4nntvYH7b/w2pt8Ii8/C3VnRfe8v63wwCpnNkP+0UtVyeudSAhb0hxaq4WxUJ/BuB31Zp5o7gsLJkASzuH7+VTV+tBB3mGvlkgtLXr51QlWB0uTflUHjSxRupXAQW7mff6xQdKezqnKrGhzN453eS+vRTouLeJewAZAFleDlGK7Njf6W8gPvrS4dHnFBNhwcX3qK4v7XOXNJ8aNyDOZyaReBmmcFp4Ms5sLCVV6uL8FeOCYd+Wuzz8NOBDub8+PxNN2dzyFFh+sKrYd15iYqVLSAoyQ9QXwY4dqa8ylLTjfrqFlEZ4lKuELa3YcF/8fm0qkt7CdteV4k4wDdkNtP+IMmPWRjNjI4Noxr1FPkyV42BnxPrTXG5yXLo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Z6gWvQ9939Y3eD8zAf5mF9IQxIZfSn95jwxtjZ4F1xSZJKSWS9BMHCa3Yg/U?=
 =?us-ascii?Q?c/Ep76RM/p+WSAlrgpO7U2vrzIbvSd2gyBLylU9u14u3fkqY4KFbEzoTdL45?=
 =?us-ascii?Q?x/803QCuECP4tsn8qRsVIqf7M5vjqgTe7oIcZeWIpVOKVHl+xy/KbMQZDU7F?=
 =?us-ascii?Q?GN87gXf2TS/Z0qUdIAqgGJNQZEyzuMR7UKRcVz954TV63dbW00s5zMgZS/wE?=
 =?us-ascii?Q?mN/uHWN+D2EnfZpj6BBd0zuNMxTwW6fcmWcvU9lqCJ1M/nxuZkdNLBrQ2LhY?=
 =?us-ascii?Q?8aE0IPSMy9a2yNfzPy561HTFGVSlydL5HCJDuAxUgk/cvy/PG2JT2AWXDfKK?=
 =?us-ascii?Q?LXnOVOgF5lDLsl7Y9CWaCIq/Uv8gTtL2gWokTX5M3MKJskqJafFjOTVKMtTH?=
 =?us-ascii?Q?2b4lBJzKqCUH/Nsxb8bJBuGFB8fPL2SsCUPG2eEKmgu1klaf+0qr5tkTzNKM?=
 =?us-ascii?Q?O0ZH1Xgw1ywCxZp36wsyF107rZPpgMocp3W1mAyNY0DkydreYRC+2r56MDsr?=
 =?us-ascii?Q?a4hivxxlhvnSz+uTaa3WkdsJW2/TnBxURyGj214XoXiIc99ZNwJ8Hm+KL8I2?=
 =?us-ascii?Q?mUdF+Lip2E8kU0V7JnXnzWMGY7mVlerLA6EBQSeSOcMEOYgU1++xtfPd/o/7?=
 =?us-ascii?Q?yEcz+qQWg7KdQMCkCy+BvAxF74XUoadja1lmeb4eaDZiFrKQJuhqIpOSjwVs?=
 =?us-ascii?Q?ueLkZn5pTJ0zgN7mP5p+G8P1KOKiCSgePW65qkA3XA3LnEc2Sgy4LTv0bpnU?=
 =?us-ascii?Q?W8RqmuMb/4VC1MiuaJ/zaepNAIL+rJ9bmxqapAwcX6YPDjiHeqe4DPAOxPG1?=
 =?us-ascii?Q?OzcEDRIa4ADZHPu/A/s3hdk7t1z1CLrGobBkvLAWoyjtLRw5dDNJqrBVYScA?=
 =?us-ascii?Q?EVQzVYjZR7324edhEUei6NNS5ZaKpBIDGYrW7978yfUIQ+vd311yrlaaM+zw?=
 =?us-ascii?Q?80trDNVm+O/zZvWJOMtMYwFPnlkor5Nlo3FeyYuL4BwBoKDGnJJG0jchn3FA?=
 =?us-ascii?Q?lSLCTeNRQ27twEeISw+YIqX5GY9igGvsk1sj1jVPG9V8z0+eTo6snSSnmSIs?=
 =?us-ascii?Q?pS9bLZDaJBaEsZcLuOh1mXAWCNrL9hQFVM80/x6w0LozUz55OmlCgANw2Zps?=
 =?us-ascii?Q?NXlKOYww9NZbM/QzQBB3U427rl8CbexBqM82wTVfA8RyKSEAYPD3wnH44zvx?=
 =?us-ascii?Q?SBSyURHn0eJcEuSRnLlWTDl1xG71s3YJekR7kHsisDcsXrVhVv2+EX+RCnxU?=
 =?us-ascii?Q?FGckzy41oOYsrB923eFcSHKttOeYaVArNbUhqioobSq3lVOfkDlcYsZCh+Lg?=
 =?us-ascii?Q?yxY6rMLfSfdfbrJV+2/wyRM396Tw0l5P1Y4D8QRSYVWiSN8ETRHrjHNVfCJh?=
 =?us-ascii?Q?wJD45RergGya/WE3hgWUy1S+4WhcfzR89FYQ7d+Jw7zo/U7E5uAaExvlpSMM?=
 =?us-ascii?Q?yi12heDS8g39WiCnAENyjSNOHiC+J9cjXy303ne+IM/r+5X//3zJQrQ5S1ez?=
 =?us-ascii?Q?HBvYrOlGBeGPWA4DjmMZwDgUMlY6t4roTToTE1rzoA7jZN+R69LXS+FpKVWx?=
 =?us-ascii?Q?w9W9OT3QH4s2/uXvqErIVt/GRudEmX76uRPofktT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ef1d55d-b038-4331-b8ac-08dc4d16a982
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2024 21:58:10.8259 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ertJqTLLYbSYR5Vgq3lJmSgx5HjQ2PbKUiY8hghflFkxzb5eigUfLBKa4lg9e6On2FwQyI9hZI4FTLufA5bXIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6163
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
> Subject: [PATCH v4 15/30] drm/xe: Add xe_vm_pgtable_update_op to
> xe_vma_ops
>=20
> Will help with the converstion to 1 job per VM bind IOCTL. Allocation
> only implemented in this patch.


Can you explain why you need to introduce pt_update_op? this patch seems on=
ly allocate some slot for pt_update_op but they are not really used for pag=
e table update. I will keep looking the rest of this series.=20

I also don't get why this helps 1job/bind ioctl.


Oak

>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt_types.h | 12 ++++++
>  drivers/gpu/drm/xe/xe_vm.c       | 66 +++++++++++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_vm_types.h |  8 ++++
>  3 files changed, 81 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pt_types.h
> b/drivers/gpu/drm/xe/xe_pt_types.h
> index cee70cb0f014..2093150f461e 100644
> --- a/drivers/gpu/drm/xe/xe_pt_types.h
> +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> @@ -74,4 +74,16 @@ struct xe_vm_pgtable_update {
>  	u32 flags;
>  };
>=20
> +/** struct xe_vm_pgtable_update_op - Page table update operation */
> +struct xe_vm_pgtable_update_op {
> +	/** @entries: entries to update for this operation */
> +	struct xe_vm_pgtable_update entries[XE_VM_MAX_LEVEL * 2 + 1];
> +	/** @num_entries: number of entries for this update operation */
> +	u32 num_entries;
> +	/** @bind: is a bind */
> +	bool bind;
> +	/** @rebind: is a rebind */
> +	bool rebind;
> +};
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 5b93c71fc5e9..72e9bdab79d5 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1319,6 +1319,42 @@ static void xe_vma_ops_init(struct xe_vma_ops *vop=
s,
> struct xe_vm *vm,
>  	vops->num_syncs =3D num_syncs;
>  }
>=20
> +static int xe_vma_ops_alloc(struct xe_vma_ops *vops)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < XE_MAX_TILES_PER_DEVICE; ++i) {
> +		if (!vops->pt_update_ops[i].num_ops)
> +			continue;
> +
> +		vops->pt_update_ops[i].ops =3D
> +			kmalloc_array(vops->pt_update_ops[i].num_ops,
> +				      sizeof(*vops->pt_update_ops[i].ops),
> +				      GFP_KERNEL);
> +		if (!vops->pt_update_ops[i].ops)
> +			return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
> +static void xe_vma_ops_fini(struct xe_vma_ops *vops)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
> +		kfree(vops->pt_update_ops[i].ops);
> +}
> +
> +static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops, u8
> tile_mask)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
> +		if (BIT(i) & tile_mask)
> +			++vops->pt_update_ops[i].num_ops;
> +}
> +
>  struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  {
>  	struct drm_gem_object *vm_resv_obj;
> @@ -1343,6 +1379,11 @@ struct xe_vm *xe_vm_create(struct xe_device *xe,
> u32 flags)
>  	xe_vma_ops_init(&vm->dummy_ops.vops, vm, NULL, NULL, 0);
>  	INIT_LIST_HEAD(&vm->dummy_ops.op.link);
>  	list_add(&vm->dummy_ops.op.link, &vm->dummy_ops.vops.list);
> +	for (id =3D 0; id < XE_MAX_TILES_PER_DEVICE; ++id)
> +		vm->dummy_ops.vops.pt_update_ops[id].num_ops =3D 1;
> +	err =3D xe_vma_ops_alloc(&vm->dummy_ops.vops);
> +	if (err)
> +		goto err_free;
>=20
>  	INIT_LIST_HEAD(&vm->rebind_list);
>=20
> @@ -1468,12 +1509,14 @@ struct xe_vm *xe_vm_create(struct xe_device *xe,
> u32 flags)
>  	return ERR_PTR(err);
>=20
>  err_no_resv:
> -	mutex_destroy(&vm->snap_mutex);
> +	if (!(flags & XE_VM_FLAG_MIGRATION))
> +		xe_device_mem_access_put(xe);
>  	for_each_tile(tile, xe, id)
>  		xe_range_fence_tree_fini(&vm->rftree[id]);
> +err_free:
> +	mutex_destroy(&vm->snap_mutex);
> +	xe_vma_ops_fini(&vm->dummy_ops.vops);
>  	kfree(vm);
> -	if (!(flags & XE_VM_FLAG_MIGRATION))
> -		xe_device_mem_access_put(xe);
>  	return ERR_PTR(err);
>  }
>=20
> @@ -1611,6 +1654,7 @@ static void vm_destroy_work_func(struct work_struct
> *w)
>=20
>  	trace_xe_vm_free(vm);
>  	dma_fence_put(vm->rebind_fence);
> +	xe_vma_ops_fini(&vm->dummy_ops.vops);
>  	kfree(vm);
>  }
>=20
> @@ -2284,7 +2328,6 @@ static int xe_vma_op_commit(struct xe_vm *vm, struc=
t
> xe_vma_op *op)
>  	return err;
>  }
>=20
> -
>  static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queu=
e *q,
>  				   struct drm_gpuva_ops *ops,
>  				   struct xe_sync_entry *syncs, u32 num_syncs,
> @@ -2334,6 +2377,9 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm=
,
> struct xe_exec_queue *q,
>  				return PTR_ERR(vma);
>=20
>  			op->map.vma =3D vma;
> +			if (op->map.immediate || !xe_vm_in_fault_mode(vm))
> +				xe_vma_ops_incr_pt_update_ops(vops,
> +							      op->tile_mask);
>  			break;
>  		}
>  		case DRM_GPUVA_OP_REMAP:
> @@ -2378,6 +2424,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm=
,
> struct xe_exec_queue *q,
>  					vm_dbg(&xe->drm, "REMAP:SKIP_PREV:
> addr=3D0x%016llx, range=3D0x%016llx",
>  					       (ULL)op->remap.start,
>  					       (ULL)op->remap.range);
> +				} else {
> +					xe_vma_ops_incr_pt_update_ops(vops,
> op->tile_mask);
>  				}
>  			}
>=20
> @@ -2414,13 +2462,16 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm
> *vm, struct xe_exec_queue *q,
>  					vm_dbg(&xe->drm, "REMAP:SKIP_NEXT:
> addr=3D0x%016llx, range=3D0x%016llx",
>  					       (ULL)op->remap.start,
>  					       (ULL)op->remap.range);
> +				} else {
> +					xe_vma_ops_incr_pt_update_ops(vops,
> op->tile_mask);
>  				}
>  			}
> +			xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
>  			break;
>  		}
>  		case DRM_GPUVA_OP_UNMAP:
>  		case DRM_GPUVA_OP_PREFETCH:
> -			/* Nothing to do */
> +			xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
>  			break;
>  		default:
>  			drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> @@ -3243,11 +3294,16 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void
> *data, struct drm_file *file)
>  		goto unwind_ops;
>  	}
>=20
> +	err =3D xe_vma_ops_alloc(&vops);
> +	if (err)
> +		goto unwind_ops;
> +
>  	err =3D vm_bind_ioctl_ops_execute(vm, &vops);
>=20
>  unwind_ops:
>  	if (err && err !=3D -ENODATA)
>  		vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
> +	xe_vma_ops_fini(&vops);
>  	for (i =3D args->num_binds - 1; i >=3D 0; --i)
>  		if (ops[i])
>  			drm_gpuva_ops_free(&vm->gpuvm, ops[i]);
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> b/drivers/gpu/drm/xe/xe_vm_types.h
> index f6ea4df64e79..f5d740dcbba3 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -22,6 +22,7 @@ struct xe_device;
>  struct xe_sync_entry;
>  struct xe_user_fence;
>  struct xe_vm;
> +struct xe_vm_pgtable_update_op;
>=20
>  #define XE_VMA_READ_ONLY	DRM_GPUVA_USERBITS
>  #define XE_VMA_DESTROYED	(DRM_GPUVA_USERBITS << 1)
> @@ -219,6 +220,13 @@ struct xe_vma_ops {
>  	struct xe_sync_entry *syncs;
>  	/** @num_syncs: number of syncs */
>  	u32 num_syncs;
> +	/** @pt_update_ops: page table update operations */
> +	struct {
> +		/** @ops: operations */
> +		struct xe_vm_pgtable_update_op *ops;
> +		/** @num_ops: number of operations */
> +		u32 num_ops;
> +	} pt_update_ops[XE_MAX_TILES_PER_DEVICE];
>  };
>=20
>  struct xe_vm {
> --
> 2.34.1

