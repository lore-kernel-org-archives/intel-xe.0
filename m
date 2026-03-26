Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF97410AB82B
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 22:32:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7478610EB27;
	Thu, 26 Mar 2026 22:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T1MCPXwi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2240010EB27
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 22:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774564372; x=1806100372;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zBl5vrWy0vGI5mP5QZGdiZJdIRp/qdpV+VPJdKgdpb8=;
 b=T1MCPXwi5lVcAKrxCtUzl6zJRnzz9rhklbqJ1jOm2pCU0P1ymYJVHq9v
 7m+p/jiLazXS/+5RYEt4XWHotgVl1vvDOJkGCMi5xm2BU+8hJ1PCjW0Wa
 GQULeZfXPey/yFDF9Qy4F2PAcR5ohizrN90v2eL6xoWADsTAeoX1mM/bv
 miWepmgGQdbiI9oPPUkXNnKwfwzozhPyxRYB79Wd41jpvL6bs1jrPA59V
 w3iaHHqNjVQOfxC1Esqsjw97RN3uJS22Qx3zsZg92rsemAd+s433bS5OJ
 PdlvE3prk9N7I24nYIlixv/2gfRBv3W8yDZiRFNAq5KDJGpQDyF44g9uv w==;
X-CSE-ConnectionGUID: dVcm6zt8SYG7w4LEsN9jyg==
X-CSE-MsgGUID: RK4AOJAITrC3G61Z0cysAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="78233161"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="78233161"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 15:32:52 -0700
X-CSE-ConnectionGUID: EyjYxDUkSzaEgWlpM3qzzQ==
X-CSE-MsgGUID: /n5aATunQvK2LXOemjEPjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="226769816"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 15:32:52 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 15:32:51 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Mar 2026 15:32:51 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.53) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 15:32:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sa3mPmHgz0v5KvQEMz5BX6IZufjtLLiRvm9M3oFUG7WRjMCeU4+LdRa5C8WP7Z0eZX0bZ2JSG2O0Bs4joAE48/tK8Of8IuE3S3nTAfg+QZNx2s0D6Ri9ZnxQewDGvtAAmKX5Vlp5xJrU702ft+kMymJCl2lRjoQLltqeQwqvRvp1zXc0vyhkShzgEOwvkGK7Jl1oBiLOHQkHU6OyKuktQTn662UU2aSp1Xw8WxPMtcUPtnYRxCNp2BsKy61Rdk1ZKcA5w3qw1e0une19GUmZZNnWGtJ8x2B36L+mn9a4t1Y2B+3h4zSrbotKFpt3XS93bXc5sRWwdxMl11zJyaeW4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7yJ0JXzo4vnrTgkB+Z49G7WczsSoGXFkueM9GJcQXC4=;
 b=MxAjevhEG50tHm/iTZvS/gY9JGaaPR5yxbX0ROIr5HOoc2Oz8nOqJV6/JaDsfT0lTsEb4RrpIEMgc2cmQnS4BPpzzKBdnRib1T+V891jaDlKDz8l9xU4pAWvHAkroQ0z9PGueaao6d/z56S6ICs0thDA/TIiADOC1NUKVkT0us8twiqu+JXF1di4lsN6Wm5koMobV7Xhsi9tCdQ+WQuy5wUOnE2Bj29aHeSHOu6+W+KBkrG7or5lp6cqYteOwdPL7tCEgVAMrNQd28WSsj0RWUCXrmWJDGr1IhKFmWSEzRvj7P9R+FvIwEBAbj3TouOujv2Ki9oXXqgf3+LpQNjcpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6683.namprd11.prod.outlook.com (2603:10b6:510:1c6::9)
 by PH8PR11MB6729.namprd11.prod.outlook.com (2603:10b6:510:1c5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.6; Thu, 26 Mar
 2026 22:32:46 +0000
Received: from PH8PR11MB6683.namprd11.prod.outlook.com
 ([fe80::a62c:97d9:446:ccca]) by PH8PR11MB6683.namprd11.prod.outlook.com
 ([fe80::a62c:97d9:446:ccca%4]) with mapi id 15.20.9769.004; Thu, 26 Mar 2026
 22:32:46 +0000
Message-ID: <af38ac06-e332-486b-8d02-bd566db35916@intel.com>
Date: Thu, 26 Mar 2026 15:32:43 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/ggtt: Remove duplicate XE_GGTT_FLAGS_64K macro
 definition
To: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20260316222723.1722591-2-shuicheng.lin@intel.com>
Content-Language: en-US
From: "Bai, Zongyao" <zongyao.bai@intel.com>
In-Reply-To: <20260316222723.1722591-2-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY1P220CA0020.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::7) To PH8PR11MB6683.namprd11.prod.outlook.com
 (2603:10b6:510:1c6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6683:EE_|PH8PR11MB6729:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fb52422-ecd3-4ab1-a925-08de8b879a32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: oxVSdcu8DbahREYDS/O2dpRaRFxiRcAYgeLTrACOf+83B1F0DJBN0+AGAdrYWN20hMx1oYd1MJMz0N5g+lECOg6W5OOu3csO0zJLE1g4Q2OlUQ/QZwo6t6jDOELbfivMDBpfVVyXeN8GMmYe7mgX4ffsS6B7INvzxTRLVN50qMez3N6+zAXFcjIpXkgVdrbGfq40Pp5exZJesokut0glHiEKev4mYkdxei/jI7aWzOdZtEaHnkdDV+kgoZLZMKlFRMql6xz+7fM6AB26SqIyL7qQ4cCXaF1SYIcFSktZL9xfzNggVfMKyM+a41y2lxPqpyCM2qPFKJ8zv0fW/r1DsuLA4W9zVBoB8hQLDclhH+HmZUA6IY3lYSsqNfGEiBc6kP0sXXMeSzCtzGjnr17UFNE0JuSAJKBQqXTtlphDKyQndxS404bsqdQAyJJ2Zn73lvmpRZ2ET8eeYH42Ant8frjmxAhKuBI90ECfQ6wbdWfU58pe3cDn8qhT+XGNVEPMxmiz7GDDvQdGk6pp7oJAOcduIWpvMfB9HCvKPzVz+QRgSmFR2legsPLBsKLpN+8qQONxELBM8l1/nlvolG4yNCqJ+OuZKX0R9YhhGruPe/GR2WmcwFvdRMUJ52PwIZ4jen68NDC8Nd3iLyUKNOttsvFNYoOyJ/weqrn6XX0ye0niKlfu4VWdKAP4csPgKZMQygxXStAmT2IRqyCFusnwG95/SU2Bdmxe8Y2n69x4Fr0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6683.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHVXY3ZuNUVpVnBnRzhDOGVDaWNDNmVSdUVFZmlzWkczdXhTV0p4UFVScGJh?=
 =?utf-8?B?b3BxdGNkc2NlVlhUZ0lQMmNhSVBmbWpSTmFNMDltUFdtTmp2Q3l4bzFMNHcz?=
 =?utf-8?B?UnFkVlFQMVNSQVhGTmE5NjBDcWZXTUJVa0hXVWFzMys5WGNIK0Q3amNad0N0?=
 =?utf-8?B?YUkyc2xwT3lNK3lvdzh0RGpBakV3Skh6aHdoYmt6VUF1S2txUUVHZEZHN3kw?=
 =?utf-8?B?N24yM3JncU5jQTkyRTBVMU1tY09vcFBUUjhMby9hUXMvaFI2WTZIaElla3Zt?=
 =?utf-8?B?dHVNREIxRlVkSHRXdi8xMlZXQk9iYzNIaWlmY2M4VTNSSWlpMzJjMlFwR0xG?=
 =?utf-8?B?VmE5SmUzcmlwaktRR0NMMWhjaUNrTkxXUVVFMVJGeTZoZUttYUt3Ukl6RHRt?=
 =?utf-8?B?KzlKc1dWYk1JWTdsalNmam1DOWk1ZndGa0dVNkJ5eDE4OWRRR0EwQzI2UEZR?=
 =?utf-8?B?b2NhUU1PSElPSnpROUZLYzJLTGNWQ1ZsS25XV1E1MFpXR1gzVVpRWDIvWnFQ?=
 =?utf-8?B?YStwVzE4OGFqSW4ya3NFOFZXb2tyTDVaNk42N2xKQU93UDhKUXFrTFdwY2xB?=
 =?utf-8?B?cGxhZTlTTko5bjhwa2pKOEFTV0xTNVlZMHNzbmw0eElZM0paSU9FWGtKbnp5?=
 =?utf-8?B?Szk2RU9UT0tIOVNKbEtRQ0lOaFhrVDltUkpzUjFVcjZ2R1MxODNCL0pYNVdl?=
 =?utf-8?B?dUgxU2R6cjcybWdVYXoyNzR2QnVWcDYwdzBVcTFWWERVQXU2ZDhnLzE0RmFN?=
 =?utf-8?B?WFZiZnZ3aEFONVlLZytHS2NJMFh2VHduSDR5Q0R2OTZkYzRlYnFoVXdCZkp1?=
 =?utf-8?B?UytSdGFrNXZKOWRYWHhiNFdmNWxUZ3ZzY2NwS1VidERoWlk4QVNETENZaFpt?=
 =?utf-8?B?Q0ZUZXYrSUs2V1Z4RWJXaG1Cb0FQZ1o2WnpNMm5rYWZzNlJ2WVVlNmlZVVBi?=
 =?utf-8?B?OGNRZUFEYWxFUFhmaDVUdkd3NXV4clo3S0xOZVdhb3hmMnN2akpqOXVwZ2Nh?=
 =?utf-8?B?YmEvQ0lZS1JvQzJjbDhxMnhoakFTTlJrSXJnUEJlemVkc24xdUhJbWNES1JM?=
 =?utf-8?B?WGorclkrK3hBWVVNVXR3OFdNclUza05FSkJqNGcvVkpDVGN6VGlHMzVBWEtD?=
 =?utf-8?B?eXdGbWt4dFJKNXlHS21idWMwSUhZeGdCMkhmeFRHZzFLR2wrN2Qyay9Hb3NB?=
 =?utf-8?B?ZWpZZFpWMFJZUVNZSHlWRXVFRWpFaGdYdURNN2xFT0NqZ3ZMM0xLM3pvc25j?=
 =?utf-8?B?R3JlclV3VkQ0Y01kZmMvT1BkTlVFZHpmaEJJUk96QWpZdGtpL3RCSDArSTZm?=
 =?utf-8?B?MVRTR01pTFBTUUxBR3NpSFh0TlgraExjYVhYeGtBOW5oQU5YQS9lR0FXRnNp?=
 =?utf-8?B?Tk1hQ3dUZXhTU1g2NnpTMjJIZ1FNVXhwQ2hVaHBSTHh4Ris5cC9GdldidlBF?=
 =?utf-8?B?SEptMWVTcjhkc2x4enk0TUw2TmgrbFd6Tk9sZHRRUStVcCtaY3FqUXl2bXBD?=
 =?utf-8?B?WnJKVHFLbkh4OGdIdXpjRjRCMGFYU3VrenltSjcwVERJcFdwYW1LQ1d6Y3dN?=
 =?utf-8?B?N2pCbkdCQUtIaUhQWDgxaTFXbzdKSlAzZFY1cVBwUnhYV1hQaGhmRDNzTHR0?=
 =?utf-8?B?Y2UrckNvL2dhS0FYazh2VkppNzQ0TEdLOFdlSkQrL0UrcjRIY1hBUk1BbDlS?=
 =?utf-8?B?Wld3VnVZdHBadnB2dmRwUzlIYnE2SHdXNVlJMk5WYk1SL2g0UzIwTWllNk9Z?=
 =?utf-8?B?UnE4QW96MjQwbjM0aUMvUU5kQ0lMUHZrenY5ZW1GcHJuSVFpVUFiVmREM1lh?=
 =?utf-8?B?NE4zZ2E3NkpkcHVIS3h5aXk4aUNVblFwMWttNXpVYlE2YnpDUSt3M04wd25i?=
 =?utf-8?B?a0RFTllVQjVxdk1MSmdPTHhLMlNSVHBvZFJaSGt6RGsxUmZCMnIyQXdqbEEv?=
 =?utf-8?B?Y2lYSjFSRjQrS2ozQnFwc0krbjExUjk2VHp2YUZtNElTZWtyVkxXdGMrWE1O?=
 =?utf-8?B?R2pQUVBnTFFhTi95YXBvQXY0YkNLS2FxclE5dTVRdzBDakpqY0hTY3pMVG1x?=
 =?utf-8?B?UkxHekVUaGtZRWtFdndvRWlaM0lNcHAzMDM3RktRU2dKZG1nUFVCdFp2VStr?=
 =?utf-8?B?cHNqSkNMTHhwUFVQdGd3NkgvRm9zRE1pTXdCZlMwVTBRRmJLbDhQQWpIc2xx?=
 =?utf-8?B?bjZOTnk5R00xSzZkUDJmeFdmdGxTdkxLK3gyRWhpQTlWZUp5S3F0dXRPMTlL?=
 =?utf-8?B?VExjZllsdGp0Ni9wcXpHYUpNd2l3QW5taWZZcm56TUdYcjBGQ2UxSVZObGFk?=
 =?utf-8?B?NDhlWFNWV2NHcWRKdHpxZnVkSUNpcHI3RjFIQUVSVTh3eVNJNGM2UT09?=
X-Exchange-RoutingPolicyChecked: rEQi1P+YiEMJscvVrmKsNj2ggs23n51ByEHlXkY8bWccLydJgAFF0h/dwgucODHWjOFCwZmc66l3t9X7zKTlUnk4tpaeKdQNhRLOiFmV1PRSw1DRoA1M/VMDZ8t8Macw+rK2HgdtHcjQBix1sxMd4lFqM4elX9uHPtHOXEcSAcPNHNm6M9EicTfCW0bzfUM4acuETlFrRJM2Q/qS+OtMQzIoBj1MjbQ5A3QMMnRT4vpBPagXHFvGns1nLmN2z4JY/hHxIszzy/6fmQNfV7bOHYeeZjZCW73QBb86+IimZalyQKCxi9/HhlN66262BWpsjhLrMbuFFKfA5B9XVx4T8A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fb52422-ecd3-4ab1-a925-08de8b879a32
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6683.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 22:32:45.8460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dttl0HCLShcw4mXRTG/lmzShR1JtP1QqMMzD3gyzaS+or5AGhbHnM5AN8eC1CDFPLuGDV5U9VN9UMBjSFSV2eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6729
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

LGTM

Reviewed-by:  Zongyao Bai

On 3/16/2026 3:27 PM, Shuicheng Lin wrote:
> XE_GGTT_FLAGS_64K is defined twice in xe_ggtt.c: once at file scope
> (alongside XE_GGTT_FLAGS_ONLINE) and once inside struct xe_ggtt. The
> duplicate inside the struct was originally the only definition when the
> struct lived in xe_ggtt_types.h, but when commit 4f3a998a173b ("drm/xe:
> Open-code GGTT MMIO access protection") added the file-scope definitions
> for both FLAGS_64K and FLAGS_ONLINE, it did not remove the pre-existing
> one inside the struct.
>
> Remove the redundant definition inside struct xe_ggtt, keeping only the
> file-scope pair at the top of the file.
>
> Fixes: 4f3a998a173b ("drm/xe: Open-code GGTT MMIO access protection")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ggtt.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 21071b64b09d..68d54ddfcdb1 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -115,7 +115,6 @@ struct xe_ggtt {
>   	/** @size: Total usable size of this GGTT */
>   	u64 size;
>   
> -#define XE_GGTT_FLAGS_64K BIT(0)
>   	/**
>   	 * @flags: Flags for this GGTT
>   	 * Acceptable flags:
