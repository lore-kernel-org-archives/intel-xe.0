Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CAD4C25B74
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 04:24:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECE4B10E422;
	Tue,  4 Jun 2024 04:24:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pqg8jW2C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C150310E422
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jun 2024 04:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717475060; x=1749011060;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Z2BLZ4QALVd/X9OcFFe0QtJP1Gx+gvtsB7auhm4bOqg=;
 b=Pqg8jW2C9EQm9sErFP7RcKMgmThJGi1Vs6QLr8GfBVPRvbgIZ3KLne2g
 bBKx0ct81EIZ3LuIAO3WZWfiDvEB465trmfCbhqzbijp7E16aYBu8jCd9
 Ul/KsE8ZGTn2Ca2ZleK43lnUrQvrTSDvp1pFiq97UKePu/5qym7uJ/teh
 gmch8ofqOv/9CXIDQZNvTI3JPcWxeXjCZb8PGXABtyu0BTX3fnrPzP3DN
 PZ6BcdW/AxzKU/TEA0Pzp27ruaX3la5ypaB/dnk1d0db3uNqPSsgPQsL+
 9tGfLKmJ/vIGcdZhuc2Yma2Yi1Y1FgdylcGK+BtHeVvBI2VBm+riJQwkk Q==;
X-CSE-ConnectionGUID: 074k7+XqT/KTtKuxNyal3g==
X-CSE-MsgGUID: BsItvXQgQzi0NAfwPanolA==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="13833748"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="13833748"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 21:24:20 -0700
X-CSE-ConnectionGUID: WLPCUvV5QsaspetoO0KDMQ==
X-CSE-MsgGUID: 469Lkh1XRl+aNmZ69mMsFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="37689036"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jun 2024 21:24:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 21:24:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 21:24:17 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 3 Jun 2024 21:24:17 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Jun 2024 21:24:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TYLmtdkyBP8xt2iKT1xTdg+H57AGyT/cfrAVFQwYrwcZdSQjgtAIUhkghoiwlOmIkHYRI8uga0XNqNyd7U3PNMT2rL6XUPyRx8URzOkqFqbPN2oRmoB1xObd8SiBpAC98znpo9J3IkY0gSYOhFeJdeJJS8k6/e6qrqlSepNaQuCCvEmf3mDmsObv8wgfWxeV33Vg8Xzd2szNh49TH4HvKCVG2dh0U5/ME4Kx+mtB4t/W/SlM4cfOnarCbCDqLDRKne/ozsfG0f/iOFu4yaRlgq8Z/W9Ej6mheyLc9xECyhzFY8jBOvxxHnYp3CA7ngBb2j74tvS34OZi873rKpzX+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYrmi7yJaOlsuztPu1L1Z4WFzSqi4OpVN2tV/vFL9Oo=;
 b=YdPjmkeovEZnv4SVKI5ivycFN6C+Gs57O+yIWGz+ukkUeNJTMRR+fwjiGOMg+puEXX5TsJEJ/YRy7DNrkgXuPoEYbqkU+5cNX3P9hpnKcurNSovEIjRxhV4KC9KQ49FIUGdO7mvxZM2fTydol2x3BtWdC8GJTPG6+Pu/qvw/3wO/xXiAkDqIhwkijaovMpoTggbpZToY5mSpHiznvXbw+EplqkzWNehuvqOGgfAaUjP6sLE14DFK98rI1bwMubh0vrRCha2Mk+QOaHRu4j9AsZCbTCPt5s6kHaj4WBaE96LKh8mTwSLPCOMX7yOyyUAA/P7kUiV9DVgDErOKcA7kEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB6362.namprd11.prod.outlook.com (2603:10b6:208:3b5::8)
 by IA1PR11MB7245.namprd11.prod.outlook.com (2603:10b6:208:42f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Tue, 4 Jun
 2024 04:24:09 +0000
Received: from BL3PR11MB6362.namprd11.prod.outlook.com
 ([fe80::497a:383a:6d76:ec5f]) by BL3PR11MB6362.namprd11.prod.outlook.com
 ([fe80::497a:383a:6d76:ec5f%3]) with mapi id 15.20.7633.018; Tue, 4 Jun 2024
 04:24:09 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: RE: [PATCH v2] drm/xe: Don't overmap identity VRAM mapping
Thread-Topic: [PATCH v2] drm/xe: Don't overmap identity VRAM mapping
Thread-Index: AQHateJihYBSSd88+kGkB4MK5gPpmbG3ASxA
Date: Tue, 4 Jun 2024 04:24:09 +0000
Message-ID: <BL3PR11MB6362E62807E5E908975168E99AF82@BL3PR11MB6362.namprd11.prod.outlook.com>
References: <20240603181824.1927675-1-matthew.brost@intel.com>
In-Reply-To: <20240603181824.1927675-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB6362:EE_|IA1PR11MB7245:EE_
x-ms-office365-filtering-correlation-id: 8da1036d-3f94-4cbe-6adb-08dc844e2de0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?EpL74kK9cov3SHCuIr1srYYwXDDdyQmqnmkRV9IdA1sTsoYhiJDebgtJ6d5a?=
 =?us-ascii?Q?dWaMdHMFlzCDa/3JVO2v8cS0jVA0ya3WQQgj4nfmlZKZ6AqAw4EX/ho061wT?=
 =?us-ascii?Q?iwdlpad4bYtkNzwNV62EPiLdp7JEIjNo+yB9WURy+nGGbtmAISu1AnAqLxaA?=
 =?us-ascii?Q?gj8Br1+Lz0N0ItnMfhdCqTPDOK6zys+7FQmoo0DtuUCHe96HZ6v7JY3kKnht?=
 =?us-ascii?Q?5OOS/n1hStx6IhuxEtsm1zUstvW2Kt90ENWCyefM+6RtSP7xVBch1UZ3PCWp?=
 =?us-ascii?Q?eF5+1FLP8sx3dXHHLt+Wr+5yQxbqkwOZeMPhNGnR1gZi+BkZVXml//inZWsG?=
 =?us-ascii?Q?3I4fy55iVZ0M1ndfw0b3azdIVzDfX6AXPaq0/dYOs0lSp4VjGe4nsy5wFhSB?=
 =?us-ascii?Q?CYwTxZb17ADiGHf80XRVOikpQd+hu4XXhtlrsSoDM7hjUxEPQITST0QQxNwi?=
 =?us-ascii?Q?ZhJTj5Q7KTIqqA3O3JLRg+pc83GbvMZiNrzfLauIInha+lGwN5foZPHAlIJ6?=
 =?us-ascii?Q?UpQ3v8kNyPZzlSNNZKT/ig542dbBt0ekclJ7ps8h0XdtJhhfJ1bt5uJ8Ors3?=
 =?us-ascii?Q?xJ2M57d335IDjFTgzHkFX+F1K8iNzzIFzpHA2/K2sR/lWDj6VhUOFvYHxKHp?=
 =?us-ascii?Q?YTo/j5zhIic9CiYYvadywI+qTCgXG65lmBa+QIMka3llIVYiCX6f22/oGVOd?=
 =?us-ascii?Q?H9NZN3hVY18kbBOMuE8zpCOtUw75+n3RJgF/1oAhjZukiqi+67Hc8eydsM7u?=
 =?us-ascii?Q?61OMbNJBB9FBkLX2y90Az+oriQEZvqLGjRMfdiCyI53rNWbiQ8eBIz5LpucK?=
 =?us-ascii?Q?gIHDA1tupIRkciUoDdfAl3wvy+bmt45iIHIoEQ7JzXOiWGuAQ78HCAAbUBow?=
 =?us-ascii?Q?0VmcJE9QCBZs0Emxsdm+c5ctDBpkkHu0LGuWPbLo0+rIY0FJyBtp6ih2/+ee?=
 =?us-ascii?Q?PinzniwrvCVCPQqpVbeAQ8k52mT2yI5BkkA1kcfq8OwHCJu0UN2cbOTtDQ/F?=
 =?us-ascii?Q?0TG+EXbbIkW/ymCuAfqxhRWdOFvTJhS1ws4LbGHsnRwNpU1FWF/6JBiAFprS?=
 =?us-ascii?Q?osvIcfIYzUvg5dgZ/zxYE6CoO7rdiDaIEUl5RePqMk8IQ/RcCp9BKqRwncz3?=
 =?us-ascii?Q?IwwPgt2GqSFf4I+CDaTwOh/FjAUSjGxb5NfLJrd7aDiD4fM365Uh+wqoZVZk?=
 =?us-ascii?Q?RBtYVIkALpFt5/SPw+2cVkeSP4NWUCaYrlGZ+AeQ7hMrl1Mh3SurRnG3fRb4?=
 =?us-ascii?Q?WasB/PTzzwRK27peycN/uMxytNEXaJDKEvI24l+X0Nd5wDBtIw3yJKppizv+?=
 =?us-ascii?Q?kzcf8xmpjOrgD+dIquGkDCEaMMTPS5KfJPVk5h+3oCc+NQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6362.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NuNyRLW0s1pgCRTjHKfoNKIY18pFw4HCZHLxUv5eDNlE6icrpgXeeeDaUJYZ?=
 =?us-ascii?Q?FDhA0GGzdLctBcXs5tEHSAEatywICotRI44AukFVajVWPDGyxbDCqjxQsvAv?=
 =?us-ascii?Q?cKvcBDopPUsQ57tO8bXqBmSsL1fhJ1Zh8O/hKCxTEQHFTGi1OsTR3aJPHvf+?=
 =?us-ascii?Q?Bwk5mrDQGfyipo2jFZNuR10H0+71t2i7MllqhxDDIoR9knfJLmN6dq3QfHlo?=
 =?us-ascii?Q?TiaLdavr1jL0Ok/eydUSBkRkkcZCMJlGZW1Y4OjqFC47skroLSWQSxJoplEs?=
 =?us-ascii?Q?JE+oQytbWNGe1m79g9cTADJtC+lIvqq2r/JOp/4PEDC8I2Xb4zzGJFQSs+KF?=
 =?us-ascii?Q?NnDaaBEThZrN8YY+w9G7kAx+YICH2u+GZzmoPvLGwqvJU6YsXzA2DPwJSDEy?=
 =?us-ascii?Q?Ac9C297bbFcpevHh/lzC8v8ZSzTOLV/Z3iOKiDc00vyZt330h2/qLilYFemy?=
 =?us-ascii?Q?oQqHk8EIpXWAgAdS2mD5G5MSZMswUB44bhboORWdqUZqG2KZ0CEmcdaoEZzv?=
 =?us-ascii?Q?/9DyMj5qgrUyG7vd46ttRLs/oO+gN8gKxiieKYEpLEr7XDeFxmUL2y62ptMu?=
 =?us-ascii?Q?EgxJUGQyVRR6fyGhjNlbTPiVPVf5QVnOWtcWLOI+pLKqdCypwG/8R0g+icvk?=
 =?us-ascii?Q?ohdt9b1BntmwHu6qEb53YECjixyf6PUjyAL3wsd8qFzB9yBcpn/4MfMZ/IO7?=
 =?us-ascii?Q?gWb8q/h1QGSdEi5Zu8mrMUz6AmUvzvpj6zUuaR37Dgk/r/1Q5LE5MMH5LkjG?=
 =?us-ascii?Q?lyjYySK6dk1p0ZnPMFrrtbx3NsAw9O0ES39U3/26Bdw+gSfk3utxCfeQ8tre?=
 =?us-ascii?Q?X2tvkWDb4m+54zLAQy5KtYwOuuMuFPei6+/k9auLRuMCELdGgNCy/u/bOcQ0?=
 =?us-ascii?Q?J+2rfVBXD7XHVeOkJ3I9/L0tkcfJw/DcJEhMUYZzPLY2gpVAsGAsXdYZ39Uz?=
 =?us-ascii?Q?82xm5UkYZO4iTCqCQpiZxQb3poFhhtT0GL/htjfvRV6xCFkABRnOMfJMEt07?=
 =?us-ascii?Q?U9BEcb1zIIOtrMcNWl1oMMi1kdjIqQMH4+zBYd2SH3EisXl6RhMS2ZAmLmMl?=
 =?us-ascii?Q?HTgvjdT/OS6lF1FB2U+AeM7yDl7N48a9v5Y/IT+y3N+Wq8nIdZ4a4GYO85hz?=
 =?us-ascii?Q?qe4fA1OM31voKhY0GJPKGSwcfBEAk0WiWpVIy04u50wMYyiN/PydQAAbNL/X?=
 =?us-ascii?Q?/cVa9+uAocWfHqOORW/HhjR/X90FYUmRnecbhecKn+dO1WZAigIEF2J/rnzE?=
 =?us-ascii?Q?vBcUjVflNDxXDZmCUKHYliqHLi2QKmEbGJX/F12WvwhTubwd2UtKGTq9Cbxb?=
 =?us-ascii?Q?7ZhgXkOuo6QPwoeya2ZZBKaTQdyNkhpZIUsGg0G9X+kYsXJ9r/qdm90DPWI2?=
 =?us-ascii?Q?CA39uGgm1kmT7vT2cQsagL9XQFFsMrCSSMXMOy1JDyU9pYFyb9qqbENY7B+k?=
 =?us-ascii?Q?BbhCXP4sJf/gdqSJyJWvR0jFRf7e+CYoYYP850x8GiA3KebPHpsNC3qYU1bZ?=
 =?us-ascii?Q?mvmKs/kjH3Tjny8nuIuBNvCVwQhwvZSJRTnYVofNJIpaN4apZOee26Xo4YzR?=
 =?us-ascii?Q?KV/qFJl4Tw8riZLB8zk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6362.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8da1036d-3f94-4cbe-6adb-08dc844e2de0
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2024 04:24:09.1508 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ev4eNrCHe+5yObXlkiT61c5noFvv+zlGJP4HFYiwUX9nJiZsSFYLAe+PaV1ui+tQoFkBNJYC5hdnG2IfKO+VTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7245
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

> Overmapping the identity VRAM mapping is triggering hardware bugs on cert=
ain platforms. Use 2M pages for the last unaligned (to 1G) VRAM chunk.
>
> v2:
>  - Always use 2M pages for last chunk (Fei Yang)
>  - break loop when 2M pages are used
>  - Add assert for usable_size being 2M aligned
>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Fei Yang <fei.yang@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 57 +++++++++++++++++++++++++--------
>  1 file changed, 43 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migr=
ate.c index cccffaf3db06..c1269cdbf93a 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -69,7 +69,7 @@ struct xe_migrate {
>
>  #define MAX_PREEMPTDISABLE_TRANSFER SZ_8M /* Around 1ms. */  #define MAX=
_CCS_LIMITED_TRANSFER SZ_4M /* XE_PAGE_SIZE * (FIELD_MAX(XE2_CCS_SIZE_MASK)=
 + 1) */ -#define NUM_KERNEL_PDE 17
> +#define NUM_KERNEL_PDE 15
>  #define NUM_PT_SLOTS 32
>  #define LEVEL0_PAGE_TABLE_ENCODE_SIZE SZ_2M  #define MAX_NUM_PTE 512 @@ =
-137,10 +137,11 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, s=
truct xe_migrate *m,
>       struct xe_device *xe =3D tile_to_xe(tile);
>       u16 pat_index =3D xe->pat.idx[XE_CACHE_WB];
>       u8 id =3D tile->id;
> -     u32 num_entries =3D NUM_PT_SLOTS, num_level =3D vm->pt_root[id]->le=
vel;
> +     u32 num_entries =3D NUM_PT_SLOTS, num_level =3D vm->pt_root[id]->le=
vel,
> +         num_setup =3D num_level + 1;
>       u32 map_ofs, level, i;
>       struct xe_bo *bo, *batch =3D tile->mem.kernel_bb_pool->bo;
> -     u64 entry;
> +     u64 entry, pt30_ofs;;

Remove the extra ";" here.
Otherwise LGTM.

Reviewed-by: Fei Yang <fei.yang@intel.com>

>       /* Can't bump NUM_PT_SLOTS too high */
>       BUILD_BUG_ON(NUM_PT_SLOTS > SZ_2M/XE_PAGE_SIZE); @@ -160,10 +161,12=
 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrat=
e *m,
>       if (IS_ERR(bo))
>               return PTR_ERR(bo);
>
> -     entry =3D vm->pt_ops->pde_encode_bo(bo, bo->size - XE_PAGE_SIZE, pa=
t_index);
> +     /* PT31 reserved for 2M identity map */
> +     pt30_ofs =3D bo->size - 2 * XE_PAGE_SIZE;
> +     entry =3D vm->pt_ops->pde_encode_bo(bo, pt30_ofs, pat_index);
>       xe_pt_write(xe, &vm->pt_root[id]->bo->vmap, 0, entry);
>
> -     map_ofs =3D (num_entries - num_level) * XE_PAGE_SIZE;
> +     map_ofs =3D (num_entries - num_setup) * XE_PAGE_SIZE;
>
>       /* Map the entire BO in our level 0 pt */
>       for (i =3D 0, level =3D 0; i < num_entries; level++) { @@ -234,7 +2=
37,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_mi=
grate *m,
>       }
>
>       /* Write PDE's that point to our BO. */
> -     for (i =3D 0; i < num_entries - num_level; i++) {
> +     for (i =3D 0; i < map_ofs / PAGE_SIZE; i++) {
>               entry =3D vm->pt_ops->pde_encode_bo(bo, (u64)i * XE_PAGE_SI=
ZE,
>                                                 pat_index);
>
> @@ -252,28 +255,54 @@ static int xe_migrate_prepare_vm(struct xe_tile *ti=
le, struct xe_migrate *m,
>       /* Identity map the entire vram at 256GiB offset */
>       if (IS_DGFX(xe)) {
>               u64 pos, ofs, flags;
> +             /* XXX: Unclear if this should be usable_size? */
> +             u64 vram_limit =3D  xe->mem.vram.actual_physical_size +
> +                     xe->mem.vram.dpa_base;
>
>               level =3D 2;
>               ofs =3D map_ofs + XE_PAGE_SIZE * level + 256 * 8;
>               flags =3D vm->pt_ops->pte_encode_addr(xe, 0, pat_index, lev=
el,
>                                                   true, 0);
>
> +             xe_assert(xe, IS_ALIGNED(xe->mem.vram.usable_size, SZ_2M));
> +
>               /*
> -              * Use 1GB pages, it shouldn't matter the physical amount o=
f
> -              * vram is less, when we don't access it.
> +              * Use 1GB pages when possible, last chunk always use 2M
> +              * pages as mixing reserved memory (stolen, WOCPM) with a s=
ingle
> +              * mapping is not allowed on certain platforms.
>                */
> -             for (pos =3D xe->mem.vram.dpa_base;
> -                  pos < xe->mem.vram.actual_physical_size + xe->mem.vram=
.dpa_base;
> -                  pos +=3D SZ_1G, ofs +=3D 8)
> -                     xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
> +             for (pos =3D xe->mem.vram.dpa_base; pos < vram_limit;
> +                  pos +=3D SZ_1G, ofs +=3D 8) {
> +                     if (pos + SZ_1G >=3D vram_limit) {
> +                             u64 pt31_ofs =3D bo->size - XE_PAGE_SIZE;
> +
> +                             entry =3D vm->pt_ops->pde_encode_bo(bo, pt3=
1_ofs,
> +                                                               pat_index=
);
> +                             xe_map_wr(xe, &bo->vmap, ofs, u64, entry);
> +
> +                             flags =3D vm->pt_ops->pte_encode_addr(xe, 0=
,
> +                                                                 pat_ind=
ex,
> +                                                                 level -=
 1,
> +                                                                 true, 0=
);
> +
> +                             for (ofs =3D pt31_ofs; pos < vram_limit;
> +                                  pos +=3D SZ_2M, ofs +=3D 8)
> +                                     xe_map_wr(xe, &bo->vmap, ofs, u64, =
pos | flags);
> +                             break;  /* Ensure pos =3D=3D vram_limit ass=
ert correct */
> +                     } else {
> +                             xe_map_wr(xe, &bo->vmap, ofs, u64, pos | fl=
ags);
> +                     }
> +             }
> +
> +             xe_assert(xe, pos =3D=3D vram_limit);
>       }
>
>       /*
>        * Example layout created above, with root level =3D 3:
>        * [PT0...PT7]: kernel PT's for copy/clear; 64 or 4KiB PTE's
>        * [PT8]: Kernel PT for VM_BIND, 4 KiB PTE's
> -      * [PT9...PT28]: Userspace PT's for VM_BIND, 4 KiB PTE's
> -      * [PT29 =3D PDE 0] [PT30 =3D PDE 1] [PT31 =3D PDE 2]
> +      * [PT9...PT27]: Userspace PT's for VM_BIND, 4 KiB PTE's
> +      * [PT28 =3D PDE 0] [PT29 =3D PDE 1] [PT30 =3D PDE 2] [PT31 =3D 2M =
vram
> +identity map]
>        *
>        * This makes the lowest part of the VM point to the pagetables.
>        * Hence the lowest 2M in the vm should point to itself, with a few=
 writes
> --
> 2.34.1
>
