Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE1ECAC5BB
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 01:25:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 206A510E759;
	Thu,  2 Oct 2025 01:25:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fQoN6Pxe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 302AA10E759
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 01:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759368348; x=1790904348;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=py2OfnUDSl3q1VkwjHmeZpDKw+unZk7B9xBYLsO1zyE=;
 b=fQoN6PxejP2KQjkIZDCGseidCIYCbozFUwdoDM7jIRVbuSiIhJTAWxQu
 4LpCWfr4foqe8pf9R3MYK94CNGYlUQh7wuV3aq2aWPjEDe97RJRG0KJQT
 TPj43/8bG8P7QvOKHhs7ddZwDySgQnOHxnJL0uLD8tTjHffMV1HMo13W6
 6Sheag4fcBFrRU+KQV5rsrzUtoVzGKu9wbB+egUCfmqTHBTBUYegTzhlD
 8oSHQ21Q4lsqCl21MPtMFibVxlaqZ1bmvh7nEDD+0lfyyaIi3gICKzVB/
 9YgvLZs10hWuH+V5TucNoHhDu6fDGI6Rn9jIDLMc2k7xodQ0psnFvIrCl w==;
X-CSE-ConnectionGUID: ktvF375wSgmgUYwKffqyvA==
X-CSE-MsgGUID: Raj7oJl4TtmREN2I/Qgh2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61698825"
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208,217";a="61698825"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 18:25:47 -0700
X-CSE-ConnectionGUID: WooCCwIzT7m6SKcfqDEd6g==
X-CSE-MsgGUID: IYGoeRLZSO+1RkUvggd2Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; 
 d="scan'208,217";a="216045689"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 18:25:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 18:25:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 1 Oct 2025 18:25:47 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.63) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 18:25:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WhdNDt3Y8+z5OeIdjZOcOqi43iAQwDWbMMlvLSyB3QbZ7FJmjgSNd0kcZnOFsAScq078USBR307MJXvBF1zEkdKc8Qdx4m8qwlDiV/2HQ5TdCThOWOM6K0q6g3hxiYisQVTzgldcMLh627edmjEye9RH8aI8TzL+tUwgIDMytpL9AhfecCUDaVg/6PlxNC/d/OmuBYEhekMy+LLDks1ZHUoH/GjlR0YxYAXLgyU4n2wVnRrLiy9zMnuQoCu86S0/8SSyO9K53514YHeak2INMpxdk5RftTMmFQBl8MFk/n6U4hPRd9pi42jhMlJHLrM23wrpDgarlRhgaLohKZ0B3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWX0eXUL0qS64jmH8Z6YGnd0o7jbiL9OKi3J2mBGSq0=;
 b=IJ+AgWcxRZ3XGP5l4t/yqJ1VURDO3bZ/vrl1099+RVpYkBviWR1zyD5d8AF1LTyr1GZ2kXqIPnCXntLw0x7l6SLn4dXNWczLJyfhYmMO6ATt+XFSbwcnJWCUDBhuCDX5xvYNydwfluNa5KQ6NEpWQbQTEZ0YH7gNra0jy/3iLSXuCB1LHIUm3QsDeBKPWyDGi0hEAHVx75a+D/WFdmm6Qm7adcdRS4LuvsXcw54XQ8hdI0q2sikk/9elSgojcNYMXwbLqQsGOr5sMLDreLyE88RYQQcSHRkyK5MDMWkcntjbKfuCVJQz9Kp/hlsaGwLJtWZU763dGpr/JPaJD1mTFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by LV3PR11MB8601.namprd11.prod.outlook.com (2603:10b6:408:1b8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 01:25:41 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Thu, 2 Oct 2025
 01:25:35 +0000
Content-Type: multipart/alternative;
 boundary="------------ScMVGAvb7HJVyOoi6dwhbVdq"
Message-ID: <3aeeab4b-2ace-47f6-9421-0d5c4253333b@intel.com>
Date: Thu, 2 Oct 2025 03:25:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 32/36] drm/xe: Use PPGTT addresses for TLB invalidation
 to avoid GGTT fixups
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
 <20250929025542.1486303-33-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20250929025542.1486303-33-matthew.brost@intel.com>
X-ClientProxiedBy: VI1P190CA0051.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::10) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|LV3PR11MB8601:EE_
X-MS-Office365-Filtering-Correlation-Id: cd24e634-e6f7-44de-ba4c-08de015295fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3RUalJSM1luTGE1R04yTjBlNzU0Q3NkTEdTSXFuVjJCNkhsazJrc0Q4NDlm?=
 =?utf-8?B?ZElLeGFTZ2RhUGZGRHNtU3hOendlbHdrcWRJSUUvb01hUHgvUmZaOTNLNTBa?=
 =?utf-8?B?cEVaM0ZVbFVUYUsxcU5KTWpSWUJUV1RzNFVZOUQybXJpTVorQXZKVC9oU2JG?=
 =?utf-8?B?OGlBUFFTbWk2VVEyZkJRWGQ5cnRQVWQyZnJMTEVVMExTdnVnTFZDY1ZkZzlT?=
 =?utf-8?B?TzRzU2xSYWRXbzRLdjFBd1BZQUxzWVgxSnJmZzE4dW9xQ3NTbmk2dVlTUlhn?=
 =?utf-8?B?THhaUCtQVVEvSHRWWjNFUDRPU2x0SXViSlZSYVV1ckwwZEN4OHR0Z1o1eWh5?=
 =?utf-8?B?YWF2TC9aeFVVT1VHRTV4TDZGWWRWSWFrZTJYaUNuVC9tRUJScGJ3WlY3VHNm?=
 =?utf-8?B?cDBobHZpN2l2bWliRVRzLzVETGRZRUtudVd3TG0yTnhlVUszdmpvbzJKVkw4?=
 =?utf-8?B?Tk5WVHRjQVlkVXhNZ1VwWk9QMkcrdXVWcW50ZURRWFF3SEZseTBoMGo0Q0hH?=
 =?utf-8?B?bmNyZEVKRDFHeHdKSDVxbm9IWnVtaC8rUHBBUWtDN2tocDJaeEROMEV1TmpL?=
 =?utf-8?B?NGxzT3NVUUNHQlB6c1NtNWxDTXZEUG8vNnJDUXRRN1gzOXYydnR3WFBaNWFN?=
 =?utf-8?B?d2VoYitXOGhjU1BlekVsNzVrYzFuR3Z5WG01NFVUVktZVDhyNWF3OVRTQ3N4?=
 =?utf-8?B?S0tCVHBuTTJFOWRwdDJqbGxtYktRcFhsVFJXUVpNMXQzaXY2Ykg3ZW5sU2RB?=
 =?utf-8?B?bHVZcys5S1BVSXYzWStpM0g3Tk05cEdzL1FqS21GMFg1TmVtNlVLTGtlbno4?=
 =?utf-8?B?bGxJV2UzRTJaeWtUTEVKMzZ2V29LV2RWbTRoOVBna1YxNWxkVUlVU0x2bHFK?=
 =?utf-8?B?RzFJNUZyS1JReTBBVk0vYXdVOHNKWHpDTzJGMHZEVUx3VHZQOURjRWh2MkNN?=
 =?utf-8?B?RC9sR3E5UDVzaEhUQ0xUVVhHT3BHSmZURFZpZVkvNGl2anl2WG9DVXI1cVNn?=
 =?utf-8?B?aGthYmdiVFlWc0NRODdsWDBneW5Na0NmSzdpTzA4VytzaHJzYmMrRTZzaEZz?=
 =?utf-8?B?YzIwVVduK0RVSGJESzNURk03c1h2eG9uTHpwaGRWVWwzUEs3Mm45T0VZK3Vv?=
 =?utf-8?B?ZDhXWFBLWC90a3JhYWJkZ1hjclk0bXpjdGp5eWdjeUZIa2RlWTZhU0RScEtK?=
 =?utf-8?B?WWFHMHlIR0JQa3FhRVZxYjZPWEYyNVJUaGhEeGRmK2hEb0VRNjRRdFlhQi9J?=
 =?utf-8?B?ekhhbDhLaXlpa0U5VzRsaEladkN5QUNOM1lFRk9WRXJNS3FOUENJZkdxVit4?=
 =?utf-8?B?aFlPT1JNSko2NllnbGdwYklEVDBqUDFQRmpPdU5pcXVpSW02UE5EQWZTSGVW?=
 =?utf-8?B?NHhEaEk5cS9lT1dLVitCZjZLcmhCRkhzbVpPUzlWNC9CbG1nSC9MbkIwZFUr?=
 =?utf-8?B?NS80WFdvYnBYZUdKeU5JNEVHUXV6bVhETVBKRklWaGhtQVQ5b25rZnlTcnRw?=
 =?utf-8?B?LzQzSzd2eTA4MjNrY0VlRUxnOVZoejNlRUxydFdFeWtmV0dBTmZiV3F4Q0pl?=
 =?utf-8?B?MEl1NmdwWm0ydWVhVEZHUWNzYjdCaUFhcFRqZnN2eEJBbElSdWp1SnoxL05C?=
 =?utf-8?B?THhMTCtJK0E3QWdMM2MxYnZtQ0g5K1Y1U0dhOEw4U2gyTU5XMmFiOUNnMjV0?=
 =?utf-8?B?UGF4MFp2ZHBNc1M4VUhpTWhBUk00RHVkNWs2ZjIrVzEzTkdUN1h4eVo2enpK?=
 =?utf-8?B?TFErS1J0WDkxd3hEVEZqZy9vT2xnUklHUmg5clhINDY3Ull0TlNLdDg5NnF0?=
 =?utf-8?B?bXhNYVB3MUczSXF0MnFRejJFUFkvQ3l6cXZsODQ4QWswVW12RVRnZk9wdEFS?=
 =?utf-8?B?aFhCbjZoZ0NBRFpxRHMwMEJyMDJpNXIwZ2dXcTAyMkRuV3FrbUFsQkRNQ2RP?=
 =?utf-8?Q?Sk8aNkB3Gb8bY2UV0ZRFgA8jLqZEpHQ8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmYvMDVHRWR0NWhIbVhCeGJWMkM3WGoxejBMOTg1V2RwY1FXbExLbDR6ckNG?=
 =?utf-8?B?WW9XMXNScjRjOFhDS1ovdVdMOTRqR0FJb2U1MjgzN2puaGJlaTJQcDEzZmpI?=
 =?utf-8?B?eUdBcVhyeVl0TlIxZ2xpaDhTdzdqYkFOVWM4eWYvcGhlT21HOGtxMGczKysv?=
 =?utf-8?B?T3dhRkhoeXZDYkd4TUcvbFdJMnY0MkVlQkw0K21zS3lTSElkYnRKTlc4a0Y0?=
 =?utf-8?B?NWZ0NFhVSHlWRFBHQ0tTVkdLV3JybzNxU292a1VodEREVzdNbllvRzV2STBr?=
 =?utf-8?B?cnVKVU1SMEFORXZsKy9ONGV2V3FEbm1TdVFUUlFZY2ZtYTNiMGtXejdIOHhD?=
 =?utf-8?B?cGJQRWxXekdzQ1NPblhQNmdlNFJKNGYyQS9NRlpqbTFScnBiL3pHY2hGQzZH?=
 =?utf-8?B?VXBXT2NGc1JzdW9nNjhGMThJbU9oWlljbUp3WkRuUEhxNmpqV0d1OExiY0h4?=
 =?utf-8?B?UXluNUZwdm5URkQyc2xqR1JMWVJZM3dmVWplV1RSWTU3YTBoTVpMdVB0ZWwv?=
 =?utf-8?B?d3JpV2pPZUV1MmVTd09rMmpuUjJoVGIwTGNJYkFPN0hhbE1jUDMrdlZsMlFy?=
 =?utf-8?B?YUpra1ZXT1dvQy85VUdrN1YyU0ZNMlZVQXBrL0dlaGt5YmZmYmZFN1dDRWZC?=
 =?utf-8?B?QTlLY2piN0IvSUVGaHZNaFV5ZmhrUE04VEtaT29JRE83U2dqWnRvQkYzVXFZ?=
 =?utf-8?B?M3BlbFJrcEdiVTFkdHB5QUhQSkpwZVVrQmNtL3haMFRZekFDNjQwYlZhS2Vz?=
 =?utf-8?B?Mm5seG84ZEdPMTZWbnRHV2NjbUhDN3IvSlZOSm5tTFlrQXBUYlJxS3JEVXlK?=
 =?utf-8?B?cXFURVExbENMV2trWUd5N3RzNDMwV1l5b05EKzhoVW15RVFVUzBxZ0VHYml6?=
 =?utf-8?B?UExNdWduWnZvREdaSzVZcWcwK3d3bERxcGl6em1XQjBsNVg4QVJSc0JUd3dI?=
 =?utf-8?B?cEZDUEpoL0wzZFFBZEVMRGRwNzM4alpvOW8xOHVoQlFBTDJJTnRPa2ZBUFBG?=
 =?utf-8?B?UTJSN2pLNkdidWNUekR5NzRvSWZLcmJnemgwY3dibllTZi9GVitqRHVIUndU?=
 =?utf-8?B?L2R1bktGVzVzYzVxbldnekJBWDlBS0UrY3RDNzgzQ3ppY2NLRm00dk54djF1?=
 =?utf-8?B?TThqTGpKOXZ6cG4vNnM1RkRIWnBmbFJIOE0wVzhBMXIreHV4cU5wd0xnUUVz?=
 =?utf-8?B?amJ2RVlKU1lIUjllSzY4eFNQVGtlL1U3ZHR6UXJkZjJLWGdId1djQlBnbEtM?=
 =?utf-8?B?WEpTeW91SG1HYWtjcWVScDQ2eGw0ZFp1Z005SnhXQ0FBc09UcHhmcXZuVitn?=
 =?utf-8?B?czEvYzlNcXJ4eHllNEQ3TFk3dFk1RkwwTitsWlQrM01KeWdYOW8xS3lTekNw?=
 =?utf-8?B?bkFRMHZZUXdaU001WFMxby9lNkNmQk54NGpPSjhFR3drOHFGQ3ZTSCtOSE5k?=
 =?utf-8?B?KzJJQ1czT0FCUkVTT3FvQ1ZRVWdOSnh1YXFPZ1JoRDJkRkxwZzJqMmhTU3A1?=
 =?utf-8?B?MHZ2RlFSbkhHQk9uWjN2NkxUUG43UHpxV0pqRVZQTnIrbmJmSTNJN0lNUWlw?=
 =?utf-8?B?bDlQQjV1aUNyQlNQSXpXSmNFSkZvQmFOWGpubnVDNmxjd29DNVlmY0RqUnJy?=
 =?utf-8?B?MFJXckVQdjZpdUYvK0FzUDFiUEQwcEVJUWdodEkvTER6NGUzRDlJdHpSOGFr?=
 =?utf-8?B?RnU0SjFYWUkzTjBoSS9kN1JBZ0hBYXpIdjdZUE92b216OWtHNHp3OTgzSkRW?=
 =?utf-8?B?ZmlQc0RQdTBNRjRXcnV4bWltV3VrWU5DT2pwRWxNZnZ4NWxqK0pDdkdScS9U?=
 =?utf-8?B?T0R5T0VjNXlGTUJTUGNDVzNVOFBoRVdpQ00yM0t3MDdqQ2JHMUFlZHBrbkJk?=
 =?utf-8?B?djFDbmhoQjFhNHRYZkVreDh3aHFIWHFnNzlTYi93MG8xV08xSGQrejhzTHJk?=
 =?utf-8?B?NEMxQXJXRGVzVi9pUmRpNlVQNXd0aU0zbXlBMmEzRzlkYlIxTGhTaXkreTI0?=
 =?utf-8?B?NGt0ajZoakg4ZlBpcUE1MlUzUHg2TmJ6eDRFd0JTdDlNUWdhaWg5dDQ0ZnNl?=
 =?utf-8?B?dm9wZnVuQTU2cHQ5T1AzeVBkTXdsaWNzTHZrQ1JQb2QwS2RUbUxoYU1TbFc1?=
 =?utf-8?Q?3SetIGzDFN4zoK0N1Mlsxpol9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd24e634-e6f7-44de-ba4c-08de015295fd
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 01:25:35.1176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1riz8QgLeHuIwCDyEXiJp4EGlzyWg1jZiHQ1dUdSelpSlrQW9Svt0HQbKWowj5ewZdOn9U57wOPw8NcCMQF+dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8601
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

--------------ScMVGAvb7HJVyOoi6dwhbVdq
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 9/29/2025 4:55 AM, Matthew Brost wrote:
> From: Satyanarayana K V P<satyanarayana.k.v.p@intel.com>
>
> The migrate VM builds the CCS metadata save/restore batch buffer (BB) in
> advance and retains it so the GuC can submit it directly when saving a
> VM’s state.

Had to read the "migrate VM" part multiple times to understand it. Also 
maybe my idea on English is wrong, but 'retains' does not convey 
'updates' for me. Maybe:

---
A VF driver with VM migration capability builds the CCS metadata save/restore batch buffer (BB) in
advance and keeps its content up to date so the GuC can submit it directly when saving a
VM’s state.

---
-Tomasz

> When a VM migrates between VFs, the GGTT base can change. Any GGTT-based
> addresses embedded in the BB would then have to be parsed and patched.
>
> Use PPGTT addresses in the BB (including for TLB invalidation) so the BB
> remains GGTT-agnostic and requires no address fixups during migration.
>
> Signed-off-by: Satyanarayana K V P<satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko<michal.wajdeczko@intel.com>
> Cc: Matthew Brost<matthew.brost@intel.com>
> Reviewed-by: Matthew Brost<matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_migrate.c | 28 ++++++++++++++++++++--------
>   1 file changed, 20 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 1d667fa36cf3..ad03afb5145f 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -980,15 +980,27 @@ struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate)
>   	return migrate->q->lrc[0];
>   }
>   
> -static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *dw, int i,
> -				 u32 flags)
> +static u64 migrate_vm_ppgtt_addr_tlb_inval(void)
>   {
> -	struct xe_lrc *lrc = xe_exec_queue_lrc(q);
> +	/*
> +	 * The migrate VM is self-referential so it can modify its own PTEs (see
> +	 * pte_update_size() or emit_pte() functions). We reserve NUM_KERNEL_PDE
> +	 * entries for kernel operations (copies, clears, CCS migrate), and
> +	 * suballocate the rest to user operations (binds/unbinds). With
> +	 * NUM_KERNEL_PDE = 15, NUM_KERNEL_PDE - 1 is already used for PTE updates,
> +	 * so assign NUM_KERNEL_PDE - 2 for TLB invalidation.
> +	 */
> +	return (NUM_KERNEL_PDE - 2) * XE_PAGE_SIZE;
> +}
> +
> +static int emit_flush_invalidate(u32 *dw, int i, u32 flags)
> +{
> +	u64 addr = migrate_vm_ppgtt_addr_tlb_inval();
> +
>   	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
>   		  MI_FLUSH_IMM_DW | flags;
> -	dw[i++] = lower_32_bits(xe_lrc_start_seqno_ggtt_addr(lrc)) |
> -		  MI_FLUSH_DW_USE_GTT;
> -	dw[i++] = upper_32_bits(xe_lrc_start_seqno_ggtt_addr(lrc));
> +	dw[i++] = lower_32_bits(addr);
> +	dw[i++] = upper_32_bits(addr);
>   	dw[i++] = MI_NOOP;
>   	dw[i++] = MI_NOOP;
>   
> @@ -1101,11 +1113,11 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>   
>   		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
>   
> -		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
> +		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
>   		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
>   						  src_L0_ofs, dst_is_pltt,
>   						  src_L0, ccs_ofs, true);
> -		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
> +		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
>   
>   		size -= src_L0;
>   	}
--------------ScMVGAvb7HJVyOoi6dwhbVdq
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/29/2025 4:55 AM, Matthew Brost
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250929025542.1486303-33-matthew.brost@intel.com">
      <pre wrap="" class="moz-quote-pre">From: Satyanarayana K V P <a class="moz-txt-link-rfc2396E" href="mailto:satyanarayana.k.v.p@intel.com">&lt;satyanarayana.k.v.p@intel.com&gt;</a>

The migrate VM builds the CCS metadata save/restore batch buffer (BB) in
advance and retains it so the GuC can submit it directly when saving a
VM’s state.</pre>
    </blockquote>
    <p>Had to read the &quot;<span style="white-space: pre-wrap">migrate VM<span style="white-space: normal">&quot; part multiple times to understand it. Also maybe my idea on English is wrong, but 'retains' does not convey 'updates' for me. Maybe:</span></span></p>
    <pre wrap="" class="moz-quote-pre">---
A VF driver with VM migration capability builds the CCS metadata save/restore batch buffer (BB) in
advance and keeps its content up to date so the GuC can submit it directly when saving a
VM’s state.

---
-Tomasz</pre>
    <blockquote type="cite" cite="mid:20250929025542.1486303-33-matthew.brost@intel.com">
      <pre wrap="" class="moz-quote-pre"></pre>
    </blockquote>
    <blockquote type="cite" cite="mid:20250929025542.1486303-33-matthew.brost@intel.com">
      <pre wrap="" class="moz-quote-pre">When a VM migrates between VFs, the GGTT base can change. Any GGTT-based
addresses embedded in the BB would then have to be parsed and patched.

Use PPGTT addresses in the BB (including for TLB invalidation) so the BB
remains GGTT-agnostic and requires no address fixups during migration.

Signed-off-by: Satyanarayana K V P <a class="moz-txt-link-rfc2396E" href="mailto:satyanarayana.k.v.p@intel.com">&lt;satyanarayana.k.v.p@intel.com&gt;</a>
Cc: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
Cc: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Reviewed-by: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_migrate.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 1d667fa36cf3..ad03afb5145f 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -980,15 +980,27 @@ struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate)
 	return migrate-&gt;q-&gt;lrc[0];
 }
 
-static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *dw, int i,
-				 u32 flags)
+static u64 migrate_vm_ppgtt_addr_tlb_inval(void)
 {
-	struct xe_lrc *lrc = xe_exec_queue_lrc(q);
+	/*
+	 * The migrate VM is self-referential so it can modify its own PTEs (see
+	 * pte_update_size() or emit_pte() functions). We reserve NUM_KERNEL_PDE
+	 * entries for kernel operations (copies, clears, CCS migrate), and
+	 * suballocate the rest to user operations (binds/unbinds). With
+	 * NUM_KERNEL_PDE = 15, NUM_KERNEL_PDE - 1 is already used for PTE updates,
+	 * so assign NUM_KERNEL_PDE - 2 for TLB invalidation.
+	 */
+	return (NUM_KERNEL_PDE - 2) * XE_PAGE_SIZE;
+}
+
+static int emit_flush_invalidate(u32 *dw, int i, u32 flags)
+{
+	u64 addr = migrate_vm_ppgtt_addr_tlb_inval();
+
 	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
 		  MI_FLUSH_IMM_DW | flags;
-	dw[i++] = lower_32_bits(xe_lrc_start_seqno_ggtt_addr(lrc)) |
-		  MI_FLUSH_DW_USE_GTT;
-	dw[i++] = upper_32_bits(xe_lrc_start_seqno_ggtt_addr(lrc));
+	dw[i++] = lower_32_bits(addr);
+	dw[i++] = upper_32_bits(addr);
 	dw[i++] = MI_NOOP;
 	dw[i++] = MI_NOOP;
 
@@ -1101,11 +1113,11 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
 
 		emit_pte(m, bb, ccs_pt, false, false, &amp;ccs_it, ccs_size, src);
 
-		bb-&gt;len = emit_flush_invalidate(q, bb-&gt;cs, bb-&gt;len, flush_flags);
+		bb-&gt;len = emit_flush_invalidate(bb-&gt;cs, bb-&gt;len, flush_flags);
 		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
 						  src_L0_ofs, dst_is_pltt,
 						  src_L0, ccs_ofs, true);
-		bb-&gt;len = emit_flush_invalidate(q, bb-&gt;cs, bb-&gt;len, flush_flags);
+		bb-&gt;len = emit_flush_invalidate(bb-&gt;cs, bb-&gt;len, flush_flags);
 
 		size -= src_L0;
 	}
</pre>
    </blockquote>
  </body>
</html>

--------------ScMVGAvb7HJVyOoi6dwhbVdq--
