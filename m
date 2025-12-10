Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E893D3B9A9
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 07:16:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1752210E67C;
	Wed, 10 Dec 2025 07:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jQFXSZcO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0EF10E68A
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 07:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765350974; x=1796886974;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5sVVr8pvB+pW/F1iCye/9zEp6pETqZDEzfibun5SGlM=;
 b=jQFXSZcOJ2/OBOouHpKwXGJ0yyzm5vkXoq6bzRgV6N3qB/hiQT3Fgnou
 cjGr/ZhOBUKBfVursY4chJHeM/IC9QA7GS+4P7P7QJKWMDc4oBrBwVIlM
 FRqOhQSqT3WKIgb+qEFNCkz+YwpoIx4K1upYrVC7UIkbzfuWpt4xcqBh6
 LJ+t3JoUz5gh6Dzznvt/cb7+1dQrWBB+VE4qaGxn74JUfyZAXc2ja0B/A
 isT57c0HpiP3h8GWZTi1+PwFER5z251UD1OJhRq20MW+nsw4KVxYPolsk
 VCnBa7eIrEVS8db6JLq4Mww+Xo4nuz4MlW69Yrro3Cxllupte8ezCq3KS Q==;
X-CSE-ConnectionGUID: OjtNnwMFRf+mMUZZQHdJow==
X-CSE-MsgGUID: x4VmtSjvS7K70xnyueGVUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="71165102"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="71165102"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 23:16:13 -0800
X-CSE-ConnectionGUID: 0+Ik/lHiSAyPlnKA3kVslA==
X-CSE-MsgGUID: WyCgoilGQ9u5AOSkzqAGdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="219778926"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 23:16:13 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 23:16:12 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 23:16:12 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.55) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 23:16:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KQLZlbF25+3vnGWaVHJZ/7obyYQ8hza8yqkwDzV0X6bPwwj1aYmm5O3J5mOgZ6RR/nDihNN70lpiTXVMKmwM0ZgG6TZL1dR7C6gPGGK2dPzFFOrgRsBZpP2eieUzUuv9BOLgGgxL62DrS64J7KpDJyKEwAr/GdyWrxdwzoPfQkVMPuyhPlFFs1NpC4a9PIkG7EWRHZndCJMuT/U1apyWbsgF95PRK2GXxR9h8CnRB7n0veiFNz/R4bxg1q1UImykJIB36Li1FMYYZ66XnWuISiUboKHETSNmTJrJkqYpMHdo3B5DQa0OwmqxEym8sNlRgagx4djCNGAYI1KgNqS3ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qhiw0GuW0KHwq1qC1JFP13D91Ycp8ekCWNIOg72xAQA=;
 b=yeJED9seWQFxwzAAzmI7NpiHhguERKBzDxz2wQrM+yRhPWIhyVxP01xnV9qFyn98katJwCTy5t31hAGbp1F+FseiF7gvC6CI98unwmgCMKUbwt8bHF9oJJAJEbN641tGZvjGhr82Lu/xDMn2NVd1QJamUDR97EYbyGKoNAC12QhQa8H9SISrvT/OQ4MEiBWG6ZrI5qaC1dCgwYDw77aK2pmZhk2NpbV8DcoSQ30cPHPz6NfWUlv5uHI6Mmmb3anGqGmFbfa5/p45EInCqFxN9L4oTYlYuXi7vyjbT1OYR7xNDXBZEHs+3NMkq7f+mrf9fhB/A4TjK5PwKl4EHH/X4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3052.namprd11.prod.outlook.com (2603:10b6:5:69::29) by
 PH0PR11MB4870.namprd11.prod.outlook.com (2603:10b6:510:34::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.9; Wed, 10 Dec 2025 07:16:08 +0000
Received: from DM6PR11MB3052.namprd11.prod.outlook.com
 ([fe80::c685:30c9:fec0:40d0]) by DM6PR11MB3052.namprd11.prod.outlook.com
 ([fe80::c685:30c9:fec0:40d0%7]) with mapi id 15.20.9388.012; Wed, 10 Dec 2025
 07:16:08 +0000
Message-ID: <f656edf3-2555-4062-8d01-1df972ce5e9c@intel.com>
Date: Wed, 10 Dec 2025 12:46:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3 1/8] drm/xe/uapi: Add UAPI support for purgeable buffer
 objects
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pallavi.mishra@intel.com>
References: <20251210043112.3267620-1-arvind.yadav@intel.com>
 <20251210043112.3267620-2-arvind.yadav@intel.com>
 <aTkGIoPSL5xOWQ7R@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <aTkGIoPSL5xOWQ7R@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0236.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::10) To DM6PR11MB3052.namprd11.prod.outlook.com
 (2603:10b6:5:69::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3052:EE_|PH0PR11MB4870:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a0896a5-87ab-4816-1135-08de37bbfd0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qm43bEV4RXV5QXRtcTk5QndSd0tJK2xlNlhRdEJpSnlVRGppN0hEOGhyeG1l?=
 =?utf-8?B?MGEyQUIxN01HZDNTQy9nbGhzY2tsZjVXUjVBT3FaMWV4M1RySFpmK3hCbVVk?=
 =?utf-8?B?STFxS2lYd2dPTVl5dXFZOTA5WFNEbTlRaXhVancwWGM1VGtRYWZCYmkrWlV4?=
 =?utf-8?B?Ym9XbU5FVUJpU0FxWlRVaTVyTzVsRllCTWRNb084U2pRM290OXg3Uk5WRUIw?=
 =?utf-8?B?N09CM3ZSbWFGQWkvZDcwVXk4VUN0OFU1bXRBbStaOFVhRTErOTdOOUQwenFN?=
 =?utf-8?B?OTBOM1ZBU2xUWDJmeUdWTzNrMmRWY1ZlSHR4SjVnSDZUYW5TdHRRdjQ5U25U?=
 =?utf-8?B?L1BjeVF1OGJsSGl6K1hQbjA2M3VDQjFtNXpNWFBtdG50TXFOVWpFWVYvNGli?=
 =?utf-8?B?WTRUK05LeU9mSjI2dVJ3Z1FGVkdQL0JyMFBNeUE3c0FkTlpZUGYxYlp1dnlE?=
 =?utf-8?B?cmc4ZHJqQVNMYzZxSUlhSWtQanlDcnhEaUZmQ29vUWxnKzI1d2UvSWlYb2dH?=
 =?utf-8?B?Wk1vUWt6UGZPTWJpUzBDNVpqZDJRTW82RXJmNzBxaHRUdmFEQ1hTZjNIYTgw?=
 =?utf-8?B?STZ4c3RTZkdFLzIxb0FMQ1lPL3JidGJFYk52YThNWGFQckRxeDFoald0VEti?=
 =?utf-8?B?RkJkVVYxRDFFMDRkbHBXUzk2L1FwSlV0K2Zmdk82Z3o2MGpCNENiblJNemNq?=
 =?utf-8?B?THdta0U0RUUvVGRWZ0kxQUZzRzdOb2hGdUttQXVyYzNmRUhFcjRaVEZnY3NO?=
 =?utf-8?B?QkpiR0dwazFBeW14V2g4OU5yRFFhbC9RcUEvcUFRL0lKSjh3OEtqR1BxMU53?=
 =?utf-8?B?Q0lWaUljTXlKRFN0WjBCbHI2T3V2YUJraHlwRVFCQ3ZROUU5QVZFdnlRVWp2?=
 =?utf-8?B?TTIwZ0NNR2d2TGt5V1lkUkdqMHFNMEFUaHkyK2RNcUdna0dHaDN5bVJ0SUJi?=
 =?utf-8?B?UFJRMWlWbkEzVEQzZGtocWErMFNuUVppQTJYNEM5Q2k5N2p1ak5hanAxZE9o?=
 =?utf-8?B?NVpoYzkxN2ZjS0piNFRtQkR3ZVZiaDdZZ1M0R1p0K1JWZnkxWW1KbzdRTzJn?=
 =?utf-8?B?M3VrWDdxVEtHZDV0NkxQRXpNVTgzcG1EaTZYWjFnR0tZU3JJc1NCbHpQZlhI?=
 =?utf-8?B?REw4RzNKK2VPTkVzcGpTUFd4MzFGNUJzbXRaNm9hQ2FxbmhhYkhuTE13M3FL?=
 =?utf-8?B?Q0ZzN0RjSFRmekxlbHdCanhBblM5ZFFOeHJ0bTFlWnBmaVA1YWQ5TUJtSHQy?=
 =?utf-8?B?UkN3ZEZ0aUtqSXBQWWJwQUNaL0Z2cDhrVHNsV0JoTnNJcWoyQXZhNUprN0xL?=
 =?utf-8?B?d0NGQ2N5VGtQcDU3T3V0bmQ1TkNSZUU4aWxzNTFTRGMvY1pXVmpPQ0pEUW82?=
 =?utf-8?B?TWM3dWVsUFo1ZzFBemxBTWdFOUxyeGdOb3BiQTJ2MVNJM29PU052SUY0d1U3?=
 =?utf-8?B?UXpBNXFIUlhvM1hBajNPeWhGT0xiU0RRblpZSFA5WlVXeFY0OHVIN3FCRUdF?=
 =?utf-8?B?eXJ3Mmc5VHRld2Vyck1NRXZueDAvN3dpb3R6K2poVzJYcDRaZjVpV3g0Uy9y?=
 =?utf-8?B?M1lpZTE3SDNudjE3R2RGT2VBZnJOdUZISE9WcjJDUnpBdXpPTSs0dGMvOUsv?=
 =?utf-8?B?N2cwbmtTZUN3dXQ5R2VNejlYUVdxWkRmMThMS3lBVVdXZ2JCdWlkMmRFOFQv?=
 =?utf-8?B?QXlaY1A1MXQ0UFRYRTBkcHJXcktkQ3BCKzBpUlI5T3g1cStXTnR1Tjd5dSsw?=
 =?utf-8?B?M0NYS1FDcWhOOXV4VUN3T3JJYUN0dnVBZWFQQzNzWm1ES0RlVDgyYmMwYzVK?=
 =?utf-8?B?RlZwZGk5ZDIyL1RVOFJOWkFXWHU0UXZCcWJMOW5rd3lyMlpCZEpLWDZkcGlz?=
 =?utf-8?B?TXVqME9lK0IvZHhSbXJZUDUvZGV4NUxYb3RORnpHY2VzeXFtVlZsTTlNdmxZ?=
 =?utf-8?Q?YMdB9wiHCK9FOA7kn4ISJf8vK9vD+g2C?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3052.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGdEWTNPZFlSQjRTYTdHVEMvanFHeTFXbGZFcXZ1MzZoZGYvdkQvaUh3U2lG?=
 =?utf-8?B?dmorRGNJSUQ5MTVVKzd4WFdENjZPamRmMDdON0VxaUI1ZlU2SlZmRG9TUkRt?=
 =?utf-8?B?aW9QclR3QzhsQi9QazQ4VzRKUTZ5djdxdzY1Tzg2NzMzK3E4UDViQ2tkZXAx?=
 =?utf-8?B?UmdGakVPcmpBQVkxVzJkWUFCSldyamFFbG5xa1FCdU5Uc2cxblFjaWJYY29i?=
 =?utf-8?B?WkZUcm82NW16SElDdkU3YjFpczJHV3MrQzJLODloZmVwbUo1TW14MlltM0lI?=
 =?utf-8?B?MXFaZFUvVUVmc01IUHYwUlRTWGdDcnhGdzY5aVV0N3F3QTlqaUNaZWh0aFJI?=
 =?utf-8?B?WXhNMjFodlpoTlFsM0VLOXhkMkpzOHlVZURsSmNnbXlpblpkaUk1ZXU4WDls?=
 =?utf-8?B?VGRxdjVJSEdycERLUDErSWcyNXEvVkJoTWRDeWdiVjhMcEpOdXlvUFFBdDdQ?=
 =?utf-8?B?WVlydnFwSSs2bnVVbGlPZUswdTlQcGF1TEwzUkVhNVk4dDJnZHlEYXBrUmMz?=
 =?utf-8?B?OHJvdGFaV0VHSUlPK3ZCQWpkRE9HUFVaMkRqc2prRXF3alhSa0VxVStiTkgw?=
 =?utf-8?B?aklVQ1MwOG1sOHU1Y1l2ZlJtSHRNNzZ2eW9qZGpOOW9yNzY0RUk2VkRKSmZV?=
 =?utf-8?B?WGtWdkQ2TGlVZFJONk9XYys5MkREZHpmYkVxV1JBRi9taUZwV1pPRW1hQk1w?=
 =?utf-8?B?bDlmQVBFb2NrQlZFUnVRbGY4cE5uZG95NGZPeWtEcEN6dFJxcklhbEx0Rnh1?=
 =?utf-8?B?ajcvNjVyaWZiMGIvRmFKK2JXR29vVmJtK2pZaDJiZTdQWHI0blVLWFJzdkdn?=
 =?utf-8?B?MjdSUlExbjZSSk9MVmxBemg0MWkrTmRUUkZsNW5vRk8yenliOU5xMU00OThi?=
 =?utf-8?B?WFFSWi9xbTAxMU1IYlZ1UXNHN05ZM2ZPTkVjY05SNlpGZG9RTEl6WW9xdG9z?=
 =?utf-8?B?WjBrRUh3ZUVoaUJLMGw4VVNESVNwVFEzUW1EU0NvUmV1c3dJc0o5UUtNOENE?=
 =?utf-8?B?blFvMUVURktzVlc1Sk1kMkIxWUtSbXNMZlJZelpQRDY3MytqbzRXQjdPSkE2?=
 =?utf-8?B?cWFLLzJOTTBNY3ZzQWw1VnB2Z3pGeGpGcHJ1VCs4TW1USDlhVHRudXdUaTJL?=
 =?utf-8?B?NzNNMlBJUzR2KzJBczZLRno1bnJENENLRlZWZEl5OG9vcW05MU5XRVU5TkZM?=
 =?utf-8?B?dHZtV0tPTmtlN2dBU29GejJFUmJLUy9NcnN0dWdwWWpOb0pXOTVQWkpFYndk?=
 =?utf-8?B?dSsyb1ZORVFBaUFob0l2bDh5bXVDdm9MME1GVWRRMFRBbFZZUFhGLzNON0dy?=
 =?utf-8?B?VHJEYkV2dEV6bnVpWUxEZVhPZ2d1QkwraEhKdFpUMzB3RWxkbWYvck1namZW?=
 =?utf-8?B?aGszQ25PVVN3NnFpVjlRcTVtM3M5WlM4a0FHa0xnd1ZLTDhFZHRUdmpXMitT?=
 =?utf-8?B?L1dUREtBYkcxeExGdS9pLy9BaVdNRlFaNTdTdEJveTZudXc3dUdQdDQvWU1J?=
 =?utf-8?B?cnp1R3Jacy90UmloR05yUVB4ZHZwdXhtNHBXUTRWU003RlNtYlFjdVNScDNu?=
 =?utf-8?B?cVQ0eGFud3prd3NOeGgzcVd4aUxNc2FiUGppc2xtQ0VTd0xqL3d3eE9hUVQw?=
 =?utf-8?B?U1V4Q05POTFwdUdxU0FUMjRHd3JSYkdLY2orQUNRbGZGTEVIYmxlc2I1Wmcy?=
 =?utf-8?B?a1NXZHJTZ1lDYmJXd0F3Y0pVUVpvNlRPZDhEcENQcGUzaThxRDB1bGJuTHND?=
 =?utf-8?B?NDFLTTgyN3VjR0NZMzJhSE43eTJTaVVEVWlpRERpQUtBR3czUnFibnNORDNL?=
 =?utf-8?B?d2VxMWM4ditoNStJL1dReElIWEhjUWZBRXFiVG5zYmFvNHRGbkV2VGpOMWFW?=
 =?utf-8?B?NDNFYzNTamNQUlBDWlhsVjVnUmVHU0g1dndaY0JzZE9CZFlxK2g1OTZ5ZHhi?=
 =?utf-8?B?dDlBbFNITUZVWnRTS3pxNzZiUnZvL0FzbU1PNThGUW01cDRwaXNlcytTMjRo?=
 =?utf-8?B?N3M4SEloRGdHdDN5V0oyYng0ZFl0dHZrb1pWcVB6elAvMzdsZVhVQXpoRVBF?=
 =?utf-8?B?bWFPVk5wT2kzdEM1SEQzWS9tQ0dZeDlWV3F1aVk0SVExaGo5enZCMms3RnVP?=
 =?utf-8?Q?CFXFA5lknQ6aEYFooFRK6Toy3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a0896a5-87ab-4816-1135-08de37bbfd0d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3052.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 07:16:08.6694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tY8lzdkPjtap05T/eRbpBkeoE73QGzPq7lrxY30Gj5Rvfx/A4itixPHhAGgw36AyvLNCTDbKG9Xuni1wg300ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4870
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


On 10-12-2025 11:03, Matthew Brost wrote:
> On Wed, Dec 10, 2025 at 10:00:45AM +0530, Arvind Yadav wrote:
>> From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>
>> Extend the DRM_XE_MADVISE ioctl to support purgeable buffer object
>> management by adding DRM_XE_VMA_ATTR_PURGEABLE_STATE attribute type.
>>
>> This allows userspace applications to provide memory usage hints to
>> the kernel for better memory management under pressure:
>>
>> This allows userspace applications to provide memory usage hints to
>> the kernel for better memory management under pressure:
>>
>> - WILLNEED: Buffer is needed and should not be purged. If the BO was
>>    previously purged, retained field returns 0 indicating backing store
>>    was lost (once purged, always purged semantics matching i915).
>>
>> - DONTNEED: Buffer is not currently needed and may be purged by the
>>    kernel under memory pressure to free resources. Only applies to
>>    non-shared BOs.
>>
>> The implementation includes a 'retained' output field (matching i915's
>> drm_i915_gem_madvise.retained) that indicates whether the BO's backing
>> store still exists (1) or has been purged (0).
>>
>> v2:
>>    - Add PURGED state for read-only status, change ioctl to DRM_IOWR,
>>      add retained field for i915 compatibility
>>
>> v3:
>>    - UAPI rule should not be changed (Matthew Brost)
>>    - Make 'retained' a userptr (Matthew Brost)
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   include/uapi/drm/xe_drm.h | 39 +++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 39 insertions(+)
>>
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 876a076fa6c0..fc0dada62dd0 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -2079,6 +2079,7 @@ struct drm_xe_madvise {
>>   #define DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC	0
>>   #define DRM_XE_MEM_RANGE_ATTR_ATOMIC		1
>>   #define DRM_XE_MEM_RANGE_ATTR_PAT		2
>> +#define DRM_XE_VMA_ATTR_PURGEABLE_STATE		3
>>   	/** @type: type of attribute */
>>   	__u32 type;
>>   
>> @@ -2157,6 +2158,44 @@ struct drm_xe_madvise {
>>   			/** @pat_index.reserved: Reserved */
>>   			__u64 reserved;
>>   		} pat_index;
>> +
>> +		/**
>> +		 * @purge_state_val: Purgeable state configuration
>> +		 *
>> +		 * Used when @type == DRM_XE_VMA_ATTR_PURGEABLE_STATE.
>> +		 *
>> +		 * Configures the purgeable state of buffer objects in the specified
>> +		 * virtual address range. This allows applications to hint to the kernel
>> +		 * about bo's usage patterns for better memory management.
>> +		 *
>> +		 * Supported values for @purge_state_val.val:
>> +		 *  - DRM_XE_VMA_PURGEABLE_STATE_WILLNEED (0): Marks BO as needed.
>> +		 *    If BO was purged, returns retained=0 (backing store lost).
>> +		 *
>> +		 *  - DRM_XE_VMA_PURGEABLE_STATE_DONTNEED (1): Hints that BO is not
>> +		 *    currently needed. Kernel may purge it under memory pressure.
>> +		 *    Only applies to non-shared BOs. Returns retained=1 if not purged.
>> +		 */
>> +		struct {
>> +#define DRM_XE_VMA_PURGEABLE_STATE_WILLNEED	0
>> +#define DRM_XE_VMA_PURGEABLE_STATE_DONTNEED	1
>> +			/** @purge_state_val.val: value for DRM_XE_VMA_ATTR_PURGEABLE_STATE */
>> +			__u32 val;
>> +
>> +			/* @purge_state_val.pad */
>> +			__u32 pad;
>> +			/**
>> +			 * @purge_state_val.retained: Pointer to output field for backing
>> +			 * store status.
>> +			 *
>> +			 * Userspace provides a pointer to u32. Kernel writes to it:
>> +			 * 1 if backing store exists, 0 if purged.
>> +			 * Similar to i915's drm_i915_gem_madvise.retained field.
>> +			 */
>> +			__u64 retained;
>> +			/** @purge_state_val.reserved: Reserved */
>> +			__u64 reserved;
> You cannot make this part of the union (purge_state_val) larger than the
> existing union (16 bytes) or the bit layout of the IOCTL changes and the
> uAPI breaks.
>
> So just drop the '__u64 reserved' field.
Noted.
>
> I'll also follow up if we can change an IOCTL from DRM_IOW to DRM_IOWR
> too. I honestly don't know if that is allowed or not.


Noted. Please update us once you have clarity on whether changing from 
DRM_IOW to DRM_IOWR is allowed, for future reference.

~Arvind

>
> Matt
>
>> +		} purge_state_val;
>>   	};
>>   
>>   	/** @reserved: Reserved */
>> -- 
>> 2.43.0
>>
