Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D4CC001DE
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jul 2023 17:33:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EECE710E0ED;
	Fri, 28 Jul 2023 17:33:02 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63F5310E0ED
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jul 2023 17:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690565581; x=1722101581;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=sNYM1Q5K8tLyHIi6PoymwJTj06dD2yKgC19nMz1b5AE=;
 b=AJ8OUlJBwaFbbvnaBrHyEM0PE9qG2i9PRPEFqTsHq2DIYjo2XnB6TExx
 4IiirpALvMmKvJHkSan349DMCuJjQhoqfQYAawAGWsp45/Nov/rrfudYr
 lGq1YuPxU8r0uJpIvFumf1szYNT5yqbVstK+UNqcqEhUs58o2ulvi8DzI
 yGbUFiYdC07pqFGjEug1E1klFQCsXqCH/CSg2lsBtHNSdhJw6/GLHcQk+
 Mh7xPlwWX8Jj+dp0apxJB9IUhBGvtVgaBYaVKJPZn6V4E3ATFywjg6RQW
 4fcyFNn2oVFKYFH6STdGArHy1bBC4tNVV2LDWarUVLRkBu7vgY6MkIjd7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="371345782"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; d="scan'208";a="371345782"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 10:33:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="851290172"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; d="scan'208";a="851290172"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 28 Jul 2023 10:33:00 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 10:33:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 10:33:00 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 28 Jul 2023 10:33:00 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 28 Jul 2023 10:32:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JF9e7n8e1wvE62V9sDtXTNSqRTJNXyfjiPoiUPCBlUzCfnAG+y91yK3WTlzXys7gHfO4FDsCCk9sz3kDgsi45ObF7QcD+7t5dEtxHsyso/oUW2Ukx5Sr9fK2x8dsyqBDfi7C2hEGopVdZSByYzQBavs0AACqP4J6wanTUIaWJFy6tFFU7NaH+7odbE/vhloI9m5QYZ7qhpOPuCQaqdYsp1mfDfRVmF4k1KVGyZXrcJz+Zj+dxPTpCxBNmhwq5ouqqvXzwRMRdnydWstU9R+ceSPo4FzYkLfGFEKRPyW+V1mGoc4Go24TbuWO5msN2jIN/+l6cJDogGKhjFwq/ZBYFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LV/F5nmv6nkFDHPB0F5iKdagJ0jMXTjjmAdxAVAtrcY=;
 b=SD1rUp2zen4wa0lsdyV0mcRV0/KRGj0+gHlKzktwXnx8CPd1bv3XYFxJro3U/782Lyu0UjORV1RRsKg4E2WtzIfUx3Yfhc8jseie8TUx8jB8N0rrdHCE2LpdV7JaKzAeV3ilQYAcNY1ycv1qJQvE/rChn0B8Y8PIQBSBfgbFCGbSDMUY5V7U3ou01UgbmjD3QSlyGswl408Fr4kW0NrcGwsswWO97kNh5vWCQBzMGTSA2Lmt59AwLOwt7Bc6BdOv8th9EC6uwOp4Pd6S5PNKFbWh/gNgECjKNass7IAWuDs742TuuorKHXxLSN0Dj0CHNaXn4bIyhnG16ih7XgiXEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5782.namprd11.prod.outlook.com (2603:10b6:510:147::11)
 by MW3PR11MB4764.namprd11.prod.outlook.com (2603:10b6:303:5a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 17:32:58 +0000
Received: from PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::a135:2fd5:e14a:ae87]) by PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::a135:2fd5:e14a:ae87%7]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 17:32:58 +0000
From: "Mishra, Pallavi" <pallavi.mishra@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH 2/5] drm/xe: Fix VM bind out-sync signaling
 ordering
Thread-Index: AQHZwCtUeZ3dGF2U2kCMf1gEKDRdeK/PbJdA
Date: Fri, 28 Jul 2023 17:32:58 +0000
Message-ID: <PH0PR11MB578228FB488A05EB8EEF5CD28206A@PH0PR11MB5782.namprd11.prod.outlook.com>
References: <20230727013958.456502-1-matthew.brost@intel.com>
 <20230727013958.456502-3-matthew.brost@intel.com>
In-Reply-To: <20230727013958.456502-3-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5782:EE_|MW3PR11MB4764:EE_
x-ms-office365-filtering-correlation-id: f631818b-f0af-405b-2f03-08db8f90af3f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +TogmFGQr1fHu8D+tq/QmcTA/cXl2FnxeQsTZfajki+z/qdw+FP5DyzdD/3xrCGGksoiycKwCe0VKLgAD9JJCPzpp5Nj3kegwvCeUBVqdSIgUFVBjdvKrlET3Oecm+SfBV/OG1hJikZNHZjtn/bQGhWJNGvknXX1IQ4E0Gr6rGuK72vuwuNP4Ac532KmeCiEcBiaQ/zKcpdyu+fJ2WmunSUwlaIukeXo7fg3fjjRXC8HLfmi25QH0ujDAF//mcCgiA4ks533SlRva3DLOaScr7Y3jXFbTJQvK5chwHiqxgG4SVEyLt16XfHkWgjN3NayZtTUpoEg0SxsQFZP3abLdHMARO9iXj5iTFNz4Kyb9CU/BzJBAWvCBG5p+dRGRIp8VDx3nrpvzDp9gbmJ4o99WyBOn4r1IkLdrspk+14Dt36yzSS8/7P4zyWjMxMGh/xngw6rxNhOZG7/2ShiMlY4N5Pq3VWSPOsr+SruQUWmHm2baWiXozEg4X7cxV7PaN+9tQ0VxfJyAN7WUok64yROih49a2Yv01/46BmzgmTiCFAhrdaqBGTaKw3VQ5N1O58WYJnT82RZnaEhLicpnfWeXUCQYCK9H/kD3K7XUeePLRbv0OGIPciW7V7fo7VZPQXS
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5782.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(39860400002)(366004)(136003)(396003)(451199021)(26005)(9686003)(110136005)(7696005)(186003)(66446008)(6506007)(66476007)(2906002)(53546011)(66556008)(8676002)(52536014)(66946007)(41300700001)(316002)(76116006)(5660300002)(122000001)(71200400001)(8936002)(64756008)(82960400001)(38100700002)(55016003)(33656002)(86362001)(38070700005)(478600001)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2owtPNbrUwk9UDwSbt5bN2pqOZ9Z9GJQXnn5guslqF+iY3YtbvYiWnGRA/os?=
 =?us-ascii?Q?nGxPau59wxHa4HF2X6keEJ4IrZuYvg8HRLKxvq/Mh2+h1B0zXFlwOMX6zfvk?=
 =?us-ascii?Q?rbLZ1aNxsYQ8hVmDfY1RpLOSvPLUWQ26x+RBhw6AINavmNg0yWGPn48VggAT?=
 =?us-ascii?Q?OBdsLx4+p5rW5nyA6AsCVJO0/OJ82lVA4moMqKRbE9RkIgUsH5Wp3qhTG0k2?=
 =?us-ascii?Q?AHmahgvdk1/HJQ+cmOexGSNVVaPIVtGv3f3Kbe2jjnSM2xcYtBfdPNP8Ijdp?=
 =?us-ascii?Q?8JeuWCobiAncXXZ7/MFrlAKDhIkXtFkk582aZcjZ8iYiFR3lw8OY86FFBUQI?=
 =?us-ascii?Q?OvN4DTPr4EsyrRE7dgPLl9p1pwBbcY8Hx/JmcIWY3Zv/YKDH1Aeu9kmPGX0c?=
 =?us-ascii?Q?3VnYWLmK+IlWLssYRyundACkt+qgTLwFavb58CPHRhdYuxbyKWJD8JIdxSZi?=
 =?us-ascii?Q?bpwHARaKxFjb1aWwG29lS/kHTEBsLmnXPCKuQ+izUzrGj5m5mEDKcg2xn1aq?=
 =?us-ascii?Q?j6Wl5BoB5LGYl8jJER+eFK077U27I33bisqZX0sYSTTIQRiBQqnwco5nYGOK?=
 =?us-ascii?Q?iiSfLWPeinS0aZkhk6M5v+xCdAwZBL5zvcEIDaxHk7iHGNblvwdW93XUQbzJ?=
 =?us-ascii?Q?mL06vIdPcfcxSQVJo9y3EJ8SCwws8jh/MFR/8n2LzLxJgSouRPWltJImOPVV?=
 =?us-ascii?Q?EKTr5KFen7ilFKZuYa1WK5xdK8RRlGlXsw7eIrNbVe4SchJf2KPH8pE/SYgT?=
 =?us-ascii?Q?66uoag0nrrrClsQ2DtMq1vsG/Q3XvORB39LxiuTp7J+whtrT+KIxUPeA65xr?=
 =?us-ascii?Q?tYQmuZY4+M/ODlAy2c+Pdbl7Jl47O3cmCq8pxWxViYV4Yqta54X3GeKiWgee?=
 =?us-ascii?Q?k3s6ZM3FpsBnUvaEru1QKtDjU5vlAYf7jGhhLmQLeKudKdOE5uXu1alvcWdZ?=
 =?us-ascii?Q?hkb8V8qu+udvAGgJw+xjj0qCz0XlDXlcLRofiBTXIICEEZoMYIlgyC+6o19r?=
 =?us-ascii?Q?3U0PkFectCm7iEJe7iOXV0ot6rnAl6+Z8lHSjJonTt2gh6dzzGHFEZkTm9Cu?=
 =?us-ascii?Q?q9i+IsUySQHJFtjGpNZfuBevNzzolpv6XrPyURQDCYZXswZCtroyROY0Tbg/?=
 =?us-ascii?Q?DRQhHLhILmsX2PckAahoRRlijNYURY47P1rYH1mhIhRqGYplK+lsUDvAwY1c?=
 =?us-ascii?Q?z1Xwb6lLYTbAetUKR3rM5/ythhRwp+G56gpNxhCU2U6I307GtkfuYxeA3SmR?=
 =?us-ascii?Q?Uwy56sOt5nRCt37+OF556nwgZVBvbKnE99XwzGUHwcy9sU0EI8nFJAmm7xSM?=
 =?us-ascii?Q?I+pw9UflhGVq7LaZ/XOIw7M4A+T1Y+TbWuam2IMqvupARvqk/9+KWjGw2CNO?=
 =?us-ascii?Q?sk68Dxg8nrMElJqq4hruCzkzYC8U/y0iLrBO2Bq+iytomZzl6iyfrQ5dt6hN?=
 =?us-ascii?Q?mZrS+9FDk/+KAIrN8UBMQGgfPK4NynM/h/OrChOP8wc4s5u0L0Dho5zCM/OZ?=
 =?us-ascii?Q?M39QdzEGA8KAiRQvSvBRatnIZcu1NJ8vrjir/z/SLEG1CHUGsk/gagG5Gg0h?=
 =?us-ascii?Q?yJ+ocsrAxgygadB9puUwnN83acsklhswB35oWPVj?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5782.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f631818b-f0af-405b-2f03-08db8f90af3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2023 17:32:58.1183 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ofGlL54f/5pqmwnko0B7/zQsnwthtwluVU0Vw6+nh4QHT697aSM8npf3efmpPjfIgOB3VFNWkv/hKPhhDnGII4IoYFKmsvWY2w75uWVGU48=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4764
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/5] drm/xe: Fix VM bind out-sync signaling
 ordering
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Matthew Brost
> Sent: Wednesday, July 26, 2023 6:40 PM
> To: intel-xe@lists.freedesktop.org
> Subject: [Intel-xe] [PATCH 2/5] drm/xe: Fix VM bind out-sync signaling
> ordering
>=20
> A case existed where an out-sync of a later VM bind operation could signa=
l
> before a previous one if the later operation results in a NOP (e.g. a unb=
ind or
> prefetch to a VA range without any mappings). This breaks the ordering
> rules, fix this. This patch also lays the groundwork for users to pass in
> num_binds =3D=3D 0 and out-syncs.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_engine.c       | 75 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_engine.h       |  7 +++
>  drivers/gpu/drm/xe/xe_engine_types.h |  6 +++
>  drivers/gpu/drm/xe/xe_vm.c           | 44 +++++++++++++---
>  4 files changed, 124 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_engine.c
> b/drivers/gpu/drm/xe/xe_engine.c index 1c6b84f32823..bef82b40a097
> 100644
> --- a/drivers/gpu/drm/xe/xe_engine.c
> +++ b/drivers/gpu/drm/xe/xe_engine.c
> @@ -135,6 +135,7 @@ void xe_engine_destroy(struct kref *ref)
>  	struct xe_engine *e =3D container_of(ref, struct xe_engine, refcount);
>  	struct xe_engine *engine, *next;
>=20
> +	xe_engine_last_fence_put_unlocked(e);
>  	if (!(e->flags & ENGINE_FLAG_BIND_ENGINE_CHILD)) {
>  		list_for_each_entry_safe(engine, next, &e->multi_gt_list,
>  					 multi_gt_link)
> @@ -834,3 +835,77 @@ int xe_engine_set_property_ioctl(struct drm_device
> *dev, void *data,
>=20
>  	return ret;
>  }
> +
> +static void xe_engine_last_fence_lockdep_assert(struct xe_engine *e,
> +						struct xe_vm *vm)
> +{
> +	lockdep_assert_held_write(&vm->lock);
> +}

Why do we need to pass xe_engine above? Do we intend to use this later?

Pallavi

> +
> +/**
> + * xe_engine_last_fence_put() - Drop ref to last fence
> + * @e: The engine
> + * @vm: The VM the engine does a bind or exec for  */ void
> +xe_engine_last_fence_put(struct xe_engine *e, struct xe_vm *vm) {
> +	xe_engine_last_fence_lockdep_assert(e, vm);
> +
> +	if (e->last_fence) {
> +		dma_fence_put(e->last_fence);
> +		e->last_fence =3D NULL;
> +	}
> +}
> +
> +/**
> + * xe_engine_last_fence_put_unlocked() - Drop ref to last fence
> +unlocked
> + * @e: The engine
> + *
> + * Only safe to be called from xe_engine_destroy().
> + */
> +void xe_engine_last_fence_put_unlocked(struct xe_engine *e) {
> +	if (e->last_fence) {
> +		dma_fence_put(e->last_fence);
> +		e->last_fence =3D NULL;
> +	}
> +}
> +
> +/**
> + * xe_engine_last_fence_get() - Get last fence
> + * @e: The engine
> + * @vm: The VM the engine does a bind or exec for
> + *
> + * Get last fence, does not take a ref
> + *
> + * Returns: last fence if not signaled, dma fence stub if signaled  */
> +struct dma_fence *xe_engine_last_fence_get(struct xe_engine *e,
> +					   struct xe_vm *vm)
> +{
> +	xe_engine_last_fence_lockdep_assert(e, vm);
> +
> +	if (e->last_fence &&
> +	    test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &e->last_fence->flags))
> +		xe_engine_last_fence_put(e, vm);
> +
> +	return e->last_fence ? e->last_fence : dma_fence_get_stub(); }
> +
> +/**
> + * xe_engine_last_fence_set() - Set last fence
> + * @e: The engine
> + * @vm: The VM the engine does a bind or exec for
> + * @fence: The fence
> + *
> + * Set the last fence for the engine. Increases reference count for
> +fence, when
> + * closing engine xe_engine_last_fence_put should be called.
> + */
> +void xe_engine_last_fence_set(struct xe_engine *e, struct xe_vm *vm,
> +			      struct dma_fence *fence)
> +{
> +	xe_engine_last_fence_lockdep_assert(e, vm);
> +
> +	xe_engine_last_fence_put(e, vm);
> +	e->last_fence =3D dma_fence_get(fence);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_engine.h
> b/drivers/gpu/drm/xe/xe_engine.h index 2e60f6d90226..0aae12ed06ef
> 100644
> --- a/drivers/gpu/drm/xe/xe_engine.h
> +++ b/drivers/gpu/drm/xe/xe_engine.h
> @@ -60,4 +60,11 @@ int xe_engine_get_property_ioctl(struct drm_device
> *dev, void *data,
>  				 struct drm_file *file);
>  enum drm_sched_priority xe_engine_device_get_max_priority(struct
> xe_device *xe);
>=20
> +void xe_engine_last_fence_put(struct xe_engine *e, struct xe_vm *vm);
> +void xe_engine_last_fence_put_unlocked(struct xe_engine *e); struct
> +dma_fence *xe_engine_last_fence_get(struct xe_engine *e,
> +					   struct xe_vm *vm);
> +void xe_engine_last_fence_set(struct xe_engine *e, struct xe_vm *vm,
> +			      struct dma_fence *fence);
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_engine_types.h
> b/drivers/gpu/drm/xe/xe_engine_types.h
> index 4949edfa0980..9ca19942d72b 100644
> --- a/drivers/gpu/drm/xe/xe_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_engine_types.h
> @@ -52,6 +52,12 @@ struct xe_engine {
>  	/** @fence_irq: fence IRQ used to signal job completion */
>  	struct xe_hw_fence_irq *fence_irq;
>=20
> +	/**
> +	 * @last_fence: last fence on engine, protected by vm->lock in write
> +	 * mode if bind engine
> +	 */
> +	struct dma_fence *last_fence;
> +
>  #define ENGINE_FLAG_BANNED		BIT(0)
>  #define ENGINE_FLAG_KERNEL		BIT(1)
>  #define ENGINE_FLAG_PERSISTENT		BIT(2)
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 77723f680f37..3e420b2c12b4 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1366,6 +1366,13 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  	if (xe_vm_in_compute_mode(vm))
>  		flush_work(&vm->preempt.rebind_work);
>=20
> +	down_write(&vm->lock);
> +	for_each_tile(tile, xe, id) {
> +		if (vm->eng[id])
> +			xe_engine_last_fence_put(vm->eng[id], vm);
> +	}
> +	up_write(&vm->lock);
> +
>  	for_each_tile(tile, xe, id) {
>  		if (vm->eng[id]) {
>  			xe_engine_kill(vm->eng[id]);
> @@ -1518,16 +1525,22 @@ u64 xe_vm_pdp4_descriptor(struct xe_vm *vm,
> struct xe_tile *tile)
>  			     XE_CACHE_WB);
>  }
>=20
> +static struct xe_engine *to_wait_engine(struct xe_vm *vm, struct
> +xe_engine *e) {
> +	return e ? e : vm->eng[0];
> +}
> +
>  static struct dma_fence *
>  xe_vm_unbind_vma(struct xe_vma *vma, struct xe_engine *e,
>  		 struct xe_sync_entry *syncs, u32 num_syncs,
>  		 bool first_op, bool last_op)
>  {
> +	struct xe_vm *vm =3D xe_vma_vm(vma);
> +	struct xe_engine *wait_engine =3D to_wait_engine(vm, e);
>  	struct xe_tile *tile;
>  	struct dma_fence *fence =3D NULL;
>  	struct dma_fence **fences =3D NULL;
>  	struct dma_fence_array *cf =3D NULL;
> -	struct xe_vm *vm =3D xe_vma_vm(vma);
>  	int cur_fence =3D 0, i;
>  	int number_tiles =3D hweight8(vma->tile_present);
>  	int err;
> @@ -1579,7 +1592,8 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct
> xe_engine *e,
>  					     cf ? &cf->base : fence);
>  	}
>=20
> -	return cf ? &cf->base : !fence ? dma_fence_get_stub() : fence;
> +	return cf ? &cf->base : !fence ?
> +		xe_engine_last_fence_get(wait_engine, vm) : fence;
>=20
>  err_fences:
>  	if (fences) {
> @@ -1678,6 +1692,7 @@ static int __xe_vm_bind(struct xe_vm *vm, struct
> xe_vma *vma,
>  			bool last_op)
>  {
>  	struct dma_fence *fence;
> +	struct xe_engine *wait_engine =3D to_wait_engine(vm, e);
>=20
>  	xe_vm_assert_held(vm);
>=20
> @@ -1691,13 +1706,15 @@ static int __xe_vm_bind(struct xe_vm *vm,
> struct xe_vma *vma,
>=20
>  		XE_BUG_ON(!xe_vm_in_fault_mode(vm));
>=20
> -		fence =3D dma_fence_get_stub();
> +		fence =3D xe_engine_last_fence_get(wait_engine, vm);
>  		if (last_op) {
>  			for (i =3D 0; i < num_syncs; i++)
>  				xe_sync_entry_signal(&syncs[i], NULL, fence);
>  		}
>  	}
>=20
> +	if (last_op)
> +		xe_engine_last_fence_set(wait_engine, vm, fence);
>  	if (last_op && xe_vm_sync_mode(vm, e))
>  		dma_fence_wait(fence, true);
>  	dma_fence_put(fence);
> @@ -1730,6 +1747,7 @@ static int xe_vm_unbind(struct xe_vm *vm, struct
> xe_vma *vma,
>  			u32 num_syncs, bool first_op, bool last_op)  {
>  	struct dma_fence *fence;
> +	struct xe_engine *wait_engine =3D to_wait_engine(vm, e);
>=20
>  	xe_vm_assert_held(vm);
>  	xe_bo_assert_held(xe_vma_bo(vma));
> @@ -1739,6 +1757,8 @@ static int xe_vm_unbind(struct xe_vm *vm, struct
> xe_vma *vma,
>  		return PTR_ERR(fence);
>=20
>  	xe_vma_destroy(vma, fence);
> +	if (last_op)
> +		xe_engine_last_fence_set(wait_engine, vm, fence);
>  	if (last_op && xe_vm_sync_mode(vm, e))
>  		dma_fence_wait(fence, true);
>  	dma_fence_put(fence);
> @@ -1875,6 +1895,7 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct
> xe_vma *vma,
>  			  struct xe_sync_entry *syncs, u32 num_syncs,
>  			  bool first_op, bool last_op)
>  {
> +	struct xe_engine *wait_engine =3D to_wait_engine(vm, e);
>  	int err;
>=20
>  	XE_BUG_ON(region > ARRAY_SIZE(region_to_mem_type)); @@ -
> 1893,9 +1914,12 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct
> xe_vma *vma,
>=20
>  		/* Nothing to do, signal fences now */
>  		if (last_op) {
> -			for (i =3D 0; i < num_syncs; i++)
> -				xe_sync_entry_signal(&syncs[i], NULL,
> -						     dma_fence_get_stub());
> +			for (i =3D 0; i < num_syncs; i++) {
> +				struct dma_fence *fence =3D
> +
> 	xe_engine_last_fence_get(wait_engine, vm);
> +
> +				xe_sync_entry_signal(&syncs[i], NULL, fence);
> +			}
>  		}
>=20
>  		return 0;
> @@ -3028,8 +3052,12 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> void *data, struct drm_file *file)
>  unwind_ops:
>  	vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
>  free_syncs:
> -	for (i =3D 0; err =3D=3D -ENODATA && i < num_syncs; i++)
> -		xe_sync_entry_signal(&syncs[i], NULL,
> dma_fence_get_stub());
> +	for (i =3D 0; err =3D=3D -ENODATA && i < num_syncs; i++) {
> +		struct dma_fence *fence =3D
> +			xe_engine_last_fence_get(to_wait_engine(vm, e),
> vm);
> +
> +		xe_sync_entry_signal(&syncs[i], NULL, fence);
> +	}
>  	while (num_syncs--)
>  		xe_sync_entry_cleanup(&syncs[num_syncs]);
>=20
> --
> 2.34.1

