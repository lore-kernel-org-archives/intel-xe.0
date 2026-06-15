Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB95ECD98CE
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 06:19:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AF0A10E1D1;
	Mon, 15 Jun 2026 06:19:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T6Kf/CVf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 461CC10E1CE
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jun 2026 06:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781504357; x=1813040357;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=2vEiBK7npG/WCowRr1z2J1Z6zeca8IQgHEkcDQ64U5A=;
 b=T6Kf/CVfd9UgSUBzXWOKm2Vyq0KvQq9poES89iBY9Evj+DFLV2dZqxm3
 HOT49ezoolkZjRhw1BRgRDcZFg3t97HU2gi1o7XOjO9x6cqTxUeiHRXTi
 GSReb0IX3djD+UrwLIEe+7W6aE94QgYJv7F300fw+dB5tsliiHRdONGx/
 HJ4jUoJYMB6t6jFUvZFO834DHX8/qFhefhYE8XgdN+fjue3b3C2GrbnLJ
 7Y0J4bWqeGIUjP3N6yNenx9viS28zfDjeA3Ak3KzyLGGX2tOEIR8swemW
 5lwELaRTefVxA8h8y9CkVAMV+16EIuQDjwG5B9MsyoxayRtCbQdpM7u2O Q==;
X-CSE-ConnectionGUID: xIvCHRkjReOyPHFOX1Z8HQ==
X-CSE-MsgGUID: DWpL+d5FTnmN6m4OWiuhlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="86136255"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; d="scan'208,217";a="86136255"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2026 23:19:16 -0700
X-CSE-ConnectionGUID: NdyRObsvQt6vd+shwmBFzA==
X-CSE-MsgGUID: oh+4h2rmTDegkN/pzGW+/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
 d="scan'208,217";a="243230194"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2026 23:19:16 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 14 Jun 2026 23:19:15 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 14 Jun 2026 23:19:15 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.65) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 14 Jun 2026 23:19:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dg+QgTyxH0JClZ4Xgf6kqKA34PC+jymdaTX+tdz29rJRGgRTovPtN94/AFyJPZRUrK5pb6UoG0yG+M8LGSyB03P5a6YFUr8p3gmAngnbt9FZ4gihkOunILxrQ1YrXf/I2P375NGYvd9oOA6BKkPCwq+z8gIhw7le2Wulwc7n6oP+k0dCWKUmsgVRyna6tUpxDa46hCJTen0xKnx4+nqVivixEj9hDjsliO/1a8P2cqjwQOXrVUeIA7ViOBylBQMR7HCztd7W0cUQQLu8brIpXOLV9zhv2zy5fQ+rmYZo2Dx8KvTbCosyafx/0qkuEhg6shm+WlW3WRxKGWLkstbFJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DIaZp+/1iEqQkhSpShNUZy4YECOdq91cPskRZDHp6xM=;
 b=qHReh5Jucry2KNDCrq/iguzdQULlKhQ+wOAHiBSUc6QpFXtUr9CkMzVml7bS26fjmODwLEGI1IzFB4UMsVtgB0Ye69Ov0QmJBKI534CWPjnulqiK6AI4s/pdxRwRRQkW3hZoQm0nVCCDquAoq0n+io0wXHNQQtugH0O76uZ4ZKqVbnKX6by/r6Hv1RfpywWSMYgzQP5cdyXGWloUwqN6QJivpWCx+l4LZu2LwRnE0O7viD2Nkoj7nge7xopFqBVPe1ETU48Q/nk/HODv4A6KU3t2I9MHvhRgg+5YXH4/Uk6tlTNpIPvygVKDGBLr/DGNijOxIJ0yj1GVcAccxRpLUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by BL1PR11MB5286.namprd11.prod.outlook.com (2603:10b6:208:312::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 06:19:11 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%3]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 06:19:11 +0000
Content-Type: multipart/alternative;
 boundary="------------KzxkkVZ4UMfwz0Ec8CLm06Cy"
Message-ID: <b6e5dd3b-8890-4bc0-bf38-b399e5cff586@intel.com>
Date: Mon, 15 Jun 2026 11:49:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/hwmon: handle CRI+ power interval encoding
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <raag.jadav@intel.com>, <riana.tauro@intel.com>
References: <20260605093527.2257977-1-karthik.poosa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20260605093527.2257977-1-karthik.poosa@intel.com>
X-ClientProxiedBy: MA5P287CA0111.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::6) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|BL1PR11MB5286:EE_
X-MS-Office365-Filtering-Correlation-Id: aca3cc8a-7864-481f-9fcb-08decaa603d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|8096899003|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: FDsBjEijO8mKIQZvHHJcvVsi3rT12WfI6JbhlbgMMLFZqehAMw3VCPumBUCe1f1SRRXcVKd2JLe01e6YOenQxz67oOHISDZvTNItk35QbxeCR7uDdqTQkLiJpiRC+vvpRTBN1CVID+rqwcb1g/pPxV7G1voVcymJ8YggHc3MHquvhsYIxwwgMWHW5PoRMEP7i49HPuEndqTynkf//QA6VZ4ftZ2UcUw1zCOGGjA8OmVBgcoFZjXAqot5uWTcFqNsp/SJvJHZzUMhCAqi0D80deRQet0liio3sOZZmARXuhK/0pr/g+MJi7UC9xnX/u86lImzYFJfS1Pdi89Bh6z2k6mMwY3/PuRH1Z81QC/UemzbezDccm/+1rgM7ClJ0bVsQP0lYk4MJ3zhxmOCfDUNS7tNjbduCFXUvVtUYg49IB0nJ03j+aIT9tEWyL9ZHUBGIPeu9LvUcuQ4rtlqElJq7cjQKp5j/dvJLaEf4Qz29VlXa/lnha9qOCl5Szxpb5XNU8byFu7VjhzR0YNIXknEVXKTBFnXMCBYyQhJqxC9p2Zg+RxttQu3G8wg1BmnQekhRevAV1hbK49J9I3iUuu6CVXetBQWVuGYuiR/rlX/12qe0X5i/plJPWd2isnd0qtTPBlvBJ71uNd0keNbCSyn6GUJR14aZB95nAFUX29XSrKUeuEOITFYHxTP0OssziEd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(8096899003)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0JURzFRdVl0RUF4R21TV2pOWHE5YmlSNTZFbzdpNFV1WUE4RFZzR0Z6NHlv?=
 =?utf-8?B?YUJGMHZkQUZNQlZZdisyKzF3a2xTZnFrYlRaM2ROSmEyVCtNbU1yRHBVTW5H?=
 =?utf-8?B?b0RqU09LY1haczV0Nk44Tzk2KysxNE5XaG50aEhVdGJZU2pvR2VSNzBvSEsy?=
 =?utf-8?B?SW9pcUlJSktWam1SZGNYUU5RNXR0Q1c2RmpuYkd6ZXl4RE1wMCtFWEJKK2tT?=
 =?utf-8?B?dXJQaTlvODA4UEVXTXhVVmtabzRubktPYnBZc1UwMFgwWWluZ0tkcUdDQkFu?=
 =?utf-8?B?ZWsrRTV2UUFMT24xWXFqd1pwR0VtbEt6WVlQK2hzd3NFeC9vN09tUm1ib1c2?=
 =?utf-8?B?NFM5SGFEWHJVdzZJd0szQWx5UHJyZGNpWjB5eDZ1cjd2MHhkbVBLOGo4WHBn?=
 =?utf-8?B?WVVtTWU1SFpyMW5pYm02Y1hxM3JRMnBMbkRoVkNha1ZQQ3hmaG4yODVOWUxo?=
 =?utf-8?B?elQzYmtXNmdvN08vaVQ0MmtFZ2Q2RFV4K1BJTThNdUJQQVdCUVdtSFhlU2Rp?=
 =?utf-8?B?cUQ4bHNTdVBoL1IxbSt0Vi93alJadVJZL0g4a2NtQVovWWJWdmtXTjNnM2xW?=
 =?utf-8?B?UnF1WXhYVERXQUJScDl0UE83Zkt3QVZDbDB4aEFNSm1BQTZYUlZvV3dSSlpW?=
 =?utf-8?B?QU9QNVZ2YXNDU2xpb0dNTW9PTE14VTdqVXhRTjlubGN3SDZVSHFLOUZUTHpR?=
 =?utf-8?B?NnFDek1HK1l2dVhnL0t0RmlFRVdoT3gxQXNqWUo4QlZ1UTZWK0g1S3VINU05?=
 =?utf-8?B?bysyYm9nQUtXTnBjejJKcTdYNWExcVV6eFQ5UW10dHRCRWFiVGdtUGhySTRX?=
 =?utf-8?B?NTJMenNBYnY2K3RrODVvUkQ0WFF2c0lPd1k1V1RKc0xmaUptWko0a3RsRWtC?=
 =?utf-8?B?aEVsUUliN29WYzhyM04xTjRQdGQrWnNpU1NDQ042cFljYVBBMnQ3bUlFZTZO?=
 =?utf-8?B?emVvM0I2NnNWTnN1Q0daREZHbm5tVElSVU0xdDFmREp1WThGOW5OSDFucDdV?=
 =?utf-8?B?ZHVIWGJGeEEyMjEzV0kwYkx3elVhRldZeWw2YlFYWjBKZzBqeGVQaDN2M2ti?=
 =?utf-8?B?Nk5oMmVyU0dNcmQ2ZmJ2bnNzL2w2KzdLWUZNVlRKbkI1c3BKL285cWh0QXZt?=
 =?utf-8?B?S3JlQjh1bHJ2K2xoMDNYUmtzVGNxaTdHN0dzSXNKbVRoZWRCUm5uNG5sZnAz?=
 =?utf-8?B?SEV5Mkpzam5KcHR4V2dxOEs0dDdCaExZL3FQMGU4SkRuTTVUNGg3YWRuS1Jl?=
 =?utf-8?B?Q2wvMGkrWVNENzU1YjhUVnh5YUxlTWh5dmJ5S1d2Tld6SlBScUhwMi9kazVn?=
 =?utf-8?B?VDViUFpSMlZjbkpXYzlSSlF4QkMxUnZranVTZDFjcUhTK3J4N0tzY1l5Sjh0?=
 =?utf-8?B?dW5zalFsUGxWaTU0UDkwZGxZeXduN2NhU3ZldlhpQjd0V3FpbElmN3Y1Y3Y4?=
 =?utf-8?B?U2NJaFJoR3dqZjFXa0ZvVGthN1NMUHhkMGVOQi9CbXdXNUp6ak1HWVpzZzFL?=
 =?utf-8?B?a2FLKzF0cVFUVy9COWEvdUp6NWVWSEhsNzRaMk4rWWtVdVNEVTFiNkhOU3BV?=
 =?utf-8?B?N3JhYVNKRVI2aTlqWnNFR2twLytZTVJUVXFVeTBxREs3RG95LzUrdFVFbXBw?=
 =?utf-8?B?SHNGZy9nMWZwc1VxMzhyYUdsZTZkZ1VZRXpVd3FqZmF4THU1cmZ3YXZ2TTNj?=
 =?utf-8?B?Z01rYVRUQ3F1RHI1VjlLNlhCQVJvYnA3dkV1bnc1eVJQaXdJaDdMbXpwYnBJ?=
 =?utf-8?B?ZXZ4M3ppZkZuL2lPRTRyVnBNbUxXU1laUHhwaGRRYnRLU2YxaWowYnhNWnF2?=
 =?utf-8?B?UStSUGVMQzVlTWNXTE85alV2Q1hBWmoyRnpCK3Yra2pMZFVmMVFDSDJFWE5q?=
 =?utf-8?B?YkYwZW4wcUNTUFlVQTVIaVowcEdkREIxczREc2xJYWtrU3RjREplOWhmeG83?=
 =?utf-8?B?cnJMRDRucGRZcGFIMDRyV29adXJEMXJiK0hlQUVFTE1vbDc4eldvUkNhRVVo?=
 =?utf-8?B?WFFhU2gzYTZBNUx4T3ROY0o1bG55cVNNanVaa2o2UWgxV2dib2RJdmVvaDhl?=
 =?utf-8?B?dE1vYllzRnU3Nmw2SWthNHdKVGhlaXpwU0ZqSUk5Y3E0Vjd4TnIzYzlyaW5j?=
 =?utf-8?B?eWp0YS9yODMxVDI3VXYrWm5CU1h5YXBhMWw4d0hocWdKNU5PMXlRMFFLMElV?=
 =?utf-8?B?UWp1MWsyRjFSV3U5L2hJZlIxeDV2VGIrNkNLRFNsNE90WXhoNHVwTzFvZmJ3?=
 =?utf-8?B?TFJnZmQ5dVkzNVZBUzJFd00xUWM3Vjg5Qkp5N3VyR0taMEZmekVEcEw2NXF3?=
 =?utf-8?B?RkJkbysrTDV2R3h4UGIyNXhneWYrNGpZSzhqSEhkY2VJaUp0eEpXUT09?=
X-Exchange-RoutingPolicyChecked: Y+J4y4UXWIkHiq4a0ZfE/LO+KXafHLpwWkItfraAtU9L+cGm3xkPCgsYaQ/umuIKEIzcH+UT16oMk0J997ikBQ9qr50kljBDDZe+kNuK8KCpV1rNE4mmFlgDGUymvyT+byuFgiW7IO+aWe38eFO3jXco4q0ukwkAvjY+GVGhpOPtSkEbOIza0BCbKvan0FcDTOjGsCAMK89dXwqKbjkYRByPN/+CHuGk6DncMSfKPkR3McTNCtiT/BVXmU3SyeDJiSaW1jXToU143TmAH0Xl/AHzkE2Dk63kefga0dZCyh2ZvYVXGVUFWjJad4e1uGCBb6Amnm3HuMx/fZ15927f+Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: aca3cc8a-7864-481f-9fcb-08decaa603d7
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 06:19:11.1751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PrV2+H9FGVbogUkL4Ss7BlKdd8M2E1PrNNUeICkvB514ztbotTWJKqWi0vU7kJv4oln7edaBreb5/5rP3TxvPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5286
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

--------------KzxkkVZ4UMfwz0Ec8CLm06Cy
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 05-06-2026 15:05, Karthik Poosa wrote:
> On CRI and newer platforms, the power-limit interval encoding is changed
> from the legacy 1.x * 2^y format to a U5.2 value in milliseconds.
> Update the interval calculation accordingly for CRI and future platforms.
>
> Signed-off-by: Karthik Poosa<karthik.poosa@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_hwmon.c | 84 ++++++++++++++++++++++-------------
>   1 file changed, 53 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index de3f2aeffc3f..4038e1da2e71 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -575,23 +575,34 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
>   
>   	mutex_unlock(&hwmon->hwmon_lock);
>   
> -	x = REG_FIELD_GET(PWR_LIM_TIME_X, reg_val);
> -	y = REG_FIELD_GET(PWR_LIM_TIME_Y, reg_val);
> +	if (hwmon->xe->info.platform >= XE_CRESCENTISLAND) {
> +		/**
> +		 * On CRI and newer platforms, the interval encoding changed.
> +		 * The value is now stored directly in milliseconds as U5.2,
> +		 * replacing the older 1.x * 2^y representation.
> +		 * Bits [6:2] hold the integer part and bits [1:0] the fraction,
> +		 * so convert to milliseconds by shifting the field right by 2.
> +		 */
> +		out = (u64)(REG_FIELD_GET(PWR_LIM_TIME, reg_val) >> 2);
This truncates the fractional part (u5.2). Is that intentional?

Thanks,
Badal
> +	} else {
> +		x = REG_FIELD_GET(PWR_LIM_TIME_X, reg_val);
> +		y = REG_FIELD_GET(PWR_LIM_TIME_Y, reg_val);
>   
> -	/*
> -	 * tau = (1 + (x / 4)) * power(2,y), x = bits(23:22), y = bits(21:17)
> -	 *     = (4 | x) << (y - 2)
> -	 *
> -	 * Here (y - 2) ensures a 1.x fixed point representation of 1.x
> -	 * As x is 2 bits so 1.x can be 1.0, 1.25, 1.50, 1.75
> -	 *
> -	 * As y can be < 2, we compute tau4 = (4 | x) << y
> -	 * and then add 2 when doing the final right shift to account for units
> -	 */
> -	tau4 = (u64)((1 << x_w) | x) << y;
> +		/*
> +		 * tau = (1 + (x / 4)) * power(2,y), x = bits(23:22), y = bits(21:17)
> +		 *     = (4 | x) << (y - 2)
> +		 *
> +		 * Here (y - 2) ensures a 1.x fixed point representation of 1.x
> +		 * As x is 2 bits so 1.x can be 1.0, 1.25, 1.50, 1.75
> +		 *
> +		 * As y can be < 2, we compute tau4 = (4 | x) << y
> +		 * and then add 2 when doing the final right shift to account for units
> +		 */
> +		tau4 = (u64)((1 << x_w) | x) << y;
>   
> -	/* val in hwmon interface units (millisec) */
> -	out = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
> +		/* val in hwmon interface units (millisec) */
> +		out = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
> +	}
>   
>   	return sysfs_emit(buf, "%llu\n", out);
>   }
> @@ -637,24 +648,35 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
>   	if (val > max_win)
>   		return -EINVAL;
>   
> -	/* val in hw units */
> -	val = DIV_ROUND_CLOSEST_ULL((u64)val << hwmon->scl_shift_time, SF_TIME) + 1;
> -
> -	/*
> -	 * Convert val to 1.x * power(2,y)
> -	 * y = ilog2(val)
> -	 * x = (val - (1 << y)) >> (y - 2)
> -	 */
> -	if (!val) {
> -		y = 0;
> -		x = 0;
> +	if (hwmon->xe->info.platform >= XE_CRESCENTISLAND) {
> +		/**
> +		 * On CRI and newer platforms, the interval encoding changed.
> +		 * The value is now stored directly in milliseconds as U5.2,
> +		 * replacing the older 1.x * 2^y representation.
> +		 * Bits [6:2] hold the integer part and bits [1:0] the fraction,so
> +		 * convert from milliseconds by shifting the value left by 2 to fit into the field.
> +		 */
> +		rxy = REG_FIELD_PREP(PWR_LIM_TIME, (val << 2));
>   	} else {
> -		y = ilog2(val);
> -		x = (val - (1ul << y)) << x_w >> y;
> -	}
> +		/* val in hw units */
> +		val = DIV_ROUND_CLOSEST_ULL((u64)val << hwmon->scl_shift_time, SF_TIME) + 1;
> +
> +		/*
> +		 * Convert val to 1.x * power(2,y)
> +		 * y = ilog2(val)
> +		 * x = (val - (1 << y)) >> (y - 2)
> +		 */
> +		if (!val) {
> +			y = 0;
> +			x = 0;
> +		} else {
> +			y = ilog2(val);
> +			x = (val - (1ul << y)) << x_w >> y;
> +		}
>   
> -	rxy = REG_FIELD_PREP(PWR_LIM_TIME_X, x) |
> -			       REG_FIELD_PREP(PWR_LIM_TIME_Y, y);
> +		rxy = REG_FIELD_PREP(PWR_LIM_TIME_X, x) |
> +				       REG_FIELD_PREP(PWR_LIM_TIME_Y, y);
> +	}
>   
>   	guard(xe_pm_runtime)(hwmon->xe);
>   
--------------KzxkkVZ4UMfwz0Ec8CLm06Cy
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 05-06-2026 15:05, Karthik Poosa
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260605093527.2257977-1-karthik.poosa@intel.com">
      <pre wrap="" class="moz-quote-pre">On CRI and newer platforms, the power-limit interval encoding is changed
from the legacy 1.x * 2^y format to a U5.2 value in milliseconds.
Update the interval calculation accordingly for CRI and future platforms.

Signed-off-by: Karthik Poosa <a class="moz-txt-link-rfc2396E" href="mailto:karthik.poosa@intel.com">&lt;karthik.poosa@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 84 ++++++++++++++++++++++-------------
 1 file changed, 53 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index de3f2aeffc3f..4038e1da2e71 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -575,23 +575,34 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
 
 	mutex_unlock(&amp;hwmon-&gt;hwmon_lock);
 
-	x = REG_FIELD_GET(PWR_LIM_TIME_X, reg_val);
-	y = REG_FIELD_GET(PWR_LIM_TIME_Y, reg_val);
+	if (hwmon-&gt;xe-&gt;info.platform &gt;= XE_CRESCENTISLAND) {
+		/**
+		 * On CRI and newer platforms, the interval encoding changed.
+		 * The value is now stored directly in milliseconds as U5.2,
+		 * replacing the older 1.x * 2^y representation.
+		 * Bits [6:2] hold the integer part and bits [1:0] the fraction,
+		 * so convert to milliseconds by shifting the field right by 2.
+		 */
+		out = (u64)(REG_FIELD_GET(PWR_LIM_TIME, reg_val) &gt;&gt; 2);</pre>
    </blockquote>
    <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">This
      truncates the fractional part (u5.2). Is that intentional?<br>
      <br>
    </div>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">Thanks,<br>
      Badal</div>
    <blockquote type="cite" cite="mid:20260605093527.2257977-1-karthik.poosa@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	} else {
+		x = REG_FIELD_GET(PWR_LIM_TIME_X, reg_val);
+		y = REG_FIELD_GET(PWR_LIM_TIME_Y, reg_val);
 
-	/*
-	 * tau = (1 + (x / 4)) * power(2,y), x = bits(23:22), y = bits(21:17)
-	 *     = (4 | x) &lt;&lt; (y - 2)
-	 *
-	 * Here (y - 2) ensures a 1.x fixed point representation of 1.x
-	 * As x is 2 bits so 1.x can be 1.0, 1.25, 1.50, 1.75
-	 *
-	 * As y can be &lt; 2, we compute tau4 = (4 | x) &lt;&lt; y
-	 * and then add 2 when doing the final right shift to account for units
-	 */
-	tau4 = (u64)((1 &lt;&lt; x_w) | x) &lt;&lt; y;
+		/*
+		 * tau = (1 + (x / 4)) * power(2,y), x = bits(23:22), y = bits(21:17)
+		 *     = (4 | x) &lt;&lt; (y - 2)
+		 *
+		 * Here (y - 2) ensures a 1.x fixed point representation of 1.x
+		 * As x is 2 bits so 1.x can be 1.0, 1.25, 1.50, 1.75
+		 *
+		 * As y can be &lt; 2, we compute tau4 = (4 | x) &lt;&lt; y
+		 * and then add 2 when doing the final right shift to account for units
+		 */
+		tau4 = (u64)((1 &lt;&lt; x_w) | x) &lt;&lt; y;
 
-	/* val in hwmon interface units (millisec) */
-	out = mul_u64_u32_shr(tau4, SF_TIME, hwmon-&gt;scl_shift_time + x_w);
+		/* val in hwmon interface units (millisec) */
+		out = mul_u64_u32_shr(tau4, SF_TIME, hwmon-&gt;scl_shift_time + x_w);
+	}
 
 	return sysfs_emit(buf, &quot;%llu\n&quot;, out);
 }
@@ -637,24 +648,35 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
 	if (val &gt; max_win)
 		return -EINVAL;
 
-	/* val in hw units */
-	val = DIV_ROUND_CLOSEST_ULL((u64)val &lt;&lt; hwmon-&gt;scl_shift_time, SF_TIME) + 1;
-
-	/*
-	 * Convert val to 1.x * power(2,y)
-	 * y = ilog2(val)
-	 * x = (val - (1 &lt;&lt; y)) &gt;&gt; (y - 2)
-	 */
-	if (!val) {
-		y = 0;
-		x = 0;
+	if (hwmon-&gt;xe-&gt;info.platform &gt;= XE_CRESCENTISLAND) {
+		/**
+		 * On CRI and newer platforms, the interval encoding changed.
+		 * The value is now stored directly in milliseconds as U5.2,
+		 * replacing the older 1.x * 2^y representation.
+		 * Bits [6:2] hold the integer part and bits [1:0] the fraction,so
+		 * convert from milliseconds by shifting the value left by 2 to fit into the field.
+		 */
+		rxy = REG_FIELD_PREP(PWR_LIM_TIME, (val &lt;&lt; 2));
 	} else {
-		y = ilog2(val);
-		x = (val - (1ul &lt;&lt; y)) &lt;&lt; x_w &gt;&gt; y;
-	}
+		/* val in hw units */
+		val = DIV_ROUND_CLOSEST_ULL((u64)val &lt;&lt; hwmon-&gt;scl_shift_time, SF_TIME) + 1;
+
+		/*
+		 * Convert val to 1.x * power(2,y)
+		 * y = ilog2(val)
+		 * x = (val - (1 &lt;&lt; y)) &gt;&gt; (y - 2)
+		 */
+		if (!val) {
+			y = 0;
+			x = 0;
+		} else {
+			y = ilog2(val);
+			x = (val - (1ul &lt;&lt; y)) &lt;&lt; x_w &gt;&gt; y;
+		}
 
-	rxy = REG_FIELD_PREP(PWR_LIM_TIME_X, x) |
-			       REG_FIELD_PREP(PWR_LIM_TIME_Y, y);
+		rxy = REG_FIELD_PREP(PWR_LIM_TIME_X, x) |
+				       REG_FIELD_PREP(PWR_LIM_TIME_Y, y);
+	}
 
 	guard(xe_pm_runtime)(hwmon-&gt;xe);
 
</pre>
    </blockquote>
  </body>
</html>

--------------KzxkkVZ4UMfwz0Ec8CLm06Cy--
