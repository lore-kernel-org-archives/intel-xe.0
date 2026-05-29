Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3570CCD6E4A
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 15:15:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E98841120AE;
	Fri, 29 May 2026 15:15:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dUzhh9nK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 196571120AE
 for <intel-xe@lists.freedesktop.org>; Fri, 29 May 2026 15:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780067716; x=1811603716;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mCIsoO9iy1jHovute7IucbIH1f8Bgd7O23NoDrF1D2E=;
 b=dUzhh9nKeebBCLP9CkAsXs+kvC0IaFU8FPqm+NqpAdN+DcmpO8osOW2D
 THp2KM9hMCpG/tbRS8IPnifilGECPCqvwP8xZ27B8YOwEO1VIQtrC1s9K
 +svSoYcl+xcchKrqAONpcfdT3JURnqjoqksY6u0c8hSsmMxUKwbxhbOe6
 BonsN5PBETmY7gMuXsW2WC9zrQ18nCfy+PJKp9Xq7tgdlpcsaIYg+1hPQ
 EI+O5LLr4Dtfqb+l9Su9BPM5LWlDzydxOCrHuL3KsxlAy7vo+sfYpNcgw
 wXJHCkgnRDzznGhattGeKoeOecRBW6G19eSlgeIYrihUJJ8tUFW/NrbeB w==;
X-CSE-ConnectionGUID: xjezB5VyTKao5i0obHazEQ==
X-CSE-MsgGUID: OkST1u4VRSml8iqO0FbjRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="68457250"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="68457250"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 08:15:15 -0700
X-CSE-ConnectionGUID: qIaU7P0hQf6wbO3f5/A6Fg==
X-CSE-MsgGUID: U5M0wi2OTnuu9RXP8YdB7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="242979216"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 08:15:16 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 08:15:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 29 May 2026 08:15:15 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.50) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 08:15:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oZXnUc31fqJ0uBM8tS9oFzVUU5eGP3zgAJuf5nhr5sE/0xzrb+JoUgebFuLTIByD2osjy6j/8NFSK/+aS8c/UEQKLxy4tsXmevpTUaI/iXKz+laM50K508alUCPjGIXTJeJonGmopdirrsygE4b/2vSJEkDZN6v6/ClFNat6aiZhHd4ZsLFDwUhvTQ+0NFi/VWPkS686qWiPQkzBmLFfNjvqiZLArrmp50IWe+KgvUHyf49RVllb70J+x0ojjEma67dW4hJ0svwGwFRVY1xWrS34nHxF74wJeAOQ6v3XO84M/rq5LdVUolTMYWTgcAjSjNiq/XB1NkJrfSsv+XMyMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mClsYK9gJtsy/yLXgaedTrNHt/EiUe3nFil5ixOQ9ns=;
 b=WipW5HkEH5co84cbhO7SLH+yY44dhluuPzYQBAppRvKQuB1OlbPwPs0Klr5hfS2vSk4MEkEfUS/3kabkfqieJ7wx7T458IEChohlySVmeD2NFULXI2xhjQWl4dm+Gs0/Dbbm++KlH+A12qwAPPu5OmM3UN6Ypslmgk01wekGfsKUqI3WEh1WtGqNVzZLmpV5DbMInlTwiN/KvW61ZaokFFb6fQODt4u0eOvlaGOAlyjTb9Ay4CNJI7oalNZX6hGMWJmVC547TAFaIYjdAJUOnqi+LpzfzctJXmPbO1FHlyJ7boPrpOQgOdOm8WGiK6X+A3Z4TdVxjjkjK5SF2clXCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by SA3PR11MB9461.namprd11.prod.outlook.com (2603:10b6:806:47f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Fri, 29 May
 2026 15:15:12 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%3]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 15:15:12 +0000
Message-ID: <347f5ae5-b91b-41da-af15-2f95889ea610@intel.com>
Date: Fri, 29 May 2026 20:45:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/4] drm/xe/xe_late_bind_fw: Track firmware load status
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <michael.j.ruhl@intel.com>
References: <20260305104441.2857181-6-badal.nilawar@intel.com>
 <20260305104441.2857181-9-badal.nilawar@intel.com>
 <b5a1ae85-f6f4-4088-967c-a773dad9ff0c@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <b5a1ae85-f6f4-4088-967c-a773dad9ff0c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0110.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::9) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|SA3PR11MB9461:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ac7a523-63d6-4a26-638d-08debd951474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|22082099003|6133799003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: MaqluQEs/hpj40vzE7r7Sz6P5tpWY44roWND+2U0eJEgNkvmN2swzJmEeKMJKVhH20X4JiT99OlhysLemkDpSwsha7qtZGPRJrfi6aTwiqvIkvkCDotWJ2z3YSzMN9kfy0pdKr+7YU06DoFWF0g6NxUPJJ5+qhVAM0V8t9yGKV3akx3YcfxsV6Kofhlffgyb9eYdPee7nESkmVWs5tImz0aYTa0/5XS/ctD+hiQVHvB/9jeaIa6o3neXXmW5h+MfhStXNVNEHYYz3RmOCD/XA7UsR1LS36NExtGBpemiw0Wmbepnu0yMXKse9662R0GkSixb4Xl1NXWHOQXPULoraqGx7FkuVYVVLF89hP1Nr2R1P1qKvQDlc0OUpMQVBR7PCSeFsAfmZNZxzocUTbAjY1oA55Yxs03EPybbQmwkkDBJfW4t6ndEF0OfB3kjyzuaqLSe1tTzYmzGpUwx3uGTZawKlhgcB/nqvjogUFDmS6tz0bxCPaYC8Qs/pxt8alYpIbhNZPudX2ys/K/KMNvQnAuLTKaPJAfxXdqfQhqQdZ0VfHCwvkRjP1XuZPVtEJhFbxCslVLEF0sajaWcsxx4l9DpIztHf+ycuXuIvanuHLz1GZ7A+EnvZOAmA/aIUB0rnyizEGDQiXzSX2csanNKONQZ0//8Uaex0FMCjyuw0f+w02zbhcE002u8fQ3CxNcLmCpoA2KundoWIIWPBKEEGQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(6133799003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sm82QitHOW4vVm1IMVhZNnl1TUxDVWNMQUhFY1c2a2hXajVRdlNEYnNNTGs0?=
 =?utf-8?B?ZzcyT2RPZElEWlVyWjFmbDIzMlJjUjBYMVhDcFF0cXhBUEtzNW8vNEVhakdt?=
 =?utf-8?B?YVdHcWRBYXRvcjdvV0hFa1R5TWhnZUl5L0kreVk4cEVkczVWZ1FKNUxabXBq?=
 =?utf-8?B?d2VITHppejMwUllOeEdieG91Vkt2bksvWXNkMlB2N1V2aG9ZSnJ4akdReTRv?=
 =?utf-8?B?VnVadHc2SlV1aWJIeS9YK1RuL3R2VWdGbjF1VUVQUWxvOUUxVTFYZ0l3ZXI4?=
 =?utf-8?B?Y0R5YzBKRjlwNWgxaEFJUTZYUVh0eldudU9HY1JJb3hUdCsvZWFidjdOS0tm?=
 =?utf-8?B?YlVQVUYzcm5scjBGc2ZTLzF0Z1VZb25LRnRkYU1UdGlYZGNCR2pFS3RVTXdR?=
 =?utf-8?B?ZjNRZjFEQUNwODFwcFE1bmw5Tzg1RURDSDZaL3l3ZldWV0pmMEMweFRLTEth?=
 =?utf-8?B?MG9sWmltZVN3NzlvNEI3KzFmakNEZk9YY1FJWG1DamlPSnZaMXlRSHRmT01T?=
 =?utf-8?B?VEhNOHYyaGc4Y2did0kyL3dCTGwzWitMK0Q0ZC9PeXhFdStWRVNQQUZUd0RI?=
 =?utf-8?B?M2x6a0NWZ3pxeGtKcnlkc3pFWU5GbEdCSFJyampRZzgxS2RBQmlPbVlIb0xK?=
 =?utf-8?B?YWp1SHV5bXFaaWx6NTVjT0VkZllRSFh4UzZQRDVXS3E3UDM1VEVXZEEvMW1Z?=
 =?utf-8?B?b0pib3Y1dFlWSnNSVGN3c0IyQ0ViL2lqSW84a3ArU1A3QXBNREdUNUtmeloy?=
 =?utf-8?B?SXdIdkRZMVRXTnkvZUJhNHFnRFV1a1VzMm5oMDNOYTU1bG9XdGhpTHVXazNC?=
 =?utf-8?B?ZkhzRW5wN1hsS0pmTnZVNkx3WjlNUGhFL2FKWUV6dUdnNkJUUWZNcDZheUFL?=
 =?utf-8?B?bTRPczVpb3dDSDM1YjF1NjE0QVJvcktaVWh2bUhqQUxLaGtCVWZMUE1IWTRl?=
 =?utf-8?B?TGs5eHZKYlhvcjZ5ZFVMZEdEMjJDS05BZHVtYVJPNVRnOGhraGE3UTBDV0tU?=
 =?utf-8?B?Nk5ybkpEbWxIVVZ4UEpOTnFTY2RVN1ZwSXRiOUMyRlZ0dDE1VGRxcE10V2FF?=
 =?utf-8?B?Tldoanl4QTdQaEFEUm1QQy8ybWUyYVZWVFU3MHlMZFNZVW9RWUJwQXFMaEor?=
 =?utf-8?B?TG9PMEorODBkT1kzNHRSS0hNVDE2a2grQk9uc1hSWnZ6OWNXSG4wSHJOZE1H?=
 =?utf-8?B?QVJXKzJRNE5PZ0hKcDM4ZXVKbkk3U2s1d3dRMVJjemRlNlYwb3BxcmpyZWha?=
 =?utf-8?B?Mm5YR1lGVWNLMkY3ckRMRVpRWmpzdEYraDJuVi9uQkJtMDkyNGN4dVRwNmZk?=
 =?utf-8?B?czd1Y09NTWNJUVNQUEdjeVNUZ1dHVE1tWVRKRldmd3dLT1RnZzNTOVNHUXVE?=
 =?utf-8?B?N256RFhpQkdTZkNhcTNoYzZ6VmYzNDg4UDZMU25UajUzTXpQYjVRRkdqQ1p1?=
 =?utf-8?B?M0I5cTZoNGE3SitHdkQ3b2pqbmhCa3FSZVdFWTJNTm9jYjBQbUlrVEFhcXZi?=
 =?utf-8?B?ZHhhRi84dmUrOHZZb3FTM2o5L2NSY3VNYXNNWWJGa08zWGdmbjY0TW5WYnlp?=
 =?utf-8?B?cjd5N3dqSVJ6TER3RmJaMmZYbmdIaFljeDNMbjEwSjVuT2Nsd3JDWTFjcHdh?=
 =?utf-8?B?MFUvSEN6TGhDWDhma0FYbzRobC9aanVuSjUwWk9Ia2hFRG5DMC83Ukxra2lE?=
 =?utf-8?B?bGFwRFJEZWRLNHpBRkV5K1Y1cWVCSzZFK0pZWWRSU0pZem5rd3llUk9DS1do?=
 =?utf-8?B?SlhEUW9FK1oxYlZsaGpPemhTQ0x3czJlTEVVNyswTG4weWlKb2RIckE1M0ZD?=
 =?utf-8?B?L3NyelJTYXZtdTc2Qk1JK1pRRVRJS081dXRzenNTWkoyOVZZQ21iaGwvSWJy?=
 =?utf-8?B?dFJHQ201MWEya0hkTXcyQVQ2Ti82b1ROYS9USm1XWkZGbjBlMVFkUjhmWmg1?=
 =?utf-8?B?dCtyYUtlVTU3VVFEOVF3Y21uZjA3NmZoNGpIL2UwWGFFNHRibk90THFJNjdn?=
 =?utf-8?B?T01hYWh1ZEZQKytKMWwxT09YMHNaZ21sNkMyZDU5WXZjOWVJVXY2elJnalFD?=
 =?utf-8?B?VWhZQVlSSjRWdTRMMmJ1dmpXelZsQk9UZ2kzd29iK3doQlZqVGRETUpJM0p3?=
 =?utf-8?B?dUxpV3JidjBxQ3EyR1FmdGNUL0pJU3Y1alNscTQzR0FlZjFzZ29wRm95enZR?=
 =?utf-8?B?NUNJcnZveEV2eXpUZUNiaXVsSmxEaFlkcm1JQnk5a1FmQjFCaWN6eGlnQ1Ar?=
 =?utf-8?B?YkhrUnhKVjNTZ2wrZ0pJYzVDaVkrU0NRZGVRQU51WkhqS29kakRneXl6RTB4?=
 =?utf-8?B?NFk4TmQ0NXQzNHgzcnhzYUhwNWcxcC84bnorcFNMVjgxdjVFQ3c1Zz09?=
X-Exchange-RoutingPolicyChecked: fUd3HfpQyrNoVdfllIxmF19zyIjDeBMncW0TuxMi6qgcaV7yW4cNv1uZCSDqP7aUMtY5Hqwv8O1Nz6G3Vgu9kkIbOKKPsS/cXT8DSTPFvICq4E9vSbenri6lgD3fA2FSXZwuCAiqQGOI4Q7mHAlxXKT54QVO5ES/DVO9J8tM+V4ay6h3SwToE+gVA2LeA3GfnFUHZsTfhYakStNM865e7ZaXSCNRSm3p9bzZ3HEC4mZs7mY1wivCeWQ6w2Pp9dSCBCrdRl0aOCugFc5DFhtnMKDcgCKFVMTkXv5+9P2WNOJjUJ9LUHF37aZKzeMMFhhBebUZ802Ode1g/h4ZyuZM9A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ac7a523-63d6-4a26-638d-08debd951474
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 15:15:12.7231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RE8RWk7p+cCQP/YS6hz8FVZuQb/1lgtXvyqZC8qjpXpQ4jpFvl/CqX76vv2CcmP9sDfIeTC3krjeAHHSydvdig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB9461
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


On 06-03-2026 05:22, Daniele Ceraolo Spurio wrote:
>
>
> On 3/5/2026 2:44 AM, Badal Nilawar wrote:
>> In CRI, Intel PMT depends on the ocode runtime status. Track the
>> late-binding firmware load status and expose an API, for xe_vsec driver,
>> to query it.
>
> I think it would be better to send this patch with the series that 
> adds the xe_vsec changes, otherwise we have no idea from a review POV 
> on how you plan to use the new exposed API.

PMT will be using System Controller mailbox to check ocode status, so I 
am dropping this patch.

Thanks,
Badal

>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_late_bind_fw.c       | 68 +++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_late_bind_fw.h       |  5 +-
>>   drivers/gpu/drm/xe/xe_late_bind_fw_types.h | 23 ++++++++
>>   drivers/gpu/drm/xe/xe_pm.c                 |  5 +-
>>   4 files changed, 96 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c 
>> b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> index d3ef2926517bd..87137d6e4aaec 100644
>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> @@ -53,6 +53,32 @@ late_bind_fw_to_xe(struct xe_late_bind_fw *lb_fw)
>>       return container_of(lb_fw, struct xe_device, 
>> late_bind.late_bind_fw[lb_fw->id]);
>>   }
>>   +static const char *xe_late_bind_fw_status_to_str(enum 
>> xe_late_bind_fw_status status)
>> +{
>> +    switch (status) {
>> +    case XE_LB_FW_NOT_SUPPORTED:
>> +        return "Not Supported";
>> +    case XE_LB_FW_AVAILABLE:
>> +        return "Available";
>> +    case XE_LB_FW_RUNNING:
>> +        return "Running";
>> +    case XE_LB_FW_FAILED:
>> +        return "Failed";
>> +    default:
>> +        return "Unknown";
>> +    }
>> +}
>> +
>> +static void xe_late_bind_change_fw_status(struct xe_late_bind_fw 
>> *lb_fw,
>> +                      enum xe_late_bind_fw_status status)
>> +{
>> +    struct xe_device *xe = late_bind_fw_to_xe(lb_fw);
>> +
>> +    lb_fw->__status = status;
>> +    drm_dbg(&xe->drm, "%s firmware status changed to %s\n",
>> +        fw_id_to_name[lb_fw->id], 
>> xe_late_bind_fw_status_to_str(status));
>> +}
>> +
>>   /* Refer to the "Late Bind based Firmware Layout" documentation 
>> entry for details */
>>   static int parse_cpd_header(struct xe_late_bind_fw *lb_fw,
>>                   const void *data, size_t size, const char 
>> *manifest_entry)
>> @@ -235,6 +261,13 @@ static void 
>> xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bi
>>               drm_dbg(&xe->drm, "Flush work: load %s firmware\n",
>>                   fw_id_to_name[lbfw->id]);
>>               flush_work(&lbfw->work);
>> +
>> +            /*
>> +             * flush is being called during component unbind, 
>> suspend etc.
>> +             * So mark status XE_LB_FW_RUNNING -> XE_LB_FW_AVAILABLE
>> +             */
>> +            if (lbfw->__status == XE_LB_FW_RUNNING)
>> +                xe_late_bind_change_fw_status(lbfw, 
>> XE_LB_FW_AVAILABLE);
>
> I am not convinced that this is the correct place for this. We might 
> have cases in the future where we want to do a flush without clearing 
> the state (e.g. before a reset).
> Also, in the suspend scenario you're already adding xe_late_bind_fw_stop.
>
>>           }
>>       }
>>   }
>> @@ -282,6 +315,7 @@ static void xe_late_bind_work(struct work_struct 
>> *work)
>>       if (!ret) {
>>           drm_dbg(&xe->drm, "Load %s firmware successful\n",
>>               fw_id_to_name[lbfw->id]);
>> +        xe_late_bind_change_fw_status(lbfw, XE_LB_FW_RUNNING);
>>           goto out;
>>       }
>>   @@ -294,10 +328,23 @@ static void xe_late_bind_work(struct 
>> work_struct *work)
>>       /* Do not re-attempt fw load */
>>       drmm_kfree(&xe->drm, (void *)lbfw->payload);
>>       lbfw->payload = NULL;
>> +    xe_late_bind_change_fw_status(lbfw, XE_LB_FW_FAILED);
>>   out:
>>       xe_pm_runtime_put(xe);
>>   }
>>   +static void  xe_late_bind_fw_stop(struct xe_late_bind *late_bind)
>> +{
>> +    struct xe_late_bind_fw *lbfw;
>> +    int fw_id;
>> +
>> +    for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
>> +        lbfw = &late_bind->late_bind_fw[fw_id];
>> +        if (lbfw->payload && lbfw->status == XE_LB_FW_RUNNING)
>> +            xe_late_bind_change_fw_status(lbfw, XE_LB_FW_AVAILABLE);
>> +    }
>> +}
>> +
>>   static int xe_late_bind_fw_load(struct xe_late_bind *late_bind)
>>   {
>>       struct xe_device *xe = late_bind_to_xe(late_bind);
>> @@ -331,6 +378,7 @@ static int __xe_late_bind_fw_init(struct 
>> xe_late_bind *late_bind, u32 fw_id)
>>       lb_fw->id = fw_id;
>>       lb_fw->type = fw_id_to_type[lb_fw->id];
>>       lb_fw->flags &= ~INTEL_LB_FLAG_IS_PERSISTENT;
>> +    xe_late_bind_change_fw_status(lb_fw, XE_LB_FW_NOT_SUPPORTED);
>>         if (lb_fw->type == INTEL_LB_TYPE_FAN_CONTROL) {
>>           ret = xe_late_bind_fw_num_fans(late_bind, &num_fans);
>> @@ -379,6 +427,7 @@ static int __xe_late_bind_fw_init(struct 
>> xe_late_bind *late_bind, u32 fw_id)
>>       memcpy((void *)lb_fw->payload, fw->data, lb_fw->payload_size);
>>       release_firmware(fw);
>>       INIT_WORK(&lb_fw->work, xe_late_bind_work);
>> +    xe_late_bind_change_fw_status(lb_fw, XE_LB_FW_AVAILABLE);
>>         return 0;
>>   }
>> @@ -445,15 +494,30 @@ static void xe_late_bind_remove(void *arg)
>>       }
>>   }
>>   -void xe_late_bind_pm_suspend(struct xe_late_bind *late_bind)
>> +/**
>> + * xe_late_bind_ocode_status() - get ocode late bind firmware status
>> + * @xe: pointer to xe device.
>> + *
>> + * Return: 0 if unsupported, 1 if available, 2 if running, 3 if failed.
>
> This returns a value from xe_late_bind_fw_status, so might be worth 
> just saying that.
> also, you haven't defined the enum as starting from 0.
>
> Daniele
>
>> + */
>> +int xe_late_bind_ocode_status(struct xe_device *xe)
>> +{
>> +    struct xe_late_bind_fw *lbfw = 
>> &xe->late_bind.late_bind_fw[XE_LB_FW_OCODE];
>> +
>> +    return lbfw->status;
>> +}
>> +
>> +void xe_late_bind_pm_suspend(struct xe_late_bind *late_bind, bool 
>> is_runtime)
>>   {
>>       if (!late_bind->component_added)
>>           return;
>>         if (late_bind->disable)
>>           return;
>> +    if (!is_runtime)
>> +        xe_late_bind_wait_for_worker_completion(late_bind);
>>   -    xe_late_bind_wait_for_worker_completion(late_bind);
>> +    xe_late_bind_fw_stop(late_bind);
>>   }
>>     void xe_late_bind_pm_resume(struct xe_late_bind *late_bind)
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h 
>> b/drivers/gpu/drm/xe/xe_late_bind_fw.h
>> index 8896fea3068e5..b441f5789f24b 100644
>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.h
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
>> @@ -9,9 +9,10 @@
>>   #include <linux/types.h>
>>     struct xe_late_bind;
>> +struct xe_device;
>>     int xe_late_bind_init(struct xe_late_bind *late_bind);
>> -void xe_late_bind_pm_suspend(struct xe_late_bind *late_bind);
>> +void xe_late_bind_pm_suspend(struct xe_late_bind *late_bind, bool 
>> is_runtime);
>>   void xe_late_bind_pm_resume(struct xe_late_bind *late_bind);
>> -
>> +int xe_late_bind_ocode_status(struct xe_device *xe);
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h 
>> b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> index a128e3f638a6c..4cdbd775b103e 100644
>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> @@ -26,6 +26,20 @@ enum xe_late_bind_fw_id {
>>       XE_LB_FW_MAX_ID
>>   };
>>   +/**
>> + * enum xe_late_bind_fw_status - enum to determine late binding fw 
>> status
>> + */
>> +enum xe_late_bind_fw_status {
>> +    /** @XE_LB_FW_NOT_SUPPORTED: firmware not available/supported */
>> +    XE_LB_FW_NOT_SUPPORTED,
>> +    /** @XE_LB_FW_AVAILABLE: firmware found and copied to memory */
>> +    XE_LB_FW_AVAILABLE,
>> +    /** @XE_LB_FW_RUNNING: firmware is running */
>> +    XE_LB_FW_RUNNING,
>> +    /** @XE_LB_FW_FAILED: firmware load is failed */
>> +    XE_LB_FW_FAILED,
>> +};
>> +
>>   /**
>>    * struct xe_late_bind_fw
>>    */
>> @@ -46,6 +60,15 @@ struct xe_late_bind_fw {
>>       struct work_struct work;
>>       /** @version: late binding blob manifest version */
>>       struct gsc_version version;
>> +    union {
>> +        /** @status: firmware load status */
>> +        const enum xe_late_bind_fw_status status;
>> +        /**
>> +         * @__status: private firmware load status - only to be used
>> +         * by firmware loading code
>> +         */
>> +        enum xe_late_bind_fw_status __status;
>> +    };
>>   };
>>     /**
>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> index f85b12c1a85d2..9aa873f57b5ad 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>> @@ -182,7 +182,7 @@ int xe_pm_suspend(struct xe_device *xe)
>>       if (err)
>>           goto err;
>>   -    xe_late_bind_pm_suspend(&xe->late_bind);
>> +    xe_late_bind_pm_suspend(&xe->late_bind, false);
>>         for_each_gt(gt, xe, id)
>>           xe_gt_suspend_prepare(gt);
>> @@ -612,6 +612,9 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>>               goto out_resume;
>>       }
>>   +    if (xe->d3cold.allowed)
>> +        xe_late_bind_pm_suspend(&xe->late_bind, true);
>> +
>>       xe_irq_suspend(xe);
>>         xe_display_pm_runtime_suspend_late(xe);
>
