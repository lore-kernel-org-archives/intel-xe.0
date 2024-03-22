Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6D5C47DD9
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 17:06:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BEE2112631;
	Fri, 22 Mar 2024 17:06:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h+HhEAWm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA04112630
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 17:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711127211; x=1742663211;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UBG8ypMIV7uoXSBP9HHDl9BtI8PDehg15ftdBtkNSp0=;
 b=h+HhEAWmWk0nnSf4gY6NsyZL8hQAdd21mCT93Enp+1IcIYXa26QFZfwF
 rHQJJbHExowh2nxW2cmqmj9mN3qX7z7HMQVJmEU+CqZJSFge88PQUgbyI
 7f2yc3qKZxGiNQcK/TKWIsMIlxf5mKLWGs8Uks/+5Elsh3uN7dnRZLGfK
 ivWv4pTnsvx7RBbjJiJzMGX/DPuzc+NAmWWku9ZGYZF4W1NS/1JJ6TbWv
 lIF7Kw9Jb0HU7KM59qyKoncyzIZ93yxpkNlEQFNQzqQne7hLX+xsY/CMj
 b5UtXzOqK7KqffmBW/PGa4egEViCmfdWNrPFjkivFMc2q67xe5Th9fRPd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="31625245"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="31625245"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 10:06:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="15008468"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2024 10:06:50 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 10:06:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 10:06:49 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Mar 2024 10:06:49 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 10:06:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cAif9nig/blCRR2BNLdGlqJAZVa7Scpq9G4ykdZyRduiyTWVbNUquG67u49IY2EVoWWLpjTkIPE0l/m2PPpu5yWLL2XsGvIafUnHuSaDpOlD0EZ53/JCVvfQPOS7T+753ceGLUaIWPE5RdXo09HXYf3rYE1qJs76c7emH0YVui6VMlqr7TObk6QI0o4aIfujLj2xkl1JkYYfUv2qozquQYTVOyzbFI7hg5BCx/CMNHqp3r4cgsQpAxFCKqXSDvyv6YmHATlbgUEGmZzWxfCkJHzstP4pC2xRe+1Ewdei4qXhOIhX1Eb+ndslERcjnOCrKysHTzOef759Wr+4x7Pmvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o39WrMvpRXsf+tKwa5PxDetZleIO+/d0qmU8KpseiWo=;
 b=WKFK4OkEgOccX/XD5BAf4eFAR3XsBxxIY7Ku/urxomv0kukV7YRkhg3kFjVjJT47IfffqEqIawH5jNJoQNJplo5wYt2GVD92UweinnAyRcvtrSY8uMhRSvCqA1lrNGpxrXG67019hOCmHnPw6WMy5zGzepBn61cnlfJMfDyLZ57WF8as7gCVixWbsjmk5l8B1w6FdFVqtH/cWdvdWOLfB5dHGc8KmezJKg0SLHWWO3YuF2cXbhVkxV5UanUC5GYekxIAllrI6/4YTjIaPwK3kLiGuar8dRnLS3g/CRPg137UyBuCQrQ57gyn3k1fyWi1gHsvkgDBMIoX/Rlww94Quw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by DM4PR11MB6166.namprd11.prod.outlook.com (2603:10b6:8:ad::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Fri, 22 Mar
 2024 17:06:28 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Fri, 22 Mar 2024
 17:06:28 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH v4 03/30] drm/xe: Move migrate to prefetch to op_lock
 function
Thread-Topic: [PATCH v4 03/30] drm/xe: Move migrate to prefetch to op_lock
 function
Thread-Index: AQHacRabMECxfxAYA0OcS+e1i50jbbFEEUEA
Date: Fri, 22 Mar 2024 17:06:28 +0000
Message-ID: <SA1PR11MB699179AF93251BACE99405A592312@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
 <20240308050806.577176-4-matthew.brost@intel.com>
In-Reply-To: <20240308050806.577176-4-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|DM4PR11MB6166:EE_
x-ms-office365-filtering-correlation-id: 5f37894c-721d-4afc-0b05-08dc4a926a2e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HUHtmDZrltEhk6CdAjGiUxdwpQ53+ckDYAFmoKvuR2GuoO/G6rLIMqDrkgKV+GSZSqrmo4VaS8Ly5BKlTkfMXnjF190q0bAdE39GIOz+ABkKMQbiybAQaGARsbSNbJatA5GVKqdUp9Xkh9dohJkXElBeR7Ot1EH11Bvvywp9yrcwOJYjWJjKSQmRhYpfW3zJZmaU6sqQ0ARo5dogBn/7iq4Zjjiz/l9fz5Vkv8zTiFXiMKPxEtQz61TRFyUVUTrtZ54TN8mJkTRZh8S3jOPIyyBHeoI3m1vURgA0QgxumAi7x0CfAiTZC9fPV5n9qNaQv1LWmO84Inf0hM6TKovSbg7FsX699XLDZ0Yiny9dk8E3a0ZbJUUxBOjK7NoRc9sIMA3yY1rJ4pJI5NZ1isa0dtGg6Tual7yNkLREJXN/S02uNpc18P95GzAUII6Os5QCKvoukBiPN7/y1YdMyWRzaGfDY4/M9MZdaJFsdgv7WbG9uFZv1xRIFstpQs2od3zjGiXzP1/O5QdkKXpBfHjMc9XrtKlNGxAa8z7PH0yuy/F6Kou75f9xqAMZNy9Z1lwShukQtJrA/decXYgI6pf7HFeR/Wsvl2Ri6XUQHQ5JfB3id5Ko1rhdW/iOJRNyTNAF4JeTkwES6iy0AibmGqn7SIm2maMXSH7fIJuDv579bq8uAS8yRMH1XqQbKx8vXtsOtnvfcjND4YInen6cSm8fa/lkKAOz8HDyvq6dOJAmVww=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NC0w8YulzxMPW1KZqgYwIkV2S8MqqA/qTjr/20QX2SXmyJLRyHyGxofRgACF?=
 =?us-ascii?Q?U7f1wGW1pIHkWjdOXAxYe8doGhcnXHvK3FYiju4DuUIiieCDsQnvClyjMfTF?=
 =?us-ascii?Q?9PN9ZmFvbcfcWzIcpLXba6oj6eyVaLEi9yJVbDEQq1006718Ff6+w2mAbVfH?=
 =?us-ascii?Q?j+YV0aqPiPc27WQ8z7JSGDMomYkkRMO6n9uhFDr3mtCowUyy++t8uHUBnV0N?=
 =?us-ascii?Q?JQH7ob2NITTRB6AQMwDL5ygN+RKQsXKVY6KIv9vFa4rNJTPRILu1qzemBlbi?=
 =?us-ascii?Q?WRZLf76VT7s9ceeIg+7n2WbfcMkgdRNAddv6++cYXR/t7t4Jf0CNFxn3mP2H?=
 =?us-ascii?Q?wm1x94uLv1hU9SjhxOuoq9oxsDEg8nloat4nVoKLeXCZ+5PmcWy/Vmp/lSPi?=
 =?us-ascii?Q?y3Ibofu1Veq1zZieGTsWX+5+Cqn3GsA1QOhwjFHH856zJ/JQatIy/PW/sEDv?=
 =?us-ascii?Q?0h/p/esN8m0f+XibIHNzid7WKpu8UjuvBdH9lAGlg85+e4y0XU+t/wPlDq3Z?=
 =?us-ascii?Q?SWKtyR5NxAln6094poqvFoOi6mKka+VlbsgVCVUN8KbF/4y5i2wmGJPgFwRN?=
 =?us-ascii?Q?me8NRFAFe4mlhFGgX20w6X6vajjr42zMlm3ngXbNo8lh5GKsCD2tQdxUYua8?=
 =?us-ascii?Q?I8Odi4rSBoovdAu/YZF8kuQmx69dMymjyudBCD6q6/MY+bHatB1a5SOkZ6NQ?=
 =?us-ascii?Q?ANrJ6729fU7f1Q6YfufEL9m0TaCA/lgzSkkHB8i+xKmq8HKjb85Ch8lfvDbx?=
 =?us-ascii?Q?Ovv8m+RHy58fdqrBCSyYnehDUBXB/hX2dD2xjYD29PfkSt1G+sL3TWNR/uf9?=
 =?us-ascii?Q?LZOnAi2uTT/BAKHTeucZqiA9JVYHiCG61GIRO5MhoOcJugKw2TPAeZK4nJko?=
 =?us-ascii?Q?vb9i22xvKd42lPX3IkGOzk5IEwcp2T1jOhTzivb2I4PeRx6s3n1WVNRgJ5FZ?=
 =?us-ascii?Q?IPmPz6xGFZKjnV/QN7r46StvOPMgnG4j58BSKi6bKOgAJR3fbsghZKDnLvMg?=
 =?us-ascii?Q?SWzDUoarhdlVEGlIMcc6Pcakq4yw59nx5Yla+0S74m6linSUzpF9u3hBFl58?=
 =?us-ascii?Q?YFQJkgiKI0NVo2iApD47vJhSV4o+eIt1uQN+y/Bp6FLzxragV7tyvw6s9XBG?=
 =?us-ascii?Q?5irmvi8PXv3jD/48ymzYvajGShY+TKpGvKt+3ByTtejBXne66R5l6LqB81+0?=
 =?us-ascii?Q?hnqjI4fbwQkP2i9uZL+gKdHOmt5icIWYjPhUCmqSf/ZDtp8KlGo4x9xxzsyD?=
 =?us-ascii?Q?Rchtx0PCu4tPhVaj/KgRCgKxyrYXWqg+rmiwn+TV6rP2qwGTfWUBycQ7Dzs0?=
 =?us-ascii?Q?RUUboq3kwx9MBs/s1BKDGZc+0+D/wGsX5QjWdBOzwS0A4YBcFffHgFZ8euBm?=
 =?us-ascii?Q?GqJkKfiEqQ0oqkSG6s+b40d1aS2T4ezTyNp/W3YXTOOx8eMFn0uds4I6rlzq?=
 =?us-ascii?Q?W2J+b2kZjrNI/zpW6BzQmFALSbRoX8aAOUV8YkVLYQrSpAHj2FNgJzkw2lDs?=
 =?us-ascii?Q?5uHprZrpC6OX2dwkAYOCXk7oxBFHh7fDxxKJ1LzHU7KoJx5QbJrDA/E2EvmA?=
 =?us-ascii?Q?xXU8H3/5wO6FFIr8WLM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f37894c-721d-4afc-0b05-08dc4a926a2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2024 17:06:28.6466 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VGSij3cdbwA49ul5VARna9lMB9/Z6mjI1WWr30xa4EA4N9D/wnc3uyR0I18Ac7jA4czcEuyIkks/u758pL5laA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6166
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
> Subject: [PATCH v4 03/30] drm/xe: Move migrate to prefetch to op_lock fun=
ction
>=20
> Migrates need to be done under drm exec to make lockdep happy,


Can you explain more here? By under drm exec, do you mean drm_exec_until_al=
l_locked? I do see xe_vm_prefetch/xe_bo_migrate is called inside drm_exec_u=
ntil_all_locked, in patch 1 of this series, in function vm_bind_ioctl_ops_e=
xecute

 move
> the migrate done for prefetches under the op_lock function.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 28 +++++++++++++---------------
>  1 file changed, 13 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index fb73afcab3b7..70a5ba621e4e 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1994,20 +1994,10 @@ static const u32 region_to_mem_type[] =3D {
>=20
>  static struct dma_fence *
>  xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
> -	       struct xe_exec_queue *q, u32 region,
> -	       struct xe_sync_entry *syncs, u32 num_syncs,
> -	       bool first_op, bool last_op)
> +	       struct xe_exec_queue *q, struct xe_sync_entry *syncs,
> +	       u32 num_syncs, bool first_op, bool last_op)
>  {
>  	struct xe_exec_queue *wait_exec_queue =3D to_wait_exec_queue(vm,
> q);
> -	int err;
> -
> -	xe_assert(vm->xe, region <=3D ARRAY_SIZE(region_to_mem_type));
> -
> -	if (!xe_vma_has_no_bo(vma)) {
> -		err =3D xe_bo_migrate(xe_vma_bo(vma),
> region_to_mem_type[region]);
> -		if (err)
> -			return ERR_PTR(err);
> -	}
>=20
>  	if (vma->tile_mask !=3D (vma->tile_present & ~vma->usm.tile_invalidated=
))
> {
>  		return xe_vm_bind(vm, vma, q, xe_vma_bo(vma), syncs,
> num_syncs,
> @@ -2540,8 +2530,7 @@ static struct dma_fence *op_execute(struct xe_vm
> *vm, struct xe_vma *vma,
>  				     op->flags & XE_VMA_OP_LAST);
>  		break;
>  	case DRM_GPUVA_OP_PREFETCH:
> -		fence =3D xe_vm_prefetch(vm, vma, op->q, op->prefetch.region,
> -				       op->syncs, op->num_syncs,
> +		fence =3D xe_vm_prefetch(vm, vma, op->q, op->syncs, op-
> >num_syncs,
>  				       op->flags & XE_VMA_OP_FIRST,
>  				       op->flags & XE_VMA_OP_LAST);
>  		break;
> @@ -2766,8 +2755,17 @@ static int op_lock(struct drm_exec *exec, struct x=
e_vm
> *vm,
>  		err =3D vma_lock(exec, gpuva_to_vma(op->base.unmap.va), false);
>  		break;
>  	case DRM_GPUVA_OP_PREFETCH:
> -		err =3D vma_lock(exec, gpuva_to_vma(op->base.prefetch.va),
> true);
> +	{
> +		struct xe_vma *vma =3D gpuva_to_vma(op->base.prefetch.va);
> +		u32 region =3D op->prefetch.region;
> +
> +		xe_assert(vm->xe, region <=3D
> ARRAY_SIZE(region_to_mem_type));
> +
> +		err =3D vma_lock(exec, vma, false);
> +		if (!err && !xe_vma_has_no_bo(vma))
> +			err =3D xe_bo_migrate(xe_vma_bo(vma), region);
>  		break;
> +	}

Understand you have a reason to do this. It does introduce confusion: the f=
unction is called op_lock and now you have a migration operation inside.


Oak


>  	default:
>  		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
>  	}
> --
> 2.34.1

