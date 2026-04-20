Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733FBF588C2
	for <intel-xe@archiver.kernel.org>; Mon, 20 Apr 2026 12:20:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32FF710E206;
	Mon, 20 Apr 2026 12:20:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FbuUaMWG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 661C110E575
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Apr 2026 12:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776687656; x=1808223656;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kjHOcsfyOhsIEUhpkm8dgE9BZBhpxe0IrtHmd4Fe+2o=;
 b=FbuUaMWG48BY6pMNIscicIE27FyJ0BHUSCHT0kDQWnEg9eGqISzNd8rz
 1qkOVvEEdKucz7KmYxNUzwii5KPIFXcqwHO/q+Ozn4p4M4lmYiPfza5I7
 NiZD/sErbmBFup2+lGfoV0JfBU7ivAFy4BnjfUvUE3mu6dNukrD9DnsjZ
 FzwZcJ1UR/3v3mUR3bLsNk2H7hZ9ZDVkliOsGjSkeZfQrL3KKaWUl6IE2
 m4rozwOiHxZ7LodC9LC4NB0bJI37Swc1EQZOG1HQWJ6LUBJMWTQp7U54o
 q3wXl46bYALcawWf2ceiPPLfr5zs9zgcNFRazavXKEhEFMl/W5o0LrVtB w==;
X-CSE-ConnectionGUID: 0o3qVosVRc6QUAyGSeMIQQ==
X-CSE-MsgGUID: Y7EVi2QuRPOFmds3mE10Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77307160"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="77307160"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 05:20:56 -0700
X-CSE-ConnectionGUID: 2psdjMCST1OSVVWQR9KiVA==
X-CSE-MsgGUID: XKfDYj6XSlmCWd98awKLfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="231991497"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 05:20:57 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 05:20:55 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 20 Apr 2026 05:20:55 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.63) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 05:20:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U4ond7rjqpcBOse+G+ieZKzy6AVhxGpwqvvoTJhN8W9O/x2q1Zpi9+AtDzHpKfxduXy3+uEoFXXA1r+Kwboehd9nWgGz66WD8eDnNNvtyy3g3Ex84ljMJONNumKn9ZB8qTEDB85LZGzh8byjHAyi0/knh5mEHOvtgOKaklzJaPEqej0/35K3G+//rN1rvc7VUrn6QqUaTj2Cq9Yywe8Zphf3m3CQo46YR31lyiBpsdMvbG+aRFCHxOYDC++Q45S/UlOR7Wz8AwlJXuX9afuXmgei4vN3OhuO61AGq5RFnidSqa0cvfnPt+eQfQKVyIZhOmp1pBaXF/7yLWR306hWXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5mWL6GIbYZmaEyyoJ8iRGNv4E7Grjf727KcNzand7SY=;
 b=cgX82YcNkmnZbiAyvU+VPfvI28QzQBsqx7qPYXj/VU0QT7DZaoSCMnBwnO15X9Nk56y90+1XqQHCeV4Kki918+cYNmH4F8FBGqokKYtWdtTuEdLjZ9nilM0tFlLFX/URAgDaUPmo4P4L6dyqOIfYUfkXy8UznC3YMPO+iGlG3RHIg8tSUoyzLlBSUJs6I8Pk2zyJcUHGFSphmOPpV4gbpfZlwE4YH9UD+a/jQPMf7+FSSRelRij8a5MjVQ0wZ0dOI2kngz2GfYhaKyqsC5ots9vM+uuVv934q8lZhxdzNyK/9OADU/NPl+WKrIi58qQ3m/7wxgknXeUQKhbgzMZyvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8208.namprd11.prod.outlook.com (2603:10b6:8:165::18)
 by SA1PR11MB6989.namprd11.prod.outlook.com (2603:10b6:806:2be::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Mon, 20 Apr
 2026 12:20:50 +0000
Received: from DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c]) by DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c%6]) with mapi id 15.20.9846.014; Mon, 20 Apr 2026
 12:20:50 +0000
Message-ID: <3ae96e6a-e144-4c17-a23a-d2178be08f18@intel.com>
Date: Mon, 20 Apr 2026 17:50:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Convert stolen memory over to ttm_range_manager
To: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>
References: <20260416151935.388354-2-sanjay.kumar.yadav@intel.com>
 <85f8beb9443fdc6303e60301fa7937c37c1d4b27.camel@intel.com>
Content-Language: en-US
From: "Yadav, Sanjay Kumar" <sanjay.kumar.yadav@intel.com>
In-Reply-To: <85f8beb9443fdc6303e60301fa7937c37c1d4b27.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0070.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::9) To DS0PR11MB8208.namprd11.prod.outlook.com
 (2603:10b6:8:165::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8208:EE_|SA1PR11MB6989:EE_
X-MS-Office365-Filtering-Correlation-Id: 613c8677-0ed3-4da3-9381-08de9ed74259
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: aNoxCNYWwzVJDKJZ4rM2fqr4QcrJTSgZg7GAMUmwwcJNWPiLr15iVdcnCRv+v7i/aT0nCj5fx8YZhxGtlDxtKAHcl/2earlS/3DJWhCVC66hEveVguiLyr4TKqzgMCxmhQMsm28AttHOKIA4cXLxck78lt06/TKCgGXWYcMgED2n2gfHuH5zQ3WXvA9ASpkV/1T/6GdApoGUQNBQpVL+BTtkJXbheWrvDeATQDaJk4KrIFBz/LNVopL2o9z6qAHWFzEJWITmLbn4Hq1MBHGME8q9Xy8juCqjB9ey0543QRDu7AznRWz1vTl9/4YV7TJSyUu8nZiK9HzE9Rrk/Xue6pA7BiWRbc7qP94f3QWBL+F/c+herVpgXtQZ2UzX+RyStZET1inHRXBqurpzmL6XdIjj4oox5I9tMl/ymGU76dkPII4bYWozV1sol/dOu9HXfLT+1UMb5sif7oV9y+dB1u/SG0bZL4vF78rv52YPJymZQBfM9vi/ANWFzqNVjLe1j7S8SMoGr0mUZaC1BqHkYXbQ0J3NOeizHTkVuoQHIXkAMy0wWwI3UWOvYZafQbXWvM2eOZ1QdGHd8dkU1EizbhawtLo4C2+rwt0O9Edli/kKibLFwAEyk92bI/oasHYoOIXlJ7VocAp4N7BwHdMM1y736dnmvoNlaT4epajvOCnFEbhMHaHb7U2OfedNsyom
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8208.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDBuYW5DbmRlbXVPelVJS05YWHU1ZDZrYkNOV0w5NWRCTi9YWjNnMFpZcjVC?=
 =?utf-8?B?MTkwaHEvMldXOHhQL245M0VQQm9aQ2ZsMnBoUzdFbEpHK2xpU2s2eXR0WmpX?=
 =?utf-8?B?SmpTQzhqL2tIMFA4dllYbFVhaVdUM3dYU2ZEVGZRUGNkR0w1WFBiK2JrNGVo?=
 =?utf-8?B?bUN4bHA1c3J5NGV4SEdJVnUzMVBnRzl3VTk1UWtEekdjdU05VmhMTUE1V3di?=
 =?utf-8?B?K0FBMVJCbXJtZ2l2Um1wbWJMUWZJZFFBSmlnWjczbVR5c0xRYmZ2VEFjcTM4?=
 =?utf-8?B?TFNqNDZ1ZG5OT3NEQXIyV0t2NzNKbm1Gd2F6bmY0VHAxVEkxNmxBZmhUNTg2?=
 =?utf-8?B?MjRGYUp1em1KUVZSWTg2KzBwSmsrUFNQNGhldmtlNmVHcVd6eEdPcCt6OTVI?=
 =?utf-8?B?TDJ3Yk5GZEhMa1ozVlB1NXhnUnloQUFjZ2RMWFhQdkx4TGlkRWh6RnMzdUox?=
 =?utf-8?B?MGpENC90bDloR0dnalN5WklGK2VyWTFvem96dkVQeFdiNHNob0pGTUFDWWFw?=
 =?utf-8?B?bVhuU0N3WHNzS0tSeEhuazhMZzkxNjNRME9GRHdYSEZTWnQ1WW41amYvUWd3?=
 =?utf-8?B?cGZlYW5aR2M5K1lOQUIzYnhrNStZTzd0TTdjZUV2V3VzcXhhS1dFWDg1RVZv?=
 =?utf-8?B?VnNnZGFtNHltV0IwRDdEc0xhUUJnTFBGZjRGeTRvemZOL043Q1dBNmluNUt5?=
 =?utf-8?B?LzhuWTMwb2lpZ0htZTQ1STJrZVRVanBPZEFPWVB4YXJsc05LTzltVHNqNU5v?=
 =?utf-8?B?VUhzVVBxNmFJNzY5blNsRzBsdTR0ZEtrNE8zK3JhNTdXSXliM1JxUHVqeVIy?=
 =?utf-8?B?WjFMU21PZXBzeFFqSS9iY2t6TElWc2FCU3BVNlZLb0Z1Q1hNU0kxak9MTnVI?=
 =?utf-8?B?aWpPb1V4UlNuZE9sWjFRWENvUG0rQnNuZThaMFFnWE9FUDhuN2h6Wmo0Q3JV?=
 =?utf-8?B?LzNwTWtGSGhKWEhPeFEzNGFGMUtxNmM0QU91eHAxc1BYMjhzaTRCYm1uUGYy?=
 =?utf-8?B?OTAyV2JJNDY1VVhYdW9xNkJHcWhkVnMzNmVJckpGSGNReHN0ejkvb0NiMkRN?=
 =?utf-8?B?YkZNOWJvaVdRRUVNRnRlYmNSd0orQVQ3S1pCTHMvdWgzOHB6SjJta0prd1Z0?=
 =?utf-8?B?elQ4ZDVGR2l0SXpyNmluQ0lpNHpUMTl3NFJBWTVQcWdZMVhOZCtyZjdaVVpD?=
 =?utf-8?B?TERCKzNSaUMzMHpzT2p4aHMySVVxWW1KVHp2dU0zTGFhZ09OL0crV3FSWks5?=
 =?utf-8?B?M2p6cDB2aW0rVEdLSDlqemNlUE9Ma1ZZZlVnSFduUjk1RGx6NlFRYjduWUhY?=
 =?utf-8?B?VWtZVXpubUo1SEdaQ0dhdjdCa1dmZjUvUnVqRHA0SzIyWEVBL1RKcFZEVnNv?=
 =?utf-8?B?Y1V1VVAvdXFHdnErT1FFcFpiZGFBNy83NFVITVBMeFZqVWJVQjN3Q2VWWUd4?=
 =?utf-8?B?SlRvTGt1TGlJbDJSQ202RjVtaDVGY1grLzg2OGRFK2F5WGlxeThhN0RaT0Zz?=
 =?utf-8?B?VktWbGVOeTErQTkvdXRvRmlGSGdNdnFvTXJkTndWR3VXdlgzaFowSVAwQmxT?=
 =?utf-8?B?MURISk0xM0E3ZjEwc0J6NjJkVk93aGFiM1lxQUFDWWR3dzFrYmRTWnVqQTN6?=
 =?utf-8?B?TWRORmJvSVZkZUhwZlZPWFk5MHo0NzFDaFdBNi9MMGtYc1FkMUN6aWozWkFo?=
 =?utf-8?B?NFF2UEtuYUYvenFMc2VCK2F4aEk5Y3RPc3NtMEg4Ulh2YTRBeDJab3VsU09E?=
 =?utf-8?B?b3RPaitUdmZ0QkR0V1M0SW45V1Uvc3BmcnlKcDEvNmw3NStOQ2FlZ3dNemo3?=
 =?utf-8?B?M3Jtd25YUVFET2g2RWFUYTRFUGZiUlpETTh3U2IzZm9VeUtCQ0tWMUxIKzdK?=
 =?utf-8?B?ZTVNWGJicnNuUFFUWGdZN0JhL3NOaXJJbEVlbUZPckExSXF6QzlveGRpcVZ5?=
 =?utf-8?B?cHE5aXJXWXB1SEhuTTZGaDJTRWxsYThkZXREeTI0QkhnMHQzTlpOWE5lMDE2?=
 =?utf-8?B?cHRxZGMyMEJOWno1d0dCSFdsb0RsdTAxcVZTOWxxVUNYZUhObG9XSWtWTnBR?=
 =?utf-8?B?Mlc4a05JSmFPbzJHTjNab01hdEpOdVE0VFVGKzBnTWRqcWJjLzZUZWJuQXpG?=
 =?utf-8?B?RHh1a2RGWTdHNTR5NzdxVmRpMlBNZXBGT2l0cEYwdksyR041T0kxTWNIVEg1?=
 =?utf-8?B?YnRLQ0pUMGQwMUx0bWpYZFRsOFFaWDYzSmdaQ1dXSE5MdFFCbzc4ZVcrSHZy?=
 =?utf-8?B?MThEUWxYMXFSWW1rL1JpU0tsejlYV0N0N05hTmZQSWg1SmZ2WngzUGVkWS9W?=
 =?utf-8?B?TmtzaW1lVTVONjF2M3Z5QmNLREZqNjVScVBtY1lVUWJCTEpTY0c2UU94YWNl?=
 =?utf-8?Q?Jq3HjuuotUmxznhI=3D?=
X-Exchange-RoutingPolicyChecked: DJqtbNOrFgQHwjDMJ/y3JzQHZPSSLyvfhfNcnrPEHptqCPJ7aiBng2A8oLnvVlBq/G8a4p6eXNyr3cH/9vr8HFywQZB0TrJA+Y/GGGJZ2lHLNYsIfCd3g0BPx4UvLtA7mBe68qChfiKvPw4O2wII40kG7D8wbzDkYu3ZrCkMAlH/OXZR19C8+zVdaS/ButG0c8mUIVTldc9rnD6LXhmfWYsl3VVmtR8gbF7PMYxGDnN+WLuXnVqmIoqQC4gGHL/60CUSjqWpWd2UBgaqLKuptrLeS9Ed+lavz9NmszCoT6okra81IlPpccFlcbNJ9kBvag7ltW8z6bcVjFZXQgr/aA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 613c8677-0ed3-4da3-9381-08de9ed74259
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8208.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 12:20:50.2948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GPOqJZKHZAzPudtRmi5fuMSgwtztD15pKkX39AhAr0abzuq3pp9ULq5+uYwc2VAwLi5Huvnsn1azGLs0UIZ/5uVQufvlnsk9kAwx7DhWnhE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6989
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


On 20-04-2026 15:06, Govindapillai, Vinod wrote:
> On Thu, 2026-04-16 at 20:49 +0530, Sanjay Yadav wrote:
>> Stolen memory requires physically contiguous allocations for display
>> scanout and compressed framebuffers. The stolen memory manager was
>> sharing the gpu_buddy allocator backend with the VRAM manager, but
>> buddy manages non-contiguous power-of-two blocks making it a poor
>> fit.
>> Stolen memory also has fundamentally different allocation patterns:
>>
>> - Allocation sizes are not power-of-two. Since buddy rounds up to the
>>    next power-of-two block size, a ~17MB request can fail even with
>>    ~22MB free, because the free space is fragmented across non-fitting
>>    power-of-two blocks.
>> - Hardware restrictions prevent using the first 4K page of stolen for
>>    certain allocations (e.g., FBC). The display code sets fpfn=1 to
>>    enforce this, but when fpfn != 0, gpu_buddy enables
>>    GPU_BUDDY_RANGE_ALLOCATION mode which disables the try_harder
>>    coalescing path, further reducing allocation success.
>>
>> This combination caused FBC compressed framebuffer (CFB) allocation
>> failures on platforms like NVL/PTL. In case of NVL where stolen
>> memory
>> is ~56MB and the initial plane framebuffer consumes ~34MB at probe
>> time,
>> leaving ~22MB for subsequent allocations.
>>
>> Use ttm_range_man_init_nocheck() to set up a drm_mm-backed TTM
>> resource
>> manager for stolen memory. This reuses the TTM core's
>> ttm_range_manager
>> callbacks, avoiding duplicate implementations.
>>
>> Tested on NVL with a 4K DP display: stolen_mm shows a single ~22MB
>> contiguous free hole after initial plane framebuffer allocation, and
>> FBC successfully allocates its CFB from that region. The
>> corresponding
>> IGT was previously skipped and now passes.
>>
>> v2:
>> - Clarify that stolen memory requires contiguous allocations (Matt B)
>> - Properly handle xe_ttm_resource_visible() for stolen instead of
>>    unconditionally returning true (Matt A)
>>
>> Closes:
>> https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7631
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>> Assisted-by: GitHub Copilot:claude-sonnet-4.6
>> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c             | 16 +++++--
>>   drivers/gpu/drm/xe/xe_device_types.h   |  3 ++
>>   drivers/gpu/drm/xe/xe_res_cursor.h     | 14 +++++-
>>   drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 64 +++++++++---------------
>> --
>>   drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h |  9 ++++
>>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c   | 11 ++---
>>   6 files changed, 63 insertions(+), 54 deletions(-)
>>
> FP16 stolen memory allocations are working ~35mb
>
> Acked-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
Thanks Vinod for the confirmation!
>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index a7c2dc7f224c..b737edf04d60 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -599,11 +599,17 @@ static void xe_ttm_tt_destroy(struct ttm_device
>> *ttm_dev, struct ttm_tt *tt)
>>   	kfree(tt);
>>   }
>>   
>> -static bool xe_ttm_resource_visible(struct ttm_resource *mem)
>> +static bool xe_ttm_resource_visible(struct xe_device *xe, struct
>> ttm_resource *mem)
>>   {
>> -	struct xe_ttm_vram_mgr_resource *vres =
>> -		to_xe_ttm_vram_mgr_resource(mem);
>> +	struct xe_ttm_vram_mgr_resource *vres;
>>   
>> +	if (mem->mem_type == XE_PL_STOLEN) {
>> +		struct xe_ttm_stolen_mgr *mgr = xe->mem.stolen_mgr;
>> +
>> +		return mgr->io_base &&
>> !xe_ttm_stolen_cpu_access_needs_ggtt(xe);
>> +	}
>> +
>> +	vres = to_xe_ttm_vram_mgr_resource(mem);
>>   	return vres->used_visible_size == mem->size;
>>   }
>>   
>> @@ -621,7 +627,7 @@ bool xe_bo_is_visible_vram(struct xe_bo *bo)
>>   	if (drm_WARN_ON(bo->ttm.base.dev, !xe_bo_is_vram(bo)))
>>   		return false;
>>   
>> -	return xe_ttm_resource_visible(bo->ttm.resource);
>> +	return xe_ttm_resource_visible(xe_bo_device(bo), bo-
>>> ttm.resource);
>>   }
>>   
>>   static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
>> @@ -637,7 +643,7 @@ static int xe_ttm_io_mem_reserve(struct
>> ttm_device *bdev,
>>   	case XE_PL_VRAM1: {
>>   		struct xe_vram_region *vram =
>> res_to_mem_region(mem);
>>   
>> -		if (!xe_ttm_resource_visible(mem))
>> +		if (!xe_ttm_resource_visible(xe, mem))
>>   			return -EINVAL;
>>   
>>   		mem->bus.offset = mem->start << PAGE_SHIFT;
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
>> b/drivers/gpu/drm/xe/xe_device_types.h
>> index 150c76b2acaf..ffb84659c413 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -42,6 +42,7 @@ struct xe_ggtt;
>>   struct xe_i2c;
>>   struct xe_pat_ops;
>>   struct xe_pxp;
>> +struct xe_ttm_stolen_mgr;
>>   struct xe_vram_region;
>>   
>>   /**
>> @@ -278,6 +279,8 @@ struct xe_device {
>>   		struct ttm_resource_manager sys_mgr;
>>   		/** @mem.sys_mgr: system memory shrinker. */
>>   		struct xe_shrinker *shrinker;
>> +		/** @mem.stolen_mgr: stolen memory manager. */
>> +		struct xe_ttm_stolen_mgr *stolen_mgr;
>>   	} mem;
>>   
>>   	/** @sriov: device level virtualization data */
>> diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h
>> b/drivers/gpu/drm/xe/xe_res_cursor.h
>> index 5f4ab08c0686..0522caafd89d 100644
>> --- a/drivers/gpu/drm/xe/xe_res_cursor.h
>> +++ b/drivers/gpu/drm/xe/xe_res_cursor.h
>> @@ -101,7 +101,15 @@ static inline void xe_res_first(struct
>> ttm_resource *res,
>>   	cur->mem_type = res->mem_type;
>>   
>>   	switch (cur->mem_type) {
>> -	case XE_PL_STOLEN:
>> +	case XE_PL_STOLEN: {
>> +		/* res->start is in pages (ttm_range_manager). */
>> +		cur->start = (res->start << PAGE_SHIFT) + start;
>> +		cur->size = size;
>> +		cur->remaining = size;
>> +		cur->node = NULL;
>> +		cur->mm = NULL;
>> +		break;
>> +	}
>>   	case XE_PL_VRAM0:
>>   	case XE_PL_VRAM1: {
>>   		struct gpu_buddy_block *block;
>> @@ -289,6 +297,10 @@ static inline void xe_res_next(struct
>> xe_res_cursor *cur, u64 size)
>>   
>>   	switch (cur->mem_type) {
>>   	case XE_PL_STOLEN:
>> +		/* Just advance within the contiguous region. */
>> +		cur->start += size;
>> +		cur->size = cur->remaining;
>> +		break;
>>   	case XE_PL_VRAM0:
>>   	case XE_PL_VRAM1:
>>   		start = size - cur->size;
>> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>> b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>> index 27c9d72222cf..5e9070739e65 100644
>> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>> @@ -19,30 +19,11 @@
>>   #include "xe_device.h"
>>   #include "xe_gt_printk.h"
>>   #include "xe_mmio.h"
>> -#include "xe_res_cursor.h"
>>   #include "xe_sriov.h"
>>   #include "xe_ttm_stolen_mgr.h"
>> -#include "xe_ttm_vram_mgr.h"
>>   #include "xe_vram.h"
>>   #include "xe_wa.h"
>>   
>> -struct xe_ttm_stolen_mgr {
>> -	struct xe_ttm_vram_mgr base;
>> -
>> -	/* PCI base offset */
>> -	resource_size_t io_base;
>> -	/* GPU base offset */
>> -	resource_size_t stolen_base;
>> -
>> -	void __iomem *mapping;
>> -};
>> -
>> -static inline struct xe_ttm_stolen_mgr *
>> -to_stolen_mgr(struct ttm_resource_manager *man)
>> -{
>> -	return container_of(man, struct xe_ttm_stolen_mgr,
>> base.manager);
>> -}
>> -
>>   /**
>>    * xe_ttm_stolen_cpu_access_needs_ggtt() - If we can't directly CPU
>> access
>>    * stolen, can we then fallback to mapping through the GGTT.
>> @@ -210,12 +191,19 @@ static u64 detect_stolen(struct xe_device *xe,
>> struct xe_ttm_stolen_mgr *mgr)
>>   #endif
>>   }
>>   
>> +static void xe_ttm_stolen_mgr_fini(struct drm_device *dev, void
>> *arg)
>> +{
>> +	struct xe_device *xe = to_xe_device(dev);
>> +
>> +	ttm_range_man_fini_nocheck(&xe->ttm, XE_PL_STOLEN);
>> +}
>> +
>>   int xe_ttm_stolen_mgr_init(struct xe_device *xe)
>>   {
>>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>   	struct xe_ttm_stolen_mgr *mgr;
>>   	u64 stolen_size, io_size;
>> -	int err;
>> +	int ret;
>>   
>>   	mgr = drmm_kzalloc(&xe->drm, sizeof(*mgr), GFP_KERNEL);
>>   	if (!mgr)
>> @@ -244,12 +232,12 @@ int xe_ttm_stolen_mgr_init(struct xe_device
>> *xe)
>>   	if (mgr->io_base &&
>> !xe_ttm_stolen_cpu_access_needs_ggtt(xe))
>>   		io_size = stolen_size;
>>   
>> -	err = __xe_ttm_vram_mgr_init(xe, &mgr->base, XE_PL_STOLEN,
>> stolen_size,
>> -				     io_size, PAGE_SIZE);
>> -	if (err) {
>> -		drm_dbg_kms(&xe->drm, "Stolen mgr init failed:
>> %i\n", err);
>> -		return err;
>> -	}
>> +	ret = ttm_range_man_init_nocheck(&xe->ttm, XE_PL_STOLEN,
>> false,
>> +					 stolen_size >> PAGE_SHIFT);
>> +	if (ret)
>> +		return ret;
>> +
>> +	xe->mem.stolen_mgr = mgr;
>>   
>>   	drm_dbg_kms(&xe->drm, "Initialized stolen memory support
>> with %llu bytes\n",
>>   		    stolen_size);
>> @@ -257,36 +245,32 @@ int xe_ttm_stolen_mgr_init(struct xe_device
>> *xe)
>>   	if (io_size)
>>   		mgr->mapping = devm_ioremap_wc(&pdev->dev, mgr-
>>> io_base, io_size);
>>   
>> -	return 0;
>> +	return drmm_add_action_or_reset(&xe->drm,
>> xe_ttm_stolen_mgr_fini, mgr);
>>   }
>>   
>>   u64 xe_ttm_stolen_io_offset(struct xe_bo *bo, u32 offset)
>>   {
>>   	struct xe_device *xe = xe_bo_device(bo);
>> -	struct ttm_resource_manager *ttm_mgr = ttm_manager_type(&xe-
>>> ttm, XE_PL_STOLEN);
>> -	struct xe_ttm_stolen_mgr *mgr = to_stolen_mgr(ttm_mgr);
>> -	struct xe_res_cursor cur;
>> +	struct xe_ttm_stolen_mgr *mgr = xe->mem.stolen_mgr;
>>   
>>   	XE_WARN_ON(!mgr->io_base);
>>   
>>   	if (xe_ttm_stolen_cpu_access_needs_ggtt(xe))
>>   		return mgr->io_base + xe_bo_ggtt_addr(bo) + offset;
>>   
>> -	xe_res_first(bo->ttm.resource, offset, 4096, &cur);
>> -	return mgr->io_base + cur.start;
>> +	/* Range allocator: res->start is in pages. */
>> +	return mgr->io_base + (bo->ttm.resource->start <<
>> PAGE_SHIFT) + offset;
>>   }
>>   
>>   static int __xe_ttm_stolen_io_mem_reserve_bar2(struct xe_device *xe,
>>   					       struct
>> xe_ttm_stolen_mgr *mgr,
>>   					       struct ttm_resource
>> *mem)
>>   {
>> -	struct xe_res_cursor cur;
>> -
>>   	if (!mgr->io_base)
>>   		return -EIO;
>>   
>> -	xe_res_first(mem, 0, 4096, &cur);
>> -	mem->bus.offset = cur.start;
>> +	/* Range allocator always produces contiguous allocations.
>> */
>> +	mem->bus.offset = mem->start << PAGE_SHIFT;
>>   
>>   	drm_WARN_ON(&xe->drm, !(mem->placement &
>> TTM_PL_FLAG_CONTIGUOUS));
>>   
>> @@ -329,8 +313,7 @@ static int
>> __xe_ttm_stolen_io_mem_reserve_stolen(struct xe_device *xe,
>>   
>>   int xe_ttm_stolen_io_mem_reserve(struct xe_device *xe, struct
>> ttm_resource *mem)
>>   {
>> -	struct ttm_resource_manager *ttm_mgr = ttm_manager_type(&xe-
>>> ttm, XE_PL_STOLEN);
>> -	struct xe_ttm_stolen_mgr *mgr = ttm_mgr ?
>> to_stolen_mgr(ttm_mgr) : NULL;
>> +	struct xe_ttm_stolen_mgr *mgr = xe->mem.stolen_mgr;
>>   
>>   	if (!mgr || !mgr->io_base)
>>   		return -EIO;
>> @@ -343,8 +326,5 @@ int xe_ttm_stolen_io_mem_reserve(struct xe_device
>> *xe, struct ttm_resource *mem)
>>   
>>   u64 xe_ttm_stolen_gpu_offset(struct xe_device *xe)
>>   {
>> -	struct xe_ttm_stolen_mgr *mgr =
>> -		to_stolen_mgr(ttm_manager_type(&xe->ttm,
>> XE_PL_STOLEN));
>> -
>> -	return mgr->stolen_base;
>> +	return xe->mem.stolen_mgr->stolen_base;
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
>> b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
>> index 8e877d1e839b..049e91e77326 100644
>> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
>> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
>> @@ -12,6 +12,15 @@ struct ttm_resource;
>>   struct xe_bo;
>>   struct xe_device;
>>   
>> +struct xe_ttm_stolen_mgr {
>> +	/* PCI base offset */
>> +	resource_size_t io_base;
>> +	/* GPU base offset */
>> +	resource_size_t stolen_base;
>> +
>> +	void __iomem *mapping;
>> +};
>> +
>>   int xe_ttm_stolen_mgr_init(struct xe_device *xe);
>>   int xe_ttm_stolen_io_mem_reserve(struct xe_device *xe, struct
>> ttm_resource *mem);
>>   bool xe_ttm_stolen_cpu_access_needs_ggtt(struct xe_device *xe);
>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> index 5fd0d5506a7e..79ef8e1b5e5c 100644
>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> @@ -301,14 +301,13 @@ int __xe_ttm_vram_mgr_init(struct xe_device
>> *xe, struct xe_ttm_vram_mgr *mgr,
>>   			   u64 default_page_size)
>>   {
>>   	struct ttm_resource_manager *man = &mgr->manager;
>> +	const char *name;
>>   	int err;
>>   
>> -	if (mem_type != XE_PL_STOLEN) {
>> -		const char *name = mem_type == XE_PL_VRAM0 ? "vram0"
>> : "vram1";
>> -		man->cg = drmm_cgroup_register_region(&xe->drm,
>> name, size);
>> -		if (IS_ERR(man->cg))
>> -			return PTR_ERR(man->cg);
>> -	}
>> +	name = mem_type == XE_PL_VRAM0 ? "vram0" : "vram1";
>> +	man->cg = drmm_cgroup_register_region(&xe->drm, name, size);
>> +	if (IS_ERR(man->cg))
>> +		return PTR_ERR(man->cg);
>>   
>>   	man->func = &xe_ttm_vram_mgr_func;
>>   	mgr->mem_type = mem_type;
