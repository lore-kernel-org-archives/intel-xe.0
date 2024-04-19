Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30616C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 03:43:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D824D10FD21;
	Fri, 19 Apr 2024 03:43:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WgV6NsVb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD3E10FD21
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 03:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713498203; x=1745034203;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aGktYilq3m/KDbxqz9GXbzzxhE+EMCqVQS72UPw4Y8g=;
 b=WgV6NsVbfncBltw9/VBQduhRscM1WESaj6hpFGmTKJpCXqRJ4vwrniwn
 NlTv0uSZ5xhXHxz6x3IvLJyVl6bQ0003/IMkXtEkvPIKMi2EBd7ectMIg
 oCoh2lQSYmyvkWux3IctLEG1Njo1sz21UUUthmYivdd+t/H34oe4NFpEC
 47ZPoTT+m/11XxR7CV0B748pYcIBsiJJj8vnJJn4RqCHfwy9A+KAwBNew
 vp/xQxRC13dRv2ABqizzxqSjA8cvH6tQ/E4xz6EoWrB9LkHEERHdB15mq
 BSdbx09vqFPpRR0vWuMU5a5odU2TH13vmU6eJr83710tdkb+N8ewR6MBx w==;
X-CSE-ConnectionGUID: Ack40JAfRzyHgp+qssTTFw==
X-CSE-MsgGUID: 7yAkEQb6SguLRiSuRCgV0Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8943823"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="8943823"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 20:43:23 -0700
X-CSE-ConnectionGUID: LynRlFr6SV20A1VUwnUKSw==
X-CSE-MsgGUID: aY7fyqXSQ7+kkmNwl5TV/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23181828"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Apr 2024 20:43:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 20:43:09 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 20:43:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 20:43:08 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 20:43:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QrKW9GPxtQmpB1zyV7foWQtx81W1nt2DwlrHREB32hrb74nomuPwzLniOofssh+sGB2vWgZq3lMS2vYm2p2J5juqn3lh1qjJkI7nZiGGzq6j2sbYRfQNEv4VKsjI1blWZ4dioY5nOinYIjfE6dlrcgc2w5hih9DVSgRarQaglPt3RIV8tj1lXpBhC998n2Xgkhm7ATT06vdnpq2EOkwQwbtzNevcsz8/fiuuJqlzF74DaeTnVKXL/t27XbNTTorH5nPm+UthzueakOx8P9grDEsOTcUNy16yd8sPFPjNKlw2u9peFKQEqKoKYtsy4V4Q4tUDvuRJ95/Vl0KawNs/YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+AeHWoj1mCNZlbSoyjNjHrv7qXJguE2s0yGrTbKHl0=;
 b=N0+EuzVDUnkL1HQSNDr/1YBoRT6RH7b2NySeNfwgkxvUiMqfQaRJQJlmGafDckcC2ONx/QaRHiN20u8FcBPt8Y0vzAtZZrWgZUTBaLUlY3Zj728er0oaGQhhf7xrETH0XZIupZ2JIHXeq7OlaHhYlAOZBVwvaPsFd/NXgJQt01GIt8aSg09PX8alZMev/EigTNAGXq1cM+ydy8WRcCEeDmjBI1LRRtSfo+2fhw33umNMS5rpPyt1/c2ZO7k5SoCgNnAyz6fDtVgUY+g/HBteuubRyB9E5AJqMKRZYGWHh2oRpW59GnNHJgvIgY60guQvZT2z1OvwfoSrX9QNQTUlEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by SA3PR11MB8023.namprd11.prod.outlook.com (2603:10b6:806:2ff::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.31; Fri, 19 Apr
 2024 03:43:06 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7472.037; Fri, 19 Apr 2024
 03:43:06 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH 05/13] drm/xe: Use xe_vma_ops to implement xe_vm_rebind
Thread-Topic: [PATCH 05/13] drm/xe: Use xe_vma_ops to implement xe_vm_rebind
Thread-Index: AQHaiwm2vy3hET/BjEeusMhbYXbvSrFu/1DQ
Date: Fri, 19 Apr 2024 03:43:06 +0000
Message-ID: <SA1PR11MB699140DE94F7D680AADD7A3E920D2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240410054056.478023-1-matthew.brost@intel.com>
 <20240410054056.478023-6-matthew.brost@intel.com>
In-Reply-To: <20240410054056.478023-6-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|SA3PR11MB8023:EE_
x-ms-office365-filtering-correlation-id: be115cf3-3789-4da6-56f7-08dc6022d2c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ikES9EsxnBAYsP0J4RdL019O6zLB0aqm67KGz1vLYmjM7E3MM7J2+M6+qjkVIuk2GM9Wj86DUiSAQvPVNPK8IYgs2cw028To4LOk1LKK73sM1WkuDzK0l27BrOmTY2s+uk0RU07rRoXAKC6jS40B44UgiUBvE+pWliXZthfQRY1xxM3n6Qt99Um4doFckxL84DkaAv3EdZ06j/Qh90fHq/S/I8HVidneERznakL3gnHZAsdEDwR8ZJs9u/Bi2aOTGY8FqrcfxE6aFDO7+7ihO7QcL96j/9BuvncfvLtf6LuJWwZp7vcQbrPLXXPHBS/QkuMU+sF8fD2Ukd3oUS7cPb03bi+RG0S2zjV+j0Unt32+ajacDnaXlnpeR5Qcvbls+yPYovWw9j2IbJBEY9YTe8ft6UBaJ87QUbbxEwyagmVWHuCTNAVi2t03Fxr5qNigP6+M2SQ+86qlnhr7/yAIk0jOeoBS8nuGBecGUjm71RX4eJNmYAQSeIK0gfJnrrqycbX9fzrNwm1xERXXr4Fn+Lw0NkYk7ua4p1K8Z8AeDVXyvJzs1/oI4x+t3DGZB77sGOImRqSCv8TQ/hdI84uLSi9Hvp4VRZTawRZvlE9Q56OlfbKDc2O8a1ZEfI7vLodVzglF+SNrBrFqclQyN1YkDg5YWh5DvlmiPXDrtER2/B1B9imYmrqu1qYfaH9KPz8kUGiBOjuYX2oIxqZaA7jCrKWqPLbn9aMv9tYE0qboPYw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gpOoe7gwnncBLdIymbVGPVG82wBApjeVAJHj68hHVNOxHdig1DgRIMxqvE4U?=
 =?us-ascii?Q?unH0qqINe4FFArwYMft5C/diTspl5ylInnN61MyU96sGJ4kdTOTjh+qJ9Ku+?=
 =?us-ascii?Q?YYj+Uu7PPSJjhn3iofoA98hEEhkgEdPdEXmZq9mkay1LWzuRVcf4MH8P9LrA?=
 =?us-ascii?Q?B2VfqEerayrAs3oT/GKW5nhJd0Dg/EG6+OKtWLNLgdzyLID5WTrbKGJ901Lo?=
 =?us-ascii?Q?+90KvDWA0mD2WpQbXzl6hlCzxETabuhwU1S4rjJRsKXTAixKICwILf9M8rX/?=
 =?us-ascii?Q?3xQVyJS0QFhKCOkcYZ4XN51T/xhFiFZ6cZh4HrQvEILDeFygnu1T4N2Gye1S?=
 =?us-ascii?Q?PwcO/1e8VW0SOb5sy+dWvhf2i+PsgA6238UXfdi1VnKLAwiBMHTXFtEuRNMb?=
 =?us-ascii?Q?9zNmgc6snxpsXXXsOtuRyF+2OPYs1L6xuIPXudJqQtTUmtVL8qldYNtImIhQ?=
 =?us-ascii?Q?ZnZamlWtp2CSkyp27cNvh/V+V4aLZQXpQ1aDDKQurbmMjwz39vLFbWWLPEgo?=
 =?us-ascii?Q?J7zHSwh0k6agjUPYRxn1Fqouc/PADLunTeN0HgcDVg/tIBN+l7a0BZHIpiFK?=
 =?us-ascii?Q?Z+3jataIzKKkEfF7EZXVy28897CRfqYzvlfXrQ+z8LZlt2wQx/zKgbEdZ3yf?=
 =?us-ascii?Q?dATYjPmqU+cZ0PHpoBj/Saqs1uxKjR7WOMkGO4aMZ25ipqm0QR8MTJATbZCJ?=
 =?us-ascii?Q?Yjea6ZUB18yX1Ds4SnMGql9gDhZU3/UZMjYb2AD+0UUsO8Hmx4qb3XZ191F2?=
 =?us-ascii?Q?kKcv6945O1VGMw8z3aJazU73bqkoPrp2CgDCpRmo82fbDT0heIsOWtvkmm4s?=
 =?us-ascii?Q?sJiQGHXgGtJauVkKBYkuCrPpj6VnBVjSS/uuCv7wGvhcmdsUTcS87WRdsCgB?=
 =?us-ascii?Q?3AraE4GVvHFlhxiq3lZBb7yfhIW7ppDujLcJ1Z8AlVvFKzOk8T8scxfKyll9?=
 =?us-ascii?Q?/Rxsjy4wxwhmQoxbpLYGFmeuQiiCT90GkfqInlZHJRorl9tdc6/gDmhgyIjp?=
 =?us-ascii?Q?ThJ5hhIexDUhTl5t3P6NL13H84Z6peT3/UXTCXy3qAHAF2KhMIHPHRoRMixq?=
 =?us-ascii?Q?dCDUsV0A3qUHkgc66LXKnIF3c3qvu07JHGg9rHSEMtLPVIg7ExseeomgPr3j?=
 =?us-ascii?Q?XmRDWIWaKFukbxfdaL9jkFlxb6wTI2n7l4GuSTdlvxR2EPfrxRggnEm/jT/U?=
 =?us-ascii?Q?e/YirdEgMBqAppCXvv9pXQfEtJWcUQ9rsvIjgEEDsy8kVOkgk2pJsetejnA7?=
 =?us-ascii?Q?HKcgoXrEAi+F8LD87KREEbzGjt1IvwlG0JC/J+9Wurz/PZ264wM+3SlxXlki?=
 =?us-ascii?Q?oK7miKqPmf3WjYZ7W6y2h7wEy1A2BLNbi2BAR47O9mQMDt84/Q5uuLkxuh+2?=
 =?us-ascii?Q?WirbwKEBWkoaMizsPRO5Ab/Xotowiyg08/MDELgvMCKCKhOEM/G95soOiRZb?=
 =?us-ascii?Q?QcXWTC+0CrQIwPDzzXc+oXxkVlCLS19Q4fQxUNJ5eK0/N4WU2cvwm/ivnDkF?=
 =?us-ascii?Q?EpagzlRNnk1Awzt/5odG8Ppd5eVWpWAhP/9euGzVIWg2gqbJ+AqBvAJqhY1c?=
 =?us-ascii?Q?vQtlEVPw8KedtwADUK4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be115cf3-3789-4da6-56f7-08dc6022d2c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2024 03:43:06.0963 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CSXyqDFcWIO5n094ecQIkT4gX5JqjcixHFRR0XPHd4D8lqwbhrS+0gWoHxB1gy438OCRk6lFRR/Mb1nosqn6XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8023
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Matthew Brost
> Sent: Wednesday, April 10, 2024 1:41 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Brost, Matthew <matthew.brost@intel.com>
> Subject: [PATCH 05/13] drm/xe: Use xe_vma_ops to implement
> xe_vm_rebind
>=20
> All page tables updates are moving to a xe_vma_ops interface to
> implement 1 job per VM bind IOCTL.

Just want to make sure I understand it correctly. So far after this patch, =
the rebind is still many jobs (one job per vma), right?


 Convert xe_vm_rebind to use a
> xe_vma_ops based interface.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 78 +++++++++++++++++++++++++++++++-
> ------
>  1 file changed, 64 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 4cd485d5bc0a..9d82396cf5d5 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -811,37 +811,87 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
>  		list_empty_careful(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
>  }
>=20
> -static struct dma_fence *
> -xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
> -	       struct xe_sync_entry *syncs, u32 num_syncs,
> -	       bool first_op, bool last_op);
> +static void xe_vm_populate_rebind(struct xe_vma_op *op, struct xe_vma
> *vma,
> +				  u8 tile_mask)
> +{
> +	INIT_LIST_HEAD(&op->link);
> +	op->base.op =3D DRM_GPUVA_OP_MAP;
> +	op->base.map.va.addr =3D vma->gpuva.va.addr;
> +	op->base.map.va.range =3D vma->gpuva.va.range;
> +	op->base.map.gem.obj =3D vma->gpuva.gem.obj;
> +	op->base.map.gem.offset =3D vma->gpuva.gem.offset;
> +	op->map.vma =3D vma;
> +	op->map.immediate =3D true;
> +	op->map.dumpable =3D vma->gpuva.flags & XE_VMA_DUMPABLE;
> +	op->map.is_null =3D xe_vma_is_null(vma);
> +}
> +
> +static int xe_vm_ops_add_rebind(struct xe_vma_ops *vops, struct xe_vma
> *vma,
> +				u8 tile_mask)
> +{
> +	struct xe_vma_op *op;
> +
> +	op =3D kzalloc(sizeof(*op), GFP_KERNEL);
> +	if (!op)
> +		return -ENOMEM;
> +
> +	xe_vm_populate_rebind(op, vma, tile_mask);
> +	list_add_tail(&op->link, &vops->list);
> +
> +	return 0;
> +}
> +
> +static struct dma_fence *ops_execute(struct xe_vm *vm,
> +				     struct xe_vma_ops *vops,
> +				     bool cleanup);
> +static void xe_vma_ops_init(struct xe_vma_ops *vops);
>=20
>  int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
>  {
>  	struct dma_fence *fence;
>  	struct xe_vma *vma, *next;
> +	struct xe_vma_ops vops;
> +	struct xe_vma_op *op, *next_op;
> +	int err;
>=20
>  	lockdep_assert_held(&vm->lock);
> -	if (xe_vm_in_lr_mode(vm) && !rebind_worker)
> +	if ((xe_vm_in_lr_mode(vm) && !rebind_worker) ||
> +	    list_empty(&vm->rebind_list))
>  		return 0;
>=20
> +	xe_vma_ops_init(&vops);
> +
>  	xe_vm_assert_held(vm);
> -	list_for_each_entry_safe(vma, next, &vm->rebind_list,
> -				 combined_links.rebind) {
> +	list_for_each_entry(vma, &vm->rebind_list, combined_links.rebind)
> {
>  		xe_assert(vm->xe, vma->tile_present);
>=20
> -		list_del_init(&vma->combined_links.rebind);
>  		if (rebind_worker)
>  			trace_xe_vma_rebind_worker(vma);
>  		else
>  			trace_xe_vma_rebind_exec(vma);
> -		fence =3D xe_vm_bind_vma(vma, NULL, NULL, 0, false, false);
> -		if (IS_ERR(fence))
> -			return PTR_ERR(fence);
> +
> +		err =3D xe_vm_ops_add_rebind(&vops, vma,
> +					   vma->tile_present);
> +		if (err)
> +			goto free_ops;
> +	}
> +
> +	fence =3D ops_execute(vm, &vops, false);
> +	if (IS_ERR(fence)) {
> +		err =3D PTR_ERR(fence);

So here, if above ops_execute partially succeed (some vma bind failed, some=
 succeed), for those vmas which are successfully bound, it is kept in the v=
m's rebind_list. Is this the correct behavior? Next time we will rebind the=
m again....


Oak


> +	} else {
>  		dma_fence_put(fence);
> +		list_for_each_entry_safe(vma, next, &vm->rebind_list,
> +					 combined_links.rebind)
> +			list_del_init(&vma->combined_links.rebind);
> +	}
> +free_ops:
> +	list_for_each_entry_safe(op, next_op, &vops.list, link) {
> +		list_del(&op->link);
> +		kfree(op);
>  	}
>=20
> -	return 0;
> +	return err;
>  }
>=20
>  static void xe_vma_free(struct xe_vma *vma)
> @@ -2516,7 +2566,7 @@ static struct dma_fence *op_execute(struct xe_vm
> *vm, struct xe_vma *vma,
>  {
>  	struct dma_fence *fence =3D NULL;
>=20
> -	lockdep_assert_held_write(&vm->lock);
> +	lockdep_assert_held(&vm->lock);
>=20
>  	xe_vm_assert_held(vm);
>  	xe_bo_assert_held(xe_vma_bo(vma));
> @@ -2635,7 +2685,7 @@ xe_vma_op_execute(struct xe_vm *vm, struct
> xe_vma_op *op)
>  {
>  	struct dma_fence *fence =3D ERR_PTR(-ENOMEM);
>=20
> -	lockdep_assert_held_write(&vm->lock);
> +	lockdep_assert_held(&vm->lock);
>=20
>  	switch (op->base.op) {
>  	case DRM_GPUVA_OP_MAP:
> --
> 2.34.1

