Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1369CCD1A2
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 23:11:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8155710E538;
	Mon, 20 Oct 2025 23:11:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RQSGxYoA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE85F10E538
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 23:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761001894; x=1792537894;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=EHlc2XIV6K10o8MXssor7PU0cJe7FyHamekWWu3fmjw=;
 b=RQSGxYoA4+k3oyhDJBR5YPInmsCO9oHWK2HJ4/XVnRNgdcGP2HvhwxKY
 HuaN2QgkP9aes9X9hKBFHhajrZIzmEXoYBWTNU4FWAtjymulRrOXPeUHX
 20gUdk8VAV+T0qeQRv+qga+319Y3nq/DPW+ZBvK3932u7/2xLDs+raOoC
 9BItoXHOkp4H0Hba8h2IM9Vidat8NMGHtIfzEWbn0QrdnFvh7YxoWepu3
 MZwS05bMYZONKap6oiTKIjZoQJHVC4fzkSOn02IdNl3ahWp13wVYittI6
 BgnwWoGJSfmWi14iPIY9mXBXGBp5oazFa8z2MV0/B9AKi4EEbkVHLVloK A==;
X-CSE-ConnectionGUID: v5vN28D7Q4uVBGuk0yJjZQ==
X-CSE-MsgGUID: XbpmLl9ITTuufSihABbu7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74468798"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="74468798"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 16:11:34 -0700
X-CSE-ConnectionGUID: FqPnCSWGRciuo8b63/RuXQ==
X-CSE-MsgGUID: Eo3v68ZAThqt50N9wWmBMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="182999558"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 16:11:34 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 16:11:33 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 16:11:33 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.61) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 16:11:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u42TK9yEZlWahlQ6bZ17/NZzgxjUKccaXk/NYWAQm8amOKtDRkzV5Kmgxj8NX1CGX9jbL1JbGaWH+2+t+sf0Uz6Fp3Zld9e5gOqXug+IdeTsJ36WjgmDIXsLcDmjtjYxlXXHHWRfSAb8b0RvnyattHKsfVfp70U/Mkl6IVnM0uKo7TjTMHOQGqT9Ir0P81SRMSeBD4ilCotJV8eW57sxIDDcpgm4kcYkrByV/TIytSIwPhsRAdU/CcXy6iwcTL36gm2iiEEUMjYy5LupLqGXrXcx2Xspl7utsxILBwfhpDHRtPV9ZySoDK8onOHWTDwiz4yB1Uw/6eHY8T307skEAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHlc2XIV6K10o8MXssor7PU0cJe7FyHamekWWu3fmjw=;
 b=qMmeU7G8qLz3Jh+Kjj6xafu+j11ypVZBTg91lu73rDeGPoo+07xveBTuxvKL984/c0pHrIp7GgzXTNPO0KCVZ63VXOsy+RYxqgcCIfaChTd7RAx8/tDCFQVfBhCoHRGW7Yrl/b++1kZAeJ2UQYiJXBf8ARPla8dCPxhZ74ZeWpcpBItG73rX0MyKymxPMHWRh/p1HhzCki680TdmBKwxYKvZt8H+UI6BWPO3ZlPEH6Dgj9XSU0/8jUtS+ZYztYWBindhfoSxNmO2ytj1Z30mBQvwofQcyrNmTbo9qDodYNt08UWMxbfZNQQoua7kOxqT2j01y+Wp7JO6HZcwVge8eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by CYYPR11MB8405.namprd11.prod.outlook.com (2603:10b6:930:c6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Mon, 20 Oct
 2025 23:11:31 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0%5]) with mapi id 15.20.9228.016; Mon, 20 Oct 2025
 23:11:30 +0000
Message-ID: <a4a67c4d-ccc1-488b-b183-0630125e65bb@intel.com>
Date: Mon, 20 Oct 2025 16:11:28 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/6] drm/xe/guc: Add log init config abi definitions
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250828174159.1232994-1-zhanjun.dong@intel.com>
 <20250828174159.1232994-2-zhanjun.dong@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20250828174159.1232994-2-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0218.namprd04.prod.outlook.com
 (2603:10b6:303:87::13) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|CYYPR11MB8405:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e15258c-0a5e-4a50-f88c-08de102e00d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?emhIbHZReTh4eWxpNVAyeE05QndHelhEUGJIZ051NnhEajdiUW1iMW93clVV?=
 =?utf-8?B?WDUvR3V2c0g4UDBWUnd0OWp6OWRhRTdaaEtVNkVLY3Y0UDJraFJrWnduaTJP?=
 =?utf-8?B?WjE0cjFZdFlWNDRzZldNdWRrS3VDdG9hWU5TMWxHdFc5emlEZDZEdThOblZi?=
 =?utf-8?B?V0UyN2dWdmJOM3dKLzAwdlBueEZMMmE0T29UZDdLdmJ2V0VwdWNvdzhad0lX?=
 =?utf-8?B?WDFCbmY0R1NlWm1KRmxoR3dMOG1QU1FLR1M3M255Nnl2dmpPQmFGZEErbUk1?=
 =?utf-8?B?Z2tCYVZ4Tmp4UnRNT3NNUXpkd1A5dTNyQkl4bVlGZWIvSU4zdzZFTEpDL0k2?=
 =?utf-8?B?WTdOUHhQb1Qvb3FLM2xmOXFzaG5NTE10cFBadytpcU81eEFhc3kxTTlHUFJr?=
 =?utf-8?B?MFduNFdockM2UlgxR0IvUzZKKzNJVFhvR0FzeGdhSjBKdWEyV2kwbzVRWEMz?=
 =?utf-8?B?clY4cCtLZ2VtbDRVSmFnYzNDZk43VXVNV1puekFzem5YQ2dvK08rSWh6ZVFW?=
 =?utf-8?B?YlNFY29OU0dlWHBUajhpMHFBRXk1UmpwaE85WnRxZkZ6ditWYjBSdDNxUFFT?=
 =?utf-8?B?b0ZXL0lQcTJoVFphTjFCYTZ0ZGw0aEtmdzFJVUlXOVFoSklXTDlsQ3pnTXFq?=
 =?utf-8?B?OVpDREtCOWh2OGlTOGVLS1hvV004L2FmalVSZTF6K2o4Z0JKM3lPL2hHQ2Fn?=
 =?utf-8?B?MFoyMDBkSUZiL1F2b2hsYS9TSC96WWMxelV5QWpHUFJxY29IRHY3ekRmK0sy?=
 =?utf-8?B?OG5zbURIN0hPUk53ZGlzS2xmOG84Q3c5Vm9TZFdnZHYrb3k4aHpoMzI5MXlH?=
 =?utf-8?B?Y0Y4MERUci9OTUovWHAwUnZXTWttUFM5YnlXRytYbERPd0FpcVpieWxBblo5?=
 =?utf-8?B?TGlBajVQczcrOTlpdkVGWk1vbXJZN3V0dE0yRWpMTU9obWtBeEFKQ3NhL3Zm?=
 =?utf-8?B?aUw5ZVVETDZya2svNkhKTCswK3U1VkFwTkF0VHVzZWZqbGRwSzM1U1kwR3Zx?=
 =?utf-8?B?ZStXZ21yUm1iZzFySDNOVUduS1Azb3NXRXZMVFVBc0kzQ1BFZW1JTVgvUk9p?=
 =?utf-8?B?cndMMlhPa0h5YVF2WWwzbnMvaXo2dU45Y0NkSlpxV2RrUUdxclpaaUNvdkVt?=
 =?utf-8?B?eFVTWUhrcSthU2wwa3RhbmJJMHQ5ZWhkL1lzWE1KUEJON1V6czBMVWNSM0dn?=
 =?utf-8?B?YlVGdXJkekF6R1VnUi9rMElTYmExUHN3V2s4cTh5TmlxaEEwUHpSZUpIWVZS?=
 =?utf-8?B?T3BYTXFkbldKK3gzRnJjc0o1eWp3N3UwTXdFRmE4Q3hKMjhUUnR0TmoxdEQy?=
 =?utf-8?B?S3FNL1puSDN4Rk53ci9CbmVtdGZtS0lubVZ1MThpRnRsckgxMzR2bmJmSnF2?=
 =?utf-8?B?bzFXMGt1alc5dC9WUzNYejZpY3Y0TFlxRm80M2pjRUZ3VktydEd1cE96VTh0?=
 =?utf-8?B?Vks3T0JNelNZQWVJZ2xsTnduRnZEZTR5RXFjdVYrb1ZYdWVkM2ZMQWd5NnNm?=
 =?utf-8?B?K2F3QWxOMWJaenh0allNWnNBYXFFdDhaMEZ1N0R6S3c1aGNtR0ZjMEc4NXhW?=
 =?utf-8?B?bWFDdm1ZWlRPa0tCM3EwUndCREdSZVNaSzN0Y1ZvOERyOUNyWkdCaDBrUmlh?=
 =?utf-8?B?Yi9xR3dndUs0cytIam53L0h2YnFndWRvMTlDWmdwbThPaFdOYlQrNEthREFP?=
 =?utf-8?B?K2VlNzBoRHdWTDhZTGxyRHpXa2kyM1FPMkw4TThOclMwL3pPM1ppL1pnMldR?=
 =?utf-8?B?QWhJVXVYSmNCT0ZGY25vN0JWWEhjc0M4cStIN3Jodm9OdGdPaXRqMHdrQVBP?=
 =?utf-8?B?VmtzcmVYR0xyVGVmSWgyOTI1VDQra0gvZkdWNmM4TTV6RGlkL0hGMmFDTUt0?=
 =?utf-8?B?STJlY1ZPekJGWDhYa1E4YldtN2FKMSt1ZGRvaVduc01ZS1RLMWhHakJXQlRE?=
 =?utf-8?Q?w0bV9DJNx1NSTO20pOqVy+IbY5pOcgBU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3c5ZTdHU0JWdzJTZVk1M25DRnJwSjFKTTBpTldQeDVmaGhWN3lTemV4R2o3?=
 =?utf-8?B?K2M3QXR4aTkycWVFdmRBZlhjeTZQTnlSaTdUR3VqcERRS0huRGFiT1cvS3U2?=
 =?utf-8?B?VzhOYVlxNndXdU9QMzdEOGMxREppYjFRRXZEbE5weXNNeEthMUtLcjBYSHI2?=
 =?utf-8?B?UExBYm1jd0tpdFhKQllXdGI1b0ZZM2ZuYlZaVTQ3ekZCamhzQkt5YmNJNjh1?=
 =?utf-8?B?aVVTT09GRWVYOUk0cUUvR2FvSDM4L3BjbUQxOGQxdWc5TDlTcjZTamQrRktN?=
 =?utf-8?B?eWhua1BlUyt5bjdCbHl1RmtocTllZWVRS210NHRqNWlRL3B3SGFCR0F3OGpR?=
 =?utf-8?B?YUl1Mkh3aE1KL01BWU9FNmdmaE5EcEZDckpDOS9XcFpYbkN3dURqVzVZK0NW?=
 =?utf-8?B?czZPSExlMks4ZUo0NndvY1VoNHp4Y25QWWROTVVTd3dYNVZxWHNDSGRBZzg5?=
 =?utf-8?B?bFpIWmJmWjkrd2hDRUVLMGlVQ01FU2JEZGhTQUc1QXV0VnRjdkk3c3ZuOG9L?=
 =?utf-8?B?RW1VOUNOZ3ppZ1NIY3RXOU1sNXVhNkRoV1dyQ1E5VHdrTjF6SmNEWkhIWVZa?=
 =?utf-8?B?cUNEWFpzaEl4ZFZUcXczTi9kYmRubkFnMnkzSlJnVGZad1EwcTNQY051ZzhD?=
 =?utf-8?B?YTlqK2NkTWVSdXc2OTYwRzB0WTZ2alV2ZE5NNmczZVI4eW9Tcm4wc2kyQXo4?=
 =?utf-8?B?WGpPMzJnampiR0J2dEdtbFpUd0V2dTM2Z1g0cngvd2ZTQStmdDZxNTR3RE9r?=
 =?utf-8?B?YUtaaytUK0xMVjg2bjRCcHBTZ0phTUZnSlk1Q0ovdHQvWGF5RGUyMXpnWE5Y?=
 =?utf-8?B?Uk9LdDJhRWxhYkI4dWR1NmtVaU1vM09mWkZCblF1MFVJdGVaUXVqK2NxOFpH?=
 =?utf-8?B?M1dmbGVxSEFncWNlNTRtdXg2VmM1V0R3eDV6NS9lSHZ2ZGFPV2lJazhYb2d6?=
 =?utf-8?B?TXlTZitSUDBoNzNLWUhONnptTXEva0VuWWlHSmhUTHZ3RWVXNGE3TDN5OGVh?=
 =?utf-8?B?bXZGOTdCYmxBS0NWS256YS9hNExucjE3aVI0VHM5RXdreXg1WW9wR29GRHlq?=
 =?utf-8?B?MmxuWCtHRk9xSWlmblcyTjNGbFdid2JRcHA4MitGcHNOZFRUV0R6cVEvT1Fa?=
 =?utf-8?B?S2g0NDZOVmxRakpTRi9wMnpGTVBsbW40WnlLc085NnE5OVUxYWQ5NktJRFhQ?=
 =?utf-8?B?cmQzdlRjeFJVTUM5QmtLRlNyN1JUbGtNVXlHeGxtdWNrUGl3MTJOcDNyZmF3?=
 =?utf-8?B?WFE5QUR5NGtsRFJ1YnUzd0VnTi9RbXV0ZmVMZDZHS2NoTHFVK3RyNzJQSEow?=
 =?utf-8?B?UHYvazdZa1RqMFh6anhaR0N2VHZzMTdWTG9xcjR1TStsU0JHN1hvNDFVdFFD?=
 =?utf-8?B?SnU3SzJZVEVIVDBtZ1daQVRiOHQyTnpoUGJnb2lEbWp0bExNSWdJRnIvRU9u?=
 =?utf-8?B?bjFpV3NESEtXa3RzK1VhWkxqUXJTb0xMdVVGRGpQTW5PQkF1Z1lkN3dZSHp1?=
 =?utf-8?B?OFl1K2FXMDBKOFFVcFpubmpMSVNoaUZ0NWVXWU9DZU9ZOXFHS0Mrb3FGUnFM?=
 =?utf-8?B?OWdVRm5URzhTT0FqalY1WDhVZVhLc25GNHIvMk9uREJHbldtanZRU3czTS9H?=
 =?utf-8?B?RHB2c0V0cWVjbTN1MGpCa09UaERwOWlLcjUzdFBrR3BLRFp4REVVZDNTcWx4?=
 =?utf-8?B?a0xOUUhYanMrMXdKVzFxMU5hOGkxQmVYSEN0NHhuZ1MvMkQrT1duUE9sTUJ1?=
 =?utf-8?B?WThMZENXVjdaZXFQT2J6OVk0OTVXMlV3WW1VUmo3aDNMd3B5SGtYYjc3b2Qv?=
 =?utf-8?B?VEFjeTFWOFM3elVrRTRPRmZqcGZxaG1aSERXMlU5Z1gvcXdtVGxpVTFIS1RQ?=
 =?utf-8?B?YW0rLzVFdTVNWXlNNm5OVWlkeGJxWTFxL0pSSmpNZWtUMVhLWUhXUWRQRWJF?=
 =?utf-8?B?MnhKbHUrNTNrRCtnQ0srWjR0OWpYS3BKWHkwSDVOTzcwd3NEQnRGcUhoNnJL?=
 =?utf-8?B?VWxzaDQrMnc4d0JzK0dXTVJzbXh6QWdYSEpTRVkzZnFIRlpReFpzQit5Q213?=
 =?utf-8?B?eDM0QVJrakE3UmRObFhpOWJwRlgwRHErTExRWVRqTUxVQkxsQUl5L2NTL0Zv?=
 =?utf-8?B?czFLMmI4MWRBVFhaSUxGTzFYYSs4dHdvWnlla2kzRXc0QTltNnkwQUw4dm1O?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e15258c-0a5e-4a50-f88c-08de102e00d0
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 23:11:30.3931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 88nYhNjo7iVbgkyK3W3gG9pxR+H+4ETEfSCC9V7nsofWnZrYTFCn2rjYfgipm6cGZUn7mFQk8r5ASThs3clpRDGhPP8BQzkLMYUs5g/Jzuw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8405
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

LGTM

Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
