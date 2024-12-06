Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF7BE7716E
	for <intel-xe@archiver.kernel.org>; Fri,  6 Dec 2024 02:00:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAEA410E14C;
	Fri,  6 Dec 2024 02:00:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iBeGuN2D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07CC310E02D
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Dec 2024 02:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733450403; x=1764986403;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=KFBDbpeFVW1v6OEvy5f6GokbnIc1+MNETYbNR5gri7E=;
 b=iBeGuN2DOoCyfkGGNeOjoFODpfrPvKQo7yOnLmLhwb8oXJYroxlLj7pz
 hCS7MaT0mdRvN3as2uWdZtwgdBiBwvgWvKICUI2J2pU1O0bOKA8s36sGR
 rIxVZqGS0zygxiLExgN/aXUGhhpMY4KHVncOkNCq6PRYvK0C8GRs5V2fH
 Z/fjg+ZQ3On8+ZB//A9NUGMOPRd+R3LytbUTIerPI9uGXzEIqzRChracM
 zaPE0CGNcy4vf9wguThrr7dsp+OvvEA1SUXa8AYFzBfJaJYi9HU54qjRd
 pEqBPIzxckdYtpWATXWWXYfRa4K5iHzXaUmYDW9Cl9zEbjkQz8dccAN11 w==;
X-CSE-ConnectionGUID: c0E76ikzT2qwFUHcN+ZLjQ==
X-CSE-MsgGUID: dq1/ZRIuQvWJi2c5ZGiGDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="45184718"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; d="scan'208";a="45184718"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 18:00:03 -0800
X-CSE-ConnectionGUID: QzsAncMyQ/q9WKxoSLs22Q==
X-CSE-MsgGUID: kJKoban1TNKrqv5G9ug5+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; d="scan'208";a="94082974"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2024 18:00:02 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Dec 2024 18:00:01 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Dec 2024 18:00:01 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Dec 2024 18:00:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jylB378N7uMEsI8WAw638oYKutSQM/ic0O5Fj5p96D7sgjNYzMZi2YclMUcCdOGhg0XO++MNrIo6wyOqr9m3BdeiHHsYQx04IsEGchl4pZXwP5KFmk+SuGKahzjaHHDIvZR5f58H30+ilBMuYlHiivUl/SpxHAkME3ErciQP7QKJhaBDTALyUcWuFc8r8B4P7kSmPKvm6EhtGy2lE4trgUH6sSqFfPslmb66Ry/LSOYG/hf59xiNMHKdJ7QDSa1cGbexG3wcTwLR+7OR+MYJobpnYHifekmXJtg5urK444F9T5fO8NqUm/PO2ydVwM4SDKX8TESBU1vzBEu7jOwt9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4q0mqvTbZBrFHLnQfBKdN34HDOgLlY/U4qv/x3dOy50=;
 b=EaUYYoHamJk3pu3cfjANcxBqXEuMdSkdbZecKv6AkkRFJ7FCYEuA4YOjYeBj1TRXWdUsNCWnT+nC9xwJIWh+EqJAmd/g2X9ZXBDApT8o7Qg+V3Oj0MZ1v2Vk117B7xIof6JorP3pxsXa6r4Th2zrq7beqXE0mzKzhbBellhfwTNSDpMZy6Xrg+W0S1aIfgos5Fh3+6RCWfQn51uk9hW3u59LTQHxFri147nl0zSk+zrSrlIdfkV+cwlvuzh4uzt7fV2WYnBvnAow1+9Uf1WM4bZRDX7fqfpAFT8QheWrHqK8laNg53eaYwKOIbb3uZe0KlsslTKDAIVpTf4bxi0CKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by MN0PR11MB6035.namprd11.prod.outlook.com (2603:10b6:208:376::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Fri, 6 Dec
 2024 01:59:58 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8207.017; Fri, 6 Dec 2024
 01:59:58 +0000
Message-ID: <0d60dd8b-19ee-48e6-b058-731ea221b675@intel.com>
Date: Thu, 5 Dec 2024 17:59:53 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/12] drm/xe/pxp: Initialize PXP structure and KCR reg
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20241120234353.1037180-1-daniele.ceraolospurio@intel.com>
 <20241120234353.1037180-2-daniele.ceraolospurio@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20241120234353.1037180-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P222CA0006.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::11) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|MN0PR11MB6035:EE_
X-MS-Office365-Filtering-Correlation-Id: 0732910f-f47e-48df-4b4c-08dd1599b01e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dVEyaGxJSVRNemRHOHhGeUVMd2duMEsreitzbkRWTEQ0WWttbmlmeFlvQ00y?=
 =?utf-8?B?djU5dDY4VHdiR1ZyTUJwTklBLzU2VEl3SnhZR1JQVytqN2dyOERkdzgrYU9W?=
 =?utf-8?B?WFdhcTQ3bkE3SFdYeVNlWEVueE1NeXg3dVhWUnJQa3dyTTZLMFo4MGlUTDdz?=
 =?utf-8?B?MTMwWTArR01DMXBwODZYYkRtRForenJ6aGJxVFAvdWVZRGxla2JUU1g4eEFr?=
 =?utf-8?B?NXFOM3NiNVlTcGVOTTZyelhSWVhLNVF6MjJKVXU5KzM1UzhzT3BkOE0vdXBz?=
 =?utf-8?B?SVBnNVBhYjV6TXRYWm1EM01qZ2tJNUt0dXNQQndyMmlQU29LWVBkeXhCU1Ax?=
 =?utf-8?B?aHdUa2Q2TXhXRUJOSTJoenNmY3RPNjNLbnM5dkZjSWUwUW5hdTNtM2U2dkpy?=
 =?utf-8?B?bzlRYUtNQWRRakZwdzZ4OWxYSnQ3VE9GcUZOLytJTUpNVDd3dHdtYTlld1lZ?=
 =?utf-8?B?ZU1XeGpGamw1T3FWSkZzMjZDNlg0czlDSG5VTDdiRVd0eVJnYWNCK0tqZUNZ?=
 =?utf-8?B?WW9Ic0NnUkZlQ1pKZU1nWmx3RXUxbTNEN3I0WTVsYlRhbmQ3SlA2RGRVczlv?=
 =?utf-8?B?YThCbW5JZzlKVThHWGdrakpyR3pUa1IyTERlMnNzT1crMWltb3Q3RkZ2akFp?=
 =?utf-8?B?Y2ZkS2hCNmw3cmFlRkVHa2FPQW9kOGgxN1pVUHBLM292enAxUUQzaTlEdFJI?=
 =?utf-8?B?WUFmVjdQb1FBMmtEUG5TUHVMVkNFWWQ3bDFhMWpZcmpwVDhWM0lZMVJSbm5x?=
 =?utf-8?B?ZS9LM0Q3STZKTys5K2xsRTBsWUZ0ZlpDZkpub2FROEhDQVVzNmNBaHhqUXdG?=
 =?utf-8?B?Y1RGSTdISEdoZWRielBkai9Bc0NxamFwekZ4Zld3ZThLaDVZSHhqSXJwTjFi?=
 =?utf-8?B?TStHMWtzbHErQ3NUVTQxeDNhbkFFK09hYXh4R1p4KzFjMTR1Szk1bGg2MGRD?=
 =?utf-8?B?NzFVNkNBOEttNVAxS3ZYbmFZcTFZV3BweHFNeWU0NVlaYnBDR0lQNjhJQ0NC?=
 =?utf-8?B?bFNmZnhrbnBqOGxicVZmTWZybnU3MHRoeUx5NjM1UEFZQjF5bHRkTlpNZHlj?=
 =?utf-8?B?SDI2WjQ2WER4dzBPckxkQ3ZuZWpNcEk4TkM5SGF0RGFORjYyL0RYSzBlczFi?=
 =?utf-8?B?dC9nM2RDSWVaUk1ZeG1EQWEvNlhGdUtwbDhkVkFtNmpKMWZzcG1FOUF6MTJ4?=
 =?utf-8?B?ZnlpZGNTaEcrVEZkSWkwTWsvNTZxenkvc3dmNlRzbUJBL2xKbWZMNmh5QXRs?=
 =?utf-8?B?WWpDa2hsY0gvcHlrVElsV2xUc29MT2NLandVMzN4bG1sVE1lNHFzQjJjWVJC?=
 =?utf-8?B?cnZ6cjNpbXpBL0VLT0xDcWt4RHpXc2tWNGlVUmFFYTVZSjJOQzhkeDRESkQ0?=
 =?utf-8?B?ZTNYTFRmSUJ3WUM2c1NPOFVxOXFkTVRJQWVWS2dhMTRMY1J2NVpZNzlBaVpI?=
 =?utf-8?B?bnduaFY2Y2hBMTkwRUV4STRhNnFzbldpNU9ZWUM3NEcyQUhjK0hHSS8rVFFW?=
 =?utf-8?B?UlhkdHZHckRCRWltVE84SXV4UkdxSlB1K012WSs1YnhwTkd4aG5GMmFNSGo5?=
 =?utf-8?B?VnA0QUFIM2xiU0lBczM3R2UraFBOVDgwRC83M09zUlRhenNnbHo4WnN1dWFq?=
 =?utf-8?B?Nk1QSFh3eGJQVVBmNmhqS0pYVWhWVWZjaCtUelcrSzRtdDR0eEE4S1JCQ1VX?=
 =?utf-8?B?b2ZoMkxSSy90ZWFMTlBGSjNKdW1JUzZBMUI0YnY2V1BxenZrbGJZc09pRzlP?=
 =?utf-8?B?YWNxNnZHUmhwS2sybnBrMncvUWVkQVQ4TjVLMURHa25YajdLZTdkYUFZdGFJ?=
 =?utf-8?B?SlRWVDhNalFWMm9uVy9udz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmRxRWp5bkhRT1BrMzM5MjB1SnpDYmxUYlFoajVjV08xbzRhNStCWkp4dDcx?=
 =?utf-8?B?TS94cUtMTUNVT1lVUDRoQVJBTml0ZVM5Z2taUzlkc1owa0ZhWU54czJsRENV?=
 =?utf-8?B?dklRTDRJcWhDazBkZ3R3YTJibDJUVjBlQjR6U2dER1VnanpoUnpJTWx1dHFQ?=
 =?utf-8?B?SVFCdDljUVBvTXJMclhhc3AxcFpMdFIxZGlNVzVHZVZ4ajFuWGt0OGJGUi9L?=
 =?utf-8?B?OHJDZ0NBSWpaOVMxOU95OHNJYkd2SS9Ka3BGUFFrSUtGbjZua3VsMmZWT3Ru?=
 =?utf-8?B?K1VBVXNnQTVnWi9RM2hlSjB0N0Y5dnFYcFZDckR0Q0ZXbEhLMGZnU1VPVmli?=
 =?utf-8?B?NEc3aTBEMUN2bUVaLzlmTVlEamJDb3pINytGMEZ2Vkdsa1BoS2FpMlJQbC9a?=
 =?utf-8?B?UVI0SGVVS3Q2U09uZHBCQ3FRMnBhb0syMEhNby9mZFFOV3Vkem53TkEwMjlo?=
 =?utf-8?B?OUNuS1ZoeHUxK0NjOHJEb1R4K1FVRkJFUXVFemdNRXZ5WldQTDNRVXh3aEEy?=
 =?utf-8?B?KzFjcVVwbkhUV3lMTVpuT2FUdW9VUHdSb1UwQ2hnSUR6MVNlUVo4dWJkSzgr?=
 =?utf-8?B?L1FuWFN2dUlQU2l3VEhJcDVNRTVJeEFVU1Yway9MMlFqeWl1eVRqa29tT0Ey?=
 =?utf-8?B?ckMyaUVjck1jcnczVWtEcERnaFczdkFLTTZQUnQwQWQ5cUwxRkZrL0EzVG52?=
 =?utf-8?B?OXM0ck90N2RtWXhjN1ZlUWM2VmdiNVdybTdxdVdjTmNZWllUOTBuVVYvbnJq?=
 =?utf-8?B?bXZQY0lyYUd6emJMdkNHd05JT0xSand4YzZDbnROcmxuVmptb0thSGswVGdp?=
 =?utf-8?B?TGlKLzIwcHh5NVU5SVYxWGV0LzV6QjhWT0NaRFRkdjBHWVlYUzJGa1IxTXJZ?=
 =?utf-8?B?Wm01S0lFSVhUYlBoTmc0R0pJMk5wNEdBKyt1WVZGVFlJQ2o3SnFvbHlVZjdO?=
 =?utf-8?B?OW5WdU9acm5HZ3B4bHJjV0pMZVkxbWFkd2g4Qk5lSlZDUzMxWEsyQUw2aktU?=
 =?utf-8?B?Z0VPQlFnaWNqeHBkcVJmTUFjOFpNaVFnNE15akFEUEV1Wjg3elFXRldSNmFZ?=
 =?utf-8?B?SURZaGowYmlubVBSRDZnbU1KZk9naXFuNnNlL3FUVVlCMnY5NzlhbDZJTVpl?=
 =?utf-8?B?RTIrWlgyNUJqL2ZLK1hCcnl2WWR2R0dNdThwTnVlREFLcTZtSzdLZHBmSHl3?=
 =?utf-8?B?eDdJS09KV3JkaWU2YjAyUEJ1WnpORzE4SmNvditIQ0pqSm81ZzVTVFQ2RkJK?=
 =?utf-8?B?UUlOa3BTNGlyY251V1E5QzUwYXdXRSt6NU1VM0ErVGd5Wnk5amp5TEdQallR?=
 =?utf-8?B?SEo2cGd3Rk43b3dvMTNYRGQ1NzVkTVlWOHZxZndpSXh5Q2plTFN0UEw4dnNz?=
 =?utf-8?B?VDVYY2M1YWcvUjQvR3VLeUtlaVl5ZDhuZzBqOEZmamVWU2FNNi9UMStjNHRr?=
 =?utf-8?B?cHJNbXU2cERPMzdoVVFvb3RsNFdwZnZiQW1JUnZoZExPbEhOOXlaeVNLdnlG?=
 =?utf-8?B?TEpneG5VWmFqZ0xDZTBKeVNpSU9DVW9keUJST1M0dERmWTc0aE9WazVrYVpj?=
 =?utf-8?B?N2RqcEh6K3hGUDlNWW9MU3gyOTdhSXo3Y3JQWUpyMklJeUdFa2V2MXBURVk4?=
 =?utf-8?B?RkJkOGV3TnkrcVR5Wm9US3ZBS0l4bkpGZzRxazRicjN1QjJ6bVJ1MmttUlFh?=
 =?utf-8?B?ZXBscFA2WVlKTGV3MTRxTmZqUFhkVG9YdkQweWt2ZXErNjJHWjZyWTJZajZZ?=
 =?utf-8?B?ZVpMQ2l1ektHd0h6RnEzWFdid2VsT2wxMFh6UXAvcW1aT1h1elhldUN6OFVD?=
 =?utf-8?B?eExYZzY5V0haelFFMUs1dlpvZW9YejFEc0hMV01Md09YMUxDQWRsSVhaUnUr?=
 =?utf-8?B?cW5ZZ0NzZm95Y05QTE5hVGlZTndodzFrall6Z2hGeHI0ZnZTS0VNQlNDVmZE?=
 =?utf-8?B?TkdXZFZLdnFuaWhVb3FGanRUTkFwYUlyU3dPYWtGREJaUHhGbDhNV2ZHZWpj?=
 =?utf-8?B?RTVkNk8rNTdpdDVvM2J2Qk9WR3RnWk5qUE5ISVl5VTNiVlR2TzBOSmJDbjdt?=
 =?utf-8?B?U25hR0VNM3ErWHN1RXlOWTYrSnNCTlVMemNkcE92Y2VhUER0OGJBVkhNNTdX?=
 =?utf-8?B?bGxkREJacjhhV1BaKzdlYTN2NWFIM1ZCTTVVS0R4RzlsZlp2dU5heU04UW9M?=
 =?utf-8?B?dGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0732910f-f47e-48df-4b4c-08dd1599b01e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 01:59:58.7135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xjcLfaxHV6mZLFIIfTsn9D0ouWRwDSWqZaiZ73MwxnltLWtTpJyQVBq42xSfKRStIZmWXLMGBSTXhj7XIYphIm4kMgxLs8Qy4Suy7v9L40s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6035
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

On 11/20/2024 15:43, Daniele Ceraolo Spurio wrote:
> As the first step towards adding PXP support, hook in the PXP init
> function, allocate the PXP structure and initialize the KCR register to
> allow PXP HWDRM sessions.
>
> v2: remove unneeded includes, free PXP memory on error (John)
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/xe/Makefile                   |   1 +
>   .../xe/compat-i915-headers/pxp/intel_pxp.h    |   4 +-
>   drivers/gpu/drm/xe/regs/xe_pxp_regs.h         |  17 +++
>   drivers/gpu/drm/xe/xe_device.c                |   6 +
>   drivers/gpu/drm/xe/xe_device_types.h          |   8 +-
>   drivers/gpu/drm/xe/xe_pci.c                   |   2 +
>   drivers/gpu/drm/xe/xe_pxp.c                   | 107 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_pxp.h                   |  13 +++
>   drivers/gpu/drm/xe/xe_pxp_types.h             |  26 +++++
>   9 files changed, 180 insertions(+), 4 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/regs/xe_pxp_regs.h
>   create mode 100644 drivers/gpu/drm/xe/xe_pxp.c
>   create mode 100644 drivers/gpu/drm/xe/xe_pxp.h
>   create mode 100644 drivers/gpu/drm/xe/xe_pxp_types.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index a93e6fcc0ad9..3c0bd3c814de 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -86,6 +86,7 @@ xe-y += xe_bb.o \
>   	xe_preempt_fence.o \
>   	xe_pt.o \
>   	xe_pt_walk.o \
> +	xe_pxp.o \
>   	xe_query.o \
>   	xe_range_fence.o \
>   	xe_reg_sr.o \
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h b/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
> index 5dfc587c8237..419e8e926f00 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
> @@ -10,9 +10,9 @@
>   #include <linux/types.h>
>   
>   struct drm_gem_object;
> -struct intel_pxp;
> +struct xe_pxp;
>   
> -static inline int intel_pxp_key_check(struct intel_pxp *pxp,
> +static inline int intel_pxp_key_check(struct xe_pxp *pxp,
>   				      struct drm_gem_object *obj,
>   				      bool assign)
>   {
> diff --git a/drivers/gpu/drm/xe/regs/xe_pxp_regs.h b/drivers/gpu/drm/xe/regs/xe_pxp_regs.h
> new file mode 100644
> index 000000000000..d67cf210d23d
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_pxp_regs.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright(c) 2024, Intel Corporation. All rights reserved.
> + */
> +
> +#ifndef __XE_PXP_REGS_H__
> +#define __XE_PXP_REGS_H__
> +
> +#include "regs/xe_regs.h"
> +
> +/* The following registers are only valid on platforms with a media GT */
> +
> +/* KCR enable/disable control */
> +#define KCR_INIT				XE_REG(0x3860f0)
> +#define   KCR_INIT_ALLOW_DISPLAY_ME_WRITES	REG_BIT(14)
> +
> +#endif /* __XE_PXP_REGS_H__ */
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 930bb2750e2e..b79cf470c169 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -49,6 +49,7 @@
>   #include "xe_pat.h"
>   #include "xe_pcode.h"
>   #include "xe_pm.h"
> +#include "xe_pxp.h"
>   #include "xe_query.h"
>   #include "xe_sriov.h"
>   #include "xe_tile.h"
> @@ -746,6 +747,11 @@ int xe_device_probe(struct xe_device *xe)
>   	if (err)
>   		goto err_fini_oa;
>   
> +	/* A PXP init failure is not fatal */
> +	err = xe_pxp_init(xe);
> +	if (err && err != -EOPNOTSUPP)
> +		drm_err(&xe->drm, "PXP initialization failed: %pe\n", ERR_PTR(err));
> +
>   	err = drm_dev_register(&xe->drm, 0);
>   	if (err)
>   		goto err_fini_display;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 8592f1b02db1..7f420d2e3ccc 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -34,6 +34,7 @@
>   
>   struct xe_ggtt;
>   struct xe_pat_ops;
> +struct xe_pxp;
>   
>   #define XE_BO_INVALID_OFFSET	LONG_MAX
>   
> @@ -306,6 +307,8 @@ struct xe_device {
>   		u8 has_llc:1;
>   		/** @info.has_mmio_ext: Device has extra MMIO address range */
>   		u8 has_mmio_ext:1;
> +		/** @info.has_pxp: Device has PXP support */
> +		u8 has_pxp:1;
>   		/** @info.has_range_tlb_invalidation: Has range based TLB invalidations */
>   		u8 has_range_tlb_invalidation:1;
>   		/** @info.has_sriov: Supports SR-IOV */
> @@ -496,6 +499,9 @@ struct xe_device {
>   	/** @oa: oa observation subsystem */
>   	struct xe_oa oa;
>   
> +	/** @pxp: Encapsulate Protected Xe Path support */
> +	struct xe_pxp *pxp;
> +
>   	/** @needs_flr_on_fini: requests function-reset on fini */
>   	bool needs_flr_on_fini;
>   
> @@ -568,8 +574,6 @@ struct xe_device {
>   		unsigned int czclk_freq;
>   		unsigned int fsb_freq, mem_freq, is_ddr3;
>   	};
> -
> -	void *pxp;
>   #endif
>   };
>   
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 9b81e7d00a86..de5034979ec3 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -62,6 +62,7 @@ struct xe_device_desc {
>   	u8 has_heci_cscfi:1;
>   	u8 has_llc:1;
>   	u8 has_mmio_ext:1;
> +	u8 has_pxp:1;
>   	u8 has_sriov:1;
>   	u8 skip_guc_pc:1;
>   	u8 skip_mtcfg:1;
> @@ -623,6 +624,7 @@ static int xe_info_init_early(struct xe_device *xe,
>   	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
>   	xe->info.has_llc = desc->has_llc;
>   	xe->info.has_mmio_ext = desc->has_mmio_ext;
> +	xe->info.has_pxp = desc->has_pxp;
>   	xe->info.has_sriov = desc->has_sriov;
>   	xe->info.skip_guc_pc = desc->skip_guc_pc;
>   	xe->info.skip_mtcfg = desc->skip_mtcfg;
> diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
> new file mode 100644
> index 000000000000..1a4d12d37d96
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pxp.c
> @@ -0,0 +1,107 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright(c) 2024 Intel Corporation.
> + */
> +
> +#include "xe_pxp.h"
> +
> +#include <drm/drm_managed.h>
> +
> +#include "xe_device_types.h"
> +#include "xe_force_wake.h"
> +#include "xe_gt.h"
> +#include "xe_gt_types.h"
> +#include "xe_mmio.h"
> +#include "xe_pxp_types.h"
> +#include "xe_uc_fw.h"
> +#include "regs/xe_pxp_regs.h"
> +
> +/**
> + * DOC: PXP
> + *
> + * PXP (Protected Xe Path) allows execution and flip to display of protected
> + * (i.e. encrypted) objects. This feature is currently only supported in
> + * integrated parts.
> + */
> +
> +static bool pxp_is_supported(const struct xe_device *xe)
> +{
> +	return xe->info.has_pxp && IS_ENABLED(CONFIG_INTEL_MEI_GSC_PROXY);
> +}
> +
> +static int kcr_pxp_set_status(const struct xe_pxp *pxp, bool enable)
> +{
> +	u32 val = enable ? _MASKED_BIT_ENABLE(KCR_INIT_ALLOW_DISPLAY_ME_WRITES) :
> +		  _MASKED_BIT_DISABLE(KCR_INIT_ALLOW_DISPLAY_ME_WRITES);
> +	unsigned int fw_ref;
> +
> +	fw_ref = xe_force_wake_get(gt_to_fw(pxp->gt), XE_FW_GT);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FW_GT))
> +		return -EIO;
> +
> +	xe_mmio_write32(&pxp->gt->mmio, KCR_INIT, val);
> +	xe_force_wake_put(gt_to_fw(pxp->gt), fw_ref);
> +
> +	return 0;
> +}
> +
> +static int kcr_pxp_enable(const struct xe_pxp *pxp)
> +{
> +	return kcr_pxp_set_status(pxp, true);
> +}
> +
> +/**
> + * xe_pxp_init - initialize PXP support
> + * @xe: the xe_device structure
> + *
> + * Initialize the HW state and allocate the objects required for PXP support.
> + * Note that some of the requirement for PXP support (GSC proxy init, HuC auth)
> + * are performed asynchronously as part of the GSC init. PXP can only be used
> + * after both this function and the async worker have completed.
> + *
> + * Returns -EOPNOTSUPP if PXP is not supported, 0 if PXP initialization is
> + * successful, other errno value if there is an error during the init.
> + */
> +int xe_pxp_init(struct xe_device *xe)
> +{
> +	struct xe_gt *gt = xe->tiles[0].media_gt;
> +	struct xe_pxp *pxp;
> +	int err;
> +
> +	if (!pxp_is_supported(xe))
> +		return -EOPNOTSUPP;
> +
> +	/* we only support PXP on single tile devices with a media GT */
> +	if (xe->info.tile_count > 1 || !gt)
> +		return -EOPNOTSUPP;
> +
> +	/* The GSCCS is required for submissions to the GSC FW */
> +	if (!(gt->info.engine_mask & BIT(XE_HW_ENGINE_GSCCS0)))
> +		return -EOPNOTSUPP;
> +
> +	/* PXP requires both GSC and HuC firmwares to be available */
> +	if (!xe_uc_fw_is_loadable(&gt->uc.gsc.fw) ||
> +	    !xe_uc_fw_is_loadable(&gt->uc.huc.fw)) {
> +		drm_info(&xe->drm, "skipping PXP init due to missing FW dependencies");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	pxp = drmm_kzalloc(&xe->drm, sizeof(struct xe_pxp), GFP_KERNEL);
> +	if (!pxp)
> +		return -ENOMEM;
> +
> +	pxp->xe = xe;
> +	pxp->gt = gt;
> +
> +	err = kcr_pxp_enable(pxp);
> +	if (err)
> +		goto out_free;
> +
> +	xe->pxp = pxp;
> +
> +	return 0;
> +
> +out_free:
> +	drmm_kfree(&xe->drm, pxp);
> +	return err;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pxp.h b/drivers/gpu/drm/xe/xe_pxp.h
> new file mode 100644
> index 000000000000..00f5e688c0d9
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pxp.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright(c) 2024, Intel Corporation. All rights reserved.
> + */
> +
> +#ifndef __XE_PXP_H__
> +#define __XE_PXP_H__
> +
> +struct xe_device;
> +
> +int xe_pxp_init(struct xe_device *xe);
> +
> +#endif /* __XE_PXP_H__ */
> diff --git a/drivers/gpu/drm/xe/xe_pxp_types.h b/drivers/gpu/drm/xe/xe_pxp_types.h
> new file mode 100644
> index 000000000000..4639cf49d267
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pxp_types.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright(c) 2024, Intel Corporation. All rights reserved.
> + */
> +
> +#ifndef __XE_PXP_TYPES_H__
> +#define __XE_PXP_TYPES_H__
> +
> +struct xe_device;
> +struct xe_gt;
> +
> +/**
> + * struct xe_pxp - pxp state
> + */
> +struct xe_pxp {
> +	/** @xe: Backpoiner to the xe_device struct */
> +	struct xe_device *xe;
> +
> +	/**
> +	 * @gt: pointer to the gt that owns the submission-side of PXP
> +	 * (VDBOX, KCR and GSC)
> +	 */
> +	struct xe_gt *gt;
> +};
> +
> +#endif /* __XE_PXP_TYPES_H__ */

