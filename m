Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D22CD6E4A
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 10:40:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FDA910FCD3;
	Fri, 29 May 2026 10:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GccifAbg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD8510FCD3
 for <intel-xe@lists.freedesktop.org>; Fri, 29 May 2026 10:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780051228; x=1811587228;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WSreFtjx+U7T06emyq8M5rS/OVQG5TOiMlqPTazGQr8=;
 b=GccifAbgxeNY78ZRykyinJkiRwfF5pbusP7JFHxMeTLuzdK7yDacumSG
 CpufUQ5AP7C4UHDV3bZ+JXsSqeqK/YEVxqQjH9p3+UGbTHZJJ3AdKEmaE
 5cNxIr3Kmm3mv4j6dlXi7bU0U+MtpilDLv2QLqy5nsGVyRgUqIWVkiieH
 hYLtQiuCeuTS4gOWfZhPbF+aNbYjt8RJegEkkHYWxeCRvA+pvAwUejQpz
 XlW3pZoiZOgVn99Axh+pUgt3suZ3GS/wPGfTOG4n40uhF599OzeBSeWfS
 xxnentjYZ9CtW7/Qk7Nu2GT7p0mTaFIoJY3MvsC3ZYz4crXr/Dg1IDjWD Q==;
X-CSE-ConnectionGUID: vktR6C+jTiafVGmTjVtObw==
X-CSE-MsgGUID: 7gK90fRRTge/YUoJ5Db8zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="92376410"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="92376410"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 03:40:27 -0700
X-CSE-ConnectionGUID: casCgyd6RPuQTy6nYFWnSQ==
X-CSE-MsgGUID: 7H6BfJNXQSG5CclEkVTLgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="246836784"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 03:40:28 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 03:40:26 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 29 May 2026 03:40:26 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.20) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 03:40:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BF6fuNNIvdirTnmpaxZJNFlWjgQrWQv8+Hfln2LPlGFVLklZcPr9jvcIAu/nwJ/tyZ+vENGFRpileUlVhI5iqV/ohwdGJFcHJflg54HIxWGboKEoKCZTc4j1jA6pupGuXYBZUmRhUHt066QboPzmI6SjgiGAZDPtUOFMEX9DylHC9vMbWXDYSToBtQhjUyHP/pjyUTqv78hCZLFaAqE8UajrMEvvw+dMqJW1vAwzLkcpP3eRAsfwvZvqs03byFPZzy5kPZq7D9trhx1d0AtLhmW7THCKGDrWkiVf/MGiynAwtDi/ZDlIKmkIh4LxLVAnypgKc353Q0bj94tk8c9qWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N0TNX9q9g6ISV/l3ydgCWYuPuyb0+fpo8gQOiLJ0mhk=;
 b=F+G9S8PnhNOq5ORfvRLvKI++T8EvJQ+ZbvzQ719sqt1uD0pVywrWKwZKQeNxxA7QqDVrTSVkyUB+Ehf3R4vsp+7LQ3weBzkpwB+I4TnApmoNaKRH80fENHj9cxDpF/e8FWOFWkm5zi9mMNRJaV9oHFqaDsMMlO/o4tG4Rp3Sc/P0P8usU6cQNztIYCF6GTPs61GSVmAxl1A/DKGo8RIU74hpem3XX45aPTurUv78rgwVrrzXZ5RYBof3jcF4PD4MYsnAxFy1rVBb6e/kko3lSYndr0OHCf+Eh0xiR2nhqtUxvG0KDqHjBfhRCUkFblM8TeAE8hWe2UFI7ZhF9uM1rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by SA2PR11MB4809.namprd11.prod.outlook.com (2603:10b6:806:112::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Fri, 29 May
 2026 10:40:19 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0071.014; Fri, 29 May 2026
 10:40:18 +0000
Message-ID: <6d0a6cb3-b9af-4430-8c08-5f1c5fb9649c@intel.com>
Date: Fri, 29 May 2026 16:10:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/15] drm/xe/xe_ras: Handle uncorrectable SoC Internal
 errors
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <soham.purkait@intel.com>
References: <20260525100619.3155663-17-riana.tauro@intel.com>
 <20260525100619.3155663-26-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260525100619.3155663-26-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0064.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::11) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|SA2PR11MB4809:EE_
X-MS-Office365-Filtering-Correlation-Id: 21c65525-93e6-47be-0a10-08debd6ead3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|22082099003|11063799006|56012099006|6133799003|4143699003;
X-Microsoft-Antispam-Message-Info: QzU6pIcnJFIQAB9Yibq5LA0c9SjAdXXGDXOs5AqchVzfLiACszGoevQp6uk/BnS2jBPMzuBoRI4OkbBpK4N8pwPtIrv/1ehY33kw8/Fi5F5onGSdYs3mjWaNx/JXsz7TelPPHN/ZgV2Y+VksJprhjR6Ocs5MRowOJPM1l1yVrq7IoN+kdAtP3w7Oljm/Hhma9PW0n7zoBA0nTLCdJhF9NM1YGKapqg8DzMgIo6NMPlblnnmqXfPRWlAXGsbg3d4zpFYgrO1lw7x1KhDOF/eS5N/iYVBbVWz2UTj0aiE6glK54m/TPrVGThyJ4fBAshn47f73q9CbjSQDrwc4if92SfowQH4AITnu93ZN1rDBwtXE1dX7okX4rgxaYjaA8iuzUowHrjrUXIzQSfmkLc4VkSCti7kM1GKnS7rMmMGVheiRO4Vw3Dqo28W/hRXtmooY2Gg7G9iIBoFVz3nPi7rW5EmSPjeP/R/PVIA8LYzKEEzl6YIHrfN0yC+s9cA+czMAxVthsJWMcmulWWRTmmKdSndu4mr05+5yQQ2Oy2cSyWv2Kf2PtbQRgQauCbjFRcoSyskxOdwyXbKXMhG5UzeGAlCMq1pciR7AN4f+WbYJfSLNM+/jZnNneBEE6IF+2vsyqHyus/3PndKlhf3xhU4bmJsQg9OAtVCpdV6ebPBU/wa8Fndq5XFXfKAiYn3IuW+d
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(6133799003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGYxMDdqSlRQZEpLVW9YZWdHNHpNalRUbW1KREtpOXFsakZYUzRRV09uekhD?=
 =?utf-8?B?UTByUTI0WWhweUN0a2RmTHRqSUtiZ0hUZlM3MWR1V3FCUzNSWEwvOXdSWHFW?=
 =?utf-8?B?VVhKV25nRDRab2I4K3pzZVlySlRrSU1Fb3lzQUc2NGV3bExKd2dzcjZ3aHli?=
 =?utf-8?B?Z012V2tpK3lRdTRyeVdJR1Fvd2VFMFZSTTRmODhzVk1FNTFHOGl0cStDY2FW?=
 =?utf-8?B?c0RDTHZjYWxXWmtDM3ZMcWJMSStqb0xvS2ZySEs4QnFXenBGYUJlbkNBMUtD?=
 =?utf-8?B?NWJ3eWxZN0lRL3c3Z1gvTU9RaEE5UGZiUWlGOVQ1bW9VWXlIbVpDbE8rckxx?=
 =?utf-8?B?VmFLVldLTTBCSU5QVVY3VWhmL0w5OUI4VldGbGwzdDhRRy8yMlFjdy9OZmIv?=
 =?utf-8?B?K0h3UUE3MzE5YjJLalo4V1p1SjYvRDlRMXJWanptSG1kcVFVYVhVT25rZDhp?=
 =?utf-8?B?L0ZSOXA4bHJBampWUi9NU1Nqc0xqMDZRdDJIYjI4dEdNZDQraTU1R3EvcE44?=
 =?utf-8?B?Rkw0MG9MOEQxdzM1UnFGL0RLVjZTdXZ5T1YyK0h0S2g1V2w2eFZJOHE2Mk9Y?=
 =?utf-8?B?cnh0aVd3aTdvd2RPbmVycDRpcW9CQ214NEFzY0lneFdJZXZtc2RrTGZYY1Z0?=
 =?utf-8?B?ZUpHY0FySTRPSXVsclh5VXYrakNlZHp1YmpNRDlURDNvaVhMbjhaV1lqVXpX?=
 =?utf-8?B?U1VhUFFKSitVY3hwL3NaYjJEeENIdzVvcmQzeGt5eUthbjB1SmVBUzVhQ0VH?=
 =?utf-8?B?b3lrelVoYTlQTFAwQmxUQit4S0d2Qy9DRWZCL0xIODg0SXZ6ZG1JMUlQK3J1?=
 =?utf-8?B?RUlPOVdFU0Zjdm1FR215M0sveWFoN28rcGZydWVBME0wOWhCOXFkOFFaOXl1?=
 =?utf-8?B?UnBGVUZNakk1dXY5Sy9xN1RPSmEvVWZMMVlGT1RyZUtld0NQMitibVhsUTVT?=
 =?utf-8?B?ZlF3MGZqODJ2R2JIcGFFdHN3Z1Z1d1VxZDVxeDg4N2V3L2s0MGlLS1NvZTY1?=
 =?utf-8?B?d2xSZ3VWaFpGWDZvRXczQ2FHMkJlNElQWXg2Z09nL29JTHpwT0ZmT1ZyY0U0?=
 =?utf-8?B?OE5WZUtucjB3eGNlV2hLbHlIR1ZwM0dueFlXdTdhNGM4Z010ME5yVDFKRVFG?=
 =?utf-8?B?MlBkbmNwUXhKcFpVVHJmS1F2c1EyVDdILzRhZU9naVdnWlB5Qms1NVRRcm40?=
 =?utf-8?B?WHp2VGd0VWRsMjVyK2JMOFJISHpjdHlKSkUyTmVodGNESGpqYXJ1Unc3d3dO?=
 =?utf-8?B?ZTBha3hJMEQ5RFNJU21OeFpvVDE3V3I1blNwakhKSCs3blk0dkllVFZnMmds?=
 =?utf-8?B?ZjRjWm9xQzY1ZGIzQTZjeUpnQnRDaTJRcjVYcWZua2FRQytmOXAvaFZLenpH?=
 =?utf-8?B?TDFMWVA1cTdxR0E3dE9iTzcrd2poMXN1L2RQdWQ3aTRvZlcyWW5NSUxYUkJR?=
 =?utf-8?B?Q1NMaHV3S012b3dNUGF2VEhXYVIyTHNZRjRGdTdLR1BqOUg5Sm04Z3VEU0pl?=
 =?utf-8?B?UFh3b0pHdXh0RzlpNDZBL1JnVnFkWFgxTHNYek0wRVZ5MHVsMk1hM3lWVzE4?=
 =?utf-8?B?aEJLb25zM3JXUGdUQlhpcEJpcjlab3orVW40Vy9YbkxLbDhteVI1dkpMNTdy?=
 =?utf-8?B?bTVETWVSQmpWRDU5MkpWK0hoRjdGd29UT2Nrd3JkRDIzQUpLR2dtRnRUdlh6?=
 =?utf-8?B?YVFuYnJ3eGFKVEN0d05LODA2emc4TVNuSzhHa1c1YkZaWkh6ZU5rRnEwVExZ?=
 =?utf-8?B?aGVONXlWLzdQQndjVjRDd2FhSENFYWRoa1FGdGtadllzL0VVcWZZcDRZV2Y2?=
 =?utf-8?B?WHIzQ2xjY3FUWUEvQWk5QUJoUXZmMS84SU1lbmxKc0ltdE90T2xSQmRGQVMy?=
 =?utf-8?B?azNpUjhwY0d3MExpSjlwZXhDMW9PYjhVWXNHVVVNaCtPR2VGb05pVTRRTEc0?=
 =?utf-8?B?NDE0dFRBemRTbG1HNW5TQ1ArNmxMOEF1WVc1blNwYjBMRDJvTTlidEJKb0ZT?=
 =?utf-8?B?T1VtN082aGZnUDZRYzhCM2VFL1BmbzJZRkcvWm9iVUhWOXdwQWxGd1Bta1Ny?=
 =?utf-8?B?azFBSlFDWXQ1aDJoTjhEU2szbFRUcFpGK25oc1lPZHJPVnJSTEdnWFlzRHdZ?=
 =?utf-8?B?emJGMFdhbGRLeHdXLzJlaGwrd3Z1Y1o1YUJCV1daQWlyZmExT0pvZlBTUXpY?=
 =?utf-8?B?RGpkS3VGaTZqWURyQ2VpZit0SGdsOXlUWlRHZGh4RHNrS0UwQ3R4a2o3eElD?=
 =?utf-8?B?T2s0L0dtMW5UUUJoYWppNkIyTGExRFAwamZaVFdMQis5Z0d2YjVJdzFBSGdI?=
 =?utf-8?B?UEVxK0graGFjMHUzN2JSRXRBY1dkTjAzRVFPU1JXcGhtelpSWGY3VVRFWkRK?=
 =?utf-8?Q?M6ymj5mSK14VI+VE=3D?=
X-Exchange-RoutingPolicyChecked: gGYnOV9V5Qwpc/XWLY5q5Dm6m6WHWtbiY7Uy1VaEp7ZtzqIBHkq59ib0Zfo4zzLiSU/w1l8ppTd4M5nr6H8fVseCjxIyFCP7T3RcwR9dE4jM36u5NZCEq7wweeEqoyWtpyvBDsEKzJycfczBBR9vc6s1+sxO/mXemi/IMjBNrB1726Nf06PRpH4MY80Oj2LaJQseM5FShBGXVF5FUW0MACnT36mYWCt6ROSZ7zsgf7pJN3h4Bu0OqQ92f01L+IcL5fm42ySnbyqnNAgwhmTAGw6xXuEtF85I6Xgc+3w4M+f85s+oK3Zw8K6jP3ynVtXlY8VORlWSNYNTzfiSJB3jww==
X-MS-Exchange-CrossTenant-Network-Message-Id: 21c65525-93e6-47be-0a10-08debd6ead3e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 10:40:18.7965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1+ERppwj4YcJ67Pc7eOc8JDObSjsWvNHi6qQbmCPSoY9eRrRNc0F7xJ0DBT2sEyquNYaAKexaGroFMIiCHs8PYeDc3o5/8hClOTDW+JTE2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4809
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


On 25-05-2026 03:36 pm, Riana Tauro wrote:
> Some critical errors such as CSC firmware and Punit are reported under SoC
> internal errors and require special handling.
>
> CSC errors are classified into hardware errors and firmware errors.
> Hardware errors can be recovered using a SBR (Secondary Bus Reset) whereas
> firmware errors are critical and require a firmware flash. On such errors,
> device is wedged and runtime survivability mode will be enabled to notify
> userspace that a firmware flash is required.
>
> PUNIT uncorrectable errors can only be recovered through a cold reset.
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v2: simplify soc structures
>      return error code for each SoC error (Mallesh)
>
> v3: squash patches (Raag)
>
> v4: re-use csc work
>
> v5: do not use csc work (Mallesh)
>      simplify structure member names
>      fix sparse warnings
> ---
>   drivers/gpu/drm/xe/xe_ras.c       | 45 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ras_types.h | 50 +++++++++++++++++++++++++++++++
>   2 files changed, 95 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 7f1d00011371..597c3af55a29 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -7,6 +7,7 @@
>   #include "xe_printk.h"
>   #include "xe_ras.h"
>   #include "xe_ras_types.h"
> +#include "xe_survivability_mode.h"
>   #include "xe_sysctrl.h"
>   #include "xe_sysctrl_event_types.h"
>   #include "xe_sysctrl_mailbox.h"
> @@ -89,6 +90,47 @@ static enum xe_ras_recovery_action handle_core_compute_errors(struct xe_ras_erro
>   	return XE_RAS_RECOVERY_ACTION_RECOVERED;
>   }
>   
> +static enum xe_ras_recovery_action handle_soc_internal_errors(struct xe_device *xe,
> +							      struct xe_ras_error_array *arr)
> +{
> +	struct xe_ras_soc_error *info = (void *)arr->details;
> +	struct xe_ras_soc_error_source *source = &info->source;
> +	struct xe_ras_error_class *counter = &arr->counter;
> +
> +	if (source->csc) {
> +		struct xe_ras_csc_error *csc_error = (void *)info->details;
> +
> +		/*
> +		 * CSC uncorrectable errors are classified as hardware errors and firmware errors.
> +		 * CSC firmware errors are critical errors that can be recovered only by firmware
> +		 * update via SPI driver. On a CSC firmware error, PCODE enables FDO mode and sets
> +		 * the bit in the capability register. On receiving this error, the driver enables
> +		 * runtime survivability mode which notifies userspace that a firmware update
> +		 * is required.
> +		 */
> +		if (csc_error->hec_fw_error) {
> +			xe_err(xe, "[RAS]: CSC %s detected: 0x%x\n",
> +			       sev_to_str(counter->common.severity),
> +			       csc_error->hec_fw_error);
> +			xe_survivability_mode_runtime_enable(xe);
> +			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
> +		}
> +	} else if (source->ieh) {
> +		struct xe_ras_ieh_error *ieh_error = (void *)info->details;
> +
> +		if (ieh_error->global_error_status & XE_RAS_SOC_IEH_PUNIT) {
> +			xe_err(xe, "[RAS]: PUNIT %s detected: 0x%x\n",
> +			       sev_to_str(counter->common.severity),
> +			       ieh_error->global_error_status);
> +			/* TODO: Add PUNIT error handling */
> +			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
> +		}
> +	}
> +
> +	/* For other SOC internal errors, request a reset as recovery mechanism */
> +	return XE_RAS_RECOVERY_ACTION_RESET;
> +}
> +
>   void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>   				      struct xe_sysctrl_event_response *response)
>   {
> @@ -177,6 +219,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>   			case XE_RAS_COMP_CORE_COMPUTE:
>   				action = handle_core_compute_errors(arr);
>   				break;
> +			case XE_RAS_COMP_SOC_INTERNAL:
> +				action = handle_soc_internal_errors(xe, arr);
> +				break;
>   			default:
>   				/* For any other component, reset */
>   				action = XE_RAS_RECOVERY_ACTION_RESET;
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index 3ffd7baa7a8c..2749ba0b0239 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -10,6 +10,7 @@
>   
>   #define XE_RAS_NUM_ERROR_ARR			3
>   #define XE_RAS_NUM_COUNTERS			16
> +#define XE_RAS_SOC_IEH_PUNIT			BIT(1)
>   
>   /**
>    * enum xe_ras_recovery_action - RAS recovery actions
> @@ -125,4 +126,53 @@ struct xe_ras_compute_error {
>   	u32 reserved[15];
>   } __packed;
>   
> +/**
> + * struct xe_ras_soc_error_source - Source of SoC error
> + */
> +struct xe_ras_soc_error_source {
> +	/** @csc: CSC */
> +	u32 csc:1;
> +	/** @ieh: IEH (Integrated Error Handler) */
> +	u32 ieh:1;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved:30;
> +} __packed;
> +
> +/**
> + * struct xe_ras_soc_error - Error details of SoC internal error
> + */
> +struct xe_ras_soc_error {
> +	/** @source: Error source */
> +	struct xe_ras_soc_error_source source;
> +	/** @details: Error details specific to the error source */
> +	u32 details[15];
> +} __packed;
> +
> +/**
> + * struct xe_ras_csc_error - CSC error details
> + */
> +struct xe_ras_csc_error {
> +	/** @reserved: Reserved */
> +	u32 reserved;
> +	/** @hec_fw_error: CSC firmware error */
> +	u32 hec_fw_error;
> +} __packed;
> +
> +/**
> + * struct xe_ras_ieh_error - SoC IEH (Integrated Error Handler) error details
> + */
> +struct xe_ras_ieh_error {
> +	/** @ieh_instance: IEH instance */
> +	u32 ieh_instance:2;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved:30;
> +	/** @global_error_status: Global error status */
> +	u32 global_error_status;
> +	/** @local_error_status: Local error status */
> +	u32 local_error_status;
> +	/** @gerr_mask: Global error mask */
> +	u32 gerr_mask;
> +	/** @info: Additional information */
> +	u32 info[10];
> +} __packed;
>   #endif
