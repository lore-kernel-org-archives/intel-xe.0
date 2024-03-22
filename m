Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D224C54E71
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 21:23:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD9A7112787;
	Fri, 22 Mar 2024 21:23:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="evVVdVJZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B5C112787
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 21:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711142593; x=1742678593;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2seZemJgtWxQQdI2m3kDKFMQVq46eGFTUjrAvNTBcww=;
 b=evVVdVJZYgbrYjPMwCw5u28IxmUMGodmln6Gzi3e0ptUSUu+a3TykgqM
 eKwHoj/zkR4/nBiSWQFkbfcQOiDivAjSiqmhXgraojJM2BH0Z5VbEuoP+
 VpcEO4omdRph0ayhaefp7Hw3KrSZseiXxpQ/Gp39rGs7bqUfzZwofl73T
 3PmEPZaLKq0xQbKcgPwCQ/a25i89VqkwwJ9PYVbMmDawfNeSfx/sbqCoO
 K26yvQavrpZs4vSelg6qo/mk33k+XuGGaRpwtlTu40R+3/2PeaOvdnfVW
 B8D4xKdPI/3c+mN9rhf2wHb83NZlExEO8RMdREqUDJxoAq0+WcknSd1X3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="6066196"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; 
   d="scan'208";a="6066196"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 14:23:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; d="scan'208";a="15132307"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2024 14:23:12 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 14:23:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 14:23:11 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Mar 2024 14:23:11 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 14:23:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fsJ8uP6ZF31vuNl+D3uxby2I8StbmUAxxpQGn+cP2qGIpNrF0cqV9KRGviukR/j2i/AqRAErNRnezibNAB2RXkk+QuvFiTkiUZqxEcuCGJevavFc/giLlVawjenfzubKMXmaFQ8DBKhWfHhmFwO3qMuTiOgwDeCFnqX+Psr5Rr2G1xks+i1ZuJ3f7TxK61bO3ZdLhbrMDb1w60xU4UvnLO+c9tbeAy6tHrBqkNgTF1sqKjiV64p/QjZeF5UrlRsb3QEvYOAnFGtrIlD0Tbauh1g2AW3hHNUGsxu4k+6Fn+zxJzNIZ9IWIyl3MguCFHIaaSPfFFjXfDpoSw1R0h/N7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WbGQqYqGI1RYhsas3grvrxyB8SqIWJjjYVMuMR41Zug=;
 b=JwpScRgSl7j18w2zOvofQv8YKMNVfXRFxP/PShKdVqhpLFoZbylfeqCSt4q/aDO08gX+tt1rE5Qb+hm4J1ZIinsvaiQLzP4xyjf7fSJquZjOJvpQW5KEZ0bxxe8yfX0nBFx4dbD1vP8DzeSrIMFF+uYowq/g6G0ZL3TdEqbXeQ8x6Q+s/7eW21dR7sxgOGuzlUvuHs8be1gBE9It/q8tMJ1a+/QvVpqly7YIr7IfHHx+cpCVh6VCBo1dlgExM7mPDvreuMSNbFBW5ckMoNe+klBI7JGWSjKzJ0q8zzqlkxW1HZ/+Wxxpzvl9ial2AfeNYZmnBvPMFny3s/+YowY73w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Fri, 22 Mar
 2024 21:23:09 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Fri, 22 Mar 2024
 21:23:08 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH v4 05/30] drm/xe: Update xe_vm_rebind to use dummy VMA
 operations
Thread-Topic: [PATCH v4 05/30] drm/xe: Update xe_vm_rebind to use dummy VMA
 operations
Thread-Index: AQHacRaoGi//Yj2kj02xEOk7qhakrLFER9TA
Date: Fri, 22 Mar 2024 21:23:08 +0000
Message-ID: <SA1PR11MB69912CD0231A3F2D7F5DC94A92312@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
 <20240308050806.577176-6-matthew.brost@intel.com>
In-Reply-To: <20240308050806.577176-6-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|PH0PR11MB7636:EE_
x-ms-office365-filtering-correlation-id: 6f8403ff-1c69-47b0-5cb5-08dc4ab64573
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rHquxfhQp+MIpjaWD+FP5hL4abvuUzSr0NPB40IUctlFARIxuuZmpD5jH99n7E1TF5jgIE0Hb+YLyk8WAjO0bYeUnMtOKzdGTm8ftkpAHUH0EP87I05BXV8tXFfqXKkNIUDMgbJN2pfprIVN3G8qJ8jE31405oNxzYaAYLRJIoMDTpvFuVXSbQpCTmI3WvZlG/i044UQBCx6/yYH5fa9Ke4ghE4eSg4f4NBPXHd7qAjaM5u8at3I1x3PB/8e7RVQ3ciZ1Tf1S9/6i+7pxwAC0rRwybOj43bHz3zRY5jJVWH2AQ2aN7ErZi4UzUFGtu1DWuA6QoFjrL/8/pqfOsZVyBWqOfqoJXTQAwSCYx46W/gbQNAlg0uwesiMMy2Djsoklrfv8haxmQ7Sz0CCshRDjletTFnJu46+mheJqufrybePx7bKTQpKuoECgtYzzymtOH3gTDWfzPiTFjU3mbxtdAfaH5BRhQf4xVWN/THDMKw4vlnjlgrpdxyhK/DUMruEx4QrbFS5mIbN40Z1m/mX8mDcn+e8auN2LKf+JnZv5Z7Ni/o8MJGuswWpWNFKqakglyfvhSrg3ntJEg4s6VvyBxWcLkYIz1ogl/RDkqZ8cgQMveKa8EnlInJWh4+atF4acYCNGolzf7+KVqKd3Sn5fRR0irV60BhUK4/AOEbSlvNS2P6c71bCMwlaBs523mlE1/iQExdTFWVHlneWXkBzTw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JBp5utPmERILiQtBINq18Zh/0z+iW4+ZZaBraZJP4iJ6KMAQWLyj4OT1srxe?=
 =?us-ascii?Q?Klza+hIvQSf6CARtuiIse0cDzjtCG3NS02X2KoIHdG5O4Jh+pZinbyiQy8Co?=
 =?us-ascii?Q?WhiS0VUNF7vZzzdWbsy5GI7uBnv3AHTPM4/UiKyHCutDYVodcJz2geff73iC?=
 =?us-ascii?Q?hY9F8hUD8EvzU887x6gfiIHKAGqzV/6BenxnNP9LU1lp4EaQruoHXYuQFG+D?=
 =?us-ascii?Q?CpBnWKgTulz7nsl+zoCx6cebR/d90ZGoW6LRPsVOURXb9DslX0W82r9bV9/X?=
 =?us-ascii?Q?/cuQLUzzaSHadOgpxfX9n/GXcRHBVB/Q2ah/7U86Ltkdiq48vdWf7it+s29D?=
 =?us-ascii?Q?LQ7bPpRwHs7Ibo1KURxM8fCwOBH/ysgVeg8+ebo7W+m+tkr6iVF9KdkuAILb?=
 =?us-ascii?Q?+eeJ8igcD9gQWHUXRUd38/NcL6v1VKEIUyAC4UJKszKCu30xsFLeFRhrw9PT?=
 =?us-ascii?Q?Pil7AzXRTRWdrCo1dkpbornjOj9Q3Uw3zYaLk373gFuBPh7bB9zd5tZ6/Asd?=
 =?us-ascii?Q?zW6jAaP3j7/B26KhWBQcEmdZwm+lZD2BUgaBlm6Nwse3shhCVTPVCsqpVpz4?=
 =?us-ascii?Q?lobMEg4Uibv0UQJfARPxvMbJpLj53NqmgNJXSGLLjDr3s2SSCbhtfWRsv4F9?=
 =?us-ascii?Q?0VUwGEJ8i+rpq09GIeOEQ/mb7RuLr04RvNRBbuKVTgXZsc4btR7A+1YZHvDC?=
 =?us-ascii?Q?sJZ8PTjMMeOqd/TOH/lBzyWuFkuhS6rPuQKFJTfQXjdtY9hf3IjSfgxdjFzz?=
 =?us-ascii?Q?F58OmEugZen1T+ztl/mtzBHcT5ACVhcpZL7ZmAeNAyYhfO7HGGRCwk+2T05Q?=
 =?us-ascii?Q?yS9R8HLXNFPn2VAtH9CE2cCaD2Gs6jnHr2MqbmhrvdaMLC1OW5WSHg+Tk47p?=
 =?us-ascii?Q?U56bXPWO8lrH0uXvEZS0nXACsJnGtFjgi5FBQfvqqZ0pKz1iPGNpEIl4H0r/?=
 =?us-ascii?Q?c1OwBSHPUjc8UzudFBnmow9/8UhR+/TVFZMsqVmqUTa0Qbxhj29CH2I0u0Jm?=
 =?us-ascii?Q?zqIzGW9w5zF5zYbzUKwWcF2mfEkWwbA/h9n+VhWPJIaRtpw0Icux0WQVL79U?=
 =?us-ascii?Q?P5uazvQNM5Jt0GcuK9vfRlxGQDfdG1WeuZT00dJddKHUadHlGXPvuFgsnQZZ?=
 =?us-ascii?Q?0EPyu8XwTdQUs/bwvFoMzBLQE6D3WIeuEI5mzpzoYmfVN5a4bIC7moR0pbGz?=
 =?us-ascii?Q?ZqmKVv/t2Oox0gMvlUFkpfv6jMKN+6LsZXq0UDy5eSt0a3Eoy/d7ZOl+xsZL?=
 =?us-ascii?Q?9cT9jaLgX5z/KJhVHpoxo04d0XU7DrTujKgPn2d4wnUf8IFFUytU1GeZ/Xzu?=
 =?us-ascii?Q?8B6zTsBHHOcx7Gi3wrLN1cPo2xcCyuY1p8sprPKUVSAuCEI0c1rOu3Gm7hRl?=
 =?us-ascii?Q?X7Tb+d62nv8ukwDg66K+3D58uIjMKu2wUIE2yLdQP5MmRg18gUFHuGaXodpe?=
 =?us-ascii?Q?OIHuhAMMYbH155asAwEhYOO7vBf0lxgjXb3yz4qvgLxCkfPLq3tyf87rTr0e?=
 =?us-ascii?Q?mr2d/nXSQ4TvFjpFMkyM8Dkwrm5DIPh6yUrqQFqwbfyBiolxWBDSqQFzHsE5?=
 =?us-ascii?Q?yvDflgJazuCL0sTejKM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f8403ff-1c69-47b0-5cb5-08dc4ab64573
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2024 21:23:08.8873 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6DKW8UqNeV0uidkuit0QgOS4wGcRCfjX+8TaofM0BAeMATKKTIz6vkx015w2q97lrx6awA9QCzr5s7FJKLMZJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7636
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
> Subject: [PATCH v4 05/30] drm/xe: Update xe_vm_rebind to use dummy VMA
> operations
>=20
> All bind interfaces are transitioning to use VMA ops, update
> xe_vm_rebind to use VMA ops.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c       |  47 +++++---
>  drivers/gpu/drm/xe/xe_vm_types.h | 189 ++++++++++++++++---------------
>  2 files changed, 132 insertions(+), 104 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index e342af6b51b1..0bb807c05d7b 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -755,10 +755,22 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
>  		list_empty_careful(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
>  }
>=20
> -static struct dma_fence *
> -xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
> -	       struct xe_sync_entry *syncs, u32 num_syncs,
> -	       bool first_op, bool last_op);
> +static void xe_vm_populate_dummy_rebind(struct xe_vm *vm, struct xe_vma
> *vma)
> +{
> +	vm->dummy_ops.op.base.op =3D DRM_GPUVA_OP_MAP;
> +	vm->dummy_ops.op.base.map.va.addr =3D vma->gpuva.va.addr;
> +	vm->dummy_ops.op.base.map.va.range =3D vma->gpuva.va.range;
> +	vm->dummy_ops.op.base.map.gem.obj =3D vma->gpuva.gem.obj;
> +	vm->dummy_ops.op.base.map.gem.offset =3D vma->gpuva.gem.offset;
> +	vm->dummy_ops.op.map.vma =3D vma;
> +	vm->dummy_ops.op.map.immediate =3D true;
> +	vm->dummy_ops.op.map.dumpable =3D vma->gpuva.flags &
> XE_VMA_DUMPABLE;
> +	vm->dummy_ops.op.map.is_null =3D xe_vma_is_null(vma);
> +}
> +
> +static struct dma_fence *ops_execute(struct xe_vm *vm,
> +				     struct xe_vma_ops *vops,
> +				     bool cleanup);
>=20
>  struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
>  {
> @@ -780,7 +792,9 @@ struct dma_fence *xe_vm_rebind(struct xe_vm *vm,
> bool rebind_worker)
>  			trace_xe_vma_rebind_worker(vma);
>  		else
>  			trace_xe_vma_rebind_exec(vma);
> -		fence =3D xe_vm_bind_vma(vma, NULL, NULL, 0, false, false);
> +
> +		xe_vm_populate_dummy_rebind(vm, vma);
> +		fence =3D ops_execute(vm, &vm->dummy_ops.vops, false);
>  		if (IS_ERR(fence))
>  			return fence;
>  	}
> @@ -1289,6 +1303,11 @@ static void xe_vm_free_scratch(struct xe_vm *vm)
>  	}
>  }
>=20
> +static void xe_vma_ops_init(struct xe_vma_ops *vops)
> +{
> +	INIT_LIST_HEAD(&vops->list);
> +}

this already showed up on patch 4... you just add it in patch5, then moved =
it to another location on patch 5...

can this be better organized?


> +
>  struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  {
>  	struct drm_gem_object *vm_resv_obj;
> @@ -1310,6 +1329,10 @@ struct xe_vm *xe_vm_create(struct xe_device *xe,
> u32 flags)
>  	init_rwsem(&vm->lock);
>  	mutex_init(&vm->snap_mutex);
>=20
> +	xe_vma_ops_init(&vm->dummy_ops.vops);
> +	INIT_LIST_HEAD(&vm->dummy_ops.op.link);
> +	list_add(&vm->dummy_ops.op.link, &vm->dummy_ops.vops.list);
> +
>  	INIT_LIST_HEAD(&vm->rebind_list);
>=20
>  	INIT_LIST_HEAD(&vm->userptr.repin_list);
> @@ -2140,6 +2163,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct
> xe_bo *bo,
>  		struct xe_vma_op *op =3D gpuva_op_to_vma_op(__op);
>=20
>  		if (__op->op =3D=3D DRM_GPUVA_OP_MAP) {
> +			op->map.immediate =3D !xe_vm_in_fault_mode(vm);
>  			op->map.is_null =3D flags &
> DRM_XE_VM_BIND_FLAG_NULL;
>  			op->map.dumpable =3D flags &
> DRM_XE_VM_BIND_FLAG_DUMPABLE;
>  			op->map.pat_index =3D pat_index;
> @@ -2465,7 +2489,7 @@ static struct dma_fence *op_execute(struct xe_vm
> *vm, struct xe_vma *vma,
>  {
>  	struct dma_fence *fence =3D NULL;
>=20
> -	lockdep_assert_held_write(&vm->lock);
> +	lockdep_assert_held(&vm->lock);
>  	xe_vm_assert_held(vm);
>  	xe_bo_assert_held(xe_vma_bo(vma));
>=20
> @@ -2473,7 +2497,7 @@ static struct dma_fence *op_execute(struct xe_vm
> *vm, struct xe_vma *vma,
>  	case DRM_GPUVA_OP_MAP:
>  		fence =3D xe_vm_bind(vm, vma, op->q, xe_vma_bo(vma),
>  				   op->syncs, op->num_syncs,
> -				   !xe_vm_in_fault_mode(vm),
> +				   op->map.immediate,
>  				   op->flags & XE_VMA_OP_FIRST,
>  				   op->flags & XE_VMA_OP_LAST);
>  		break;
> @@ -2554,7 +2578,7 @@ __xe_vma_op_execute(struct xe_vm *vm, struct
> xe_vma *vma,
>  retry_userptr:
>  	fence =3D op_execute(vm, vma, op);
>  	if (IS_ERR(fence) && PTR_ERR(fence) =3D=3D -EAGAIN) {
> -		lockdep_assert_held_write(&vm->lock);
> +		lockdep_assert_held(&vm->lock);
>=20
>  		if (op->base.op =3D=3D DRM_GPUVA_OP_REMAP) {
>  			if (!op->remap.unmap_done)
> @@ -2583,7 +2607,7 @@ xe_vma_op_execute(struct xe_vm *vm, struct
> xe_vma_op *op)
>  {
>  	struct dma_fence *fence =3D ERR_PTR(-ENOMEM);
>=20
> -	lockdep_assert_held_write(&vm->lock);
> +	lockdep_assert_held(&vm->lock);
>=20
>  	switch (op->base.op) {
>  	case DRM_GPUVA_OP_MAP:
> @@ -2992,11 +3016,6 @@ static int vm_bind_ioctl_signal_fences(struct xe_v=
m
> *vm,
>  	return err;
>  }
>=20
> -static void xe_vma_ops_init(struct xe_vma_ops *vops)
> -{
> -	INIT_LIST_HEAD(&vops->list);
> -}
> -
>  int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file=
 *file)
>  {
>  	struct xe_device *xe =3D to_xe_device(dev);
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> b/drivers/gpu/drm/xe/xe_vm_types.h
> index cc3dce893f1e..7ef9e632154a 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -18,6 +18,7 @@
>  #include "xe_range_fence.h"
>=20
>  struct xe_bo;
> +struct xe_device;
>  struct xe_sync_entry;
>  struct xe_user_fence;
>  struct xe_vm;
> @@ -124,7 +125,96 @@ struct xe_userptr_vma {
>  	struct xe_userptr userptr;
>  };
>=20
> -struct xe_device;
> +/** struct xe_vma_op_map - VMA map operation */
> +struct xe_vma_op_map {
> +	/** @vma: VMA to map */
> +	struct xe_vma *vma;
> +	/** @immediate: Immediate bind */
> +	bool immediate;
> +	/** @is_null: is NULL binding */
> +	bool is_null;
> +	/** @dumpable: whether BO is dumped on GPU hang */
> +	bool dumpable;
> +	/** @pat_index: The pat index to use for this operation. */
> +	u16 pat_index;
> +};
> +
> +/** struct xe_vma_op_remap - VMA remap operation */
> +struct xe_vma_op_remap {
> +	/** @prev: VMA preceding part of a split mapping */
> +	struct xe_vma *prev;
> +	/** @next: VMA subsequent part of a split mapping */
> +	struct xe_vma *next;
> +	/** @start: start of the VMA unmap */
> +	u64 start;
> +	/** @range: range of the VMA unmap */
> +	u64 range;
> +	/** @skip_prev: skip prev rebind */
> +	bool skip_prev;
> +	/** @skip_next: skip next rebind */
> +	bool skip_next;
> +	/** @unmap_done: unmap operation in done */
> +	bool unmap_done;
> +};
> +
> +/** struct xe_vma_op_prefetch - VMA prefetch operation */
> +struct xe_vma_op_prefetch {
> +	/** @region: memory region to prefetch to */
> +	u32 region;
> +};
> +
> +/** enum xe_vma_op_flags - flags for VMA operation */
> +enum xe_vma_op_flags {
> +	/** @XE_VMA_OP_FIRST: first VMA operation for a set of syncs */
> +	XE_VMA_OP_FIRST			=3D BIT(0),
> +	/** @XE_VMA_OP_LAST: last VMA operation for a set of syncs */
> +	XE_VMA_OP_LAST			=3D BIT(1),
> +	/** @XE_VMA_OP_COMMITTED: VMA operation committed */
> +	XE_VMA_OP_COMMITTED		=3D BIT(2),
> +	/** @XE_VMA_OP_PREV_COMMITTED: Previous VMA operation
> committed */
> +	XE_VMA_OP_PREV_COMMITTED	=3D BIT(3),
> +	/** @XE_VMA_OP_NEXT_COMMITTED: Next VMA operation committed
> */
> +	XE_VMA_OP_NEXT_COMMITTED	=3D BIT(4),
> +};
> +
> +/** struct xe_vma_op - VMA operation */
> +struct xe_vma_op {
> +	/** @base: GPUVA base operation */
> +	struct drm_gpuva_op base;
> +	/**
> +	 * @ops: GPUVA ops, when set call drm_gpuva_ops_free after this
> +	 * operations is processed
> +	 */
> +	struct drm_gpuva_ops *ops;
> +	/** @q: exec queue for this operation */
> +	struct xe_exec_queue *q;
> +	/**
> +	 * @syncs: syncs for this operation, only used on first and last
> +	 * operation
> +	 */
> +	struct xe_sync_entry *syncs;
> +	/** @num_syncs: number of syncs */
> +	u32 num_syncs;
> +	/** @link: async operation link */
> +	struct list_head link;
> +	/** @flags: operation flags */
> +	enum xe_vma_op_flags flags;
> +
> +	union {
> +		/** @map: VMA map operation specific data */
> +		struct xe_vma_op_map map;
> +		/** @remap: VMA remap operation specific data */
> +		struct xe_vma_op_remap remap;
> +		/** @prefetch: VMA prefetch operation specific data */
> +		struct xe_vma_op_prefetch prefetch;
> +	};
> +};
> +
> +/** struct xe_vma_ops - VMA operations */
> +struct xe_vma_ops {
> +	/** @list: list of VMA operations */
> +	struct list_head list;
> +};

this already showed up on patch 4... you just add it in patch5, then moved =
it to another location on patch 5...

>=20
>  struct xe_vm {
>  	/** @gpuvm: base GPUVM used to track VMAs */
> @@ -267,99 +357,18 @@ struct xe_vm {
>  		bool capture_once;
>  	} error_capture;
>=20
> +	/** @dummy_ops: dummy VMA ops to issue rebinds */
> +	struct {
> +		/** @dummy_ops.ops: dummy VMA ops */
> +		struct xe_vma_ops vops;
> +		/** @dummy_ops.op: dummy VMA op */
> +		struct xe_vma_op op;
> +	} dummy_ops;

If only from this patch, it seems you don't have to introduce this dummy_op=
s member to xe_vm. For example, it can be a local variable in xe_vm_rebind =
function. But I will keep looking. Maybe you made it this way for future pa=
tches.


> +
>  	/** @batch_invalidate_tlb: Always invalidate TLB before batch start */
>  	bool batch_invalidate_tlb;
>  	/** @xef: XE file handle for tracking this VM's drm client */
>  	struct xe_file *xef;
>  };
>=20
> -/** struct xe_vma_op_map - VMA map operation */
> -struct xe_vma_op_map {
> -	/** @vma: VMA to map */
> -	struct xe_vma *vma;
> -	/** @is_null: is NULL binding */
> -	bool is_null;
> -	/** @dumpable: whether BO is dumped on GPU hang */
> -	bool dumpable;
> -	/** @pat_index: The pat index to use for this operation. */
> -	u16 pat_index;
> -};
> -
> -/** struct xe_vma_op_remap - VMA remap operation */
> -struct xe_vma_op_remap {
> -	/** @prev: VMA preceding part of a split mapping */
> -	struct xe_vma *prev;
> -	/** @next: VMA subsequent part of a split mapping */
> -	struct xe_vma *next;
> -	/** @start: start of the VMA unmap */
> -	u64 start;
> -	/** @range: range of the VMA unmap */
> -	u64 range;
> -	/** @skip_prev: skip prev rebind */
> -	bool skip_prev;
> -	/** @skip_next: skip next rebind */
> -	bool skip_next;
> -	/** @unmap_done: unmap operation in done */
> -	bool unmap_done;
> -};
> -
> -/** struct xe_vma_op_prefetch - VMA prefetch operation */
> -struct xe_vma_op_prefetch {
> -	/** @region: memory region to prefetch to */
> -	u32 region;
> -};
> -
> -/** enum xe_vma_op_flags - flags for VMA operation */
> -enum xe_vma_op_flags {
> -	/** @XE_VMA_OP_FIRST: first VMA operation for a set of syncs */
> -	XE_VMA_OP_FIRST			=3D BIT(0),
> -	/** @XE_VMA_OP_LAST: last VMA operation for a set of syncs */
> -	XE_VMA_OP_LAST			=3D BIT(1),
> -	/** @XE_VMA_OP_COMMITTED: VMA operation committed */
> -	XE_VMA_OP_COMMITTED		=3D BIT(2),
> -	/** @XE_VMA_OP_PREV_COMMITTED: Previous VMA operation
> committed */
> -	XE_VMA_OP_PREV_COMMITTED	=3D BIT(3),
> -	/** @XE_VMA_OP_NEXT_COMMITTED: Next VMA operation committed
> */
> -	XE_VMA_OP_NEXT_COMMITTED	=3D BIT(4),
> -};
> -
> -/** struct xe_vma_op - VMA operation */
> -struct xe_vma_op {
> -	/** @base: GPUVA base operation */
> -	struct drm_gpuva_op base;
> -	/**
> -	 * @ops: GPUVA ops, when set call drm_gpuva_ops_free after this
> -	 * operations is processed
> -	 */
> -	struct drm_gpuva_ops *ops;
> -	/** @q: exec queue for this operation */
> -	struct xe_exec_queue *q;
> -	/**
> -	 * @syncs: syncs for this operation, only used on first and last
> -	 * operation
> -	 */
> -	struct xe_sync_entry *syncs;
> -	/** @num_syncs: number of syncs */
> -	u32 num_syncs;
> -	/** @link: async operation link */
> -	struct list_head link;
> -	/** @flags: operation flags */
> -	enum xe_vma_op_flags flags;
> -
> -	union {
> -		/** @map: VMA map operation specific data */
> -		struct xe_vma_op_map map;
> -		/** @remap: VMA remap operation specific data */
> -		struct xe_vma_op_remap remap;
> -		/** @prefetch: VMA prefetch operation specific data */
> -		struct xe_vma_op_prefetch prefetch;
> -	};
> -};
> -
> -/** struct xe_vma_ops - VMA operations */
> -struct xe_vma_ops {
> -	/** @list: list of VMA operations */
> -	struct list_head list;
> -};

It seems you moved a block of codes to another location. It caused more wor=
k for code review. Better to avoid this if we can.

Oak

> -
>  #endif
> --
> 2.34.1

