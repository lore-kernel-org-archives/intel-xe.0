Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68004C54E64
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 19:44:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A7110E0F8;
	Mon, 25 Mar 2024 19:44:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cs9FpKVV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE89510E0F8
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 19:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711395891; x=1742931891;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/WNETtyKtJFL1SIldxNIByYNzttETgwUwwf45z5F4No=;
 b=Cs9FpKVVc7LNvH1W4BbzehVkjVms6xSl3rGEKsMVYh8VB1hsSdBTeBUh
 FlFRI0eYO4wgZo9NY2CMdpCP/1IJIp9DjdM39t02ENpQu72UvL8WqGNH3
 aJOaKxIc8liAujQnUMhiLi5EC0qLZEUNVrkBjRd3l6JftBBKCfVbkSX+R
 EAyZYxK3EgyK9Lz7CzOwPIOfWYG32dHHudJ/+O6Myaly8WJMAPgKPkbHL
 6XKHC0+iyhSrcrCxqr+GIV0gTjuv49SpAHtg7xTKK8/Q5irPMGLkEJUU1
 mdiuwGv0GLHAaovMZmOUEb08li2x2ghuZJcQd7UzuvbkFJYhD9YajJf+z Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="31858651"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; d="scan'208";a="31858651"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 12:44:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; d="scan'208";a="16391760"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 12:44:50 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 12:44:49 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 12:44:49 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 12:44:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bdnpqUmrB/DINjRByND4gB6MCXlDZ3OOSv7XvL1KkMisANlKa9ElvtLTJiuTECPdGTlowEkQ7t05NL+CaL2Sbk7bzN0Hbm402n12+dURwBtyyrxd6IbsjzqOu5A6RLJy3rSAeALOOLZoHTwu80cvjNEkCLdcY2Lh5i3CW28fYyx8VyqOd2npRAe6NcoAn9m7QAum0oah2yT3HGUN/h27sfEtlhkguIXLSoBh7mPj8Fbm9KF3q/vRNjz0cpfFcbP//aDoGhj3DPdKZ1AjpYGU2+3NoOc4ZNFPjjyU5nPL1ioGLvYD2RiHW5TvkT8YuiFJezBBL9JdmZ++LUqW4EDm6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7q0cqMVDmGvVC0Zljw+EZ7UyB6MK7QfjWBGjsWQiGCQ=;
 b=SQAn0nSkeTupf1x8FF1nRdlnGqgerkj0oyNykgEYPQluiueFdQNEmuUD1657BJ81SDmtrHX5cbKhs/2AlpYxtgjxtoUnQA/4/uqRoah1xsZt/JY/AIhdbVjjG2KWMCSDeO6kS4oAqJUchL0i7+vLJeYa8VKdIv+TjJ2mXsNu2jRlZ/2erOqcAMhYZTCHhsyueF3g+JPbJynHednuXn9eE8WuRGdsZncRh8802oMfxoynTtLN2Dw64boEtibXq550Ryp8WQeNR/PRC0HOfeodz5X3LlIrG2LaZx+8Uz5egAuGidU27fUckB6AovbVzk1gXabDvD1Mh3w1xjRiLdoHuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by SA0PR11MB4525.namprd11.prod.outlook.com (2603:10b6:806:9d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Mon, 25 Mar
 2024 19:44:46 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Mon, 25 Mar 2024
 19:44:46 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v4 10/30] drm/xe: Add vm_bind_ioctl_ops_install_fences
 helper
Thread-Topic: [PATCH v4 10/30] drm/xe: Add vm_bind_ioctl_ops_install_fences
 helper
Thread-Index: AQHacRafVlj0P/uDaUC07lZ42Pi0/LFIweZggAAy9wCAAAGhAA==
Date: Mon, 25 Mar 2024 19:44:46 +0000
Message-ID: <SA1PR11MB6991DA9B8CCD7885FF4C545092362@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
 <20240308050806.577176-11-matthew.brost@intel.com>
 <SA1PR11MB699123EE17279306D203608992362@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZgHR4qXDFWIT0umE@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZgHR4qXDFWIT0umE@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|SA0PR11MB4525:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /D85yN+5vFKTme8hvHAHE0PEopWt/2h9+AwI+wrgMg3Bg7URloTvjVUjYR2F+4fj98CIzleRnpC4aUEwxJCDMTYJMSPNzflLX745UmdlX+15aDnL1bWkkky5p9zPpRMRGi9GcYdn3kwVhNqpwKN3y9O0lDvEvzSYRabY6ZI0xqRAoLPqItZhKNkv13UuRa17D66crc5monF3iQzEUUFBrkyfkp2GdmRzZ8YoNd0JkE+il2vpxMhzuMbOhCizmVbiITpUvVK4iQF62u7qjxX+sHcd+/lcNXRFalX2w9R5zg/+JtlDo5ZogRyAPlI/mc4oiBbrr8oxoXcDprgrHlUNa8BIq8LCZ3XYLRsep/s8Pxyp6Qz/B5HRoiylhhNPryvQPUFf1Ym0nZra7frEl3Dpp4HjqTLUA79q13/WHaQSCCrgoNWMJsyXXXl0/iBrco/Ls8gxNd4+gIQLPQ3/1Joa10PkmGKMzx3jJdmN0lDq7OLUKiLaKbgR3pYgSPii2neu9O+nlTOuywr0YINsNhAyhx3Rc8WxKed/K+taMXePZxsGtZGC6etN8NDjOBopYbVqPh8H27D5qNHD4uBIUfL8uULxWta1EcQhVSEaLKzSbhO38uwQZYaNAVMVoMorj0jlmpIe1HlClSXfHGqm+ZzVo16O9NGsOPcuf+71WSVZ8jQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wa2OEw7OSsGu/66sSZO6SuZHQ/hEB5QmLCm/ZIVhJ1/ByGifEdMX7iEK5P8S?=
 =?us-ascii?Q?vAfnDbY82Fp6GqLnis3SO4OlX+H81tCLIrKI2jBy3n5VFPBw3Fy33r7aeFyo?=
 =?us-ascii?Q?mtzLuPsHGyUnQGnuSCiS0mB3IzpoFVy+ATp6olQMrZMYhx1aILFF8K5pc6r6?=
 =?us-ascii?Q?9Sz9pIy0gA90V0ZNoO0sO4BuJfwI0mDQzBhdmi7nwBjdaDGu+ILlpU2m/O31?=
 =?us-ascii?Q?b3EherDk47KOSaLpwtwhiYlpv2kpQAiAYNr40Y2By0SyUURd4dST6amEvr9K?=
 =?us-ascii?Q?XG8lhbf/rmvHcFbxcKYuN+QaXoWsF5wY0QThr9ZfTcSoDdPja3wDNHh4fMX1?=
 =?us-ascii?Q?q/tbJPasnzqm0fsHSCYm72MYYR1qwSWeyTMlHx4l3xE3E2XNsIZhG0LKicnx?=
 =?us-ascii?Q?1wvUK5BrF7Wi6Lo2jBT2je61t0mVfDk8lz1rISOEtTgIxLmDTGnOT51T6Vfy?=
 =?us-ascii?Q?EpMpJGLRmoPjItLF9SRO/c/r835BzNfoZhVx6lrf9V/INqwj+dVsnQ1H50wF?=
 =?us-ascii?Q?Y/XvPYkj0IH5yCzOOi8inpp6RWsFGyP7QKBWU1EdiW/Dmw96qXa0Zl6bhRwh?=
 =?us-ascii?Q?CX6PgLyDUJ7ADXwCgnBaTl+GHsvqwwjHcI2pU6OzYT8AGC4F2BkVyDZRIxEg?=
 =?us-ascii?Q?8fQHvPLkoPWn6FHVEaVNiZ9sAN48wWR/qHMwEBHxXiGY7anqf6MdDb7qTV+M?=
 =?us-ascii?Q?1d9PIlWOj9ePgpZyXtPpytUT+RnD3ZAr/oyROvICg5jWSBxERfbAz7V+dzyO?=
 =?us-ascii?Q?fnq08CWHKlXlc9AnBogEmghapvTJj9m2Bywkfu+ml7fNscgEjQNvnFzEVvzs?=
 =?us-ascii?Q?S2MYfKGhd4L7kFayLhezmqBUCrtpjs1nV6Ru4Zzd3VBF/2pjzMpcgcaWSr9D?=
 =?us-ascii?Q?agwDInA3+YdM46twTaHYAV01Ojadvm3auYG5YyHF60zSqzMaK3k+05jZeME9?=
 =?us-ascii?Q?t0UdpdRLqX4S4b4K4yx2L3PCDLp2MxfW4DLrTyv6WWDnTmj2denSk6KHaEM5?=
 =?us-ascii?Q?N/EC4CbT//bjxvZ3skMGJS2H8zYW8PxElFSL2GfuXzIE39Q6O2feQcCPnVn8?=
 =?us-ascii?Q?ixH6Ar5L2j4J+P/jgVnNS6pZjE/sRdDaEiaoeo+6wpFe5IRhVMydqC6iG+Au?=
 =?us-ascii?Q?SAnjq77NBKrX1uY+VLXlRjs87HSJGesh5qgmOxXyG8EJDoEOXk2Xh5dokDuh?=
 =?us-ascii?Q?0uewxjhjC/0Vzoa7rSOYElkYGd3IIUudaunsLzoN2Dn8ivp+/w2re4C5EY/e?=
 =?us-ascii?Q?s2H3PsJJkDsqQJ0aLNNOyP0Db0oGieQxEHQIu/Vc7eghdrc03uP31DWMKILQ?=
 =?us-ascii?Q?woOBj8YhOWtTBwQUvQ+vdnulfJcA/V/n0sGN7LgO4Vy1YurPcF7TI0UfuYjC?=
 =?us-ascii?Q?9g5CiRF+2KcO3p+pBw8Eikbt0BEVEl194TK42t7G7lGttt9biaDn72YDo3mB?=
 =?us-ascii?Q?GzYVb6J9fMTRAwPD8Gk7z30u381SlSF+yY2ueULLdm8g0Bqz3Dlng9Zd+BEE?=
 =?us-ascii?Q?OJU79shFCcx+Buo/TkQp6LVt/V0uM0kaoNKomN8y4MocowljlUr5TBB0AFLh?=
 =?us-ascii?Q?u2O9W7XYDOnDQDBqK4Q=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b0a7f73-c3ef-4257-7e72-08dc4d040685
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2024 19:44:46.3856 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q0a/+uuDy2BSXn5MwmcEPiq8wWTvcoORJf4OiVvUO09dOhVU1YEKirsnqe2jrSvTN84AiixE49qPO8jxTx23SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4525
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
> Sent: Monday, March 25, 2024 3:35 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [PATCH v4 10/30] drm/xe: Add vm_bind_ioctl_ops_install_fence=
s
> helper
>=20
> On Mon, Mar 25, 2024 at 10:51:43AM -0600, Zeng, Oak wrote:
> >
> >
> > > -----Original Message-----
> > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Matthew
> > > Brost
> > > Sent: Friday, March 8, 2024 12:08 AM
> > > To: intel-xe@lists.freedesktop.org
> > > Cc: Brost, Matthew <matthew.brost@intel.com>
> > > Subject: [PATCH v4 10/30] drm/xe: Add vm_bind_ioctl_ops_install_fence=
s
> helper
> > >
> > > Simplify VM bind code by signaling out-fences / destroying VMAs in a
> > > single location. Will help with transition single job for many bind o=
ps.
> > >
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_vm.c | 55 ++++++++++++++++--------------------=
--
> > >  1 file changed, 23 insertions(+), 32 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index f8b27746e5a7..8c96c98cba37 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -1658,7 +1658,7 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct
> > > xe_exec_queue *q,
> > >  	struct dma_fence *fence =3D NULL;
> > >  	struct dma_fence **fences =3D NULL;
> > >  	struct dma_fence_array *cf =3D NULL;
> > > -	int cur_fence =3D 0, i;
> > > +	int cur_fence =3D 0;
> > >  	int number_tiles =3D hweight8(vma->tile_present);
> > >  	int err;
> > >  	u8 id;
> > > @@ -1716,10 +1716,6 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct
> > > xe_exec_queue *q,
> > >
> > >  	fence =3D cf ? &cf->base : !fence ?
> > >  		xe_exec_queue_last_fence_get(wait_exec_queue, vm) : fence;
> > > -	if (last_op) {
> > > -		for (i =3D 0; i < num_syncs; i++)
> > > -			xe_sync_entry_signal(&syncs[i], NULL, fence);
> > > -	}
> > >
> > >  	return fence;
> > >
> > > @@ -1743,7 +1739,7 @@ xe_vm_bind_vma(struct xe_vma *vma, struct
> > > xe_exec_queue *q,
> > >  	struct dma_fence **fences =3D NULL;
> > >  	struct dma_fence_array *cf =3D NULL;
> > >  	struct xe_vm *vm =3D xe_vma_vm(vma);
> > > -	int cur_fence =3D 0, i;
> > > +	int cur_fence =3D 0;
> > >  	int number_tiles =3D hweight8(vma->tile_mask);
> > >  	int err;
> > >  	u8 id;
> > > @@ -1790,12 +1786,6 @@ xe_vm_bind_vma(struct xe_vma *vma, struct
> > > xe_exec_queue *q,
> > >  		}
> > >  	}
> > >
> > > -	if (last_op) {
> > > -		for (i =3D 0; i < num_syncs; i++)
> > > -			xe_sync_entry_signal(&syncs[i], NULL,
> > > -					     cf ? &cf->base : fence);
> > > -	}
> > > -
> > >  	return cf ? &cf->base : fence;
> > >
> > >  err_fences:
> > > @@ -1847,15 +1837,8 @@ xe_vm_bind(struct xe_vm *vm, struct xe_vma
> *vma,
> > > struct xe_exec_queue *q,
> > >  		if (IS_ERR(fence))
> > >  			return fence;
> > >  	} else {
> > > -		int i;
> > > -
> > >  		xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
> > > -
> > >  		fence =3D xe_exec_queue_last_fence_get(wait_exec_queue, vm);
> > > -		if (last_op) {
> > > -			for (i =3D 0; i < num_syncs; i++)
> > > -				xe_sync_entry_signal(&syncs[i], NULL, fence);
> > > -		}
> > >  	}
> > >
> > >  	if (last_op)
> > > @@ -1879,7 +1862,6 @@ xe_vm_unbind(struct xe_vm *vm, struct xe_vma
> *vma,
> > >  	if (IS_ERR(fence))
> > >  		return fence;
> > >
> > > -	xe_vma_destroy(vma, fence);
> > >  	if (last_op)
> > >  		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
> > >
> > > @@ -2037,17 +2019,7 @@ xe_vm_prefetch(struct xe_vm *vm, struct xe_vma
> > > *vma,
> > >  		return xe_vm_bind(vm, vma, q, xe_vma_bo(vma), syncs,
> > > num_syncs,
> > >  				  vma->tile_mask, true, first_op, last_op);
> > >  	} else {
> > > -		struct dma_fence *fence =3D
> > > -			xe_exec_queue_last_fence_get(wait_exec_queue, vm);
> > > -		int i;
> > > -
> > > -		/* Nothing to do, signal fences now */
> > > -		if (last_op) {
> > > -			for (i =3D 0; i < num_syncs; i++)
> > > -				xe_sync_entry_signal(&syncs[i], NULL, fence);
> > > -		}
> > > -
> > > -		return fence;
> > > +		return xe_exec_queue_last_fence_get(wait_exec_queue, vm);
> > >  	}
> > >  }
> > >
> > > @@ -2844,6 +2816,25 @@ struct dma_fence *xe_vm_ops_execute(struct
> xe_vm
> > > *vm, struct xe_vma_ops *vops)
> > >  	return fence;
> > >  }
> > >
> > > +static void vm_bind_ioctl_ops_install_fences(struct xe_vm *vm,
> > > +					     struct xe_vma_ops *vops,
> > > +					     struct dma_fence *fence)
> >
> > Is this a correct function name? from the codes below, you destroyed th=
e
> temporary vmas during vm_ioctl, then signaled all the sync entries, then =
you
> destroyed the fence generated from the last operation.... it is more like=
 a cleanup
> stage of the vm_bind.... But I don't quite understand the code, see below
> questions...
> >
>=20
> Yes, let me rename. How about vm_bind_ioctl_ops_execute_fini?

Yes that sounds better.

>=20
> 'destroyed the temporary vmas during vm_ioctl' - This is destroying
> unmapped VMAs when the fence signals.

I see.
>=20
> >
> > > +{
> > > +	struct xe_vma_op *op;
> > > +	int i;
> > > +
> > > +	list_for_each_entry(op, &vops->list, link) {
> > > +		if (op->base.op =3D=3D DRM_GPUVA_OP_UNMAP)
> > > +			xe_vma_destroy(gpuva_to_vma(op->base.unmap.va),
> > > fence);
> > > +		else if (op->base.op =3D=3D DRM_GPUVA_OP_REMAP)
> > > +			xe_vma_destroy(gpuva_to_vma(op-
> > > >base.remap.unmap->va),
> > > +				       fence);
> > > +	}
> > > +	for (i =3D 0; i < vops->num_syncs; i++)
> > > +		xe_sync_entry_signal(vops->syncs + i, NULL, fence);
> >
> > This signals the out-fence of vm_bind ioctl. Isn't this be done *after*=
 fence is
> signaled (aka means the last vm bind operation is done)?
> >
> >
>=20
> This, xe_sync_entry_signal, is a bad name. It really should be
> xe_sync_entry_install_fence or something like that. It is really is
> installing the fence in all out-syncs, the fence signals, then the
> out-fence signals.

Ah! That make sense. Now it is more clear to me.

>=20
> > > +	dma_fence_put(fence);
> >
> >
> > I know this is also in the original code below... but I also don't unde=
rstand why
> we can destroy fence here. As I understand it, this fence is generated du=
ring
> vm_bind operations. This is the last fence. Shouldn't we wait this fence
> somewhere so we know all the vm bind operations have been complete? I nee=
d
> your help to understand the picture here.
> >
>=20
> This isn't destroying the fence - it dropping a reference. This is
> reference return from xe_vm_ops_execute, we install the fence anywhere
> needed (this might take more refs) then drop the ref from
> xe_vm_ops_execute.

Ok, that make sense.

Oak

>=20
> Matt
>=20
> > Oak
> >
> > > +}
> > > +
> > >  static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
> > >  				     struct xe_vma_ops *vops)
> > >  {
> > > @@ -2868,7 +2859,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_=
vm
> > > *vm,
> > >  			xe_vm_kill(vm, false);
> > >  			goto unlock;
> > >  		} else {
> > > -			dma_fence_put(fence);
> > > +			vm_bind_ioctl_ops_install_fences(vm, vops, fence);
> > >  		}
> > >  	}
> > >
> > > --
> > > 2.34.1
> >
