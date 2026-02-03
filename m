Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68627E8B383
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 23:51:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED0910E315;
	Tue,  3 Feb 2026 23:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LNk6rtyy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7DDF10E29A
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Feb 2026 23:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770162677; x=1801698677;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=RMxPt9/WLG2eebnZxucVHN0U+cj98ch4Qu+TUENQCM8=;
 b=LNk6rtyyMXVj/uRCPSalR3LDNGWjwPDyrpsvdz6tQ2ZaRBXjVYGDKxgO
 Y7nNixzAExf7yDIlJEKY1GjMnfbdZK6SECOwonOk0wHTWSnoGhjvkU/Z1
 SInkJJWfFionorBV9TRK2FTnhjvcUTqXcMLQU649R2+kZXCsnUWWUweod
 K5wq8CiNWqiZL026VqJTRGZQIRqbLI4wBGaqZ1tRbBLurxe+oFCew83kS
 RkIcj+TUtCwRqt/8onqMZRAXPYEdOI3qVqe1bEOfb2M203B2dDbiJxMoF
 1PapZi1Cvbw3ccfj2eiZcT4GmhD/uulNfl7nqiLic6Z4a0tLRzQa1nWBi g==;
X-CSE-ConnectionGUID: v3fVikf/S/GoOeRNl4OG0Q==
X-CSE-MsgGUID: a9H9M5/jT3CIDuMkQgm8+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71381112"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="71381112"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 15:51:16 -0800
X-CSE-ConnectionGUID: OwxeAVW6R+i+J+ip0IEM9Q==
X-CSE-MsgGUID: HXNjYok0QHi6DcPm+MplUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="214475997"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 15:51:15 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 15:51:15 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 3 Feb 2026 15:51:15 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.46) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 15:51:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iLHWKRRot97IBNx+5pA6L+XqW3cWuwMOZujNf0QyJj9UvZvuv/rjrVBAVDsJ/bR/4w6wdM0oXKKWvvxL4QWW4cUf3+BUz550nV4qtRC7RNiB6z+0gIysCbH+Y0Qne8KJi2jjlrFPbkT4xTRhsUj/yrSP3ZkCOt1xGb0qFqw7/JLwu3VPEy1EJ90DPyCTJQM0QxJRDBqM9bioeXkq9CHl/oRf18bYND9HDlOeQ794JWddfxokkNyXOP+Sm1SELo+hMOsK9uA9Htz+ye7VfB2VOJfAmtHHh55RlLLQf/0K7vRPJUATBASHD+6mzcw8SMpoBUcXv6EtQwSQuv0+Fww44g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BaQnQdZXJ1OxnjjlhJsxg4bmE6YAjLjvJEuQ0mGWsLU=;
 b=YtUzm0JBhl5UYJOFeIvHYLmTcQD9b+1esPVememFP0efzl6hiF/nM6LmAJ3yukz3Z+DQsOHLr/PYzTv9Lvf5xCg1AfAOlE8ISSHu9JiJSkz0tnzm5ExA1Tbf3LpiKw809NFu31M4FHaoy4apuFaOXzqcxAHQ3HOGFnVJvN8BdliSJeBY7gj0p/gWzEHmVY93rLl7PicUR9Mo6bzjNL4M5Xx584RdRCEjNHeGDLRKfut9zECf5bAOLQaBwH8Oq4YPRiP3HW2CC16LkjtypNJg8lMMEvKNFaGUqd6LDyQkGUj/QEju9OXj7NqB7PEHl5MaCJ2V33/uB6kwFdz4LWZRXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by SN7PR11MB7417.namprd11.prod.outlook.com (2603:10b6:806:345::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 23:51:08 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%3]) with mapi id 15.20.9587.010; Tue, 3 Feb 2026
 23:51:08 +0000
Message-ID: <22e825ab-ab56-4860-8797-5deaab79ab70@intel.com>
Date: Tue, 3 Feb 2026 15:51:06 -0800
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe/guc?=
 =?UTF-8?Q?=3A_Test_GuC_v70=2E58=2E0_for_BMG=2C_LNL=2C_PTL?=
To: <intel-xe@lists.freedesktop.org>
References: <20260202231752.2797669-2-julia.filipchuk@intel.com>
 <177015203336.221748.18316880193602642279@a3b018990fe9>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <177015203336.221748.18316880193602642279@a3b018990fe9>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:303:8f::25) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|SN7PR11MB7417:EE_
X-MS-Office365-Filtering-Correlation-Id: 9de2e989-7114-491f-2f70-08de637f19c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTliUTNEVm9rSUorbkw0YXFGYXFrdVdjTGRaRHZVOFNoMVNnLzBNZmVJcjlq?=
 =?utf-8?B?Wm9pMHJkelp1QWVzR0JtWWtvdURhS2piTTVVK3hpUCtlanA4emFVbUZHMDFS?=
 =?utf-8?B?Q1RGQVJmK1pXREVRYjRHMGdHeFRiMmlxN1d6c2NOV1I2UklvNTQrNkh2d1g1?=
 =?utf-8?B?cjBBWnB4dC91bGNCZ1J0VngreFlkMHZDK1FYMDR0cFgyVWJIa2l2Z0w1S2Z0?=
 =?utf-8?B?UEF2RmdpSHdxYkRaL2p6TERMd1B2MEhwZys0RENDMWM5L0dGdTBNQ21LMk1K?=
 =?utf-8?B?RUFyMUZ0L0RUKzI0bFl1eWlldWUzODNENTB6czNjRXlzek5TVkpRWGlISUhk?=
 =?utf-8?B?VEdUaTZUSmt6ekpZSmE5QTU1OCs3Z1QwM1V1dDlOTit3TmgzWWhXQ1pHdVdT?=
 =?utf-8?B?QUREc1hUbmRQbW9ERDVESHh1S0hrQTFhdWw2bWVRRG1vZC9KTGpSVkhxL2dz?=
 =?utf-8?B?bmk4K0pqVHM5WGk0dVVicXVET0ZjYnkxdFpHUUpIZ2YwRWpsYmc2R0xHTG50?=
 =?utf-8?B?MU9kM25WN0pQb05Ld1hYUStUMWYybXhpdnR6ZmRoU1FCbDVNdnZjL2ttbmxC?=
 =?utf-8?B?VDF1dStrWHhscXZIeDhiZW5YcmJueW0wVFM1dzNhei8zaXM0MS8rajRaUmtJ?=
 =?utf-8?B?ZS8rdy9tSi9PcFAxM1pMU2NiQm9KOU1FSGZWQjhJcjRVeHFkQ2REWk1USUkv?=
 =?utf-8?B?UHpmYXdqK3ZmUTlSL3hHOHYwUXh6V3JxY3NhQmVLL2QxY3hwZFVKMjNuS2xw?=
 =?utf-8?B?L1BieDZkMWcrTUIwR0dhRnFPREN2VlErOEc4S0hPcGhxbUl0QlZuWTliYWRS?=
 =?utf-8?B?MW1mVi9vZG83NzRKaFZjUUxERDFjU3hmTk41TU1Vb1FrNkJIWi9NS1ZuRTk5?=
 =?utf-8?B?c3R6M1JIL1dkVnNNYmNyYlVQLzdiS1ZiSTBZUHJXVUg2a3NCZlp5ZDdtMnlF?=
 =?utf-8?B?eHNXZDhvc3JIazdaNmxoeVRHSG5SaXhjazlSYnVncEs5V1g0c1g5Sk00NUZD?=
 =?utf-8?B?Wm1PYzVEbUxqTmpSQ0Q0Z2lsTm9BbzlTMDY5VEU5MXM3aEdtOTFBWnVFSlU5?=
 =?utf-8?B?UkhqTXlLM3hKWGVyZDhpVjhBR0J1c1JFdzhQdUp0ei9ueTBCa1p0SjRHNHJF?=
 =?utf-8?B?MkYwYnlRSU44cFQyazVWSHJ5cHhKN1RYb3BOdEJYUmk2TGhpbWJXcWF3cUI1?=
 =?utf-8?B?MlZvRytwSGhNVERPclpjblZGZHArd3ZxK3ZTRnp2b3huRllDeTVLeWk2NDdP?=
 =?utf-8?B?dkdkTWx3dUhPS1lCV0szOFNBck10bUtvZUhmVGYvUGNhREs4anZPVXRGbmN6?=
 =?utf-8?B?TXBBZ3lxMUdITCs4dVlpUHprNHllcENaME5kZmVGSSsvMlVtUHlDMElXVHNW?=
 =?utf-8?B?aW45SUlOZW43d0R1ZWNiWWhFcTRKSW4yMzJ0TEgyUWVyTGJPNHBidjhLcFFS?=
 =?utf-8?B?anhDVVdpK1NrVGVZOUQ5OHg5MzMrR0U0eCt1c2g2Wm9pbWJMVFhaSzhoSDVL?=
 =?utf-8?B?RjlOSmNXRXpEemRSUkZtR1psOThTNWJUSnBPVFBBK09VRkJyNThUZ0U0NnVZ?=
 =?utf-8?B?clQ5aDBDUkdYdFdBemtySFZrU2JEdjdXR3FUd1NjY2drM0VVM3RsckNiTWxN?=
 =?utf-8?B?dnFpV2V0TkhXZVRMbnJLRkJCaGZCRHFkMlRtSlM3TDNjQU1MaDVnRGtWWVV4?=
 =?utf-8?B?b05yUlV1YkFiZUhQOXZNSnNualdEaXhYQit1dEN5Y3FJTkx5TnlMMkIvMkhj?=
 =?utf-8?B?NUVoY21iRmJrdHV2SEN0eGJoeE5kQUVIekE2aUdRblphbzJJbk5VTnBOYkVI?=
 =?utf-8?B?UWYvQ3NvS1NjYXVEelN4MEc1VTJOZVdxaVNPWGFadUZqdTRLSW5qWjAxMlZ5?=
 =?utf-8?B?NnA2d0RrRGJ2Vjd4eU1oNHN4WFE0Zk1YQmRGZHVoeGFIbG10OG1oT3J5TlJT?=
 =?utf-8?B?SkZvd3dLK09peEFwc0J6WFV4TDJLalljeGNvejZqNU5iWng5aHVybWV0THg4?=
 =?utf-8?B?SEI2UkNTTVBFemJkV3A4RS9MNjladmpsVjJheGcyRllUcCtjck9jaDdYa084?=
 =?utf-8?Q?sCj3n0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UW9FQUNmUllOZWJGeVczTGtObU9OVTZ0YXlHSkRXZG1hZlhDS3l0QmU5SjJJ?=
 =?utf-8?B?UUtSZVlxbVBXZ2FPZjNTcEU4bEtuZzRMZm83Sm5JMjBKcWpFLzFLb04yVXM3?=
 =?utf-8?B?YVl0TGROV24wMTc1NFZFWkdXTFkyUitOVnl5VUEzMmFrbzdvbVd6b1lxbElD?=
 =?utf-8?B?YlQ0azZDL1Q0cnJ2WWNpUXRJSndjU0JVSStwS0htRHRmbWJ4ZVI2VzMvY1o2?=
 =?utf-8?B?L0hEUklFcWlUUGN4Q1RWd2lzTFlVVW5uaXFyVS92bWRoT2RvenYxOXRxU1pv?=
 =?utf-8?B?cG0wanhUWW5kRk9MMUhLZlNuZkxzdEt4ZU9NVU9RVzZDMUhiOVRTWjFtakdo?=
 =?utf-8?B?cjhHQVo0T0pTU3gwVjE0NzB5YW8raDFNM1dCZnQ4YWZBZEdZZ1Vmdjd2UWgz?=
 =?utf-8?B?YVlWcEVsMTYzZzJwdHJxdnlsdEcrZVNubFp3aXlXS2hDRXNTYUFhY0VSMGRN?=
 =?utf-8?B?dHBIVDBNS29IYUdKL0NzeVpzTGhyWjNvUUVScVB0ZHNFcThmV3VKQUh5Z1Zz?=
 =?utf-8?B?Mk1YanVrakpzcnFtdWJyZ21RWmYxV04zV1ZhaWxjdGNDV2pGYlg2Q0xZL3d1?=
 =?utf-8?B?MjVOOUI2SklJSG5NWUdHa1lxL0JOV3Y3Qzk1K0diNmpwd1A2eWpGS05BWlBC?=
 =?utf-8?B?bVVXS2tlZTdYcU16WCt2ZFFGSlk4cXRpMXJ0dHhmWnJQWGlZclJQMEtQdHFx?=
 =?utf-8?B?eUY3azA5UnVWNkFmZjh4a1FLOWdwOWlnaGE4OWVYNUQxcVN6anFMQ2h4MHlG?=
 =?utf-8?B?SjhyWklwWmI1aEpEVi8ySmtMbi9SNnJOekpPS2ZpQUV0Q3lJYzJleHVSMk4v?=
 =?utf-8?B?RlNsOWdhU0kvM2lGeklMRWFzd3NDblpoS2xXZGhFQTNtRkFpajBXb25iK2tr?=
 =?utf-8?B?UFJxNUhGa3NXYjMzM3duYXU0QWdoQWlvRW1sanBXVmV3RFRXNy8ycjhHZUEv?=
 =?utf-8?B?MldnVDB0cFNWNVF0UlcyL1o5N2wxRFRsaWg4M0YwRDAvdk1JaWd0T1V3a3dr?=
 =?utf-8?B?L1ZvaWp0YzFLRFJrVVRqSEF6RGVLcCtNVm1XdXEwVW1VS3k5VUZKazNpRmN6?=
 =?utf-8?B?LzVBcG1mWDZDQmdzTTg2OFgzbHk4UWF5Y0pRRUREWVM1QUVRZzcxN0l3NXNk?=
 =?utf-8?B?L1Y1RjNRN2VOdE9TaEpEZFJGRjRxUENwSHpXMVozWHBvUUJPeStJWTc0ZW04?=
 =?utf-8?B?bWh2eEZDNXM4WXRGam9XOHdiZ2dWQjh3V1lhb0FWbjhicmZ5bU5lZXBqZDFX?=
 =?utf-8?B?eklxT3J0amZUNHZQUWlMbXVhTWFmdEtQaStpbXR4dDM5YUdFSTJPTnZjVnRG?=
 =?utf-8?B?eUZUaFplbUZRL2VGOVRtT2hCcFdBWFlFQXYzRm9teXNSYVFETEFMZEF5MFFR?=
 =?utf-8?B?Z2pmaDl4bjNBdjVCL1g3YVQvZmhqeWRlQVd3cUE2a0c0V1ZES1ZZYUZ6L0s0?=
 =?utf-8?B?ZlF5VFBpbHdMT0c5Nm1PQnoyaE5CUDlUOGRPZSswblhJMTlrRDNHNTFucXFJ?=
 =?utf-8?B?NldVWVUyY21aZ0E0V1ZaMmJMS05YMXNDVnFvSGhHUjZudzJVc1VOcFB3V05m?=
 =?utf-8?B?MTJpTFpsaTZoL0RzcVhkZTcxZHJkTUc1bkFQQyt5N1RHTTRLcTF3enBkelMv?=
 =?utf-8?B?b296eDBKQTNPOTBsQ2VFOWR4OU1vOXRRTFJ2azBSQm9INTd0cG9nOU45eWYy?=
 =?utf-8?B?QlJBSExUanQ2NnZTajlVS0dwNEVpZjVkSENaRWpVQUhhSUNxdTY3Kzhmc3No?=
 =?utf-8?B?blpka0hHcFI4MTZraHlOQmN5SFBMZVQ3SEl1S1pUMGI1aitnak5yYzJySG5U?=
 =?utf-8?B?WTZoUVpYb2R5QnJ0eUJvbC9janl1L3J2L1daRXpuZitGNUNSZVR4REVuaVZi?=
 =?utf-8?B?VEc3M2s4VXdpNlI4N04zRzhudzhta1h1cndEOTdJNVk4OGo4QVc1ZjUyT1lk?=
 =?utf-8?B?VHpwRm9SWTFQZ2JiZjBtZUhYcTF1VXdydzAxMGpMam9BK1N1bEtJK3JydCts?=
 =?utf-8?B?d09EYThtWEFVRFRXVnc1c1o0MTRjZ0h3VmFuNjc0clpBT00wcEFiSEpVYlh1?=
 =?utf-8?B?TUhydDFsNTZNQkRFZ0I2QnBGTlVVcXFob29hMWlmdE5BVjFydHM5YkhxWlRJ?=
 =?utf-8?B?dXNhWlZaU0R5NzJ4QmptOTNZQThqV1JZcmFmc3dmVEE4bVF6VE1kVDI3Q05q?=
 =?utf-8?B?dEUwU29IakJocE8yQXBPMGZsckp5L3NuWXVycm41bHpra2VsMEd5TGwrcmM4?=
 =?utf-8?B?RE05bHVIMVU1RjcyUG9UYUZoRFdNOURKNXZzcmU5dThEMXdjUGZha3M1TEZs?=
 =?utf-8?B?RHBxbW9ZTExQTEZyazFPWkNxOFU5SDB3TmpKZEdpejVYYzRzKzBQd0h1bkRa?=
 =?utf-8?Q?eNkVGwY+j0UJme9o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9de2e989-7114-491f-2f70-08de637f19c1
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 23:51:07.9409 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nqbqOylVoWnQRqScpf+el0NzY1RWsQhUmwiFpsR2UzxZFRAS3bzPSIs0D3X9sgESuux5NK0l/BXOJ7WVPc0OgIv7GQ8WgF5V98I1aOP8u5M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7417
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

> #### Possible regressions ####
> 
>   * igt@kms_plane_cursor@primary@pipe-d-dp-2-size-64:
>     - shard-bmg:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/shard-bmg-9/igt@kms_plane_cursor@primary@pipe-d-dp-2-size-64.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161041v1/shard-bmg-2/igt@kms_plane_cursor@primary@pipe-d-dp-2-size-64.html

Not an issue. Assertion failed in display code unrelated to GuC.
> (kms_plane_cursor:2462) igt_pipe_crc-CRITICAL: Test assertion failure function igt_assert_crc_equal, file ../lib/igt_pipe_crc.c:112:
> (kms_plane_cursor:2462) igt_pipe_crc-CRITICAL: Failed assertion: !mismatch || igt_skip_crc_compare

> 
>   
> #### Warnings ####
> 
>   * igt@kms_content_protection@atomic-hdcp14:
>     - shard-bmg:          [FAIL][3] ([Intel XE#3304]) -> [SKIP][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/shard-bmg-8/igt@kms_content_protection@atomic-hdcp14.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161041v1/shard-bmg-5/igt@kms_content_protection@atomic-hdcp14.html

Not an issue. Content protection needs HDCP support. Some machines in shards may
not have this. `Skip HDMI-A-3 (Sink has no HDCP support)` So test is not possible.

> 
>   * igt@xe_configfs@gt-types-allowed:
>     - shard-bmg:          [ABORT][5] ([Intel XE#7169]) -> [ABORT][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/shard-bmg-5/igt@xe_configfs@gt-types-allowed.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161041v1/shard-bmg-8/igt@xe_configfs@gt-types-allowed.html
Not an issue. Existing issue mentioned in previous test [Intel XE#7169] that is
not recognized.
