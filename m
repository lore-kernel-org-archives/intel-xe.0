Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E22A0E64025
	for <intel-xe@archiver.kernel.org>; Thu, 21 Nov 2024 22:07:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D4A10E1EA;
	Thu, 21 Nov 2024 22:07:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dhuem2KG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BFB710E1EA
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Nov 2024 22:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732226825; x=1763762825;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JxKmUK9yEnmMsHRMVnB4q37po0LYhxCNKutkW4N04OM=;
 b=dhuem2KGdU4o+a4AbcXLCf1hOl241pCxYAJ7e4k8P+DDStYdAQT8zUUp
 m4Yvs8jJ3zPctAoEj314QnMZY6ZLgVPJUUp4rSwiho/cKduFtd/xOl+Rw
 2C/5i6R8BySWY9iDD8c0sf/6zk3mVijycxe/T1zvJym1580VavwwUxJpN
 Tz0t0iIdZjI1h3uj7pD7uck+nadCQ3Sa9JL9OGNiaYGcUtUWvOZ/f9nfL
 Ze0ksvsbrD4uZHPv0jNz1k3DdNbDzYb/+H0Did+WbH7x22vHsfsF9/m/N
 2+GuYF/pY5mbhtwIahbitX/yECK80UoU4KAi3KycPEHcmIjcsJDlDLD1Z g==;
X-CSE-ConnectionGUID: xPhsKbxrSqeNgbDMWxc/zQ==
X-CSE-MsgGUID: 31mFlHBgQvS0VrDy8umnvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="42981261"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="42981261"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 14:07:04 -0800
X-CSE-ConnectionGUID: P1xtSl20TkCECRYxhqdFYQ==
X-CSE-MsgGUID: KQ4zA/R7S967sDVlsuJYlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="95189215"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 14:07:03 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 14:07:02 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 14:07:02 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 14:07:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oi4t0GAO6V+D8LFwEO/1v8Uia3ytGOPC1xv/TFLVJwfJEdykdrkW+cfpfZNy3POOe5vi0zOrXFr9kKbGgV9vw1i4iLBVu5Q3QuLLrfPi9FsVdH11pxupb6ikXlfrfdKZKUgg9M4bZeboyG1YjE8ga39LezLYZPQvNK9B7H0vkwiWxJWruHDXIWabkbklotRKnwEO+VxOIcFmabbQMJPg+EiZa+jEAG5yeXrY3L/1oqv7T5tQpdh0DHuAvgSWzoUoxivEJ7MPgMM7Yl8goCQwM/2lwo91UIULy8PRMTGBZwNx82oEeLbJkYon6IO+mwiAHhvHuWIWvBVlYE3+wQBcyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQMlyzpdrHAUFgDIeymAjH1n4BOgmgKDV3ic9K7oaRY=;
 b=poR54PLGLBlGkiaGz1hcQ+YIKS5vvR1LAWXnrxyEfDWlPsUBa4aOhw0yLzUbIbOHltID/rlUaS3XNqP2d9VYU7OOIm2ggg7OWd//1NLx38HK0adjado5Jf/uz/vCSd+IJpognP0ipdgxmF3GZzH94QxGBwGVTMaNT1DTlwfQyIMoXStwrm5CyltEdvLW5Wm1GZXFsB8spnHYRkZMwLhluumWOJXgSn87cUYeFYUAjM5/Su5FLvTDSTxzPYDUvWsclPHo3k1qRVQNf0s39YZ+qgznLr2SwhciMzPedd/ywPmSs7L991nW/0m70DtO22y9kiG9N9Z88UNOIAKTjqryxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7401.namprd11.prod.outlook.com (2603:10b6:208:433::18)
 by MW4PR11MB7128.namprd11.prod.outlook.com (2603:10b6:303:22b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Thu, 21 Nov
 2024 22:06:59 +0000
Received: from IA0PR11MB7401.namprd11.prod.outlook.com
 ([fe80::beca:81e2:677:2958]) by IA0PR11MB7401.namprd11.prod.outlook.com
 ([fe80::beca:81e2:677:2958%3]) with mapi id 15.20.8182.014; Thu, 21 Nov 2024
 22:06:59 +0000
Date: Thu, 21 Nov 2024 14:06:56 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH] drm/xe/oa: Disallow OA from being enabled on active
 exec_queue's
Message-ID: <Zz+vAIHQaXztwn0Y@orsosgc001>
References: <20241119013256.680030-1-ashutosh.dixit@intel.com>
 <ZzykYzGwr1GXSqoV@lstrano-desk.jf.intel.com>
 <851pz76ie6.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <851pz76ie6.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR05CA0135.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::20) To IA0PR11MB7401.namprd11.prod.outlook.com
 (2603:10b6:208:433::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7401:EE_|MW4PR11MB7128:EE_
X-MS-Office365-Filtering-Correlation-Id: 85da7e62-0f8e-42ae-5be1-08dd0a78d21e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dVpsVmJ6RDNBenRONWZTRnBNangxNjZPUGhwOE9WUW52R0RBeTVMVEtYQk56?=
 =?utf-8?B?T0FnbjRkNVVkWGFyMDA3dFBkUjA4VCtwZ2h0WnpwOVBFRHpuQzRreHlVS2Zm?=
 =?utf-8?B?NERBVXRETUlqY1JWK1dPTnRmb0Z2U1lzV3NodTN6aVcwVStETGpEK2pzT2JM?=
 =?utf-8?B?MjFNRzNrQW5zWkE2Q2FGTWpENjJEZDNFaEhYY09BcjdXdmp5VEF5ejFyZXBm?=
 =?utf-8?B?dlFMUHRCQTczZWtyNlZjL1lkUGZoQWlWTlFwYU05T0ZaZ0VjbWloeFBSWC81?=
 =?utf-8?B?YWs3eHpwenRTaHRqc1VxTzlVRW84OEhaL01SKzVqRHVXaDR6UWlGRktIVkJt?=
 =?utf-8?B?ejRmYUNITlBkcHNyUEUvdmM4UUpkdVlXY0o4MnRMb0pFWnZ1djVUWVA2aXEy?=
 =?utf-8?B?c3VMcTA2bTUxU1lUWmlBRUdMZk9YaC9XZzMrZEFDbzhqRFpvSFB3U2FNaE4y?=
 =?utf-8?B?VHlCbkJrQlBTWFlJTW5lMW0zK1ZDK2NxL2FkRVdGNm9wSTVFMUxLWVNrUjRh?=
 =?utf-8?B?NVl2TVM3MTdXdVA5ekJlVS9lVGZycUR1b2dOZCtpbVBicXZLQjluR3UwTk9i?=
 =?utf-8?B?MFhYL2NUbERoc1ZlalM5aXpWblVjcno0RjdYSTVIcVVpcmo5QlZYUjhJOHl0?=
 =?utf-8?B?c0ZYK2poVmxvUVhkT3pOVEJmS01SQXE4STJzU3pVU2xkMmhzajFZTkxMNVlC?=
 =?utf-8?B?TTI4dEY3dTJ3UENHalZHWDFrbmorcWQrUHBmditLQnFPNmJIMy8yeUEvR0tH?=
 =?utf-8?B?T2dBaFl3a0Y0eFhRWlBpRFJOZzhiRzlKQlA1a2l4SXhvblpiTWQ1MjZhM0t0?=
 =?utf-8?B?V3YxSG9VVExxWUF6RkJiZVBnNW1kcnk2SnJVQ2YrMmZCOFJrMXF2ZjFaWWRL?=
 =?utf-8?B?WFFwSW80M2o1bDdWZjFZRUdabmFNc0Q0MGUyTzZKbThGcjhibG5vTXdnY1d1?=
 =?utf-8?B?ZTFLdDRTZWo5UWQzWmhid2o5d3ZXaHFiQS9UZjVJaTR3OEhWK2tPK3lGYmV6?=
 =?utf-8?B?NHVnVG1vTW9WMVdQR2RyZGNLa1BzOEhaQ0JBV0lJZURiT3g0eUd4NU5WeGZh?=
 =?utf-8?B?N2RlbUpaWmNNVmFBVUxUR2R2bWNTSU0zUEhzakYxdmU5a2hjNGZZRXJmUWRJ?=
 =?utf-8?B?d2xsMzhVbUVlSXoxUURKMFpPUExaT1I4KzBzeTFMYndaYVFHVnpzdEloeEhF?=
 =?utf-8?B?YUVjZll2S0NybDRUeEJSTjQ0djB1aWZJZGtGVThtU2JDSzBzQndzclREVGts?=
 =?utf-8?B?M2hUbkpxQ0FsTU93OHlBU1RzTXg1cTRUcU94TVFqVVVVR1RIY3JkKzUzOUt0?=
 =?utf-8?B?eDByVlhwdEpyZFRFaXl5Vzlyd3F4eDBDK1N0Y2tvZzRYSGk1UmJSNGQ5M0tF?=
 =?utf-8?B?bk4wbWdXR3FRQWZwSHRZUDNGVXlEcUJPR3RKNG5TTUswOUFFWFFPQmNiSDQv?=
 =?utf-8?B?MzA3cVNiMmZGUEEzVHAxdWZTR1VaV3FEZGtGZzE2cklsdVJ5NTYwaENzWnda?=
 =?utf-8?B?WnZhL0hsOGZJM1dSZ3g1aHdmNFZ4SlNySmlKcFRJYnNDNUtXWXorZGlreFEv?=
 =?utf-8?B?UTRsTjhuWTd0ZE9BSmpwYm9rMFJFQVZiWGkzR1hTZjZqTS84N1FialpmN3pD?=
 =?utf-8?B?MU5LdVBmTU1qNEV2YXptamR0MUc1ZGJySXFmSjdUVHpSNC9hWHZxSVY1VVE5?=
 =?utf-8?B?Rk9iUFM0eDBNYUhOZUk4SUt6bGRkN0tJYUpEM0JEcWFZV1FPSDdoME9iangr?=
 =?utf-8?Q?PSyUiF24Qhj7SxayXR3KlxOxhG7LNjZtlpYtTm0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7401.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTBLMG1jc1cyRnNDWmV2K0h3dFlldURsRm5BOGE1aDV3UVJiRjdQRU5iMkZP?=
 =?utf-8?B?Ky81V2ZicGJZejVvdk9BNkhyWTlMSGc5dEVadG9DSzViU0MrSmF0dlB3QkYv?=
 =?utf-8?B?cWlVS3pscUhhdHRTTllmY2pIT1hsdmFkdFd0VXN2YklBN1R3SlZHbllDLzRS?=
 =?utf-8?B?Yk8yMk8ycVRhUzdDaTdDbWpiaStOaGp6MzhkMHBGWHRpSWVpeGxBbVhmNnVj?=
 =?utf-8?B?YXBvRU45N3JwTHZIOFNvVnpjaGMwQ1NVSDExd2RReWl4akhiYWhSM0g5ZjE5?=
 =?utf-8?B?L3pIcXRqMHhzMXo2UVJyQ3FxSmI4ZWlmcFgvOWtRb0Y1WStTT01qak9MYjRq?=
 =?utf-8?B?K2YwYkhYM2NLZGRIWWxtcllLUDVRaTBid2lTTzlqN0h1VzMwZm5HaWZtSXRk?=
 =?utf-8?B?Z000OFF4V1RPRVZPekFPNSs4N3g4RStsdEl5ckZrOUVZTnROL1BZNHp2NEtY?=
 =?utf-8?B?R2Z1cVg5SksySFZINDFUMXJERTltTFBqRnZPenVLODJtRWd1NklUTER1SjUr?=
 =?utf-8?B?VWU1ekhuREpOYUtMVWRFMURwZzdnSjd1T0dLL0hMR3hkbXQzWGF0QU9OSDYy?=
 =?utf-8?B?VDByT2VDYWQzSnRhZWdxczlXVThaUFVweTBtNFJwekxBUnR3TTlMSWVXbzh2?=
 =?utf-8?B?RFJvNUVpdkdjajBDRFd5QzQrWUhnVCtFMGVqakJMTGVNeCtOaUxjRFU4TXhI?=
 =?utf-8?B?VWd2VmhwL2hMd3ZFbTUyN3I2ZVZvNWpMb0tqVHBCbXNtMXNidHAvYUxEZkJW?=
 =?utf-8?B?NldnM3hqOFkzMFpPbjhxejZwWlB1MnJPWHhpbHdwOExCUjhuZUNtR21GRW5Z?=
 =?utf-8?B?OEFCcG51T1VIREorN3hEREVFbHRHVG5mVkhWNFZCWjVab21LSzVXSEJpTCtN?=
 =?utf-8?B?MTUwVmxhc1hPQnNJWjNJWk1SRFVMdGplM0NGMUFTOGdiVmhPM0FqZXVFMjJR?=
 =?utf-8?B?cFpvbEQyaHU0bDUzMkJYWC85RkFDd0xySkJ4Lzg2K3dYUGpERktzaUQ1bHFC?=
 =?utf-8?B?bGcydVQwbEZFTGpRUHFqWk50ditPYnlzeDQweGx6azVzbzNBMjcvVjZBVEgv?=
 =?utf-8?B?cGJaUk8xOGRJTnpGUGljNTR2V0ZBaEFCTHFDeGJ1M1dFek4yamtVNXVXWTBQ?=
 =?utf-8?B?eHBEVkF0ZHI0WUYrL0lWQUdsK1g1WVpqTkdpYU5GQzZQTGF6Z3JycmFxK1dK?=
 =?utf-8?B?QXV1YklLc3dURGNjNnd4ZDcrTTdFdXJnQlBBcGRTWDhSYXZlYSs5dVN1S3ZI?=
 =?utf-8?B?bXQwUTlwTThYTVVaa3VxQ2FVK3F2b2p1MDZoZ2ZObC9OdlFXYzdra2pXZ3JD?=
 =?utf-8?B?N3hhdUx4c3NOV0YzbElCUFN3cXVMdDlpUmp3VmZwYUZrSGdiLzRMcjZWR1BV?=
 =?utf-8?B?U2FsdUkvek1rdkgrc2Z3empnKy9jVk1hR1ozOFR4V2R5cGFUdU9nUmdzWmdP?=
 =?utf-8?B?Njg2V0hOcXVZanBZYjNtT2RHYzNsbUFySWwwRGdHYzM0MTA0d1psb0hiamND?=
 =?utf-8?B?am1iRFJLdDBkalJFQ090bWlzSWo2OHZrWXYxWDhaL3NwVmVMdHJYL2tBU1ZY?=
 =?utf-8?B?Z1pPcE5HRmdRWENNK0h1SHVZMStUSndpbC91QjlWTTZMUVhVV3dKNDJ2bFl0?=
 =?utf-8?B?Y3lVemJRR2RsMmVNbno1cmxMdGk2cjBmSEtpcDlZVFA0TzlueFIxeWlETjhi?=
 =?utf-8?B?dUc1RTFQZVAzWDcwRzJvMEJRTFhEQUtDb0NDZDRZR0g0WERrS2ZJZTRBWUd1?=
 =?utf-8?B?OEkxNmhPVTdQcWJiWTFHQWQwSENDdnJMYXhZT2lhT3NSRW90S3dhYzk3cTJ1?=
 =?utf-8?B?RVRMQ2E4RUd5eGRvVSt6YjRlREdVcDY0UmFMQmZ3cW1TMkNwTGFROGdVcVdO?=
 =?utf-8?B?eUthL0ZId1Q4bjlwNzUvK2kreEdDNWpEdC9mZnYvaTI1M0p5NCtKMkZMSG9y?=
 =?utf-8?B?dGJZUmRNdkMzUFNUVkg5ZTZRcVA2cTc1alFwNFpEWFpIQ1JlUVVsU1Yrd2F6?=
 =?utf-8?B?WEIwWStUdTAyQWw4Wis5bmsrL05KTzF2Z3pZUEh3YVZ3d2tYalNiMmxMUUZ3?=
 =?utf-8?B?WVNnd3JQaWpFeDdOSDRmMjNNTG1DMUZtMjZNVFd1VnRWMEVzMVppRTNGeGw4?=
 =?utf-8?B?UDcrSlNrTTlyREZ1cVdTQzRZRnFJZnFLc2kyQVRBd3RvYVdLajV4UWFhb2VM?=
 =?utf-8?Q?N+TL2DiQjry3Aj+vX0vGifI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85da7e62-0f8e-42ae-5be1-08dd0a78d21e
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7401.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 22:06:59.6316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 418rt1PE7jhARKt+1qw/d3uSbvIbuMu7vd9sNd5aATSjrBc1EdAnXR1Ap0c82SzykZx94USRN36bX30/U2SN++uCY4E80r7zGrgg03j0ePg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7128
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

On Tue, Nov 19, 2024 at 01:08:49PM -0800, Dixit, Ashutosh wrote:
>On Tue, 19 Nov 2024 06:44:51 -0800, Matthew Brost wrote:
>>
>> On Mon, Nov 18, 2024 at 05:32:56PM -0800, Ashutosh Dixit wrote:
>> > Enabling OA on an exec_queue toggles the OAC_CONTEXT_ENABLE bit in
>> > CTXT_SR_CTL register. Toggling this bit changes the size and layout of the
>> > underlying HW context image. Therefore, enabling OA on an already active
>> > exec_queue (as currently implemented in xe) is an invalid operation and can
>> > cause hangs. Therefore, disallow OA from being enabled on active
>> > exec_queue's (here, by active we mean a context on which submissions have
>> > previously happened).
>> >
>>
>> This is something we will need to keep on eye on then because in various
>> experimental code I've played around enabling exec queues upon creation.
>> e.g., If we want to allocate a doorbell. I seem to recall Habana wanting
>> to enable exec queues upon creation too.
>
>The real requirement here is that HW context image should not have been
>loaded before OA is enabled on the exec queue. That is what happens today
>in the ENABLED state, correct, when user space submissions start?
>
>If operations such as doorbell are only management requests to GuC (which
>don't cause HW context image to be loaded) and if we can name a new state
>when the exec queue is handed off to userspace for starting submissions, we
>should be able to stay with this approach.
>
>> Just curious if it was ever explored having exec queue creation
>> extension which enables OA? It seems like this is something we may need
>> at some point if our exec queue creation semantics change of course
>> being careful to not break existing flows.
>
>Yeah I did think of it but didn't want to change the uapi.
>
>Also, a different implementation is possible which avoids this resizing of
>the context image altogether. It requires the kernel OA code submit its
>submissions on the user exec queue (and use that exec queue's VM, currently
>OA code uses a kernel exec queue). There are some reasons I don't want to
>implement that just yet, but worst case, we can do that if absolutely
>needed.

Just curious about why we are not going with the LRI command to set this 
bit in the context control. I think it should just be an MI_LRI 
submitted to the ring directly. More in the lines of 
xe_lrc_write_ring(). If that works, then we can avoid this patch and 
also revert the one that Jose had added as a work around.

Regards,
Umesh

>
>Thanks.
>--
>Ashutosh
