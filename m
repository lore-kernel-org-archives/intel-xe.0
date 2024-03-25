Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3903C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 16:52:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0C5110E9C7;
	Mon, 25 Mar 2024 16:52:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ANDc4BnS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C568110E9C3
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 16:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711385524; x=1742921524;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JkfwUrzRPkfJIKzVaMK5XtZeHy/ZkOzDQaf4LpFBjv8=;
 b=ANDc4BnSM5aEmUlOnLtU5xXvzGTNE9SlnI7cL753ouxIXY30o5o0pWGF
 CczlDVYizfW0F/jI34DthDJAKwipcA46M2J0G1rh4t/MPearDrt34sV04
 oAgd5uR8p2wClSMHUr9phE1w9lIL+iLA/cv/qi2cf3CPQW+/EISO9+Hyq
 0n1T5vKo9Ylm+TxMbTkzOghDAHxVlXP74GYXThQIIfqMFJBi4E8nm7iXZ
 h9j+TKK/WxT0tsQAelUZAF7ft0/X2FGYxrXu8/w/J2eH6dyV+OLFGXz7i
 b6r4gZtKKyp+hx/jx1unghmGuWQ5J5CA4Kiyw+nDONAfW5J1cdemfVVKV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="17796407"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="17796407"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 09:51:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="46823625"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 09:51:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 09:51:46 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 09:51:45 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 09:51:45 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 09:51:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JlLfwW4LuqPQv7IMprIQJlPJWle0OGEnRisdZhv2ry63nlaI4QhvA/YOWnQMv4Ynlg6KUqWX13sZWwAsF/EyIjcbiE8m5wiEMN0ji1MkilPPhy0yOK5O/Pdhc5BCKBPt7cbkgJN0oCtP3mIHPhqpsSn3SBfth2TQ0BRGJkKe19YNLuHD0iJZp3fISYiMKfuwYbjaNoLBpDA8vVtSQicHxeljDmd2Xy1SGELhhVP2Wx1sqoFbgafabRPhu2EtPcV5/vSJKeuthNsghbpjg8UHqADT3GqLnPo3xWOBMpZ+mgn3kg3VfSxdWKupFja3fWgLWe9gT1BUO5rvv/p8ZZA28A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mkJAWnOamewRBlBd19JjVqPFimYZ+ej8mdn18KOciBA=;
 b=WgBaSprScuII4gIUH4rlHS/AW9hwHLnzNIPRcAarY7uLBPK0nYHFjBmVwvouan1DPC915JVTX4i2Q49mi8KaysvyXb9v5btJMY8vR0VrfL/3bZ7dgKhnFr72YgWq3Rnuqhg45u+ngd8TlRH5kCJo6KnubPSnlTAUX9sCw4he2rBHFqvUCzHoHMUS5RsaOm3M7eHZ2YBVFZcUY+xuPk19FugGKbs6tM3aDhTfCpUVIoOw/rgoHg7tgNS8oIaSQ2zNi/MTbOZxWZZOj0hHA1LFTY2ogT+MibVvQGUKAGdyE5pWo7+l51YDBW8MLb35tw2o6Dojjy1Y3oBDzWNPws80Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by PH8PR11MB6658.namprd11.prod.outlook.com (2603:10b6:510:1c1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 16:51:43 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Mon, 25 Mar 2024
 16:51:43 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH v4 10/30] drm/xe: Add vm_bind_ioctl_ops_install_fences
 helper
Thread-Topic: [PATCH v4 10/30] drm/xe: Add vm_bind_ioctl_ops_install_fences
 helper
Thread-Index: AQHacRafVlj0P/uDaUC07lZ42Pi0/LFIweZg
Date: Mon, 25 Mar 2024 16:51:43 +0000
Message-ID: <SA1PR11MB699123EE17279306D203608992362@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
 <20240308050806.577176-11-matthew.brost@intel.com>
In-Reply-To: <20240308050806.577176-11-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|PH8PR11MB6658:EE_
x-ms-office365-filtering-correlation-id: dacef604-a446-4776-8d20-08dc4cebd9ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0yg3/A3leXIghW7NauN6KeHhucjFdSMAdih6+YMj7I5JuSH0JdaSGlcvn19ZKMvn6Y9QWohTFxPlVnXp77afUqRvwxF226dJF1HSpHHJCtHqE7TZcvv9ztfOpkmo/cjTJEnHWdiluGO/PnITiRN5SHj+V/2/QmOHInqMOUWZhoJlo/WVjpRSUMaTHcfP1D9BfkP4ysJZoPNym6u/IMktngYSmQ36e4JgF72bB+PZju4N2/qmRvHD5LnDDU5+q/awj+J+rmpPrmpZKNLEGg4tYFKBNLkWTG6sP9uzHbe0xtUzXEzbs4L2zT6Ar0hTyjjBV1bqKi+qv68ZLzvLnESi+6qmdaSgXbJpkLAOEnUX2bLdqxuFpfrN8GkAAUFad86hQK/tx+2gEtrwdUynmJ+M/HKhMzD9H7lB34cYsFQcXwkIVs4C2XZD04Q9Y/hwhx6rWEikwVKjiwszBWqlH7qJhpVvGo99wClEWlV7L1rOzbuWZvnJ0OhmlU6xbcwzFXcVMU6xlNOBJZVJmaXo3qWPAEop6KXgTXDF1LH3UYS7uE4TlrX6ZjDGx4dQIHaFLpkriUCeFA3NVaPX7N20O+LN3Fjae2rQu2O9Sygy/VOcu9sAPDmX5DHrhCj90iQ1++6ZRkMYnTPUTTOBdfemSXyJXNSYMaTb1RTidgurW1jG6B2ThZ1Z6DTF0t9uE6H2lceidAnGeiHQ8bXUl9rTTJy6etGxm7Kx2A7m3YJVFpkOMvE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0MxUV2JZk1e8O50FeyCUYc+dHrrvDJfLPDzWOvm7jFIEE8B8JA+yx8X3N9Nf?=
 =?us-ascii?Q?+3IyeNnPQ17veP63X6qUoy4+xSxThsMGp0KQqj89dgJT/tN9GSxed8tHMXxa?=
 =?us-ascii?Q?IwizfF6QkQLAqrY86M6GEnMt/rv6p6flOCaq40elg5WKsKIbyJ+QY/lL3Ve3?=
 =?us-ascii?Q?SIrwdNTCA4V7iqYxOKqCdHwGYATwgukZnbxd7i2G1Ptv0HCTsrTvvZe9FDTU?=
 =?us-ascii?Q?V3Iri+sDONL3K0jEbKk5hDRY2CfCgDFi+71rKmieE290NGAdEvLVHqjo+dJG?=
 =?us-ascii?Q?CoJB5MlUE4MBi9MzuqiL2qi2qqFNa6MJG1uIe8qZwMHk13lc8PWwWxmtzLnB?=
 =?us-ascii?Q?lOxGuZTWppJM0vmzMlMEJIVMw25SJelNPGLriwm7Q2S8m8gAfIUphaNQQPWM?=
 =?us-ascii?Q?qcn1YYnt0NWT4+yEFg+Clre4bdALQDvVfE2Ox61dRYYdbpGBjNOtEOG7E4gx?=
 =?us-ascii?Q?ZPVwFF20OBmBmISJiImS2oes8aI3rZP4BLhwJ+IdTHAujuJYDe53+U5oUc5Q?=
 =?us-ascii?Q?7i0YM+CzinAcvjP5TGjKEaXUhrjvY39HOHdOnNwI2odKGKmmgguVuvmRkfJO?=
 =?us-ascii?Q?D4x333c3O71Ox82qsdiV416s1rVcXb2qq+bwRAeYrldwgztZ9mGsVl11xbZU?=
 =?us-ascii?Q?BlVH1uysh4V5gMMAgXvbX8YZdFevtbF83pKWAqLf82QsLxx3/fqCmIvztxBG?=
 =?us-ascii?Q?f4UyGPpT4ivfN/DTq+CwK6w/07AtLtNZCIc4FdeOyEyxQVYXd4yaa083vJuh?=
 =?us-ascii?Q?P0TMGqqFizCVIDyvMBJs0CL9IR3/elCD+3fnSK9QWY4pox/h3G8nuvnga8YM?=
 =?us-ascii?Q?SKdVS0gCd9QmTNs8LXUxzU0Uy8Iq3qGunNP9DSG3c4zeATXqXmV1g18WjN+7?=
 =?us-ascii?Q?c/poD9sHjOlf22Y1OvxCpDiDSTRq5LjUDgCBqi4K3kTeB8iHsTTgFTGmSqej?=
 =?us-ascii?Q?VBCfYCoEHCAwJ58ngmksOvfyQDO1T6hX78kLo42utKJjO0F7wW6yATzpyWPx?=
 =?us-ascii?Q?NX8SmC0G+oBslct7oSU0s5Dwg7EIAtCk5wrqhEdBw60rgnineTq9/9qZbFpW?=
 =?us-ascii?Q?BfwTds7pxEUBNJ80cb3syi8A2P1VuTOZcg8QykaX1Akn3aOIGuTRd3B8ZgQk?=
 =?us-ascii?Q?9QnrFxp2oBAilIXBtdEo6RD7FFgr5F74DHNP5k5gLxwSNBNRqtulrIj4MbBD?=
 =?us-ascii?Q?yn0ZH2LvUo5zQ/Vb7oDLY/H6z+bd8etffX5QKXwK/BeQEaokG5B394i8fZgR?=
 =?us-ascii?Q?6MWmSEGnccfFjE1+5VZB9jXz7nGVUUZHSAvVRk++A+ofdNgZoP909Xpk2wvo?=
 =?us-ascii?Q?hMiG2BAF01UARIwqR9UQNBZj2w1LfAOf/xcn0vAJJr6wqkBgB2bcI7jvB2Ns?=
 =?us-ascii?Q?/sFNOFktFoqZDPL0PdT4sQA+C2UAN2wHCk2qlrQ66cP0239GfxIHVeMiy7d0?=
 =?us-ascii?Q?CrqH83VxZaDgaHsV0ut4s488ZWfavlESKrKWeGKGjWeee0HUcwJ1mkYdkU9t?=
 =?us-ascii?Q?eToSyTVy5hige7AsfY/cqgV4kHXRJ/9ZsgrnD69GUkS0DgCxYMPChz/g4uTI?=
 =?us-ascii?Q?Z+JUcr6aKLCofOo5Kps=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dacef604-a446-4776-8d20-08dc4cebd9ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2024 16:51:43.2760 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8TtL3O3I6pqUv5Z836LoLBwbH24ZOFER4XmkV/LT4/oAVxDB+P60ZNpgzAzFhCrgtUmjE0ynfF3hi5joQhs1Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6658
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
> Subject: [PATCH v4 10/30] drm/xe: Add vm_bind_ioctl_ops_install_fences he=
lper
>=20
> Simplify VM bind code by signaling out-fences / destroying VMAs in a
> single location. Will help with transition single job for many bind ops.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 55 ++++++++++++++++----------------------
>  1 file changed, 23 insertions(+), 32 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index f8b27746e5a7..8c96c98cba37 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1658,7 +1658,7 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct
> xe_exec_queue *q,
>  	struct dma_fence *fence =3D NULL;
>  	struct dma_fence **fences =3D NULL;
>  	struct dma_fence_array *cf =3D NULL;
> -	int cur_fence =3D 0, i;
> +	int cur_fence =3D 0;
>  	int number_tiles =3D hweight8(vma->tile_present);
>  	int err;
>  	u8 id;
> @@ -1716,10 +1716,6 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct
> xe_exec_queue *q,
>=20
>  	fence =3D cf ? &cf->base : !fence ?
>  		xe_exec_queue_last_fence_get(wait_exec_queue, vm) : fence;
> -	if (last_op) {
> -		for (i =3D 0; i < num_syncs; i++)
> -			xe_sync_entry_signal(&syncs[i], NULL, fence);
> -	}
>=20
>  	return fence;
>=20
> @@ -1743,7 +1739,7 @@ xe_vm_bind_vma(struct xe_vma *vma, struct
> xe_exec_queue *q,
>  	struct dma_fence **fences =3D NULL;
>  	struct dma_fence_array *cf =3D NULL;
>  	struct xe_vm *vm =3D xe_vma_vm(vma);
> -	int cur_fence =3D 0, i;
> +	int cur_fence =3D 0;
>  	int number_tiles =3D hweight8(vma->tile_mask);
>  	int err;
>  	u8 id;
> @@ -1790,12 +1786,6 @@ xe_vm_bind_vma(struct xe_vma *vma, struct
> xe_exec_queue *q,
>  		}
>  	}
>=20
> -	if (last_op) {
> -		for (i =3D 0; i < num_syncs; i++)
> -			xe_sync_entry_signal(&syncs[i], NULL,
> -					     cf ? &cf->base : fence);
> -	}
> -
>  	return cf ? &cf->base : fence;
>=20
>  err_fences:
> @@ -1847,15 +1837,8 @@ xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
> struct xe_exec_queue *q,
>  		if (IS_ERR(fence))
>  			return fence;
>  	} else {
> -		int i;
> -
>  		xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
> -
>  		fence =3D xe_exec_queue_last_fence_get(wait_exec_queue, vm);
> -		if (last_op) {
> -			for (i =3D 0; i < num_syncs; i++)
> -				xe_sync_entry_signal(&syncs[i], NULL, fence);
> -		}
>  	}
>=20
>  	if (last_op)
> @@ -1879,7 +1862,6 @@ xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
>  	if (IS_ERR(fence))
>  		return fence;
>=20
> -	xe_vma_destroy(vma, fence);
>  	if (last_op)
>  		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
>=20
> @@ -2037,17 +2019,7 @@ xe_vm_prefetch(struct xe_vm *vm, struct xe_vma
> *vma,
>  		return xe_vm_bind(vm, vma, q, xe_vma_bo(vma), syncs,
> num_syncs,
>  				  vma->tile_mask, true, first_op, last_op);
>  	} else {
> -		struct dma_fence *fence =3D
> -			xe_exec_queue_last_fence_get(wait_exec_queue, vm);
> -		int i;
> -
> -		/* Nothing to do, signal fences now */
> -		if (last_op) {
> -			for (i =3D 0; i < num_syncs; i++)
> -				xe_sync_entry_signal(&syncs[i], NULL, fence);
> -		}
> -
> -		return fence;
> +		return xe_exec_queue_last_fence_get(wait_exec_queue, vm);
>  	}
>  }
>=20
> @@ -2844,6 +2816,25 @@ struct dma_fence *xe_vm_ops_execute(struct xe_vm
> *vm, struct xe_vma_ops *vops)
>  	return fence;
>  }
>=20
> +static void vm_bind_ioctl_ops_install_fences(struct xe_vm *vm,
> +					     struct xe_vma_ops *vops,
> +					     struct dma_fence *fence)

Is this a correct function name? from the codes below, you destroyed the te=
mporary vmas during vm_ioctl, then signaled all the sync entries, then you =
destroyed the fence generated from the last operation.... it is more like a=
 cleanup stage of the vm_bind.... But I don't quite understand the code, se=
e below questions...


> +{
> +	struct xe_vma_op *op;
> +	int i;
> +
> +	list_for_each_entry(op, &vops->list, link) {
> +		if (op->base.op =3D=3D DRM_GPUVA_OP_UNMAP)
> +			xe_vma_destroy(gpuva_to_vma(op->base.unmap.va),
> fence);
> +		else if (op->base.op =3D=3D DRM_GPUVA_OP_REMAP)
> +			xe_vma_destroy(gpuva_to_vma(op-
> >base.remap.unmap->va),
> +				       fence);
> +	}
> +	for (i =3D 0; i < vops->num_syncs; i++)
> +		xe_sync_entry_signal(vops->syncs + i, NULL, fence);

This signals the out-fence of vm_bind ioctl. Isn't this be done *after* fen=
ce is signaled (aka means the last vm bind operation is done)?


> +	dma_fence_put(fence);


I know this is also in the original code below... but I also don't understa=
nd why we can destroy fence here. As I understand it, this fence is generat=
ed during vm_bind operations. This is the last fence. Shouldn't we wait thi=
s fence somewhere so we know all the vm bind operations have been complete?=
 I need your help to understand the picture here.

Oak

> +}
> +
>  static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
>  				     struct xe_vma_ops *vops)
>  {
> @@ -2868,7 +2859,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm
> *vm,
>  			xe_vm_kill(vm, false);
>  			goto unlock;
>  		} else {
> -			dma_fence_put(fence);
> +			vm_bind_ioctl_ops_install_fences(vm, vops, fence);
>  		}
>  	}
>=20
> --
> 2.34.1

