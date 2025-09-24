Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6C9CAC5AE
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 15:15:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0865F10E750;
	Wed, 24 Sep 2025 15:15:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gbu5bqoh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 981F310E750
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 15:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758726905; x=1790262905;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=SwNLO9cX8O/hvvh93SCW89SgnTjYLVZ6kr/XRZN/+2s=;
 b=gbu5bqoh/X6Z2FS/0VKqTEZ5zxyTzmBdRinwUwp/HcGdeBwnvCMcJiCN
 RM9KhboZS+3edVY/8Zl0dk73ZTsESoV4YUwjq3qK93MQKRPuIZou1qhkQ
 yE/umI5tpMOQ/2In7J4+AQ/5mPnxo01DKogAtPARcFVptXmQZx8nNbfYd
 pgFkDsF/97+yLlD6SlTnmsr3d1qIW0/TXXalYbvui4BpfIw+mVl01aBo9
 JaHuSXkjm5uA5xLVVwTUxvwgSr0Qz6Ukb3mUspqtSZabO5tbOMVNOj6A2
 fOLP4WHHamGjzFRJePXPdjrc7qyUscPzh25PrelePs6QWzgEl2iH0FSW7 w==;
X-CSE-ConnectionGUID: /KBctK3RTh+/4Mqvqs6B1Q==
X-CSE-MsgGUID: jiIw1I7LSVyY94gcsJuZqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="71705250"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="71705250"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 08:15:05 -0700
X-CSE-ConnectionGUID: A80mVO4dSZWgmTiIHaUkiA==
X-CSE-MsgGUID: psWVg3UpT+KLACaseymiHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="200755432"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 08:15:05 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 08:15:04 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 08:15:04 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.10) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 08:15:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SZ2wEHbLaoh37tHhONLfVv2j5rUFJ/a+Dp4RHJsmJbecBcs75u8POFxV7/TKzHLNVbWmAbElUaCKtdUcP0hGc3HpYrNMTKTrHpIxJVdXt/r+270oFMf2PEubh/q7bS3QQ00ezy/byJ5ljqEPoOSgka2tfMTynx1befj6YQO7PrpA5lFtwVuk04Y/WCo5pbfaoA2nfSQlhaUSGJ+An285Z82u3uq1SBEHHJ8JIuuNqSpWisHXISfmM8irNrmwn24ug1cCmXq74UAUNHSN7o/a07Sr20r3lWE2BYppe/yX3h4AvPkp0KZGzwskNOqCIBLP8CvQjL8L1PFPgBZSoT4VVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5BA6pFvUsxXkBzF/VSa/FxUDIbwxo0pum/wv5rUr0s=;
 b=CdTbz0Ml0fIGiFXUu+jVRlOgtcoIUQH34rdu7K4QlhFiunzxHQc5AHEu3wGPdsJr02Q/RW+OqrpGhtNBglebUaGOYzHMLOXluv1LoV923P1hclrPF0bq4Au3yBDFVwoFcIxbrM71GQwEGFdCUKjCI0AVRDt+YM7n6K9hgpKqbw8TyUVw8M+b6hfl4xmm3Jtrd1M1c+ji5SodXZj19+sPhulK+lIzdKuLAxV80BiC1Bpy12gGvBLJvTJIZ96qW8WZ+LtFGOgUNCczVOly9ruDbk0fptIY/8dTD3ICc/Jqv1U9a5ii+vbBZ8NR16iBbdQZ2Fctn8lLMqSr0ZRfxUGiOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by IA3PR11MB9421.namprd11.prod.outlook.com (2603:10b6:208:578::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Wed, 24 Sep
 2025 15:15:02 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 15:15:02 +0000
Message-ID: <5b02fbb7-371d-46fb-8d94-0b834d0995d0@intel.com>
Date: Wed, 24 Sep 2025 17:14:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/34] drm/xe: Don't change LRC ring head on job
 resubmission
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-9-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20250924011601.888293-9-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR02CA0054.eurprd02.prod.outlook.com
 (2603:10a6:802:14::25) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|IA3PR11MB9421:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c71d591-1d07-4582-fd8f-08ddfb7d2213
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VERPbHUrNnp2Q01uMHRROTRnZmpDeUJBQVZRVTEvSzVDM1NmanljZVRnYmFD?=
 =?utf-8?B?bGhqRDlSRjJBQVlGaDdkK2c4SXdxRHg4QVpIeW1xeDV4Lyt3UHJjSjA0NUJl?=
 =?utf-8?B?U3NLcWdETGFXdkh1VktWZStGZTlMUmZIaDJYZ2lPSU50djZ0RGMzRHpjSG9D?=
 =?utf-8?B?Q2xTMWpqTTZ5bWZwVGtpU1AzYlFqeHRSVTlWZW1RbmI0d1NxZTR2RjhMRUJz?=
 =?utf-8?B?dVkyZ0hzb2JIcUtXSkZNWlFmMmRQeE42WDg4MVV5c1lUcmhUbzJSandVSXNs?=
 =?utf-8?B?NWR2MkRBdHNEbzJ1ZnBBQnoycks4bzNaR0MzNXB2OWNabWVwL0l1cS80ZFNY?=
 =?utf-8?B?VkpiMVFRc0dZQUdFMnlQT1NTZk9kMjIzN0phYkNybEt4VG9ZeHloanNRaVZI?=
 =?utf-8?B?QVF0RkdrV0pCZGVGY0pPcXpELzF1a0pJOTk0MFRJdldDem9aRjdLK2xJRXFs?=
 =?utf-8?B?WUMrWlJPeDVYM1p5aTEwdE05Y0dIVjlFeEFFVkk3bm1iQTFLOHR3T1RZR1Rr?=
 =?utf-8?B?SmJ2YXpyb2s3RTBxNnFQTzZ4MU4zMXhJRXNnQndRemlpd1pDRkx3WGZlUWJO?=
 =?utf-8?B?NERURWhtYVpzTWxnVTJsZWpwYmJXZTlYaXRnS2VnbTc5OHNvclZ6ZkZlOUxx?=
 =?utf-8?B?WWJSR0Z0VFl6eWEyY08xSy9PVnBRLzZod01kNW00ZXpKNkFYM2lha3Rjb2hE?=
 =?utf-8?B?SGRnUDNUS0grdzkrdklld0pDVjVFZFVPaUJLVXRmN2dldXZQYUdZS0pyZjBC?=
 =?utf-8?B?Tld3K1ZwUXU5VExaM0VhdFJxSzBqWksvaml6amNyM050UmhzeDFsMXlKYkk4?=
 =?utf-8?B?Mit2NTlvZml2WSt3eUIxbFZnbkgwRWMwd3JwQ0dLTnMxU3N1elZqaWRzblFB?=
 =?utf-8?B?dVNmbnVXaDVBSi9RY2pVMmRPNi9PSkZTMFJUQlJSdktvMEE4b2YyeHZjWDBq?=
 =?utf-8?B?alIzeWVWZ252NXpGNzNyYWkzaWhXeHBjeHRhNjJ1NlhrN0t4NStnbnRFbDla?=
 =?utf-8?B?bmQwVXhvYmNPNlRiUWtBZjI1Z1VUeFhGbTN2N09Scm9LSUxnRkRSaDlUVmZt?=
 =?utf-8?B?OFRra2doNjZaM09xL3k2TzJGWmp1djNFamFsV3Brc2pOam5QR2w5aXJ0Wk5L?=
 =?utf-8?B?ckdicjVuc2s4T2V2YUhQbktDb1luSnE5R3gzNmtPNE1GMWJrVnl2bGw0Nm82?=
 =?utf-8?B?REZ0azcwMFk1b2dITjdJenNteXlMN3hTKytYNzRqOFBoVG5BWThCSEVlNTA1?=
 =?utf-8?B?RGd1YldNMjJxcTkvaUNBNjNUMG96WDNpTGJXTjlDSzhJVjN0V1lmRWtVOTM2?=
 =?utf-8?B?WGM0NHhLYy9FcHg4SE56R0RDNDlTbHJhVFduYmNROEx3Q05RS3VoSEhva1Fs?=
 =?utf-8?B?cnZ3UkppSDRoN0RraEQ5MzQ3OFlvaVpIdDVIQm5pZk90Y0F1VXQyMXBlbmt1?=
 =?utf-8?B?NEJCZG9wd1MzRzFRY20yVXBHbmRFODJKVHFwakc0QTM0eHdZeGFIejlXOExy?=
 =?utf-8?B?L1lvTTZ1N3hiVWxiSGFUVyt6Y2dRMXVML25hcTVXckMyT05DeEQ1R3U5VUhm?=
 =?utf-8?B?SGJIZmhwR3ZtRXpGWE1TMlJ0anEyb0ExdklDYjR0WkVlM1FBRWpRRlpXVUQ2?=
 =?utf-8?B?VFVZdzg5WlViZGhjY25Xd3pyclZ2dmh1UWdjQW5hNTB4aHJQbEd6T0hSWkhY?=
 =?utf-8?B?cTJucHlFRy9vRkZuR25PZk10WGRzRHk1SWJBSEFCYy85Y3hJaVFQMElGZUdl?=
 =?utf-8?B?YjVGNXpSSGV1R1RNTllSMXRJWUREcTYvWitSMk1TRC9uZ0FSUyszRG5tclRu?=
 =?utf-8?B?dFpOTmVheFpzbnlEWU1XSi8xZmRzdFpId0dFK1Z2MXU2Rlc0UmltUHQ3b1Br?=
 =?utf-8?B?eXNCRTRqZ3Y1aWY5SXdPNEwxWXpENy9HQXVvRFNuUlVQeDlUUjgxdWpGV0dM?=
 =?utf-8?Q?wNle1nxl9uo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTBBMThNQTI2RUNwanl4VVgxRjA0MzdTellTbm1QTDk5OC9rY0g0Smw4N21u?=
 =?utf-8?B?T3FPNm9Xa2kwUzY1bzBOaEZUSnlhcVdLN1lnMzlZa1UrejJENVRZQW80ZVRu?=
 =?utf-8?B?NWNyd2FWUUNEV254NnhVN2hGOWZWVmRJajBzTVZWZzFWTUc3OVZxay9uN0Ex?=
 =?utf-8?B?ZU5ycHRPVnFqM25ySll2Mng0VTUyRmJrdzYzYnorZ09QNWhNMnEzQS9SaWFM?=
 =?utf-8?B?VFE5Tm5qYnZBbFV2b0RpUVFJbExHRnBBdnR3N0kwaENKQ2RFTytJMkZDcDA2?=
 =?utf-8?B?YVUvTFhXVTRrK2NQaTFOOHZ5TVAzNEtyZzdNbENHbmQwQ0xBT0dQdTJObHB4?=
 =?utf-8?B?Zm9weCtic04zTW1kS0Fpb1NNcXVrcTVjNVNsdXo4QnlqKzIzbkRCeUM1T0tv?=
 =?utf-8?B?b3MvNUhCdk15clJ3QXBzdFRncTlKMHFwcE5CQ0gyWkJlQm4zRWhPeDg1UkJK?=
 =?utf-8?B?K1pGWEttQTBZL0QwcVRKNGZoaHNFcnhBRVVQNEFkdEs4bis4TUhWTld6RVZW?=
 =?utf-8?B?VDVxSDlTODN5SVdXbElUMmkrMnp2ZXAxRDZlVmZUTUp3VXVLYTQzVyszei9a?=
 =?utf-8?B?U3ovZ2Y5SEdnNmJlVm1lRnFZNlp0UTN2bmkxS21GSDFuZGFjd1lzN0hBUjJ3?=
 =?utf-8?B?cC9obE40UXBKV2RYS1FxNWs2QTBIWGZKR1dzdHRJYTNPQ1dSb2VMK2p6QmM2?=
 =?utf-8?B?Z3NKUmJvUXdHOTRRemZXclJTY2FDT0ZJc0d4YkNKeXpEWTRiQ3lPVjFUWTdU?=
 =?utf-8?B?cFNFaDlxOFJlR0EwUVFjdzZ6SU1SZ2RRZFh6ZldwbENnb3orUjMybCtsdnJ3?=
 =?utf-8?B?VURSZXFGcUdKV1RRMDkvVEthMkwvVUZObzZkY3kyQXhibFMzZVhLbkQ2RXVm?=
 =?utf-8?B?QWc0UGRCKy8rYmJFRjRiU1ZNcjFNcWg2ckUzWnc3bUpDbXpFL2N4RTNjUUU3?=
 =?utf-8?B?aUtFMmFXbitOdEQ1S0ZUU0N5M09reHVIbHlVbGUzZUwrUWZoeng2T1hBL05U?=
 =?utf-8?B?Ukw1WlIwUWpyRzhkNGxPZDdPZDVpTVNJRzk4TnV1MnpmSlplQ0psSUxnMjFr?=
 =?utf-8?B?WVBYWTlCQm85RnFBSHkyMTNNQll2YUU5bGV6VU9hSFN4M0x2QStiTU1FOXQz?=
 =?utf-8?B?ZUttTWxOMTVNVklubWVab2VSOHNReWJ3R2NwUm45OElQRzVtWHlXN2hsWmtZ?=
 =?utf-8?B?R3B3cUwyRDJKMWw3OEdLQS9HWUFLRmp1ZTJNK2U1TGkxb2dXWHFoWEtnQnVS?=
 =?utf-8?B?UWtoNXVqUFhtWER3SHdOT3RrN0VNYjRXdENxUnk1R281cytDNDh3WlNQdDFu?=
 =?utf-8?B?Tjdjb3ZNL2R6RlRFcEIzSk9KeTJSYkxRS001UnpHV0V4NVlwZXJaNk0rMDMv?=
 =?utf-8?B?RHJuZUpPWVhWR2Q0UXRYM0pMR1ZNRzhUZ2U1RVp2RUVMN3BRMFYyb2oyQkZu?=
 =?utf-8?B?R0hKbE1MZE9uVTAyUzd4blMycjJYUE9IVklXZzJmTnZZM0tYcmhYQS90d1Qx?=
 =?utf-8?B?Uy9VdXhxR2JYUFZPRGJ0YitOZElSNzRFd05tQXdxamxjTjRITm5mUVo4R283?=
 =?utf-8?B?Skd5ejZXTGxzTEZDeEtHSnkxU0NmVlJFWVhiblpZd1VxdkxkZEhhVkpOVkNa?=
 =?utf-8?B?WC9BMllJY1RDTllFT1dWY2wxMFNubnFqczJuQTlFSng1WStCUS85Ulc4MTF3?=
 =?utf-8?B?QllQZ3lGQk9HdVNlNXBiaGY4MUp2YVNsZHVZWGJicFhCN2EyZFdXTXZ4S3h0?=
 =?utf-8?B?RGkrRlp6RDBQU1IxQ2FsMW5sQjVqN1ZxV0V3THJsdk9lZXoxNGdnUE02Nndk?=
 =?utf-8?B?cHhQbmVtamhqL2p4VS9CN3lCd1Q1R2RNVm5aZEpmNVFPUm0veXFhb3ZyVU12?=
 =?utf-8?B?b0NRWVdydXZuYS9OeHRrMzAzczBiSlc2dTR0d1RvSkd3YjZacTFWbG10TGVu?=
 =?utf-8?B?bEgwS3VmT25OS2xocmxUdU1WRkFvZDQzc0hHZzZkRzhRTHBoS3pDMHdWTGFP?=
 =?utf-8?B?K0RXdXpXRnhlcWNqcERnZFI1ZVk0NlY3Sk05Sk5yeC9OQnd3ek52N3ZqWldX?=
 =?utf-8?B?TVQwVHZITlU1V1duN3haS3RtOGgwSWljby9FWDNjMVhoR0d3cG1kUmdUMUJY?=
 =?utf-8?Q?nH/NRK5fmLcMnpDjpOSoSP5lk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c71d591-1d07-4582-fd8f-08ddfb7d2213
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 15:15:02.0242 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WSVEyUES8Pt2tWAupFjynApM6PH5B4ttrRK4YhdsQkergvPsYdtzUl8N7Fz8wsGDJfbwbB9GbQkLVzDYaiu+4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9421
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


On 9/24/2025 3:15 AM, Matthew Brost wrote:
> Now that we save the job's head during submission, it's no longer
> necessary to adjust the LRC ring head during resubmission. Instead, a
> software-based adjustment of the tail will overwrite the old jobs in
> place. For some odd reason, adjusting the LRC ring head didn't work on
> parallel queues, which was causing issues in our CI.
>
> v6:
>   - Also set LRC tail to head so queue is idle coming out of reset

This is complex.. if the job got preempted, then not touching the head makes

sense. But what if the queue was removed by reset? Are the problematic

commands NOP'ed so that we really can leave the head?

Setting tails looks ok.

-Tomasz

> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 3a534d93505f..70306f902ba5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2008,11 +2008,17 @@ static void guc_exec_queue_start(struct xe_exec_queue *q)
>   	struct xe_gpu_scheduler *sched = &q->guc->sched;
>   
>   	if (!exec_queue_killed_or_banned_or_wedged(q)) {
> +		struct xe_sched_job *job = xe_sched_first_pending_job(sched);
>   		int i;
>   
>   		trace_xe_exec_queue_resubmit(q);
> -		for (i = 0; i < q->width; ++i)
> -			xe_lrc_set_ring_head(q->lrc[i], q->lrc[i]->ring.tail);
> +		if (job) {
> +			for (i = 0; i < q->width; ++i) {
> +				q->lrc[i]->ring.tail = job->ptrs[i].head;
> +				xe_lrc_set_ring_tail(q->lrc[i],
> +						     xe_lrc_ring_head(q->lrc[i]));
> +			}
> +		}
>   		xe_sched_resubmit_jobs(sched);
>   	}
>   
