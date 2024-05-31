Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB87C27C50
	for <intel-xe@archiver.kernel.org>; Fri, 31 May 2024 16:52:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6100210E471;
	Fri, 31 May 2024 16:52:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EFnD8HJS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C5810E50D
 for <intel-xe@lists.freedesktop.org>; Fri, 31 May 2024 16:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717174365; x=1748710365;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vazYOvDIMO5EiAyY7Gl8wLz5d9YeCQY4Pic0sVfIRPc=;
 b=EFnD8HJSN3+bQpFrpw/V9Bp0/BiyQENFi0Xv2fO8r7NUjbXkGWmvZFk4
 rM+zdO7tD4dQBM3MkoVfwKz39+67HAcHkJ5w4jp3Nr5OSYF/YKRa7jgZq
 bBe1/tLZ15Q6a+0Mk6Uz9DPLOhBAZrzC+h+bU4xB5RZkettAsT9Udhlvz
 uLXQUJ+G3hDrKC3v9ECq8fg+n+TmeDipSckMmM0z2KPU0ucql2JQ49Og1
 G/mosfNZGIPGzZ2IeyabU34t1c3ZzZ3l6elmWie2vlA6ggW3EW1hoGYPE
 Y91d/O29lRACjtTcJ8UyDGsIE8Y1j/n1e8UTw7HYjYQjzbDcWQ8kpQo4t Q==;
X-CSE-ConnectionGUID: qnwPjLczSC+6+PQaNiAM7Q==
X-CSE-MsgGUID: m5EaBefnRKiuUr0HZcsWTw==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="17523332"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="17523332"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 09:52:40 -0700
X-CSE-ConnectionGUID: iVx5216pSPKNX/xF1yucvA==
X-CSE-MsgGUID: Xsp3OW9QTziiLl2Ov3vTeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="36159178"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 May 2024 09:52:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 31 May 2024 09:52:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 31 May 2024 09:52:39 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 31 May 2024 09:52:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HOCBb0vZP2/ZTMGC6mlDKkYwHng/8uUAfrVg8j16YGynaeQiwKXbfvZfV+u61+cygf/RkBujQjWxy1q0LrrsUeYsTfapT7rGsu67ZZUoFcQEiCUfnmXY6xy6RMSP3cmzsZfMQRO9gnLO4+ruZx1vo3jL2KEODlaXipYKyd79rt8qr7+tD6jOdfo4pooAhteHDKHfcbmqWMKe5yC58hipgtINwrlRhEbY+Fndw3REwrJifjry6IOgk533BJidfllG2QVvgCnH7Nxkopi67wEDf6tiTEvVh5P4TAKOnS1wJElv3LAHzRLRleQ0wY6K2wJpcYhW5JSL+dW2LBu0/tXfOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yi02NGv16AkK0jAhF/dgFfjabYHouzxM82iccEEFJWw=;
 b=RjBvORbBcMTfsBlrDiLjBoVSl1t+sQbjmrBttCBifkhCjkwP4bVxDZyCMbt5NOqRba4HtWpovIpCZ6MnGMRMjMHwpUMqMsXSy6QjrLwKHKTu/bhsCJusLNK8gsJ3J+W52Y8l4cpo/xEtkRiOdUDqfHAJaVhxoyPm9E56hqBKbAnNFkiKFzNdjamS1TRtrEa/mzoR3jlBMUNuV+2YifTRYZsQcVXVazCbPP5RA90TUBrlE5MWiZWgbhZ4ZlrZPjl6HzatfDrLEvOQddRnxNBxjhibO2lpMDOwn1mKDWK6d+5UAfqDkFFrZ1PXxORRCVqOUAtGvo/qq2jWsc8712ZLOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB6362.namprd11.prod.outlook.com (2603:10b6:208:3b5::8)
 by PH0PR11MB5080.namprd11.prod.outlook.com (2603:10b6:510:3f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Fri, 31 May
 2024 16:52:37 +0000
Received: from BL3PR11MB6362.namprd11.prod.outlook.com
 ([fe80::497a:383a:6d76:ec5f]) by BL3PR11MB6362.namprd11.prod.outlook.com
 ([fe80::497a:383a:6d76:ec5f%3]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 16:52:37 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: RE: [RFC PATCH] drm/xe: Don't overmap identity VRAM mapping
Thread-Topic: [RFC PATCH] drm/xe: Don't overmap identity VRAM mapping
Thread-Index: AQHasykfIsGvi7iSpk+TPtbYf0ZunLGxhHJggAAD0ICAAALTcA==
Date: Fri, 31 May 2024 16:52:37 +0000
Message-ID: <BL3PR11MB63623093B3F25F03F4EB14099AFC2@BL3PR11MB6362.namprd11.prod.outlook.com>
References: <20240531070717.1904762-1-matthew.brost@intel.com>
 <BL3PR11MB63624632546B03D6551C4F0C9AFC2@BL3PR11MB6362.namprd11.prod.outlook.com>
 <Zln6NXwSXfLFZyMN@DUT025-TGLU.fm.intel.com>
In-Reply-To: <Zln6NXwSXfLFZyMN@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB6362:EE_|PH0PR11MB5080:EE_
x-ms-office365-filtering-correlation-id: 46c9ae04-05ee-44a1-899b-08dc81921394
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?xTcZ/8HJo1a/UTuUfrGXpI1+Hhy2A/QDYi3KTEy6cmZaQgRW2jcNH96dmvYI?=
 =?us-ascii?Q?dUkoqrgYakYhugewyLoLhT69sH764AVwgpqXyjAfpKzEqXxnwJQLdTodU7uF?=
 =?us-ascii?Q?po0dZWGcZVf0cDtprP8e8QQBJ1tnLG3rJ9oUXsel6rn7SZhrJYdq8l4JwpMW?=
 =?us-ascii?Q?pOIOPy1QBJdw6XjAza3hHVce4PTXdHdBQ3fAtrSKY3udETXYvvvSRx9d/Shs?=
 =?us-ascii?Q?PDqPZ8p4uNTAwelAdjBjpwhuNyw1mG3Nw5qWdkCq4QB/BcKBi0Rhyk7m9W60?=
 =?us-ascii?Q?Hq7dDYw1+sqXvXTKS7pqjDIHUoUqpIFha7nsRn/oT4jSepRHRGaNBAMyokR7?=
 =?us-ascii?Q?VuzIWiq9xR/Lmo6+475FL5zbRrQ4Yz/GIyK3NSwyjkVBLk2R3zByy+0at72A?=
 =?us-ascii?Q?RVXSp9VWFeAgS2/6/s1pmY7DcTxOjUuu9z7FIYwZdF5StbssSCQ70vQY63gh?=
 =?us-ascii?Q?BSUeQesXTIQA/cK0dDKaFC4ta+8RBK/H3DrxUmr81tXa/jpP9dH5Bk+PNdO/?=
 =?us-ascii?Q?rfSp9nPEM8cMGbJoDtBeNYNu6HEtruv+7RvJo0S+fD1eaImKZ9n+P+m+ax6H?=
 =?us-ascii?Q?4fidgcy62tGxzSQ8it/q2gPMVBbYDKPxihqaN//66tsrxVpqkEwqnINhCoLb?=
 =?us-ascii?Q?zFPtpZU/2skAepRBMlpOieu/kJJAkPtwnS1FvxmXrdWRK3etd0Jy8uO5hvqF?=
 =?us-ascii?Q?FWCE/KhshzkoyuKDWyIEAMkHF++igZdhUGbRFineuPB8Ma5GpedNmMxb/ElN?=
 =?us-ascii?Q?m5ek34DfLyJBw3A/qHPHvngj8dVRyNCcLJyzIcG1ZA3y2lEWosxI2VEVTpOs?=
 =?us-ascii?Q?39MFTq3ctME5rumL0iiKiG+oB0eGgyTgYnYhNkdqNUvQ5egCR+46ENy0dBs1?=
 =?us-ascii?Q?83AwOJuZybtM07AyiBdTtWpKacD2WRWJJD1NMwCnylY1ZXFy5Koo+xqsFp5c?=
 =?us-ascii?Q?vSgDl++quEPFhq69AZill5FpG4jFtMNa9KlhvgUjX9bQ5Y6BIob11jVEAGqy?=
 =?us-ascii?Q?vylxAP+swdGYNRU062C//8ZesMFB7SsZ6OzkF+37NzuAj/9TjmPcBbofq1cx?=
 =?us-ascii?Q?tM8Vaicx8gmkPCgE7jS4AdShwMyMMk6g2kvaDgr+amjxRlhhlrz1X7b3LgXG?=
 =?us-ascii?Q?SfAFbZ3qV9RXLy2uERbbRExXIFOCLqsPHKuviHwDPBLWnU0IWR7Lu+QO9vju?=
 =?us-ascii?Q?nLW7Mo0gd94jRHRneBn8AxQBA4km0L/Z7PArjn34PysIEWtWIqFiW5XKYG7e?=
 =?us-ascii?Q?7tNyN2YWbuE3MKAZfRHZeMXiV6zFxoKNaSftOwMzWX3UWS1qqRYhgF6ZM0Qm?=
 =?us-ascii?Q?fxcfv9nhiNZ1p6/AgGUlqNq2gt0AvKGQrV2Zq0ZxSTGeJw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6362.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FuDOR1xxnEkpvakfCF94piWmXVu2+RGxFnltY/FY5PzynNeJAuEDJZjPk9KM?=
 =?us-ascii?Q?K8PvLfXnEpUSxw3Pk5n2tfwVX2eLardgOJHuGSxtc0KNpIvIS4N/g7i1A6bx?=
 =?us-ascii?Q?n9fY48yWlgxwQyWCm5Dsyta0XWV2cGg4xxujxn4yjH1idE6V0GPHcgDnN7lq?=
 =?us-ascii?Q?cfJlbLq+4UNQn88bqxKbhS8VsSHDbnTBKRhwfMHHtgsSV1hy+NtzpXDeLYIu?=
 =?us-ascii?Q?LpM64w2f3471OkPt1coSZ0DsB9XIoIWKcdAarKcYR/EusI69Vq0oscbYRwLe?=
 =?us-ascii?Q?4ayBt+Owrfk+0uZrzFUtFF/XPirfGY+VLsNQkPUptligGj3MNQT+CR5/cpaD?=
 =?us-ascii?Q?+YuawH0/kpWaZkzaAoEYp0wOP+l3aed/khLVVRnPwQsC9e/VcqrkNr53t1Oq?=
 =?us-ascii?Q?6tpE9oaGsZg1pwBxRUktUjC22i6aFKvUohgHrQLj38YKxuoM34qp0rpa8Hrl?=
 =?us-ascii?Q?CScZErjEVHyDU6IGnYt58OZHyxR5RLrolbjMkw2EmUy+eM2v94Rx3YkYtFCl?=
 =?us-ascii?Q?qyC3k+zdxvtE8GB47KsTszXgRYn/8kk4xr6wNZjgNvh/Ma0z8lltliiGa19Y?=
 =?us-ascii?Q?fEIfR/5SwYlW7fZB7lr60tKHsUJHvGs0lgHj4IG7ugMMNlonIqzMPIHxTxq0?=
 =?us-ascii?Q?j/jS99kx8NZRW9jZOW/K9TRqG0KTCNpXTFiBMId3KoyQppAT8eKHmuuR7dPC?=
 =?us-ascii?Q?KDsio3v4KWP4MAMKPkfTdl5/4tzdWMbVnMhwUGSg11GEJyWvZQ/8+mVVLCOZ?=
 =?us-ascii?Q?OxAVbzEdiusbNI4Ih7s+0ZvClaazUHdGvxJvFfcEKOKTO2bXQLgAZeC8FChI?=
 =?us-ascii?Q?e/VfR5s0+BVIa3TtRMnjihhFLED+MUKBQRRmG81Tj346sJR3RNmsNA52DSLK?=
 =?us-ascii?Q?FLEWxPdze+0fhOQGjDAeqfWMmFiRNBqkekj623MmynC1y4GwlXGnDXw/GIn6?=
 =?us-ascii?Q?98P7xoOhStNByKn3xm0xtdC6ywQctpvbzeEgpuMhVx9/L1+al8247YH1CIFC?=
 =?us-ascii?Q?8UAY3hmSvIYEXMCKs9cz8NJO8RyTumPop+GHGkx2z6vdermnpAiBLRmvTmKN?=
 =?us-ascii?Q?wX73SWu56b1DnWiu91aN8QsyQKx4k6CTpNkOh6oKK8f62nb4dPjq8/GBgxjp?=
 =?us-ascii?Q?cMW129jv3hsX9kiLYg3Yy7AA+7oDKbbzXzXt/GwDVg1/gX7/C4hS3w48qOM+?=
 =?us-ascii?Q?G2sskAF7jQjVjMRF+E6n6MUYlf4BLJvoIkAgNaWt0Fbno5liuIyvhkR0fltH?=
 =?us-ascii?Q?FoYdlwc5PhgFWDqv008hjlbIDSeIuMqUTSn8GKlPaO0BcLm7T9J7ajigDkT9?=
 =?us-ascii?Q?MwklG3Ou42kbr4kers4V9Lna4VQiTsrHzS4AV10ufGXVL6CEIMAlbRUNwiYi?=
 =?us-ascii?Q?WNf4kalY76Y1MiSGD/D6pTy7gezsST4C/4gkIfWdItOL+Fyzr1xL2aF8mNkK?=
 =?us-ascii?Q?3j6tSGI4VZ42V0yASyIMZqQigYFFN7YK9CzUaYQi37ukK+2T8EJ8vcwhv505?=
 =?us-ascii?Q?Vnl1LhbUa3CbPc48VOqudob1vLUknS513W/wWy22LvcAqJNPSdOlUWmP3riV?=
 =?us-ascii?Q?L/CODGDaq7vdnFJ0pbc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6362.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46c9ae04-05ee-44a1-899b-08dc81921394
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2024 16:52:37.3122 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qvzawZNJY5THpQUMgIH/xcdXL2+HCt/Wx3pDW/zcIj/f89gy/Vrvogb1leHKvY0qwhralXPmsknVyjMT8vA16A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5080
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

> On Fri, May 31, 2024 at 10:20:26AM -0600, Yang, Fei wrote:
>>> Overmapping the identity VRAM mapping is triggering hardware bugs on ce=
rtain platforms. Use 2M pages for the last unaligned (to 1G) VRAM chunk.
>>>
>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Cc: Fei Yang <fei.yang@intel.com>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_migrate.c | 54
>>> ++++++++++++++++++++++++---------
>>>  1 file changed, 40 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
>>> b/drivers/gpu/drm/xe/xe_migrate.c index b882d32eebfe..2d92ec27981c
>>> 100644
>>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>>> @@ -69,7 +69,7 @@ struct xe_migrate {
>>>
>>>  #define MAX_PREEMPTDISABLE_TRANSFER SZ_8M /* Around 1ms. */
>>> #define MAX_CCS_LIMITED_TRANSFER SZ_4M /* XE_PAGE_SIZE *
>>> (FIELD_MAX(XE2_CCS_SIZE_MASK) + 1) */ -#define NUM_KERNEL_PDE 17
>>> +#define NUM_KERNEL_PDE 15
>>>  #define NUM_PT_SLOTS 32
>>>  #define LEVEL0_PAGE_TABLE_ENCODE_SIZE SZ_2M  #define MAX_NUM_PTE 512 @=
@ -136,10 +136,11 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile,=
 struct xe_migrate *m,
>>>       struct xe_device *xe =3D tile_to_xe(tile);
>>>       u16 pat_index =3D xe->pat.idx[XE_CACHE_WB];
>>>       u8 id =3D tile->id;
>>> -     u32 num_entries =3D NUM_PT_SLOTS, num_level =3D vm->pt_root[id]->=
level;
>>> +     u32 num_entries =3D NUM_PT_SLOTS, num_level =3D vm->pt_root[id]->=
level,
>>> +         num_setup =3D num_level + 1;
>>>       u32 map_ofs, level, i;
>>>       struct xe_bo *bo, *batch =3D tile->mem.kernel_bb_pool->bo;
>>> -     u64 entry;
>>> +     u64 entry, pt30_ofs;;
>>>
>>>       /* Can't bump NUM_PT_SLOTS too high */
>>>       BUILD_BUG_ON(NUM_PT_SLOTS > SZ_2M/XE_PAGE_SIZE); @@ -159,10 +160,=
12 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migr=
ate *m,
>>>       if (IS_ERR(bo))
>>>               return PTR_ERR(bo);
>>>
>>> -     entry =3D vm->pt_ops->pde_encode_bo(bo, bo->size - XE_PAGE_SIZE, =
pat_index);
>>> +     /* PT31 reserved for 2M identity map */
>>> +     pt30_ofs =3D bo->size - 2 * XE_PAGE_SIZE;
>>> +     entry =3D vm->pt_ops->pde_encode_bo(bo, pt30_ofs, pat_index);
>>>       xe_pt_write(xe, &vm->pt_root[id]->bo->vmap, 0, entry);
>>>
>>> -     map_ofs =3D (num_entries - num_level) * XE_PAGE_SIZE;
>>> +     map_ofs =3D (num_entries - num_setup) * XE_PAGE_SIZE;
>>>
>>>       /* Map the entire BO in our level 0 pt */
>>>       for (i =3D 0, level =3D 0; i < num_entries; level++) { @@ -233,7 =
+236,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_=
migrate *m,
>>>       }
>>>
>>>       /* Write PDE's that point to our BO. */
>>> -     for (i =3D 0; i < num_entries - num_level; i++) {
>>> +     for (i =3D 0; i < map_ofs / PAGE_SIZE; i++) {
>>>               entry =3D vm->pt_ops->pde_encode_bo(bo, (u64)i * XE_PAGE_=
SIZE,
>>>                                                 pat_index);
>>>
>>> @@ -251,6 +254,9 @@ static int xe_migrate_prepare_vm(struct xe_tile *ti=
le, struct xe_migrate *m,
>>>       /* Identity map the entire vram at 256GiB offset */
>>>       if (IS_DGFX(xe)) {
>>>               u64 pos, ofs, flags;
>>> +             /* XXX: Unclear if this should be usable_size? */
>>> +             u64 vram_limit =3D  xe->mem.vram.actual_physical_size +
>>> +                     xe->mem.vram.dpa_base;
>>>
>>>               level =3D 2;
>>>               ofs =3D map_ofs + XE_PAGE_SIZE * level + 256 * 8; @@ -258=
,21 +264,41 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struc=
t xe_migrate *m,
>>>                                                   true, 0);
>>>
>>>               /*
>>> -              * Use 1GB pages, it shouldn't matter the physical amount=
 of
>>> -              * vram is less, when we don't access it.
>>> +              * Use 1GB pages when possible, last unaligned chunk use =
2MB
>>> +              * pages as WOCPM is not allowed to be mapped on certain
>>> +              * platforms.
>>>                */
>>> -             for (pos =3D xe->mem.vram.dpa_base;
>>> -                  pos < xe->mem.vram.actual_physical_size + xe->mem.vr=
am.dpa_base;
>>> -                  pos +=3D SZ_1G, ofs +=3D 8)
>>> -                     xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
>>> +             for (pos =3D xe->mem.vram.dpa_base; pos < vram_limit;
>>> +                  pos +=3D SZ_1G, ofs +=3D 8) {
>>> +                     if (pos + SZ_1G > vram_limit) {
>>
>> I'm afraid this patch wouldn't take effect on platforms where
>> vram_limit is 1G aligned. Even for the last 1G, this check wouldn't be t=
rue.
>
> We shouldn't use 2M pages if the VRAM limit is 1G aligned. This leaves th=
is code in a risky position where the 2M pages could largely remain unteste=
d. Perhaps introducing a Kconfig option to enforce the 2M path could be con=
sidered? However, excessive Kconfig options can be frowned upon, so I'll de=
fer to the maintainers to decide if that's a good idea.
>
>> Should be if (pos + SZ_1G >=3D vram_limit)?

But the problem we are trying to solve here is that the last 1G page overla=
ps
with reserved memory region, there would be no change at all if we don't
break down the last page.
Or vram_limit has to be usable_size + dpa_base, because usable_size exclude=
s
the reserved region.

> No, it is always better for performance (TLB usage is better) to use larg=
er pages if possible. With that said, the logic is correct.
>
>>
>>> +                             u64 pt31_ofs =3D bo->size -
>>> + XE_PAGE_SIZE;
>>> +
>>> +                             entry =3D vm->pt_ops->pde_encode_bo(bo, p=
t31_ofs,
>>> +                                                               pat_ind=
ex);
>>> +                             xe_map_wr(xe, &bo->vmap, ofs, u64,
>>> + entry);
>>> +
>>> +                             flags =3D vm->pt_ops->pte_encode_addr(xe,=
 0,
>>> +                                                                 pat_i=
ndex,
>>> +                                                                 level=
 - 1,
>>> +
>>> + true, 0);
>>> +
>>> +                             for (ofs =3D pt31_ofs; pos < vram_limit;
>>> +                                  pos +=3D SZ_2M, ofs +=3D 8)
>>> +                                     xe_map_wr(xe, &bo->vmap, ofs, u64=
, pos | flags);
>>> +                     } else {
>>> +                             xe_map_wr(xe, &bo->vmap, ofs, u64, pos | =
flags);
>>> +                     }
>>> +             }
>>> +
>>> +             xe_assert(xe, pos =3D=3D vram_limit);
>
> Also while I'm here, I think this assert will pop on 2M pages. I think a =
break is required after writing the 2M pages.

hmm... pos would be incremented to vram_limit no matter it's 2M or 1G. Unle=
ss vram_limit is not even aligned to 2M, which I doubt that would ever be t=
he case.

> Matt
>
>>>       }
>>>
>>>       /*
>>>        * Example layout created above, with root level =3D 3:
>>>        * [PT0...PT7]: kernel PT's for copy/clear; 64 or 4KiB PTE's
>>>        * [PT8]: Kernel PT for VM_BIND, 4 KiB PTE's
>>> -      * [PT9...PT28]: Userspace PT's for VM_BIND, 4 KiB PTE's
>>> -      * [PT29 =3D PDE 0] [PT30 =3D PDE 1] [PT31 =3D PDE 2]
>>> +      * [PT9...PT27]: Userspace PT's for VM_BIND, 4 KiB PTE's
>>> +      * [PT28 =3D PDE 0] [PT29 =3D PDE 1] [PT30 =3D PDE 2] [PT31 =3D 2=
M
>>> +vram identity map]
>>>        *
>>>        * This makes the lowest part of the VM point to the pagetables.
>>>        * Hence the lowest 2M in the vm should point to itself, with
>>> a few writes
>>> --

