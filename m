Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C22EDEBF7
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 22:58:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F6B010E08D;
	Tue,  3 Mar 2026 22:58:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ShT/apxW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A82910E08D
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 22:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772578703; x=1804114703;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XQl9T1oiaZmGGFXsSH0gNodEW91o86XLJWQ07pEi0Ko=;
 b=ShT/apxWhgFKTQV/ou3BpiQ4XsNt5hcgDH/raW7CWvNdPtidL4/8mGsi
 2cmhc/xPXogmf+XwP/i4kj6k4mjGztJNRVxlTF9D3Jp0YCUuycFl5YSVC
 XY4v+4T/dLyiWDhE9ij/3XoAhljpQD3l/yjcJPY4HTsRvU+RFUWly/SQz
 cWsaAw14IUW744NgNRIaouIW2eMPEcxJCeHVSOuuMMcZ/YGRcau13PHq2
 jQ6rl5ufxQKNocWeYtAli7VpYyxXWOzpAR5glmPSkSsrL1CDr+FeNWRhH
 Kd+o9+30nzv5s8pHZ0K/cG1sWXVLOoxoNnuuzFtMGUjZ8YrHuxR1bZm/M Q==;
X-CSE-ConnectionGUID: cb+LnZEgSfGBJ/0mmzCIYg==
X-CSE-MsgGUID: ST5DQT5xS3ywdWVhHgiAgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="84973097"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="84973097"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 14:58:22 -0800
X-CSE-ConnectionGUID: U7ZTmpBfTECPKh6e/Gcg8g==
X-CSE-MsgGUID: lnD+c3IfRMGRYWCkX2k1JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="222625226"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 14:58:23 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 14:58:21 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 3 Mar 2026 14:58:21 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.11) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 14:58:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JkiODOZ7+CMFbx4ysM3eeIqJAkgjX8lLoZ8Ma4UJyOZ5tCshi9FdLwWtmtKL9xqYKtbyXp6G8e8Z4ikWkl8vZ6Ihba249TPNFO4fl/uay37o8at209QulW3i3hDj+kWmZ18XkpVop2qex9x+dRuau6VGoF4Sfo3LkcKMbPpD8NVfi9QwP1OHCE4NYkZtMWKCqWnyqC9uGE5/l9VswsT9hx0hx3bJu6zHjDLizeBxmlsuAJDbiEDCo5o61/Rt5m/PMujHNDMNh+Xggr+ZRUY4omM0JRFG83oXAfAPK77Er0aVrPkOUlgd0SKGWpfQ36ao7/sLBwmeTTlj7t4o45p92A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xiWJTl+D2WVflJ3M8eLe4DDO/NMtRGjkxAqgJ/WrY60=;
 b=SRgd7ae5RR4g3xQnxzIW8E2FX/9Igb6aTPT8Hg9aXIFz0vPiVl6jSfy5jHw6W72syx50kHdRiQw7b/pkfczpm4/jMzikVd9eOZ4V/GX33F5ClkgiykKRNigcKNK9KI9AnfNc8VLZ8W8GbiaZYg3AFQU+NjMtQ/bEsKxSUSixn4GrnEF++V6gzL9EVCOEq2EWWExmdwCbdpRx7TqcfIt+gv2OCxi7X9pqZ2GyDtxhicxTO0gqMUYGQMXz+Voq0emlAq2702/AtIOAe02Fk9GoRXxtATAUCbhRYY7+jXAcDn8fHUgmNE8BJyXia8Drdm9qZeeasM0K1gZPhlcPLRoizg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by IA4PR11MB9231.namprd11.prod.outlook.com (2603:10b6:208:560::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Tue, 3 Mar
 2026 22:58:19 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 22:58:19 +0000
Message-ID: <07735a9f-cfbd-4aa0-bafb-b57cd126782d@intel.com>
Date: Tue, 3 Mar 2026 14:58:16 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/1] drm/xe: Enable Wa_14025515070
To: Julia Filipchuk <julia.filipchuk@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20260224174918.616779-3-julia.filipchuk@intel.com>
 <20260224174918.616779-4-julia.filipchuk@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260224174918.616779-4-julia.filipchuk@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:a03:254::25) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|IA4PR11MB9231:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a4e5a74-f3df-4888-d709-08de79785c3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 6twPQnwOLKDC7vrlNGCZhIXwZr5WYPnBZ8TiwSqV6ymSoFsA2thhQeIPFfLgMRJgz6Gh3HKmN2dAzdcI45fs7CROllBwF0rvDHaZm9Ec9QFaahX7G+NF3+EHPPTQTgZ0w6sCVU6cH/3czadhQItvliuAZHDR5FxeFOdyU9SGrvS0PsSNV0SNSLl2TADg8Rg+HqeABSu365kp6L1AtAXTfyjcyv1qgtc5JysKWTc/Belsffi+SccfQ3MY0ItaAg2QIkk5zalccEu/pvAR9qsUUOiAIIj8aUqlTvGFC67akGdaHTBlFmxerGzj4hRxS7G25MC7qvc1CGSWNoLgVZeJuVQ3q3TUZNNAUf5yUzhlK7kQx1jgAa+OHIIxA4QLYXwdwoOntTRjbI6bIERjXA//XJ0i6+cRiiXovKxNx89Krr3p03oxD6hhaoaTfAT4Ii8MQtsSUlLZqbj4ciTq+sbshz7i42/EJVQExnakWRJH1984Unsz5b9HeNY5U4AG9wMIWzBmrLNXEWo8+U044mEZuhXCKSHPKmnKTRJqPWhHDO+mcIvhlZgEo439dzDraeCTPgzXwyLFt4JO71xJzrDgmZAiMw2wMMFsOkPtpCAIIUjkGEjRAI2Qcm2Lwnn4bIu95ghKr9CJ1/b9Rf8mBQdAZ3OL9MZkqvgfNzuqoJ7iRZscAQ01eueaWXMvvWTSLyV6EeH1adVq9ZtNBOVmIG6Hov+0PXLc8PV99BO1ZxKvB/4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YW9MNlNYYUhySkpKRzhOVXh3RVo1em12Q1dCY0J0U3c2cVdqbENqb1Qyb1g1?=
 =?utf-8?B?c3U2WDh4aUdUNmRWM291aHpEQkhWTjIxemtuUXVGbTZuVUdYYmkxWUJweTJF?=
 =?utf-8?B?aTRIdDBxbi8xYlBSSzRacVFOak9BdFZmTk9ySlNRV2RLdFNzN2xTK2tsbFlN?=
 =?utf-8?B?TkF2NTNXRis0aUMyZGIvT05mKzJGMTNOZ1Bib2xDdURGSWpCSjM5ZkdKRXJw?=
 =?utf-8?B?a2lzSi91dXBkQzFES2Y3VVpsQUxRTkhmUDJYbmtwYUk4WitkcG1mZFNBWUM4?=
 =?utf-8?B?V3V0Q0lLVDhYQ2kwYklXdVBIKzh2ekgwbVRyTzE1S1VmbnpvTHRnV3kyVzI2?=
 =?utf-8?B?RTZNZVVwK2sraUdlTGdtVGpUMCt5WVgrMVRONjVKaUdacWs1b0NuS0dYUDY3?=
 =?utf-8?B?R1ZVVFBFc2dyTjUxNWFRb3RqU3ZzUjRRL1pWVXpWTGNxSTlndmplcFRNT0Q4?=
 =?utf-8?B?ZWJzc3JSdjBzOUJ1ZXp5OXZYa0lubXNBVEZWUGRMNC9HV0FvUkhlWG8wQ0pQ?=
 =?utf-8?B?YlJIS0JyZGIxRzFhUVdkcnpQbHViaW1IcVp6Z1IwRWZEeThhejlwRldHdFBx?=
 =?utf-8?B?YTFKOG9iWUc2dEJMcHU3a2FUZmNFN2MwNUdGV2xUTVZjUW9kNG9EblQ5OUNY?=
 =?utf-8?B?VmNjMGZLOGozbHVMM3Y5NWh4Ukg0ZWRleit5V3RIUmFHQnZaRkg3RWZNZEF2?=
 =?utf-8?B?bFhOb1hZTk5Oa3BxVFVLYVFXNncwenFsaE1KVjFnR1dNY2IzS3NqcDB4dWpF?=
 =?utf-8?B?ZnE2WFdObUpIWVJ1WTNSV21ITlU5Nm5EUGVuMkVSUGRTbnd2QjFKR3IrMFlP?=
 =?utf-8?B?ZmZ3NGFvY2wzRWhiMmdDeW9MRUFSbnJlN3QyN1JhN0l5VGg2bllhVlVuWDhh?=
 =?utf-8?B?RVpKNDRza1pYanNIckU1OUNhM1Bnem4vN3F5anpFQlhNcWtvbEZFL1NmQk01?=
 =?utf-8?B?bEh2OGVxOS9Bb1pjNEtNUEcyc2VwWEttZW5sMS8zbzBGZVZKMitXK0VzQTcr?=
 =?utf-8?B?V1k2U0xKQVVJSDBGbXBUbXRNUFFVTzRvdFc5ZnM4cm9UaWJPNTBGRXRyYTBB?=
 =?utf-8?B?YWw5UVA2SEhqSi85YkVVNWxERm5KYXF4UjlWZktFVXNBWm5abTdRNlZFcXZi?=
 =?utf-8?B?STdBMkxBSUNWazdFcG1EN0Y5TDNRZzhKNlI4Z0xoQVRPYnpnR3JRdjU5VDds?=
 =?utf-8?B?OHBvT3BRUmFSUFZrYzhNVnJjazNRSFhRNzBpMndpdi9ZSTNsbmxENGtOSG5j?=
 =?utf-8?B?dFhUZ3EzT01oWlhOMEtOdktaRGU4cUpvQ0hBWU9URTF0WFhGenVHQTd6N3gx?=
 =?utf-8?B?YklXekdUWFh1cVJJYUlGVkVtc0dKR1lQdm1uemZDdHVHcHB3ZDFoVXZYaUFD?=
 =?utf-8?B?NCsvUEE0Zm1ZNmV1REN3VGtXbjJSamZoQ0IzR2dIWTRqRm92NUVkMXhHcGpG?=
 =?utf-8?B?VGQwd1M0N3F1Z3VOdTloUGZsbmlma21wM2lURzFtTGNEREJMdHJqbmhHc2xt?=
 =?utf-8?B?VkFMMjRiRWJEQ0xPRGNwSWNuTWNHZm5Hd3ZRTDhlQUlwQjF4ZE9PN3M4RDVU?=
 =?utf-8?B?SWZhY0k1ZzY4Ylo0Y1lxVVhHZ09teVN5Y3ZjQ2xmUndYTkNUMlpMcXJ0VW95?=
 =?utf-8?B?cEZiQlB5bUpWcTZWVDJ2dUdjUkNQOWg0V1FSUmVSZ3ZzK1JLNXVkUWpTQ1ht?=
 =?utf-8?B?b1ozbC9wYmkrOHR4RHZxQVR0UzRXYXIvbzJQclZrTHUvano4Rk5rQ3JHME1Y?=
 =?utf-8?B?Yk9pa2QzNHovb1ZLNG1UM2hha3MyVG9OZkUyZG50NzZSNk5hejlMNE5SMDEy?=
 =?utf-8?B?Y0gyOWp4b0JwRURQTUFUOERnZkVkSFN3aGZGYjRENTAxNUVGcENQWHNrMWlP?=
 =?utf-8?B?RHZheEx2Tk5MOHpPNUxNOVNJTHR4YW1jUTd4WWhQTEliWVJnTnJSR05najlR?=
 =?utf-8?B?UGtuYjAzQ2k5QzYyVHhIOW52dWY4dFVocUFMYTNqOWQxWFBCV3g1Ty94OG9C?=
 =?utf-8?B?eExzVGhSU3dYYkMyTTBrdXpHYnMrNTFxTWJpdW5GVzk1eCtubEh0clBOM21C?=
 =?utf-8?B?ekdQQmVaNXd3Y1FENXFadk1pU2xYRERxSEpFdDNUckxWdGxvWjdxbDBxeE1H?=
 =?utf-8?B?UEpEMnJXYVhLVS85R1NyL3BiSWt6b3IxL2tTeUU3SS9VK1JoTGE5VHVXRTdr?=
 =?utf-8?B?VkZvTmRCWEJ2VStON2h3WDYwQUZ6dFpWT0NjdXc0RG10RTJXcENIRXNjbHBB?=
 =?utf-8?B?ZkJMYXhuS3NCMDZFWHVnZlIxTVRqbFM5WmxFcmVpTmNNSVlVTWxScFRlOXlH?=
 =?utf-8?B?Y3YvYzlaaGNRVG5nc1FzWWdHcUgyN1pSWS9yRVg0U2tOd1lvQXkvU1B1US9K?=
 =?utf-8?Q?FfqUkgzAdpZX738A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a4e5a74-f3df-4888-d709-08de79785c3c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 22:58:19.4961 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 40YzxA0hZP1fCbj90VlB3m6cQ9jCBJhJS6SyKDkdBNeNgVZVXzeps2YilVZo2YqVngGeBmbDZNuWYhbT8GiUWJEYCQLrapkYn24TVVopP8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9231
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



On 2/24/2026 9:47 AM, Julia Filipchuk wrote:
> Corrects a failure on context switch. On registration of context with
> indirect ring state will correct state of targeted and idle command
> streamers.
>
> This Wa requires GuC 70.53+ (uapi 1.26+).  If indirect_ring_state is
> enabled and Wa is unavailable, notify and disable indirect_ring_state.
>
> Added additional XE_RTP_PASTE macros for expansion of longer rules.
>
> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
> ---
>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 1 +
>   drivers/gpu/drm/xe/xe_guc.c           | 8 ++++++++
>   drivers/gpu/drm/xe/xe_guc_ads.c       | 3 +++
>   drivers/gpu/drm/xe/xe_rtp_helpers.h   | 2 ++
>   drivers/gpu/drm/xe/xe_wa_oob.rules    | 7 +++++++
>   5 files changed, 21 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index e33bd622ab44..f0815500177b 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -496,6 +496,7 @@ enum xe_guc_klv_ids {
>   	GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO					= 0x900a,
>   	GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH					= 0x900b,
>   	GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG					= 0x900c,
> +	GUC_WA_KLV_CLR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CTX_REG			= 0x900e,
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 54d2fc780127..0c14e321bd67 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -777,6 +777,14 @@ int xe_guc_init(struct xe_guc *guc)
>   	if (GUC_SUBMIT_VER(guc) < MAKE_GUC_VER(1, 14, 0))
>   		xe->info.has_page_reclaim_hw_assist = false;
>   
> +	/* Disable indirect_ring_state if missing GuC 70.53+ WA 14025515070. */
> +	if (gt->info.has_indirect_ring_state
> +	    && XE_GT_WA(gt, 14025515070)
> +	    && GUC_SUBMIT_VER(guc) < MAKE_GUC_VER(1, 26, 0)) {

Nit for style: we usually break the lines after the && (checkpatch is 
also flagging this).
with that fixed:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> +		gt->info.has_indirect_ring_state = 0;
> +		xe_gt_notice(gt, "indirect ring state requires WA in GuC submit ver 1.26+\n");
> +	}
> +
>   	if (IS_SRIOV_VF(xe)) {
>   		ret = devm_add_action_or_reset(xe->drm.dev, vf_guc_fini_hw, guc);
>   		if (ret)
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index f4cbc030f4c8..d737be03aaed 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -360,6 +360,9 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>   	if (XE_GT_WA(gt, 14020001231))
>   		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
>   				 GUC_WORKAROUND_KLV_DISABLE_PSMI_INTERRUPTS_AT_C6_ENTRY_RESTORE_AT_EXIT);
> +	if (XE_GT_WA(gt, 14025515070) && GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 53))
> +		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
> +				 GUC_WA_KLV_CLR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CTX_REG);
>   
>   	size = guc_ads_waklv_size(ads) - remain;
>   	if (!size)
> diff --git a/drivers/gpu/drm/xe/xe_rtp_helpers.h b/drivers/gpu/drm/xe/xe_rtp_helpers.h
> index a33b0ae98bbc..86eee60c04a1 100644
> --- a/drivers/gpu/drm/xe/xe_rtp_helpers.h
> +++ b/drivers/gpu/drm/xe/xe_rtp_helpers.h
> @@ -66,6 +66,8 @@
>   #define XE_RTP_PASTE_10(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_9(prefix_, sep_, _XE_TUPLE_TAIL args_)
>   #define XE_RTP_PASTE_11(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_10(prefix_, sep_, _XE_TUPLE_TAIL args_)
>   #define XE_RTP_PASTE_12(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_11(prefix_, sep_, _XE_TUPLE_TAIL args_)
> +#define XE_RTP_PASTE_13(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_12(prefix_, sep_, _XE_TUPLE_TAIL args_)
> +#define XE_RTP_PASTE_14(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_13(prefix_, sep_, _XE_TUPLE_TAIL args_)
>   
>   /*
>    * XE_RTP_DROP_CAST - Drop cast to convert a compound statement to a initializer
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 80b54b195f20..f8a185103b80 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -51,6 +51,13 @@
>   		MEDIA_VERSION_RANGE(2000, 3002), FUNC(xe_rtp_match_psmi_enabled)
>   16023683509	MEDIA_VERSION(2000), FUNC(xe_rtp_match_psmi_enabled)
>   		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0), FUNC(xe_rtp_match_psmi_enabled)
> +14025515070	GRAPHICS_VERSION(2004)
> +		MEDIA_VERSION_RANGE(1301, 3000)
> +		MEDIA_VERSION(3002)
> +		GRAPHICS_VERSION_RANGE(3000, 3001)
> +		GRAPHICS_VERSION_RANGE(3003, 3005)
> +		MEDIA_VERSION(3500)
> +		GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0)
>   
>   15015404425_disable	PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
>   16026007364    MEDIA_VERSION(3000)

