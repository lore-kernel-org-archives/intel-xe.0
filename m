Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0BEDC021B2
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 21:24:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C4D10E9EF;
	Thu, 20 Feb 2025 21:24:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UioQ8TaZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B99E10E9EC
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Feb 2025 21:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740086644; x=1771622644;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=n4rfXbw+NZanpIAlPjLh7hCIRW2Dp9Y9QL1WqafOviQ=;
 b=UioQ8TaZkFLcemB+0GNeVfK8JIq4hZAZJdnf3SnaJg/c+KL55rRQjq4h
 p30+Pe5TE2kv9qd8WWz9XsWeRUlVYqCGEN6IUEx6nwL6GJEuAkfgsNKUJ
 gPT9Nthm65k8Jexogo5IEwa32KtZGGdTGn4dv1gABtgx21MgTpL+zh5Re
 vKb7Juy0DptnTkybdZrP4zZZ5KUPBbzafCU10jibs4oqa21rF8XDXY3PA
 h5nx5zIGKeN8zc+8cpcyPJiX+Ef5mkcr/IqljJGMwpZCIfwy+x9sr087h
 QTsheznGihq9zwAEz+FF7Cn30gSwJbcM934W4xd/OfEqbldFAjjvNgPg0 g==;
X-CSE-ConnectionGUID: WJ4ieh4SSgCGsciegJTXAQ==
X-CSE-MsgGUID: GK7wW4YJSYCdoatu36BoUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40075699"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="40075699"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 13:24:02 -0800
X-CSE-ConnectionGUID: ZKKC6uGbRAmnA1DvpOuDeg==
X-CSE-MsgGUID: +RhCJFLEQZqoncqR0Xs97A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115671324"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 13:24:01 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 20 Feb 2025 13:23:59 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Feb 2025 13:23:59 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Feb 2025 13:23:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rWSH5CAgy5wwVJ1jBwXIuCNHeO7Q9NWK2qP49PZ83YeyvgEdCd9juC8DfPn+uS3nsiNeVp4r9e9ZuFmIJqO7stZcyYLqykjV1i5cf9UH7IjIlbY3QslLSdTtZg8Fi3o/XRjSh07R6BMGBfJF4p9wRy2jH1rOBBB5pRpqTzC1VL+NHPv39UGjZjI2lGP19DsBN0TpFWKFx/DqrREte7RSHlizCSOrNxt8pbmfxPn/3C3sm9uB9uIQXtq/hfIfjm9oyA47CdK//8Nb6tuh4FjKnCo1bqsl/CxuKckPoJNp0UMSGpKI6XQ127eBrtr5Xne7YAZ0bDJhTu9xjt704jtWQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IW3H6uLxm7n54wX3rAt2FdFOS39646mvzxez9BBjPIo=;
 b=VSiYsWEziWyNgQnxiw+IwlQifwU1eEsYhwDZPnKNiEzYkEG4UL7dcQodQjQgEOBPSN6FKL+BxoUqwsQpBop+0I+vJsm/nJ8Afzf8sFaeKdRO0B3Rytu4UYgnpfeLKXwsVzbZZDg9165TazhB69AvqVAha/U4ESLP2fyQ90ImlWEiTA7Qo8Q6xYrCVVXCcoof9WcOO0sht18vBcqeyqkvdVqoIrbobuI7s/SZNNHQ+jU0TvVhcMjvMuN/vuTlwFYAL5OnJFfFaR5roZMJfwh0tFNPG+pBQuVd0di5D+GGjYEuDHLSQykdN+jjer9oI5hoo81FUJDGCCRO302/Cb5ygw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH7PR11MB6905.namprd11.prod.outlook.com (2603:10b6:510:201::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Thu, 20 Feb
 2025 21:23:55 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.8466.015; Thu, 20 Feb 2025
 21:23:55 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250220211050.GX4460@mdroper-desk1.amr.corp.intel.com>
References: <20250220172532.66613-1-gustavo.sousa@intel.com>
 <20250220172532.66613-5-gustavo.sousa@intel.com>
 <20250220211050.GX4460@mdroper-desk1.amr.corp.intel.com>
Subject: Re: [PATCH 4/4] drm/xe: Convert pre-GMDID IPs to struct xe_ip
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
To: Matt Roper <matthew.d.roper@intel.com>
Date: Thu, 20 Feb 2025 18:23:49 -0300
Message-ID: <174008662922.100150.5235954042052397357@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR04CA0154.namprd04.prod.outlook.com
 (2603:10b6:303:85::9) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH7PR11MB6905:EE_
X-MS-Office365-Filtering-Correlation-Id: 86f23df6-02bb-46d0-2805-08dd51f4e116
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmtWN09zRGx0YVQzOHM1azQ4bXJEamNBanRmTjRCSlNyOUdSYlNOZUlDK0F2?=
 =?utf-8?B?SG03b3QxMlEwSUl0cVdoQ2o5OXY2Z1JXR1Bua1BlQkdaUHBpNFg0NWRORkxw?=
 =?utf-8?B?SHU5aE9EaDI1QXVxYjkzaFVsWlVTT1RyRXZxYXNBSy8wVGhRM3gxeW1MSGlV?=
 =?utf-8?B?b0JVdHkwUDRXYk9QWFdFNEtiNmRPdnJQMHVzeHpnRFpLY1N2dWczKzZXMHhX?=
 =?utf-8?B?WTJZbFZISHBYcmdTWGJrL2R3RC9ZZXhjYmd5ZVVieTVESnAyVUgzTndGSzBn?=
 =?utf-8?B?d2NzV2ltSS9uaXVRNmdNaWVRS0Uzc2Rpay9Ba1NlQ3o3ZytWaEZQVWt5TjM2?=
 =?utf-8?B?c1laTGIzRTJoQXkvYkd4d282TXdreW5hY2ZLeXhqTXJNeHpFQlpEZlJPRVdx?=
 =?utf-8?B?Z09wM1JvUmpWTWNuMXRJZms3ZUtEZXZBMzI4VlE2djJ4WVZFRVJQcGFjUjY5?=
 =?utf-8?B?VkdxYjg5R0xUUzM5ckcreDA1bDJyN2doQkcwMVJKc0FZUXI5NUZCWkhTNnZW?=
 =?utf-8?B?TEVIZFVweUtTSXoraXNvWEhadWduTUlnTjgyRWxUaEMyaTMvbndHNXo2YkQ4?=
 =?utf-8?B?RDlwSzVPVzQvTmd1NlBLZEFBQXM4R2ZJT0xJSFZFamoxMjJBYWpZdGl5VGt3?=
 =?utf-8?B?MERwbERpSVhLb0RWR1FLcFRNTUhZajNFdXBrVk1ZUkZGVWZZYWxlK1BIYU1F?=
 =?utf-8?B?UWs2aG9nZWN1T2ZMbFI4Z3RkNUpsUThsNVNaY085bTF4QmtYblpwRWtOdVQv?=
 =?utf-8?B?M25LQnJQeVBVUFRTL3NId2kyM0FyZ2l4bTU1a0hwcW1CSXhUeEVLTVcxR2NH?=
 =?utf-8?B?QjhqVGxnMVo5bUhQdWoxZXFrNDc5RXZVWE5YYmcxaTEzYWJwWVVhL3FtcmNU?=
 =?utf-8?B?M1BQQ3ZGbjY5QlBKOEZjTCt5NmtGcGFjN1NRQWQzS2Z0b1c4aG5WTzY4Ynlx?=
 =?utf-8?B?d0RjUDhYMHRqNHZkTCtLbzc5a3BLTjZVNlBCMHJCam0wTnJaWk9uazc5TWhx?=
 =?utf-8?B?bG05OGdFMGZxMkVsUUp3UFk1QjlKaURTOHc2aE5QeW5TenZJZmZNTXBuQWIy?=
 =?utf-8?B?OW53Rkg5Mm5BN0hFNkdtWVp6NkMra1NXUXZjRHl0Q3dmSW1MZUErU1lzVXJh?=
 =?utf-8?B?SFZxcFFRN0JnZDJlY0QvV1NiRGZEZ2swR0U1Y3NuamtTaG9KZ1dra2dPWU9Y?=
 =?utf-8?B?amdlbmtWN2hPMk1BNitYdXlydzJ3WnVVOE1la1JqejRmTXZiTFJVSGVoVUwz?=
 =?utf-8?B?VmRTRDh2cGJLUmpwdFdsQXJlR3czemltOGkyaXZLUXlHQTRROVFEVm1CUEZ0?=
 =?utf-8?B?UFVIc3l5TEFWdWhuVTVOck55SkU2YS8vZi9JRThNUkFldmxwYXVSRnpBc2t3?=
 =?utf-8?B?cHBZUlIvc2NQN2s2WUp3UkZ1VUNidlNUQXBjMVFucmhWZnY1cjloY2FJK1g2?=
 =?utf-8?B?VmJiT3ExVTFaNHRFYUlLUElBY25mVGg5Rjc5d1dDZStnak8wQktobzVESjht?=
 =?utf-8?B?UE92aU1CbktZYWpBWTQ5NzVRaW1GSE5pN3hDWGlWaGNDVTRsT05qY0JlQWJk?=
 =?utf-8?B?R2ZFTmtmUU40ekpBRXhJWE45bHpXamk5b01jL1NSN3ZWR2xDK1BvRE5tRVF1?=
 =?utf-8?B?clNRNUhXWkJlK2QvVmdyZlJXbWhKQllXbGpRUUpMejd1YTFZRFJjY2pDTUp2?=
 =?utf-8?B?SDJxNlpCM1VRcXNiTEx2Wis3NnZnSENiTldYQjFCYnNpc2J2UWdrWkhnNXlR?=
 =?utf-8?B?OVkvOXMvckZicVNhekZNaUtzMC9zNkIvM2k3Q1AyNnlvSEFHVW1oUlc3RmJ1?=
 =?utf-8?B?ZThHZnhBL2dQdGJiZEt5QUcvU3dNT3IrelpkVjhlTVpOZDlTMWo0aEk1dTlX?=
 =?utf-8?Q?tnJfN9h2TXozc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWxSc1hBWko3eGdUcFB2WmYzalhVek50TGZpdkRKM1RUbHd2cURqakVrZGZ0?=
 =?utf-8?B?YStBQ0lQamN5TFlORU1hUVJHYzVsejlMSGpCOUhVVkhJeEdkRU16UzRwTXVa?=
 =?utf-8?B?Zmp5U2xMeUJkWXdSSEQvRStLZ0dCbzY2YUFaTDZWaURsTFl6Y2RQT2w3M1Bq?=
 =?utf-8?B?Q1dUY3gvdEJFWE1VZEtJaDJEYnNpWEkyNVBvd2lEeko5a3RTMWpoMklvVm14?=
 =?utf-8?B?emQ3TUQvZm1VbDlIa1c4L3JnTkUvNGY3MElYclNqell0Ryt3dEVBdWQrMERZ?=
 =?utf-8?B?dlNMNjJ6cFpvU25YZmhGcmdSZEV1SG9US083ODBRTkFROG5oeVpjckZCVkEw?=
 =?utf-8?B?VHJVVVZ5emNJcUhwSE11TThrT283eWk0a1dLZ0VqeXJUNW1PKzRicUcvQ2Za?=
 =?utf-8?B?WHZrNFp4Q1dmcFFaSmducTFBVXZhNzI1NjlSY3RaZEJXaHpmeWViaDJ5dHht?=
 =?utf-8?B?SVJmM1BwM2gyRmh1a094c25FOUZyYm13WnhxS0dSVDM4cnRsb2hjVzB4Rkdk?=
 =?utf-8?B?dnhPaFJOR2ViUjlLZUsrYVJndkhqRng5U1ErR3hJZFd6K0I1c0ZJR2owSnZI?=
 =?utf-8?B?MUJLbXBTcUxoYTViekNBcldad3ZyUDRKOTZyZ1RPaFZ5WkdoZW0wZ2gwZFMy?=
 =?utf-8?B?ZHZTUmdobmJMSHlVMitBU0U5WUlBelNUUDgwc0FjNnhGdDJTWitvU0hSMEo0?=
 =?utf-8?B?RnFhbDdxNHY3cS9GQm9BVTA5Z1F0dDdlT1RERWdtLys0TzJ6bmlQTUZaQ09L?=
 =?utf-8?B?OG9uVXc2Sk1zUUFwbHFwRitCUXBpZE1QbW1wTGF2MEtiakw3a09QbVpId2cv?=
 =?utf-8?B?dkFqczBzb00wRkRqemVXQXZCMHVSYXB5U1dydkdqM1FxSWhRckQ3UFhYY25o?=
 =?utf-8?B?QkMxSFZPcWhITGs4VDhyS1RDcXVOdEJsWEtWWEFYbzJKMmhQOEV0VmVEbTNE?=
 =?utf-8?B?cy9XWkFuZEdKeVNOZWVESGNBSEhydm5LNTFrZEhlemxOZ2FsbHFVejRjKzgr?=
 =?utf-8?B?RW1pdUFlSURtbE1CVFI2ZGRnYzNaUDR4bEhsSkFJcXJ3YkpOWEFEbWlwVldo?=
 =?utf-8?B?WXN4VkdDaWtudE9DY0RyYkUrUCs2N0kwTVNOOGtQeWQ5MEZGenB0QVFSc0xo?=
 =?utf-8?B?cHpTUDFNaVpjWmZnQWNTdWphdFBmUnR3RjdQQi9jdVRWS0lzaGZrRzBmNHU5?=
 =?utf-8?B?eFEyNUdvaGZWZUdRRmVBdVZPYk9XV3FCTXlDNXp2UVRWU0JQcGJ6MG1NeVBV?=
 =?utf-8?B?TFI4NkI5L2VuYnYzTVM0RDlqcnZjWWJ5NHNHTGVpSWFlSUN2TlhTdDc1YUgx?=
 =?utf-8?B?NGFWOHNNYkdWNzNLS1ViVDlCR0ZqRVpJRGVyMlBwQ3huY2xPdzdYV1hYZ1Mr?=
 =?utf-8?B?UVZqcjY1Qi9MM0s2M2pGdEhNZnltcmtJbWRpTE1Vc3NLejZtanJtYjFMendP?=
 =?utf-8?B?VkNVWlNXbVg5REc0b2ZOWm5vZUc3WVBQTFkrSEV3ODJNWjBTR09ncjF5R1l6?=
 =?utf-8?B?MysrNXJUWXdhODFMT0J4YWRLNEhQNUgvTlY3ZzJReHFGWFV4amt4RFVqeFVq?=
 =?utf-8?B?di9OSkVTQW16Z3p5NHVQNFhMOW9xNTJ4MEtlZmVTc2FjMk9aU1UvUi9LNUhm?=
 =?utf-8?B?ZEdQbnRYanhKeitaOFNGZ1hiTWp6S0VmT2QzdGNUalRjd1ZtenZTbEVNTkpj?=
 =?utf-8?B?OUU2bCtXYjZybFY1YW1FSERicGZFOVVmRUdRTUs4K0Z5aFFOejhIU21ob2lD?=
 =?utf-8?B?VC9qd3lEN1RoTlBxREk3R3RHdFU3c0E2SEpEWnBndi9UWFZrTFJrb3FPcVNK?=
 =?utf-8?B?TzZvNkdhMk5hZ2NGV2N4THZpbHFwSlp5OXJMR1cvOUZhaU0wcHNPUGxsczk5?=
 =?utf-8?B?U2E1dWx5dDlKTHV4RWVESmZ5THdBRDIrRWdKY0hONWRpS0FkUUdqb0dZeXdC?=
 =?utf-8?B?TXEyMXNiRlV5QjVSV0cyNFdSaUwvRUZXNzgxZVZZZ1Y5RUdES2toMzhPN0h5?=
 =?utf-8?B?NHJZK2t0RUkybXZPcnFLaldtQ1QvYXNpNVozNEtiNG14STk5M3h5YjE1K1dG?=
 =?utf-8?B?eDVCaVJJMDNMYzNNYm9zNTRUVzNLcDdJRDJHR0Q2cWxJeHJERXI1V1l3ZTN3?=
 =?utf-8?B?eEFSV1lUMFZZRzhYNEliclRmNmJsSXZsMzJMWEdIeWNLamthOGpUZVlLZWdY?=
 =?utf-8?B?K2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86f23df6-02bb-46d0-2805-08dd51f4e116
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 21:23:55.1316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GUNWoQ5rLzMLD3Mzbqk0mykGG7pwqkcmULLQ2imD1zTqeVomHQIrH3ekpI5pgc5//f0ebBOQg4eb3CiRGwla0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6905
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

Quoting Matt Roper (2025-02-20 18:10:50-03:00)
>On Thu, Feb 20, 2025 at 02:25:11PM -0300, Gustavo Sousa wrote:
>> We have now a struct xe_ip to fully describe an IP, but we are only
>> using that for GMDID-based IPs.
>>=20
>> For pre-GMDID IPs, we still describe release info (version and name) via
>> feature descriptors (struct xe_{graphics,media}_desc). Let's convert
>> those to use struct xe_ip.
>>=20
>> With this, we have a uniform way of describing IPs in the xe driver
>> instead of having different approaches based on whether the IPs use
>> GMDIDs or not.
>>=20
>> A nice side-effect of this change is that now we have an easy way to
>> lookup, in the source code, mappings between versions, names and
>> features for all supported IPs.
>>=20
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_pci.c       | 60 ++++++++++++++++---------------
>>  drivers/gpu/drm/xe/xe_pci_types.h |  8 -----
>>  2 files changed, 32 insertions(+), 36 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 8b8111e954c1..c88c2da1e731 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -82,10 +82,6 @@ __diag_ignore_all("-Woverride-init", "Allow field ove=
rrides in table");
>>  #define NOP(x)        x
>> =20
>>  static const struct xe_graphics_desc graphics_xelp =3D {
>> -        .name =3D "Xe_LP",
>> -        .ver =3D 12,
>> -        .rel =3D 0,
>> -
>>          .hw_engine_mask =3D BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_B=
CS0),
>> =20
>>          .va_bits =3D 48,
>> @@ -93,10 +89,6 @@ static const struct xe_graphics_desc graphics_xelp =
=3D {
>>  };
>> =20
>>  static const struct xe_graphics_desc graphics_xelpp =3D {
>> -        .name =3D "Xe_LP+",
>> -        .ver =3D 12,
>> -        .rel =3D 10,
>> -
>>          .hw_engine_mask =3D BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_B=
CS0),
>> =20
>>          .va_bits =3D 48,
>> @@ -109,10 +101,6 @@ static const struct xe_graphics_desc graphics_xelpp=
 =3D {
>>          .vm_max_level =3D 3
>> =20
>>  static const struct xe_graphics_desc graphics_xehpg =3D {
>> -        .name =3D "Xe_HPG",
>> -        .ver =3D 12,
>> -        .rel =3D 55,
>> -
>>          .hw_engine_mask =3D
>>                  BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
>>                  BIT(XE_HW_ENGINE_CCS0) | BIT(XE_HW_ENGINE_CCS1) |
>> @@ -125,10 +113,6 @@ static const struct xe_graphics_desc graphics_xehpg=
 =3D {
>>  };
>> =20
>>  static const struct xe_graphics_desc graphics_xehpc =3D {
>> -        .name =3D "Xe_HPC",
>> -        .ver =3D 12,
>> -        .rel =3D 60,
>> -
>>          .hw_engine_mask =3D
>>                  BIT(XE_HW_ENGINE_BCS0) | BIT(XE_HW_ENGINE_BCS1) |
>>                  BIT(XE_HW_ENGINE_BCS2) | BIT(XE_HW_ENGINE_BCS3) |
>> @@ -175,20 +159,12 @@ static const struct xe_graphics_desc graphics_xe2 =
=3D {
>>  };
>> =20
>>  static const struct xe_media_desc media_xem =3D {
>> -        .name =3D "Xe_M",
>> -        .ver =3D 12,
>> -        .rel =3D 0,
>> -
>>          .hw_engine_mask =3D
>>                  GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
>>                  GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0),
>>  };
>> =20
>>  static const struct xe_media_desc media_xehpm =3D {
>> -        .name =3D "Xe_HPM",
>> -        .ver =3D 12,
>> -        .rel =3D 55,
>> -
>>          .hw_engine_mask =3D
>>                  GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
>>                  GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0),
>> @@ -369,6 +345,13 @@ static const struct xe_device_desc ptl_desc =3D {
>>  #undef PLATFORM
>>  __diag_pop();
>> =20
>> +static const struct xe_ip pre_gmdid_ips[] =3D {
>> +        { 1200, "Xe_LP", &graphics_xelp },
>> +        { 1210, "Xe_LP+", &graphics_xelpp },
>> +        { 1255, "Xe_HPG", &graphics_xehpg },
>> +        { 1260, "Xe_HPC", &graphics_xehpc },
>> +};
>> +
>>  /* GMDID-based Graphics IPs */
>>  static const struct xe_ip graphics_ips[] =3D {
>>          { 1270, "Xe_LPG", &graphics_xelpg },
>> @@ -380,6 +363,11 @@ static const struct xe_ip graphics_ips[] =3D {
>>          { 3001, "Xe3_LPG", &graphics_xe2 },
>>  };
>> =20
>> +static const struct xe_ip pre_gmdid_media_ips[] =3D {
>> +        { 1200, "Xe_M", &media_xem },
>> +        { 1255, "Xe_HPM", &media_xehpm },
>> +};
>> +
>>  /* GMDID-based Media IPs */
>>  static const struct xe_ip media_ips[] =3D {
>>          { 1300, "Xe_LPM+", &media_xelpmp },
>> @@ -558,12 +546,28 @@ static void handle_pre_gmdid(struct xe_device *xe,
>>                               const struct xe_graphics_desc *graphics,
>>                               const struct xe_media_desc *media)
>>  {
>> -        xe->info.graphics_verx100 =3D graphics->ver * 100 + graphics->r=
el;
>> -        xe->info.graphics_name =3D graphics->name;
>> +        for (int i =3D 0; i < ARRAY_SIZE(pre_gmdid_ips); i++) {
>> +                if (pre_gmdid_ips[i].desc =3D=3D graphics) {
>
>Unfortunately it doesn't appear that we can consolidate now-identical
>structures (e.g., graphics_xelp and graphics_xelpp) since doing so would
>always match the first entry in the table an incorrect assign a version
>of 12.00 instead of 12.10.  I guess that's not really any worse than the
>current situation of having near-identical structures that only vary in
>version though.
>
>We might want to add a ktest to ensure that we never try to point
>multiple versions at the same structure for pre-GMD_ID IPs.

Hm... I wonder if we could make graphics and media members of struct
xe_device_desc be pointers to struct xe_ip instead of
xe_{graphics,media}_desc. That would allow descriptor reuse and rule out
issues related to matching the same descriptor for different pre-GMDID
platforms.

What do you think?

--
Gustavo Sousa

>
>Anyway,
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>
>
>> +                        xe->info.graphics_verx100 =3D pre_gmdid_ips[i].=
verx100;
>> +                        xe->info.graphics_name =3D pre_gmdid_ips[i].nam=
e;
>> +
>> +                        break;
>> +                }
>> +        }
>> +
>> +        xe_assert(xe, xe->info.graphics_verx100);
>> =20
>>          if (media) {
>> -                xe->info.media_verx100 =3D media->ver * 100 + media->re=
l;
>> -                xe->info.media_name =3D media->name;
>> +                for (int i =3D 0; i < ARRAY_SIZE(pre_gmdid_media_ips); =
i++) {
>> +                        if (pre_gmdid_media_ips[i].desc =3D=3D media) {
>> +                                xe->info.media_verx100 =3D pre_gmdid_me=
dia_ips[i].verx100;
>> +                                xe->info.media_name =3D pre_gmdid_media=
_ips[i].name;
>> +
>> +                                break;
>> +                        }
>> +                }
>> +
>> +                xe_assert(xe, xe->info.media_verx100);
>>          } else {
>>                  xe->info.media_name =3D "none";
>>          }
>> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_p=
ci_types.h
>> index f46426ef8ed8..e9b9bbc138d3 100644
>> --- a/drivers/gpu/drm/xe/xe_pci_types.h
>> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
>> @@ -9,10 +9,6 @@
>>  #include <linux/types.h>
>> =20
>>  struct xe_graphics_desc {
>> -        const char *name;
>> -        u8 ver;
>> -        u8 rel;
>> -
>>          u8 va_bits;
>>          u8 vm_max_level;
>>          u8 vram_flags;
>> @@ -28,10 +24,6 @@ struct xe_graphics_desc {
>>  };
>> =20
>>  struct xe_media_desc {
>> -        const char *name;
>> -        u8 ver;
>> -        u8 rel;
>> -
>>          u64 hw_engine_mask;        /* hardware engines provided by medi=
a IP */
>> =20
>>          u8 has_indirect_ring_state:1;
>> --=20
>> 2.48.1
>>=20
>
>--=20
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
