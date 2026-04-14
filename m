Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995C2F9D0ED
	for <intel-xe@archiver.kernel.org>; Tue, 14 Apr 2026 18:56:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51B9610E654;
	Tue, 14 Apr 2026 18:56:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JtRM0ILv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA43110E654
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Apr 2026 18:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776193001; x=1807729001;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wDp4KOW2m6tk3syv5Nkiz7yCtTln2Eo9oR/SYpg41BI=;
 b=JtRM0ILvtUyyceihVhnDxF57QKmC39atqyHkbTe8VH24REm72Frt8ttS
 PBWtr8dWU3TcpomgcD2xVmEb550RW1FMEkENnaK1/fHgnWUTEL2knRRQK
 0RFWsGs/7TcE7R9sh4TrR7JKdxZs5RiJDlZIRCFkyHSNnQ69S/nTeznaW
 UlHEaZ4se7TBCzkGMfDqxRV6iMSV34QKVayCtIV9sgbNfhlS2g26SLJy8
 XihYRjyCqFhFimAx7Rl82lcGgcxyg3OnUAcgYOFzk7nJoYAK6Ev4YgmVF
 FmkBhQ7T8QIJEVQioEt8JpHZ68w12OGxy+nKTJIvbffZ3leDCftvsSi1G g==;
X-CSE-ConnectionGUID: MYnXCbh+SHatPClyJ9ne/w==
X-CSE-MsgGUID: Al6RWOgOTGu/luRx9vTtKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="88238895"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="88238895"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 11:56:41 -0700
X-CSE-ConnectionGUID: 3UbNv8CZTSmrEKobkxW9AQ==
X-CSE-MsgGUID: YZDqnBSZRBSVWhiMqP0PSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="268154143"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 11:56:40 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 11:56:39 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 14 Apr 2026 11:56:39 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.42) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 11:56:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F2Y1z5rkc38+yyqVaxIVL+VJLHyONGT0HYM11D/vDhqvzeVpN3LUCCHOl8eSQpL/UJiU+Ru8k1c/6X0tTL1WHy4Gc0Gi1gb3GtbR4Xy+gmyeUZLOluh2IdZoHmL5JWtxvXXAfmIOx+igamJF1weJc/VRtiyolC060z4FjrDA5uyC57ylhkplD0kylrs5khsc8RIhVFBHKHiyK26xISpslVqHUzUi4R6yC53zo9GLz5hNloQ8uNGf7mKxqBExX9cPpGNiHFQNgaGVu+RFVPkzjZO4Cl0/hTAsdDTveC0eHnjMan3JF8ZESYdtpClsY8YsgR7jUYBKkjUKW2BYKyhSxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lbbGoJwwD1gK4xu+Wpi2yrGeCfEO485MGNwmpZyc/lI=;
 b=i9YuVDqM/k/8rhdohWrhg0hH2jqZUcCKwKSpXK1/aERmXG1FTg744c0JHocEjm8cptTvpWvzgikU5UrsDuKvSjtKvh4yQ8nR8cbWergPoC7vXyMUpe8eCFfawwPy2S7tl2KOdej7mXRUsEubepWpeKWey1lKgr6wvxoMqtribPoog3OKGRcBiwuIsLBM5FkNa1BComDlag2BElOlubnYKG5eRrn1XD49ZSLDzl4NFYXu/6Gmxn4oaxsSVHoHWAAI3BfnSjZbl/eUpOWLM3fdXH+ZfatX931FyH66Omi/bgIqAiU5OmRWUhlcTxZn64IQfgzebgGbgpGDpJhCz+HIkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by LV1PR11MB8841.namprd11.prod.outlook.com (2603:10b6:408:2b2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 18:56:37 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 18:56:33 +0000
Date: Tue, 14 Apr 2026 11:56:27 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: Re: [PATCH 5/5] drm/xe/multi_queue: Whitelist QUEUE_TIMESTAMP register
Message-ID: <ad6N28q7n2BPVsoA@soc-5CG1426VCC.clients.intel.com>
References: <20260409203714.1887402-7-umesh.nerlige.ramappa@intel.com>
 <20260409203714.1887402-12-umesh.nerlige.ramappa@intel.com>
 <ad0zNj3QORegCw05@nvishwa1-desk>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <ad0zNj3QORegCw05@nvishwa1-desk>
X-ClientProxiedBy: MW4PR03CA0189.namprd03.prod.outlook.com
 (2603:10b6:303:b8::14) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|LV1PR11MB8841:EE_
X-MS-Office365-Filtering-Correlation-Id: 81086a84-f83b-4c87-9c8a-08de9a578bf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: Qpj4emY3jAd4I11IxAwRCzA5U7vcXRZiLAmEwRHYmPKHhUVnSWUKeuPN7s2rgEmSXblv5AXFZZr+O3R2r2to09B5drt2nQwL9GhnFuIKI6GMh8RNpn0W4cHvoKIsIg4tld5APfraTfJYbJ7JJriAnKyJ3t2CCVIExk+SC05bOkh3aNzy+z56JBUMukC1T9pOrj4UFpuT6QYYrpYfT6Rz6ZR2jWM4buLPumAsjrr84+cG/ogURhtT/+4H2QGZktMR9WJJlwclfRNtnhBk/pO/SUWOCFaCbKwRsM3SYDdazhV3yXMwZ80FhKwrTOuygNAx4V0J4I2RhXw/DfvlE0z+uPHmTBTuHAtZUQV2PJ/moOnkO4rKnhgDhUdWslqaigmUru1rHlyfeaALVsHhrJgMs0L6hC+5XaNLrnObBDffRM5+op5E/tq9mqBxhIhJXdytErPjAbTjtpZKLmS3MlUr37lVSl0hBBtSi6qNxKVePxV59vCRoXCQq9kDuhedEyTFrFOjljyRfyO+mAc8ky8MlN4vqO+nek8wi8KhbKShJk3VZaI706k1mYIymE40MnhrZiCAMd0bwTZtTxpSRGbZ+lrlywo+Pci+I/DEkYTIxwwefV1HrgOto9SOQ4UEkfdLjsUV5Ne7sbYsPspBtcGo3IHHxOR8QjZvq/xE4BYZUkSE/sMXF/h9d9wJf1n5GUoglG6VwaaH3P6oA9THAviYS+wKkgfE51S40dCT5NXqTsg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXQrTzNzN2xhSXpObitoS3ZBa21VR3h1NGNmT080UjlSekdRQXNWdE01Z1h6?=
 =?utf-8?B?c0hXQkR0dXN6cGRrTEhIYlUyYUhYTmhyTVRwTzNncm5QcFkrUzd4RXgxOXNk?=
 =?utf-8?B?clIxRXJLL0hkQmVYRmc3UnZXQ3BaS1R4Z0hGemMzYmR2djE2dHBEZy9nT1JZ?=
 =?utf-8?B?Q3FPbFExOEszTktZUTF2MVNyMHFEcTAzQmlnNXJLTGhRbW5jRVhnZU01ME5l?=
 =?utf-8?B?bDlXU2FwQVNEbElGakZYRS9QaHJFU1hrczFxK0N1b0Jra0lObnlMeHhZaGNO?=
 =?utf-8?B?bnpXR0RaRzd6Q1lLMm5BOE5sTHBTWmo2VnpHNERuZEo0alRLbW55MUdjM2to?=
 =?utf-8?B?aE56c0xQNFlkaUFvZXpxbUlJUnF6RmF1dzF1YjZhMjZoWnlXbkk1aXN6ZEZ5?=
 =?utf-8?B?U1ovekRBOTJyM3UrSXhoOGh4OWRoNXdMUUExTXdBSkJWZGptMVo1REpMUnlo?=
 =?utf-8?B?ZEkwU1pBdGVITlJsSjhONlRDRkp5L2RRWVFpTnBNRk4wQVNobnhVcisxNVU2?=
 =?utf-8?B?NnV2VXlnQ3MwOENrM21JZDF6VVpMSmZqeHlIU210Sld4em9tOGtJc3B6VGlX?=
 =?utf-8?B?NGxsVHErOXc1SzRpS3I4TEhKeVgyUUVRUEFHa0Fsc2t2RWtvVm9rVjRjM0k4?=
 =?utf-8?B?bFlVTW8vdjhoaGtUbmlkQzlWR0d3dE9VSitEb0x5Nm9ubFBQcU00MlVVVE5u?=
 =?utf-8?B?dThaMFkrdjN2OG9CWlBlQWZ1eFpodm9hand1aTlqLzRBaUludHNBZkNGU3Jr?=
 =?utf-8?B?d3BFNmxHQy8yTWpNQ0g2Q2JXOFNaV3NXNExCRkJEakZQczN1NWE0NnA4Z3hr?=
 =?utf-8?B?Qll2N2F3ODQwWHE1SHlRTmxweElnR1BkMVdrZGxXTkZrQVVSNWlqV1d3Y0FB?=
 =?utf-8?B?dlRXdWhlTnBQWWIyK09BUnFHNEduTlFQdVU0dmN0UmNjVi9CMDl6S09iNjRK?=
 =?utf-8?B?Y00zbkhtemwxUDR2UklHL0Y0Y0g3bUZvdU5LODRFTzNsQmNXOWtQbXBWUGMz?=
 =?utf-8?B?T3BncWxyQTd1ZTBCZCtvcVRQMUx4UW5rTmppYlJSNlRWbkJJaGF0MFF0S0ZM?=
 =?utf-8?B?TnZleUlqZVZlS01UK1ZZVVZPOHhhNTNmQ2NDeDZyNGFXRUJVVWpaRktVZE1i?=
 =?utf-8?B?NVJtWGRSMm9nWVlIUDRBb2FlTFRXMHRJOU1pNG5KRDZSMThKRlM4S2RKcnUr?=
 =?utf-8?B?WGpHNU5SSlFadFIyUDgyWlpGeFNaQTJEQmdqbGF4VGlrcmJxdVUwNTNVc3Ja?=
 =?utf-8?B?enRlUS9adWJjS0dtUU5sTERHREx6bjBWcjZIS1BZN1BIYVduZ05vRFZzM25F?=
 =?utf-8?B?ZEZKWTArMFJxMEl2WWdLVllCZ244dFBnZnFxQjFxYWFoUUluWnNKNkM3N0JK?=
 =?utf-8?B?akQrbXcxVU8zdmxOcTYycGtUb1ZhVUV4S2tMN1hMckJvNHN1ZEM2Zy80ODVl?=
 =?utf-8?B?UDZpZmNXTE5VWFZEU2wzNDdNcEV0L1lYazlMazM2S2hYdWhGVXpuNml6NUJh?=
 =?utf-8?B?MUg5QkduWG56ZDBDZG9nWE5ZQlpxVHF1RFM5WHQ2QWxkS3ZwNE5WaTd2OUY5?=
 =?utf-8?B?UkxBZkpNUm9lTW1TT3lRc2xVanczMzZjQS91QUd0WDVIWmZBcTFWUnZxN3lk?=
 =?utf-8?B?NVRuTnNQRmRIOWErSW5wd0JpRlJPUHV3a2tTSTI3OFNlTzJyUUdaZ29GUzRN?=
 =?utf-8?B?S25NYm1mT3pkNnhjNGxqT2h0MCtDRDJOVi9mNnJUUWRXeTZoRklBMVRVdElm?=
 =?utf-8?B?LytNWHZaSDZCejhaVkJ5bkppSC9jNmF3VGdHa3llZGE2MjFjRE1pVEhoUVV5?=
 =?utf-8?B?cXFZWmFGdm1qblJiQnpuSlFMVE1jNndISzZENW40c2JoMDdIK2xVdlNNQVY5?=
 =?utf-8?B?Q3Y3d3dUZ3UxaU13cFFZSlMyWjVnVFk0dkZwaVYzOFdtREQzUi9oRmFlVllr?=
 =?utf-8?B?T1MvK3M3ajR4SEhwdVAxb3FWOFo0cjF4MUZpV2gyNExPRWRVK0hrQkZQMW9V?=
 =?utf-8?B?WDdSR0VlOERYTTVmci9ndnE5TWphRkFLazZWTkllRDBzeUMyQXM2ckVRckRa?=
 =?utf-8?B?NVdScXM4d0E3ODlFM1hKTitzdEh3RFNlRTVvRXoxbUJXTmNZYzNRK0dRMlZG?=
 =?utf-8?B?cW5WYVBoblZqZ20rZFpuM0FmaEFUb1hzblV4SkJPS3BIbXhjdXpwTDREVHVw?=
 =?utf-8?B?OXQxYWxDTGxyMUxtRElDS0p0NVk1VDRhWXJOY3RWZmFxdzFYUzZvVTN0YUhV?=
 =?utf-8?B?aXN2b3BHOWtscVlqbWIycGp1ZHZqUjhCMTJRVEZSWm4vdXJVeVQyUUVpQjZx?=
 =?utf-8?B?YnRuZ3pYYXpPRUJHcWhQU2VLdXNSaUZnaEhyMzQvdS95bFZ2L3RtNGZCL2l3?=
 =?utf-8?Q?jvczFV52Bmxi2dc4rJRQs4kxD0UNqq0dfeRhX?=
X-Exchange-RoutingPolicyChecked: A/bIae8p5jgSceYUykZavfVFTa/lZiNgeohDwDEUrLIqz7Ql3HSmYySH++v6vxNq/23354rC+Q2UBQc4kehG/a8e0lVxfRvnJYH/OBerzxAhO6YKB2B7OTQUinWWee6WMX5YRvwX1JBQsCYsi+08TvzxNli+2aZrDQv40lSUm1BUgt/Eo+e2TlbEv3OprE3IxIVx/yBCVdgLDubU7eY9nyoTlXMjdSpyvlVTnS9+A85gxmhLkTT6PQPw2rBbs+QUtvdBBQEweRONjMAWHhsU0ElLdUwx9QApGldpxVaTyW8KTVdnZCamze3TVF4AZB0BAdfqhxLIJyvgZ/PrVjI4bw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 81086a84-f83b-4c87-9c8a-08de9a578bf8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 18:56:33.6614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EN2GpH36exf26nGoCWBpqJDE1R8/Bviz/q40o7gPWkPlfj0nSoLwQF1j4+cGK4g1UWJ/WEoZFBaSsAL2U+3CbbawMKHwJZwt4IPRfy8NtvQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8841
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

On Mon, Apr 13, 2026 at 11:17:26AM -0700, Niranjana Vishwanathapura wrote:
>On Thu, Apr 09, 2026 at 01:37:20PM -0700, Umesh Nerlige Ramappa wrote:
>>In a multi-queue use case, when a job is running on the secondary queue,
>>the CTX_TIMESTAMP does not reflect the queues run ticks. Instead, we use
>>the QUEUE TIMESTAMP to check how long the job ran. For user space to see
>>the run ticks for a secondary queue, whitelist the QUEUE_TIMESTAMP
>>register.
>>
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>---
>>drivers/gpu/drm/xe/xe_reg_whitelist.c | 6 ++++++
>>1 file changed, 6 insertions(+)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>>index 80577e4b7437..4517465ad423 100644
>>--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>>+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>>@@ -54,6 +54,12 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
>>				RING_FORCE_TO_NONPRIV_ACCESS_RD,
>>				XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>>	},
>>+	{ XE_RTP_NAME("allow_read_queue_timestamp"),
>>+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3500, 3511), FUNC(match_not_render)),
>>+	  XE_RTP_ACTIONS(WHITELIST(RING_QUEUE_TIMESTAMP(0),
>>+				   RING_FORCE_TO_NONPRIV_ACCESS_RD,
>>+				   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>>+	},
>
>NIT...We need this for multi-queue case which only applies for BCS and CCS engines.
>So, may be we should put that rule instead of match_not_render()?
>
>In either case,
>Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Dropping this patch for now, since it needs some more vetting.

Regards,
Umesh
>
>>	{ XE_RTP_NAME("16014440446"),
>>	  XE_RTP_RULES(PLATFORM(PVC)),
>>	  XE_RTP_ACTIONS(WHITELIST(XE_REG(0x4400),
>>-- 
>>2.43.0
>>
