Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700B6CF58C3
	for <intel-xe@archiver.kernel.org>; Wed, 19 Nov 2025 17:51:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 260CC10E250;
	Wed, 19 Nov 2025 17:51:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ASeUVV3I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A0B10E250
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Nov 2025 17:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763574699; x=1795110699;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Egrx/YOMmlW664XhbQzpdKr6XWbuIV0iV/qqOUlGqb0=;
 b=ASeUVV3IoRThN2q/8kZcry0i6TOYavzm0t46RfltgcsMv+khwFX/bsXg
 hoqKBulp6t7odXg0c+0lS07lwzJNKYhssVj2aCcyQDMvCXQWvwYKA1L/H
 /Tv6YfaDPl/ePcwmAG01E21ZfwM9LbBjon7Fbd6qhqt9phFFBVgLooxy9
 J/8PvSu8R4xXBmfzhy7ONJSDcaclswykloHYJvZCSu4ADgWjzRiibFlmu
 zCL7hhGz+8yka3KlmIaxDBRrJPzLHrYWTW4vEjG4suagMG0fl5aF6R2w2
 waFi0O5hctF6No0P+juK7EGpVYZHg2fdVg4UqR14yl4sh9klFojc+IeRg A==;
X-CSE-ConnectionGUID: sqhXDzk+RsWb0aVymCyUKA==
X-CSE-MsgGUID: rMC2yGRFRnGspenGcQJ/bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="53199337"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="53199337"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 09:51:38 -0800
X-CSE-ConnectionGUID: aKXGXHx/Sbi3XSoy8DER2Q==
X-CSE-MsgGUID: svfZ2WeOQCSpV3qQq3fi9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="190932046"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 09:51:38 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 09:51:37 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 19 Nov 2025 09:51:37 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.62) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 09:51:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uhRQVDVlmEEfyIPE/CD+7v2MsqTkd5nsUN6vdvN7g/6OQIY5yWvwhe4mkscHzeYnALmYe2KNuevlpqwh7WciVSpjjDfeo66XXNsOynbaVYrh6mokIIx94Hf1QxJMtAK4DKq2RnSoupYBdC6/ASfNyPpWa6YfXfNOga7nEHhQwkcEfleLHExT4z3LkVuACXfNmjkaFXFutj2NyfTr//8mVUg8fZFxyapR5d8XiPOlwSIw4Qoe9wzKTaT5Ejw+gHHlYJCNiFAvJDnKs9sB1ixdK+TrRwIGytqoi5FqZUGcG3vImMswE9d9uKL6VoLta+8YNhZmjAm2peNHEAcne4h66Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fgaDp5E2GIVXYbI/Fm74grSeTOVpabYkdpi3uZ7Tr9k=;
 b=rxqAR4cErFLMCa1nAWfE3Glvi1Fy5LiZ/w/STriav3M7DK4BbshwcOTn41pnDUkyxQ48e21Uc4HH91ZD1Ref28xOACmwMDDGLH9ZOnuDFJIa3Cem/fQhwWIxyVK3UAChTi7bdfEh+IqqSSwnKK6l2vtrZMazMqf2Kk5Ko8S2DouFp9kfgNWC2xzHCgrbjlfCOod0oA7MhL6ONGua+lgqV0DtXsS3zSznQjCe1pGXicRPp4+W44IxmOTJBwnpSfChzcwUEl9s64QYIWQUZM2MY6CdZdvxtC/5k0D770dcv0YI2vbYajUFaYmVAFhNtBZ1af+zwhE9V52mqhQYcuN9aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SN7PR11MB6558.namprd11.prod.outlook.com (2603:10b6:806:26e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Wed, 19 Nov
 2025 17:51:35 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9320.021; Wed, 19 Nov 2025
 17:51:34 +0000
Message-ID: <4f54ae0e-acfe-42ed-9ddf-2ac42e08ac8c@intel.com>
Date: Wed, 19 Nov 2025 18:51:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] drm/xe/vf: Add debugfs entries to test VF double
 migration
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
References: <20251118114116.3429730-1-satyanarayana.k.v.p@intel.com>
 <20251118114116.3429730-4-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251118114116.3429730-4-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0159.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:67::11) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SN7PR11MB6558:EE_
X-MS-Office365-Filtering-Correlation-Id: 26ee834e-fc7d-462b-bcb6-08de2794476b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T1pROHRoV2h5Y28yTnd6VEVrZCtJZjd2b1RTMm1USlRFVGpSN25hY2RvZlRq?=
 =?utf-8?B?UFVVQ3l2d0pWTXlhR0swQittSHF2OEdPZ2hOT2trRC9uSnNrdy9QRHlESlh6?=
 =?utf-8?B?dFFNc0pFbHU5cTZoc0NUNXJOYkRxemhBcnpTaVZhcFk0eE8wZnBjcGRkc0FW?=
 =?utf-8?B?MkEvc0J0ZFVhQW9KcmlnclJ2S1VjVVBVR3h5UlRGRWtUVTZZSER3d3hHWHJQ?=
 =?utf-8?B?ZTJXTkt3NjdhV1hoR3ltMzlGcW5EblVRNGVwbWkxZGNFRjlhVk1LcGMvSU1j?=
 =?utf-8?B?NCswRDRtaFZWbmVPZXBTQ0pxeW9TMnljY2VHbkpMUUl0MDJiMkRCTjVVVVpN?=
 =?utf-8?B?STdFQmdUMU5LNC9Jc3hFMjk3Y1JPRVJNU3RwYXNnTEtMeUI2clVtbW4yNW4z?=
 =?utf-8?B?ZHpFYXkxNTR5L2RucHRXZUFqRVRvVW51aXFGdHl2Q05vaGJ4djR4elQ5dm0y?=
 =?utf-8?B?Sng1cm04SUU4UElNTHk1eGQ5dlMzWnZLdm1RaU11VkhXZXB6eXB6TU1LQjlX?=
 =?utf-8?B?T1ZMWXJVeFEwNzBMcDExZUovbjNyc1o4NGl4R2VSSVVOV09vT29DL3RtbS9D?=
 =?utf-8?B?T0pqb05SVHRQdWJsWTdEeG5OdkkwajYwWmdmNmJoazArTDA5WXBvWlAxZ1ho?=
 =?utf-8?B?TUU2ODZGQ2hETHRtNVdvV0RRL1ozdmY1cllENFBRSWpYTDhRenVsM29aNTNN?=
 =?utf-8?B?aHZ2UE40bFNPVmdiZW9DM2Z6MnBpWHNHVW1rRTNETXFuTTJ1OWdYSDJXN3RX?=
 =?utf-8?B?bVg3SS95Nk9ZR3BBYTBvSXNkNHFNSlc0VnBhNHlaeEU5R25KNmVudUszYUM0?=
 =?utf-8?B?cWh0eUpoaytvZS9pVjgySmRValBsTVdlNWV2VkFnSGlWTFdtSGxCUnJaT3g4?=
 =?utf-8?B?YzdTRXIzYXVIVitjUHlZZmFjL0EvVFRRenM4NjFJWjE3NHE4T0wyZEE4UTUz?=
 =?utf-8?B?ZUJBNG5JZnlWYjNEVnNUMlJWenhlTmpSVGFscjI2NmJaRUdxMFNuK1RqZCta?=
 =?utf-8?B?bVhBT0hRV0g3cTJZSGlxbk9EQjNvelh4YzU3Mk1yblN6by9TemZBemtDL1F2?=
 =?utf-8?B?cUQ2UE5xTkRPK0R3TjZvRGpPdUwyTllVMzBXVDhkYWcyR291c240aWZLV0Jy?=
 =?utf-8?B?ZUY0cUJVaXJJdWVCVHZrTkNOakNibEFNUmR2cGkyaVNBVjJyOVJFekYybFI3?=
 =?utf-8?B?bk4rNjBKc0owdVo4cGRhK1o4TGRLVnM5TU5tVkdWcnJLTFR4M1JjNkNTSTkr?=
 =?utf-8?B?TiszNStyWm1xZUZ1d3haQ3k2eEZ3eUhQbnl6dDRjbk1wbDhwTXp3d0VyMFJq?=
 =?utf-8?B?ZTY2dklCWEszaHAvZkxOSlE0d0s0UzdqNjdPVVJqSUlxcGlXK09LWXk3T3BQ?=
 =?utf-8?B?bnNmSkcwM21HT00ycFpJWUxDSnFOWXgweHVxVHNHNUt5d1JLbldLdnNzL2J3?=
 =?utf-8?B?NERjeEdJZWQvVkNtWElheWYvSFQzWWQ0N2t2ZVQ2SFpRUG9udVhQaFZXQzZJ?=
 =?utf-8?B?cGpIcEVkQjFQbDZaUjFNRHVCQzdJSkVkekVNeTVXeXVwTkY5SWpSZStPd3hi?=
 =?utf-8?B?SCtXeW9sQkdPdWc5TWZYMFdYb2Z2a2VTSDdqbk8rY3gyNHNoSTFjdFo0Qm5a?=
 =?utf-8?B?NktQYk5ZWkR2NWI1aE5aWVIwcXFPNktkM3pxVUt1UG5jY1QrQndvczNhaXVV?=
 =?utf-8?B?Uko4VTYxTFBHRnFZOHdzM21CN2ZITlYyNmN3VGMrbHZDOEdhUmpTdnR1TWpY?=
 =?utf-8?B?aXdLQnFJT3FFKzRKdzFSU1lrWmEwRnBFS1BPdXVVby9CcC92TVc3UUZ6d2gx?=
 =?utf-8?B?ZnhCeUp5Y29zMTVHajBTKzNOTk9ReS9OSlQvSmtCOWRWQ2lkOGxhbzVqZDJl?=
 =?utf-8?B?SU04QTBOWG8yTVo2aFI0NWQrL2Y4NC9EVlBtZGhQTDhqSXFhRHNMSFhKdkFP?=
 =?utf-8?Q?84zNx/tRYMPrQPhCgzgSggh0QcbszpqH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVhBbjQvR2V5VWJPTHBzSmdHcFQrMjJZcEVvYk9aYWFPR0QzWlBlV2VEOXc2?=
 =?utf-8?B?Uk9hd1NhbHJVa1hWcktGcnRyM2JhZENNV2x6L09BWC81TjBtREFaS1VtYysr?=
 =?utf-8?B?M0s2dno1QU4rdHpMdTV3anBMUWtsNUoveDkrUWNMN2VvYlNpSTRiNkprM2wx?=
 =?utf-8?B?MlQ0dmxBMXFsalZ6cVVvTVhaTlBQQzRiakhueWJJVUkwNk13SkFiai9McEM4?=
 =?utf-8?B?RnVmeDZ0eFpNZkh2ZU11MTJaSDBucUhYU2tsNjNRMzVLSndyV1E5UktJck5T?=
 =?utf-8?B?MzlsNVNjcW4xSHA0dlBVQ0JRWTgxbUY2aEJ2Rm1kaTRRY0JyNDZ6dXlxZ0dJ?=
 =?utf-8?B?dEpHZ3BFcEcvTko3YjJ1Q1VnWGRBVnpNeWtFOEJaOWlIdGd4Q2p3bThLd2xz?=
 =?utf-8?B?OVczQ1RWcHZvK1JyVzRaRXc5Z09YYVliM0gzdDhyZnNzbGtaeUZvZkdabjJz?=
 =?utf-8?B?ancrOVBCd0grSWVDZE5rNTFqOUlVWExTSlAra3RTT1BpT3VsTGFCZlpCUUJ0?=
 =?utf-8?B?c0RjYm1aU0YzRDJRUmxwOTlCUVMvN05ydGUwU2twSExRNzM0R0NHVGtOYVFN?=
 =?utf-8?B?N09IUFRhMGtUTDlNTERPS2RDS1hSTncvWE5kVU5XZFdHSzNqNHFQaG1VcUFC?=
 =?utf-8?B?alV0RmhRemZJK01abjhycjZ3SUM3TGNsTUFWWDB3ckFKYUhVUzRKclVKYmFh?=
 =?utf-8?B?UTI5V2RJcDVwMU0wdHM4OWw1SDd4RkhvTjFvdjZOaHMvMFROT3BONWJ4a01U?=
 =?utf-8?B?Y251YjdTWmN6cTNiUFEyS3BRZ1pCdjNDdzlJblhyeWFpUktmZ3k2VXp4STZY?=
 =?utf-8?B?WldGc3FISDZEOHFCdU95ai9qdHVjalZjZ0phSllyYTllVDBObXB3aHhtVjUz?=
 =?utf-8?B?TkNzMjBtWjZJMENGZmRoNmNvcDlxYzRCaTQyOVgvT0orOXZVSVlWTWFNb3Mz?=
 =?utf-8?B?bnZBcWM1TWxzdGNsODQ0Z0VFVjJJWDZXSDBTOHJTL2w3ZUxJM0EwSlpNWUp4?=
 =?utf-8?B?SVdHZVZoZTk2Zi9FUmJ4UnhBMjc2d21PYlFwc2FDMjFndmVjaEVRSXFWYkM0?=
 =?utf-8?B?ZzN2MmVJUkkxWFdNSTJ1a0gzdFpqMTVrY2lYeHVySWVLVDh4cGVxQ0Fsbk4x?=
 =?utf-8?B?Qm00THJTT1ZPd3lRSE5PMmIzbHREY3RPS01ycGtzRllNeVRlWXYxSzRIeFJl?=
 =?utf-8?B?VUtlWGhtTHFYQ1piYU9Md1VVb3hUSlhtSmFUV08wUHk0QVhhQ09zcDU4a1Y4?=
 =?utf-8?B?THNvbTgyTXhzZlZibjhXMGIwL0NxNVB3dE1uRWM0dUJ3VVFkOFdHRU1UcGZj?=
 =?utf-8?B?YUhqRFBOMGFlK01RczArYVZtNEVjdmNJdnAyMzUxWU81WkJRdkxTTEExZ3JJ?=
 =?utf-8?B?ZUlqRHQ1dUhSVTdqSjU1QW4rM0tHcnY1dlpyMXhUYmU2a0IxNkwrSU1JSEhk?=
 =?utf-8?B?MjRxMGxWVGZNcjk3Vm02cCt0aGlaazB3ZlNQYk15OWtNV1BRNkJCSUZTcHZI?=
 =?utf-8?B?SlVKNkIxbUtCVFRKVlZIb3lZWkpRNE8xdnpqZEpoK1BnMFB4aHpJdjFaQWQ4?=
 =?utf-8?B?Lzk0dU0zcURlelM4WWlmQW9pQzE5TFJJZTlDd3d2M3g5WkNNU3RlNnpsakx2?=
 =?utf-8?B?TjFQNm5SZWZnVzE2dk1reExqRkVJK1NZc2l5UE8rK2tPMVVHVmxKS0FwckVG?=
 =?utf-8?B?STlrMXB4SmM3blZVVm9EZUNtOS9iVWhuSUhacmUwMFhiVmdMb1dvMkRRWDlP?=
 =?utf-8?B?ODF3UXNtSlp1ZC9yNGFJay80MzJ4dFNEQkZWNkdQUTFPcWNIMmRseS9wTHZT?=
 =?utf-8?B?Tm1zK2lhY1p5RmJzRE5oR1RwQm5qL3VWWjd3cUpqN1FQaFp3N0x1eUVJUWc4?=
 =?utf-8?B?ejNHOXRObTRhNndFSDdLYzF4Si9xSlFDUnY0ek1nZStWdWoyaDFka3JBMHBk?=
 =?utf-8?B?Y0Z5ejBwYnRuL3FwblNVR1lGbXlJeVdYK1hJMEJNbk5UZ3psMWhUTGFYZ01W?=
 =?utf-8?B?Wm00ZTRHS2h2czM2OTRaWHV5bTZRZkt1RUdUdFJOaWFSTFJxSVhNRVc3VmY1?=
 =?utf-8?B?d3lMbGNEVVREK1JWRFlVdGZPTUtPRThtNTRYamx2ZHpRT2JMaEJzQUlTM1NB?=
 =?utf-8?B?NFJNYWFNYU5aKzJQWHVCOTdMY1pOR0s2aE4xczRsUlNheXJwSWg3U1VFK0g5?=
 =?utf-8?B?bFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26ee834e-fc7d-462b-bcb6-08de2794476b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 17:51:34.5480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jOsg82hEOP8skhwv2/Zat/VAFOQia+MuuecC/LS+c83v4JT2h5vfHSts8uWXrFXwOXKfEkFvKXT4FjrtKA2VsaMRAnhIfF83U4MP+qo0kkQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6558
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



On 11/18/2025 12:41 PM, Satyanarayana K V P wrote:
> VF migration sends a marker to the GUC before resource fixups begin,
> and repeats the marker with the RESFIX_DONE notification. This prevents
> the GUC from submitting jobs during double migration events.
> 
> To reliably test double migration, a second migration must be triggered
> while fixups from the first migration are still in progress. Since fixups
> complete quickly, reproducing this scenario is difficult. Introduce
> debugfs controls to add delays in the post-fixup phase, creating a
> deterministic window for subsequent migrations.

how will we know which delay value gives "deterministic" result?

on some setups, delay like 10s could be too small, and maybe for
others will be just a waste of time?

maybe instead of looking for some best finite delay, we should just
introduce some other mechanism that would block next 'recovery' step
by explicit action from the test?

maybe this debugfs entry should be like:

	resfix_stoppers: ulong
		0 = no stops/no waits/no delays
		BIT(0) = stop before sending RESFIX START
		BIT(1) = stop before querying
		BIT(2) = stop before restarting
		BIT(3) = stop before sending RESFIX DONE

then the test can setup stop points before starting migration

and then driver will enter a loop until given stop bit is cleared
by the test?

> 
> New debugfs entries:
> 	/sys/kernel/debug/dri/<card>/
> 	├── gt0
> 	│   ├── vf
> 	│   │   ├── resfix_delay_ms
> 
> - resfix_delay_ms: delay after sending RESFIX_START marker
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> 
> ---
> V3 -> V4:
> - New commit
> 
> V2 -> V3:
> - None.
> 
> V1 -> V2:
> - None.
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c         | 13 +++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c |  5 +++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h   |  8 ++++++++
>  3 files changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 08c00b773a13..13ae71dca208 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -5,6 +5,7 @@
>  
>  #include <linux/bitfield.h>
>  #include <linux/bsearch.h>
> +#include <linux/delay.h>
>  
>  #include <drm/drm_managed.h>
>  #include <drm/drm_print.h>
> @@ -1234,6 +1235,16 @@ static int vf_post_migration_notify_resfix_done(struct xe_gt *gt, u16 marker)
>  	return vf_notify_resfix_done(gt, marker);
>  }
>  
> +static inline void vf_post_migration_inject_delay(struct xe_gt *gt)
> +{
> +	ulong delay_ms = gt->sriov.vf.migration.debug.resfix_delay_ms;
> +
> +	if (delay_ms) {
> +		xe_gt_dbg(gt, "*TESTING* injecting %lu ms delay ...\n", delay_ms);
> +		msleep(delay_ms);
> +	}
> +}
> +
>  static u16 vf_post_migration_resfix_start_marker(struct xe_gt *gt)
>  {
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> @@ -1275,6 +1286,8 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
>  	if (err)
>  		goto fail;
>  
> +	vf_post_migration_inject_delay(gt);

shouldn't we wait right after sending RESFIX_START,
ie. before calling vf_post_migration_fixups() ?

or have few wait/stop points to allow testing more scenarios?

> +
>  	vf_post_migration_rearm(gt);
>  
>  	err = vf_post_migration_notify_resfix_done(gt, marker);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
> index 2ed5b6780d30..33d6f37d8dd6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
> @@ -69,4 +69,9 @@ void xe_gt_sriov_vf_debugfs_register(struct xe_gt *gt, struct dentry *root)
>  	vfdentry->d_inode->i_private = gt;
>  
>  	drm_debugfs_create_files(vf_info, ARRAY_SIZE(vf_info), vfdentry, minor);
> +
> +	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
> +		debugfs_create_ulong("resfix_delay_ms", 0600, vfdentry,
> +				     &gt->sriov.vf.migration.debug.resfix_delay_ms);
> +	}
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index 66c0062a42c6..e7244e9fd406 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -52,6 +52,14 @@ struct xe_gt_sriov_vf_migration {
>  	wait_queue_head_t wq;
>  	/** @scratch: Scratch memory for VF recovery */
>  	void *scratch;
> +	/** @debug: Debug hooks for delaying migration */
> +	struct {
> +		/**
> +		 * @debug.resfix_delay_ms: Delay in msec after RESFIX_START
> +		 * marker is sent to GUC.
> +		 */
> +		ulong resfix_delay_ms;
> +	} debug;
>  	/**
>  	 * @resfix_marker: Marker sent on start and on end of post-migration
>  	 * steps.

