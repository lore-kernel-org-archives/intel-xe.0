Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03847D41D55
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 05:56:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD17C10E073;
	Tue, 12 Nov 2024 05:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RE8GzljG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC6D10E073
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 05:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731390994; x=1762926994;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3plbHmak6h4IVq41mP41SrkwpxFmkgZBvkEsEprykpU=;
 b=RE8GzljGchsMYM2CEFAvIeAAzx/GFI4vHOR7pOyhXyVX3thdROscSqfG
 TmoZkZt78+PvYqGN2OxEZtB5K1B64eeynh+cf5xe8Q+fVNM0++5dMWwLd
 GTMzw9SJLaA4/50kwgXrapq3vH3pHxr/igoOelHvT8UJuoJZKjTPsB5iq
 2Qit47VB4mbJJ2DRec1bEEc/Qm6kWcpXFNA0FQzjNHsCXeE+cAQfdIU7I
 EZBOyGk58Jzvr/6rO8G7AumH2Ze9YkEiCQgAU6yDEah4xs2uF+kjS+1+F
 tHsqbEQZU6AIRaOx3Yo4VW8EjIHlngRbhXae4ckdQB6EGG5BEsjaz3sWm g==;
X-CSE-ConnectionGUID: qwoDfTzQQOOVTs1eInpi1Q==
X-CSE-MsgGUID: 8bbeQkDsS0a5kw+5ctrszw==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="34075892"
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; d="scan'208";a="34075892"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 21:56:33 -0800
X-CSE-ConnectionGUID: TgsjqhPWSBipUy8l25hPzg==
X-CSE-MsgGUID: gVdlHi1kRm6/JLQNG91ojQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; d="scan'208";a="110555955"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Nov 2024 21:56:33 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 11 Nov 2024 21:56:32 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 11 Nov 2024 21:56:32 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 11 Nov 2024 21:56:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wZFVN+ek0ZvXnTwEfzBlJPUZezlCZ+HbsPbIxEEjfNNIFxArnPWm9FTA+MVIvG+eI0jT59KYZv6RI9UTzTV+T71VJwqdhA8rBl2rTNaON5E2rwKqGC14cvwCnB/JIqxJT2aNYcBwR9px5rxhe12Xya2Z4ytA0wnblJjiMWr20AeuyaO0a0l8Gf4Vy45bSbQle0hIO44W/m48ahKyfMugZoWJdOgu4oUAucFO8V+19pbXhzeBFeb/FzWros5weDWc28RiwYbqqgcKoD4Qy9WReACz15JAS1Mt0rS96sCn/S50QuH1y5fDJVkYk73hmi5L6/rAUiGXTj1LiyoRxx5z7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NC5keLUzWWMW5/wv0x73geevuWb7wOKi08vJqKkXF0s=;
 b=Dvh/QYduFzEdR/2P3bqRvcYjQSZ070kIwe73cez8EXZdXefxO+RSpPUOwcKdQbkH7vxK0ub6uMDHohrQLXZDFI8KHTVwXK5uwskgKT9sudRB9mhzQFem/weEiNmFKVJ5V60d8IZLsNuvOEuu20xv3lNCvakkVr99zz8Fvmry7S88qXx8ifVbigOUPJlJvyncyU0WDafpwFmzQgEu9QCaTkG+iQF0iYYd9LZUeI+egh85aZPXlktl5Nco6UGP/ZPUsV283fMxRh01T8hYXRmGrTyrcIvjuWQtWC6//9JsRuRvzrQ5/fKygmBqGHcd907GwMO2H0LTeM+/r3pCv1b9dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH0PR11MB5783.namprd11.prod.outlook.com (2603:10b6:510:128::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27; Tue, 12 Nov
 2024 05:56:30 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%4]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 05:56:30 +0000
Message-ID: <cbfe45f6-355f-4d6a-accd-bc12800c3d69@intel.com>
Date: Tue, 12 Nov 2024 11:26:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe/pmu: Add GT C6 events
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20241108181512.3461481-1-vinay.belgaumkar@intel.com>
 <20241108181512.3461481-3-vinay.belgaumkar@intel.com>
 <Zy6RiQtCjTcSDTsw@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <Zy6RiQtCjTcSDTsw@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0024.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::9) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH0PR11MB5783:EE_
X-MS-Office365-Filtering-Correlation-Id: deb5eac6-4d0f-429b-8760-08dd02dec0e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YS9SVzJRVStMWHZ6SkM0anNlZ2xRMDJyVkZsT3dsZ1h3OWVYOTgvSDM1YVFo?=
 =?utf-8?B?d1h4L29pcUZZZ0hiNWE3YkpyYTJ4RHJSZnBKNFo0bnJuNXphK2FLMmFsZVpX?=
 =?utf-8?B?MGx6NU1ZTGlkVWcyZ0NCaEw2Y0lHMXVjSHdFUTFNcGZINGs1RFhKK1hIMkdv?=
 =?utf-8?B?MytpbzEvdkVmTTlFWnpDcjRaZUdKcU93cHluUlhwWTB3eGxqT1BGczRtTGUz?=
 =?utf-8?B?eklld1Vrb3dNV1dTRHE0bURsYWt2TExhTVNrdVBTdzNPNjl6V3VveTlDU0pL?=
 =?utf-8?B?SGIvYjNJZ2pFN01YQzd5cHBkQ0Joc1hER1g1S2pKdy9iUkhVMFVyMFc0cnpP?=
 =?utf-8?B?aUJsbEVSbFVPYlAxcStNaENVUUlQU0lQVTdIYzNiZXZUSlNZU2RDWnZlVEpa?=
 =?utf-8?B?a3NJazJyQUhMMFN2b1dFMlNaMHl2cWhLb2o2U0UyZ2djcjN6enJHRi9NNXVI?=
 =?utf-8?B?K0dYQnZqa2FKYkEyQVhYekpFd2JKU2d5WFJpbU80ZkZ6dTd2STNqL25TelVY?=
 =?utf-8?B?VTJyaGVzckJ6MjdyZ3AwOVVseXo2bERtU1FWRUNCb2lwclNCVEVGajMrK0E4?=
 =?utf-8?B?Szg3Tk9oeWdtV2wvd3QrRlFSUGdXYnkxek54Tzl6eTY1LzBNOTI3d2dTRThq?=
 =?utf-8?B?UjM4cHEvUGVqNUlNVi96Wm9Kd01sRVdvQzNSRUkyOUcraTQvak5tcU9xbFN0?=
 =?utf-8?B?VTFDN1BsT29yMDMrb3dUd0wxOU5rZnk1RWdKYUh1bTYvSFdSdmcwMlM4RkhF?=
 =?utf-8?B?Zlk5akhJczdQaG9jNGtQR1NXQ2hvQjQwM0NydFVBUktHeHpXempNcUl4VGR3?=
 =?utf-8?B?SXh1UjUrNVdBVUxaRVVZQ0tCQmRJTVROaE0vclVSckFFV1NQd1F3QVB1am1F?=
 =?utf-8?B?aWhGVXlxZGVPN0NleDhWUkMrdkRSNXAxOFZLZ2FCdmRXbW0ya2hXSmplTkFQ?=
 =?utf-8?B?Z3p3dStsNWdSemFDUFhXM25MMXAzWFE5N284SzIxRDl4VDh3NHpvSTBOeVB0?=
 =?utf-8?B?MHNzenV1VmJ1ZUw2bG5lWndMVXlaaVk1bEE0Tms0Q2IxUVl5bnk2blhxcWpr?=
 =?utf-8?B?aENuRWR4MWYwNHBTd0RoLzNwWFRjV0tsckRZdGlSMDU2dVBwZUxNV0dJVHp6?=
 =?utf-8?B?YnhqeUcyQkg0S2lnQ1BpQ2w5Rm56UHdYWmZFMlJ2RFFtZ05EL2hWSlJQbEdy?=
 =?utf-8?B?V2ZMZkZUeW90VmdUcWtTUWcrNDlpU0JWZ3oramNNMmw0cEZRTGRJb3dCcm9V?=
 =?utf-8?B?bjYrVkJyTFFWanRiMWtMbkFkZVU4c0hPbk1ienNkYXR5cEtiT3F1MHppQXVs?=
 =?utf-8?B?Z1ZkMC85TWppR1FZVlIxZTFTckdDSmZCUEhjSGVFNlFLTkh6b0dUM0xtQlJI?=
 =?utf-8?B?ZWxvOFRJUVBEYjdNSkIzdnhUWU5PUVFESFZRaTl2Uys1dW84d3MrNHd2dXFM?=
 =?utf-8?B?eVdCOWNnWVIzVW1TeEZ2a0h6QlFtZEQwLzJJVHcrYU0vRTZwMlhUajdKcUUz?=
 =?utf-8?B?K1ZJZXM3ZGJzTzdZRkJlTDBvQVFOT2JMWThlUG1qKzFWNDNPMUVHU09OZjdE?=
 =?utf-8?B?Vjk0WjlYdUUzVkhlbGNRc1gzbXBRY2UxQUtHTEc3S3VVNW03NTVLWnF6KzlK?=
 =?utf-8?B?c1lXMHQ0QVJXc0IyZThxTjdRekxTbkFXSGtPZzJYTVhnVHZXeVBDV0I2ai9r?=
 =?utf-8?B?WjZqL0ZnZ0c4bmtMeG5iODJtNTZ0Q1J0bnJpL1BUMWlkN1Rkb2l5TEZ3bU9h?=
 =?utf-8?Q?WJRZyDdtNda6+t5nNzxgq7Nwj8qG27eP5BFJX1l?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2FxZUR0YWZub1hhdXRRMHlYZEplQ0VRa09QUit0ZUtnejJEWmQxbm56dkN2?=
 =?utf-8?B?T1hheXpaTXR6OTJFUDVzM0I1aVY2Z204U2xPelF6NmVJMWNCT0VVSjE0Qm1Y?=
 =?utf-8?B?R0UveDJQU2FOMWNyRE8xVWhCeWYrL3F6dlg0djI0U09ZbWVBSjVaRVhkdlBp?=
 =?utf-8?B?eHp5bCsxS3pXMmsvaW8yRldQTnF6VTN5Ymc1Snh1ckhobGlSMktEVHhMUktP?=
 =?utf-8?B?WnV5OWJXOGNlcVRaWVgweU4yYW9aVm4wWkJsM3VuSGxaMkV2RGd4eGJCVVNP?=
 =?utf-8?B?NS84RVlFNVZMYzFGbXhMR1RGUU1YL2RwL3F6RWVEcjN3UUZHL1N6V1BOdkFI?=
 =?utf-8?B?Q2E1UUZaN3cyTFc3TFBVa2FxajhFNFhQVWxVK2xTclVBcFFEdWxDQWtRa3B0?=
 =?utf-8?B?ZjdlcDA0Z2FUa2JuZ1A0cnVsNWRKcnVGMTV0b2RKYzR1c2ZzeHpIWXlFUEtF?=
 =?utf-8?B?MloyWTRUUmRSZ00rUURaV2xSNjdYUDl2Zzg1ajhEaGxQRzF6d2hXcm9Jc1lN?=
 =?utf-8?B?TnRjb1UyUERLeFo0bFlLUWVVcG1RUGR0K0NmS0N6NnF6UlZ6VGRmTlhTQjdK?=
 =?utf-8?B?RWhDM1ZER0ZlNmZWV0VocFNNTGdGKzNSNmxkRTRIdVg4Z05SbjhXVUt3VmhF?=
 =?utf-8?B?eDRPNkM0aVRaaWRKL1E2WnphbVFBaE9MblJQZGtNT3JLczJybk4ydGVKVllE?=
 =?utf-8?B?YWpNWDhnVHJ6RVExRGtpbXorVCtiK0FJTlIySnVpWUJqOHF5cDF3U09HTmZN?=
 =?utf-8?B?Q0ZTRnpDVmtqV0ZSWG5jYlkwZEJyK0x4TktIOTdoWXRnYVBKMkFNZjBBbU1l?=
 =?utf-8?B?eG95NDJKOWQvcDc2b3B4eTBPNnJVUmNJNXJUcWRCcENFcnYwWmlwWkRTZDdQ?=
 =?utf-8?B?TGp3VUNPR2lycUhoSU5adHBSSmgzbk9qV0loSlVwUEh1dnFBVXFWZWJEdWNK?=
 =?utf-8?B?UFgrU0NraHVYQ3dHYitYNmcrNlNIRFhEbE5vM1dROTZSZ3QwK3Awa2hjTDJi?=
 =?utf-8?B?SkZOMnd3TVZJNjd1YzNBNVdDdG9jOUl2MTdlSlQrL1BDL0JmZmtMM3JEMmFP?=
 =?utf-8?B?QnNTQkdGemtKQlg4RXIzeEpnVVovNG15alJEaG5uK2IrakJSTEhvSnUrekdq?=
 =?utf-8?B?QmdVaHV6Y1F5SUUwZGRaZzhlM3RKUGI4aVFvRzBmN05mSHhBdDhya2NTRnZZ?=
 =?utf-8?B?dUx2Z0ZicTFKcVBsTW9yRVRMVWpuZXZPVFg5ZDJTblptSE1HSUE4NUp4Wjcz?=
 =?utf-8?B?Sjg2c2ZJN2RGTEgrVnV2MW02WWtRZDhNazZQSjlNaDdrNm9BNzFRc3hPWjhl?=
 =?utf-8?B?OGNzRE5taDR5S2ZDMlR3dTNKSE5Mb3BNMWNoT0xBTk9MRzdMMW1oSEpvQk53?=
 =?utf-8?B?Z1hUQnFlT0NMWE0rMGx0UjVjSnZtYVhSY3Y3clFYRW5CU1FmWmlBOGhBVUtG?=
 =?utf-8?B?Z0pzUjJHVzhsS1FBK3MxTmNMYWwzTnFsTHAwaTZaLzg5MDF4cmFNWGo2YWlR?=
 =?utf-8?B?c3JwU0pIaXIrNVdNdFBNYVp6dW84MHNUc2NDUVgvSWp3WmtuRzJWamRVQWdi?=
 =?utf-8?B?Qm5LZmU5bGZ3Nk0zVzRzckVJOHk5RW13WGxNNzFQRXBCbmQrZTZjZnkyZTdM?=
 =?utf-8?B?NnNaZGlzN3BnVnRsSVdubGpsRHhHRWkrbjYrYzhWU0JwY09FVlFGdmNYR0w3?=
 =?utf-8?B?VVBkQStsNG80cGluOUxjcWR2aXpPQzBRQmJreTlzNUdGRDhEaXY4T3ZSaklT?=
 =?utf-8?B?Q3ZneTdjMzJsUVNRVEdGVGsreFFxeTNHdFNYU2NIelBSNE9VeXJiMEh0bnZh?=
 =?utf-8?B?RjVZaEM1a2dUUVVrZXNjMTZzNlZ4Qms1MWNhaTcxdzBQQ3Z5Y3dJY2dTZ2Rk?=
 =?utf-8?B?dS8zNlgvcGQrbGE3MTZ1SE5lbXlWbUNheTFLNUJ2cmo0Kzg0MHlKNkJGOEZ1?=
 =?utf-8?B?K0NQWlJYRDBFS2IwMWhwQkdsWjJTWU5xQ1F1TGlEaXpZTlNEeGxWZmd3TjZx?=
 =?utf-8?B?bEZYS3JrbEc5R0VmU2hJUlVWbkUvdzltVEhOU3paSEZaL1JHMzcxd1JJeUFN?=
 =?utf-8?B?OFEzbDFhS0ZJUDB3TnRORDJ1OWZXZGEvS0JMMWowSmlkR3pwZHMyWW43Vkpo?=
 =?utf-8?Q?/OFS9E5VFpNipMP6QL60agSJb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: deb5eac6-4d0f-429b-8760-08dd02dec0e1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 05:56:30.0017 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: idNBxaHwp7bJrD8PdIKN8vTRqAjU++v+xmoNnLJXOASgz9tvC1v0M/UyEy/a6a5hjrPN3wFbKU+Tt+/jojaL/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5783
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

Hi Vinay

On 11/9/2024 4:02 AM, Rodrigo Vivi wrote:
> On Fri, Nov 08, 2024 at 10:15:11AM -0800, Vinay Belgaumkar wrote:
>> Provide a PMU interface for GT C6 residency counters. The implementation
>> is ported over from the i915 PMU code. Residency is provided in units of
>> ms(like sysfs entry in - /sys/class/drm/card0/device/tile0/gt0/gtidle).
>>
>> Sample usage and output-
>>
>> $ perf list | grep rc6
>>
>>    xe_0000_00_02.0/rc6-residency-gt0/                 [Kernel PMU event]
>>    xe_0000_00_02.0/rc6-residency-gt1/                 [Kernel PMU event]
>>
>> $ perf stat -e xe_0000_00_02.0/rc6-residency-gt0/
>>
>>    Performance counter stats for 'system wide':
>>
>>                1907 ms   xe/rc6-residency-gt0/
>>         1.907581788 seconds time elapsed
For the sysfs, it was suggested to rename it to a generic name instead 
of using rc6. The sysfs was renamed to gt-c6.

PMU also would require a similar change as it exposes per-gt.

Thanks,
Riana
>>
>> v2: Checkpatch fix, move timer code to next patch
>> v3: Fix kunit issue
>> v4: Fix for locking issue, fix review comments (Riana)
>> v5: Add xe_pmu_disable() function to reset enable_count
>>
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt.c        |   2 +
>>   drivers/gpu/drm/xe/xe_gt_idle.c   |  17 ++-
>>   drivers/gpu/drm/xe/xe_gt_idle.h   |   1 +
>>   drivers/gpu/drm/xe/xe_pmu.c       | 220 +++++++++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_pmu.h       |   2 +
>>   drivers/gpu/drm/xe/xe_pmu_types.h |  63 +++++++++
>>   6 files changed, 299 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index d6744be01a68..fd18bbce99da 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -877,6 +877,8 @@ int xe_gt_suspend(struct xe_gt *gt)
>>   
>>   	xe_gt_idle_disable_pg(gt);
>>   
>> +	xe_pmu_suspend(gt);
>> +
>>   	xe_gt_disable_host_l2_vram(gt);
>>   
>>   	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
>> index fd80afeef56a..47b5696c7137 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>> @@ -275,18 +275,25 @@ static ssize_t idle_status_show(struct device *dev,
>>   }
>>   static DEVICE_ATTR_RO(idle_status);
>>   
>> +u64 xe_gt_idle_residency(struct xe_gt_idle *gtidle)
>> +{
>> +	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
>> +
>> +	return get_residency_ms(gtidle, gtidle->idle_residency(pc));
>> +}
>> +
>>   static ssize_t idle_residency_ms_show(struct device *dev,
>>   				      struct device_attribute *attr, char *buff)
>>   {
>>   	struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
>> -	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
>> +	struct xe_gt *gt = gtidle_to_gt(gtidle);
>>   	u64 residency;
>>   
>> -	xe_pm_runtime_get(pc_to_xe(pc));
>> -	residency = gtidle->idle_residency(pc);
>> -	xe_pm_runtime_put(pc_to_xe(pc));
>> +	xe_pm_runtime_get(gt_to_xe(gt));
>> +	residency = xe_gt_idle_residency(gtidle);
>> +	xe_pm_runtime_put(gt_to_xe(gt));
>>   
>> -	return sysfs_emit(buff, "%llu\n", get_residency_ms(gtidle, residency));
>> +	return sysfs_emit(buff, "%llu\n", residency);
>>   }
>>   static DEVICE_ATTR_RO(idle_residency_ms);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
>> index 4455a6501cb0..795a02c9d89c 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_idle.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
>> @@ -17,5 +17,6 @@ void xe_gt_idle_disable_c6(struct xe_gt *gt);
>>   void xe_gt_idle_enable_pg(struct xe_gt *gt);
>>   void xe_gt_idle_disable_pg(struct xe_gt *gt);
>>   int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p);
>> +u64 xe_gt_idle_residency(struct xe_gt_idle *gtidle);
>>   
>>   #endif /* _XE_GT_IDLE_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> index 7ce66c022e27..80d78628006e 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu.c
>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>> @@ -11,8 +11,11 @@
>>   #include "xe_device.h"
>>   #include "xe_force_wake.h"
>>   #include "xe_gt_clock.h"
>> +#include "xe_gt_idle.h"
>> +#include "xe_guc_pc.h"
>>   #include "xe_mmio.h"
>>   #include "xe_macros.h"
>> +#include "xe_module.h"
>>   #include "xe_pm.h"
>>   
>>   /**
>> @@ -22,6 +25,8 @@
>>   static cpumask_t xe_pmu_cpumask;
>>   static unsigned int xe_pmu_target_cpu = -1;
>>   
>> +#define FREQUENCY 200
>> +
>>   /**
>>    * DOC: Xe PMU (Performance Monitoring Unit)
>>    *
>> @@ -31,7 +36,9 @@ static unsigned int xe_pmu_target_cpu = -1;
>>    * Example commands to list/record supported perf events-
>>    *
>>    * $ ls -ld /sys/bus/event_source/devices/xe_*
>> - * $ ls /sys/bus/event_source/devices/xe_0000_00_02.0/events/
>> + * $ lrwxrwxrwx 1 root root 0 Oct 25 00:19  /sys/bus/event_source/devices/xe_0000_03_00.0 ->
>> + *                                                           ../../../devices/xe_0000_03_00.0
>> + * $ ls /sys/bus/event_source/devices/xe_0000_03_00.0/events/
>>    *
>>    * You can also use the perf tool to grep for a certain event-
>>    * $ perf list | grep rc6
>> @@ -39,8 +46,30 @@ static unsigned int xe_pmu_target_cpu = -1;
>>    * To list a specific event at regular intervals-
>>    * $ perf stat -e <event_name> -I <interval>
>>    *
>> + * For RC6, following command will give GT residency per second-
>> + * $ perf stat -e xe_0000_03_00.0/rc6-residency-gt0/ -I 1000
>> + * #           time             counts unit events
>> + *      1.001153792               1002 ms   xe_0000_03_00.0/rc6-residency-gt0/
>> + *      2.008338100               1007 ms   xe_0000_03_00.0/rc6-residency-gt0/
>> + *      3.009887054               1002 ms   xe_0000_03_00.0/rc6-residency-gt0/
>> + *      4.011383318               1001 ms   xe_0000_03_00.0/rc6-residency-gt0/
>> + *
>> + * To verify this matches with sysfs values of rc6, you can run following command-
>> + * $ for i in {1..10} ; do cat /sys/class/drm/card0/device/tile0/gt0/gtidle/idle_residency_ms;
>> + *   sleep 1; done
>> + *      2348877
>> + *      2349901
>> + *      2350917
>> + *      2352945
>> + *
>> + * Each value is roughly a 1000ms increment here as well. This is expected GT residency when idle.
>>    */
>>   
>> +static struct xe_pmu *event_to_pmu(struct perf_event *event)
>> +{
>> +	return container_of(event->pmu, struct xe_pmu, base);
>> +}
>> +
>>   static unsigned int config_gt_id(const u64 config)
>>   {
>>   	return config >> __XE_PMU_GT_SHIFT;
>> @@ -51,6 +80,35 @@ static u64 config_counter(const u64 config)
>>   	return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
>>   }
>>   
>> +static unsigned int other_bit(const u64 config)
>> +{
>> +	unsigned int val;
>> +
>> +	switch (config_counter(config)) {
>> +	case XE_PMU_RC6_RESIDENCY:
>> +		val = __XE_PMU_RC6_RESIDENCY_ENABLED;
>> +		break;
>> +	default:
>> +		/*
>> +		 * Events that do not require sampling, or tracking state
>> +		 * transitions between enabled and disabled can be ignored.
>> +		 */
>> +		return -1;
>> +	}
>> +
>> +	return config_gt_id(config) * __XE_PMU_TRACKED_EVENT_COUNT + val;
>> +}
>> +
>> +static unsigned int config_bit(const u64 config)
>> +{
>> +	return other_bit(config);
>> +}
>> +
>> +static unsigned int event_bit(struct perf_event *event)
>> +{
>> +	return config_bit(event->attr.config);
>> +}
>> +
>>   static void xe_pmu_event_destroy(struct perf_event *event)
>>   {
>>   	struct xe_device *xe =
>> @@ -70,6 +128,10 @@ config_status(struct xe_device *xe, u64 config)
>>   		return -ENOENT;
>>   
>>   	switch (config_counter(config)) {
>> +	case XE_PMU_RC6_RESIDENCY:
>> +		if (xe->info.skip_guc_pc)
>> +			return -ENODEV;
>> +		break;
>>   	default:
>>   		return -ENOENT;
>>   	}
>> @@ -116,6 +178,63 @@ static int xe_pmu_event_init(struct perf_event *event)
>>   	return 0;
>>   }
>>   
>> +static inline s64 ktime_since_raw(const ktime_t kt)
>> +{
>> +	return ktime_to_ms(ktime_sub(ktime_get_raw(), kt));
>> +}
>> +
>> +static u64 read_sample(struct xe_pmu *pmu, unsigned int gt_id, int sample)
>> +{
>> +	return pmu->event_sample[gt_id][sample].cur;
>> +}
>> +
>> +static void
>> +store_sample(struct xe_pmu *pmu, unsigned int gt_id, int sample, u64 val)
>> +{
>> +	pmu->event_sample[gt_id][sample].cur = val;
>> +}
>> +
>> +static u64 get_rc6(struct xe_gt *gt)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	const unsigned int gt_id = gt->info.id;
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +	bool device_awake;
>> +	unsigned long flags;
>> +	u64 val;
>> +
>> +	device_awake = xe_pm_runtime_get_if_active(xe);
>> +	if (device_awake) {
>> +		val = xe_gt_idle_residency(&gt->gtidle);
>> +		xe_pm_runtime_put(xe);
>> +	}
>> +
>> +	spin_lock_irqsave(&pmu->lock, flags);
>> +
>> +	if (device_awake) {
>> +		store_sample(pmu, gt_id, __XE_SAMPLE_RC6, val);
>> +	} else {
>> +		/*
>> +		 * We think we are runtime suspended.
>> +		 *
>> +		 * Report the delta from when the device was suspended to now,
>> +		 * on top of the last known real value, as the approximated RC6
>> +		 * counter value.
>> +		 */
>> +		val = ktime_since_raw(pmu->sleep_last[gt_id]);
>> +		val += read_sample(pmu, gt_id, __XE_SAMPLE_RC6);
>> +	}
>> +
>> +	if (val < read_sample(pmu, gt_id, __XE_SAMPLE_RC6_LAST_REPORTED))
>> +		val = read_sample(pmu, gt_id, __XE_SAMPLE_RC6_LAST_REPORTED);
>> +	else
>> +		store_sample(pmu, gt_id, __XE_SAMPLE_RC6_LAST_REPORTED, val);
>> +
>> +	spin_unlock_irqrestore(&pmu->lock, flags);
>> +
>> +	return val;
>> +}
>> +
>>   static u64 __xe_pmu_event_read(struct perf_event *event)
>>   {
>>   	struct xe_device *xe =
>> @@ -126,6 +245,9 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
>>   	u64 val = 0;
>>   
>>   	switch (config_counter(config)) {
>> +	case XE_PMU_RC6_RESIDENCY:
>> +		val = get_rc6(gt);
>> +		break;
>>   	default:
>>   		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>>   	}
>> @@ -157,6 +279,28 @@ static void xe_pmu_event_read(struct perf_event *event)
>>   
>>   static void xe_pmu_enable(struct perf_event *event)
>>   {
>> +	struct xe_pmu *pmu = event_to_pmu(event);
>> +	const unsigned int bit = event_bit(event);
>> +	unsigned long flags;
>> +
>> +	if (bit == -1)
>> +		goto update;
>> +
>> +	spin_lock_irqsave(&pmu->lock, flags);
>> +
>> +	/*
>> +	 * Update the bitmask of enabled events and increment
>> +	 * the event reference counter.
>> +	 */
>> +	BUILD_BUG_ON(ARRAY_SIZE(pmu->enable_count) != XE_PMU_MASK_BITS);
>> +	XE_WARN_ON(bit >= ARRAY_SIZE(pmu->enable_count));
>> +	XE_WARN_ON(pmu->enable_count[bit] == ~0);
>> +
>> +	pmu->enable |= BIT(bit);
>> +	pmu->enable_count[bit]++;
>> +
>> +	spin_unlock_irqrestore(&pmu->lock, flags);
>> +update:
>>   	/*
>>   	 * Store the current counter value so we can report the correct delta
>>   	 * for all listeners. Even when the event was already enabled and has
>> @@ -165,6 +309,31 @@ static void xe_pmu_enable(struct perf_event *event)
>>   	local64_set(&event->hw.prev_count, __xe_pmu_event_read(event));
>>   }
>>   
>> +static void xe_pmu_disable(struct perf_event *event)
>> +{
>> +	struct xe_device *xe =
>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +	const unsigned int bit = event_bit(event);
>> +	unsigned long flags;
>> +
>> +	if (bit == -1)
>> +		return;
>> +
>> +	spin_lock_irqsave(&pmu->lock, flags);
>> +
>> +	XE_WARN_ON(bit >= ARRAY_SIZE(pmu->enable_count));
>> +	XE_WARN_ON(pmu->enable_count[bit] == 0);
>> +	/*
>> +	 * Decrement the reference count and clear the enabled
>> +	 * bitmask when the last listener on an event goes away.
>> +	 */
>> +	if (--pmu->enable_count[bit] == 0)
>> +		pmu->enable &= ~BIT(bit);
>> +
>> +	spin_unlock_irqrestore(&pmu->lock, flags);
>> +}
>> +
>>   static void xe_pmu_event_start(struct perf_event *event, int flags)
>>   {
>>   	struct xe_device *xe =
>> @@ -190,6 +359,8 @@ static void xe_pmu_event_stop(struct perf_event *event, int flags)
>>   	if (flags & PERF_EF_UPDATE)
>>   		xe_pmu_event_read(event);
>>   
>> +	xe_pmu_disable(event);
>> +
>>   out:
>>   	event->hw.state = PERF_HES_STOPPED;
>>   }
>> @@ -291,6 +462,7 @@ create_event_attributes(struct xe_pmu *pmu)
>>   		const char *name;
>>   		const char *unit;
>>   	} events[] = {
>> +		__event(0, "rc6-residency", "ms"),
>>   	};
>>   
>>   	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
>> @@ -477,6 +649,32 @@ static void xe_pmu_unregister_cpuhp_state(struct xe_pmu *pmu)
>>   	cpuhp_state_remove_instance(cpuhp_state, &pmu->cpuhp.node);
>>   }
>>   
>> +static void store_rc6_residency(struct xe_gt *gt)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +
>> +	store_sample(pmu, gt->info.id, __XE_SAMPLE_RC6,
>> +		     xe_gt_idle_residency(&gt->gtidle));
>> +	pmu->sleep_last[gt->info.id] = ktime_get_raw();
>> +}
>> +
>> +/**
>> + * xe_pmu_suspend() - Save residency count before suspend
>> + */
>> +void xe_pmu_suspend(struct xe_gt *gt)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +
>> +	if (!pmu->base.event_init)
>> +		return;
>> +
>> +	spin_lock_irq(&pmu->lock);
>> +	store_rc6_residency(gt);
>> +	spin_unlock_irq(&pmu->lock);
>> +}
>> +
>>   /**
>>    * xe_pmu_unregister() - Remove/cleanup PMU registration
>>    */
>> @@ -497,6 +695,24 @@ void xe_pmu_unregister(void *arg)
>>   	free_event_attributes(pmu);
>>   }
>>   
>> +static void init_rc6(struct xe_pmu *pmu)
>> +{
>> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +	struct xe_gt *gt;
>> +	unsigned int j;
>> +
>> +	for_each_gt(gt, xe, j) {
>> +		xe_pm_runtime_get(xe);
>> +		u64 val = xe_gt_idle_residency(&gt->gtidle);
>> +
>> +		store_sample(pmu, j, __XE_SAMPLE_RC6, val);
>> +		store_sample(pmu, j, __XE_SAMPLE_RC6_LAST_REPORTED,
>> +			     val);
>> +		pmu->sleep_last[j] = ktime_get_raw();
>> +		xe_pm_runtime_put(xe);
>> +	}
>> +}
>> +
>>   /**
>>    * xe_pmu_register() - Define basic PMU properties for Xe and add event callbacks.
>>    *
>> @@ -531,6 +747,8 @@ void xe_pmu_register(struct xe_pmu *pmu)
>>   	if (!pmu->events_attr_group.attrs)
>>   		goto err_name;
>>   
>> +	init_rc6(pmu);
>> +
>>   	pmu->base.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
>>   					GFP_KERNEL);
>>   	if (!pmu->base.attr_groups)
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
>> index d07e5dfdfec0..17f5a8d7d45c 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu.h
>> +++ b/drivers/gpu/drm/xe/xe_pmu.h
>> @@ -15,11 +15,13 @@ int xe_pmu_init(void);
>>   void xe_pmu_exit(void);
>>   void xe_pmu_register(struct xe_pmu *pmu);
>>   void xe_pmu_unregister(void *arg);
>> +void xe_pmu_suspend(struct xe_gt *gt);
>>   #else
>>   static inline int xe_pmu_init(void) { return 0; }
>>   static inline void xe_pmu_exit(void) {}
>>   static inline void xe_pmu_register(struct xe_pmu *pmu) {}
>>   static inline void xe_pmu_unregister(void *arg) {}
>> +static inline void xe_pmu_suspend(struct xe_gt *gt) {}
>>   #endif
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
>> index 4da96b8fadd1..59d7718c59ce 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu_types.h
>> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>> @@ -10,6 +10,8 @@
>>   #include <linux/spinlock_types.h>
>>   
>>   enum {
>> +	__XE_SAMPLE_RC6,
>> +	__XE_SAMPLE_RC6_LAST_REPORTED,
>>   	__XE_NUM_PMU_SAMPLERS
>>   };
>>   
>> @@ -23,6 +25,32 @@ enum {
>>   #define ___XE_PMU_OTHER(gt, x) \
>>   	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
>>   
>> +#define __XE_PMU_OTHER(x) ___XE_PMU_OTHER(0, x)
>> +
>> +#define XE_PMU_RC6_RESIDENCY                    __XE_PMU_OTHER(0)
>> +#define __XE_PMU_RC6_RESIDENCY(gt)              ___XE_PMU_OTHER(gt, 0)
>> +
>> +/**
>> + * Non-engine events that we need to track enabled-disabled transition and
>> + * current state.
>> + */
>> +enum xe_pmu_tracked_events {
>> +	__XE_PMU_RC6_RESIDENCY_ENABLED,
>> +	__XE_PMU_TRACKED_EVENT_COUNT, /* count marker */
>> +};
>> +
>> +/**
>> + * How many different events we track in the global PMU mask.
>> + *
>> + * It is also used to know to needed number of event reference counters.
>> + */
>> +#define XE_PMU_MASK_BITS \
>> +	(XE_PMU_MAX_GT * __XE_PMU_TRACKED_EVENT_COUNT)
>> +
>> +struct xe_pmu_sample {
>> +	u64 cur;
>> +};
>> +
>>   struct xe_pmu {
>>   	/**
>>   	 * @cpuhp: Struct used for CPU hotplug handling.
>> @@ -65,6 +93,41 @@ struct xe_pmu {
>>   	 * @pmu_attr: Memory block holding device attributes.
>>   	 */
>>   	void *pmu_attr;
>> +
>> +	/**
>> +	 * @enable: Bitmask of specific enabled events.
>> +	 *
>> +	 * For some events we need to track their state and do some internal
>> +	 * house keeping.
>> +	 *
>> +	 * Each engine event sampler type and event listed in enum
>> +	 * i915_pmu_tracked_events gets a bit in this field.
>> +	 *
>> +	 * Low bits are engine samplers and other events continue from there.
>> +	 */
>> +	u32 enable;
>> +
>> +	/**
>> +	 * @enable_count: Reference counter for enabled events.
>> +	 *
>> +	 * Array indices are mapped in the same way as bits in the @enable field
>> +	 * and they are used to control sampling on/off when multiple clients
>> +	 * are using the PMU API.
>> +	 */
>> +	unsigned int enable_count[XE_PMU_MASK_BITS];
>> +	/**
>> +	 * @sample: Current and previous (raw) counters for sampling events.
>> +	 *
>> +	 * These counters are updated from the i915 PMU sampling timer.
>> +	 *
>> +	 * Only global counters are held here, while the per-engine ones are in
>> +	 * struct intel_engine_cs.
>> +	 */
>> +	struct xe_pmu_sample event_sample[XE_PMU_MAX_GT][__XE_NUM_PMU_SAMPLERS];
>> +	/**
>> +	 * @sleep_last: Last time GT parked for RC6 estimation.
>> +	 */
>> +	ktime_t sleep_last[XE_PMU_MAX_GT];
>>   };
>>   
>>   #endif
>> -- 
>> 2.38.1
>>

