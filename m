Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3139EF8E4A7
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 05:04:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D8C10E11B;
	Fri, 17 Apr 2026 05:04:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QaznvgxF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1096C10E28E
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Apr 2026 05:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776402269; x=1807938269;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=28sYTkBdAOd5BMcXKvmpqlq46OR8aVXTyVB764DbELI=;
 b=QaznvgxFVUsof1S5R4U2fkouuru7GkUMwS6dD2OFN0D7ojIvqqMAQbYj
 EMlcFxAbXdbjh7FVuI8WDDTgUdYHtPrv8bTvhjV8+VMrwZyaYS6s+RogT
 rsi0MGpELm34ALGSB+OJ4WypCOfdc1CmvZwpMZa8ju3jZxaXSJukpCA+G
 yFyUXuYnIC4RPdawZNpLxb3vI22tdlUKHf8nw4709u4L98VYaQ9CJaYJD
 xmZFknkovp/Lb6XOPd1iZzoJNN9ZthGE63FjrJtl9falbP8C2OPuKBEor
 XZtekQjmhh92qTGvLdX0+oQoSJeXmilmbh4iuBaCVcYhx+mR/7PiE6ORU g==;
X-CSE-ConnectionGUID: jhrofAEGRu+FnjCm0rke+A==
X-CSE-MsgGUID: WwPAn5FGSxGNwjdZ/ubqcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="80002176"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="80002176"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 22:04:28 -0700
X-CSE-ConnectionGUID: 8FAjkq7JSYyuFKPWMxTLeA==
X-CSE-MsgGUID: rohDZ9vvQr64uvCjhqzWYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="230858910"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 22:04:29 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 22:04:27 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 16 Apr 2026 22:04:27 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.2) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 22:04:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L//vokbXWDgovqp0XNaDV82bcHZa8eFihfq+Uv2D+OgoXJ80lN9uGKHxtRbSm6/LbtBqyF1ruV4KmFCE37Z0CPJdvXgmUR/ZkhwaHvdD3ETacwSO3D2pcMDQNveUICTFzZ2kFAv0KLz76XdVMXSYlScmi/a6JJw0Iyv72fI5d1g3/KJ7MmDXhupWLWZAQsdm5p5jshPO9FJndIwgyBsD0ejxSK2ZFX7tdWhq/eymfCnS/E4IV/PC9lo/fxOUKIaZb6IAwtx5JSvuhcR0utj4W9n2T5LzGlO7qn0F8Bs87fRPF2S6ih5uUjO3Q2oLDEuuAs06r9lfnHCRnlpEOaGjvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FDirSwEUJY00PaMoTB4m/22TEg65fFYIr74gy37KN9g=;
 b=b1T7pS9juSoL02ZNfZD1+UAlT+mP/NVRy/EhBexrahLibf3zgyiVtZIJV5jL+4Hj07jUtSXQ9Nt6sruSHzVLoNfTBwKQoLup/KCrPs0sN0mlmiNWZc7whr9aG5nj30MSoeE4p+Z20zaf+lS3mBJ2kZGpGipoGi/ehijUsSbc/iT+Gj2Qb3b7Kt6iARdCd9Ge1pq3M9MRr69Q68ZrbF3Od41FGWDCcq3ThOxHngFi/JrL9n/w4iAtown2gTb/0BSww93jRuE7aHSpT5Q6GcnsIM9UEwvcPe8oE2Bui521ouXeOBd4UZrgmzaex1E/p/09khEiXnAKTleiO1p3LIvwsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by LV0PR11MB9789.namprd11.prod.outlook.com (2603:10b6:408:385::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 05:04:23 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%4]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 05:04:23 +0000
Message-ID: <8938830f-0f21-4c43-9327-002383399d78@intel.com>
Date: Thu, 16 Apr 2026 22:04:21 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Drop skip_mtcfg descriptor flag
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260416-no-skip-mtcfg-v1-1-c8ea26d81530@intel.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <20260416-no-skip-mtcfg-v1-1-c8ea26d81530@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0059.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::34) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|LV0PR11MB9789:EE_
X-MS-Office365-Filtering-Correlation-Id: cf201b4b-423b-4695-958f-08de9c3eca97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|42112799006|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 0JzI5S+VmSXI2tWobQFUG1lf5fSDi4GEKKZvqRs3PA0X5YqM7KLVCW3QzVEoLG3J/caBzTlpZxe0uZXwMSnt5E0MJI2zr1oTEhz8vl1PupYuyKZdr9caEQcp/Hz1mWSTr3eIz7CcEXrns4tNPKBwT2IM+V+8aO3ErHrGaHmZq1R+8AQHScthywBQTbrg6XKhhIpbBMH+vx/bj0TymKRl4BBLJKgPNOfCjxICEmYgUWUS97Ay6hdxZNi9OJ2EfyUwQnYAXQet5iJyP8JRkICB96qAoAjspyAOCOSP633V0dvTChwGJdQBhyj20D198/0oiZd2qX9DTVPUY57RS49C0x163LVcapC883h2k4DQ3MwWzo/sp0DWBF9aHtdOvlX8lJhohRdOQ29sUWjV06qoNFhNa7IU05SshARd/VmFZ7vrSQ4OKDzMQpnovUAtdek+v9lKWvK68i4Rt0tHa884l5cyD3e7It6IqDj4jADMA+82t1GX4g9EemaVArId4Sn/3EUq3nm3eVzM4v2jW/vpqLS9wl4IP7es9OwWoAnrIhhOteGfo3irMCgFnjAKCqoXe+EsjQICBZ61R5UOTdobVtWB+vvTbyP07RyVVssFmL4s5pfajWAdt9xKGJ3BIjBi0y70TYwykFgWwBz0RhnnX6rD+8la/PCqR/ujce0SSG9kdcoZRCBDKUudz1s4e9M/VAZ6Aw8slcy08rK+PHeSDhXC5AbyYIXuRXjAaxHfZU4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(42112799006)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVpnMjhOWW9Kby9naFg0MXFIRkVrdFlIZGlybkJPTjQ2M3drQjFDNDVhcUtr?=
 =?utf-8?B?TFZCUVppR1VJZ0F2UU85eWgxYm9lTzAxWFcwb2dnMWw4dTBVYUd2a0VzOW1r?=
 =?utf-8?B?RXBSbmdLcVpRZTI0c1g5SGxtaGNKTk5xZU5ReFluSnhZZng2OUhNdnhGS0ww?=
 =?utf-8?B?cW1wbWJZOVRtK2hYTzhRRmFHbDJKdlBTYlpHd1RkRWFwV1h4NFlDZjkzKzhL?=
 =?utf-8?B?NkRvUEorK2lUeDdubTNpSExKd3RML3M1cmZxdnNWdFpuazA3QXF4Q1RhOW1w?=
 =?utf-8?B?TERFY0c4Z1hwVUhML0lCV0RnMVNSRWd1ZkdxcDNFUk1NTkFyc2RUM3VrZUZM?=
 =?utf-8?B?VjhzUVpqbUlCTVgydXZnSTlpNDJneS90N0RjTk90U3RFLzdwZ0dTMHM5cHo2?=
 =?utf-8?B?a1lrRnQxVXQ4V3Bqai9HalFHRURqQXBHN01tdVJkbGExNUpiRGJpWUNLTzhm?=
 =?utf-8?B?S3BrRjZhK1dmVGVQQmc5akt6SEIyWStORlRJRU5Vd3AyNENxMkNvS2d3Y0Nh?=
 =?utf-8?B?STU3TUhrNmV6Q0hvOWI4MGhmM05ZVkNPNGd1Q0hpV0ZPanV0cDhad2pjdUJI?=
 =?utf-8?B?ODhJR3ZROFBjdWxLSzlEM1RpbGJ2cFBNVEwwRzFNZXUrNE1NVU9qNHBOeXNp?=
 =?utf-8?B?c0ZmN21RNlJvcFVvcG5xcjRYbXNUV0s5QjBNSHlYTmFvRU1hWVlqSUgwL2Fu?=
 =?utf-8?B?alFsQTdDYWNHQURwSE9OZUJvaDhvU2dPelpSNHN0bVFRWDdaOWorQXlHME1n?=
 =?utf-8?B?ZDdYeC9zSFlvL3cwTEdrT1VNOTVLbk9Nak5ySkd0VXkvZEpjdXBwRDJHRlFM?=
 =?utf-8?B?N2VBQzFzUjg1a0VISzJFZUNVU3ZvT1UrSytSYXZwTUlEU2Myb3RsSklrSXdJ?=
 =?utf-8?B?c1ZZV3V4V2wvanYycHRhbWJobjBvSkxJWS9EOFBSRnpsNElpNFVhNUIzTGNV?=
 =?utf-8?B?cXFzS2d5Q0xYSzF4aFV4OFRMQnkwdkFHSVJwRXRjWmpEaXhiUzFJVW5HdnAx?=
 =?utf-8?B?MzBjYnhGM3FFNEg3bmdFSjF6NVBFUS9ibGtCWDJGS3BXdXJoMjMwYjdnQW5P?=
 =?utf-8?B?a09valN4eUwxZE9xYzYycy91RzhZaERTS1VXMmtrY08zU3hDaUdMcjZrbGZK?=
 =?utf-8?B?Q0VXbmc2bitISEY5V0Z0N0xKQ3lWVWRLeTlsWGxLdHVITVZUY2g0aHdmVW14?=
 =?utf-8?B?bWdWbUhNTU9rT05FZi8zRmtLWDVQdzUvQXgvK3dEVFFpeUdFUkpwaWxIY29k?=
 =?utf-8?B?aVFRMGoyTkE2STdXRkc1dzZiSWdrR012L0hMODlmVk5kYzEzRFhKblN6aGlU?=
 =?utf-8?B?MU5yN0JvaFc3MW9sdjgvN3VYTWt3YWhLWWRYMzhhVUxXU210NHFCQWtVYnls?=
 =?utf-8?B?UXV4SU1aSnViVk82cS9UNGt6cW9jTUczRVk5Vndja25aam1oTXVOYnhXNWhp?=
 =?utf-8?B?SkMvb0hDZDU3K3UrVXFkbmhoaFUxSENLaDlJWDVhNXI4ME1yOEh4NHFsRTdr?=
 =?utf-8?B?aDV0Tnk5cVRvc1VybVpmTzlSRDFTWDg1UWlTRVp4YlpZODRGZzJybitGM0ZP?=
 =?utf-8?B?TUx1RlNxd1JlTDF5QlRTSGgrV2pZZ3VvT1NaZ3FvOGgwWU96UUx3aUk1THRF?=
 =?utf-8?B?bms5OUVQSXB4QjkvQ1JDTXUvTkt2SWI1WUU1WU5QYlN5R1B1eVdhWUVqU2sx?=
 =?utf-8?B?L0psZTRZR3ZJSUkrdm5teGltQ040VUo0ZG9vNjA5ZE8ySU5WeDlzc3ZIYlBN?=
 =?utf-8?B?MkFWNzhsQWtSVEk1ZmowaWVaeXZmeHozSVRWVE00T01YTVVDSGxabEQxRDRh?=
 =?utf-8?B?WDhDT0o1c2ZFSGdxRlJOVUlNYXBFMGQ0SXQyRnlmZkI3OFJXeCsyWjVDNXhH?=
 =?utf-8?B?a04yOVVqazd1YzNxT05VcFpSSmduMXdoR0F1SnhQeEZIVlJPVThsV1ZYemVY?=
 =?utf-8?B?cy8xVGJKWHJsZXl5cCtpSWVsYWFaQ3RPS3hMNFJiTXh0elVlZjVOSVhieVZT?=
 =?utf-8?B?Q3d4SE9pSGNJajB4NTFqRkhvWW9JSVl6RWE4QkFMWXZkSTdyNlVNRHFWTWFW?=
 =?utf-8?B?SWk4ckNYbWRSbytmYXBCR3BLQWZ6Vkw3NStrWlMyY3VsWExudUcxa05ZZUhl?=
 =?utf-8?B?bFBSYXl5Mk0wR2l4RGMvbENkWWJIL1RtSXJ6Z0MwS05LWmM1TnZaSVc0TnpT?=
 =?utf-8?B?NDJOQ2ZvTDRsdGwyRmRqRVh3OVEvMjdOaVJrOFFDZTI4amJzbnhVWW9teUhO?=
 =?utf-8?B?Q3hDNk1IQktKUHpOUFRWVExNUkQ2aHF0eUZEYUdqdE5UeEV4b0tVY083SUk1?=
 =?utf-8?Q?tg1ZEFsEI5Sgc/h4Q7?=
X-Exchange-RoutingPolicyChecked: OyAcOjcf+22vmT4xOFCYD1vVEFiGjrM/nDBVHhf7fmrSe/q8lNyB9j8/+KZ0E4DSDmW7zdgWjigp7YpMS+dJJpjsdWtPSYbCRY+rio6EPdN78yVKXT2SFFciNTJ3nbgf4kHKNhGv7JQoPggIvz5fxj8hUghyAOnfQjBFctzRbERJ8hWAbSxUPvBOxPKCKqckaJwsweLF0CSRpNrpc7Z1vdgeFG36ASS9M2ZEW9S+KcEjo21zzNHAx9Q+wmos5/uWgJwJy/VCiLSksVg21VmCRyPjQrcxh2wnTve0Pk3UVaRcUH4ZHX8JFNgY7uO2Ke4LIpX1O2stAvQolmsz94J8kQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: cf201b4b-423b-4695-958f-08de9c3eca97
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 05:04:23.5436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FIZKEIXoDBQRUgPOoeibjKExTrsGShvaTFuZ0EDbcUy0ddC1qDm7t3MmLTfc6uReZ+H4jTKd+5t7sYPQ7MN3jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB9789
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



On 4/16/2026 14:17, Matt Roper wrote:
> The skip_mtcfg descriptor flag is unused and expected to remain that
> way.  Drop it.
>
> Single-tile platforms are already identified by a zero/unset value for
> max_remote_tiles and don't need/use this flag to avoid trying to read
> out multi-tile configuration.  PVC is currently the only multi-tile
> platform, and PVC uses MTCFG so this flag is not set.  The current
> expectation is that if/when future multi-tile platforms show up, they
> will also use the MTCFG register in the same manner as PVC, meaning that
> they won't have any need to set 'skip_mtcfg' either.
>
> Even if a future platform does change how multi-tile configuration gets
> probed (e.g., using some different register), simply doing an early return
> from xe_info_probe_tile_count() would probably not be the correct logic
> to handle that anyway.
>
> Bspec: 53146
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device_types.h | 2 --
>   drivers/gpu/drm/xe/xe_pci.c          | 4 ----
>   drivers/gpu/drm/xe/xe_pci_types.h    | 1 -
>   3 files changed, 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 2ebe33a0dc07..e9e11bb1c65f 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -218,8 +218,6 @@ struct xe_device {
>   		u8 probe_display:1;
>   		/** @info.skip_guc_pc: Skip GuC based PM feature init */
>   		u8 skip_guc_pc:1;
> -		/** @info.skip_mtcfg: skip Multi-Tile configuration from MTCFG register */
> -		u8 skip_mtcfg:1;
>   		/** @info.skip_pcode: skip access to PCODE uC */
>   		u8 skip_pcode:1;
>   		/** @info.needs_shared_vf_gt_wq: needs shared GT WQ on VF */
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 6e560ef84a97..d55e5af4f4b7 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -768,7 +768,6 @@ static int xe_info_init_early(struct xe_device *xe,
>   		desc->has_sriov;
>   	xe->info.has_sysctrl = desc->has_sysctrl;
>   	xe->info.skip_guc_pc = desc->skip_guc_pc;
> -	xe->info.skip_mtcfg = desc->skip_mtcfg;
>   	xe->info.skip_pcode = desc->skip_pcode;
>   	xe->info.needs_scratch = desc->needs_scratch;
>   	xe->info.needs_shared_vf_gt_wq = desc->needs_shared_vf_gt_wq;
> @@ -810,9 +809,6 @@ static void xe_info_probe_tile_count(struct xe_device *xe)
>   	if (xe->info.tile_count == 1)
>   		return;
>   
> -	if (xe->info.skip_mtcfg)
> -		return;
> -
>   	mmio = xe_root_tile_mmio(xe);
>   
>   	/*
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index 08386c5eca27..5b85e2c24b7b 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -60,7 +60,6 @@ struct xe_device_desc {
>   	u8 has_sysctrl:1;
>   	u8 needs_scratch:1;
>   	u8 skip_guc_pc:1;
> -	u8 skip_mtcfg:1;
>   	u8 skip_pcode:1;
>   	u8 needs_shared_vf_gt_wq:1;
>   };
Reviewed-by: Xin Wang <x.wang@intel.com>
> ---
> base-commit: 2a1c604bebed8cbbe6aea00f761777eed424dc55
> change-id: 20260416-no-skip-mtcfg-d6f651d0d79f
>
> Best regards,

