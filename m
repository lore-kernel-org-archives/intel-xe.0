Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9BBC5AD55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Aug 2026 11:17:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D0510E1DE;
	Mon, 10 Aug 2026 11:17:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TYPvorxD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC5610E1DE;
 Mon, 10 Aug 2026 11:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786360676; x=1817896676;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=BGUKVawWAzjdr8S7Av4TsoY+Std4O253DJNjyPnyR0I=;
 b=TYPvorxD+Di7r0dES2SB8TtDKe2l8jvtiCRqZFP6u5vbSHZX8im2dzBG
 qiFPOvhS+0rTAtv7kpNsq5kQKTn+TDJnQrKl/HlmPNMT8GiYUtHQ1R/T2
 g5M85QYlLacEPWqFIs1W1xvJwSNwDwEyGiOJ2HWv32eBVrv3I3udHWwfj
 9H8UWh+9jtT763IqiM/t8CNxeV0I8HNeqgdcJcSxQiNd2XXXmk3edcyWh
 KUQ81nNpw/tKHkb//maIBX8dZ9qglzDdT7xeDRaJCDQjnSoCi4QpUAOpR
 PWBOHIinMAMwz3XKLj50KiczdQ8VudBg7oSLv5zAZE4t6kiVEQ/Pb5HPg Q==;
X-CSE-ConnectionGUID: mQbNWxrMRMavYF1tfCfXbg==
X-CSE-MsgGUID: WQvLjzvVRNqcQjFex6IoVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="85990897"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="85990897"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 04:17:53 -0700
X-CSE-ConnectionGUID: 24HauY7zToOX/L/lHrrYhw==
X-CSE-MsgGUID: hWXPjh6MRCCYjbLAbnDWRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="258742999"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 04:17:52 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 04:17:52 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 10 Aug 2026 04:17:52 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.63) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 04:17:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EMZmE0ohIU8ktTkIWyA3/5dW2fxnIEngcKOItI/tfR+V2hvr+smKuCgMKfK/5MOprBHuBHYRLYFUizHbheifbapFzgV+JKuExBPYPgn0AKf7HzB+5hhVbITkTtA2h5U1bdAd712hyD2mpCxMJUdYSPdkjNYu4qlSc/sAqYYc62EtWGYEvJ9xmvnp8L8QFnLcmTjmEzQFZyTOneQUKP6aqCOjpAEk0vFG9VyPT7TGBiIyr+DmVB6GmD2xvyehDsMW6DiVdqVJ0qQThoYrjEug2W4GFjcR16thJKCBPA++djuQ+SPIvk/HOUxPhnBC3J16Sb6mRwE31IMKrIME/CyEOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EcxXBTZe18I9464cnbiT3nNhHhv9wyV4GJ/0bukCg2Y=;
 b=AA5jDbgXphiHzsHIuT/s5OJVmK72SL7VkBCn6oTw5DZK/1cBuuYMBiaC/JMl1rMPAFDE5c7EnUp0itMJnZIRo2k5+N06UwbixUinZkXQsbVZfb3Zxb4MglMEsa4BxXHjOQM61BOoUaO9rNwqgMYmTb0Pcwx4/Me8ZtxO618Htz8lsi2pGYuFdl4z/Gx5WLb6c6fq6YF0DK1n56HPxVGEy+OKSV/NGhmi2oOEEUuBOYmSjAvKjklq+XS8jvmTMGj98O/27wgyxzTEwduulXM1OZgWnaklwcg1wJKxNJHrxkv4U0KA6kYZbR40lkIgxGXQpD0kH/wO8j2aDqKme3Hp4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB7554.namprd11.prod.outlook.com (2603:10b6:806:315::9)
 by CH9PR11MB9928.namprd11.prod.outlook.com (2603:10b6:610:342::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 11:17:49 +0000
Received: from SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b]) by SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b%5]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 11:17:49 +0000
Message-ID: <98b730a6-d459-4ee5-a38c-81ad1c830b6c@intel.com>
Date: Mon, 10 Aug 2026 16:47:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/i915/display: Limit max joined dotclock on joiner
 pipes available
To: Jani Nikula <jani.nikula@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
References: <cover.1786105831.git.jani.nikula@intel.com>
 <3c615440f018af779a3a522f14637d2993f7af03.1786105831.git.jani.nikula@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <3c615440f018af779a3a522f14637d2993f7af03.1786105831.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0209.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::8) To SA3PR11MB7554.namprd11.prod.outlook.com
 (2603:10b6:806:315::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB7554:EE_|CH9PR11MB9928:EE_
X-MS-Office365-Filtering-Correlation-Id: 29f08ae5-f6f1-4ab9-8113-08def6d102d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|22082099003|18002099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: h5bHbJtUcdPtud7/E5AkwvFxRzzJmdwD0JfHN2g1hpvgmjI6B0DI6ab+rn+yqMRX2M4K6Foi+3OLopmPvgGCwRHvwasERwTrLK34dV1tOu5JDj9P+iXdpy2VXJ367orKxX0oB9958m/tE8tsTMqmQItm0fKUI75zNov15Tm7ZxV+28pCVegLCvIPR32/wCo8wWc4g5csnKS3owfmWtfOmyh5dfBoIFnTNtEbwER52pVQ15lE7sxGOPAdT7/n7wejF8IVU5/aUcvD13a1AvbTD7L9CI7+9oGIUolhtPdy/HewQ6ZtiX2K+nAFpelrKuqNp69OqiarqlKXCPiLfOzyNK39dzsopvOXv/eJ7aB+cp0IxldoOzdsY3HK46uZch0Rv1SOCx1YDkE6l8MINuHETdYBGcYjmZWXXBDTkR4e3p3qlN8DjATmZATokD8/UGhemFUipUrNR+8cvkf6xf8Fhuo6WS9OvSs9bFD5p2yOIKwqa2NrMELFlaA9bJZLGnx6fZXq/Z905mQyUDbx2ZRtGmB6PLVotsGwfPaHQAd1xrBbZWEdmHdYu9nZSqVIvxlqu/oqUkGf7ZKU6cvU8OLA6AihpyuwS6ZNS8cAdQm20WZxgARQWTgjekR2Pi94WKZHq5r5CdgUrXyiAFtArQTCWao0iN/gykBf74ZT3wbpl3c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB7554.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(4143699003)(10067099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWNXU3ZyN2lheUxMMXJqNlpqTzhxMVB3S2RpSHRkaytTOGlhM0Z1R2V4OEV6?=
 =?utf-8?B?U0J2WGtiTXpabXNLUVlzWi83WTlPcnpuTEFvNmF3Sm9QdFFZS3AzMnQ1ZUNE?=
 =?utf-8?B?aExPNEw2Y3Vhck5wcENKZmR1Z0hrN0xKQ1pWWlZWYy9CVUVObmxmTDJHUjNn?=
 =?utf-8?B?VW5WMnRmT0FwNXNQS0xWMVYrZDJhcTZ5RmtwdU1ZS256Nmt2WVpURG1PTVpu?=
 =?utf-8?B?RmhzeVhTZDhFWVlVZzU2R051UlRibE5vZ3hDc1d2cnBnNytMU0R2TDhNT0JU?=
 =?utf-8?B?dmxTR0djdWUveXZVZVo3TzlZN1Z4RWRGMTVWM09MSVBnNDNlaTBOWTdMQ0FE?=
 =?utf-8?B?NXpHTkVlajVlbm14cExjUVg1Q3cxL2RNdmpXTUpZMktlOHJTdW16VzQ0ZDVD?=
 =?utf-8?B?dHdyMU0xNmkxVTY5elZoMUo2S29FR1Rvbm1JQmErNk1zQXZPVWtxdzVNWHBk?=
 =?utf-8?B?OWlEaktpUjcyZXhMWjZidnFseUliRjhqR3JmWWNmeTdUV0t5SzRXWFp2Lzk5?=
 =?utf-8?B?UzdvMWM2ZnRvb0tOQ0FTYkhMU2p1SkQvSEZmTERTMmxlTWp6YlJjYmRobG4z?=
 =?utf-8?B?Z253aWZ6NTFSajRQZHc1dUZEZVdzVGV6bTNReXU5SnRlMWRLd0FEbzh5cURG?=
 =?utf-8?B?NE8yZmh5aWZUdEhsSE10K1p0Y1dMTno4allsL2Erc3RYdUtFR09WMDBoaFhW?=
 =?utf-8?B?WUdjRWlUaXJFSEVSVE1JbHZGcE9BM0k0bEh3cWZnQlEwcTY5QmtqVUxMZmZ3?=
 =?utf-8?B?cVgxS0JGNTNVMGhTNzdESWdNb1hBZTk0MGFpZjV2cVk1dkhuL0YrajhEWDdq?=
 =?utf-8?B?T0VBUW85SU5YekhuLytCUjZrbGhmMUFXNWlNdDZOM1ViM3ZCZC9UM05Ha2gx?=
 =?utf-8?B?dXlvMXVvUEdBbWJjcnFBc2pnclh1MDQ4VUNNRXpZSmxubmpPdmx1STRPNHJa?=
 =?utf-8?B?eEJwK3huNnovaGk0ZGpNc0FDOG9CVlNNTXN3WHg4bDJIaWNLRlFKREFaSGk2?=
 =?utf-8?B?YWw2RGovTUN5WUNEQVQxM2grdDA4cW81VUlDb3JNckh5M1ZpdGozRER4bWlQ?=
 =?utf-8?B?VlRLVlBXQmE5U3NYRm9MelVBYmV0bVhEeURZVjV5WkhHaWNIT1NINXg3RERT?=
 =?utf-8?B?UW9nQ1VPdHpETWczZHZjczkxaFZ2Z1NaUXBkN3NtYTkzVTVGZ2s5WW9Qa244?=
 =?utf-8?B?MnYxWjVRT2hhTzE5MHhWL2hvTUFBTHV4OFRJb1pWY3c0Z2hCendqbitYSlNm?=
 =?utf-8?B?MG5LM2h4WlJrVXU2NzVNT3AxQ2pZY1hZUkRCWkx4WHhlZklVU01CN3M0dnlq?=
 =?utf-8?B?NWVQY2RBTHloV1E1R3BXODI5TkcrZHNXcFBCdTgvYzdPWklZWk9OOUlSVTlh?=
 =?utf-8?B?NGJtWmNGazZZUGJLQlBvaXFNSHF0WDV1dWNMVE9vWVczdzdoWjdMeUVpUVVx?=
 =?utf-8?B?REZIT01wcG9Xb3dtc3UxTUdRT3ZTb3JkcDJPZE9BeCtOT0M4K1ZIL3lhQkxq?=
 =?utf-8?B?RWU2T1BXZC9jQXlPOFdDUTZVd0M4UGdFRzQ3NEY0NmI3U0RxbnBJSHcyL08x?=
 =?utf-8?B?dTI2eTI0SFM2eHFtUjAzRm1waUpaYlVVbnk5bUgzenpFcFJieG1BZlJqc0xk?=
 =?utf-8?B?MUxqMVdydWhLZVNhNEV1a3B3UHJBV09ZWVRkWExxTGJ0RzRjZTl5TEZ6NWVO?=
 =?utf-8?B?WVhIa0YrSllHMEFyWDJ4RzRhNVZ3ZU03bEUwSWNCZzZHZEpadHBkQmdUUWF1?=
 =?utf-8?B?cTlMUVpwTXAzOEdxay9hQUZRWkN2L1czWVZZU3Vhd1RZQjd0M2FYVVlzWDNw?=
 =?utf-8?B?bFd3RmMyenpma2xKWVp6QURnaUd1RkR6emE5K1dvWlRyajNZQ0NZTjJmWjVX?=
 =?utf-8?B?UVhWcHU2dWl4SHV5aDh0NENjR05kOGV5enpsUWp5YTcrRkM5bVlCWlpqOXdD?=
 =?utf-8?B?eCs1VFhZbE5ma0pUb3oyajg4eEFEQXQ2UWkxNkh2Nk5JTHFHNHNvazFzcjNq?=
 =?utf-8?B?Wkx6SStqaThnSHJMZzFVZmxkZDRUNEp3QkV1b1UzblArL0liTGRHQjZVeTFU?=
 =?utf-8?B?M0YvTWtERmwzdlhaUExXQmk5cDhDQ0dCU2UyT2NtK3NEZGJyb1VIUFMxenJj?=
 =?utf-8?B?aTgxRzQydXRjUzE1MWdIbU5BL2M0ajNualFFRldCRzg0VFNYYndDcW1XZjYx?=
 =?utf-8?B?WGFoYytLMjRiUGx5QUtpOUIvQkpQRlpxQndtbmU4NFExM2t4ZmFlWmFndFYr?=
 =?utf-8?B?VGo2Tjh5WjJSTDdUVFlYQys2eE81Q2x2NEkxSTFYcUljc3NtWFduRDNVK2F5?=
 =?utf-8?B?SjlJUzd3YmIyZVI4dUxlaFdNdU1KRzRPYmNuU1lnSjJRTU1PanBKM2dLZkFB?=
 =?utf-8?Q?hAMFJAkaIfxZzMAw=3D?=
X-Exchange-RoutingPolicyChecked: GXSkaapb8/obG/bQjRAPd23+R61Grvi1sVX0dVhyCzshrvd4mvNp8kfTWCQXGT6JxPJoIH5cvvUPJU5JZohuEzjL/KH+2hZTVstSJeKOTSsFnAB3sFpf6DHTgB4zVV/myhasI6/yD9pVxiCGZbpTWYXZOpbBXDRdlda1FfZ/gth9H/rbyACEewnlmAJ220EEztrAJRDQ1xlmx0WWzEhZ7DBgjmZYohE8eP63W0gjvw4W72yfMz6QOsIAjwE1iPXY4yIwv5hXVxDkRDuQTL1oNpLHbVi8Y5a6HY9Mh1G318UNQ1XxI7qLpfJdLzPywLflGQqqPVs8UIUdszHa1vsdbA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 29f08ae5-f6f1-4ab9-8113-08def6d102d8
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7554.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 11:17:49.0897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7GQVH6aeDV9hhZoZ4cT7kL51IZih+8Cs4d5tdFZRKTTwcxxVxbGgsyKglPPy3f1T6CKJU3u55d/aonZRIzRsL0/2we+CVP4mqmrAgeT78Yc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR11MB9928
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


On 8/7/2026 6:04 PM, Jani Nikula wrote:
> Multiplying the max dotclock based on joiner availability on the
> platform alone does not take into account the actual pipes (possibly
> with some fused) available for joining.
>
> Limit the max joined dotclock based on the actual pipes available for
> joining. Add helpers for figuring out the valid primary pipes, based on
> having the required joiners and amount of consecutive pipes available.
>
> v2: Check for consecutive pipes available (Ankit)
>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_display.c | 51 +++++++++++++++++++-
>   drivers/gpu/drm/i915/display/intel_display.h |  1 +
>   2 files changed, 50 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 829d7a411dcc..c958b2a92cc7 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -193,6 +193,53 @@ is_trans_port_sync_mode(const struct intel_crtc_state *crtc_state)
>   		is_trans_port_sync_slave(crtc_state);
>   }
>   
> +/*
> + * Return a bitmask of all the start indices of consecutive bitfields of size
> + * width in mask.
> + */
> +static unsigned long find_consecutive_bits(unsigned long mask, int width)
> +{
> +	unsigned long bit, out_mask = 0;
> +
> +	if (!width)
> +		return 0;
> +
> +	for_each_set_bit(bit, &mask, BITS_PER_TYPE(mask)) {
> +		/* For each set bit, see if the following bits are set also */
> +		unsigned long bitfield = GENMASK(bit + width - 1, bit);
> +
> +		if ((mask & bitfield) == bitfield)
> +			out_mask |= BIT(bit);
> +	}
> +
> +	return out_mask;

This is very clever!

This fits very nicely with the part where we want to check if joiner is 
supported "for a specific crtc" during compute_config phase.

This works even for width = 1 as well, but it's better to handle the 
case separately as you have already done, it's intuitive and avoids 
iterating through the bits.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> +}
> +
> +/*
> + * Return a bitmask of all valid joiner primary pipes for joining
> + * num_joined_pipes pipes. For completeness, return all valid pipes for
> + * num_joined_pipes == 1.
> + *
> + * Return 0 if the platform doesn't support joining for the requested number of
> + * pipes, or there are not enough consecutive pipes available.
> + */
> +u8 intel_joiner_valid_primary_pipe_mask(struct intel_display *display, int num_joined_pipes)
> +{
> +	if (num_joined_pipes == 1) {
> +		return DISPLAY_RUNTIME_INFO(display)->pipe_mask;
> +	} else if (num_joined_pipes == 2) {
> +		if (!HAS_UNCOMPRESSED_JOINER(display) && !HAS_BIGJOINER(display))
> +			return 0;
> +	} else if (num_joined_pipes == 4) {
> +		if (!HAS_ULTRAJOINER(display))
> +			return 0;
> +	} else {
> +		return 0;
> +	}
> +
> +	return find_consecutive_bits(DISPLAY_RUNTIME_INFO(display)->pipe_mask, num_joined_pipes);
> +}
> +
>   static enum pipe joiner_primary_pipe(const struct intel_crtc_state *crtc_state)
>   {
>   	return ffs(crtc_state->joiner_pipes) - 1;
> @@ -8113,9 +8160,9 @@ static int max_dotclock(struct intel_display *display)
>   {
>   	int max_dotclock = display->cdclk.max_dotclk_freq;
>   
> -	if (HAS_ULTRAJOINER(display))
> +	if (intel_joiner_valid_primary_pipe_mask(display, 4))
>   		max_dotclock *= 4;
> -	else if (HAS_UNCOMPRESSED_JOINER(display) || HAS_BIGJOINER(display))
> +	else if (intel_joiner_valid_primary_pipe_mask(display, 2))
>   		max_dotclock *= 2;
>   
>   	return max_dotclock;
> diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
> index 57ea4f2edf2a..e7ecae9d2d21 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.h
> +++ b/drivers/gpu/drm/i915/display/intel_display.h
> @@ -373,6 +373,7 @@ intel_cpu_transcoder_mode_valid(struct intel_display *display,
>   enum phy intel_port_to_phy(struct intel_display *display, enum port port);
>   bool is_trans_port_sync_mode(const struct intel_crtc_state *state);
>   bool is_trans_port_sync_master(const struct intel_crtc_state *state);
> +u8 intel_joiner_valid_primary_pipe_mask(struct intel_display *display, int num_joined_pipes);
>   u8 intel_crtc_joined_pipe_mask(const struct intel_crtc_state *crtc_state);
>   bool intel_crtc_is_joiner_secondary(const struct intel_crtc_state *crtc_state);
>   bool intel_crtc_is_joiner_primary(const struct intel_crtc_state *crtc_state);
