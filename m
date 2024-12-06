Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B18CE77173
	for <intel-xe@archiver.kernel.org>; Fri,  6 Dec 2024 23:23:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A83310E1F6;
	Fri,  6 Dec 2024 23:23:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LKyKZ79W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41DF510E1F6
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Dec 2024 23:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733527428; x=1765063428;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=YOx8gwx4kwpEvBXk8k4tn/5pFfLuUOzIyrQ7cba0bcU=;
 b=LKyKZ79WTnmlwUJ98W/vsDbh24bB/S3Q87X+d/2He+yHamuHtTUfMML3
 qkvBSyvVWd4zLD7l0ut/prshtN9khM1y2Ejb3dHe6sLAtRcpRxh/Uz7wR
 fWELnUCoPX56wVTbDx23V0GBqnQtt5qBAuZT3zt22bnnWKLvaAo6gMKGl
 N/VeMdUMKoX7gHLL0xaK6nxh0jB2H0G1WlwxySSxJ6tRj7lawldi6cojh
 XXsv9C6fU56DCMB/9HO1pAuyEdFYrQuDfMG3Ykr85dZ3zB2hYTTRQ6SZS
 SchRtQjLe+1ogp9aTVZI+Yv6foehUfqZqbBrZWJzYxdiBPCnGkwKtIFbw g==;
X-CSE-ConnectionGUID: +Oer67owSWiczbJwHcYL6g==
X-CSE-MsgGUID: 7ohQZK7wQkGkS9l95ErJdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="44364354"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="44364354"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 15:23:47 -0800
X-CSE-ConnectionGUID: mtSE1RghSSyO4zIw4n+IeQ==
X-CSE-MsgGUID: /ylIfNouQN6PLmutr2Kpnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="94905651"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2024 15:23:46 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Dec 2024 15:23:46 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Dec 2024 15:23:46 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Dec 2024 15:23:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MqNxckdSC49zNzIMTaXx3jFt9wS7Crpi1WsFGKF7ahyRMLC+rx9m0GY2/Qmr9bnjh9+ZBPp+J7o/yApStpB/DxUVH30WEMtEHYdul58yu3D4zYogINiWu5VUecxrr/8OwswKYS9YILyaEIhtvBVc2ZUfylWpvZg3l6NMaY5IFWdyYfBxloYdzrJkKJgAvoDMPELv7o2tKVJQssb0YMRjlCRbSS+6X6MKSwUtXbg5KU5eAYKkDOnq2HDHqPPU4FiCO+MALYSFB1BKsROhFqeuP0GfYe2e9HkLlNZdpGorUyjkheUock/peCXVnmgHxijqnq4FaCX5AhRZ8iLsaL5eqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ki+78AOVEQrEw895g+l+P1Oa6sk6LohsLTjJDDcaD8=;
 b=BBXfOo8EeryYgUhrKQmNjJE1Xbr/x6sTJ6d5TxEOJpogjatayhwtIwHo7VvnVnJorQcX6IiTJd2I8j7sc0bgiEGw7H/PFg27CIL/d1omUMEnq57xJef3pli35YfoXYc+S+lO6eI6VwbP9BYgF6mIzztQuUOXohU+7jJltHTdZKF6ItGseUMq/TbkPnTv7tLU/e+wBWxJGTHvCUF5dxLYM8PqT/pdDw1J66fzDgper99D8u5sjl5l5hI1LW2KSstt32ffZArOKpPP57tzPE36olx0Lc3CT3FE60NP437PMTPbcWwWFheDb7EVqz70JZs+9Gn7bbfBSZHOr2dmjeidow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DM4PR11MB6285.namprd11.prod.outlook.com (2603:10b6:8:a8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Fri, 6 Dec
 2024 23:23:44 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8207.017; Fri, 6 Dec 2024
 23:23:44 +0000
Message-ID: <3c1bcd4c-426f-49bd-b578-7767d65a78df@intel.com>
Date: Fri, 6 Dec 2024 15:23:39 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/12] drm/xe/pxp: Handle the PXP termination interrupt
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20241120234353.1037180-1-daniele.ceraolospurio@intel.com>
 <20241120234353.1037180-6-daniele.ceraolospurio@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20241120234353.1037180-6-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW2PR16CA0064.namprd16.prod.outlook.com
 (2603:10b6:907:1::41) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DM4PR11MB6285:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e7089be-e32f-4a47-0f4b-08dd164d06c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eTlWcWcyUDlmSUV0SmRRZGI1MEpKZlI5d250bnFBMEFRQUozV1RTUy9SUWpI?=
 =?utf-8?B?NWJuQnl1eUtiOFhPcEYrZXpndWNRandrWUs1aVhqeWR4OGZvQ2tjMVlBSzBo?=
 =?utf-8?B?dDE3NjZuZ3hBdFBwVzh6K1o1Nkh4blNPUHNIRzhCTHJaSzRhTWYxUGZwLy81?=
 =?utf-8?B?Y0ZrS1NpUGRCdjlkUU52MlJqdHlLK0JKL2R3R3Y1NzNSZTYvM1BXQithTm9G?=
 =?utf-8?B?ZElLTWZKZ0lJZzQvOWxabG9Ga1c3eUZvdFVhbXcxMm03ZSt2NVlBMEF0dlYx?=
 =?utf-8?B?TGtTV0xhQ2hQWHhtbzlvSTlESktZYWp0UXQ4QnQvZkNnT1h2TGlwOElqY0RH?=
 =?utf-8?B?Zm5Kd3VHZ2JxdXhsS2Rqc3B1U1dlTnBOZmJZZjFhQitmR0dqWk1BM2I4Q1NY?=
 =?utf-8?B?REwzTElSdk5JZ2JweTV2dDBEN3RiSGtDekdVaHlzckF1bEtmTlhwcjh4eE5C?=
 =?utf-8?B?b00rdVk0TGZJdGlDUlRJays1NHJPeTBROVh1UDV6d1RGa3ladXcvK0Z4emVt?=
 =?utf-8?B?Mkg3MjlXRzZpWDIzekI4cHBteDlDUngxZ0kxbDVWRkVJY0pNRlV0Z3FpOTcv?=
 =?utf-8?B?cHpZRllFUzg5RWlJWE50U0J3M2UxQkxhcjc0NGh6RU5tSTVRb25jdC9keWcy?=
 =?utf-8?B?V0NRZlMrWkEwMWJWS3FCM0VBd0ZBUWd1Wi9ILzBvalE1dnRJU3ZiZkZ1bWkw?=
 =?utf-8?B?UkNSK3VhMXhCMlpkaS9DbmxlaWNpMUJoU1grcWd3U2NWTGxpT2d5ZG8vQmt5?=
 =?utf-8?B?VmxjMzVHeVk5c0RFZUtwNTVvUkRKOThaVDc4V2twdmRHenB2djNxdkZMNm84?=
 =?utf-8?B?YTByNDIrWFMzMlVTa0ppTE1vWVRnMnYzWjRzVDdlcmU2UDZNRWRSZTgzdzVs?=
 =?utf-8?B?RCs5V0l5U21GekVqL040L2tWRHdRNHh2Nlh3Y3FZaFZVaWhCSXZ6dzFOblRw?=
 =?utf-8?B?K1htZ2gyRzd6ZmdzREMzd0pYamZrRS9HYnlBbjdnQkxhVnZ4NG12OW5ZN0FY?=
 =?utf-8?B?OWp3TkRQRkpHdGhIejloa3FSRTZpQi9naWhsUWQxUXZVcE9MZ0NHTmYvOTY0?=
 =?utf-8?B?WnNmRHhDdnBqYVBlSHc3OTdHUDBpVVpBODhJeWtQTEhtK0M5WHZwTUlxMVpH?=
 =?utf-8?B?UjhFbmgyR09kaituQXZTck8xRko2UjFVOE1DcHpjR3lFRjNBN0luMmpPOUZk?=
 =?utf-8?B?UUFPRm9DSU9DMGxIWmF3LzFyQ1M1T1NuRU1TZVZCMjZPVlFwdVRJV2xjNlpV?=
 =?utf-8?B?MWxrMTZnd3dZV09qMzc5OVp0NThSSEd3S3NqNlpRWEd2VDFsLzRNUTBWdHhq?=
 =?utf-8?B?djJlSTM4YXdVTUg3VUEwSnltWWsvemQwM1Yrd052R3M2QlNZWFBzMVBjN1Vj?=
 =?utf-8?B?dFdsck1zSGVlLzZSbUt5THVXTWt5SXh1d2pkU1hZYUhkc3hrS0lkYkN1cC9v?=
 =?utf-8?B?cUw3dWp3Wk9tL1pSemxCWUl3cHNXQkE3ZENEazE3K0gwWHFUMml2L1gzTWVP?=
 =?utf-8?B?OGUveHRrMVVNYS9QYlNsYVdtSjFXRWtTT2FtMjl4eFFlcVl4VG5wOExuQi9O?=
 =?utf-8?B?MjgxZFNpNmdPczlldEs3emN3Z2pyam51UE9wZ1poQjdjUEZ4Z0J4TGgvU1dW?=
 =?utf-8?B?UjZjdjlKeW1DNUN3VHlXa29PdWVlUU1hVXZTb3VHMlZROWQ1WlcweS96ci9a?=
 =?utf-8?B?RDhqb1BpY1dHdUJuS0FUMkYyMlFOckhCaTh6UDNDcWt5aDRaTm85WXNlUmEz?=
 =?utf-8?B?cXRUenBYak5kQXZueDNidWlTYUI0OXBNZWgrUXRjVC9DRzVaN1pXUklBa1Fr?=
 =?utf-8?B?eHU0cUtzaWtKNDRRUmliUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2hYNm8xeXJUVmluRFlBWTFVQ0M5eXlHVlloSWdFSW5QVlNyZTJsZmZ0VnpC?=
 =?utf-8?B?dXZUalRnZkhCSHFKQktHenZPeXBneHB6dktHME1QUmxQdEtuSThrK3FXT1Ba?=
 =?utf-8?B?cjVnOFdrWGhhMTgyUlFlcDVyNVNLQ2N0UEdOSFg5RnFzRk85YmFVOENZUzdX?=
 =?utf-8?B?SVZwcGIzYSs5R3BBeEdma1gvd2lSekQ4OG5Ebk5rSlFCTkdNOHJ2QkhieEdl?=
 =?utf-8?B?ZmRCTGQvdkdCYkowb2ZCemhaZUxZYWYyM2F6SnV4MnY3RVNPMzVocXJNaW9U?=
 =?utf-8?B?b2VMMDk1ODl4UUw2c2RURE9UTFVUcnhHSEgxdTZBZkhyTmR4YVNGR3VrV1Rj?=
 =?utf-8?B?ZmljZHFybWR1ZURhWUY5Rk9ncko1Q2VzN0xuL2txM2xFTEhZSmZXUjNSeUx2?=
 =?utf-8?B?Z1NYWkR3UWNwQjhIRUc2MTRXUzZ3Y1ZnSjY3ZTl4L0ZqVlhsbG5HU2FoZXUz?=
 =?utf-8?B?dXo4U2pVeEhZak11WjE1N2ZTTDFrUGtGSi9heGhRbjJWektoSHdmSUdWL1p3?=
 =?utf-8?B?bUY3aURHeUp6TnVUL2tsSHJQV0NTQWNrQm90aHNON0xmczhwUkRMNWFaVG1p?=
 =?utf-8?B?cENNT0RQeDhZSmtONnRFY2gxVWZJN0E4ejdHTkFpVzFTa3JUenJlMHV3dVdi?=
 =?utf-8?B?alNuOUt5Yi9JbDk4bmJnZGxqcHYyNEpPSmlGU2JSNXZBcjlLdDV3Z3hwVUw5?=
 =?utf-8?B?M3pOOStUV1JoeG5uSHVwSlFwRGk0c0JrSGFuaWNyU2ZLR1Y1SUdaNWkwNEw1?=
 =?utf-8?B?eHVnRDBMRExka2FqNXY3dTlzRUdmYkhWYmZaY2Y3dEcvdkU0VHgraS82Ry9W?=
 =?utf-8?B?YXdpWXJ4bDZ2b3V2TVdrbE1WRWdhYnpqVk10NzYrYm53TmxqWTk2cDlpbXpy?=
 =?utf-8?B?Y0VaYUp3bWVFWHRYVUppdG1VUVBIelphNzFpMkx5NE5PTDYwY1I5Mkp3SHB5?=
 =?utf-8?B?RkhNSlBQblVBaldBOVJHUFVYSTdNcjkzZkpVTFRVM25XdWdKOTV5OXZmZ3Rp?=
 =?utf-8?B?R1l3c3ljc1lSRWFlVGhNQjNybnFFM05sZjE5WjJHU2tFU24xZFBVZkZ6RDJD?=
 =?utf-8?B?dDR4TE8xT3d0V2VHWUpobzh3K2dTNDNLMURCRStVbmRNUzBScWFYY1RzUkhP?=
 =?utf-8?B?TGJmK3VObmMzNXRYRHFzOGMvUDlTUzc0UzlFaExrcWRlVlZvUzViWTg5eE1F?=
 =?utf-8?B?dGtkcUdnVTNzcXB3aVlJRG5EOHdxVVdHajZxNXRIeiszb0duNk1haFlkalYw?=
 =?utf-8?B?RkwrNUh5bnBjTSs4dzNjMlFFcDlwQ0o0QkViMkZLZWh1djlhaUQ0M2t3L0NB?=
 =?utf-8?B?TVhtZVYxVWxQRmJFQUViTjlvejkzTHI5aVlLMzZBRGV1czVwRUxkbmJuNEVB?=
 =?utf-8?B?VDZzVGtQUGZvb1huN0dIUGZDaStOejluT1NqQkZFc05hQnJYMk9pTzVKeDVD?=
 =?utf-8?B?OHlST1hXeHdiaGRoa1hyczhpaE4zdTZzcitNRlkzc05ua2dnQ0VyZ0g1dFFh?=
 =?utf-8?B?RXlNbzQ3MFo4RTZ5dCtwY1FuMGFLZWI5SDF4ZUp6UUg0WURjenhFaEpFMXVG?=
 =?utf-8?B?R2N3Ykp6WXgrVUdhY3NJUHpSS1lXRncyVWhLNDI0Z1B4QTUvTC9nTXY3aGhY?=
 =?utf-8?B?QmhIM081QzN4T2ZjSS82a0VrczdVNE5ZZFN3elAyM2V4elQ5ak5WZUFPWExv?=
 =?utf-8?B?bDdmNkIxTklCUFJ5WTNuQ0VwVFllazJIUmg2ZlA5OExCc0hiL054OEQrRmlR?=
 =?utf-8?B?NzB5NEY1TkRESy9QcU56UUY5TUpCUnIrUUxxWWpQTDZFV1V6WFhKbk8zek8w?=
 =?utf-8?B?c2QxOGhPM05HMjFxRGJrZGpaS3V3SmN6VHRZbEh3QlNaa1BNNEtYakFBVGZ5?=
 =?utf-8?B?UFBCQm9CRWRvQXVQaXRhd2J1UFMvMHFTbkQrK2g5czNPWThXb3R2MTd6ZCsy?=
 =?utf-8?B?SWtSZDJDMEs3dHNCbW5tTGcrUTlvSGE2MnJPZEgwM1B1Y0tZYjBnbVhyRHhH?=
 =?utf-8?B?QWF5TGZDVnF4QnpCYzUrVmhreUlqdktBREZIS0t4cUhNUUNENjVZYVV6elFS?=
 =?utf-8?B?S3VMODhRRWlsZlVxWWgyOGhIUU9wNmlvWUF1S3Vac0FOMTFoVFhuY1AxNHFJ?=
 =?utf-8?B?WElrUGJ4dWg0akc1OUMvZWJ2UHJwazJyV0RlSEZOd3NoTmxWVlZxQTlGUUgx?=
 =?utf-8?B?N3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e7089be-e32f-4a47-0f4b-08dd164d06c0
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 23:23:43.9772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3nh3rQsP4HTnAfYfAdXFR6QngeWImyGqfC5oYsJBDmxxlexPLdvdoq4g2Vx+0n1D66jwDVaUo/pSJ5emzlODQ8rGpguSr5sRM8dqw7bT7L0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6285
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

On 11/20/2024 15:43, Daniele Ceraolo Spurio wrote:
> When something happen to the session, the HW generates a termination
> interrupt. In reply to this, the driver is required to submit an inline
> session termination via the VCS, trigger the global termination and
> notify the GSC FW that the session is now invalid.
>
> v2: rename ARB define to make it cleaner to move it to uapi (John)
There was also changes about forcewakes. But doesn't really matter.

Reviewed-by: John Harrison <John.C.Harrison@Intel.com>


>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_irq_regs.h |   8 ++
>   drivers/gpu/drm/xe/regs/xe_pxp_regs.h |   6 ++
>   drivers/gpu/drm/xe/xe_irq.c           |  20 +++-
>   drivers/gpu/drm/xe/xe_pxp.c           | 139 +++++++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_pxp.h           |   7 ++
>   drivers/gpu/drm/xe/xe_pxp_types.h     |  13 +++
>   6 files changed, 189 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> index 1776b3f78ccb..f0ecfcac4003 100644
> --- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> @@ -44,6 +44,7 @@
>   #define   ENGINE1_MASK				REG_GENMASK(31, 16)
>   #define   ENGINE0_MASK				REG_GENMASK(15, 0)
>   #define GPM_WGBOXPERF_INTR_ENABLE		XE_REG(0x19003c, XE_REG_OPTION_VF)
> +#define CRYPTO_RSVD_INTR_ENABLE			XE_REG(0x190040)
>   #define GUNIT_GSC_INTR_ENABLE			XE_REG(0x190044, XE_REG_OPTION_VF)
>   #define CCS_RSVD_INTR_ENABLE			XE_REG(0x190048, XE_REG_OPTION_VF)
>   
> @@ -54,6 +55,7 @@
>   #define   INTR_ENGINE_INTR(x)			REG_FIELD_GET(GENMASK(15, 0), x)
>   #define   OTHER_GUC_INSTANCE			0
>   #define   OTHER_GSC_HECI2_INSTANCE		3
> +#define   OTHER_KCR_INSTANCE			4
>   #define   OTHER_GSC_INSTANCE			6
>   
>   #define IIR_REG_SELECTOR(x)			XE_REG(0x190070 + ((x) * 4), XE_REG_OPTION_VF)
> @@ -65,6 +67,7 @@
>   #define HECI2_RSVD_INTR_MASK			XE_REG(0x1900e4)
>   #define GUC_SG_INTR_MASK			XE_REG(0x1900e8, XE_REG_OPTION_VF)
>   #define GPM_WGBOXPERF_INTR_MASK			XE_REG(0x1900ec, XE_REG_OPTION_VF)
> +#define CRYPTO_RSVD_INTR_MASK			XE_REG(0x1900f0)
>   #define GUNIT_GSC_INTR_MASK			XE_REG(0x1900f4, XE_REG_OPTION_VF)
>   #define CCS0_CCS1_INTR_MASK			XE_REG(0x190100)
>   #define CCS2_CCS3_INTR_MASK			XE_REG(0x190104)
> @@ -79,4 +82,9 @@
>   #define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
>   #define   GT_RENDER_USER_INTERRUPT		REG_BIT(0)
>   
> +/* irqs for OTHER_KCR_INSTANCE */
> +#define   KCR_PXP_STATE_TERMINATED_INTERRUPT		REG_BIT(1)
> +#define   KCR_APP_TERMINATED_PER_FW_REQ_INTERRUPT	REG_BIT(2)
> +#define   KCR_PXP_STATE_RESET_COMPLETE_INTERRUPT	REG_BIT(3)
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/regs/xe_pxp_regs.h b/drivers/gpu/drm/xe/regs/xe_pxp_regs.h
> index d67cf210d23d..aa158938b42e 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pxp_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pxp_regs.h
> @@ -14,4 +14,10 @@
>   #define KCR_INIT				XE_REG(0x3860f0)
>   #define   KCR_INIT_ALLOW_DISPLAY_ME_WRITES	REG_BIT(14)
>   
> +/* KCR hwdrm session in play status 0-31 */
> +#define KCR_SIP					XE_REG(0x386260)
> +
> +/* PXP global terminate register for session termination */
> +#define KCR_GLOBAL_TERMINATE			XE_REG(0x3860f8)
> +
>   #endif /* __XE_PXP_REGS_H__ */
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 7bf7201529ac..6a7a65d5e5d1 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -19,6 +19,7 @@
>   #include "xe_hw_engine.h"
>   #include "xe_memirq.h"
>   #include "xe_mmio.h"
> +#include "xe_pxp.h"
>   #include "xe_sriov.h"
>   
>   /*
> @@ -202,6 +203,15 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
>   		}
>   		if (heci_mask)
>   			xe_mmio_write32(mmio, HECI2_RSVD_INTR_MASK, ~(heci_mask << 16));
> +
> +		if (xe_pxp_is_supported(xe)) {
> +			u32 kcr_mask = KCR_PXP_STATE_TERMINATED_INTERRUPT |
> +				       KCR_APP_TERMINATED_PER_FW_REQ_INTERRUPT |
> +				       KCR_PXP_STATE_RESET_COMPLETE_INTERRUPT;
> +
> +			xe_mmio_write32(mmio, CRYPTO_RSVD_INTR_ENABLE, kcr_mask << 16);
> +			xe_mmio_write32(mmio, CRYPTO_RSVD_INTR_MASK, ~(kcr_mask << 16));
> +		}
>   	}
>   }
>   
> @@ -324,9 +334,15 @@ static void gt_irq_handler(struct xe_tile *tile,
>   			}
>   
>   			if (class == XE_ENGINE_CLASS_OTHER) {
> -				/* HECI GSCFI interrupts come from outside of GT */
> +				/*
> +				 * HECI GSCFI interrupts come from outside of GT.
> +				 * KCR irqs come from inside GT but are handled
> +				 * by the global PXP subsystem.
> +				 */
>   				if (xe->info.has_heci_gscfi && instance == OTHER_GSC_INSTANCE)
>   					xe_heci_gsc_irq_handler(xe, intr_vec);
> +				else if (instance == OTHER_KCR_INSTANCE)
> +					xe_pxp_irq_handler(xe, intr_vec);
>   				else
>   					gt_other_irq_handler(engine_gt, instance, intr_vec);
>   			}
> @@ -512,6 +528,8 @@ static void gt_irq_reset(struct xe_tile *tile)
>   		xe_mmio_write32(mmio, GUNIT_GSC_INTR_ENABLE, 0);
>   		xe_mmio_write32(mmio, GUNIT_GSC_INTR_MASK, ~0);
>   		xe_mmio_write32(mmio, HECI2_RSVD_INTR_MASK, ~0);
> +		xe_mmio_write32(mmio, CRYPTO_RSVD_INTR_ENABLE, 0);
> +		xe_mmio_write32(mmio, CRYPTO_RSVD_INTR_MASK, ~0);
>   	}
>   
>   	xe_mmio_write32(mmio, GPM_WGBOXPERF_INTR_ENABLE, 0);
> diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
> index 89d71a69cdff..bc816cfecdd6 100644
> --- a/drivers/gpu/drm/xe/xe_pxp.c
> +++ b/drivers/gpu/drm/xe/xe_pxp.c
> @@ -12,9 +12,11 @@
>   #include "xe_gt.h"
>   #include "xe_gt_types.h"
>   #include "xe_mmio.h"
> +#include "xe_pm.h"
>   #include "xe_pxp_submit.h"
>   #include "xe_pxp_types.h"
>   #include "xe_uc_fw.h"
> +#include "regs/xe_irq_regs.h"
>   #include "regs/xe_pxp_regs.h"
>   
>   /**
> @@ -25,11 +27,132 @@
>    * integrated parts.
>    */
>   
> -static bool pxp_is_supported(const struct xe_device *xe)
> +#define ARB_SESSION DRM_XE_PXP_HWDRM_DEFAULT_SESSION /* shorter define */
> +
> +bool xe_pxp_is_supported(const struct xe_device *xe)
>   {
>   	return xe->info.has_pxp && IS_ENABLED(CONFIG_INTEL_MEI_GSC_PROXY);
>   }
>   
> +static bool pxp_is_enabled(const struct xe_pxp *pxp)
> +{
> +	return pxp;
> +}
> +
> +static int pxp_wait_for_session_state(struct xe_pxp *pxp, u32 id, bool in_play)
> +{
> +	struct xe_gt *gt = pxp->gt;
> +	u32 mask = BIT(id);
> +
> +	return xe_mmio_wait32(&gt->mmio, KCR_SIP, mask, in_play ? mask : 0,
> +			      250, NULL, false);
> +}
> +
> +static void pxp_terminate(struct xe_pxp *pxp)
> +{
> +	int ret = 0;
> +	struct xe_device *xe = pxp->xe;
> +	struct xe_gt *gt = pxp->gt;
> +	unsigned int fw_ref;
> +
> +	drm_dbg(&xe->drm, "Terminating PXP\n");
> +
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FW_GT)) {
> +		ret = -EIO;
> +		goto out;
> +	}
> +
> +	/* terminate the hw session */
> +	ret = xe_pxp_submit_session_termination(pxp, ARB_SESSION);
> +	if (ret)
> +		goto out;
> +
> +	ret = pxp_wait_for_session_state(pxp, ARB_SESSION, false);
> +	if (ret)
> +		goto out;
> +
> +	/* Trigger full HW cleanup */
> +	xe_mmio_write32(&gt->mmio, KCR_GLOBAL_TERMINATE, 1);
> +
> +	/* now we can tell the GSC to clean up its own state */
> +	ret = xe_pxp_submit_session_invalidation(&pxp->gsc_res, ARB_SESSION);
> +
> +out:
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +
> +	if (ret)
> +		drm_err(&xe->drm, "PXP termination failed: %pe\n", ERR_PTR(ret));
> +}
> +
> +static void pxp_terminate_complete(struct xe_pxp *pxp)
> +{
> +	/* TODO mark the session as ready to start */
> +}
> +
> +static void pxp_irq_work(struct work_struct *work)
> +{
> +	struct xe_pxp *pxp = container_of(work, typeof(*pxp), irq.work);
> +	struct xe_device *xe = pxp->xe;
> +	u32 events = 0;
> +
> +	spin_lock_irq(&xe->irq.lock);
> +	events = pxp->irq.events;
> +	pxp->irq.events = 0;
> +	spin_unlock_irq(&xe->irq.lock);
> +
> +	if (!events)
> +		return;
> +
> +	/*
> +	 * If we're processing a termination irq while suspending then don't
> +	 * bother, we're going to re-init everything on resume anyway.
> +	 */
> +	if ((events & PXP_TERMINATION_REQUEST) && !xe_pm_runtime_get_if_active(xe))
> +		return;
> +
> +	if (events & PXP_TERMINATION_REQUEST) {
> +		events &= ~PXP_TERMINATION_COMPLETE;
> +		pxp_terminate(pxp);
> +	}
> +
> +	if (events & PXP_TERMINATION_COMPLETE)
> +		pxp_terminate_complete(pxp);
> +
> +	if (events & PXP_TERMINATION_REQUEST)
> +		xe_pm_runtime_put(xe);
> +}
> +
> +/**
> + * xe_pxp_irq_handler - Handles PXP interrupts.
> + * @pxp: pointer to pxp struct
> + * @iir: interrupt vector
> + */
> +void xe_pxp_irq_handler(struct xe_device *xe, u16 iir)
> +{
> +	struct xe_pxp *pxp = xe->pxp;
> +
> +	if (!pxp_is_enabled(pxp)) {
> +		drm_err(&xe->drm, "PXP irq 0x%x received with PXP disabled!\n", iir);
> +		return;
> +	}
> +
> +	lockdep_assert_held(&xe->irq.lock);
> +
> +	if (unlikely(!iir))
> +		return;
> +
> +	if (iir & (KCR_PXP_STATE_TERMINATED_INTERRUPT |
> +		   KCR_APP_TERMINATED_PER_FW_REQ_INTERRUPT))
> +		pxp->irq.events |= PXP_TERMINATION_REQUEST;
> +
> +	if (iir & KCR_PXP_STATE_RESET_COMPLETE_INTERRUPT)
> +		pxp->irq.events |= PXP_TERMINATION_COMPLETE;
> +
> +	if (pxp->irq.events)
> +		queue_work(pxp->irq.wq, &pxp->irq.work);
> +}
> +
>   static int kcr_pxp_set_status(const struct xe_pxp *pxp, bool enable)
>   {
>   	u32 val = enable ? _MASKED_BIT_ENABLE(KCR_INIT_ALLOW_DISPLAY_ME_WRITES) :
> @@ -60,6 +183,7 @@ static void pxp_fini(void *arg)
>   {
>   	struct xe_pxp *pxp = arg;
>   
> +	destroy_workqueue(pxp->irq.wq);
>   	xe_pxp_destroy_execution_resources(pxp);
>   
>   	/* no need to explicitly disable KCR since we're going to do an FLR */
> @@ -83,7 +207,7 @@ int xe_pxp_init(struct xe_device *xe)
>   	struct xe_pxp *pxp;
>   	int err;
>   
> -	if (!pxp_is_supported(xe))
> +	if (!xe_pxp_is_supported(xe))
>   		return -EOPNOTSUPP;
>   
>   	/* we only support PXP on single tile devices with a media GT */
> @@ -105,12 +229,19 @@ int xe_pxp_init(struct xe_device *xe)
>   	if (!pxp)
>   		return -ENOMEM;
>   
> +	INIT_WORK(&pxp->irq.work, pxp_irq_work);
>   	pxp->xe = xe;
>   	pxp->gt = gt;
>   
> +	pxp->irq.wq = alloc_ordered_workqueue("pxp-wq", 0);
> +	if (!pxp->irq.wq) {
> +		err = -ENOMEM;
> +		goto out_free;
> +	}
> +
>   	err = kcr_pxp_enable(pxp);
>   	if (err)
> -		goto out_free;
> +		goto out_wq;
>   
>   	err = xe_pxp_allocate_execution_resources(pxp);
>   	if (err)
> @@ -122,6 +253,8 @@ int xe_pxp_init(struct xe_device *xe)
>   
>   out_kcr_disable:
>   	kcr_pxp_disable(pxp);
> +out_wq:
> +	destroy_workqueue(pxp->irq.wq);
>   out_free:
>   	drmm_kfree(&xe->drm, pxp);
>   	return err;
> diff --git a/drivers/gpu/drm/xe/xe_pxp.h b/drivers/gpu/drm/xe/xe_pxp.h
> index 00f5e688c0d9..39435c644dcd 100644
> --- a/drivers/gpu/drm/xe/xe_pxp.h
> +++ b/drivers/gpu/drm/xe/xe_pxp.h
> @@ -6,8 +6,15 @@
>   #ifndef __XE_PXP_H__
>   #define __XE_PXP_H__
>   
> +#include <linux/types.h>
> +
>   struct xe_device;
>   
> +#define DRM_XE_PXP_HWDRM_DEFAULT_SESSION 0xF /* TODO: move to uapi */
> +
> +bool xe_pxp_is_supported(const struct xe_device *xe);
> +
>   int xe_pxp_init(struct xe_device *xe);
> +void xe_pxp_irq_handler(struct xe_device *xe, u16 iir);
>   
>   #endif /* __XE_PXP_H__ */
> diff --git a/drivers/gpu/drm/xe/xe_pxp_types.h b/drivers/gpu/drm/xe/xe_pxp_types.h
> index 25db23180a30..40c28f32f51a 100644
> --- a/drivers/gpu/drm/xe/xe_pxp_types.h
> +++ b/drivers/gpu/drm/xe/xe_pxp_types.h
> @@ -8,6 +8,7 @@
>   
>   #include <linux/iosys-map.h>
>   #include <linux/types.h>
> +#include <linux/workqueue.h>
>   
>   struct xe_bo;
>   struct xe_exec_queue;
> @@ -69,6 +70,18 @@ struct xe_pxp {
>   
>   	/** @gsc_exec: kernel-owned objects for PXP submissions to the GSCCS */
>   	struct xe_pxp_gsc_client_resources gsc_res;
> +
> +	/** @irq: wrapper for the worker and queue used for PXP irq support */
> +	struct {
> +		/** @irq.work: worker that manages irq events. */
> +		struct work_struct work;
> +		/** @irq.wq: workqueue on which to queue the irq work. */
> +		struct workqueue_struct *wq;
> +		/** @irq.events: pending events, protected with xe->irq.lock. */
> +		u32 events;
> +#define PXP_TERMINATION_REQUEST  BIT(0)
> +#define PXP_TERMINATION_COMPLETE BIT(1)
> +	} irq;
>   };
>   
>   #endif /* __XE_PXP_TYPES_H__ */

