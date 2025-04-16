Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E30C369BD
	for <intel-xe@archiver.kernel.org>; Wed, 16 Apr 2025 14:37:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C52B10E023;
	Wed, 16 Apr 2025 14:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G+zBD6td";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DCEB10E26C
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Apr 2025 14:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744814230; x=1776350230;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SbdGti2oFH/KTlpyXzViQ1HPAsqurKr/CY/8QaFpk08=;
 b=G+zBD6tdSf65A2d1HKfRDxWCzCxqZtvJARcnAfmw8wMNtFnaLURLPSk/
 uiz7K0hVIzqtnjt9KNosJGGDT9/NUxQCCv9AZ4TMBr2EX6AoREdWgQ7od
 g0bZd2idZ1i9IifLts9oUC9MJRTQiO1nC2Mlo7s+0bM0sC69SFi8XEOEh
 X01j7yO5S/fF62MX07hfArR38Bf/ww77ZkPd3Vtyu9e1oE5LpIrzP4P8G
 OV91Yg932iz+XT07tKOj5WhN3GgCbj101/g+aYWIbkQZLgUg+pX00SVLO
 VYKN3sVKrHKDunvODh/alumnhr/Jeg9hVJJISlhwTLabqPEq9YNMx/jdg w==;
X-CSE-ConnectionGUID: hxEvU0MrThSYwMzPly+oqg==
X-CSE-MsgGUID: nghPxzgaTBSuSDK4EPTHDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="63775565"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="63775565"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 07:37:05 -0700
X-CSE-ConnectionGUID: MameL9jjRuaE+t2TF5+UDg==
X-CSE-MsgGUID: COatUkPVRQCSpko1kmKn0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="130259710"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 07:37:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 07:37:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 07:37:04 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 07:37:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NeV6ZZcxulIXP9oRA+QLqO3g/OichbKrI9fHhT8kGPqMoQNpL6XUu1ldhbHAcDiQBk2hGnoXIXhqueRGWcZjsk2xvghAXM2rALjUEcDPKCSvDglIZ2GBVIVnSvorgxpnA9watUVoOuy9z8S2mZUSSnvnmi5PPpnyhdwO4V0jwPK2KX2V3blxm+SMs2rABKLAMPou+6D1ZiWFjamYuqoyk7U51MAwnvbA0P6zV20x3MOmNg1bChu2WhBn2UnnLSseXuc/eCbZjM78d1PfU//e0ILBjF3Lm0KG1GXQKkalqKbvaoIKITUtHN+ezS5mKYYq1dgw6Lzz26RwDsotwtwzxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ewIFP9wJhO0QxSYBBrKCU3TPT9S93ZKpyQCkOdhJTd0=;
 b=Jn6Z445w9REAWF369x9sRU6n0vpAx76HJhloKJknj3SWLjr4pDaka6rQ+vu5NkKKVGIExqMiaWaxpRU5cvcx+TRfVgDUx6/CxYfcd7W0Ayp2TUXv6sNUgbH8J6MrayVpe92+7zIF9LlcgVglpuGLSs9AkVM0cTZ6fwtWW5RDuC4oPTJJC1sYwz00uU0pZMQO5jW6WxhovGZoc8FUaALqUSMcOlZgLjXrRTQi/Au5dwY2eMAODnEQCGUxgNQ+X5we0IfKZ413MVvrR2vX+a2oB0zwy46xQUXV2btmP/7vFu/uNkdxDxW2oHwygNs2x4Q0MRlmxYUb9LEGt1pJDEgxAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA3PR11MB7628.namprd11.prod.outlook.com (2603:10b6:806:312::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Wed, 16 Apr
 2025 14:36:48 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8655.022; Wed, 16 Apr 2025
 14:36:48 +0000
Message-ID: <3594d285-aaff-49d9-a550-4254bf0add0e@intel.com>
Date: Wed, 16 Apr 2025 20:06:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe_pmu: Add a null check for xe gt
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <umesh.nerlige.ramappa@intel.com>
References: <20250416060531.2454332-1-riana.tauro@intel.com>
 <3b0d279d-2543-4b3f-9e6b-c572a934fdda@linux.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <3b0d279d-2543-4b3f-9e6b-c572a934fdda@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::15) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA3PR11MB7628:EE_
X-MS-Office365-Filtering-Correlation-Id: 62f5902e-a694-4e3a-0d84-08dd7cf41e41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RjNwUUZXSGFmVitjMTZBUWU2ZjU5OEJHWG5NS1ZuUUdveVYwd0J2c1Z0d1kw?=
 =?utf-8?B?QTFEMTFJc2g0eTZBcU5kM3A5S2NwajRiUHJldHZ5ZWJmemFBZkQrR3ZMUmVs?=
 =?utf-8?B?OTZOTjRTSHRqK0pQRUtTWFpjdUE0dkF6VXplUGxZOFhQYVFQTGNheXFwcXBC?=
 =?utf-8?B?TVE2djZlY0Q5aGVVTmdZUmpCTWoxMU5XV2lTL0JHbHpLM0tVQmtaNDFjMDVn?=
 =?utf-8?B?cUJ0Y0ZrcTVLMzJJM3ZHR2M0RDhZcjNHKzFidDZWaHNwcWdDcVhDSFFSQW5U?=
 =?utf-8?B?QlQ0TExISFJOM3lDSTh5cXpTM3lJT1luZ0NFNVpDdzBMaXhiMmlZNVNIei9T?=
 =?utf-8?B?a0QzaDE3a0tPQlhMYURkN3ZXc2p1OGw5bUtDRWxCK216TXpUcFVtc2t0TnhY?=
 =?utf-8?B?UFFMMlJobjNhd1cvdk9GMTc4dTR4blhGb1JaSjFrclB1T05ybFhFL2dQRDF4?=
 =?utf-8?B?cXRQMEw2U0psNkNqeS9BOXE0ZllXZC9HK0RwaVBkZW1WSnN6eHpQTlFRZlZ6?=
 =?utf-8?B?QVdkOC9BV1JSTFBkN3YySEYxMTFqOUMvWTlGbjNPcndoNVdCeXVqSHNoaFVL?=
 =?utf-8?B?TXE3WFZZL2FmekMrd3BseFNEMUJjQjBrRW4wMDZ2Yld1T2tZWStLSHpaREJV?=
 =?utf-8?B?V0JBQTEvaitjSHpGUVFhMmhSVmtYUE1vVVVHWkxlZXBTaURoYW5BdytBYzZG?=
 =?utf-8?B?OUo2MUNlUXIyb3JBN1o2emlMaXBnYVVvbXp6Vm1Od3djY0FjOXBDWFBIN1N6?=
 =?utf-8?B?WGkreXJXaXN1MWp4eExKMVBRY2dDSXhMLzk3cHlBdC9uZGJNcUt1aW9NVGdU?=
 =?utf-8?B?MWdPWXBGNUVlemN6a0w4ZVp6MzFyVlNDYWtxSTcrNldOQVF4M0Y1MVp4UXEy?=
 =?utf-8?B?YTNXRFVteXdiYm8vZkZ2QUdNR2MzYVc5WGFPdVZXaDlIdXh2UEVNOWtwclNa?=
 =?utf-8?B?TFBEakpWSEhPbnFwR2pmNXA2MWtJdExNRVVyWXNxOGpsTWFhdFNhSEFYSTZY?=
 =?utf-8?B?UW1MbG5DdW1sckpDcHlFRW9Ca1plM0NJTTgvdXRTdkRNeE1ERFJtMlpObDRs?=
 =?utf-8?B?U1ZCVGNDS2RUTnB5cUVqR3kvbHpMeDhDZ252RVU1RXh6dUdHclBTc0MyQm01?=
 =?utf-8?B?SnNXbzlibWNrcHdrT0hGSjBGTTR6Z09yQXZVRnoyajQxZlBDQmsxWU95bk5F?=
 =?utf-8?B?MGhldmdzLzNFK3puYVIyQmRmdk15MHhDUldEM1FId3ZRVU5sekNoYVN3VEJm?=
 =?utf-8?B?cWxhTU9zY1dLVkdYWlFmWHNaMm95V3Fidzl0a284WlhHTnRuTmhhR0pBcHZs?=
 =?utf-8?B?Y0oyMnBUaUNVc1dCU3AxVnM0WnNCNmJ5bUordENMN0lUQ0dJVFF3VW80NGNB?=
 =?utf-8?B?Q0VPVnVYVTFHMzl1WDhGQXJHbVUwQWVZNy9ZNjRieGNOcGt1UU1XMTFTVUhG?=
 =?utf-8?B?QWlYMGg1R01NdDdBTmNvRjlpa0pISE9jR0MzYTZOSFFFdW9EYmx5Qy9KN2Rw?=
 =?utf-8?B?VWJIY1hZajdtNnZoUEd3ZGFoTVNobE9Rb0YyMFdLaENZTGExN0Jwa1kwaEpB?=
 =?utf-8?B?c0FTWitYYjZra3VFNWV2NWxBM2JacTZnUEJYY2V2ZkMxZFRIaUVYVzgvNGw5?=
 =?utf-8?B?SGdkTWV1WVMyNlA1WFg2T3hPOHJRanRpMXFHNzlnekYzVmNXQzB5MDMxYmpP?=
 =?utf-8?B?OU9oNzVZaTlpcStWUk5EYWxCdklCWlNoNUozenFQc1k0ai85Z2ZOVVVKTTE1?=
 =?utf-8?B?bXQ4NVg0eUFGZ2N0M2VhMGNLYkFoZkJOdlNwaE5DN1YvaHhLWjlDUzJNMk1C?=
 =?utf-8?B?cUd2OHg1eHM2N2JkMXNkMnZqR0J2VWYxdytOb0hzYmRuQmZnWUMreGM5d1po?=
 =?utf-8?B?S0tNS1EyQ1hCZm4reWIvbWNpVEUycG1DNmdHNWlYM3QrYThEaS9abXF1WWdx?=
 =?utf-8?Q?Av0xKdYa2Q4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXVmckFhT1l2U25sRW5PdmZ6QTdPS0ZJQ0pDeUFrRkx0TTUvZGE0UXlHaFlT?=
 =?utf-8?B?S1dsalU1MmlHSDJaM3hNN0c0NERrd2FHSlR3WVlqT3YySmF6Y21uZVBleXor?=
 =?utf-8?B?Yk9TRmpKbDhwMVpRLzNiS1RBcmxRVnF2aFZvM0VmaERNZ0t2c2JveHFNWDNW?=
 =?utf-8?B?cXUrUG9yNEpmbDdhS2FSRnZDL1Jnanl2b0JTSFJqK1BCckNqcVBVd21oOHgr?=
 =?utf-8?B?MVZ0NnFzQ0w5R2lNaE9zcXJwYlEvaEJpOVFtejNEaEJFTm5WQ1kzQ05JRXNk?=
 =?utf-8?B?bnNwMlFwTmtsNCt6b1pzdUdwOTYrSVRpODJGeUJQc1lVOVB0dzlkOEhZK1c1?=
 =?utf-8?B?QTFIdk9jcVBWWnZQSnNpQ1FScHArdlZLZ1RSTkRXVnhxV0ZNOG5UajI1dDhX?=
 =?utf-8?B?dnh5bzdJTEwwdjNZUk14VE9kT3pRcVdFY2VVaVhVV0JoVG9ZWTBaelZ4d05h?=
 =?utf-8?B?ci9JOXBla1g4WW4yWTBUSTJaTWlJalljcFc3c25HV2lLekc4MkREWVdEU0No?=
 =?utf-8?B?aHFMVi9VUjluY0pLL1NlNVBNcnluYmlaTHljeXNoUHlSUWNVVFZDT0g1eTNC?=
 =?utf-8?B?cWpmRGN5Vmk3Z09Yc1lZd1FkdDE5M0hwbS8zQVQ1LzZ4bWRpZGl5VWE1UVhp?=
 =?utf-8?B?djhveE13dnhaSEtpRURWZzQrSUZmUnB4L3E4SnY5OStQRG1zSzhCTW9ZeEZy?=
 =?utf-8?B?eTlMSkxYd0xYcEVaOGxwRWZMZXB3NXNZb1JnSGw1TndUOHFYYVZtTHdxdW9K?=
 =?utf-8?B?eHpQdHl0SnJ3b1Q2L1hkRmlaYXllMEJoNjIzVldzLzdMWk5vdm1IQVlCemFo?=
 =?utf-8?B?NVFjZk9iV2NLRzFXZVBjT2Vlb3pTL1JraThzKzZibGdmT0lGZjZPMmRIU2pL?=
 =?utf-8?B?djQxNmR3Tjh5Qlc1NzdxVy9OdHU0cytpMnpucnFCK3l0Z0NONXdmdStIUXJD?=
 =?utf-8?B?ait6Rzl0Q0pmS2trV3RWN3VKbGRWOC80ZlFrcWN3K1NlWFFQODFtYnAwdUM0?=
 =?utf-8?B?U0JHQ1ZUcjdPVFllTUVoSTluUXdPWDdOY0ZnK3VWU0Q1bEoybC9aWGdKNUdU?=
 =?utf-8?B?V3dnb05jeFdSY3kvWHVsT3dDVHl0dGtpVk9ZeVVoR2o4czZpMnJaN0NtMEZh?=
 =?utf-8?B?cUJzTTRYbmxxeG91NXZJK0EybkNBbFBveUlCdEY2aUhQZk9SU2tzejh4SjZ1?=
 =?utf-8?B?ZGw3VUswRmY5VUYxT3VVc2hZUVJNZ0FySVNoQ1RHMjd5N21HSzRoQ2NpblVH?=
 =?utf-8?B?dUdlMmpNZldBL0R4RWc2ODRib3drNlI5RjBLbzZLTnRkSDRtNnI1QTV4NlpW?=
 =?utf-8?B?dHlHc2l0Z2c2aURWZWM2NzlWMXg2R2E0clZac1drMmVjTWVMSWNabXZzZFc2?=
 =?utf-8?B?cUUzRUlZZlFYVXJEd3ZPdkI3RnNPWFAzd1lsaEthSU9zN3k2eDdySGd1UEdh?=
 =?utf-8?B?S1hxMzhYSXVhMCszNldteXpVcUh5eUdjeDd4Qmw4dlBrTlJWaExOY05TdG1v?=
 =?utf-8?B?U3oycmlVN1FJVHhrM3lzejlQcUZEaSs3dlpCbWp0cWNudGlwdzVJZGpOYW9T?=
 =?utf-8?B?TEZxQk1Temg2TW94akhWQ0lrUjkwNHg2a1dCUWw5VzhaNzlWSXhocWxBTk1O?=
 =?utf-8?B?NExmdUFVK0JhS2dlUmIwS0I5dERHdm1Qa29yRFJveGhmdG1JV29xSVNNTTVu?=
 =?utf-8?B?ejZ1MzQzNkR0c1pIWmI4ZmY5S21UdnNlQlppd2JFT3VDUGtyUjdNSXIvQXl2?=
 =?utf-8?B?eThaZ3MrbnlhWWpTT2FoOW9qRDJJNzZ3c01YREd2Y0RSUDRtTi9TWE5GNlQv?=
 =?utf-8?B?ZzMvNGhpaVpoOGxaSDRVNDVJYUpzajBrMitxOWQ1YkZSUk9FdU53b2JyOTcz?=
 =?utf-8?B?ZkRja1RsbGxmRENwNWVWeFlpQUkzREhwVXNqeUd5anA4RUF3WkZHbWt1YWNB?=
 =?utf-8?B?WHBDNEoxNlFJdDNQUm5TM1NUSUI1VFFPVXZoWDhzK0JrMytISXRWQXAyZVRQ?=
 =?utf-8?B?TDlDdUs5akxqeFlib0hNRUVCTzZuWkN0bGpPdlUrTXhaWUZOdHZoYjhLUUxk?=
 =?utf-8?B?WDNkMW95eDYzU1o1dHd4U1JneU1TeGlJbXVSRkNSK0JWTlZhbkdUTnhOWnhl?=
 =?utf-8?Q?t7La7YM2HWBi/tCSzoTO/4gQg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62f5902e-a694-4e3a-0d84-08dd7cf41e41
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 14:36:48.2417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lFtSpiqT6+AZbvHuecQg/SNHzgNml/KGNdXsm6Yj0Ygfp1T/QjPS12LdDnXrdT25JZzH+I7lL99D7JAOX2UwcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7628
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

Hi Aravind

On 4/16/2025 2:56 PM, Aravind Iddamsetty wrote:
> 
> On 16-04-2025 11:35, Riana Tauro wrote:
>> The PMU initialization function exits if gt is invalid,
>> eliminating the need for additional checks. However, absence
>> of these checks causes static analysis tool warnings
>>
>> Add a null check for gt to avoid static analysis tool warnings
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pmu.c | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> index 69df0e3520a5..5550ed30018f 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu.c
>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>> @@ -141,6 +141,8 @@ static bool event_gt_forcewake(struct perf_event *event)
>>   		return true;
>>   
>>   	gt = xe_device_get_gt(xe, config_to_gt_id(config));
>> +	if (!gt)
>> +		return false;
> 
> this looks fine, but I doubt if we will reach to this stage if wrong GT
> is passed, it shall fail at this
> check event_supported(pmu, gt, id)
yeah it will never reach this stage. perf_event_open will return inval
incase gt in configid is wrong.

This is just to silence the static analysis warnings

> 
> same should be the case for below as well, non supported even't would
> fail the event init so it should not
> reach to xe_pmu_event_destroy.
> 
> but having said that i doubt if xe_device_get_gt would ever return NULL,
> as that would mean primary_gt or media_gt
> failed intialization, if it happens the driver would fail in load,
> wouldn't come to this stage.

Need to check why this function is returning NULL, that's the reason
the tool is complaining about null check missing

Thanks
Riana

> 
> Thanks,
> Aravind.
>>   
>>   	fw_ref = kzalloc(sizeof(*fw_ref), GFP_KERNEL);
>>   	if (!fw_ref)
>> @@ -211,11 +213,10 @@ static bool event_param_valid(struct perf_event *event)
>>   static void xe_pmu_event_destroy(struct perf_event *event)
>>   {
>>   	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>> -	struct xe_gt *gt;
>>   	unsigned int *fw_ref = event->pmu_private;
>> +	struct xe_gt *gt = xe_device_get_gt(xe, config_to_gt_id(event->attr.config));
>>   
>> -	if (fw_ref) {
>> -		gt = xe_device_get_gt(xe, config_to_gt_id(event->attr.config));
>> +	if (fw_ref && gt) {
>>   		xe_force_wake_put(gt_to_fw(gt), *fw_ref);
>>   		kfree(fw_ref);
>>   		event->pmu_private = NULL;
Ne
