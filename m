Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C135D116F6
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 15:14:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F166D10E662;
	Tue,  2 Dec 2025 15:14:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bf309pIk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E4CE10E662
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 15:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764688446; x=1796224446;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=66D3Q2ScuYNZnCyjkw/rSZ5p/CzYVxr7qU7qeeovz9k=;
 b=bf309pIkgFn+oUj+0mhCyfKaHmjK4yamLqDonkMdd2Pzik7bMmz3vNWJ
 3UbLd7JwU/mkkeZ9EYRk2VOS6aOBTkhWDapzSVxqlRSkMo18OAeyBA6rQ
 aixRBfYLhSRFcI6mOcz09uHhmoynHD0gyejQ28X6K6AY3/E2rRIjjm9va
 qQpr7XEa91wqKK+bewsB5O4MhQF2/B4InmrORqq4RgBUEhbqXiiac9gtk
 P1PmlK6lrfdCV7CPj3MxI21y9xasu17/Jv+xbOeNHiwYs50j+1jL90srY
 LZaLsGxjdTbdPPrEGAmwnY+b87aZf7dlSwkPZ+mnRIWtT0pog274fG8BP Q==;
X-CSE-ConnectionGUID: KqxBQ0eiTvWgTgVqq3Cw7g==
X-CSE-MsgGUID: chZ5m9mQQi6VMvvgh33J1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="77762135"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="77762135"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 07:13:52 -0800
X-CSE-ConnectionGUID: 49xd4Om2RjGrQoasl+v19g==
X-CSE-MsgGUID: ZwDFqSfOTEifgde0bepk8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="194229189"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 07:13:53 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 07:13:51 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 07:13:51 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.19) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 07:13:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cOFpy4EMP/CxdNc035jvGExV0agjXl5BfuwI1hjczpGkRtHhHo4R1U8xlWTREDzHHYJcyRWoFLEMenBLqfFDUMLuyDTb9YAWiGdbDErYTEiBfbuon2vAUJ/P7LqGQj0vIZAnPV862cCLhXvikyYlQhcYBAls66W607S3VKsOBe7iD5mnOhS0Ofmk7NYl5EA1ALWYg88o1qIrE04WDZsErLY/MOf0Wdc5j/pgdgAyhbVcYYvg1M5F8/ZsUS7ukuuJtqbQsyRPCLk2n0wzZOTCqe946yofUQs9wofNiCgRMDmU4S1zHRTUeKTsiHHf9cr1jF8wNuciZo57CAdagLBG+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fw1CMdD5ovnocOrv73NBNOtHSZF13CNwSQvV8e7yoE4=;
 b=Oxt7h190j3f/1oZfmvTF/vScPkpy/X5kEgOJVGDEHlqWTHliVAKSwbV92tXVMqC+lK4HymxcKV44GhraISHddFEJ+CNw5LSy3cbAOJoi0ud4ogZFV8d6cVnOUV69V9dxEFq3MqPsT4QvVlM3a/g6/sPGYC3anL71QQDOGqDRGnpTF3Hfp/4pfstO0dra2OnyW9xkTHN0xHqR3AWRSJGYi/MxCV061hMMn2mGi1SGrCOr1Bli7hMwn/lHP/8iG+jH1sQzI67w5/Sq7/8WIfMqCzfef5qC/YiUggb9uBqPO/e+/yDPT16+QzlPL+y1OghGlYHA807hLXS/uDfdlxwZBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by IA1PR11MB8245.namprd11.prod.outlook.com (2603:10b6:208:448::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 15:13:47 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 15:13:47 +0000
Message-ID: <c57a918d-09be-4518-beb0-35d24b7e56b7@intel.com>
Date: Tue, 2 Dec 2025 10:13:44 -0500
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBkcm0veGUvdWM6?=
 =?UTF-8?Q?_Add_stop_on_hardware_initialization_error_=28rev9=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20251128213411.3184051-1-zhanjun.dong@intel.com>
 <176437361925.38795.13620442470215408665@a3b018990fe9>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <176437361925.38795.13620442470215408665@a3b018990fe9>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0349.namprd03.prod.outlook.com
 (2603:10b6:303:dc::24) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|IA1PR11MB8245:EE_
X-MS-Office365-Filtering-Correlation-Id: 69111494-c5db-4b8d-afd7-08de31b5641c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SVpxaEVSdWJMM2d4bVV1c2JxaXlTcldkclBaZldCY2E4dGVsc0Viak9yZGZJ?=
 =?utf-8?B?alJ0blA1dTQzbDFxaWtZYkVick5XMlduZTNFL29BSGg5ek42N21hMGZubFYy?=
 =?utf-8?B?bUxGS1R0SzV6RHllTk1leUk3Mmh4YWQ2cGs4K3FHRUVjUE9YVkRwd1hlM3NY?=
 =?utf-8?B?M0U4VzNiZml2bHpPdzd2TGkwbFZRYmlYU2dONEkvK3RiYVVqU0o5aHVrdUZE?=
 =?utf-8?B?Y0R5T3BJeVk2enFqSWVsMDJsbk11Z055ZDB4QzVCeEcxc0RoZnFEamdyWm5D?=
 =?utf-8?B?WXRHZ0VZeVlPSFVIVlRQdmd2T1NlSWg3bHdwbEZ0UzN5cFBGY0F5aWRmQjRN?=
 =?utf-8?B?RFVyd2pianROclVxdWJiRk1XU1BvZ2ZxK2g5OFhTMG9oMmcyTWV4YWI2c1k1?=
 =?utf-8?B?aXpmSlE1S1o5QjNuSlNtaFp5STNPSGpqbTlPcHdXa3FJZUlMZnI2OEkwenlW?=
 =?utf-8?B?N1FERlpiVjRPZTRRaGt1WERMOThCMnlpWkpsekVmMEpnMFJKZkFyVHI2Mmwx?=
 =?utf-8?B?elhTT01od25lZHN2bVhtSmh2VVNQWkNMNzVnTGlHemMxcm93MXo5RDZLS1Rj?=
 =?utf-8?B?Rmw2VkJ1MDg3ZFJNY2VEbnFTM1lqd2RrR09VdnpKTjZ3dVdic1JwVXUyVThm?=
 =?utf-8?B?bkJ4QmRXVG0xdkltRXBDSERRM3NsVlhpYXhBblJ3NmgxQXQ0TWd5QjZzVHgx?=
 =?utf-8?B?OWxxSzQ5TW5FNERDMWROOWlmbC9sbEZDaHFqTU5JdkVXbkM1cXZDY0ozclJu?=
 =?utf-8?B?RHRYMUt3eEF5VkE0b2tkdVluQ09USm85VC9iNE9laEhad3RvWTNNbXB6dU9F?=
 =?utf-8?B?b0ozY2NlNGxRa1NiOWtEZFlXUFdjRFZWQWJwMFFqcGJwQ2x3dXNuTkljUi9o?=
 =?utf-8?B?cTJBblBzMU9UYnBHMHlRaEpzbE5WUFpLa2duUzNQd3kvaEw0VlJDSS9QUG1x?=
 =?utf-8?B?d0ZkRFRnYW9mR3FBWjNFTFZySHlTMWFXaEJmT3Q3NDJ0cW9RcXROajB2TjM2?=
 =?utf-8?B?a2NYUnk5WmJhc240Q0JVWGlqMHpjblBXSG50OWxZcno0dTRsb3ptUVZ3NnBT?=
 =?utf-8?B?K09QbGxwZGt2aTlxRHNpQkx3ekN1ckJxVm5LVXdDbG9UeGx3UnpBYnRzUytN?=
 =?utf-8?B?SGtZTUU1MXdnWk1XRG5PbWI4NGVmYXVOWnJROXdmZUJYRjBsT1pNcEQ5WEZG?=
 =?utf-8?B?bG5OelA5K1owZTVBN0dRb05YQmwvY0dtY1REK1d6Yk9WWlljQjRReUptUGFF?=
 =?utf-8?B?UTdIaWNwZ01Bdkg5dkRRbExxOWtpQ3BobDRPZktlTTNEdE5vV2UyMEZ6WHhU?=
 =?utf-8?B?ZGdLS290RFAraWtHYzl0Qm5VYy92cGFzMHFLbEZ3Rks3ZzZwY1BJZldrMVBo?=
 =?utf-8?B?SEdNTUZrZVkvVkRqZld6KzhBY2lQdk90MS90alRQVUhpMkQxek9POFRQeDRO?=
 =?utf-8?B?Ym8yckNzSWc3Q3ZsbUF3Tm94Nk1xTWFBNXJIWkpCdGlGR29xcGlJakJod3lH?=
 =?utf-8?B?V3VSaHVjeFBrVjF1Y1U5ODczRzEweUFwZjFLR28vVmJvUWx5YXM5b1hWeCtQ?=
 =?utf-8?B?MTdnNGI1S3h3elZtUXphTm1ISU9UclYrNUpqcytzZGVrbUM3R0xlYitUcE5D?=
 =?utf-8?B?WFZEdDlyWmJaNUxRN0UyUGlxSFVOWmhmL1d0THhZT1VXa1dSTVRJWTBzbnp5?=
 =?utf-8?B?RUV6eVRKVW1PUFVrc1ZjS0I0bStibENqK25vNUYrZy81Sk5IcDZ5Z0xpcWJj?=
 =?utf-8?B?N0JFbnlqOUdzM1NVd3pWNHNTVVFaNlBreWZNd2tNRUY5ZFVFWDNYSk5FT3l6?=
 =?utf-8?B?Q2tEeUpVV1Z5Zy9Sdis4eG5RUVhJYkRCNkk1YVo3MUNzTUlOWWdDT3p1UVRW?=
 =?utf-8?B?RWxuLzlhUXVLZ3VPT2RTbk1zY3oxNEFVZ3ZHYUN6Q21ndmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEkzcCtjd3NZdTN3ZDl5YzlYWi9uNy9WSDI2UFZSS2F0U24zcEtLeExCSjhm?=
 =?utf-8?B?STNzUVNOOXJVVHJBdjY5RkgyNFZlUEJSMVBFY3BuSEJXK2ZCa2xVVEk2RGVa?=
 =?utf-8?B?eHBaTnVPVnFaUUZCdGdWbWdUaVdVcnQ1WGQ2MVBvL3U2c0tFT0VMQ0ZuTzR2?=
 =?utf-8?B?TC82NEdyRk4yeEdaNlZIbndiazRMQU15Y3lGQmw5MHNFZFFmVndyUmpLazl0?=
 =?utf-8?B?dWtzL3ZrWWlLQktUQVQvclpUYkNySUxvK2dnbXZTU3RhMmlLSlNuUEd5WXZO?=
 =?utf-8?B?RXd4c2IwcHN0RnBZdzcrRGdQcldZR01tejQxc0pqRTNkOWdtSWxRd0Y1d0RJ?=
 =?utf-8?B?ZWNsdlhYRlRZQzd1M2JZNFZSZVRITWc4SkEvT0RkeEdUZkJvT2hpeEt2cXRK?=
 =?utf-8?B?YTcrdHZnTjhmMXZ4RTJiUC9TWHJEZG9OelpNWHpyR1lYT3JmZTBoWS9JNzhO?=
 =?utf-8?B?U1h1V29OSmxoUlJpd2JPaHBXNFNHdm5jQ0Nsek1mc1VzUW1sdE5GMGI4Ky85?=
 =?utf-8?B?S3ZzUC9BNSt4UHN5SWxlU3FBRWo2dDN3bnp5TnZFOU5zWFhpb005eWpzVUpw?=
 =?utf-8?B?R296Vi96VG1uVDdocHJud0FJdHBtcEtYUktnRDVQRFdmeE5Ta3JyVno1NUVO?=
 =?utf-8?B?WlFkaE9yV2JOYXR1SW40YUtkaDhpOGFGam84R3l6dXVuZVZ4QWRLUUtrZkpL?=
 =?utf-8?B?VDV5b2lCa0pKY3pDR3Q4SW00ZEdSRzZ6REJNeFR2bDlzbnVQSUdoeHNnM0Zz?=
 =?utf-8?B?SDh1NEVGallwWDg2NzBvc1YrY3V6UCtzZElkbUk5UFZUWC9ubkJORHpZMXR3?=
 =?utf-8?B?dzhCYkt1eFBlS25kZTJXeW9wU0FETUcyVVdTa1dRTWJFNjV1ajZ2UW5KREkx?=
 =?utf-8?B?UUcwK3FvdUhrT0ZleVFzTWZVUk5PUGRqUlN1cU5zTW9OT1Jmd1ZXaHZWR0RJ?=
 =?utf-8?B?OFVJcTdMUk51d0hjMWN5WThGTERDNTIxOGhSV000QkhKYUZ2STdZV0tFb1Jm?=
 =?utf-8?B?N1NaZEVQWEI5aUtsR0lhbHppWG50RWlwSUJlMFFDRS85RmE1TGk4cnFrZ3FQ?=
 =?utf-8?B?V2Q4K0pWRTBaSTgxdzJFRFNtNHJrSEd3U1p1UkU2WTlwcjVDMnBZb2V5QW1W?=
 =?utf-8?B?OUVBZjRrdHhPVDJRYy9ZVk40TTNoNHRkcFlqSEMvUTJvcVBxM2ZjTnV4WHds?=
 =?utf-8?B?Q1NUZVo2WFd0dndjQnBQcjVrQWdSZkY3UWNhZnJyaHArS0Jxd3dROUVPWURu?=
 =?utf-8?B?NnJnZFVCaEJ5WUYrV2hPem5RUnUxQi85VVdFcGdrOFlnUWxHRE9XYUZCeVJU?=
 =?utf-8?B?MXhsb09Rcms3MVArcUVWSzJXN0R1QTZRWDdPMjVBR2c5cnZRQjhqN2VWdlFE?=
 =?utf-8?B?cHRlZUF1b2NZblV3Yi9nU0RGRnV6ejVrZmZBK2VKMnNoVy9VbXlyYWdYZUda?=
 =?utf-8?B?blJIZ2JUZW1KbGlFbDVHUm9CdGV1SGt5QTRJOSsvOW5ZUnVvTjcrOVFubTgx?=
 =?utf-8?B?UEFJNkNMdXY4NHF4TmRPYnN0akpRVEVrdlo1RlZ6bHFYOW1USjRwVmd3N2pV?=
 =?utf-8?B?QzI4TEUxcnJFLzQyWkg1SHVYQnEwK3NoZUNJZklHdUkxc3B5d283YjR5Ylc3?=
 =?utf-8?B?cHU0VWRSYktOTFRWQ3N5WUdVcXpEOVBoRXBsUGF1dHlETTN5VkRzdkRvd1FW?=
 =?utf-8?B?cVU1anFOUlgrd1RWQ3VmQ2VYb3BxaWJYejRHemNkeTc2UlNLcHhEaWhZdWdm?=
 =?utf-8?B?cnJnT1Z6NmVNeEZiT0I1S3E1TmZueVFJOUd0QW00UHNBaCtWQlNwNmxzMC8w?=
 =?utf-8?B?NUdBc1NLaU1BOG1aTWNEWUY2T09GRlJzNFZDSzkyZkZWK3B2WlV2WXdITjFU?=
 =?utf-8?B?Rkd2ZnFCcC9yWUNwNXZBM2piRllRbGZIVTc2eEtQWStLRGlKTktOYXE5SVRJ?=
 =?utf-8?B?RFBIYlpkRDNNSVdzVHdQSnVkMWkrQTR0R05JRUpSd1BIc0ZKMmd4ZnljYU9M?=
 =?utf-8?B?VkRMdnVaVDlEYXZtMmxCSUZOYldWS1VpaE1LL3BOWk9jNWVEVVhDdFlKNTZi?=
 =?utf-8?B?NG81WXRGOUhXT2xYcWlOQnptOHdVK3lMbStpVTF6dzRybnVrNG1qUmZVMXVo?=
 =?utf-8?B?UHlOQUwzVGQrSytjU0hXSW1XZ1lQb05xRTA1TkhVcS9ncEUyKysxN0EvTEdo?=
 =?utf-8?B?Q3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 69111494-c5db-4b8d-afd7-08de31b5641c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 15:13:47.5800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t2Fr4VR8qIMfWWNOP8kcB4FLFQ3jyBqBIcZWZxN4/qEIjz9oOHfQ45xZlsLsasq/iu4n4Y3rDUtpTkgzb2XCxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8245
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



On 2025-11-28 6:46 p.m., Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/uc: Add stop on hardware initialization error (rev9)
> *URL:*	https://patchwork.freedesktop.org/series/152100/ <https:// 
> patchwork.freedesktop.org/series/152100/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152100v9/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152100v9/ 
> index.html>
> 
> 
>   CI Bug Log - changes from
>   xe-4168-7fe1b006b65af67bc0ef5df53aedcd265be7fb19_FULL -> xe-
>   pw-152100v9_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-152100v9_FULL absolutely need 
> to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-152100v9_FULL, please notify your bug team (I915-ci- 
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe- 
> pw-152100v9_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_colorop@plane-xr24-xr24-3dlut_17_12_rgb:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-bmg-1/igt@kms_colorop@plane-xr24-
>         xr24-3dlut_17_12_rgb.html>
This skip is not related to this patch.
>   *
> 
>     igt@kms_colorop@plane-xr24-xr24-pq_125_eotf-pq_125_inv_eotf-pq_125_eotf:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-adlp-8/igt@kms_colorop@plane-xr24-
>         xr24-pq_125_eotf-pq_125_inv_eotf-pq_125_eotf.html> +1 other test
>         skip
This skip is not related to this patch.
> 
> 
>         Warnings
> 
>   * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
>       o shard-adlp: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4168-7fe1b006b65af67bc0ef5df53aedcd265be7fb19/shard-adlp-3/
>         igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html>
>         (Intel XE#5466 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/5466> / Intel XE#5530 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/5530>) -> ABORT <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-152100v9/shard-adlp-8/
>         igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html>
The abort is all about display part, not related to this patch.

Regards,
Zhanjun Dong

> 
> 
>     Known issues
> 
> Here are the changes found in xe-pw-152100v9_FULL that come from known 
> issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-adlp-2/igt@kms_big_fb@4-tiled-max-
>         hw-stride-32bpp-rotate-0-hflip.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +4 other
>         tests skip
>   *
> 
>     igt@kms_big_fb@linear-8bpp-rotate-90:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152100v9/shard-dg2-436/
>         igt@kms_big_fb@linear-8bpp-rotate-90.html> (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>   *
> 
>     igt@kms_big_fb@y-tiled-64bpp-rotate-0:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152100v9/shard-dg2-436/igt@kms_big_fb@y-
>         tiled-64bpp-rotate-0.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +1 other test
>         skip
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4168-7fe1b006b65af67bc0ef5df53aedcd265be7fb19/shard-adlp-8/
>         igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-
>         flip.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-152100v9/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-
>         stride-64bpp-rotate-0-hflip-async-flip.html> (Intel XE#1231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-addfb-size-overflow:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-adlp-2/igt@kms_big_fb@yf-tiled-
>         addfb-size-overflow.html> (Intel XE#610 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/610>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-
>         hw-stride-64bpp-rotate-0-hflip.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
>   *
> 
>     igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4168-7fe1b006b65af67bc0ef5df53aedcd265be7fb19/shard-bmg-3/
>         igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html> -
>          > SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-152100v9/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-
>         displays-1920x1080p.html> (Intel XE#2314 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2314> / Intel
>         XE#2894 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>)
>   *
> 
>     igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-adlp-3/igt@kms_bw@connected-
>         linear-tiling-3-displays-3840x2160p.html> (Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>) +1
>         other test skip
>   *
> 
>     igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152100v9/shard-dg2-436/igt@kms_ccs@bad-
>         pixel-format-y-tiled-gen12-mc-ccs.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +3
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-lnl-4/igt@kms_ccs@bad-pixel-
>         format-y-tiled-gen12-mc-ccs.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +1 other test
>         skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152100v9/shard-dg2-436/igt@kms_ccs@bad-
>         rotation-90-yf-tiled-ccs@pipe-c-hdmi-a-6.html> (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +13
>         other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-bmg-5/igt@kms_ccs@crc-primary-
>         rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html> (Intel XE#2652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652> /
>         Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) +3 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-adlp-3/igt@kms_ccs@crc-primary-
>         suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html> (Intel
>         XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) +20 other tests skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-adlp-3/igt@kms_ccs@crc-sprite-
>         planes-basic-4-tiled-bmg-ccs.html> (Intel XE#2907 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2907>)
>   *
> 
>     igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-bmg-1/igt@kms_ccs@missing-ccs-
>         buffer-4-tiled-mtl-rc-ccs.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +1 other test
>         skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4168-7fe1b006b65af67bc0ef5df53aedcd265be7fb19/shard-dg2-464/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html> ->
>         INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-152100v9/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-
>         dg2-rc-ccs.html> (Intel XE#1727 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1727> / Intel XE#3113 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3113> / Intel
>         XE#4345 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4345> / Intel XE#6168 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/6168>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4168-7fe1b006b65af67bc0ef5df53aedcd265be7fb19/shard-dg2-464/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html>
>         -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-152100v9/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-
>         dg2-rc-ccs@pipe-a-dp-4.html> (Intel XE#6168 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6168> / i915#14968
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14968>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4168-7fe1b006b65af67bc0ef5df53aedcd265be7fb19/shard-dg2-464/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-
>         a-6.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-152100v9/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-
>         tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html> (Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
>         XE#3113 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-y-tiled-ccs:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-adlp-2/igt@kms_ccs@random-ccs-
>         data-y-tiled-ccs.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +13
>         other tests skip
>   *
> 
>     igt@kms_cdclk@mode-transition-all-outputs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152100v9/shard-dg2-436/igt@kms_cdclk@mode-
>         transition-all-outputs.html> (Intel XE#4418 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4418>)
>   *
> 
>     igt@kms_chamelium_color@ctm-0-50:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-lnl-8/
>         igt@kms_chamelium_color@ctm-0-50.html> (Intel XE#306 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>   *
> 
>     igt@kms_chamelium_frames@hdmi-crc-single:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-bmg-1/
>         igt@kms_chamelium_frames@hdmi-crc-single.html> (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>)
>   *
> 
>     igt@kms_chamelium_frames@hdmi-frame-dump:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152100v9/shard-dg2-436/
>         igt@kms_chamelium_frames@hdmi-frame-dump.html> (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-lnl-4/
>         igt@kms_chamelium_frames@hdmi-frame-dump.html> (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>)
>   *
> 
>     igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-adlp-2/igt@kms_chamelium_hpd@dp-
>         hpd-for-each-pipe.html> (Intel XE#373 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/373>)
>   *
> 
>     igt@kms_colorop@plane-xr30-xr30-bt2020_oetf:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-bmg-1/igt@kms_colorop@plane-xr30-
>         xr30-bt2020_oetf.html> (Intel XE#6704 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6704>)
>   *
> 
>     igt@kms_colorop@plane-xr30-xr30-bypass:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-adlp-2/igt@kms_colorop@plane-xr30-
>         xr30-bypass.html> (Intel XE#6704 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6704>) +1 other test
>         skip
>   *
> 
>     igt@kms_colorop@plane-xr30-xr30-ctm_3x4_overdrive:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152100v9/shard-dg2-436/
>         igt@kms_colorop@plane-xr30-xr30-ctm_3x4_overdrive.html> (Intel
>         XE#6704 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6704>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-lnl-4/igt@kms_colorop@plane-xr30-
>         xr30-ctm_3x4_overdrive.html> (Intel XE#6704 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6704>)
>   *
> 
>     igt@kms_content_protection@atomic:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-bmg-1/
>         igt@kms_content_protection@atomic.html> (Intel XE#1178 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) +1 other test
>         fail
>   *
> 
>     igt@kms_content_protection@dp-mst-lic-type-1:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-adlp-2/
>         igt@kms_content_protection@dp-mst-lic-type-1.html> (Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>)
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-128x42:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-bmg-1/igt@kms_cursor_crc@cursor-
>         offscreen-128x42.html> (Intel XE#2320 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) +1 other test
>         skip
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-256x85:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-lnl-4/igt@kms_cursor_crc@cursor-
>         onscreen-256x85.html> (Intel XE#1424 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1424>)
>   *
> 
>     igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4168-7fe1b006b65af67bc0ef5df53aedcd265be7fb19/shard-bmg-3/
>         igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html> ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152100v9/
>         shard-bmg-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-
>         atomic.html> (Intel XE#2291 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2291>) +1 other test skip
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-adlp-2/
>         igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-
>         varying-size.html> (Intel XE#309 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +4 other tests
>         skip
>   *
> 
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-
>     transitions-varying-size:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152100v9/shard-dg2-436/
>         igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-
>         transitions-varying-size.html> (Intel XE#323 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-lnl-4/igt@kms_cursor_legacy@short-
>         busy-flip-before-cursor-atomic-transitions-varying-size.html>
>         (Intel XE#323 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/323>)
>   *
> 
>     igt@kms_dsc@dsc-with-bpc-formats:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152100v9/shard-dg2-436/igt@kms_dsc@dsc-with-
>         bpc-formats.html> (Intel XE#455 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/455>) +5 other tests skip
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-lnl-4/igt@kms_dsc@dsc-with-bpc-
>         formats.html> (Intel XE#2244 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2244>)
>   *
> 
>     igt@kms_fbcon_fbt@fbc-suspend:
> 
>       o shard-adlp: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-adlp-3/igt@kms_fbcon_fbt@fbc-
>         suspend.html> (Intel XE#6675 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/6675>) +2 other tests abort
>   *
> 
>     igt@kms_feature_discovery@display-3x:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-adlp-2/
>         igt@kms_feature_discovery@display-3x.html> (Intel XE#703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/703>)
>   *
> 
>     igt@kms_feature_discovery@display-4x:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152100v9/shard-dg2-436/
>         igt@kms_feature_discovery@display-4x.html> (Intel XE#1138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138>)
>   *
> 
>     igt@kms_feature_discovery@psr2:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-bmg-1/
>         igt@kms_feature_discovery@psr2.html> (Intel XE#2374 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2374>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-lnl-4/igt@kms_flip@2x-flip-vs-
>         dpms-off-vs-modeset.html> (Intel XE#1421 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1421>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-panning-vs-hang:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-adlp-8/igt@kms_flip@2x-flip-vs-
>         panning-vs-hang.html> (Intel XE#310 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/310>) +6 other tests
>         skip
>   *
> 
>     igt@kms_flip@2x-plain-flip-ts-check-interruptible:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4168-7fe1b006b65af67bc0ef5df53aedcd265be7fb19/shard-bmg-3/
>         igt@kms_flip@2x-plain-flip-ts-check-interruptible.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152100v9/shard-
>         bmg-2/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html>
>         (Intel XE#2316 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2316>) +3 other tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-lnl-4/
>         igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-
>         downscaling.html> (Intel XE#1401 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1401> / Intel
>         XE#1745 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1745>) +1 other test skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-
>     upscaling@pipe-a-default-mode:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-lnl-4/
>         igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-
>         upscaling@pipe-a-default-mode.html> (Intel XE#1401 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1401>) +1 other test
>         skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-
>     upscaling@pipe-a-valid-mode:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-adlp-2/
>         igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-
>         ytilegen12rcccs-upscaling@pipe-a-valid-mode.html> (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +10
>         other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-blt:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-lnl-8/
>         igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-
>         blt.html> (Intel XE#6312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/6312>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-adlp-2/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-
>         blt.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/656>) +9 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
> 
>       o shard-adlp: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-adlp-2/
>         igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-
>         blt.html> (Intel XE#5671 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/5671>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-lnl-4/
>         igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-
>         multidraw.html> (Intel XE#651 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/651>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-bmg-1/
>         igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-
>         mmap-wc.html> (Intel XE#2311 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2311>) +5 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152100v9/shard-dg2-436/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-
>         move.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/651>) +3 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-adlp-2/
>         igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html> (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +4
>         other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-adlp-3/
>         igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-
>         blt.html> (Intel XE#6312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/6312>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-adlp-2/
>         igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html>
>         (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/653>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@plane-fbc-rte:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152100v9/shard-dg2-436/
>         igt@kms_frontbuffer_tracking@plane-fbc-rte.html> (Intel XE#1158
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158>)
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152100v9/shard-dg2-436/
>         igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-
>         blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/653>) +2 other tests skip
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-lnl-4/
>         igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-
>         blt.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/656>) +4 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-bmg-1/
>         igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-
>         fullscreen.html> (Intel XE#2313 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2313>) +6 other tests skip
>   *
> 
>     igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3:
> 
>       o shard-bmg: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-bmg-2/igt@kms_hdr@bpc-switch-
>         suspend@pipe-a-hdmi-a-3.html> (Intel XE#6675 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6675>)
>   *
> 
>     igt@kms_pipe_stress@stress-xrgb8888-4tiled:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-adlp-2/igt@kms_pipe_stress@stress-
>         xrgb8888-4tiled.html> (Intel XE#5624 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5624>)
>   *
> 
>     igt@kms_pipe_stress@stress-xrgb8888-ytiled:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-bmg-1/igt@kms_pipe_stress@stress-
>         xrgb8888-ytiled.html> (Intel XE#4329 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4329>)
>   *
> 
>     igt@kms_plane_multiple@2x-tiling-yf:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-adlp-2/igt@kms_plane_multiple@2x-
>         tiling-yf.html> (Intel XE#4596 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4596>)
>   *
> 
>     igt@kms_plane_scaling@2x-scaler-multi-pipe:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-lnl-4/igt@kms_plane_scaling@2x-
>         scaler-multi-pipe.html> (Intel XE#309 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +1 other test skip
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-lnl-4/
>         igt@kms_plane_scaling@planes-upscale-20x20-downscale-
>         factor-0-5@pipe-a.html> (Intel XE#6691 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6691>) +3 other
>         tests skip
>   *
> 
>     igt@kms_pm_backlight@bad-brightness:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-adlp-2/igt@kms_pm_backlight@bad-
>         brightness.html> (Intel XE#870 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/870>)
>   *
> 
>     igt@kms_pm_dc@dc6-psr:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-adlp-2/igt@kms_pm_dc@dc6-psr.html>
>         (Intel XE#1129 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1129>)
>   *
> 
>     igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-
>         overlay-plane-update-continuous-sf.html> (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1489>) +1 other test skip
>   *
> 
>     igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-adlp-2/igt@kms_psr2_sf@psr2-
>         cursor-plane-move-continuous-sf.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel
>         XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1489>) +3 other tests skip
>   *
> 
>     igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152100v9/shard-dg2-436/igt@kms_psr2_sf@psr2-
>         overlay-plane-update-sf-dmg-area.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel
>         XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>   *
> 
>     igt@kms_psr@fbc-psr-sprite-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-bmg-1/igt@kms_psr@fbc-psr-sprite-
>         blt.html> (Intel XE#1406 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1406> / Intel XE#2234 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2234> / Intel
>         XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2850>) +2 other tests skip
>   *
> 
>     igt@kms_psr@fbc-psr2-sprite-render:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152100v9/shard-dg2-436/igt@kms_psr@fbc-psr2-
>         sprite-render.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel
>         XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/929>) +3 other tests skip
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-lnl-4/igt@kms_psr@fbc-psr2-sprite-
>         render.html> (Intel XE#1406 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1406>) +1 other test skip
>   *
> 
>     igt@kms_psr@fbc-psr2-sprite-render@edp-1:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-lnl-4/igt@kms_psr@fbc-psr2-sprite-
>         render@edp-1.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel
>         XE#4609 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609>)
>   *
> 
>     igt@kms_psr@psr-cursor-plane-onoff:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-adlp-2/igt@kms_psr@psr-cursor-
>         plane-onoff.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel
>         XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/929>) +3 other tests skip
>   *
> 
>     igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-bmg-1/igt@kms_rotation_crc@sprite-
>         rotation-90-pos-100-0.html> (Intel XE#3414 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3414> / Intel
>         XE#3904 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904>)
>   *
> 
>     igt@kms_setmode@basic@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4168-7fe1b006b65af67bc0ef5df53aedcd265be7fb19/shard-dg2-435/
>         igt@kms_setmode@basic@pipe-a-hdmi-a-6.html> -> FAIL <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152100v9/shard-dg2-466/
>         igt@kms_setmode@basic@pipe-a-hdmi-a-6.html> (Intel XE#6361
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361>) +1
>         other test fail
>   *
> 
>     igt@kms_setmode@basic@pipe-b-edp-1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4168-7fe1b006b65af67bc0ef5df53aedcd265be7fb19/shard-lnl-8/
>         igt@kms_setmode@basic@pipe-b-edp-1.html> -> FAIL <https://intel-
>         gfx-ci.01.org/tree/intel-xe/xe-pw-152100v9/shard-lnl-8/
>         igt@kms_setmode@basic@pipe-b-edp-1.html> (Intel XE#6361
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361>) +2
>         other tests fail
>   *
> 
>     igt@kms_setmode@invalid-clone-exclusive-crtc:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-lnl-8/igt@kms_setmode@invalid-
>         clone-exclusive-crtc.html> (Intel XE#1435 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1435>)
>   *
> 
>     igt@kms_vrr@negative-basic:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4168-7fe1b006b65af67bc0ef5df53aedcd265be7fb19/shard-bmg-3/
>         igt@kms_vrr@negative-basic.html> -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-152100v9/shard-bmg-2/
>         igt@kms_vrr@negative-basic.html> (Intel XE#1499 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1499>)
>   *
> 
>     igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4168-7fe1b006b65af67bc0ef5df53aedcd265be7fb19/shard-lnl-2/
>         igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html> ->
>         FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152100v9/
>         shard-lnl-3/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-
>         edp-1.html> (Intel XE#2142 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2142>) +1 other test fail
>   *
> 
>     igt@xe_compute_preempt@compute-preempt-many:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152100v9/shard-dg2-436/
>         igt@xe_compute_preempt@compute-preempt-many.html> (Intel XE#6360
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6360>)
>   *
> 
>     igt@xe_copy_basic@mem-copy-linear-0x8fffe:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-adlp-2/igt@xe_copy_basic@mem-copy-
>         linear-0x8fffe.html> (Intel XE#5300 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5300>)
>   *
> 
>     igt@xe_create@create-big-vram:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-lnl-8/igt@xe_create@create-big-
>         vram.html> (Intel XE#1062 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1062>)
>   *
> 
>     igt@xe_create@multigpu-create-massive-size:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-adlp-2/igt@xe_create@multigpu-
>         create-massive-size.html> (Intel XE#944 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +2 other tests
>         skip
>   *
> 
>     igt@xe_eudebug@basic-vm-access:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-bmg-1/igt@xe_eudebug@basic-vm-
>         access.html> (Intel XE#4837 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4837>) +2 other tests skip
>   *
> 
>     igt@xe_eudebug@basic-vm-access-parameters-userptr-faultable:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-adlp-3/igt@xe_eudebug@basic-vm-
>         access-parameters-userptr-faultable.html> (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837> /
>         Intel XE#5565 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/5565>) +4 other tests skip
>   *
> 
>     igt@xe_eudebug@basic-vm-bind-ufence:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152100v9/shard-dg2-436/igt@xe_eudebug@basic-
>         vm-bind-ufence.html> (Intel XE#4837 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +1 other test
>         skip
>   *
> 
>     igt@xe_eudebug@discovery-empty-clients:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-lnl-4/igt@xe_eudebug@discovery-
>         empty-clients.html> (Intel XE#4837 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +1 other test
>         skip
>   *
> 
>     igt@xe_eudebug_online@pagefault-write-stress:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-bmg-1/
>         igt@xe_eudebug_online@pagefault-write-stress.html> (Intel
>         XE#6681 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6681>)
>   *
> 
>     igt@xe_evict@evict-beng-large-cm:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-adlp-2/igt@xe_evict@evict-beng-
>         large-cm.html> (Intel XE#261 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/261> / Intel XE#5564 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5564>)
>   *
> 
>     igt@xe_evict@evict-beng-small:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-adlp-2/igt@xe_evict@evict-beng-
>         small.html> (Intel XE#261 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/261> / Intel XE#5564 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5564> / Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +1
>         other test skip
>   *
> 
>     igt@xe_evict@evict-mixed-threads-large:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-adlp-3/igt@xe_evict@evict-mixed-
>         threads-large.html> (Intel XE#261 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/261>)
>   *
> 
>     igt@xe_evict@evict-threads-large:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-lnl-4/igt@xe_evict@evict-threads-
>         large.html> (Intel XE#688 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/688>)
>   *
> 
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-adlp-8/igt@xe_exec_basic@multigpu-
>         many-execqueues-many-vm-userptr.html> (Intel XE#1392 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1392> / Intel
>         XE#5575 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/5575>) +3 other tests skip
>   *
> 
>     igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-bmg-1/igt@xe_exec_basic@multigpu-
>         no-exec-bindexecqueue-userptr.html> (Intel XE#2322 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2322>) +1 other test
>         skip
>   *
> 
>     igt@xe_exec_fault_mode@many-userptr-invalidate-race:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-adlp-2/
>         igt@xe_exec_fault_mode@many-userptr-invalidate-race.html> (Intel
>         XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/288> / Intel XE#5561 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/5561>) +7 other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@once-rebind-imm:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152100v9/shard-dg2-436/
>         igt@xe_exec_fault_mode@once-rebind-imm.html> (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +3
>         other tests skip
>   *
> 
>     igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-adlp-3/igt@xe_exec_mix_modes@exec-
>         spinner-interrupted-lr.html> (Intel XE#2360 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2360>)
>   *
> 
>     igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-bmg-1/
>         igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset.html>
>         (Intel XE#5007 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/5007>)
>   *
> 
>     igt@xe_exec_system_allocator@many-large-execqueues-malloc-prefetch-
>     madvise:
> 
>       o shard-lnl: NOTRUN -> WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-lnl-4/
>         igt@xe_exec_system_allocator@many-large-execqueues-malloc-
>         prefetch-madvise.html> (Intel XE#5786 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5786>)
>   *
> 
>     igt@xe_exec_system_allocator@once-mmap-new-race:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-adlp-2/
>         igt@xe_exec_system_allocator@once-mmap-new-race.html> (Intel
>         XE#4915 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4915>) +107 other tests skip
>   *
> 
>     igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4168-7fe1b006b65af67bc0ef5df53aedcd265be7fb19/shard-lnl-3/
>         igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-
>         vma.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-152100v9/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-
>         madvise-pat-idx-uc-multi-vma.html> (Intel XE#5625 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5625>)
>   *
> 
>     igt@xe_exec_system_allocator@threads-many-mmap-new-huge:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-bmg-1/
>         igt@xe_exec_system_allocator@threads-many-mmap-new-huge.html>
>         (Intel XE#4943 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4943>)
>   *
> 
>     igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-
>     huge-nomemset:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-lnl-8/
>         igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-
>         free-huge-nomemset.html> (Intel XE#4943 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4943>) +3 other
>         tests skip
>   *
> 
>     igt@xe_exec_system_allocator@twice-large-mmap-file-nomemset:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152100v9/shard-dg2-436/
>         igt@xe_exec_system_allocator@twice-large-mmap-file-
>         nomemset.html> (Intel XE#4915 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4915>) +55 other tests skip
>   *
> 
>     igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-adlp-2/
>         igt@xe_fault_injection@exec-queue-create-fail-
>         xe_pxp_exec_queue_add.html> (Intel XE#6281 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6281>)
>   *
> 
>     igt@xe_mmap@pci-membarrier-parallel:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-adlp-2/igt@xe_mmap@pci-membarrier-
>         parallel.html> (Intel XE#5100 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/5100>)
>   *
> 
>     igt@xe_mmap@vram:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-adlp-3/igt@xe_mmap@vram.html>
>         (Intel XE#1008 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1008> / Intel XE#5591 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/5591>)
>   *
> 
>     igt@xe_oa@privileged-forked-access-vaddr:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-adlp-2/igt@xe_oa@privileged-
>         forked-access-vaddr.html> (Intel XE#3573 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3573>) +3 other
>         tests skip
>   *
> 
>     igt@xe_oa@tail-address-wrap:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-adlp-3/igt@xe_oa@tail-address-
>         wrap.html> (Intel XE#6032 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/6032>)
>   *
> 
>     igt@xe_pm@s2idle-d3hot-basic-exec:
> 
>       o shard-lnl: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-lnl-4/igt@xe_pm@s2idle-d3hot-
>         basic-exec.html> (Intel XE#6675 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/6675>)
>   *
> 
>     igt@xe_pm@s3-basic-exec:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4168-7fe1b006b65af67bc0ef5df53aedcd265be7fb19/shard-bmg-1/
>         igt@xe_pm@s3-basic-exec.html> -> ABORT <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-152100v9/shard-bmg-8/igt@xe_pm@s3-
>         basic-exec.html> (Intel XE#6675 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/6675>)
>   *
> 
>     igt@xe_pm@s3-multiple-execs:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4168-7fe1b006b65af67bc0ef5df53aedcd265be7fb19/shard-adlp-1/
>         igt@xe_pm@s3-multiple-execs.html> -> ABORT <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-152100v9/shard-adlp-3/
>         igt@xe_pm@s3-multiple-execs.html> (Intel XE#6675 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6675>) +1 other test
>         abort
>   *
> 
>     igt@xe_pm@s3-vm-bind-unbind-all:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4168-7fe1b006b65af67bc0ef5df53aedcd265be7fb19/shard-dg2-435/
>         igt@xe_pm@s3-vm-bind-unbind-all.html> -> ABORT <https://intel-
>         gfx-ci.01.org/tree/intel-xe/xe-pw-152100v9/shard-dg2-464/
>         igt@xe_pm@s3-vm-bind-unbind-all.html> (Intel XE#6675 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6675>)
>   *
> 
>     igt@xe_pmu@engine-activity-accuracy-90@engine-
>     drm_xe_engine_class_compute0:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4168-7fe1b006b65af67bc0ef5df53aedcd265be7fb19/shard-lnl-5/
>         igt@xe_pmu@engine-activity-accuracy-90@engine-
>         drm_xe_engine_class_compute0.html> -> FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-152100v9/shard-lnl-5/
>         igt@xe_pmu@engine-activity-accuracy-90@engine-
>         drm_xe_engine_class_compute0.html> (Intel XE#6251 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6251>) +4 other
>         tests fail
>   *
> 
>     igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-adlp-2/igt@xe_pxp@pxp-stale-bo-
>         exec-post-suspend.html> (Intel XE#4733 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4733> / Intel
>         XE#5594 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5594>)
>   *
> 
>     igt@xe_render_copy@render-stress-0-copies:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152100v9/shard-dg2-436/
>         igt@xe_render_copy@render-stress-0-copies.html> (Intel XE#4814
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814>)
>   *
> 
>     igt@xe_survivability@i2c-functionality:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152100v9/shard-dg2-436/
>         igt@xe_survivability@i2c-functionality.html> (Intel XE#6529
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6529>)
>   *
> 
>     igt@xe_survivability@runtime-survivability:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-adlp-2/
>         igt@xe_survivability@runtime-survivability.html> (Intel XE#6529
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6529>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4168-7fe1b006b65af67bc0ef5df53aedcd265be7fb19/shard-adlp-2/
>         igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-
>         async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1231>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-152100v9/shard-adlp-1/
>         igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-
>         async-flip.html> +1 other test pass
>   *
> 
>     igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4168-7fe1b006b65af67bc0ef5df53aedcd265be7fb19/shard-bmg-6/
>         igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html>
>         (Intel XE#2314 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2314> / Intel XE#2894 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2894>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-152100v9/shard-bmg-5/
>         igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html>
>   *
> 
>     igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4168-7fe1b006b65af67bc0ef5df53aedcd265be7fb19/shard-bmg-6/
>         igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html> (Intel
>         XE#2291 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2291>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-152100v9/shard-bmg-5/igt@kms_cursor_legacy@2x-long-
>         flip-vs-cursor-legacy.html> +2 other tests pass
>   *
> 
>     igt@kms_display_modes@extended-mode-basic:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4168-7fe1b006b65af67bc0ef5df53aedcd265be7fb19/shard-bmg-6/
>         igt@kms_display_modes@extended-mode-basic.html> (Intel XE#4302
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152100v9/
>         shard-bmg-5/igt@kms_display_modes@extended-mode-basic.html>
>   *
> 
>     igt@kms_flip@2x-wf_vblank-ts-check:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4168-7fe1b006b65af67bc0ef5df53aedcd265be7fb19/shard-bmg-2/
>         igt@kms_flip@2x-wf_vblank-ts-check.html> (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152100v9/
>         shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check.html> +3 other
>         tests pass
>   *
> 
>     igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-4168-7fe1b006b65af67bc0ef5df53aedcd265be7fb19/shard-
>         adlp-4/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html>
>         (Intel XE#2953 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2953> / Intel XE#4173 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4173>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-152100v9/shard-adlp-1/
>         igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html>
>   *
> 
>     igt@kms_setmode@invalid-clone-single-crtc-stealing:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4168-7fe1b006b65af67bc0ef5df53aedcd265be7fb19/shard-bmg-6/
>         igt@kms_setmode@invalid-clone-single-crtc-stealing.html> (Intel
>         XE#1435 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1435>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-152100v9/shard-bmg-5/igt@kms_setmode@invalid-clone-
>         single-crtc-stealing.html>
>   *
> 
>     igt@xe_evict@evict-mixed-many-threads-small:
> 
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-4168-7fe1b006b65af67bc0ef5df53aedcd265be7fb19/shard-bmg-5/
>         igt@xe_evict@evict-mixed-many-threads-small.html> (Intel XE#6321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321> /
>         Intel XE#6606 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/6606>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-152100v9/shard-bmg-4/igt@xe_evict@evict-mixed-many-
>         threads-small.html>
>   *
> 
>     igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
> 
>       o shard-dg2-set2: ABORT <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-4168-7fe1b006b65af67bc0ef5df53aedcd265be7fb19/shard-
>         dg2-434/igt@xe_fault_injection@probe-fail-guc-
>         xe_guc_ct_send_recv.html> (Intel XE#5466 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5466>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152100v9/shard-
>         dg2-436/igt@xe_fault_injection@probe-fail-guc-
>         xe_guc_ct_send_recv.html>
>       o shard-lnl: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4168-7fe1b006b65af67bc0ef5df53aedcd265be7fb19/shard-lnl-7/
>         igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html>
>         (Intel XE#5466 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/5466>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-152100v9/shard-lnl-4/igt@xe_fault_injection@probe-fail-
>         guc-xe_guc_ct_send_recv.html>
>   *
> 
>     igt@xe_pm@s2idle-basic:
> 
>       o shard-bmg: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4168-7fe1b006b65af67bc0ef5df53aedcd265be7fb19/shard-bmg-4/
>         igt@xe_pm@s2idle-basic.html> (Intel XE#6675 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6675>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152100v9/shard-
>         bmg-1/igt@xe_pm@s2idle-basic.html>
>   *
> 
>     igt@xe_pm@s2idle-multiple-execs:
> 
>       o shard-lnl: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4168-7fe1b006b65af67bc0ef5df53aedcd265be7fb19/shard-lnl-5/
>         igt@xe_pm@s2idle-multiple-execs.html> (Intel XE#6675 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6675>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152100v9/shard-
>         lnl-8/igt@xe_pm@s2idle-multiple-execs.html>
>   *
> 
>     igt@xe_pm@s3-exec-after:
> 
>       o shard-adlp: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4168-7fe1b006b65af67bc0ef5df53aedcd265be7fb19/shard-adlp-6/
>         igt@xe_pm@s3-exec-after.html> (Intel XE#6675 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6675>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152100v9/shard-
>         adlp-8/igt@xe_pm@s3-exec-after.html> +2 other tests pass
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1:
> 
>       o shard-adlp: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4168-7fe1b006b65af67bc0ef5df53aedcd265be7fb19/shard-adlp-1/
>         igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-
>         a-1.html> (Intel XE#6675 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/6675>) -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-152100v9/shard-adlp-3/
>         igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-
>         a-1.html> (Intel XE#4543 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/4543>)
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4168-7fe1b006b65af67bc0ef5df53aedcd265be7fb19/shard-bmg-8/
>         igt@kms_cursor_legacy@flip-vs-cursor-atomic.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152100v9/shard-
>         bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html> (Intel
>         XE#4633 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4168-7fe1b006b65af67bc0ef5df53aedcd265be7fb19/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-
>         mmap-wc.html> (Intel XE#2312 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2312>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-152100v9/shard-bmg-5/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-
>         mmap-wc.html> (Intel XE#4141 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4141>) +3 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4168-7fe1b006b65af67bc0ef5df53aedcd265be7fb19/shard-bmg-3/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-
>         blt.html> (Intel XE#4141 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/4141>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) +3 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4168-7fe1b006b65af67bc0ef5df53aedcd265be7fb19/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-
>         mmap-wc.html> (Intel XE#2312 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2312>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-152100v9/shard-bmg-1/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-
>         mmap-wc.html> (Intel XE#2311 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2311>) +7 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4168-7fe1b006b65af67bc0ef5df53aedcd265be7fb19/shard-bmg-3/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-
>         blt.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2311>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) +5 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4168-7fe1b006b65af67bc0ef5df53aedcd265be7fb19/shard-bmg-3/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-
>         mmap-wc.html> (Intel XE#2313 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2313>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-152100v9/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-
>         mmap-wc.html> (Intel XE#2312 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2312>) +5 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4168-7fe1b006b65af67bc0ef5df53aedcd265be7fb19/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-152100v9/shard-bmg-1/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-
>         blt.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2313>) +11 other tests skip
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4168-7fe1b006b65af67bc0ef5df53aedcd265be7fb19/shard-dg2-463/
>         igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#362 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/362>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-152100v9/shard-dg2-432/igt@kms_tiled_display@basic-test-
>         pattern-with-chamelium.html> (Intel XE#1500 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1500>)
>   *
> 
>     igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
> 
>       o shard-bmg: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4168-7fe1b006b65af67bc0ef5df53aedcd265be7fb19/shard-bmg-3/
>         igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html>
>         (Intel XE#5466 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/5466> / Intel XE#5530 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/5530>) -> ABORT <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-152100v9/shard-bmg-7/
>         igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html>
>         (Intel XE#5466 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/5466>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * Linux: xe-4168-7fe1b006b65af67bc0ef5df53aedcd265be7fb19 -> xe-
>     pw-152100v9
> 
> IGT_8645: 8645
> xe-4168-7fe1b006b65af67bc0ef5df53aedcd265be7fb19: 
> 7fe1b006b65af67bc0ef5df53aedcd265be7fb19
> xe-pw-152100v9: 152100v9
> 

