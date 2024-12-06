Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B527AE77173
	for <intel-xe@archiver.kernel.org>; Fri,  6 Dec 2024 23:49:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D2AC10F1D8;
	Fri,  6 Dec 2024 23:49:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eDdSzkfn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9600510F1D8
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Dec 2024 23:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733528965; x=1765064965;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TDwHiTU8RGBQhJCNGSs4CnE37ZSM1aCEu52WQm7pq6U=;
 b=eDdSzkfnTts0bHY6KXX4Otv1jYTywtO7NcpxdbT3U4b6bHWm5Sk4j8nK
 wvUzqoZXsXS+9cBc9qrxnNQ2K690AspdhRY1EQc6ysQuegf1Moyax3Z3J
 SFb4KuhuU6pVY16OzLcBlM/nbZVJ8v3BypSaHmaFx2FBF2nMqrPjfVpiy
 yR4h5SX9VBkK6t7IMRzbngZ6FUBPg460oMNxPyPlKZEiLuMQdT7SPdjqa
 QjQ0KBmT3GREpt8jGbHKebatQKRxTOYyUkpe5bmX9A5oRqXxt2AeUOn72
 S9bXG0JtOB/2RCGCWjK4jv3URX22Qkm/pC5OTSOFTede+nyjv68OILo6O w==;
X-CSE-ConnectionGUID: +V4wvYsZRUmgBtj9GSfVQw==
X-CSE-MsgGUID: 1cAUKO/wS1WfYTDFnEiILg==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="51429596"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="51429596"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 15:49:25 -0800
X-CSE-ConnectionGUID: hHve1kA7Rb+Yb0XrEFAstg==
X-CSE-MsgGUID: UJ2dAdkzRtScI4PzU1PZ5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="95025061"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2024 15:49:25 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Dec 2024 15:49:24 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Dec 2024 15:49:24 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Dec 2024 15:49:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LB3W2A1TOSFoSuPbKcPOWuDD2htCZ5LbOhAW+BR0brFRRqz91rvvWZEIMFDUmQOU3dgKQUSIqgXH0qQOVksziQQoiTJo0hBGdf8r+mnIF6Gdt/1zsQzrC9dWx6zKPrxJ16R21rdGGBW/Rq4l865EkgEXBisnmqEen89Pab8LZfAniI988RQ9PQ+/zXC5eInrpbcObzlH2Uw07/kAsolDj8ou8wK9mHeZxJaAFQfRUq7UBKsbVt0nt7tXGIRx8MGmOfCTcnq9KrHGeRcU8nERnkuvOw854Y1bS0gIo/sXwAOzNM+tzR1Grg54y1sboBdes1QTfOcpzNXB1QQ9rTPYmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=32UxR/AGvEY4TrR8fTHbMYl05zCVyXVc8fArOdmlorY=;
 b=ydTauVzihW5yhQNcuAG1Bfd/GpLG3Fvq1w56Wb841eGaHZ4YKfJpP3OpAUDNP32OZ5JHivfihh8eWtUp+3maG+PEMVddDWZlFhxtekd7UlilCyeGG4TzATMflVkOMtwCCYRiOpuZH5Dls+fl1hXQLhLjW6TjYWC7fgOOR5fgBUE5ZtUNEclrz5U9lorMEtF9g1uN64Q7B9SMIp4QcaH1wh5CSo/2k30X7lEXVXWOk0jaqyGLDnYcBeGIHAiZb3OzoraV07UMWGMR08VQdL2EbLJpjA8rz7kru42+QDYfaUf9vvtJYeYsdO+dHW01SNlJvEwA8mDWqBWLGuej6upddw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DM3PR11MB8714.namprd11.prod.outlook.com (2603:10b6:0:b::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.11; Fri, 6 Dec 2024 23:49:21 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8207.017; Fri, 6 Dec 2024
 23:49:21 +0000
Message-ID: <75c9a804-7cc4-43ab-9de3-0cfc2708db28@intel.com>
Date: Fri, 6 Dec 2024 15:49:14 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/12] drm/xe/pxp: Allocate PXP execution resources
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20241120234353.1037180-1-daniele.ceraolospurio@intel.com>
 <20241120234353.1037180-3-daniele.ceraolospurio@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20241120234353.1037180-3-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0304.namprd04.prod.outlook.com
 (2603:10b6:303:82::9) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DM3PR11MB8714:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b715a81-4ea9-492f-fd6f-08dd16509b49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SG9iYVFteVNRZGpDbnhqVHhGanQrYldwZWNlaURxOHBqaGtMTW9kRkt4cGo3?=
 =?utf-8?B?YnR0bDBncU51bEsvb1RleHdPOXZUQm5McDZFR3BWS1N2enVkQ08wSXlDVVVo?=
 =?utf-8?B?L0ZaSStPeWxEaUxmalJBZWJHaDQzYlE0c213aWYyeHM1UHgyMzVmRmJPSjA5?=
 =?utf-8?B?WkxjNngzUFB5RXJZMnNZS0x6OXk1alZ6UWZ3SjhJM2lsY0xpMHpQR2FhL21E?=
 =?utf-8?B?OXNGVUJ5czJjK1RzWmN1Nkp1MjhFU2FoWGFuaTZaWjJOUnc4K214Q0hIS0ZR?=
 =?utf-8?B?QTRWQTRsZ3F6dU9qNVo3dndlc2prMjRodFRKa09IazRudEhCZCtibVAzbC9Z?=
 =?utf-8?B?bExyTkxORGVUdjhmUjNQZUlkRUVaK3ZYZlJmWTErUnhnR3VnMzV6bEgrbnp1?=
 =?utf-8?B?dDlZWExWVm9SRll2ZXAzejV3UVI3czFLK1pTMUFOak1KbmF4TFdjMWxBNjNM?=
 =?utf-8?B?M05PTVhIOHczNGdFL2hIMlFPKyttclZ4bGx5ZGNTRUdIa3RyeEhuSXU5NlUw?=
 =?utf-8?B?VTFSYUlvZ0RQak1wcXhlQ2hua0ptd2t3bFd4Z0pUSUdabExHM1NZVWVGdjNq?=
 =?utf-8?B?QUdHQXYzU0YxRHNpUWJmTEM5bzRUTCtqZ1N5OUtxRHdnUDN0SzNOOXJLY001?=
 =?utf-8?B?K01ncHN6VS9YbWJoVHFRMTFyaXFrZW8zQzNpd1RDalhKNW1ZN1Z2RHlVZWlt?=
 =?utf-8?B?UWgxVG9RQUhHdEVjRWZCTzhmZitwUWI5aVNUc2xxMjhqd2FpekliQTZRcXhL?=
 =?utf-8?B?ZHllL09aYUxhTWVMZTJpTDAvdGdxdHRUdUFqcDlJelpHTEhhZlloMmtRNkQ5?=
 =?utf-8?B?bjZ6a2VxbkZoYzJ1OCsvTkl6OEUzYkJzaXVyTzJaWUgvUlhhSk1acGdidGFi?=
 =?utf-8?B?M3hJOFRvVkNySzNMN1FlWnJtNk0zRkwyZCtiLzgwSkx6eHlMYU9YcmxwUkFZ?=
 =?utf-8?B?VzI1SGlvVDBFUm1CSWhpem1EYlNDa3FIM1FudE1HQmJJYStYdUhCSWxNQ05W?=
 =?utf-8?B?VkRoalNqTGl2WW93Wk45c2tReThCYWJvRGFaeG8xVHRNcU4rYlI1eGZWQ1M3?=
 =?utf-8?B?dmhqbnBjb2NETU9WbGRuSEc0azlvWjMyWUlwY3d6bGRqYUdhTjdHL1lGVnhP?=
 =?utf-8?B?RlA2ZGhQS3Mzc0M4NmJnNlc4bk1RaVRrMXQ5NjZLUkxMY1A1MjBvUEo5RkxU?=
 =?utf-8?B?NEUzcGtzKzFIMDBlazNvTXUvUmpYVkRydm8waGhPL2R3QnZ2NGVFTmE5NlZN?=
 =?utf-8?B?c1NtaWNiWlRYRWRzRVpXTzE2MFlpc3JWbGdEU1FEZW81eWNaams3TE5YaEY1?=
 =?utf-8?B?Vndxb1NjVkhsbWVpNFhYRWNiWUxBUzBQdW8vQy9ZNnN1YkQ3am1KRTJXeFdh?=
 =?utf-8?B?VVRtN05kUjgvbjRUbExqMUlZZFR6Sk5rN0NreFgrdnVCUmRvZnRJRkRYK1F0?=
 =?utf-8?B?eDA2ajNnQkQ0bXcvR3hhc21FYkV5M1I2QUNKR0JoSzJvMXZpZW1YY3M4VVox?=
 =?utf-8?B?VDJSZE80THJYZ2wwTzlvOVN4eUZnTE40NjdIaDlsNW4wanNJZmlaS3ZhUmRF?=
 =?utf-8?B?M0xsdkdCaDAvTGs2dUh2RXJybHd6L25KaldFa1VYd29ZYjJQczA4VkZ6T2g2?=
 =?utf-8?B?NHpGSThReDV0c0xKSE5YN2VDMDZ2aG5Pcm91U1hwbjZGVHNGbGMyTkUwNDdv?=
 =?utf-8?B?THkwTnhycTFUVThUdXIyTEIwRnlOWUcvanF6eVNsb01BeXFnYi9Na2RoUDhZ?=
 =?utf-8?B?L1NkUzlYeU10RzhQd2VGaGhwS1dOWWk4ZE9WeFM3dnVxaHdjeFhZTThEeEE2?=
 =?utf-8?B?STJxb3djWC8rOTFlUGdxZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1E5d1NENTQxQmcwWnI3REw3YmhEQUxMYkNQeWxMSStoOXlOTUthYmRiR1Z1?=
 =?utf-8?B?ek1NOFZVdWM5UjZIK256TGVRYzNMTTV6Yks5SDNqNVdkTXBybkM5UTFpMGZU?=
 =?utf-8?B?VlhBSm0vQkJ4ZkVFdkRmcFF2NjNNSCswMGhwU3N4RWFHRldzYi83cTZJcFk2?=
 =?utf-8?B?endIUUVuWkxPZENvVDNZeGJJVGYxc1JlUlY4Y21RcFBBSWZBT0pwdGV6V2FL?=
 =?utf-8?B?SVBMRVUzWnVsK0h4OXVTcm5hVU1RaVpiNG5COFRNaWNXWURwM25ac2FUUFdo?=
 =?utf-8?B?TTQxTkFGNVRxdnFCQzVpeWNCbGRQY2loenJkQUhzZExveDg5SVBDc1hxNkVW?=
 =?utf-8?B?OWh5R2lrWjRDeDdQMXNUK2VISlJIOEJpSHpqbHRYRFFzQVcvMVFUSEFSNmlQ?=
 =?utf-8?B?Rnl0SlJEY0dYU1BudzhudXVGVDZtVXdSYnh6ZzExR2V5VkdYZlprQ1cxczV0?=
 =?utf-8?B?eE12aE04NnBOZ2Vib3VyTVU2ZUlEZnUreGFNNGJlSW13ZEV0Y1RReHRQK0xV?=
 =?utf-8?B?ZXNac3RhV2dqT3BGMUVYeHhGaWFidGxOdlR2YW00OWRvVnErM1NwSjdwVHRD?=
 =?utf-8?B?bDVDMHMxMlNtczY5dCtwb3ZMY3ZyYzRqMS8wUHhBSHZVc3dqNjhrT2JJYmtn?=
 =?utf-8?B?Q2RHQll0Um51Tm5pOUgrMHFOeWExVTZWSkdaWm1uTEE1ZTJhNThJcDZZYVZ2?=
 =?utf-8?B?ejJsRmxOekl3dVNvNjlBSk43Z29oUzRIQmhENHR5aU9QK2pCMzhPdkhTOE11?=
 =?utf-8?B?VlBpT0xIN09ObmxqQnVsRWc3VXJGWTNiQVhBSGJTZ3lIUlVxTFF4TURRQWpn?=
 =?utf-8?B?aGxJMGJ0WlZUYlFqS3U5MVVhanliSWNzM2VMNDlsMG00YzR4dlNzaVJWcUpB?=
 =?utf-8?B?aWRTMEpHUUYzN21kc1BTdDNGRWQvMnRjdUp4RGF6V3hUUWJyTEpSZU1FK1B6?=
 =?utf-8?B?TVRScHpQaGI1N2NmNXBmTU5uUzV1Qm03OWluZlgvT1gvZFd5cVM4WkZvQXJv?=
 =?utf-8?B?OG8rTWxqanBTbk5Gc3hmQVhCeVU1aVNRbFhvby94ZUR3ME9aU3RURVh0YUZy?=
 =?utf-8?B?cTVZV0hsYmg2S0FOQ29MMG1GVDUwZzBsQlZaK3hNdzdQQjRDUnVwUWVRaGVy?=
 =?utf-8?B?QUxkeVFGcjd3NFZFNmRxelEyQmhNcllCNVEwOVd1Nlg5cGRTcnRnU2tCQVho?=
 =?utf-8?B?SDlVWis1VktZYWlHdFV4S1MxWnZIL2ZBa3dqbWJPRmdzOElQT1kyVHNZR0FD?=
 =?utf-8?B?VHZLR3RIcyswTi9nOG5LWEFvQ0w5T2NOYVZGeWo3WmZEQ0IvRFhIdXhYS2ZB?=
 =?utf-8?B?VzlmclhCRjNOdEhKclBFNDU2NXBPdTRrZEZmN0dqVzI0RmhyYlh3bVFwWGNW?=
 =?utf-8?B?Zmw4UjUyZDhIOGU0OFV4S0tWNWl3NUg2cEk2ZTN2cERHZ0Zoai9VTytUblRJ?=
 =?utf-8?B?R2MrdWs4c2tPcXhsZzdaUE9aOFd2YllRN2p0SGZTdUFybytWM0J4TTRqWFJS?=
 =?utf-8?B?VUFBazRIOWZsYWNuRjNmbjdKT01OZ2FpU2lPSGtRT3VVaSthV1V5Sm85ajJu?=
 =?utf-8?B?V2dwMGhJdXZUNDkrb2pueU1hMDdvL0tmb0VVWDh1SXl2YkdQOTh5dHdUN3Jp?=
 =?utf-8?B?RVVXS0xOSi9HSHJLd0ROVlAxRkJlbjZFc3hFc2pNQm1TMktRRnlNd1hNVTJm?=
 =?utf-8?B?OE5ZWDRzbytMWWdRRFRHZVRFcW9zbExmVlZXc1VHVi9rM0owNUJtb2lJaEg4?=
 =?utf-8?B?eWZsRVRwbVh4TUc5YlhyMUR6QXVEWWNPSktjdXJWa1JVSk1yTkVVL0kwYVJ1?=
 =?utf-8?B?Qkt2Y3g0SzYyK0x1S1NwU05CbFRmZmQrcTB2WWgyYkVhcVYxR3h5dEVnN3c4?=
 =?utf-8?B?WkU4Q2oxU01ycHNidTRNRG8yeFNoWHFGSjllSnY1Z2lQS3kwRzlYQkNDVGR2?=
 =?utf-8?B?NENIcFI1R0U1NVRaWUl0bUg4emFYanVUczh6WXdScUM4VFB2UEJCTnNlNy9G?=
 =?utf-8?B?UVNmb0JKZ2ZTclBzbHpPd3FpYkVKVytDbVJEUWQvZFJwRUNiSGJmd1VEYmRD?=
 =?utf-8?B?OW8yOWhlQXRIV1FmVTRoZGZPNkhoUG9YNkNZZ3dIZVZWaC9JeHVyQ2hlT0Vi?=
 =?utf-8?B?d1R2ZDA2VFpmNGZmeGF0a2dRWXI0MmZtaFg2bU5sTE9zd05VMG5DbXhURGpj?=
 =?utf-8?B?RHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b715a81-4ea9-492f-fd6f-08dd16509b49
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 23:49:21.7784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h1oyx73YCmHJURMOSKSS2vwQI4jEl+zOqWkOE0VqpBx0D8Mb1PpGKrNK5T0sSku1GMeMNbrHNe7ivKMwNNIU9Fhwuhuef1ba++cYLBZEnn4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8714
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
> PXP requires submissions to the HW for the following operations
>
> 1) Key invalidation, done via the VCS engine
> 2) Communication with the GSC FW for session management, done via the
>     GSCCS.
>
> Key invalidation submissions are serialized (only 1 termination can be
> serviced at a given time) and done via GGTT, so we can allocate a simple
> BO and a kernel queue for it.
>
> Submissions for session management are tied to a PXP client (identified
> by a unique host_session_id); from the GSC POV this is a user-accessible
> construct, so all related submission must be done via PPGTT. The driver
> does not currently support PPGTT submission from within the kernel, so
> to add this support, the following changes have been included:
>
> - a new type of kernel-owned VM (marked as GSC), required to ensure we
>    don't use fault mode on the engine and to mark the different lock
>    usage with lockdep.
> - a new function to map a BO into a VM from within the kernel.
>
> v2: improve comments and function name, remove unneeded include (John)
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile                   |   1 +
>   drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h |   7 +
>   drivers/gpu/drm/xe/xe_exec_queue.c            |   3 +
>   drivers/gpu/drm/xe/xe_pxp.c                   |  23 +-
>   drivers/gpu/drm/xe/xe_pxp_submit.c            | 200 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_pxp_submit.h            |  14 ++
>   drivers/gpu/drm/xe/xe_pxp_types.h             |  48 +++++
>   drivers/gpu/drm/xe/xe_vm.c                    | 119 ++++++++++-
>   drivers/gpu/drm/xe/xe_vm.h                    |   6 +
>   drivers/gpu/drm/xe/xe_vm_types.h              |   1 +
>   10 files changed, 411 insertions(+), 11 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_pxp_submit.c
>   create mode 100644 drivers/gpu/drm/xe/xe_pxp_submit.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 3c0bd3c814de..126c8f1ab673 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -87,6 +87,7 @@ xe-y += xe_bb.o \
>   	xe_pt.o \
>   	xe_pt_walk.o \
>   	xe_pxp.o \
> +	xe_pxp_submit.o \
>   	xe_query.o \
>   	xe_range_fence.o \
>   	xe_reg_sr.o \
> diff --git a/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h b/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
> index 57520809e48d..f3c4cf10ba20 100644
> --- a/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
> +++ b/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
> @@ -6,6 +6,7 @@
>   #ifndef _ABI_GSC_PXP_COMMANDS_ABI_H
>   #define _ABI_GSC_PXP_COMMANDS_ABI_H
>   
> +#include <linux/sizes.h>
>   #include <linux/types.h>
>   
>   /* Heci client ID for PXP commands */
> @@ -13,6 +14,12 @@
>   
>   #define PXP_APIVER(x, y) (((x) & 0xFFFF) << 16 | ((y) & 0xFFFF))
>   
> +/*
> + * A PXP sub-section in an HECI packet can be up to 64K big in each direction.
> + * This does not include the top-level GSC header.
> + */
> +#define PXP_MAX_PACKET_SIZE SZ_64K
> +
>   /*
>    * there are a lot of status codes for PXP, but we only define the cross-API
>    * common ones that we actually can handle in the kernel driver. Other failure
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index aab9e561153d..60418debc1ec 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -150,6 +150,9 @@ struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
>   	struct xe_exec_queue *q;
>   	int err;
>   
> +	/* VMs for GSCCS queues (and only those) must have the XE_VM_FLAG_GSC flag */
> +	xe_assert(xe, !vm || (!!(vm->flags & XE_VM_FLAG_GSC) == !!(hwe->engine_id == XE_HW_ENGINE_GSCCS0)));
> +
>   	q = __xe_exec_queue_alloc(xe, vm, logical_mask, width, hwe, flags,
>   				  extensions);
>   	if (IS_ERR(q))
> diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
> index 1a4d12d37d96..89d71a69cdff 100644
> --- a/drivers/gpu/drm/xe/xe_pxp.c
> +++ b/drivers/gpu/drm/xe/xe_pxp.c
> @@ -12,6 +12,7 @@
>   #include "xe_gt.h"
>   #include "xe_gt_types.h"
>   #include "xe_mmio.h"
> +#include "xe_pxp_submit.h"
>   #include "xe_pxp_types.h"
>   #include "xe_uc_fw.h"
>   #include "regs/xe_pxp_regs.h"
> @@ -50,6 +51,20 @@ static int kcr_pxp_enable(const struct xe_pxp *pxp)
>   	return kcr_pxp_set_status(pxp, true);
>   }
>   
> +static int kcr_pxp_disable(const struct xe_pxp *pxp)
> +{
> +	return kcr_pxp_set_status(pxp, false);
> +}
> +
> +static void pxp_fini(void *arg)
> +{
> +	struct xe_pxp *pxp = arg;
> +
> +	xe_pxp_destroy_execution_resources(pxp);
> +
> +	/* no need to explicitly disable KCR since we're going to do an FLR */
> +}
> +
>   /**
>    * xe_pxp_init - initialize PXP support
>    * @xe: the xe_device structure
> @@ -97,10 +112,16 @@ int xe_pxp_init(struct xe_device *xe)
>   	if (err)
>   		goto out_free;
>   
> +	err = xe_pxp_allocate_execution_resources(pxp);
> +	if (err)
> +		goto out_kcr_disable;
> +
>   	xe->pxp = pxp;
>   
> -	return 0;
> +	return devm_add_action_or_reset(xe->drm.dev, pxp_fini, pxp);
>   
> +out_kcr_disable:
> +	kcr_pxp_disable(pxp);
>   out_free:
>   	drmm_kfree(&xe->drm, pxp);
>   	return err;
> diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.c b/drivers/gpu/drm/xe/xe_pxp_submit.c
> new file mode 100644
> index 000000000000..196c0e5bbb17
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
> @@ -0,0 +1,200 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright(c) 2024 Intel Corporation.
> + */
> +
> +#include "xe_pxp_submit.h"
> +
> +#include <uapi/drm/xe_drm.h>
> +
> +#include "xe_device_types.h"
> +#include "xe_bo.h"
> +#include "xe_exec_queue.h"
> +#include "xe_gsc_submit.h"
> +#include "xe_gt.h"
> +#include "xe_pxp_types.h"
> +#include "xe_vm.h"
> +
> +/*
> + * The VCS is used for kernel-owned GGTT submissions to issue key termination.
> + * Terminations are serialized, so we only need a single queue and a single
> + * batch.
> + */
> +static int allocate_vcs_execution_resources(struct xe_pxp *pxp)
> +{
> +	struct xe_gt *gt = pxp->gt;
> +	struct xe_device *xe = pxp->xe;
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_hw_engine *hwe;
> +	struct xe_exec_queue *q;
> +	struct xe_bo *bo;
> +	int err;
> +
> +	hwe = xe_gt_hw_engine(gt, XE_ENGINE_CLASS_VIDEO_DECODE, 0, true);
> +	if (!hwe)
> +		return -ENODEV;
> +
> +	q = xe_exec_queue_create(xe, NULL, BIT(hwe->logical_instance), 1, hwe,
> +				 EXEC_QUEUE_FLAG_KERNEL | EXEC_QUEUE_FLAG_PERMANENT, 0);
> +	if (IS_ERR(q))
> +		return PTR_ERR(q);
> +
> +	/*
> +	 * Each termination is 16 DWORDS, so 4K is enough to contain a
> +	 * termination for each sessions.
> +	 */
> +	bo = xe_bo_create_pin_map(xe, tile, 0, SZ_4K, ttm_bo_type_kernel,
> +				  XE_BO_FLAG_SYSTEM | XE_BO_FLAG_PINNED | XE_BO_FLAG_GGTT);
> +	if (IS_ERR(bo)) {
> +		err = PTR_ERR(bo);
> +		goto out_queue;
> +	}
> +
> +	pxp->vcs_exec.q = q;
> +	pxp->vcs_exec.bo = bo;
> +
> +	return 0;
> +
> +out_queue:
> +	xe_exec_queue_put(q);
> +	return err;
> +}
> +
> +static void destroy_vcs_execution_resources(struct xe_pxp *pxp)
> +{
> +	if (pxp->vcs_exec.bo)
> +		xe_bo_unpin_map_no_vm(pxp->vcs_exec.bo);
> +
> +	if (pxp->vcs_exec.q)
> +		xe_exec_queue_put(pxp->vcs_exec.q);
> +}
> +
> +#define PXP_BB_SIZE		XE_PAGE_SIZE
> +static int allocate_gsc_client_resources(struct xe_gt *gt,
> +					 struct xe_pxp_gsc_client_resources *gsc_res,
> +					 size_t inout_size)
> +{
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_hw_engine *hwe;
> +	struct xe_vm *vm;
> +	struct xe_bo *bo;
> +	struct xe_exec_queue *q;
> +	struct dma_fence *fence;
> +	long timeout;
> +	int err = 0;
> +
> +	hwe = xe_gt_hw_engine(gt, XE_ENGINE_CLASS_OTHER, 0, true);
> +
> +	/* we shouldn't reach here if the GSC engine is not available */
> +	xe_assert(xe, hwe);
> +
> +	/* PXP instructions must be issued from PPGTT */
> +	vm = xe_vm_create(xe, XE_VM_FLAG_GSC);
> +	if (IS_ERR(vm))
> +		return PTR_ERR(vm);
> +
> +	/* We allocate a single object for the batch and the in/out memory */
> +	xe_vm_lock(vm, false);
> +	bo = xe_bo_create_pin_map(xe, tile, vm, PXP_BB_SIZE + inout_size * 2,
> +				  ttm_bo_type_kernel,
> +				  XE_BO_FLAG_SYSTEM | XE_BO_FLAG_PINNED | XE_BO_FLAG_NEEDS_UC);
> +	xe_vm_unlock(vm);
> +	if (IS_ERR(bo)) {
> +		err = PTR_ERR(bo);
> +		goto vm_out;
> +	}
> +
> +	fence = xe_vm_bind_kernel_bo(vm, bo, NULL, 0, XE_CACHE_WB);
> +	if (IS_ERR(fence)) {
> +		err = PTR_ERR(fence);
> +		goto bo_out;
> +	}
> +
> +	timeout = dma_fence_wait_timeout(fence, false, HZ);
> +	dma_fence_put(fence);
> +	if (timeout <= 0) {
> +		err = timeout ?: -ETIME;
> +		goto bo_out;
> +	}
> +
> +	q = xe_exec_queue_create(xe, vm, BIT(hwe->logical_instance), 1, hwe,
> +				 EXEC_QUEUE_FLAG_KERNEL |
> +				 EXEC_QUEUE_FLAG_PERMANENT, 0);
> +	if (IS_ERR(q)) {
> +		err = PTR_ERR(q);
> +		goto bo_out;
> +	}
> +
> +	gsc_res->vm = vm;
> +	gsc_res->bo = bo;
> +	gsc_res->inout_size = inout_size;
> +	gsc_res->batch = IOSYS_MAP_INIT_OFFSET(&bo->vmap, 0);
> +	gsc_res->msg_in = IOSYS_MAP_INIT_OFFSET(&bo->vmap, PXP_BB_SIZE);
> +	gsc_res->msg_out = IOSYS_MAP_INIT_OFFSET(&bo->vmap, PXP_BB_SIZE + inout_size);
> +	gsc_res->q = q;
> +
> +	/* initialize host-session-handle (for all Xe-to-gsc-firmware PXP cmds) */
> +	gsc_res->host_session_handle = xe_gsc_create_host_session_id();
> +
> +	return 0;
> +
> +bo_out:
> +	xe_bo_unpin_map_no_vm(bo);
> +vm_out:
> +	xe_vm_close_and_put(vm);
> +
> +	return err;
> +}
> +
> +static void destroy_gsc_client_resources(struct xe_pxp_gsc_client_resources *gsc_res)
> +{
> +	if (!gsc_res->q)
> +		return;
> +
> +	xe_exec_queue_put(gsc_res->q);
> +	xe_bo_unpin_map_no_vm(gsc_res->bo);
> +	xe_vm_close_and_put(gsc_res->vm);
> +}
> +
> +/**
> + * xe_pxp_allocate_execution_resources - Allocate PXP submission objects
> + * @pxp: the xe_pxp structure
> + *
> + * Allocates exec_queues objects for VCS and GSCCS submission. The GSCCS
> + * submissions are done via PPGTT, so this function allocates a VM for it and
> + * maps the object into it.
> + *
> + * Returns 0 if the allocation and mapping is successful, an errno value
> + * otherwise.
> + */
> +int xe_pxp_allocate_execution_resources(struct xe_pxp *pxp)
> +{
> +	int err;
> +
> +	err = allocate_vcs_execution_resources(pxp);
> +	if (err)
> +		return err;
> +
> +	/*
> +	 * PXP commands can require a lot of BO space (see PXP_MAX_PACKET_SIZE),
> +	 * but we currently only support a subset of commands that are small
> +	 * (< 20 dwords), so a single page is enough for now.
> +	 */
> +	err = allocate_gsc_client_resources(pxp->gt, &pxp->gsc_res, XE_PAGE_SIZE);
> +	if (err)
> +		goto destroy_vcs_context;
> +
> +	return 0;
> +
> +destroy_vcs_context:
> +	destroy_vcs_execution_resources(pxp);
> +	return err;
> +}
> +
> +void xe_pxp_destroy_execution_resources(struct xe_pxp *pxp)
> +{
> +	destroy_gsc_client_resources(&pxp->gsc_res);
> +	destroy_vcs_execution_resources(pxp);
> +}
> +
I think this is the blank line that 'git am' is complaining about.

John.

> diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.h b/drivers/gpu/drm/xe/xe_pxp_submit.h
> new file mode 100644
> index 000000000000..fd21ac935be1
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pxp_submit.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright(c) 2024, Intel Corporation. All rights reserved.
> + */
> +
> +#ifndef __XE_PXP_SUBMIT_H__
> +#define __XE_PXP_SUBMIT_H__
> +
> +struct xe_pxp;
> +
> +int xe_pxp_allocate_execution_resources(struct xe_pxp *pxp);
> +void xe_pxp_destroy_execution_resources(struct xe_pxp *pxp);
> +
> +#endif /* __XE_PXP_SUBMIT_H__ */
> diff --git a/drivers/gpu/drm/xe/xe_pxp_types.h b/drivers/gpu/drm/xe/xe_pxp_types.h
> index 4639cf49d267..25db23180a30 100644
> --- a/drivers/gpu/drm/xe/xe_pxp_types.h
> +++ b/drivers/gpu/drm/xe/xe_pxp_types.h
> @@ -6,8 +6,45 @@
>   #ifndef __XE_PXP_TYPES_H__
>   #define __XE_PXP_TYPES_H__
>   
> +#include <linux/iosys-map.h>
> +#include <linux/types.h>
> +
> +struct xe_bo;
> +struct xe_exec_queue;
>   struct xe_device;
>   struct xe_gt;
> +struct xe_vm;
> +
> +/**
> + * struct xe_pxp_gsc_client_resources - resources for GSC submission by a PXP
> + * client. The GSC FW supports multiple GSC client active at the same time.
> + */
> +struct xe_pxp_gsc_client_resources {
> +	/**
> +	 * @host_session_handle: handle used to identify the client in messages
> +	 * sent to the GSC firmware.
> +	 */
> +	u64 host_session_handle;
> +	/** @vm: VM used for PXP submissions to the GSCCS */
> +	struct xe_vm *vm;
> +	/** @q: GSCCS exec queue for PXP submissions */
> +	struct xe_exec_queue *q;
> +
> +	/**
> +	 * @bo: BO used for submissions to the GSCCS and GSC FW. It includes
> +	 * space for the GSCCS batch and the input/output buffers read/written
> +	 * by the FW
> +	 */
> +	struct xe_bo *bo;
> +	/** @inout_size: size of each of the msg_in/out sections individually */
> +	u32 inout_size;
> +	/** @batch: iosys_map to the batch memory within the BO */
> +	struct iosys_map batch;
> +	/** @msg_in: iosys_map to the input memory within the BO */
> +	struct iosys_map msg_in;
> +	/** @msg_out: iosys_map to the output memory within the BO */
> +	struct iosys_map msg_out;
> +};
>   
>   /**
>    * struct xe_pxp - pxp state
> @@ -21,6 +58,17 @@ struct xe_pxp {
>   	 * (VDBOX, KCR and GSC)
>   	 */
>   	struct xe_gt *gt;
> +
> +	/** @vcs_exec: kernel-owned objects for PXP submissions to the VCS */
> +	struct {
> +		/** @vcs_exec.q: kernel-owned VCS exec queue used for PXP terminations */
> +		struct xe_exec_queue *q;
> +		/** @vcs_exec.bo: BO used for submissions to the VCS */
> +		struct xe_bo *bo;
> +	} vcs_exec;
> +
> +	/** @gsc_exec: kernel-owned objects for PXP submissions to the GSCCS */
> +	struct xe_pxp_gsc_client_resources gsc_res;
>   };
>   
>   #endif /* __XE_PXP_TYPES_H__ */
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 1d7faeba157e..eb95f654a88f 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1382,6 +1382,12 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>   	struct xe_tile *tile;
>   	u8 id;
>   
> +	/*
> +	 * Since the GSCCS is not user-accessible, we don't expect a GSC VM to
> +	 * ever be in faulting mode.
> +	 */
> +	xe_assert(xe, !((flags & XE_VM_FLAG_GSC) && (flags & XE_VM_FLAG_FAULT_MODE)));
> +
>   	vm = kzalloc(sizeof(*vm), GFP_KERNEL);
>   	if (!vm)
>   		return ERR_PTR(-ENOMEM);
> @@ -1392,7 +1398,21 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>   
>   	vm->flags = flags;
>   
> -	init_rwsem(&vm->lock);
> +	/**
> +	 * GSC VMs are kernel-owned, only used for PXP ops and can sometimes be
> +	 * manipulated under the PXP mutex. However, the PXP mutex can be taken
> +	 * under a user-VM lock when the PXP session is started at exec_queue
> +	 * creation time. Those are different VMs and therefore there is no risk
> +	 * of deadlock, but we need to tell lockdep that this is the case or it
> +	 * will print a warning.
> +	 */
> +	if (flags & XE_VM_FLAG_GSC) {
> +		static struct lock_class_key gsc_vm_key;
> +
> +		__init_rwsem(&vm->lock, "gsc_vm", &gsc_vm_key);
> +	} else {
> +		init_rwsem(&vm->lock);
> +	}
>   	mutex_init(&vm->snap_mutex);
>   
>   	INIT_LIST_HEAD(&vm->rebind_list);
> @@ -2666,11 +2686,10 @@ static void vm_bind_ioctl_ops_fini(struct xe_vm *vm, struct xe_vma_ops *vops,
>   	for (i = 0; i < vops->num_syncs; i++)
>   		xe_sync_entry_signal(vops->syncs + i, fence);
>   	xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
> -	dma_fence_put(fence);
>   }
>   
> -static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
> -				     struct xe_vma_ops *vops)
> +static struct dma_fence *vm_bind_ioctl_ops_execute(struct xe_vm *vm,
> +						   struct xe_vma_ops *vops)
>   {
>   	struct drm_exec exec;
>   	struct dma_fence *fence;
> @@ -2683,21 +2702,21 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
>   	drm_exec_until_all_locked(&exec) {
>   		err = vm_bind_ioctl_ops_lock_and_prep(&exec, vm, vops);
>   		drm_exec_retry_on_contention(&exec);
> -		if (err)
> +		if (err) {
> +			fence = ERR_PTR(err);
>   			goto unlock;
> +		}
>   
>   		fence = ops_execute(vm, vops);
> -		if (IS_ERR(fence)) {
> -			err = PTR_ERR(fence);
> +		if (IS_ERR(fence))
>   			goto unlock;
> -		}
>   
>   		vm_bind_ioctl_ops_fini(vm, vops, fence);
>   	}
>   
>   unlock:
>   	drm_exec_fini(&exec);
> -	return err;
> +	return fence;
>   }
>   ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
>   
> @@ -2929,6 +2948,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	struct xe_sync_entry *syncs = NULL;
>   	struct drm_xe_vm_bind_op *bind_ops;
>   	struct xe_vma_ops vops;
> +	struct dma_fence *fence;
>   	int err;
>   	int i;
>   
> @@ -3093,7 +3113,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	if (err)
>   		goto unwind_ops;
>   
> -	err = vm_bind_ioctl_ops_execute(vm, &vops);
> +	fence = vm_bind_ioctl_ops_execute(vm, &vops);
> +	if (IS_ERR(fence))
> +		err = PTR_ERR(fence);
> +	else
> +		dma_fence_put(fence);
>   
>   unwind_ops:
>   	if (err && err != -ENODATA)
> @@ -3127,6 +3151,81 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	return err;
>   }
>   
> +/**
> + * xe_vm_bind_bo - bind a kernel BO to a VM
> + * @vm: VM to bind the BO to
> + * @bo: BO to bind
> + * @q: exec queue to use for the bind (optional)
> + * @addr: address at which to bind the BO
> + * @cache_lvl: PAT cache level to use
> + *
> + * Execute a VM bind map operation on a kernel-owned BO to bind it into a
> + * kernel-owned VM.
> + *
> + * Returns a dma_fence to track the binding completion if the job to do so was
> + * successfully submitted, an error pointer otherwise.
> + */
> +struct dma_fence *xe_vm_bind_kernel_bo(struct xe_vm *vm, struct xe_bo *bo,
> +				       struct xe_exec_queue *q, u64 addr,
> +				       enum xe_cache_level cache_lvl)
> +{
> +	struct xe_vma_ops vops;
> +	struct drm_gpuva_ops *ops = NULL;
> +	struct dma_fence *fence;
> +	int err;
> +
> +	xe_bo_get(bo);
> +	xe_vm_get(vm);
> +	if (q)
> +		xe_exec_queue_get(q);
> +
> +	down_write(&vm->lock);
> +
> +	xe_vma_ops_init(&vops, vm, q, NULL, 0);
> +
> +	ops = vm_bind_ioctl_ops_create(vm, bo, 0, addr, bo->size,
> +				       DRM_XE_VM_BIND_OP_MAP, 0, 0,
> +				       vm->xe->pat.idx[cache_lvl]);
> +	if (IS_ERR(ops)) {
> +		err = PTR_ERR(ops);
> +		goto release_vm_lock;
> +	}
> +
> +	err = vm_bind_ioctl_ops_parse(vm, ops, &vops);
> +	if (err)
> +		goto release_vm_lock;
> +
> +	xe_assert(vm->xe, !list_empty(&vops.list));
> +
> +	err = xe_vma_ops_alloc(&vops, false);
> +	if (err)
> +		goto unwind_ops;
> +
> +	fence = vm_bind_ioctl_ops_execute(vm, &vops);
> +	if (IS_ERR(fence))
> +		err = PTR_ERR(fence);
> +
> +unwind_ops:
> +	if (err && err != -ENODATA)
> +		vm_bind_ioctl_ops_unwind(vm, &ops, 1);
> +
> +	xe_vma_ops_fini(&vops);
> +	drm_gpuva_ops_free(&vm->gpuvm, ops);
> +
> +release_vm_lock:
> +	up_write(&vm->lock);
> +
> +	if (q)
> +		xe_exec_queue_put(q);
> +	xe_vm_put(vm);
> +	xe_bo_put(bo);
> +
> +	if (err)
> +		fence = ERR_PTR(err);
> +
> +	return fence;
> +}
> +
>   /**
>    * xe_vm_lock() - Lock the vm's dma_resv object
>    * @vm: The struct xe_vm whose lock is to be locked
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 23adb7442881..0a2fa6c0815b 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -18,6 +18,8 @@ struct drm_file;
>   
>   struct ttm_buffer_object;
>   
> +struct dma_fence;
> +
>   struct xe_exec_queue;
>   struct xe_file;
>   struct xe_sync_entry;
> @@ -247,6 +249,10 @@ int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
>   int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,
>   			  unsigned int num_fences);
>   
> +struct dma_fence *xe_vm_bind_kernel_bo(struct xe_vm *vm, struct xe_bo *bo,
> +				       struct xe_exec_queue *q, u64 addr,
> +				       enum xe_cache_level cache_lvl);
> +
>   /**
>    * xe_vm_resv() - Return's the vm's reservation object
>    * @vm: The vm
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 7f9a303e51d8..52467b9b5348 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -164,6 +164,7 @@ struct xe_vm {
>   #define XE_VM_FLAG_BANNED		BIT(5)
>   #define XE_VM_FLAG_TILE_ID(flags)	FIELD_GET(GENMASK(7, 6), flags)
>   #define XE_VM_FLAG_SET_TILE_ID(tile)	FIELD_PREP(GENMASK(7, 6), (tile)->id)
> +#define XE_VM_FLAG_GSC			BIT(8)
>   	unsigned long flags;
>   
>   	/** @composite_fence_ctx: context composite fence */

