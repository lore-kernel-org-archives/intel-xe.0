Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37845C54E64
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 16:05:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D977F10E8C5;
	Mon, 25 Mar 2024 16:05:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UcjAaCUX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D4FA10E8C5
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 16:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711382723; x=1742918723;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5SdEHko4BifihvtkCiaiQgN/rEgHpIUq5oqku8Q0iXM=;
 b=UcjAaCUX4No0t18lF2t/M25ExLDLRKtFw5eYH8/7TANrbYaf1SL7itRL
 WzF+XZVOMC+BV7hl/XH7auIwSNEkSy8ytT1omF8EzwN+oxFFM7n6CeW06
 tpeaAbxgZQG1x+UrKP6q5huP2gYy5sYS7NmxEWjT4BYoepBc5mf6z1Pz4
 XICQvvtqe/odk5Gdak6uBm0QMGePUmvPlvMF6di07Ih4cda4vo7aKwQdr
 fENXgI2ToT+crD30EyYz1RGv0N64P+gwum24+CxwzKTSFUSfBlyxlC1f4
 TkvgDK+CyCF7Wqbpi9DgfeLmM/cTLsTSK61PVINzzv3CCKkPRtpX/lpyN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="23879548"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="23879548"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 09:05:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="15532798"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 09:05:22 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 09:05:21 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 09:05:21 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 09:05:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ky4Jq32mfWnn1ydVUYHqlXIlgAuIQ8YMs6jOaGRoCWAGEM3rc+GYM+2iTG5jBHv96Ssre0eSpHmj336QzFQLigMhxdWSeenvik3wDz6BVfb0+UFE5rDSA0hJpEVEB/BJyByxZep9iyp1UZb/nkKAqdnKaMMeMgVMe78sDromp9A5OE8k6pPeeCoPoFhGlF/QeDYVZOqHY70ADpulu3R51A4dVArMDnnieMnGISWXhftRHqWtkw+tOn446PocN2TOjOssHJ3egm5Yy0kDnhzfBooYAH6zEB4m3VbZA3vDxni0UvfU876yZzxUMYEQEOcBUZAt1rEvgbKx9+2hWfX2pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b3K4oTFZMtIu+ofUZnx8B6sHnCOh0wyHLwODy4wwc40=;
 b=TzRYAIQpjUCrjlTzd8w9qJU/6F/2ywUGWXOY+pf4QYscBROXUy5khJxEmm68KO+VYlsZxoBY7JInX8TAzSYXaCERI3osv5x6KgnvsiCayaBqJMGkyI1FTDxp0wUM+NfZ/opc+tuPj409TD9HB+jGFp2f/YfxkHJduDGk24esGmNT4dYxW7TQYTCRWd+PSxuFuwFFrk/HPdjfvNC8Ft571YYl8cnUso5p4drp+pAfIg0+CYYzDL2E2sHhhvc0113opO/XfWPqSuMDoooPzRn/zRr/5T5R9rvYIza2SGaStTEORNLIGU8OB9sBjmwCpXxc4fU3R30oQWdo2AE/1wFCKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by DS7PR11MB6063.namprd11.prod.outlook.com (2603:10b6:8:76::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Mon, 25 Mar
 2024 16:05:11 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Mon, 25 Mar 2024
 16:05:11 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH v4 08/30] drm/xe:
 s/xe_tile_migrate_engine/xe_tile_migrate_exec_queue
Thread-Topic: [PATCH v4 08/30] drm/xe:
 s/xe_tile_migrate_engine/xe_tile_migrate_exec_queue
Thread-Index: AQHacRalUCT0trfFZkOQh111S+AYqbFIuhtA
Date: Mon, 25 Mar 2024 16:05:11 +0000
Message-ID: <SA1PR11MB6991B0FF4C8E99077D0A7C9592362@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
 <20240308050806.577176-9-matthew.brost@intel.com>
In-Reply-To: <20240308050806.577176-9-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|DS7PR11MB6063:EE_
x-ms-office365-filtering-correlation-id: 0c3c6cb8-cb2c-4aa9-7463-08dc4ce559c4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N1gnxnH35mOclddiRlv62er/+dlrLg44o/NpYWoCsnuPAy/qn0wL26dPr203XOVhK9rXalTfKxgH6zN8xFU4WcarB7hvjXydM5UE8UhuMIXRbvqy8S2a8DRoVwVgx7ocVZSnQAIyfB7f8urOLbZKC5vz3mmnMjCzR+8g/51qyeAU1TjdFwCrvnm+0uA+P4BrbqDlyBv9tX0ISbjXvw8RkfqvVfS+ID/LtrRZr0SkGKcn2aKT3nR19x9az48GQF3ExgqhkpD01/1WOlovo56l9owfYYodwgxyaBw8emz4Dv54PqJYhUupoI+5t6fTDmMJxVSng0mWGWF1Au9yO8oT/dajHEt4K6AXS/3nRv8sSkgQmOZj781Uyw48V24Os0ELEIBpRe0iiaigg7/h37EHsRiWnK+J1fmMy0PYFj4PD4HEKw2gBTT2LWogwN6RdI9kUX0c4IN6JXlXnxHG6D4eA4n46YPnR3J3kGf2fzHVxo/L7NeD+RtoQ+2d6hkswjJk8zefLGGT9L/R1VWL+MJm+vX14imI3/yHXFpVwtg/SjHmtzzrHtwlopvA0roZ3yi7HUOySHgD7eLlLLwljLwLD9JAM/vH4oX+ep0PTxzm5Wtf1e+6RK70LG7lR4HwrVtxX56aP247OOM+uiGPNb60vyKCuAxJ2Xcy70Q7m6PIrrEzYRMJgg50R4yolFkUp1TrUy61IHFEtF1YBjfLMARvOiyZ3LKYk1sJyjKDkNECkQw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?almDr5UQdFCH8LPxiw7h48v/sZJXY36wN0fkn5SYnSCILINCJ93y/FQnYxHV?=
 =?us-ascii?Q?lCPBbKsYyT9/0pELhmS1eZFAckZs9Ju95C1pEGY75QnN+TaneTbxRTJBReRT?=
 =?us-ascii?Q?7lfzMLCI2J8nZ/WYcf3lyvpsrj5D1yVxI/AzCFruGAxZRgU4xOvPP+IyxAoj?=
 =?us-ascii?Q?28acDV+roW5WUzokWjalUVVExGB8sz4xMoFoHuKk8kkqylI0g7lnzvf7OALO?=
 =?us-ascii?Q?MRX1YsIiZ+Uut5bSwoB9TsQkxXfXYwaNx3t1zVmd6/XhhljTgkErvvScR1fF?=
 =?us-ascii?Q?6Bf6ezKdSNzkWcIonGLIXLIeo0A38/vTdAklU4ulCBfMbJ/yIJYPflP9ETlk?=
 =?us-ascii?Q?vzS/EBH4ELxIGBaI4nYznDZM9su7X+e45Av9kPQ+WqTO/Zb5A3nknNTjwPE9?=
 =?us-ascii?Q?r6KDsl7dMCIa3e2oysoqfuKXMLN3RExK1svzUaNRYdCtTWggnbFvwjEoSOTa?=
 =?us-ascii?Q?eqR0jRsL9Rb1WQYkc6Yym6tmqD/Y1AXtiKfg5N6EG5Be6OPRpdLSdR/b7SvE?=
 =?us-ascii?Q?fs80f9T+aynrVbTwjk7wELz8m1xCH8YuG2mK30+FydrPE2d7xMOxLan2HcW2?=
 =?us-ascii?Q?qAp69Xg3KyLAEhNAwFIQP1tWMCPcHqYiTmaBkWWUST3Z8GGp6OJibrkJtvUl?=
 =?us-ascii?Q?gChusOyHnimIglYijo/9aKoAK9o1kvb5bAau1ccTMAdHw319tvukRs5vfhxc?=
 =?us-ascii?Q?O0B+sijo1R1empid/1hrt+lQPXeRqkE8a9UnM0FDbreirge6+xgLOOrW6qzV?=
 =?us-ascii?Q?1WEwi4r9KWqYAJq5wV+AlaDFGjZr7kHYIUlOuCMUyiCu/Q+xPpT7hNMPeN9Z?=
 =?us-ascii?Q?MYBw3uqF57sZQMeNmKp54EJQAEIrEIQOkLwdJGoXITj+j9dJah7Tyb7S3SIo?=
 =?us-ascii?Q?bM5tDqPFn7VVODODnkOlW1Czr9MkeLHVXuKTilch8N+vLAk3ccViCyRF7L+F?=
 =?us-ascii?Q?lO5YrRYKN0f2rzecrr7B9Nc1yUdgqGY1vJhV1zHBExhSiSLc8CTwJukaAoUk?=
 =?us-ascii?Q?yw20Xd5in2qQ+Ku5Yj5jdUy1Xm8LlhOktujv5K9dSYEr46M0gXhvTy6Mmvdy?=
 =?us-ascii?Q?nMdzl8Y+TlmpAuPxbGRr3XMBRJfZia7OlkCwCIoE6BBGHfIUiNTQlNidsSJH?=
 =?us-ascii?Q?pbe8EdSX4RkHuWST/vIJD68HIce2qPIBBKTmV0ycGraZrTkVimPUcgL/rk4q?=
 =?us-ascii?Q?f1nsUk5D81v80T30oou1vf4tpVJbjLvCZ+APcdIT/63Y5TM0wsU01QEgX0tz?=
 =?us-ascii?Q?VuHW32xfeV3B3+qKZupTlO7zgvRLf8s4160ism55QPNvAk8lM6y2YvzqZY+v?=
 =?us-ascii?Q?sY7MC1k2XuwjbeFikSbnBnZhlQxt/J4adbOr+gI4W5twqv5LdhjfMLFgdY1c?=
 =?us-ascii?Q?ml0El0J0Q5VlA83AsvPKBNbt3di6ylgmN6cyAN0AZki1kIBe9jNLHNnA33BV?=
 =?us-ascii?Q?Zhq/3BW13RiFY2NFImyASpy9PRRSl+BUeCmepInh7spX/zSXReToN+fQf6QR?=
 =?us-ascii?Q?oY73zGMU3jDq2yDbHv+vfIPxxBgDZol2gC5bF/2SkJt1a8XzaFxv20Q+85bZ?=
 =?us-ascii?Q?h+OLBRHsKGx6b5AukmM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c3c6cb8-cb2c-4aa9-7463-08dc4ce559c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2024 16:05:11.6503 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BS0uB76qaVlWfR8YCW4lfmTND5+Wb+ZfmJAuM9nYxFjUNvkbHVUAZO+inaHARvIqgfvwZm4wCtIX59fE8Ktvbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6063
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

This patch lgtm. Reviewed-by: Oak Zeng <oak.zeng@intel.com>

Oak

> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matt=
hew
> Brost
> Sent: Friday, March 8, 2024 12:08 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Brost, Matthew <matthew.brost@intel.com>
> Subject: [PATCH v4 08/30] drm/xe:
> s/xe_tile_migrate_engine/xe_tile_migrate_exec_queue
>=20
> xe_engine is now xe_exec_queue, adjust this function's name to reflect.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 2 +-
>  drivers/gpu/drm/xe/xe_migrate.c      | 8 ++++----
>  drivers/gpu/drm/xe/xe_migrate.h      | 3 ++-
>  3 files changed, 7 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 3c7d6e4e3917..878e234166aa 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -210,7 +210,7 @@ static int handle_pagefault(struct xe_gt *gt, struct
> pagefault *pf)
>  	trace_xe_vma_pf_bind(vma);
>  	xe_vm_populate_dummy_rebind(vm, vma);
>  	vm->dummy_ops.op.tile_mask =3D BIT(tile->id);
> -	vm->dummy_ops.op.q =3D xe_tile_migrate_engine(tile);
> +	vm->dummy_ops.op.q =3D xe_tile_migrate_exec_queue(tile);
>  	fence =3D xe_vm_ops_execute(vm, &vm->dummy_ops.vops);
>  	if (IS_ERR(fence)) {
>  		ret =3D PTR_ERR(fence);
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> b/drivers/gpu/drm/xe/xe_migrate.c
> index ee1bb938c493..3fd76f912fda 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -84,15 +84,15 @@ struct xe_migrate {
>  #define MAX_PTE_PER_SDI 0x1FE
>=20
>  /**
> - * xe_tile_migrate_engine() - Get this tile's migrate engine.
> + * xe_tile_migrate_exec_queue() - Get this tile's migrate exec queue.
>   * @tile: The tile.
>   *
> - * Returns the default migrate engine of this tile.
> + * Returns the default migrate exec queue of this tile.
>   * TODO: Perhaps this function is slightly misplaced, and even unneeded?
>   *
> - * Return: The default migrate engine
> + * Return: The default migrate exec queue
>   */
> -struct xe_exec_queue *xe_tile_migrate_engine(struct xe_tile *tile)
> +struct xe_exec_queue *xe_tile_migrate_exec_queue(struct xe_tile *tile)
>  {
>  	return tile->migrate->q;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h
> b/drivers/gpu/drm/xe/xe_migrate.h
> index 951f19318ea4..9935ce336bae 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -106,5 +106,6 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>=20
>  void xe_migrate_wait(struct xe_migrate *m);
>=20
> -struct xe_exec_queue *xe_tile_migrate_engine(struct xe_tile *tile);
> +struct xe_exec_queue *xe_tile_migrate_exec_queue(struct xe_tile *tile);
> +
>  #endif
> --
> 2.34.1

