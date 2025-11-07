Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4C8CCF9F8
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 21:10:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0085710EB7E;
	Fri,  7 Nov 2025 21:10:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mYTfHbzr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6909D10EB7E
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 21:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762549816; x=1794085816;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=T2z6jV0g8GfuaM3oqSv85u3tCtT2L//RnMI6AKREyyw=;
 b=mYTfHbzr7wqd8G3IrFMwfUuMZBJV+B9ZZNxODK5Jmgkv/0MCWG9e3esT
 goZv8Qp+kN4lTy/0QViBGgD/EUbCGBz3z3IeMxrYhYI6KunXKr2rH6kZT
 WRf+hbEnOFfyAzNxFm3S/eXxZVnrawIm1siN0wrMwPmm/CIHEQFRwJ48M
 i9FAORTFhPhz9ccGNoqdCOJoVbR8brBt9Cjo416TAR4o5lJOpcm0x9VQT
 0kENUAS+ZmIYDsEpoDT9+Um6gSO9xk+GvW6wxbM32Y7Uwsl1+4MjPKSsZ
 iubPbq5+TUlCflOzRpvOlut9n5436qL5esjqJRSSLbrgZMD+q7farqPoW g==;
X-CSE-ConnectionGUID: 4nJzybJLR2yxxuCmLJHI8A==
X-CSE-MsgGUID: x2Las0XvSFaSadaHhmy5Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64586082"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="64586082"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 13:10:15 -0800
X-CSE-ConnectionGUID: rhjomxDVQBuUuCtE7O7s7g==
X-CSE-MsgGUID: xixWqxPTRlewqsRQcaSjiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="187860027"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 13:10:15 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 13:10:14 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 7 Nov 2025 13:10:14 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.21) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 13:10:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M9WVQXgvt/r3EMD6e31se8Yj+BcvPtvuAAz65clLR8PkQ70Osi9j9R5IG7DEOu0qAdtliYh+8Z0BW/bhF3yJTrujuhE5Vk5rsZQXVOW3/Wzbdw6AHzpNdfj8laSSm5yNAouFfK7aFyAjvN99a9LYFEBTIlW1YgW/0dJKA0JUID+16Pp09F+VCrnvj4KgrvNoO5vnZsQau+lfaBbvh8Z07rXTOjnvDk+5eTTj2uP3CLvCzvQBKrXw37G14ZUbwzLM1x6b73D8b8e0ekk0JdiexzS3N5wWWXTy4Y4DJMYkCH7jp7zMu1eyfZp6ObUwVq7npcoi3kAlDVq39xQmQSlJvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CyS04XZi7PVYBsRc4KuHoDjma80oAqp+ZS9uavvBjWA=;
 b=gu+2erBU8w2WC6JxRrF+MuLRrN5vXpwHUcoxzGWMK3HkobahyDFkV+Ei8OqOAiwgf1Sa6LzKUTAk5enVBtBSRP9JhXEo7oD0vcm23hRfLg0M2XWTBgSH8+y3UZ1IWB+EAn1G254Ukzn45eSYwNRcM2vjrDhWnzvEYwfMqUUiUO6sXrzeeYxnkR7PTfTWT0tLuIWI6wg+YIIWIEpSLMIZkw1GVES9B+gLtMdidJrsOFTHd4VY4UDHAIe3NZUX3T9pAuC0RErdnIIkJfeEcga1nErtkr++tY7SBDhHYOxJg/iLJDC046BrWNXpPOHpHC0CKlO5c7xIFkRa6/HZDV1kIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DM4PR11MB7205.namprd11.prod.outlook.com (2603:10b6:8:113::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Fri, 7 Nov
 2025 21:10:11 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9298.012; Fri, 7 Nov 2025
 21:10:11 +0000
Date: Fri, 7 Nov 2025 22:10:08 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v1] drm/xe/pf: Add runtime registers for GFX ver >= 35
Message-ID: <20251107211008.zfbmyhw4mdfmrzmn@intel.com>
References: <20251106171502.3566894-1-piotr.piorkowski@intel.com>
 <379c6bc8-8064-4496-b2b1-d9481cb827bb@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <379c6bc8-8064-4496-b2b1-d9481cb827bb@intel.com>
X-ClientProxiedBy: VI1PR06CA0190.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::47) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DM4PR11MB7205:EE_
X-MS-Office365-Filtering-Correlation-Id: 90390be3-98fc-477d-7c74-08de1e420993
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dDdLeWY1cGllVnlKbHdrODQrT1ZjL2ZXZ3A3UVdQT1RNdDIrMDBpNEZYMmlX?=
 =?utf-8?B?N256S1E0UndMeTFUOFZyT1pGaWQyRFA0QTY4R1VMYjdqVUxUV0w4UzAxbnFX?=
 =?utf-8?B?a2FLeVZiSDJBZDVyNGlkMTVzbEhSWnphUVRWL213U0xEMVFMbENMSHFBU3Bs?=
 =?utf-8?B?QkxXZDVVSzJCWlluTDlubUtlMFByZWhNUktTeW1oSnV3a2Z4dFRJeDVOU3dC?=
 =?utf-8?B?YmFqK3hkZUFIRGNEYlZ4V2VTWVA4QmppVlNWZWkweGE0eDhrS0J1RmNBZGp4?=
 =?utf-8?B?WHlQRm9ZRkpRcm9ud0x1NTMwSUdXRkFFbVhXMHNSaTBXRkt6aDZPSXJmM0dO?=
 =?utf-8?B?UUt1cEd0S0hnNElvUnJTVkFiN2xzRUgwSEJWS1RxNnY2RGxWRlF0ejZ4UjJW?=
 =?utf-8?B?Mm50QjZFUk5sL0lUYUJYVjloenJJZnFwVFI0UE1yRVg0Ym5WZ1Q2NkR1V1NZ?=
 =?utf-8?B?K1BDM1E1ZHlUZUdLNEhaWjZ5R3RlSHVJNVVYSmJNNHVjVEVVcEUrTkkwQk9D?=
 =?utf-8?B?ME0vOStZUTVEc2lFYWV3M1AwSEtQdGJnOS9kOTNiR1NLL1ZKWnJReDJmaDVm?=
 =?utf-8?B?cmVnVlA5dklMVHdHNU9aRFRDQ2g1aTY1VGNKTEcwQkxLOW1YcFpMNWMrOEE2?=
 =?utf-8?B?c0ZLbjJMSWlBQmJGYko0ZldkdUtZSmlYQjBGbE9oM29Jc0NsZzMvQlE5NDc1?=
 =?utf-8?B?cWdxTUJmbXIzd3l6RTcvL3BGRi93RldaNWtDOWxKZlFabFJUQVdIWTJUV2Yw?=
 =?utf-8?B?YnpTOW5uakZhbXdRbnV4TGErU2YxVmduTVdWUFdEaFJVeDdjWmQvWlJJMnow?=
 =?utf-8?B?VlNsZXdtV3JCWVNSMFhnNHdMWDRjZFBuSGt6aHhLM3IyWDk1bGNZdy9pUXVW?=
 =?utf-8?B?Nk8zOUc3OWNwQi9yZ0RuRFpsUkZHMUM4NUZLbFNScU05MVlWSitnZWhkOUJq?=
 =?utf-8?B?anJBMkphVEFYUW9ZZVhxSXdraXhwcEh6Y3RJcHV3WE5vSDBOT3R5VVp1aXF6?=
 =?utf-8?B?Z2xRRU00LzBEd3dHQlhvS0VoTU5NUUViRCtjdSt6dVRQejNmWnJndXRTYU5J?=
 =?utf-8?B?c1JKcDRsbE4vMUlaREJWS0hjSHhaNWhBZ0hRb29KNXoyUmN3eUVaT3FUOEFD?=
 =?utf-8?B?R0pTTE42RGllc1VKVXJ2TmxoY285bXo3SlRaK1pwVzM2Q095QmFFK2daVFVl?=
 =?utf-8?B?ekRzS0xNZ3pKaE5waGc0RU9ldkFTYUpOdFJYQ1F3em5KY3lZSXJwaEpML2tL?=
 =?utf-8?B?V3plTFlKVDRuRlRzSjlFRVRzVWs1RTNwNW5vUG9VNisyc3V1OEo3a2tJeVZD?=
 =?utf-8?B?ZDBia1VTK25UN2xzR3BjbXRGdGROUkd1dEE4YmhMZHhaWTUza1drMVNQQnFT?=
 =?utf-8?B?dnUza0ZZMkxIb2xuU0RMZk1EWTFzTzFHbStxU1pYQkd6UnZGQlc4dHdjaEd4?=
 =?utf-8?B?c0NUYTRsNXRjTForeHdoajdrUTdyLzZJbG13MXlHb3Z6cGVXNXJvQ1VGL1Fk?=
 =?utf-8?B?Q0o0NzBYRWJOQkZnUk1mcTBuZ0hLZGFVMkFya1YvbVp3TEdQVGRaWVRhempB?=
 =?utf-8?B?YWZ2UFVUUlQwOFdvM2ZHS1dmTEhsS2FWV1ZyTkJLK2x3SWpiZGZGQ3ZHTmY1?=
 =?utf-8?B?TFJIZGtscld6c3FnQzJYQndvUDlLVURpZVRwZGU4Sm5PWnZMcG55L2x0L0Nq?=
 =?utf-8?B?anJoUDM1OHF0WmxtWkVXR2oxMW5zaEZpbFBCbUpoYUphTFBqM1ZhZk1vWGk0?=
 =?utf-8?B?bzR3TWhraHZuLzd1STFoY0NSWThpYzIzWTUzWGpJWDhEQXZSNU96VkozRGJJ?=
 =?utf-8?B?b1VTb0JTUGk4RDFtVjJQT0prWkpoRTRvNWgwM1FVUU9BOG1oM3NGTzlXVytx?=
 =?utf-8?B?c2NvaERiTXdOTHgxTmlYOWwyVkxhRGNlbXU0bWpCLzkzUldnNVBiRW1hZGZy?=
 =?utf-8?Q?EexAjCtTN7wpxAOYGU18CMjQU231QY6k?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yi9xeit3Q2hrcGpheXVTWWhZZ3hqdFZzQVZuam0vWVRVMzdqbTVBNm9FNXVp?=
 =?utf-8?B?YXY0NThoaGlORmFUSkYzMVRyQk5WcG9iKzUvN0pTTmNmVy94aGdNWXlSaFBa?=
 =?utf-8?B?NHhQbVJ2djJVZ056dUQ4c2J0K1pubWZSQ0pJMDE3eFJnZUFPWjhwVndWbW83?=
 =?utf-8?B?SUxGUjVXRGJPQnJHNFh0RkNGcFQ0NWVXTEF1VWNqb2Q3ekRLZjhwb29KRnZP?=
 =?utf-8?B?dnF6Y2dRSHdVRTVnODVnRDNkbDg4dmJTR253MW1PcVFUdHZRSEJiNjkySitH?=
 =?utf-8?B?eGJ2a1MrZjFYYWV5UHE1Mks2VysySVNaUXVWSERSMWJOOWdRKzFEU2lQM3pM?=
 =?utf-8?B?UW1OSHRrbXdVSjU4MjZDbjd1cC9ISkVQeWc2d2hzMTYydEJXVTdjdkJsVHZz?=
 =?utf-8?B?Q2VCYjBlWHkweStVVnIxSXpLWjhXM3ZIRG1vL0RicTJmdCs1S1NLbUtodW8x?=
 =?utf-8?B?VkU2WWJiTG9peWErZ01ibVA1ZmdPbGk5UGR2SE41d29IbXoxS0FYZGhiK1I1?=
 =?utf-8?B?cEs3ZHN0R1c3ZG50dUxtclpxYUIwNUlRTHdoZmhBdmppVnJhNFpxOTBmWjh2?=
 =?utf-8?B?UXhDa3gxdk5CdTBOUE9EVnJiSi9McnBneS96REpqY1Vzck9YWm9wOXFTV3JK?=
 =?utf-8?B?MVFmd3UyaUtkejQvZHNXMnVCOVpnR3RnNWhJYU1tSHZ4aUk4VktwUFhzSktq?=
 =?utf-8?B?MVR6UEt1M1ZBL29WUDF0ZG9yNjU4RkZSMERYRGV1bWx4TXpseUdQeVlsaGI0?=
 =?utf-8?B?aHZFMHY3VFdsWGs0N0JSSURWZ3hHZHZUQW5nMkErUlBOSUlsYkp4cnlYV3o4?=
 =?utf-8?B?cnNNUHk4azNUN08ydEhjSEJueVJyTE9zaVBpTnY1RkhvT0xBaEpoQ2lGRHN0?=
 =?utf-8?B?dDgrQmY4U3dGb3k1QjViV0pGQmVPNE5GUFhVcVFhTXFWRzVFbzNpRzlsMjNM?=
 =?utf-8?B?NGNZOWdURm9BdnF3OS9ZclQ0RmlBRWF6Q2RrdmtvZlRYenI2MkFpaVFCTTNi?=
 =?utf-8?B?dlRTRSs1NldYL29zemgwTTd3TCtMUHNpUnF0emRnSFFoTzRHMitRd1h0V3hu?=
 =?utf-8?B?TFhiemFVdCt6bW1HRWpUbVBidmpqUFRGdDlCbGp6c3JzRTlialR3dnlCa29F?=
 =?utf-8?B?N29qZCs4ZWluUU5OUmNpYTVjcTJIOGxXNUFncjJUQTY4elpmQXJpVklySVhy?=
 =?utf-8?B?elVpRU1lbW5kR2pWTlN6K3ZJSGtkZklSRW1HM05oUGhaL1NYcVdiMGVYazlr?=
 =?utf-8?B?QXBrV1RPZWhjek9UNTBOTm94aHozZi9Pd0N4VFQyUWxOOUxYT0JNaXN0OEgr?=
 =?utf-8?B?MXVjdzJ6UDhsMTJzNVgzNnlUc091OXA4eGhvRTA2OGMyRkVjTlUwUlRhMUxY?=
 =?utf-8?B?TU5Tbkh2UXMwOTErN1ZUVm5FNTJaUGl0U3NUbEFuWDhRTjVZM1Iwc0RRWFNG?=
 =?utf-8?B?YTBjWnh2MGFqaE51aFNVOWpxdUdKWVZqM2FrY0hTY1MycHVSV29pQTErUUJ0?=
 =?utf-8?B?K01PN2FhUDE2c3VDWVFUbXZ6SVVQZnI3MmlwT0FIT3ladUxIVmhXblY0ZDhE?=
 =?utf-8?B?dVQ3eEVvSUNpTVd1cEJJY0tiaExIR2l6UFp4N1JyQ1E4WnViZDN5eEtJVUZq?=
 =?utf-8?B?aWh4cURTaVpuUE85MDlHL042SlJra3N5VUNrL0o3ekppdkJVcGZkV1dQczQ5?=
 =?utf-8?B?bXZsbGJ1bVQ1S1ZWeU1qY3dkYVJhbHMzWEx0MGZBYUlGVXlnVGNpdk8ySVUz?=
 =?utf-8?B?czROMkVhTGkxcjE0YzhpSFdCNmVsUFl1Mzd5ZXFEOGUzd2xSYmdmdG1OamlM?=
 =?utf-8?B?YlhyT090NzU1bkZqYmlQODVJZlRvT3NjWGdkM0pkZ2s0bE9uc2dROXB6WjBD?=
 =?utf-8?B?d1RMNmJrYUNFMXZlcUJFdkU4NENPSnNaQnlFSk9ubVg1YytyYVNobm55eHlQ?=
 =?utf-8?B?bmVqSDlYSWE2YjFLMHR2QlRrNzZhc1VVNVNZd1htdjBISlVxU0xrUE1IL2pv?=
 =?utf-8?B?QytkbEphRWl1eUYyRVp4SlFOQ1djSTVQSEVNc1Z3YW1hLzlmc3lMN3JQVFBF?=
 =?utf-8?B?K0JyYzNia1lKZlpUekMrbDF4SzcrdnFBVVVCUEJkRmtTWTM3Q0lTNS85UDhG?=
 =?utf-8?B?ZlJsWC93VkZvdE9Qa1pLekVhQ3RNYjlUR1pBc1p3NkZNaWJyUCtpSEJ5eXRK?=
 =?utf-8?B?ZFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90390be3-98fc-477d-7c74-08de1e420993
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 21:10:11.3835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h1WxF/ciGS0fnLmFWzGXkl4nU7QHgboo30+xnDCSJwH/5DjyJCuR09QMCVGEjbRvkK5sDrAalUawhfTTQIiDlFfwAjBukEVXcTnlOv8VNe8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7205
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pią [2025-lis-07 19:40:13 +0100]:
> 
> 
> On 11/6/2025 6:15 PM, Piórkowski, Piotr wrote:
> > From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > 
> > Add missing runtime registers for GFX ver >= 35.
> 
> I guess it's more about being a different set of registers than
> defined for the 30.x
> 
> maybe also worth to mention new SERVICE_COPY_ENABLE register
> and no need for HUC_KERNEL_LOAD_INFO (if that's true).
> 
> > 
> 
> and maybe we should add
> 
> Fixes: 5e0de2dfbc1b ("drm/xe/cri: Add CRI platform definition")
> 
> where we already claimed .has_sriov support ?
> 
> > Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c | 22 ++++++++++++++++++++-
> >  1 file changed, 21 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> > index 76dd9233ef9f..c3281ed76aa1 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> > @@ -99,11 +99,31 @@ static const struct xe_reg ver_3000_runtime_regs[] = {
> >  	HUC_KERNEL_LOAD_INFO,		/* _MMIO(0xc1dc) */
> >  };
> >  
> > +static const struct xe_reg ver_35_runtime_regs[] = {
> > +	RPM_CONFIG0,			/* _MMIO(0x0d00) */
> > +	XEHP_FUSE4,			/* _MMIO(0x9114) */
> > +	MIRROR_FUSE3,			/* _MMIO(0x9118) */
> > +	MIRROR_FUSE1,			/* _MMIO(0x911c) */
> 
> btw, do we still need this?
> it was added to support legacy platforms we used as SDV
> 
> probably we also need to check the 3000 table for this
> 

You're right. I confirmed that it's not necessary for gfx >= 35,
but from what I've seen in the code, it seems to me that it's not
used on all other platforms.
We can clean it up, but that's for another patch.

> > +	MIRROR_L3BANK_ENABLE,		/* _MMIO(0x9130) */
> > +	XELP_EU_ENABLE,			/* _MMIO(0x9134) */
> > +	XELP_GT_GEOMETRY_DSS_ENABLE,	/* _MMIO(0x913c) */
> > +	GT_VEBOX_VDBOX_DISABLE,		/* _MMIO(0x9140) */
> > +	XEHP_GT_COMPUTE_DSS_ENABLE,	/* _MMIO(0x9144) */
> > +	XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,/* _MMIO(0x9148) */
> > +	XE2_GT_COMPUTE_DSS_2,		/* _MMIO(0x914c) */
> > +	XE2_GT_GEOMETRY_DSS_1,		/* _MMIO(0x9150) */
> > +	XE2_GT_GEOMETRY_DSS_2,		/* _MMIO(0x9154) */
> > +	SERVICE_COPY_ENABLE,		/* _MMIO(0x9170) */
> > +};
> > +
> >  static const struct xe_reg *pick_runtime_regs(struct xe_device *xe, unsigned int *count)
> >  {
> >  	const struct xe_reg *regs;
> >  
> > -	if (GRAPHICS_VERx100(xe) >= 3000) {
> > +	if (GRAPHICS_VER(xe) >= 35) {
> > +		*count = ARRAY_SIZE(ver_35_runtime_regs);
> > +		regs = ver_35_runtime_regs;
> > +	} else if (GRAPHICS_VERx100(xe) >= 3000) {
> >  		*count = ARRAY_SIZE(ver_3000_runtime_regs);
> >  		regs = ver_3000_runtime_regs;
> >  	} else if (GRAPHICS_VERx100(xe) >= 2000) {
> 
> otherwise LGTM, so with updated commit message and clarified
> the need for the FUSE1,
> 
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


Thanks for review!
Piotr
> 

-- 
