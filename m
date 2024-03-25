Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B53C54E64
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 20:54:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD11710E902;
	Mon, 25 Mar 2024 20:54:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B3gwAxpG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF81C10E975
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 20:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711400088; x=1742936088;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZHa/pnFtrIdFx5NnfkxcDI5f/GuSedrrTXMSrT7huzI=;
 b=B3gwAxpGkt4fiz3qhMyUJFox5yIoylU+DRSkK0sKW7R//rt4kL6mfuKn
 Fj64qerG7iXxP8tVsJhiptr4nJCrGDyW2m6zfA+IhkobLvt2ZExGNhog+
 dnXCoc9Q1cGd3XYOKRqJOfx0yHW2gc5SuDUFs0Uy+72DiXbAAUC00nvk/
 jwa2zgMIwC/N+xtWhJcReymU2z8D6WEvO1zS8YF60+hvJLRCQDo4GoL7N
 LPuq6waF3OpP5lXkWJfWXKjI0Y1ccnOVksTWTgcmw3abAKVP1wTKoabqm
 qUNYQPrA5AgqLdI4+DGZYNihtHv2xW9eZUzp26svj9z95n1jtmwRYLblT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6364393"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="6364393"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 13:54:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; d="scan'208";a="15703861"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 13:54:49 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 13:54:47 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 13:54:47 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 13:54:47 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 13:54:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X+YfrHjH019hJW5gPRFS7KgbJ9lbYVvLwNZke955/kMWGNmp9G6GBOEvu/iqVsUTbwepVmHaVuxAa5iCTiNopiMy6Z955v99slqdabzl7ShyMBtPFpXhsmZBozk5W9ZTcmIC97/5og3ghLdB+QB1A999MgwEfebbG+M7/cdCPfMcZtrDtypZY5zU7NcuA7M3GgHfQC+b7kOm2yYrgoq/o7puYJWmPmbI/aILLv+4zKNyXZhe4yqBMbG+F7bsLgv3kpuqZa27XJi0GW9YChV2/6IdmiRmDvkFnRAR0LO/JwXqX4BZMcAeQwN7ayNBfOxI2jDelEYJvxteDzwXqBwzDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gycTBWiixJ5uYUQXkVEJ31iwIgQrGQty/jV28JwI80o=;
 b=KMOujji0unrgmlvuBCmdFydZSEHCMCaSBfOW0nfrxPhitZr8xf6SD0+xO3jARAZPpN5Iw0H3Od8xY0JTkV+Ge44RI79AxldKdROTU+ebWbqvEWW1mPLQbaoTXQQmlPrTybkN5pUbyDJXxwKTiUUVmjiJ9l7qb2bLbMRDY3IlwnwEohGs3E+nn/Q9kJX0AYZE6WVC6NQ8Jm2cnI1rRx4O0lJMLvyw4pWbfxdR7oD6r6oTxsHE7cyegWQv4dt0qVuBaSJw05phaTkB6tDlpYhXJyzDRZJyEeNRhKqB9HcFJzWCHFnhabaouupDnpdgwUqEmGRWZFJiYOyWBKo32JmLzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by PH8PR11MB6855.namprd11.prod.outlook.com (2603:10b6:510:22c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 20:54:44 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Mon, 25 Mar 2024
 20:54:44 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH v4 13/30] drm/xe: Move ufence add to
 vm_bind_ioctl_ops_install_fences
Thread-Topic: [PATCH v4 13/30] drm/xe: Move ufence add to
 vm_bind_ioctl_ops_install_fences
Thread-Index: AQHacRarMl9lFUYHdUCbnWN/MknG6rFJCULQ
Date: Mon, 25 Mar 2024 20:54:44 +0000
Message-ID: <SA1PR11MB6991931E0535678F8640623F92362@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
 <20240308050806.577176-14-matthew.brost@intel.com>
In-Reply-To: <20240308050806.577176-14-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|PH8PR11MB6855:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9O3BPxOCWMxq7ULkMsT4nj5rvDKBSdfEV3wd4yWwzIP+sJ42+DWJB0vrWkIodKFKvSNw0frua0tdgCx826fjFGTr89vZ9AsFxMWVBWdGeN21+k/+FGbQnJU7g9ma6FVDD2JFnlM1BaCV/Y4q3J7mP9YYy9AhqU5rrdtKCbEB4bRk2kv1Hj9okkXsZ8fgSAplEcoWjW9FquEHnvi7KynBgyg42sqr0vXB+daJLU3BsiVOldyJ8MUwhh2jQKXtK2hJXDBhZHa2YbLfnItlhKf1tEGfyKwsUy++fqDUSsfJgLvS0aWrIWi4+Nm96Lwb6sY34K03MEV87vlgzKOc2Q/wZz88G0U0BM25uqkHtcZvIYp3Mt96eRa06RGBB8KmqeK7dTtD7NmIvhzgw9wb+2BskI8/7pq1aX9UEltGZ+Gu1HZU1cAR0BV0Qpsvdj4NCCDqmYhBgYmeP2NyEyLScpWNMzu3K953SWOwdb4IBUP7Esgr/uhZmMxX02PQ/x9/evCPDpnYzc1wTzwLXjpLX9qgw95ZAlate+rs90DbjXSayprRLADGrCBKrkwo3k7KKwpT2f153+1E5D5k9d+03/Hcro9KPm949k7iQMPFYCMU/lRgBF6+LaSeJkYuu+UlRgX3cOuknRPRESjfVwbondhFlg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?e/AybO+krbvWHCGvviFmPPNeXISWWAEl6pGL53HOlitIeYu2GfQY87fgwCX1?=
 =?us-ascii?Q?AGn08rra2JhBurkULbltelizx5EM53Hbb1qBcGUGLWM0jUnzy5x3bpde+FQh?=
 =?us-ascii?Q?kMZoTg798Esong2Nmy00oASD46O/ahF0jUzDbh7xn+FgfmKZ1kHu9JxZGGXF?=
 =?us-ascii?Q?SB3jWaNoI5J3J8O8lpVQk20wvtGjBvlNu4N3Jy/k8jJGZ+/HoT1O4tDRKx7C?=
 =?us-ascii?Q?PdhCrtzOEqc7cQRHNTu7zaofageDK+wqR6ho/QsZNgM2s32viMghLvbvRpXP?=
 =?us-ascii?Q?z6Qr6i50td+VrRs3HtFPdzhHT3RuNzXcvurWYuaM1XTZ1wfut6lIKROd/x35?=
 =?us-ascii?Q?N3evq/oiz21VyCkPBaHZF/Qtcn0aQS2mdh6y+jxvV31sme0aDPh5sSXvB9jK?=
 =?us-ascii?Q?YBVuLGTex2KsgBjAJYJ2hVobpYVtzeWGDbGuWBcaB+J0VvWQcmqCX+0XAoX8?=
 =?us-ascii?Q?yVEQ2jkKn36lAERdZwJk136W7HLytSPeJKa+E2oNUulvVCzGWAtU6CD3FhTQ?=
 =?us-ascii?Q?LDls4X8G7cxMThhpHe0wAZmWnP+gGSwjkkIQYJ4eqdnjpRhl9FLolQjWVX/G?=
 =?us-ascii?Q?xKcdnweb2Ri0glnzSoFZTt76bY+MNU22kpBC0iihGlMf5eUv/1oYJDFas2jT?=
 =?us-ascii?Q?eoqvYz7bGguLRv1azGbUZpIGbnmx3FvgYUxjmSvfpvtfPNc0AYLyFwtC+uQr?=
 =?us-ascii?Q?Qbx5I2lxtAIszrh4QzFH88l4AZ4q3oD5X1G3QU4TWVSDfnr2B/qrQ2DvwfxN?=
 =?us-ascii?Q?NKn5Dy7QTG6uYCHxBJBWtYswZNczIO1eMyvRCtr+t0VJaXq4xVo8s5NgS8/u?=
 =?us-ascii?Q?0l9YiPluy3ZEnnkeE0viVbI15ZpKMizlG7mr6R6OkqAopJMpQnE6Xg/EZKKg?=
 =?us-ascii?Q?mUBEmrYpQOB5E3nk2AFLDi6WjN5glNM3/Jo2mg+NlEcTPmgBjpLbl1Cg5IAi?=
 =?us-ascii?Q?bMZaLyDC8WszvZZmUrge2ubXOObmKxfUNYLJ9wsS+In2lm+2ykiv7c98gpBg?=
 =?us-ascii?Q?u2+a7BJJKCuX7pavCr/92FpcWfWjdvEdYMXsbqd+EL03TdV/Mou6TId3s94o?=
 =?us-ascii?Q?ZSS0h7c1ZjdSFFSPPzztqt6+FC+/3OJpVzMIaP9p/4Rs3SxC8C4q09DEQSg9?=
 =?us-ascii?Q?+vnSmZbgAYKEgX8G/R3/Jss4tRKHSmhn6ks+jXkSrLQac5ykGJ+clBI4mHfx?=
 =?us-ascii?Q?6QFenZ3lmcYLNYFXcE13GF2NWnYDej4pZLc2zws0M3rlkGmyVenKX8PyAQsE?=
 =?us-ascii?Q?SwmFObiz9sG0vjhtKWQDO+7EcGh0XWCJtKzxoagVagXD3j3kAxdvV4ITK3zW?=
 =?us-ascii?Q?gkpGKEpl50ZxZpRMBUm/NAl75TU9rKxath6SJxSFvF9q5bZfFbfX6/2L9miK?=
 =?us-ascii?Q?zZw8sjukK0E3LZrCjwlM8gclQkNhjeM5h6HyGEflK7/BCrxQ3cpxeqHiNX/d?=
 =?us-ascii?Q?fWPRy59eb9UzG6friAiAWnuurAcojqAOvuDZBhRNqL2gjoNJ0i78odwwV8x9?=
 =?us-ascii?Q?wZUolWwap/EzW2F4e9DFCgT/vUV42+73se7VKwtkDFb7ylIkEMRhptVid6LP?=
 =?us-ascii?Q?NOBxBY6qU9PH4XhhkL4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 842671ed-30d4-4fd5-3e7d-08dc4d0dcc8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2024 20:54:44.0699 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9rXNr9QjujpdNkaCr/A5WRclrnA90bwYB+jtGJd4cJ0YgKUs66pAn0syKqPMHH0Ccqx4y9SzInMqWsFoYk3ZWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6855
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

This patch makes sense to me. See two nit-pick inline

> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matt=
hew
> Brost
> Sent: Friday, March 8, 2024 12:08 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Brost, Matthew <matthew.brost@intel.com>
> Subject: [PATCH v4 13/30] drm/xe: Move ufence add to
> vm_bind_ioctl_ops_install_fences
>=20
> Rather than adding a ufence to a VMA in the bind function, add the
> ufence to all VMAs in the IOCTL that require binds in
> vm_bind_ioctl_ops_install_fences. This will help with the transition to
> job 1 per VM bind IOCTL.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sync.c | 15 ++++++++++++
>  drivers/gpu/drm/xe/xe_sync.h |  1 +
>  drivers/gpu/drm/xe/xe_vm.c   | 44 ++++++++++++++++++++++++++++++------
>  3 files changed, 53 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index 02c9577fe418..07aa65d9bcab 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -343,6 +343,21 @@ xe_sync_in_fence_get(struct xe_sync_entry *sync, int
> num_sync,
>  	return ERR_PTR(-ENOMEM);
>  }
>=20
> +/**
> + * __xe_sync_ufence_get() - Get user fence from user fence
> + * @ufence: input user fence
> + *
> + * Get a user fence reference from user fence
> + *
> + * Return: xe_user_fence pointer with reference
> + */
> +struct xe_user_fence *__xe_sync_ufence_get(struct xe_user_fence *ufence)
> +{
> +	user_fence_get(ufence);
> +
> +	return ufence;
> +}

I wonder why this is made part of xe_sync. Isn't just a ufence get function=
? Can we drop _sync_ from the function name?


> +
>  /**
>   * xe_sync_ufence_get() - Get user fence from sync
>   * @sync: input sync
> diff --git a/drivers/gpu/drm/xe/xe_sync.h b/drivers/gpu/drm/xe/xe_sync.h
> index 0fd0d51208e6..26e9ec9de1a8 100644
> --- a/drivers/gpu/drm/xe/xe_sync.h
> +++ b/drivers/gpu/drm/xe/xe_sync.h
> @@ -38,6 +38,7 @@ static inline bool xe_sync_is_ufence(struct xe_sync_ent=
ry
> *sync)
>  	return !!sync->ufence;
>  }
>=20
> +struct xe_user_fence *__xe_sync_ufence_get(struct xe_user_fence *ufence)=
;
>  struct xe_user_fence *xe_sync_ufence_get(struct xe_sync_entry *sync);
>  void xe_sync_ufence_put(struct xe_user_fence *ufence);
>  int xe_sync_ufence_get_status(struct xe_user_fence *ufence);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 5767955529dd..5b93c71fc5e9 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1810,17 +1810,10 @@ xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
> struct xe_exec_queue *q,
>  {
>  	struct dma_fence *fence;
>  	struct xe_exec_queue *wait_exec_queue =3D to_wait_exec_queue(vm,
> q);
> -	struct xe_user_fence *ufence;
>=20
>  	xe_vm_assert_held(vm);
>  	xe_bo_assert_held(bo);
>=20
> -	ufence =3D find_ufence_get(syncs, num_syncs);
> -	if (vma->ufence && ufence)
> -		xe_sync_ufence_put(vma->ufence);
> -
> -	vma->ufence =3D ufence ?: vma->ufence;
> -
>  	if (immediate) {
>  		fence =3D xe_vm_bind_vma(vma, q, syncs, num_syncs, tile_mask,
>  				       first_op, last_op);
> @@ -2822,21 +2815,58 @@ struct dma_fence *xe_vm_ops_execute(struct
> xe_vm *vm, struct xe_vma_ops *vops)
>  	return fence;
>  }
>=20
> +static void vma_add_ufence(struct xe_vma *vma, struct xe_user_fence
> *ufence)
> +{
> +	if (vma->ufence)
> +		xe_sync_ufence_put(vma->ufence);

Not sure where/when we introduced xe_sync_ufence_put, for me this can be re=
named to xe_ufence_put

Oak

> +	vma->ufence =3D __xe_sync_ufence_get(ufence);
> +}
> +
> +static void op_add_ufence(struct xe_vm *vm, struct xe_vma_op *op,
> +			  struct xe_user_fence *ufence)
> +{
> +	switch (op->base.op) {
> +	case DRM_GPUVA_OP_MAP:
> +		vma_add_ufence(op->map.vma, ufence);
> +		break;
> +	case DRM_GPUVA_OP_REMAP:
> +		if (op->remap.prev)
> +			vma_add_ufence(op->remap.prev, ufence);
> +		if (op->remap.next)
> +			vma_add_ufence(op->remap.next, ufence);
> +		break;
> +	case DRM_GPUVA_OP_UNMAP:
> +		break;
> +	case DRM_GPUVA_OP_PREFETCH:
> +		vma_add_ufence(gpuva_to_vma(op->base.prefetch.va),
> ufence);
> +		break;
> +	default:
> +		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> +	}
> +}
> +
>  static void vm_bind_ioctl_ops_install_fences(struct xe_vm *vm,
>  					     struct xe_vma_ops *vops,
>  					     struct dma_fence *fence)
>  {
>  	struct xe_exec_queue *wait_exec_queue =3D to_wait_exec_queue(vm,
> vops->q);
> +	struct xe_user_fence *ufence;
>  	struct xe_vma_op *op;
>  	int i;
>=20
> +	ufence =3D find_ufence_get(vops->syncs, vops->num_syncs);
>  	list_for_each_entry(op, &vops->list, link) {
> +		if (ufence)
> +			op_add_ufence(vm, op, ufence);
> +
>  		if (op->base.op =3D=3D DRM_GPUVA_OP_UNMAP)
>  			xe_vma_destroy(gpuva_to_vma(op->base.unmap.va),
> fence);
>  		else if (op->base.op =3D=3D DRM_GPUVA_OP_REMAP)
>  			xe_vma_destroy(gpuva_to_vma(op-
> >base.remap.unmap->va),
>  				       fence);
>  	}
> +	if (ufence)
> +		xe_sync_ufence_put(ufence);
>  	for (i =3D 0; i < vops->num_syncs; i++)
>  		xe_sync_entry_signal(vops->syncs + i, NULL, fence);
>  	xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
> --
> 2.34.1

