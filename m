Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C757CAC5B8
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 14:28:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 119E810E3EA;
	Mon,  6 Oct 2025 14:28:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KKdrhBlU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F3FE10E3EA
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 14:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759760884; x=1791296884;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=X3UClDVWYQUrEdR0pAGpdHWt4OzADSSAuP9c8dKFabc=;
 b=KKdrhBlUI7fI18pgWm9T4b5pKuHwyWSwJnwaOhbpoy+SStWnnz11SNw9
 VB23/ZFgSIMwAa/okeWhkMDiWKmZm6voW0u2a7skb5c8L7vHFYlnHW8DR
 goRZXg8TdujGdLu/buP9UD92+f/Z5J33tgKhgACaS4DMWL7gyeNaDNO3T
 5EK3MS7Q060Rih5cVSjggf9eBXWDigLrz1n9tbLiuDg98SzKatBYtUAEv
 ehs/zFWeobl6YP4qf+bsPiJlx9iBJ9i+fpT64YVFoncry1nFFTeT7kiS+
 tD4qf9KoSEIYHC6H6ely701q66L9hJhobp7H6hoZSPsYZ74TTPrCS7N9S w==;
X-CSE-ConnectionGUID: c4pFMFQOTHyj/eL/HN5jFA==
X-CSE-MsgGUID: lgjxZ6DsR0CrB7ok3alCAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="65782392"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="65782392"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 07:27:47 -0700
X-CSE-ConnectionGUID: ldWuEkCbSCyMBIhePerzsQ==
X-CSE-MsgGUID: oQj1IRXFQfyt0RZV3za/WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="179563575"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 07:27:48 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 07:27:47 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 07:27:47 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.5) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 07:27:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mLG7OR4NmNvON6U7itMUpZIEmZ/4rGzqPRBstxfJ0aFUB1/D4sj3kEUKVrzWXMED5bYQ0wMSYWT2oit36yQfkaDzcdWefCAaXJVVYRBDRrWRA8jKR3HyDo+7IL7mG8wJfdgPGTw+/Wlk0hN3QYUkn080qxGFc4bLwYmTPfMDGb/K//x8FfbMb36cLsH9qtAOTon/UVaFKLwi/uI/dklNZDYkjC/UWK3tU7+C/X/QKzpztlnrbCp8QF8r/J7bGh5nXIWQQ1uf3UGR34ES8qssIXnK9ylbRb28wqlKgE3UFPNi9LZRcV2AUL4Te9cy54hfyFscgW93XvOQVGzhqWMU9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C59hsASFF0eYR/Xu/34WW74wzmLgzKMTFZuBkOG1ppA=;
 b=MYokTIFxxHANRB83s3uHwYBE5APPeM+ubJGW9C9YbFO7XPT8A5Gg2Gp9gVVrXQipdpNp901aLJvjtHnXBg6TFgol/ii6PyavDiYuXyBANzS15xXT5BIHc1DaTNMFXwCG/WK8i+dhb7tC+w0quyEB9wEnLFIH9GNgiKbjUWUjsxw2SGmXhLTN2DZ+pm0KnQgxQGzDXDH3Ztw1AtGioaZ6gwj0u7BiC+BSbflJod0xUgWO5eOv6S+PINllVsgo7uU+wALVEoazSdEkU1/SN8mPMGqV7PRBloqtLCZfED1cIbAIbJ5jvplHsFS59+Si97ubGjSxYxx+Yai/tNlrGBZq/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS7PR11MB9449.namprd11.prod.outlook.com (2603:10b6:8:266::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 14:27:41 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 14:27:40 +0000
Message-ID: <790758a6-3697-444c-95bc-1ce62d9cef6d@intel.com>
Date: Mon, 6 Oct 2025 16:27:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/30] drm/xe/vf: Close multi-GT GGTT shift race
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251006111038.2234860-1-matthew.brost@intel.com>
 <20251006111038.2234860-12-matthew.brost@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251006111038.2234860-12-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR04CA0088.eurprd04.prod.outlook.com
 (2603:10a6:803:64::23) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS7PR11MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: 01a5e1d4-e6b5-443a-2a6d-08de04e48180
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SHdmNFphaUFpVzVXbUtHR2ZCMGZBaVJXSkpwZUthakRmMi8wUzFQYi9FYlcv?=
 =?utf-8?B?VEVzdkoyYWxLWkpnMnNvR3ZOZElVSWpDWXIwTFQ3OGt5bW90UnBWNjZJWW9X?=
 =?utf-8?B?eHdxRlNkWVBWbkVWOE5MUmVDZm5QYlNkN0haQWttM2xqSEtpY0FPUS9PQXZI?=
 =?utf-8?B?NVMyTjl6Q2pzcmt5VFZHT1h6SUVpbFJ0aWtiOU1HakN6bjlwSS9mL1BRdkhI?=
 =?utf-8?B?ajVsNzdoTU5VWWpsOUJ5ZW9vUTVZTjZFWjBtOVlvekJrUi8vZVY4cmFnaDgz?=
 =?utf-8?B?VXA0ZnBFbDVmM3lQUWlrVEozckxqU3Q5TkNwR1VELzgzSERYVldjcmVCcXNm?=
 =?utf-8?B?TmYxN0xDRWprQ24xOFVNRlFyWTVpcDVVVjFKSTVhbVQ2YVdWaldjcTBwSUFG?=
 =?utf-8?B?R0ZYWTh6Rk5LRmZoWGRaQjNqWmxZa0drc090Z0ZjY2NWeXlxZFR3Z0UzbXRa?=
 =?utf-8?B?cXRYNE1qemtKTy83T3A1R2UyMFRmZnJSYVRIZWlnbE9ZemtwTW1rNG16eDFP?=
 =?utf-8?B?YVBvM09OVThCNkVaVDhsVUlmWG9lekMvb2h1MzRSRmdtRlF3TEs4MVBvM1lu?=
 =?utf-8?B?RTU4OExRenh6emxGUGsxWDljQWdjNE91SHhkQWRuSjJqWUdtZjhIWTd5dnJS?=
 =?utf-8?B?UldZWFQyY3pqd0ViUUQwd2hlajBlN2Z4cnUwSG9Bd3FxNVlLOGpQUnVLU2Na?=
 =?utf-8?B?U1lQdWVIdHlYclJ4M3lTNVF3anpsMHZCc3hBYUNpSGErajRqeFRrclR4akRt?=
 =?utf-8?B?cUZyamNMTWs2V0lyOHpIQ200UG80WG95UStUZW9nZ0tRdk1FSXMxZGRDTTNX?=
 =?utf-8?B?bk8vMmNlU2REdDdkeHBRU0s2djBOUUZxOE1tMmFDMnh2TjFOTjY4TmhOb3N0?=
 =?utf-8?B?SzZUN01ZZUU4bDYzRGk3eDhqVUVoNSt5VC8xLzl1MVdKQWI5OWJsSER6L0tw?=
 =?utf-8?B?UkJXUEY0K3E3VHdTL2M0UEtxWk5uNXFUem1WRENMZ0xyejFYTzlSOXRYY3ND?=
 =?utf-8?B?bmdFcGh3cG1HNno1UDlmVDVIMDRlOGlwdDExNjVaYitsaUJxNjhFYlk2RjQ0?=
 =?utf-8?B?TVB3dGVRV2VmM2gwRC9OUGRxdVJCcU1iT0kwNFNONFdTM1UwK09POUxWVXBx?=
 =?utf-8?B?Y1lYQVdQaWdSR0pEZFg4Q1FlbEhsN1hFNzc3VnM5VTlDVnVLVDVocmdOV1BG?=
 =?utf-8?B?UFpXa3NvU3V2UDR3RU1uYnhYR0xLR2p5Q0dqUUdxYXYyZG54Szh1VXZBV0d5?=
 =?utf-8?B?S3BTWjFKT0N5eDFJNFo4aUF4T1dRRUpOVVlublh4Y0JvQlBOOFlRUUlWUEk4?=
 =?utf-8?B?bHJFQlVNR3dtWTRhWHlCMlNkamRNZmY4b1cxcjJUQnlzRFVWV2wrM3NqaW5R?=
 =?utf-8?B?K0ZxSDR5d05hK3FQS1NnYjhoaUFXZitTQlZKVFNWWXNRYXFPWTl4TmdRM05S?=
 =?utf-8?B?bTN2S2R5Qk1mQWNsaWo1REdJNFI0ZEtBN1poeUVybjFSYndDR3gyekZ3RUlQ?=
 =?utf-8?B?K3pZT3dBK0lYbnk2Nm50UmpPejRQREdoLzZBd0R0WWpDbE13bVVLcTUwVkMz?=
 =?utf-8?B?RWUyaGZERTYvQ2k5TlhaVUJzVHZhSk9qbFNmQ3RSYm1zdCt0UW1wOHA1QWYx?=
 =?utf-8?B?WGRBUFJDTzQ3MFhwK2E5Nk0zdU5UM3FBL2hGaVFFT1NBcmpZZ2VKK1lNZFFr?=
 =?utf-8?B?Sm5Yelp3Z1dLRTRmQlloK1hpNHFXZHNQc1ZXQU5xUHpjbCtaK1NFMTdtc3Ev?=
 =?utf-8?B?QWV3ZFRnWXZUTVRZdlFzM0cwWFNjWC9tcGp6azhDdUJYYm1TdkZzdWx1bzBV?=
 =?utf-8?B?YlRhTFJBL0ZtM0djU1JhazF0ZXBKTjlYZjdaRE1qSlBxTVcxY2Q5dVNVekpY?=
 =?utf-8?B?UW9tOHV0RXMwRkIyRHRYN2VpS0l5R0UwSlFIaC8rWjNoV3RVV2lIQUs0UVA5?=
 =?utf-8?Q?/mKqz+89dHFqoXV0XgMnljMNSeIuksdc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bC8vbmVZaHN4VHFpaURTVWlOQmhpc1NObHZObm1tT0E2YndkeS9GV2VVckpJ?=
 =?utf-8?B?cHF2TmJjRk5qNjdCdENGcWQ4dUI5aHQ1SmwxQlYvejFRTWJsdXA4VXMxb3VJ?=
 =?utf-8?B?UitSUHQvcTdYYVBvMFY5bTR5cmhxQVphYUZVTHVjc3pGQTlHVzd5RlhPQWhJ?=
 =?utf-8?B?QnQ2SENDOGlqcmVCc3JlMzFWcjlJYStrRDlodVRuTHJlQWtJQnRxdmxRK2Fi?=
 =?utf-8?B?VHllU1kwbWxlNG5FSThIM0E5VXF6OUhqcHRRQjFIZjNvU09kUzE2QmxHVGVa?=
 =?utf-8?B?UlBIeUFFTFJtTDdmb25UTWNjUlhKQ20rakp4cXBQNER5bU1xd0c5M2p3S2Rp?=
 =?utf-8?B?Q2o0VlVFdFVYT2RzdXBGOTFrVmlCVFQ2QWNjaTBmdjNLVU5leElnUlQ3Qlp5?=
 =?utf-8?B?MUtFa01WcFMxMUZNd3UwMS84bXRIVDVMQU8rWkZ3STkreEtaMDBmMzZ3alNr?=
 =?utf-8?B?ckl0ZjBkR09rV1crZVRTQ0lHRm1Ob3MwU0N1OCtPdE5GQVAyMHBMd29XNUUw?=
 =?utf-8?B?KzdWdzFVcEpCUVIwQ1pZZlJBZmRrWENKQU5nT0RuaHRwTlAwQmhNV0tobUJB?=
 =?utf-8?B?bXp3c3p0SWNuRGRVWkIwanB1b2czb1B5dUJEMEJpSGdibVZwTFg5UDNzMkxB?=
 =?utf-8?B?bW9jcGpqbWJpNGJOcjJWRFY5cjQ1MHZzVXA5SktXbEU4cHBBbFMrcmRQMmtZ?=
 =?utf-8?B?RkFZV1gzVDM1NEZxdXZsS3M4UWs0UzBRVm9KYTZsbjZ6ZjNiQWZRRFhNMm5K?=
 =?utf-8?B?L1JhZjlTS3ByL3RFVkhqYnlNeWpISDZxeXhlTjc0dW5rakduVGhleEZCN1c1?=
 =?utf-8?B?K2JnMU53VEhsZ1JBUlBEREZ3d0V3THg1QlNYWG5EYWJpTTFxQWJtVmJoeEpL?=
 =?utf-8?B?b2YvdU0xQUN3K09LTkZnMTlxVDN4cjFjK0Rlc0p2WXpDYUdydFF2SEl4MG1z?=
 =?utf-8?B?ajNwa0F3ODgwNkRjUlc2YTc0NHJzdCtyWCtuU2c4cy9GcHJ3MXF0TDZFS0ll?=
 =?utf-8?B?NGk2WWdKbEVZQnJySkh1SE5ZQzhyY1NIcHF1M2JCV1BmZk15cmlPcE9FQ2w3?=
 =?utf-8?B?QU1zR3hjTk02YnB5VjVVU2xYUnBOMjRoaHdGWVcwMHhsME4zZU1yT0NUUUdH?=
 =?utf-8?B?SG9CV0hSdWhSZk85WFdHQWF1c2hxNVRvclg0UUp2QTRwdW1IdUV5NTEwMGU3?=
 =?utf-8?B?S3IySzZyT1hUakZMaVRhNXFEQWIxU01QcEc4ckFGQnc2TUNSV3JER1YzU2dY?=
 =?utf-8?B?dFMrbDNrQnNBelpMakZqMFo5QjRKdjVWdm40d0s1WUp4YmcxbnhLVFA3ZXE0?=
 =?utf-8?B?N3JuOHdBMkkvSG5ielZoVnU0YVdqc2ZrM1VReU9ZOWxDZllBSGthMDNTWVRG?=
 =?utf-8?B?T2ZVanFwZ3hWbk9rQzVmb0oyV2xWRVh3QyswWkpTS3RoQ0FiWHhEZW5Db1Ar?=
 =?utf-8?B?WWdseE12cXdtalNGTm1hQjlhbDFOc3B3emdhUDROUVRBU1gzYXZGbEIyek4w?=
 =?utf-8?B?K3VuTEdFYVRvdFdXeDF2dkhSUzFINTlIYXpCR3JYQktMUHVFbFB1TjZpZ21M?=
 =?utf-8?B?S21tRnp4UThGWExsMkgwdmNJSzU5RXdXbmMrcnpvUmg1bzVoSnBJVGZnRDVk?=
 =?utf-8?B?VUFuRzYzN20vTnR4ZTFqczlNOTJJUEk4SkQ2L0Zta3pJMnZObUF5UEVQTkpm?=
 =?utf-8?B?aTRGVmZmM0dTb2hxVVZocGdwYjdlTnhNd25ncDBlcmdZWTFHTVUrSndDRGV1?=
 =?utf-8?B?dnlzaU9lY1JRQkQ3eDdDbkpwdnVEZUwvMm42WTdWZGxaZkRiMUNyL0owYjdP?=
 =?utf-8?B?TXhCa21VTGp6RzZBWko0eE1Ta1dsczVSa1FoWE1pWVNCOHFiLzVFTHBid1l3?=
 =?utf-8?B?QXI4bHhmUUlwd2FxelhMcmNKM2RDaUhNQ1owcFA3RG0vV0Yza0lHMGsvWlk0?=
 =?utf-8?B?dllKSmZ1YjV2WmpLd1YvNmtvSFBzQzF5MVVoai9RbjNZSU5GdTJqS2FYN1do?=
 =?utf-8?B?MEhieXdPK0dvL0lBUElqZ2UyeHIvK0tPRy9zc1FYc0xLZGV1SlZaT3N6aW9X?=
 =?utf-8?B?d3dNbkxRUjU1cTMzam8rS2FyamRWSXF5d1d3UUhNcGllS1FrdE1DMHpaam1Q?=
 =?utf-8?B?Vk5UUjJ4LzJkc3Y4aWFsd1A5c3B5VmMyaTZhM3RvOUZQUGc1MDB3Ylg5QUx5?=
 =?utf-8?B?RVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01a5e1d4-e6b5-443a-2a6d-08de04e48180
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 14:27:40.7155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LBevDeJYuPiFwDYiMQwzr3PUm9GubqiwaqhDxPORaNO4AaelB1tPvGW8Jxy4uwEPxefbhFsvbEx3/cpUaA9HgMPT1mBPDT+jH5q5NrqlYSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB9449
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



On 10/6/2025 1:10 PM, Matthew Brost wrote:
> As multi-GT VF post-migration recovery can run in parallel on different
> workqueues, but both GTs point to the same GGTT, only one GT needs to
> shift the GGTT. However, both GTs need to know when this step has
> completed. To coordinate this, perform the GGTT shift under the GGTT
> lock. With shift being done under the lock, storing the shift value
> becomes unnecessary.
> 
> v3:
>  - Update commmit message (Tomasz)
> v4:
>  - Move GGTT values to tile state (Michal)
>  - Use GGTT lock (Michal)
> v5:
>  - Only take GGTT lock during recovery (CI)
>  - Drop goto in vf_get_submission_cfg (Michal)
>  - Add kernel doc around recovery in xe_gt_sriov_vf_query_config (Michal)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h        |   3 +
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c         | 153 +++++++-------------
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h         |   5 +-
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h   |   7 +-
>  drivers/gpu/drm/xe/xe_guc.c                 |   2 +-
>  drivers/gpu/drm/xe/xe_tile_sriov_vf.c       |  30 +++-
>  drivers/gpu/drm/xe/xe_tile_sriov_vf.h       |   2 +-
>  drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h |  23 +++
>  drivers/gpu/drm/xe/xe_vram.c                |   6 +-
>  9 files changed, 112 insertions(+), 119 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 1d2718b70a5c..c66523bf4bf0 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -27,6 +27,7 @@
>  #include "xe_sriov_vf_ccs_types.h"
>  #include "xe_step_types.h"
>  #include "xe_survivability_mode_types.h"
> +#include "xe_tile_sriov_vf_types.h"
>  #include "xe_validation.h"
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> @@ -193,6 +194,8 @@ struct xe_tile {
>  		struct {
>  			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
>  			struct xe_ggtt_node *ggtt_balloon[2];
> +			/** @sriov.vf.self_config: VF configuration data */
> +			struct xe_tile_sriov_vf_selfconfig self_config;
>  		} vf;
>  	} sriov;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 55a1ebbbf47f..d227c8a3ec81 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -436,42 +436,65 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
>  	return value;
>  }
>  
> -static int vf_get_ggtt_info(struct xe_gt *gt)
> +static int vf_get_ggtt_info(struct xe_gt *gt, bool recovery)
>  {
> -	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> +	struct xe_tile_sriov_vf_selfconfig *config =
> +		&gt_to_tile(gt)->sriov.vf.self_config;

maybe
	xe_tile *tile = gt_to_tile(gt);
	struct xe_tile_sriov_vf_selfconfig *config = tile->sriov.vf.self_config;

to avoid line split

> +	struct xe_ggtt *ggtt = gt_to_tile(gt)->mem.ggtt;

then
	struct xe_ggtt *ggtt = tile->mem.ggtt;

>  	struct xe_guc *guc = &gt->uc.guc;
>  	u64 start, size;
> +	s64 shift;
>  	int err;
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  
> +	/*
> +	 * We only only take the GGTT lock when potentially shifting GGTTs to
> +	 * make this step visable to all GTs which share a GGTT. Also the GGTT
> +	 * lock is not initialized during xe_gt_init_early when this function
> +	 * can also be called.

hmm, the real fix should be that GGTT lock is initialized right after GGTT was allocated
it looks that just split between GGTT alloc() and __init_early() was not ideal

note that while almost similar pattern was done for tile, in xe_tile_init_early() the pcode mutex is initialized

alternatively we can change VF to do not perform full query when doing early bootstrap as it is looking just for the GMDID

> +	 */
> +	if (recovery)
> +		mutex_lock(&ggtt->lock);

then we could use

	guard(mutex)(&ggtt->lock)

> +
>  	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_START_KEY, &start);
>  	if (unlikely(err))
> -		return err;
> +		goto out;
>  
>  	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_SIZE_KEY, &size);
>  	if (unlikely(err))
> -		return err;
> +		goto out;
>  
>  	if (config->ggtt_size && config->ggtt_size != size) {
>  		xe_gt_sriov_err(gt, "Unexpected GGTT reassignment: %lluK != %lluK\n",
>  				size / SZ_1K, config->ggtt_size / SZ_1K);
> -		return -EREMCHG;
> +		err = -EREMCHG;
> +		goto out;
>  	}
>  
>  	xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
>  				start, start + size - 1, size / SZ_1K);
>  
> -	config->ggtt_shift = start - (s64)config->ggtt_base;
> +	shift = start - (s64)config->ggtt_base;
>  	config->ggtt_base = start;
>  	config->ggtt_size = size;
> +	err = config->ggtt_size ? 0 : -ENODATA;
>  
> -	return config->ggtt_size ? 0 : -ENODATA;
> +	if (!err && shift && recovery) {

maybe "recovery" is not needed:

	if (!err && shift && shift != start)

> +		xe_gt_sriov_info(gt, "Shifting GGTT base by %lld to 0x%016llx\n",
> +				 shift, config->ggtt_base);
> +		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
> +	}
> +out:
> +	if (recovery)
> +		mutex_unlock(&ggtt->lock);
> +	return err;
>  }
>  
>  static int vf_get_lmem_info(struct xe_gt *gt)
>  {
> -	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> +	struct xe_tile_sriov_vf_selfconfig *config =
> +		&gt_to_tile(gt)->sriov.vf.self_config;
>  	struct xe_guc *guc = &gt->uc.guc;
>  	char size_str[10];
>  	u64 size;
> @@ -544,17 +567,20 @@ static void vf_cache_gmdid(struct xe_gt *gt)
>  /**
>   * xe_gt_sriov_vf_query_config - Query SR-IOV config data over MMIO.
>   * @gt: the &xe_gt
> + * @recovery: VF post migration recovery path
>   *
> - * This function is for VF use only.
> + * This function is for VF use only. If recovery is set, the GGTT shift will be
> + * performed under GGTT lock making this step visable to all GTs which share a
> + * GGTT.

hmm, the question is: why GGTT query can't be done under lock even without 'recovery' ?

>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
> +int xe_gt_sriov_vf_query_config(struct xe_gt *gt, bool recovery)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  	int err;
>  
> -	err = vf_get_ggtt_info(gt);
> +	err = vf_get_ggtt_info(gt, recovery);
>  	if (unlikely(err))
>  		return err;
>  
> @@ -584,80 +610,16 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
>   */
>  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
>  {
> -	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> -	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> -	xe_gt_assert(gt, gt->sriov.vf.self_config.num_ctxs);
> -
> -	return gt->sriov.vf.self_config.num_ctxs;
> -}
> -
> -/**
> - * xe_gt_sriov_vf_lmem - VF LMEM configuration.
> - * @gt: the &xe_gt
> - *
> - * This function is for VF use only.
> - *
> - * Return: size of the LMEM assigned to VF.
> - */
> -u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
> -{
> -	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> -	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> -	xe_gt_assert(gt, gt->sriov.vf.self_config.lmem_size);
> -
> -	return gt->sriov.vf.self_config.lmem_size;
> -}
> -
> -/**
> - * xe_gt_sriov_vf_ggtt - VF GGTT configuration.
> - * @gt: the &xe_gt
> - *
> - * This function is for VF use only.
> - *
> - * Return: size of the GGTT assigned to VF.
> - */
> -u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt)
> -{
> -	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> -	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> -	xe_gt_assert(gt, gt->sriov.vf.self_config.ggtt_size);
> -
> -	return gt->sriov.vf.self_config.ggtt_size;
> -}
> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> +	u16 val;
>  
> -/**
> - * xe_gt_sriov_vf_ggtt_base - VF GGTT base offset.
> - * @gt: the &xe_gt
> - *
> - * This function is for VF use only.
> - *
> - * Return: base offset of the GGTT assigned to VF.
> - */
> -u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt)
> -{
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> -	xe_gt_assert(gt, gt->sriov.vf.self_config.ggtt_size);
> -
> -	return gt->sriov.vf.self_config.ggtt_base;
> -}
>  
> -/**
> - * xe_gt_sriov_vf_ggtt_shift - Return shift in GGTT range due to VF migration
> - * @gt: the &xe_gt struct instance
> - *
> - * This function is for VF use only.
> - *
> - * Return: The shift value; could be negative
> - */
> -s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt)
> -{
> -	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> +	xe_gt_assert(gt, config->num_ctxs);
> +	val = config->num_ctxs;
>  
> -	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> -	xe_gt_assert(gt, xe_gt_is_main_type(gt));
> -
> -	return config->ggtt_shift;
> +	return val;
>  }
>  
>  static int relay_action_handshake(struct xe_gt *gt, u32 *major, u32 *minor)
> @@ -1057,6 +1019,8 @@ void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
>   */
>  void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
>  {
> +	struct xe_tile_sriov_vf_selfconfig *tconfig =
> +		&gt_to_tile(gt)->sriov.vf.self_config;
>  	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>  	struct xe_device *xe = gt_to_xe(gt);
>  	char buf[10];
> @@ -1064,17 +1028,15 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  
>  	drm_printf(p, "GGTT range:\t%#llx-%#llx\n",
> -		   config->ggtt_base,
> -		   config->ggtt_base + config->ggtt_size - 1);
> -
> -	string_get_size(config->ggtt_size, 1, STRING_UNITS_2, buf, sizeof(buf));
> -	drm_printf(p, "GGTT size:\t%llu (%s)\n", config->ggtt_size, buf);
> +		   tconfig->ggtt_base,
> +		   tconfig->ggtt_base + tconfig->ggtt_size - 1);
>  
> -	drm_printf(p, "GGTT shift on last restore:\t%lld\n", config->ggtt_shift);
> +	string_get_size(tconfig->ggtt_size, 1, STRING_UNITS_2, buf, sizeof(buf));
> +	drm_printf(p, "GGTT size:\t%llu (%s)\n", tconfig->ggtt_size, buf);
>  
>  	if (IS_DGFX(xe) && xe_gt_is_main_type(gt)) {
> -		string_get_size(config->lmem_size, 1, STRING_UNITS_2, buf, sizeof(buf));
> -		drm_printf(p, "LMEM size:\t%llu (%s)\n", config->lmem_size, buf);
> +		string_get_size(tconfig->lmem_size, 1, STRING_UNITS_2, buf, sizeof(buf));
> +		drm_printf(p, "LMEM size:\t%llu (%s)\n", tconfig->lmem_size, buf);
>  	}
>  
>  	drm_printf(p, "GuC contexts:\t%u\n", config->num_ctxs);
> @@ -1161,21 +1123,16 @@ static size_t post_migration_scratch_size(struct xe_device *xe)
>  static int vf_post_migration_fixups(struct xe_gt *gt)
>  {
>  	void *buf = gt->sriov.vf.migration.scratch;
> -	s64 shift;
>  	int err;
>  
> -	err = xe_gt_sriov_vf_query_config(gt);
> +	err = xe_gt_sriov_vf_query_config(gt, true);
>  	if (err)
>  		return err;
>  
> -	shift = xe_gt_sriov_vf_ggtt_shift(gt);
> -	if (shift) {
> -		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
> -		xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
> -		err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
> -		if (err)
> -			return err;
> -	}
> +	xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
> +	err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
> +	if (err)
> +		return err;
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index 0adebf8aa419..47ed8d513571 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -18,7 +18,7 @@ int xe_gt_sriov_vf_bootstrap(struct xe_gt *gt);
>  void xe_gt_sriov_vf_guc_versions(struct xe_gt *gt,
>  				 struct xe_uc_fw_version *wanted,
>  				 struct xe_uc_fw_version *found);
> -int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
> +int xe_gt_sriov_vf_query_config(struct xe_gt *gt, bool recovery);
>  int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>  int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>  void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
> @@ -29,9 +29,6 @@ bool xe_gt_sriov_vf_recovery_pending(struct xe_gt *gt);
>  u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>  u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
> -u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt);
> -u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt);
> -s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt);
>  
>  u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
>  void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index e753646debc4..1796d4caf62f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -6,6 +6,7 @@
>  #ifndef _XE_GT_SRIOV_VF_TYPES_H_
>  #define _XE_GT_SRIOV_VF_TYPES_H_
>  
> +#include <linux/rwsem.h>
>  #include <linux/types.h>
>  #include <linux/workqueue.h>
>  #include "xe_uc_fw_types.h"
> @@ -14,12 +15,6 @@
>   * struct xe_gt_sriov_vf_selfconfig - VF configuration data.
>   */
>  struct xe_gt_sriov_vf_selfconfig {
> -	/** @ggtt_base: assigned base offset of the GGTT region. */
> -	u64 ggtt_base;
> -	/** @ggtt_size: assigned size of the GGTT region. */
> -	u64 ggtt_size;
> -	/** @ggtt_shift: difference in ggtt_base on last migration */
> -	s64 ggtt_shift;
>  	/** @lmem_size: assigned size of the LMEM. */
>  	u64 lmem_size;
>  	/** @num_ctxs: assigned number of GuC submission context IDs. */
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index d5adbbb013ec..c016a11b6ab1 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -713,7 +713,7 @@ static int vf_guc_init_noalloc(struct xe_guc *guc)
>  	if (err)
>  		return err;
>  
> -	err = xe_gt_sriov_vf_query_config(gt);
> +	err = xe_gt_sriov_vf_query_config(gt, false);
>  	if (err)
>  		return err;
>  
> diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> index f221dbed16f0..074981e2ef07 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> @@ -9,7 +9,6 @@
>  
>  #include "xe_assert.h"
>  #include "xe_ggtt.h"
> -#include "xe_gt_sriov_vf.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_printk.h"
>  #include "xe_tile_sriov_vf.h"
> @@ -40,10 +39,10 @@ static int vf_init_ggtt_balloons(struct xe_tile *tile)
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile)
> +static int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile)
>  {
> -	u64 ggtt_base = xe_gt_sriov_vf_ggtt_base(tile->primary_gt);
> -	u64 ggtt_size = xe_gt_sriov_vf_ggtt(tile->primary_gt);
> +	u64 ggtt_base = tile->sriov.vf.self_config.ggtt_base;
> +	u64 ggtt_size = tile->sriov.vf.self_config.ggtt_size;
>  	struct xe_device *xe = tile_to_xe(tile);
>  	u64 wopcm = xe_wopcm_size(xe);
>  	u64 start, end;
> @@ -244,11 +243,30 @@ void xe_tile_sriov_vf_fixup_ggtt_nodes(struct xe_tile *tile, s64 shift)

what about naming style to use _locked suffix in function name if it expects to be already protected ?
>  {
>  	struct xe_ggtt *ggtt = tile->mem.ggtt;
>  
> -	mutex_lock(&ggtt->lock);
> +	lockdep_assert_held(&ggtt->lock);
>  
>  	xe_tile_sriov_vf_deballoon_ggtt_locked(tile);
>  	xe_ggtt_shift_nodes_locked(ggtt, shift);
>  	xe_tile_sriov_vf_balloon_ggtt_locked(tile);
> +}
>  
> -	mutex_unlock(&ggtt->lock);
> +/**
> + * xe_tile_sriov_vf_lmem - VF LMEM configuration.
> + * @tile: the &xe_tile
> + *
> + * This function is for VF use only.
> + *
> + * Return: size of the LMEM assigned to VF.
> + */
> +u64 xe_tile_sriov_vf_lmem(struct xe_tile *tile)
> +{
> +	struct xe_tile_sriov_vf_selfconfig *config = &tile->sriov.vf.self_config;
> +	u64 val;
> +
> +	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> +
> +	xe_tile_assert(tile, config->lmem_size);
> +	val = config->lmem_size;
> +
> +	return val;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> index 93eb043171e8..54e7f2a5c4e4 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> @@ -11,8 +11,8 @@
>  struct xe_tile;
>  
>  int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile);
> -int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile);
>  void xe_tile_sriov_vf_deballoon_ggtt_locked(struct xe_tile *tile);
>  void xe_tile_sriov_vf_fixup_ggtt_nodes(struct xe_tile *tile, s64 shift);
> +u64 xe_tile_sriov_vf_lmem(struct xe_tile *tile);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h
> new file mode 100644
> index 000000000000..140717f81d8f
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_TILE_SRIOV_VF_TYPES_H_
> +#define _XE_TILE_SRIOV_VF_TYPES_H_
> +
> +#include <linux/mutex.h>
> +
> +/**
> + * struct xe_tile_sriov_vf_selfconfig - VF configuration data.
> + */
> +struct xe_tile_sriov_vf_selfconfig {
> +	/** @ggtt_base: assigned base offset of the GGTT region. */
> +	u64 ggtt_base;
> +	/** @ggtt_size: assigned size of the GGTT region. */
> +	u64 ggtt_size;
> +	/** @lmem_size: assigned size of the LMEM. */
> +	u64 lmem_size;
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index 7adfccf68e4c..70bcbb188867 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
> @@ -17,10 +17,10 @@
>  #include "xe_device.h"
>  #include "xe_force_wake.h"
>  #include "xe_gt_mcr.h"
> -#include "xe_gt_sriov_vf.h"
>  #include "xe_mmio.h"
>  #include "xe_module.h"
>  #include "xe_sriov.h"
> +#include "xe_tile_sriov_vf.h"
>  #include "xe_ttm_vram_mgr.h"
>  #include "xe_vram.h"
>  #include "xe_vram_types.h"
> @@ -238,9 +238,9 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
>  		offset = 0;
>  		for_each_tile(t, xe, id)
>  			for_each_if(t->id < tile->id)
> -				offset += xe_gt_sriov_vf_lmem(t->primary_gt);
> +				offset += xe_tile_sriov_vf_lmem(t);
>  
> -		*tile_size = xe_gt_sriov_vf_lmem(gt);
> +		*tile_size = xe_tile_sriov_vf_lmem(tile);
>  		*vram_size = *tile_size;
>  		*tile_offset = offset;
>  

