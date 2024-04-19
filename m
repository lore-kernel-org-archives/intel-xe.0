Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B026C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 04:19:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A1910E1B5;
	Fri, 19 Apr 2024 04:19:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BuCZIAV2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1594D10E1B5
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 04:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713500349; x=1745036349;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=eymHxJXKX3dZWB/+9LBujsOfKNqSzNkquyT6IQw1bHk=;
 b=BuCZIAV2hNvssYETNJ4A1pi5Qqgeb1NlVroB8kCF3V+h2hWSxzifE5WG
 fZqY+xQ71FOyeGiAap3CKHW7GaiKum/Ue+ycV7fwJp6Sr4JHqoBZHZPmw
 GggR6yVkA9R83p5X0A8J0i73Qm4OgqQ7SaywWdfnNZeD7YyNeoP2wXiAu
 WP09kT5WnFZ/+J9jvPW/xR9Jy4emYb2JF1PZhqVPEhR0FB53P3r3j7wIp
 3ZT4XMOYEWjeYDle+n9VEcXhyQrB4UlNcV3NU3iLDkQ4i4Vxe+rxO8RbC
 Wyu9Y5gGwIWl+roDyxDyReiubQuQvROtzeOrzr/O/0mrU6w1/yDQrIfHE g==;
X-CSE-ConnectionGUID: fSC1IsftSmSECaa/xXTEjg==
X-CSE-MsgGUID: 2RMcoKOFQveI3+Ee7SUwfw==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8923901"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="8923901"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 21:19:08 -0700
X-CSE-ConnectionGUID: k52LiIksT4KOKJLgI7WS/Q==
X-CSE-MsgGUID: T6Cq8RMHT8mM2KfdH3BnFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="27862176"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Apr 2024 21:19:08 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 21:19:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 21:19:07 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 21:19:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FqtkaA2bGuxwtGlprGFMnzTKzbz4N3pwy8Bvs8OiJx1PjgRKdpjOUJTCIGuCn0i0+/SvsESJwZTGGJ6embFLvwSSAxif5iAVEbukLPoxZpkiE/QLwljTizylgSH3wAWnpW7/r64R1u0HxTFU8hRZt0yXDqBWlcmZ/u9zcm1A8735/ILIEPTAwCti8rtJYiVOqjlyv5Lt6N7QGVGDOe/fIDSb/6sxMCwQoxfD1zdz8+vRMYMGkZzVVeVK/L9ndFQke6NJBg/vZxu8iW1rJYAIB/kNRjP0lcwFy+zGeII/pinUMTYTLcuJbudtfoBNqjoYfnEx5ggP8XLGL3r5OMvGEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GsMhLzp4XnMvwSMX58FCZqY0pRt2wUs7lqRK3JfGEuA=;
 b=IhJxm3V0+yy5yyqRQVzA3Cof80KPeMvm1xdZTkqRVvlYjT+Zs1VanipdS8q54u0zloVZYDGFCbVweFeDx2gODXJcP95kAx/2IeIQ5GnijbvBZbuJoMMFShszGi+7Br2rOANjq1vKbFQBKlv0FT23N26eBYf3cSz/vCXAiinCX61w1JwoOtwob8sjxp2K/CNcNY9qpDhPk02GezMRSDwpjB4crIlQNm8KreT+7nH8bNza833FdrLRcL5UXadAJN1p7qFem4HTkN1JV/6ndGJY7d3eMVzFpA/PaoP24QywoGZeYOLly9bKgi4h6cJIhd0Dywbww829TODo+bE1yeeUbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by DM4PR11MB8180.namprd11.prod.outlook.com (2603:10b6:8:18d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.11; Fri, 19 Apr
 2024 04:19:04 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7472.037; Fri, 19 Apr 2024
 04:19:04 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 06/13] drm/xe: Simplify VM bind IOCTL error handling and
 cleanup
Thread-Topic: [PATCH 06/13] drm/xe: Simplify VM bind IOCTL error handling and
 cleanup
Thread-Index: AQHaiwmj7RkRs+9qT0iFJ7ZvlRpfabFvCMvQ
Date: Fri, 19 Apr 2024 04:19:04 +0000
Message-ID: <SA1PR11MB69913C608E671B3214835367920D2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240410054056.478023-1-matthew.brost@intel.com>
 <20240410054056.478023-7-matthew.brost@intel.com>
In-Reply-To: <20240410054056.478023-7-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|DM4PR11MB8180:EE_
x-ms-office365-filtering-correlation-id: 3761b046-b1df-4d0c-bc23-08dc6027d92a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: eD0Qgvt6ZCJcv4T3SHDw+3B3TfHE/zgYGJ7xT0I6YN/vezW7G9RXu68cQQkE30IYCTWX7SCvhQIbEXueVnTZBhm3E2gcZXlOl8bsHrKS6uPmFZorFVa1XZd3LWs60WVybnDulSNmEM7TpxvZWPMwtHorhBbBPKL0Voo/hnv3061ok2//Afm9OhkU+WqLsNyjr4vWiBT6gvCoEuZm9+wF4jCpSyXoZqhcrR9r+iuuBzMP9W+Mlp+ypQotMz9xxEgw3kKY8f/211bejcuoRTL15AbRzhYfFYh3kzb94PV8HGUKe2VMKe1BgpCrjZdMUv+r6bLomX14cNpOsrG/Sc888kZ9IeKWx00W3uOmNsfruC5zCmXGZQuberHGzEQTY8/ifKToytaB+4nRiVU6h/1WapiWemPi3JdPFbrR0UwWhuLWN3FANxMFvZiy6OWFtid1yio3GBlSJshWSAW75YajBt8m+x1dhLYnpTuBOCUPcF91rdEEWmjzYzJqtKiIEZt2SHFALxMiMrZdfsmpoHcGsx086wXtSvp3D05ewvks0QgMREMkX+gxx8wcjIxTaKsJULBL6OLqPeIpF7snnKKJ0ZdUcwDHVSavnEY4MgawsbeV8doONeSncLymySyvtDK3C9SVvL6vkzoqr8aO/kpa6pOVcVupD8+qRmrMjPiutVG0/+/DzLw/1WAARzAQPTufD4zOS/3+6/Q2+m86zhRAtlYYee0fuYdiT8uYiWaQdL8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jWc0qCDEBS7ZphnVwUVJHy+XY4X3JQ/IcBBF3fI+KD0rGKwkOEee5n1wpsOg?=
 =?us-ascii?Q?UsedHQSbXJUU7dUy/HCumsyVs1uJMAEwpt4B+2S3UTkpQ49h5TbGbWdKeDVR?=
 =?us-ascii?Q?LO2ltATQP30ysBU532MvUHh3id/sF7lSC7BpWR5GHCG9Kh7meT6GTbOkBvF+?=
 =?us-ascii?Q?omn/W7th6qWCwnPFdP7tkSiM+voEBYRuLarN9vxC0DOE0MgM0q4HDlP7xnAi?=
 =?us-ascii?Q?AObx7zjyhNqU3m1/f7/rKd2DjhBpxeQKjDM6WFaeK/IoarSnCiv9yapQFr2w?=
 =?us-ascii?Q?bHUbXLp+kJNTwah7cLhp+j0IPYIvVFOBZKLyyw70H+j/7Q+GtV8IikdNGA6M?=
 =?us-ascii?Q?+I5o3qV+KROdyoRBt+zJbgtUawnpVNQtM35WusvP2F/9KTP8gL/6nBjTMWlw?=
 =?us-ascii?Q?3uNjklnQgJmSvk5wypDHVGM5cA57u9q3a21UZb/7NowUzzup7UO7YNXyjx5i?=
 =?us-ascii?Q?NPGvc12HLgEAF3THcgjveVLNzoLzFLrjUWNzaHFKm7pSJMOOEVEh25jkSE3E?=
 =?us-ascii?Q?m3Gb+Inx/oZYMCiwdjVejmGb+m/BRvkoiwMbdI9Vb3yP+ItDuGDry5Rs9vX1?=
 =?us-ascii?Q?NN0dtH+bWdVf8EximuYFfhlVxmWjUEu9qKIdvsd2uLoctzwgvcINNZ27o5ba?=
 =?us-ascii?Q?SCV5QYsa2z1G2NAm704GaNKjZ8mIXILGlHx5fBQqzfKGKyhgRynfYKKmI1SA?=
 =?us-ascii?Q?X3lL80riZKMgcuSCtiSbg607PcZkRZi+qjzYytVB8pPEFpt9OqjeyLlD8lpP?=
 =?us-ascii?Q?mWzfg+75ruaMjJv8hgj4pmiCrkx9QLVDqpoz3BH4cU5qr5SxQ6WzrMVo/lcB?=
 =?us-ascii?Q?zd8EKThisqqgJ+EkcmAOkE3Aip7YY/M7JgkdYCszP7J8IMJjkp6vBxIHGVOB?=
 =?us-ascii?Q?x2oJXM/b80tsKcosP6Si8HBi/swYMgteLBhg3Ip4U8uvC6wYCZ+b7RZI7nMS?=
 =?us-ascii?Q?EngnXKy5W0W9+EU4C4lzXGEfmiecU2G0J5Mmedu3O/6JQ9p6FjHGF1jUYmK5?=
 =?us-ascii?Q?h8RGp20krPxGAWAQqvKN7yyxTKlZgJ1r9fN7pEdagGciGyHUpjv0gjxWx9fC?=
 =?us-ascii?Q?EB7W5ntmKkE3tjvwi2616ysz0MokQM+uINsYZw5oe/kqiCMyiDne/a7NILqC?=
 =?us-ascii?Q?79tVdS31jUkMDFTCbGoqsDNszKe7jUY5pyg/KRjC7ppzwcI2SaG3I6iHruIO?=
 =?us-ascii?Q?5FLB0Oy5UbSGEumaoYfUKI+5kzIvRRPMHq8nFYl3wB8OK9AYvwj1c9pNIVbh?=
 =?us-ascii?Q?1IjfHo2/6mncf4KaugA1E45zQv1Hw8GcwgBDjD7UcCWkeK2rFvlm4Zha7EXs?=
 =?us-ascii?Q?67XihVvx8lWD/EgDUstpIPynl60CK6LWAN1ZnwCsG272wruv/YrX9OF6hupK?=
 =?us-ascii?Q?xTUTScgz52Ee8ITwd9xG591LWv+mBlz1D94Cq5irqYwz/oH5QTMRo0Fc5LWN?=
 =?us-ascii?Q?dDTnuZLmd7b/FzUS5YBfmpK2Rdr4NPwhLTa487VZO/FuPcDtjWYvGEcZTJhX?=
 =?us-ascii?Q?c99FkIR6YJW7xDzTLt1+UiI5muIcvtUwR+hp0EM3lSs7AFgf/3Je2hOsCqgI?=
 =?us-ascii?Q?VpjLGa1RDGxAQlY76S4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3761b046-b1df-4d0c-bc23-08dc6027d92a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2024 04:19:04.2917 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T1jjiPe4yk+8DZ3GIRegi5AJmuhB8zW3RCQGIM19C9eQHefoeUHCuE84ylzJ4JVavhEAdpta8AAP1V8GWYflgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8180
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

It is a nice clean up. See one question inline

> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Wednesday, April 10, 2024 1:41 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Brost, Matthew <matthew.brost@intel.com>; Zeng, Oak
> <oak.zeng@intel.com>
> Subject: [PATCH 06/13] drm/xe: Simplify VM bind IOCTL error handling and
> cleanup
>=20
> Clean up everything in VM bind IOCTL in 1 path for both errors and
> non-errors. Also move VM bind IOCTL cleanup from ops (also used by
> non-IOCTL binds) to the VM bind IOCTL.
>=20
> v2:
>  - Break ops_execute on error (Oak)
>=20
> Cc: Oak Zeng <oak.zeng@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c       | 67 ++++++--------------------------
>  drivers/gpu/drm/xe/xe_vm_types.h |  5 ---
>  2 files changed, 12 insertions(+), 60 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 9d82396cf5d5..8f5b24c8f6cd 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -842,8 +842,7 @@ static int xe_vm_ops_add_rebind(struct xe_vma_ops
> *vops, struct xe_vma *vma,
>  }
>=20
>  static struct dma_fence *ops_execute(struct xe_vm *vm,
> -				     struct xe_vma_ops *vops,
> -				     bool cleanup);
> +				     struct xe_vma_ops *vops);
>  static void xe_vma_ops_init(struct xe_vma_ops *vops);
>=20
>  int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
> @@ -876,7 +875,7 @@ int xe_vm_rebind(struct xe_vm *vm, bool
> rebind_worker)
>  			goto free_ops;
>  	}
>=20
> -	fence =3D ops_execute(vm, &vops, false);
> +	fence =3D ops_execute(vm, &vops);
>  	if (IS_ERR(fence)) {
>  		err =3D PTR_ERR(fence);
>  	} else {
> @@ -2551,7 +2550,6 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm
> *vm, struct xe_exec_queue *q,
>  	if (!last_op)
>  		return 0;
>=20
> -	last_op->ops =3D ops;
>  	if (last) {
>  		last_op->flags |=3D XE_VMA_OP_LAST;
>  		last_op->num_syncs =3D num_syncs;
> @@ -2721,25 +2719,6 @@ xe_vma_op_execute(struct xe_vm *vm, struct
> xe_vma_op *op)
>  	return fence;
>  }
>=20
> -static void xe_vma_op_cleanup(struct xe_vm *vm, struct xe_vma_op *op)
> -{
> -	bool last =3D op->flags & XE_VMA_OP_LAST;
> -
> -	if (last) {
> -		while (op->num_syncs--)
> -			xe_sync_entry_cleanup(&op->syncs[op-
> >num_syncs]);

I understand all the other part of this function is not needed anymore. But=
 I didn't figure out why sync_entry_cleanup is not needed? You still have s=
yncs, do you? They are allocated in bind_ioctl function and seems you didn'=
t touch it in this patch....Can you explain?

Oak


> -		kfree(op->syncs);
> -		if (op->q)
> -			xe_exec_queue_put(op->q);
> -	}
> -	if (!list_empty(&op->link))
> -		list_del(&op->link);
> -	if (op->ops)
> -		drm_gpuva_ops_free(&vm->gpuvm, op->ops);
> -	if (last)
> -		xe_vm_put(vm);
> -}
> -
>  static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
>  			     bool post_commit, bool prev_post_commit,
>  			     bool next_post_commit)
> @@ -2816,8 +2795,6 @@ static void vm_bind_ioctl_ops_unwind(struct
> xe_vm *vm,
>  					 op->flags &
> XE_VMA_OP_PREV_COMMITTED,
>  					 op->flags &
> XE_VMA_OP_NEXT_COMMITTED);
>  		}
> -
> -		drm_gpuva_ops_free(&vm->gpuvm, __ops);
>  	}
>  }
>=20
> @@ -2904,24 +2881,20 @@ static int
> vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
>  }
>=20
>  static struct dma_fence *ops_execute(struct xe_vm *vm,
> -				     struct xe_vma_ops *vops,
> -				     bool cleanup)
> +				     struct xe_vma_ops *vops)
>  {
>  	struct xe_vma_op *op, *next;
>  	struct dma_fence *fence =3D NULL;
>=20
>  	list_for_each_entry_safe(op, next, &vops->list, link) {
> -		if (!IS_ERR(fence)) {
> -			dma_fence_put(fence);
> -			fence =3D xe_vma_op_execute(vm, op);
> -		}
> +		dma_fence_put(fence);
> +		fence =3D xe_vma_op_execute(vm, op);
>  		if (IS_ERR(fence)) {
>  			drm_warn(&vm->xe->drm, "VM op(%d) failed
> with %ld",
>  				 op->base.op, PTR_ERR(fence));
>  			fence =3D ERR_PTR(-ENOSPC);
> +			break;
>  		}
> -		if (cleanup)
> -			xe_vma_op_cleanup(vm, op);
>  	}
>=20
>  	return fence;
> @@ -2944,7 +2917,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm
> *vm,
>  		if (err)
>  			goto unlock;
>=20
> -		fence =3D ops_execute(vm, vops, true);
> +		fence =3D ops_execute(vm, vops);
>  		if (IS_ERR(fence)) {
>  			err =3D PTR_ERR(fence);
>  			/* FIXME: Killing VM rather than proper error
> handling */
> @@ -3305,30 +3278,14 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> void *data, struct drm_file *file)
>  		goto unwind_ops;
>  	}
>=20
> -	xe_vm_get(vm);
> -	if (q)
> -		xe_exec_queue_get(q);
> -
>  	err =3D vm_bind_ioctl_ops_execute(vm, &vops);
>=20
> -	up_write(&vm->lock);
> -
> -	if (q)
> -		xe_exec_queue_put(q);
> -	xe_vm_put(vm);
> -
> -	for (i =3D 0; bos && i < args->num_binds; ++i)
> -		xe_bo_put(bos[i]);
> -
> -	kvfree(bos);
> -	kvfree(ops);
> -	if (args->num_binds > 1)
> -		kvfree(bind_ops);
> -
> -	return err;
> -
>  unwind_ops:
> -	vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
> +	if (err && err !=3D -ENODATA)
> +		vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
> +	for (i =3D args->num_binds - 1; i >=3D 0; --i)
> +		if (ops[i])
> +			drm_gpuva_ops_free(&vm->gpuvm, ops[i]);
>  free_syncs:
>  	if (err =3D=3D -ENODATA)
>  		err =3D vm_bind_ioctl_signal_fences(vm, q, syncs, num_syncs);
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> b/drivers/gpu/drm/xe/xe_vm_types.h
> index 466b6c62d1f9..149ab892967e 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -330,11 +330,6 @@ enum xe_vma_op_flags {
>  struct xe_vma_op {
>  	/** @base: GPUVA base operation */
>  	struct drm_gpuva_op base;
> -	/**
> -	 * @ops: GPUVA ops, when set call drm_gpuva_ops_free after this
> -	 * operations is processed
> -	 */
> -	struct drm_gpuva_ops *ops;
>  	/** @q: exec queue for this operation */
>  	struct xe_exec_queue *q;
>  	/**
> --
> 2.34.1

