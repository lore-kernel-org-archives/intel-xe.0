Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0062C3ABDD
	for <intel-xe@archiver.kernel.org>; Fri, 16 May 2025 10:49:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7723B10E04B;
	Fri, 16 May 2025 10:49:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g3bh6vlE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F0010E04B
 for <intel-xe@lists.freedesktop.org>; Fri, 16 May 2025 10:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747392562; x=1778928562;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MO8xv7RmRxSl7PbNHNF+ch8zr2Bhz4oR9ougxcIS5UY=;
 b=g3bh6vlEP9/+8HZY/Pn7Ty/PTGpBGGb41mn2B/+RHvEJvuAHFGO9P2MY
 y1MKpZQQ6Hz2cwBdEMKsGIgNjY2ws3Fp4qlkykr3Qk/eUMJUepx50MksN
 Cy3Xtrc1vfvCF05SW30CS5RhQNaV6b5pq4R5dC0Bnp0GL315gw2FUueyU
 BtOy/Thkkd1PCNaXiIkgmEilElD6vuy6TgjZU9Bn4g3uk6Z/7nktASM/x
 Y2UG/xdHBLRQTwQ3n88SI0uwH0XCrNvfj+0sFRY0VWW16sNlPyTa/n0EJ
 oB1CZYgsH3R8bDaqDZPJ2wmFAF42QkxIqBDFYTS+Wwyil72QsVG0vscXz Q==;
X-CSE-ConnectionGUID: rX9ghiRKSV2QgbPkbF4Kog==
X-CSE-MsgGUID: JCn1pLv/S+yYyQK7UZ4x0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="66763388"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="66763388"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 03:49:19 -0700
X-CSE-ConnectionGUID: UDuJvjOQQGe1/f629ZEQyA==
X-CSE-MsgGUID: IjyOGjTXSBKA09Bx5q/88Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="143547217"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 03:49:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 03:49:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 16 May 2025 03:49:18 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 16 May 2025 03:49:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GiIyuzlkoac+ZCMtFAN5L086ZFqiNq/I6pv7xv+fLXdsSdHmp+K3o9SkTZNbRyke3QFjhkQUO02yiQhTGH7xD0rXJeAjudsS5TEmYLTgIEiD/6SF61uiudjHf1fdpEoHwhMB29iMNx3bUNn2c/yV4PoRJ+VgbKjYWANURT/myKyQ0zKvIgM1eXxUF0VTVt3Cm3lCuWSeWSylOptLxfA8ClR+QZeUE+lYEMJfkpfYtFOThlj6iUegqQHQ6u+8N76YWzzK/1sOwdrsCQj9kZCwuqGYFIHq4n41YTIgEWnCwDUQvNrOClc4FG74/H3ZL17ZmPxbNEP0GF6HekEPCVT+Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DcKGw9Dd15wIIMpO3Xc8+vIFmWeXlkYMyIrgo6O/VEs=;
 b=GATYoclfskPWWJSPuDrzzPTVKwrHPGDJ+pVhnWdNos6iydeAHVxDs5Vy9Ty1wTXuA9KrasuRVWO6rsJPGMAd7mAMTG2MtVXFpFu2H57AZnhtzsIzTGhFkjS/Ufv6fudYQprrqZOj3sTcWN9IOGiHHPRUIPCLB9QH6gZBx9C5FND0UGxTcpCaGwl/w5PstgmNns1eZxeh+n4yMGZfjNPqWTara5kHQTJejtkSnV56SJ0VhIgrnttt64P6IVMZnCTI5OYXiyp6EiJDpz7gqOvUOxiRqf+aDue0Css9dEz5XNZwjs71sZLCJtuHjj6mpWxpGScWtiXh7NVPWVoVUyCkGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by IA4PR11MB9131.namprd11.prod.outlook.com (2603:10b6:208:55c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Fri, 16 May
 2025 10:49:10 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%3]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 10:49:10 +0000
Message-ID: <386712fa-f735-4533-b1f2-16e478d1f4e0@intel.com>
Date: Fri, 16 May 2025 16:19:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/mocs: Check if all domains awake
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <himal.prasad.ghimiray@intel.com>
References: <20250506142300.1865783-1-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20250506142300.1865783-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::19) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|IA4PR11MB9131:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a271dd4-2014-45cb-698d-08dd946749fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUROMkszcUpORnQ2elZNUG5LUWJhV0tHa3NYZlUwZGVHSWdCSk02blN3MTlZ?=
 =?utf-8?B?NGNHQXNwUmFYeHMxYUpyVVFPZGN2Q2kwL3MvdktNWmpqajdWSHd0eTVVb0dw?=
 =?utf-8?B?bWtpZytGZzVvUjJhK3NRTjZDS0lEYy9HYjZUSitIWFIrUk1OTzh1NkhubjZ1?=
 =?utf-8?B?dU56NGFjdERSaDdzaHlFRmlNbjRwYzhiOG9wN2tzTDFweDBmaDFmdWxoNm9m?=
 =?utf-8?B?TWQvdnROc0IwaHRmb1E4amtQc3JpZTk4VnlqR2p4MnhscnFkd1NQTEVmQ0Zm?=
 =?utf-8?B?Z3BYSDBLUHllQVhUTTFOUGp3U1BnMERvdUc0S1Y3a0pLUUxldDZXZnpaTkRG?=
 =?utf-8?B?VmYyWTV5c0NRVHZZaVFqM2tnb2N2TGJoN3BzQ0l4cnp2R1pSSHRNSnR0OW5N?=
 =?utf-8?B?Q1gvem5vRDE3R29vZjFUTmlTNVhsem9lamtvaDZPSnJlK1M5MStJMmd1NDZp?=
 =?utf-8?B?WHg2dHZHOFlFNnlXVEE2NlYwSy9VU0NJWjhEcUVnYm1MMTZRRTlGT2NKYkpi?=
 =?utf-8?B?Rjh2dGt0dHcxT3B6NXZVVVVMTHVwbENveTg4ZVdYMjhGNDNtUG1yZEdZQSta?=
 =?utf-8?B?U2ROZE9MbUxrRFdING5vTzZyV0xwaXBGSFFObTVrYzhudCtDQ3JJb2lpWkRz?=
 =?utf-8?B?U3UyN1hEQ1dYN1JlbG9DdGJ2TzR1N2JqaUVxdS9NNVJOSnZJNWRPQlVwNU8w?=
 =?utf-8?B?eUEvNnJUYmVWQllrQ0t5Wk9XWitqMTc5VFJIQzRHYXQwZm9iZkx0Q3BvYWdU?=
 =?utf-8?B?cjVJWkY0bDFFZmtmOXArckRWRktQc2l3VzBSQjdzcTJVcW9TQWdiODFXSUk3?=
 =?utf-8?B?WVhKaUI3c2xESWdKSElsSlRGN0syWGNhbWlNakFzSG83NVNPa0lSSEgxWG1j?=
 =?utf-8?B?VzdRNzR6Q0crZFQySS80bzdmQWNJVDgrQ2t2U0ZRNlB0d3pvd0JhYjVIb2VL?=
 =?utf-8?B?T3NwYnZCanRUTG82UEl6a0h1NTFEbG5KQ3FRSEpocE8yVnE3T3NFUk9ERTho?=
 =?utf-8?B?R2srZ0VMbHZCWUlwWjJKbkQwY2JIWG9EOXJXVGtyWGYzUEdqS3NQbWJnVnZz?=
 =?utf-8?B?MEY0dWN3RWUvS28zQU81QU9vc1Npb0E3cVgzOGkyenVtTHdHa0hxTkFidzNP?=
 =?utf-8?B?VHQvdDJGUlFONS9DNFh6WU1tQUN6bGZxQjVFd0RXR3RsT2NreEhsY1Q0bzlW?=
 =?utf-8?B?MTJZNHlvdTZsd0Zpb3dNMVdvcmpUa1RPTHlzMFFKQUR5Q1d6emZSZ09RYWVt?=
 =?utf-8?B?R3BEN3lZWEU5VldXYUs0bU5UWGRaUVlNN1JzZVorbTl1RHErM09KRzFoWWdX?=
 =?utf-8?B?QlVrQis3eVJGVTUwQXdjZUVsYkVkbFdKdEVpY2NHaEZZTWMrbUo3UHJIc2NZ?=
 =?utf-8?B?aE9FNEJ2Z052bUpXSDFuTXlsNWZjRG9BMmhnbFpiUjk2SjN1Zi9lM2t6c0xq?=
 =?utf-8?B?dG91NEpYNUlBMC9ZOVkrd09WNk0xQkRMdXFLUEpocXl5NVo1UUpvN3RVdGtX?=
 =?utf-8?B?TDJMMTlqQVVqRFdxWTFETzR4UFBhWXpyYXZZc1R5UXhKcUY4cDc4NFZ6WmVk?=
 =?utf-8?B?NHlJNkdKaTRPWkV4YXRmeG5MbnZOUVgvRXVpYXhTb01ZcmhlSUJzY3VTV0sx?=
 =?utf-8?B?Y1FNc3dVeVVkVk5lc1pSelVaYU5nQzk2dW8vRlZxckNFSTh6VytZMkxTd3pG?=
 =?utf-8?B?OHZVQnhTUVExRTE0V3lFaVgzU1JidFBucjdBUU9vRkZTWGkzZzNNcVFUMnF0?=
 =?utf-8?B?QlphbU5waFI2NlljK1BSSHRHbEgvTVE2N1VOOW53TjdqQklOUmw2UlhLVWlh?=
 =?utf-8?B?Snhpa1dFOExrNS9GM29hdE1YUGdUNURyQkRYODIzRUwxNWhjQUt1cmpteDMx?=
 =?utf-8?B?cmMxU1grbmFvL0RReEVxWEpLajNlOUlzZUpOMmdROEpJMWZnc2lUZWJMOWdG?=
 =?utf-8?Q?i0L8Pr1msxY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dS9OSHJzd3RNcFRNUnhic2pSRkNlTDRqcXdhcm0yOFpjSXZ2bjdKbjJWUitP?=
 =?utf-8?B?bzZwZG1YcGsvb2IyWVpzNTl3enpWcEtZOEpkalJEc2tEcmlOOU5IUHhtQXhh?=
 =?utf-8?B?N1Jvb1BRclVYWnBrY2M5bzVwOFAzWEQrS2h0VmdjejFIZVU3U1Jzd0VEUG1V?=
 =?utf-8?B?Mm1CUmlKakRGV3VWVmt2b0ZlOUhzaWtYT2pVVzJqNXREbERLaUljaUlHbitR?=
 =?utf-8?B?Qk1UaUZrL1N5dkZQbkZQclBlYndoNXRRUUpCODBoTkNtdTFxOVFYbVlWUnpQ?=
 =?utf-8?B?YWJDQ2NqZXVhOEZldmJ5NUhqY1ZCRG0wekFVaTZaRnFQa3kzWE90cnNzR0ZR?=
 =?utf-8?B?Q21mQk00SHFsYlB6b1JJaGlaMkh0VUpSZlJnYkxxZHlHVzQ2ZEMwck8rODcz?=
 =?utf-8?B?NXZLY0RXMjg2UFZ4aldJRXBzRWhha3BZUVloOFhmVWdCck82dUpaZitGMnZi?=
 =?utf-8?B?TUU0ZVpWaklsSVU5eU5yMXBkOVl5YjF2OXpvWEtxcE9SOFc3MXA5Vm9aS01K?=
 =?utf-8?B?MjdyMmlpWTZldzJQSXRGUGVKMXg1QjJVd3RNR2t4RGl2RmR6SnR4QzlCZU9P?=
 =?utf-8?B?Z1pOZ05jamNDSmdaeTlvVDY4V3AwVFpkVG1ISmx0dzBEQ1JsUTlQL1UzT1lD?=
 =?utf-8?B?K1VSMHBMVWJ1V1dIOFQ2ZHRGM0s0djhhRzZpeEVYTXFrYTdwMlJiVVZ3ckFu?=
 =?utf-8?B?T3NOU3BaWElSMkNMMFlXZ2I4b1djU1ZmSFd2T2lRWHNacUJrQVBvd0NubkNi?=
 =?utf-8?B?eUZSMXptb2FydEkzOGtlODducEZ2eStwZVZtd2Z4K0poQk1heURwdDZ0T2dJ?=
 =?utf-8?B?Y1VhWml5dFBTeHpiU2hKQUNPRDRtZVZtMFZRTlk2S3JWTmh3VHdOWHNGcmM5?=
 =?utf-8?B?eTl6WnVpSzRLaTVMSGlIczRUdENiaTdBVktpaHVNTG9ldG1aektvRFBUc1Br?=
 =?utf-8?B?SVJDRFppT24yR0gvbmd1NFh4SzFlWldxMUtJWU5aY3NJWFhwN2FnQmNrdUlV?=
 =?utf-8?B?OVRPTkRXUzRWdi9SUjkrZG9tYmJBYy8zZkZmTk53K1NWRHlIQ090ZllLREJL?=
 =?utf-8?B?Rk82ZzVlMmkvR1VyeUpJL3hnOHgwdXM1RUs5SEZVMUt1QVY3RjR4b1hKZGZN?=
 =?utf-8?B?c1h4UmllWlNWLzlidVUxWEtCVGFpbXBiamM3Skd4c2t3b05TV3RjSUdrcUpp?=
 =?utf-8?B?NEF3VExQVnMwdittaVlUNTRXczZUNGNqM2Vkbjd0N0V4ZXJ5ZGtpWmt1YnF2?=
 =?utf-8?B?VHBOdHlEK2VFRmcyWWhqSUUxcTN4SURabElTMlBzWFVrZzRPbkpnczVlRWJR?=
 =?utf-8?B?MWdPK2RqM0dIeE9QWWJpeVBrLzBOUHIvdmRZaXNiamxNc2UxZm1KcW9Ja24r?=
 =?utf-8?B?WUR4ZmhvQ2tMN0w2VzhNK1RCOVhYak9RT1RMTjhvTHNRNHVGWTJaemJRWm44?=
 =?utf-8?B?eGQ0L25XOUVESGw1SVBKajlxeGN5VEFiUmFPRUkwWC84UHhKdWFtc2Y5OXRw?=
 =?utf-8?B?RTI0WVcwNFc4aWg4QU42TkFQdVNXV29JODdvdEFXY2lSblUwZndDZTc1UG03?=
 =?utf-8?B?Y2dzUE9VeFpQcWxCU3E2ZTY2dnIvZktuNkVQV05URDdpdU1aRUtYZWw0ZVYw?=
 =?utf-8?B?UW9vRkZVWTUvT04zeklUOXBDWlRHeTl6eHZDWHpYMXpBZkZOUVpxU3A1VG1G?=
 =?utf-8?B?ZzlOYW5GZVBJcGgxZlpDeDVxV3FLSUVmTGFjU0hscGFXTyt1a1pyM1R4QWE1?=
 =?utf-8?B?NWpXVFRWejBzL21YSWMzSldkOW03YktQSWhhVUlHOHUwNUdYSW96aWdQMHd6?=
 =?utf-8?B?REdNQVJFd201RnByTURITUxiY2pkMklGWmtzcTQybjhIU2pQWUd0UU9KTU5P?=
 =?utf-8?B?bFVWWkZHS3B5NUdxZVZ0REdYL3RqNFB4MGk4SHJGYnhnZjNocThkeHFpTjdy?=
 =?utf-8?B?T3UxbnRMU2w0Q1g2cmNEVVhBN0hwWXNnUlJsRE5tZmRkVGN6TWFUT25OcFE3?=
 =?utf-8?B?d3o2TEU1RTVlSUx0S0t0QlpaWVRDZUFabjRKeTFLcGRrRnpETkNkYVk5NHNN?=
 =?utf-8?B?ekViQnpXa2xRd0NTelhUbU83MkRpS2Z5ZEVJSzhGMTh1VkFGUXBwRjhWT2xk?=
 =?utf-8?B?ck1pbWpMdDM0d25Hc0FWVnY0bUhNTXhiL3dmMEFUcTYwSGtCT3lqS1cxTGd2?=
 =?utf-8?B?SUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a271dd4-2014-45cb-698d-08dd946749fb
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 10:49:10.3738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tKNyy+c+O4bYN2rzroU627HL/YNWwyssx1vJfqlW7k7VRZcbUlFsTWTRhi0V9nTIMg99vAWR4HsTw+9LybSU+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9131
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


On 06-05-2025 19:53, Tejas Upadhyay wrote:
> Check if all domains are awake specially for
> LNCF regs
>
> Fixes: 1182bc74b39b ("drm/xe: Fix MOCS debugfs LNCF readout")
> Improvements-suggested-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_mocs.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index 31dade91a089..0c737413fcb6 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -775,22 +775,23 @@ void xe_mocs_init(struct xe_gt *gt)
>   void xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p)
>   {
>   	struct xe_device *xe = gt_to_xe(gt);
> +	enum xe_force_wake_domains domain;
>   	struct xe_mocs_info table;
>   	unsigned int fw_ref, flags;
>   
>   	flags = get_mocs_settings(xe, &table);
>   
> +	domain = flags & HAS_LNCF_MOCS ? XE_FORCEWAKE_ALL : XE_FW_GT;
>   	xe_pm_runtime_get_noresume(xe);
> -	fw_ref = xe_force_wake_get(gt_to_fw(gt),
> -				   flags & HAS_LNCF_MOCS ?
> -				   XE_FORCEWAKE_ALL : XE_FW_GT);
> -	if (!fw_ref)
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), domain);
> +
> +	if (!xe_force_wake_ref_has_domain(fw_ref, domain))
>   		goto err_fw;
>   
>   	table.ops->dump(&table, flags, gt, p);
>   
> -	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   err_fw:
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	xe_pm_runtime_put(xe);
>   }
>   
