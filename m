Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFF5CEACDB
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 14:55:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC58310E640;
	Tue,  1 Oct 2024 14:55:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IruYg8D0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DC6F10E640
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Oct 2024 14:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727794531; x=1759330531;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bBPfeO9yzg16rDpi3n6V39pArncZIDyUPQzz+EiLUzE=;
 b=IruYg8D0soX1OSy6bYPOaQ9izGYeFrsAbPoRHVdRQ1SBgV8nuhjY+gJo
 vnGXsn4ZHVCUOFUHP4djbzWmvZpfMXljdFNONr1KkAftZKYdpCbCOXjDC
 j+ne5jTANKbO6GkfNU/eC1Nt9iLipGsiw8OyF0LbQTJS5IRgFyDqWohcE
 VT4gqUjsfBd6B4vni2JYME7x/KpFj8H8PT1Ib8N7nbBa9LuMU62de8OWQ
 4PWWhDGbRFzow1FrOrsYKarbqr4mQDpaO6wChHNR/KtSp304gT9L65XE5
 ZRnrIE4DuBH6J/moiEQ2UFRlfeWiqdGzR8QJumzxcJ9DiC+hpyKX+AxUg Q==;
X-CSE-ConnectionGUID: TqWAxnqIQGq1sgp2tV0BIg==
X-CSE-MsgGUID: D9JY5qRTQfOfTKEGafabGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="26437232"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="26437232"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 07:55:31 -0700
X-CSE-ConnectionGUID: woFygsGPR9WbPkHnDw3Bxw==
X-CSE-MsgGUID: VWYw262zS8yJmR5zUO0ocQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="73361297"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Oct 2024 07:55:31 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 1 Oct 2024 07:55:29 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 1 Oct 2024 07:55:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 1 Oct 2024 07:55:28 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 1 Oct 2024 07:55:28 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 1 Oct 2024 07:55:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GlpPxcrI38s6LjUot7nTVaxiyQKlrKfhCDeU6a7yvomtHuhFltACTKIAlpj5l+0fX5AVwqQe/JZBXZB8PliK5s8tFkkK6NTEDL/fvmBIu36RcweUG3gLlL1blt1AHuc5qaia3BijG2/HQCevv6rZ0KN5PILPR1gQmyy9Z8rxy+Tv/TLgHN5W/dt8eUXOcuU6DwIIetfSqy2qhag44z97G8fB6JQZlxqXNoBi1epElWAjesJZX1Td0R3aQIv/QHwc9oTJA9o4PCmnIPx0Hoc80q2hDm0nBvCvJ3JKsGEyibrKPhOxpnnJGuRoK8sv0tgrreaLL6Lu15SyVDRgQjhAWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dVBrqfQwlD0XD0I55BJk/piDmh6zDVJVQl20s14lLQ=;
 b=ZYLRvKxqM/r4wP7cJxvwA7Ya+QdrQYbdASBMR3wGg/y+yXALT4EFFPhcbWBf+JtfeW9kIrKpI6ijWc75pYxbFF5Zfv1yELVrux1xqWH4Vc7+Rwm7NFdT+pACT1I8wKwygdJ9EuCHaaAhrtqP6uqz5aryQxjzgAja9W2u7mvp/XCFQATvq5X6e3kt8hqAveyGx9B8rWbbitSfiRGjh+ZnBO4AkqT8dS4VpWqKCbY8Z+HcD4s+TjhX27XeWUMeobKGpKt+LGJpk6Nz4ogRJujNC53EYMMIXuB9KDwEAK+ttnLH3Oo1KW7cqpk+sszATKM0FK7ZP/rwc1SPUsnuip3FEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by MW6PR11MB8409.namprd11.prod.outlook.com (2603:10b6:303:24c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Tue, 1 Oct
 2024 14:55:26 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%5]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 14:55:26 +0000
Message-ID: <e9ef365a-42c6-4ee6-8556-87d61cb057b0@intel.com>
Date: Tue, 1 Oct 2024 20:25:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] drm/xe/ct: drop irq usage of xa_erase()
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20241001084346.98516-5-matthew.auld@intel.com>
 <20241001084346.98516-8-matthew.auld@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20241001084346.98516-8-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0023.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::12) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|MW6PR11MB8409:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bd56218-3899-410a-a6a0-08dce229155a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RjNzVGFJN0dCU0NtNmdlUk14ZEpneTdJUlVsdi9vMkhlNXFOdWEzZEYxNFYr?=
 =?utf-8?B?UFR3eE5KRU9IRnpEb1JqLzJUL0RNVmt3M1RYRWxreUpleGpWSXdCZFNlVjZw?=
 =?utf-8?B?ZHlta05oNDQrZklqZ0srM0xRSFNnN0Y0NGVaTENuUzhTTGRXWTFkazNyemhx?=
 =?utf-8?B?Q2NMWjdCYXpvT1ZSN1FTaENXNDVpbGd4VDdDRWtqTzl0VW5SalpkV09tWWp1?=
 =?utf-8?B?aWxFWmdjdGVMR21iQzB2T2h0OStVcE5jOTdNMmxkbVFXd2lyZ2hyRVoydEl6?=
 =?utf-8?B?T3hnRC9qNjI4amhSbmN6dTlZRERVRDJscW52eTJpdkZmbnA3cVByK2hPTG9j?=
 =?utf-8?B?SlhLOStZSUtCa0pCdXdlR0toMGFrc2w4aE0zSVZCL1ZJZWV1bTR3SWJEYjVM?=
 =?utf-8?B?VlB1UTJLNkl0MUZwTHY1ZkVrbk5xNzlGYjg3emM1NGxyNXorR3BuTy9IbDBy?=
 =?utf-8?B?MU1BZDNmeGh4cnNrSUVjV3hkamFEajJ6blU0SVdDUVc3a0ZBYUtncFl2eDZj?=
 =?utf-8?B?SzA5bW9LdzBMVi9nK0t2d0ovcUNwU3pXdkw1VHZLbFp6MDlnbitlU2lrVDN3?=
 =?utf-8?B?Q2xaaDRCMFVPSUM3bU5IVVN1OERlZWI2TWwwU3VGRnBTRFo2bnJXQjBtTGFT?=
 =?utf-8?B?UEhOYmM4ODZETXVzeUJRTWN6c0xqWW1HNnZmblJWNFRkS2NENGlFbEhrUkpY?=
 =?utf-8?B?ck5YTnhSS3kvRXNKbEoydmo2SU82ajdaVmZ1Z1NqejcxTklGa3JIb0JMcElI?=
 =?utf-8?B?T0hUaWJYN3NMbTlNZDR3RmNKQ01keVl3MTZzaU9DSnBCU1JlN3VQUUk0OVJX?=
 =?utf-8?B?clRFeE5HTTBXcVNueDkvRnBTMmlFL2hOQWpNdGpuRlA1QU5sM3VWdGlKWTJ3?=
 =?utf-8?B?RU1PT0o3V1htU3NZYWJRbmZqZlJpVy96dHgwbkVpUU0vdzM5MGNoeTVkUzhT?=
 =?utf-8?B?RCtNcGtLaXRITVhPaVRjbEZ5b2xiYlJxMlpMNU02SjFTVGJqVzYyQXlRZXdo?=
 =?utf-8?B?SDNKYjJFWW9maTFxUWNvRHlmKzJGMW9PazZhR3ArREtpUnpNdUxRY09MclNx?=
 =?utf-8?B?MDdBcGczcmNob1ZubDZJL3JQWG5MODFjQ2d5SThKL2o5dGNDOXhtNFBIUjYz?=
 =?utf-8?B?NG0xSzE0UkN1OXBnNm5wOGZoWXdIRnQ3UGE2VU9yWUtWZEpOcUtQckNvbzV4?=
 =?utf-8?B?MXIrd25KeVlsaFFHRWZQNXhwamNlV1NEa3VhcERuVit2bTZRbEtSRkxvNm03?=
 =?utf-8?B?azFqKzB0TGE0WUI4YmF6L0Y2c2JYTlgxczhIckpRdTZ1d0ZxeEpNU2d6dXh2?=
 =?utf-8?B?Skw3YmVJY3lXTHd5K041bnczWkVYaCtEMHlKMDZvczdKc2k4WmIzcjhEcXYw?=
 =?utf-8?B?SU1RSmkwbVNpUng2SEtlWmpoSWM0MTNLVmRoNnRMbDluU0RBWWQ2SnJHSWxF?=
 =?utf-8?B?N1gvVnBwdktnU2tENkhGQlZEUWpGam9SdVpiaEhycEpxM0NicUtsUDdST0Vw?=
 =?utf-8?B?dE42S3paMnlJY0FrQ1A1T0RJYXdNV2huUTJHanorV0JJQ3JSaTlWdFc2b2Vp?=
 =?utf-8?B?T3Y5SHY5Nlh4b3VjY01mK1hkb2JXWVJ4bDBYaFp2MWRkM21yUC9WUUpsZ0Jy?=
 =?utf-8?B?alVQQnlyQ29OYk91ZWtNelltcWl6ZkhrKzdrNTRZOVh6SlBuU3FQVTU2Mnk1?=
 =?utf-8?B?WWdhTmUwMkJ2QWg4TnpCQXRuaEd2NWQ1eEVYWmVWNUZrYVNnSG5kc3hNOVBp?=
 =?utf-8?B?M2RFVnZWRXF4R0tFWnRoVmExWGlPa1hUekJ3T1NxQlE4akhDQVc2UXlXbUtk?=
 =?utf-8?B?RithUTQxM0VsTENEM0ErZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REJwV3RRSDVGUEY1Qk5qSTBxVGVMa0laMEMwOVNkeGMwWmZBL2JQR3JJaVVO?=
 =?utf-8?B?d1EvUnRkY1lzdi9sNmRkM00xNVlSRFNWQlpLUk16NzFLaDdJSjBCT05RSWdJ?=
 =?utf-8?B?UTRxVkxMck9ZTkJ6djNEOGhvUk93clVuZXNmeVhHclJKeHNoRVVKUndDUW9S?=
 =?utf-8?B?TDdKVk4wVWxOV2J2VlREQ0p3RVY5eW1HWDRSNWpxRXIybnpRRENDVWV1di9j?=
 =?utf-8?B?MUxEUmphV0hhU2cvRm1OR1JQMW4xSUF4S1NLN0wwNE4zdXExQWw1Mjg2djlj?=
 =?utf-8?B?dlRESDgxdndlUEVGYS9sLzF6bXd3UEpUejBpVy9IZi8wUXF6WFhBU2tPbzlH?=
 =?utf-8?B?V0V5cjcvOUZDL0R5Wkc1RFd4VWhDRkdzbjB2eW5HdFV6ZGtGa3NZelhpeXND?=
 =?utf-8?B?akxmcU9SbnBhWnZyK3d4YWRvVmdSNWFmU0FEL25ieXE3NnVMSWxTUDZzSU83?=
 =?utf-8?B?ZWFuK3g3Q1QrRllQWWlZTnJ6cW1KdnN3STVjWFdIa3pXakYxMjFYWCtKNkdl?=
 =?utf-8?B?TVpmbEtqMUd0NU5Da2I2eWtpK3cwSElyUEIrbDZSY3NVaHRxdi9uZ1EyRmxX?=
 =?utf-8?B?ek9QWHFZVDE0QkN1MEY1eEVieERUK3lWOFF3bkhZSWlvb3Bocng1MHJiMW5R?=
 =?utf-8?B?bVpTMnpqZHo0Sk1GeXFQVndEV0lkTDdmTzZMSkVydWxObklOZ0dUb0dtWFJr?=
 =?utf-8?B?QjlZQk1nQjRTcTVTYUNQaGszNHQySXhrUEJDZGN3SVF2cUJTZW9vVnphc3Vm?=
 =?utf-8?B?OWllL290c0tFSUNHaWkzVHlHaHUvaG51NGFDWGZtM0QyNHhZNjVLbGpEY1ox?=
 =?utf-8?B?ZmtxNm5PejdYemxNdDF4UlY1M3VTWTlsblByOWkwTFhWdWRpSWpOLzkxMk1W?=
 =?utf-8?B?QWptRmpvNVAzSWxMdjVaQjhVdWxCdTl1aWtxR1l2NmdDL2lZSFBsVUJ0NGZl?=
 =?utf-8?B?cURORE5xcDR3UEhHZDBnemdEcXJxNlVGSnQxSUNyYVpWTGp4clp2UzlaZW00?=
 =?utf-8?B?V3RaenRsVlFyc0ZEb2VsdkdxOTVaOFJseTVRMzN0dEp3a0d4SElxbHZPcHox?=
 =?utf-8?B?SHE4K2U2bCs0K3pHSDdOYVNRZTdXVnRaS1czaDBzT0hTakVwYkluazRSUEV1?=
 =?utf-8?B?ZGl1UGQzdWpYUzViR0JWVFJEUWxvT09yUkZDVTk5VjR1amtENHlqSlJ1YlZW?=
 =?utf-8?B?RTBOeDNkenpBWnpPeFhIRUxRcVBwTFc2Q2JCZGJsSHFCTXY0dW1renBXRjIr?=
 =?utf-8?B?S1g1cGhDa2FGQ1FvWHRTTkFkTUJ1V1ducytNSEhNeTlMREFiRGJuM1EwNUY1?=
 =?utf-8?B?TllKaXNvZkNKclVkR2JxY2tiMndtQTAvTjliRHphTzlyaFdxSGF2bTRHM3U0?=
 =?utf-8?B?Ykd5YVd3TW91bEJOQ21JcTFmZG5SYXd1Z1RKN2ljNmUyTHp6OEk3bnExOG5j?=
 =?utf-8?B?cG5McjlsU1BoYVRHMHUzZTA3ZVRCTjVIT1BGRHZmbjVaVmJEVmdXWGtpcHZN?=
 =?utf-8?B?YnhlcTZEWnlCeTdvZkJqYnE3ZU5mV29CaEsxclBxekh5L0lPVjd3WDRqZllx?=
 =?utf-8?B?SnZ3SUZKVkZrQjc1L3FhS1dwRUFYNWxEZ0ZnYXkrdDVRK2lLSng5UVdjZk9M?=
 =?utf-8?B?TUZOUmZNTFdwRENVZ2dkTndpbXVHZEtRa2xuWDNrdTUwVlo0ejU0QUc3ZFdm?=
 =?utf-8?B?ZmFPTnB2WUUzZTh6MElGanZrdnlzaHBmUkx0U1BSN2JZSXUzOUdqcXVuTVpO?=
 =?utf-8?B?OWYyWGY5b0R3ZHJKZkZZTVJjZkNweWlUaVYvcFc0UDZtWEtQYXhuSzZIaXR6?=
 =?utf-8?B?R3JBU052Ti9HcHJaNzJJekJmTU9USVBKbVQxZStZb3VFN0ROVUxKMU16SG4x?=
 =?utf-8?B?QzNkbU1tMDZEcmp0VXVzbU9ZbGF4MVZMaGttMjMvcFRLT05KdTZ4OE1MSDgr?=
 =?utf-8?B?Qk5BL2k5Z2NzNVJhbHNiZXQxTW5HcnQ4Y1pGc1U5RkpZUnVaT202Um10eTNu?=
 =?utf-8?B?NDhic0NlTklvckFWeWtvVUpVeEJ6dEZManlGMTMvc29mN2pwRjRHeGUxbHEv?=
 =?utf-8?B?NjRuOTFZWS9TYlpTallxb0VJVGo0SlU5YVdmbSttOERIME5NZ0p4dmFpNGZm?=
 =?utf-8?B?SHNmVHIwWWNQTmFWT0lhQm1LL1lHRXVNdGNCOHh0RTNBREhlOE9XVnhyNjNk?=
 =?utf-8?B?enc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bd56218-3899-410a-a6a0-08dce229155a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 14:55:26.2978 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lllwgczxsezeei2DGHg36E33NuV0WU737xFGQhOHNNdpKdfBvnGtvYgh5yhvvXkjir8B7ky5sIzJlgn7i5VBNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8409
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



On 01-10-2024 14:13, Matthew Auld wrote:
> Unclear why disabling interrupts is needed here. Nothing seems to be
> touching fence_lookup and its corresponding lock from an irq so there
> should be no risk of deadlock.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_ct.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index d3de2e6d690f..3fd1d4e97528 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -890,7 +890,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   			goto retry_same_fence;
>   
>   		if (!g2h_fence_needs_alloc(&g2h_fence))
> -			xa_erase_irq(&ct->fence_lookup, g2h_fence.seqno);
> +			xa_erase(&ct->fence_lookup, g2h_fence.seqno);
>   
>   		return ret;
>   	}
> @@ -907,7 +907,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   	if (!ret) {
>   		xe_gt_err(gt, "Timed out wait for G2H, fence %u, action %04x, done %s",
>   			  g2h_fence.seqno, action[0], str_yes_no(g2h_fence.done));
> -		xa_erase_irq(&ct->fence_lookup, g2h_fence.seqno);
> +		xa_erase(&ct->fence_lookup, g2h_fence.seqno);

Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal
>   		mutex_unlock(&ct->lock);
>   		return -ETIME;
>   	}

