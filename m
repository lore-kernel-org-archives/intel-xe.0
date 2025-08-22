Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5CA4CA0EFA
	for <intel-xe@archiver.kernel.org>; Fri, 22 Aug 2025 00:19:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FC4C10E065;
	Fri, 22 Aug 2025 00:19:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BgnFaN37";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EB8F10E065
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Aug 2025 00:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755821962; x=1787357962;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=DuSXjQZmpoeSTfjtG0K2XgHiYNML3XnHBqff5tca7vc=;
 b=BgnFaN37LVkwZnyxDg9Zn6n2ec5EWd3JHIwl1EuhyidSZ2kiwPlFsZc/
 W7dzS6WzhTe1IG0pIs8/bMhe3hDGz8Mssv3TBHGOT30iFrePC6BRBf+qN
 kKs8MtRQcx7DX+OhZOeHzvRxToPKg6Dfh4oVpubzKiJglrKW4qNuLLkJS
 L1NrVjcNhE0y7UDFdT/WzCKWY5QDCXayeKWniRjX+fNk5dxt6YyX7upph
 j25cqz4FEWxvLXAdmeyN+YSR3sxThaaCxi1QRrVnRhsFxOfzdRk6SGvHt
 0svFSf4qmshOJF6qhcngZXNBUw6YpEupp5J9ScoqROX0Ea6G7wPw8r8yK w==;
X-CSE-ConnectionGUID: 10rVOv5WSiK21O1TOoGHeA==
X-CSE-MsgGUID: tTggegPWT72I/0ZHqq8koA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58193004"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="58193004"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 17:19:22 -0700
X-CSE-ConnectionGUID: gyFGSlP0S3Shlt6XY6B81A==
X-CSE-MsgGUID: LXiPIQ/sSTqgxr3EKW6ytQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="205722203"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 17:19:22 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 17:19:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 21 Aug 2025 17:19:20 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.79)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 17:19:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TFahomsf2byBWzxI+FPj0MK0TCW2EK43FYxy+3rx7oXpLlAhBYeaWMUxW2l7YKPzDRyP9Nv5HfVebGSAv1OqgqJvghj73tjiMp4aEz0HoFXpACipuKrOloMfAkaAtKUp3JX3+rmEQ9OJDy82rEKWvX+ArJ5wZiD2rDu61DQ1GFpuu763yuUFRYnyskEy5Xf6nTS8kfMr4OoJzH0bQHGZH3IJkIQjTn8lYX34V3l7nuOa5e31cHtIdVf5s/phHXDLzdY/Udk8O5ija4BjPn4ugtSo8hgCUVFEHQIaOEfZiHj7hXBGEoZz0BzP4ERGpjaCukcRN8dVwWH/PUO6k8rpZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gD1kEpH0Y4j+RGTyjLXv3kWLAgqXAkHrp8O7mMMKXoM=;
 b=ZripJyVwgCtXaVMToH0L9qm2dSZ09oAOYcV5nSrC7g2SoYPbc2A8+PMQ0ii0yjIoE544tiYeWczXr/BCcWHcwYAO0X72qY1ItTxWbL3lpzoGLKJarEMjvzQUsxmuqZNxU/rzGQGEwQ301vQb7lE08ZcbvcMD0dOGwTXGFjUpp/igze9hRX6iTpMKVbk/sgcVZtO5RQfl2SxxBsHUGs/YfOTxBZYjNvlIzS9ppKuIZMTRaHRsJwO2G7QymYse7QHTYLnMU4e1id2/qVzzdNBwnXBsQSGIK2WpMTchKoDJgQSLOuGgwjE1EGnjsnnPcgtCEE5L1651xu63KBsfdeuoHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by BL1PR11MB5223.namprd11.prod.outlook.com (2603:10b6:208:31a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Fri, 22 Aug
 2025 00:19:13 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9052.013; Fri, 22 Aug 2025
 00:19:13 +0000
Message-ID: <7903595a-4611-438e-9257-0ac990bff36e@intel.com>
Date: Thu, 21 Aug 2025 20:19:10 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/6] drm/xe/guc: Add GuC log event buffer output in LFD
 format
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250722013553.1266218-1-zhanjun.dong@intel.com>
 <20250722013553.1266218-6-zhanjun.dong@intel.com>
 <44a15fd9-70b2-4e07-b599-f7f4a648fce7@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <44a15fd9-70b2-4e07-b599-f7f4a648fce7@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0269.namprd04.prod.outlook.com
 (2603:10b6:303:88::34) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|BL1PR11MB5223:EE_
X-MS-Office365-Filtering-Correlation-Id: 7defc485-4114-4fb0-456f-08dde11185e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VExRb00yVThaRWFTelUzVWxGSjJxbHdxTy9vOHpPQ3Q5VWhMS1FrZllQN2ZS?=
 =?utf-8?B?K0lqWURVZ2NMOEdocnl2aDBsRnNHcENuOFAwaUpHdUdRN01DYU1oSkUxOGo0?=
 =?utf-8?B?NHJaUUN3UlhuZTJ5TlhHbFpyYUtSdUtoT2xJd3Q0a2JxWGozMk4xVXBTRHNo?=
 =?utf-8?B?ZUpuTmxDZ0FsYW5aYnNIVFRDS2F4U1hiQy9pMm44dE5ocThjZU01R1dEaWZi?=
 =?utf-8?B?VHlVTjBSNkdxM0sybDZBTEdBYXpVOGtrcjVZNnp2TlpUb3lOUjZBZFZwci9B?=
 =?utf-8?B?K2Q0aUlDY0hVUm4rSm1zU3dYaGJldFBGV2hoaFdDR3l3cCtSeW9VZ0wyaS81?=
 =?utf-8?B?OWZ5alRVQ0JwL1BGN0dKNzF6eWUwRlhxeDBnTnhzdTRxSDBxWkN4SkpmN0Zn?=
 =?utf-8?B?RjZHVWJpWEdrNSt5eGh0TDhaN3BBVWxMTWdkTXJyWlJJTUdvNWhBTW4wYm9z?=
 =?utf-8?B?bzJ1RW9uSUJCayt5cTZGNUxLbmFzQmtTU2wxK3ZNcVhscWdFSFd5S2Nxdytk?=
 =?utf-8?B?SzV1UldwUlAyci9uNmMrZ3REbm1ZNWMzM3lMeTM5eThCNXRibWs1b0ZQano4?=
 =?utf-8?B?bHd2K3JZb1RTVVdnaGoyMEV5TWZXd2dFWEcyZEMzSDJZR3NyditsS0pNZ0Nv?=
 =?utf-8?B?c0pDNGJMNzRNcEJXUmZQaUk2M1JraDN0Szg5Zmx0OXRkeWZ3emp0a3JxaWll?=
 =?utf-8?B?cU1hMlp3WHRaaG5YUGk2a3JGblZEQkFvb2FSYnNOMjBPdE9nYU95N21SRUhV?=
 =?utf-8?B?Wm9NKzNTa3dha05LZUo5OGdvck5maHQ5K3lkWnk2dWo3ODBscWJrdFZwUTdW?=
 =?utf-8?B?cUVDQ2pIV1ZUQ0dCNjV4QkZLd2hZYTRLQkRHZFRLaTBaVDdZak83MTZlSTVW?=
 =?utf-8?B?NS9uZ3M4cDBrcXZ3a1VEVHhHOEVsOHlER0FOVkR5b2FFbzRIM3NZOXhmUzZj?=
 =?utf-8?B?Qm56SWROZjRmR056NTVKVHpzZzBvOTdkQzF5c01uaUNhOTFsTnZTT0l2Y1hM?=
 =?utf-8?B?SVBIK1diUUdYMEZXSzdDWWtGQmxYL2ljNUFudlljcG9JVEE4Q1VJKyt2TThH?=
 =?utf-8?B?RnhZVXZhN29oanRVbU5mWEFYNjNJK2hNVWxyazRWeDNSS0RraG5pM3g1RlpN?=
 =?utf-8?B?TVN0TnRUNFJDOUxCY1RBeDE2Nm5JMDVCay9LOWRxSkp1OE5VNzhMY09RVldW?=
 =?utf-8?B?d2tCd2d6ekZjRXVpaHlZcmpReWtCWVpIcDJMZG9hN3BNT29tdXI0L1hxalpV?=
 =?utf-8?B?QlFFRHFvL09sM2JocWx1Rk0yMFR6cXpueFBkamlVR1M5blRia2VHeXFrbitH?=
 =?utf-8?B?VEN5RXNTRjJRMHJ4ZCtPVmtCbExTZWxTbTZhZ3ZPNmorM1JKMXhHS0k2Z2U3?=
 =?utf-8?B?ZEJwVFQxRDVwU2JLWjZMZG55aFNxK0dpNm53QjcvZ3Zaa3RFSmdEQldUTEh1?=
 =?utf-8?B?R3lGaWwvYWJ0V250cGoxT0lIUEtJOG9qc2dpalY1QjA1V3FjQU1xYmFHS1RT?=
 =?utf-8?B?aGxlT2pBdGYyVmRaa1FlZWJPcE9GbUc1RmJXaDFJZE0xOU9TbEEvY1FtOUVQ?=
 =?utf-8?B?TEVqT3lsZmtUN0VER2FEUmJlRW5HVHZmOHVJb0hqempGU0EvdVAxaUIxMGJo?=
 =?utf-8?B?aVZGTWZ3UHhIbU1vaXd1TUxUd2ZLZ08rdnhOdWtnTk1Zb0hCeGRpY0x0ejQr?=
 =?utf-8?B?dkwyWGdzTW50UExIVHpFSXdTSzNzbTZmcjI0TTQxNDdGeHIrN3lzQjhxbGJP?=
 =?utf-8?B?Qjk5YVpvaVNrZE9OMHVGM2pOd2R3bTFLNkpaUFRTRTZXQlNhb2V3ekkwem9w?=
 =?utf-8?B?bjY2bnFHalFFSm8xVm95RzBHYnlGajYwekVmemQvNDVxcFZNM1NVTE1qZnIv?=
 =?utf-8?B?N1lXN2FYRmViZFU3Y04xSk1vdGFUZXExNlpsRFZhRERuOXgxVFpYQXlZcjl6?=
 =?utf-8?Q?whCDCX5+eHs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTBtbVNHQXJsRlpFSU5yUmUyempic01sdDBaQnE4Tk8valIwc29Oc21wWmZE?=
 =?utf-8?B?WjlpUVY3Q05ueFY4ZXpmWUtiV0ZwRTNjTUltN3R6NEVPRlpHQjEvdDlaaXda?=
 =?utf-8?B?VWprMGM2cjZGS2ZsRGRBWFZtTDVHdzkvTXViVlBkdmpGS3FQSENaT1MzT0o5?=
 =?utf-8?B?b1hLK3VzY0d1UkZGV2JpM3h5ZHhhUlNVbGQwcEpQTlp5WW54N0VLOVdWMVVK?=
 =?utf-8?B?R2NDTE1nejhuODFyYkF0cDlTZW9rZDVoNVFxZStXTW9kd0thUXJnRW5XSWhJ?=
 =?utf-8?B?T1JjaUk4dkYwK2N6UmdIZjZqUGdJKzI0OUtMZlpsRHVEOWxBT0lJRlVqSEdh?=
 =?utf-8?B?SDVyemg4VjRtRmpVQTJvRS9IcDJHbVZPQVE2K0U4QTRSR2QvQWYzVDBKbU1H?=
 =?utf-8?B?VENnMHpMRXZ4ZUdEVkorNzFOLzJCakVmMmQ1V2dKSGNORXJWVWpITkprRHZZ?=
 =?utf-8?B?Yk12bGNIbTRGTWhqaHRITEs0bi9Ba005U2J3OTJOYloraFMvUUsxS2d1ditL?=
 =?utf-8?B?MEdES3VnRVB3SFNWRGtGUVBYVG9KSm5YUlkwbytXYWt2Mk1SWEJNemlpTVUr?=
 =?utf-8?B?eVJ2VlVyR2ZrNHAwNUZkWlhUbTVXbUFkRzhwU3FaVUI4OGF3SzkveHd6TXk2?=
 =?utf-8?B?RjlGeUdiS1RIWVNya3lPQVp3VE5ueXVNL09qOHFidGZ6d1FxK0U3UStBUTJu?=
 =?utf-8?B?c1BPSWxyNzJFZmtpOE1EbW9RWmJ5bWw3N2lvOEJpbkpaSGtnVGw3L1JHYjlK?=
 =?utf-8?B?SDlKV1dqMGJQZlpCUTBIOFRuRGJoZUNXczluOVdjcnJKVVBETTBRdVBhRG1u?=
 =?utf-8?B?VC9WZ3Vkc2dkZFZ6RFhFckl1d1BQY2FkczdNR1F1MDhyaXlhVkwrRFd4WmV1?=
 =?utf-8?B?eTA4L243bVJDVm83c1RlOXNrWS9qUHpwUEV3RFB6UDVwUjdIT3VZR2lnMUlk?=
 =?utf-8?B?V3BpVkx0UDVjeVQ0VjJ4Nng3M2ZOTnFUdjJBVW52cUtSTFlPSEdiamFzUzRT?=
 =?utf-8?B?dmpxU2dxRS9nUXhNdmxCVzBwTUI1RktwS0tsMkF0MWd5UGs3VUpXQU9MaVpu?=
 =?utf-8?B?OXpFMU5FZHdTMkV2dGljZnBtc1Nab2VKaE0rS0FHSkRNeHNDVzNDTC9OSTVB?=
 =?utf-8?B?TW5zOUpBUXlFTWpuM0JiUjhJRWZFZDhCelc2TE9rY2Z2MHpaemNQN1ZBWktV?=
 =?utf-8?B?aXB1bGFNOGRoOHhQcTJxd1RkOE9DdEJpcE5sZVZsN1EzR2dOVUNSQWpYMmJ5?=
 =?utf-8?B?RGh5ZlJCd25HMGJ5TEU1bVBEd2lpQnF2bmNSakk4M0V2VFFSdVZ0NE5CdWNR?=
 =?utf-8?B?dlNKK21DRXk3aUNWUmw4dWVibjd1K3I3d1hnbVFydmMwWnFRbTA3U3hqVFJn?=
 =?utf-8?B?UTVPRDZiRE5oY05YWDVFTTc0RjBzS0d4Z0g5a3IxWHI1MWh4Nmw0UGlCeWFw?=
 =?utf-8?B?SzZZdEc5c2h5K3VSUkZUZzIybVFlejFxUFovcUJncEU0Y2RuVmNFWExkWW4w?=
 =?utf-8?B?dEVFTmpBVGxadzdubjVNMWdqelYrT0tWdHFFcExLeTR1bStydXJ5ai9oK0xs?=
 =?utf-8?B?TXZHdG1pYm1HR08xdVNpZ2NUUGN1NWV5N3Jpcm5TRE4yQjBlNmt3THNEMVU3?=
 =?utf-8?B?MzRVbC84R05mMUwzNm1HMXZJZ2puWXFCdko4dm1UMWRZR2ZOMFkva3A4bjRk?=
 =?utf-8?B?TytlUytkS3JVckU2NEdOaDdYTVFQV0xpYWNFdDhOd2x6K1N0ekhtcm5UbWt2?=
 =?utf-8?B?alNKV2lLMGhhUDZNRUU0c0M5SXNLVWNQOG5kUVhTcW40ZWNDaGY0MkJPb2t1?=
 =?utf-8?B?L2Q5UGliL2RsbytCWURyZG1kTVUvbWttQ05pNWhVdlpZaXhrR1RFWW4yZ20v?=
 =?utf-8?B?KzM4Z25UenpwUWxaWmE3dUltWHE1ZHhDeHVvTFN2TFEya1p6TmM5TThNdzRY?=
 =?utf-8?B?NWM0eWhhaHBMbU8xREhsQUp1bVNpK0VueGZ3VFhGeWVxazg5MHFyaWJ4VWhQ?=
 =?utf-8?B?UmdSSkJqWWdiQnAxQUtoem9kcFZKTTFLZ09FWFgrODE2QWxUODJ0U2xNUFZk?=
 =?utf-8?B?YlVQMzQxNUNpK0g5a1pYNTRmUTZRU3V4QzAzUE9TSzNaUEtDdGpZZlRqWXJr?=
 =?utf-8?B?Q3RuK0d0U294RldvcUpQcTZwREc5dzdlZVQ4djBleXRqQTNoQlhuNmRZOTZn?=
 =?utf-8?B?NHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7defc485-4114-4fb0-456f-08dde11185e5
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 00:19:13.5761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eguiO+G298lpi1t5qSzlyzrOQylj8IAnr1QdNxE5s6ADExKrNalZVuZIhl15OzRTvaZzC9JBrPbCn+b7naDSxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5223
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

See my comments inline below.

Regards,
Zhanjun Dong

On 2025-07-30 1:40 p.m., John Harrison wrote:
> On 7/21/2025 6:35 PM, Zhanjun Dong wrote:
>> Add GuC log event buffer output in LFD format.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_log.c | 88 ++++++++++++++++++++++++++++++++-
>>   1 file changed, 87 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/ 
>> xe_guc_log.c
>> index 609a9fd5ba0c..a8910211c579 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>> @@ -421,10 +421,92 @@ xe_guc_log_output_lfd_init(struct drm_printer 
>> *p, struct xe_guc_log_snapshot *sn
>>       return size;
>>   }
>> +static void
>> +xe_guc_log_print_over_chunks(struct drm_printer *p, struct 
>> xe_guc_log_snapshot *snapshot,
>> +                 u32 from, u32 to)
> _over_ ?
or across?>
>> +{
>> +    int chunk_from = from % GUC_LOG_CHUNK_SIZE;
>> +    int chunk_id = from / GUC_LOG_CHUNK_SIZE;
>> +    int to_chunk_id = to / GUC_LOG_CHUNK_SIZE;
>> +    int chunk_to = to % GUC_LOG_CHUNK_SIZE;
>> +    int pos = from;
>> +
>> +    do {
>> +        size_t size = (to_chunk_id > chunk_id ? GUC_LOG_CHUNK_SIZE : 
>> chunk_to) - chunk_from;
>> +
>> +        xe_print_blob_ascii85(p, NULL, 0, snapshot->copy[chunk_id], 
>> chunk_from, size);
>> +        pos += size;
>> +        chunk_id++;
>> +        chunk_from = 0;
>> +    } while (pos < to);
>> +}
>> +
>> +static void
>> +xe_guc_log_lfd_print_from_chunks(struct drm_printer *p, struct 
>> xe_guc_log_snapshot *snapshot,
>> +                 struct guc_log_buffer_entry_list *entry)
>> +{
>> +    /* Output data from guc log chunks directly */
>> +    if (entry->rd_ptr < entry->wr_ptr) {
>> +        xe_guc_log_print_over_chunks(p, snapshot,
>> +                         entry->offset + entry->rd_ptr,
>> +                         entry->offset + entry->wr_ptr);
>> +    } else {
>> +        /* print from rd to buf end 1st */
>> +        xe_guc_log_print_over_chunks(p, snapshot,
>> +                         entry->offset + entry->rd_ptr,
>> +                         entry->offset + entry->buf_size);
> The log does not necessarily reach the end. Indeed, the v2 format is 5 
> dwords which does not fit neatly into a page. So you need to stop at 
> buff_wrap_offset not buf_size.
Thanks, will stop at buff_wrap_offset >
> Also, remember that the primary aim here is for streaming output - 
> continuously dumping data, not just a single snapshot. And in that case, 
> we should be sending a FLUSH_LOG H2G command and then dumping up to 
> sampled_log_buf_wr_ptr rather than wr_ptr. And in the case of streaming 
> output, taking a snapshot copy of the log is probably not worth doing. 
> We can just dump directly from the live buffer.
> 
> I'm not seeing anything that writes to rd_ptr. The KMD is responsible 
> for updating the read pointer after reading the data. The GuC does not 
> know what we have or have not read.

Will do flush and write to rd_ptr later, for now, I can use guc_log to
verify lfd output contents.

> 
>> +
>> +        /* print from buf start to wr */
>> +        xe_guc_log_print_over_chunks(p, snapshot, entry->offset,
>> +                         entry->offset + entry->wr_ptr);
>> +    }
>> +}
>> +
>> +static inline int
>> +xe_guc_log_add_log_event(struct drm_printer *p, struct 
>> xe_guc_log_snapshot *snapshot,
>> +             struct guc_lic_save *config)
>> +{
>> +    size_t size;
>> +    u32 data_len;
>> +    struct guc_lfd_data *lfd;
>> +    struct guc_log_buffer_entry_list *entry;
>> +    struct guc_lfd_data_log_events_buf *events_buf;
>> +    char buf[GUC_LFD_BUFFER_SIZE] = {0};
> As per other patch, this is a very bad idea for multiple reasons.
> 
>> +
>> +    lfd = (void *)buf;
>> +    entry = &config->entry[GUC_LOG_BUFFER_STATE_HEADER_ENTRY_LOG];
>> +
>> +    /* Skip empty log */
>> +    if (entry->rd_ptr == entry->wr_ptr)
>> +        return 0;
>> +
>> +    size = xe_guc_log_add_lfd_header(buf, GUC_LFD_BUFFER_SIZE);
>> +    lfd->dw0 |= FIELD_PREP(GUC_LFD_DATA_DESC_TYPE, 
>> GUC_LFD_TYPE_LOG_EVENTS_BUFFER);
>> +    events_buf = (void *)&lfd->data;
>> +    events_buf->log_events_format_version = config->version;
>> +
>> +    /* Adjust to log_format_buf */
>> +    data_len = offsetof(struct guc_lfd_data_log_events_buf, 
>> log_format_buf);
>> +    size += data_len;
> This all seems a very complicated way of doing things. Why not just have 
> a structure which is the event buffer LFD block - header, magic, 
> version, etc. Create one of those on the stack as a local variable, fill 
> it in and write it out. No need for complicated type casting, 
> offsetting, pointer arithmetic, etc.
Will optimize

> 
>> +
>> +    /* Calculate data length */
>> +    data_len += (entry->wr_ptr + entry->buf_size - entry->rd_ptr) % 
>> entry->buf_size;
> As above, this is not correct as the end of the log is the wrap_offset 
> not the size. And in the case where the log is not wrapped, the size is 
> just wr - rd and size is not relevant.
Yes, to be adjust to use wrap_offset>
>> +    /* make length u32 aligned */
>> +    lfd->dw_size = DIV_ROUND_UP(data_len, sizeof(u32));
> Is this just a belt and braces check? The log entries are multiples of 
> either 4 or 5 words so data_len must be 32-bit aligned unless something 
> is badly broken somewhere.
kind of, just make sure u32 aligned.>
> John.
> 
>> +
>> +    /* Output GUC_LFD_TYPE_LOG_EVENTS_BUFFER header */
>> +    xe_print_blob_ascii85(p, NULL, 0, buf, 0, size);
>> +    xe_guc_log_lfd_print_from_chunks(p, snapshot, entry);
>> +
>> +    /* log event buffer content did not use buf, exclude from size 
>> count */
>> +    return size;
>> +}
>> +
>>   static void
>>   xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, 
>> struct drm_printer *p)
>>   {
>>       struct guc_lic_save config;
>> +    size_t size;
>>       if (!snapshot || !snapshot->size)
>>           return;
>> @@ -435,7 +517,11 @@ xe_guc_log_snapshot_print_lfd(struct 
>> xe_guc_log_snapshot *snapshot, struct drm_p
>>       /* Output LFD stream */
>>       xe_guc_log_load_lic(snapshot->copy[0], &config);
>> -    xe_guc_log_output_lfd_init(p, snapshot, &config);
>> +    size = xe_guc_log_output_lfd_init(p, snapshot, &config);
>> +    if (size < 0)
>> +        return;
>> +
>> +    xe_guc_log_add_log_event(p, snapshot, &config);
>>   }
>>   /**
> 

