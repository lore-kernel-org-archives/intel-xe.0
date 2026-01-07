Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B177FCF6BF1
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jan 2026 06:26:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E77110E02E;
	Wed,  7 Jan 2026 06:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DbJp8CfL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0234A10E00B
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jan 2026 06:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767767198; x=1799303198;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=T4DEiZvvPRQQe6zZXmp01bS0oMQp9u07QeJpJZCUlp0=;
 b=DbJp8CfLGV3N1j06i4OAIu6sENYiGIubP+oCyTHHr1Nrfcdcguh6lp/2
 s82V35ntNiKp+x/ET24nH32PGrtw6GYWrNj0SLYyAnX4T++rd3l2ia9y5
 dbxPCA5W3/BdD7TcO3RzIsHPO17GYdn0JYHN+x6Lgv8vYcqqPcbxxNqTh
 WhBP2UrRvFiLyFgOaGCRaTXpPSmw8d/dghM9OuSVZq7Ty6N++ZGMmfHYe
 8BbRL4J/grJJAC5Opjq//nq+494wSw+yUS5x3/4fRP+9YsnwzAZsehqtK
 tJpqlgc6myeoI0mf8VLTxo5hhrFnnRHAsXBVcEwd4cBUAEj1hxmvxLqoQ g==;
X-CSE-ConnectionGUID: OzoiInmIQ9C54qDajJ6a+g==
X-CSE-MsgGUID: 7iGqau1pRRyI2Eeypy019A==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="91789564"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="91789564"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 22:26:38 -0800
X-CSE-ConnectionGUID: 5Ab2SUopQT+s0HUGKV5+SA==
X-CSE-MsgGUID: sbClflmrROuH8CEDODZSxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="207900573"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 22:26:37 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 22:26:37 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 6 Jan 2026 22:26:37 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.63) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 22:26:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ih0BiAltX8wCV+jkSO6jed4PJyjBuFzHcizHtpPM4qNHFP3MW9dC+tE1xFwjGq/BA5xXCtw3Kg0/ARAcXJ+BM4WYte+ms/3zXvyFwG95oANNkh/AcvTD8QAptoeFqKrVw+6sxFIp2ZD67bWSuVxM5lGqVFPYrTzU8BXt5sNjAYV/+o6iq1or3zSjwtOKK+Ca2dRwZaQTFJ9YGVweS7P1HhkKSRDONNeKoYZTmvApTKuMMCK5dGZukey/yLhiXIDWgxJUPzCTy0jQXaIYoWkie1GCI2Ymf52xYTFqKjmYEzfNQrEil9tdY6S7rWwNBp2FJKTblwgdeGDlkC4JV94/4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Ex+8krlVFT6EqwIyqGN+CHcF+3TowoS6A3B+iwVLww=;
 b=SKpKKeA3Jldf5jg0Hl/Uluhnf4qNFMoQHSkeR6NLPN+q9NeuvdvkuDUU0TWSeeRTFWPiOITS6jbCycbSARVcby0qCJN88O/S+Q8J1c8gEfmfqLpAl6ahDEbo25sPW0/QKzPibv4TsHD3jsEKEnXnYwM7OHUdz12GUrlI71HCR1vZDOtvm4h6H4pLAeQNRr/SVN5f8rF4IGSDOjVOzgV+6R5kKoU4K+lOvawOjb2qZRouIbQnqNlYQSNdVZlRqAB01FdADFP/ZTQBcKBQU6Df/Hfa1jRRhfHduO8XD649bW+cYfSqrIeC6PG8eC6d8aTkMyPQIWaJT8RX3aRAx1LWXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by IA0PR11MB8333.namprd11.prod.outlook.com
 (2603:10b6:208:491::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Wed, 7 Jan
 2026 06:26:35 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::803d:39cb:d276:4ee5]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::803d:39cb:d276:4ee5%8]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 06:26:35 +0000
Message-ID: <ad086252-f93a-4a96-a63e-7b2a09aaef0e@intel.com>
Date: Wed, 7 Jan 2026 11:56:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Validate preferred system memory placement in
 xe_svm_range_validate
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <daniele.ceraolospurio@intel.com>, <carlos.santa@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20260106213443.1866797-1-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260106213443.1866797-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0044.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::17) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|IA0PR11MB8333:EE_
X-MS-Office365-Filtering-Correlation-Id: d47a56d3-2612-4b32-3b59-08de4db5b4d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THlDOW9nM2hEOXV0bHo5VWZRdHlOY3pSOXZOR0R1Si9KR1ZFajVQSCtqbzQr?=
 =?utf-8?B?WmIvZHlGbEhvSllXaWFOOENvWXJ2L3NBekkzblJXSmdrS2tvSHV1OWl5ZE9U?=
 =?utf-8?B?L05sWktYZUxEOGQyNHlnamF4U3BlV1grOHhOcFN0UnFaaHZIeEhpNUw5MTFo?=
 =?utf-8?B?N0dUWkhTbEVadHRsdjFZckoxRnBUTEIxT0E2WDU2bUc0bTBhcDdqd3JOaURD?=
 =?utf-8?B?MTZxVzNUUURRaHdKQjhMVVRuRHI4WEZ2RHlOdCtweWI1VGM1K3pqWXp0SFhW?=
 =?utf-8?B?dGdQVkM0WVgxdUtab0swNjlqcWs0RlNyamZpSmJQM3crZkk0RXJoRklXdi9M?=
 =?utf-8?B?T0pKS2V1dE02YWYrRXVyWmM2TUxyNkNVSWh6Um9WZkJXZHlBOGxJZkVSWTVW?=
 =?utf-8?B?Ulp2Q1J3aFlCWUw3RW95bUUxT1VGWnJXSXh0SFU3eTFKSWJVeWw0ZGt1MC85?=
 =?utf-8?B?QzVQeUZvdHI0N0JWRnVqTlR4eUFhU2dUeGdxNW9xSGNlTzFwaE5lZHNWWnE0?=
 =?utf-8?B?dmZzL3grVmJERVlFK2dZMVd4eVc0S3RtSTVWdEUyejY4YkgxUnROeXZ3NXdi?=
 =?utf-8?B?ZjFzczFkUmtyWnQ5YkY1TnE4NHVlL0UxWENSK21xY0d4SmJodWozckhDMXhs?=
 =?utf-8?B?Q1dzVVhZUUI1TGV3eWpnMVo1Z21Ndmh3c1RrV2huR0kzcGVNQ3NScm5vU0Zx?=
 =?utf-8?B?TUpPRlo5RW9GVkdQUWlzRFNmQXY4STVsUzNzMXhzRlRwMDFIazRmdlNqNW1y?=
 =?utf-8?B?Y1UxWldDU011SE9wMmFad3YzYTJTNFRtRTZWNmFhWDlwSTlFT3V0eFBtZnFQ?=
 =?utf-8?B?S1Zac2ZISXc3aTBYZFZMTzlXTmVJcjROZHhlbWZTUUlBb2QzdjQzL2g5T2VK?=
 =?utf-8?B?RUoyNlhnbXB1ME5HcG9OSDZpY2llYjJlK0F4VkVzWlVwdHZYZlJJZU1sS2hi?=
 =?utf-8?B?M2lHaGhyYTN4d25PZGo4eFJPS2pnTDB5cVhWWFpaaDRyemQvb0pmblNsUTNl?=
 =?utf-8?B?Wm5WUTVScUtaM0RKZG9SaUpQb1JkSUdGZllTNVM4bGVUdk5ubmNzNmVraDI0?=
 =?utf-8?B?S05pRHQ1Q29OZ2ZmdjlqYVA1L0J4ZW90aHVGcnVPV0xVYzdwRkVoSStGaWJY?=
 =?utf-8?B?MnhUZ1h6ZlBSUjRhdlladGU0Z1BZMUxtT1pvT0QwZ0l0dlFXN3FqajlJR0Z4?=
 =?utf-8?B?eHVOY1NnaWZhSWt1N29vTnViUFFSRFFUTjNFZlY5MCtzL3RLZnZHWjEwY1RV?=
 =?utf-8?B?NW9sZ3lpc0xlK3VqVW0xKzI0NU5KU2J1T2V5Q3A2ZlZLQzQwU1c2YmpXWjdW?=
 =?utf-8?B?a1pySXJ3QVo3VmowZmZxRW1EQTd2a0NLYUhuVVpsVVkyanJ5UW5VUFpWdXdS?=
 =?utf-8?B?bHlxVVRObERsSVVuYzI3MmMxVEZQVVBQOUdCL1RURnhSWW5PVm1HMUFDYklR?=
 =?utf-8?B?U0I2a0FwRUZDQWYxUUpqQ3Nud0FxaFh6akkwaW5pN0dNMis5WFYyc2Y1NklU?=
 =?utf-8?B?QUIvczZKN2xPRi9MY1phUFplVGwzSGZvWjMrSkU2RVQrZWpRUkc0UVBGVjQ0?=
 =?utf-8?B?U2xsWTltcU1udGRMYWJFamszd0NjbHRZMk40L3QwanNiaEdUcXNtcVQ0LzhZ?=
 =?utf-8?B?aDNtR3NDMXVEcGJGbzNWRXIwY3YydkxLd1Jzcnh1eXJxMm9heHQxKzJrRUx0?=
 =?utf-8?B?M0x5dSsyVW5XUHFpSmV4K3gzK01KcXVPZDZoYmtINHlRTm5JWjdscDRCbzhK?=
 =?utf-8?B?MlMzakVCYXgwcmVxcDFiaVZLam5uNFlMNy9iZURKUHUyd1R3Z2VxRDY4alNY?=
 =?utf-8?B?SkRRSmR2UzhBOHBZUnNqWFhXdk4xZVNoMVluNTRkMkdBVXp5a0NVQkYrWG9u?=
 =?utf-8?B?bDU5TStSVEEwTW5BdFU4SHAxVFBCNHBPcXhkMnBzQ3RkNlU2UTdESFJBYzJI?=
 =?utf-8?Q?RVVNRhw6mkOZhIx9enofHXjpqEduX7Pw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0JzYmVtdllnN29nQ3F3b2xuSFVVRDAzZVp1emUrRFNkZjgwbUlUSm1KTzMw?=
 =?utf-8?B?SEJPTlgyam9WOWJCcVhiRzh0Rng2MDliNy9ibnMzc1dLcHluVTBORTRTRWJl?=
 =?utf-8?B?R2YxRjRoRkZPeVlvbThLMFdzSHhiRGdSa2pBN0ZHZ3VpZWlDTTBzTFoybDdR?=
 =?utf-8?B?dlZWQWVIcit2eVFqVkRhSTE1YWxScUlwM3Vtb1JVYTFPdDhSWVc4MnAvNUJB?=
 =?utf-8?B?QTRyMnQzMUVLVlFHSUJUU2NjNkQxUjlhQkxGU0FrK0lFcFM3U3JwdjhlQWdV?=
 =?utf-8?B?c0FpN3hNaFlTQVdMRDhiTHFwU3ViKzRRRGJwMHplWm5ZdkpZRURBNy84V2dr?=
 =?utf-8?B?bFV4cXNna2NlTTFCdG5WdWNIMkl0RkpkejQrVkVxT3RXS05wWWdFVS9HSFJy?=
 =?utf-8?B?MEtEZ3R0RzMxYzNzWFFGYm9YTlJQNnVlNjZ3a0xjUkhFelFQSU53MHNIVm9y?=
 =?utf-8?B?c0FMVlhzQjljU3JENGRzYWRGeStFTnFHUUFtbk9nMUNVWG9ldWJIcDJxbnN2?=
 =?utf-8?B?c0RUWVJiQTVXdlQ2b0JBcTd2dzRYMnhFV0s1NVBWN01MSHU4anR6QmxpUFpy?=
 =?utf-8?B?amQwdTRCUk41WkhoeWFoZS9Gd2ljcm5xM2VKRk54ZXZlT2NjaDkwZkRYWHd0?=
 =?utf-8?B?NytaL29ma0ZJVHNlWHEyR3RIRlVyc01zcUt5b0tvVGh3b0p5VGZyZzdiMTRU?=
 =?utf-8?B?SFBFQlNoT0Z1NjkxcmZyV1duNWF0MGVkYUcrOFhUajJsbFVaaXF3bDhFUnBZ?=
 =?utf-8?B?bS9DN282TVJFK0podFl6UmNkTStOZk5zcjRYTStKcFU5UDdmSkU3MXlJdGJu?=
 =?utf-8?B?WDNGczRXR1NCZDdBbG1OL1Rnc2I4dnB6b1hGbjhzK1ZpWS9YRFR1UjBqRWVy?=
 =?utf-8?B?NGk2SnI0L1pzTTNoYVIySy9nbE5oVmxNYnRrQ1lhVi8wek1paDE3M3RLRTd5?=
 =?utf-8?B?UFlYbDl3alJrMGRFL0w5UG9rWStoR0JkUVVqOStuVnVmUHVEakpZbkZkOFpE?=
 =?utf-8?B?SGVYSzJEVEtMeWhqeGNWU3lERnZseG1Fam1uSnpmYThJTHVyMTZPc0dRT1Rw?=
 =?utf-8?B?S01NYWZPTmtYc2Z6dkxWNUhtblhuT2toWjFOZWN5THlic3lyTmk3bnJsaGF3?=
 =?utf-8?B?QkFEOHFCKzE5YXdyVy9WNDdsL1dETVdydk40K2NNRHZmcFpiRjJ5NThiZzBt?=
 =?utf-8?B?eEFNcmExZ0JncHUyTlRGVmc0V0JvaHhiemwrNXZaTDg1R0hoN1RZdHZYMkg4?=
 =?utf-8?B?UG5OTWVRQlFQVVJEUUN5Z21YRE8wSXYrUjJIb0JSb3pMeHlDK08rRDZvVEdW?=
 =?utf-8?B?bFhGY0RjeVNVNUQ2OTNoOHhCNDZpdTA1UTIvVkk5RGcwUU4rV1B4bGtRaXlD?=
 =?utf-8?B?VVNmalhPUXhKblJDMU9yM2NRbjVaT01jREVLeWM3NU5PTEd6cCtSWElkakdt?=
 =?utf-8?B?aVlIZzRsc2FkZm1QV3RIUCtrMjloTFRudlJRZlNieHJUSndqa2hxKzQ3cG1Z?=
 =?utf-8?B?OEl3ZHJISUJ3UEVQVldheldDUmpVSDZoTGtqWkRnOWg4L0RMaVpFRWYyUTYw?=
 =?utf-8?B?QXA2Z1N5NFpRMHhleG1mWXRkU1FlVlIxUDM0dHFTQThNR1Zjb2NTb0NYbjdw?=
 =?utf-8?B?OWZheWhBVVYvTnRPS3NVTzQvb0s5NVl3QUhkM3VDRDdQcTFNdDdpNWJZUVFq?=
 =?utf-8?B?Nnk1dlltc0hmcGIrV0VBbWpIQnlTMExzdGNPY1BGVHZBTWpXVnlpYUpYbkw2?=
 =?utf-8?B?eWpoYmlSM0tpd24zRG9Ec2RIb0JTeTlFUHBtZkc2TjVqQUFnR1lZR0VRYm1B?=
 =?utf-8?B?clBiNS92aGFsNTR5ZmxkdWhuOVJ2RFc4N0lUM2FiTisweWFPUVFNbldsZjVS?=
 =?utf-8?B?Y0NseFdsQUk5LzRXTEJGUDFManRBSCt1TThlZ09nSnZEYnE5ZG9ISVpyN3JW?=
 =?utf-8?B?WWc4WlpNVFhoV2grNVNWMy9KL0xZSXJPL3JpdWE2b01qYWZ0dDdFYy9JNCtq?=
 =?utf-8?B?ZTI2b3J1ck1HVHVjOEpMUCtKNmxOK2E4czRYNmhJMDVjN0ZBZVI0L3VJamJh?=
 =?utf-8?B?RGk5cXJEWkM2Nm8vaTg5VWVuOG1MMUl3T3A4Ymt4ZkMvR2h1OStiazBOSGRF?=
 =?utf-8?B?VUxrWC9URmpSTVRNWi9hamtVR2ZMNzNoZUJjTTVZMGZybFZKK3hJVXpaQy91?=
 =?utf-8?B?MEluOGdFNnVtQzVJKy9TenlYb0RFSndMTDFoZTR1dGllVm1zQXA5bEpVSTNa?=
 =?utf-8?B?VERQeE1jakk5VHZkTm5NYVRnbG5SRzdmRWJOcEFrZmdiWGw2NkJEaVFvZEVO?=
 =?utf-8?B?VzY1T3Z2Sy9IWnZOZzlWblZBS0d3UElVYzhpNFQzR1o3Snhoa1F2dXhXaVFW?=
 =?utf-8?Q?XP02r7HKAQVgY4Qc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d47a56d3-2612-4b32-3b59-08de4db5b4d6
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 06:26:35.4766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vuxVo0tF24e3HLeAA7324YMeHbbngeogqsYbqski4X/BkhOO9xoCPTKyGfYl+7bOncxwjY40YO+FcdABoUikQX82Q7H8XevA7zKzZWnmYb0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8333
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



On 07-01-2026 03:04, Matthew Brost wrote:
> Ensure preferred system memory placement is checked in
> xe_svm_range_validate when dpagemap is NULL. Without this check, a
> prefetch to system memory may become a no-op because device memory is
> considered a valid placement.
> 
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Fixes: 238dbc9d9f4a ("drm/xe: Use the vma attibute drm_pagemap to select where to migrate")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_svm.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 05dba6abbcc8..be55b53ace8c 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -988,6 +988,8 @@ bool xe_svm_range_validate(struct xe_vm *vm,
>   	ret = (range->tile_present & ~range->tile_invalidated & tile_mask) == tile_mask;
>   	if (dpagemap)
>   		ret = ret && xe_svm_range_has_pagemap_locked(range, dpagemap);
> +	else
> +		ret = ret && !range->base.pages.dpagemap;

LGTM.
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   
>   	xe_svm_notifier_unlock(vm);
>   

