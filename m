Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5714C55162
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 08:55:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84B3510EE54;
	Thu, 30 Jul 2026 08:55:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QhofzLUI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EAB910EE4B;
 Thu, 30 Jul 2026 08:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785401727; x=1816937727;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=k7g/oIe1Gzj/44MCv7wr4hLTeSV7sgp8H320W7Bobh4=;
 b=QhofzLUIaOp+nHSguTNFd26yg4/ZOhV2/r0ysxB2Ds/mz/NT8vOsF750
 2YWy29URb5vcPX45j2gwc8xKBujFOp/RsQMcqdGpgww4QRHinfbDf7B10
 HWgG6dwsIaHNIXVoL1GFu86jdCbwu1obSeLGw0uhjKM1TgU7VBDRCff1y
 HfXK27WsPG8qHsgfzrIWo6fNgHrIllMAW4EakGYqneu7+ZKG1vIuMiOgZ
 ximBxiLw8bD43x8DTPIm6CHMLt1vsGGiaNUCbE/cicRzME1b3D/2iQrK+
 TYCSDBkn3dCo3B24sV48fXY3RKXdqKpQoVQI6MHjDgOZAHKvXATTvKmhK A==;
X-CSE-ConnectionGUID: KxTBI18YT1+MUnwwgT7xlQ==
X-CSE-MsgGUID: sOHnw/+3SC6jlL01pnhjuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="111562710"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="111562710"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 01:55:27 -0700
X-CSE-ConnectionGUID: d50BuCrDS0+ugia9PgrTag==
X-CSE-MsgGUID: CtUp3s+YTkSy6A0ANSahIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="260845366"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 01:55:27 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 01:55:26 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 30 Jul 2026 01:55:26 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.63) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 01:55:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bJnI7bt8ug7Vq5CESuSeRzy2j6zKozUcw5ujnDWVtCQD6PGrLcgBswbc2GlQX82f6R4NANsY/E56Bn8sxYcIITxKdI1cnw92YUoVhQtrODMCPZb2lgPpPpFyi1GBS8Hja2T3mAASoqBB2Df746/DnOBotNqXg/JFSrHKCzhAeFGfIy8Nc+CvO9eGjrOEG6zc/ID8VMwS0GGLaQ/WERpfnfyALBMDqW71ulYXYFo5cGgHAO6SR8A0rBpskYl9x3MbGI44x8RASIH6/vef90ZN+kBsj0MwNIZLhj/tO3uM8DzhytO3ocQ6n5Xqvz0CAScG/PgYJglSNoZwW4ByrmTzXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S2nfthtXmgmf2LuuxgUEw6IlJYinLT//0rK7KIZ5QM4=;
 b=I0krcJ1hjr/qPpSiN+T9DZRsnKU4VylRW55KNxWQ5aCuLHxCmbe+i2KKRIJ1aHU8HPGA2thkGF5IwOAt+5oIOczmMY7B8QZm+fzrfcSdfL7pA6w8BugxzImWhQLAZIaFkPpTVaIbnbzw3LFNlv92Vg4iINrBbwptodTmOfgTwCNx3Rf56sul+Z6Q1pz91TK7uNuvrxIq+Z51icBv9kIwWW+tPNUeKaGngOg25HmIIMr5u7a2LZO4Izu32/16U668mtUEroElh2+/MWBrKz12jyJ4n8zuoJVloIOUdMm6kMH4yalsOgPWXsdgGbO18WJiwW0DYVyHPGCDdziX+XlNRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by DS4PPF2F49754B6.namprd11.prod.outlook.com (2603:10b6:f:fc02::1a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Thu, 30 Jul
 2026 08:55:24 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0270.009; Thu, 30 Jul 2026
 08:55:24 +0000
Message-ID: <60a26659-1d32-43f7-8ca7-8a07602aee12@intel.com>
Date: Thu, 30 Jul 2026 14:25:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/10] drm/i915/vrr: Enable cmrr
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, <uma.shankar@intel.com>,
 <ankit.k.nautiyal@intel.com>
References: <20260728145943.3848704-1-mitulkumar.ajitkumar.golani@intel.com>
 <20260728145943.3848704-11-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260728145943.3848704-11-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0265.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::10) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|DS4PPF2F49754B6:EE_
X-MS-Office365-Filtering-Correlation-Id: 8569fa02-7a2f-4344-b4b1-08deee184b04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|4143699003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: dxJIZrWwqatsYTdTnZsFE9KQji3+1BhWE7SJ4kLvcPIr9pRpvNozcEjiFj63lZ+I4WwsGZ6efJcRv2/++YixJbtreDth41h1+JGqAzG/I1C+6azlMIZF/O9dfSKR0HtTz4qEvPM8/h0458rWhuDsbyBlJSwpXOh7S2ACPotc3MrR+NigUF0vXw30DzW/2ycf9+vADp6on0xXyRaQ2c8eCae6ma1SW1V1cCx6L/zH7MHBpCOaGv1nLTqFFKM5uhr1TRjzndMTlDH0TUfBEuCDCyHtok0pwNLNFIhVYmfJ6lv5gHE4qjC5hfTEI/wtRmifDUtTqC9nQ22NYc+pfkYvjbG/Z7D6q4+FuFgLJkQOaSTobsXOMsK5ufV9vSJ7iGYocWGDfnaVIOAfvG8CNlqFd8dL2JSMdnS19OaHs/d3SsG2IBWG/SVgCpK8SWLeWtaXWjuBWn4n9WAJXjJGZmM4nIvRhZRrII+6rd7vl7FzCIaMFwgs/KK63tgQ9rOW+uRkGh5l7ee7SvQFTEAB/q0iXMbUeoxOI+ZvaCLBcT4nyy9judQYe7gD84rgtRq1+D1YtyPMunoVckAgbamaNO02eeu4JYwWTBSnZH4dEkvHIOOVVOMl9Mgjd6Lndw8OFqGwaHVspeIZsWM8AaynouJfowUT253Gm1gKDBn2ULd9gPU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(4143699003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGlaa2Q2Y2VmWk5mNzFFd2xFbS9ZUUtBcWE5UXZ3K2gwcndMWEpVYzNQcGZZ?=
 =?utf-8?B?ZFZtRkhibjZkclhEVVB0TEJMc2RiY0xYOVJ3YTFBMkJMSG1LUktJMko3YndW?=
 =?utf-8?B?cmtFL3JOYnJlWTBTcEpXMXh4eFJXUDJxU2ljNG8zQU9wRHZvTllucHgwMW1S?=
 =?utf-8?B?dFY0MzFYSm1TNEFHT2xIZ2V2VDlRSzN6eVJCK0NCRVlPeW52aWM4QldLYmVN?=
 =?utf-8?B?VkZVbC84MnI1SDVxN0FtbGNlVEVwUWJ2Vzd0aXpYOUVxSFVQQjZEZnZFTEZy?=
 =?utf-8?B?dm93T2IwVnZ6aVpEbUV6a01LUWJ6enR4RFZUbUQrVXlDVUxvU090M29GNFNZ?=
 =?utf-8?B?bjJZbFhkcXNidkxjb2pJTkdKR1ZaMzRUbzBZU0UycVdvSDJ3RkRZdUhjZldq?=
 =?utf-8?B?Z01KcVc3clJjaUlDcVd1YldsNGdnMlpROWZ2NUlFWFpJM0JkZExYbFhJc2kz?=
 =?utf-8?B?bXY1eWYrZFVhSTZTWWc3Q0hzNEVZcjhlc1VpZFJSR1ZCdlVnbFB2ZVpPa252?=
 =?utf-8?B?OE1lMTMreTRvbzdOVDF3TGMxYk1rNGhTQUZzcGNJNjRiT3AzbGN3SUxycUEy?=
 =?utf-8?B?ZEdmeFBlK0h6Ni9HdVRKSTFJeGRxOW9MV0RTMysyU3M4bmVvcThCZ2hUS0h0?=
 =?utf-8?B?RDFldnc2V1lselhhenJtUlQwTVBDRXh5UkxrRWdrVFRkd1VJUWRBZm5lRTdn?=
 =?utf-8?B?U0tYUTZtQitlcFhQbmRjNWMrSnBSRFcyVm1PVW5Pbml4TlNCMXNVTnJRQVg5?=
 =?utf-8?B?QStZMlhvZmROa0pEVnNGUUFQTHBQNUFwbEI4L2wrVkFabUYyNE5URG5QTUNj?=
 =?utf-8?B?Y0RVK3l6WUxXazg5NGwwbk1Ka3F2WmFLRysxODE3SmdaQmV5Z1RES3E0T0Vk?=
 =?utf-8?B?QVc5VTV5RzlPWkZyZnpvV1ZwK0N1NmI4eVVGdXE5Z2NvYjgzQ0V3VEVHR0Fn?=
 =?utf-8?B?NGRBakFqdTRKY29DVFRCOHhWdGk5QVFUenZwQ1YwSEVLZE14M3UvMk53d09h?=
 =?utf-8?B?ZTdpZGhteURaSmlGQ1Y4bE95SFZ4ZCtRQ3RwT3RCYVNVTnFjYit3NkIrTzAz?=
 =?utf-8?B?QXBMNld6K2oxZW43QmVRWThWSUVKa3VVeGZCd3VPYWNhMTR0TmNtKysvbFl2?=
 =?utf-8?B?RGs4SVlOTSsvZnhRV29ZZTkvbkc4V052NkxtT3NZNTlhclhpOHhrNkNPbHUw?=
 =?utf-8?B?OWNRY3EvNTNhTTcvOEZsLytQSEYwQlRDajV6K2FoZUNIWXFGSHk2ZmJpd2Qy?=
 =?utf-8?B?TWV6SExHbHJBYzVsUmUzRnMwS0ozTXVNaUUxbVpjc05hRGlTYUt3NXRkOGN5?=
 =?utf-8?B?cFRLeDc2bjdUOEFBRExKMEd2SFZ2UDZFaXR3YWNwNk5reS9ZdWg3L0ppcWpC?=
 =?utf-8?B?OVRxMnJnQW9kYWxLVXJFdlB1M0ZWS2dBWTZuRjV2eERkbEgwWUdmdW0vWWQ5?=
 =?utf-8?B?ditnc0JRQWtSR2E5dkNRVUpXMlBEcmExQVBWSWFTbFcxZXpOekQzVi9JbGRX?=
 =?utf-8?B?KzZmMmhIT3o5Y2ZWbEoyZjh5cjFCbEFsK09JazNLeDJwTXZrMTI1RngzakVF?=
 =?utf-8?B?WjZEWThjOExBdmsvcE5sUXlTc0FmMDNld0o2bEFNRzNOVlBvaGVvQnBiVmpo?=
 =?utf-8?B?NkFRNUdCWmFFVkJLTGlFenZVSnZIZ05lL2t3N08rVnNaeG9KOFc4cHFSbk5r?=
 =?utf-8?B?U2kwRmhNTVl4dXdpWDZDbENtVUY5NW1RZ0pNSWRzbFlwZjZNeVhxU2R0cDZR?=
 =?utf-8?B?ZTVyOXc4M1RNeHovOVc4dGZjVTZnZ0tmSGRvZ0gwQnlJMFNwd3l3RWZrdG5K?=
 =?utf-8?B?cXpVOFNOMFZNbHJYRXAxREk2cGpWY0JDN2xwczBvWFA1KzRjOUVFdlU3SFJu?=
 =?utf-8?B?UnZOTWU2aFVIZjdzYi8xc3BSN25YVGZTN1NWNk9FSEFIa2xLSFZnYTdFTG9r?=
 =?utf-8?B?c2V6MGR2Wkx3cEpCeEJjOE9VbUI3TzVPZ0dWb3BaNGcxaURQMkdYb1lXYnBF?=
 =?utf-8?B?elROSnZheG50K3ROOEhOYi9TRTU3MThGS2I3TWZLOURmQnJwYmRSdmduM1dV?=
 =?utf-8?B?aVJGb2xpRG9KcksyWXViVFU5d2NMWStXdGtkNUtkSlN5cXZ4ZHBVZlFETlFF?=
 =?utf-8?B?MXZzeklmNEgzZ2xSdHVYUnJHL21qRlVaR3F2d0h2V01aSDlEY3NVLzhQd3BR?=
 =?utf-8?B?bjBkTEdITWVUVHRKek9FRklNYllweXZMUXFGdU1XYVVvaXZoMUZ4cmFPdHJj?=
 =?utf-8?B?SC9RRk5oZVd6RE1EaWw2Z0J0YkVyQk0xbFE1R0hvbmh3T2VqQUExT0VCbDNk?=
 =?utf-8?B?bDdWQTNIRTl3a3ozZVhhRmhqM29rU08zVDdNb0llQndDUG52RjZnYWVyVEkv?=
 =?utf-8?Q?SIG88oWtbl2Vrr1ucavOvqng+BR4eSnd6kcfY?=
X-Exchange-RoutingPolicyChecked: sQ/QF41SEUB5Zl18TO0/H1LEEHGDdiHzkXc+qWzQ9S9GPvjeWEQW3u1Bxpgf6/R7ARfToNSZYvMyge8Xeau9xi/YS5FLsYUE0/HRGmpd8Xkb6eoWIAA19tgLfiMz8hztCOfUXmFUkFs7zTaSUJdTwjuwpxg6Qm8Vse5RV6KN5TZjpsRUusMGJYywtQPaQZtzqgPhCq8vse/6Gl0dwCx1eWRtF5gtc9mdTq3JSXOUNZABdJ2K3M2EzNHCjhl90N+EP6ZDnsZuTtpXE0nF111qDzpxd+K0aiemMvZQeh2DVvKlKSjxHrMJ/kN8uCOwyezse6Hy1bW1dF5v7oAsm41EbA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8569fa02-7a2f-4344-b4b1-08deee184b04
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 08:55:24.1309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BSFWNV6azumvaIjiEDiyb+/6oIRN06AmO4y2KXCSn7vgT+v0sbJh0LvjNSImQQNi8RQpQ6slNnZcjZ8hVW4Fb/9SgZWvPOdMsmWySj/UvEg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF2F49754B6
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



On 7/28/2026 8:29 PM, Mitul Golani wrote:
> Enable CMRR during compute config and add related state
> checker for the same.
> 

stale commit message, there is no state checking any more.

Otherwise the patch looks good, I will wait for the remaining review 
comments to be resolved before RB'ing this one.

> --v2:
> - Everything else except enable compute to handle before this patch
> (Chaitanya)
> 
> --v3:
> - Remove redundant return from compute config
> 
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_vrr.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index 8d871aa58cab..c17df4675ec1 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -277,6 +277,8 @@ intel_vrr_cmrr_compute_config(struct intel_crtc_state *crtc_state)
>   	adjusted_mode->crtc_vtotal = div64_u64_rem(dividend,
>   						   crtc_state->vrr.cmrr.cmrr_n,
>   						   &crtc_state->vrr.cmrr.cmrr_m);
> +
> +	crtc_state->vrr.cmrr.enable = true;
>   }
>   
>   static

