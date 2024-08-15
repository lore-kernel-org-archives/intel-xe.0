Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88320C52D7F
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 20:44:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4645210E54B;
	Thu, 15 Aug 2024 20:44:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="McGmBuSx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 332C810E54B
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Aug 2024 20:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723754668; x=1755290668;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0q3mQYIWyNbDBw3/9gAVSb2Fh/TowHfOlGgy8ANUAqI=;
 b=McGmBuSxnaYRwNvmn2ocRnkQPgA5ZpcyB7R4lULikhtp8k18l9wQZ5Oi
 4rcYVhl9mdgk9m8Q+TSGZfytKkGzRKyyT+5e76DQZIqdL1MQ+iyK4WXoN
 SHhSFOCAgC5HCTBZ2/b20jJpv50tCfHMKUNcaCpYIUERwoqfb/oHzjwgz
 +kU5Pg9IhTx7JhO+ua2GwbbJ6L1rUs7fuPaFk7MXR8ooGZLQxZqlGpomG
 kY0sJAzTixICHRVHIxTtoT8ULqMauFP2UE6xzVEBWPrYavVeGAsesopzf
 tI2BQZNCbGar1l5L2m9FDhASvietIcgUyKK7h5ouhdmRshDG1kwwtw25R Q==;
X-CSE-ConnectionGUID: yVVpUGpETGiEL5VAm5U/gQ==
X-CSE-MsgGUID: D4KsvG88Q5+Llqbx6Rf4nA==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="33446569"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="33446569"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 13:44:28 -0700
X-CSE-ConnectionGUID: Q3XiTZPjS4KE9cdxRt7zQw==
X-CSE-MsgGUID: Jf4t/43NRje+9srRMXNGdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="59429364"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 13:44:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 13:44:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 13:44:27 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 13:44:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fOhdIPdSCLUTtVSo2rE/U75SeAM33H3+sS1pqoqEk+f3o7YgEMCL/cfoAfmfySGAoggr79wyptKJe4MfQPcVT7bts25WMI3/CBHygZQTrGFXE7Z+5u6BeGeG9UfDLE+TMj4qAK9rGLDkKAramK/kxS0nnLogA0eM7d2Ftj2uuDTon8hZc1VPNeGVGbGrSEAU86pwxjt2yjlK81Cp2J1ygpuohxTw4DEf30moLp8iBon3Dlxch7cHj5lu/C+u6Bacy9+1GigbpN7lxUxYMidVcRj5cGHbaG2asiZq2yAVnpl8/FMdpcpS71k4ZgyddRmol4CvnF+i02IS0J2gMIuq3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pkFkcjVVmU/OQViaDezpuuODUQCKv391V/Yy9hukJ/c=;
 b=o6MLOzHo3NhXQiOvEnMg502BH9f/AQ+9Boef5yKD9qWjTep+wB8w9ZnF2Yjt+PG7uMzqkJCHrlza0eCQwuscWrKpEiPJ5Mc7D7V+eHQFLR099Gk4szhwv/YwmHabw24Bx7EO3AqOtwk00uAI7u7epEfX0KaKWvpRICVEoCGGWvo5UyFKIzHxSnxKITun+JoN9xAcLbHsYNyKJH5LfAXY/76B0RheGUxq8XCPTjOyVhIzaaGPzrGH8+YCqOxMqQz5vdlKH7oO6EMIUh9ctCicWTocxXlp3HvxDcV5j64HTynxJxxkyN4uk/DaqrNfIzuR4pdF4Zi0mqdQ1x+XnuULCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DS0PR11MB6544.namprd11.prod.outlook.com (2603:10b6:8:d0::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.19; Thu, 15 Aug 2024 20:44:25 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 20:44:24 +0000
Message-ID: <676abc4b-f557-46da-8dc4-8e71eac57673@intel.com>
Date: Thu, 15 Aug 2024 13:44:22 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe/uc: Use managed bo for HuC and GSC objects
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, John Harrison
 <John.C.Harrison@intel.com>, Alan Previn <alan.previn.teres.alexis@intel.com>
References: <20240809231237.1503796-1-daniele.ceraolospurio@intel.com>
 <20240809231237.1503796-3-daniele.ceraolospurio@intel.com>
 <ari3brrrs5gfzoudcp6lsmf5kcl7cnzvrf7tsssqeg3s2e36sb@4bnlvwdkqry4>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <ari3brrrs5gfzoudcp6lsmf5kcl7cnzvrf7tsssqeg3s2e36sb@4bnlvwdkqry4>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0221.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::16) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DS0PR11MB6544:EE_
X-MS-Office365-Filtering-Correlation-Id: a26276a3-fc52-498f-19a9-08dcbd6b0c60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WmkranRGSlVxenkvRVZQb2t2NDZzTnZlckdhKzFmV0N1SlBiOG1XOVpHQnpQ?=
 =?utf-8?B?TUFoMXBzejdyY1llc0dnNzVVV3p5VXI2RUZ1dHN3aDVmMThmVUhFeUhBbDRi?=
 =?utf-8?B?ellHNHNuSVN5TU1DNGp5U0tWdHRtZnJYRWp4MGhJYkNpYlg1NlhKMm5ZdVBi?=
 =?utf-8?B?bEprN0x0c0RBTmJ0MXVBTE5RZkkzS2lPN3kvMjhkdDc5R2RjUDdNR1JCUDNk?=
 =?utf-8?B?cUNzcEhwbXlmcXJQVC9zN0kyTlR2Z1h1bW1TQ3FlTlJXcG40UXhnM2JiS0Zy?=
 =?utf-8?B?bW5CdndBdlVGcHptQUNUZWZuUjNaQW5CZE9OaHNLVEVXb2E5QWY3Rkk2SnBM?=
 =?utf-8?B?VlF0UGJJRHdJRkJRRFdtZjFIMGlaTDlHUjQ4RkZmV1dNdFZuWE9TMDVaUnp0?=
 =?utf-8?B?SE0rMVpPYjlBMk5MeU9OUGxyR1JsWXY4cXhZNDcxRXZKVUxwbGQvMDZ0Tmhn?=
 =?utf-8?B?dHlDblF0VUI2Y21hTXl5REdkcWpoOHo1RTYxUmtQUkl4WStFeVlrSGFLUUJZ?=
 =?utf-8?B?a3FsMm5RVWlieGtGOE4xTk9ydU9GQWw2ZE5UTzZvRlRHYm94b0dlQy83R1ky?=
 =?utf-8?B?OUovWm14MUIreVU2WTh4MEx1SEYyblpMRk8wcWNMTk9qU2FpdEI2RnA0V1d2?=
 =?utf-8?B?QzRXUWI3bjhiRHYvY2owTDkvaFZteWFYRWlHeGxXSW5OYmluRWJGY2Z0M1o4?=
 =?utf-8?B?TWtoQUpaR2UyVHVScWlRaFJKR2h4UkI1c05NZFVlM1d5ZE50Mng1RWt4UFlJ?=
 =?utf-8?B?MnlRSTArRjZtazNKZVBvZGFtZDJSbEtpVGs2MU1BZGJJcFRJL1hBNkxFSkNH?=
 =?utf-8?B?enRKTTViYnZkZzY5ckpuNzYvWHVLRXR4YzJvVGN5WTdHWkF1Y3hBZ2RxVVNk?=
 =?utf-8?B?djJnNyt0aWtlT1BuUWtJZVkzMHVMWXhmb1VCSkF2cWZFWHlqVkVkVGs1bmF5?=
 =?utf-8?B?bm5IZldWNENRb3pNY1p2L0dzYWFtdElnQ1RvSXlLMDBWMHJuMXozWnNmeTln?=
 =?utf-8?B?bHRrYWNMZHlTTDdBdzJvRkxJU2tHQ2tUakRWVnVwcjdQWWhDck1vNjVTcW1x?=
 =?utf-8?B?amxHMCtDSEhhY1AreVoxNjQxK0pFdkRLWndWSzZUOFRXQXJJS01iZWdWWHo4?=
 =?utf-8?B?cWFKUmxZL25pS0NvOGpEUmhHL1M2aGdXUWVHRHl3aERid3FOSkxnVW5GeUZS?=
 =?utf-8?B?RW9vZWRULzlaVmh1bTJuNDRtMHhXRTA0R0szV1l6dUxaYy9uN2I4UmwvM2FY?=
 =?utf-8?B?K3kxb0V5a0pjSVFpdFVHNk5sayszWmUwWVNuZXZlRjlQWlZ2TnJnSE9kSmZE?=
 =?utf-8?B?UjJDVzRYbHhKcHdmdlZKbUZ6cHluMWd0TTc1ZU9RNDBIVndRMGM0dVY3UUpi?=
 =?utf-8?B?WkpyaUV2amVMdVR2MGh0SmFUSTVTVWpqN1o2b2xodFpZNWNMNjJYOGNsR3dR?=
 =?utf-8?B?R1pER0EwOFF6UEh2dEdLc1FObzFaSGMzaG5iMG8xZmtXYjVoU1lHQ28zRzhD?=
 =?utf-8?B?UFF3VnJpWWJtSnMzMC9sWVlZRnRVSkNQSXFHNWVDdWQwcWlEQTdtM3BWQVhB?=
 =?utf-8?B?OEpNbFJZMmVNbW5MM2NGZmxLMVN3TmNBbndjQzlFR3J2WVY3cFN4MFFTZG5x?=
 =?utf-8?B?OWF4aVdDM3JiSENwSmt5ckt4VXJFajk2bnBzdTJYK1ZBRkVmeXptblV5cVlN?=
 =?utf-8?B?Z2MwMGlBbS9Ja1dtNUtQRm5GOE9EK1RpZzZxU1lmRllyYTFHaGVHdnQ1SVh0?=
 =?utf-8?B?MDVVS0dGLzZnT0picVR0Yzd4Yk9UR2JMM3drb3BFekxlYmpxa3laVDhmTmdM?=
 =?utf-8?B?ZmhNK1ltTlVldHdsQ05wdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0t2eWhZb0J3RStna3RjTjNHSFlsTXBZNEwvdGtYV050bU96dCs1Umg0OVJX?=
 =?utf-8?B?N3F6ZlE1NDZSQUZMNzdUa0RCUWloY1NwWngvT0Z6TW5SNkY5Z3hpc1JoMFJ6?=
 =?utf-8?B?VHIwd21BODVmc3l3T1czdWF2d2pTSTFQNXExNFRxY1MyY2ZIbHJHamJEaTRX?=
 =?utf-8?B?ZlIwQ3g2VEI0bGM3N1N2amtwT1JjTjdPNHZ0UklrMHFJRmdJRU9yUkxKUHcr?=
 =?utf-8?B?UG05d2p2MWZkRmRldFByQ0NyVVBrbWdaOGtmTFgzQnBpU3hMQ0hneFNLM0RU?=
 =?utf-8?B?dnNEUEtmblQ4RStqU01BSVNKQXp4QmFpZVpENml1Y0hIRC9YVlVXMTVKbGky?=
 =?utf-8?B?NW9GWklyOWZBTkQwdmIybkZsZHlJQlJ0U0VPZFp5WlB4clFxTTlVNUk0K3h3?=
 =?utf-8?B?TU51VVR1K2hZbkU3TXJ0RmY1MkhNU2ZRWTM5eVo3MlJmaWhLdFVtQW5nbmVZ?=
 =?utf-8?B?ekhtS3p0Q3VCSkF0dWpzU3JScGJOL1M2a05HT2lBYjFSTHBTcWQ4QUxRS1di?=
 =?utf-8?B?NUNoOGZaU3BZaXV2UzByekxhVlFTL2YyYjllejZnYzIvSU1rMEZ5RFVlK0hP?=
 =?utf-8?B?OG5BUTRmWlptR0d0WlNsa1lKTEtGSXJBQTFEY2h1Zzl1cldxYkd6d3d3R2JP?=
 =?utf-8?B?dzNvYTYzemVnVjF1eVdZZ1hRdmhDRFRVNlRRV2hGRjFUa0RKaERDMzZwZ2Y2?=
 =?utf-8?B?bjBmM0hIaStwN0g2Q2NiN1ZBdURRSTM1NkRlU09TRU1ZdzduUUFYNHMveDhw?=
 =?utf-8?B?cjRnbG9Gakp3QmhtVG1SNEc0Wk1vWEdsa1ZNZ2xFNEhiRkJFTlhQbG1NZTVU?=
 =?utf-8?B?bnE3VVlPUUx6MnV0dnphbjVsRjMyM29KbGZjamd1eDh6Ny8yd0RITkdNb05U?=
 =?utf-8?B?c1NDUUpaQ2lieWNLZFJ6RXNONmVzSDR3ODRDbEhLZ0gwUU0zaUk1eGNsQnN5?=
 =?utf-8?B?eFB1Tlpra1I3WlRuUlZYak5oMkxqZlVDVThoSjVjY1ZnWnFzb2cxM0pobENo?=
 =?utf-8?B?d1hQQ1FUSEpRUkllbS90SzdvdHV6NXgwL1U2MkZBVTgxT0NrVUhwNk1pdUhl?=
 =?utf-8?B?NFVjVHNybzdqVlc3Z1FURTAyckZXTDBxR3llMHJsYVI1VkFubmo5Y2JHR0Ra?=
 =?utf-8?B?eFhsQkFXWmFMRXlvNzNLdVZreEk1YzVKUjBJYUhINGZDVnNubnowMzJXeGJ6?=
 =?utf-8?B?NVBYbkkrUkJoSm5RdVU5WU92bjFJMUxsVDlpbXphaVhLRy9QYUgySzF3Rk9B?=
 =?utf-8?B?cEcrNlRhaytrQlp1RVM1WVZKcTdvMzFESGhPMDF0T21MLy94UXlES1U0WDNP?=
 =?utf-8?B?Zm9mUEpvMTluQXNmdzFJZVoyOXZDczJNN2tjc2hKeWlrZlBFWjByOU9GYldn?=
 =?utf-8?B?NlVZU0g4NTc3c1N6MW9STkVuK2t1QkZ2ZGFkeTJTVGJoR3JzZFBMRHRrQmoy?=
 =?utf-8?B?MitWOU93ZEJITFBjTzFCMlFtMGxhMEJLanJVQ2k5Y3BCZ2lvVko3MHhMYjQ2?=
 =?utf-8?B?Mk1Qei9paXBYV0F6N2pWamZ6d3U5NTFXK1VUbWlrWkF5c09EMnpNa3RNSm9q?=
 =?utf-8?B?Mm42aERQakRxSlo0ZEdnVWdBRStmeURjMzhSR1NVOHBER3JURnJYOFZlMExn?=
 =?utf-8?B?ZlYwS0Fab2F3TTNzeTQwbDlIcTR2SklEeWVDb1FxTXJTc2dyRGMyZENNc1Vk?=
 =?utf-8?B?bVloS3F4ZEhaMXFKeXRTNHNkaTJWSTg2K2lnZmpMaFJjSTdyU0ZyR2wyeDFt?=
 =?utf-8?B?d1JHemNQOHNWU0xsQWdTdWIrSXZKbDBLT3p2TFkrNnJqa0VGNUFVazhLTXhT?=
 =?utf-8?B?TU0xbmFEQ3AwTUg4aitKVGZBMlZMWGFtaGwrdkh4dmJHWDU4OTlZMUlKMEc1?=
 =?utf-8?B?Zjd6OEV3L1lDODM0SnNuUmVoelNKYUk1VFYxcE8zTTF1amlwVk5VcUVQNHlL?=
 =?utf-8?B?akVML1ZPUXRZUy9lTitIaENZalIwaTJJZlZ2SEVwbk5LZTZ3SmxNbE83bjg3?=
 =?utf-8?B?UWxWbmtoUVVwbnRLZTBMK1JKQjF1NVVRaUhBYmFnVVFVa29TeFV5aDgwOUJL?=
 =?utf-8?B?aTdjbjdrOTZaVnN4NXFRNG10cnAzY1dLMmRYYnhDM2d0VzgyRGRQMDJGS0lu?=
 =?utf-8?B?RExmaklzdkw1RkVZMlRYVFVVR0l0dXdXckZuMGFPT3JVbEhKZUxZOWJxaGFV?=
 =?utf-8?Q?nh0P8HyfEhRArZLLdGkRmNg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a26276a3-fc52-498f-19a9-08dcbd6b0c60
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 20:44:24.7781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o5pZ6ncQ0y6CnACrv29BlK6ZQSFlwdGrvxu1hM3vG2wLuHNLpR7uRxIXH504lOd+3u8IXL6+ixLf/bZt5iIe3GUS8P5/CaeSAYuLEFovYog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6544
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



On 8/15/2024 1:00 PM, Lucas De Marchi wrote:
> On Fri, Aug 09, 2024 at 04:12:36PM GMT, Daniele Ceraolo Spurio wrote:
>> Drmm actions are not the right ones to clean up BOs and we should use
>> devm instead. However, we can also instead just allocate the objects
>> using the managed_bo function, which will internally register the
>> correct cleanup call and therefore allows us to simplify the code.
>>
>> While at it, switch to drmm_kzalloc for the GSC proxy allocation to
>> further simplify the cleanup.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_gsc.c       | 12 +++--------
>> drivers/gpu/drm/xe/xe_gsc_proxy.c | 36 ++++++-------------------------
>> drivers/gpu/drm/xe/xe_huc.c       | 19 +++++-----------
>> 3 files changed, 14 insertions(+), 53 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
>> index 66963e26c574..b84f2e020c8c 100644
>> --- a/drivers/gpu/drm/xe/xe_gsc.c
>> +++ b/drivers/gpu/drm/xe/xe_gsc.c
>> @@ -450,11 +450,6 @@ static void free_resources(struct drm_device 
>> *drm, void *arg)
>>         xe_exec_queue_put(gsc->q);
>>         gsc->q = NULL;
>>     }
>> -
>> -    if (gsc->private) {
>> -        xe_bo_unpin_map_no_vm(gsc->private);
>> -        gsc->private = NULL;
>> -    }
>> }
>>
>> int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc)
>> @@ -474,10 +469,9 @@ int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc)
>>     if (!hwe)
>>         return -ENODEV;
>>
>> -    bo = xe_bo_create_pin_map(xe, tile, NULL, SZ_4M,
>> -                  ttm_bo_type_kernel,
>> -                  XE_BO_FLAG_STOLEN |
>> -                  XE_BO_FLAG_GGTT);
>> +    bo = xe_managed_bo_create_pin_map(xe, tile, SZ_4M,
>> +                      XE_BO_FLAG_STOLEN |
>> +                      XE_BO_FLAG_GGTT);
>>     if (IS_ERR(bo))
>>         return PTR_ERR(bo);
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c 
>> b/drivers/gpu/drm/xe/xe_gsc_proxy.c
>> index aa812a2bc3ed..8f880c44211d 100644
>> --- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
>> +++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
>> @@ -376,27 +376,6 @@ static const struct component_ops 
>> xe_gsc_proxy_component_ops = {
>>     .unbind = xe_gsc_proxy_component_unbind,
>> };
>>
>> -static void proxy_channel_free(struct drm_device *drm, void *arg)
>> -{
>> -    struct xe_gsc *gsc = arg;
>> -
>> -    if (!gsc->proxy.bo)
>> -        return;
>> -
>> -    if (gsc->proxy.to_csme) {
>> -        kfree(gsc->proxy.to_csme);
>> -        gsc->proxy.to_csme = NULL;
>> -        gsc->proxy.from_csme = NULL;
>> -    }
>> -
>> -    if (gsc->proxy.bo) {
>> -        iosys_map_clear(&gsc->proxy.to_gsc);
>> -        iosys_map_clear(&gsc->proxy.from_gsc);
>
> clearing these was not important?

No. At cleanup time the proxy component has already been removed so 
we're not going to touch these pointers, so it is safe to not set them 
back to NULL. I had it the clears there just to make the  _free mirror 
the _alloc.

Daniele

>
> Lucas De Marchi
>
>> - xe_bo_unpin_map_no_vm(gsc->proxy.bo);
>> -        gsc->proxy.bo = NULL;
>> -    }
>> -}
>> -
>> static int proxy_channel_alloc(struct xe_gsc *gsc)
>> {
>>     struct xe_gt *gt = gsc_to_gt(gsc);
>> @@ -405,18 +384,15 @@ static int proxy_channel_alloc(struct xe_gsc *gsc)
>>     struct xe_bo *bo;
>>     void *csme;
>>
>> -    csme = kzalloc(GSC_PROXY_CHANNEL_SIZE, GFP_KERNEL);
>> +    csme = drmm_kzalloc(&xe->drm, GSC_PROXY_CHANNEL_SIZE, GFP_KERNEL);
>>     if (!csme)
>>         return -ENOMEM;
>>
>> -    bo = xe_bo_create_pin_map(xe, tile, NULL, GSC_PROXY_CHANNEL_SIZE,
>> -                  ttm_bo_type_kernel,
>> -                  XE_BO_FLAG_SYSTEM |
>> -                  XE_BO_FLAG_GGTT);
>> -    if (IS_ERR(bo)) {
>> -        kfree(csme);
>> +    bo = xe_managed_bo_create_pin_map(xe, tile, GSC_PROXY_CHANNEL_SIZE,
>> +                      XE_BO_FLAG_SYSTEM |
>> +                      XE_BO_FLAG_GGTT);
>> +    if (IS_ERR(bo))
>>         return PTR_ERR(bo);
>> -    }
>>
>>     gsc->proxy.bo = bo;
>>     gsc->proxy.to_gsc = IOSYS_MAP_INIT_OFFSET(&bo->vmap, 0);
>> @@ -424,7 +400,7 @@ static int proxy_channel_alloc(struct xe_gsc *gsc)
>>     gsc->proxy.to_csme = csme;
>>     gsc->proxy.from_csme = csme + GSC_PROXY_BUFFER_SIZE;
>>
>> -    return drmm_add_action_or_reset(&xe->drm, proxy_channel_free, gsc);
>> +    return 0;
>> }
>>
>> /**
>> diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
>> index bec4366e5513..f5459f97af23 100644
>> --- a/drivers/gpu/drm/xe/xe_huc.c
>> +++ b/drivers/gpu/drm/xe/xe_huc.c
>> @@ -43,14 +43,6 @@ huc_to_guc(struct xe_huc *huc)
>>     return &container_of(huc, struct xe_uc, huc)->guc;
>> }
>>
>> -static void free_gsc_pkt(struct drm_device *drm, void *arg)
>> -{
>> -    struct xe_huc *huc = arg;
>> -
>> -    xe_bo_unpin_map_no_vm(huc->gsc_pkt);
>> -    huc->gsc_pkt = NULL;
>> -}
>> -
>> #define PXP43_HUC_AUTH_INOUT_SIZE SZ_4K
>> static int huc_alloc_gsc_pkt(struct xe_huc *huc)
>> {
>> @@ -59,17 +51,16 @@ static int huc_alloc_gsc_pkt(struct xe_huc *huc)
>>     struct xe_bo *bo;
>>
>>     /* we use a single object for both input and output */
>> -    bo = xe_bo_create_pin_map(xe, gt_to_tile(gt), NULL,
>> -                  PXP43_HUC_AUTH_INOUT_SIZE * 2,
>> -                  ttm_bo_type_kernel,
>> -                  XE_BO_FLAG_SYSTEM |
>> -                  XE_BO_FLAG_GGTT);
>> +    bo = xe_managed_bo_create_pin_map(xe, gt_to_tile(gt),
>> +                      PXP43_HUC_AUTH_INOUT_SIZE * 2,
>> +                      XE_BO_FLAG_SYSTEM |
>> +                      XE_BO_FLAG_GGTT);
>>     if (IS_ERR(bo))
>>         return PTR_ERR(bo);
>>
>>     huc->gsc_pkt = bo;
>>
>> -    return drmm_add_action_or_reset(&xe->drm, free_gsc_pkt, huc);
>> +    return 0;
>> }
>>
>> int xe_huc_init(struct xe_huc *huc)
>> -- 
>> 2.43.0
>>

