Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD8E10ED65C
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 11:18:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BE4F10ED8D;
	Fri, 27 Mar 2026 11:18:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FqEXFuUh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8285710ED87
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Mar 2026 11:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774610292; x=1806146292;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=UhPkZTRbeej4FaO6BmETwCkmbAaSOshQmkVKfd9Msww=;
 b=FqEXFuUhrA4fNIv54SvU3T1GaEWnEr0nSyMhfDEBAHB9/9A/rJ0oc7S5
 n7aVi4iglWD4I37JCKWnzxonO0iGkJbYx82SFbGUdieQ4DIr/sjDXSpon
 iHsiqSs5BnY+MCmm2+PGoANR0bTgS8t9BQPOYp3jsdtt2MEsPTelYHSFN
 eZeCkmVJZXmitiqwTAmz3MNmavhw0x81Iw8IFvno/fVZrlobx8Bs6IVmG
 Fxo+WCRCfImzpumltmWp+8SE3UjipdQUEP3rNYOZmYVt2C3ZNvsO5kcuC
 ilIQCMvbWwZiWn/CPdwcQANuejD1itDRnx8DDrp7Jq0SG988XXftMok73 w==;
X-CSE-ConnectionGUID: N10LMKibTHK90u4U9aNciw==
X-CSE-MsgGUID: GGQS1IuRTOuu3BvyPFtE7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="93063721"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208,217";a="93063721"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 04:18:11 -0700
X-CSE-ConnectionGUID: lBh+TAALSfGe/bx5Mz2EHw==
X-CSE-MsgGUID: 2TLLC1clQcu18vgFB4RtTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
 d="scan'208,217";a="230211406"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 04:18:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 04:18:10 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Mar 2026 04:18:10 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.51) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 04:18:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g9RGVwbo0W5hqToy3ca4/rDg/K4gZHRmrswpuxZFmwBMtlVDxpKWf+WpfVaRvmTyUl7Wvm8Pb6XKz+7ozWvHnhrHiqhGgMqbFaCJiNtMJtCV9gZVZQGQAkmR//8sxqfiiDSAlAVTyIjoFlpVk45wdVmw41NzdiVs6nf3LuPBj/a31PPtNi5vN2d+9S4Y8V8XWgrUuVdXEg4jzlVpDP2aENezm8Q2vd7Bao//1oO7DsWdAQ+b6LtUe3DyDDpMK+sLYRCBCmZoXJpJADRNr4umrXTf0LsGplBj6F8GmeJzZ6mQ71hQxZCu36K9KfKKywmTMkGTaBJ0MEc/kpC7rwZ7JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SRjBuNhwXfU4VN+BagbwQzPgxSgNktdSUPfttEu++qY=;
 b=gGvWZO3J+WnFaKyhKGBvURXh/X8LD5eAYvnSpPcXgrK5MQubatNE2X/vT0dlmL6uCOlHUk24LW1tuN9iF3FrpAulwAenFhuoAfS18xE0bLOszkoyfzlg4X0LTsW7aex9sEJr+DaZQZEX5LD9tNcwkDv59KSXnF3TCD1W/j0UZsjWC8wjm0mFXutuuAcDfZY2Jh8vUPRzKQYF5M0sa+lKxA7JhCcRpbY1FtBgM/rrKxSi0NyNYNppkTjJRuDK2T7BC5c72e6ZvKZAIqjlHt7+jF5B/DolvZhZHH5TlGLAjWh0+64bPqFFtsx6V6tIsW3qrdzEXiFbgemdNL+fM8Q3wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by MW6PR11MB8311.namprd11.prod.outlook.com (2603:10b6:303:241::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.8; Fri, 27 Mar
 2026 11:18:03 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::ccc3:3fd6:58f5:927]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::ccc3:3fd6:58f5:927%3]) with mapi id 15.20.9769.006; Fri, 27 Mar 2026
 11:18:03 +0000
Content-Type: multipart/alternative;
 boundary="------------rrqJ6w3P780gJ4rUVkj4q9aX"
Message-ID: <2caa6dc8-26ec-436d-9326-04444eb01133@intel.com>
Date: Fri, 27 Mar 2026 16:47:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/vf: Use drm mm instead of drm sa for CCS
 read/write
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst <dev@lankhorst.se>
References: <20260320121231.638189-1-satyanarayana.k.v.p@intel.com>
 <20260320121231.638189-4-satyanarayana.k.v.p@intel.com>
 <cf383a64-ae77-4129-a22a-88353946103b@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <cf383a64-ae77-4129-a22a-88353946103b@intel.com>
X-ClientProxiedBy: MA5PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::7) To DS0PR11MB8686.namprd11.prod.outlook.com
 (2603:10b6:8:1a9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|MW6PR11MB8311:EE_
X-MS-Office365-Filtering-Correlation-Id: 077724da-42e0-4775-c818-08de8bf28258
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|8096899003|13003099007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: T6ggicJRdXGBbqQ1JA9T5+olL90mwqC0PRT4n6fQGeOFBsnqvwLZEQgVSweyNiy0rq2oZuGEc7znQYKzwV/UWed87WSO6kYGOSXEE8w//ZmJoASKLBetvxbFx26ZM7nkb6igUJylvlSPuIhphOJPQeBqYeHi0s/My/mJrj1EPBJqYmawtpizFo86EMhXL0QSxgSz23iu3sjzpo/KzKefGp08PqsQ+YaOQR//VQ94rsR415GktvdA0BLC6L4sKpfQwSuyVfnBTrSrymang0Fapq1yV1xyop9c5+ik2p7OFasVTYDTjj9VMqjZWRD4Qjsk+aN8BhDCPtYPgOYBpraVgXwA9z/Eu4DeefLdfgn90e5Rj2pNuvtZzTPhkhifNKNPBgYlJO/ikQrdmT2JXiwmY/huoVNQnLgk/iBd6wb3qOzGXZBJi6Idpt4Xu+rUgLXEjrHX9jp9nw0N3n0EWeKdv99bFZ0ZwQYIyQMCOdyZfREn3bjANmFK9GZW5deKtdhA0vaTYXDcqg2wt3S+pHNcuAPoopLQpNGBypBX2dC1iSi9O6WXrSs1qQtqYSnLdYSG3xdHfgOxTP4v04E1MxW1MXY1BbtFtdn4mcXsURvaV/+EI7eE2B3ArV3X2kgEvCkHW/CvwYJ6RL9PlAkhapYg8XA4Mj24TYt1FWXlV7wRXQqqwznnL7QOMdn0bQXYVjfe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003)(13003099007)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUY4ZmRYZnozcWdXbTIzZlVkdXh4T05uSVFXWVdDaDR2bXNlSGlIZ1pmSE4w?=
 =?utf-8?B?dlduWDdDbjMzWFd5STJZQk5DOEJYaHN4WVZ0ZkR1bkN3c1E1SENCcG40Tlpj?=
 =?utf-8?B?aUVpYzNFckpoYjVjWkp0SnB0cGdlSlV4eHFjZ2c3Y2FlcktmNjIvTEI4b2ZX?=
 =?utf-8?B?VGpiZzFpUFJWTjFHc0ZVMDJVL0E1M3VsRXBFWEcvTGhwWUI2QmU3d3FpelNR?=
 =?utf-8?B?TGdrNDJRNUxTS1k5TWRiVWhuS0krbGgyNStZV1ZKNjZJZGN3OERDTVhWK3lo?=
 =?utf-8?B?Z2Q3WitGd0NKWlFXRmVxbWEzSlhob3kzWjRVdVUrSFpzZU9nd1ZFYlh2K2dL?=
 =?utf-8?B?YWRaOXpobCtYanRMWVhoanQ2a2NWUUFIVmkyRWNuYVNJNlNxYmNZcTNlSzhO?=
 =?utf-8?B?U0dxMG8rMmZwcEtaLzlXb3BVbmxqc0hkWmN2ak1CQ2xXUEFFYXNLV2o2Z2lN?=
 =?utf-8?B?bkpjMXcyaTdnbjVDSmhOQVhFa2J6cXo0SjZ3OVZzdWRiMFBJUDNMeE5PU2ZL?=
 =?utf-8?B?c3dZY1JZTkVwQVJCN1R5YlBhak9PREdOaVR6enJFSTRrcnpVQ01YelV6MzlY?=
 =?utf-8?B?aFdoeTI0Wk5JSEo5VjZaRit4RDAxa014eTNvUkJ1ZHZXemRoeDhqY0RxMXJn?=
 =?utf-8?B?MENJVWEveCtMa2M1Yyt2STZiU21Qb1hrRlpnMXFsckFwSDN4bHVJcFJ2d1BY?=
 =?utf-8?B?bGVFOXlIQnp4NkxaWURQK1UzTGtCL3NDLzNjbENvd0xhYTVvT0cvUm1lVU5Y?=
 =?utf-8?B?WXUvUTZlQVZPUWZ2R2VOOUhsU2d6SXNETCsvbTNlaUdBemwwNFhCR2FFUlUz?=
 =?utf-8?B?NzVRclFGalNXUmtGc0dYeVRzcnZ3bW1USU5BZWdnQzhVYVZGNG9BdHhmSTZ6?=
 =?utf-8?B?SlZaNzlNd2Z1OEpaMDdHZng3WHZYVTRCSUZFa3hoZTdvS1VPT2tTeHJFWWNQ?=
 =?utf-8?B?ajY0bDZRanR5WGVnUjdndlRjMlYzMDgrS2dZdHBXVWhYZ3BxajVDMWhJYWNs?=
 =?utf-8?B?RlpQS0wyMVJaLzI1d1ltWW1iaTJ6cVRkTVZzSWI4Zkpod2xTblNQWW9qUVdq?=
 =?utf-8?B?WU9FOVZpUUVZYXFocm8yN0tObm52Z1BadUR4RklrYk1aQlBQak5DS0U4cVkv?=
 =?utf-8?B?d2llek5jd3ZSVmtkeUc3R1c3NmJ0Umc3VGJ5cFVHdUkwSCtFdHNwNmlUOXR3?=
 =?utf-8?B?MHpjak9WQWI0MndvRzd3a0N3dENETUxVMi9qRUR6cEJpVTFkZ0NiQ2FQdng5?=
 =?utf-8?B?dE56a2xDRER2aXl1NEh5K2RmRmNZUDlIQjc1QWd2TFZieFBudDVkOXJOcHdu?=
 =?utf-8?B?cDdTWGVqU09FSEtkcHlwVE1NRUZ5TU1hWkhxeU5FQU1YU3VidjROeFNZckVq?=
 =?utf-8?B?YlZlMTJHTzQzaFM3SHQzTmdXMWVxdjZCNlB3VVk5ckNhOVVwSXFRY2RSaElD?=
 =?utf-8?B?TUtnSGprL2FEUmQyRkNVelZyOGJ2ZHEzeDVsa2hKYTE1VFpuR2RKVVNacHpH?=
 =?utf-8?B?MFVHKzl1eHljSVVlREU3dC84bE4xWE9QUkJ0aDJ0THFWQVlGQWtyRGdiZS9v?=
 =?utf-8?B?ZEI5eFJldkducm9Ib292UktGaUhqcXRRWTduM0JVbGwxRms2MVRoNnhveXJw?=
 =?utf-8?B?dHlXMUg3b2JTajE3b0tzSFhSMDJIN0pZQ1JtSWxYQ21WVmwzVmZscnRmYWVG?=
 =?utf-8?B?Z0tSUnVhOC91MDdMME00bUlMQStyOUIvdmNqWnVpK2pybEtWNXBHL0p2RkM2?=
 =?utf-8?B?THZkLzUwTUJNOC9SQzFxSW9BZ3JLazN6V21KZzZaYW84U1R3VEM1ejBZTzFa?=
 =?utf-8?B?TDZBcXBJRDF0T3EwdFNWWEJKakZmdDc3bUx5TkoraHdtSmtWQVJJT29yaHI2?=
 =?utf-8?B?Z2duTUVHZUtkWGEzK3I1L3RINVJSdjBsWFVyRXZMTC9UbWZyWVNQQ1JtakM3?=
 =?utf-8?B?eUlFU29neHJ1UXV0bmhqZ0pZZ0RIcE4vWGN5RWJHVDRZQ3pxZkYvUjlXNzNp?=
 =?utf-8?B?VVN3aHo4Tko5QnJxVTBVZktXUWZIamwzaHJXcFlkRzUvRlBmRFh0emRzUnJ1?=
 =?utf-8?B?dHM4RzcxNGxvOWNqbEM5VW1LUFl6TEJ0QXRGR0J6dkdBbGdSK2hLelpkSDFs?=
 =?utf-8?B?NVNzT3NMZ3AzMExvMDZIVkQ1N0dacDZiZGJ0bjIrc2MyQmxObGpVakEzRmJI?=
 =?utf-8?B?UHFhb1ZXNEg3M1VuenJkQklSR21BU1RMaFZGNnBKR09MMCt3dTNEaEw3Q2dv?=
 =?utf-8?B?d1V6emJKN2xjd0c4OUV0NStnSEVvZy9DUU5LY3pUTDVIeFA2TkdtMXBSclp1?=
 =?utf-8?B?VE9pM2pLbnljVFVlZXhrem9QK1N0dk5Hejk3eGwzUUlkRUg2MnB0Wi9KNWhU?=
 =?utf-8?Q?Y3nJwlCW2SkSZDns=3D?=
X-Exchange-RoutingPolicyChecked: KmzJOznR+l43r0fx9L1e1F5ndeKbERmNmlPghF5z0dfcQ2KW2bUH7cVLx5U2sd86IlJO6GqHbHrTR5HscTwRMfsXsJTR9B129u90/wZs4hk/sTMM3WHH+69LLzZC8GtdYi0lHLqN3wLF2Q0rPZ/AMYfxhPjGahegjjoRK/XHylZPrAKyu+onbOKTRjh/i2zQMD7m+C0ZiG7WZRQA7E4kuDgd2u4OOgPMwQJRrgnmoBBfBIwB4i53bB0kRMkPHuLjpRoSPUiuFIz3GyomsVCwtUh4l+TtJ0qsrUFTt9yMIPYVR5At+kcmSPiEi2WcCb6ZotITM26YOV4QbKIwllxTOg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 077724da-42e0-4775-c818-08de8bf28258
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8686.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 11:18:03.0918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3VKSsmucAcfh5sLl3DSpFofyQNL+vOP2NQ8Y/wp8wlvYg2pH8uo3jTPFRnq9VuxV9p4mlI03v+c2JCY9r5wMYgAQKVdC88k24hNcoNxoGRA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8311
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

--------------rrqJ6w3P780gJ4rUVkj4q9aX
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 27-Mar-26 4:37 PM, Michal Wajdeczko wrote:
>
> On 3/20/2026 1:12 PM, Satyanarayana K V P wrote:
>> The suballocator algorithm tracks a hole cursor at the last allocation
>> and tries to allocate after it. This is optimized for fence-ordered
>> progress, where older allocations are expected to become reusable first.
>>
>> In fence-enabled mode, that ordering assumption holds. In fence-disabled
>> mode, allocations may be freed in arbitrary order, so limiting allocation
>> to the current hole window can miss valid free space and fail allocations
>> despite sufficient total space.
>>
>> Use DRM memory manager instead of sub-allocator to get rid of this issue
>> as CCS read/write operations do not use fences.
>>
>> Fixes: 864690cf4dd62 ("drm/xe/vf: Attach and detach CCS copy commands with BO")
>> Signed-off-by: Satyanarayana K V P<satyanarayana.k.v.p@intel.com>
>> Cc: Matthew Brost<matthew.brost@intel.com>
>> Cc: Thomas Hellström<thomas.hellstrom@linux.intel.com>
>> Cc: Maarten Lankhorst<dev@lankhorst.se>
>> Cc: Michal Wajdeczko<michal.wajdeczko@intel.com>
>>
>> ---
>> Used drm mm instead of drm sa based on comments from
>> https://lore.kernel.org/all/bbf0d48d-a95a-46e1-ac8f-e8a0daa81365@amd.com/
>> ---
>>   drivers/gpu/drm/xe/xe_bo_types.h           |  3 +-
>>   drivers/gpu/drm/xe/xe_migrate.c            | 56 ++++++++++++----------
>>   drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 39 ++++++++-------
>>   drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  2 +-
>>   4 files changed, 53 insertions(+), 47 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
>> index d4fe3c8dca5b..4c4f15c5648e 100644
>> --- a/drivers/gpu/drm/xe/xe_bo_types.h
>> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
>> @@ -18,6 +18,7 @@
>>   #include "xe_ggtt_types.h" struct xe_device; +struct xe_drm_mm_bb; struct xe_vm; #define 
>> XE_BO_MAX_PLACEMENTS 3 @@ -88,7 +89,7 @@ struct xe_bo { bool 
>> ccs_cleared; /** @bb_ccs: BB instructions of CCS read/write. Valid 
>> only for VF */ - struct xe_bb *bb_ccs[XE_SRIOV_VF_CCS_CTX_COUNT]; + 
>> struct xe_drm_mm_bb *bb_ccs[XE_SRIOV_VF_CCS_CTX_COUNT]; /** * 
>> @cpu_caching: CPU caching mode. Currently only used for userspace 
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c 
>> b/drivers/gpu/drm/xe/xe_migrate.c index fc918b4fba54..2fefd306cb2e 
>> 100644 --- a/drivers/gpu/drm/xe/xe_migrate.c +++ 
>> b/drivers/gpu/drm/xe/xe_migrate.c @@ -22,6 +22,7 @@ #include "xe_assert.h"
>>   #include "xe_bb.h"
>>   #include "xe_bo.h"
>> +#include "xe_drm_mm.h"
>>   #include "xe_exec_queue.h"
>>   #include "xe_ggtt.h"
>>   #include "xe_gt.h"
>> @@ -1166,11 +1167,12 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>>   	u32 batch_size, batch_size_allocated;
>>   	struct xe_device *xe = gt_to_xe(gt);
>>   	struct xe_res_cursor src_it, ccs_it;
>> +	struct xe_drm_mm_manager *bb_pool;
>>   	struct xe_sriov_vf_ccs_ctx *ctx;
>> -	struct xe_sa_manager *bb_pool;
>> +	struct xe_drm_mm_bb *bb = NULL;
>>   	u64 size = xe_bo_size(src_bo);
>> -	struct xe_bb *bb = NULL;
>>   	u64 src_L0, src_L0_ofs;
>> +	struct xe_bb xe_bb_tmp;
>>   	u32 src_L0_pt;
>>   	int err;
>>   
>> @@ -1208,18 +1210,18 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>>   		size -= src_L0;
>>   	}
>>   
>> -	bb = xe_bb_alloc(gt);
>> +	bb = xe_drm_mm_bb_alloc();
>>   	if (IS_ERR(bb))
>>   		return PTR_ERR(bb);
>>   
>>   	bb_pool = ctx->mem.ccs_bb_pool;
>> -	scoped_guard(mutex, xe_sa_bo_swap_guard(bb_pool)) {
>> -		xe_sa_bo_swap_shadow(bb_pool);
>> +	scoped_guard(mutex, xe_drm_mm_bo_swap_guard(bb_pool)) {
>> +		xe_drm_mm_bo_swap_shadow(bb_pool);
>>   
>> -		err = xe_bb_init(bb, bb_pool, batch_size);
>> +		err = xe_drm_mm_bb_insert(bb, bb_pool, batch_size);
>>   		if (err) {
>>   			xe_gt_err(gt, "BB allocation failed.\n");
>> -			xe_bb_free(bb, NULL);
>> +			kfree(bb);
>>   			return err;
>>   		}
>>   
>> @@ -1227,6 +1229,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>>   		size = xe_bo_size(src_bo);
>>   		batch_size = 0;
>>   
>> +		xe_bb_tmp = (struct xe_bb){ .cs = bb->cs, .len = 0 };
>>   		/*
>>   		 * Emit PTE and copy commands here.
>>   		 * The CCS copy command can only support limited size. If the size to be
>> @@ -1255,24 +1258,27 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>>   			xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
>>   			batch_size += EMIT_COPY_CCS_DW;
>>   
>> -			emit_pte(m, bb, src_L0_pt, false, true, &src_it, src_L0, src);
>> +			emit_pte(m, &xe_bb_tmp, src_L0_pt, false, true, &src_it, src_L0, src);
>>   
>> -			emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
>> +			emit_pte(m, &xe_bb_tmp, ccs_pt, false, false, &ccs_it, ccs_size, src);
>>   
>> -			bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
>> -			flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
>> +			xe_bb_tmp.len = emit_flush_invalidate(xe_bb_tmp.cs, xe_bb_tmp.len,
>> +							      flush_flags);
>> +			flush_flags = xe_migrate_ccs_copy(m, &xe_bb_tmp, src_L0_ofs, src_is_pltt,
>>   							  src_L0_ofs, dst_is_pltt,
>>   							  src_L0, ccs_ofs, true);
>> -			bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
>> +			xe_bb_tmp.len = emit_flush_invalidate(xe_bb_tmp.cs, xe_bb_tmp.len,
>> +							      flush_flags);
>>   
>>   			size -= src_L0;
>>   		}
>>   
>> -		xe_assert(xe, (batch_size_allocated == bb->len));
>> +		xe_assert(xe, (batch_size_allocated == xe_bb_tmp.len));
>> +		bb->len = xe_bb_tmp.len;
>>   		src_bo->bb_ccs[read_write] = bb;
>>   
>>   		xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
>> -		xe_sa_bo_sync_shadow(bb->bo);
>> +		xe_drm_mm_sync_shadow(bb_pool, &bb->node);
>>   	}
>>   
>>   	return 0;
>> @@ -1297,10 +1303,10 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>>   void xe_migrate_ccs_rw_copy_clear(struct xe_bo *src_bo,
>>   				  enum xe_sriov_vf_ccs_rw_ctxs read_write)
>>   {
>> -	struct xe_bb *bb = src_bo->bb_ccs[read_write];
>> +	struct xe_drm_mm_bb *bb = src_bo->bb_ccs[read_write];
>>   	struct xe_device *xe = xe_bo_device(src_bo);
>> +	struct xe_drm_mm_manager *bb_pool;
>>   	struct xe_sriov_vf_ccs_ctx *ctx;
>> -	struct xe_sa_manager *bb_pool;
>>   	u32 *cs;
>>   
>>   	xe_assert(xe, IS_SRIOV_VF(xe));
>> @@ -1308,17 +1314,17 @@ void xe_migrate_ccs_rw_copy_clear(struct xe_bo *src_bo,
>>   	ctx = &xe->sriov.vf.ccs.contexts[read_write];
>>   	bb_pool = ctx->mem.ccs_bb_pool;
>>   
>> -	guard(mutex) (xe_sa_bo_swap_guard(bb_pool));
>> -	xe_sa_bo_swap_shadow(bb_pool);
>> -
>> -	cs = xe_sa_bo_cpu_addr(bb->bo);
>> -	memset(cs, MI_NOOP, bb->len * sizeof(u32));
>> -	xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
>> +	scoped_guard(mutex, xe_drm_mm_bo_swap_guard(bb_pool)) {
>> +		xe_drm_mm_bo_swap_shadow(bb_pool);
>>   
>> -	xe_sa_bo_sync_shadow(bb->bo);
>> +		cs = bb_pool->cpu_addr + bb->node.start;
>> +		memset(cs, MI_NOOP, bb->len * sizeof(u32));
>> +		xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
>>   
>> -	xe_bb_free(bb, NULL);
>> -	src_bo->bb_ccs[read_write] = NULL;
>> +		xe_drm_mm_sync_shadow(bb_pool, &bb->node);
>> +		xe_drm_mm_bb_free(bb);
>> +		src_bo->bb_ccs[read_write] = NULL;
>> +	}
>>   }
>>   
>>   /**
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>> index db023fb66a27..6fb4641c6f0f 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>> @@ -8,6 +8,7 @@
>>   #include "xe_bb.h"
>>   #include "xe_bo.h"
>>   #include "xe_device.h"
>> +#include "xe_drm_mm.h"
>>   #include "xe_exec_queue.h"
>>   #include "xe_exec_queue_types.h"
>>   #include "xe_gt_sriov_vf.h"
>> @@ -16,7 +17,6 @@
>>   #include "xe_lrc.h"
>>   #include "xe_migrate.h"
>>   #include "xe_pm.h"
>> -#include "xe_sa.h"
>>   #include "xe_sriov_printk.h"
>>   #include "xe_sriov_vf.h"
>>   #include "xe_sriov_vf_ccs.h"
>> @@ -141,8 +141,8 @@ static u64 get_ccs_bb_pool_size(struct xe_device *xe)
>>   
>>   static int alloc_bb_pool(struct xe_tile *tile, struct xe_sriov_vf_ccs_ctx *ctx)
>>   {
>> +	struct xe_drm_mm_manager *drm_mm_manager;
>>   	struct xe_device *xe = tile_to_xe(tile);
>> -	struct xe_sa_manager *sa_manager;
>>   	u64 bb_pool_size;
>>   	int offset, err;
>>   
>> @@ -150,34 +150,33 @@ static int alloc_bb_pool(struct xe_tile *tile, struct xe_sriov_vf_ccs_ctx *ctx)
>>   	xe_sriov_info(xe, "Allocating %s CCS BB pool size = %lldMB\n",
>>   		      ctx->ctx_id ? "Restore" : "Save", bb_pool_size / SZ_1M);
>>   
>> -	sa_manager = __xe_sa_bo_manager_init(tile, bb_pool_size, SZ_4K, SZ_16,
>> -					     XE_SA_BO_MANAGER_FLAG_SHADOW);
>> -
>> -	if (IS_ERR(sa_manager)) {
>> -		xe_sriov_err(xe, "Suballocator init failed with error: %pe\n",
>> -			     sa_manager);
>> -		err = PTR_ERR(sa_manager);
>> +	drm_mm_manager = xe_drm_mm_manager_init(tile, bb_pool_size, SZ_4K,
>> +						XE_DRM_MM_BO_MANAGER_FLAG_SHADOW);
>> +	if (IS_ERR(drm_mm_manager)) {
>> +		xe_sriov_err(xe, "XE_DRM_MM init failed with error: %pe\n",
>> +			     drm_mm_manager);
>> +		err = PTR_ERR(drm_mm_manager);
>>   		return err;
>>   	}
>>   
>>   	offset = 0;
>> -	xe_map_memset(xe, &sa_manager->bo->vmap, offset, MI_NOOP,
>> +	xe_map_memset(xe, &drm_mm_manager->bo->vmap, offset, MI_NOOP,
>>   		      bb_pool_size);
>> -	xe_map_memset(xe, &sa_manager->shadow->vmap, offset, MI_NOOP,
>> +	xe_map_memset(xe, &drm_mm_manager->shadow->vmap, offset, MI_NOOP,
>>   		      bb_pool_size);
>>   
>>   	offset = bb_pool_size - sizeof(u32);
>> -	xe_map_wr(xe, &sa_manager->bo->vmap, offset, u32, MI_BATCH_BUFFER_END);
>> -	xe_map_wr(xe, &sa_manager->shadow->vmap, offset, u32, MI_BATCH_BUFFER_END);
>> +	xe_map_wr(xe, &drm_mm_manager->bo->vmap, offset, u32, MI_BATCH_BUFFER_END);
>> +	xe_map_wr(xe, &drm_mm_manager->shadow->vmap, offset, u32, MI_BATCH_BUFFER_END);
> this seems to break the new XE MM component isolation, as you are directly
> touching the XE MM internals without XE MM being aware of this...
>
> are we sure that XE MM will not overwrite this last dword from the pool BO?
> maybe it should be exposed to the XE MM user as this 'trail guard' location?

For CCS save/restore, we submit this complete MM to Guc and whenever VM is paused, Guc submits this MM to HW.
While allocating BBs, we always allocate size + 1 so that even if the allocation happens at the end of the MM,
the MI_BATCH_BUFFER_END instruction is not overwritten.

>>   
>> -	ctx->mem.ccs_bb_pool = sa_manager;
>> +	ctx->mem.ccs_bb_pool = drm_mm_manager;
>>   
>>   	return 0;
>>   }
>>   
>>   static void ccs_rw_update_ring(struct xe_sriov_vf_ccs_ctx *ctx)
>>   {
>> -	u64 addr = xe_sa_manager_gpu_addr(ctx->mem.ccs_bb_pool);
>> +	u64 addr = xe_drm_mm_manager_gpu_addr(ctx->mem.ccs_bb_pool);
>>   	struct xe_lrc *lrc = xe_exec_queue_lrc(ctx->mig_q);
>>   	u32 dw[10], i = 0;
>>   
>> @@ -388,7 +387,7 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>>   #define XE_SRIOV_VF_CCS_RW_BB_ADDR_OFFSET	(2 * sizeof(u32))
>>   void xe_sriov_vf_ccs_rw_update_bb_addr(struct xe_sriov_vf_ccs_ctx *ctx)
>>   {
>> -	u64 addr = xe_sa_manager_gpu_addr(ctx->mem.ccs_bb_pool);
>> +	u64 addr = xe_drm_mm_manager_gpu_addr(ctx->mem.ccs_bb_pool);
>>   	struct xe_lrc *lrc = xe_exec_queue_lrc(ctx->mig_q);
>>   	struct xe_device *xe = gt_to_xe(ctx->mig_q->gt);
>>   
>> @@ -412,8 +411,8 @@ int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
>>   	struct xe_device *xe = xe_bo_device(bo);
>>   	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
>>   	struct xe_sriov_vf_ccs_ctx *ctx;
>> +	struct xe_drm_mm_bb *bb;
>>   	struct xe_tile *tile;
>> -	struct xe_bb *bb;
>>   	int err = 0;
>>   
>>   	xe_assert(xe, IS_VF_CCS_READY(xe));
>> @@ -445,7 +444,7 @@ int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
>>   {
>>   	struct xe_device *xe = xe_bo_device(bo);
>>   	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
>> -	struct xe_bb *bb;
>> +	struct xe_drm_mm_bb *bb;
>>   
>>   	xe_assert(xe, IS_VF_CCS_READY(xe));
>>   
>> @@ -471,8 +470,8 @@ int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
>>    */
>>   void xe_sriov_vf_ccs_print(struct xe_device *xe, struct drm_printer *p)
>>   {
>> -	struct xe_sa_manager *bb_pool;
>>   	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
>> +	struct xe_drm_mm_manager *bb_pool;
>>   
>>   	if (!IS_VF_CCS_READY(xe))
>>   		return;
>> @@ -485,7 +484,7 @@ void xe_sriov_vf_ccs_print(struct xe_device *xe, struct drm_printer *p)
>>   
>>   		drm_printf(p, "ccs %s bb suballoc info\n", ctx_id ? "write" : "read");
>>   		drm_printf(p, "-------------------------\n");
>> -		drm_suballoc_dump_debug_info(&bb_pool->base, p, xe_sa_manager_gpu_addr(bb_pool));
>> +		drm_mm_print(&bb_pool->base, p);
>>   		drm_puts(p, "\n");
>>   	}
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
>> index 22c499943d2a..f2af074578c9 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
>> @@ -33,7 +33,7 @@ struct xe_sriov_vf_ccs_ctx {
>>   	/** @mem: memory data */
>>   	struct {
>>   		/** @mem.ccs_bb_pool: Pool from which batch buffers are allocated. */
>> -		struct xe_sa_manager *ccs_bb_pool;
>> +		struct xe_drm_mm_manager *ccs_bb_pool;
>>   	} mem;
>>   };
>>   
--------------rrqJ6w3P780gJ4rUVkj4q9aX
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 27-Mar-26 4:37 PM, Michal Wajdeczko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:cf383a64-ae77-4129-a22a-88353946103b@intel.com">
      <pre wrap="" class="moz-quote-pre">

On 3/20/2026 1:12 PM, Satyanarayana K V P wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">The suballocator algorithm tracks a hole cursor at the last allocation
and tries to allocate after it. This is optimized for fence-ordered
progress, where older allocations are expected to become reusable first.

In fence-enabled mode, that ordering assumption holds. In fence-disabled
mode, allocations may be freed in arbitrary order, so limiting allocation
to the current hole window can miss valid free space and fail allocations
despite sufficient total space.

Use DRM memory manager instead of sub-allocator to get rid of this issue
as CCS read/write operations do not use fences.

Fixes: 864690cf4dd62 (&quot;drm/xe/vf: Attach and detach CCS copy commands with BO&quot;)
Signed-off-by: Satyanarayana K V P <a class="moz-txt-link-rfc2396E" href="mailto:satyanarayana.k.v.p@intel.com">&lt;satyanarayana.k.v.p@intel.com&gt;</a>
Cc: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Cc: Thomas Hellström <a class="moz-txt-link-rfc2396E" href="mailto:thomas.hellstrom@linux.intel.com">&lt;thomas.hellstrom@linux.intel.com&gt;</a>
Cc: Maarten Lankhorst <a class="moz-txt-link-rfc2396E" href="mailto:dev@lankhorst.se">&lt;dev@lankhorst.se&gt;</a>
Cc: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>

---
Used drm mm instead of drm sa based on comments from
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/all/bbf0d48d-a95a-46e1-ac8f-e8a0daa81365@amd.com/">https://lore.kernel.org/all/bbf0d48d-a95a-46e1-ac8f-e8a0daa81365@amd.com/</a>
---
 drivers/gpu/drm/xe/xe_bo_types.h           |  3 +-
 drivers/gpu/drm/xe/xe_migrate.c            | 56 ++++++++++++----------
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 39 ++++++++-------
 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  2 +-
 4 files changed, 53 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index d4fe3c8dca5b..4c4f15c5648e 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -18,6 +18,7 @@
 #include &quot;xe_ggtt_types.h<a class="moz-txt-link-rfc2396E" href="mailto:structxe_device;+structxe_drm_mm_bb;structxe_vm;#defineXE_BO_MAX_PLACEMENTS3@@-88,7+89,7@@structxe_bo{boolccs_cleared;/**@bb_ccs:BBinstructionsofCCSread/write.ValidonlyforVF*/-structxe_bb*bb_ccs[XE_SRIOV_VF_CCS_CTX_COUNT];+structxe_drm_mm_bb*bb_ccs[XE_SRIOV_VF_CCS_CTX_COUNT];/***@cpu_caching:CPUcachingmode.Currentlyonlyusedforuserspacediff--gita/drivers/gpu/drm/xe/xe_migrate.cb/drivers/gpu/drm/xe/xe_migrate.cindexfc918b4fba54..2fefd306cb2e100644---a/drivers/gpu/drm/xe/xe_migrate.c+++b/drivers/gpu/drm/xe/xe_migrate.c@@-22,6+22,7@@#include">&quot;
 
 struct xe_device;
+struct xe_drm_mm_bb;
 struct xe_vm;
 
 #define XE_BO_MAX_PLACEMENTS	3
@@ -88,7 +89,7 @@ struct xe_bo {
 	bool ccs_cleared;
 
 	/** @bb_ccs: BB instructions of CCS read/write. Valid only for VF */
-	struct xe_bb *bb_ccs[XE_SRIOV_VF_CCS_CTX_COUNT];
+	struct xe_drm_mm_bb *bb_ccs[XE_SRIOV_VF_CCS_CTX_COUNT];
 
 	/**
 	 * @cpu_caching: CPU caching mode. Currently only used for userspace
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index fc918b4fba54..2fefd306cb2e 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -22,6 +22,7 @@
 #include &quot;</a>xe_assert.h&quot;
 #include &quot;xe_bb.h&quot;
 #include &quot;xe_bo.h&quot;
+#include &quot;xe_drm_mm.h&quot;
 #include &quot;xe_exec_queue.h&quot;
 #include &quot;xe_ggtt.h&quot;
 #include &quot;xe_gt.h&quot;
@@ -1166,11 +1167,12 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
 	u32 batch_size, batch_size_allocated;
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_res_cursor src_it, ccs_it;
+	struct xe_drm_mm_manager *bb_pool;
 	struct xe_sriov_vf_ccs_ctx *ctx;
-	struct xe_sa_manager *bb_pool;
+	struct xe_drm_mm_bb *bb = NULL;
 	u64 size = xe_bo_size(src_bo);
-	struct xe_bb *bb = NULL;
 	u64 src_L0, src_L0_ofs;
+	struct xe_bb xe_bb_tmp;
 	u32 src_L0_pt;
 	int err;
 
@@ -1208,18 +1210,18 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
 		size -= src_L0;
 	}
 
-	bb = xe_bb_alloc(gt);
+	bb = xe_drm_mm_bb_alloc();
 	if (IS_ERR(bb))
 		return PTR_ERR(bb);
 
 	bb_pool = ctx-&gt;mem.ccs_bb_pool;
-	scoped_guard(mutex, xe_sa_bo_swap_guard(bb_pool)) {
-		xe_sa_bo_swap_shadow(bb_pool);
+	scoped_guard(mutex, xe_drm_mm_bo_swap_guard(bb_pool)) {
+		xe_drm_mm_bo_swap_shadow(bb_pool);
 
-		err = xe_bb_init(bb, bb_pool, batch_size);
+		err = xe_drm_mm_bb_insert(bb, bb_pool, batch_size);
 		if (err) {
 			xe_gt_err(gt, &quot;BB allocation failed.\n&quot;);
-			xe_bb_free(bb, NULL);
+			kfree(bb);
 			return err;
 		}
 
@@ -1227,6 +1229,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
 		size = xe_bo_size(src_bo);
 		batch_size = 0;
 
+		xe_bb_tmp = (struct xe_bb){ .cs = bb-&gt;cs, .len = 0 };
 		/*
 		 * Emit PTE and copy commands here.
 		 * The CCS copy command can only support limited size. If the size to be
@@ -1255,24 +1258,27 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
 			xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
 			batch_size += EMIT_COPY_CCS_DW;
 
-			emit_pte(m, bb, src_L0_pt, false, true, &amp;src_it, src_L0, src);
+			emit_pte(m, &amp;xe_bb_tmp, src_L0_pt, false, true, &amp;src_it, src_L0, src);
 
-			emit_pte(m, bb, ccs_pt, false, false, &amp;ccs_it, ccs_size, src);
+			emit_pte(m, &amp;xe_bb_tmp, ccs_pt, false, false, &amp;ccs_it, ccs_size, src);
 
-			bb-&gt;len = emit_flush_invalidate(bb-&gt;cs, bb-&gt;len, flush_flags);
-			flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
+			xe_bb_tmp.len = emit_flush_invalidate(xe_bb_tmp.cs, xe_bb_tmp.len,
+							      flush_flags);
+			flush_flags = xe_migrate_ccs_copy(m, &amp;xe_bb_tmp, src_L0_ofs, src_is_pltt,
 							  src_L0_ofs, dst_is_pltt,
 							  src_L0, ccs_ofs, true);
-			bb-&gt;len = emit_flush_invalidate(bb-&gt;cs, bb-&gt;len, flush_flags);
+			xe_bb_tmp.len = emit_flush_invalidate(xe_bb_tmp.cs, xe_bb_tmp.len,
+							      flush_flags);
 
 			size -= src_L0;
 		}
 
-		xe_assert(xe, (batch_size_allocated == bb-&gt;len));
+		xe_assert(xe, (batch_size_allocated == xe_bb_tmp.len));
+		bb-&gt;len = xe_bb_tmp.len;
 		src_bo-&gt;bb_ccs[read_write] = bb;
 
 		xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
-		xe_sa_bo_sync_shadow(bb-&gt;bo);
+		xe_drm_mm_sync_shadow(bb_pool, &amp;bb-&gt;node);
 	}
 
 	return 0;
@@ -1297,10 +1303,10 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
 void xe_migrate_ccs_rw_copy_clear(struct xe_bo *src_bo,
 				  enum xe_sriov_vf_ccs_rw_ctxs read_write)
 {
-	struct xe_bb *bb = src_bo-&gt;bb_ccs[read_write];
+	struct xe_drm_mm_bb *bb = src_bo-&gt;bb_ccs[read_write];
 	struct xe_device *xe = xe_bo_device(src_bo);
+	struct xe_drm_mm_manager *bb_pool;
 	struct xe_sriov_vf_ccs_ctx *ctx;
-	struct xe_sa_manager *bb_pool;
 	u32 *cs;
 
 	xe_assert(xe, IS_SRIOV_VF(xe));
@@ -1308,17 +1314,17 @@ void xe_migrate_ccs_rw_copy_clear(struct xe_bo *src_bo,
 	ctx = &amp;xe-&gt;sriov.vf.ccs.contexts[read_write];
 	bb_pool = ctx-&gt;mem.ccs_bb_pool;
 
-	guard(mutex) (xe_sa_bo_swap_guard(bb_pool));
-	xe_sa_bo_swap_shadow(bb_pool);
-
-	cs = xe_sa_bo_cpu_addr(bb-&gt;bo);
-	memset(cs, MI_NOOP, bb-&gt;len * sizeof(u32));
-	xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
+	scoped_guard(mutex, xe_drm_mm_bo_swap_guard(bb_pool)) {
+		xe_drm_mm_bo_swap_shadow(bb_pool);
 
-	xe_sa_bo_sync_shadow(bb-&gt;bo);
+		cs = bb_pool-&gt;cpu_addr + bb-&gt;node.start;
+		memset(cs, MI_NOOP, bb-&gt;len * sizeof(u32));
+		xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
 
-	xe_bb_free(bb, NULL);
-	src_bo-&gt;bb_ccs[read_write] = NULL;
+		xe_drm_mm_sync_shadow(bb_pool, &amp;bb-&gt;node);
+		xe_drm_mm_bb_free(bb);
+		src_bo-&gt;bb_ccs[read_write] = NULL;
+	}
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
index db023fb66a27..6fb4641c6f0f 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -8,6 +8,7 @@
 #include &quot;xe_bb.h&quot;
 #include &quot;xe_bo.h&quot;
 #include &quot;xe_device.h&quot;
+#include &quot;xe_drm_mm.h&quot;
 #include &quot;xe_exec_queue.h&quot;
 #include &quot;xe_exec_queue_types.h&quot;
 #include &quot;xe_gt_sriov_vf.h&quot;
@@ -16,7 +17,6 @@
 #include &quot;xe_lrc.h&quot;
 #include &quot;xe_migrate.h&quot;
 #include &quot;xe_pm.h&quot;
-#include &quot;xe_sa.h&quot;
 #include &quot;xe_sriov_printk.h&quot;
 #include &quot;xe_sriov_vf.h&quot;
 #include &quot;xe_sriov_vf_ccs.h&quot;
@@ -141,8 +141,8 @@ static u64 get_ccs_bb_pool_size(struct xe_device *xe)
 
 static int alloc_bb_pool(struct xe_tile *tile, struct xe_sriov_vf_ccs_ctx *ctx)
 {
+	struct xe_drm_mm_manager *drm_mm_manager;
 	struct xe_device *xe = tile_to_xe(tile);
-	struct xe_sa_manager *sa_manager;
 	u64 bb_pool_size;
 	int offset, err;
 
@@ -150,34 +150,33 @@ static int alloc_bb_pool(struct xe_tile *tile, struct xe_sriov_vf_ccs_ctx *ctx)
 	xe_sriov_info(xe, &quot;Allocating %s CCS BB pool size = %lldMB\n&quot;,
 		      ctx-&gt;ctx_id ? &quot;Restore&quot; : &quot;Save&quot;, bb_pool_size / SZ_1M);
 
-	sa_manager = __xe_sa_bo_manager_init(tile, bb_pool_size, SZ_4K, SZ_16,
-					     XE_SA_BO_MANAGER_FLAG_SHADOW);
-
-	if (IS_ERR(sa_manager)) {
-		xe_sriov_err(xe, &quot;Suballocator init failed with error: %pe\n&quot;,
-			     sa_manager);
-		err = PTR_ERR(sa_manager);
+	drm_mm_manager = xe_drm_mm_manager_init(tile, bb_pool_size, SZ_4K,
+						XE_DRM_MM_BO_MANAGER_FLAG_SHADOW);
+	if (IS_ERR(drm_mm_manager)) {
+		xe_sriov_err(xe, &quot;XE_DRM_MM init failed with error: %pe\n&quot;,
+			     drm_mm_manager);
+		err = PTR_ERR(drm_mm_manager);
 		return err;
 	}
 
 	offset = 0;
-	xe_map_memset(xe, &amp;sa_manager-&gt;bo-&gt;vmap, offset, MI_NOOP,
+	xe_map_memset(xe, &amp;drm_mm_manager-&gt;bo-&gt;vmap, offset, MI_NOOP,
 		      bb_pool_size);
-	xe_map_memset(xe, &amp;sa_manager-&gt;shadow-&gt;vmap, offset, MI_NOOP,
+	xe_map_memset(xe, &amp;drm_mm_manager-&gt;shadow-&gt;vmap, offset, MI_NOOP,
 		      bb_pool_size);
 
 	offset = bb_pool_size - sizeof(u32);
-	xe_map_wr(xe, &amp;sa_manager-&gt;bo-&gt;vmap, offset, u32, MI_BATCH_BUFFER_END);
-	xe_map_wr(xe, &amp;sa_manager-&gt;shadow-&gt;vmap, offset, u32, MI_BATCH_BUFFER_END);
+	xe_map_wr(xe, &amp;drm_mm_manager-&gt;bo-&gt;vmap, offset, u32, MI_BATCH_BUFFER_END);
+	xe_map_wr(xe, &amp;drm_mm_manager-&gt;shadow-&gt;vmap, offset, u32, MI_BATCH_BUFFER_END);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
this seems to break the new XE MM component isolation, as you are directly
touching the XE MM internals without XE MM being aware of this...

are we sure that XE MM will not overwrite this last dword from the pool BO?
maybe it should be exposed to the XE MM user as this 'trail guard' location?</pre>
    </blockquote>
    <pre>For CCS save/restore, we submit this complete MM to Guc and whenever VM is paused, Guc submits this MM to HW.
While allocating BBs, we always allocate size + 1 so that even if the allocation happens at the end of the MM,
the MI_BATCH_BUFFER_END instruction is not overwritten.</pre>
    <blockquote type="cite" cite="mid:cf383a64-ae77-4129-a22a-88353946103b@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 
-	ctx-&gt;mem.ccs_bb_pool = sa_manager;
+	ctx-&gt;mem.ccs_bb_pool = drm_mm_manager;
 
 	return 0;
 }
 
 static void ccs_rw_update_ring(struct xe_sriov_vf_ccs_ctx *ctx)
 {
-	u64 addr = xe_sa_manager_gpu_addr(ctx-&gt;mem.ccs_bb_pool);
+	u64 addr = xe_drm_mm_manager_gpu_addr(ctx-&gt;mem.ccs_bb_pool);
 	struct xe_lrc *lrc = xe_exec_queue_lrc(ctx-&gt;mig_q);
 	u32 dw[10], i = 0;
 
@@ -388,7 +387,7 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
 #define XE_SRIOV_VF_CCS_RW_BB_ADDR_OFFSET	(2 * sizeof(u32))
 void xe_sriov_vf_ccs_rw_update_bb_addr(struct xe_sriov_vf_ccs_ctx *ctx)
 {
-	u64 addr = xe_sa_manager_gpu_addr(ctx-&gt;mem.ccs_bb_pool);
+	u64 addr = xe_drm_mm_manager_gpu_addr(ctx-&gt;mem.ccs_bb_pool);
 	struct xe_lrc *lrc = xe_exec_queue_lrc(ctx-&gt;mig_q);
 	struct xe_device *xe = gt_to_xe(ctx-&gt;mig_q-&gt;gt);
 
@@ -412,8 +411,8 @@ int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
 	struct xe_device *xe = xe_bo_device(bo);
 	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
 	struct xe_sriov_vf_ccs_ctx *ctx;
+	struct xe_drm_mm_bb *bb;
 	struct xe_tile *tile;
-	struct xe_bb *bb;
 	int err = 0;
 
 	xe_assert(xe, IS_VF_CCS_READY(xe));
@@ -445,7 +444,7 @@ int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
 {
 	struct xe_device *xe = xe_bo_device(bo);
 	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
-	struct xe_bb *bb;
+	struct xe_drm_mm_bb *bb;
 
 	xe_assert(xe, IS_VF_CCS_READY(xe));
 
@@ -471,8 +470,8 @@ int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
  */
 void xe_sriov_vf_ccs_print(struct xe_device *xe, struct drm_printer *p)
 {
-	struct xe_sa_manager *bb_pool;
 	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
+	struct xe_drm_mm_manager *bb_pool;
 
 	if (!IS_VF_CCS_READY(xe))
 		return;
@@ -485,7 +484,7 @@ void xe_sriov_vf_ccs_print(struct xe_device *xe, struct drm_printer *p)
 
 		drm_printf(p, &quot;ccs %s bb suballoc info\n&quot;, ctx_id ? &quot;write&quot; : &quot;read&quot;);
 		drm_printf(p, &quot;-------------------------\n&quot;);
-		drm_suballoc_dump_debug_info(&amp;bb_pool-&gt;base, p, xe_sa_manager_gpu_addr(bb_pool));
+		drm_mm_print(&amp;bb_pool-&gt;base, p);
 		drm_puts(p, &quot;\n&quot;);
 	}
 }
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
index 22c499943d2a..f2af074578c9 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
@@ -33,7 +33,7 @@ struct xe_sriov_vf_ccs_ctx {
 	/** @mem: memory data */
 	struct {
 		/** @mem.ccs_bb_pool: Pool from which batch buffers are allocated. */
-		struct xe_sa_manager *ccs_bb_pool;
+		struct xe_drm_mm_manager *ccs_bb_pool;
 	} mem;
 };
 
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------rrqJ6w3P780gJ4rUVkj4q9aX--
