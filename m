Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 225D8D26D6F
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 16:50:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D72C110E78E;
	Fri,  9 Jan 2026 16:50:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FMCvARa2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D3810E78E
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 16:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767977412; x=1799513412;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=cv/hA8v8YHb6XD2GzVBp2oSSPRw/8Y/ziCtD9BWG0QQ=;
 b=FMCvARa26M0Lc+vjuVwZQ1j+1NblYTXdAXkLi1HnCMd1egQFa36gxBvt
 YxJ1/qHUROmn4GlvHvEnU61JAgQuGlSDFEmXFBQ2R/aeRJfR91bVMGHgK
 288rOnd4QI9D4jpS3FvomeVbgXK/PwBPKdKFKYczHBiSnnw+Dd2o5slPz
 NyQEtyQ5Scmz2JYL4pM7CgaIrg+i8CkkjG7f1zYHMBTaYpcfb7Y2vUfMO
 +84q1hXQ5o32Be6ZeOFC/Zp5V4dB5PqVZhDdb16L4/oGV/SWhopdKOxqr
 xmDQ80S8ExH8B+A0LQI1qlL3QnDgPJlN2D4RBixMxu6B5GlHtCoSQcQTn g==;
X-CSE-ConnectionGUID: 70qfJmI2Qxejk1NIdyqIOw==
X-CSE-MsgGUID: HezqFrUGTFOn7zRTslKvSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="72994044"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="72994044"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 08:50:08 -0800
X-CSE-ConnectionGUID: MX7JlVHJSbi6iobg6Z28Ow==
X-CSE-MsgGUID: 984cWKMpQtyKO6ARifstrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="203522094"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 08:50:07 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 08:50:06 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 08:50:06 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.70) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 08:50:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NXucCKAmyA/xsbcGw2o0NmKJ8L4L0xmICSKDVg3sxgZ8KXZHdJFgkED25d9pF0afQC011pSESPl8GBVOASYGKc/UjCtJtFuMABce0pik6BT41lKx8cD+G5dugzyhwbhLc/rkfT5AbhkEWsIgcPWLEQbbo9XZFS/N7JCUhCzby2ZKTnl63ZPytjheta3O1SjA4kxcfsafDYeaewxWW+NCdP2JzyNaYPrSp0BUykR4LYWpNoruHF3S/vfKLfrznd9wbGIlO1DY2p0HhjpVQQ+P4K6lZWYU5+2/M2XRE288K0ZkqgD+2Hmlkq4zUqHYqDj7oqiE9HpAFe0Z8yFkTe5rdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j9RX+42oqlIkGevLTKVLF/K7eZCjNlAQZW6jzvmgH9g=;
 b=Js90as++O8gEedINSVkuwgQFTV6lEtIluirruYJWuZB9MP2XMOg1IzUMQ7f5VNrCyaYqzvwFZWFa3Zk0hI3dohmBpFk8KO9LaptX/x9JOR+3GC2stmi7Fa3gGr21oSKOGW1jmhvRP5HvZmhaGNEE40L7aqKPdeAXqJIXqh3aL5TbT6/daOk2AmGq7JZTSyr2C0X6IbJ73MZFaGY9qm7xIWiExMzXWKPx8ZShmtWvs6/FiUOj6qzklll4GUbyASh400YThZMzJzeIE5rsv00HMj/SE8U3qRTTxwdQF31z7PFhmZAujUi9F3J6gEWZYUp/N8Q9MtgsT2yIX523vmUt7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by MW6PR11MB8412.namprd11.prod.outlook.com (2603:10b6:303:23a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 16:50:03 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca%6]) with mapi id 15.20.9499.004; Fri, 9 Jan 2026
 16:50:03 +0000
Message-ID: <eeafeb5b-d09b-4781-97a2-d5d797d65649@intel.com>
Date: Fri, 9 Jan 2026 17:49:59 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] drm/xe/mert: Minor improvements to MERT code
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260109151219.26206-1-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260109151219.26206-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR08CA0243.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::16) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|MW6PR11MB8412:EE_
X-MS-Office365-Filtering-Correlation-Id: 7507375b-595b-4e18-b131-08de4f9f22ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MUlFUUJUczA4Qlpya3p1MXYra0RRM0JpRE82eXhWTmEzbElCcmRnL1pjYkd1?=
 =?utf-8?B?K0d1MUxFNkoyUDBWeUFRcU9vdE9KWmJRbjM1Z2xkZmhZV3Z3WGEwWVU0aEdP?=
 =?utf-8?B?d2pmZkFNRXczQVZEdzJHSUZvWVFkUXczMk1wTlZGNFd1bS84UnRhRGpTT1pt?=
 =?utf-8?B?K0ZFMCszSm03akZPTFlPdkNKb3RGUUQ0R0JsRmdRaWVscFVZSXNBYit4OUEx?=
 =?utf-8?B?MndqS1I4UDZ5Rnh5QS9QVytaZmU5NFowN1VRUUhiVGxMcEtWS1lvVEFWLzY3?=
 =?utf-8?B?MEJWTDVXaEQrNUJJMytiVU5LRG9WMVRGeUp5elBEeWFIb1A1RVlMaXdkcmc0?=
 =?utf-8?B?THg3T3JSVSs5TUQ4VTdldUlPQXNuM2xBTmVFcG9GRENDWXJsUlJXTlYrM2VN?=
 =?utf-8?B?V1R6dSszQU5OT3g2YTV4eW9ZWjJFZ0tmOHl6aUMxS2w4c1JlamZxdnBWeVR4?=
 =?utf-8?B?NVFsd2pNa2JmTS9lRnBVSWRrOEJuakwxM1pCVFVQQmRSQnZYUUFlcm9zVUVq?=
 =?utf-8?B?c21QT2lLbFBJNEN0RlUwNndRVXB4UWhlTDNWNExEcXJ6bTRkUUEwNDNTZ1Rm?=
 =?utf-8?B?ckVYV1FSY0xlN1VuQ25BTWR4MU1Tb1J5THowSHNNZ3pRd2pFdmxFTjNEQ0tF?=
 =?utf-8?B?UjQ4M2doTEkxRE8yNFJ5eDcxWTdqQ2NzTW9qQWkxa3UrUXJzMCtHV3NSa29m?=
 =?utf-8?B?aTdNR2kxMnV0UmRwaThva0R6R1B3V29xOGZKRFV6eXNSZDN1U21hdHdTUW5j?=
 =?utf-8?B?VVNxbDdjdEtQVC9ka2dBN2FCby81ejdOTFJqZEVzZkcxZzNLbFpMZkRqL2NH?=
 =?utf-8?B?VWdLMVR6WlZzaXFndkswT0VwLzNNbG9CTGltRytsTFZxUGRWRGIyUkYvRlBq?=
 =?utf-8?B?R3gvRG0wb2hudW1uYkhJdEQ4Sm43a0NBbkhzZElqQ29NdDNEKzRKV0IwZHZu?=
 =?utf-8?B?M1VHWjEzQ2h2M1k1cUxld1NSdXNJWkRPbGNmNWJMTWYwaC8rWXc5amJ3R0Nq?=
 =?utf-8?B?OE5vTGxwUGE1S0VIY2cvcXZHaXJ4dmZYWi9xQ3JqWmdSMk1pWnRnUDE0cU14?=
 =?utf-8?B?L1pMb2pUVW50Z3dvS1ZpWW5hZkRhV2J3dW9POU9wMTZPSVZObGlQZWlvQXlS?=
 =?utf-8?B?ZXp4NFoyRW5FeVN4ZjdXQ0thb0tCTXZ3N09hb2pnUGJiTi9yRC8zendDeUZj?=
 =?utf-8?B?ZkpKOVVIQlJzeHBLSWhsR1JFOXBXR1NveUFBWmZlODlYTWdFVnRlSDdHUVVj?=
 =?utf-8?B?ME1KZTVnTlBjWlJxT0NNMGYxQ2tPQXJJZzJSTnR0c0pCSVBYaGR0NzdLd0pa?=
 =?utf-8?B?azErQmtCUjdRSEhnVXZVOFlBTnA3OHFmM0gzTzlBNW00QjlmSHlKMk0vb3FM?=
 =?utf-8?B?N25CRXh6cWI4czM4WnVhRnViSUMyYUlySFhMbVo5blN2TGJXMXhyZWtBakN1?=
 =?utf-8?B?Vm9xaUF2TEcxVTZ0QzlzZEJtME52U2w5aEZ0Mi93ZndEa1dTMkw1Mmp6VktM?=
 =?utf-8?B?bGlQVDRSb05PQjJYdFlaWXozUFp4RW1FKzdtZ29DNTNCWE1FNVpucDBNVGFR?=
 =?utf-8?B?RXBHaHlpZ2FMQkpabS9YVGVYazFVQ0E4WnBteWVDOFJGemxDV2NOTWdPeDln?=
 =?utf-8?B?bFlpdTJvSWRDMXFMUWNmTVA5eExvQlRUQVMxZnp6TjArd3E3ckJldDQrYUVk?=
 =?utf-8?B?YUtMaE50ai9kMW5TekZPZXFWTlBxOU10M0RYUHZQaW81T3dhUDBmYVBpdm1T?=
 =?utf-8?B?Z0JURlNoNFNpWUQzY0JNdzk1Rm8vWUNMREtYTnFDWEZKRU55YUpLTHdBaFUr?=
 =?utf-8?B?TzUrbHFvZitrWmZQdVkvUmRhU1JIWjBFR0lLcE5nTkxxK0x5aUVQS2pGUkRn?=
 =?utf-8?B?L3ltcmFMcnlIQmJCMWZNUit1dG9TcEl3ZzVkWWFyRnpKK2NBWTNvWVVVYXJh?=
 =?utf-8?Q?MYvkLb03f9upVwT6XHSIJsB83mvu2Hw1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eU1lTTl1bDNQb0NNNmY0MitRV05vclBJYTFPMjRiV21HOENWYXJjeHZIeVVj?=
 =?utf-8?B?d0FBMStkMm5SWERwVVlKZ09yWlY3RTRncngxK1luVGdHbjl2bEdxUWZ5cnRa?=
 =?utf-8?B?U1dRNEtHNlBPWTlxbm5Fc2FTZm9PVEl4K2xHUk5uVXM1bTNBYW90U3ZkNmtU?=
 =?utf-8?B?TXJSeDFHdkRYMEFGbHY5WjZ4VGk5djBZaWNra2xiTzRTcXVkZExkS0o5eGNH?=
 =?utf-8?B?SEQ3Mm1nUHNqQUorOSszeDJoZldYVnU1SXVsR0kwZXdNenJHSTFiSGNOdURF?=
 =?utf-8?B?M2RiNFphVTJJdkxPSDZrcGZZMUxzWXdlend1R1lENldlTFRWWXVIV0tiV0NL?=
 =?utf-8?B?bXB3bjZMTzdYc3lzdjJiNjhSaGkzV3VNU0swZ3dtWmhzZ01EdXY0UUh1dnBM?=
 =?utf-8?B?V2dVT3NaQXVPYUd6cDVmcExlVG43TFNjN1Ryd3VISS85U1hVcTR0VE9lb0Y3?=
 =?utf-8?B?aStPaUFQeFlseTNoOEREZEtCczFxRWE1ZGhyamJBNitMTENDVEltQmVTYXdZ?=
 =?utf-8?B?SmJVajFONjFxeUtpTVFKMEJGUCsxZm1SWGpsZ0tUNHN0N093ZkNEaStvM3N4?=
 =?utf-8?B?MSs0dFdzR2Q2ZnhWZXF1SzhwYk53RlBBdnZKWERhNHVRd25nbUxzWTdMNVZt?=
 =?utf-8?B?QnBUL2RWNmNPcy9xdVpONm92RkRWU1QrSUFEazBuN2lnekJiWWRBamZ2bUIz?=
 =?utf-8?B?d2dPWEFsWUNvdVFIL213eU9rSXd0eXhGTzhCWnUrWHMxWWNPdVVPdEgveGxS?=
 =?utf-8?B?Qk1NODFrL3lPWG1TKzdteDVNZUlxbXlRV2cxMUFYQldPNW5XOGlLc0Znbyt0?=
 =?utf-8?B?YUU1NVdTN0ZiemVxZ2lrWkEwTUFSREhtOE9UWjBJVWtaZnBiTkZWT1RhQlRy?=
 =?utf-8?B?WGRobUtwNCtCd1NyODNRQWpGV0c4aTZRRjVIdWJlUjlhczZHb3l6aWw5Q2Ix?=
 =?utf-8?B?SEtseE5MK21LR2xuT3VmaE15S3FoQUJSS2FqaUxoS0M0WWlyMGc1SkRIVUFY?=
 =?utf-8?B?OUkyelp1aHZ5Rkwvb2dRWnBTeXZpTVFVR09LVGlURldnY3h5WlllemlLRU1I?=
 =?utf-8?B?SXZNSDlvTCtLSHB0U0FYVWxvQkljK3BMYU90cDA3MUlJVUdXQkhWSGI1QzVQ?=
 =?utf-8?B?aGxQZ3Bwck1sQkNXM3diT1FiYjNBQitIRUVad3FnUkUrVWNxYko4K3VJQ3Aw?=
 =?utf-8?B?VkVSRjN5dmdkZXZwRjRYV3NlWkFId1UxRHhUN2xiUFIrUnRsR1pRNmtCNU50?=
 =?utf-8?B?TytTRDVXK2VuaysvUHJBTm9QSkRUUVNDSXdMTW5OMVR2T0FJa051T01DQ0pB?=
 =?utf-8?B?NW5ZbVJNSnRhOFRBSnFUekZ6STlTOXc2QUxXR0ExcjJSS0EwUXc0MW5KU01U?=
 =?utf-8?B?Zm8yTkNvNitXNDhIVC9LWkVISmlrNWs5am4veFk0Wm5RMWtIR0NLNFZYcmlj?=
 =?utf-8?B?Q3RHN0EzRUFCM0tHWS9SL3ByTm8yOUg4MzBzTVFJZTNkVHBvV2gzVmhKaTl5?=
 =?utf-8?B?N0Rkd2EzRVN0UXNkaGlUWXZhTENyWUdKSmJVWklteWJzMCtZeGZaaW5YbnBB?=
 =?utf-8?B?N2tTaTY5VlJ5Y2xidjQxcURoaGdOVjBnV2VBRi9oRU9MRUhEY1hzemxMNXF0?=
 =?utf-8?B?T3M5SjQ0MGFZZStWeDZzb1ZPUzQ4NVFia3I0N3FPWVVPYkk0clRzVHFZbWtq?=
 =?utf-8?B?M2srQlJiSlBzcDZET2V1UGhiZ0wxSGZKSzMrRzFHbmdXb2l3RnZlczhJQTlk?=
 =?utf-8?B?ZzIxUWg5ckk2NjVCMWU1NzJTeEV0ZGxsTmx0MGgyM3ZnYXJ6K0ZyWDFNQ2Fu?=
 =?utf-8?B?ZVE2TjZUQ1pEVWl6cWc3aG5XNDVWYklVNk1oVFdROWUydEJaMlhnRGtaY1Jz?=
 =?utf-8?B?MHExYkZ4aXRBQ1I3NjdIOFZUWEtKQzhJREw5WWNpVlptRTE4NjVKakhRSmxO?=
 =?utf-8?B?aDZDK3hqTU5ESWpteWZrdVQ4dnlsbEpvS1VpeElqVm40cW5hVzNQcHkxd0hI?=
 =?utf-8?B?cndEYUxxNkxESEtjL21UWUkwMXo5dnhLRU9DdjJBZUVsVHpadFVpdWFCaTdU?=
 =?utf-8?B?MmFVbEt4SkpYaVJIRnlVY1B6MU1pRnhhS2piRVRwOTQ3cFY2Mzgvak5sVzJK?=
 =?utf-8?B?R2NnRkk2N3ZLbWVyc0xzcWMwRUZIU0ZZV3laNjg3dU9Fa1NqR2U0cUFtdU5Z?=
 =?utf-8?B?TkF1Rys3bU15Q1prMlBCSnRwOFNGaE5LUGV1NW9MdzdYVkRGNkNmWCtFQzRl?=
 =?utf-8?B?cCtleitxUEdwWkZuRTFzRFRsOGxLODRwQUpkREhiTkk5d0xDeFVhRmRpWlZI?=
 =?utf-8?B?dVRTUUpwUk5wN3lreWI0RDJ5UkQ0cFNwcXpGc3hTVVJOVTNoZGdwUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7507375b-595b-4e18-b131-08de4f9f22ab
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 16:50:03.5560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NmR77ja9cbJSh2OMPeTrj/ilm9MCLeZ0FdNb2FdyFchlmzuUZH45+mZTn1s89Vg0HnFeahmevvxeEbp8eyg4tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8412
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


As you are making MERT code improvements, could you consider changing 
the log level of the message below on the occasion?

     drm_dbg(&xe->drm, "MERT catastrophic error: Unexpected fault 
(0x%x)\n", err);

This error is not expected and may indicate a hardware issue, so it 
seems to be more appropriate to log it as a warning or error rather than 
using dbg.

Thanks,
Lukasz

On 1/9/2026 16:12, Michal Wajdeczko wrote:
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>
> Michal Wajdeczko (5):
>    drm/xe/mert: Normalize xe_mert.h include guards
>    drm/xe/mert: Fix kernel-doc for struct xe_mert
>    drm/xe/mert: Always refer to MERT using xe_device
>    drm/xe/mert: Use local mert variable to simplify the code
>    drm/xe/mert: Move MERT initialization to xe_mert.c
>
>   drivers/gpu/drm/xe/xe_lmtt.c     |  2 +-
>   drivers/gpu/drm/xe/xe_mert.c     | 32 +++++++++++++++++++++++---------
>   drivers/gpu/drm/xe/xe_mert.h     | 15 +++++++++------
>   drivers/gpu/drm/xe/xe_sriov_pf.c |  4 +---
>   4 files changed, 34 insertions(+), 19 deletions(-)
>
