Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31DDE77188
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jan 2025 09:07:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E4010E89A;
	Tue, 14 Jan 2025 09:07:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SQogPTvk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46B410E89A
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jan 2025 09:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736845628; x=1768381628;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XrvFFt8TpMLzh9Zax5QnYBsrDhvcFTfCsgOmd2OHZKs=;
 b=SQogPTvkIuOZeOe5DN33mhb0AIeXgg8CEwQPyNFBYx2VIHF5B3SiMDI+
 rIDCA2IEiyRt00emGLEmTlTfIdGQ3GwyM5U/WTXM3PqE7qpt5SoAeK8tN
 Qa2hEJG1j0O0NBbnTDcFnvG8kvZZTSHQ4p7UeHLbtHB0msdDWjI/hGp62
 wYvVOXNMk1E+h2M2QcBXSGIXaSRwluRuTYuY8ps5eeANqlAwzaZzw2ESh
 DSFocsVjcy2T4KC+H+Sj0JkFEYgQItBRblD6Mng17kEt9jVhF21dzhNUc
 Ks9W7yPUrHn6oV7XO0dvaiIByFl3B7ZdAYAw/Jo2aLUuTX/hhOLgdBbbO w==;
X-CSE-ConnectionGUID: yVZ60fJlQnyDX03ArKqJ8Q==
X-CSE-MsgGUID: Y7Wt257VTdiV4upf8IAUEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37361887"
X-IronPort-AV: E=Sophos;i="6.12,313,1728975600"; d="scan'208";a="37361887"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 01:06:59 -0800
X-CSE-ConnectionGUID: /JcW4tSnQDWk/Gcs0pEQ+Q==
X-CSE-MsgGUID: B+y23Hl3RbWKpYIRGWfSpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109887532"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jan 2025 01:06:59 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 14 Jan 2025 01:06:58 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 14 Jan 2025 01:06:58 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 14 Jan 2025 01:06:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pDlwL2366xLDNVQNog77Fz9Zo4D6tyIwIcqjx8BTAlUWZxosJTET5LoDDmUkJ29ZTjx2821d0zkMNJh+4kx1NdzzMbf8hyxorqPqhLA4vnXTPNzjYUyIdKCEj3DNRUn5cYSoyWnW8XDj5n+C7D04daNT1qnYbF6DLauB6v/DHKVGit5izysKTNfkfG5bdPYvqUNm/ksQ24ULzsbE0GZEPZZFcNMrOwudaX91gNMq/scODzuJXnBIFeX57NKMqiajdqz3eIeLGe0rNW2W6zWaulVPloSlu46NDNPKYL9nYjPdz1RPjqfCmOQSpRpaInn7dnQDQEfmtLe8vl2UdoW4LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L/mgoBezDO+W1XICLrsUk88Gmbz2S0S3EMroTKi34wk=;
 b=ODIstp0UQWkrYUWt2gL7Yig3qwRDvHi6WsVf0Ytt+2Lt+wuQiLVg86org3l9AIGfFcQdniDpdohQVhCQ0k4x5EZwnSFTiSiQT4OCWNXBLLlfDeR+phlV22qNVp6cAxwxA5plg0J7RGqxZyFBdJUTrsp9Wl4tSidm2W2Q0xGUuudDkVbqroz7i4PFeGrZLYypgNQa7ZRUKWh/6LkYQOYsOo76bqx9Q0/+pXMlp9/xhrsO6neqcoJzK5EJ64HOIm1aMxHV02SgbLq4Rg37MAd6qM7pEr1wcc0+csxd0yUr7jticuTUHRIsRazJVGMXPsa35cRpRiHzEdoYOSTB/0oO9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6864.namprd11.prod.outlook.com (2603:10b6:303:21b::16)
 by MN0PR11MB6279.namprd11.prod.outlook.com (2603:10b6:208:3c1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 09:06:56 +0000
Received: from MW4PR11MB6864.namprd11.prod.outlook.com
 ([fe80::6f1c:5fd9:a37f:82d6]) by MW4PR11MB6864.namprd11.prod.outlook.com
 ([fe80::6f1c:5fd9:a37f:82d6%4]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 09:06:56 +0000
Message-ID: <93d005f3-4c17-426e-b996-224ebf82ce0c@intel.com>
Date: Tue, 14 Jan 2025 10:06:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix a typo in xe_vm_doc.h
To: <intel-xe@lists.freedesktop.org>
References: <20250113212324.3264218-1-oak.zeng@intel.com>
Content-Language: en-US
CC: <oak.zeng@intel.com>
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
In-Reply-To: <20250113212324.3264218-1-oak.zeng@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU6P191CA0066.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53e::6) To MW4PR11MB6864.namprd11.prod.outlook.com
 (2603:10b6:303:21b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6864:EE_|MN0PR11MB6279:EE_
X-MS-Office365-Filtering-Correlation-Id: ec68ca62-bff8-4972-ea64-08dd347acb4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S1cvN0t3cUxiMWdJeHY4U1NqSkRkOXBXaGFVQ25oclY2T3RkNWF3VkxiSWVH?=
 =?utf-8?B?T20yVjRrblNoS2F4QzBGUVE4Sms2aG80aC9FRThlREc5NU85aDNoVmtkWUxY?=
 =?utf-8?B?UjhkRG9rTWc0eHRpSHRsWXZNd01OcnBOREVocWN4NWxsOWlGdTNrZGQrTVNZ?=
 =?utf-8?B?NHgrK0xJckp4cEdEUmNMSnNaUGdXU2crNUp1ZTFZRHRDMXN1aEl6Z1VIcXp2?=
 =?utf-8?B?bVVPMkVUV0ttNm54RCs1QVlBWkp4SWVlaks1UlRWN2lwTGlMelA1N1BXeFVj?=
 =?utf-8?B?TzBxdUhJYmk1SjVxRm5Wa3dwRzVha3BYaFZBcWRUV1hJUjFiR2wrYVhHanFo?=
 =?utf-8?B?MHpmdURxK2IwTnpVbERVK2U5bkhBRyswaGJSM09ha1loWWlCbVBadzd6VURZ?=
 =?utf-8?B?eXNNN3ZNVCt6M1UzZ0w3VmdVZ2NUN2M0eW50dkNXVnJXeTRPeHM1RmpTWXgw?=
 =?utf-8?B?TWhBTnlOSW5aNVgxZXh5aGxmYTJjN2dFS1JXSXJab2VZRGdrWFBkUVErRXZx?=
 =?utf-8?B?MUhFclZIanVPNElaV3FveXJoWEdwRnJHTkRMRURzNHZaM3JJQlpMYkFaWjVt?=
 =?utf-8?B?Vnp3Q2kvSHozVHE5eWFoSmVvMHFuNmJ1RTBMdEpFVDF6L3lPNlRFUWFBVnU3?=
 =?utf-8?B?bks1WWJnZ0ZKaTYrcTkyQTRLV0VKZ3BFMUl2Y2poRTF1NEIyc2VlMkJUWlVm?=
 =?utf-8?B?ZmdxRmdiZVdnOWhBc1ZrczNybVFpd2poVGo2a1VhM2hZNjg5Rk1lY29Md3Fs?=
 =?utf-8?B?Ump0MmFoZnoxdHZjaWdoQVp2ck1HWUZMS0hxOEtTRFcvbHZ1b2plUmFuMWdV?=
 =?utf-8?B?TkFHQmNqTVA0VUg1UHlOUm1CNDByb3FrVGx2NUNseXhtWjlGNDhmZXQ2M216?=
 =?utf-8?B?dFpjcG81ZXFCOHkxc1hQL3pBNGlreVBEWWY3UHJ3VnFDUG1oQzJrL3hvUkJu?=
 =?utf-8?B?eXNZODBGK09VVC9PNFp4VW1tc3Z2eml1NmlWM3REd2d2Znp0V1hkVWx4c1Ns?=
 =?utf-8?B?d0tMbkNNSTdXTkRtaUE3N0pYZjRYNytCamNaTlVPNFZjUG5pc3Z5OVJIMW1J?=
 =?utf-8?B?T0luZE1wL1JWRWE1RUhoMTNZOHp0dlRRUXQwaHJOblpFeEFDalFOSExFTWNL?=
 =?utf-8?B?YjQwc3MzbVFGNyszMUJNOUVFcFVGa1hsVFNaVEt2aW5jU0E0N09DNkQ3TitI?=
 =?utf-8?B?dzlxN2d3NWZoQSttTUZaTkh2MmNjSG5YNFYxRHl0U2x5bHVjQU1tRnEySFJY?=
 =?utf-8?B?d3NOQ1l5N2NZcFc2eHRTTjA1NCsyWXVKcVZhSDRvK2pnckN1Zkk0YzhvQlJy?=
 =?utf-8?B?UzNwbVFDcHRpVExNMVZzbWk3WHZmUFkwdW11WHZsVThMRkY4KzhqQVZ3ZnBx?=
 =?utf-8?B?c1p1LzJ2S3NKSzBTS0RPK01IS2x2UzhNQ0gxbm15d0JwdzdpT0tFd3JiNjFL?=
 =?utf-8?B?U0p2V2NPdm42K3RVTFlNVUJMTUNZWGp5clA3RUgzTE9RdDR1RmVtU05wZSsv?=
 =?utf-8?B?Z2lTZDYyUysvdm9uYmo0aVV6R1hEY3o2ajZCdElMV1VhenJwRktlK1ZBWEpH?=
 =?utf-8?B?bFp6SG1HYzZtbFZCSUZvRVhPVU5XWFBxMGVCMjBvV01yamJYdFNsMXJ0QUt6?=
 =?utf-8?B?czFtVC9CUFZRWUdaK0ppcy92eXQxS3lTRnIrampvTTQ3M0Z0Y0kwSEpZa1JO?=
 =?utf-8?B?dkJRUnRoNHBjK3I1aDJqRXZJYkhuVHhmUXpsYkEwSmJLK0ttRUE3ekxYV2l6?=
 =?utf-8?B?cGhWMWxpMnVtcWJGeEZESk5vTTdZTTQ3eXBZZC9sK0owZlpSdEZHTDhLVlM3?=
 =?utf-8?B?Vjg5aXBPSVVoaHBVZVU5S0FBb0xzSXlwSkhEaHZhUVowbGZBRXhyN3VtcUFK?=
 =?utf-8?Q?YNel8VjvEXee5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXprM040Y2RJMGNXNU53Qmp6QllMUjhxVVgzdTJwOUY0cTFrckQ1eFFoM1dw?=
 =?utf-8?B?TWZRRjhGU1lDWUZHdzh4SGlzL0xEWllMeTB3ZGk0clNkZ25DOWVFR0ppNGQ1?=
 =?utf-8?B?ZkJndTZqRGdiMGJZdE05ZCtWdGhwWHJNcVV5V3ExOHUzWHVER2hqY3BhaVNN?=
 =?utf-8?B?TDdjVVl5QXlqV0p4THNPK3NqOWxJSDNrR2pmR0xIRWRzcnFyemVBVVVaUE9Z?=
 =?utf-8?B?M2tJOTNZcFkrUHFaYVgwZHhjcU1wZkZtLy9wWG15QnVGcnpPYW5Fb3lQelJX?=
 =?utf-8?B?MnY5ZTA4U0d5NFRaZkRMcmRzZ0pLWDJrSm9ZSVBHb1dXTTUvN1o4WXZpUWVs?=
 =?utf-8?B?SFo4eWhyS1RGcjhHV1hFTHk1Y2MzbjUrNG43Y2xlTXJSQjdZWE5aTHZDS1RC?=
 =?utf-8?B?ZmV2OTNvWnV3anpMTWtuRXFsQStHby83VzcrNHBOdTZ4MkNGSlp0UDJFZ0hQ?=
 =?utf-8?B?MWFIVXVHZ0hVSWZ1VU9OV1ppb09wczVzOTk4aG12bzJVRE4rb3Z4bi8wZXg5?=
 =?utf-8?B?cHhqY1Foalg4a3d4SU9yRlRmbWFudlI1TU13ZVJWQitJQkh0R1Z0dElIVkYv?=
 =?utf-8?B?WVN1R3hGQkN1amlvOU9qR2JFTHBVU2xkTXpLdnFsYTJORzRJMGtWSStVa3hs?=
 =?utf-8?B?MHowMkd2M1BLS09LMGJuTVF0QnJPWkFYdXNYYmdQTkR2Ym5NWE8vY0IvOHhE?=
 =?utf-8?B?VVQyZEdYbWpybHRFZHd6NnFRUk0vMHpEeWNpVnRXc3c5dU8vckc5MXRZOW5M?=
 =?utf-8?B?M0JJc1lVaTU1ZjkwdXhkQVpETEE2bnNRUWxJekxmZUs5WnZnalFJeThicGhO?=
 =?utf-8?B?ZENjSEdiTU11QnUxYloxYWQ3Sk9xcGxYQ0JCV1ZLQ0pDN3prdUMwOWlhVWho?=
 =?utf-8?B?VEZxYU4yakVKVDJyREQwYXJiN2RUdCtRSmc4L1c2SkhNbkFrWTdMVFMvVzRZ?=
 =?utf-8?B?VlN1YVNtYnZ4QXJPRmhwTEV5TzljV2ZqOHllWmg2VTVLcmtISHA4Sndwazhx?=
 =?utf-8?B?V2VHSjJsb1M1dU01VGthbVBtTXE3VlZSaSt3cUpOaXQydjl6ZUc4KzFtcmNI?=
 =?utf-8?B?b0c0YSt5VndyQjc2bjU1VEwrOG9VN3g1c28xSWYwd0FNejQrZEdmN20yRXJu?=
 =?utf-8?B?ODRCT2FuMWx2dk9UVVU0TlplSXprdWF5MW1FbG5IcWZ5VXBYNWQ5SGxVU00x?=
 =?utf-8?B?UDM5OTVoREhVK0tkVGs3UnBYS2JNVFcybE1UMkF6MUJTeGYrUGVUVkVqemlZ?=
 =?utf-8?B?eG1PWGZ1bFhKbjRXZzFmWmFFVXZyZ09ZeGYxaE5Od09aTFF2b1JqWXFYaDg0?=
 =?utf-8?B?Z1U1U2REK0h3eTJHRzg3eGE5Mmg4OHdteXJPNDY1dWFPakQ2K01kWU5aSmhx?=
 =?utf-8?B?ZVgzNFA1RmxRazlydkhIOWp1Q050UVdMRHR2bWZkUmNtb0dJSDg5YUhHNEUz?=
 =?utf-8?B?YVlaYy9XWFhScmM1TFgzQ2hUSEUvN2dTYllIdGhaM0s2RThrMFBPTHNyYTNU?=
 =?utf-8?B?NEZQcmN6WFhZbThuWDhYYTczNzQ3R2JBVlp0OXFOL0NWWHI0TXB3WXI0S3Rk?=
 =?utf-8?B?UDN0aFQreWZWUGpJWEFvM1I4NkU0alZVVUFtTXptWDZjMVV0UVQwL091UHBp?=
 =?utf-8?B?bjRoMGNDMlN3VTBIK0V4VG9idmVkMkVuUFg1QzBUSnJCMHFhRVFDWE5VbzUv?=
 =?utf-8?B?RTVyTkZhNndVYURCLzNocVYrd0t1cWhSM25aeWR5V0dFVjNEWnIwRk5zaUJX?=
 =?utf-8?B?V2pHTnhMa0dkZXNJYkh1SlU5K0ZTOVJqU1FFQzVCSUFsT29VY3lpSVJBdmMv?=
 =?utf-8?B?UzJERzgxVTNZbVZCa0hBTzlWU2Y1RXlieG9xTjFEV3hZMFUxZFd1dmZyQmRz?=
 =?utf-8?B?QU5iQ1RUSFFFQ0l2djdsT0paRjJFUUZmRktSdnpIbE4xazczLzFsRkVSZ281?=
 =?utf-8?B?RklGYXlNZmhMTUNGNUZ5bWUzN3pOTmYyRmM2L21QZGJsbWFYQWYrWGFqcjBw?=
 =?utf-8?B?aHo5UlZjeC9mdDBSYXVVZ2Q5N3hGMVBJN3A1Mk9jY3RacnlUS3VWOHVYTzg5?=
 =?utf-8?B?bjBxSlk1WXEyM3d1WXE0Z0o0MS9OSHMxNGtOVFR2ZUJsWHQyTThKKy9VaUJw?=
 =?utf-8?B?SjE4QjNmYmU4T3Y3aENSd0YrU1pSR2wwa2dYSmxlSk0wUE1SQUhPZnAvSkZi?=
 =?utf-8?B?NWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec68ca62-bff8-4972-ea64-08dd347acb4c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 09:06:56.0098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nKUKB5mFbevg8RziLReT14tsPGBNiU2KtgQalqw34nzQf/R3RZuGayG7EFYMrqai9tOaTZ+YIohjz/h3gKAMIek96N39nn+t9DX+G8vRFz8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6279
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

On 13.01.2025 22:23, Oak Zeng wrote:

> s/vm->ttm.base.resv->lock/vm->gpuvm.r_obj->resv->lock
>
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_vm_doc.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_vm_doc.h b/drivers/gpu/drm/xe/xe_vm_doc.h
> index 078786958403..1030ce214032 100644
> --- a/drivers/gpu/drm/xe/xe_vm_doc.h
> +++ b/drivers/gpu/drm/xe/xe_vm_doc.h
> @@ -431,7 +431,7 @@
>    * bind path also acquires this lock in write while the exec / compute mode
>    * rebind worker acquires this lock in read mode.
>    *
> - * VM dma-resv lock (vm->ttm.base.resv->lock) - WW lock. Protects VM dma-resv
> + * VM dma-resv lock (vm->gpuvm.r_obj->resv->lock) - WW lock. Protects VM dma-resv
>    * slots which is shared with any private BO in the VM. Expected to be acquired
>    * during VM binds, execs, and compute mode rebind worker. This lock is also
>    * held when private BOs are being evicted.

Indeed it is a not correct. The ttm.base is always linked with BO. 
However the gpuvm.r_obj is

passed to drm_exec_lock_obj() so internals are later hidden.


Reviewed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>

