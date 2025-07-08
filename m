Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B006C83F0A
	for <intel-xe@archiver.kernel.org>; Tue,  8 Jul 2025 16:44:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F19E10E6B0;
	Tue,  8 Jul 2025 16:44:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dMMuMhv0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E946410E012
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Jul 2025 16:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751993057; x=1783529057;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2bVww3nUf6F6Pxq9SqpvpeEGxww5fhzSoyefZcOFp0Y=;
 b=dMMuMhv0z9NiXhugthOeCGr2d9JwsS8PZhX8zaS8B8DafPB5XgPqnCGV
 we9D2MG3sW6mQM9GGsP3XoMgagrsxbRxKeyREbvMF8HME/Jjyiys9PogR
 3CUY6/XmQmBY2sGCTWeCjAtz0r0HJdDlBFwtN/WQAsP3Nn5RdZnwwyZOF
 2Dh7HM+lEeS/6mHnuBahbnvxr0yZ+ELyDZNHJ/YNrCpUin6uGZW19+cFR
 UjjhJ3yfKxCM5BHB47Is4WkwBBRX2ahL9XGbTimiDOMbfhvJiv/Waw70H
 2aWP+2BzR7E1cOv/l7EZ1+4njqD6GUdY1OcILbQYXiPTKk9vze8ihx+UZ A==;
X-CSE-ConnectionGUID: a+7nJlxSSn6bgdu+5rB+6A==
X-CSE-MsgGUID: KQWguykhSpOy8T+vLurG7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54172294"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="54172294"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 09:44:17 -0700
X-CSE-ConnectionGUID: ++vIoiOaQBuzIYM65Hfxlw==
X-CSE-MsgGUID: TQsduTtWRt+ajHrOZJn3iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="161096429"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 09:44:16 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 09:44:15 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 09:44:15 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.65)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 09:44:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dURGlkstk+05ThsqgDB7TJyH1+L6mZcsEfU74wka265a6blxcevmnCX/D9h5IxOwfUPo95sAHzwuPKDThhqtmKue7JYD8uNCh3jWyWktTeQjcU9EBw4Y7OGvspHeMHBMRZK8auMVbNbGeRPq5kp1R/TWlBaRRDW9pjgnZUU+VUpoOaEmi/wQHqI9nunAESlzjVDL9tRMYLM1unFLz4yK1Hvl1XEgJTBDQ3Flqu83EtoqeDO/i2s6Z3/nPLGOOM3je+kvAKh9pxM0b7mHovb6uc9FiclDcyJi6sAG6PWIfcS0Rc8cDt2vpbGw3bFbzxG6AGPwsUkYy0OUoXyzrJwzZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ccRJXFrj5fH8QSimJ+Zbyaxx9avxi5Urpe+KU8I/hhw=;
 b=qNI2MTrPOlERbwB6MOyVZ0WWmXA4dF8sslP6JNM3HmUHx2r6CUukxWsJdPV4DJFK8z4nEDZcclbJx3VYdx34N6Nf7dip79o/HK8UIQK+B9v1e0BRqoYjgtXIfD9nC35QVr7yEOw7+iO4USN3sjV7AXqOc5t5UjfIi93N+6HajiaaoQwcV0y/3sUJUlJ0uDNVpKQ1iea5wTQ7kkXLClFArw++c5fZ2afGICPARfAevatbhvCsvg8KHgySeEONy064viDV2LcHKjo/hAqS578De/+7Gx3fILEXYe4ayA2ly7BXRNH4xRjNHZUBe9j9mlsA9+K0sE4Vswazv5P1LgQKRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by CH3PR11MB7250.namprd11.prod.outlook.com (2603:10b6:610:149::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Tue, 8 Jul
 2025 16:43:40 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 16:43:40 +0000
Message-ID: <cfd59d04-3074-420b-bcd2-620348af2d50@intel.com>
Date: Tue, 8 Jul 2025 12:43:36 -0400
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBkcm0veGUvdWM6?=
 =?UTF-8?Q?_Disable_GuC_communication_on_hardware_initialization_error=2E_?=
 =?UTF-8?B?KHJldjcp?=
To: <intel-xe@lists.freedesktop.org>
References: <20250707231108.3217573-1-zhanjun.dong@intel.com>
 <175194872804.142396.10864509382954186082@1538d3639d33>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <175194872804.142396.10864509382954186082@1538d3639d33>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0314.namprd03.prod.outlook.com
 (2603:10b6:303:dd::19) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|CH3PR11MB7250:EE_
X-MS-Office365-Filtering-Correlation-Id: 287f6757-4753-4b09-9f81-08ddbe3e97b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXdhWk04TElDbU9VdmRweWoycm1tUmZQSUkvRTZtaTBISk0yWmJEUlhjYURN?=
 =?utf-8?B?V1ZRVnlVclZpeHhHMVhtZ3cxaUJ3SVZKdkNSTFBlSVFiMFZ1Zi9NRklNNU00?=
 =?utf-8?B?M2lKYUhNYk5VekhkSGJYRlZDckNURjVHaGR3QnZBYVhabnRKcGlhNlhFMzY0?=
 =?utf-8?B?T0ZBVk13UjdQN2NVNzE1NURpWWpMVm9vSXpNS3NWTHgxWjRTUWYvK25NQW45?=
 =?utf-8?B?Vys5WWNjSHU0dzFBaERESTV1YkJXemJJYlhoUGJDaE9DOUY2UGI3MEtGY0lD?=
 =?utf-8?B?aGZid2NVZHBaMm5XVzVKZ2tSMjM2aWVVZE5tRzBIalFPZjZKZUVqY0R3dlFq?=
 =?utf-8?B?Uk00ZFphR21YTUtMWWhNa0MwRk1zcDEwWjQxZWNjNkFFMW5DYjJtR0xBK0hu?=
 =?utf-8?B?NFNRd1N2a3dhclRhakJyRFVGRFp6YkpzKzJacGFFMWh1Q0pkM3h2Y0M4WUhz?=
 =?utf-8?B?WC81QlZSNVk2djNhSUZvenBiQVAvQTAwZlc3UkNwN2xnVmxieUZGN1RmV0Zw?=
 =?utf-8?B?THQrZVQ5MGlHSGQ3bnpzT2RGR2Z3VEcxUGFDczFoMllFY25TYU9iVWhLOVZj?=
 =?utf-8?B?SWFkMnMxbHBiMjdOY0x0UTdISDhEUEpGWmw0aGdOK1BXRWFJRDlHZGRoSnUr?=
 =?utf-8?B?NTZtWk1IbGxYMHJmTWlpdTZHeE1uaDJudHEraFhGRldzSUJYSUxRQitmNjh3?=
 =?utf-8?B?bkRKYXhGd0xKamdONS9qL29RZ21SNXVaWTk5V25tYXhHbEYyM0grNGtBV3Z4?=
 =?utf-8?B?TmV5RU1Rc3luYXkrQlFRTXlMcURuWDAreDRGcnpJVmZuc0tQVU8wU3B1RlBy?=
 =?utf-8?B?aU10ejBibTc2ZWw5bHlpdTRDd0dOcUtlazlwNnZoVW8xTlhFdWRqQ3BMWXg0?=
 =?utf-8?B?UnU3MEg1YlN2ejFNZUdISWJvYUo3ZVJsNm9NUHQ4cHZBemlUSE5xUUtEZ2Qx?=
 =?utf-8?B?M0g5dFZMN2ZPSUpSSEdJREVRUzNITzFyNEF5Z0kxYkNYRjE5b25mT1R6M1pK?=
 =?utf-8?B?QWd5UEs3SG02Z0pnL3AyZU1yZzU0Y01kT1ZjQ2tkTTd3T2diM0Z0dHl2REhE?=
 =?utf-8?B?dHJNWWR0QlpNTXdUaG03a1FiL09KUUUyWFJSeTJWVWpwRlM5UDJvSmdWb0JY?=
 =?utf-8?B?Q0NvOWNBOFYwZlpJeFdYQjdwR05zU29nbE1SMHhLWGZiekNmdlFtOGlOL0VY?=
 =?utf-8?B?RTdpV3N3em80aGt1TGFjMThnVnZHOHBaaXBxSkw3QTM3Ylh6Z3JoSU5EQUJy?=
 =?utf-8?B?WUNZc1dyeGFiVnFFRDUwU3FXaGhGQjF1Snp4OXlOcWR5dnRFV21PVWwvTnNt?=
 =?utf-8?B?czdnTERBWEgvQjFZRVEzV1BwQXg4L1BsWXgzRW9VOE1WNUV6dTF2ZWtaQk1D?=
 =?utf-8?B?TENvVXdOV21GNzBVMXhleWdHV21DUHpaU0FtaVprS1gwNGxaL2VseUlERkdh?=
 =?utf-8?B?b3BncFovczhuQ1hrU3BqYi9HaDJhdVZqTS9vSndVekRMRndKYXFhaVVxbllD?=
 =?utf-8?B?VDF0STZmZVpEUndUc3NaakJFTVg3Tlh1bDJobFVFWXJ0UWJlRGliMUgyL014?=
 =?utf-8?B?NllQdHJlYlRhcFB3Tm83ZmpJK1kwdWxkRVFUYkR2L3lyS2FVYUtCS1pjTUFS?=
 =?utf-8?B?Z3l5LzJNS2JhR2ZTcGZMaGJDTmowaUFvclZCdGt2NnR2dFBqMjJGdjRKOWdu?=
 =?utf-8?B?ZTdtMGg1aTU5Z0ozcEk5ZU4zUytPQUF2Q1pJOHRaWmM4Y0t0TWs3RE11dlJw?=
 =?utf-8?B?eGFiTkR2SDcyQjBxeEhmM3d3YWlneWNZYUpUaW9XT2lkMHRLR2RSamFQN0wz?=
 =?utf-8?Q?sxRn7EpraOiV61Wuu4Etgem0Nqbo5W6DrTF0c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnNlYkl4TTBjODl4K3hUTkI3WEM3YUhMYjQ4bDNrTjBQMTlncHFtMXRNN05w?=
 =?utf-8?B?TUE0R3JsbVVHcDBXSEVKMU1NYlFzYnQycm9xeEp2V25FdmNuTXlCMkdVRHEy?=
 =?utf-8?B?MW1KdUowdzFjZjYvYzdxWU1YWm5iWU9kaThaSDR2K05EaDN1TlZPY29EVnRv?=
 =?utf-8?B?V0Zhd0lqVmNYUmFkWGlNNzRuM3MvTTliYnFIRjZqMVcrSkpXaUV1MTNycHgr?=
 =?utf-8?B?eUFDRkw5L2JqdHFIeXVhRmRZTWRkVVdvQzVTbVdaN3N1MmhrS21oSFVKdDRF?=
 =?utf-8?B?SHBuOFpLVS95S3VPYjdXSkVVMldubUZ6Vndvbml2a3VQVkJGYU55NjlpQkhn?=
 =?utf-8?B?aC80MU0vSHNxTGpSZ3hUZ0czODdYc0dNWUUvNmVZSzFodEYzdFBwZTRabVN5?=
 =?utf-8?B?WURobUhxdG5OS1JnR2xFaTRlRC9wVlc2NDFsd1d6TDMxbHhOcmtrRkYvZ2tM?=
 =?utf-8?B?Nzh3T2QrMU5SazBDeDllbEVzdUVoNEMyT2p1N1JybVdyMXVMTFJ2NUpxVFNm?=
 =?utf-8?B?SGRxNjMweko0QkViQVF4bFdZU2dPMGtiYWVnL1BvT08yTWFaeGFwL0NHMzQw?=
 =?utf-8?B?anNvSjdEc1ViUDJJS285Wmh0RmxNTHlsSjJyeHZQMVJnekkxQ0R0NzhWK3h6?=
 =?utf-8?B?MHI2a2k2K0pPSk1GdEtoNmd2bldKdE82WldjUHk3aEJKcG95NGE5Rnk0VjRx?=
 =?utf-8?B?UllVWmprS2w3U0swZENReVovMHY3TUM1NlZ2dlc5Wml5UzlhMmRhMVNqdnFX?=
 =?utf-8?B?L3ZUTkcxTytyKzdzcWVHSXlsdVpNUFpsY21IM2tLSnlvYSsrMnBKbjR6RTdB?=
 =?utf-8?B?ajRRbmlFMWUvSHRJR1ZPdlRoRHptZDY4OFZCamhIK1V4ZmUyZk90RGRUVGFR?=
 =?utf-8?B?WFdhVkFPRXRjWjhhTjhRS09vUWdRVHdZbS9WVWovdmEwOG8wblpmZFRVTFlS?=
 =?utf-8?B?VnRYbHVWdFQzVzBRVEZldXpRSitsQjFMTlBnUnhzL3RMVGhha1pxY08xNkZu?=
 =?utf-8?B?MHY2cmxzRGJXdEZvNUU0d0FFUEE2UXlpeVdyWXVRSkJhWGV5WENCTnR0cGdC?=
 =?utf-8?B?bHQ3RnlnamlKZ0liVzg5RjZ6ZVVPWTI0M0kxWk44bDEremxqU2Nvd2dMcDFz?=
 =?utf-8?B?RUpKdG5zdDBqSjZMa2kxME9IYjVXblg4RlZ6K1ZGU00zM0RjZ0JubnZtN0M2?=
 =?utf-8?B?cnhXSTUwODVpN3V5cW1LMU5DQ3hxM3R5c1l2aXhSbGFkK2ZLcy9wRi9UNFdT?=
 =?utf-8?B?STVDaUhiQVA3a2lYNTBxRjVSdWtJWm1xWTQ4eXFJbHNqRTB3VHQ1ZTF5aW9v?=
 =?utf-8?B?ZmRkS2tTNzF6d282V1hwV1Q5ekNJeHlNWDdvOUxYa3N4Qi9INXZiZEFTMTM3?=
 =?utf-8?B?KzhnUVQ2VUxMODNNVWtSVjZUSXNkYnZlSzhEODM5cmYwcnJDRHlvc0I4VGE4?=
 =?utf-8?B?UUIwbmtrTWViZEZJSFBFUWNOMU90Um5CZmJqM1EzQWpXT1JvQ2xyZjdRYUdW?=
 =?utf-8?B?YW1DU3RqSlRDdy9FUUJZWm4rTTBYSjVpR1NLWHNtdS85SkNpOEl0N1BIeW1G?=
 =?utf-8?B?aVpIbzNEL3VsdTZLNExWSGgvYUlpYm5kTThBVEZsTVkzM0kyNEEwbXRGQUhx?=
 =?utf-8?B?YW4wYUI4QStyNEd4UmlINkU4OStjS1NSOVNGRG9WRDlPVTB2dU5ETTkvUndH?=
 =?utf-8?B?S2lXSGw1bjdjWGQ3MmJRZHhyVUxXRU0rKy9ON0plMHZpZGttdTd1S1hjY0Zu?=
 =?utf-8?B?bC9vRW5TZDZOVk1xTi9KM0Rueit2cmlWSDRHa1FXQXhtSkJjQjk2ZkdmN05O?=
 =?utf-8?B?WHRHK1ZUNnB4akMwUThzSjFsbXdyU0M4UGlSdWltM2EzWUNQelFHamJrSTVJ?=
 =?utf-8?B?dE1DZU9TTHBKZ1F2MUdZaTlZNWxDSkRCVkV1TDAvQTZSdnRlRlp0R1EzTlZQ?=
 =?utf-8?B?ejIzdlJsdXNyR1BCeWhva1lhTHV5dnIrcGJla0NENkZKc0VLMDkwN1lsd2Fp?=
 =?utf-8?B?UHpmdE9DZ2ZyU2pCYlhiajU3a3dYOWVhbnoxTHRCbXYrbjQxZ25TY1FrTE51?=
 =?utf-8?B?aUFWYmlNN1B0aHFtTU9aMWlsOFM3R2hHQmp3VHNoU2RNRjBxM2hLU1ZvclFl?=
 =?utf-8?B?emhCbFUza01OZFFYMjlBdEFMampvMGdFMVJyVU9WZHcyb0Jha25NT1VzbXBO?=
 =?utf-8?B?YkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 287f6757-4753-4b09-9f81-08ddbe3e97b7
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 16:43:40.2821 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9pvAQ8cAC1Om2MTC8lC0S/pvE70PJNrV68QVDaOVpfekCTvdX6ESB6jEmbxn2lOt33tFgQuhBJMOBrJ4Uk6+Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7250
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



On 2025-07-08 12:25 a.m., Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/uc: Disable GuC communication on hardware 
> initialization error. (rev7)
> *URL:*	https://patchwork.freedesktop.org/series/150488/ <https:// 
> patchwork.freedesktop.org/series/150488/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/ 
> index.html>
> 
> 
>   CI Bug Log - changes from
>   xe-3367-02069d358330d2c30eb66590736f360964d88612_FULL -> xe-
>   pw-150488v7_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-150488v7_FULL absolutely need 
> to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-150488v7_FULL, please notify your bug team (I915-ci- 
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
> pw-150488v7_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-
>     bo-map-nomemset:
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-lnl-2/
>         igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-
>         new-bo-map-nomemset.html> -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-lnl-6/
>         igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-
>         new-bo-map-nomemset.html>
This failure is not related to this patch.

Regards,
Zhanjun Dong>
> 
>     New tests
> 
> New tests have been introduced between 
> xe-3367-02069d358330d2c30eb66590736f360964d88612_FULL and xe- 
> pw-150488v7_FULL:
> 
> 
>       New IGT tests (16)
> 
>   *
> 
>     igt@kms_flip@busy-flip@d-hdmi-a2:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.71] s
>   *
> 
>     igt@kms_flip@nonexisting-fb@d-hdmi-a2:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.21] s
>   *
> 
>     igt@kms_flip@plain-flip-interruptible@a-dp2:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.71] s
>   *
> 
>     igt@kms_flip@plain-flip-interruptible@b-dp2:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.73] s
>   *
> 
>     igt@kms_flip@plain-flip-interruptible@c-dp2:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.70] s
>   *
> 
>     igt@kms_rmfb@close-fd@pipe-a-edp-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.19] s
>   *
> 
>     igt@kms_rmfb@rmfb-ioctl@pipe-a-edp-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.15] s
>   *
> 
>     igt@xe_oa@blocking@ccs-0:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [1.02] s
>   *
> 
>     igt@xe_oa@closed-fd-and-unmapped-access@rcs-0:
> 
>       o Statuses : 2 pass(s)
>       o Exec time: [0.05] s
>   *
> 
>     igt@xe_oa@invalid-map-oa-buffer@rcs-0:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.01] s
>   *
> 
>     igt@xe_oa@map-oa-buffer@rcs-0:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.05] s
>   *
> 
>     igt@xe_oa@mi-rpc@rcs-0:
> 
>       o Statuses : 2 pass(s)
>       o Exec time: [0.01] s
>   *
> 
>     igt@xe_oa@non-privileged-access-vaddr@ccs-0:
> 
>       o Statuses : 2 pass(s)
>       o Exec time: [0.02] s
>   *
> 
>     igt@xe_oa@non-zero-reason@rcs-0:
> 
>       o Statuses : 2 pass(s)
>       o Exec time: [1.19] s
>   *
> 
>     igt@xe_oa@oa-exponents@rcs-0:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [3.45] s
>   *
> 
>     igt@xe_oa@privileged-forked-access-vaddr@ccs-0:
> 
>       o Statuses : 2 pass(s)
>       o Exec time: [0.01, 0.02] s
> 
> 
>     Known issues
> 
> Here are the changes found in xe-pw-150488v7_FULL that come from known 
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
>     igt@fbdev@eof:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/
>         igt@fbdev@eof.html> -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-dg2-464/igt@fbdev@eof.html> (Intel
>         XE#2134 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2134>) +1 other test skip
>   *
> 
>     igt@kms_atomic@plane-invalid-params-fence:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-466/
>         igt@kms_atomic@plane-invalid-params-fence.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-
>         dg2-436/igt@kms_atomic@plane-invalid-params-fence.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) +53 other tests skip
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-436/igt@kms_big_fb@4-
>         tiled-max-hw-stride-64bpp-rotate-0.html> (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) +10 other tests skip
>   *
> 
>     igt@kms_big_fb@x-tiled-64bpp-rotate-270:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-435/igt@kms_big_fb@x-
>         tiled-64bpp-rotate-270.html> (Intel XE#316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>   *
> 
>     igt@kms_big_fb@x-tiled-64bpp-rotate-90:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-bmg-2/igt@kms_big_fb@x-
>         tiled-64bpp-rotate-90.html> (Intel XE#2327 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2327>)
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-466/igt@kms_big_fb@y-
>         tiled-max-hw-stride-32bpp-rotate-0.html> (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +10
>         other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-bmg-2/igt@kms_big_fb@yf-
>         tiled-32bpp-rotate-270.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +2 other
>         tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-addfb-size-overflow:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-435/igt@kms_big_fb@yf-
>         tiled-addfb-size-overflow.html> (Intel XE#610 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/610>)
>   *
> 
>     igt@kms_bw@linear-tiling-1-displays-1920x1080p:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-435/igt@kms_bw@linear-
>         tiling-1-displays-1920x1080p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +1 other test skip
>   *
> 
>     igt@kms_bw@linear-tiling-3-displays-3840x2160p:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-bmg-2/igt@kms_bw@linear-tiling-3-
>         displays-3840x2160p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-435/igt@kms_ccs@bad-
>         rotation-90-4-tiled-bmg-ccs.html> (Intel XE#2907 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2907>) +2 other
>         tests skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-lnl-1/igt@kms_ccs@bad-
>         rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1.html> (Intel XE#2669
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669>) +3
>         other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-434/igt@kms_ccs@crc-
>         primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html> (Intel
>         XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) +188 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-bmg-2/igt@kms_ccs@crc-primary-
>         basic-y-tiled-ccs.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +2 other
>         tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
> 
>       o shard-bmg: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-bmg-6/igt@kms_ccs@crc-
>         primary-suspend-4-tiled-bmg-ccs.html> (Intel XE#3862 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3862>) +1 other test
>         incomplete
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-bmg-7/igt@kms_ccs@crc-primary-
>         suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html> (Intel XE#2652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652> /
>         Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) +3 other tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-dg2-434/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-
>         dp-4.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1727> / Intel XE#3113 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3113> / Intel
>         XE#4212 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4212> / Intel XE#4522 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4522>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-dg2-463/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html>
>         (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727> / Intel XE#2705 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2705> / Intel XE#3113 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3113> / Intel
>         XE#4212 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4212> / Intel XE#4522 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4522>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-dp-2:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-432/igt@kms_ccs@random-
>         ccs-data-4-tiled-mtl-mc-ccs@pipe-d-dp-2.html> (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) +30 other tests skip
>   *
> 
>     igt@kms_cdclk@mode-transition-all-outputs:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-bmg-2/igt@kms_cdclk@mode-
>         transition-all-outputs.html> (Intel XE#2724 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2724>)
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-466/igt@kms_cdclk@mode-
>         transition-all-outputs.html> (Intel XE#4418 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4418>)
>   *
> 
>     igt@kms_chamelium_color@degamma:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-bmg-6/
>         igt@kms_chamelium_color@degamma.html> (Intel XE#2325 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2325>) +1 other test
>         skip
>   *
> 
>     igt@kms_chamelium_color@gamma:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-466/
>         igt@kms_chamelium_color@gamma.html> (Intel XE#306 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +1 other test skip
>   *
> 
>     igt@kms_chamelium_frames@vga-frame-dump:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-bmg-6/
>         igt@kms_chamelium_frames@vga-frame-dump.html> (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +2
>         other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@hdmi-hpd:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-466/
>         igt@kms_chamelium_hpd@hdmi-hpd.html> (Intel XE#373 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +6 other tests
>         skip
>   *
> 
>     igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-bmg-2/
>         igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html> (Intel
>         XE#1178 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1178>) +1 other test fail
>   *
> 
>     igt@kms_content_protection@lic-type-0:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-466/
>         igt@kms_content_protection@lic-type-0.html> (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) +4
>         other tests fail
>   *
> 
>     igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-466/
>         igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html> (Intel
>         XE#3304 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304>)
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-128x42:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-bmg-6/igt@kms_cursor_crc@cursor-
>         offscreen-128x42.html> (Intel XE#2320 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) +2 other
>         tests skip
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-256x85:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-lnl-1/igt@kms_cursor_crc@cursor-
>         sliding-256x85.html> (Intel XE#1424 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1424>) +1 other test
>         skip
>   *
> 
>     igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-3/
>         igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-
>         bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html>
>         (Intel XE#2291 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2291>) +1 other test skip
>   *
> 
>     igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-bmg-6/igt@kms_cursor_legacy@2x-
>         flip-vs-cursor-legacy.html> (Intel XE#2291 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2291>)
>   *
> 
>     igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-bmg-2/igt@kms_dirtyfb@drrs-
>         dirtyfb-ioctl.html> (Intel XE#1508 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1508>)
>   *
> 
>     igt@kms_dp_link_training@non-uhbr-mst:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-435/
>         igt@kms_dp_link_training@non-uhbr-mst.html> (Intel XE#4354
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354>)
>   *
> 
>     igt@kms_dsc@dsc-basic:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-bmg-2/igt@kms_dsc@dsc-basic.html>
>         (Intel XE#2244 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2244>) +1 other test skip
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-434/igt@kms_flip@2x-flip-
>         vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html> (Intel
>         XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/301> / Intel XE#3321 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3321>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-modeset-vs-hang:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-3/
>         igt@kms_flip@2x-flip-vs-modeset-vs-hang.html> -> SKIP <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-bmg-6/
>         igt@kms_flip@2x-flip-vs-modeset-vs-hang.html> (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) +1
>         other test skip
>   *
> 
>     igt@kms_flip@2x-flip-vs-panning-vs-hang:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-lnl-1/igt@kms_flip@2x-flip-vs-
>         panning-vs-hang.html> (Intel XE#1421 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1421>)
>   *
> 
>     igt@kms_flip@2x-plain-flip-ts-check@ab-dp2-hdmi-a3:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-bmg-4/igt@kms_flip@2x-plain-flip-
>         ts-check@ab-dp2-hdmi-a3.html> (Intel XE#5432 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5432>)
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank@a-edp1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-lnl-5/
>         igt@kms_flip@flip-vs-expired-vblank@a-edp1.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-
>         lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html> (Intel
>         XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/301>) +1 other test fail
>   *
> 
>     igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-adlp-2/
>         igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html> ->
>         DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-150488v7/shard-adlp-2/igt@kms_flip@flip-vs-rmfb-
>         interruptible@b-hdmi-a1.html> (Intel XE#4543 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4543>) +2 other
>         tests dmesg-warn
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-adlp-3/
>         igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-
>         y.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150488v7/shard-adlp-6/igt@kms_flip_tiling@flip-change-
>         tiling@pipe-b-hdmi-a-1-y-to-y.html> (Intel XE#4543 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4543>)
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-adlp-3/
>         igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-
>         y.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-150488v7/shard-adlp-6/igt@kms_flip_tiling@flip-change-
>         tiling@pipe-d-hdmi-a-1-x-to-y.html> (Intel XE#1874 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1874>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-435/
>         igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-
>         blt.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/651>) +19 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-
>         render.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2311>) +6 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-lnl-1/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-
>         blt.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/656>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-466/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-
>         fullscreen.html> -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-dg2-436/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-
>         fullscreen.html> (Intel XE#2351 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2351> / Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +4 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-
>         mmap-wc.html> (Intel XE#5390 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/5390>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-lnl-1/
>         igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-
>         mmap-wc.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/651>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) +3 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-
>         render.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2313>) +5 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-466/
>         igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html> (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +19
>         other tests skip
>   *
> 
>     igt@kms_joiner@basic-force-ultra-joiner:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-bmg-2/igt@kms_joiner@basic-force-
>         ultra-joiner.html> (Intel XE#2934 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2934>)
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-466/igt@kms_joiner@basic-
>         force-ultra-joiner.html> (Intel XE#2925 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2925>)
>   *
> 
>     igt@kms_joiner@basic-max-non-joiner:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-435/igt@kms_joiner@basic-
>         max-non-joiner.html> (Intel XE#4298 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4298>)
>   *
> 
>     igt@kms_joiner@basic-ultra-joiner:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-466/igt@kms_joiner@basic-
>         ultra-joiner.html> (Intel XE#2927 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2927>)
>   *
> 
>     igt@kms_lease@invalid-create-leases:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-436/
>         igt@kms_lease@invalid-create-leases.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/2575>) +25 other tests skip
>   *
> 
>     igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-435/
>         igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html>
>         (Intel XE#616 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/616>) +1 other test fail
>   *
> 
>     igt@kms_plane_lowres@tiling-y:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-bmg-2/igt@kms_plane_lowres@tiling-
>         y.html> (Intel XE#2393 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2393>)
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-
>         overlay-plane-update-sf-dmg-area.html> (Intel XE#1489 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +1 other test
>         skip
>   *
> 
>     igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-434/igt@kms_psr2_sf@psr2-
>         overlay-primary-update-sf-dmg-area.html> (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +6
>         other tests skip
>   *
> 
>     igt@kms_psr@fbc-psr2-basic:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-bmg-6/igt@kms_psr@fbc-psr2-
>         basic.html> (Intel XE#2234 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2234> / Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +4 other
>         tests skip
>   *
> 
>     igt@kms_psr@fbc-psr2-sprite-plane-onoff:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-466/igt@kms_psr@fbc-psr2-
>         sprite-plane-onoff.html> (Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +10
>         other tests skip
>   *
> 
>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-435/
>         igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>         (Intel XE#2939 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2939>)
>   *
> 
>     igt@kms_rotation_crc@bad-tiling:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-466/
>         igt@kms_rotation_crc@bad-tiling.html> (Intel XE#3414 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3414>) +2 other
>         tests skip
>   *
> 
>     igt@kms_rotation_crc@primary-rotation-270:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-bmg-2/
>         igt@kms_rotation_crc@primary-rotation-270.html> (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414> /
>         Intel XE#3904 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3904>) +1 other test skip
>   *
> 
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-435/
>         igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html> (Intel
>         XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>)
>   *
> 
>     igt@kms_scaling_modes@scaling-mode-center:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-bmg-6/
>         igt@kms_scaling_modes@scaling-mode-center.html> (Intel XE#2413
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413>)
>   *
> 
>     igt@kms_setmode@invalid-clone-single-crtc:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-4/
>         igt@kms_setmode@invalid-clone-single-crtc.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-
>         bmg-5/igt@kms_setmode@invalid-clone-single-crtc.html> (Intel
>         XE#1435 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435>)
>   *
> 
>     igt@kms_vblank@ts-continuation-suspend:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-adlp-6/
>         igt@kms_vblank@ts-continuation-suspend.html> -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-
>         adlp-1/igt@kms_vblank@ts-continuation-suspend.html> (Intel
>         XE#2953 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2953> / Intel XE#4173 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4173>) +14 other tests dmesg-warn
>   *
> 
>     igt@xe_compute_preempt@compute-preempt-many-all-ram@engine-
>     drm_xe_engine_class_compute:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-466/
>         igt@xe_compute_preempt@compute-preempt-many-all-ram@engine-
>         drm_xe_engine_class_compute.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +16 other
>         tests skip
>   *
> 
>     igt@xe_copy_basic@mem-set-linear-0xfd:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-435/
>         igt@xe_copy_basic@mem-set-linear-0xfd.html> (Intel XE#1126
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126>)
>   *
> 
>     igt@xe_eu_stall@non-blocking-read:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-466/igt@xe_eu_stall@non-
>         blocking-read.html> (Intel XE#5419 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5419>)
>   *
> 
>     igt@xe_eudebug@basic-vm-access-parameters:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-466/igt@xe_eudebug@basic-
>         vm-access-parameters.html> (Intel XE#4837 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +9 other
>         tests skip
>   *
> 
>     igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-bmg-6/
>         igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-
>         vram.html> (Intel XE#4837 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4837>) +3 other tests skip
>   *
> 
>     igt@xe_exec_balancer@twice-virtual-basic:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-436/
>         igt@xe_exec_balancer@twice-virtual-basic.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +125
>         other tests skip
>   *
> 
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-bmg-2/igt@xe_exec_basic@multigpu-
>         many-execqueues-many-vm-bindexecqueue-rebind.html> (Intel
>         XE#2322 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2322>) +1 other test skip
>   *
> 
>     igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-463/
>         igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html>
>         -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-150488v7/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-
>         userptr-invalidate-race.html> (Intel XE#1392 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +2 other
>         tests skip
>   *
> 
>     igt@xe_exec_fault_mode@once-invalid-userptr-fault:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-435/
>         igt@xe_exec_fault_mode@once-invalid-userptr-fault.html> (Intel
>         XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/288>) +16 other tests skip
>   *
> 
>     igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-466/
>         igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html> (Intel
>         XE#2360 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360>)
>   *
> 
>     igt@xe_exec_reset@parallel-gt-reset:
> 
>       o shard-bmg: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-bmg-6/
>         igt@xe_exec_reset@parallel-gt-reset.html> (Intel XE#3876
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876>)
>   *
> 
>     igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-bmg-2/
>         igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-
>         huge.html> (Intel XE#4943 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4943>) +5 other tests skip
>   *
> 
>     igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-lnl-1/
>         igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-
>         huge.html> (Intel XE#4943 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4943>)
>   *
> 
>     igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-
>     mlock-nomemset:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-466/
>         igt@xe_exec_system_allocator@threads-many-large-execqueues-
>         malloc-mlock-nomemset.html> (Intel XE#4915 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4915>) +174 other
>         tests skip
>   *
> 
>     igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-
>     map-nomemset:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-lnl-4/
>         igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-
>         bo-map-nomemset.html> -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-lnl-2/
>         igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-
>         bo-map-nomemset.html> (Intel XE#5018 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5018>)
>   *
> 
>     igt@xe_huc_copy@huc_copy:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-466/
>         igt@xe_huc_copy@huc_copy.html> (Intel XE#255 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/255>)
>   *
> 
>     igt@xe_live_ktest@xe_bo:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-466/
>         igt@xe_live_ktest@xe_bo.html> -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-dg2-436/
>         igt@xe_live_ktest@xe_bo.html> (Intel XE#2229 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2229> / Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
>         other test skip
>   *
> 
>     igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-466/
>         igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-
>         dg2-436/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html>
>         (Intel XE#2229 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2229>)
>   *
> 
>     igt@xe_oa@invalid-oa-metric-set-id:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-435/igt@xe_oa@invalid-oa-
>         metric-set-id.html> (Intel XE#2541 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2541> / Intel
>         XE#3573 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3573>) +2 other tests skip
>   *
> 
>     igt@xe_oa@syncs-ufence-wait:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-435/igt@xe_oa@syncs-
>         ufence-wait.html> (Intel XE#2541 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2541> / Intel
>         XE#3573 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3573> / Intel XE#4501 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4501>)
>   *
> 
>     igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-434/
>         igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html>
>         (Intel XE#1173 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1173>)
>   *
> 
>     igt@xe_pm@s2idle-exec-after:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-466/
>         igt@xe_pm@s2idle-exec-after.html> -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-dg2-436/
>         igt@xe_pm@s2idle-exec-after.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +112 other
>         tests skip
>   *
> 
>     igt@xe_pm@vram-d3cold-threshold:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-466/igt@xe_pm@vram-
>         d3cold-threshold.html> (Intel XE#579 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/579>)
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-bmg-2/igt@xe_pm@vram-d3cold-
>         threshold.html> (Intel XE#579 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/579>)
>   *
> 
>     igt@xe_pmu@all-fn-engine-activity-load:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-435/igt@xe_pmu@all-fn-
>         engine-activity-load.html> (Intel XE#4650 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4650>)
>   *
> 
>     igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-466/igt@xe_pxp@pxp-stale-
>         bo-bind-post-rpm.html> (Intel XE#4733 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4733>) +1 other test
>         skip
>   *
> 
>     igt@xe_query@multigpu-query-hwconfig:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-bmg-2/igt@xe_query@multigpu-query-
>         hwconfig.html> (Intel XE#944 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/944>)
>   *
> 
>     igt@xe_query@multigpu-query-mem-usage:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-435/
>         igt@xe_query@multigpu-query-mem-usage.html> (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +2
>         other tests skip
>   *
> 
>     igt@xe_render_copy@render-stress-4-copies:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-435/
>         igt@xe_render_copy@render-stress-4-copies.html> (Intel XE#4814
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814>)
>   *
> 
>     igt@xe_sriov_flr@flr-vf1-clear:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-466/igt@xe_sriov_flr@flr-
>         vf1-clear.html> (Intel XE#3342 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3342>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@fbdev@write:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/
>         igt@fbdev@write.html> (Intel XE#2134 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2134>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-
>         dg2-433/igt@fbdev@write.html>
>   *
> 
>     igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/
>         igt@kms_atomic_transition@modeset-transition-nonblocking-
>         fencing.html> (Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208> / i915#2575 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-
>         dg2-463/igt@kms_atomic_transition@modeset-transition-
>         nonblocking-fencing.html> +60 other tests pass
>   *
> 
>     igt@kms_atomic_transition@plane-toggle-modeset-transition:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-adlp-1/
>         igt@kms_atomic_transition@plane-toggle-modeset-transition.html>
>         (Intel XE#3908 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3908>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150488v7/shard-adlp-8/igt@kms_atomic_transition@plane-
>         toggle-modeset-transition.html> +1 other test pass
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-
>         dg2-434/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-
>         hflip.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-150488v7/shard-dg2-435/igt@kms_big_fb@x-tiled-max-hw-
>         stride-32bpp-rotate-0-hflip.html>
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
> 
>       o shard-adlp: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-
>         adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-
>         async-flip.html> (Intel XE#4543 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4543>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-adlp-8/
>         igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html>
>   *
> 
>     igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-5/
>         igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html>
>         (Intel XE#2314 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2314> / Intel XE#2894 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2894>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-bmg-4/
>         igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html>
>         +1 other test pass
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-
>         dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-
>         d-dp-4.html> (Intel XE#3862 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3862>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-435/igt@kms_ccs@crc-
>         primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html> +1 other
>         test pass
>   *
> 
>     igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-
>         adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html>
>         (Intel XE#2953 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2953> / Intel XE#4173 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4173>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-adlp-4/
>         igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html> +1 other
>         test pass
>   *
> 
>     igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-5/
>         igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html> (Intel
>         XE#2291 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2291>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150488v7/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-
>         cursor-atomic.html> +4 other tests pass
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipa-varying-size:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-7/
>         igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html> ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/
>         shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipa-varying-
>         size.html>
>   *
> 
>     igt@kms_dp_link_training@non-uhbr-sst:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-5/
>         igt@kms_dp_link_training@non-uhbr-sst.html> (Intel XE#4354
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/
>         shard-bmg-4/igt@kms_dp_link_training@non-uhbr-sst.html>
>   *
> 
>     igt@kms_dp_linktrain_fallback@dp-fallback:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-5/
>         igt@kms_dp_linktrain_fallback@dp-fallback.html> (Intel XE#4294
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/
>         shard-bmg-7/igt@kms_dp_linktrain_fallback@dp-fallback.html>
>   *
> 
>     igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@bc-dp2-
>     hdmi-a3:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-1/
>         igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@bc-
>         dp2-hdmi-a3.html> (Intel XE#5352 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5352>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-
>         bmg-1/igt@kms_flip@2x-blocking-absolute-wf_vblank-
>         interruptible@bc-dp2-hdmi-a3.html> +1 other test pass
>   *
> 
>     igt@kms_flip@2x-plain-flip-fb-recreate:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-5/
>         igt@kms_flip@2x-plain-flip-fb-recreate.html> (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/
>         shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html> +8
>         other tests pass
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-lnl-2/
>         igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html>
>         (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/301>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-150488v7/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-
>         interruptible@b-edp1.html> +1 other test pass
>   *
> 
>     igt@kms_flip@flip-vs-suspend:
> 
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-4/
>         igt@kms_flip@flip-vs-suspend.html> (Intel XE#2049 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2049> / Intel
>         XE#2597 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2597>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150488v7/shard-bmg-2/igt@kms_flip@flip-vs-suspend.html>
>         +1 other test pass
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-
>         move.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2351> / Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-
>         dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-
>         move.html> +6 other tests pass
>   *
> 
>     igt@kms_hdr@invalid-hdr:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-433/
>         igt@kms_hdr@invalid-hdr.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-
>         dg2-463/igt@kms_hdr@invalid-hdr.html>
>   *
> 
>     igt@kms_plane_multiple@2x-tiling-4:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-6/
>         igt@kms_plane_multiple@2x-tiling-4.html> (Intel XE#4596
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/
>         shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4.html>
>   *
> 
>     igt@kms_plane_scaling@2x-scaler-multi-pipe:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-5/
>         igt@kms_plane_scaling@2x-scaler-multi-pipe.html> (Intel XE#2571
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/
>         shard-bmg-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html>
>   *
> 
>     igt@kms_setmode@basic:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-7/
>         igt@kms_setmode@basic.html> (Intel XE#2883 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2883>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-
>         bmg-2/igt@kms_setmode@basic.html> +4 other tests pass
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-adlp-8/
>         igt@kms_setmode@basic.html> (Intel XE#2883 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2883>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-
>         adlp-3/igt@kms_setmode@basic.html> +1 other test pass
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-lnl-5/
>         igt@kms_setmode@basic.html> (Intel XE#2883 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2883>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-
>         lnl-5/igt@kms_setmode@basic.html> +1 other test pass
>   *
> 
>     igt@kms_setmode@invalid-clone-single-crtc-stealing:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-6/
>         igt@kms_setmode@invalid-clone-single-crtc-stealing.html> (Intel
>         XE#1435 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1435>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150488v7/shard-bmg-4/igt@kms_setmode@invalid-clone-
>         single-crtc-stealing.html>
>   *
> 
>     igt@xe_exec_balancer@once-parallel-rebind:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/
>         igt@xe_exec_balancer@once-parallel-rebind.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/
>         shard-dg2-433/igt@xe_exec_balancer@once-parallel-rebind.html>
>         +123 other tests pass
>   *
> 
>     igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-432/
>         igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html> (Intel
>         XE#1392 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1392>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150488v7/shard-dg2-464/igt@xe_exec_basic@multigpu-once-
>         basic-defer-mmap.html> +4 other tests pass
>   *
> 
>     igt@xe_exec_system_allocator@threads-shared-vm-many-large-
>     execqueues-new-bo-map-nomemset:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-lnl-3/
>         igt@xe_exec_system_allocator@threads-shared-vm-many-large-
>         execqueues-new-bo-map-nomemset.html> (Intel XE#4937 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4937>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-
>         lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-
>         execqueues-new-bo-map-nomemset.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/
>         igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html> (Intel
>         XE#623 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/623>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-150488v7/shard-dg2-464/igt@kms_addfb_basic@addfb25-y-
>         tiled-small-legacy.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_async_flips@invalid-async-flip-atomic:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-466/
>         igt@kms_async_flips@invalid-async-flip-atomic.html> (Intel
>         XE#3768 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3768>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150488v7/shard-dg2-436/igt@kms_async_flips@invalid-
>         async-flip-atomic.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_big_fb@4-tiled-32bpp-rotate-270:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-466/
>         igt@kms_big_fb@4-tiled-32bpp-rotate-270.html> (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/
>         shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) +2 other tests skip
>   *
> 
>     igt@kms_big_fb@x-tiled-16bpp-rotate-90:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/
>         igt@kms_big_fb@x-tiled-16bpp-rotate-90.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/
>         shard-dg2-463/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html>
>         (Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/316>)
>   *
> 
>     igt@kms_big_fb@x-tiled-8bpp-rotate-90:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/
>         igt@kms_big_fb@x-tiled-8bpp-rotate-90.html> (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/
>         shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html> (Intel
>         XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2351> / Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@kms_big_fb@y-tiled-addfb-size-overflow:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-466/
>         igt@kms_big_fb@y-tiled-addfb-size-overflow.html> (Intel XE#610
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/610>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/
>         shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-overflow.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>)
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-466/
>         igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-
>         flip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1124>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-436/igt@kms_big_fb@y-
>         tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html> (Intel
>         XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2351> / Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>) +3 other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/
>         igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/
>         shard-dg2-463/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html>
>         (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1124>) +3 other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/
>         igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html> (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150488v7/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-
>         rotate-0.html> (Intel XE#1124 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1124>) +2 other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-addfb:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/
>         igt@kms_big_fb@yf-tiled-addfb.html> (Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150488v7/shard-dg2-434/igt@kms_big_fb@yf-tiled-
>         addfb.html> (Intel XE#619 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/619>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-466/
>         igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html> (Intel
>         XE#607 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/607>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-150488v7/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-
>         offset-overflow.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-466/
>         igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-
>         flip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1124>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-436/igt@kms_big_fb@yf-
>         tiled-max-hw-stride-32bpp-rotate-0-async-flip.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-466/
>         igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html>
>         (Intel XE#2191 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2191>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150488v7/shard-dg2-436/igt@kms_bw@connected-linear-
>         tiling-4-displays-1920x1080p.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/
>         igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-dg2-434/
>         igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html>
>         (Intel XE#2191 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2191>) +1 other test skip
>   *
> 
>     igt@kms_bw@linear-tiling-1-displays-3840x2160p:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/
>         igt@kms_bw@linear-tiling-1-displays-3840x2160p.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-dg2-463/
>         igt@kms_bw@linear-tiling-1-displays-3840x2160p.html> (Intel
>         XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>   *
> 
>     igt@kms_bw@linear-tiling-3-displays-2560x1440p:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-466/
>         igt@kms_bw@linear-tiling-3-displays-2560x1440p.html> (Intel
>         XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/367>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-150488v7/shard-dg2-436/igt@kms_bw@linear-tiling-3-
>         displays-2560x1440p.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/
>         igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html> (Intel
>         XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2351> / Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-dg2-433/
>         igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html> (Intel
>         XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/787>) +3 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/
>         igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150488v7/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-
>         y-tiled-gen12-rc-ccs.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +6
>         other tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-dg2-463/igt@kms_ccs@random-ccs-
>         data-4-tiled-dg2-rc-ccs.html> (Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
>         XE#2705 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2705> / Intel XE#3113 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3113> / Intel XE#4212 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4212> / Intel
>         XE#4345 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4345> / Intel XE#4522 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4522>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-dg2-434/igt@kms_ccs@random-ccs-
>         data-4-tiled-dg2-rc-ccs-cc.html> (Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
>         XE#3113 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3113> / Intel XE#4212 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4212> / Intel XE#4522 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4522>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-466/
>         igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html> (Intel
>         XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-436/igt@kms_ccs@random-
>         ccs-data-4-tiled-mtl-rc-ccs-cc.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +8 other
>         tests skip
>   *
> 
>     igt@kms_chamelium_color@ctm-blue-to-red:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-466/
>         igt@kms_chamelium_color@ctm-blue-to-red.html> (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/
>         shard-dg2-436/igt@kms_chamelium_color@ctm-blue-to-red.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_chamelium_edid@dp-edid-change-during-suspend:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/
>         igt@kms_chamelium_edid@dp-edid-change-during-suspend.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-dg2-463/
>         igt@kms_chamelium_edid@dp-edid-change-during-suspend.html>
>         (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/373>) +6 other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@dp-hpd-fast:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-466/
>         igt@kms_chamelium_hpd@dp-hpd-fast.html> (Intel XE#373 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/373>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-
>         dg2-436/igt@kms_chamelium_hpd@dp-hpd-fast.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/2575>) +4 other tests skip
>   *
> 
>     igt@kms_content_protection@legacy:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-8/
>         igt@kms_content_protection@legacy.html> (Intel XE#1178 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-
>         bmg-5/igt@kms_content_protection@legacy.html> (Intel XE#2341
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341>)
>   *
> 
>     igt@kms_cursor_crc@cursor-random-max-size:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/
>         igt@kms_cursor_crc@cursor-random-max-size.html> (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/
>         shard-dg2-464/igt@kms_cursor_crc@cursor-random-max-size.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) +5 other tests skip
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-512x512:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/
>         igt@kms_cursor_crc@cursor-rapid-movement-512x512.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-dg2-433/
>         igt@kms_cursor_crc@cursor-rapid-movement-512x512.html> (Intel
>         XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>)
>   *
> 
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-466/
>         igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-
>         transitions.html> (Intel XE#323 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/323>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-436/
>         igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-
>         transitions.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_dp_link_training@uhbr-mst:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/
>         igt@kms_dp_link_training@uhbr-mst.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-
>         dg2-433/igt@kms_dp_link_training@uhbr-mst.html> (Intel XE#4356
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356>)
>   *
> 
>     igt@kms_dsc@dsc-with-bpc:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-466/
>         igt@kms_dsc@dsc-with-bpc.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-
>         dg2-436/igt@kms_dsc@dsc-with-bpc.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +2 other
>         tests skip
>   *
> 
>     igt@kms_feature_discovery@chamelium:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-466/
>         igt@kms_feature_discovery@chamelium.html> (Intel XE#701
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/701>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/
>         shard-dg2-436/igt@kms_feature_discovery@chamelium.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_feature_discovery@display-4x:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/
>         igt@kms_feature_discovery@display-4x.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/2575>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150488v7/shard-dg2-433/
>         igt@kms_feature_discovery@display-4x.html> (Intel XE#1138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/
>         igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) -> FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-dg2-434/
>         igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html>
>         (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/301>)
>   *
> 
>     igt@kms_flip@2x-plain-flip-ts-check:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-6/
>         igt@kms_flip@2x-plain-flip-ts-check.html> (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) ->
>         FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/
>         shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check.html> (Intel
>         XE#5432 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5432>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-466/
>         igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-
>         downscaling.html> (Intel XE#455 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-436/
>         igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-
>         downscaling.html> (Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:
> 
>       o shard-adlp: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-
>         adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-
>         to-x.html> (Intel XE#4543 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4543>) -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-adlp-6/
>         igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-
>         x.html> (Intel XE#1874 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1874>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/
>         igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-
>         onoff.html> (Intel XE#4208 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-434/
>         igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-
>         onoff.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/651>) +16 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-466/
>         igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-
>         onoff.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/651>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-436/
>         igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-
>         onoff.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2351> / Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +6 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-5/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-bmg-4/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-
>         blt.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2311>) +19 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-466/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-
>         blt.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/651>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-dg2-436/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-
>         blt.html> (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/4208>) +10 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/
>         igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-
>         render.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2351> / Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-
>         dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-
>         draw-render.html> (Intel XE#651 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/651>) +3 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-4/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-
>         render.html> (Intel XE#5390 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/5390>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-bmg-5/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-
>         render.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2312>) +5 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-5/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-
>         onoff.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2312>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-bmg-4/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-
>         onoff.html> (Intel XE#5390 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/5390>) +8 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-tiling-y:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/
>         igt@kms_frontbuffer_tracking@fbc-tiling-y.html> (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150488v7/shard-dg2-433/
>         igt@kms_frontbuffer_tracking@fbc-tiling-y.html> (Intel XE#658
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-8/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-
>         blt.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2311>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-bmg-5/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) +13 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-466/
>         igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html> (Intel
>         XE#658 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/658>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-150488v7/shard-dg2-436/
>         igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html> (Intel
>         XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2351> / Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-466/
>         igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-
>         blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/653>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-dg2-436/
>         igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-
>         blt.html> (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/4208>) +11 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-4/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-
>         blt.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2313>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-bmg-5/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) +13 other tests skip
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-466/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-
>         blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/653>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-dg2-436/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-
>         blt.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2351> / Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +3 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v7/shard-bmg-4/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-
>         blt.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2313>) +19 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-
>         onoff.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2351> / Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-
>         dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-
>         indfb-onoff.html> (Intel XE#653 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/653>) +3 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-slowdraw:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/
>         igt@kms_frontbuffer_tracking@psr-slowdraw.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/
>         shard-dg2-434/igt@kms_frontbuffer_tracking@psr-slowdraw.html>
>         (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/653>) +14 other tests skip
>   *
> 
>     igt@kms_joiner@basic-big-joiner:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/
>         igt@kms_joiner@basic-big-joiner.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-
>         dg2-463/igt@kms_joiner@basic-big-joiner.html> (Intel XE#346
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/346>)
>   *
> 
>     igt@kms_plane_multiple@tiling-yf:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-466/
>         igt@kms_plane_multiple@tiling-yf.html> (Intel XE#5020 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5020>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-
>         dg2-436/igt@kms_plane_multiple@tiling-yf.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/2575>)
>   *
> 
>     igt@kms_pm_backlight@fade:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/
>         igt@kms_pm_backlight@fade.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-
>         dg2-434/igt@kms_pm_backlight@fade.html> (Intel XE#870 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>   *
> 
>     igt@kms_pm_dc@dc5-psr:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/
>         igt@kms_pm_dc@dc5-psr.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-
>         dg2-433/igt@kms_pm_dc@dc5-psr.html> (Intel XE#1129 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1129>)
>   *
> 
>     igt@kms_pm_dc@dc9-dpms:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-adlp-1/
>         igt@kms_pm_dc@dc9-dpms.html> (Intel XE#734 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/734>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-
>         adlp-8/igt@kms_pm_dc@dc9-dpms.html> (Intel XE#3325 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3325>)
>   *
> 
>     igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-466/
>         igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html>
>         (Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1489>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150488v7/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-overlay-
>         plane-move-continuous-sf.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +3 other
>         tests skip
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/
>         igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150488v7/shard-dg2-463/igt@kms_psr2_sf@fbc-psr2-cursor-
>         plane-move-continuous-sf.html> (Intel XE#1489 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +4 other
>         tests skip
>   *
> 
>     igt@kms_psr2_su@page_flip-nv12:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-466/
>         igt@kms_psr2_su@page_flip-nv12.html> (Intel XE#1122 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1122>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-
>         dg2-436/igt@kms_psr2_su@page_flip-nv12.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@kms_psr2_su@page_flip-p010:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/
>         igt@kms_psr2_su@page_flip-p010.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-
>         dg2-433/igt@kms_psr2_su@page_flip-p010.html> (Intel XE#1122
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122>) +1
>         other test skip
>   *
> 
>     igt@kms_psr@fbc-pr-no-drrs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/
>         igt@kms_psr@fbc-pr-no-drrs.html> (Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/
>         shard-dg2-464/igt@kms_psr@fbc-pr-no-drrs.html> (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) +2 other tests skip
>   *
> 
>     igt@kms_psr@fbc-psr2-primary-render:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/
>         igt@kms_psr@fbc-psr2-primary-render.html> (Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/929>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-150488v7/shard-dg2-464/igt@kms_psr@fbc-psr2-primary-
>         render.html> (Intel XE#4208 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4208>) +6 other tests skip
>   *
> 
>     igt@kms_psr@fbc-psr2-sprite-plane-move:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/
>         igt@kms_psr@fbc-psr2-sprite-plane-move.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/
>         shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html>
>         (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/929>) +7 other tests skip
>   *
> 
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/
>         igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-dg2-433/
>         igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html> (Intel
>         XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>)
>   *
> 
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-466/
>         igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html> (Intel
>         XE#3414 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3414>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150488v7/shard-dg2-436/igt@kms_rotation_crc@primary-y-
>         tiled-reflect-x-90.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +1 other test skip
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-466/
>         igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html> (Intel
>         XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1127>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150488v7/shard-dg2-436/igt@kms_rotation_crc@primary-yf-
>         tiled-reflect-x-0.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-466/
>         igt@kms_tiled_display@basic-test-pattern.html> (Intel XE#1729
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/
>         shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_vrr@cmrr:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-466/
>         igt@kms_vrr@cmrr.html> (Intel XE#2168 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2168>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-
>         dg2-436/igt@kms_vrr@cmrr.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_vrr@flipline:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/
>         igt@kms_vrr@flipline.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-150488v7/shard-dg2-434/igt@kms_vrr@flipline.html> (Intel
>         XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455>) +5 other tests skip
>   *
> 
>     igt@xe_copy_basic@mem-copy-linear-0xfd:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/
>         igt@xe_copy_basic@mem-copy-linear-0xfd.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/
>         shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfd.html>
>         (Intel XE#1123 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1123>)
>   *
> 
>     igt@xe_copy_basic@mem-copy-linear-0xfffe:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-466/
>         igt@xe_copy_basic@mem-copy-linear-0xfffe.html> (Intel XE#1123
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/
>         shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfffe.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>)
>   *
> 
>     igt@xe_create@multigpu-create-massive-size:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/
>         igt@xe_create@multigpu-create-massive-size.html> (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/
>         shard-dg2-464/igt@xe_create@multigpu-create-massive-size.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) +1 other test skip
>   *
> 
>     igt@xe_eu_stall@invalid-sampling-rate:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-466/
>         igt@xe_eu_stall@invalid-sampling-rate.html> (Intel XE#5419
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5419>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/
>         shard-dg2-436/igt@xe_eu_stall@invalid-sampling-rate.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@xe_eudebug_online@resume-dss:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/
>         igt@xe_eudebug_online@resume-dss.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-
>         dg2-434/igt@xe_eudebug_online@resume-dss.html> (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +7
>         other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@many-basic-prefetch:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-466/
>         igt@xe_exec_fault_mode@many-basic-prefetch.html> (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/
>         shard-dg2-436/igt@xe_exec_fault_mode@many-basic-prefetch.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) +11 other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-prefetch:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/
>         igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-
>         prefetch.html> (Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-dg2-463/
>         igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-
>         prefetch.html> (Intel XE#288 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/288>) +14 other tests skip
>   *
> 
>     igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/
>         igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html> (Intel
>         XE#2360 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2360>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150488v7/shard-dg2-464/igt@xe_exec_mix_modes@exec-
>         simple-batch-store-lr.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@xe_exec_sip_eudebug@breakpoint-writesip-twice:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-466/
>         igt@xe_exec_sip_eudebug@breakpoint-writesip-twice.html> (Intel
>         XE#4837 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4837>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150488v7/shard-dg2-436/
>         igt@xe_exec_sip_eudebug@breakpoint-writesip-twice.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) +6 other tests skip
>   *
> 
>     igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-
>     dontunmap-eocheck:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/
>         igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-
>         dontunmap-eocheck.html> (Intel XE#4915 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4915>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-
>         dg2-464/igt@xe_exec_system_allocator@threads-many-execqueues-
>         mmap-remap-dontunmap-eocheck.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +153 other
>         tests skip
>   *
> 
>     igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-
>     nomemset:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/
>         igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-
>         nomemset.html> (Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-dg2-434/
>         igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-
>         nomemset.html> (Intel XE#4915 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4915>) +155 other tests skip
>   *
> 
>     igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
> 
>       o shard-dg2-set2: ABORT <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-
>         dg2-433/igt@xe_fault_injection@probe-fail-guc-
>         xe_guc_ct_send_recv.html> (Intel XE#4917 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4917>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-
>         dg2-436/igt@xe_fault_injection@probe-fail-guc-
>         xe_guc_ct_send_recv.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@xe_oa@disabled-read-error:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/
>         igt@xe_oa@disabled-read-error.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-
>         dg2-463/igt@xe_oa@disabled-read-error.html> (Intel XE#2541
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541> /
>         Intel XE#3573 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3573>) +4 other tests skip
>   *
> 
>     igt@xe_oa@non-privileged-map-oa-buffer:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-466/
>         igt@xe_oa@non-privileged-map-oa-buffer.html> (Intel XE#2541
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541> /
>         Intel XE#3573 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3573>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150488v7/shard-dg2-436/igt@xe_oa@non-privileged-map-oa-
>         buffer.html> (Intel XE#4208 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4208>) +2 other tests skip
>   *
> 
>     igt@xe_oa@syncs-userptr-wait-cfg:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/
>         igt@xe_oa@syncs-userptr-wait-cfg.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-
>         dg2-433/igt@xe_oa@syncs-userptr-wait-cfg.html> (Intel XE#2541
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541> /
>         Intel XE#3573 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3573> / Intel XE#4501 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4501>) +1 other test skip
>   *
> 
>     igt@xe_pat@pat-index-xe2:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/
>         igt@xe_pat@pat-index-xe2.html> (Intel XE#977 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/977>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-
>         dg2-464/igt@xe_pat@pat-index-xe2.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@xe_peer2peer@read:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-466/
>         igt@xe_peer2peer@read.html> (Intel XE#1173 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1173>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-
>         dg2-436/igt@xe_peer2peer@read.html> (Intel XE#1061 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1061> / Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@xe_peer2peer@write:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/
>         igt@xe_peer2peer@write.html> (Intel XE#1061 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1061> / Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150488v7/shard-dg2-434/igt@xe_peer2peer@write.html>
>         (Intel XE#1173 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1173>)
>   *
> 
>     igt@xe_pm@d3cold-basic-exec:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-466/
>         igt@xe_pm@d3cold-basic-exec.html> (Intel XE#2284 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2284> / Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/
>         shard-dg2-436/igt@xe_pm@d3cold-basic-exec.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@xe_pxp@display-pxp-fb:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/
>         igt@xe_pxp@display-pxp-fb.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-
>         dg2-434/igt@xe_pxp@display-pxp-fb.html> (Intel XE#4733 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4733>) +1 other test
>         skip
>   *
> 
>     igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-466/
>         igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html> (Intel XE#4733
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/
>         shard-dg2-436/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>)
>   *
> 
>     igt@xe_query@multigpu-query-gt-list:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/
>         igt@xe_query@multigpu-query-gt-list.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/
>         shard-dg2-463/igt@xe_query@multigpu-query-gt-list.html> (Intel
>         XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>   *
> 
>     igt@xe_render_copy@render-stress-0-copies:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-466/
>         igt@xe_render_copy@render-stress-0-copies.html> (Intel XE#4814
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/
>         shard-dg2-436/igt@xe_render_copy@render-stress-0-copies.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>)
>   *
> 
>     igt@xe_spin_batch@spin-mem-copy:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/
>         igt@xe_spin_batch@spin-mem-copy.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/shard-
>         dg2-434/igt@xe_spin_batch@spin-mem-copy.html> (Intel XE#4821
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821>)
>   *
> 
>     igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-466/
>         igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-
>         numvfs.html> (Intel XE#4130 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4130>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v7/shard-dg2-436/
>         igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-
>         numvfs.html> (Intel XE#4208 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4208>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * Linux: xe-3367-02069d358330d2c30eb66590736f360964d88612 -> xe-
>     pw-150488v7
> 
> IGT_8445: 8445
> xe-3367-02069d358330d2c30eb66590736f360964d88612: 
> 02069d358330d2c30eb66590736f360964d88612
> xe-pw-150488v7: 150488v7
> 

