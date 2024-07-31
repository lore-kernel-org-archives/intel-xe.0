Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B182AC3DA7F
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jul 2024 15:02:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7607410E64A;
	Wed, 31 Jul 2024 15:02:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mCndI1Ti";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31DA110E649
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jul 2024 15:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722438119; x=1753974119;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=mRIQshvCLbyS+KIIgY1JdlermFMchOxRkA9chUwEmwQ=;
 b=mCndI1TiTtn0CMq7lVEoKrB3XDzp5da0x5JuZKCeEMdcBtKxDPk41KVF
 RSRhxz+gMMKPx56kG74ug55sQA5j4GuWPQzMOdZ1snyVIwA9Sr76ZpO6J
 O75a0jIueaZpUbAopPN6RajM7KQcIjQVzCkfTqh+TV+DcAXCGkqSeOQ0Z
 8vpOXVjLQ30N01lcbkXlBx9HQnOMuKaCp+C01JUEe/fcAGieVge/Whhxw
 V0okrI3X/vSzWRkoJUlrvY1w2UuJKD2EQoaw5IkMlZ7APSX2aeBRXr6qb
 8mH4/R/C2sjoJZDMw2DdP3TfzdS/leL8whkLiOOrcq2IHvWA5ucIi+awX A==;
X-CSE-ConnectionGUID: ak0EucCdSd+D2KE/QqMcgw==
X-CSE-MsgGUID: 959HIVYoSq+VVK4VPim0AA==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="23241004"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="23241004"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 08:01:54 -0700
X-CSE-ConnectionGUID: V99xV76MSY6V3AHZUwGn4w==
X-CSE-MsgGUID: mm5ieyYMRGaH+uXLbP0qPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="54684536"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jul 2024 08:01:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 08:01:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 31 Jul 2024 08:01:52 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 31 Jul 2024 08:01:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YYPiAIOkxOCkbN03NRYHRtvMEBEOZM0XRrjd54uW/I+RCbes9034g7RtjM3TtmHHl0wn+s9rA3yM24pgtZw/WS/L+oHLLUKKvNRGRnEYcjZDPU6Fj/eRKXoIUPfS/RVFg0Obf1bprPTnPE/LnPaCDIah52eMaD6vPy06jNuK4rdjiFffak7C9DgmZqYcCv4jvRrGla7ytJhCdoIKE45sDCaafS65LaTSKiuX4IhAzg1Hq4Ac67KNm/InaOCZPTRISlMLtXgP9mmFaVQlY0zQ0BtmVyCD6yv68nQeE8kjA6cOl+BB/WTNWWHrOmGozKjwNRNBP0/479A3GVXRyL/P2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KBHBw8uaXFARrN3oubIqdSvnmip6lA+XE7NT6oplKE4=;
 b=p2olAUFZTXIGvxXyxqxVYob7WsD65PfEezVYDhfdRbANWHkZ5nZ1ShYtSdYWvHIbVU40HlSg3UOU7cQltu0jIqKVD1L79rMJm0er3qNpMZw51/XqTMctuMHur+642oe9VF1/ncSDF8Ht85vP3JPMSp5l7VbxCsrqjSM2cVfOH6WdD2SWYQkpi9NU0vqjg/J/4jK/nWOSXJv5Ux/BmGHp6TACkl1A5Ou3Emni19/cDZMbqwsE72MCNprKASFN20mfgqf+/WYypY3ZNuK8dJjDt2reUyanWah/tuoEMbeSUclkdwwoIQx+AlwfRuFA4jP1RZMSKZx+Tfw3kpRziJrkog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by MN0PR11MB5988.namprd11.prod.outlook.com (2603:10b6:208:373::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Wed, 31 Jul
 2024 15:01:46 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%2]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 15:01:46 +0000
Message-ID: <0d0c8c8c-6ced-4f9f-85f0-3e40b0fb2312@intel.com>
Date: Wed, 31 Jul 2024 11:01:42 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 4/5] drm/xe/guc: Extract GuC error capture lists
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20240724145130.522668-1-zhanjun.dong@intel.com>
 <20240724145130.522668-5-zhanjun.dong@intel.com>
 <7af60dac4bfa59f9d3c94f6ed4bc610616933623.camel@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <7af60dac4bfa59f9d3c94f6ed4bc610616933623.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR16CA0028.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::41) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|MN0PR11MB5988:EE_
X-MS-Office365-Filtering-Correlation-Id: f419cdd2-7f4f-452f-e241-08dcb171b26f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVBxdVVEeUUyU2FRTEp0cTFVbzRTbmtpOWtGV0lKQWpieUxZeFNyNWliNDFH?=
 =?utf-8?B?VVI2RE4yeUQ1eENQeElvVHJZK3plMGxVK2hHY2RxUjFLTVdFcWJkYkhac1Qx?=
 =?utf-8?B?M2d2dkhSYzRTNUtIbWdlbjlWcG9xTy9tL0ZFdFc2TnVKbWlleUlKRHhDVUc3?=
 =?utf-8?B?SzdJUkVDcXRLN3owWGE4azVjTzJwdmFlUDVGb09UNllYV0E3bXk2R1RaTXlS?=
 =?utf-8?B?Uyt5TnE0c3NCOGVMbDRzU0E4VGptTmFJM0ZsVXFwcFloeVMxT2JYUzhsekU0?=
 =?utf-8?B?eFNqa29IUEdvNGJYV2dKckY3L20xSWdEMG5ydHdoV3RuSlBrM3JURTVuR3Uz?=
 =?utf-8?B?Ung0ank3dnNYTmhOUDJmRXNUeE5NSDVXdmN2dDJYS09GdXREcVZkUlZDWmR3?=
 =?utf-8?B?cFVVdGdtUGhVc2FvSkU0YmNYRXBVa0FzQ0c5aFhOOHNjQlNBYXpieTJrbTNi?=
 =?utf-8?B?ZGNPVWRRL1U1bGg3ZEUrTTZHc0w2WFFENFUrd2JES3NBbWdzeGkybGZpeGJ5?=
 =?utf-8?B?WCtzSFRVSVNRTkgxYWJBUFF6dEZkbGdvZkgxQW45WmFKdnRoUWNPMHBzUkdS?=
 =?utf-8?B?OEZwQmluWmNMTDZWVldVVmYzaGgwZXIwN0l1S2hYTVU2RVN5aXBjNmtqU2Qv?=
 =?utf-8?B?OWNSaDBkVStQa0hZRHFiUUxIT1l2WmI2SStPTmpnZHd5Tkh4V25ZM2ZFUmcy?=
 =?utf-8?B?VGtRd1N5VEhGWlMyd2wrWG5pLzRtK3BHWkxRMlBBeThvRzc2UG5weGFTOG9m?=
 =?utf-8?B?UjViMld5ZTZZUlVXaHFCc0E3bXVTUFYzcEQvTnF2UnlJc216N25QNXVwcVVh?=
 =?utf-8?B?OG4xSVY4amVaMkZ6bmk0Q1NaVUtFN21IRHNHMFYxSjNGckJaVEs3VmRUanRH?=
 =?utf-8?B?TFdTMFdFdGUyYWZueGMrRW40NW12akZmVmttZWg0NkQxQ0Z0b1NGU0hKa1Nx?=
 =?utf-8?B?YXRuejhucDRLR3I3T01Gd2ZISnFGak92OGNLRVVIQnZxNVlVQktGT1lYS1pO?=
 =?utf-8?B?WDNwUlB0SURWa1kyZUtXTzE0Ry9lR1hGaVBJSlNGNzZMNjV5VTBwaXdBNng5?=
 =?utf-8?B?K2RpUk5tRnI1Z01jbi9qczUzZlJCWlBvSEtzMllvUDBYdlpsdDdCdFlmQm1v?=
 =?utf-8?B?UG9lS1N6cVp3REZmYi9xTXpnZ0hqYUlpNzcrUFlBdHlJdE5NL0RaR2RYOG50?=
 =?utf-8?B?WGlNbGxnUTRBOHpPVi9hWUlQWk1iODNpYy9sVmh1ZSs2K2xDWkVFNGxySjZC?=
 =?utf-8?B?MCtpcWlHeXVSMXZqNzl0VWJ6aGl0Q2xQd0U2RW4veWxOYVdjMURHd0FvVlZP?=
 =?utf-8?B?L1dQczRqcU1vZ1dwNWNxMFZ4YStYLzRNSnRRQTNyRWZweWV6RXdtbjZSYTJX?=
 =?utf-8?B?cWlmOW9YY1ViYStUbmJrOUN1cGxGL3RtYnB5SVkrcjhBb1BKN20rN0drQmFS?=
 =?utf-8?B?OC9lMU9GT2FnYTU5TlZKVjRjL3A4YUJtbGc2b0JnTUcvcmNKaWRTclVXQ3I3?=
 =?utf-8?B?OGpxazZGTjVrczR3UnN4c0t4TXRiV09mald0UlVjRFNQSHlyZlc3SEFkTEhG?=
 =?utf-8?B?dDBRWm8zWGlJTFFKTmorbmtwWWt4WDkwOVpyb2JVSFpwUEQ4cFJ4K1p1eFEr?=
 =?utf-8?B?cGNJY1NwQmh6MkFUSVJiSnFndVAySVJJV1lQQTArdnJsNFV0MWloS3A0dGI0?=
 =?utf-8?B?NnNvYU5WczdwcGtUK2FNWHZ2QklhSEdPR2I4Uy9mTGtWTnBaUXBsV0tIYk1K?=
 =?utf-8?B?ODdTeDN6TnBaZG1uNXMveWJ1RGVtcVY2VjZRTkNqaDlCZG1peVJYbzl1MjZH?=
 =?utf-8?B?OSs4OXpqNitpOFExUGlYZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWp6eEtDZ3R6TDRkcXBHU1JYc0RVRXFGYlMzWjcvVGNaVFpZRmVTSHN2S1lu?=
 =?utf-8?B?R1lhWXgycVZYMUhRWVIwWWlFRlpQd0grcnNMUkdmVVlLQllmcmRDdnIvNjYx?=
 =?utf-8?B?V2xQUG1JNElHb1JKbkJiN3N4SmI0ak5ZQngxaGxNeStTWlJzVEFteE1hMHNO?=
 =?utf-8?B?WDBZWDlhUzFteVNVVXBQS21xemx1OEJHN2ZscytYdlZYb0Z5endkU2hOOFhP?=
 =?utf-8?B?NVQ1R1Y3Z1ZGK21oWEJSUS9OR0VlVitNeXhEZFFhT1lTWkZwUGZxMVJQVldO?=
 =?utf-8?B?bVVuSFpuNmlyZmFJb3l6dDBRRWhNY2E3SjlJMzBzRVVLR0NLSElsU0ZnTUVZ?=
 =?utf-8?B?QnBMUGVqTGlnL1FOejlNWWdvY1QxbzNUdGhybk5IUjdHTU1Rb3o5L1lWYS83?=
 =?utf-8?B?bGtOSCszUnJIN3lPaHR4cjRzUDZlc0pWeHZYRFdKaVdFK3JibFBQRDRBdFlv?=
 =?utf-8?B?NStYaGVOZVRXNlBtRUErNFByR1JmT2pyR2I3WE1MMDlrMVBxSC9xSDhFOXB0?=
 =?utf-8?B?M1EzR0lIdTUwaG9iRSsxcTJBbHZSTy9uQVRNNVdKUlFGendNTk93dDdjaWxi?=
 =?utf-8?B?Qis1RjgvWUY4dThkdHVXSVMySFY4dW1udlFuM0VkYXNyUjltUVpvcjUyR2xa?=
 =?utf-8?B?OHltd2lGVmU4UXNDNXVUcXRiQWIyWmcra1N0OUh1VHBSUU5qSWtvSVEzSmxL?=
 =?utf-8?B?eHFBdHhNL1Q4RjRFMmtwSnl3c1F3enJyYUdnekwxUE9BUU1jSkxLQklFQklu?=
 =?utf-8?B?aXNGM3kxRkpJOGVBRjMrdjJ0THJITERKams3ZSt6WUZrS0tJbFY2K2F1N1pG?=
 =?utf-8?B?VDM0RkdzKzY1TnVZais1ZmhxYWZxcVIxM3JOVlpvQzh0SEVlOGlUVm4zbmNq?=
 =?utf-8?B?SnE4NWVJQ3VUSWcwRis2L0diZ1c2YVd5MzBoQlJrMWVqT2xrS2N4NS9UYUlB?=
 =?utf-8?B?Q1lZWkYvUGZia0tSTFFtYTR5cFlLM0JubUkwTy9IT1dPK3Y0ZFFlUVRvUWth?=
 =?utf-8?B?NDlPaHM3elJzTWJTUis3cjV5ZjBpOXl1dTV4bHpPK0RKSC81SlM0ZjlqUHN4?=
 =?utf-8?B?alV3bHhKRktRS3VrYWpRejZRVm52dVNDWVVrYjdFWEI4c3FhbERlSHBGWWxl?=
 =?utf-8?B?K0R5c2dSSWNScWVwTU1xR3RWN2ZqMWNLQ25lUlJiL2xrMU5VdGFxZlYycFE2?=
 =?utf-8?B?ZHE5SU55bTBuQ2wxWXJYN1lRSlE2dlplcERSczkzTG5YcWNIM2U1dHg4Q0o0?=
 =?utf-8?B?WE5weUM4cVFDT2V0UmZzOW0xNnBKUXNyTm9XM0dod09abHZYY21wSlgzRmIz?=
 =?utf-8?B?a1J6Wk16cXJPTTBYbXRCT2xTZ3JLRUdRUmsvVk51em1XcmZpc2JhSUZHUjZZ?=
 =?utf-8?B?dEdjVlY1VkFDOUFzU0FpOTJpUUlPcDRpTUJpcC9oUmlGbmdJbnFRL2dQU21u?=
 =?utf-8?B?MU82THltQk9uenRwQ0ZSV3pyTkN2Rm9kbjB3NTFtWkdyeUVyOGVlOVVjUXhU?=
 =?utf-8?B?TGtDc1NJM1E0MzB3dXJqK2JGQ0ZmcjhmL2lMU2JmQ0srb3p3bEpseDlwVmNs?=
 =?utf-8?B?T0Y2Z0wxZ3pjbTRoODd5UU13Y3o2ZWwyL041NmxBTmxSTGZIdzhCdGRuZ1hx?=
 =?utf-8?B?VHlZSzJobExoS2FJeEwvL0R4NEloTFNWOVJDRWhmeFE4N2NyZUVtOTZnYjZn?=
 =?utf-8?B?N3plbC9zdmNjbzFwbjlmSjNOOW9JTzQxWHJ6YTVhU2kxK2V5WDhEaVJrbXlZ?=
 =?utf-8?B?TE9sbCt2Qm03VEI0V2JXR1BVaCtJTEkzNWpobEp5MEp1blQrMFNSU3BhRnJO?=
 =?utf-8?B?VkcvMmZUVHk2RGoyRHQ4ZVU5VEs4eXI4bHFHbkdsMWw0ZzBsaWU3ay85TFNo?=
 =?utf-8?B?elgxOHFtNWJvMGV1WmpmZ0lWeTFXUlZIb00rZ1ZCMjA3QTBzRmhKMmJsNExk?=
 =?utf-8?B?WEZmOXZMdGlsN0ZXL0VaMEdFWGF3RGZDVEFYbW91OUM2anc5REJjSy9ETWh3?=
 =?utf-8?B?aDZ5bDNnN0d6K0ZjT1JzYmlXdlV4NUpUZzJNSjdTalpNekY5WEs4MzhRTUFw?=
 =?utf-8?B?RkFNclpZNm5KNzlReUNsZjJsSk9lNXcwSFBKODFiQ2lSMzFScjhlamNUQmZY?=
 =?utf-8?Q?ON1Pfck0icV0dV1zV0+XGFXQg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f419cdd2-7f4f-452f-e241-08dcb171b26f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 15:01:46.4716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cSfcBn+LHkOyPIjah5Ll8IcN+KaJdgXgvAxKF1AZvDZ1Lase+3kRleM9Yi1SDezxwhmecxADguYh2CIMm/CMXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5988
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

See my comments inline below.

Regards,
Zhanjun Dong

On 2024-07-30 9:09 p.m., Teres Alexis, Alan Previn wrote:
> There are two minor issues, i believe they are trivial.
> Other than that everything else looks good to me.
> Thus i'm providing a conditional-rb on those two
> non-nit's below:
> 
> 
> Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> 
> P.S.: appreciate the work you did diving deep
> into these legacy codes and optimizing that wrap-around
> extraction.

Thanks Alan.
> 
> 
> On Wed, 2024-07-24 at 07:51 -0700, Zhanjun Dong wrote:
>> Upon the G2H Notify-Err-Capture event, parse through the
>> GuC Log Buffer (error-capture-subregion) and generate one or
>> more capture-nodes. A single node represents a single "engine-
>> instance-capture-dump" and contains at least 3 register lists:
>> global, engine-class and engine-instance. An internal link
>> list is maintained to store one or more nodes.
>>
>> Because the link-list node generation happen before the call
>> to devcoredump, duplicate global and engine-class register
>> lists for each engine-instance register dump if we find
>> dependent-engine resets in a engine-capture-group.
>>
>>
> alan:snip
> 
> 
>> +/**
>> + * struct guc_log_buffer_state - GuC log buffer state
>> + *
>> + * Below state structure is used for coordination of retrieval of GuC firmware
>> + * logs. Separate state is maintained for each log buffer type.
>> + * read_ptr points to the location where Xe read last in log buffer and
>> + * is read only for GuC firmware. write_ptr is incremented by GuC with number
>> + * of bytes written for each log entry and is read only for Xe.
>> + * When any type of log buffer becomes half full, GuC sends a flush interrupt.
>> + * GuC firmware expects that while it is writing to 2nd half of the buffer,
>> + * first half would get consumed by Host and then get a flush completed
>> + * acknowledgment from Host, so that it does not end up doing any overwrite
>> + * causing loss of logs. So when buffer gets half filled & Xe has requested
>> + * for interrupt, GuC will set flush_to_file field, set the sampled_write_ptr
>> + * to the value of write_ptr and raise the interrupt.
>> + * On receiving the interrupt Xe should read the buffer, clear flush_to_file
>> + * field and also update read_ptr with the value of sample_write_ptr, before
>> + * sending an acknowledgment to GuC. marker & version fields are for internal
>> + * usage of GuC and opaque to Xe. buffer_full_cnt field is incremented every
>> + * time GuC detects the log buffer overflow.
>> + */
>> +struct guc_log_buffer_state {
>> +       /** @marker: buffer state start marker */
>> +       u32 marker[2];
>> +       /** @read_ptr: the Last Byte Offset Location */
> alan: nit: added clarity per spec --> "the last byte offset that was read by KMD previously"
>> +       u32 read_ptr;
>> +       /** @write_ptr: the Byte Offset Location */
> alan: nit: added clarity per spec --> "the next byte offset location that will be written by GuC".
Thanks, I like this, it point out access it.
>> +       u32 write_ptr;
>> +       /** @size: Log buffer size */
>> +       u32 size;
...
>> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
>> index 72abba8f7bf8..bc400764e80d 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
>> @@ -10,6 +10,7 @@
>>   
>>   #include "abi/guc_actions_abi.h"
>>   #include "abi/guc_capture_abi.h"
>> +#include "abi/guc_log_abi.h"
>>   #include "regs/xe_engine_regs.h"
>>   #include "regs/xe_gt_regs.h"
>>   #include "regs/xe_guc_regs.h"
>> @@ -32,6 +33,51 @@
>>   #include "xe_macros.h"
>>   #include "xe_map.h"
>>   
>> +/*
>> + * struct __guc_capture_bufstate
>> + *
>> + * Book-keeping structure used to track read and write pointers
>> + * as we extract error capture data from the GuC-log-buffer's
>> + * error-capture region as a stream of dwords.
>> + */
>> +struct __guc_capture_bufstate {
>> +       u32 size;
>> +       u32 data_offset;
>> +       u32 rd;
>> +       u32 wr;
>> +};
>> +
>> +/*
>> + * struct __guc_capture_parsed_output - extracted error capture node
>> + *
>> + * A single unit of extracted error-capture output data grouped together
>> + * at an engine-instance level. We keep these nodes in a linked list.
>> + * See cachelist and outlist below.
>> + */
>> +struct __guc_capture_parsed_output {
>> +       /*
>> +        * A single set of 3 capture lists: a global-list
>> +        * an engine-class-list and an engine-instance list.
>> +        * outlist in __guc_capture_parsed_output will keep
>> +        * a linked list of these nodes that will eventually
>> +        * be detached from outlist and attached into to
>> +        * xe_codedump in response to a context reset
>> +        */
>> +       struct list_head link;
>> +       bool is_partial;
>> +       u32 eng_class;
>> +       u32 eng_inst;
>> +       u32 guc_id;
>> +       u32 lrca;
>> +       struct gcap_reg_list_info {
>> +               u32 vfid;
>> +               u32 num_regs;
>> +               struct guc_mmio_reg *regs;
>> +       } reginfo[GUC_STATE_CAPTURE_TYPE_MAX];
>> +#define GCAP_PARSED_REGLIST_INDEX_GLOBAL   BIT(GUC_STATE_CAPTURE_TYPE_GLOBAL)
>> +#define GCAP_PARSED_REGLIST_INDEX_ENGCLASS BIT(GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS)
>> +};
>> +
> alan: snip
>>
> 
> 
>> +/*
>> + * GuC's error-capture output is a ring buffer populated in a byte-stream fashion:
>> + *
>> + * The GuC Log buffer region for error-capture is managed like a ring buffer.
>> + * The GuC firmware dumps error capture logs into this ring in a byte-stream flow.
>> + * Additionally, as per the current and foreseeable future, all packed error-
>> + * capture output structures are dword aligned.
>> + *
>> + * That said, if the GuC firmware is in the midst of writing a structure that is larger
>> + * than one dword but the tail end of the err-capture buffer-region has lesser space left,
>> + * we would need to extract that structure one dword at a time straddled across the end,
>> + * onto the start of the ring.
>> + *
>> + * Below function, guc_capture_log_remove_bytes is a helper for that. All callers of this
>> + * function would typically do a straight-up memcpy from the ring contents and will only
>> + * call this helper if their structure-extraction is straddling across the end of the
>> + * ring. GuC firmware does not add any padding. The reason for the no-padding is to ease
>> + * scalability for future expansion of output data types without requiring a redesign
>> + * of the flow controls.
>> + */
>> +static int
>> +guc_capture_log_remove_bytes(struct xe_guc *guc, struct __guc_capture_bufstate *buf,
>> +                            void *out, int bytes_needed)
>> +{
>> +       #define GUC_CAPTURE_LOG_BUF_COPY_RETRY_MAX      3
> alan: (conditional-rb) please double check if you are allowed to have a #define indented like this.
Oops, should be start at 0
>> +       int fill_size = 0, tries = GUC_CAPTURE_LOG_BUF_COPY_RETRY_MAX;
>> +       int copy_size, avail;
>> +
>> +       xe_assert(guc_to_xe(guc), bytes_needed % sizeof(u32) == 0);
>> +
>> +       if (bytes_needed > guc_capture_buf_cnt(buf))
>> +               return -1;
>> +
>> +       while (bytes_needed > 0 && tries--) {
>> +               int misaligned;
>> +
>> +               avail = guc_capture_buf_cnt_to_end(buf);
>> +               misaligned = avail % sizeof(u32);
>> +               /* wrap if at end */
>> +               if (!avail) {
>> +                       /* output stream clipped */
>> +                       if (!buf->rd)
>> +                               return fill_size;
>> +                       buf->rd = 0;
>> +                       continue;
>> +               }
>> +
>> +               /* Only copy to u32 aligned data */
>> +               copy_size = avail < bytes_needed ? avail - misaligned : bytes_needed;
>> +               xe_map_memcpy_from(guc_to_xe(guc), out + fill_size, &guc->log.bo->vmap,
>> +                                  buf->data_offset + buf->rd, copy_size);
>> +               buf->rd += copy_size;
>> +               fill_size += copy_size;
>> +               bytes_needed -= copy_size;
>> +
>> +               if (misaligned)
>> +                       xe_gt_dbg(guc_to_gt(guc),
>> +                                 "Bytes extraction not dword aligned, skipping.\n");
> alan:nit, based on code flow, debug message should say "clipping", not "skipping".
> To me either option (skipping or clipping) are okay as long as the message matches
> the code. Also, i personally prefer tihs to be a xe_gt_warn - because this shouldn't
> happen and basically means one of the componnets are breaking the rules.
Sure, will do.
>> +       }
>> +
>> +       return fill_size;
>> +}
>> +
>> +static int
>> +guc_capture_log_get_group_hdr(struct xe_guc *guc, struct __guc_capture_bufstate *buf,
>> +                             struct guc_state_capture_group_header_t *ghdr)
>> +{
>> +       int fullsize = sizeof(struct guc_state_capture_group_header_t);
>> +
>> +       if (guc_capture_log_remove_bytes(guc, buf, ghdr, fullsize) != fullsize)
>> +               return -1;
>> +       return 0;
>> +}
>> +
>> +static int
>> +guc_capture_log_get_data_hdr(struct xe_guc *guc, struct __guc_capture_bufstate *buf,
>> +                            struct guc_state_capture_header_t *hdr)
>> +{
>> +       int fullsize = sizeof(struct guc_state_capture_header_t);
>> +
>> +       if (guc_capture_log_remove_bytes(guc, buf, hdr, fullsize) != fullsize)
>> +               return -1;
>> +       return 0;
>> +}
>> +
>> +static int
>> +guc_capture_log_get_register(struct xe_guc *guc, struct __guc_capture_bufstate *buf,
>> +                            struct guc_mmio_reg *reg)
>> +{
>> +       int fullsize = sizeof(struct guc_mmio_reg);
>> +
>> +       if (guc_capture_log_remove_bytes(guc, buf, reg, fullsize) != fullsize)
>> +               return -1;
>> +       return 0;
>> +}
>> +
> 
> alan: snip
> 
>>
>> @@ -1594,6 +1594,9 @@ static int guc_exec_queue_suspend(struct xe_exec_queue *q)
>>   static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
>>   {
>>          struct xe_guc *guc = exec_queue_to_guc(q);
>> +
>> +       wait_event(q->guc->suspend_wait, !q->guc->suspend_pending ||
>> +                  xe_guc_read_stopped(guc));
> alan: (conditional-rb) this looks weird, i thought the above wait_event code
> is already there in baseline and we only changed it from guc_read_stopped
> to xe_guc_read_stopped, not adding the entire new wait function. Also, a local
> variable declaration below this? ... did checkpatch not warn? Can you double check
> if this is an error and fix if necessary? (I'm wondering if you introduced a
> trivial rebase line-number-alignment error.
Thanks Alan, you are right, that is the rebase line-number-alignment 
error. Will fix it in next rev.

>>          int ret;
>>   
> 
> 
> alan:snip
