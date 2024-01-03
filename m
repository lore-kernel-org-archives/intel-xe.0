Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D1A3C46CD2
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jan 2024 01:56:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C4410E034;
	Wed,  3 Jan 2024 01:56:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 674E710E034
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jan 2024 01:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704246999; x=1735782999;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GisVgn//WKQgjAYwvlczClgBhS8vG56QCYvhiPJzI+s=;
 b=jKbjiDB9gQ0JS4/wKsw4VBdseNb8bHzvw4wsR9d1mLIGQnvdMkhg+pnL
 kV+TFB10dmzrD/+7+jPNHjid2pdBWdCB12Bwis7Hz/rxjlJgQLrINr8Wq
 h9mf/1i/VizuhUMFuYtGSC0n15Yijg2zoaukaKYFyfvs3EP8xLLb1cVmU
 2q8gQXAlDuzThUIWORE4VcWO66HFqzZX9SYYy+xXsp9cvqCzbgMyS/Byz
 iCy9dH2/c8Dw9KnM2sGq/T6i0XX4lfc3En3uJZQbCAdeCaGXxoPoFap8N
 hAG1bUVwXqtghboAHpMxTHSm4scq4vTGPaPkiYxi7RkvxpZthuhH1kMJS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="15587571"
X-IronPort-AV: E=Sophos;i="6.04,326,1695711600"; d="scan'208";a="15587571"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 17:56:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,326,1695711600"; d="scan'208";a="21647398"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jan 2024 17:56:38 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Jan 2024 17:56:37 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Jan 2024 17:56:37 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Jan 2024 17:56:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f7HqrJxjYJvN1jKcSesg5k2eLx+It4JAkBJO/7ThoLbjo+eT0KdlIPKFnSpf2y/0XhQ8pwZWgpXzKlDc3l8t1v0JO47CqUZtDLUX9adACu4ttk6E6atowrUVf+8Kr1mvGGaYfI0PGr4O03WphmT6En+SDZxi+x9oreXU4wcBEPDlZ3STgx5iWYBfXBNN5LdQbmwmbBmNfp6daoOOYISJr4ByZ7ipBb1fY8BcIk+XHRs6eQCkZvYEOOgrAJc02p87JfMvD89kpEzjUeGgUAbuGeUvvXdztLIYiyZ/mJzhsoMnFinsr6UgDy7ScPV1ZX5XP2FASjt9MG/GMq8JrnsShQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zwKDz9YwnS9c9emmuRPWHAZnE4zQ2UnDf1osxjjpJXE=;
 b=EZcfE4bvQkvpOiH0Xv4RdBEj4hmpOkMR19xNT2FFamHcT6xzl0E7IcREW4u0DvbQw8wXTEcJ+LU3VSKkJFzYPpLhIZoKLk+Lyp3kTXhA62fzpzlwQ+rOAKQhC1wbWAl1CRepF/GnkwPR3udu5fa8NLMjyFLF8Epe7EpU/00HTxHUPMqo0nbd4Qe2v99ggF7fCzXBbbWHXLtz8PFIsbjdQ82+4HYHZ4eDK7cDPT+UmEhnK1M1B/GHNVEgVjP1G97ZuagsZyp0WsbZCDwwzHLomHfYBdH4oSxh9Qr91q3XfO2Ymp5kah78CVnCROQMLueYkJWRKLJPKW4fq8z19uQQpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by CH0PR11MB5523.namprd11.prod.outlook.com (2603:10b6:610:d6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Wed, 3 Jan
 2024 01:56:34 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c947:cbd4:3870:c36e]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c947:cbd4:3870:c36e%7]) with mapi id 15.20.7135.023; Wed, 3 Jan 2024
 01:56:34 +0000
Message-ID: <20d71d4b-1939-4fbf-9ca5-2bb8c7a48304@intel.com>
Date: Tue, 2 Jan 2024 17:56:32 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: CLOS Based Cache Reservation support.
Content-Language: en-US
To: Pallavi Mishra <pallavi.mishra@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20231220012705.3784972-1-pallavi.mishra@intel.com>
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20231220012705.3784972-1-pallavi.mishra@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR06CA0063.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::40) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|CH0PR11MB5523:EE_
X-MS-Office365-Filtering-Correlation-Id: 9df93ca9-25ea-4cc0-18c9-08dc0bff36a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /hVGvVQ9mVQfSIfRPaa1goRU4uZ+uCQJVtyvAXszQqOmASuf1KMvil9h9oHr53S3mJPH2RPMbn/VsvsoI+hTWzABY7whqm/zyyOuxP8a0nSFQxkfEoHJRBRaHN6Mo1vCC7R2S6K1o0TLiqkFzhjpvSf3EMu77OF+X2SWVSYzL9tDWn710yeCMQyzQXYO/QO6InCLcM5zMKAURkSwC3XVMzUlo6ayWQVDFHjOoFZQq4qqtPcCB+cTxMdrKC98+lpK3MTmQ+bdCZKWXuHvB92097RZIsotLXgL8pCLAVjsXlBVJWrAI14Xbhm1VDZpToJ3e3uHEo/sShncAui8JO8NcLxJwwidSMQ8g7iCDI5/QL66Ut0iAio/iYaVzFiPVrcbuFGnHU0pEHAxzVMFmp623dCckwrqkX9FG+RL7Jdc3uZZFwlBHtXHx3T2/IB+G5I9Zr8KJgbxWbosDJ5zS6bzcWhgvCGv1lv1jAkfbPdl8XW2UmwS70vphQcBcXaTM25BwmqgLuHVv0FghTeeRyiGdmXtV9Z4UFG+T1Nen0pqxELTk3mqqXW3BZShnMYZsRj01Aovry1UzzJcrHIXiAOA8n5/j8t7x9q7+oHhIU6OyyrvlIaXn5wAnfgA2Tpra9/x115Q5owKe9wI39lC7lweRQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(39860400002)(346002)(136003)(366004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(53546011)(82960400001)(38100700002)(36756003)(31686004)(31696002)(86362001)(6506007)(2616005)(26005)(478600001)(6512007)(107886003)(4326008)(66946007)(66476007)(6486002)(66556008)(83380400001)(316002)(8676002)(8936002)(41300700001)(5660300002)(30864003)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDVCL3V4SnRvRitpd2xJcjF6cWZXeHpVVG5vTCtZM1R6OUxuNmhNRUFkUzE0?=
 =?utf-8?B?b1pPQ01GNENuVExpU1FPUWhvNC94SUNleVF0YzJ2TVRmNy9ZZGlvMjAveUN6?=
 =?utf-8?B?QW5mNW1QZkJoRnlISmtGYk9ML2RGYVdUdUs5SXVLaDlwZTV4bXRSKy9YSjZR?=
 =?utf-8?B?TFJpMjdsdklIN2VzNVJybm0yNnJrMTdqWTFNaXVFcnU1VXZRWnBrVU9nYWFo?=
 =?utf-8?B?SUxUM3hLUmpCYy85ZGFERXRybkNlcWxFZVY5OHVQWWNlMGo0T0FzL1kvVlFI?=
 =?utf-8?B?N2ZGdHh4UzhQVGFSMDJOamFBUTFCaGZEVUwrUWNWNktWUlREd041TWUrN2Zo?=
 =?utf-8?B?TGF6L3pMUGYwbEI1aWJkUWZBSDZUVFhKMG0zVi9aL0tQenRQTUlFeXFKVGpk?=
 =?utf-8?B?bFlZWGFMOUFidFNMRFJveFR2elNIQTdXdHU4L0RPOGFuUFY1S2lRRXJTNEpI?=
 =?utf-8?B?cHI3V0xYTkZhaUN3K2VIRVo4RG8wK2d6LzFTSThLWXp4Q3hCM1V2dHJkZHZH?=
 =?utf-8?B?eUFnZWtyMzRiRDJSZ2dJY2RRVVZrK2lwMjZNbGtiRTNHQytYUmVtbUFFOFZo?=
 =?utf-8?B?ZTdhbS9aQ0pnZExKNjR0SEhkNGxPQVprbFpGclVGRWlSVWFYaUFDVzVzTkNC?=
 =?utf-8?B?MU8rRUlPemNXMnZ4ZXIzaStrZHVXbkhTMk5mR1RJelpJYm44cng5MlVmOEg0?=
 =?utf-8?B?WDU2MG1zTkZTWm9ZVG1FMXBRUlFMRDVlbTVOcWNkQUhsV0o2TXR3NVdkMzd1?=
 =?utf-8?B?bE13ZFVSdlBacndLazM4VXdiUWZ0Y3BONmg1UThjS3hQMmRLYnltaEVFdElP?=
 =?utf-8?B?TGNzNzNpLytjZkpPQnY5U0s3aWFGc0xUVUZKNXovY25mTVAzeWJlS0xEcE8v?=
 =?utf-8?B?V0l2RFJ6R1BFMGxMa0UwdUdUSVpKYWF0WUE3YTVWa25sSkNNL2NBei92NnNM?=
 =?utf-8?B?cjJPbXNraFA5NS9HSENzMldiWTBOTlhKZDBxdVhSN0xhOHdZZ1Y2RW5pbHY2?=
 =?utf-8?B?M1E3RjN6OEZhSHRZL3dzRnBEb09kSzZSeTNOQ3p1QnNienlYK1ZwdnZjQmxz?=
 =?utf-8?B?cGxBWVoxU0hrSFFjK1IyY01VNlRNdU5hbGJRcW9IMUpPZ3NpRnEzODZvOWFv?=
 =?utf-8?B?SG1YaHZDcXNma1JXdVdRRmhta2xpangwZlFKUWgvRDdGN3NuMlVPTkhodjZF?=
 =?utf-8?B?NWN3TktLUFRvcE41MHlzYmZOeTE1dTByMkZwQ2Vkb0hUVUdKSlNLZmtOTTli?=
 =?utf-8?B?d3NCRlJ4ZHlqUHdCU3kreWljMWYxOTJFZ3NvNlYwRXZnS3NQajlya2toZjRl?=
 =?utf-8?B?SGpKd2xNcDFhT2VoTkd5U0RsSVNsUHZIQUNFNlNZWkczY3Y1OWNPYllndXNH?=
 =?utf-8?B?M2lENWVqWElTZEhHN3M2TXNac2FVNGR6WTcyZC9GaUdPZHNUbkFCR2hHOGJF?=
 =?utf-8?B?VTRoYlpNbm1DVkliL29jLzhyalF1VEF2Yi9BNVowZk1FYVVqeW9xR3djR0Jn?=
 =?utf-8?B?SzE4OEFTSFkxUzVvZTIxSkJiMEdEb0V1OWZBa3ViQWl3K3hWR0dVTUVrUUF6?=
 =?utf-8?B?QUVhbVI3M3pSbDluQmxBOTFZenI1eExVcWpJQjNySzBuY0dUZ1hGZDA0dWtK?=
 =?utf-8?B?dUw4QUREN0pldlBXa3RzK2JIb0hVaFo3TmVMYXVGWUdUQStJN3NCYXdNUXBa?=
 =?utf-8?B?VTJ3Y085cXk3aTFPc29HQjRXR3E0UUxCNi9Zem0rZzdQTmlwMmRFT0JGRkVp?=
 =?utf-8?B?aWdzL1ZPUjNPVGtrdjJvcGdVMjFLdk1yZDNEWGNhZTFWbElOM2U1TWxNNDZo?=
 =?utf-8?B?WlNkOWZ1c1E5SUlaZlpoc0p2UFlHcmtxbndyNXg1UnUvMForNjA5OGxXZ2Jp?=
 =?utf-8?B?UTM2bytta1RwdExhTlNFR0JJamcvbVZJR3J5Z3I3eERLbllzcW1FRHNJcUFB?=
 =?utf-8?B?eTZqdGRiSVBpMmRnTUhQeUY2R0MrQWNaOS9DK0hnK3kwM0xOS1BPRlRsaVUy?=
 =?utf-8?B?Y1FHcW0zT2EzdktjNERnUFZ1Y1F0YXVCSDhVRkkwRUdzK1gwbjdBUE9md0h1?=
 =?utf-8?B?QlB4dVhuRE9lZVYvUnVsSkw4QVRZWTI3WTR4YmV5b1hGQ01BVkVoUXMzSkl6?=
 =?utf-8?Q?DPNsfuAFExNPd6xZKTYH2CAdV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9df93ca9-25ea-4cc0-18c9-08dc0bff36a7
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2024 01:56:34.2607 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CAauvTPc7rSqUntxzh6XF/HWcxrbap29TmK0xfvA8pAvd/Gc9pSj0o6JJ1pUOFq+OK8Y39K3UH8bWMkEzB2tww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5523
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


On 12/19/2023 5:27 PM, Pallavi Mishra wrote:
> Xe API supports an optional extension for allowing Apps to reserve
> portions of the GPU Caches for exclusive use. This allows the App
> to separate latency/bandwidth sensitive workloads from all other
> workloads.
> 
> PVC and XE2 expose control over each Cache through the Class of Service (CLOS)
> feature. CLOS allows XEKMD to define which portions of a cache may be
> used for a given allocation through a set of Waymask controls grouped
> into multiple sets.
> 
> For each CLOS set, and supported cache, there is a Waymask to configure
> the Ways in that cache that may be used to cache memory requests for that
> CLOS.
> 
> TODO:
>    - Need to add sysfs for setting limits
>    - Need to handle BO host cache type
> 
> Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile                   |   1 +
>   .../gpu/drm/xe/compat-i915-headers/i915_drv.h |   1 +
>   drivers/gpu/drm/xe/xe_clos.c                  | 268 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_clos.h                  |  36 +++
>   drivers/gpu/drm/xe/xe_device.c                |  15 +
>   drivers/gpu/drm/xe/xe_device_types.h          |  15 +
>   drivers/gpu/drm/xe/xe_pat.c                   |  45 +++
>   drivers/gpu/drm/xe/xe_pat.h                   |  10 +
>   drivers/gpu/drm/xe/xe_pci.c                   |   4 +
>   drivers/gpu/drm/xe/xe_vm.c                    |  11 +
>   include/uapi/drm/xe_drm.h                     |  71 +++++
>   11 files changed, 477 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_clos.c
>   create mode 100644 drivers/gpu/drm/xe/xe_clos.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index df8601d6a59f..bc60708ba23c 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -64,6 +64,7 @@ $(uses_generated_oob): $(generated_oob)
>   xe-y += xe_bb.o \
>   	xe_bo.o \
>   	xe_bo_evict.o \
> +	xe_clos.o \
>   	xe_debugfs.o \
>   	xe_devcoredump.o \
>   	xe_device.o \
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> index 5d2a77b52db4..27226c1efc5a 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> @@ -104,6 +104,7 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
>   	 (xe)->info.graphics_verx100 <= (last*100 + 99))
>   #define IS_MOBILE(xe) (xe && 0)
>   #define HAS_LLC(xe) (!IS_DGFX((xe)))
> +#define HAS_CLOS(xe) ((xe)->info.has_clos == true)

Do we need this define?  If so, I think belongs in different header.
But looks like convention is to just do:
    if (xe->info.has_clos)
where used.

>   
>   #define HAS_GMD_ID(xe) GRAPHICS_VERx100(xe) >= 1270
>   
> diff --git a/drivers/gpu/drm/xe/xe_clos.c b/drivers/gpu/drm/xe/xe_clos.c
> new file mode 100644
> index 000000000000..da56e52d25de
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_clos.c
> @@ -0,0 +1,268 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2020 Intel Corporation
> + */
> +
> +#include "i915_drv.h"
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_gt_mcr.h"
> +#include "regs/xe_gt_regs.h"
> +#include "xe_clos.h"
> +
> +#include <drm/xe_drm.h>
> +
> +static void clos_update_ways(struct xe_gt *gt, u8 clos_index, u32 mask)
> +{
> +
> +	DRM_DEBUG("clos index = %d mask = 0x%x", clos_index,  mask);

For here and elsewhere in patch, I believe convention is to use drm_dbg().

> +	xe_gt_mcr_multicast_write(gt, XEHPC_L3CLOS_MASK(clos_index), mask);
> +}
> +
> +static void update_l3cache_masks(struct xe_device *xe)
> +{
> +	u8 start_bits = 0;
> +	int i;
> +
> +	for (i = 0; i < NUM_CLOS; i++) {
> +		struct xe_gt *gt;
> +		u32 mask = 0;
> +		int j;
> +
> +		if (xe->cache_resv.ways[i]) {
> +			// Assign contiguous span of ways
> +			u8 ways = xe->cache_resv.ways[i];
> +			mask = GENMASK(start_bits + ways - 1, start_bits);
> +
> +			DRM_DEBUG("start_bits = %d ways = %d mask= 0x%x\n",
> +				  start_bits, ways, mask);
> +			start_bits += ways;
> +		}
> +		for_each_gt(gt, xe, j)
> +			clos_update_ways(gt, i, mask);
> +	}
> +}
> +
> +#define MAX_L3WAYS 32
> +void init_device_clos(struct xe_device *xe)
> +{
> +	int i;
> +
> +	if (!(xe->info.has_clos))
> +		return;
> +
> +	mutex_init(&xe->cache_resv.clos_mutex);
> +	// CLOS1 and CLOS2 available for Reservation
> +	xe->cache_resv.free_clos_mask = 0x6;
> +
> +	if (GRAPHICS_VER(xe) >= 20)
> +		xe->cache_resv.free_clos_mask = 0xe;
> +
> +	// Shared set uses CLOS0 and initially gets all Ways
> +	xe->cache_resv.ways[0] = MAX_L3WAYS;
> +
> +	for (i = 1; i < 3; i++)
> +		xe->cache_resv.ways[i] = 0;

struct xe_device was allocated with kzalloc(). So don't really need to 
initialize these to zero.

> +
> +	update_l3cache_masks(xe);
> +}
> +
> +void uninit_device_clos(struct xe_device *xe)
> +{
> +	if (!(xe->info.has_clos))
> +		return;
> +
> +	mutex_destroy(&xe->cache_resv.clos_mutex);
> +}
> +
> +void init_client_clos(struct xe_file *file)
> +{
> +	if (!(file->xe->info.has_clos))
> +		return;
> +
> +	file->clos_resv.clos_mask = 0;   // No CLOS reserved yet
> +	file->clos_resv.l3_rsvd_ways = 0;
> +}
> +
> +void uninit_client_clos(struct xe_file *file)
> +{
> +	if (!(file->xe->info.has_clos))
> +		return;
> +
> +	while (file->clos_resv.clos_mask) {
> +		u16 clos_index = ffs(file->clos_resv.clos_mask) - 1;

I think a little cleaner to replace the while loop with for_each_set_bit()

> +
> +		DRM_DEBUG("uninit release mask = 0x%x clos= %d\n",
> +			  file->clos_resv.clos_mask, clos_index);
> +		free_clos(file, clos_index);
> +		file->clos_resv.clos_mask &= ~(1 << clos_index);
> +	}
> +}
> +
> +#define L3_GLOBAL_RESERVATION_LIMIT 16
> +#define L3_CLIENT_RESERVATION_LIMIT 8
> +static int reserve_l3cache_ways(struct xe_file *file,
> +				u16 clos_index, u16 *num_ways)
> +{
> +	struct xe_device *xe = file->xe;
> +	u8 global_limit = L3_GLOBAL_RESERVATION_LIMIT -
> +		(MAX_L3WAYS - xe->cache_resv.ways[0]);
> +	u8 client_limit = L3_CLIENT_RESERVATION_LIMIT -
> +		file->clos_resv.l3_rsvd_ways;
> +	u8 limit = min(global_limit, client_limit);
> +
> +	if (limit == 0)
> +		return -ENOSPC;
> +
> +	if (*num_ways > limit) {
> +		*num_ways = limit;
> +		return -EAGAIN;
> +	}
> +
> +	file->clos_resv.l3_rsvd_ways += *num_ways;
> +
> +	xe->cache_resv.ways[0] -= *num_ways;
> +	xe->cache_resv.ways[clos_index] = *num_ways;
> +
> +	update_l3cache_masks(xe);
> +
> +	return 0;
> +}
> +
> +static int
> +free_l3cache_ways(struct xe_file *file, u16 clos_index)
> +{
> +	struct xe_device *xe = file->xe;
> +
> +	if (xe->cache_resv.ways[clos_index]) {
> +		u8 num_ways = xe->cache_resv.ways[clos_index];
> +
> +		file->clos_resv.l3_rsvd_ways -= num_ways;
> +
> +		xe->cache_resv.ways[0] += num_ways;
> +		xe->cache_resv.ways[clos_index] -= num_ways;
> +
> +		update_l3cache_masks(xe);
> +	}
> +
> +	return 0;
> +}
> +
> +static bool
> +clos_is_reserved(struct xe_file *file, u16 clos_index)
> +{
> +	return file->clos_resv.clos_mask & (1 << clos_index);
> +}
> +
> +int reserve_cache_ways(struct xe_file *file, u16 cache_level,
> +		       u16 clos_index, u16 *num_ways)

Aren't this function and the 2 below only used in this file so can be 
static?

> +{
> +	struct xe_device *xe = file->xe;
> +	int ret = 0;
> +
> +	if (cache_level != 3)
> +		return -EINVAL;
> +
> +	if ((clos_index >= NUM_CLOS) || !clos_is_reserved(file, clos_index))
> +		return -EPERM;
> +
> +	mutex_lock(&xe->cache_resv.clos_mutex);
> +
> +	if (*num_ways)
> +		ret = reserve_l3cache_ways(file, clos_index, num_ways);
> +	else
> +		ret = free_l3cache_ways(file, clos_index);
> +
> +	mutex_unlock(&xe->cache_resv.clos_mutex);
> +	return ret;
> +}
> +
> +int reserve_clos(struct xe_file *file, u16 *clos_index)
> +{
> +	struct xe_device *xe = file->xe;
> +
> +	mutex_lock(&xe->cache_resv.clos_mutex);
> +
> +	if (xe->cache_resv.free_clos_mask) {
> +		u16 clos = ffs(xe->cache_resv.free_clos_mask) - 1;
> +
> +		file->clos_resv.clos_mask |= (1 << clos);
> +		xe->cache_resv.free_clos_mask &= ~(1 << clos);
> +
> +		*clos_index = clos;
> +	       xe->cache_resv.clos_index = clos;

indentation looks off here.

> +		mutex_unlock(&xe->cache_resv.clos_mutex);
> +
> +		return 0;
> +	}
> +	mutex_unlock(&xe->cache_resv.clos_mutex);
> +
> +	return -ENOSPC;
> +}
> +
> +int free_clos(struct xe_file *file, u16 clos_index)
> +{
> +	struct xe_device *xe = file->xe;
> +
> +	mutex_lock(&xe->cache_resv.clos_mutex);
> +
> +	if (clos_is_reserved(file, clos_index)) {
> +		struct xe_device *xe = file->xe;
> +
> +		free_l3cache_ways(file, clos_index);
> +
> +		file->clos_resv.clos_mask &= ~(1 << clos_index);
> +		xe->cache_resv.free_clos_mask |= (1 << clos_index);
> +
> +		mutex_unlock(&xe->cache_resv.clos_mutex);
> +
> +		return 0;
> +	}
> +
> +	mutex_unlock(&xe->cache_resv.clos_mutex);
> +	return -EPERM;
> +}
> +
> +int xe_clos_reserve_ioctl(struct drm_device *dev, void *data,
> +			  struct drm_file *file)
> +{
> +	struct xe_file *file_priv = file->driver_priv;
> +	struct xe_device *xe = file_priv->xe;
> +	struct drm_xe_clos_reserve *clos = data;
> +
> +	if (!HAS_CLOS(xe))
> +		return -EOPNOTSUPP;
> +
> +	return reserve_clos(file_priv, &clos->clos_index);
> +}
> +
> +int xe_clos_free_ioctl(struct drm_device *dev, void *data,
> +		       struct drm_file *file)
> +{
> +	struct xe_file *file_priv = file->driver_priv;
> +	struct xe_device *xe = file_priv->xe;
> +	struct drm_xe_clos_free *clos = data;
> +
> +	if (!HAS_CLOS(xe))
> +		return -EOPNOTSUPP;
> +
> +	return free_clos(file_priv, clos->clos_index);
> +}
> +
> +int xe_cache_reserve_ioctl(struct drm_device *dev, void *data,
> +			   struct drm_file *file)
> +{
> +	struct xe_file *file_priv = file->driver_priv;
> +	struct xe_device *xe = file_priv->xe;
> +	struct drm_xe_cache_reserve *cache_reserve = data;
> +
> +	if (!HAS_CLOS(xe))
> +		return -EOPNOTSUPP;
> +
> +	return reserve_cache_ways(file_priv,
> +				  cache_reserve->cache_level,
> +				  cache_reserve->clos_index,
> +				  &cache_reserve->num_ways);
> +}
> +
> +
> diff --git a/drivers/gpu/drm/xe/xe_clos.h b/drivers/gpu/drm/xe/xe_clos.h
> new file mode 100644
> index 000000000000..41384028e670
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_clos.h
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2020 Intel Corporation
> + */
> +
> +#ifndef INTEL_CLOS_H
> +#define INTEL_CLOS_H
> +
> +#include <linux/types.h>
> +
> +struct xe_device;
> +struct xe_file;
> +
> +struct drm_device;
> +struct drm_file;
> +
> +void init_device_clos(struct xe_device *xe);
> +void uninit_device_clos(struct xe_device *xe);
> +
> +void init_client_clos(struct xe_file *file);
> +void uninit_client_clos(struct xe_file *file);
> +
> +int reserve_clos(struct xe_file *file, u16 *clos_index);
> +int free_clos(struct xe_file *file, u16 clos_index);
> +int reserve_cache_ways(struct xe_file *file, u16 cache_level,
> +		       u16 clos_index, u16 *num_ways);
> +
> +int xe_clos_reserve_ioctl(struct drm_device *dev, void *data,
> +			  struct drm_file *file);
> +int xe_clos_free_ioctl(struct drm_device *dev, void *data,
> +		       struct drm_file *file);
> +int xe_cache_reserve_ioctl(struct drm_device *dev, void *data,
> +			   struct drm_file *file);
> +
> +#endif
> +
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 86867d42d532..f4287db66ff7 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -43,6 +43,7 @@
>   #include "xe_vm.h"
>   #include "xe_wait_user_fence.h"
>   #include "xe_hwmon.h"
> +#include "xe_clos.h"
>   
>   #ifdef CONFIG_LOCKDEP
>   struct lockdep_map xe_device_mem_access_lockdep_map = {
> @@ -82,6 +83,7 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>   	spin_unlock(&xe->clients.lock);
>   
>   	file->driver_priv = xef;
> +	init_client_clos(xef);
>   	return 0;
>   }
>   
> @@ -101,6 +103,9 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>   		xe_exec_queue_kill(q);
>   		xe_exec_queue_put(q);
>   	}
> +
> +	uninit_client_clos(xef);
> +
>   	mutex_unlock(&xef->exec_queue.lock);
>   	xa_destroy(&xef->exec_queue.xa);
>   	mutex_destroy(&xef->exec_queue.lock);
> @@ -138,6 +143,12 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>   			  DRM_RENDER_ALLOW),
>   	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
>   			  DRM_RENDER_ALLOW),
> +        DRM_IOCTL_DEF_DRV(XE_CLOS_RESERVE, xe_clos_reserve_ioctl,
> +			  DRM_RENDER_ALLOW),
> +        DRM_IOCTL_DEF_DRV(XE_CLOS_FREE, xe_clos_free_ioctl,
> +			  DRM_RENDER_ALLOW),
> +        DRM_IOCTL_DEF_DRV(XE_CACHE_RESERVE, xe_cache_reserve_ioctl,
> +			  DRM_RENDER_ALLOW),
>   };
>   
>   static const struct file_operations xe_driver_fops = {
> @@ -538,6 +549,8 @@ int xe_device_probe(struct xe_device *xe)
>   
>   	xe_hwmon_register(xe);
>   
> +	init_device_clos(xe);
> +
>   	err = drmm_add_action_or_reset(&xe->drm, xe_device_sanitize, xe);
>   	if (err)
>   		return err;
> @@ -570,6 +583,8 @@ void xe_device_remove(struct xe_device *xe)
>   
>   	xe_heci_gsc_fini(xe);
>   
> +	uninit_device_clos(xe);
> +
>   	xe_irq_shutdown(xe);
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 71f23ac365e6..1f823c3136c4 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -281,6 +281,8 @@ struct xe_device {
>   		u8 has_heci_gscfi:1;
>   		/** @skip_guc_pc: Skip GuC based PM feature init */
>   		u8 skip_guc_pc:1;
> +                /** @has_clos: device supports clos reservation */
> +                u8 has_clos:1;
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>   		struct {
> @@ -440,6 +442,14 @@ struct xe_device {
>   	/** @needs_flr_on_fini: requests function-reset on fini */
>   	bool needs_flr_on_fini;
>   
> +#define NUM_CLOS 4
> +        struct cache_reservation {
> +                u32 free_clos_mask;    // Mask of CLOS sets that have not been reserved
> +                struct mutex clos_mutex;
> +                u8 ways[NUM_CLOS];
> +		u8 clos_index;
indentation is off here?

> +        } cache_resv;
> +
>   	/* private: */
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> @@ -545,6 +555,11 @@ struct xe_file {
>   
>   	/** @client: drm client */
>   	struct xe_drm_client *client;
> +
> +        struct clos_reservation {
> +                u32 clos_mask;         // Mask of CLOS sets reserved by client
> +                u8 l3_rsvd_ways;      // Number of L3 Ways reserved by client, across all CLOS
> +        } clos_resv;
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 1ff6bc79e7d4..f1a6175930f7 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -148,6 +148,51 @@ u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)
>   	return xe->pat.table[pat_index].coh_mode;
>   }
>   
> +int xe_pat_index_clos_check(struct xe_device *xe, u16 pat_index, u16 clos_index)
> +{
> +        WARN_ON(pat_index >= xe->pat.n_entries);
> +
> +	int err = 0;
> +
> +	if (GRAPHICS_VER(xe) >= 20) {

I don't know. Below is a bit messy with all the magic pat_index numbers.
Perhaps instead define a clos_pat_mask bitmask, for each index?
Then is a simple check here if pat_index is set in the appropriate 
bitmask.   What do you think?
Perhap then, in addition could get rid of xe.info.has_clos and can just 
test for the bitmasks being non-zero with a macro.

> +		switch (clos_index) {
> +		case 1:
> +			if (!(pat_index >= 20 && pat_index < 24))
> +				err = -EINVAL;
> +			break;
> +		case 2:
> +			if (!(pat_index >= 24 && pat_index < 28))
> +				err = -EINVAL;
> +			break;
> +		case 3:
> +			if (!(pat_index >= 28 && pat_index <= 31))
> +				err = -EINVAL;
> +			break;
> +		default:
> +			drm_err(&xe->drm, "Unsupported CLOS value\n");
> +				err = -EINVAL;
> +		}
> +	}
> +
> +	if (xe->info.platform == XE_PVC) {
> +		switch (clos_index) {
> +		case 1:
> +			if (!(pat_index == 4 || pat_index == 5))
> +				err = -EINVAL;
> +			break;
> +		case 2:
> +			if (!(pat_index == 6 || pat_index == 7))
> +				err = -EINVAL;
> +			break;
> +		default:
> +			drm_err(&xe->drm, "Unsupported CLOS value\n");
> +				err = -EINVAL;
> +		}
> +	}
> +
> +        return err;
> +}
> +
>   static void program_pat(struct xe_gt *gt, const struct xe_pat_table_entry table[],
>   			int n_entries)
>   {
> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> index fa0dfbe525cd..fa4dbfd89496 100644
> --- a/drivers/gpu/drm/xe/xe_pat.h
> +++ b/drivers/gpu/drm/xe/xe_pat.h
> @@ -58,4 +58,14 @@ void xe_pat_dump(struct xe_gt *gt, struct drm_printer *p);
>    */
>   u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index);
>   
> +/**
> + * xe_pat_index_clos_check - check whether clos has been reserved for
> + * chosen pat_index.
> + * @xe: xe device
> + * @pat_index: The pat_index to query
> + * @clos_index: clos index to compare
> + */
> +int xe_pat_index_clos_check(struct xe_device *xe, u16 pat_index, u16 clos_index);
> +
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 1f997353a78f..5896a1dc46d1 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -60,6 +60,7 @@ struct xe_device_desc {
>   	u8 require_force_probe:1;
>   	u8 is_dgfx:1;
>   
> +	u8 has_clos:1;
>   	u8 has_display:1;
>   	u8 has_heci_gscfi:1;
>   	u8 has_llc:1;
> @@ -319,6 +320,7 @@ static const struct xe_device_desc pvc_desc = {
>   	.graphics = &graphics_xehpc,
>   	DGFX_FEATURES,
>   	PLATFORM(XE_PVC),
> +	.has_clos = true,
>   	.has_display = false,
>   	.has_heci_gscfi = 1,
>   	.require_force_probe = true,
> @@ -333,6 +335,7 @@ static const struct xe_device_desc mtl_desc = {
>   
>   static const struct xe_device_desc lnl_desc = {
>   	PLATFORM(XE_LUNARLAKE),
> +	.has_clos = true,
>   	.require_force_probe = true,
>   };
>   
> @@ -548,6 +551,7 @@ static int xe_info_init_early(struct xe_device *xe,
>   		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
>   
>   	xe->info.is_dgfx = desc->is_dgfx;
> +	xe->info.has_clos = desc->has_clos;
>   	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
>   	xe->info.has_llc = desc->has_llc;
>   	xe->info.has_mmio_ext = desc->has_mmio_ext;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 1ca917b8315c..1841f2af74c1 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2800,6 +2800,17 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
>   			err = -EINVAL;
>   			goto free_bind_ops;
>   		}
> +
> +		/* check whether Clos has been reserved for chosen pat */
> +		if ((GRAPHICS_VER(xe) >= 20 && (pat_index > 19)) || (xe->info.platform == XE_PVC && (pat_index > 3))) {
> +			mutex_lock(&xe->cache_resv.clos_mutex);
> +			err = xe_pat_index_clos_check(xe, pat_index, xe->cache_resv.clos_index);
> +				if (err) {
> +					mutex_unlock(&xe->cache_resv.clos_mutex);
> +					goto free_bind_ops;
> +				}

indentation seems off here?

> +			mutex_unlock(&xe->cache_resv.clos_mutex);
> +		}
>   	}
>   
>   	return 0;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 9fa3ae324731..47d9d23e0bb0 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -100,6 +100,10 @@ extern "C" {
>   #define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x08
>   #define DRM_XE_EXEC			0x09
>   #define DRM_XE_WAIT_USER_FENCE		0x0a
> +#define DRM_XE_CLOS_RESERVE		0x0b
> +#define DRM_XE_CLOS_FREE		0x0c
> +#define DRM_XE_CACHE_RESERVE		0x0d
> +
>   /* Must be kept compact -- no holes */
>   
>   #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
> @@ -113,6 +117,10 @@ extern "C" {
>   #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
>   #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
>   #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
> +#define DRM_IOCTL_XE_CLOS_RESERVE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_CLOS_RESERVE, struct drm_xe_clos_reserve)
> +#define DRM_IOCTL_XE_CLOS_FREE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_CLOS_FREE, struct drm_xe_clos_free)
> +#define DRM_IOCTL_XE_CACHE_RESERVE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_CACHE_RESERVE, struct drm_xe_cache_reserve)

These 3 above are all related....  can they have same prefix?
For the last one,  maybe DRM_IOCTL_XE_CLOS_SET_WAYS?   Or feel free to 
use other name, but seems best if shares common prefix.


> +
>   
>   /**
>    * DOC: Xe IOCTL Extensions
> @@ -1340,6 +1348,69 @@ struct drm_xe_wait_user_fence {
>   	__u64 reserved[2];
>   };
>   
> +/**
> + * struct drm_xe_clos_reserve
> + *
> + * Allows clients to request reservation of one free CLOS, to use in subsequent
> + * Cache Reservations.
> + *
> + */
> +struct drm_xe_clos_reserve {
> +	/** @clos_index: clos index for reservation */
> +	__u16 clos_index;
> +
> +       /** @pad: MBZ */
> +	__u16 pad16;
> +};
> +
> +/**
> + * struct drm_xe_clos_free
> + *
> + * Free off a previously reserved CLOS set. Any corresponding Cache Reservations
> + * that are active for the CLOS are automatically dropped and returned to the
> + * Shared set.
> + *
> + * The clos_index indicates the CLOS set which is being released and must
> + * correspond to a CLOS index previously reserved.
> + *
> + */
> +struct drm_xe_clos_free {
> +	/** clos_index: free clos index */
> +	__u16 clos_index;
> +
> +       /** @pad: MBZ */
> +	__u16 pad16;
> +};
> +
> +/**
> + * struct drm_xe_cache_reserve
> + *
> + * Allows clients to request, or release, reservation of one or more cache ways,
> + * within a previously reserved CLOS set.
> + *
> + * If num_ways = 0, KMD will drop any existing Reservation for the specified
> + * clos_index and cache_level. The requested clos_index and cache_level Waymasks
> + * will then track the Shared set once again.
> + *
> + * Otherwise, the requested number of Ways will be removed from the Shared set
> + * for the requested cache level, and assigned to the Cache and CLOS specified
> + * by cache_level/clos_index.
> + *
> + */
> +struct drm_xe_cache_reserve {
> +	/** @clos_index: reserved clos index */
> +	__u16 clos_index;
> +
> +       /** @cache_level: level of cache  */
> +	__u16 cache_level; /* e.g. 3 for L3 */
> +
> +       /** @num_ways: cache ways */
> +	__u16 num_ways;
> +
> +       /** @pad: MBZ */
> +	__u16 pad16;
> +};
> +
>   #if defined(__cplusplus)
>   }
>   #endif
