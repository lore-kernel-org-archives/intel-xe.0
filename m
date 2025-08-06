Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E55C87FD1
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 06:55:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9CBE10E3AE;
	Wed,  6 Aug 2025 06:55:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lzqHs/wi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C84CA10E3AE
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Aug 2025 06:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754463312; x=1785999312;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HshzcekrceQFMUxejNNETXPPHMXvkNgdHslaR+ZPSNU=;
 b=lzqHs/wiW7XEYgmTYg5McLmcnA/WopYqHHYuqYK4rJRr8j9BD+GXz0ik
 JgPqzJhuL2sBll8UuzjhCnvrFz6jXlQP2BrOgcoiq6trOvaGYmtPkEZ0F
 WMPc5MZM2eX4nHAyfyZNYAt2UDXUmcZXDP/wOXbljrwJNvSeV1BGtG1QG
 JgWGzfXxRECQbbxYdjU2xo7ijR68Su3xEcyW5/Iehy3zAg7QudZpqcxYj
 y4NItH4SwuC7FghK2qeHWnsdi4asRde18CcUezcZda1tDD9jyK+jFuu3J
 njzTZQUOgIAxmgmoF8HYcxWYxKNnhGPU3Ar/QerSQBT4Nz821Y15Kr7Sj Q==;
X-CSE-ConnectionGUID: +cJpB4h0Ski0O/PsangqRQ==
X-CSE-MsgGUID: q9xuMcLhT/af+4vo9ZJRwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="68222509"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="68222509"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 23:55:12 -0700
X-CSE-ConnectionGUID: QEMMBN6XQmiD79Zs93on2Q==
X-CSE-MsgGUID: SNtqbQ3GRT+S0WdR8uEu3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="165035990"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 23:55:11 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 23:55:11 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 5 Aug 2025 23:55:11 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.53)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 23:55:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iO0xJ19UXN6hYmoX3viEOpwnaZit9RT9Emw27VZEJMroW2zzv7sijhNTpDE1zrpqOJglAvM6u9ybx5MvlH/W7H1aVMnfkGV96tmsem2gd6fqXTCLd6HvbKBe9OJyYDdk7pzUu+xia5aMBhikcFbyL9m5fj+NBihj4jhTH9u6l9oSyhMD9m3Enu0gObLl/1/K/GW7hHGShI5j3XJyf/6G6imW1/Be9f9AqqnQ/RzHcwqi1PPaFHdNWqv1k9PbHdhfy9wBU2DFUS8o4BLl6h3ZNueb3K3pwms2T9rRrEM4KeR2aVCdM4uVkD78rHMApatgnzS+06qNX4koPUEDed8K1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kABt1hwJn55mpKrIdBLQc9CZqJ+eCVbHU7QrIcLFhjY=;
 b=jyWLeaamYIK9g2H53Omeo6lDS090lKcEKm9o+QHBeJHLfmmL8gkLJhJK3Z1SlRboANb8BEmlzqjMc0fgiohBNwlWn0EUjrT+q/evAhru+X6Ynko3/PjmxmJuFOtQqNoZWyLtPy6XNsog8+HlRo0jELu/SfhP/u6s+7mkotC5n+LMTd7mZ0ZRHfbBiRHU/+uuXeB3vUd2fj6NtXwb9f5n1hOMu2NMqfZi0241I8LbayBg95BasMLsFQHiFVqHUgOAB6/BV3VcQrJX3AJ+rin6jJyC98ktMY4FXXedOG7qry3X4GJgXA/x+TPzzgO2t4cwu/80S4t8/a256xOjPDeV8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH3PPF67C992ECC.namprd11.prod.outlook.com
 (2603:10b6:518:1::d28) by PH7PR11MB6331.namprd11.prod.outlook.com
 (2603:10b6:510:1fd::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.22; Wed, 6 Aug
 2025 06:55:09 +0000
Received: from PH3PPF67C992ECC.namprd11.prod.outlook.com
 ([fe80::645:b7e6:c8e4:bce6]) by PH3PPF67C992ECC.namprd11.prod.outlook.com
 ([fe80::645:b7e6:c8e4:bce6%8]) with mapi id 15.20.8989.018; Wed, 6 Aug 2025
 06:55:09 +0000
Message-ID: <c16fe880-f8ba-4ded-892e-8b40e07e29f5@intel.com>
Date: Wed, 6 Aug 2025 12:25:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/xe: Disable compression on SVM
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.auld@intel.com>
References: <20250805220653.745400-1-matthew.brost@intel.com>
 <20250805220653.745400-2-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250805220653.745400-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0068.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::14) To PH3PPF67C992ECC.namprd11.prod.outlook.com
 (2603:10b6:518:1::d28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPF67C992ECC:EE_|PH7PR11MB6331:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b3f4206-8e1f-47ae-b804-08ddd4b62e91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Zm1UcW52TW5ycWpJVkc4VmJKdkRhbG5vTy90dFdJVXA1QnhxZnZQa1VUWXBa?=
 =?utf-8?B?eFBRZnR6U0VONVQvcmZYZ0lyREZOMG04Z1Q1SGxrdUR1UHJmVk55aU9qSHB6?=
 =?utf-8?B?NWpqY3E2MU1LL3BBdVpGMGZSTkxXQ3ZnQzFRWDI0eGR0M3l1RjlacnhCeW9J?=
 =?utf-8?B?MGVwRGhCbFkveG1TM0Jxc1BoVXdtZ2ZTbFlIY21ib0xqMUU4a1M0anEzZ1E3?=
 =?utf-8?B?SnpxZjJwSjNNaDhqYXNmcGNzenhJMmtaVmxNdFJJeWQ0UWJnbEpzOXBxYUVu?=
 =?utf-8?B?MGlKbCtXak1vaTI1LzlDZkhhU3NtYjBHY09LZ1hpVEcrUDkvWEhHTHZyR0Nk?=
 =?utf-8?B?Z3Z6KzBkRld6a1NyMGtLbkpua2w2eU1nSlJrc2hLZjZBdTVHd0lRTHM5T3pq?=
 =?utf-8?B?cGRxbHd2N0RZY3dyVEkxdjAxYTFTajJnTVlVRFdPcCt5YUo0Uk1DSmM5VVlG?=
 =?utf-8?B?RDRIakFvcS96dXVocDZpbmZjY012RDFrZVhibm5Ga0N3N1VOVzF5TmZ5LzFV?=
 =?utf-8?B?L0k5dUVLajhqdUVENlNmSGtEK0hraEp4UGMwcDhDVDFvMVY5RDhaWGt3ODhl?=
 =?utf-8?B?QkhINnF6OHlhbHRqemVMa1JqTncwWkpOWVdDU2hrWXFwa2dXZjhtV2hCUTlw?=
 =?utf-8?B?ek9iZHA5NndSVGhEVFZJSTBrMC9BdmNmTFo1eUh2V1RoNjZsR1VRMjVXV000?=
 =?utf-8?B?RXMwVGtJNzBMRElka1NERGJkTkZGWTBJSkFwcDl6b3ArMU1LL21LaDFiMk1p?=
 =?utf-8?B?VGhNN0tFaTlBSWl4S2g2R3BmR2Fsc0NEZ3VMUjFENDd1YzZycDAzTG1QRU84?=
 =?utf-8?B?b2pDcWczOUNUVkdSc0Z4b2tPRXVraVhyUFljbGdJSjdYN0dqSFJuVGN4cENU?=
 =?utf-8?B?WmxsMHVuVFdsYXlERkRLTGxLM2pkUDlyVDZCdW8zclFvem1aNHBTZjJWUHEr?=
 =?utf-8?B?UHBlbm5aUGh0U293YXpVZTNZc3czaWpMb0k1Y3l0bFMzbEZZUWNaaGgrSlFv?=
 =?utf-8?B?dE9mMlVJcVFraVN4aFEyUzkrT3h6T05FTnNlOTF6ZDgzejNQYUc1eGRPaGxX?=
 =?utf-8?B?a1ppSDF6QkNGUVB6ZGpzWVJ1dC8zR3lINlhHNzQyYld3a1ZpOXJueEpYdXlq?=
 =?utf-8?B?N2xhbDZ2MHI4R2J3dXltOVkyTlJZWWFXbUtGN2tjVWwrcEFBSFM0a2EzbWFk?=
 =?utf-8?B?WDJPa3FvbDA2czFoZ3ZzSjdVUFJ6bXVwVUhiVklEMnQ2QjZFYzBHbGx0anRZ?=
 =?utf-8?B?VG1WTjRvNENlZEdoNHFucGxpRjMwcEk3b3lrRWxnK2s1SGRSYUZ1SFllVThy?=
 =?utf-8?B?Z0hXdGEyQlA1OHVYZzZRNFJEbDFCS0YwajNBK0tVaVoxTHo5c3ZJWnpESGVu?=
 =?utf-8?B?VzVVUG1xbWdQZC91SHdHeFprcWxqWDdPdXp3YS85R1hGZTVDYTBVdzZaSWFn?=
 =?utf-8?B?STZiODZKbVBlaTBRRDdHbGltZ3M3L1dhSFBpTGhGRHZnQU1QbnR2cWhaVFhk?=
 =?utf-8?B?WUJIR3VrazI3VjZmSkU4NW56MHAwN1dJSEZ1SkVlMXhyRlBhRmo3b2lXeG93?=
 =?utf-8?B?alpGb2ZXZXlIdG9pT0ZNL2xxSHFYMjM3L1hEVnpyREZkd2Q3Ry9EekRsNXp4?=
 =?utf-8?B?SWR1Q3ozMGU5OVhRamI2WWZ3T0ZJVkxURnI3TXhhWWN6TDVKZUYwcGwzcDAz?=
 =?utf-8?B?UEtOeXBqd0FlZjNzQVB5TEJpbHlsMVJDQ3g1WS9RK01vWDFTenh0djRMVTNE?=
 =?utf-8?B?ZSthMEtpMExsSC9SQ2hjb0cxV2FuMDBSbFFGb0hZdDZlcEtFeEpZbXhwdjRq?=
 =?utf-8?B?NFVBQVNOMmhXeUxYQW0zRGN1azdVNmY0V0FicUpKNDF3QUwyWHo0UGtJbUVl?=
 =?utf-8?B?VHlsNFJxUTFMTURva3l1MDVuVXJPYUNYc0ZsN3g5cWJGdVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH3PPF67C992ECC.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUhiRkFURnAvRTN2UWpnNDArTnhidzhlVXBSTnRpM2s5VGpzYjRNaUNMaFNK?=
 =?utf-8?B?WFF3YW1vL2hVbXRadUdsSjZpT05scUl6NFZXUDY4clJiaUI5b1V2UUJIaEJa?=
 =?utf-8?B?RmJ5eXNoV0ZVM1Y4UGtSaGRscmZFTGNxY0E4ZXRvMWdQK2hNQzZrT01uclYv?=
 =?utf-8?B?NUQySWlYQU5ESU5BVzZ4L3YxRmVBOVIxdUNwSTh2UlJ2Vk9uS0VBTmFWMDhv?=
 =?utf-8?B?T3p5bE9lK05rYnpUQmExc1MxQ2R6VHBWV3BZemErMDBOODRiVDdwc0p1U25D?=
 =?utf-8?B?RXFNUzJsWmtYSkdFUHRCMmRIQnhtSGlWVkNRZUxkR0ZNd1V1SVJYYXpSUkts?=
 =?utf-8?B?eWx6VUpMbzZLemgzcGE4TzgzSnVDN2VvK1FydVhFeFlHM2tZQ0pHT3NqV3BU?=
 =?utf-8?B?dG9JbUVGcDFHMXFJRU5aV1RVcFdFR0M5QjZacGIrbzkzUUVaUDVxbTI2U2s0?=
 =?utf-8?B?VDllaStJTWZYVytMVmEycERyZkF3UVRta2NVTUZOdWZrc2lLamp1YjJQdmJZ?=
 =?utf-8?B?akJrSmNmZWRUUGZSRVdKM0lxTmI1dlhUOTdpdW83SnBMSm16QUJRYWZuK1Bh?=
 =?utf-8?B?andLUzJ0TW1saW9iTTEyVnZyZVdPQTlYRzNuVHZRaXlXQnBzdzJPTWJFKzZU?=
 =?utf-8?B?Vno0QW0xV3NRQlpPMDA0TW1HVWpIc2VUbXo0TTNFcXRhS3FIL1JtSzZJamlG?=
 =?utf-8?B?NThnemI3R0dCdkFLcGozc1NLVno3K0N1Sk5IT2dwWG5BaDFZd2hhU2RLZHlW?=
 =?utf-8?B?MFFWQU9WbElkTytLY2toUnhnQk83REt4Q2dKOUZUSWdsY29FR2svWDVLYVZ4?=
 =?utf-8?B?VUZYUzUxNUZ2WVg5T2ZSOGFtOXB2RVBtdUJMUlZZTzR4cWJ4TkplRDNSd0ZP?=
 =?utf-8?B?bjczdExERW0yTzBnUHdqOWtOT1ZSMTRFSUk1eG4wM0tXTzNuZ2FrZGZJZmQ2?=
 =?utf-8?B?TlZndHN4VEk3T25ROHViWXhOaE80VzBpLzEvU1p5Sy9Hc1VpblJwTUZyY2t0?=
 =?utf-8?B?VHE1UFNVVkdHRy90S1FhQ05GRVZabmNLS2J2SW53bGsrbXN3UFdLb3BrZ1pl?=
 =?utf-8?B?UnFOdkFvMlk4Y2J3ejdyUlJnbUIzU3pwbkdPaUd4MTNkRkt1SVNibHBXdExO?=
 =?utf-8?B?NzRLeWlBT0dkeE41WitZL0Naa3ZxcUxoR1dFZVY0UmY2WFU3VFdlbkN6R2hh?=
 =?utf-8?B?dEtjZmsrb1hXTGFGUjRUSHl3UzYxQzlRbGNVZmFMTytkL3gvV0NnVCt4NW9h?=
 =?utf-8?B?aklxU0FnekhzQlpsLzJQVmUyODdoTzhOVUVnc1B5dGt2MndwemthZ0xMek5n?=
 =?utf-8?B?R216NjZqYWpIaEw5bWtHR1JVVTg5RjlORGVIK2FwMkt1dklBcjZ3UVRyTnRC?=
 =?utf-8?B?NmJPUkNZRHA3UVpWa0l0OHQ0Zmh5SEpNMlJJdkl6N0Vva0x4Wk1kWWpWeU5O?=
 =?utf-8?B?empCZEFhZFZZbDgyWkZLSWdzUFZoU3gzTCtWN3pGWUVFWFRzNHVqNWsvdHJo?=
 =?utf-8?B?YlFhUjF5V25zUHNsci9iK2dTMStrcUNreFJzQisxdS9TemZWczVXTDljaE1N?=
 =?utf-8?B?QUxkZUQvZDRzV1JaVCtVV0tpRTZ2N2Z5azBid3F3dCtCcVJ6SlhCemNNRzZh?=
 =?utf-8?B?eUdoMGZ1NlExRkFWN0p5cldZUlhIR08yRXlzUWVtd2xTQ1RhbFJyc0tocVhz?=
 =?utf-8?B?dUlzV0pBYUV0c2xiS2RhZUR6MUpsZE43MHV0L2NZN1B0ejBFbkM2allUZzQ5?=
 =?utf-8?B?S2QwRGgwL1BOVnpueXV4dmt5QjRYVXJqSGJLQ0xHRWw5emxKamhWNjgvUldC?=
 =?utf-8?B?SlE3ZXhTOXZsQnFvcEZNaVI0clRsOFZGbGo1SEQxVEdFemM3cG1SVks0eXZU?=
 =?utf-8?B?MnR0VDh6L3N5bFRZeGhQRE9rR1FXRU11Und2R2tFV1ppQWZnZ0NCbDBXakMz?=
 =?utf-8?B?M056SUFtOExORkhqZFp5SnhzdTRiWHhYVVBPK0pDZFhkdmY2QVBqYzZwYStW?=
 =?utf-8?B?QjcveDJZSmhmVjBpN2c5Z2l1eUNTdjdNSm91S0hnY041OG45MXRFQy9MU1o3?=
 =?utf-8?B?VlB0bXpwZE5NWFJhOE9uS21rWE5TRUFSeGZuakpQSWpkUTdnb2svSGV3T1Zo?=
 =?utf-8?B?QU9IbmhJTTlnR1dGNGtYc0dOVU1pdU9BNnpZZHVaZStIUUlRT0FNSzM2aC9l?=
 =?utf-8?Q?vG6q5tw5weKQfDmOBgu6lns=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b3f4206-8e1f-47ae-b804-08ddd4b62e91
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF67C992ECC.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 06:55:09.0783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1lpNTboAFnr1G6Ueci8kyPFPZRtyyr8uTa2YccT5JMC9ZHAQuW0juDpBPdaH2CqZEURM9iyeZALxIvIB8YVFndaC2rqRn5Eb4ioeXC1SdDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6331
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



On 06-08-2025 03:36, Matthew Brost wrote:
> This is not yet supported, forcefully disable by setting pat_index to
> zero for CPU address mirror VMAs.
> 
> v2:
>   - Use XE_CACHE_WB (Auld)
>   - Only modify pat_index if compressed (Himal)
> 
> Cc: stable@vger.kernel.org
> Fixes: b43e864af0d4 ("drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pat.c | 10 ++++++++++
>   drivers/gpu/drm/xe/xe_pat.h | 10 ++++++++++
>   drivers/gpu/drm/xe/xe_vm.c  |  7 ++++++-
>   3 files changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 2e7cb99ae87a..ac1767c812aa 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -154,6 +154,16 @@ static const struct xe_pat_table_entry xe2_pat_table[] = {
>   static const struct xe_pat_table_entry xe2_pat_ats = XE2_PAT( 0, 0, 0, 0, 3, 3 );
>   static const struct xe_pat_table_entry xe2_pat_pta = XE2_PAT( 0, 0, 0, 0, 3, 0 );
>   
> +bool xe_pat_index_get_comp_mode(struct xe_device *xe, u16 pat_index)
> +{
> +	WARN_ON(pat_index >= xe->pat.n_entries);
> +
> +	if (xe->pat.table != xe2_pat_table)
> +		return false;
> +
> +	return xe->pat.table[pat_index].value & XE2_COMP_EN;
> +}
> +
>   u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)
>   {
>   	WARN_ON(pat_index >= xe->pat.n_entries);
> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> index fa0dfbe525cd..8be2856a73af 100644
> --- a/drivers/gpu/drm/xe/xe_pat.h
> +++ b/drivers/gpu/drm/xe/xe_pat.h
> @@ -58,4 +58,14 @@ void xe_pat_dump(struct xe_gt *gt, struct drm_printer *p);
>    */
>   u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index);
>   
> +/**
> + * xe_pat_index_get_comp_mode() = Extract the compression mode for the given
> + * pat_index.
> + * @xe: xe device
> + * @pat_index: The pat_index to query
> + *
> + * Return: True if pat_index is compressed, False otherwise
> + */
> +bool xe_pat_index_get_comp_mode(struct xe_device *xe, u16 pat_index);
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 432ea325677d..83f507ea7f30 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2362,7 +2362,12 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>   			op->map.is_cpu_addr_mirror = flags &
>   				DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
>   			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
> -			op->map.pat_index = pat_index;
> +			/* XXX: We don't support SVM + compression yet */
> +			if (op->map.is_cpu_addr_mirror &&
> +			    xe_pat_index_get_comp_mode(vm->xe, pat_index))
> +				op->map.pat_index = vm->xe->pat.idx[XE_CACHE_WB];
> +			else
> +				op->map.pat_index = pat_index;

A warn to let user now compression pat is not supported for 
DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR and kernel is sanitizing it ?

>   			op->map.invalidate_on_bind =
>   				__xe_vm_needs_clear_scratch_pages(vm, flags);
>   		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {

