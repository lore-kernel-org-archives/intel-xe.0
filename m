Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13529D43357
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 21:07:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F0A710E2F6;
	Thu, 11 Dec 2025 21:07:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mnSbcXbK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C74B10E2F6
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 21:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765487268; x=1797023268;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=cuwNWJhap78BUSo6VpyE08jtCTz3hfJTYQvnAM66Olo=;
 b=mnSbcXbKcK76RUgpcDIg+6nHh2m9We9w4PWsGqKm4lMC+KEwlvHAvk9Z
 cZ8XulG7XnLbkheW80MWFfqNLDSFd705Ue0GfnnGEBrTqFapjCzHBRqZT
 o3dNcEQFJAzcwa2z7LU3PqHowlaLSVftycyYH78LoP9Zx+CFeLsR9LoOX
 rpk6cDLJpphYDwKYBVrvSkk+velDK782foaKS4DHJPpmE5J1udclsTWkg
 qzFCQkOPwaH9gfoUwAocuRyGdSlbY8n8mPdMHmlH2Wa9QIGIg0JV19cFf
 yiMQf5vC0kBoP7NL/NmxRfMUbawj60dEaEk0KGNPMcBO5GTQNM0rIgk6i Q==;
X-CSE-ConnectionGUID: fTEUj07uSYqbYBx0LCGEzg==
X-CSE-MsgGUID: HwKQmon0RtmZcLfFyy6hdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="71103547"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="71103547"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 13:07:48 -0800
X-CSE-ConnectionGUID: ouqrWEmtQ/+1SieWPYDAjA==
X-CSE-MsgGUID: zaejVfnrSzWgqd8N/tNvQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="234299178"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 13:07:48 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 13:07:47 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 11 Dec 2025 13:07:47 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.53)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 13:07:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zBOAzyudSwP665+lEwJpFFa+LeLh/fwVCM8dHJX1TIzck0u2Vyj7fsRCroYDReyF1tprurYilD/8Cqu8rKJSymk2EsucswcsVuIGvAEkD6fDNrgX4Jia1XX3KYq4Jnossx6/PdXIyYIazLXRtMVYxWyeC2IPTCyUs7HGLBHJcYCzS7LVRJDhzthXsV4XsON7F3/6aZG7N6h0LjdYxdC+ci646DoRl0hbnb96+RpJd1KHuFusOvdoKM6mbMG0JSKVnsM6mXMeE67QQjqN+z/mdJUygpjv3KqxKF0bUAT+Ri9Jh58L14YiKgB0jF10SU3TToG/M5LKmPw2R0tIK9OlIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aIoaD7AunPcZLcALmCQNGJtMTpmsGVM9r6GcnAtTSV4=;
 b=I8A1X5AQ8kNSm++ZKV9JwSaeDP7UZ3KHuLVIQrwBwB+rZNhpZa66vl1ofSuBzjVE4rE2wMx4FfJaqvt6LpfmtSilLL5erZ5oYs5Bok/PlDEKw5pMT6F/zaXZ7iJoaz1VGyDh43K/4e8gfjX75dyXsd7bZsqPWxOZdVjFtFv4Lbty9vUynsfc1mSU4p5aXaKzO8su6QbhTfDPVlY+RMnz1H2bItpdJhNsm46KVk3bE32jYnVuGN9okWwSBlb9d/9xRLAWxaM6ag7v4vlXdoImjn6zBNRrFi75Jvs4p4MkHZXkgAiTXeoFql40JVjwOHHwqf0AgVI69mh1gkMMPfK8Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS0PR11MB6328.namprd11.prod.outlook.com (2603:10b6:8:cc::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.9; Thu, 11 Dec 2025 21:07:43 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9388.013; Thu, 11 Dec 2025
 21:07:43 +0000
Message-ID: <022627df-da13-4537-9c9a-54872312c4e8@intel.com>
Date: Thu, 11 Dec 2025 22:07:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/12] drm/xe/sriov: Add debugfs to enable scheduler
 groups
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251211015700.34266-14-daniele.ceraolospurio@intel.com>
 <20251211015700.34266-21-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251211015700.34266-21-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P190CA0030.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::43) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS0PR11MB6328:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b1b9b6d-c66b-4a09-0e6a-08de38f953b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MXJHUVJzbjhRN0RDQ1F1aFAvMUJ3c2ZsSlQ3MXR4aGJrNVFSU2hoZm5wMFZl?=
 =?utf-8?B?OEZGMVFXbkRSTCtyWWhwdXpHMDFyVnc4VVdTRytQbHVheUVQbkVYT1FNZEUw?=
 =?utf-8?B?NlpMRFAwemtFdnFmbjRBSEpPQnB2K3dwVU9WeWtrVDhFTnFGSkRoS25DQlFJ?=
 =?utf-8?B?ZXQ3dEp1OHlWbWxlQTA4aEdVNlZHZEtsN0o4T1NEd1lOaFNhSWNxNk13VEZT?=
 =?utf-8?B?WWpHODU3V0NCS095YnZFTFJZWmVIMU1hKy9FY1ZoRWJrUk1lZnQwbXg4eG5p?=
 =?utf-8?B?OTJKN1V3Smt1SDhZZHZJNkFqWDRRV3RZc1o1TW1mWU43RVVjNFRtaDhqU2xh?=
 =?utf-8?B?RzExM3F0MnZkbDA5VmlHc3BaemxyTEhtb2ZiQ0NCNnRBblJkdzdRZVhnUU1E?=
 =?utf-8?B?S0MxYWRvNkJ6Zlk4dWtqVDMzVXM2eUY1TGtFSmliWVMyRklta0pkbTBVWENo?=
 =?utf-8?B?ZFNJQUZhOG1oL2VXMlJTWnhzN3RuMjdReWpPRDh6WEpkLzA1emtYWnRRMzV2?=
 =?utf-8?B?R1BQdnVEV1FKcFgwanJudE1JMjNUU3FKQTczL0JZVGNWdzR6d3FPMGwrOHl4?=
 =?utf-8?B?VFk2azZSVU1Rb29UM1VXTTBhWEZJWUNHb3pYTXJTZGtnTXMrWDhKR1B5ejJk?=
 =?utf-8?B?OEdjSkxQQi95YUZHOXVuRXVzUFhZTDgzS09ObnFrN2JPMTloVnBZT2V3YzlK?=
 =?utf-8?B?OG54ZmNlb0dzaHJHdVVKaDlqaVJjcS9PangvUEtubHlaaUI1VFlkTlN6Tnc0?=
 =?utf-8?B?cnRibWh0aUlyeU1BcmQyY2haeGlrMjB1OUJ4UDJVYk9aRTgvSDFVbGtJT0JM?=
 =?utf-8?B?UXZYTDRJU1hVam03cEhRMGgwc1Jjd3hRVklJM2xKcU9uMkp1YjJCcEVTQjhw?=
 =?utf-8?B?dTJzYmtKTXhkVlQ2OHU3SFhXRGh5MVVxWmxrVGJ3dDJueUFHdmc3b0NkR0xl?=
 =?utf-8?B?Z1BxVXFoYXh2am1JTm1kdEg2a2g4N29OUXF1emFwQ0hjRXhaTS9oOGtQTkV3?=
 =?utf-8?B?dXVLbU1qbTRCeSsrNzdqMGh3bUFpQW9KQjhYY01KR0t6M1I1ZmV6cFgvVStS?=
 =?utf-8?B?Y2hxVlBoejJ6RVFGdExWcmo1elc5S09MUlRMMEhVeGhoN2ZrUWh1UkVCZkFw?=
 =?utf-8?B?eWN0cHh6YWpNZEpvWml1VGdVbm5uNCtieEUyV2VIRmx2ZDVwaG50bXk4aDcx?=
 =?utf-8?B?VWNYbFZNeEFkQXlZdGg1VjM4Q0hoZW1xUHV5KzB2YVRCaTJ3U2dxbnl5elVz?=
 =?utf-8?B?cnI5SXBJWDhvTFV4OEl5TVBZenV3Z3M2cFVQVU5MOUROaURxVGIzaHd2dG8x?=
 =?utf-8?B?M2lCZW81RHBmb2ZaUXNlMGhNZzZqenhJL3RvYzJlRHZkUk92RUNleWNPRmxm?=
 =?utf-8?B?Y3B2RThaZTg2THpPK3R1R1F3QkdmVVhpM0oyNFdpNDQxaDZibDJsRk1PNW5z?=
 =?utf-8?B?SE9hZTAvbllVSHJGV0xNVGpxMmdzZks4NDZvQTlsSm0vYVJsRmMyS2tPUlFm?=
 =?utf-8?B?RDR0THd5QktYK0V4VXpva1NZTGJDS0RtVno3K0xoek5OTlBkZnpXSHRDUGRr?=
 =?utf-8?B?dytZYmZrM25TNVFSTjdyV3pSUGF0VUc0TEt6aCt2WXV4Ym90VlM3VWcxOFRI?=
 =?utf-8?B?VUUzZTlMWFp3d1JMYm9SWU8wKzNoZUFwYnJiWGg5RVowYnZHcVFjY08zVk8r?=
 =?utf-8?B?c2FwTDkxRi93Y0N1MDNyWkdYenhRa0pnU3JVYWJ1YTFkQmpnVXBBM3ZXMTZD?=
 =?utf-8?B?VDlkdVM5RDdCbmpxOURGTkJGditKeEdaT1NwRjN0T2YzNlZ4QkZzeTdUSVpk?=
 =?utf-8?B?TjR4bzJwM1kybTdIcG9CaUhZMnRZZFJ6QXFSSlpkRkZma3IyT1IzUjhEWWxN?=
 =?utf-8?B?eDlwNEdUWWplS0dwZEFtQlBJMzgwTFk3VnpaR2phY3lkM0l0NWNNcnJ2Zm5a?=
 =?utf-8?Q?22MrorHyTe0Kaa35Us94KRBg+t8PiOm4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnBKLzI3ZW1OVTI0Z0NqazM4ZFV6SWlza3BpUXNTZGw5NnJVaU9JcHhHMnFT?=
 =?utf-8?B?V2l4V3R0R3ZlN3VyZko0N2R6bFF6T3Y3L1VzMlNaMCtCVXljV3hyL25DVmwy?=
 =?utf-8?B?S3hwN1NZSyszWmhDQndHODdmdmZLcVJLMWVqbFZ4U2dVdnU5UjJvNGwrK0ZW?=
 =?utf-8?B?bDlTSlc5UXIvdkVsL2RPeXhqMXdUUGhqdWR6dTkzRW5RQmpCSG1zenRWRSt1?=
 =?utf-8?B?Yzd1TnMvUVR1QVBleU5wSXZEcnhrTm1OK0dMT0xlZkFxWExMUjI1dU00MkQv?=
 =?utf-8?B?NWVKOFQyTWNYcTVUOGFlMDYxTnQyekpOeVI4UXFhQnBYYTVWU0t0RVJrMGY3?=
 =?utf-8?B?akpuYWVPemxVT1NFWTRFM1pLZld3Y3NWZFBQcFNsMGpvaXBNTmFsMkVpTWU0?=
 =?utf-8?B?clpsUlpzeCtQbkxRZzlxbitGNk4xVGsvQzlqVnB5b011Y1pFazJUc3dlMkh5?=
 =?utf-8?B?MGRJMmx0Y0JtcnhmRDFaTGtXT21Ia3lyYU9ua0lZNm4xTEsrckNrTUMzOVJp?=
 =?utf-8?B?d1dSeVpBek9NSWQzcjcwNEEybHFPTEhRb2NuYWVjVkxlK0ZPVGFrSXVZUWxy?=
 =?utf-8?B?d05oUHA4TEdnbXVWdjRVbDZnaTYxRHJxbWJJQnVxV0JYSEw0ZG5ITzBNbndY?=
 =?utf-8?B?eXAvWWozV001Ums3SVN1YmsxT2MwTHNxUUJGVjRSRTEvdHFWZTkxL1pndkNn?=
 =?utf-8?B?WVlIaTBuN3RqWE04RkdIa2N6Sk5rZzJPN1k1aldhOXk3ZzlCWXQrTEMzSDUr?=
 =?utf-8?B?Z0Q3aHRycHVxOUtnMkxOK1A1cWdpTFhuem1LMUM4MjAyRU9sZ0pQYmoyZWdy?=
 =?utf-8?B?UnduZk51NklkajNuRkdaN2xFV2lkZFRPa2xuQzd3WVllOTdIUy8yM1pNK1lo?=
 =?utf-8?B?MGFBdzRJNTA5b2Z4VzByYjMwdnRiaXk0NnA1RE41ZGh0eU9xMlR1NHpaTG0v?=
 =?utf-8?B?TlIyODErY3FQVXQ5V3hXVXU4aGdwMmpiMGZJVEdhRDJnVmF5SjJ5bjJaK2pp?=
 =?utf-8?B?bFV4b29WenBqYzRGMVp6OHNBN25mSS82QXh2QlV5Wkt2Q2lEOVhEcFR3bkJk?=
 =?utf-8?B?WC92WEM5UEp2RXpPcWJKSDZnY3duQUo1bStPb2xURXVLUEk3MndEZUhKdnVB?=
 =?utf-8?B?WXNhNWM0S3ZYSXl3UU1JTVFMNllIY09UWnU1NXYwbks0ZVNieGd1Qi85S0Rp?=
 =?utf-8?B?TG0rdSt1a09aWFBSeURlRzM3bmJ6RXp4ODQwd2JjUkcwb1JTSiszYzJwR3ZW?=
 =?utf-8?B?dzdQbElQN3MxOUlDMTBLcjV0S3RzMnNwVnpabkxCRnBkcHJBSVU3bnprd0hE?=
 =?utf-8?B?WW44TXUzTFdXR1dNalhRRGtmaEJYVEoxNGUxdHJnaHcvMDZIb3VOdGdpZGlF?=
 =?utf-8?B?RENuS1IzdndNNjFaN29rclJzMkh6d21qOUdMUmRkbDBJRVVtN0w2NzlteHMw?=
 =?utf-8?B?WDkvcWNwbUR4VFdrdXpBcDRvWVJkSlgvbmlCcmZzYWFyTFZzdXhWblNMcEF2?=
 =?utf-8?B?czFFaVh6T2Z4L2FnMnNmSUxQWFF3S3craE1CbGhrWlZqN1BmS1hQU1g5QzJw?=
 =?utf-8?B?WkxIRlNpNDB5VWxwZkQvanM5OHo3WWE2WC96T2l1bzV4dTZXUkZMT0dnMUEx?=
 =?utf-8?B?WFNhV2xZd1lHNWR6Z29hanUyc1RESDlZKzV6TVFub3pYS1ZVbyt2Q2ZOOW5h?=
 =?utf-8?B?dHZQeDU3amJuMElKdWtqcHovRTZXWFdXajVENkdqbEZCcjFMc1NycysrbExT?=
 =?utf-8?B?bzNSVmNsQ1NHRSt4TENmRFYycVJqRlRpVS90RTNHdVF1TVlpdUtxakpLVXFp?=
 =?utf-8?B?N3ZHSitPUW1vWmRXMnJoeUZqZ2tHUEFXcVRFZXBxOEh6ZTg0dnRjaTBXY294?=
 =?utf-8?B?Nm1XaFVKRlJBcmx1YVZGY0dCWlJGZlMxZ3MyYlFGR1pjTzliYy8ybE5SYW5H?=
 =?utf-8?B?RTJ3YXdNV1BEUTFudTRkVkREcFR3dFY3RW53SDhMc21BSjF3dlF3L0V1VWhw?=
 =?utf-8?B?eitMOEt3eXR6cVpDaERLYk1CVWJwdUJFOXFDMEltY3JodzIrcDdIK1ZqemR0?=
 =?utf-8?B?QVVqUHFmZWRqS3dEVXdTNkllZyttblE0YzlyT2FSOGJtNUEwcXhKVTk4dWJh?=
 =?utf-8?B?TnY2cTczU1lhYnc3NDRXRTNGV1RiV0NWR3BQM0JaOTRxcksrMjdUOWp1SnZx?=
 =?utf-8?B?L3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b1b9b6d-c66b-4a09-0e6a-08de38f953b3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 21:07:43.6562 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qnbdt6rVROqab5jODa7YNhuAtkRjrjuzwqgE7GGoQSeAuv+O/waxcCV++kvJjeBTGYECUbK8taBTDahxy9ciZjdU9FlAJAPwRPC5XhnTTk0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6328
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

this is PF only patch, so

	drm/xe/pf: ...

On 12/11/2025 2:57 AM, Daniele Ceraolo Spurio wrote:
> Reading the debugfs file lists the available configurations by name.
> Writing the name of a configuration to the file will enable it.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

with 2 nits below

> ---
> v2: don't print anything if the feature is unsupported (Michal), add
>     TODO for reworking init order to know if there are valid groups
>     when we register debugfs, check for basic feature support.
> v3: use drm_puts, list modes even if we only support the disabled
>     one (Michal)
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 120 ++++++++++++++++++++
>  1 file changed, 120 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> index 7833a7118039..8ac5e0e01e36 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> @@ -156,6 +156,125 @@ static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
>  	debugfs_create_file_unsafe("sample_period_ms", 0644, parent, parent, &sample_period_fops);
>  }
>  
> +/*
> + *      /sys/kernel/debug/dri/BDF/
> + *      ├── sriov
> + *      :   ├── pf
> + *          :   ├── tile0
> + *              :   ├── gt0
> + *                  :   ├── sched_groups_mode
> + */
> +
> +static const char *sched_group_mode_to_string(enum xe_sriov_sched_group_modes mode)
> +{
> +	switch (mode) {
> +	case XE_SRIOV_SCHED_GROUPS_DISABLED:
> +		return "disabled";
> +	case XE_SRIOV_SCHED_GROUPS_MEDIA_SLICES:
> +		return "media_slices";
> +	default:
> +		return "unknown";
> +	}
> +}
> +
> +static int sched_groups_info(struct seq_file *m, void *data)
> +{
> +	struct drm_printer p = drm_seq_file_printer(m);
> +	struct xe_gt *gt = extract_gt(m->private);
> +	u32 current_mode = gt->sriov.pf.policy.guc.sched_groups.current_mode;

nit: current_mode is enum, not u32

> +	int mode = 0;
> +
> +	for (mode = 0; mode < XE_SRIOV_SCHED_GROUPS_MODES_COUNT; mode++) {
> +		if (!xe_sriov_gt_pf_policy_has_sched_group_mode(gt, mode))
> +			continue;
> +
> +		if (mode)
> +			drm_puts(&p, " ");
> +
> +		if (mode == current_mode)
> +			drm_puts(&p, "[");
> +
> +		drm_printf(&p, "%s", sched_group_mode_to_string(mode));
> +
> +		if (mode == current_mode)
> +			drm_puts(&p, "]");

nit: wondering if using single drm_printf with complex format would generate smaller code

	drm_printf(&p, "%s%s%s%s",
		mode ? " " : "",
		mode == current_mode ? "[" : "",
		sched_group_mode_to_string(mode),
		mode == current_mode ? "[" : "");

> +	}
> +
> +	drm_puts(&p, "\n");
> +
> +	return 0;
> +}
> +
> +static int sched_groups_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, sched_groups_info, inode->i_private);
> +}
> +
> +static ssize_t sched_groups_write(struct file *file, const char __user *ubuf,
> +				  size_t size, loff_t *pos)
> +{
> +	struct xe_gt *gt = extract_gt(file_inode(file)->i_private);
> +	char name[32];
> +	int ret;
> +	int m;
> +
> +	if (*pos)
> +		return -ESPIPE;
> +
> +	if (!size)
> +		return -ENODATA;
> +
> +	if (size > sizeof(name) - 1)
> +		return -EINVAL;
> +
> +	ret = simple_write_to_buffer(name, sizeof(name) - 1, pos, ubuf, size);
> +	if (ret < 0)
> +		return ret;
> +	name[ret] = '\0';
> +
> +	for (m = 0; m < XE_SRIOV_SCHED_GROUPS_MODES_COUNT; m++)
> +		if (sysfs_streq(name, sched_group_mode_to_string(m)))
> +			break;
> +
> +	if (m == XE_SRIOV_SCHED_GROUPS_MODES_COUNT)
> +		return -EINVAL;
> +
> +	guard(xe_pm_runtime)(gt_to_xe(gt));
> +	ret = xe_gt_sriov_pf_policy_set_sched_groups_mode(gt, m);
> +
> +	return ret < 0 ? ret : size;
> +}
> +
> +static const struct file_operations sched_groups_fops = {
> +	.owner = THIS_MODULE,
> +	.open = sched_groups_open,
> +	.read = seq_read,
> +	.write = sched_groups_write,
> +	.llseek = seq_lseek,
> +	.release = single_release,
> +};
> +
> +static void pf_add_sched_groups(struct xe_gt *gt, struct dentry *parent)
> +{
> +	xe_gt_assert(gt, gt == extract_gt(parent));
> +	xe_gt_assert(gt, PFID == extract_vfid(parent));
> +
> +	/*
> +	 * TODO: we currently call this function before we initialize scheduler
> +	 * groups, so at this point in time we don't know if there are any
> +	 * valid groups on the GT and we can't selectively register the debugfs
> +	 * only if there are any. Therefore, we always register the debugfs
> +	 * files if we're on a platform that has support for groups.
> +	 * We should rework the flow so that debugfs is registered after the
> +	 * policy init, so that we check if there are valid groups before
> +	 * adding the debugfs files.
> +	 */
> +	if (!xe_sriov_gt_pf_policy_has_sched_groups_support(gt))
> +		return;
> +
> +	debugfs_create_file("sched_groups_mode", 0644, parent, parent, &sched_groups_fops);
> +}
> +
>  /*
>   *      /sys/kernel/debug/dri/BDF/
>   *      ├── sriov
> @@ -531,6 +650,7 @@ static void pf_populate_gt(struct xe_gt *gt, struct dentry *dent, unsigned int v
>  	} else {
>  		pf_add_config_attrs(gt, dent, PFID);
>  		pf_add_policy_attrs(gt, dent);
> +		pf_add_sched_groups(gt, dent);
>  
>  		drm_debugfs_create_files(pf_info, ARRAY_SIZE(pf_info), dent, minor);
>  	}

