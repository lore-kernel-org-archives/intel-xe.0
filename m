Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6AC7D19523
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jan 2026 23:25:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E3C810E1EB;
	Mon, 26 Jan 2026 23:25:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SrM1Qdco";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BFD710E4BB
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jan 2026 23:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769469905; x=1801005905;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xGXb/RaZjgTHKBTGDYOk80ReqH0vx/QO0fhnDje4c28=;
 b=SrM1Qdcoe/CYv7eRXFRhtNKXUOQpV0Y7JsBkgsnuUJ2jNY75395MZff1
 bs+ZgO4/R9iz1WkYbnD1rLOG8FIbZEfYlzmIRBPP4XLUdm4S1JUMZ5A1w
 2kkS/8eAD1n4t8N6KlyL3BC5WSDr4XDjY7JReQ8l5zB8FR8Fc9tmb5OIZ
 q1Jqny5SCKX56+wCgd2JQL8dsC+VaqOa/GRWUU8hFmIrTlwrPnE0dbkmv
 +HQoSXrnxVUv7xneWji+SOoDol0JX/U0N01Zcycob5vGQ2UC2cvI5obEI
 2yAry7xQAPFTMBrfuuKL1Nx84bBqhLirtWQiM7DLXH6e8TgITlgvFpWEo g==;
X-CSE-ConnectionGUID: cMjbnbbrRfikHgU5jFt3Fw==
X-CSE-MsgGUID: oHImnHFSQj+zjttkRirtaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="74520260"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="74520260"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 15:25:04 -0800
X-CSE-ConnectionGUID: cVbMpNlFRw+mvel0AecF8w==
X-CSE-MsgGUID: j8s/rrERTXyGkfAPNKQ1oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="238485187"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 15:25:04 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 15:25:03 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 26 Jan 2026 15:25:03 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.0) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 15:25:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xqpyXrAhbVt7uQRrdD16j7v1NI69TtDxfc9DyBFv5P+7adk2dIsPiKpFx9tmKFT4pHwseC79TIOvR6xZ1kISr1XZDOqoReX9YJONl5hg7MfH28wdk7LcCUhKqCZSMWqXjFVd0QSYY92L6ep2J0l+SnvIL3511DMkozDspid4s8xgMXIuBw9xnuk5WKXLdl6RElUEbvoOrqokVJlv9dJaAfNmXpNgUsNCM1HGwOzSjz6IEMQdQ/UCjVj0I9ZQzoiPmaSUFAqz8Ms94P5JZA0hLDFdhUXHQiDr2nT/EYbTHPNuT9Lw+xg/xTIFgx+Unywn4hckFQUGVaGVvHvrADQ3Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hGuWlw2qro8qZl3zCFS4nAvI0Fn7VjRrwm8ck89Fyqk=;
 b=HQ2ydCl/R98rJ7CUMnKn+RHPOC05aLcMUVdBkdm7XiGgS2GEGj7Bq2cAR9len2p2ExFzIdO5et3aZiFsj4Opp1RJ4rmzRe41FitOVIngcZe0XMm61fQM2Ai3mDb+xhHZ1Mqxi76JEM0PGmOHzpLGzRvGuG6DTNk+E+FLhhx5PeTchzfphcr+OlC4uLONTPVJDHndj58XdZ5FzhipAWld/j+1bbCA1ulzENmyGzCyXzpg9XmI2MJ/h8XrQaLrYtXICEE5hj+tT3B9Qr4cushpb/Mw+ZE2ZcJjnJ2sPedYsWUd4LyO4M8H17+PEpYOhrWm+Yuk1jRh0VMxTKSGvFoPXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by BY1PR11MB8126.namprd11.prod.outlook.com (2603:10b6:a03:52e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Mon, 26 Jan
 2026 23:24:55 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 23:24:55 +0000
Message-ID: <18169bd1-e978-4862-8513-82ee9ce760e9@intel.com>
Date: Mon, 26 Jan 2026 15:24:54 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Fix CFI violation in debugfs access.
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: George D Sworo <george.d.sworo@intel.com>
References: <20260126231011.3834087-2-daniele.ceraolospurio@intel.com>
 <0e4d6316-6734-4564-bfa5-6c13085c6824@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <0e4d6316-6734-4564-bfa5-6c13085c6824@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::24) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|BY1PR11MB8126:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c98acdc-0d08-424d-b28f-08de5d321d1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QTVuaWx5UjlmQVRtM0lTaTVvYThZaVRQYjBuZ3NSOVB0eFFiQyt2aUVOMFNw?=
 =?utf-8?B?bFI1Y0d1VjRXT2ZHZFUvTWRvUExGTXp3amNScUxCL1Q0TnF2elc3MzBEaHhz?=
 =?utf-8?B?TnNldFdRTVgraWw4aDY5dWNQZ2hZYk11eHVxOGllb0g2cjBpdUxKTXR6c0Qv?=
 =?utf-8?B?ekxaYkNBK21kbHpydnRJei9HT3RBL0dDZWEzMUs0bGVDNEY2QmxmU2trYWVp?=
 =?utf-8?B?dXFscVdXZDRxbnFiUnBMVGdsU2FETHFtOXRDUjhwZVM1Y1cxQlN1Slg1aXRF?=
 =?utf-8?B?Q3hIRmdLSGNqTEdEV3pVUml4Z1ZHeDUrdTdYMTh1K3BmOVRQdG55cXlOeEZH?=
 =?utf-8?B?Q2hqK0RQTnZhN0djRlJTcVNtblJZNG5mN3B6OFJndDNxOVZPc2dRM1ZrazNY?=
 =?utf-8?B?NVdJV2ROQ0xrZ0tvaXRneUx5bytuaHNLVGRQUGVXTTk0SDJaMUQrR0hrVGVt?=
 =?utf-8?B?MVJrMDVJdk5pWFUxYlA3bjdaZFBwREFPdFBhMHY0RUxNZ0FkNDNiYzdrRWZk?=
 =?utf-8?B?cWZSNS93RDhrMjFCMHVTU0ZMWitNbkpIRHkzQTZZclh5T0pBVFpCQlZMbTJO?=
 =?utf-8?B?TkkvMjg4d3ZwN2VKTVFyTUhmczZ0Z0RkZGM5bEVhakQ5WlpZRUQ4VXRydGVM?=
 =?utf-8?B?OTRBTEluWGo5ZDJWNkgxc1p3ZWJNZCtHMmwrWld6Si9qalQ4bGpWNjZFOXZ1?=
 =?utf-8?B?RHdtTkNhODJWTUgrcFNBMTljMkpwM1c1bHV2U21ISy9aUzRycVVUbHJEenp1?=
 =?utf-8?B?ZGxKTFoyQUtiaVpKMmhHazFNMDhCNVdMRG9hM2doTE1HY2RuVGVnT3R3MTZh?=
 =?utf-8?B?RFM0MEZ0WExUcFdWT09rMTJNUGJwM3BDWGd2SkxkQlQ4Q3ZEVzdoYzRyZUlr?=
 =?utf-8?B?bWM1NURvTDdMU0laelBHTElBT2E1Z2VvL0hrL2tsQ1g2RXFBNkh6L1NnY2NP?=
 =?utf-8?B?Qjl4UjNnZlF4TGlubVhzWFE4ZjZCaGZaZTJvUnhUWXhlNE8veGQ3b2FBL2pE?=
 =?utf-8?B?NmpqdHFjZG9aeG42R25VZDh5VVVQc2NneWxvT3ZXM3c4aVljL2FzcStLckxI?=
 =?utf-8?B?a1IzZlNkYXR5NkdYZmxTNStWem8vMnFHQldKQjA2ODluV0JzZFVpUVlLVFh4?=
 =?utf-8?B?aEV1eU5LVFRlU0c2SVNHVTZJQXZvMjNka1FRNkF2OGJpemJMUzJJRHVaSkM5?=
 =?utf-8?B?K2ZUcnljQ0pnazEyUUxNUWFaNFdhOVFCRWxyejJNK2Z6Z3d2UU1pWm02dWdn?=
 =?utf-8?B?bHY5cDhUei84SzVwd0c2QTZXay9XRGt2S3UrU3dUQmRwVnZWZlpKMUVlbG03?=
 =?utf-8?B?b3YvRWZjK3RXL3QzT2ZSWE13MHo3bW9SRmxBc1VwL1JKQW5nc1l3ZTQ4R3J0?=
 =?utf-8?B?ZkUyNGFwRDl2ZFJZQkoyMUdZR2NWSFpKdTNMaEdiNGRHa2Q2eVNyUkVBWlNV?=
 =?utf-8?B?azJpZGZSUmJzMENsZEdPUmZadGc4TDlzVVJHdldKSjhveHp6ZUNqZndpNDI1?=
 =?utf-8?B?R1dQQk05NkpQY0RjZ3RyT2pBYUJZNHhDZTU1QzNMZmZPN0RZTE1zcjAzbzAx?=
 =?utf-8?B?UVhvUTBLYXZzRHBiYTdQeUg4V1dOMkprOEo2ZHFBVVJUV2FqY253SU9KZ2M1?=
 =?utf-8?B?UCtsQkJhb2VsR3NUd0s4VzMwVUlRbVhETUVMWHpVSkFjc3FZUExUQUZLMWhC?=
 =?utf-8?B?VU9iNlZIVUczR1JSRXVRV0V3dGtqRUNES25wRHFnTkc5c0pkOEdCSDkrNitP?=
 =?utf-8?B?QTRPRTNnZXYwWGxubGRWY1JYVHhucmZtbWFoUytsQkoxcTlLQXBsZUtvcUFo?=
 =?utf-8?B?VFB3OHVybDNUVzk4dDA5NFhyZFM4T1RkZ3c3RzVSbWQ4M0RwYTNWNk8wb2ZK?=
 =?utf-8?B?NmVScWtSVVV5b0M4Y09jcmhYd3RMQzJNQkQ1M3FsbFdVelR3bmFRQjVVRjVh?=
 =?utf-8?B?eUlTSzhoV3MrR3VXdWJkRzZJZTc0Uy9DWkcxRnNyTExQaExzeitvQzd6cVlk?=
 =?utf-8?B?cHBlNzgvekJ0Uzh5OENSdVVoUkJITmVQU1o4dThuY29NSGVTMmFmbVpCdGJU?=
 =?utf-8?B?a2VRZHpDM0FuZ3ROOW02cFRqNUdjdTBYY05salZrMTA0VXFIT0lKeUxKMk1m?=
 =?utf-8?Q?sQWM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tjh5ZGszNmJhc0gxT2kxYVdiMlhra0ZsZ2NFVmhJNlRFc0VFMWNrNWtHT3Nm?=
 =?utf-8?B?Tnd6V05kajQ5cStBNWJIMk9DbTA0VTZxZlIxM3pFSzl6NGRkajRZUnhXTXRl?=
 =?utf-8?B?bnV0UWpOZXhZeER5Y2NEYjBrUjhjbUovWDEyMmNDMURBL2NXSDRPQzgyV3FP?=
 =?utf-8?B?ZzdLbi90MWlRRStYeThvTGxMOEpHYTlYSGdTNEJkZ1Y4d2FPd3o4aDRBVHdX?=
 =?utf-8?B?Q2hiVm9YMVZzbmFmWkFTRE5QRWVZNGdYempYS3V3alZObkZzdWVKVTVoZVhZ?=
 =?utf-8?B?ajBIYUl1MmU0NStYSy9WQ3lsM01CR2U2bmh1bEllcmhqbmk0T09zTVhZaUo1?=
 =?utf-8?B?WEVsRVppTmdTeW8yM1ZENnNyb1RVMEI2b2toanN2MERISFJvMVIvZFB1aVk2?=
 =?utf-8?B?eVRVaEgwaEhlbmFMdzVCVzVXL2FZSnF6WlJXbW5WSG1IeDhEdDdlaEQ0Z2lX?=
 =?utf-8?B?TVpOaVVOUGluYlRqZHN6MjZHU0h2Tjk3UWpyeDBpaWFtTGxKbGFCUzhRbEFD?=
 =?utf-8?B?emI4aHo0UDRaQ0ZJd1dOTVdvbFd0M2RrSG9wMnNIdUQxVWR5UmdLaW9TaGw1?=
 =?utf-8?B?bWtRY1ZBMmhhZGF3dUFrRmY0NEtjTUdhSTN3a3FPaEYvekx1OW1nQjA0MXIv?=
 =?utf-8?B?VytEMGNIUyt3THcwUklLQU8zNkVaMUtTK1hQM1hMaFVXOUl6elM5MnQ3aXEx?=
 =?utf-8?B?Rkl1WUxTTGF4UEdnVTlVZThOWDJCZnhnVUV0TEk0QzdqR3hubVZJNlRVc2RO?=
 =?utf-8?B?aEZvVEFySkZMcll6TjYxLzE4cWNvNVR1YndTS09vZVltYk95RjF4bXZGbURm?=
 =?utf-8?B?R2ZBeUhjeEVabC80Q0YyS2ZseVJGZmppelB3Q3FNWENnR091RzFCM20wd0hy?=
 =?utf-8?B?WFFybmNVUUZLM3V3WkYvUzM3R2dYaWd3V0VzMVdCaFprb3BhMVpzWWJCT2Jo?=
 =?utf-8?B?dkVHYkxiYkpEbDJlUnM1K2tGV2NJVzQreUE0amNDdVFvYnF1K3QxbWx5SlEv?=
 =?utf-8?B?aHpHYnBBS3lOTmRHSWtiQjFLKzhrbFlqSGZDWTRoUEcwY0hqYjRrV2YzMXNO?=
 =?utf-8?B?dVpFUWkvaTR4cWZ3V3NQc2k1TFVKRGVhYUNBNGRSQ2NXZmdnMXovb2crSWpL?=
 =?utf-8?B?ZDF5RW5iT2paMTZncTc5Z2FKZW5uREY0Vlg0V1Rka0l1eERkUjZzTmdqOHFT?=
 =?utf-8?B?S3VzT29reS93cG1vb3dKSFlLTjR3Y2cvekEyekJjTytLK3BKWDFxc3dmd2Jp?=
 =?utf-8?B?Z3d3K096Wm4rT1ZMTWpYWWRzczRjUGROb1QxMlpHVHVEVFNZcGlWNUpjUHBi?=
 =?utf-8?B?am9wQWUrYjJHUDE1TStTdG1vcCtMM3lEWFZjN0laM1hJNForSXZSVnZsTXBk?=
 =?utf-8?B?QnlVM2YxeFJFQlFBaVVVRkF0UGVLWU1HTmYyeE4ycCtqL2JNSjRhbERsOFhq?=
 =?utf-8?B?aUN5dnR3SUo3UUZsV2ZWaERlK2FhQklKN0JrcFRKcTAxWXhGdW5MSVZ2eGU2?=
 =?utf-8?B?bzB6M1pGc2tFMHZxVStHalB3bmN3RktlTkRwaitoOXp2dkdOTHJiOVdBcnBw?=
 =?utf-8?B?N29jNWpTM0hnek1JaFNUVUhiZVpZNlB0UVp3eGJZR1RKcHl5dVMwZmhEWEFw?=
 =?utf-8?B?TG5hK0NpZFNrcjFuaVVGK1pzY2pLVTRWd0Fxa2hhR3JUYWFLdnpJZ2ZZc214?=
 =?utf-8?B?K2NpMjd0K0gxZXpwaVBPcjVtcnVwWW1jbE1UQVJBY2dyT2xQVm1sTGNpenpi?=
 =?utf-8?B?T0ZMcDFreWVtT2hTV3V2Z0xCNk5vZ0p4S1ZCR21hTUxIVmNyTlJGclRiZ1FN?=
 =?utf-8?B?dml3Q0dPcjJMaldSK1d5SmxUbUNjVE8vMzNtd2F4UVBKQzd2U1NwcSs1SDlz?=
 =?utf-8?B?OHhSSWxuZFljQVpXVk91VTd5MjQrN1RDdm9GRDE4Z2NnZCtYMzdKelRXYS9O?=
 =?utf-8?B?THBsVHFUTWl0VlhUc1hqZ0h4Rk1OdE5wWklxSEJLNDY1T3Ywc1dlS3BKN2JV?=
 =?utf-8?B?MGEwKzB5dlJBcjlwK09wd1NnYjRXUGdvRVMxY2wyQzJNL3duT0oxaS9aMXFG?=
 =?utf-8?B?TlY4V3ZlR1JPVDhUZjFHYjA3czIySFlZbmV6WFJhRmppVFJyZkpnS0ZmUzB2?=
 =?utf-8?B?VmJMeXpQM2FMS0ZLKzVYb0dOUEpXT21CQjg3bWZOa2ZGMmxuSHhEK0tHNGlo?=
 =?utf-8?B?Y2VOTmpDZmtadlZJcVhyY2dyb2dvTXVPdVlOOVo2WkU0ZitRTnV6T2plSjJF?=
 =?utf-8?B?VnJBZVpwbVlyN1NRMytiaGI0NWc1Zkc4YXo4SzVUQWxpOG9FVmRYUGpHbjcx?=
 =?utf-8?B?QWZoa1RrVDBub0lMZzV5c3o1WWc1ZmpaaGJzR2dRUFRUV2VMU3kwNjNpa3Vl?=
 =?utf-8?Q?/5m/K8cixF1aWBMI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c98acdc-0d08-424d-b28f-08de5d321d1d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 23:24:55.2947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ipe/qRRGwBzzGIrfOkDvwtLSWVRcHMHSgxnNkh2o4aEHXR8ydcvTKQfGmfZ6eeJ03gVr0dHkr394w99kk0ESwcH7oPsxWf5qYkgj82Inlzs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8126
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



On 1/26/2026 3:21 PM, Michal Wajdeczko wrote:
>
> On 1/27/2026 12:10 AM, Daniele Ceraolo Spurio wrote:
>> xe_guc_print_info is void-returning, but the function pointer it is
>> assigned to expects an int-returning function, leading to the following
>> CFI error:
>>
>> [  206.873690] CFI failure at guc_debugfs_show+0xa1/0xf0 [xe]
>> (target: xe_guc_print_info+0x0/0x370 [xe]; expected type: 0xbe3bc66a)
>>
>> Fix this by using a local int-returning function, like we do for the
>> other debugfs entries in the same file.
> or maybe better option would be to fix the xe_guc_print_info() signature and return int ?
> then we will be able to correctly handle this forcewake error there:
>
>          err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>          if (err)
> -               return;
> +               return err;

That was actually what I had in my first local rev, but then I switched 
to this approach because every other entry in this file was handled that 
way. I'll switch back to returning int from xe_guc_print_info

Daniele

>
>> Fixes: e15826bb3c2c ("drm/xe/guc: Refactor GuC debugfs initialization")
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: George D Sworo <george.d.sworo@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_debugfs.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
>> index 2f23119686d4..1a4c940ebecb 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
>> @@ -74,6 +74,12 @@ static int guc_debugfs_show(struct seq_file *m, void *data)
>>   	return print(&gt->uc.guc, &p);
>>   }
>>   
>> +static int guc_info(struct xe_guc *guc, struct drm_printer *p)
>> +{
>> +	xe_guc_print_info(guc, p);
>> +	return 0;
>> +}
>> +
>>   static int guc_log(struct xe_guc *guc, struct drm_printer *p)
>>   {
>>   	xe_guc_log_print(&guc->log, p);
>> @@ -110,7 +116,7 @@ static int guc_pc(struct xe_guc *guc, struct drm_printer *p)
>>    * - without access to the PF specific GuC objects
>>    */
>>   static const struct drm_info_list vf_safe_debugfs_list[] = {
>> -	{ "guc_info", .show = guc_debugfs_show, .data = xe_guc_print_info },
>> +	{ "guc_info", .show = guc_debugfs_show, .data = guc_info },
>>   	{ "guc_ctb", .show = guc_debugfs_show, .data = guc_ctb },
>>   };
>>   

