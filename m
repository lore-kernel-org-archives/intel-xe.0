Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5175C624DE
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 06:21:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44CF810E03E;
	Thu,  3 Sep 2026 06:21:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MH5mYA9s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E5D10E03E;
 Thu,  3 Sep 2026 06:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788416495; x=1819952495;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tA7eWaDW1b03XxcXmp5i69lSuxU1Rhml7kcj5wzoUxU=;
 b=MH5mYA9sqo2HvWSQcboX8xp8Ra/zV7pEACLkXWSsFOyetghOs5+bep+c
 szwxZqN2CM6kOoloSoQap/XoYZL8XjvxUl2QPtw8nlfO2r9Z7G5Ool3ZL
 2TIkB5KjezEkGJyFM5xm4j/fK8Lvy1RS85Eq7hrcLtNwODJJnD1WCYVcL
 O84+jU94HHNA6N5LJPytv7SiyWGa5GjNMcVxOAQSDt+YonKEcG0pISE9m
 xWu322hsLx+d4DjtJLS34MQkKpecV3v3P7qk4CUEnN0vL/OHWlq2pqmNz
 TcuVzV4sN+8p7siugsApK5EZs1jCpXHfOcVeafoZSDoDnjYE5JS7QI/+O g==;
X-CSE-ConnectionGUID: cTj2oqGCQXG+Q5URY8X1aw==
X-CSE-MsgGUID: SMtwBkeOQtu2fseEOEKuGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="106406599"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="106406599"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 23:21:35 -0700
X-CSE-ConnectionGUID: IT3Yl8b3SdGsTd73xOWvJw==
X-CSE-MsgGUID: szd2WeLXSmuejj6JdKdcZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="273776502"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 23:21:34 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 23:21:33 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 23:21:33 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.59) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 23:21:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lzBQTaawquTXG07UVtXVz85z7AxKHCFSzT/6AFyQgsl2dZvW5S1wgcOvgOFWcUowezWOh8Vn1yuteP2p6QcVO7dVgmNgpN4DG10rAPWMs/Unem9aW9yF9lxKC9YqOcvfEfm0Q1qAlx7mhnRMcn+2Fwf6UZwHijzAxkSCHMlRSktDB1az+MALnIMNHisyjcHKncTCv6SKi5SpFxhc/MKaqzEJTJu8pjd1duxTTq/aPU+KCvVRlqkE5hW01Ony+e1ifX+d57cSrJPkgh7NvGy+7gLfRHPXC4RP3Flju/U17nSKxhqypFkNddynnq32iqLKL+KoBBLEXAh2FWyvjWJ97g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ZgTjmLdSi0i1z2piR/YdsRtQ2HSA8ldL9xEhHHgJsU=;
 b=HSNlOAGnCPrOKIVsWTXoJJpv5EfEYUGfV19s47C62xTukQhaKTRn/m1s0zFZ9sEoeshRlsIcTtLNRXBhTkIxS17ByFPw/JaGGs64il7IGYu+QzgRiKB+1r62Id6ATbp/Bf7mIf4q6YJ9/uiJ0Ngb5BfzEzY3rhIIbMGhFQxiCnBBdHStxIdqWhG1473P5ISnTtquUAB3/JSmq4L0h2InwJDXlDvvNu6VMzafsHgwwoX67Oijme7echWyyPurb9FAsLkDSXGVZCvqEhc9GBqGSK2bN30F6rttHuHeroEH9GWLMe+agHdRsuOO5p9sog18ORp88R72r3XR+HxLH/nyGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by IA1PR11MB7856.namprd11.prod.outlook.com (2603:10b6:208:3f5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 3 Sep
 2026 06:21:31 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 06:21:31 +0000
Message-ID: <3d548376-1f27-45b1-9153-ea48b38f57da@intel.com>
Date: Thu, 3 Sep 2026 11:51:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v4 3/4] drm/i915/display: Reprogram AS SDP skip frames on
 seamless VRR transitions
To: Uma Shankar <uma.shankar@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
CC: <dibin.moolakadan.subrahmanian@intel.com>
References: <20260831213421.1804635-1-uma.shankar@intel.com>
 <20260831213421.1804635-4-uma.shankar@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260831213421.1804635-4-uma.shankar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR21CA0005.namprd21.prod.outlook.com
 (2603:10b6:a03:114::15) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|IA1PR11MB7856:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e54a6b5-94c0-4933-7b2f-08df0983982c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|10067099003|3023799007|4143699003|18002099003|22082099003|5023799004|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: A+3lUj3hC2JA9tc8mHm7U9OZ/fngQliZRfx3Hrbw8bR+WOdU6KRDfTFbqwxPZmoWU4ZbBkF9pVaFqqqq/dRNPusY/EcVLIXnl/7wnDjAYhGegXzxHxw/nTOHsNtVV2kwH4yMSbBzbKjY13lWPY2I8iK/3W/4vvRqqJ5odFLqgUFE3ygO3UGwPg6YsQfrVdYlChqJmurFVC9DgycfnX/EZ91gGtMeVrFNGFKXhMjWFmf1db/jcp6/IBQi/xrI+bjHVfhAPU2pTOpOa0Cz5+t/8Q64RQQ3CKYmilrVMlAnwehIDOCWnVeTeO7vMNbO2/iqx/D7MHUXUZ+eMPwKLV5ZHNBiU3dkmHta9S94OsfHROQHsFxU0CWgJgJpf+hMIzWRU+QjIV6lJ3YiOZ9UFO4zsgudxpb7ukkS3H7JayX332d5lmWoQNPboMUNznvEHJGe3EMiLFGIickMYoGmO99LMODB7i24FekF1WtNP18nlUt4u1sz34FgpI/p4Zu8P9JUkPVs066z1ms2djjzVZZyx9NAphr5dwm4SWEjfroVjltoUQu0iTqbuPWg5ypJ6YHwm/ab+rhxGi/0VLw0nn4nvny1+Us/lsZy7zkYE6bQlCFVSENtk/L3WkCLVOGAz2+reaVFdCtdj0zqvwRaprefRzCv6t4dfbxjGrkwtZUdGMQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(3023799007)(4143699003)(18002099003)(22082099003)(5023799004)(11063799006)(6133799003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUpHZVpNY2dmYkxlenhoTlBwOVBDZ1E4T01KcXBYdWNNdVErRFlybTY0bDdX?=
 =?utf-8?B?YkZ2UGg4VHlCLzE2bkJqL0ZiT0g4T2NSNkY5ZGtPd0MxVlVCMVo0amRpL0pv?=
 =?utf-8?B?eUZjWWY5WVIvNlovWHlDcCtjVTViWG1nYzd3YXVIdXJMaFRkWkF0NGRleTkr?=
 =?utf-8?B?bjV2blQrdEI5QStUZjlCSTVWS05NREhGUkxLV25sM1NMZDl6VUJYMXZ5ZzZV?=
 =?utf-8?B?eFJpUlB1MkwxcVdJUjNNYkVPbmJHNGJzcWFSWEFZMHJoSjV3SSt5cmlyNFE0?=
 =?utf-8?B?VkppZE1iSGxRcjhMZFFINkwrcXpxSDZKVDlTRGNzQi9qMXR1ZCtwdjhSMzZS?=
 =?utf-8?B?WlRKMS9qc3RuU0E1Mnc2NU9lTTc2WjB4Mk5MTHBnSlJQOWh1Y2czQ2cwcjFZ?=
 =?utf-8?B?Z3R5bmQyWlMrdkpGbC9JU3dOSml1blJMbXdpYzVyOEhvNlE5N2xzM2dFZWVR?=
 =?utf-8?B?dzZtc2lRUjBnMGZabU83amRxTGJxTzhUemtLVUlTMWw2Sng2b2RCL3pvL0F4?=
 =?utf-8?B?aUFYUnpUdVNyeFRza2lKTkVJRGEwYmNmczZQNW5BalNCRGYwQk0yc2l3bldB?=
 =?utf-8?B?ZnN2ei8rcWlVRkhXRzRqOHZlYnRTdTY1cHB6ckdmaENHdDd6ZGY2ektDbFUy?=
 =?utf-8?B?ZHlNdHEyUlpqbW13S2dzTVVpZ2N0d1kzSEZBVEdUdXlzd2Y3dFBSUWFPNlhm?=
 =?utf-8?B?ZWluUDVUZ1NqSFlBRmZtM1MxWnNhS3BIZExEVXk5aDZYMmdQSkRNMDZqOEI2?=
 =?utf-8?B?MFhGRnJYUksyaENqSXVyWGpzc21Wc1N1UlZHRTRqWSsvb1dGdXRaKzVha2hU?=
 =?utf-8?B?RUkwd3pLQlVsc2pmWlZsT1diQytZWXRERHUvMkdGcTNVdThQckpwcS9NYkQv?=
 =?utf-8?B?ZjNEYzc2WjZCRThDZUI2UkhiNitIMCtXOWtuNndBSnFlSWUxU2JSK3lTQ1Ev?=
 =?utf-8?B?N1FGVXNmM1hGd2xDcWIzNzk2RDlxSjJRNWhhekNjdTZFQ3hsRitzaWwyRGVQ?=
 =?utf-8?B?NkprTzlpWmNrYkpmOVFVTmJYRFkwWEZRNGt6b0hDbElOT0swUEh2K2RWZmRZ?=
 =?utf-8?B?cWd4anQ4T0JHT3lTL1dMYzFNMlZUdW8xR3JGZGoyMjVwMk43a2ZDcmRPQ1Q1?=
 =?utf-8?B?c3dMUjFWTkx1bk9oa0dUc2h3bWVWZzVwTGppOTdSelc4dWhLdGRISVpkL2Js?=
 =?utf-8?B?dDBwa3ljYVJrRzMwZ25kd29YL1UweWxhWkRxRlV0ZjVweXBTQkxYbzdoRVZY?=
 =?utf-8?B?dTQ2ZExMcjBPbXdpM0paTmZtaUVkYnhxUXB3cWRpUHl5d2xxTmVTVm5LVTYy?=
 =?utf-8?B?KytadlpiRlN6S2NrYmU4QjJZSUQ3TEFubDVtZHJYUDJ2OXM2MEVqSkttL0Vk?=
 =?utf-8?B?dEVjQ0dkYlJ1MzBQcmRaN3FQSUVDS2NrdVNXVVRZME5GUGtyMEtXdjg4d0U1?=
 =?utf-8?B?QXN2V0NSRVJBb3lUUjVmY0E2UEx1dy9mNnBFTWhINGM2U2dHdTFMWHpuL0ZD?=
 =?utf-8?B?VGZiOWF1YVJUR3RqR2tUdmpPejlxWkJaTW9wcjJTU2VId1F5cGJCdHU2dGJW?=
 =?utf-8?B?M05tdnZPeEpzazBDRlRVbTh6WUpURjN5OElJZGhiT1FPd0x3OTd6ZW5vU2U5?=
 =?utf-8?B?SDUwTDVnb0krcE5HS3U0TEtJRU9zU0JabG1iMFRUN3pCcXliYi84OGU1Ylh0?=
 =?utf-8?B?SUNzcm9qQmlnQW9VT0Z5aDlCWE5seVNMZUV0RG13aktrZXVWQTNGTmh3b3I5?=
 =?utf-8?B?NFJTRktYdFpVd3BqU2g2WHV3V2FHMkN3ZEpVRThSTm1MTHVYTEd5bFdIb3ZB?=
 =?utf-8?B?dk1SMWFnVVpFSDZreGF1UkJ6VWF2Q09ibjdHSXRKV2JXcEp3UGhSYjc1SnhK?=
 =?utf-8?B?cGc5S3E3QjZ3c0ZockJPQmZrTXZER0hhYW9HK245RGhJWEMrQUhyVk1YdmVx?=
 =?utf-8?B?UUZPRi8walRqMVQ5ZXEyVE5GWWZTSVoxemx2eWZDNlpOYTJKU0ttVDkyUHVS?=
 =?utf-8?B?M0VWOGt1akphMTVHbnVsenM0NjdWV0R0b3VFMVRZWmlDa0lOUy9KOXUxeE1L?=
 =?utf-8?B?TTF5cEV0S0l6VHV5bUFyVktEaTk5Q2IwY1REQ3h6YWwxK0F4QmhIbWJqSXpU?=
 =?utf-8?B?RFdJZmVaMGxRenYyNmt2eWdWdjdxVEFtSUU3alVVdE1BM2o4d0RhYlRxaS83?=
 =?utf-8?B?b1lBWHpjYmpxcEFuL1Vlcmp3cEFhV3MzNzRvOEs2OEJhLzdzNDRranlKdjdt?=
 =?utf-8?B?SlRZZ2pQQ0hNaGtYYm9zbXhoSE00Z2hYUjJycFY0bzdZRnU1dWdWNWdNaUJ0?=
 =?utf-8?B?aHVJTVFsSVZVbHdIOUlOK0p4YmxlcElTdHROOEp6eG1vUllFTENhUkNlcEI5?=
 =?utf-8?Q?wGxVzBI0DF4qiCJo=3D?=
X-Exchange-RoutingPolicyChecked: HuPHP/qlB6NN/iMYt+gJv5Qf8xVWaNOUyktGvy+AzVrNMmnXk9WemG13wySilYZQLM7voS65U1usauCVKMOZ2QVOknKPcQZ8KmeR6Igi4v0+UjF2KFJoL7rgSvZZPAsbqJqZKEqtvmk/wFz8gNho/zElCa0UUDbdnYGAikuU7h9rgNyQdJKpK2fpUcQfM1YVpZXPx74SlLQmkyaJOqSF5zyGioUuPo6rBLi75mlVtZsehznUpBvo52AKL2iU9JHIIdkIMNFUI2o8Fi/sbG+0iBh+D/FE9o7UN7zY8KrRx83o2RPa5xnQgIrOqTxPgskOLJdzvOLiJA7KVS6n6AM69Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e54a6b5-94c0-4933-7b2f-08df0983982c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 06:21:30.9824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qkW4/SJ7obPWAV7h8Uf47PRNKOoHd+TQNe5ZLY1Eq6Fy+cUaT+tV8/m06YPpozf0GDfRWzjCq/irYAJU0SQmAsDXz/KhsJOffAev1Wjk89A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7856
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

Hi Uma,

On 9/1/2026 3:04 AM, Uma Shankar wrote:
> The AS SDP skip-frame count is written to PR_ALPM_CTL only from
> lnl_alpm_configure(), which runs from intel_psr_enable_locked() on a
> Panel Replay disabled->enabled transition. VRR, however, can be enabled
> and disabled seamlessly - without a modeset and without cycling Panel
> Replay (intel_crtc_vrr_enabling()/disabling() in the pipe update path).
>
> As a result, when a panel comes up with VRR off the non-zero skip count
> is programmed, and when VRR is later turned on seamlessly PR stays
> enabled, lnl_alpm_configure() is not re-invoked, and the stale skip
> count is left in the register. This also leaves the coupled AS SDP
> transmission / DC3CO idle-protocol bits inconsistent with the DC3co
> state, which is recomputed on every commit.
>
> Factor the PR_ALPM_CTL AS SDP programming out of lnl_alpm_configure()
> into intel_alpm_configure_pr_as_sdp() and expose
> intel_alpm_pr_as_sdp_update(), which recomputes those fields for the
> current VRR state. Call it from the seamless VRR enable and disable
> sites (non-modeset only; a modeset re-runs PR enable anyway) so the skip
> counter always matches whether VRR is actively driving the refresh rate.
>
> v2: Fixed Sashiko review comments
>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_alpm.c    | 119 +++++++++++++------
>   drivers/gpu/drm/i915/display/intel_alpm.h    |   1 +
>   drivers/gpu/drm/i915/display/intel_display.c |  18 +++
>   3 files changed, 100 insertions(+), 38 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
> index 0a33a89975bc..c784e77f610b 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
> @@ -427,6 +427,85 @@ bool intel_alpm_pr_as_sdp_skip_frames_enabled(struct intel_dp *intel_dp,
>   	return intel_pr_as_sdp_skip_frames(intel_dp) > 0;
>   }
>   
> +/*
> + * Program the AS SDP portion of PR_ALPM_CTL: the transmission position, the
> + * skip-frame counter and the coupled AS SDP transmission / DC3CO idle-protocol
> + * bits. This is a full recompute of those fields (the base value is built from
> + * scratch, not read back), so it can be called both at PR enable time and when
> + * VRR is toggled seamlessly - which changes whether periodic AS SDP is used.
> + *
> + * Caller must hold intel_dp->alpm.lock.
> + */
> +static void intel_alpm_configure_pr_as_sdp(struct intel_dp *intel_dp,
> +					   const struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(intel_dp);
> +	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
> +	u32 pr_alpm_ctl = get_pr_alpm_as_sdp_transmission_time(crtc_state);
> +	u32 skip_frames = 0;
> +
> +	if (intel_alpm_pr_as_sdp_skip_frames_enabled(intel_dp, crtc_state))
> +		skip_frames = intel_pr_as_sdp_skip_frames(intel_dp);
> +
> +	if (crtc_state->link_off_after_as_sdp_when_pr_active)
> +		pr_alpm_ctl |= PR_ALPM_CTL_ALLOW_LINK_OFF_BETWEEN_AS_SDP_AND_SU;
> +
> +	/*
> +	 * Skip frames needs the AS SDP to keep flowing during PR active, so it
> +	 * is mutually exclusive with disabling AS SDP transmission in active and
> +	 * with the DC3CO idle protocol.
> +	 */
> +	if (skip_frames) {
> +		pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_SKIP_FRAMES(skip_frames);
> +		pr_alpm_ctl &= ~PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
> +		pr_alpm_ctl &= ~PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL;
> +	} else {
> +		pr_alpm_ctl &= ~PR_ALPM_CTL_AS_SDP_SKIP_FRAMES_MASK;
> +
> +		if (crtc_state->disable_as_sdp_when_pr_active)
> +			pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
> +
> +		if (intel_display_power_dc3co_allowed(display))
> +			pr_alpm_ctl |= PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL;
> +	}
> +
> +	intel_de_write(display, PR_ALPM_CTL(display, cpu_transcoder), pr_alpm_ctl);
> +}
> +
> +/*
> + * VRR can be enabled or disabled seamlessly, i.e. without a modeset and without
> + * cycling Panel Replay, so the AS SDP skip-frame programming done at PR enable
> + * time would otherwise go stale across a VRR toggle. Reprogram it here so the
> + * skip counter (and the coupled bits) matches the new VRR state.
> + */
> +void intel_alpm_pr_as_sdp_update(const struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	struct intel_encoder *encoder;
> +
> +	/* AS SDP skip frames field only exists on Xe3p_LPD+ */
> +	if (DISPLAY_VER(display) < 35)
> +		return;
> +
> +	for_each_intel_encoder_mask(display->drm, encoder,
> +				    crtc_state->uapi.encoder_mask) {
> +		struct intel_dp *intel_dp;
> +
> +		if (!intel_encoder_is_dp(encoder))
> +			continue;
> +
> +		intel_dp = enc_to_intel_dp(encoder);
> +
> +		if (!intel_dp->as_sdp_supported ||
> +		    !intel_alpm_is_alpm_aux_less(intel_dp, crtc_state))
> +			continue;
> +
> +		mutex_lock(&intel_dp->alpm.lock);
> +		intel_alpm_configure_pr_as_sdp(intel_dp, crtc_state);
> +		mutex_unlock(&intel_dp->alpm.lock);
> +	}
> +}
> +
>   static void lnl_alpm_configure(struct intel_dp *intel_dp,
>   			       const struct intel_crtc_state *crtc_state)
>   {
> @@ -449,44 +528,8 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp,
>   			ALPM_CTL_AUX_LESS_SLEEP_HOLD_TIME_50_SYMBOLS |
>   			ALPM_CTL_AUX_LESS_WAKE_TIME(crtc_state->alpm_state.aux_less_wake_lines);
>   
> -		if (intel_dp->as_sdp_supported) {
> -			u32 pr_alpm_ctl = get_pr_alpm_as_sdp_transmission_time(crtc_state);
> -			u32 skip_frames = 0;
> -
> -			/*
> -			 * AS SDP skip frames field only exists on Xe3p_LPD+, and
> -			 * periodic AS SDP is a Panel Replay feature that is only
> -			 * used when VRR is not actively driving the refresh rate.
> -			 */
> -			if (DISPLAY_VER(display) >= 35 && crtc_state->has_panel_replay &&
> -			    !crtc_state->vrr.enable)
> -				skip_frames = intel_pr_as_sdp_skip_frames(intel_dp);
> -
> -			if (crtc_state->link_off_after_as_sdp_when_pr_active)
> -				pr_alpm_ctl |= PR_ALPM_CTL_ALLOW_LINK_OFF_BETWEEN_AS_SDP_AND_SU;
> -
> -			/*
> -			 * Skip frames needs the AS SDP to keep flowing during PR
> -			 * active, so it is mutually exclusive with disabling AS SDP
> -			 * transmission in active and with the DC3CO idle protocol.
> -			 */
> -			if (skip_frames) {
> -				pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_SKIP_FRAMES(skip_frames);
> -				pr_alpm_ctl &= ~PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
> -				pr_alpm_ctl &= ~PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL;
> -			} else {
> -				pr_alpm_ctl &= ~PR_ALPM_CTL_AS_SDP_SKIP_FRAMES_MASK;
> -
> -				if (crtc_state->disable_as_sdp_when_pr_active)
> -					pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
> -
> -				if (intel_display_power_dc3co_allowed(display))
> -					pr_alpm_ctl |= PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL;
> -			}
> -
> -			intel_de_write(display, PR_ALPM_CTL(display, cpu_transcoder),
> -				       pr_alpm_ctl);
> -		}
> +		if (intel_dp->as_sdp_supported)
> +			intel_alpm_configure_pr_as_sdp(intel_dp, crtc_state);
>   
>   	} else {
>   		alpm_ctl = ALPM_CTL_EXTENDED_FAST_WAKE_ENABLE |
> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.h b/drivers/gpu/drm/i915/display/intel_alpm.h
> index 328920027f1c..f8f605d94f96 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.h
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.h
> @@ -36,6 +36,7 @@ bool intel_alpm_is_alpm_aux_less(struct intel_dp *intel_dp,
>   				 const struct intel_crtc_state *crtc_state);
>   bool intel_alpm_pr_as_sdp_skip_frames_enabled(struct intel_dp *intel_dp,
>   					      const struct intel_crtc_state *crtc_state);
> +void intel_alpm_pr_as_sdp_update(const struct intel_crtc_state *crtc_state);
>   void intel_alpm_disable(struct intel_dp *intel_dp);
>   bool intel_alpm_get_error(struct intel_dp *intel_dp);
>   void intel_alpm_lobf_compute_config_late(struct intel_dp *intel_dp,
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index fc30a455bed3..9151ea6c15ab 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -1232,6 +1232,14 @@ static void intel_pre_plane_update(struct intel_atomic_state *state,
>   		intel_vrr_disable(old_crtc_state);
>   		intel_vrr_dcb_reset(old_crtc_state, crtc);
>   		intel_crtc_update_active_timings(old_crtc_state, false);
> +
> +		/*
> +		 * VRR is being disabled seamlessly (no modeset, Panel Replay
> +		 * stays enabled), so re-apply the AS SDP skip-frame programming
> +		 * for the new (VRR off) state.
> +		 */
> +		if (!intel_crtc_needs_modeset(new_crtc_state))
> +			intel_alpm_pr_as_sdp_update(new_crtc_state);
>   	}
>   
>   	if (audio_disabling(old_crtc_state, new_crtc_state))
> @@ -6971,6 +6979,16 @@ static void intel_update_crtc(struct intel_atomic_state *state,
>   		intel_crtc_update_active_timings(new_crtc_state,
>   						 new_crtc_state->vrr.enable);
>   
> +	/*
> +	 * VRR is being enabled seamlessly (no modeset, Panel Replay stays
> +	 * enabled), so re-apply the AS SDP skip-frame programming for the new
> +	 * (VRR on) state. Done here, outside the vblank-evasion critical section
> +	 * (which runs with interrupts disabled), because it takes alpm.lock.
> +	 */
> +	if (intel_crtc_vrr_enabling(state, crtc) &&
> +	    !intel_crtc_needs_modeset(new_crtc_state))
> +		intel_alpm_pr_as_sdp_update(new_crtc_state);
> +
>   	if (new_crtc_state->vrr.dc_balance.enable)
>   		intel_vrr_dcb_increment_flip_count(new_crtc_state, crtc);

Verified locally. Not seen any issue.

Tested-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

>   
