Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45225D41C35
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 13:41:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0787210E80B;
	Thu, 11 Dec 2025 13:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MRbnOwRN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C5910E80B
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 13:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765460506; x=1796996506;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8Y2CFEan2Ta7MxLJUcI5z2uzOPpbqI7WG3/nw6QFeY8=;
 b=MRbnOwRN6m3txefRpqWMKskpuNS8FDaE9/itobQRQWfYihWfc3mPTbum
 gRY0CdxUM5aQif+z+8gUwHp1NBf+h0jAAuL0sld1mZXXM400GWQjmzIyR
 GIAXLubG0Kd7iWBOzFggCYqlJ1r4rGqEYNgEX1uwoKakIfYcy+3KuZ1V5
 Jg0sAE3/WpYCtq0DqpGN5eIOA/Yo5+NXh9d+5jIGs5ncQmKGXs8xFJaiO
 kubrg/Nj9Tn3Ov7Ki44eLp4XJHyQ4wibEt6eWu00UQ1ca2q9gtWkINLeR
 PlbeHlWgUdvKZXoO7VW16itXEFWwhJAfwqRSqPaYg78mYZZv/8kv76Csu g==;
X-CSE-ConnectionGUID: ml4RwaLSSdaQkqZ1PDs23A==
X-CSE-MsgGUID: G/tbADShQLa+t9Mg+v+RyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67375356"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; d="scan'208";a="67375356"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 05:41:45 -0800
X-CSE-ConnectionGUID: PoBL1rylTB2hovJmoSWMzw==
X-CSE-MsgGUID: +UBiKi23TwiTpiuzcFgKWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="196569359"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 05:41:45 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 05:41:44 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 11 Dec 2025 05:41:44 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.17) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 05:41:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yF530q6o4e/1qy7Cq8Q9xpKbnl4I4O2nyQaHfLywzcUk0Qy0R5IX2ylnHI3A+0Bts3C2YpjY+M/f0GyTXSeEdszblqZ4RqOatMnnrYKexDOKSL8Djz7V2CA0GYvRi1dMMUDgQnK0KFooR3vN0uVZ11McRLUWWifniGnXi5qDrl7fz0e3w3LKw0ST7B0tdQ4D7RpIKKZMLsruvxsb+/bUzcBhCvmdxU1gbKj11bbMy+g8A4MtPAnm+Iexg56H0WQ+KbR63IxEt7UdzeyFMEQOIYu56k1wRVQFkr9nth1EJbHKlBvaVnLwc4issE6n4ckCy9X8R0b01BtSQs1lmEQXaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DpHwuQPqvxnDRcWVxDJONeMT00pRv47Ghsdrteo0wnA=;
 b=EML86bOQcpyEQGZz6ZGRdn4FHma776I9prqLo2lkCXbFbJ3Xjab9Gumsgzuc8QwTUxo7IFhS413poC0iUxP09AE9qW8WjRd3llhX7tTZK0uMopwI8Md70AnGW3DJSW946u/D4T0q638K591e7R6a0du2ZBcBoS3JRcS8+cnXSIo8rPUciG9CQN+bYtP3//0RtmjpcRSXRrWfMiO3pkxzUbxFGNANZArgz9J600TS6IvBQBBu7+EeF7Hh6y7Yud/qWdGIvCrY+RdHT75zNmsb4p75XW2IC66CteafbD/hYHh7XdOsS58I1lwx3qCFfTzgkbWR+37aL0xMDt+DaDWnRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA4PR11MB9058.namprd11.prod.outlook.com (2603:10b6:208:56e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.10; Thu, 11 Dec
 2025 13:41:35 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9388.013; Thu, 11 Dec 2025
 13:41:35 +0000
Message-ID: <0a9f728f-1c77-479d-8bbc-c0f662544061@intel.com>
Date: Thu, 11 Dec 2025 14:41:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe/vf: Reset recovery_queued after issuing
 RESFIX_START
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
References: <20251210052546.622809-4-satyanarayana.k.v.p@intel.com>
 <20251210052546.622809-6-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251210052546.622809-6-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0161.eurprd07.prod.outlook.com
 (2603:10a6:802:16::48) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA4PR11MB9058:EE_
X-MS-Office365-Filtering-Correlation-Id: fbc2dccd-f0b4-40fc-83d1-08de38bb003f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmRtTk1YRzNVQklOL2xyTTV4R2w5VGIrUW5YZlVJS3JJRzFnNHpnTnJHQUFq?=
 =?utf-8?B?WGwralkvL1ExekdIOWpUdExWcVFydHBrdVF6ZWJXZWNuTjRoQTY0UGx1Y3hU?=
 =?utf-8?B?N3JIMTBKZFRTVWxIcG1QM2p0VGVpNWtJM2NQTTdTVHc0Smt3LzlkbTRFaWY5?=
 =?utf-8?B?Q0UxQmpOZXdWR0Z4cHQvUklYdS9MeklEZnlBcmRvNnJ3T0E0elNEdTI0NWtW?=
 =?utf-8?B?ZUVOVW16VDVGR2ljV00vajYzU1p4b05GcStMdU40aFB6bGNpZmNENENpTWN3?=
 =?utf-8?B?bEcrTGRCZjVJekUrc0ErL254UTJJaml5dUk4Tk5SamtOelRtSkxHNVpuOUYy?=
 =?utf-8?B?c3ltTCtCL0dIWUZMbHl6ZHk1N1JqRXZqdk5KTXBrZ0NQREZRVXFrTWUrZkt1?=
 =?utf-8?B?YzVEa2tJTTVvTmxTUHNpNjV1MUMxUHdiaWM5RGtINStxTENjVFZ4K0ZxMlhj?=
 =?utf-8?B?YW1kaFJIUHBFVEZRRmZmS1F0SVFmS1VnWlNTWXhHNk91cXovNzN5bzFoSlF1?=
 =?utf-8?B?cDJNOW5odnVhOHlpZ1Y3OWFrQVc5ZTFqNVgzVHhMT2JjVmY4cTFDYnJzUk8r?=
 =?utf-8?B?MnhaUm1JTE5na29jSDFyU2YyVDFYdE5VdGRKL1ZnZVdSM3F1Mmp0aWpnQUxs?=
 =?utf-8?B?eUFrOUZXMS9EZERDTDNWcENmbllVZEgvZ2JPNTJKRjZtQVAwVjJva1JqTUtj?=
 =?utf-8?B?akNaOUlCNlAvUk5jUkV5ekdkWHA3SmJkeXp0V3BBRVJFSkI4RWswN281bUwy?=
 =?utf-8?B?OGRSVTBBSUJ6aDJPT3ZlTTNUeUI1dGUrcmV3SHh6aWRWdGltVHpIb3RNeXI2?=
 =?utf-8?B?K1hQaWpXaHFFWGRSNjZTQk5kS3h2dDRlSEF2LzRRK1FSZldvbEw2b25USE5N?=
 =?utf-8?B?U3ovWHpxMUhlemZUUXFzRHZvc0kwTFNBTmVpendJcmRkcDJjampkMmhiMGxR?=
 =?utf-8?B?NVVGZElUbzdSa0xDYnNENHhBRlpBWGpPZ2RwTFcxNTN4ck81QXJLYlVnTWRR?=
 =?utf-8?B?cjFMVFlZS0lsZXRnQUhjdk9lcDc5Z28rSkNycWFSeTl2Q0lkc0IySjRKRzVK?=
 =?utf-8?B?bklUaHJZZWZMeGJhQVRNaHFOaDBhZlJkOER4UUtMY1E2ZVhxWFJHU1MzbnF3?=
 =?utf-8?B?enFjMVJsTUFubTFhUGFyWDNTYTJvSFlmKzZRdE5oOFM3ZDQ0WUY1MEl6OEdt?=
 =?utf-8?B?RGJWMjNlWEpNbldVRVltYWpTQ2NCMlA0UGRxWm1UT3ZTZjJOZ1g5RTFkRGt6?=
 =?utf-8?B?VG5aODE5U01tUXRUMkdiNk1sQzh2dUdzd1RVVjNacU5kVnhNS0dtak9BSGlr?=
 =?utf-8?B?ZnZsbmRHUUR1S3hXMlRWNXFoQlM0c3NWdVZYS2p1UGZCOUs1cmJVWE5xWVBH?=
 =?utf-8?B?Vkk5MHloVmtOcWpVNzJ6VjBwWEhaS2lURDFuVGlYMjFQVEJVZU1aS0pZRnpI?=
 =?utf-8?B?YkRkbTZkMUtDNVNLcXIzVDFUNmVqMVhNK3VJNjhOdmdpOWQzbnVxVFZ1Vndq?=
 =?utf-8?B?V050NDVqNDJUU0VOaWtsUkpVaHBlRHJyUkdxQWJxSDJnWEhYcHd1K1hzWEl4?=
 =?utf-8?B?TG4wSW92UnU0emRJOE1RaTl4cDdVbVdReHRXelY5MVdWR1VITGdYYm0wdlor?=
 =?utf-8?B?Um5NMzR1ODRBZWorM0pWaE1IVkg4RUlLWldmcDk5WXdkRkgwSU9GUDdSenB3?=
 =?utf-8?B?VlJGZkRFL0Y3WC8rcUV6enJVeHdFQkFNNzVoa2FDcTVVSldWVnROQjM3dnh3?=
 =?utf-8?B?U2VjOVQ1L1RvbnJzbW4zQVcrM0FnWE5FR21RL3lySklTbVRyUkhJZnFQV2xJ?=
 =?utf-8?B?eWpNR1NTcUIzbVRCY1RWZDlrN2xuVDdsTnpvZzl3VWR2RmFIdTh1SXN1dDAy?=
 =?utf-8?B?V2x4Y0dBTXRLVWdWMTRsejhhbWFUZVRFVlNKemo0SmU1TzVVWUpCNXBxb2to?=
 =?utf-8?Q?pFXu2xP6kPOSwG+TkpM7SAKjXTXONMXe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUpidm5vUWJYUVplUHU2bnNjWFRIOFlwTklmTWMyMm1GRXlJay95WVA1ZG5P?=
 =?utf-8?B?Z1lIdDMyWUJuVmh4Znp2aE5ndm53ZGFqN1VkSkgyU3lZMlZFRElOSS9OaEcw?=
 =?utf-8?B?TmttUDZHV2tNaGxkSE1BS01LUllhb2lkN2djemN0MjZBcHJrOTlpNjV1UThr?=
 =?utf-8?B?WXRjbEVsbitqTmFjYlVDVzFMYjdBeVdGaHJBNjNkcUdxeG5NeTh6RjBhTFdi?=
 =?utf-8?B?V3YwYXRwSnhDZzdHRlFwaVdDbWtMWjYyU0FIYTQ4djQ3OHZpbDY3ZmYwQTdC?=
 =?utf-8?B?THd2VU0wRjdSSnRGRHNyL2ltcWEvOFc2SFkybDlYVFN0L3BSeW9TUUxlOFhX?=
 =?utf-8?B?R1o3U3UyOG9wRVhXQjg2aEpxdG8wbDh2SEt1dnpoK1lDOUdqN21WVUhTMUNO?=
 =?utf-8?B?WTNGdDg4dGxMWndQcXJrRllNaERYUHczNHU1dE1DdW1FZGpWNzJMdlJZaS9j?=
 =?utf-8?B?bDNDUS9VaGUzREtrOW9QK3BTd3VGNnBiaGlobmRtUkxCN1ZMcUhyTWFnUW5K?=
 =?utf-8?B?VldCdlV6U1Q1dnF1Ri9zMkZDTlBZbW9XYXc2OGs2dzJHa2o3bXVWQ0ViQWVx?=
 =?utf-8?B?bmlvZDU0dStSL2lrS3JzNm1uU2JDa0hDNVBCZmJwdjhDRGJKYkJlQk52YW10?=
 =?utf-8?B?RVBmZGRPRFdJWUpCSHJZTzZsQlo2b2dDR09uWEduNkdhcFQ4U0U4NFBvNEpq?=
 =?utf-8?B?dzFkUDA5Skg3RGZSaEpSRVdoTlV0ZFEzYStvYnFWOGQ5Sy82T2tRaUFFcUtw?=
 =?utf-8?B?ZEVsOFQrVzJTNWp1OS9Hekk3U3VJYkpsWjNMS2RaUStwbVZBOW1jY2dpcHRB?=
 =?utf-8?B?ZDl5Z1BVS1lpMTRuRjNqMWpBS2pTRkRiZll1NStjdzNZc1FhclQ0MnA4bkhx?=
 =?utf-8?B?anpYUUQ4MndzdGx5SkZNdzRTdlRZRzIrOFFXb2ZRTnp6VHpmSHlTRGJ3UzlM?=
 =?utf-8?B?OHFVMUNLQ3NRK2hBeVN3YXRUNXlseHRZMzBtdHlCbjhLY2VPcmIwNWFjR3Er?=
 =?utf-8?B?RG1HTUpwTWFzdSt4RUJobS9WV0lzWXk3bEs2aFZCMjRRNDVQVFNRdytXSjJu?=
 =?utf-8?B?WmdxeG9NK2NlOUh2TnlIcVduaGlaYXJsaHJzdFRYL2pzT0Q3QTdoMXhLdnZX?=
 =?utf-8?B?aDkzNERtTUZjS0hIK1gwL09nSHR1OGVtNHNhRFVrb1paNjRmNXJJa2ovLzQ4?=
 =?utf-8?B?RG5LU0JRRXBnUFdnc2FCSlpxRS8yVXllM0Qvc0lYY1B5K0ZvWEZGT09xRWhT?=
 =?utf-8?B?dGs0SFhKTDZzL3JvZkJPaTVVWEFrUFdwaDVaaTd4dHI2VSs2OXdUUU50WjVp?=
 =?utf-8?B?eW5vUndWZmNtNS92WURRQVZOVVg5MGVXTnhQOXpWN013SmYzV3JzVkZ2cUNW?=
 =?utf-8?B?WnhnWk5IS1pzdHFSZ2JpQkE2Y0o1QmlENEwzMStyRHd5dGdIaXdzcm5vVURV?=
 =?utf-8?B?WXByb3FsMzRpZ0FPV3lvYUYxMlV6Yk56cmtoSVZDeHBjWitpYmREVVR1ckZh?=
 =?utf-8?B?KzBORkgxSWp3eGlNQXgwVjJZdStOL2FHbDlkbWQvWDVGZFdvUzFOdzZYWktj?=
 =?utf-8?B?dXhKL2pETkxrQUNuRVZuWHVJZ204bGI2MXpDT2t2aVdnRUh2dDNvaXltQlRE?=
 =?utf-8?B?eFJmRmhrUjRWT1ZtdU12SGRjMGdSZ2NiYzAxeVgxQi9CNUM1bTJwaTU1WlZm?=
 =?utf-8?B?Y01VLzN4bmlNeVdUNms4QzFqNDRtZW8wTldaYVI4U2ZTaFU1RXpkVlRtbjg1?=
 =?utf-8?B?czRHMDQrWlVsSDY2STUyWi90MG1iZHVHS3crc1ozYlZtcjRsckdBU0tZVmtH?=
 =?utf-8?B?R3RUSTVidGRiS0FHMFNRL24wSFdDRXp4SVZ0VE9PYjlWTFAyMm1GTXlGdHRj?=
 =?utf-8?B?K3hNaWRBZE90dHg5QloyTklPd3dOdExCRzd0aXh2RHZTU28yUFB5VFdNZTlM?=
 =?utf-8?B?ZmlZb1hPbE9Meno0MXNWMkc3cDhLNzVOYWExdHJnKzZsS3ZvVXlvbnBFT1oz?=
 =?utf-8?B?V0pvQU9qKy9TOU00dW1YcDhHWDM4aEM0OFpyY1JKY3VJQ1hjWktwSWs1cVVI?=
 =?utf-8?B?Sy85Vkpib2ZUdWdreTRqVTh4VXZDbllwalhSNmNVdEMrRnlZNHM1ZCtWS0sw?=
 =?utf-8?B?cG5YUXE3VURRamcvT1JPcmlXQjZTa3FuVTFNS05CM2M4WUpKWkgrSkVqSTNs?=
 =?utf-8?B?Q2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fbc2dccd-f0b4-40fc-83d1-08de38bb003f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 13:41:35.0375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 91E3OsEoGSmDLZZFFZrMqHIgvduFhOFhBUWSNpfTu9KYs3FM1JUzeHote1YAMWM9YNljUDkaX72VrjJxTo/w4YW2O6CJ0s0aB+p+cdrG8nk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9058
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



On 12/10/2025 6:25 AM, Satyanarayana K V P wrote:
> During VF_RESTORE or VF_RESUME, the GuC sends a migration interrupt and
> clears the RESFIX_START marker. If migration or resume occurs before the
> VF issues its own RESFIX_START, VF KMD may receive two back-to-back
> migration interrupts. VF then sends RESFIX_START to indicate the beginning
> of fixups and RESFIX_DONE to mark completion. However, the second
> RESFIX_START fails because the GuC is already in the RUNNING state.
> 
> Clear the recovery_queued flag after sending a RESFIX_START message to
> ignore duplicated IRQs seen before we start actual recovery.
> 
> This ensures the state is reset only after the fixup process begins,
> avoiding redundant work item queuing.
> 
> Fixes: b5fbb94341a2 ("drm/xe/vf: Introduce RESFIX start marker support")
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

