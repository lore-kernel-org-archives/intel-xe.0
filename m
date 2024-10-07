Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA015CFB43C
	for <intel-xe@archiver.kernel.org>; Mon,  7 Oct 2024 03:14:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BC0210E2F6;
	Mon,  7 Oct 2024 03:14:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IuxE7QEC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B9F10E23E
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Oct 2024 03:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728270859; x=1759806859;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JrQFT4XhTv5bbT1ZpYnRKulfaS1sSFJofAOdYj6vbos=;
 b=IuxE7QECPnVTlaLQ8PdbR9uobWdHwq9r2Wno4eyUevHxszED+srLij9B
 iwM7yWkqGoFdPjhBP0liprFEnYp32mnUonl3IxmWVFKFsFlzn2KbZStr+
 PGL8b6lG6hK/I94Nk/szuYqFReuqVkEzFVwPx71+/lSwSaVOPxU2ZLOiC
 EvklBGv8Sli4b6heJeSo0EUKct/s0Xr2Bs00qYcaA909A08UYs3p48syz
 RriBR7L3RyWn3UCM1NPEI8a4OPfpjJvFUSSkm0DUy3eAB6VM61DDWdblM
 5WXroKaUhwmGO5o5ABHjl0P/Fy/DrEPodyqMtxisTXHsm/JIZ8a8jLnSY Q==;
X-CSE-ConnectionGUID: L0ZJgTdJQqmZKz8yw8WMMg==
X-CSE-MsgGUID: TeypTiuUQfO2VXddLMWX0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="27286835"
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; d="scan'208";a="27286835"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2024 20:14:19 -0700
X-CSE-ConnectionGUID: iXcvQi7HQuKpGZkrJ6WNdQ==
X-CSE-MsgGUID: HyQKrQbiRxiKF/gTHndzTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; d="scan'208";a="80164862"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Oct 2024 20:14:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 6 Oct 2024 20:14:17 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 6 Oct 2024 20:14:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 6 Oct 2024 20:14:17 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 6 Oct 2024 20:14:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=loo7S6IelhqjrPkinu74VEuY+66wpLKi7XFkcAbYuE/k12fMT3j54KIyLJNsO4AzZV6Lu+7ZcrcD0k7ZJ4iOpsVZtkw6PkvhnVX4IraiFB5YHxjI6fYFnDJfbjLM5NJ3YzC5pfYVdbvwGQcUAguC3rWczys1QgyRjb1TQUpiyC2e5KqSEnwublIKCZz33NHOoplqsYc+iQ1OhHSQlk6/HQZHem2HRN6UdBlBGdoftrWSZHVCQt2DpkH4K98ViACTnf7OqFofcvhXNKWhX8POuH46ybcRmpOG0c9dxD7eQxTikkuvJZRWyJaH4EFmiEAGbc1a6VcUlb7IGtGw03d1zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pNX+zJaLkofYuzhGiS5Zls0arRAF1ArTaPnPmjC5VKs=;
 b=Z0jHS7SlW7qQdL1menDUAErk8BR8w5aR6EwsZPtRSbKB5HWRvPX6YA+cnM56vGrmyj2Ly94sflZHrKHha8kra+Ti0N9IEO9BiJIPfXZNu6MYTsAXpipT+v3UUWO/0TyBVr2OBv5vNrz1QONBuUIQaJUgRMd9bcmFTHbZlt3wcr+tJ7b5Dr/Hv0E6QEAbQ1uLRGqp4qeLW1vHNhtud/He4t1HbJ+sCpbQFoAULK4vsKRJascSdC/LRmx8byxDaP3LLcTkZHMwI6yxd+qhtnjD959Sq3yR+6+V7bYJm2zbtGw6UTL9THjciJs3KpaJnbzp0+vIRlhG4xyT250tT90Zww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SA1PR11MB7110.namprd11.prod.outlook.com (2603:10b6:806:2b3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.19; Mon, 7 Oct
 2024 03:14:15 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 03:14:14 +0000
Message-ID: <7f08911c-8841-487d-bc91-d9729e46fbd6@intel.com>
Date: Mon, 7 Oct 2024 08:44:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/25] drm/xe: Error handling in xe_force_wake_get()
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, "Nirmoy
 Das" <nirmoy.das@intel.com>
References: <20240930053149.1246339-1-himal.prasad.ghimiray@intel.com>
 <20240930053149.1246339-4-himal.prasad.ghimiray@intel.com>
 <232163cc-1978-45b7-a920-2890a014cb95@intel.com>
 <fd421437-87da-4b9e-b6e4-523723898965@intel.com>
 <c6094193-0059-44eb-bab7-73d139a0b4a7@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <c6094193-0059-44eb-bab7-73d139a0b4a7@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1P287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::13) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SA1PR11MB7110:EE_
X-MS-Office365-Filtering-Correlation-Id: 2be1b87b-100e-4a63-04a7-08dce67e1f50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L3lMY3UvSUU5YXlrK1lvNUZiN1BYWExYNCtyNVVZcDFzTjdxeTh5MjF0bWh5?=
 =?utf-8?B?ZjlzeUM1Y3FmRlBlemtQZDBlZDNmSFd3SGs4cFc0dVhEcjNza3ZCM2JuTHNh?=
 =?utf-8?B?T2NRemozYlJTc3M0V05hcUQ1V1FWMWxwb2RHUlVGZlNSL2ZhVmhybVprUWZJ?=
 =?utf-8?B?N3gvaVhFSkMwRHVwbzJQUm4rb0E4MGV1cGRpQWdjYzdXYU44ZmJ5OWRNN0sw?=
 =?utf-8?B?YW1GWHZWenJQUjk3eHV1NU9rWjZ1Wmg5N3RkZzhkQUtvcUk2NWphY2IxYk1Q?=
 =?utf-8?B?VEUxSjNRZ28yN3lUL0dVeXJMNElqamtKUUw0bkF3UWpHMzRrSXkxRFdLNUtv?=
 =?utf-8?B?dnBpZDlYNDRzRnlWa2taVnR4M1prZ0trdUdxc3RDbUpqRUlSV2hhMUgwRis0?=
 =?utf-8?B?eDVqcTRsVUQxQk5VT0s4Ri9EczczUENmVWgvYUt3RkI4QU9XeHZBS2JNaWdN?=
 =?utf-8?B?OVVseU1YWWJQZGREamxudGFjakpNR0pRNW1nRlZQbzdxWGcvYmNKcVlaN2lO?=
 =?utf-8?B?R0tua1BRYU11dzB1RWl1L2VlYkJIdGFOb0xWNjM3bG1IamVmQXpsQ2E0MFd5?=
 =?utf-8?B?b1h2ZzE0bWcweVpqWG1oVXdYWjRtYWVzU2VkVUpKaDQvUEJZcUVLend0UnRm?=
 =?utf-8?B?ZnRwblJTa3BmcWpONmhzdVdaTDR5M1JrbGNETk43TVB2Z2lUZmxjOGxpQkVM?=
 =?utf-8?B?UEkyTFkwbWtCRXViWnJVelc2eVdRWE5jSjFBb1B4U3phRXdQUnRLSG5SK3BE?=
 =?utf-8?B?RUVzZWsxa3NSK2lacU1SNWN1dWZCOTFiZFFZazhmMUZlNGJ1L2xDajdCQ0gv?=
 =?utf-8?B?elNCS2N1L2JLVldXYXAzWVNRL3RKTmJ1blVrMWprQW1RV0VZYjExNDFnNVgx?=
 =?utf-8?B?dGpsOWk2SU5selJ4Q3dBaXp6NktCYXg3UlI3Q1U2NWdWYm1NYTVCbVZ4SFpJ?=
 =?utf-8?B?YlRsbUpMVEpvb2hvMXlCbUQxeEgwOUtPQVo3ZFpYbTdycGNUSEpDaHlHRzRs?=
 =?utf-8?B?K1hxcHgrN3U1QVRzTUkyZzRydHhaNUloNG45YWhQNks2MWkzQ3ZLR1ZsQlZL?=
 =?utf-8?B?dWJlTDVmNGhxRWZiUXBzaDRwSEJVUGc2bSt6aHF5SzE1aFRSNWpEN0dpS2ZM?=
 =?utf-8?B?V0c0Q01CaklOem51eGQ0OUVtdnFJcUMxdzFySGUzTzBsRGdzQjBiT3cxQVU4?=
 =?utf-8?B?cjRHbVpja0JxN3QxSFpwVURHZ3hMeEYyL05Ia3J6eEtwY3VSVU81T0NQQ1Z2?=
 =?utf-8?B?dE1iREtzZTBJSUhtOUZqZzh3cEl2cGtXT09pN2pCVURQVVdXK283QzZEUkVB?=
 =?utf-8?B?TFA3UjA0VmJnejE3Q3RWWk43cGFGTE85cTZaVkhJTWRGcWZURUYyQTBQUGhJ?=
 =?utf-8?B?Z2xMQ2FWMFdJU0hjSmxzUUluWWVKL0JocVhQOURkeXZyYXBTYVozWGc0bTZE?=
 =?utf-8?B?YVl2S2Nkb0RHaDFqUm04dEFMdHZ4c0pJRlJ1REx0Z1VKdXExWDZ6Q0QvYmk3?=
 =?utf-8?B?ejhQaTdsOUJmNlhEeDF2NThJMlhxOFZTZ2FvM3NzcTYyWmszRXplSlh4dlBu?=
 =?utf-8?B?RXBPVHVqR2V2NmtkY3FKb1B0dUdXeHFkcmVnNFhYMmF6MnVwTEVTbXFZTDVG?=
 =?utf-8?B?RFdGTy9rc1N6Q3J6dFlDTVp6aEdLb3VhVE9XakFmU25RcTFxSkk2MVlXU0RH?=
 =?utf-8?B?QWlyUGNKOUpBRWFDN3JvTEtrQ0pwdXUyclRIOVdRQ0wrOGdIYmNGYnRRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTJRb3gzbDBoem40QldoRjR5Q0dmbHdvMkF6UzBweEpYS2tIMlBUL29VMFVN?=
 =?utf-8?B?KzBsZEZJWEFMSU9WZzNjNkNQVE9hVkluNUROcGlCUUNmR2UyS3R1NlhRMHlS?=
 =?utf-8?B?TVdHSnUvQU9URjExNDlKSTlsQzVFTGdlOHJnN094TG8yNjhMQzNIVzZsRld6?=
 =?utf-8?B?MmE0SGk3L0dJc01KbnF4YWVhQ0I3UlRoVk1vN1ZTaStjRWFuQ1lWa1QxQXM5?=
 =?utf-8?B?UTZ0ek9rWDZoMmlJMzVIRE1kanh3cHRGaXVaejF5OUhTUncycnIrUGNJcEdD?=
 =?utf-8?B?aTRJYTVrNHI0VnllMUJrM2VCRWpueVZaVC9Lem1sWENnYmhSTU80NVBHVTlj?=
 =?utf-8?B?SndML3BFSXQ3OGFpM1R4RUtnMkVaVHNrWkZmR3cyblRaOTFUYXpDR0RzcmRj?=
 =?utf-8?B?enBzOFp1dU5HTEVBS3JlcDFHY2VML09oK0s3RlhvOXB5RVdreFJZSEg3YWtm?=
 =?utf-8?B?blVMNkdLZXNnV2cyVVJlTnYwdnpEUFJQSHo0T3BXY3BaYTcyQVBzdkFDcm1W?=
 =?utf-8?B?OG1wbTBKaEEvWmJ3SWplUk52VDdUQ3VBQkl3RFBOYWNWcnZWb1VlTERhamcy?=
 =?utf-8?B?NytPK2wvWm5HZ1RWUThLaTM1YzZWNmRQUkl3ZEhyZVdnWmVWVE5iSnI0TUVx?=
 =?utf-8?B?dHo0ek1QL3J4UnJkMkNVbG9Zc0U5cGlyQ1k5bWVRQ0hINmpTOFltcEV3RlJs?=
 =?utf-8?B?OUJITlByMnVYMFM5ay9sRldnZE1FTDNzUTZWRFVoL1NKUWpWa0Vrazg0WjhV?=
 =?utf-8?B?a29jVnBHUmJycVA4SlB5czJnWWVkVXgrMGt2M3prem5nODl5bHdRVmVJQ21T?=
 =?utf-8?B?QTdPdU10czBpcUlURkVBVnVMcWt2cXhWb3VaaWZ5SExNNzZ0dStuRUVWVWxx?=
 =?utf-8?B?VjY3dUVsM1hoWXJlM1lqVWpjSnJFMzdiQURKclpyTXhkR1pQSVI0dEFPR3Q2?=
 =?utf-8?B?WUZpOWlrZTcreWtGL2w3L25ER20rVkw0VjlPWkFMSU4wcEFZeHUxYmNGY2pX?=
 =?utf-8?B?ZlJwUjNXM1QzWlBJYWhhVDJGbDI0NU51V3dGYjk0VUpSc01jdGNhU1duM2Fm?=
 =?utf-8?B?NFRQTGVtSkk0K1ZjeGY4dkxEN1ByVUJYZWp0WXFiMHRaSS9lTmI1cWUxZDNU?=
 =?utf-8?B?OS9DeEhTUlFvWWt0cWpjOGI2ckpsbVhnMkdPY3pIRWlNL0ROd3dOa2lzR2ND?=
 =?utf-8?B?Tmx3cjMwenU2ME0yTjkwVXJPekJxOHRXNXlZVkx0Nmh6WlhwWmg4djlNNlFs?=
 =?utf-8?B?cnRnYzBIcmV2Nmt0dXdsU2FPZUxTNmpHc29uR2FTVWFoTlhrWHRXWnZpUHMr?=
 =?utf-8?B?TzIyZUQyTWpCWVFmOVV4dUJwT0FQQUJIU01PZXhNaHlXTGJITDA4QWZzdmRR?=
 =?utf-8?B?L1hTeG11MFBpd3cwbnZ3YXlzQ1paZWdJOFFWYXJsdTFiTDk2Skg0Z2xISnRC?=
 =?utf-8?B?UU9JeUJ6ejU4bnM2eTFrVVZyVklYRzVQcHF3UmJXVUR1TGZFeWdMNVlMVzRF?=
 =?utf-8?B?SHRCeld0Z1FQWTFxa0d5QnczQXkvaHVLbHFGNnFJU3lsRkxKclJ6WlNBS1Na?=
 =?utf-8?B?Z2E3VWw0M3JieFMxc0UxbEcvNDdueUhqNVdSNDhkRHdodVQ2Z2U2RnR3VUhq?=
 =?utf-8?B?R1g5UlVjdlBpTUJ6L0RwelRUSGxMTHZUV2l4dVE3TmY0NHMrdGQxRmV2bWdY?=
 =?utf-8?B?cnZrOElnTE9YTWtybzBpWWZvT1pRT1Vra1ovTHFuSG1VdzJTd2RtczF2aHZE?=
 =?utf-8?B?TnVobmc1R3orZDljOFVjVXBrOEw3bGR0NGNHRTZha0ZCUWRhTUdCWE1VUEp5?=
 =?utf-8?B?Mk1JMFBBWHRHSXltZTU5bFliZDVjK201cjdiTURkbFlQZTdPY1k1czVmaGxQ?=
 =?utf-8?B?YWx6K1I1OXBieE1HNHFiZWpmOE9nR1N5bnNHQS9YMTY0VlgxWFhVOU5LZTdC?=
 =?utf-8?B?RTFwVHZkR3pWdG8wV2dDVDQzWUFIRUhYRThTcS9qUXI0Rk9NRXYwMEZLb2l1?=
 =?utf-8?B?bWRTVkx1S0VidU5ZNjFPeFh1OHpTZFl2aDduSUc0VWs3VXd6N1BQaGZNSkoy?=
 =?utf-8?B?RkUzbTNZcFBMQ25sWFM5ajYxWHloVlR3NC9kajJsK1FSbnA4MFA4T0s3Zm94?=
 =?utf-8?B?VkRLSU9HYXVxUFlvbFFnVHEwWHBnZGFuVllBWDV5ZWtHdDI3REFoNzR6NUlq?=
 =?utf-8?Q?gpF67jUvRrzxtOtCdthXWA8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2be1b87b-100e-4a63-04a7-08dce67e1f50
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 03:14:14.9009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hpGhUauwK8Ik8pEcsUqC/2YcnE3FTvD+YXqfbhj7yrHyjD4LEsCgnHiCisuxug6RovBS/NegOEj1kG6MeuJ21ZyGqwk/WB5lgJlO/jqp8NE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7110
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



On 04-10-2024 13:10, Nilawar, Badal wrote:
> 
> 
> On 03-10-2024 21:40, Ghimiray, Himal Prasad wrote:
>>
>>
>> On 03-10-2024 17:53, Nilawar, Badal wrote:
>>>
>>>
>>> On 30-09-2024 11:01, Himal Prasad Ghimiray wrote:
>>>> If an acknowledgment timeout occurs for a forcewake domain awake
>>>> request, do not increment the reference count for the domain. This
>>>> ensures that subsequent _get calls do not incorrectly assume the domain
>>>> is awake. The return value is a mask of domains that got refcounted,
>>>> and these domains need to be provided for subsequent xe_force_wake_put
>>>> call.
>>>>
>>>> While at it, add simple kernel-doc for xe_force_wake_get()
>>>>
>>>> v3
>>>> - Use explicit type for mask (Michal/Badal)
>>>> - Improve kernel-doc (Michal)
>>>> - Use unsigned int instead of abusing enum (Michal)
>>>>
>>>> v5
>>>> - Use unsigned int for return (MattB/Badal/Rodrigo)
>>>> - use xe_gt_WARN for domain awake ack failure (Badal/Rodrigo)
>>>>
>>>> v6
>>>> - Change XE_FORCEWAKE_ALL to single bit, this helps accommodate
>>>> actually refcounted domains in return. (Michal)
>>>> - Modify commit message and warn message (Badal)
>>>> - Remove unnecessary information in kernel-doc (Michal)
>>>>
>>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>>>> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
>>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_force_wake.c       | 45 +++++++++++++++++ 
>>>> +------
>>>>   drivers/gpu/drm/xe/xe_force_wake.h       |  4 +--
>>>>   drivers/gpu/drm/xe/xe_force_wake_types.h |  2 +-
>>>>   3 files changed, 38 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/ 
>>>> xe/ xe_force_wake.c
>>>> index 5ce9e912818a..7f358e42c5d4 100644
>>>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>>>> @@ -160,29 +160,54 @@ static int domain_sleep_wait(struct xe_gt *gt,
>>>>                        (ffs(tmp__) - 1))) && \
>>>>                        domain__->reg_ctl.addr)
>>>> -int xe_force_wake_get(struct xe_force_wake *fw,
>>>> -              enum xe_force_wake_domains domains)
>>>> +/**
>>>> + * xe_force_wake_get() : Increase the domain refcount
>>>> + * @fw: struct xe_force_wake
>>>> + * @domains: forcewake domains to get refcount on
>>>> + *
>>>> + * This function takes references for the input @domains and wakes 
>>>> them if
>>>> + * they are asleep.If requested domain is ALL then only
>>>> + * applicable/initialized domains will be considered for refcount 
>>>> and it is
>>>> + * a caller responsibilty to check returned ref if it includes any 
>>>> specific
>>>> + * domain by using xe_force_wake_ref_has_domain() function. caller 
>>>> must call
>>>> + * xe_force_wake_put() function to decrease incremented refcounts.
>>>> + *
>>>> + * Return: opaque reference to woken domains or zero if none of 
>>>> requested
>>>> + * domains were awake.
>>>> + */
>>>> +unsigned int xe_force_wake_get(struct xe_force_wake *fw,
>>>> +                   enum xe_force_wake_domains domains)
>>>>   {
>>>>       struct xe_gt *gt = fw->gt;
>>>>       struct xe_force_wake_domain *domain;
>>>> -    enum xe_force_wake_domains tmp, woken = 0;
>>>> +    unsigned int ref_incr = 0, awake_rqst = 0, awake_failed = 0;
>>>> +    unsigned int tmp, ref_rqst;
>>>>       unsigned long flags;
>>>> -    int ret = 0;
>>>
>>> As we have fw->initialized_domains lets add check if valid domain is 
>>> being passed and assert otherwise.
>>
>> Sounds good check to have. Will add it.
>>
>>
>>>
>>> Regards,
>>> Badal
>>>
>>>> +    ref_rqst = (domains == XE_FORCEWAKE_ALL) ? fw- 
>>>> >initialized_domains : domains;
>>>>       spin_lock_irqsave(&fw->lock, flags);
>>>> -    for_each_fw_domain_masked(domain, domains, fw, tmp) {
>>>> +    for_each_fw_domain_masked(domain, ref_rqst, fw, tmp) {
>>>>           if (!domain->ref++) {
>>>> -            woken |= BIT(domain->id);
>>>> +            awake_rqst |= BIT(domain->id);
>>>>               domain_wake(gt, domain);
>>>>           }
>>>> +        ref_incr |= BIT(domain->id);
>>>>       }
>>>> -    for_each_fw_domain_masked(domain, woken, fw, tmp) {
>>>> -        ret |= domain_wake_wait(gt, domain);
>>>> +    for_each_fw_domain_masked(domain, awake_rqst, fw, tmp) {
>>>> +        if (domain_wake_wait(gt, domain) == 0) {
>>>> +            fw->awake_domains |= BIT(domain->id);
>>>> +        } else {
>>>> +            awake_failed |= BIT(domain->id);
>>>> +            --domain->ref;
>>>> +        }
>>>>       }
>>>> -    fw->awake_domains |= woken;
>>>> +    ref_incr &= ~awake_failed;
>>>>       spin_unlock_irqrestore(&fw->lock, flags);
>>>> -    return ret;
>>>> +    xe_gt_WARN(gt, awake_failed, "Forcewake domain%s %#x failed to 
>>>> acknowledge awake request\n",
>>>> +           str_plural(hweight_long(awake_failed)), awake_failed);
>>>> +
>>>> +    return (ref_incr == fw->initialized_domains) ? ref_incr | 
>>>> XE_FORCEWAKE_ALL : ref_incr;
> 
> How about we simply return ref_incr at this point? Then, in patch 2, 
> given that we have a helper function available, we can validate ref_incr 
> against fw->initialized_domains, particularly for XE_FORCEWAKE_ALL, 
> within that helper function.


That approach is perfectly fine as well. The reasoning for this method 
was to maintain the independence of the API/helper from the fw.


> 
> Regards,
> Badal
> 
>>>>   }
>>>>   int xe_force_wake_put(struct xe_force_wake *fw,
>>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/ 
>>>> xe/ xe_force_wake.h
>>>> index de720881a300..eb638128952d 100644
>>>> --- a/drivers/gpu/drm/xe/xe_force_wake.h
>>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
>>>> @@ -15,8 +15,8 @@ void xe_force_wake_init_gt(struct xe_gt *gt,
>>>>                  struct xe_force_wake *fw);
>>>>   void xe_force_wake_init_engines(struct xe_gt *gt,
>>>>                   struct xe_force_wake *fw);
>>>> -int xe_force_wake_get(struct xe_force_wake *fw,
>>>> -              enum xe_force_wake_domains domains);
>>>> +unsigned int xe_force_wake_get(struct xe_force_wake *fw,
>>>> +                   enum xe_force_wake_domains domains);
>>>>   int xe_force_wake_put(struct xe_force_wake *fw,
>>>>                 enum xe_force_wake_domains domains);
>>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/gpu/ 
>>>> drm/xe/xe_force_wake_types.h
>>>> index fde17dc3d01e..899fbbcb3ea9 100644
>>>> --- a/drivers/gpu/drm/xe/xe_force_wake_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
>>>> @@ -48,7 +48,7 @@ enum xe_force_wake_domains {
>>>>       XE_FW_MEDIA_VEBOX2    = BIT(XE_FW_DOMAIN_ID_MEDIA_VEBOX2),
>>>>       XE_FW_MEDIA_VEBOX3    = BIT(XE_FW_DOMAIN_ID_MEDIA_VEBOX3),
>>>>       XE_FW_GSC        = BIT(XE_FW_DOMAIN_ID_GSC),
>>>> -    XE_FORCEWAKE_ALL    = BIT(XE_FW_DOMAIN_ID_COUNT) - 1
>>>> +    XE_FORCEWAKE_ALL    = BIT(XE_FW_DOMAIN_ID_COUNT)
>>>>   };
>>>>   /**
>>>
>>
> 

