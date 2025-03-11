Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 007FBC28B2E
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 06:28:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9BD310E0C5;
	Tue, 11 Mar 2025 06:28:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ebKlTv6Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACFA510E0C5
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Mar 2025 06:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741674484; x=1773210484;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JSMMJFv3ff1X20z09lOXrexGj8xwwxgH39m7RYsT0AQ=;
 b=ebKlTv6ZZX7EubO584PjsmSvEuwgpxRIJ0BVFxDMvVxTZcbVh6axLH+K
 fn/I9hMzetaH025/WdICbL4Rg0Qb8Qv757QLMKjYH96hBA+4MrTa0eg4c
 iDlo44xjvuznGcimcH7L1G0aI+EuBz74HOpC4zNPm31TddC5jNiYkozmB
 a2b7kHi0HT5Ok+2GdGPkAKeiphhICYlb5C/jJD32dyVdFgFFBYSsDRQn2
 8JshKlNPRpy6X5KoN9zeF6Cb/o2vtHL1dAfsM6vwwy3KLUWQFdRqfZ7I+
 pILrV7h4SJ2zonQkwrsqBNX03axFw9bcPdEiVluRFJeQcHMNrNqIAbnKq Q==;
X-CSE-ConnectionGUID: 1mquBww8SfaNhiE4fMD1dg==
X-CSE-MsgGUID: T9WMgubQRhO7wAW1mxesFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42882032"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="42882032"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 23:28:04 -0700
X-CSE-ConnectionGUID: H0BNkoDETqirkPmVuz0WRQ==
X-CSE-MsgGUID: UuAybrL4Q6+XOnf1O9xA0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="125421929"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 23:28:04 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 10 Mar 2025 23:28:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 10 Mar 2025 23:28:03 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Mar 2025 23:28:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PM8Pv+e6KVsHf3dJjcpAbA/1A/ABtqlOjuP57qLLUc+qvLSic+oTkg435xTivKPm3C/jggTF/hglqrgnkSRVl3mCg1OVMbG6xR9sQLaqDrUSQjxymRMuC/BWWxbi4AKlyYCS53slUxIPJPzF933jIHgz44zY3sFC0+pAlb55xG823eedxU4W7l7zNn4CPoR39p/0ffoDfwQd4Xy879o8yZcvKbqGHqt9NPRaVUQME6JoYGFCAaGs8FrUtqwOwrnkhTALdEilTZZyWYtXarh9RhmgCgKEzC5zKiGhIEBScjTxyfg4ciIp7bL0JRTPUysZ+ycGCA9xVd6zzEBYYRpAXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gJsYlupSmIEs2i1qFOCUkGFAvbh4RbIWMJpnO0uH8VA=;
 b=V3ZNCIB2chqZVBrrCHpYLK8i53DTY2ZzYCyuEOyztNd3dFaxlYxgOzOSjKaFbzPNcE599SSsS6o6/0V1IIpO8K/w6h2/RcoDA2K7+Kn2xjqPI5RIOdYocNNY7/tl8L/LlChTcedtMLoWEuyFd/Pata7+SviqAs0Wnnq04FiWPrPDdtUsIFHZvsaWPSgIAyTfvM1UMJ4dDB2Ta6C16jUY2QFH1FS9DNwOGmfnPiE/fDUX3qy6plSgZu0iEpPaj/kc9kS3zLPH1pqQR4MtCi7AIW+xumuHb/p7MenBTNWAt87lRWX8vcHL/H33AO+F0UrNXMyJgt26z91jeBycL4IlTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM4PR11MB6262.namprd11.prod.outlook.com (2603:10b6:8:a7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 06:28:01 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8511.025; Tue, 11 Mar 2025
 06:28:00 +0000
Message-ID: <846a35e8-2997-4530-b152-3cd8f2166f62@intel.com>
Date: Tue, 11 Mar 2025 11:57:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 12/12] drm/xe/vm: Add debug prints for SVM range prefetch
To: <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <oak.zeng@intel.com>
References: <20250310124341.1819568-1-himal.prasad.ghimiray@intel.com>
 <20250310124341.1819568-13-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250310124341.1819568-13-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0172.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::16) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DM4PR11MB6262:EE_
X-MS-Office365-Filtering-Correlation-Id: 51b5455a-43b7-4948-8d0a-08dd6065df01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2IxR1llK2d5d0Y1aWdBTXBTR2toREFmS1B2ZlREbmRJRENnSGpIWFN2SmZB?=
 =?utf-8?B?cHE1SWNwL2lJVkYvZlc4UDIyKzBkVjlGN3NaUHlxbWZWZDJBc3pyNHV3WnZ3?=
 =?utf-8?B?VnVYZlhjeDBIelhqdDBQbVZHNnRlRE5VRmtKY3VBVStGQzVOUjF4V0QxVExx?=
 =?utf-8?B?dEFjTkdWRThEN2kzZDhmOTEvOWNsbVBoY1hrV3FRekduQ1B4YlFkQlFCYlFi?=
 =?utf-8?B?UmFaU0x1WFZWVmJXZnNXVk0weGdPbThDWEdOMS9Od0dsMW13a0hOTFI2NjJ2?=
 =?utf-8?B?b3RoV0h5SEpNVVQ2dFhRaDV5WDFXQWRpYTB4NlM0RXhCWGErTXIweVdGZVhp?=
 =?utf-8?B?NTZ0QnE2N0syUi9RNHNlRjMzcEZRRmZEY1RNR1NHUkFjSCtMdUoxQWlnMC8x?=
 =?utf-8?B?UVRlLzRmVDBiMnFlZnY3dHZmcEhmT3VaSUpyRnJGb3M5MldkTlZkc3lENWNh?=
 =?utf-8?B?bG1lRlJMbHQyN3gwaDlnNW9zZ2M0ekdCR1NrZTZiMGZ4eHRPY2pwMlBxaS9J?=
 =?utf-8?B?VlpOaUwvQVE0WGJlYkN2dldZN3hMY2wzWVUrZWFzNi9GQlA1ZjJDOU5rMWI4?=
 =?utf-8?B?Um42bUIySzAvOHhKdXZ3Mk9sVXhrT1NqekxPVm5iNGlxZ1FPNXdCbEhucjd5?=
 =?utf-8?B?SzRvaCswc1QzMFlML0dPNXdaVndndWxOZGNKbTdaR214LzQrdU1YbXplWUxn?=
 =?utf-8?B?Y1RYZjRTOXc0aUdmdjRPeitsT2F6Z3FYQXN3U2tIMk93UStnb2VVeTFyckdO?=
 =?utf-8?B?MzMwdXIzOWhGQW14OVdDZmNhc3VnN25mRnBLa0FIaVd5bkIxZk1BZWdBM0VP?=
 =?utf-8?B?akRvdGUzSzZvUFVJS1UzSDJEQmZ2c2E4NEZiWWVjR3NsbFIyUkZGYlRtNmlT?=
 =?utf-8?B?OFlkZWR1OGhjalVRc0xZK3VqY0pIcUxWMDBZMmNyVGx5N3FxZFBIYkkwM2ZQ?=
 =?utf-8?B?SXJpYzd2TUd3bUpzb2dTbFIyb2grbUpYZHlqYTNpdGR5RVRWYmdKTDlkQmJW?=
 =?utf-8?B?WEljdmRaY1hFcU1qMkdsckY4Z0dLbEtrOXUyUlNPYlRDVmlqMnV6cVZ3SW1X?=
 =?utf-8?B?YUNuU28yT0g0YmhpdDVzR2VmUkg0cmowcVdWNHk3ckJDM0hkNHMzTGJpYktn?=
 =?utf-8?B?dzUvams4anE2b0JnK2IvcUxzVkVNeVF5czRHSnB1ek5pdDJjd3JCMk9KR0pY?=
 =?utf-8?B?a2l6NWovUXYvbi80NnJZZUdpNFhzYTgzNU94K0U5SFROSC9zMUY3VTIySHhr?=
 =?utf-8?B?VHlhbHZQcW5LeTArUkttQk4xbmh1OXZHL2czeGdsNnFqUUc2TjlXZXFzSkhI?=
 =?utf-8?B?WWc2TnNTKzY2Rnp5cXVMb0Z0cFdoL2RzUEt4S0V0U2xFZWxiL1dyTlFMamph?=
 =?utf-8?B?ODU5TmFweUdIMmIzQWsrSDNIaHZERkRjVXM1aitMOHpNZHY4UmpYbkVXOG44?=
 =?utf-8?B?RThzbGxXcVhsMkRQNE54eXJyUnVLT1VvQ2c5MnNNK0t3ZjZOSTdCMHdGekFB?=
 =?utf-8?B?MVhqMVhQcmhXWlZtY21UMjQzdHZBcmR0M1V2eTlmNzBCRHhyempIM2lYRk8r?=
 =?utf-8?B?WEJYNk44RzEvSloybVFOSWY3M1RWRHBRSm9UUHg5ZkJtN3owejRNbDdzeHpS?=
 =?utf-8?B?cENpbTF0emdQaHdiNjNJSGZNaDRsWklPMEt5dWVOVkxsN0p5dWRJRCt0YXZT?=
 =?utf-8?B?MTZiRks1Q1FpVTI0WXNxWk1Na1NtdHJyR3JqaFdpRCtlYTRiYis1SXVTWVJi?=
 =?utf-8?B?SWROcjByajl3NWg0SC9yVG9CeWdWQzl6WFJGVmlyT2FWZGdNSi95TTcxTEtV?=
 =?utf-8?B?Q1Y2bVlwYkZ3WDF5dkxqY3lMbTVlVGIwZmhFTVQ4NklpZERYMzNZclNIeUd3?=
 =?utf-8?Q?UcWeuS9ItgM5B?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmJlQ0dUbk9CekIrYncyTXBWOHh6eHJtS0VKVUFIaVBSWmNtV2p0YURwNGZW?=
 =?utf-8?B?SU9kTmRyUXFHck5xUkhEOGZ1Z3ZuMU1lK3lSRzQwRmszaVZSUzJuejIrNHBB?=
 =?utf-8?B?RDg3SC9CTkcweUdEV1NKSFl4bW1OZ1VJbEpTN0gvSjlCWGFwTU1aZGYvUENO?=
 =?utf-8?B?U1JaYWVhbWhXRWdkZkdiOGwvRXhXbXBSbGNVZXZCMC9mTGhTR1hZaTJ2bnpX?=
 =?utf-8?B?cHBjc05XVU1jaFAwNWE5RUtPTzdlUC9xT2xLUjFEdWlCZHBBRllTaE9ZZmVI?=
 =?utf-8?B?T3NER2YvalZEY1lrZjdIelRTaUtyMTYwYkFiS2lROVlXOC9LYWsxZzMxTUxw?=
 =?utf-8?B?ZnpuWklSTDlnOU1IclJ3eWVMNEF5RUlmODhHZEgwaldqeFl3ZFVMY1ZzdG5L?=
 =?utf-8?B?cHdBanZRQi80QThoWW1vNHhQbGVpb2xubXdWZjBqNFFKSTYxeXZmSmdCWU9Y?=
 =?utf-8?B?L3ZDd28wY3htNzVWMGNEaFdsa3ZQdUlMc3h4MDFzbFc4RVRJTWh0SVlicW5F?=
 =?utf-8?B?ckR1eUg3UklPTkFhL09MKzJOTm9oVU9ZU3JFR0JiRmZLOSsrSWh5MzUxUjZQ?=
 =?utf-8?B?U3lBMjJXb2gyYjF3ZmFOUmZDcnQvK3N5L29tTUpnVmhEbkllU2pzamRaVGZW?=
 =?utf-8?B?YkRVS0twZG83K1ZackVqVFlERHBmVG5FVCt3c3p2TG1ld2NUd1M1NEs1TGRh?=
 =?utf-8?B?VGRySXZ4U1JXc1c4MFhiUGlmZFNEU2NmbGU3bTVwYkxVQ3MrdW50Tzh3Mi93?=
 =?utf-8?B?Mm1WUTh3Vi91aFZENEZTMGlDdEZXRHlBaktVSXVZVTFJaDI4TSsxTnFMazUy?=
 =?utf-8?B?alZXWk9TMkR0bDJvMGsrYzY5U0hYK1NTZXU3dmN3SDNmSDRnSDQwL2hrQkh6?=
 =?utf-8?B?SzFybWM1Uit0Q2U1Wkkwb05GL2d1Q2hMYUlGUTdncG1wWDVwdXZJUlZNWms0?=
 =?utf-8?B?VHo1MkpmSFlQTHNmdDAyMFlCeks2VE56cXdQZnNneHlJbU1odzVvZ3RSRzdk?=
 =?utf-8?B?dUY5RytZYXdhL2wyU0dibDdJaUtiQmZxanpBWU1kSFlONFYxTmpXWm42Q0Fu?=
 =?utf-8?B?aG9xajhsc2JVSmlBZThDNDg3M1FJdmI3dEFwR1NHY0VudSs5L2g4aVY5YVdz?=
 =?utf-8?B?WVMzNmFLSE5WNC9GYnZXQ21UUDVCdis5VEY5MElUTTBuZndyKzR1cUplSUtZ?=
 =?utf-8?B?NkJJNzN5T0FsVkNCbW8rRkZDNmVYZEZUWkdjdUZaZ3ptbUhjUXBNWkNpeHNn?=
 =?utf-8?B?Yitwb0pCdDFqdWU3TG80ZU1HR3Zaa3RZTjdDQkdmMkJOWkkrbTE3WkZFNGls?=
 =?utf-8?B?d0FHRU1EY3d6QkppU0w5V0lyaERqb0lUQ2hCYnhINVdnVGNxa3liMVVmTlI1?=
 =?utf-8?B?OUZQcTlLOTF4bGxtM2FZSUJ5NVB6UzB1aEJESGpjb0J2QkxJcDFIN1dDNk11?=
 =?utf-8?B?MndSZWlwWlZzbVpJVFFCQzdtNlFvbUVUVGVnUDZ5UXNRaEpzN0ViWkdiK3NY?=
 =?utf-8?B?RkhIVytkYlFYbjZYWUc2VldRM2Rjc2VqWHU1d3BJcG10Umo0bDNJNEp0WnNB?=
 =?utf-8?B?aWFaTjVGS0lrRDhKK016dXh5WVVWRkw3SnBkc0ZqZExwSGVld3FnNXk2d2l3?=
 =?utf-8?B?dGVEcGNBVUlyYnlMVFFHak11aVhZbjUvZCtZWG9sMnkwQ3hhYUZMcVJNWWVW?=
 =?utf-8?B?cUpDamMrdWtoMmdJSnU4MXgwVWp1ZHpCRXRtWnppQ0lZSitvd21wTUVlNDNq?=
 =?utf-8?B?Q2NSR2dYdk0wMjNqOUdueEZXN3pGSFd2cTh6aDZqN2NXWFJZT3NJbi9SVjc0?=
 =?utf-8?B?SmRFN1JxMGFRZkx6K0pDY3krdkN3ODVsY0h5L2xmNENnTzNkRzNTbkJaQjlY?=
 =?utf-8?B?dEFaUC9QeTZtL2IwNG1pK3F3WWs0Z21KbFRLckh0VGpvbnVFRjQ5L2VsZ1I5?=
 =?utf-8?B?dmN1YSttbTFkbDBjdytwQ2JPamtuNHBMdkRGbVZtRmlRSXhpSlM4ckdNVHVa?=
 =?utf-8?B?Z1phclQzbWJZMTltZUVoRnJQbmNyOVVhZlZVNUV1eGsyOGJLY0Zqak0xR0Fm?=
 =?utf-8?B?SjQ1K202WFBKQXVyNDhYS3B6cngrTFVyRitGNjN0KzJmV0xCTDU0NlRkbjk5?=
 =?utf-8?B?SnJJTUFiL0lxR0hMOE5BRUlPQXNTREIxMGdQaUZBVndJSXZtclh6K3ZBVGJ5?=
 =?utf-8?B?UGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51b5455a-43b7-4948-8d0a-08dd6065df01
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 06:28:00.8697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bSmLAcFPxAEcqcGCU+OBZFuIspl8uf3xS2NeTD1CqzlXGNlbOpaZMFtr4P/HQOd7DnySaVYHJ/lBMiLASQeMquCNgUa6yKhJlkCVdMwzyak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6262
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



On 10-03-2025 18:13, Himal Prasad Ghimiray wrote:
> Introduce debug logs for the prefetch operation of SVM ranges.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_vm.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index a1607283a5fe..b2b0824b8777 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2372,6 +2372,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>   			xa_store(&op->prefetch_range.range, i, svm_range, GFP_KERNEL);
>   			op->prefetch_range.ranges_count++;
>   			vops->flags |= XE_VMA_OPS_HAS_SVM_PREFETCH;
> +			xe_svm_range_debug(svm_range, "PREFETCH - RANGE CREATED");
>   
>   			if (range_end > xe_svm_range_end(svm_range) &&
>   			    xe_svm_range_end(svm_range) < xe_vma_end(vma)) {
> @@ -2869,6 +2870,7 @@ static int prefetch_ranges_lock_and_prep(struct xe_vm *vm,
>   						vm->usm.asid, (u64)&vm->svm.gpusvm, err);
>   					return -ENODATA;
>   				}
> +				xe_svm_range_debug(svm_range, "PREFETCH - RANGE MIGRATED TO VRAM");
>   			}
>   
>   			err = xe_svm_range_get_pages(vm, svm_range, &ctx);
> @@ -2878,8 +2880,11 @@ static int prefetch_ranges_lock_and_prep(struct xe_vm *vm,
>   
>   				drm_err(&vm->xe->drm, "Get pages failed, asid=%u, gpusvm=0x%016llx, errno %d\n",
>   					vm->usm.asid, (u64)&vm->svm.gpusvm, err);
> -				return err;
> +				err = -ENODATA;
>   			}
> +			if (err)
> +				return err;

 > -				return err;
 > +				err = -ENODATA;
 >   			}
 > +			if (err)
 > +				return err;

not needed. will remove in next version.

> +			xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET PAGES DONE");
>   		}
>   	}
>   	return err;

