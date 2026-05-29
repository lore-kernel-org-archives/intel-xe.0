Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE157CD6E45
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 07:52:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A10B110FA5B;
	Fri, 29 May 2026 07:52:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dbAVyldi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A51910FA5B
 for <intel-xe@lists.freedesktop.org>; Fri, 29 May 2026 07:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780041148; x=1811577148;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=z6IAEDwyMCMwUWRG32jZR1H8Uf4klmQMlPl9rMiEvXo=;
 b=dbAVyldifbWhSzYP8zDuXxex5/SRklG1dld3tVoTBSgrPLzRYw3Tipu8
 Kzjjbxz1cftgAx8JD6F9QgJd0tlhjENTFBiPcx10R53XhIXTpVQ0sW1WA
 5tHylSbZREOWGnxni3wNAaICoyQGeeKdIAkUX3OoYRXPHajpBctp3ekZs
 CqDxxXmpnOU8cBkSkF7XJtF5Rc9v6JjMV1bWW5DOujvXFzTdXqH7BZlvQ
 xVprFDPmZRPMM0bXmKayHIDvMWhA01qAjQg4+fQzuSYYK6lpmGAQVeXZ7
 Bw5jqtNR0pnEbgXDZZTujLrweRsR/NZYkiGijEYQAn/WFbWe1wzcGid6G A==;
X-CSE-ConnectionGUID: 3IIjMs6MSoKAd6p+jSDKxw==
X-CSE-MsgGUID: OqrMxM1HQpCN3BUe6WBRfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="84778295"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="84778295"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 00:52:27 -0700
X-CSE-ConnectionGUID: iwGtGux3QNe5yhetHEaliA==
X-CSE-MsgGUID: 6a6RoSEPRgGYJTKJF3yv9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="238384963"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 00:52:25 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 00:52:24 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 29 May 2026 00:52:24 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.20) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 00:52:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aDKSnXusW8uo16x80ORbXafyPuNOkZd75EmzNAZerSKTlWmfkTaqfYmLKoIdvu4vz0juVSrWe/KnutItJaulQntreyEOZhg2pJUEBWQxcKHb0TbPycUbB/uzz06XA0ob8inGl+LaPe+FPaGUU2wdtNzM/1GD5eTBjvQD6b/ZqiK6q1ekoT9OgI1r21utJqxOp36VztZz5Lk7SlrrCi/mmQAb7XXtbhM04/OWivulVbeYmW08/XF6gc26b5fjKKURCCPi+9SYD1zzh1b+b65r6Oj9lokzQ2/u+4bN9QRpZ2YW4zvQmFNDzezEI52ZtenXNEwlO1EqZ6ilHB2K5MZaRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pV8OHhKdkSNvhjl9xi/uKQKGmlhW1Xyw9DrI0eUMUyI=;
 b=tcz4Tx9RJSCuJbIGM2YSHD7Fw1iIUjiTqxJTi4wY429UuH6ifY3QjJXa06EUZ+H4SGtFrab1EJxEf+qESM1HMv45G12oQBWhKiYCDmRt2w17Z39g+ve/qltEFI8GU6a1k4Ery3AJSe06TN+nOtKSKl+SuefRiz3rmTZKLMuH9/CvrJIWTv7XmsXcUnBlfE0xgxauF4Sk/1etXOgI26noMIboY7cSCmLVPKupdEtftaaR6Y2WR9HUZva9qmoEh2A1O3XhCI1sRBnwJzEOY+EwVZDu7fDVZyjF244aGGrQlNbsgwJiRR/0BmOzbHX70LKdFgmhw6Fw7mXiD6u4cPmlVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS7PR11MB7691.namprd11.prod.outlook.com (2603:10b6:8:e4::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.15; Fri, 29 May 2026 07:52:20 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 07:52:20 +0000
Message-ID: <49b334e2-a40c-4d6f-95f0-9cf5e959d717@intel.com>
Date: Fri, 29 May 2026 13:22:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] drm/xe: Unify fault injection hooks for CSC, GT reset
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <karthik.poosa@intel.com>,
 <sk.anirban@intel.com>, <raag.jadav@intel.com>
References: <20260522120628.538631-2-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260522120628.538631-2-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0330.namprd03.prod.outlook.com
 (2603:10b6:303:dd::35) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS7PR11MB7691:EE_
X-MS-Office365-Filtering-Correlation-Id: 19cecb7e-021e-4c4c-0d40-08debd573645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|6133799003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 9kewxlXZzU9z11m08ThtBIdswd7/dfXjkAQgbzmGjHojfCQgTyJHtPVy9syHZjRJLqyfXNoNmXDVVqRZ2+4mvO+suGpsT2PPkahL/HbhDeCX8+4cbIFiVua85r+CsEIo1nep/136KPIurpcKyL8wuWYHtMz7WwKFEZgK0Eu7Sg0IEkEKTvpOH+LXHCBXPbbto1WdlqHDdtRnVlj//2p0MrBptUEZwWYcly5tyBI4Ql5wVckJbdtZZeJOYZ4SRsr6tLWdFX4jCGAtUggsfH3oYnMxUk3DfFGiMhsRSknptRxA+SQz6s+7O3NP1ntOko1Nw5CDtcwnQ7Q7VDoQUTeuvuD/MaizqzeqlNX37rjDyivGsThmpxqFknt9wv2ZvObBPn8TRwodtfi8/truQfYEa3uUmRT8hhmo35d8QbN5MSRLhC1PkAmdcctLegm+t4qEOnxyRJTJSm2jZPnvEWAjYukTmn8muZYmodG1L0o1bnMY9i/PWy4PL75r1cq0AsDe5Xnf7dl+dBsS2bSp6dnQy9TfIQvQS+lUI1/gsWnrxpWNGNarlnJz/c+FMVpYYyAeIPcepTxkB71kyb0goATYAbg2zqMnWvpMRtItjxPnUmVKNimpni21sem0Oel/VgNKMRQpDbcr7/hf8jlvogqaZkIm52jw4zqzKjCxZ/OQrL2mQ6iO0P0z9Pk/nPu6s0ei3+fQGUJjMtkyj2tVhsP6CQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(6133799003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUwvSW5VN0g2elRoemtEMTdOazlyUE5mUGVzbjhSZUhWcUozT09mVU1Nb1F3?=
 =?utf-8?B?WlA2bUVFRzV4R29UbFd4N3pHWGs1UENJc3NET3JpSmFNY2liUldXbVpzWnpY?=
 =?utf-8?B?WWpPRVJjSFE2M3V6ZEtZdkJkSGQ4VjJYTWNwb0VYZG5QS2g0R2xZTkpoeXpC?=
 =?utf-8?B?aXkxemc4V0lqbjZFcHpmSld2QWVYdEo3c25pSG5JUzFyQ2lkUWEwQmRDbUQw?=
 =?utf-8?B?VG40VXNrbEtwa0RHanYzS3ZaRkdjWnRhK3F5LzNEck5uY3NOWmoxWU5xQTRt?=
 =?utf-8?B?cWFHRnIwaUhBcHp3TmVzejZvNHhQL2ZwUUxnUDNhZkhFbHlLcm9ycldoczBU?=
 =?utf-8?B?MlFmM3hhU25IWlNZa2piRkI3Nm1zSjNVSzlNeGpmOFF0ekg0aDh2RnlJSzFT?=
 =?utf-8?B?Q0ttdVptRWpOTDhkS3pwbitRYUZvUmNubFlRNm9xcjFERFlESVFzcXVhWFZJ?=
 =?utf-8?B?KzV3WStYRC8yWm9UOW4zRVBqZkt6L1ZEV0Rna3o3bjliemVBUGxuY09TbXNL?=
 =?utf-8?B?OFBBT0E4VmNOMmx3YXF4VFZ5Y3kwdDZCMXZ5REdVUUlhczFYZi9OS2VKM1pT?=
 =?utf-8?B?cUJzOVBRMHNSODlyMStLTFJGWmJDZzJ3akxjYkh6Y0pTd05iMzVkRGlSNEtn?=
 =?utf-8?B?T3NIYVg5VlQxUGx1MHkwbVRidElLYkJ4MDhlaGJNSFhoWGZLb2wva0pmMzlW?=
 =?utf-8?B?ZE1aU0JacWtXcTNvQVh2K3ZrcVBwT2dhWncyMkpjWENYMFEyZWRnbkdQck04?=
 =?utf-8?B?dlREODZpTG04MUxNT3pMalVrODROOE4xWm5MNUxSVldQYU51bGRFTjVmY29y?=
 =?utf-8?B?SWhlUFhoUzVvK0FSRnI2eUlpQTdVOHVLQ3ArSFBiZFVHa09SNTB0NUx3Nzhh?=
 =?utf-8?B?aUJlRE5ha0VRdkhwUFU1MlhFbkRIMmRJbU9mbkJXb0VlWUhvTDB4UEhwT2Vr?=
 =?utf-8?B?Vmw4V3pldkJpNnRMUkR2aDUrdEUvTGc2dkw5MVBrN2RXWWdncERpZkwwL0xv?=
 =?utf-8?B?dnlpeSszTjhNcG1nc3E2ak5GT0JCcVk5MjkrR2pNN25SVllPcFhTT2pzZ2xj?=
 =?utf-8?B?WitJYUVnRGVucUQ0RnRTeFBSWFdLKzV2enVqaDBzb20xMnNURFo4RWR1Mk1H?=
 =?utf-8?B?K1lvcHM5WnJGNFJiT3UvZ3FvdUYzUjJXeHJBaTZyWWRNQVdlRlhNYmtnMUhP?=
 =?utf-8?B?L2c0dWhYak9sOE1XVUp2SnRhL1c5R3d2MG1mSDJlOVJpSmtFdnpRL1B2Z0Z2?=
 =?utf-8?B?K2k5NVBhU05sMFZKL2xJejJtaEZPTVlNR25EU0p4Y1lQZ0dXdkJ4dDEySVNR?=
 =?utf-8?B?cnRZdjZ2WmJJUnFDWFU1R2FWNVh4UkU4V2FWQXZMRGR2SnI1WXVBUnAranMy?=
 =?utf-8?B?RDdaS0Y2RjE4Tzc4VFphc3JlVVZvb01UUFNvT0hMSTVnOU9EbUlDQ1NHNlVE?=
 =?utf-8?B?STA4MHp0dUxSYTgraExBOW5jcncranZ1d1RPSUltb0dCUEpnVHczVWZPc0gv?=
 =?utf-8?B?SVhuNjFrcXExTWowVDBwblo3MnZGVWpLYXJ2V2hqQWxSUFRzODMzcHJQNFBt?=
 =?utf-8?B?RkpIQkdMZVFtRFlMWCtESHUyako1U2F0WDJqK1lPTFI2MTlkVy9Bbi9FY2JN?=
 =?utf-8?B?VGpiRE9WVUpkdlp2TWhPVk9TbFpXUG01Y0tqSTIwYUxyU2l4UDRoY1FkMmxT?=
 =?utf-8?B?bzNtSkpRdWx1MkhvWEdUNjlqSTFSYTFBSHpYemdVRkZTcndQMzd5Z2I5dzJV?=
 =?utf-8?B?Q1pXa3hLUmFSNEJuQ0Zka1FmdWVJaGN0OEphWkFkV0F0M1Y3akpzN0RBWVZS?=
 =?utf-8?B?VHB6NUE0TXlXR3g1QnROU2t5UEhOS0lNaXg2Ykt0TDZpaUNvY05oenZiSzM2?=
 =?utf-8?B?RjJwNVRyL0R2aWxNTTEvaGxtS3M1WWN6MlQ2OXdjSEFLQnlSbTQyYXZkL0hN?=
 =?utf-8?B?cUcvc3BGZHpWekZUaWxqcEZlcW93WWVEN1hKa3o1WHRMeHpLcTR0YUF6a3JS?=
 =?utf-8?B?TTJuTWVaaHdGMHZrcnJCQmkyR25oa3doM0czTi9YK1p4dWxUTjFBNFRCdEcr?=
 =?utf-8?B?cXNXeStSMWhCck5LZnpyQktjVnFnUmRrODdaNzN4QkNxTWxHQm8yOGt0MTk2?=
 =?utf-8?B?R0pPWmpPRkNaVnF6U2ZVcTlZc2RRQm5PTXVWMmhUNkcrRmhYOEkvczZrUDhC?=
 =?utf-8?B?UHFTMCtYV2VLVkRVS0lINlFwOWw4d2l4Y2FVZ0xkdE9HRTNFTDJtWk5rMjlr?=
 =?utf-8?B?RFlmNGsrd3MzaEhLbTFHM2NJU2Y3WFd5TnVxV3pSc1FuUk5zWEVSNTJmZTVm?=
 =?utf-8?B?VCtER2RRUEIveXBJOU5Hay83YUtPRGlqTlJma29OYThTcVZsR3BmZz09?=
X-Exchange-RoutingPolicyChecked: geSJ5NhvfpXEV0DyPkYp3E0LzPMt9aVX8qOZhfvgfSsrsg3sNCR/U/lB2+xUut4zFJAcUQBh1UIOWbtHGxgJCeH1NzohTXJMeycHcpwkJ656rKLfwQf07IiSNY6t7vJjgPeEf8DPVXrTlRmAwk7fGFotRkci+FLv2r1wr/H05LZE7t9HpmT2czxp7/vQiuh8s/tSQv+LgfBWEWB1MPzT2uFmHnMezuzj0sE8OOI1Eu0W2Qyq8vTzexEVEFXDu/c39ytysG6Hj3BIDybol4RKsF1zFer5d5R+3NmLBduznQY+vecF59SlZz+IlAKH5mdXNbxyAl0O5GH0LD12tXrZ4A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 19cecb7e-021e-4c4c-0d40-08debd573645
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 07:52:20.5017 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y3C1N+FyNpajebjxOVReQW/1T25xd6ujzm0iHW5gF0ZN06dB3ZCutwx+Xw/YLI9hk2GVVkiscJjxdEVYpVOBFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7691
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


On 5/22/2026 5:36 PM, Mallesh Koujalagi wrote:
> The fault injection code was scattered: the GT reset
> hook lived in xe_gt.h as an inline function with its own global
> variable, the CSC hook had a separate global in xe_hw_error.c with
> an extern declaration, and each was individually registered in
> xe_debugfs.c. Adding a new error type meant editing many files and
> copy-pasting the same boilerplate.


Since Xe kmd supports other fault injection mechanisms such as 
fail_function which injects error with ALLOW_ERROR_INJECTION.
This patch does not cover all fault injection hooks.

If we are only picking debugfs hooks. This is not really unifying fault 
injection.
Can you please elaborate why this is needed?

Thanks
Riana

>
> Create a single, centralized fault injection module
> (xe_fault_inject.c/h) that manages all fault types through
> one table. Each type is just an entry in an enum and a one-line
> row in a descriptor array -- no more scattered globals,
> externs, or per-type inline helpers.
>
> Debugfs interface (under /sys/kernel/debug/dri/0/):
>   - fail_gt_reset         - GT reset failure
>   - inject_csc_hw_error   - CSC firmware error
>
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
> v2:
> - Add multiple platform support. (Vinay)
> - Handle VF properly.
> - Rename to XE_FAULT_GT_RESET/XE_FAULT_CSC_HW_ERROR and
>    create xe_fault_inject_types.h file including those name.
>
> v3:
> - Solved patch apply issue on tip.
>
> v4:
> - Add proper header file.
>
> v5:
> - Properly refer FAULT_ATTR_INITIALIZER. (Vinay)
> - Change xe_fault_inject_descs to xe_fault_inject_entry.
> - Change 2025 to 2026.
>
> v6:
> - Change return comments of xe_fault_inject(). (Riana)
> - Remove full description of xe_fault_inject_debugfs_register().
> ---
>   drivers/gpu/drm/xe/Makefile                |  2 +
>   drivers/gpu/drm/xe/xe_debugfs.c            |  9 +---
>   drivers/gpu/drm/xe/xe_fault_inject.c       | 62 ++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_fault_inject.h       | 31 +++++++++++
>   drivers/gpu/drm/xe/xe_fault_inject_types.h | 21 ++++++++
>   drivers/gpu/drm/xe/xe_gt.c                 |  5 +-
>   drivers/gpu/drm/xe/xe_gt.h                 |  8 ---
>   drivers/gpu/drm/xe/xe_hw_error.c           | 11 +---
>   8 files changed, 123 insertions(+), 26 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_fault_inject.c
>   create mode 100644 drivers/gpu/drm/xe/xe_fault_inject.h
>   create mode 100644 drivers/gpu/drm/xe/xe_fault_inject_types.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 09661f079d03..d4acb8e9c3b7 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -361,6 +361,8 @@ ifeq ($(CONFIG_DEBUG_FS),y)
>   
>   	xe-$(CONFIG_PCI_IOV) += xe_gt_sriov_pf_debugfs.o
>   
> +	xe-$(CONFIG_FAULT_INJECTION) += xe_fault_inject.o
> +
>   	xe-$(CONFIG_DRM_XE_DISPLAY) += \
>   		i915-display/intel_display_debugfs.o \
>   		i915-display/intel_display_debugfs_params.o \
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 22b471303984..8402189b24ef 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -6,7 +6,6 @@
>   #include "xe_debugfs.h"
>   
>   #include <linux/debugfs.h>
> -#include <linux/fault-inject.h>
>   #include <linux/string_helpers.h>
>   
>   #include <drm/drm_debugfs.h>
> @@ -14,6 +13,7 @@
>   #include "regs/xe_pmt.h"
>   #include "xe_bo.h"
>   #include "xe_device.h"
> +#include "xe_fault_inject.h"
>   #include "xe_force_wake.h"
>   #include "xe_gt.h"
>   #include "xe_gt_debugfs.h"
> @@ -38,9 +38,6 @@
>   #include "xe_vm.h"
>   #endif
>   
> -DECLARE_FAULT_ATTR(gt_reset_failure);
> -DECLARE_FAULT_ATTR(inject_csc_hw_error);
> -
>   static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
>   				   u32 offset, const char *name, struct drm_printer *p)
>   {
> @@ -563,8 +560,6 @@ void xe_debugfs_register(struct xe_device *xe)
>   		drm_debugfs_create_files(debugfs_residencies,
>   					 ARRAY_SIZE(debugfs_residencies),
>   					 root, minor);
> -		fault_create_debugfs_attr("inject_csc_hw_error", root,
> -					  &inject_csc_hw_error);
>   	}
>   
>   	debugfs_create_file("forcewake_all", 0400, root, xe,
> @@ -610,7 +605,7 @@ void xe_debugfs_register(struct xe_device *xe)
>   
>   	xe_psmi_debugfs_register(xe);
>   
> -	fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_failure);
> +	xe_fault_inject_debugfs_register(xe, root);
>   
>   	if (IS_SRIOV_PF(xe))
>   		xe_sriov_pf_debugfs_register(xe, root);
> diff --git a/drivers/gpu/drm/xe/xe_fault_inject.c b/drivers/gpu/drm/xe/xe_fault_inject.c
> new file mode 100644
> index 000000000000..096e1949624d
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_fault_inject.c
> @@ -0,0 +1,62 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/fault-inject.h>
> +
> +#include "xe_device.h"
> +#include "xe_fault_inject.h"
> +#include "xe_platform_types.h"
> +#include "xe_sriov.h"
> +
> +static struct {
> +	const char *name;
> +	u32 platforms;
> +	bool skip_on_vf;
> +	struct fault_attr attr;
> +} xe_fault_inject_entry[XE_FAULT_MAX] = {
> +	[XE_FAULT_GT_RESET]	= { .name = "fail_gt_reset",
> +				    .attr = FAULT_ATTR_INITIALIZER },
> +	[XE_FAULT_CSC_HW_ERROR]	= { .name = "inject_csc_hw_error",
> +				    .platforms = BIT(XE_BATTLEMAGE),
> +				    .skip_on_vf = true,
> +				    .attr = FAULT_ATTR_INITIALIZER },
> +};
> +
> +/**
> + * xe_fault_inject - Check if a fault should be injected
> + * @type: fault injection type to check
> + *
> + * Return: true if fault injection is triggered, false otherwise.
> + */
> +bool xe_fault_inject(enum xe_fault_type type)
> +{
> +	if (type >= XE_FAULT_MAX)
> +		return false;
> +
> +	return should_fail(&xe_fault_inject_entry[type].attr, 1);
> +}
> +
> +/**
> + * xe_fault_inject_debugfs_register - Register fault injection debugfs entries
> + * @xe: xe device instance
> + * @root: debugfs root directory
> + */
> +void xe_fault_inject_debugfs_register(struct xe_device *xe, struct dentry *root)
> +{
> +	int i;
> +
> +	for (i = 0; i < XE_FAULT_MAX; i++) {
> +		if (IS_SRIOV_VF(xe) && xe_fault_inject_entry[i].skip_on_vf)
> +			continue;
> +
> +		if (xe_fault_inject_entry[i].platforms &&
> +		    !(xe_fault_inject_entry[i].platforms & BIT(xe->info.platform)))
> +			continue;
> +
> +		fault_create_debugfs_attr(xe_fault_inject_entry[i].name, root,
> +					  &xe_fault_inject_entry[i].attr);
> +	}
> +}
> diff --git a/drivers/gpu/drm/xe/xe_fault_inject.h b/drivers/gpu/drm/xe/xe_fault_inject.h
> new file mode 100644
> index 000000000000..91883ffb5f4b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_fault_inject.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_FAULT_INJECT_H_
> +#define _XE_FAULT_INJECT_H_
> +
> +#include <linux/types.h>
> +
> +#include "xe_fault_inject_types.h"
> +
> +struct xe_device;
> +struct dentry;
> +
> +#if IS_ENABLED(CONFIG_DEBUG_FS) && IS_ENABLED(CONFIG_FAULT_INJECTION)
> +bool xe_fault_inject(enum xe_fault_type type);
> +void xe_fault_inject_debugfs_register(struct xe_device *xe, struct dentry *root);
> +#else
> +static inline bool xe_fault_inject(enum xe_fault_type type)
> +{
> +	return false;
> +}
> +
> +static inline void xe_fault_inject_debugfs_register(struct xe_device *xe,
> +						    struct dentry *root)
> +{
> +}
> +#endif
> +
> +#endif /* _XE_FAULT_INJECT_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_fault_inject_types.h b/drivers/gpu/drm/xe/xe_fault_inject_types.h
> new file mode 100644
> index 000000000000..d5402b5a3fd6
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_fault_inject_types.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_FAULT_INJECT_TYPES_H_
> +#define _XE_FAULT_INJECT_TYPES_H_
> +
> +/**
> + * enum xe_fault_type - Fault injection types
> + * @XE_FAULT_GT_RESET: GT reset failure injection
> + * @XE_FAULT_CSC_HW_ERROR: CSC hardware error injection
> + * @XE_FAULT_MAX: Number of fault injection types
> + */
> +enum xe_fault_type {
> +	XE_FAULT_GT_RESET,
> +	XE_FAULT_CSC_HW_ERROR,
> +	XE_FAULT_MAX
> +};
> +
> +#endif /* _XE_FAULT_INJECT_TYPES_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 783eb6d631b5..242683cd5906 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -25,6 +25,7 @@
>   #include "xe_eu_stall.h"
>   #include "xe_exec_queue.h"
>   #include "xe_execlist.h"
> +#include "xe_fault_inject.h"
>   #include "xe_force_wake.h"
>   #include "xe_ggtt.h"
>   #include "xe_gsc.h"
> @@ -923,7 +924,7 @@ static void gt_reset_worker(struct work_struct *w)
>   
>   	xe_gt_info(gt, "reset started\n");
>   
> -	if (xe_fault_inject_gt_reset()) {
> +	if (xe_fault_inject(XE_FAULT_GT_RESET)) {
>   		err = -ECANCELED;
>   		goto err_fail;
>   	}
> @@ -980,7 +981,7 @@ void xe_gt_reset_async(struct xe_gt *gt)
>   	xe_gt_info(gt, "trying reset from %ps\n", __builtin_return_address(0));
>   
>   	/* Don't do a reset while one is already in flight */
> -	if (!xe_fault_inject_gt_reset() && xe_uc_reset_prepare(&gt->uc))
> +	if (!xe_fault_inject(XE_FAULT_GT_RESET) && xe_uc_reset_prepare(&gt->uc))
>   		return;
>   
>   	xe_gt_info(gt, "reset queued\n");
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 4150aa594f05..f8e3ca63aabb 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -6,8 +6,6 @@
>   #ifndef _XE_GT_H_
>   #define _XE_GT_H_
>   
> -#include <linux/fault-inject.h>
> -
>   #include <drm/drm_util.h>
>   
>   #include "xe_device.h"
> @@ -38,12 +36,6 @@
>   	xe_gt_is_media_type(gt_) ? MEDIA_VER(xe) : GRAPHICS_VER(xe); \
>   })
>   
> -extern struct fault_attr gt_reset_failure;
> -static inline bool xe_fault_inject_gt_reset(void)
> -{
> -	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&gt_reset_failure, 1);
> -}
> -
>   struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
>   int xe_gt_init_early(struct xe_gt *gt);
>   int xe_gt_init(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index 5135e8e4093f..192e68e847a5 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -4,7 +4,6 @@
>    */
>   
>   #include <linux/bitmap.h>
> -#include <linux/fault-inject.h>
>   
>   #include "regs/xe_gsc_regs.h"
>   #include "regs/xe_hw_error_regs.h"
> @@ -12,6 +11,7 @@
>   
>   #include "xe_device.h"
>   #include "xe_drm_ras.h"
> +#include "xe_fault_inject.h"
>   #include "xe_hw_error.h"
>   #include "xe_mmio.h"
>   #include "xe_survivability_mode.h"
> @@ -25,8 +25,6 @@
>   						 (PVC_COR_ERR_MASK & REG_BIT(err_bit)) : \
>   						 (PVC_FAT_ERR_MASK & REG_BIT(err_bit)))
>   
> -extern struct fault_attr inject_csc_hw_error;
> -
>   static const char * const error_severity[] = DRM_XE_RAS_ERROR_SEVERITY_NAMES;
>   
>   static const char * const hec_uncorrected_fw_errors[] = {
> @@ -167,11 +165,6 @@ static_assert(ARRAY_SIZE(pvc_master_local_nonfatal_err_reg) == XE_RAS_REG_SIZE);
>   						 pvc_master_local_fatal_err_reg : \
>   						 pvc_master_local_nonfatal_err_reg)
>   
> -static bool fault_inject_csc_hw_error(void)
> -{
> -	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&inject_csc_hw_error, 1);
> -}
> -
>   static void csc_hw_error_work(struct work_struct *work)
>   {
>   	struct xe_tile *tile = container_of(work, typeof(*tile), csc_hw_error_work);
> @@ -507,7 +500,7 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
>   {
>   	enum hardware_error hw_err;
>   
> -	if (fault_inject_csc_hw_error())
> +	if (xe_fault_inject(XE_FAULT_CSC_HW_ERROR))
>   		schedule_work(&tile->csc_hw_error_work);
>   
>   	for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++) {
