Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A801C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 03:09:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD79610F9ED;
	Tue, 23 Apr 2024 03:09:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nZJ0GYXC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DEEA10F9ED
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Apr 2024 03:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713841751; x=1745377751;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=t4HJpFEhRLEjkinjpxlPCUp84of436Y+8Xaths2UQbY=;
 b=nZJ0GYXCO98nCfN9VYvemzu0xjvgE6nhV1yuB4QHHwkpnohmsHpTqHTa
 hp2syQbXb31jc4jMfWgDQcTCEtuxAhX/3yGOorALZCu2kZCjQCjnXgzdt
 FYhKYa5eXuvRPLslGY2vmQw7tDnYdaKn5Nxy07jlal9jsQQT9WR0KFZez
 ZVFVxGWpVDmfZLRFzs2Gi5wI6MT2aQwNHzdtOaVExilA36faDJXHEt+fr
 0wWG7bZblGnDcBGj9kiKIlpDDRidcu7CK5QDf1i5KMl++sVQBDbVBcXwj
 T0ouzUpcA98tABscbKOvMto8SWoUHttoqCkLA7unhv+znH+RKrwrfGG27 Q==;
X-CSE-ConnectionGUID: zy0RAKXsQpKuQWA0IKM2tQ==
X-CSE-MsgGUID: fVbzUYM/T+uYOPYX3tHT5Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9517362"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9517362"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 20:09:11 -0700
X-CSE-ConnectionGUID: /ynX7tT4QiC7t/6ME/bkEA==
X-CSE-MsgGUID: mprQn3NnQK6WVMicV3Q/nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24670446"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 20:09:11 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 20:09:10 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 20:09:10 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 20:09:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CkZI2p0ZQ+2eXFGD/+yifdClF37mM0VclTn0ycW7lfu6+dMUr/BNbRPS+/tUAf6/sLy/Y0sYyLBf4B9V2zQF8rJ9bG+Dx3NEhtzdX+ewKG7HiNERrnW/g4W7Gue5yAUxBFBjdqgcfUHWWTR4Csl0X09VDeBEietkFYHTYanGiAJXy1XBuqr9QIrOzGQyaL+/UGtjwRGVGPLvKEY0vC4laHYoh+HLRlX+aLnUWlXhDoWuPCrj+YxD9QKeHeOLC4PfTGmQza5GePAHT5u0BddBTIWKJiE70K7sTMwVVJNeaRyOqnJRqDksQc1CaKnp+fpqXxsROSAVWoPphFn7IHMW5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xcgCMbzL2zs8uAgNb0ko1pIbikC6HNV34tDQbneCFI8=;
 b=XWuI62GAK73BBgmGy1O4J3AQnDLIHXeQNY9uN8TY69wKHIn4YA28PgBkT7qol+C/lrL8EoT/Rjy85jiYeoB35dHxgeRdDylQaakmxyRJq9ya1D4eIPvjXx1TZAk+x1SZKV2h58kVmvrMUQgq/R4J5TKHIMJSIoKP72fnKBtzHHyh8uKW5bGxUW3peaDggmyOraAN0CWwmyqcq3K+c9AxeffWKWfz0WJerl6SZLJ7DCmYcAMY5Xcik8hwMHlRXxNNN24c5Qr5xsCaYyNj/a5Irom+Mrc1mg/ne7ydgWRBTYTuph8fDHHVB9HHt1FYpPHuODvppzxH89QwpGMoRxZkDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by LV2PR11MB6070.namprd11.prod.outlook.com (2603:10b6:408:179::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Tue, 23 Apr
 2024 03:09:07 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7519.018; Tue, 23 Apr 2024
 03:09:07 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 02/13] drm/xe: Add ops_execute function which returns a
 fence
Thread-Topic: [PATCH 02/13] drm/xe: Add ops_execute function which returns a
 fence
Thread-Index: AQHaiwmm2r+3AllXc0e2/xaxJGBOdbFuOgyggAA/aICABsda8A==
Date: Tue, 23 Apr 2024 03:09:07 +0000
Message-ID: <SA1PR11MB6991C21A1E95AC466C00E02992112@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240410054056.478023-1-matthew.brost@intel.com>
 <20240410054056.478023-3-matthew.brost@intel.com>
 <SA1PR11MB69915478598B96B5553FE726920E2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZiF2VSumpZTbIN+z@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZiF2VSumpZTbIN+z@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|LV2PR11MB6070:EE_
x-ms-office365-filtering-correlation-id: a66033a7-43f5-416c-d6fe-08dc6342bd3f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?WUuvePmISkI9r34VxoIz2aVrV83B8zp8Wd6tc/mknE/L0KvyEW/EGAjlprgF?=
 =?us-ascii?Q?XB40KAgbPQOEN+BpzBbOB/F0DzlNOyiM3JWlStMrqx1JaXeFPLuOqqT1wAhB?=
 =?us-ascii?Q?84OrmellwwtTMIsF1w//7DeWLbxL1RmRGZQZJrwsBFvHuEftsXda189u7pFQ?=
 =?us-ascii?Q?6DhKD/kXQZZNzzRXSCI5YfqAdwOifG+aDf8zgbwpIYlrDSwPXwp7NHbIoGU5?=
 =?us-ascii?Q?0BVryDboGCcFsEt94uZvNst0/Yd/MEKy1p7cabvWXXHLILiLqpakJehRK4TR?=
 =?us-ascii?Q?UAWdHbroZWPbfwZ60pRtyWgW70xDpNoWdP+0FiYGffu1Y7wClgcKvmXGxBDy?=
 =?us-ascii?Q?HOsln53ThZMUVVDkK5pVhDDDO7OtQDIMZNCJ+Rxnc+PzS9vWclTDb6tlhtRZ?=
 =?us-ascii?Q?txtL9Ata1FfrDJLixCrKE8MaCje6P7b54mFgT5y9QNVENpvCYvxFxN1ju7Zy?=
 =?us-ascii?Q?7XJqJeRulIwntrailxQJGesGNdFYohvFo4vhnSk69TemFaIDDnN99UKgSZuD?=
 =?us-ascii?Q?bAwhqbmoGGoWltmusLtQ7oTriSjUvdnK+qi+4pt8tTy9bhu93muFccudgk+0?=
 =?us-ascii?Q?xdJ7p/cjJE1YmC5k1KEp0XNXpIOrTOSZe8jG4aShBjoE7pbDVfZ8+cHMNy51?=
 =?us-ascii?Q?/4iRI4Bhsbg62l8qXfVYGvnChvrD21iTiTP/EXPhTkhfReEMzyuS+I17yCrn?=
 =?us-ascii?Q?6vLk+6dTNLx23vf1+2/8w3HBILe3B0ecP3vH3QTqlWxFDZny3dxXnD79Er+f?=
 =?us-ascii?Q?PZIRwkQZSPRutcxJ1JFiPve7pu6hxZ+9YSB9efWWYBQfDwBY91Y8wlq4ieTG?=
 =?us-ascii?Q?IZHBPhQEhNyM4j1+7fYbplgRxyfde5nnSqD8l2nCxrbNeV09UMAs4sotQsRU?=
 =?us-ascii?Q?ktPtA7Qh0tdBJi+8nVBDZuxtdaF9e49+FRejfhWSDbM9vF5UwHPFgSN4RNZD?=
 =?us-ascii?Q?Z3QONx50ByJffUdlJaVln/Y+URwexge7hbBQqaHSun365/g7EgBcb6yly86S?=
 =?us-ascii?Q?A0W8Gi47vxpPdmt9bLUKq3r4jgeS2SRhYxzoijZdJkGDypQqBTVWifAgmw1o?=
 =?us-ascii?Q?VJ7apXW/9Tup53RYWvyx4FKngTZkzjf3ulDRhAcuSHMuceXXaXHzzyLjqD8P?=
 =?us-ascii?Q?j+VrLsMrzar8JiIBWAEPzYgMXr1Ir7TPVahubKnAlAnyArULVb/3wqnVWnk/?=
 =?us-ascii?Q?Wq+5x937j49cTlb3DFyVAgoM+gvPFLVsVQN0g9B9V3cdjZ8A3XsiTAHK6c4b?=
 =?us-ascii?Q?C+S8adbhByi/pNHTE5rHOzR8SFyIUQ1ohLZ2oXk+GSrdERugVWfGp5lb+c7M?=
 =?us-ascii?Q?BE4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9DYT/sK9IALO7d2EFmYHJ6k5vbPE1QuDrGHm7MMVS9gd1QIDH+/1FrRbbq35?=
 =?us-ascii?Q?WqtlrcA/BHVVQ8AXDKnHRimGQIYZhZKnWF4sG5TY8Orlh4CYDWs/W4j0L9Ok?=
 =?us-ascii?Q?LBPMkqpL5W2fCVLhY9udoUDM8edhNKtBMSoHQgKsWTWEQ7vzMAs5i/M0V9T5?=
 =?us-ascii?Q?MExxeR5xfwkvNv+k5YPgqvnhumrMv+qyqB7Rl6xJV2anHkONBEtTLuEpefAE?=
 =?us-ascii?Q?/kN2JvrBxUis6tF2UiV6omEJQpvZFNmqHbwnsy6N6/x5oOfLhhWvcD2/9iOf?=
 =?us-ascii?Q?/9roKQDvpp/hBlmrNfyd2v4oXLlb7RopvEoKxo1dvjA70KWz7bTZ5+nsIJoz?=
 =?us-ascii?Q?WiW7hnHpmKDEbURefnGtl4Zpp+NsnQFr21OSHyfMhuxqyd4I1svdzqH71Nbe?=
 =?us-ascii?Q?7IAEndtrkKAOm2AxV+qTtAVrUo8/0s8KoU+iQsl8EDMw7Hn9pBDfe4jsBYdw?=
 =?us-ascii?Q?tcyD8OjTNJpi8/hjjOygYC/eWosuL8Yx9WnyvLRUJoyvcaRSUxXy+prZxaHk?=
 =?us-ascii?Q?peoTfSzU7IvqG5YccA1GuMQnrTmKT71/edO1/sEiyrdcY5oMcRvgTh4DlVqj?=
 =?us-ascii?Q?9J4f/xTX18HZUQC2KSfUHd7O0vAvLGIljpgqAyGcg/Yrv0b5ifpMgvn4OWXs?=
 =?us-ascii?Q?QpaXfly2UE7lwnLzHEmXcV/i2IstH2Dgn5xt7VipvjLpz6xv7m06vc6RZ48T?=
 =?us-ascii?Q?Fr5Xb/Zrm4c9hBj/Yx4OH59azuWPsWWxn8d/UH5eem6yi+vWbDznJE9S7B2a?=
 =?us-ascii?Q?Of7mgAtb+2MtIizCUfvcECnJKb0Y9DR9mQ3NakuDuId8B0TvkUjyji2Ny+we?=
 =?us-ascii?Q?LHNiaxSHTS05M1pnBcfOCHpcbPQwJmm9hTDgkFwK4ZlH8U9FI2LFslmziOy4?=
 =?us-ascii?Q?1a5UuZNHQHZZcED9njHMDyJsjfh3BnXqavW0DRmU5mDUA5v+XutWgXEn8nJS?=
 =?us-ascii?Q?oASLgQOYbY6AUQLxInPrERDUSsrfaqgeAIgRkRjkL5gNQXhlVAdazzn7X7bn?=
 =?us-ascii?Q?CbxduMSdJAKv2F9HYRaqGOXe7hsI+4VE7P00SwCvqlv+Ie+Peq2tjuI8TzB3?=
 =?us-ascii?Q?z6HtE2QcMFuNAY7/Jvt2Tez+6DIabKVVQBDw9jnTYAka2jz007bRFetwW71J?=
 =?us-ascii?Q?c1orpmawen5i9VCXdZ6YBC8GBgrnfYFOPCUPuZ6NH2aXYf1g0BdbF0zrDj8b?=
 =?us-ascii?Q?HclaYHQ3UMjpw1c/E3/RzeFhsG44qiXG7O6rHIXg7ai+PA+bXGUfsHVv5HYH?=
 =?us-ascii?Q?PH34H+vf78hp2TsN+Mkl/SRTctXB7ct3Xqb4KnhVZDTLh0WRS/CZ+Xj6qYd/?=
 =?us-ascii?Q?L9M15+wj3omNbcKo/6UVvrX2eTeKCS0m+FlbK8jdJu/23DUSGZPrDI5TKdBc?=
 =?us-ascii?Q?ocBJUcduXtPspb1u1YyPDSmA0odId0QrMB50akXLg7RjxqG6Q1P9alzujiJj?=
 =?us-ascii?Q?b1WT8s5sKCS7eh6og6irSBd/EmnqDR0ZVao0hZAVMSmx83/e2Q+f5rlHVv0b?=
 =?us-ascii?Q?UiQXLXG/eS3048nzISwo4HSqPhmGPbTzzRybWJpD/BmQcLVj+lyQZKfBKlOx?=
 =?us-ascii?Q?wDf6MYQeMmvn8KHkW5w=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a66033a7-43f5-416c-d6fe-08dc6342bd3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2024 03:09:07.3729 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +2Irw39R5XdQjhIVLHKHGtuWMgTCPVVp67tp8Re9E6+t/9w79PjLCzJf0ug18oDiTEhHeBAp6M5PYuu818gsUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6070
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
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Thursday, April 18, 2024 3:37 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [PATCH 02/13] drm/xe: Add ops_execute function which returns
> a fence
>=20
> On Thu, Apr 18, 2024 at 10:16:15AM -0600, Zeng, Oak wrote:
> >
> >
> > > -----Original Message-----
> > > From: Brost, Matthew <matthew.brost@intel.com>
> > > Sent: Wednesday, April 10, 2024 1:41 AM
> > > To: intel-xe@lists.freedesktop.org
> > > Cc: Brost, Matthew <matthew.brost@intel.com>; Zeng, Oak
> > > <oak.zeng@intel.com>
> > > Subject: [PATCH 02/13] drm/xe: Add ops_execute function which returns
> a
> > > fence
> > >
> > > Add ops_execute function which returns a fence. This will be helpful =
to
> > > initiate all binds (VM bind IOCTL, rebinds in exec IOCTL, rebinds in
> > > preempt rebind worker, and rebinds in pagefaults) via a gpuva ops lis=
t.
> > > Returning a fence is needed in various paths.
> > >
> > > v2:
> > >  - Rebase
> > >
> > > Cc: Oak Zeng <oak.zeng@intel.com>
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_vm.c | 211 +++++++++++++++++++---------------
> ---
> > >  1 file changed, 111 insertions(+), 100 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index 6375c136e21a..84c6b10b4b78 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -1834,16 +1834,17 @@ find_ufence_get(struct xe_sync_entry
> *syncs,
> > > u32 num_syncs)
> > >  	return NULL;
> > >  }
> > >
> > > -static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
> > > -			struct xe_exec_queue *q, struct xe_sync_entry
> > > *syncs,
> > > -			u32 num_syncs, bool immediate, bool first_op,
> > > -			bool last_op)
> > > +static struct dma_fence *
> > > +xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct
> > > xe_exec_queue *q,
> > > +	   struct xe_bo *bo, struct xe_sync_entry *syncs, u32 num_syncs,
> > > +	   bool immediate, bool first_op, bool last_op)
> > >  {
> > >  	struct dma_fence *fence;
> > >  	struct xe_exec_queue *wait_exec_queue =3D
> > > to_wait_exec_queue(vm, q);
> > >  	struct xe_user_fence *ufence;
> > >
> > >  	xe_vm_assert_held(vm);
> > > +	xe_bo_assert_held(bo);
> > >
> > >  	ufence =3D find_ufence_get(syncs, num_syncs);
> > >  	if (vma->ufence && ufence)
> > > @@ -1855,7 +1856,7 @@ static int __xe_vm_bind(struct xe_vm *vm,
> struct
> > > xe_vma *vma,
> > >  		fence =3D xe_vm_bind_vma(vma, q, syncs, num_syncs,
> > > first_op,
> > >  				       last_op);
> > >  		if (IS_ERR(fence))
> > > -			return PTR_ERR(fence);
> > > +			return fence;
> > >  	} else {
> > >  		int i;
> > >
> > > @@ -1870,26 +1871,14 @@ static int __xe_vm_bind(struct xe_vm *vm,
> > > struct xe_vma *vma,
> > >
> > >  	if (last_op)
> > >  		xe_exec_queue_last_fence_set(wait_exec_queue, vm,
> > > fence);
> > > -	dma_fence_put(fence);
> > > -
> > > -	return 0;
> > > -}
> > > -
> > > -static int xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct
> > > xe_exec_queue *q,
> > > -		      struct xe_bo *bo, struct xe_sync_entry *syncs,
> > > -		      u32 num_syncs, bool immediate, bool first_op,
> > > -		      bool last_op)
> > > -{
> > > -	xe_vm_assert_held(vm);
> > > -	xe_bo_assert_held(bo);
> > >
> > > -	return __xe_vm_bind(vm, vma, q, syncs, num_syncs, immediate,
> > > first_op,
> > > -			    last_op);
> > > +	return fence;
> > >  }
> > >
> > > -static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
> > > -			struct xe_exec_queue *q, struct xe_sync_entry
> > > *syncs,
> > > -			u32 num_syncs, bool first_op, bool last_op)
> > > +static struct dma_fence *
> > > +xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
> > > +	     struct xe_exec_queue *q, struct xe_sync_entry *syncs,
> > > +	     u32 num_syncs, bool first_op, bool last_op)
> > >  {
> > >  	struct dma_fence *fence;
> > >  	struct xe_exec_queue *wait_exec_queue =3D
> > > to_wait_exec_queue(vm, q);
> > > @@ -1899,14 +1888,13 @@ static int xe_vm_unbind(struct xe_vm *vm,
> > > struct xe_vma *vma,
> > >
> > >  	fence =3D xe_vm_unbind_vma(vma, q, syncs, num_syncs, first_op,
> > > last_op);
> > >  	if (IS_ERR(fence))
> > > -		return PTR_ERR(fence);
> > > +		return fence;
> > >
> > >  	xe_vma_destroy(vma, fence);
> > >  	if (last_op)
> > >  		xe_exec_queue_last_fence_set(wait_exec_queue, vm,
> > > fence);
> > > -	dma_fence_put(fence);
> > >
> > > -	return 0;
> > > +	return fence;
> > >  }
> > >
> > >  #define ALL_DRM_XE_VM_CREATE_FLAGS
> > > (DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE | \
> > > @@ -2049,10 +2037,11 @@ static const u32 region_to_mem_type[] =3D {
> > >  	XE_PL_VRAM1,
> > >  };
> > >
> > > -static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
> > > -			  struct xe_exec_queue *q, u32 region,
> > > -			  struct xe_sync_entry *syncs, u32 num_syncs,
> > > -			  bool first_op, bool last_op)
> > > +static struct dma_fence *
> > > +xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
> > > +	       struct xe_exec_queue *q, u32 region,
> > > +	       struct xe_sync_entry *syncs, u32 num_syncs,
> > > +	       bool first_op, bool last_op)
> > >  {
> > >  	struct xe_exec_queue *wait_exec_queue =3D
> > > to_wait_exec_queue(vm, q);
> > >  	int err;
> > > @@ -2062,27 +2051,24 @@ static int xe_vm_prefetch(struct xe_vm *vm,
> > > struct xe_vma *vma,
> > >  	if (!xe_vma_has_no_bo(vma)) {
> > >  		err =3D xe_bo_migrate(xe_vma_bo(vma),
> > > region_to_mem_type[region]);
> > >  		if (err)
> > > -			return err;
> > > +			return ERR_PTR(err);
> > >  	}
> > >
> > >  	if (vma->tile_mask !=3D (vma->tile_present & ~vma->tile_invalidated=
))
> > > {
> > >  		return xe_vm_bind(vm, vma, q, xe_vma_bo(vma), syncs,
> > > num_syncs,
> > >  				  true, first_op, last_op);
> > >  	} else {
> > > +		struct dma_fence *fence =3D
> > > +			xe_exec_queue_last_fence_get(wait_exec_queue,
> > > vm);
> > >  		int i;
> > >
> > >  		/* Nothing to do, signal fences now */
> > >  		if (last_op) {
> > > -			for (i =3D 0; i < num_syncs; i++) {
> > > -				struct dma_fence *fence =3D
> > > -
> > > 	xe_exec_queue_last_fence_get(wait_exec_queue, vm);
> > > -
> > > +			for (i =3D 0; i < num_syncs; i++)
> > >  				xe_sync_entry_signal(&syncs[i], fence);
> > > -				dma_fence_put(fence);
> > > -			}
> > >  		}
> > >
> > > -		return 0;
> > > +		return fence;
> > >  	}
> > >  }
> > >
> > > @@ -2535,10 +2521,10 @@ static int vm_bind_ioctl_ops_parse(struct
> xe_vm
> > > *vm, struct xe_exec_queue *q,
> > >  	return 0;
> > >  }
> > >
> > > -static int op_execute(struct xe_vm *vm, struct xe_vma *vma,
> > > -		      struct xe_vma_op *op)
> > > +static struct dma_fence *op_execute(struct xe_vm *vm, struct xe_vma
> > > *vma,
> > > +				    struct xe_vma_op *op)
> > >  {
> > > -	int err;
> > > +	struct dma_fence *fence =3D NULL;
> > >
> > >  	lockdep_assert_held_write(&vm->lock);
> > >
> > > @@ -2547,11 +2533,11 @@ static int op_execute(struct xe_vm *vm,
> struct
> > > xe_vma *vma,
> > >
> > >  	switch (op->base.op) {
> > >  	case DRM_GPUVA_OP_MAP:
> > > -		err =3D xe_vm_bind(vm, vma, op->q, xe_vma_bo(vma),
> > > -				 op->syncs, op->num_syncs,
> > > -				 op->map.immediate
> > > || !xe_vm_in_fault_mode(vm),
> > > -				 op->flags & XE_VMA_OP_FIRST,
> > > -				 op->flags & XE_VMA_OP_LAST);
> > > +		fence =3D xe_vm_bind(vm, vma, op->q, xe_vma_bo(vma),
> > > +				   op->syncs, op->num_syncs,
> > > +				   op->map.immediate
> > > || !xe_vm_in_fault_mode(vm),
> > > +				   op->flags & XE_VMA_OP_FIRST,
> > > +				   op->flags & XE_VMA_OP_LAST);
> > >  		break;
> > >  	case DRM_GPUVA_OP_REMAP:
> > >  	{
> > > @@ -2561,37 +2547,39 @@ static int op_execute(struct xe_vm *vm,
> struct
> > > xe_vma *vma,
> > >  		if (!op->remap.unmap_done) {
> > >  			if (prev || next)
> > >  				vma->gpuva.flags |=3D XE_VMA_FIRST_REBIND;
> > > -			err =3D xe_vm_unbind(vm, vma, op->q, op->syncs,
> > > -					   op->num_syncs,
> > > -					   op->flags & XE_VMA_OP_FIRST,
> > > -					   op->flags & XE_VMA_OP_LAST &&
> > > -					   !prev && !next);
> > > -			if (err)
> > > +			fence =3D xe_vm_unbind(vm, vma, op->q, op->syncs,
> > > +					     op->num_syncs,
> > > +					     op->flags & XE_VMA_OP_FIRST,
> > > +					     op->flags & XE_VMA_OP_LAST &&
> > > +					     !prev && !next);
> > > +			if (IS_ERR(fence))
> > >  				break;
> > >  			op->remap.unmap_done =3D true;
> > >  		}
> > >
> > >  		if (prev) {
> > >  			op->remap.prev->gpuva.flags |=3D
> > > XE_VMA_LAST_REBIND;
> > > -			err =3D xe_vm_bind(vm, op->remap.prev, op->q,
> > > -					 xe_vma_bo(op->remap.prev), op-
> > > >syncs,
> > > -					 op->num_syncs, true, false,
> > > -					 op->flags & XE_VMA_OP_LAST
> > > && !next);
> > > +			dma_fence_put(fence);
> > > +			fence =3D xe_vm_bind(vm, op->remap.prev, op->q,
> > > +					   xe_vma_bo(op->remap.prev), op-
> > > >syncs,
> > > +					   op->num_syncs, true, false,
> > > +					   op->flags & XE_VMA_OP_LAST
> > > && !next);
> > >  			op->remap.prev->gpuva.flags &=3D
> > > ~XE_VMA_LAST_REBIND;
> > > -			if (err)
> > > +			if (IS_ERR(fence))
> > >  				break;
> > >  			op->remap.prev =3D NULL;
> > >  		}
> > >
> > >  		if (next) {
> > >  			op->remap.next->gpuva.flags |=3D
> > > XE_VMA_LAST_REBIND;
> > > -			err =3D xe_vm_bind(vm, op->remap.next, op->q,
> > > -					 xe_vma_bo(op->remap.next),
> > > -					 op->syncs, op->num_syncs,
> > > -					 true, false,
> > > -					 op->flags & XE_VMA_OP_LAST);
> > > +			dma_fence_put(fence);
> > > +			fence =3D xe_vm_bind(vm, op->remap.next, op->q,
> > > +					   xe_vma_bo(op->remap.next),
> > > +					   op->syncs, op->num_syncs,
> > > +					   true, false,
> > > +					   op->flags & XE_VMA_OP_LAST);
> > >  			op->remap.next->gpuva.flags &=3D
> > > ~XE_VMA_LAST_REBIND;
> > > -			if (err)
> > > +			if (IS_ERR(fence))
> > >  				break;
> > >  			op->remap.next =3D NULL;
> > >  		}
> > > @@ -2599,34 +2587,36 @@ static int op_execute(struct xe_vm *vm,
> struct
> > > xe_vma *vma,
> > >  		break;
> > >  	}
> > >  	case DRM_GPUVA_OP_UNMAP:
> > > -		err =3D xe_vm_unbind(vm, vma, op->q, op->syncs,
> > > -				   op->num_syncs, op->flags &
> > > XE_VMA_OP_FIRST,
> > > -				   op->flags & XE_VMA_OP_LAST);
> > > +		fence =3D xe_vm_unbind(vm, vma, op->q, op->syncs,
> > > +				     op->num_syncs, op->flags &
> > > XE_VMA_OP_FIRST,
> > > +				     op->flags & XE_VMA_OP_LAST);
> > >  		break;
> > >  	case DRM_GPUVA_OP_PREFETCH:
> > > -		err =3D xe_vm_prefetch(vm, vma, op->q, op->prefetch.region,
> > > -				     op->syncs, op->num_syncs,
> > > -				     op->flags & XE_VMA_OP_FIRST,
> > > -				     op->flags & XE_VMA_OP_LAST);
> > > +		fence =3D xe_vm_prefetch(vm, vma, op->q, op-
> > > >prefetch.region,
> > > +				       op->syncs, op->num_syncs,
> > > +				       op->flags & XE_VMA_OP_FIRST,
> > > +				       op->flags & XE_VMA_OP_LAST);
> > >  		break;
> > >  	default:
> > >  		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> > >  	}
> > >
> > > -	if (err)
> > > +	if (IS_ERR(fence))
> > >  		trace_xe_vma_fail(vma);
> > >
> > > -	return err;
> > > +	return fence;
> > >  }
> > >
> > > -static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma
> *vma,
> > > -			       struct xe_vma_op *op)
> > > +static struct dma_fence *
> > > +__xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
> > > +		    struct xe_vma_op *op)
> > >  {
> > > +	struct dma_fence *fence;
> > >  	int err;
> > >
> > >  retry_userptr:
> > > -	err =3D op_execute(vm, vma, op);
> > > -	if (err =3D=3D -EAGAIN) {
> > > +	fence =3D op_execute(vm, vma, op);
> > > +	if (IS_ERR(fence) && PTR_ERR(fence) =3D=3D -EAGAIN) {
> > >  		lockdep_assert_held_write(&vm->lock);
> > >
> > >  		if (op->base.op =3D=3D DRM_GPUVA_OP_REMAP) {
> > > @@ -2643,22 +2633,24 @@ static int __xe_vma_op_execute(struct
> xe_vm
> > > *vm, struct xe_vma *vma,
> > >  			if (!err)
> > >  				goto retry_userptr;
> > >
> > > +			fence =3D ERR_PTR(err);
> > >  			trace_xe_vma_fail(vma);
> > >  		}
> > >  	}
> > >
> > > -	return err;
> > > +	return fence;
> > >  }
> > >
> > > -static int xe_vma_op_execute(struct xe_vm *vm, struct xe_vma_op
> *op)
> > > +static struct dma_fence *
> > > +xe_vma_op_execute(struct xe_vm *vm, struct xe_vma_op *op)
> > >  {
> > > -	int ret =3D 0;
> > > +	struct dma_fence *fence =3D ERR_PTR(-ENOMEM);
> > >
> > >  	lockdep_assert_held_write(&vm->lock);
> > >
> > >  	switch (op->base.op) {
> > >  	case DRM_GPUVA_OP_MAP:
> > > -		ret =3D __xe_vma_op_execute(vm, op->map.vma, op);
> > > +		fence =3D __xe_vma_op_execute(vm, op->map.vma, op);
> > >  		break;
> > >  	case DRM_GPUVA_OP_REMAP:
> > >  	{
> > > @@ -2671,23 +2663,23 @@ static int xe_vma_op_execute(struct xe_vm
> *vm,
> > > struct xe_vma_op *op)
> > >  		else
> > >  			vma =3D op->remap.next;
> > >
> > > -		ret =3D __xe_vma_op_execute(vm, vma, op);
> > > +		fence =3D __xe_vma_op_execute(vm, vma, op);
> > >  		break;
> > >  	}
> > >  	case DRM_GPUVA_OP_UNMAP:
> > > -		ret =3D __xe_vma_op_execute(vm, gpuva_to_vma(op-
> > > >base.unmap.va),
> > > -					  op);
> > > +		fence =3D __xe_vma_op_execute(vm, gpuva_to_vma(op-
> > > >base.unmap.va),
> > > +					    op);
> > >  		break;
> > >  	case DRM_GPUVA_OP_PREFETCH:
> > > -		ret =3D __xe_vma_op_execute(vm,
> > > -					  gpuva_to_vma(op-
> > > >base.prefetch.va),
> > > -					  op);
> > > +		fence =3D __xe_vma_op_execute(vm,
> > > +					    gpuva_to_vma(op-
> > > >base.prefetch.va),
> > > +					    op);
> > >  		break;
> > >  	default:
> > >  		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> > >  	}
> > >
> > > -	return ret;
> > > +	return fence;
> > >  }
> > >
> > >  static void xe_vma_op_cleanup(struct xe_vm *vm, struct xe_vma_op
> *op)
> > > @@ -2861,11 +2853,35 @@ static int
> > > vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
> > >  	return 0;
> > >  }
> > >
> > > +static struct dma_fence *ops_execute(struct xe_vm *vm,
> > > +				     struct list_head *ops_list,
> > > +				     bool cleanup)
> > > +{
> > > +	struct xe_vma_op *op, *next;
> > > +	struct dma_fence *fence =3D NULL;
> > > +
> > > +	list_for_each_entry_safe(op, next, ops_list, link) {
> > > +		if (!IS_ERR(fence)) {
> > > +			dma_fence_put(fence);
> > > +			fence =3D xe_vma_op_execute(vm, op);
> > > +		}
> > > +		if (IS_ERR(fence)) {
> > > +			drm_warn(&vm->xe->drm, "VM op(%d) failed
> > > with %ld",
> > > +				 op->base.op, PTR_ERR(fence));
> > > +			fence =3D ERR_PTR(-ENOSPC);
> >
> > There is a comment before not addressed. Copy as below:
> >
> >
> > > > Once error happen for one operation, you seem to print the same err=
or
> > > message for all the rest operations....because fence =3D
> xe_vma_op_execute(vm,
> > > op) is not called anymore after the first error
> > > >
> > >
> > > Yes.
> >
> > Is this problematic though? Lets say you have 2 ops in the list and
> op_execute failed with op1. You will print as below:
> >
> > VM op1 failed with xxx
> > VM op1 failed with xxx
> >
>=20
> I don't think that is a problem and changes later in the series once
> xe_vma_op_cleanup is removed from this function.

Right.

>=20
> >
> >
> > > +		}
> > > +		if (cleanup)
> > > +			xe_vma_op_cleanup(vm, op);
> > > +	}
> > > +
> > > +	return fence;
> > > +}
> > > +
> > >  static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
> > >  				     struct list_head *ops_list)
> > >  {
> > >  	struct drm_exec exec;
> > > -	struct xe_vma_op *op, *next;
> > > +	struct dma_fence *fence;
> > >  	int err;
> > >
> > >  	lockdep_assert_held_write(&vm->lock);
> > > @@ -2878,19 +2894,14 @@ static int vm_bind_ioctl_ops_execute(struct
> > > xe_vm *vm,
> > >  		if (err)
> > >  			goto unlock;
> > >
> > > -		list_for_each_entry_safe(op, next, ops_list, link) {
> > > -			err =3D xe_vma_op_execute(vm, op);
> > > -			if (err) {
> > > -				drm_warn(&vm->xe->drm, "VM op(%d)
> > > failed with %d",
> > > -					 op->base.op, err);
> > > -				/*
> > > -				 * FIXME: Killing VM rather than proper error
> > > handling
> > > -				 */
> > > -				xe_vm_kill(vm, false);
> > > -				err =3D -ENOSPC;
> > > -				goto unlock;
> > > -			}
> > > -			xe_vma_op_cleanup(vm, op);
> > > +		fence =3D ops_execute(vm, ops_list, true);
> > > +		if (IS_ERR(fence)) {
> > > +			err =3D PTR_ERR(fence);
> > > +			/* FIXME: Killing VM rather than proper error
> > > handling */
> > > +			xe_vm_kill(vm, false);
> > > +			goto unlock;
> > > +		} else {
> > > +			dma_fence_put(fence);
> >
> > I don't get here. You introduced function ops_execute to return the las=
t
> fence of all the operations. But you just put the fence here. Isn't you i=
ntend
> to wait for this fence somehow? What is the point to return a fence from
> ops_execute?
> > i
>=20
> It is used patch #7 [1] and #9 [2] in this series.
>=20
> In [1], the returned fence is used wait on ops to compelete before
> signaling page fault complete to GuC.
>=20
> In [2], the returned fence is used as an argument to
> vm_bind_ioctl_ops_fini which attaches VMA destroy to fence, installs
> fence in IOCTL out-syncs, and sets last fence on the exec queue.

I see. Thanks for explaining. Patch is:

Reviewed-by: Oak Zeng <oak.zeng@intel.com>

>=20
> Matt
>=20
> [1] https://patchwork.freedesktop.org/patch/588594/?series=3D132246&rev=
=3D1
> [2] https://patchwork.freedesktop.org/patch/588595/?series=3D132246&rev=
=3D1
>=20
> > Oak
> >
> >
> > >  		}
> > >  	}
> > >
> > > --
> > > 2.34.1
> >
