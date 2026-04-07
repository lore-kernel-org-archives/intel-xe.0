Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB6CBFB5173
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 00:20:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9683610E2F9;
	Tue,  7 Apr 2026 00:20:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bi64aIBh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E7F10E2F9
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 00:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775521257; x=1807057257;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=CmP6y+IjjlEO1BeM7NS473nMWsY4rE/ftV/D2MDLPDY=;
 b=bi64aIBhgq4OfjAc0oyv3kiVPeOqbB7StnwoIAd/Q42EF15fVvTklyUk
 aUX/7nO93LBTRsiJq/rPiCMAGGIgj8J/8cKP/1FJwggBEpOeYQAt9TpZN
 ijw5zw3ADMeS6BjYV1SfFsRwbco6XilFazmoibegtXX6p6wov5mzQuxT1
 zd5T7FsQRJP57UCxhoZZlY6xssmVdAfGC0qAyaU8ONE6l+uUPXdUFMA7E
 bLBiHxcTxsg5nQaSUch8LiomTq9IO3GqfK8fR4AZ3K2GCBryVbn8qzZms
 jX/35j+GGc/1BC5zpcRG5ne+cIAnYRrmVgQE0MQ+qCglnnyAtl5yUHCRt g==;
X-CSE-ConnectionGUID: 553uHK72RuiOwAqVs/Jb9g==
X-CSE-MsgGUID: no/BHXrJTtGRE7hMHYfxDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="80334076"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="80334076"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 17:20:57 -0700
X-CSE-ConnectionGUID: nYMQtFUMTYSWjgYeG2AD4A==
X-CSE-MsgGUID: W/VecRhIRZ+7wllO5IchHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="228276048"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 17:20:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 17:20:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 17:20:56 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.0) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 17:20:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BC+QWfceVkN8XqZCTP5cMHPou5ZgbALfMjvi3lAfrYa36Mun8wugqIDd3IuuRw6KmFOITIsmuI5dFR2ZzAVCwos0bNdwPcTm/BrzglwNL0/ZzQ2WQ5T4jH1hMOD+t4+1J+rs7FOeaGAtlFNe57MMRlw4jzivsnwvhxL8HHBRewYmyKviu4hTeHTcc3UpZU08R5H2hDPlWBNm8Vw+vUYdZ0AeUOp2XdFdfQRYo3xAitVill+sGlfk3xIhgiEgn0PeGU6PWudakC2vLk2bNHh4EBtQsyERTYNcm7r1xAaRduJ6Eo25jvO730xgZ9IrwTfx3ean/TlEPYqYa6jpBqE9gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2HS4huLQdN9svgnggT00qfg2L22Vjt/zzFpu8KYYuNo=;
 b=gc4ZKYzZE7VgC+bsecaKCnZoBwmdqKoGX1sgf3IiJIElVxpUW0dZlplk8ERP+p4SKLxa3FpLjq40YGSkUmYcYYzsS581o+uSMw8gWyLt2RA36J6s/NVeqoCgFj3xhXHOQeZWnRPv7zQvi0dz1jSwSxoaWlUMBqR0LR2+AszQEQSO9cIDcPtQB4Ftz8KMLV34S/M0EQ475Qg0atNqB4p6VnnA5ZTO+dEiI3oS07jwVSjDKM07OKsjE3VWH3/RIT7vnS9YIZJZbDiI3EZpFIgBP8eHnHVw2uvvQirzjx+ZJlXTwZXEMh27qtlfI6qdj6JMmXwKnUM6jSozLpsZO6jtnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by PH0PR11MB9752.namprd11.prod.outlook.com (2603:10b6:510:397::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Tue, 7 Apr
 2026 00:20:50 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%4]) with mapi id 15.20.9769.020; Tue, 7 Apr 2026
 00:20:49 +0000
Message-ID: <6ce85148-a7c6-491c-a60f-5c5be85e53b3@intel.com>
Date: Mon, 6 Apr 2026 17:20:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] drm/xe/uapi: Update xe_drm.h documentation
To: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260331172049.3053871-7-shuicheng.lin@intel.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <20260331172049.3053871-7-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0054.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::29) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|PH0PR11MB9752:EE_
X-MS-Office365-Filtering-Correlation-Id: 14e24235-63b8-4afa-d045-08de943b8577
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|42112799006|1800799024|376014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: btFfgpx8Ozrg2gtFxNzD11qCHKtCEU4FpeF6F4bpS9YC25Dy9iT4JfSHBl3MrLyHnSWvNCFDvyuAUYxGGMEf2Z5ZMQs5/ugah7DYXavyfvMSt6R/hsEsKbUbFVNeOhMBETSwGT34dnYOgqoF7Nq5VJ3cs4BxQ+3qguJ3HjqcTDb0GaQZXcw6vJ5KX3CeNGznuEPkzZk1Fi6n9tdGu59NhhHLodheaG6QIVk3l8CsGlV23d/ueGz/Igxs+gdqkTbcCOKQYVeRZfhC00I9XX5/TdzzpmdGju+VeGtTU7+L+yh2Id0guRSYZVnhCUw0AgnWIia2Bvuu/imTubG1koFj1fF04TC7vMF6SjeMPiE81OJmkn8mJiB5vf+xbH8l48+C27ZNxCNsiylvhFEfeor75CKH8k6MsV4U1vIZD6Yc9DBiqNJerIjBeDgB3TbcnkzgErNOxLq4VtocoycLY3F7qnyzViYNi+iiefsuTPuQDS4SvkJzDrejIRjVt938ItUBvjJ5Yg3q1X2Bd6HhSyt5YMS+wGk4CKxGE2si55PVupBtmVwuWVvY6gmYag8ayrcSGe3RcxZv7FpfP9NUnk8WjBVHv0EthTSoBRcIW7lGUja4B2s7kV6MRt/wDFUtlp9I0PVm1p3VPoFQD5cbUeqRkuofBD+5XoKo+GbninKFODXo66tkfp7tKTpkZoxbs0cp9eRpCOK1XQvi303fLV8Qd47I4rMODkkyuEuQ5WQ9m18=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V05WT2lBRmttVk5rSm53OHB3VlZmOUhvT2R6c0dGdDZGQTc0YUJWWDRzM0R4?=
 =?utf-8?B?U3paVzBqRS9Ya1VUTDFINUdRNlJHb3B3dnQ3TGo3N1gzdGU5dnk5b1AyZ0x1?=
 =?utf-8?B?cjB3UEpzVWxvK2dtTkhaZXpEODNoQXh2ODFCY1NVVjRUQWtTWFhrUnY2RExH?=
 =?utf-8?B?czUwNkpxYnBwY25zQ25BNTZPa2RFVzV5b0dZOXNDejBXV0ZEWnRhaXRpcHNk?=
 =?utf-8?B?YWtlZGtnTVBQRyszd2kvdFZScDI0NDVsdFU5RVd1eThXQWtZeU01YzFib1Zi?=
 =?utf-8?B?VHBrbWNTVHpXOWp1bHRkU055S3dwTGtpam5XQWQ0V1ZPNzhiZDFhUGdKdjNI?=
 =?utf-8?B?MGlNVlVBSUhiSzNVS2p1SGVBMnhwcDRYTm9EYSt0M0ZuWENvZ29qTHMweTVr?=
 =?utf-8?B?UGFnMGpIMXdIdWJKY1IrTERwVkdNNHNDZGcwd2xUcXZQTGo2NXk4em03c2Zt?=
 =?utf-8?B?S0ppeUdtZWhwU0h5ZHZ2VytrbEhORDhWQ3dNM2VDV0puSkFuS0tKK0JBSXlq?=
 =?utf-8?B?ckVGVkQwcGVKa29kblY3ZXN0M1IzcVE2VHJJc0RzemphU3hZKzk0WjZnVEtz?=
 =?utf-8?B?OUxiU0JpK0V4ZXN3TVlKc3JVSytxUlJ0eDJ1eXpjMlhYRGFCVG4yRDdLWXBQ?=
 =?utf-8?B?WmtQQWZyYkN0Q3NQRENNd1lHd2piU2hpZXdianQrUzNEVXBXazJrMXZhMDZQ?=
 =?utf-8?B?bWVVUjFwTEQwcDNJdkpsdTRwSTlaNGlJVEdLVGxFNWUvc2NMc2Zyb1BvY1BF?=
 =?utf-8?B?dEZMbWNPYWlGZkYzK0RlWVhRWkc4RXBtMy92S3BCVm4wZXVac2tTSTJuYkdD?=
 =?utf-8?B?TVZsb2U5UW1CSWpNYTNtQnRsYXd6WmV5bW9pRU0zWGkzOFJpeW01SkZBZ1dk?=
 =?utf-8?B?c1NsVmxoNSt3cFVmR0FCOFdCWTQ1US9tVTZJK3JHaHlLdlNmZjZWRHFsNGR0?=
 =?utf-8?B?VU9MOVc2ZW5WVThtNWIrVDdYU245c0EvUWp1NHVzRWRHZnY3c05rZlNUdlVY?=
 =?utf-8?B?SldXUmJFUmhGZmNEVVhPWGJMOUYxNWV2WUFrUkxIcnBOVzZ2Y1BUWE1GL240?=
 =?utf-8?B?QlExbVdBL1lLMzEvbWNUSW5mSHlyUW9ZRlA0U2xkRFdqWnZZR1MybmxPeGR0?=
 =?utf-8?B?Zi9KUlhUS2VlOGRnS0htb1VyNVBkRnF5OW05SzFLcVpFaXpQTzl2TEJ3YmJ5?=
 =?utf-8?B?ZlhqbS9JcDVOU1NZVmxNKzZWWW1PR3A4ZVNjT3NMMHp1anp5Zzg2eklZaVNt?=
 =?utf-8?B?dVFoMEx0RElReHdNMFpMdm4xY0hWd3pYbmFXelhwNk0yNUZZOW1CWHllbDMv?=
 =?utf-8?B?RmJWb2E1NHZhNURVVkU3cmtZRzJ0bFF6S1p2Mk94dmMrL2FlN3hLMHNiSWhp?=
 =?utf-8?B?aVJScno4blduTGV5MnRYRVJkcmJITVkrS3RYMFFodE1WMC9YRnM0cCt1RzV6?=
 =?utf-8?B?a09TZkh6My9PODhCNFNmSHJNdHRBS3EwL29rTTA2Z24ydWV6SnFLelZ0ZlV3?=
 =?utf-8?B?UzNIT3llNE55MDcxcXlQam5FVk1QZFloaWc4d1dOeUtIOG1kN0N0czFZZTdz?=
 =?utf-8?B?SFZNaUE0WUZRRSs2YTVYV1IzckJsclI3Z1RQSG02SituNkdKd0hrQ2JnaU1G?=
 =?utf-8?B?NFhXWkhNb2g5aitsV1Fpd1Z1NjZNKzR0K0JhbExwVXV3NDZaM2ZYcnFtZ0VJ?=
 =?utf-8?B?cm1PWFZTd0Q1UHFya1BlZ2E3RWYyMHJuc01aSlppU25JOEorZ1ZQMHlKN1Ey?=
 =?utf-8?B?dzd4Z2cwNDJ4cVJZTHFYYmNnQXF3dm1qcGQ5UDdZa3phQVJMQ2kydDlDblpI?=
 =?utf-8?B?U0VvZi9FZW0vaHdqM0ROdzU3T1dwUUxibTR3K2hoc1ZaS082eGJRVjY3K1Ay?=
 =?utf-8?B?WTZCREI3R1dhL3pMODVWL3VlbnFibGtKcjIzalpUQTM3SG5VWW5YUmxVSW1n?=
 =?utf-8?B?bmptZjNDVDN3Sk5acDVXMHFIV0hGNVpRbHRxTkN5bm5iTjdRajNTY0ZHeVF3?=
 =?utf-8?B?MVhpRXpKMHRjZU1KK0hHTDFHME1iTzhuQW9oRHdVaVloRkMrZXhOZlk4VHVp?=
 =?utf-8?B?VnBRajNGUnZOOU1aUkQ4dlJEY3JpN3ZlY00rLzhPaHdsemx0Qzl5bE5hUDVE?=
 =?utf-8?B?cWZ3eGJhTk56Qk5HZ1Vna0taT0poQkJ5RC91RURCUFFYVGFuV0RFSkVHWmFQ?=
 =?utf-8?B?bU9QTDNaaFc4cWNKdjBmQngrUWRmY09oSG1sM0Qwc21CSExObGNoZTMxTXR0?=
 =?utf-8?B?aEQ3SXZFQmx0cUE0NVNXRmhkM3pXdEVlL1JtRGU2WXlkajBGNURLNVdKbjI1?=
 =?utf-8?B?cHhUNW9ZWUFnWFhud0M5amYzbTFTWlRuYkZxcEtXbGlIdzN3WVFHdz09?=
X-Exchange-RoutingPolicyChecked: hyMYssKfTOXDeoJB7xJQ71gQJUbEvKJ2Ar1LiLUbejbjbVj0BhukVQEY1m/+bKPQUXYIyEcG1G7teEX4WI9L1v7LwkuThH5/ZcsMVqFaScZcyoNj28Oc4oO+ZZcVVrt8868i+3q3ul0ohIaBQEjri1vYuFzHz903EiqdD1u52FKw+sL/tQdoLIkU95YGiS8MIHnB1ZVVldxTrybNUXddG+XGrdxoiS/yQF75mkhc9IH0FQtjr1XDU20JvnpmcpXV4rA2Fk9oSIDFBXDayJmDpRZ3d4E2looJ7HJC0lszXmtqFRGrOgyMSbdrGtWjEh7T6vOBuZ1W5KgIw9SsviyPtw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 14e24235-63b8-4afa-d045-08de943b8577
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 00:20:49.8714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eGDVBB2yYvGVOKcZZphH+caLEIXri7iNsWnX8dlNy0hEQfTkDe33CbFSSgaTzXwf7JpX0ALn8uqm6MLuLVJflw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB9752
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


On 3/31/2026 10:20, Shuicheng Lin wrote:
> This series fixes various documentation issues in the Xe DRM
> UAPI header (xe_drm.h). All changes are doc-comment-only with
> no functional impact.
>
> The fixes are split into 5 patches by category:
>
> Patch 1: Typos and spelling errors (7 fixes)
>    Basic misspellings like creaed, mmaping, 0xdeadbeaf, and
>    incorrect names like MONOTONIC_CLOCK (should be
>    CLOCK_MONOTONIC).
>
> Patch 2: Grammar errors (11 fixes)
>    Missing words, wrong articles, subject-verb agreement,
>    e.g. "should only ever used", "must qword aligned",
>    "the users responsibility".
>
> Patch 3: Wrong names and references (12 fixes)
>    Incorrect field names, struct names, ioctl names, and
>    kernel-doc cross-reference prefixes. For example,
>    referencing non-existent probed_size instead of
>    @cpu_visible_size, wrong ioctl name
>    DRM_IOCTL_XE_VM_QUERY_MEM_RANGES_ATTRS, and using &
>    instead of % for constant references.
>
> Patch 4: Code examples (4 fixes)
>    Outdated field names in struct initializer examples
>    (.num_bb_per_exec -> .width, .num_eng_per_bb ->
>    .num_placements), wrong nested field access
>    (.atomic_val -> .atomic.val), and unnecessary backslash
>    escaping in UUID format string.
>
> Patch 5: Formatting and completeness (4 fixes)
>    Missing entries in the IOCTL overview list and device
>    query doc list, a formatting issue with a closing */,
>    and ioctl's -> ioctls.
>
> Shuicheng Lin (5):
>    drm/xe/uapi: Fix typos and spelling errors in xe_drm.h documentation
>    drm/xe/uapi: Fix grammar errors in xe_drm.h documentation
>    drm/xe/uapi: Fix wrong names and references in xe_drm.h
>    drm/xe/uapi: Fix code examples in xe_drm.h documentation
>    drm/xe/uapi: Fix doc formatting and completeness in xe_drm.h
>
>   include/uapi/drm/xe_drm.h | 86 ++++++++++++++++++++-------------------
>   1 file changed, 44 insertions(+), 42 deletions(-)

I think we need another patch to fix the  @  -> %  @ -> & usage like

- * @DRM_XE_OBSERVATION_IOCTL_CONFIG observation stream fd ioctl, though 
only a
+ * &DRM_XE_OBSERVATION_IOCTL_CONFIG observation stream fd ioctl, though 
only a


- * is equal to @DRM_XE_DEVICE_QUERY_EU_STALL, then the reply uses
+ * is equal to %DRM_XE_DEVICE_QUERY_EU_STALL, then the reply uses
