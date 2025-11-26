Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25FFD10375
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 03:17:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6958210E0F9;
	Wed, 26 Nov 2025 03:17:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GGQMC9as";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D8410E0F9
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Nov 2025 03:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764127043; x=1795663043;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=mLLQcordyh7tsyzoqlnTdgYOzQqCH4Evf3I5DbF30YM=;
 b=GGQMC9as+EDGGZuv8Kv5WvbJeVW+oPXrnD0MWblU4FI5IqKncWGcNH9U
 cXXg9DlZmVrB4ABx3b0HQuWs5AWiYWnaX9ajMrUOUeQddqoviup3J6qs8
 YlOR8Mr+aSaliQ3LLtV/7tn11Xa8gw8AXd3a8bb5QNppOH8MjOIAV3XJL
 q/zuel01tb2/WNcaOw4VTVbNAsy2jszh1oGlDufBAflXv5w5YcQTiwlWx
 El56grsgATtP7eykPfdjuT9h7pnQV5TE+FLIqQjWebDkP9XE3s4O071wq
 7LvX5rGVE4/3oYRUCgvNTM1ZVYiUbkBp7xCZNwNc34rUk9uo56OM6fo8X A==;
X-CSE-ConnectionGUID: JCv+f15uTXyMz2uWFY0TvA==
X-CSE-MsgGUID: /FIFUvB/ReqBD60o6u3/4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66102877"
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; d="scan'208";a="66102877"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 19:17:20 -0800
X-CSE-ConnectionGUID: 2cm0OS+QSfyV9Oav5EvPVA==
X-CSE-MsgGUID: L6WEP4R9S8qM44rJ0J6XRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; d="scan'208";a="192608992"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 19:17:18 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 19:17:17 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 19:17:17 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.41) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 19:17:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sQPNW0SOLpk45HReZjyef98eugSDd66ZsGbEk+AnNMfGBOOWQZH5TtJMfcf4bxzILsL94S8YR3aY2/VTGxb3i5Z/Nr204es4G1xBIKdZIhJPT8B2YqpyJwGzOeAM4bRZOtLcSeKDri2LHLn3KoCFy+LGjdHOOfZGabzMux6T6Y//5T4EtkuBqS7qoHxFhrpkdELY1P5WRdVPi2RpOMMe2SkS9JnQ0PtktJH9iWMyTEEx/sQuTdbSfbGk57tUXHw68oF++Gxi+j10RhH0uii9TDj1vuAYDopbrL2xJ1Q54Zy/setDPglfkn591KIdfcaohluGk5tlrx6xNOBBMGAm3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LCO8M7r+YoELebKIq69P9xSE4eTv05numQke0c5FpoM=;
 b=Wod27oufug3qyb2A6xlwKLzTs3MI7hWONz9L0Q0GtFVvRXDXEceDdf0uZUEO4n00ChEzGLVoMTm4PLIP0b2enPem8y/MjbWchH8Aey0zyismSR+O4IUwu9IsKSYuHCyrFvZOEhOUgsu7OdosjWlNCTcHtYxo7apQwqBT+xCC8B6pUBQNSKq2CicnmcK9I4Ss6p3GYM7lqGccIDgUrUJjNqQju8ReOQpjVfQFiQDfa6pxTvrAxxwngp0ce9MV8XfNSpvNSGj9XKSodlYNQ+Ujhg1/XlX3LB9cLBLGmUQydVqEnQQRHfR+RlIReepEXxnTt+kebvkQm3Ni2h2DG3lpOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by IA4PR11MB9250.namprd11.prod.outlook.com
 (2603:10b6:208:56e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Wed, 26 Nov
 2025 03:17:15 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::803d:39cb:d276:4ee5]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::803d:39cb:d276:4ee5%8]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 03:17:15 +0000
Message-ID: <be3df444-d021-4041-ae83-6f38a548d1de@intel.com>
Date: Wed, 26 Nov 2025 08:46:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/gpusvm: Limit the number of retries in
 drm_gpusvm_get_pages
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251122012502.382587-1-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20251122012502.382587-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0238.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::19) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|IA4PR11MB9250:EE_
X-MS-Office365-Filtering-Correlation-Id: 19a1b687-f7ca-4e7e-afd8-08de2c9a4c75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3hQdEFseXZJVTZLMWlSczdMZkNEdzRIczltcG1aRzU0S3QzcTZ2R2Q0cHZ5?=
 =?utf-8?B?VkNMV1JkaENDZ2ZPUE0rOHQvZTg0TldjQ2NaWEI0Y3NYWFc1aHFyTEoyOGFC?=
 =?utf-8?B?cnZiTW1LRHVweDdGcGZ1Q2lLeElnclZ3ZlFyL1FWcWc4K1J1em5kOFJmZTdz?=
 =?utf-8?B?SGZEUjZMbk95WWhFampNZ1VuUDR4NW9CZzU1RGdieTZYa2F4a2NVT240QXZj?=
 =?utf-8?B?SFhyTEw1MXFrTmRnQ3M5RE9KSVQvVFVnUnZsMy9hTXR0ZkwzL0tOS3l4VHhE?=
 =?utf-8?B?Y05aSWZ1c2hmV3ZxMjNpcnc3SW1yK3VBK3FlWXdXR0x5cGtndnVWbURKd0VJ?=
 =?utf-8?B?TXZhcXhkMVVlUk11ZkRVenlnN1N1VG5WYkNMWUpUK2hFQm1nbzVHc05hL2FW?=
 =?utf-8?B?dVZjdld6NkJWeklXczh6SWNMUXQ3bkZKL2ZMM3RsMzVyNjRLelp0VlA3Z2gy?=
 =?utf-8?B?ZVZ6d2FTZm9sMlFjaHFGYWtMQncvUldEc1JUNmlJc1Y2ZUJwa1I1VTRqNmRU?=
 =?utf-8?B?ZlhKbDBFc2xDMFk3Q0tjUkJOQTJqWDF0Y09pQW1Rc2dUWnBGSHo3dDhMWVVB?=
 =?utf-8?B?VXBGMGRDb2dVNjIrakhCSzE5MUw2eG5LdUl4VXRYL0tQK3F6SEM0VkhhR3pO?=
 =?utf-8?B?NjNGa2o5bjhKbnFZUmI5QmtpZEY1a2NFZVdueUhmZlJhemFGemswRGEwMjFJ?=
 =?utf-8?B?VU9OZU16MjFkVjRYcDJoeDllendWRFlVU2E1L2lQTDVYYVJzTVlycFZCYWN2?=
 =?utf-8?B?eFR0cWdraVQyblAyWmprc01EbnpQbXpMOWhQQ2ZuekJyaExWdEVab3FUWFBj?=
 =?utf-8?B?alV0WEszTlpHb0hqNTRIZVhlMmprdDlXTDB6WDlsSi9qNnY3TlcvN1FVZWZr?=
 =?utf-8?B?RjlaalJNeWo2d1RMRWhRMzhsUkNOWlMyM3cvdVRoQWwyL3lPeUlpNnY5c0tm?=
 =?utf-8?B?TDdpSnNBS3FDNUtPWXdWUWJFaDkxVmN4eCtkNU1VejFwMDN5ODNoL3FORmVv?=
 =?utf-8?B?SW9Lekw5TC9TcGlvelQ1WHVDb2FFbFdVYkxpbm9mQzNlSms2c09hZWJJWTdU?=
 =?utf-8?B?bVFDdFdZV2tiSUVyL1cxNFBVUkx3R1BnRlp3MXdNZFZlN2pqSWc5TXhHeTNX?=
 =?utf-8?B?NG10VTUxSnBPSVJTcjFtN0ptOTM0OUd2MFVONGU5U3JpVzFyMGNpWFNPUEpn?=
 =?utf-8?B?VE1vVkRUQ3lGR1FrbG50LzNwQkM3a1ZBaEVDRGo1SittSHBzM0YxT3FVR1pp?=
 =?utf-8?B?UHNpQjdwaURQd0lKVjlWL1llUEZDUkgwYmRWMGdPUDBjcXZIbjFiZndDaFJq?=
 =?utf-8?B?dDRraGVLMU1wTXE2MlprcHB0RWNxMjBsenp0cnU2R1drSUxPQWJiZlJrSUI1?=
 =?utf-8?B?WGZpNGdUejk4YjRyZysvZlM4Wi9aQ0w3a2NPNFJLamxCVjE1SHIyK25Bem45?=
 =?utf-8?B?VTcwSGlkMXlRMTRjQ3k4cnRWd0dXMDl1ZUI2bUc2cks4SnY3WmpQQ3N0RFVk?=
 =?utf-8?B?Q0JHNWRnZjR6SjNlNzdaUUVQMi8vM041UjFtaW5uU0syQ2UyM2RTN0FXdE94?=
 =?utf-8?B?ejg3TkRpSzFGWFZwb2JrdG9DY1JqbjhVMUJySW9maUMwa2gzN0YzU0hPU1BC?=
 =?utf-8?B?RklYcEdrbDVZTmg3NEVTbWhQVWo5b2Q4QTNzVkpZK0R1Sk1MM29PRHFiak8v?=
 =?utf-8?B?eEw0dVN3WjFEcFBKMDMrUVJwdUR3S3NHVnFsM285VlpTcTFMS0Z6eS9Md2h6?=
 =?utf-8?B?S1ZuanpVU3FFeitXYm1ycjlPRTZzbXh4Q1RYWWM0dXVYS3ZSWTE0WXhieFlF?=
 =?utf-8?B?YytFdFBGNmVnbmpMS0NSNHBTRm0rSS9GU2M1Tkhrb01zcENGSklJbE4vQkdN?=
 =?utf-8?B?QUc4TWUxaUdJaUl0SlpRS3ppUU1Tb2w3UzZYT0hzdEIyQ0JGcVNycnQ3YVVY?=
 =?utf-8?Q?5rK8YZsH5EL5r8aI8f20Wryt3suC2MRQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDAzYW1ySXlNN0p2Y0dBampVRDZvalh5K1BXeXN5NStIdmY5cCtwd2p6KzVX?=
 =?utf-8?B?T2V4am9QcGorYWFEMVF4MDNUcGtqQklJNkdwQVR2aXQwT3psbTNNK2RHaXNl?=
 =?utf-8?B?ejNsYkM3UWhUS21XR3JiOGRtYUE3T1AxMmw4RjlWYUpDc2J3TXpUVnlYd2ZL?=
 =?utf-8?B?VmwxK0lwdWE4STJSNDlsNExjTGVYVnA3TndrbHUxZmRRM1ZuQUpsamtmbWNv?=
 =?utf-8?B?MHFXNWlSWXgwWDgzTVBHQ1YwZ28rYUZ0TmRHOFVmc3FjY2hoN05tYmNKMURa?=
 =?utf-8?B?OXcyVFpQSXc3bGRQblpLRUovV3lhdUtvQWFPaXJWc2FYaWx1UEZkSktwSzdU?=
 =?utf-8?B?V1FZWHY4MDRQZnl4dWIvaWxLTzVTN1VFZUk2S1A1QkQvOXozVE1JMzIvRUpQ?=
 =?utf-8?B?MVR4MXcxM2tJTHAycGtwczdra2NPaW9BZ1VlYVdkYmE0bm1ZUC9qNzlmdS9O?=
 =?utf-8?B?SjJQcVN4MVFuNExhTXFKUC9MVXNjbi93MUZUWGppK2dEV3RxT1JjNTllMFJk?=
 =?utf-8?B?M1RWTFl1QklPOW51dXh0OUhUNzJpOEpuL2VCczgzalZ6Z21TcmZwUzU4M1Ur?=
 =?utf-8?B?YlBQc29Wc2tmVWdJV01jUHo5dDVVdzNKQjlnRlFjUkxrT3JFc3pQWGlycnJG?=
 =?utf-8?B?YUtNL3VYQlFJQWZ5NnBOYjBZMjRoa1ZFRHU5aWRwOC9HMjJrTldpTmxobW4v?=
 =?utf-8?B?STBpVnViT2Z4dmgzRDY1bkZKVThiVHVNY0IvVGQzS09EM2pXZE8rMUZVQXRi?=
 =?utf-8?B?a3FRNFNadGJYTkxEMS9uRi8zZ3U2UGFNRFpKTXNsMWh0QnBXbjNNRVhuUkNE?=
 =?utf-8?B?OFVYSUVid0hVZmNlSFE1ZzlIbk42blNzL3A0WDV4cW5qRUlOMXNjaFQ5UHls?=
 =?utf-8?B?VXFrNTRNQkFMck1qUW1Xc09QUjg1YWdLYVZqMW9Uc1FjOUN4SVRlbFBveGx4?=
 =?utf-8?B?T2xrY1ZmQjlWZnFyWWdpRzl2OFNCaDd3R1RVVXQyMExTMWNzVVpPVVI0MFpq?=
 =?utf-8?B?dTJ4MmIrcUVDNWJyUGdvTkpFU2RLdVhLa3Q5R0JkblpQSWdiQUc2WFNxWWY4?=
 =?utf-8?B?UktaWHBwbGVsS0I3NkthYUlPUXF5R3pPQUYzc0xvM2FQbFErVXdrYXh5VE82?=
 =?utf-8?B?bmFtRWJzcGNTajBCcElKb3lNcXNsc3dZdFFUbDhqN2d1cVpVWExMK092NFZP?=
 =?utf-8?B?MTJUV0V1MmpVQ3doeTlFM1ZscVFjZ1dxYnhTUzJmSXV2S0ZGWlhtc1VVRTZP?=
 =?utf-8?B?bkJsRkIyNmdDdEQ1andMSmJtOWU5QWdpMkNJOGp3cFpSbEpQcGY2OWNzKzVO?=
 =?utf-8?B?OFBtcjZYcXY0QWtjOW9BOUFFcjl6UUpwRzVxN2p0OEZZSk1hMXYycHdGK0Zt?=
 =?utf-8?B?VTlVd0pzaUNPS3BWWlVVZXpZTnMzRklmOUtwdHo3NmJzNGtDUXNZeU1zeVRa?=
 =?utf-8?B?Q1Y2REZ5MGlLdHZzNmN5V1lyZWhVRnFNQ0l6WjNvUXFBUjhIV3g2ZG9ZRzdG?=
 =?utf-8?B?ZnhJNWgrMjB2d0lBNU5Lell6bDhmV1o0R25YUm9wcFk2R3gvR1lnY0RISHZV?=
 =?utf-8?B?eVhzTFpwTnRJU2JkK1VhK0I3K3U0alNyRWRJK1UzVDFpY3NvVVQvbWZ4Y1JG?=
 =?utf-8?B?Nkl4bFgrejB1Vmd6UHdsc2hwU1UxenQ3dUcvcnVQSVJUcmRtVWpKRHZWNElH?=
 =?utf-8?B?TVo3bFJ3Qk1zMkRaUlhJMno5cHg5UWRqaWFzNjRJbFp6aFVvQU4vd2RGdzly?=
 =?utf-8?B?NkhHSS90MHpRM04zZ051bWx5Q2FHbTBBbHdaRlhVTEdvY2RlL0ZRcGU1WUFD?=
 =?utf-8?B?a2cyTEJ4TWdZQU9BNVJHLzFBY28wK3RUSTFFL29yQlJrOXQ0K01TVlJVSUVr?=
 =?utf-8?B?UWRNKzFpbngvMXV6bHhjcGY4a21mc2doZHp4b0x2U0Q5K2Q5WjYramJETkFO?=
 =?utf-8?B?bGQza2dEVGNxTXpzMHVXcktMSEdadWR2cFZBeGlOY3hKWk83SFdJZEpLZjNW?=
 =?utf-8?B?STNRenU0R1Y1ZkJSekFIYW5vL0VVY2MxeVlLcVdOQWpZNDIxZWpyUkVKc2R5?=
 =?utf-8?B?YmFIT2lGTTQ3cVc1c0thU0E1UFVhQjgwYTN6NU1RSjd6ZjNSaDhta0pDZWtx?=
 =?utf-8?B?UGI3dHhtZ3VENUlLNzBGcXg4UC9OcDFTd0ZhbDUreU5LR3V0dDhDSXpRMURK?=
 =?utf-8?B?MVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 19a1b687-f7ca-4e7e-afd8-08de2c9a4c75
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 03:17:15.6247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OIUvsc+kKPx80H/HJZdf7ZkH8j/Or2/srS98Bg+pOG+DwteodRmoA/vOmlG2/zwqfLyDpqAECviQIQAvX/4c1YSu7HI9n+z7uXDwYAtMhYE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9250
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



On 22-11-2025 06:55, Matthew Brost wrote:
> drm_gpusvm_get_pages should not be allowed to retry forever, cap the
> time spent in the function to HMM_RANGE_DEFAULT_TIMEOUT has this is
> essentially a wrapper around hmm_range_fault.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> ---
>   drivers/gpu/drm/drm_gpusvm.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index 73e550c8ff8c..39c8c50401dd 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -1288,6 +1288,9 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
>   							   DMA_BIDIRECTIONAL;
>   
>   retry:
> +	if (time_after(jiffies, timeout))
> +		return -EBUSY;
> +
>   	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
>   	if (drm_gpusvm_pages_valid_unlocked(gpusvm, svm_pages))
>   		goto set_seqno;

