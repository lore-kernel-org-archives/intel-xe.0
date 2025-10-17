Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35689CCD195
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 10:28:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E3010E088;
	Fri, 17 Oct 2025 10:28:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="arGdwHxD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B147E10E088
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 10:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760696882; x=1792232882;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=W9DDEMMz5v1LdOqsikNt4Ymd8++L8Lxx9L7cFGCDTuM=;
 b=arGdwHxD+RJtagIEwMnhQA+d7HbUpNS6sf68a20TOXfXOQJ/achMID9s
 NLxYQmykDsPPW9cFdFKZnJvE4u1OKOICY/V9dChF8FTd+Qa5gSEfM4/hO
 B6mZzpMqcQKjVA9gA9L7XOOP5sWlTwN2TDMKMr0pQhLcW3cGLoIgZGcDn
 e33vSVeIdTj/eDQ2RleE+ECoMor0P8uaCQbU+nKB8oHOd9eHiTVGBhFC0
 CC22dUOfJjGXh/iL0DD71e97PdHtzZopFpK6ZXOsmdAZXhzmRsN4qt/2e
 kBI8IIJ3r4X/FG5Cdly81AXTzisg4ZOJt+OZc7iJyWgYH/EsFgJdEg7V9 g==;
X-CSE-ConnectionGUID: vu77NZPkThuohg5IYajavw==
X-CSE-MsgGUID: yLJh+kjqQE2Z4f+zSqaXnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66736748"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="66736748"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 03:27:55 -0700
X-CSE-ConnectionGUID: CfxI9MR9R82W/YjY6GECuQ==
X-CSE-MsgGUID: IcGSyeWWQYWYgJ9GtrvKDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="206408030"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 03:27:54 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 03:27:53 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 17 Oct 2025 03:27:53 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.52) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 03:27:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UHdQ4g/GeTYf80XzH+RwoORgicZY4B9lORoFSOjSEhiDB/TvmfRJg9pv7FaL5cREmvGPaV16cClN9TUSHOw6EytZ4U779itr9VeELogBRg+T1YJKFoogDEUMmaMiqNl3ucbd0+2OKzXSZbI6SupK/F6hkuQ6FXnqJS/RC0piQp3jC5DzFf0px0ZS+PilgStPisSYdWpGVw4kqITWyJiSln5UcYouHx+RO9KrohEYXtW4Dm4TRhB5Fl+1/YGfFqH30wOL98Ezj6CrOP+Muy7t6gX85JGxsjKneO6+/WecJzUOZ3Nb4/Iryb3pbDGiMcONLLDsgUCRbskio73iU2hKZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JjI9DpJIBHLIH4JHnqoTe1PcrGmTqUZpaIu26IZnsiM=;
 b=DHWNz4d4ysCMPpo/kw59ReblgTcitmoURnDpcVaday35CSpRkegnVJ9j4fbL9MKi4rZjE6D4m+RvBTsHCmvZz4YMUCEzaeRSwIB3NpjbMeCOznwZ7f+Ee1C+BjPP5yHfng5I6FuUx8HXM8xv7jwvPjPrG4hFl+k5gmSPcYqv3jSi/TcbewGJZGqRu1ApV/FyEN6Oj95XRS6sHdRqcJKcBsYnMSMk0SLO8sTpy/EUjKRNsTXcwBsMRIvvXEu6/jO6sf1qdjrn+RdWTkm/LIjCcc+diD+H+oT9et+Ki8A45rmmkqqgh6tW4hiE9ZXkV5UZd/Jjsyg/RUDqVt0tVHExbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MN0PR11MB6159.namprd11.prod.outlook.com (2603:10b6:208:3c9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Fri, 17 Oct
 2025 10:27:46 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 10:27:46 +0000
Message-ID: <d973e543-d348-4360-a8d2-a140fc1a6628@intel.com>
Date: Fri, 17 Oct 2025 12:27:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/pf: Always expose VRAM provisioning data on
 discrete GPUs
To: Lukasz Laguna <lukasz.laguna@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <piotr.piorkowski@intel.com>
References: <20251016122233.3789-1-lukasz.laguna@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251016122233.3789-1-lukasz.laguna@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0286.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8a::13) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MN0PR11MB6159:EE_
X-MS-Office365-Filtering-Correlation-Id: 15952f7f-f747-4f7b-c1fe-08de0d67d037
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c09Kd1dDeHJQS0FTM24yYUNoY2hzenF3RVN3VDU4UGswNjBpWTBnYmhQK2lu?=
 =?utf-8?B?d0tkNlptdXFGZkVnRUg4TFl0cUo0SEZwaVhJSU1UTDNzTVUwUCs5Z0s4WVV6?=
 =?utf-8?B?Z2FrSEtoZmZSbjUxaHREcnZYRnVsQ1VJM3I2NE1qQjRnVWpiV1JRVnhTUkox?=
 =?utf-8?B?SDU4TDBMRHZjWFE5QkJmZjhYVFd3dG5UMUVXSU5kSFBHQWo1TktibldnU3BF?=
 =?utf-8?B?WnpaUUY4TU1UWGNHZ1pGd2dhOFpqNVRWeGhuNFp4YjdjVXg5YlN3MldxalZh?=
 =?utf-8?B?dmZqM0pvWjBTbkJoRzU4dCtGVTR0VGM2NmhpM3ZpK3Y3VDZRcTZxU1c2Q3Nw?=
 =?utf-8?B?dllDSnkrVzlGdG5FYVVWb3JxRXhRVDZObkxEOU9mZG9LZGJaZDVzOU40b0My?=
 =?utf-8?B?LzFXbjJKZ3dmOXg2Z2xuZUQzYXIrSk55MnA4cGpmcmhmbUkzM1RDN1ZHdlZ6?=
 =?utf-8?B?VWlSNmg0QVlwbk5lRjg2VEdiSFBycU4ySlpRUEtlczMxN1ZCZFlGaGl2NmRN?=
 =?utf-8?B?ZVpHRDV6QWhqL0JncTROdkJCWCt4ZThKN2R1T2RyeVh0U0UyMVFtK0ZDU0xi?=
 =?utf-8?B?NVJ0MERTZ0NOclJ6Q01RbE93bDdxdDZlSlpybGx0M3ZPcDEvSzRPd2Fla3ZY?=
 =?utf-8?B?cW9Xa0ozT0xEY1lvUkxCYUUzUFNBSXdzVmsvYlludCtjakRoelIyczBLNkYv?=
 =?utf-8?B?M0c0d3ZnZUEyMENUYmxqQ3U3NnBHYnl3RFdhd0JLTlc1dzF4ZUhZYm1TdGZ6?=
 =?utf-8?B?YkJhTE1pZmJQNEttZmU5RDlxSmNnc2xpVHVwWFg1Z3RhaTNqc1kyWVhrdjZR?=
 =?utf-8?B?ZVkzWWRpeU5XZytiMC9LZjVGTVZ1cGdjVkF0WFZsZ1czNVR0NWR0MytQVXZM?=
 =?utf-8?B?WGtoNEtzU0VEM1c2eUFpME1SQ1Z2Nk9Qc0M1ZSs5eDY3dnc1eGpLeFlQTU1o?=
 =?utf-8?B?VWNWaEQ2U3ZFWmgrSGFRcmxDUHJPV01sdWhVVGFGZWkwTml5c1lITnRRSWNn?=
 =?utf-8?B?ZlgyaG4wS2g3V01KbGk3UVlaai9PN3Z3S0N6VnVXV2taUE5mZGp0RU1kUGVJ?=
 =?utf-8?B?MjhGZzBmTHQ0djRPeko0SW9NOGJGQ3BkNUpBa085VVlsTFdlWSs4bktWTzU3?=
 =?utf-8?B?RWQwUHZSckVuc3Rhc2IxWlJYSFdPb2JpdE1ucURuaG5FeDQxcWFDSlRPay93?=
 =?utf-8?B?OW5OQm8wbk9DcXhvVjZJVkVocHU1TFNrM3RnWU9WWmhLL0tHbElORmpLVGt5?=
 =?utf-8?B?ZlFkalg5WkVsR0I0R2R1c2RTWTA4a1I0Tk9TNlF1WVFYMWF3dEJ6VUZBQWtk?=
 =?utf-8?B?cWtvU3VzU2IxTmpKQVNlNHduSXhQWnpwRjZscUlBRFVJenFlT3haM0FoS1pJ?=
 =?utf-8?B?RFI0ZGV5bjBZMzRwWjdJTWRwdDU1dXVBMW1TTUJ6eXFhVGhxNStVV3FaYVhi?=
 =?utf-8?B?bzB4MGI2RVJlQVl5R3F4MkEyRndxZ3Bhb1dMRU9PTlNnTXlvY1gyYlpiTUNS?=
 =?utf-8?B?dTQ2aUJ3UFBPNXJvOEdqdG83MjVOZzV1andCbjZZMkh0V0MrZ0I1RlpWa2R5?=
 =?utf-8?B?V0N1SFc5VVpldnZKd01lVzZ0TmRRWnk2NWJHV1dJRWZFTXhIZlNsOHhqT1Y3?=
 =?utf-8?B?dmo1TGowS0hOa1Z0cUFUZHVxd2Y1QnRNeWV3SHBpT0ZwR0JpNkZHejN1RjJx?=
 =?utf-8?B?a2FBV1prQ2V2VFZBd2NpcDlwWVF6NFR5c2QzcG8xTzJIeVZUTDZFMTBFWUpx?=
 =?utf-8?B?Z0RqUXlqMXdTUnFGelNoVzhRaFMxZTAwU0N5b3hwU0RQVWVXUXdMSm0wRVJ4?=
 =?utf-8?B?dXJmRDV1M0lyUU5PbVArTGltTlE2V2tRLzY2TVNCQ2lNbjZOK3lzYlZrcTRS?=
 =?utf-8?B?bkRXM0V5OURKdDBMam4vMkxmUkp5L0pLd2JYWWxaRGd6dEpDeFNSZHAxOUw0?=
 =?utf-8?Q?g32FxmEPvXbBwDlIvUMGdb8w+Ui7xL3P?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azZySUNTYnhkK0UydngydjZjZEpuY1NzQnRDTkZQUUdBQVpHdWhHQmp3dmxM?=
 =?utf-8?B?SWFLcjk2MlBDckM3TkUwQnRaVklmRUZObjNXMUxkQU5XRlc0UlJtSTlQcldn?=
 =?utf-8?B?Q1hFc21FYTIvaFFWYkM0QnZlbGg0bHd1M3g4RHF1WFBjd256TE5wMkRrWHNu?=
 =?utf-8?B?ZmthdUsxRXdEdnpwTzlFclZDbDlOanF2VU9PcUdjcDB5d09EUU9KYzg0SHg1?=
 =?utf-8?B?SHhCVVp3VStjRS9ZMmN6bWxwMzd0TXFIcldiSWhJNEJGeTFvMEJUc0FjVjNJ?=
 =?utf-8?B?UUY4eXpyY2Z1WHc2aWtTNEtOSm5tdTNxVGo0aFdBQjA2MVdnYzFIRFEzNHFt?=
 =?utf-8?B?SUdzaGJtTk9FbHlpcEQ3czFhUFczM1JQTisxazQvWEpvNlQ4SnhGeXdmanR1?=
 =?utf-8?B?eHBDMkM1VVBxVWEzZHhQL2krVG5RQVZENFZVNWxGaytwMUV2NDc3U1JQZENl?=
 =?utf-8?B?ejFObVQ3S1FCOUZtTXFubHc1ZjN1SWhDbGk4dVppT3NjUUhmZXlYMXMzSDVh?=
 =?utf-8?B?dkk5NlN1Z0xwYnZ3S01iN3JLT0tKTHdFQ1NkQyszWFYyUk5NcEZUbHUvTHRC?=
 =?utf-8?B?cmJ2UUlhRnhKVkdhbkcyQTJFWVhiTWtaTlp5R0FabWsrOVNGaUx0SUZ6aDNm?=
 =?utf-8?B?QzV6M0xmN1Btc3JMVUNOYkk1d1Nkek5JZUhaWXM2N0hENmtSY1dmemU5cFJl?=
 =?utf-8?B?NzVTM1gvcHM2NExmWmV4dGk1R1RSRlNHZzdzR1J2cU1iU2tveGRXOWE2dHAz?=
 =?utf-8?B?Uyt4QmhhSVBXSkhQM3Z2Q1ZxQUpPVzhKc1phamJ2dHFQc2NQZXk1M2czZGRO?=
 =?utf-8?B?ays2cExlbmpqVkNYM3ZrSDg2ckNFcmxLRFJCTFVWQ2g1VjNuVkh6S3RMWk9w?=
 =?utf-8?B?N0NScEJoL3hjM0s3SlRmZVd4c0FZVnY5SGQzM2lja0o3LzNQQ0dFeFlZalIw?=
 =?utf-8?B?NGN1TFA3ZnZmNERSYXdyaHgyMUxpYmtpRHBtUkZueW9nZXdpcWRSMlpBZXY3?=
 =?utf-8?B?UjZKT2luOWd6WENPc2MySVhIdVYwQkxpR01kWE1kTkZPSnNFbis5Snd1L3VQ?=
 =?utf-8?B?VTNkMkRXZFY2ZFNxNG1ZVThvbWVLakx5cElhY2Z1OEJyeVk1QmxnaTAvUmtD?=
 =?utf-8?B?WXJaeCtaOTU1dmRiNnRxMG5PQ1AxK1dWTERza2Z1dmZQd3dtbUZTTkZKUzV0?=
 =?utf-8?B?dlVMM3BBNGVTVzVhVU1iWi9qbVFjdGZiRHVhVE91aXJ6SWpMNHBsR1hMMmRv?=
 =?utf-8?B?Q2VXZ2N4dWhWcHRTM0FqdTRMRlBIL1RWdGp2UnV3Nis4dUF2K3Y3ZWJrdFVB?=
 =?utf-8?B?Y1dIOFFMbDRQQ1M1NkxqaklxS1BYU3BNbkRzbVltSEprd1lmYW5BaWhTVElo?=
 =?utf-8?B?eGVBV1Jmc0hqSVgvYU5MMHNVVkM0eW81WDBteHhFRzEwc0prTFE0K0R1Q1JP?=
 =?utf-8?B?Wk9oUG11OEVST0xQNHhtT3FadmtSUUg5M3FoVVRPRDYrZER0b1hTT25xVjNR?=
 =?utf-8?B?ak5pdVdMakdNdjJpSGx1Y3dzaFE3ZFdvS3ZJZy9lVjNNU3o4WmxwcitTNWRo?=
 =?utf-8?B?UWVZa3pUOGJvb3JNdWpxZWJ1amw3RDNSODBVNG9uMkVnUDFPYzd1K1BCM1hr?=
 =?utf-8?B?WFcySkxKMEdVVm10WlA5UUVuVjBLN3MwaUlLMm8yeXFqblVmUWNRMkhSMUFh?=
 =?utf-8?B?cVVuWVVmYkkvTlg5aENxRU5WVVkzaWFoTVE0azNpcnIzUUNiV1E0eElQdTVQ?=
 =?utf-8?B?MkhQWTZMTmVzOWJMeHoxY0VXa3ZhZm0rRHN6YitpOHMwTTV4bENISndCbDF5?=
 =?utf-8?B?ZUhWNksrYkdJM1QvUjFJNUEzaWNRRHpxUTZPNkgxV1QwcFl5Q3VMeTVQOUVq?=
 =?utf-8?B?R3k2MXR2UmM3dTdjbU8rOFkyUTV0elViaVpHTTdMT09mYUdpU2d4eGVtSXFj?=
 =?utf-8?B?L1NMdGZxbm9vUDAvNDh1UXdRSjNUU09FOXRGSFk2cmZCMmF3RHZ0L1ZjWWZk?=
 =?utf-8?B?SkFkTWhIQWt1U1dTOTdOUUkyQ3pqSHg3T2diajBqZ25GbEhTMHRLY2J2aFdm?=
 =?utf-8?B?NlJNM1BkZk5MN1Nxd3VwSWtXNFNlY2s3OFR6T2hjQTZXR2VPZXBUeHFkbnR0?=
 =?utf-8?B?TE52OXVaY1QxYmh1akY3V0xMZElpdTFTU05nRkVaWTRnN0RnaWRMcGhjbDRD?=
 =?utf-8?B?b1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15952f7f-f747-4f7b-c1fe-08de0d67d037
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 10:27:46.1850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kkEGtr55/XgLQSK/WE7XKjQ1MA06fVBMAaH+w2C3dEke3whBilMBP6ir3T0y77ddHlcnj+At1UkoIpr+gKuxWWwLq/38CvXEIzf4NIAYtug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6159
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



On 10/16/2025 2:22 PM, Lukasz Laguna wrote:
> Currently, VRAM provisioning data is only exposed if the device supports
> LMTT. While it should not be possible to modify VRAM provisioning on
> platforms without LMTT, it is still useful to be able to read the VRAM
> provisioning data on all discrete GPU platforms.
> 
> Expose the VRAM debugfs attributes whenever running on dGFX, adjusting
> file permissions to read only when LMTT is not available.
> 
> Fixes: 921ddb37d87c ("drm/xe/pf: Don't allow LMEM provisioning if LMTT isn't available on the device")

all our current DGFX SR-IOV platforms are using LMTT, so IMO there is nothing to fix

> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
> v2:
>  - add extra protection against changing the LMEM provisioning (Piotr)
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 3 ++-
>  drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c | 9 ++++++---
>  2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index b2e5c52978e6..c0c0215c0703 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1548,7 +1548,8 @@ int xe_gt_sriov_pf_config_set_lmem(struct xe_gt *gt, unsigned int vfid, u64 size
>  {
>  	int err;
>  
> -	xe_gt_assert(gt, xe_device_has_lmtt(gt_to_xe(gt)));
> +	if (!xe_device_has_lmtt(gt_to_xe(gt)))
> +		return -EPERM;
>  
>  	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
>  	if (vfid)
> diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
> index c8df18af4d00..6ba2332c77d4 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
> @@ -165,14 +165,17 @@ DEFINE_SRIOV_TILE_CONFIG_DEBUGFS_ATTRIBUTE(vram, lmem, u64, "%llu\n");
>  
>  static void pf_add_config_attrs(struct xe_tile *tile, struct dentry *dent, unsigned int vfid)
>  {
> +	struct xe_device *xe = tile->xe;
> +
>  	xe_tile_assert(tile, tile == extract_tile(dent));
>  	xe_tile_assert(tile, vfid == extract_vfid(dent));
>  
>  	debugfs_create_file_unsafe(vfid ? "ggtt_quota" : "ggtt_spare",
>  				   0644, dent, dent, &ggtt_fops);
> -	if (xe_device_has_lmtt(tile->xe))
> +	if (IS_DGFX(xe))
>  		debugfs_create_file_unsafe(vfid ? "vram_quota" : "vram_spare",
> -					   0644, dent, dent, &vram_fops);
> +					   xe_device_has_lmtt(xe) ? 0644 : 0444,
> +					   dent, dent, &vram_fops);

for platforms without LMTT, does it make sense to expose PF's "spare" attribute?
>  }
>  
>  static void pf_populate_tile(struct xe_tile *tile, struct dentry *dent, unsigned int vfid)
> @@ -188,7 +191,7 @@ static void pf_populate_tile(struct xe_tile *tile, struct dentry *dent, unsigned
>  		drm_debugfs_create_files(pf_ggtt_info,
>  					 ARRAY_SIZE(pf_ggtt_info),
>  					 dent, minor);
> -		if (xe_device_has_lmtt(xe))
> +		if (IS_DGFX(xe))
>  			drm_debugfs_create_files(pf_vram_info,
>  						 ARRAY_SIZE(pf_vram_info),
>  						 dent, minor);

