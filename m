Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A6CD5B863
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 18:25:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2229410E4BD;
	Mon, 15 Dec 2025 18:25:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G0S3sT3S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8238510E4BD
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Dec 2025 18:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765823152; x=1797359152;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6oyUmKoqvenhKAX2C589LxIaHNiU+AHFTm6DnDm8lMI=;
 b=G0S3sT3S6GoKxOJA2hV1yuXmZ5Op4Vr52uZbkqLL4F1dZLGZMPBTmNXL
 EXFdfQlS47DeyjPFbQHVj1E2lCEUmbATtAocirNd/jpGef/7eOwKZf5VX
 CjePHvSGh5JuRI8KSE4nA3FGw73lr9hsKqEro8ezSoV/dVShxkCUIrkzm
 LLrR7xQo+W+qVhGJKSzqi1lTC7BIVnLqexpS+NrXUTTz5/hq+/jg5aG3W
 Ou+ssWPFMgTHZ/YQhvunvpGYq5w1C2fKtuVy3u/1d+ssv517a8/drsijv
 8R7U/zbl1B9WwDHMfZ+93sfqO+NF1F0bYIrEZkFF50s303ZlaU3AnSCud g==;
X-CSE-ConnectionGUID: wx65nX0AT6assgYfaVVYrg==
X-CSE-MsgGUID: Mo+IXALDTQSuDHV5hTChMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67696256"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="67696256"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 10:25:52 -0800
X-CSE-ConnectionGUID: i/xWSx5nTCeJ3Z+gqpw1Yw==
X-CSE-MsgGUID: gi/HN+kFScmjWaV2gBrxWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="202290136"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 10:25:51 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 10:25:50 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 10:25:50 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.57)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 10:25:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eKiWgw59suZXKUIr8o+ExDWMdPyUuVXJ3PP0+FxSUYS9+sn1wmoW19FFoN/ppisOTOGWKGQKkuBK1iXbNmQwlX31IDQsVADMXgrGAkn2p5jJoHT0cMwXnrLiRyE6jvfde2E8M7UY7hTJfwmc5h3dy8RaEt7s7aPnGjkWFfwDgMoS5DExopTZolTyLW+df/0XQBUPSzcp7H/fxe1x50b5ikEGIXwKdP81lE76qd6oVBcnWd5QyhfaaCp4YPotxttGHBP3/mb3MTkefdt7t8tpM/0JPXM+2O2j1pNGUradg3JWLvkaHQvrMnQW+MbGBObgtWnQMDoKct33emzPeq2osw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KO1ttLpU+pkfsO05X0o2dUcnrCQO/ukWoeseje9DHno=;
 b=x1zkIZu1+/rnROLYt+Z58kX5eqQO4OXrw2Q/Pi6tw9PfK6hP0AKDL5Fldzj2bQTUHVPZ/L+TRht7u2hIfW34JowiSMRmB/iRwiAdJV2AHZVUIoo05bhrqz2SAq4txXXx+6t/m7KCfobRnPzWv7ii1imcfHZogXHy6OseJtjzGhCqSDxIzO19PFc2mnV9yPXI93JvKK5uxIsNxpfJCM4bkwIGCC1dy2Hd6wqJzREYPsLHUwU2bx5z19pedj03e07P+A6pfEKXkEd2prEdMVsZ/e2Y22IzeXgfIwX/yK1LAPOVBjsSLFSMhdGDmn3+4gcnIgVH2qROlfY8aAumeJq4tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by IA4PR11MB8943.namprd11.prod.outlook.com (2603:10b6:208:569::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 18:25:47 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9412.005; Mon, 15 Dec 2025
 18:25:47 +0000
Message-ID: <61440049-7a5a-4eec-8da2-a4222f9a238e@intel.com>
Date: Mon, 15 Dec 2025 10:25:46 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] drm/xe/guc: Introduce GUC_FIRMWARE_VER_AT_LEAST
 helper
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20251215143739.196336-1-michal.wajdeczko@intel.com>
 <20251215143739.196336-3-michal.wajdeczko@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20251215143739.196336-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0047.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::22) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|IA4PR11MB8943:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b9e2c0f-8343-4c93-9c23-08de3c075dc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WXFpMmFYOWN4Mm0yTDJHK2d5VWxBVTRXTHdWc0dVU3NXcDk0cEdNTi9lYnRS?=
 =?utf-8?B?T3BaVHBQcFJtQWFaeWFhc1JtLzR4dk41ekFlcFJ5aURDaEZYSEdWZjVKZWdG?=
 =?utf-8?B?Z2NCSXZiMGZ4SVFGb0lSS0h3OG82N3V3bUk0L2E0Y0hxc21rNy9BU2ZMeVlD?=
 =?utf-8?B?dEZoRHc3S3B2Vk13STRFVVB2U2NIaC9LTXp3aCtBVGF3SkhmemhNTlRydXZE?=
 =?utf-8?B?ejhrN0V3Wlh2TVlRUkJRaXpXU003dEJLTkpoUjVWT3J1bWl4SEhpVEs0b1ZM?=
 =?utf-8?B?MlFScFJYaXovMThHaDNWV3JDb1ArMnlFTEFqbFZOQS9CS09QRnJjYTNXWTA2?=
 =?utf-8?B?azM0eVlaYVpTSXpkeFFrbC9BS3FCZk9NSWZzTHZyUEkveXZFK2xadDA2L3Fo?=
 =?utf-8?B?V1BMOXFPeWVGMnNiRlBaQUJHL1pjL1B3NWU5SmtGRzBNOVNUUjZLcDJWVVh0?=
 =?utf-8?B?VERaQk13TzhPZXVwalRuV0kxN3hrRFhLU3dvQ2ZseXFYL0tXZDhZcHJ1a21p?=
 =?utf-8?B?a0ZmV0J5c3hnR2xMdmVNWThZa1NjVS9hb05neXJ5QU02azdPazRqQkNQTUQ2?=
 =?utf-8?B?b2FHdEJqcitOV1h4SEQ4THpiR1F5NlpXZEpOV3pwdUhULzV3QTNLa1dRVDRO?=
 =?utf-8?B?VWl1L2VUcUdWUHl4YzhEOFkvVXUySUtCOTcrTHR6c2wwTXlQT1J2UVVmN0NQ?=
 =?utf-8?B?bjFuaHV5RUd4R3pOWjhmSVhSYm42c3Z4TjR5ODB5VVNZc05PNlNYNDlHaGRK?=
 =?utf-8?B?WU9nU1paTlJLSHpDOTZ4ZE5NQnAwTnpkdExmbEpzZnVkZDk4VkJjYnpuKy96?=
 =?utf-8?B?UmdkNy9jaVNrdkJMZ1JlK245SC81WWdjTFJtOWk2elAxcVdrRDV5clZIM0px?=
 =?utf-8?B?SkZpNkVSWlBwRWo3V2ZaaFFJZWVxb1pJZ2k5RFNuejY0RUFHUmdqWlhFM0xv?=
 =?utf-8?B?TElNRklmR081Q083alJxSXRzSnlzRlVlZXFLZitJdXlDVnJiQzZURU1rL1Yw?=
 =?utf-8?B?N0EyZUl1eElvVU5CUEd2dy9XK2lIZHZnNkR2OGFyODk4aGJveXQ3djRhbmVD?=
 =?utf-8?B?dlNwRmxSbEFDUG1OL2IzWGVrSmdJMExqajRjd1VVeW93RXRucHZ5SU1qYjhL?=
 =?utf-8?B?WEJPbExFdlZuZEtGQmtBSVkyUnBXS3htKzUrblVQRUs2YWRuWnpMdW9aSlMx?=
 =?utf-8?B?dEJrWld5a0NZcEJkeXVoNmJldGNBWFp5eVpvaEYveHhsWlJFbXVDYUZpd2Ex?=
 =?utf-8?B?OWsrMXBWZ0lRN3diWnRCcUZFOURZc25zR3hHUC9NNGgyaGFISWRTcmh6QlVZ?=
 =?utf-8?B?L3FlNFNSMkFKcDJQNjRxSGRSNnVTREtrQ01mQlRzN21FNFlxYjNQdXN3SWNK?=
 =?utf-8?B?NGpLeUpRZkxsaGtJcTdWSTIzVFpJMVlyUnNGNnYzR1VRZ2Q4cGpCL0wvd1pL?=
 =?utf-8?B?d3RkeXdOWUxYK1p4YVNmVlJ2M294QnBEVFZLYlN3Nmo2NnYwTXVSUlUyeHRv?=
 =?utf-8?B?VjN6dUhpNzhhcHl1dGg1cjU4Zi9YTTh3SzBZN0lpN0N5VkJHYitldWUxb2dK?=
 =?utf-8?B?anROVUFhNTNaalA5VUlCYjcyTGFheE1JdjMrb21EUS8rVThFZWJNWWdTTE51?=
 =?utf-8?B?SmpXS1JiVGIwbUNTOGM2dnhFaHNsZE9HdzAzbDhvWS9wcUxhS2VBeUwxZktw?=
 =?utf-8?B?SkRmV1I1MUpESUt0Y0l4aWJxNFN4OGg4NmVkRlRvOVB5eGw2a3A1WlFPUnYz?=
 =?utf-8?B?aHVFZVBmcjcxTkRZTExvd3BmbTFDekRBRml6bDRSUWFxYXlxNCsxM2F1eVdE?=
 =?utf-8?B?b0ZzRzA2TUhFR0lqbUF2azcxYnV3RnBBOFdzODJ5VWtGYVZnR0FWZlJjeG4z?=
 =?utf-8?B?ZHBqT2REVHB0RnpyUEVZazgvU1pqYm93U1RJcC9RQm5ZWlE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0xXdEVBaUFqeGFTQStVR0IvMGlYT2FGY3FjdkhEbGY4SzlYbnkzVWw0WnE0?=
 =?utf-8?B?ZDNBOXFiSjJJbENiOTBZS1l0bC85OEhyS3A5czZLQmtrbUttY1ZlNVRCUFhi?=
 =?utf-8?B?S3BQTGZkdnpkcnpjRFJPZldwdzhmN0s1cENVN2VubzA1UDhzbHM1K1MycmRC?=
 =?utf-8?B?ZUpSTmNiMXFsRWRtR1hjbzg3SCt3QXgrWk0zVU12ZWt1Mk9MYmpJcDNFWnhT?=
 =?utf-8?B?YVBQTnFIVloxeFpKQnZlZkVzbXdzemp6T1drb0J6MTJMRkttRmI0MkhRNHNS?=
 =?utf-8?B?Mm5DcWpOR21vYWY2V3B4NGxZWU55YzlKVWNRM3hQcHFRT3ZJR2ZrWWFWQzNZ?=
 =?utf-8?B?K0x0NFlwSWsvNDVUVXBiV24rQzhJL21SZ1NCM0ZGVTNyMi9oTXRDUlA4YTg5?=
 =?utf-8?B?Ti9YVlVYOWQvT1pnV0FZZmVZbWN5YVN5NSsvamFkd3lZdXI4U3ZhNnNlTjM1?=
 =?utf-8?B?N0puS0o5aEpJWTdOY1hSbVplbjF1VWZja1RsbFd0ekl5OW9vVWVnanNzTUxC?=
 =?utf-8?B?bXhUYXhhN252amE5cXM5SDJrd1cwMjVEYmNrb3FTSXBpRk5TUkJrWkU0SGEv?=
 =?utf-8?B?dzlwZ3ZUdkVOWSt6S2x1OXpKdDNNalFTU0kwMWlMck1yYU9DV2NpSThNc3hj?=
 =?utf-8?B?a2hLdCtwNWhHVEpSSGVMT3Q2NTFNTEx6eEU2dkNSZXNvUWFIQWhMZXlaWlNq?=
 =?utf-8?B?TkxVM2FBem5hN3RjQy9aNGJRVWpSdGRpR0hhQ1dQWTQyajRHNGpIK1YreGVw?=
 =?utf-8?B?dTRvbE5yeGZEVXJtaDdGRExKWHJVaGZqTUZLNHZqdlZkcmIwQnBJUGNWdzE4?=
 =?utf-8?B?SWVtR0J6N2NZSmhwT1NFdzM4ZjY1bUZBTngxZUNiRWtBQXpXYTFiaU8zYzc0?=
 =?utf-8?B?MFN4MklaQTkwYzNQa1RYaU8ybjIwVFdiMGN5R3BjRlBINlFXMU1aSWdid1JW?=
 =?utf-8?B?WXRIcVRid21JMDVKbXVCeUl2cWl1VU1KS1pTb084dEpOb1BwTm9RZ2QyR3RZ?=
 =?utf-8?B?K0JvaFNXNE1FaHNyMHRHU0lFbFpnbDBhclhLQjI5U0w5UjFYYllUUXpteVNZ?=
 =?utf-8?B?QkFrT05OL3ZiQ0lkYWQ1bm1OWHVDcFl2UTNjMXp4N0NVOTFUWkNWcjh5c1o4?=
 =?utf-8?B?Zzg1U2pFNnc4Q3lUbkFXTFhKczcrL2RIcjRMWTNXUVFsamRKVU52SFAvRkt1?=
 =?utf-8?B?WExsenZuSXJrYTFDcDRKL2p1S0FnZjF5VDVDSVg5c1R4NWxJWlRKOG83cTJi?=
 =?utf-8?B?Uy81S2FIRzJGUmc1WER3UDBwNEd5c0dmZk9YSW5EVWs4eVRTVFpPUGlKWGJv?=
 =?utf-8?B?SzEzbUNadVBIOGZlcnc3M0NtU1g2VlB0Tkd4RmF1KzBhRnZoN2VwTUE4Qy9D?=
 =?utf-8?B?WE83RHJkcGZGZ1MyT0Z6U0hYZGpJczZuT2JTNTdSUFh3a0xXaGhPR3o5S1Fu?=
 =?utf-8?B?dlFud3Q1QzQ2MklBWHYxaitRQ0dxdWQrbm9VK3V3eFZLZXh5ZWdYNWhscnBZ?=
 =?utf-8?B?QjZENWl1UG8wQ1doRm9VcFZSVzI4YVhxNDhaajlLcW5zVklOSTBsYTY4dDcx?=
 =?utf-8?B?UStnTUtMMktEUVlyZ0NqTHVMRlYrMGZ6WURmR2IzaVNTSjRQSEZmUTk1dGhQ?=
 =?utf-8?B?KzBKWWZoK3NWck5kS0wwRlhFTnMvK2hnYmEyVG1wTktZRjFWdmM0U0d3eFJv?=
 =?utf-8?B?QTNWVlIzcFh6SS9Ba2JRZkxGQlBWeWx1MEZNY3VhcFNMbFpaWDdMVHd1MlFT?=
 =?utf-8?B?aU1hZS9VL29kcDlTRkNQNmJHanlZOTFleUt3bnFjK3V6WkZxaWxicHpBc1lm?=
 =?utf-8?B?U1RxSU5qMFFzZ1BPQWx0VXJBSmdUQ09KR0VJQ1pzUU5Od2ZlTEtYWWVkWHlt?=
 =?utf-8?B?T3ZsRXBLY1NIeXBLTlM0bktiaWRkZWNhZWtablJOVVpmSUkzWTI3T3NFR3dK?=
 =?utf-8?B?UDBMTklKeHdzMzk4YnZsN0c1b3loalpUZlV1anEwdEtZdHVyZ1Y3bTRIZWQy?=
 =?utf-8?B?Z0F5S3d6WjI3ZUZwTmgzcElQMjdPTTllR2tHcE95dzM4eUFJQUQ5Rjh4RHhr?=
 =?utf-8?B?OTFSU09UWTl4Mmxld3puZ0V0MFh3QXZqaUlvalViMjZuSkoyTUFQSlI1dmdP?=
 =?utf-8?B?RWtvdThuZkhSQ2JQdnFyYmo2N0pLaGNJTzdnQ2tKcXN1MGplUXUwYnA1M3cw?=
 =?utf-8?B?anc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b9e2c0f-8343-4c93-9c23-08de3c075dc6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 18:25:47.0363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 84TkN3+sVv6t6aH6ovndnoRfAnxUHqopEcJfBz6OL4cDH9fpPG3PLBCS6dcwrQs9JZkZ7fTW72liwNuIpCzgIomWVmLkQDUBoY4TrIdNaFg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8943
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



On 12/15/2025 6:37 AM, Michal Wajdeczko wrote:
> There are already few places in the code where we need to check GuC
> firmware version. Wrap existing raw conditions into a named helper
> macro to make it clear and avoid explicit call of the MAKE_GUC_VER.
>
> Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
> v1: split from [1] (Michal)
>      rename helper and add new macro (Daniele)
>
> [1] https://patchwork.freedesktop.org/patch/693953/?series=158874&rev=1
> ---
> note: there is yet another place that could be updated (xe_guc.c)
>        but since it seems already broken (VFs don't know FW version)
>        it should be fixed separately anyway.
> ---
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c |  2 +-
>   drivers/gpu/drm/xe/xe_guc.h                   | 21 +++++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc_ads.c               |  4 ++--
>   3 files changed, 24 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> index 3174a8dee779..7410e7b93256 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> @@ -1026,7 +1026,7 @@ static void action_ring_cleanup(void *arg)
>   
>   static void pf_gt_migration_check_support(struct xe_gt *gt)
>   {
> -	if (GUC_FIRMWARE_VER(&gt->uc.guc) < MAKE_GUC_VER(70, 54, 0))
> +	if (!GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 54))
>   		xe_sriov_pf_migration_disable(gt_to_xe(gt), "requires GuC version >= 70.54.0");
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index fdb08658d05a..a169f231cbd8 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -18,10 +18,16 @@
>    */
>   #define MAKE_GUC_VER(maj, min, pat)	(((maj) << 16) | ((min) << 8) | (pat))
>   #define MAKE_GUC_VER_STRUCT(ver)	MAKE_GUC_VER((ver).major, (ver).minor, (ver).patch)
> +#define MAKE_GUC_VER_ARGS(ver...) \
> +	(BUILD_BUG_ON_ZERO(COUNT_ARGS(ver) < 2 || COUNT_ARGS(ver) > 3) + \
> +	 MAKE_GUC_VER(PICK_ARG1(ver), PICK_ARG2(ver), IF_ARGS(PICK_ARG3(ver), 0, PICK_ARG3(ver))))
> +
>   #define GUC_SUBMIT_VER(guc) \
>   	MAKE_GUC_VER_STRUCT((guc)->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY])
>   #define GUC_FIRMWARE_VER(guc) \
>   	MAKE_GUC_VER_STRUCT((guc)->fw.versions.found[XE_UC_FW_VER_RELEASE])
> +#define GUC_FIRMWARE_VER_AT_LEAST(guc, ver...) \
> +	xe_guc_fw_version_at_least((guc), MAKE_GUC_VER_ARGS(ver))
>   
>   struct drm_printer;
>   
> @@ -96,4 +102,19 @@ static inline struct drm_device *guc_to_drm(struct xe_guc *guc)
>   	return &guc_to_xe(guc)->drm;
>   }
>   
> +/**
> + * xe_guc_fw_version_at_least() - Check if GuC is at least of given version.
> + * @guc: the &xe_guc
> + * @ver: the version to check
> + *
> + * The @ver should be prepared using MAKE_GUC_VER(major, minor, patch).
> + *
> + * Return: true if loaded GuC firmware is at least of given version,
> + *         false otherwise.
> + */
> +static inline bool xe_guc_fw_version_at_least(const struct xe_guc *guc, u32 ver)
> +{
> +	return GUC_FIRMWARE_VER(guc) >= ver;
> +}
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index e06c6aa335bf..5feeb91426ee 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -347,10 +347,10 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>   		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
>   				 GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET);
>   
> -	if (GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 44, 0) && XE_GT_WA(gt, 16026508708))
> +	if (GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 44) && XE_GT_WA(gt, 16026508708))
>   		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
>   				 GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH);
> -	if (GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 47, 0) && XE_GT_WA(gt, 16026007364)) {
> +	if (GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 47) && XE_GT_WA(gt, 16026007364)) {
>   		u32 data[] = {
>   			0x0,
>   			0xF,

