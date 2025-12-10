Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B57D2CE17
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 05:32:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE2010E661;
	Wed, 10 Dec 2025 05:32:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kw2QacxS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB11E10E661
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 05:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765344746; x=1796880746;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YenA2E+s2DeoxnXZwSC/IxxtO/ivFiiJINax5lzWUdM=;
 b=kw2QacxSyWYNk9JlsubiF7PSbVmHldiOxEtHVcZLbqKvDVLwwXvo9h6g
 cX+hMnx8zymOwn870P1PXkpe/E7Epf4YPTLafb7dBI9RnNT/heBStka05
 BguueaZBXtzuhY/oK3JF1u+K8Aq0obZESwHEBVlWnZgbLxxLadExyHQvY
 kh2/qFIEf7GSvsMdLScU67kwDI5Su31zKoqI0w4T9hb0WTyPfEKsrObbw
 C0kzgoYRAx5F6Mqq8UbYHK4hpfohF8yV3eFv/2Kb/zhFosi7ASNc1eriR
 lmeAgKhjQVLitOy5lGdr2y8F7K57OUbCzzOgj8Ar3Y9RlbYfAmKMCeHLw A==;
X-CSE-ConnectionGUID: PPAX1KA3RE2J9SW9CrvDTQ==
X-CSE-MsgGUID: 8BmYnpmjRl+3g0Lo1+C9tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="69898386"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="69898386"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 21:32:25 -0800
X-CSE-ConnectionGUID: 9HetaXT/SHqp71xFOK9TAA==
X-CSE-MsgGUID: OGaQ7LoDQVuMXUk6D1NHXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="233822478"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 21:32:26 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 21:32:24 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 21:32:24 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.45) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 21:32:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jFeDmAVh2/FZ5sIUIDgYDvw0XAM4rJ56uZXkBCujBoOO7a59t/u2eDAvymb7OAbQTYn8V9/LTisT2wcP7mKbRuMOKKzDY/rEI72tbhhn5zH8L8TwdSL1RYOSEwdljmMrD7q8sAqPndlTip3I/MqLAqd1DAvN7IOiDH1ztdqM9ACl5W2jiCbHHn5swYt4vJVMLygkR19CLHmSHwopRNXqdR7MEsW0hr6nnBiy7SQL6gfcFeQxaMj/I+wZ7kJBdFRquNOjQr685UeB0uzyKg+4MZL4PEH09Of/H07xtwmaRnU3bqZvQAtvc9ZeM0LNu5CtMk2zmhcVPRshpXC7C/XbTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xz96aaBzefRFG32xLXZ99877qqzNyZCbBmlUQ5WrjUg=;
 b=ZrAFvdbYE2ZGTgghqMBYDADNE7lyJFHKBbeYK4Zknhi+KiBxfWWb/hIub9+iOa1XAu0godiXtEKGcpiLVI3zbHImlVDg6d0sehH/5HIkAgWy+4kS/rNn8dJp08Q3c7JbZ2IujHG8UbLGjPJBfXXXxbJInyWzjtsmcWYkgdo6fe+InydlGBHnORnujNb97dh7z8XeI0UZrOv7M0yBXaKG4UNsmEd254G1LST95hI+CioPKwZdeiwmSOJNw6hrm+NRjnIHJOPXuoWSZYBZs208OJ17e1DU3l0BZiqTwEF4BNPUmlBTqnFK0VQYYfOB0Ahqxz9vDeESTqaZIx37qT5NMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH3PPF2B89F77E0.namprd11.prod.outlook.com (2603:10b6:518:1::d11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 10 Dec
 2025 05:32:22 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 05:32:22 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Nguyen, Brian3" <brian3.nguyen@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH v5 02/10] drm/xe/xe_tlb_inval: Modify fence interface to
 support PPC flush
Thread-Topic: [PATCH v5 02/10] drm/xe/xe_tlb_inval: Modify fence interface to
 support PPC flush
Thread-Index: AQHcaXazTog/yiAlZ0WfL8iWfgEp97UaWYmw
Date: Wed, 10 Dec 2025 05:32:21 +0000
Message-ID: <SJ1PR11MB6204113C945087C20D11C6A381A0A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20251210014517.3184135-12-brian3.nguyen@intel.com>
 <20251210014517.3184135-14-brian3.nguyen@intel.com>
In-Reply-To: <20251210014517.3184135-14-brian3.nguyen@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH3PPF2B89F77E0:EE_
x-ms-office365-filtering-correlation-id: 67fced9c-c0c1-453d-951b-08de37ad7e41
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?mDkVnvwxtQ+gbg/IGwHJssmwFtF2Wa+chMH1Woj9CTFKfvUFUTQSbbMlPPOy?=
 =?us-ascii?Q?n2kpV/1kgdSAWarYBNUoGZvtbcSfbALOFup0OQ6oU5xR8QDsFEBWvBSHguD8?=
 =?us-ascii?Q?7+1Av1dMsrswbZ3KQre5VIDzXvrotrA0vgxCPdAf6lIx961LBdk34kJI3Nkh?=
 =?us-ascii?Q?sfjJjUw5rsHESDmi+yOziAXsZcdk8lobgxhkpmLyQeK1S1mLftCu2BEGsSKn?=
 =?us-ascii?Q?QOS/xn1CLeULA202h1FHEgtyaEJmUuAGxWU/8b0re1j34lO7FPLtbY7elImg?=
 =?us-ascii?Q?QvL9Qbl7h7saW6VIvhw79/4d+V46xdgJZUIcgpkAhbbZ99TzqOPQ+SBV6Yk2?=
 =?us-ascii?Q?99omsyeMzcfDx0dglO7qk9kHo5+pcqK1auOC50DsdwkJVa/+v8U6/VcjAYsb?=
 =?us-ascii?Q?nBzKLkyfftWFWdBOjB7LKQ7TBRvdmSqoxde2RhfXCzfIjq6nio32hH9Iipa0?=
 =?us-ascii?Q?k1cEHyqk1DPu21ZMIdrwJ1481em7ur7kafTCaVegcCHj5Y2qS7MsiO7+5JEq?=
 =?us-ascii?Q?+D3prOOHYHnUdRA3u4IH8+5x445Szpj++wD8B7K7mayu6V6qv9u3cIDY61wY?=
 =?us-ascii?Q?MLIIC7wn3YQwarxF0yPkx8rhSL0BKmB2oLhstgXOOo4Qhp+HgPGKWg6oWivp?=
 =?us-ascii?Q?Bvh8C5DQmhdmeXZ6erAoH9rTsSYLIw9r2UB2BxjwO4zCnEhvLAWCjw/1DRMI?=
 =?us-ascii?Q?pp0w9JjvoAcPesAyfsUSgUynod8FrtUAx8/R/Ha28jeNBzoNGUak9KWZU9OA?=
 =?us-ascii?Q?9wVNW88JPzt81gpEH59y75HIOtD0GIpsOWPKQywriM0ugTWkQv0r6oPFF/na?=
 =?us-ascii?Q?Etqof52T7eEU4ML1y9OCZl4dRe00dyc/0LPfAmshRdCsr7I/33mOhvUSgO8X?=
 =?us-ascii?Q?xgtCiY3AhHURBQf4Du/wgIEMad1DyRjBQg8O5LBVhPFXsWRHxUTOUMsym9gN?=
 =?us-ascii?Q?v3RaCskVQXzBn971r/gHYkZRYmjlipjEawC9+fot84zDzVr9gFWQgcCIkVz/?=
 =?us-ascii?Q?Vc1vkMFD15BDmNyJ/Dykwx6gKYNC0y18hXQirMuzj8pDTFd2DobAutZ75AoW?=
 =?us-ascii?Q?EFC/2UHpZzgDHYpgjQaGXfSXP+aeKdwiUxW25rxVefeZLbW4lCGWV63oC7EJ?=
 =?us-ascii?Q?4efBG4hWpy4qGEYfgTJ3giVMGL/Le7WJoGuZ/7dfcRXSS5qIghpCBMO/x4Bs?=
 =?us-ascii?Q?QCy8VCXPI8eHUXpOh3FfhoRjueMAD01KcGCo1V33QJp0m0JnTnQ/0Y7S3u7X?=
 =?us-ascii?Q?LANnHIPPOE7f/Ck3JdZHcn8rDB7dsJlHnBySeyv9uzvSvr0trQ4xJgfFjR8C?=
 =?us-ascii?Q?9vDEpol9FSf+8mWfLQkn8y0DftR7guSUNo55SqWxV1I9WK26scvNzwklMZFf?=
 =?us-ascii?Q?C2Xhxf589XF2WejHOwIz1MWGpilonYL3dkWV7UHXehllkkksfr8Egu8O3EQs?=
 =?us-ascii?Q?wYqMyxrSyz17JJNcsHTPijshop6259i/tNsyVuCWN3NNMeQ56+09aNqNoYf0?=
 =?us-ascii?Q?3igW9VggJZpqJp3b7PW/kkU3T9SGGO4oNIiM?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vaajZKPhkFngiZk2C491mL78+fYWSTRJA2bjY0zck7OM30Jvb+f4riQ4mAVG?=
 =?us-ascii?Q?ondJm2ZHxIE6UK0Fp3bC+egt2LQKfvuyyJoZzVsHnaYoxdoi5gCVDFgI5ak6?=
 =?us-ascii?Q?ROpaPufYKTczUz7ZbVpsr5FhLRpldC7//BCmX8ZH/WXNxvajcDVhBPKQqcoS?=
 =?us-ascii?Q?CKh01IAaF9FFFDiZV7wOzyV1ErieIam8OpuBFZrLmMrb4gZlGuVU4uZAJXu4?=
 =?us-ascii?Q?CEURqFp/FrBPyeG+86fWXW1jysJqPplO+drfDQdiEvaMm1AY8b+U0RF3N52P?=
 =?us-ascii?Q?IWz2ba1hCgfO8vFNyzRcwH6jJDCOfi6Dc3XAHT9EVPI/Nj1vjl9x9T5/rSip?=
 =?us-ascii?Q?akOMnv+gkbEKLalq6cD19EBEDmr1DBBYrAnEDugovmryEzlBJl9mclA4LLzx?=
 =?us-ascii?Q?3OH3wtFbWwU2yQgyuWP29FB7vAl4MXvYzr9LvISzmsDWHgXD8KLAvzlpFyNq?=
 =?us-ascii?Q?IXPMcnw/YI8ruKjEwIfYQW5mJ0tPUc02xBcfa4gp2eESlBJV+yVVAXXhK36j?=
 =?us-ascii?Q?pvthoaNT0UBZ/vUEARoEHv6Vc1BCPo9PTktZtWDjAd4yyLcjOD5Vjef1stsR?=
 =?us-ascii?Q?pL+iRvyyvlGyFFCwJ52OEyOQFdt6rk9ID+Cla48thxKOBL3KEJ2muXkmVRAP?=
 =?us-ascii?Q?KW6KuODBGtaBl22edMRepMyU47r+p52cdXWt07dyTJjWyUsRMO1REqP2bVxf?=
 =?us-ascii?Q?VxkfX6bZlXltEc2OmnhfRXNkfJih39T7cjqRE+0xLcaHFrXLWo7Fp8HXkxz7?=
 =?us-ascii?Q?v9DX3/2TnkB9LHxZC5ERjQRcNynBwC0uj4yR7G1pEQhqNhWWVpdKKOYBDNc3?=
 =?us-ascii?Q?rSXvmoW6XCJqEkLiKP9bFn8rGcaUeeEhdAy4p3LXSI4os8/tJ7LmGKm5xJ01?=
 =?us-ascii?Q?oPoPj/tTd270WnoLwek1yEg5wxlGPqJkkC4HtUZFsFvTNvTc5B3+kE/wxWqw?=
 =?us-ascii?Q?PTf8IUNbCrznBLNuUGaL3YML/O1eocUdXkf0lfaRegRWidrhuLzDtcPLcNoz?=
 =?us-ascii?Q?q6s3LnBQ0rNb2SqJvNlKolNNnhWyAwUIb2T0iALJvQgNR1nE6erSMlDRfiIv?=
 =?us-ascii?Q?hbGpMFNgq9q4Fs8czE0Rpci2n5wvj5fVj4KHA/rtrMH+OhswjeKNPr5FoFfy?=
 =?us-ascii?Q?7e8hZuPYE2dtrJ7sm8mTIQKfJF05j74f1pRcsSviVUCVz0v6NrQwSfwNeQwt?=
 =?us-ascii?Q?x+xn8cpUIyQ0ICeoYynrEi2N7Kwqvdn/OtoTOy9YSPMAAZ9XpVVDvTElIYnP?=
 =?us-ascii?Q?jcAx15g/fDE0GF4PIAaF9UQkcmVnobuitG+r1xCgu/FHTyiWbdepqEkKeIA6?=
 =?us-ascii?Q?oraYgxUqEld2O2bP3WPOCZY/8kR744n1UjlyLh/h0Uz3I131SO/Rd8GR6VGe?=
 =?us-ascii?Q?Lm2sBFMRHlkXf/uCqvLIr/Bkz0Q+wxD5GeVeLdDkGLx0+5RB2IQsLFSzxniq?=
 =?us-ascii?Q?RPDaa13b/iFmDEBc23VsHd5V+GBR1opUmE1QftZJ4jXkdKO78J1B4nW+67Q8?=
 =?us-ascii?Q?D8dNGCRjZ8QU4tedeOhpcbss47QYVCKBiPI82PtGz0cVHNyfBIBaav1CC68P?=
 =?us-ascii?Q?On7oBgcrED33LRxXtsYOOtO7tilumuo8JS2EQm3R?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67fced9c-c0c1-453d-951b-08de37ad7e41
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2025 05:32:21.9905 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cRMcLHLjYRHVFbTv02p2hqK7FJqx7OvRXTXGFIWu1LiXJHBfF2FP2vRm12MHm/DWsYhd7vDF6yIjDBqIOeq8Wx1PmnZa4+FuQjOm0/zupZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF2B89F77E0
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
> From: Nguyen, Brian3 <brian3.nguyen@intel.com>
> Sent: 10 December 2025 07:15
> To: intel-xe@lists.freedesktop.org
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>; Lin, Shuicheng <shuicheng.lin@intel.com>;
> Summers, Stuart <stuart.summers@intel.com>
> Subject: [PATCH v5 02/10] drm/xe/xe_tlb_inval: Modify fence interface to
> support PPC flush
>=20
> Allow tlb_invalidation to control when driver wants to flush the Private
> Physical Cache (PPC) as a process of the tlb invalidation process.
>=20
> Default behavior is still to always flush the PPC but driver now has the =
option
> to disable it.
>=20
> v2:
>  - Revise commit/kernel doc descriptions. (Shuicheng)
>  - Remove unused function. (Shuicheng)
>  - Remove bool flush_cache parameter from fence,
>    and various function inputs. (Matthew B)
>=20
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> index 848d3493df10..37ac943cb10f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> @@ -34,9 +34,12 @@ static int send_tlb_inval(struct xe_guc *guc, const u3=
2
> *action, int len)
>  			      G2H_LEN_DW_TLB_INVALIDATE, 1);  }
>=20
> -#define MAKE_INVAL_OP(type)	((type <<
> XE_GUC_TLB_INVAL_TYPE_SHIFT) | \
> +#define MAKE_INVAL_OP_FLUSH(type, flush_cache)	((type <<
> XE_GUC_TLB_INVAL_TYPE_SHIFT) | \
>  		XE_GUC_TLB_INVAL_MODE_HEAVY <<
> XE_GUC_TLB_INVAL_MODE_SHIFT | \
> -		XE_GUC_TLB_INVAL_FLUSH_CACHE)
> +		(flush_cache ? \
> +		XE_GUC_TLB_INVAL_FLUSH_CACHE : 0))
> +

LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
> +#define MAKE_INVAL_OP(type)	MAKE_INVAL_OP_FLUSH(type, true)
>=20
>  static int send_tlb_inval_all(struct xe_tlb_inval *tlb_inval, u32 seqno)=
  { @@ -
> 152,7 +155,7 @@ static int send_tlb_inval_ppgtt(struct xe_tlb_inval
> *tlb_inval, u32 seqno,
>  						    ilog2(SZ_2M) + 1)));
>  		xe_gt_assert(gt, IS_ALIGNED(start, length));
>=20
> -		action[len++] =3D
> MAKE_INVAL_OP(XE_GUC_TLB_INVAL_PAGE_SELECTIVE);
> +		action[len++] =3D
> MAKE_INVAL_OP_FLUSH(XE_GUC_TLB_INVAL_PAGE_SELECTIVE,
> +true);
>  		action[len++] =3D asid;
>  		action[len++] =3D lower_32_bits(start);
>  		action[len++] =3D upper_32_bits(start);
> --
> 2.52.0

