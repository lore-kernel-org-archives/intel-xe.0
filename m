Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD91D43341
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 19:05:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9010C10E828;
	Thu, 11 Dec 2025 19:05:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nwan0Kfv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD0110E828
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 19:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765479955; x=1797015955;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=QnL6KYF0za2UYu1S3H+2K8jrq9U2cAj9I6wlPWcWuV8=;
 b=nwan0Kfvejg95fd47byQe8V1fyLX5HRnnT6tvYOtqqQ7CfeehOuL2StO
 k9tblRtmc1/znQ8CyN2T8dFe16t8it+kw1COZcyu+QNOfsbjovz7qmy+N
 5mxrcHcBvnAFdASt4WsaVWcen3AeJhwf+CK9bNljhrnxD1i7QpRvSLEef
 1tzPNURQ+NGPYHCIJZLhYNvYm+DO3IOSYDsm2pAZP4VkVSZuhESfnqKXm
 8+bb4GtlLm33E1Xb2lB3akBqKfuWu7rXU6ddkz0hXWpOlX20wKaNHto4H
 QkoysWspOuvn1miHfMIUdJTtLoHKQEnJmMi0PPL9fPe8NI80rm2N5ADei A==;
X-CSE-ConnectionGUID: l7nwTUDuScaHARaUvDPSKQ==
X-CSE-MsgGUID: CETcjJRgSmS7mGYA7EDkHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78935036"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="78935036"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 11:05:48 -0800
X-CSE-ConnectionGUID: z5OLajTGRtOdveiQXN03Sg==
X-CSE-MsgGUID: Kz1EJK5QSpGYunfUbUG9/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="196163719"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 11:05:48 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 11:05:47 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 11 Dec 2025 11:05:47 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.58) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 11:05:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jjK4WjfPWSamGcq/q4Q9qO8kdJwJXPW3XUBqVvREA3kMxQuqrcoQZ813SowNCgTHqXusA22lK/loudd6M1uC7/999JudnlxQryY8I8/iJMNRsxMUpnGGUx9lO0k+uONDdpVVFutvBbtZHLjZOLmqq7aAUcIVqVhjsfxMr9YQbLBqcKrJC+js6/TpVDyxDx7hoqLWtY88Mf04wLFU7f7RotMSLRePtT7cZIa+3+R9tnMPEsZIharbUqfeyZSv7aWg8In5eFWVfdvKtSoDwiJO8jfpCh/t2OH8F/Wla0GYt+cl6Yv71TIMKh7HdFj+28vMts4Xu+p2u6ch6dlaHSlRng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cBf/D2RVgfJul/8Y87vWHUnxG3Kt3oUKlHdRr33n+lY=;
 b=aSnyzaGT1j96cxowRLrOO+TXN0K07ZvDdq79Skm0QDU3IqOxdWL3HODizVeQTPI6ZwnwYei/gXI+I1WML/sqCToQz6GYhKcq0fZZQ0DJNp7njIJbn+E3aTqov+TyTNpCx3EON5nQ5EzxjswGb6HxX3oJS3wR4gchcfIbGXS5KpfistL5/pDTRBlpQHDzSmQKL/nyaYl2XJM37bpDxgCuftyEGiHKWudQ4B5VgrNSc8RFIgfZlwsPVgzLs3/+5XE/Pq1IjAXoBTVp9018HoCI2Ge2+EUjiBw0uBJRvk+FUiYi2gvf6dRcA7NA7o1fbZpeLw+W05HSIhL+P2Eh7fA0pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS7PR11MB7949.namprd11.prod.outlook.com (2603:10b6:8:eb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 19:05:45 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9388.013; Thu, 11 Dec 2025
 19:05:45 +0000
Message-ID: <46e7d8ec-e211-49aa-9458-e53957f187b5@intel.com>
Date: Thu, 11 Dec 2025 20:05:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/12] drm/xe/sriov: Scheduler groups are incompatible
 with multi-lrc
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251211015700.34266-14-daniele.ceraolospurio@intel.com>
 <20251211015700.34266-19-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251211015700.34266-19-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0079.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::32) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS7PR11MB7949:EE_
X-MS-Office365-Filtering-Correlation-Id: a397d342-e928-4ac9-d8ea-08de38e84976
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGZlcTU5TlYxdFZLN3NGV0lBZkN4alVlZmo2MXJWcE83ZjR3U3F1N2pJcDBm?=
 =?utf-8?B?WklFeVhubWRHK28xZGlwV0dXR1hNMlJGcjBQelhibFBFbzY5NHhNUVB3R2FV?=
 =?utf-8?B?NVJ6VjRXRi9abC9Hci9kT3F2S1ViaGN4L3VKN1R0eHJxQU5IY094S2o3Yk1S?=
 =?utf-8?B?WGxSNmE0ZVNCcitIRFJGNnEwdzA2UktLMk00Q2t3b3RjR240WVM2OEdraFd0?=
 =?utf-8?B?UmVXNENZbGdCQVlSdzJLR2lKcUZVY2pDRDk4SXJ2czdqUThUY3BzMVN1aS92?=
 =?utf-8?B?dHU3L05GWmFRWE5zZGRNbFFnSGdMZHV6L3BQVGREQ3lwN0FUYTlvZDIxOVNt?=
 =?utf-8?B?amxkcjI5MXBTdUdwRzRFamdBLzV1cjRTZzdFTGlsdGdWREczakMwREFSTUVj?=
 =?utf-8?B?eDlhZU9FR0J5bE5rcVZrblN6Nm5UM053K1JhbEpqT1ZBQUt4ampYM0M4UFBW?=
 =?utf-8?B?ODhPT3lLL3V4Z1dZS25zSWg4U09acnhFRHhpZnhZdVhxczBDbnZ4SHVyZUF2?=
 =?utf-8?B?Zm4rNHUzSk9zSnczaUhjWXJvUm96YnFSMmVPbEM3MGRvdjRjakxuUzcxZDlj?=
 =?utf-8?B?aVVlKzVEZ1BRWmw5cUJaRkt0bFVhZExqMFZmN2djSllNQ0Q5VkZJSWg2QThS?=
 =?utf-8?B?bHNlTU9zaG03MllWbG1BTjVRK0kzbkQzZFpaZXd3MzkrMjVqVTFtZW1pbFI3?=
 =?utf-8?B?QlM3RnNlMExrT2lCS1JiL3pLYjA3bzl0RGlsRFBZdUl4dDNmWlUrRlpmL0lw?=
 =?utf-8?B?N0R4d0psc0xKRkdJTmtESlZrWmplVDlwd0Uxc1FuY0x0YkJGL1JtelJ5c1dq?=
 =?utf-8?B?d2gwZUhPaGFLOFF0TkZKR1NvZGprVjZTSnRVbWxZL2kxOVRJREc2RHlnL3Z2?=
 =?utf-8?B?alRBak5VblRmQyttWEFBUDY2ZENjVHdmZVdnM2pHU2NpR2p3cDIrUEJERWtR?=
 =?utf-8?B?NC9oU25aQmJ0N1pFWk5zVjhhb3ZKeG9ndFZUQmZCVGNMYXFjdGd6WXZ0Z1pi?=
 =?utf-8?B?aVpyVTk1WTlpUXFnTHNMMlVGcll6K04raHphQlNmdktjbFBPTE1ONlRHQlJw?=
 =?utf-8?B?RDUwbUoyd0tIcUpnSG5BWHN4YXc3SW4wbmprMTRySGZ6bE5kVlBBdXBzd0RC?=
 =?utf-8?B?QkJkQzQxdnRmdVhCL0J0WGlNWlJXT1kreDJLQUo2WTdzeGxnOVAvYXcxNnJj?=
 =?utf-8?B?aXVINUM1NVhvZVRyOUFHdWEybGtsYStmOWZYNldsaGZaY0NhaXpEM1B6MEZ0?=
 =?utf-8?B?anNDSGI2ZDNXWWhIcHRxOTFRSTVSOGtwRGQ4YWVUbjFjN3dHOE1EOVpwOStt?=
 =?utf-8?B?ZUVWUDZLZE9QZjVBRGNlT1pibHFVUWJkTFd3RWpvV1BPN2V5dndLb2pJcHBL?=
 =?utf-8?B?Z0ZCRXM3V1RGQmNqRnZBOFFuZ3RhL2JraExMdXM2ZmRUUWlwK1Vic1VTMnpW?=
 =?utf-8?B?VHZ0ejRYY1UwKzdtNUVyTVlmRWU0bmdpOXpDVVdJa0pFaUNEeDBmUG1mSUgy?=
 =?utf-8?B?VFhUMExKZXQwMXJiNHRwT0lJZmREVHVLWHUzbzRWWElvMXA2VHdvQjFHS3hr?=
 =?utf-8?B?ank4cWhNbndqb21NWlY5TVBUZHl1SmQ1NExzS3dRdnlXT2lueWNFeStOS0ts?=
 =?utf-8?B?Rk9XL3pGeUcyMk02dVFpWG9mRW1hTmRyZE1GK250eXF5M3FaTnVyYlRLQmE2?=
 =?utf-8?B?bG1PdU00ZWNmL3FMcXBjbzlVQnQzSzNvSVNJRmNLNGhpdUcrQVAwNE8ycFha?=
 =?utf-8?B?d29uN2dtcjNvYWVZR0xHTEd0NTdmQmFPNGtIWDdpSThVWUVWMFJNYWVpWisy?=
 =?utf-8?B?WDZGa00ybWNuRVlPbUNUWTZtM09vNmVudHp0SzYvdnNCTkgySGxwOTJidmlD?=
 =?utf-8?B?TU16elJYRnZiTVNuUXgvbko0RFZaTll6bjB5b3Z0RUUwYU12MmM4THdYc3E0?=
 =?utf-8?Q?UBdc8TeofikK/ym3iwFMlbu+4dMl5OKX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0k5TnFEZEV4Q2NiYkZKbFZtdEdjWE9keEZMQXdGeXlTdWR5bUR6UlBHOU1Z?=
 =?utf-8?B?L0dxaVJoK3kwQldpWDdxN0NWV3IzbnZYLzRpc1RFR2FjLzg2eW84bHpKY0U3?=
 =?utf-8?B?NFhwZkwwZXJWa0h4ZHh1T1QvTzlwc1N4aFo4Ynh0T2FCdmVxUTdFUFcyUGFR?=
 =?utf-8?B?aWdRV29NVkdSUG9tdXpLZ0tYdmpXeE4xMEU4eWcxclRiY1FvNzljWmJodTh5?=
 =?utf-8?B?cUx6bHl5bVhEY0poWGQrbldsVlZNMnF4b043K1RDTkd6cG0wSTBvdmpDQ3Zp?=
 =?utf-8?B?RXRxRVpDR2pWbjN3VHVBaG9oZGVDclBVTlY5UGVKM1ozMUxWZ3FRMFUvcWJX?=
 =?utf-8?B?MUZnVnJVdEY0aEdFZjB3dG4rMzIySTdsOVY0cmQ3VGVKcTJFWHJ1M3F6ZXh3?=
 =?utf-8?B?aXRVbG1jWnVqbEx4bGk5U3NOWEhrNkZiQVFGOERZVUxYZ1k4SVovZEdhdTli?=
 =?utf-8?B?dXF3NnFiTnlwdlduVlU2N0I2N1J3Sk5YMzBBdU5kVEFNME1Ob2RaNUZvWUxJ?=
 =?utf-8?B?V3N1UFlUZTZ3aFAyb3Npc2R3ZFVJN00wM1FwUUN0aXA5RnZaWGVINWZ5d3Fo?=
 =?utf-8?B?bGxHa1ovYWtHbW44RXp2Y1VhbU9RZFNNUkY0THpwS1lWZXd3OCt2MlRwdlAv?=
 =?utf-8?B?R0ZnRXpXZE5qcng0VU0wNFRzMGczL3lCdTVQNm5BRXhEMEF4OXJqcTljTkN4?=
 =?utf-8?B?TnVNZFdLcHRCQkVRbHMzWXJhdjJ4YXNCUFVlenhkV3R1UHlDRnd3aFVWR2ZH?=
 =?utf-8?B?bDljaUJHanlkMmkwZnhGaXc2WC85K2gvZXNhdEpRYUV1cjRzcHIwSWlOeXVh?=
 =?utf-8?B?dENscHYraUZnenFTRDloTFlaREROVXZiK1ZJR0pyWnRBUkYyQnFiUHkxV1J0?=
 =?utf-8?B?QW9DVlMxaTRleW9uWCsrNGdhNzNuMlpHUktqK2dRODg2eDU1TWVOZmFwQXdW?=
 =?utf-8?B?UXI0c1RwZUdTZjB1djZTc3hyc0Q1VFNIZGdUZm13VTdqVStvMHF6aFBUblk0?=
 =?utf-8?B?d0V5Ky9DTEJFQklsMTdRK1V3V2wxWXdlR1Uyd0g4VkZEN2ZQN0ZlNFBUcXpx?=
 =?utf-8?B?eDFtdUswRXhDK2l3aWtMZXp5d3krMkFxN1IxYkNNY0ZpR2hnSHZIS2krT1Jl?=
 =?utf-8?B?WnNTSFNOTTcveENhdkx2R1VpYTl4aHVhLzRQblBicHRzcnNLVDJkMmlvdDVP?=
 =?utf-8?B?TCtvaUtmSW5qdFVoemxsblFTSW1FZkpBWnR4RmV5eE5ZWEtBSnRpVWNQOWph?=
 =?utf-8?B?eTEwVUt4UnNORElsUUk0TkdKYk1qOStoS0c3S0RMdXRFblpQalY0WVhsd1o0?=
 =?utf-8?B?bEN1MGN4WGdCendicGF1YS9NdVYxaDNBaFhvb3ZJR2p3MGpmdU9pd0VyMVNj?=
 =?utf-8?B?d3dOWGNyUW1zUW4wTTRaVGYrWS96blFOZkVJek9sSkJtS0Z4RFNMWjVwVEkr?=
 =?utf-8?B?N1g4TmlmdUFSZWFzbWZYM2N0UzFvUHhSQlJKbExtSVJIQU9GSmVMZlpWR3p0?=
 =?utf-8?B?b2J2eTNjMTBRN05ZcU5lUWpPclJWTUhvcFpEVndjZTRNcjZ5Wi9lZjllRVdE?=
 =?utf-8?B?R3ZaMkNRUnBXUHU4d0RTVys0Vzl5Z2l2QXBDOUZpMkd4RCs4akk0UnFLUnJV?=
 =?utf-8?B?WERCNnpBNis0czJzWG1BK2RPNkZLOGVoWDBrQlRKWGZWMDFCY29idXRwNTJh?=
 =?utf-8?B?OUVjWGIzVGFZUHE2cGtxWklWSkVpM0E1clNoSEw1VUNoeEVBZG5GRVRMZDZS?=
 =?utf-8?B?RnVRZ0dkbXdTVm1zRXlBbVZ3ZDN6TkdZNW94dTMrck1FTkl1YXRFOFcxQnlp?=
 =?utf-8?B?NlRpSHVFNHFMUlZaZE5jdkliU0ltSURTbU1wR3ByVldYTFhBU3FjcnplQ09E?=
 =?utf-8?B?cEJ0Yjh0K2hGMmNTRk1tTlQva3VITjFjdWlCZXc3RWtMNlplMGQ2Y0FTM1VB?=
 =?utf-8?B?VW94Uk04a1F1OE0yU2FhMnVQajUwOTlidTMwUTMvUVo0Y1hJUVJVYzFjSUZH?=
 =?utf-8?B?dUdBMHo2WEp4eGNydDhONExwVjVIQVA1cDZmb1l4Q29WWWlNS2JpVk8yaG1V?=
 =?utf-8?B?WHdHbzdwc2ZETkV1Wml0dnI4ekFMcWlLcEs1N2tpaUdZY0NITGRySHVyMktt?=
 =?utf-8?B?WHZYSEEyVnZqZ013UFlBam81cnRTVGYyYjZINlVGQTcvb2tlQ1hrNGFmTjd4?=
 =?utf-8?B?Mmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a397d342-e928-4ac9-d8ea-08de38e84976
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 19:05:45.0387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dGr8jK7S040V0hzIXAFpYKccq5xfPKaMqeAb6IHRqi2hcwyUlCf31TL6yt2hf5zyMZTZs02KekbQp1O0PXd+fzV6dyaD9nf+vj5ZUeXk9rk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7949
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



On 12/11/2025 2:57 AM, Daniele Ceraolo Spurio wrote:
> Since engines in the same class can be divided across multiple groups,
> the GuC does not allow scheduler groups to be active if there are
> multi-lrc contexts. This means that:
> 
> 1) if a MLRC context is registered when we enable scheduler groups, the
>    GuC will silently ignore the configuration
> 2) if a MLRC context is registered after scheduler groups are enabled,
>    the GuC will disable the groups and generate an adverse event.
> 
> The expectation is that the admin will ensure that all apps that use
> MLRC on PF have been terminated before scheduler groups are created. A
> check on PF is added anyway to make sure we don't still have contexts
> waiting to be cleaned up laying around.
> On both PF and VF we block creation of new MLRC queues once scheduler
> groups have been enabled.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

likely this patch could be easily split into PF-only and VF-only
with that,

	Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

and one more nit below

> ---
> v2: move threshold handling to its own patch, move MLRC check to
>     guc_submit.c, hide SRIOV interals from exec_queue creation code,
>     better comments/docs (Michal)
> v3: s/query_vf/vf_query/ and move the function closer to the
>     caller (Michal)
> ---
>  drivers/gpu/drm/xe/abi/guc_klvs_abi.h      |  7 +++
>  drivers/gpu/drm/xe/xe_exec_queue.c         | 19 +++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c        | 17 ++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.h        |  8 +++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c | 28 ++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h |  1 +
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c        | 61 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h        |  1 +
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h  |  2 +
>  drivers/gpu/drm/xe/xe_guc_klv_helpers.c    |  3 ++
>  drivers/gpu/drm/xe/xe_guc_submit.c         | 21 ++++++++
>  drivers/gpu/drm/xe/xe_guc_submit.h         |  2 +
>  12 files changed, 170 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index f0a87a1cb12f..5f791237d0ab 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -48,11 +48,18 @@
>   *      Refers to 32 bit architecture version as reported by the HW IP.
>   *      This key is supported on MTL+ platforms only.
>   *      Requires GuC ABI 1.2+.
> + *
> + * _`GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE` : 0x3001
> + *      Tells the driver whether scheduler groups are enabled or not.
> + *      Requires GuC ABI 1.26+
>   */
>  
>  #define GUC_KLV_GLOBAL_CFG_GMD_ID_KEY			0x3000u
>  #define GUC_KLV_GLOBAL_CFG_GMD_ID_LEN			1u
>  
> +#define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY	0x3001u
> +#define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_LEN	1u
> +
>  /**
>   * DOC: GuC Self Config KLVs
>   *
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 226d07a3d852..df01c0664965 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -16,6 +16,7 @@
>  #include "xe_dep_scheduler.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
> +#include "xe_gt_sriov_pf.h"
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_hw_engine_class_sysfs.h"
>  #include "xe_hw_engine_group.h"
> @@ -718,6 +719,17 @@ static u32 calc_validate_logical_mask(struct xe_device *xe,
>  	return return_mask;
>  }
>  
> +static bool has_sched_groups(struct xe_gt *gt)
> +{
> +	if (IS_SRIOV_PF(gt_to_xe(gt)) && xe_gt_sriov_pf_sched_groups_enabled(gt))
> +		return true;
> +
> +	if (IS_SRIOV_VF(gt_to_xe(gt)) && xe_gt_sriov_vf_sched_groups_enabled(gt))
> +		return true;
> +
> +	return false;
> +}
> +
>  int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  			       struct drm_file *file)
>  {
> @@ -810,6 +822,13 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  			return -ENOENT;
>  		}
>  
> +		/* SRIOV sched groups are not compatible with multi-lrc */
> +		if (XE_IOCTL_DBG(xe, args->width > 1 && has_sched_groups(hwe->gt))) {
> +			up_read(&vm->lock);
> +			xe_vm_put(vm);
> +			return -EINVAL;
> +		}
> +
>  		q = xe_exec_queue_create(xe, vm, logical_mask,
>  					 args->width, hwe, flags,
>  					 args->extensions);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> index 0d97a823e702..fb5c9101e275 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> @@ -284,3 +284,20 @@ int xe_gt_sriov_pf_wait_ready(struct xe_gt *gt)
>  	pf_flush_restart(gt);
>  	return 0;
>  }
> +
> +/**
> + * xe_gt_sriov_pf_sched_groups_enabled - Check if multiple scheduler groups are
> + * enabled
> + * @gt: the &xe_gt
> + *
> + * This function is for PF use only.
> + *
> + * Return: true if shed groups were enabled, false otherwise.
> + */
> +bool xe_gt_sriov_pf_sched_groups_enabled(struct xe_gt *gt)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +
> +	return xe_gt_sriov_pf_policy_sched_groups_enabled(gt);
> +}
> +
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
> index e7fde3f9937a..1ccfc7137b98 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
> @@ -6,6 +6,8 @@
>  #ifndef _XE_GT_SRIOV_PF_H_
>  #define _XE_GT_SRIOV_PF_H_
>  
> +#include <linux/types.h>
> +
>  struct xe_gt;
>  
>  #ifdef CONFIG_PCI_IOV
> @@ -16,6 +18,7 @@ void xe_gt_sriov_pf_init_hw(struct xe_gt *gt);
>  void xe_gt_sriov_pf_sanitize_hw(struct xe_gt *gt, unsigned int vfid);
>  void xe_gt_sriov_pf_stop_prepare(struct xe_gt *gt);
>  void xe_gt_sriov_pf_restart(struct xe_gt *gt);
> +bool xe_gt_sriov_pf_sched_groups_enabled(struct xe_gt *gt);
>  #else
>  static inline int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
>  {
> @@ -38,6 +41,11 @@ static inline void xe_gt_sriov_pf_stop_prepare(struct xe_gt *gt)
>  static inline void xe_gt_sriov_pf_restart(struct xe_gt *gt)
>  {
>  }
> +
> +static inline bool xe_gt_sriov_pf_sched_groups_enabled(struct xe_gt *gt)
> +{
> +	return false;
> +}
>  #endif
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> index 7738d515ea9e..7f8dc2b56719 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> @@ -16,6 +16,7 @@
>  #include "xe_guc_buf.h"
>  #include "xe_guc_ct.h"
>  #include "xe_guc_klv_helpers.h"
> +#include "xe_guc_submit.h"
>  #include "xe_pm.h"
>  
>  /*
> @@ -583,6 +584,19 @@ static int pf_provision_sched_groups(struct xe_gt *gt, u32 mode)
>  	if (xe_sriov_pf_num_vfs(gt_to_xe(gt)))
>  		return -EBUSY;
>  
> +	/*
> +	 * The GuC silently ignores the setting if any MLRC contexts are
> +	 * registered. We expect the admin to make sure that all apps that use
> +	 * MLRC are terminated before scheduler groups are enabled, so this
> +	 * check is just to make sure that the exec_queue destruction has been
> +	 * completed.
> +	 */
> +	if (mode != XE_SRIOV_SCHED_GROUPS_DISABLED &&
> +	    xe_guc_has_registered_mlrc_queues(&gt->uc.guc)) {
> +		xe_gt_sriov_notice(gt, "can't enable sched groups with active MLRC queues\n");
> +		return -EPERM;
> +	}
> +
>  	err = __pf_provision_sched_groups(gt, mode);
>  	if (err)
>  		return err;
> @@ -630,6 +644,20 @@ int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt, u32 value)
>  	return pf_provision_sched_groups(gt, value);
>  }
>  
> +/**
> + * xe_gt_sriov_pf_policy_sched_groups_enabled() - check whether the GT has
> + * multiple scheduler groups enabled
> + * @gt: the &xe_gt to check
> + *
> + * This function can only be called on PF.
> + *
> + * Return: true if the GT has multiple groups enabled, false otherwise.
> + */
> +bool xe_gt_sriov_pf_policy_sched_groups_enabled(struct xe_gt *gt)
> +{
> +	return gt->sriov.pf.policy.guc.sched_groups.current_mode != XE_SRIOV_SCHED_GROUPS_DISABLED;
> +}
> +
>  static void pf_sanitize_guc_policies(struct xe_gt *gt)
>  {
>  	pf_sanitize_sched_if_idle(gt);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
> index d1b1fa9f0a09..f5ea44dcaf82 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
> @@ -21,6 +21,7 @@ bool xe_sriov_gt_pf_policy_has_sched_groups_support(struct xe_gt *gt);
>  bool xe_sriov_gt_pf_policy_has_multi_group_modes(struct xe_gt *gt);
>  bool xe_sriov_gt_pf_policy_has_sched_group_mode(struct xe_gt *gt, u32 mode);
>  int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt, u32 value);
> +bool xe_gt_sriov_pf_policy_sched_groups_enabled(struct xe_gt *gt);
>  
>  void xe_gt_sriov_pf_policy_init(struct xe_gt *gt);
>  void xe_gt_sriov_pf_policy_sanitize(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 3c806c8e5f3e..e0ab1a7a76c4 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -612,6 +612,46 @@ static void vf_cache_gmdid(struct xe_gt *gt)
>  	gt->sriov.vf.runtime.gmdid = xe_gt_sriov_vf_gmdid(gt);
>  }
>  
> +static int vf_query_sched_groups(struct xe_gt *gt)
> +{
> +	struct xe_guc *guc = &gt->uc.guc;
> +	struct xe_uc_fw_version guc_version;
> +	u32 value = 0;
> +	int err;
> +
> +	xe_gt_sriov_vf_guc_versions(gt, NULL, &guc_version);
> +
> +	if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 26, 0))
> +		return 0;
> +
> +	err = guc_action_query_single_klv32(guc,
> +					    GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY,
> +					    &value);
> +	if (unlikely(err)) {
> +		xe_gt_sriov_err(gt, "Failed to obtain sched groups status (%pe)\n",
> +				ERR_PTR(err));
> +		return err;
> +	}

nit: maybe we should also fail with -EPROTO if GuC returns something different than 0/1 ?

> +
> +	xe_gt_sriov_dbg(gt, "sched groups %s\n", str_enabled_disabled(value));
> +	return value;
> +}
> +
> +static int vf_cache_sched_groups_status(struct xe_gt *gt)
> +{
> +	int ret;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	ret = vf_query_sched_groups(gt);
> +	if (ret < 0)
> +		return ret;
> +
> +	gt->sriov.vf.runtime.uses_sched_groups = ret;
> +
> +	return 0;
> +}
> +
>  /**
>   * xe_gt_sriov_vf_query_config - Query SR-IOV config data over MMIO.
>   * @gt: the &xe_gt
> @@ -641,12 +681,33 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
>  	if (unlikely(err))
>  		return err;
>  
> +	err = vf_cache_sched_groups_status(gt);
> +	if (unlikely(err))
> +		return err;
> +
>  	if (has_gmdid(xe))
>  		vf_cache_gmdid(gt);
>  
>  	return 0;
>  }
>  
> +/**
> + * xe_gt_sriov_vf_sched_groups_enabled() - Check if PF has enabled multiple
> + * scheduler groups
> + * @gt: the &xe_gt
> + *
> + * This function is for VF use only.
> + *
> + * Return: true if shed groups were enabled, false otherwise.
> + */
> +bool xe_gt_sriov_vf_sched_groups_enabled(struct xe_gt *gt)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> +
> +	return gt->sriov.vf.runtime.uses_sched_groups;
> +}
> +
>  /**
>   * xe_gt_sriov_vf_guc_ids - VF GuC context IDs configuration.
>   * @gt: the &xe_gt
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index af40276790fa..7d97189c2d3d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -30,6 +30,7 @@ bool xe_gt_sriov_vf_recovery_pending(struct xe_gt *gt);
>  u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>  u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
> +bool xe_gt_sriov_vf_sched_groups_enabled(struct xe_gt *gt);
>  
>  u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
>  void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index 510c33116fbd..9a6b5672d569 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -27,6 +27,8 @@ struct xe_gt_sriov_vf_selfconfig {
>  struct xe_gt_sriov_vf_runtime {
>  	/** @gmdid: cached value of the GDMID register. */
>  	u32 gmdid;
> +	/** @uses_sched_groups: whether PF enabled sched groups or not. */
> +	bool uses_sched_groups;
>  	/** @regs_size: size of runtime register array. */
>  	u32 regs_size;
>  	/** @num_regs: number of runtime registers in the array. */
> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
> index 1b08b443606e..dd504b77cb17 100644
> --- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
> @@ -21,6 +21,9 @@
>  const char *xe_guc_klv_key_to_string(u16 key)
>  {
>  	switch (key) {
> +	/* GuC Global Config KLVs */
> +	case GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY:
> +		return "group_scheduling_available";
>  	/* VGT POLICY keys */
>  	case GUC_KLV_VGT_POLICY_SCHED_IF_IDLE_KEY:
>  		return "sched_if_idle";
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 0fd08d59b644..b983f5a7056f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -3001,6 +3001,27 @@ void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p)
>  	mutex_unlock(&guc->submission_state.lock);
>  }
>  
> +/**
> + * xe_guc_has_registered_mlrc_queues - check whether there are any MLRC queues
> + * registered with the GuC
> + * @guc: GuC.
> + *
> + * Return: true if any MLRC queue is registered with the GuC, false otherwise.
> + */
> +bool xe_guc_has_registered_mlrc_queues(struct xe_guc *guc)
> +{
> +	struct xe_exec_queue *q;
> +	unsigned long index;
> +
> +	guard(mutex)(&guc->submission_state.lock);
> +
> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> +		if (q->width > 1)
> +			return true;
> +
> +	return false;
> +}
> +
>  /**
>   * xe_guc_contexts_hwsp_rebase - Re-compute GGTT references within all
>   * exec queues registered to given GuC.
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index 100a7891b918..49e608500a4e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -49,6 +49,8 @@ xe_guc_exec_queue_snapshot_free(struct xe_guc_submit_exec_queue_snapshot *snapsh
>  void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
>  void xe_guc_register_vf_exec_queue(struct xe_exec_queue *q, int ctx_type);
>  
> +bool xe_guc_has_registered_mlrc_queues(struct xe_guc *guc);
> +
>  int xe_guc_contexts_hwsp_rebase(struct xe_guc *guc, void *scratch);
>  
>  #endif

