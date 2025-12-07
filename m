Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E6C3D1CDC6
	for <intel-xe@archiver.kernel.org>; Sun,  7 Dec 2025 21:57:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED6A010E372;
	Sun,  7 Dec 2025 21:57:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QtZFIZMP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BCF410E372
 for <intel-xe@lists.freedesktop.org>; Sun,  7 Dec 2025 21:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765144635; x=1796680635;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=RA2AnRs3x5wqDWFsAIc8mh5UuwH8oeerBLUUo01YGTw=;
 b=QtZFIZMPUmWVLKkT/vs44Xhyoa4QoffvPEDqqLTxs+Nxnb7weMj4uQsh
 Lz70wAkKI/HrL+CwMb47wo+DI4bgbt9QaGF1TbsbNkd3i2QzKFmYgKOi+
 N+OydI8qNgnezlJ0w6qUaNYvGGIvrzsmWXFSN3mJsAnTcYaCNhJgxowAX
 F4V3XZiOop/RGxdJZhAE+UDdyRIlt0HsxCNUBdNJ+8f+XlCcXcyFKxFA4
 FMy8Zm3tlrzaTBInFzkVWQIL2PDuwhLGvBP9OSjRA9NVosLbtcFeAdeZs
 3g/tPByOwVbZdYqv7PWT6tf8RMt/+3VElI943VSo7XaGaF2Kpn5zvLU8e Q==;
X-CSE-ConnectionGUID: YCKFdN7xT0+8ikKDk73PGg==
X-CSE-MsgGUID: RhF1urzFQ1+Tt5L9+rg86w==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67140357"
X-IronPort-AV: E=Sophos;i="6.20,257,1758610800"; d="scan'208";a="67140357"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2025 13:57:14 -0800
X-CSE-ConnectionGUID: gbsKqbZPRTmVyIWKv+e3sQ==
X-CSE-MsgGUID: V7wSV6i4QTqnAHMs6tJvwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,257,1758610800"; d="scan'208";a="200697362"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2025 13:57:14 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 7 Dec 2025 13:57:13 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 7 Dec 2025 13:57:13 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.4) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 7 Dec 2025 13:57:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fgtYgP55b9cyyhnUHPhcBzz4UIPc9oTVLouKvqCJSc5zhinqQlE0qR/OuTh0RyWxL+OQMy3Q9oj1iMoGBNhU03jS+1DVPBnfn4IoYSizDqgEa3UUYfQwAOsQKUpD0WlmISDyFL10Nul/bcisB2YoFbTm3SoOWXmS2+f/epPuzn7yiWvGfHRSpE4NRJlnF0vyDkUD5wyNvTW0U6/981KU/SFWxXvMMHYpjbmHKaYqBMpjXESnpqCWWzHgHal0UsU09AVXI3zB8bnM0hsVu10DsmStzeZbL4hCWsbrYHgcrIx3AQejSw6vbuKKzL3nT6LajRh2KtE4sU9XY0HD1yiu1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p/mdTVkrbORyL+pP1PICkKxIfx8zyFVIJvGA8a1gLSk=;
 b=Gw1NC9ijPFGKWBgUbz80cf4/M4Lu3Jnrfri/mnSLBECh/6jp4CpgmJlmq8A4D0m7GuTaxBfTrHpZ8w4rDPOLdBZbTLadLoa2dtHYp6ttnOpU6WirZGx+qSPk2xZfZAAHF60uo8Y8B8DtHdyZ6Xr2I+6vbcXoQ13G7GU23UnDy5M85oRdb2iTjgA0ZmhuJuNuDD4JYNkscF/rLSoLh+kFNnx0/ax/cU0XxN3/dFy3CiV+0uf/xIVEd2zom6evaR9Hdl3e2xxzz6DGghK7IMZJ5G4wuogi4ThcdftuNabn4QGiJ8DMTirY87zno4ViWjYTzHMG7zpUYr7U7KZbf867aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW5PR11MB5764.namprd11.prod.outlook.com (2603:10b6:303:197::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Sun, 7 Dec
 2025 21:57:09 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9388.013; Sun, 7 Dec 2025
 21:57:09 +0000
Message-ID: <f520d00e-2f9d-4337-a0bc-0bec3aa96d5d@intel.com>
Date: Sun, 7 Dec 2025 22:57:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/11] drm/xe/sriov: Initialize scheduler groups
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251206230356.3600292-13-daniele.ceraolospurio@intel.com>
 <20251206230356.3600292-15-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251206230356.3600292-15-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0249.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::16) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW5PR11MB5764:EE_
X-MS-Office365-Filtering-Correlation-Id: 571763e8-4d35-45aa-7cd1-08de35db9187
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N0xUSnFPUEZiTFBPTzhnMkZ2U1ZEM3NLb2ZpYVhvQ3hmY0lTajBxOEpkN0JC?=
 =?utf-8?B?bEJSOWI1SnA0M05ybVJxS29DbEkzTklMS2ZXeTNvMkV3N1dNa3NMbXA4TU96?=
 =?utf-8?B?bmV3S2YxcGxVSEtEMTFHOUlGWTRLLzBXZ042NHA2SDZuNGI5Z09PSit6a3dU?=
 =?utf-8?B?ZllDWFhIcW5DM21YYUhNTFdRZmJTWUt6QUh5SFA5QUZjNXJ1VEkwL1VhVFFs?=
 =?utf-8?B?Q1RRcXRQMlVTQnZ6QTc2SWRENzZWYyt5TFdxTXNBN1ZRTTF3OCt2RVhRNHRu?=
 =?utf-8?B?ZTJyYU5ZU3lrYU5YK2ZDbUNJcG9WTE1xTFQvZ09FRTk5QW9rMVRBeVlmeFpW?=
 =?utf-8?B?bXEwbDMydzE2WjRuKzJVaEdkN2N0TVkxYjhvTUU0OTVUZENMdDBjd0JsOXg4?=
 =?utf-8?B?b01LNlhLSnNxdEhjWmROM1E3TzhOSHVrQkVjVjd1WWpoMlE0RGJrZVVTUTZK?=
 =?utf-8?B?QzU3THR2bGd5OG1YSGhvWndTWm41cEVqbkQ3QTh3Yzc5dFZva2pGSnFKUkF6?=
 =?utf-8?B?b0hQVzZGeGlBdjRWdGFoeWduRGlFSFpFVTY3cXU3a0dMSWxzYVA3cUk5UkJ0?=
 =?utf-8?B?Mmg5TWhrbllBYjcwYmhxZnRvRW95Rk12b2MxL1JkZ0tVOWF4MWFHNHFycEY4?=
 =?utf-8?B?TVRGYktJUU5rdXJOOVVGeDYyREpMS0VmY2VEUEVzN2pmd04wZGhPWFVzTlhW?=
 =?utf-8?B?VTNnaC9YTllNaElnZWZiL2pSTzlONEkxTDZwM2d1dVlGeS9Zeml0OHNGU21k?=
 =?utf-8?B?QXd1NVVGNUlJdGZnd05JT243ZWNtNllhckl3bTU3NXcvaGU3clNZb3oxYVg0?=
 =?utf-8?B?THNkSHJ5SVYvc21TVnphemR3dHlydmRMYnd4QzBUNHRKdkhoOUpUbkRZSWdt?=
 =?utf-8?B?ckJ6emFQSE93aGJJMXlaRzJCdGVwSmkwdUhKSldYT25NOHlrOVRUMnU0SGRx?=
 =?utf-8?B?YUxkMzl5MEZwSjJjVzdEYWsrcmduUHNOVHNBbjZOZGpQK3ArR3dmTnN1b1lB?=
 =?utf-8?B?cDY3anIvaXlMbGtnZTVBaTI5aHZsdFFWTk5wWFhvblZyUElLQmVpamQ4Umph?=
 =?utf-8?B?U1pzQnArMnR6MGQyTmU5U0YxMjRCaTJ3SlhxMUpUVGRTYnFKQnBsMGNxZVZC?=
 =?utf-8?B?KzRvdjlHS1dlM2tsSDViWnFHVTF0WTdPTXhyQmJjbkRzM0pUVk5aUW92cDZm?=
 =?utf-8?B?T3BtajVUcjBNeFZYQXZmWWxBZm1kTVZDL1ducHVDTTd0M2xFaHlBUlpDVXhQ?=
 =?utf-8?B?QzJmVFhlT0dUWGFmQTF0VjZxTmIzaXUwMElOU1lTamJ2emVkWlpaWWdMbmpC?=
 =?utf-8?B?N1c3L3Qzb2tNQkhSZUdvb3RneDl0Q1VwcXZKcTZ1Rm02Q0l4RlZSY2R6YllH?=
 =?utf-8?B?QU03MDFlWnpiOTJMYmJ0UWhub0tTbnZuYzY0WWo1WTI2d0xEZUFIRkFDZmYr?=
 =?utf-8?B?MTVpejlKYTZxWENwejllRHdYV2hGOUtISlJkTitQS0kzVGlQeHdsczBnVzkw?=
 =?utf-8?B?bjRnWmhmSjE0SDNzVXcwdEQrL1Z5TWxuWW9CSUtpUEx3V2l6VHFEelRHanlt?=
 =?utf-8?B?WFVWUkdmbTZMQURRYU40ZHJYRVhZUUpESkZicTdtVzBlUFZYdlpHR1JIU1ZC?=
 =?utf-8?B?TzdpOVFSTG56VFgwWm5oUVV4UjViQnEydWR5SHB1TXhwY2ZnaVlSWFBzbkZJ?=
 =?utf-8?B?blpMQTZrU2NNb0hLU2VoSWQxTG9BcDg5bFZCb0p0cXhuVzZUMHVKWXB0Ymtr?=
 =?utf-8?B?WS9KVFNaWkNUYy83UVVOZkYvamw1Q3VYWGZ2STVUNWNVZnc1YUNjSncxMUxV?=
 =?utf-8?B?cnI2bGczSXcwMEdLWlFFT2ZqWTZNVmZRQ2hnQkRiZ1A4SU1XTkJPS3U1c0ls?=
 =?utf-8?B?eCtaZjIvYUllbmNmUGVJUUx2dzZBVlJmNHRzZ2l0RHY3WDBIcnorN28yWFFS?=
 =?utf-8?Q?iV5Gh3Lj5mrPFMzdAo5llOD8+aD2oA0Q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2RrdzNUcy94cjVhK3FhVU1TYzhtV1k5NGZWejVJeWlMWFB6RVIvNkJ3eS9M?=
 =?utf-8?B?S0lJMmZkNHR4Z1BabTBXRkR1eWFkeURxYkRDWnpCVHMwN1lab2dxa1VvNlN6?=
 =?utf-8?B?bTZPdEpwdWpXZkFMVEhrQm9jdUNVdXB5Umt4S3hnWWd2b2k2NmdVZXZqd2dV?=
 =?utf-8?B?UWV5SGpDZUtXK2RWN2tZWU95M25nMjUyUnFiUHdqZ1pTS29kbU5ZdEx4dHNB?=
 =?utf-8?B?ZDZ6MDdSR0czeHViV2tkWXVjeEVxMDlMUkxpTE9JSXBrdStBWEhKRVdrMjZE?=
 =?utf-8?B?NTJNV3YzUjk1Z2w0Z0I2TzF4aXp6eW5hbVNsNktwSlBYQ1gyTFY1ZVJ2VEgy?=
 =?utf-8?B?dXNhRUJNM0F2R1UvWEpVcHdGaThZVDh5dUFWU0JHRkFvaFdMVlMxQURwL00w?=
 =?utf-8?B?eEN6cDJQeCtHdnZ3OS9XKzM1d3AxM1pXVy93cnRYRWtteDRjMUxZeGlhYVgr?=
 =?utf-8?B?K0pqT3AxRVJYVlZyNERKaTFscVdBTWVMbksvZnZhaEhXOUQ1Uks5MlhHcEt4?=
 =?utf-8?B?dkVYbWxmVkRyS2VSTzM4dHh4eFZkQTcvbldiZVl2dzlxZllKeVM0LzhXUUxN?=
 =?utf-8?B?a2dFS3p1eGJDZUw0QmsxcVJCSXFuQmZPV2w3Tm9sOGk0VzYyd3ZSaUczVlRk?=
 =?utf-8?B?R2pZVnZLSU9KZi93S1QxaEpUeDJuZ1RUeTd5b1NBbmIwTjhhL0IwV1VEdHdQ?=
 =?utf-8?B?UWt2VUJIZlJaNWJtbFhIZm9SRmYyZGJRVWVkd0F4c0FRYzlkQnZmRUNmL0xN?=
 =?utf-8?B?QWU2KytFY0RSWEdtcWlCejBLRlA5L3hhUVVYV3B4OXNtMnhYTWxHdVVzdzE2?=
 =?utf-8?B?eVB0dlhoUmFjMzA1L0ZuTER2NWJXWTRHZXFDMVZvdjhRL1hTWHBuOE9zOHZC?=
 =?utf-8?B?M3V2SlFJaGN5YWdxRzBiWUNyVlJnQk9nU0Nrc1VTdGE3REZyT3ZNSFBQeXln?=
 =?utf-8?B?ZVRSOEZJSXh6UTU0T2xzTWZjVVJrNVMvb3JpSkVxUFJmNW1tNnp6WjFqRWhz?=
 =?utf-8?B?SndyZ2NYK3h6cTN1am5zNExYWFltdUdyL2xMUTYrMmFvVStyS0d1TldnOGFE?=
 =?utf-8?B?S3hXOW1EUDZYbjhpMlRERm1OOGsxWHBYWDZxdlY2YVpqSXR6MjVLTTR5TGlY?=
 =?utf-8?B?ck9ucWxXbWVmZU5aM1dZajBPRGpyeUxnSHRjNldxWncyMzRGaDZKVGNtODk3?=
 =?utf-8?B?ckZQa0craDgvZ0xTaHY5aGlhd2p5dHkySnl2M0lqakVYMUZxRUtnNjdCZDRh?=
 =?utf-8?B?MEE3NGZzcEN5ZXplQnpMWnNYNlFZTytncGdYUmpNTTl0OUI2T3ZHaVpWUlAx?=
 =?utf-8?B?YTN4c0Zibmxpb0hXaExaLzV0MjVwWnBDQmVicWU5RlpydWVQMHRTSW1oZHJo?=
 =?utf-8?B?ZkZRdEpncFpkT01CWmpjaW1CMGpyY3hxdFlXaWdtSE1Wek9DeDhMbXhpRnEw?=
 =?utf-8?B?YkpHY1BFZjI2Z1dpQS9RVzBKUTJiTE5lR2RZa3hsS09CMXVWRTZoUGMrYldC?=
 =?utf-8?B?c2VwT29HVkhqMVJhWXArR0dlb3ZtSjdjMVIvRnVhK24xOW41ZjZ1REdyVVpI?=
 =?utf-8?B?RUJQUnBXNHhDaWRCTE5YWU52Q1g5ZkY5eENlcUVOTzBseXBXVmNydVpOaW9l?=
 =?utf-8?B?Vzd5cmpKUmYweWpMR0hVN2xMbVhoNTI0alV4RE1oMzEwVWVCcVByWmZkc3dO?=
 =?utf-8?B?VGhtUGtYMmx1ck41aU5RVmY2RXVTcEo1Vk9sTTMzakROTTNuTEljdWk1U09K?=
 =?utf-8?B?ejBEbVVSaHU1YzlMdGc3RFZVYlM2VHNZak5MU0NhQjExbHpFUGhoTlFtUEpr?=
 =?utf-8?B?TExSTi9HN0hkcThrQk9wVVgrSTUwYk5vYjFaRUxnd09mdGFyTjZucTc4bVNT?=
 =?utf-8?B?Ryt4dGxzcHVhYXphTUV4ekdWdmtiVHhNOVZUTjRlR2VwbkhMa3l0SVgzemJS?=
 =?utf-8?B?Y2FnZ011V0xxUTRBTmdiMHcrSEtmN1FvWk44OXdlRXJvTlN3QXI1bGU4SlZ5?=
 =?utf-8?B?NVRpQmRXM3R2TzNnNHB0YVJPOGdERkJSWm5jWUc4QTFtSFJTL0VvMkxsZzl1?=
 =?utf-8?B?WHBKVWZMRWJnWGcrZ3FaT0xROVpQS2NFcmJ6Z282STZUS1pMZ2VUUnlrTkpO?=
 =?utf-8?B?MDJGZUE2ektzbmwzTytXQW45WnRoODIzS0lkVCtscGdoa0p0NXFCcTUwK0gy?=
 =?utf-8?B?d2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 571763e8-4d35-45aa-7cd1-08de35db9187
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2025 21:57:08.9985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UbkmnuX3ABT4fkVQN4k/3mqoruvB2aNSudS92prtVShP6Md8DjXqAl0NGfEu0LvM4lAd33Iex5cj1LvQXZm+9c1gnYC6OrJFcu48AQwzUsY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5764
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



On 12/7/2025 12:03 AM, Daniele Ceraolo Spurio wrote:
> Scheduler groups (a.k.a. Engine Groups Scheduling, or EGS) is a GuC
> feature that allows the driver to define groups of engines that are
> independently scheduled across VFs, which allows different VFs to be
> active on the HW at the same time on different groups. The feature is
> available for BMG and newer HW starting on GuC 70.53.0, but some
> required fixes have been added to GuC 70.55.1.
> 
> This is intended for specific scenarios where the admin knows that the
> VFs are not going to fully utilize the HW and therefore assigning all of
> it to a single VF would lead to part of it being permanently idle.
> We do not allow the admin to decide how to divide the engines across
> groups, but we instead support specific configurations that are designed
> for specific use-cases. During PF initialization we detect which
> configurations are possible on a given GT and create the relevant
> groups. Since the GuC expect a mask for each class for each group, that
> is what we save when we init the configs.
> 
> Right now we only have one use-case on the media GT. If the VFs are
> running a frame render + encoding at a not-too-high resolution (e.g.
> 1080@30fps) the render can produce frames faster than the video engine
> can encode them, which means that the maximum number of parallel VFs is
> limited by the VCS bandwidth. Since our products can have multiple VCS
> engines, allowing multiple VFs to be active on the different VCS engines
> at the same time allows us to run more parallel VFs on the same HW.
> Given that engines in the same media slice share some resources (e.g.
> SFC), we assign each media slice to a different scheduling group. We
> refer to this configuration as "media_slices", given that each slice
> gets its own group.
> 
> Note that while the GuC interface supports a maximum of 8 groups, the
> actual number of groups that can be enabled can be lower than that and
> can be different on different devices. For now, all devices support up
> to 2 groups.
> 
> v2: Use asserts for coding errors, code cleanups, better docs (Michal),
>     limit groups to 2, limit to BMG and newer, bump required GuC to
>     70.55.1.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.h                    |   6 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c           |   3 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    | 142 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h    |   1 +
>  .../gpu/drm/xe/xe_gt_sriov_pf_policy_types.h  |  29 ++++
>  5 files changed, 181 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 2eeeeeb6b912..0a34e862406e 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -29,6 +29,12 @@
>  #define CCS_INSTANCES(gt) __ENGINE_INSTANCES_MASK(gt, CCS)
>  #define GSCCS_INSTANCES(gt) __ENGINE_INSTANCES_MASK(gt, GSCCS)
>  
> +/*
> + * Each media slice has 1x VECS, so the max number of VECS instances gives us
> + * the max number of slices that a GT can have.
> + */
> +#define MAX_MEDIA_SLICES hweight32(XE_HW_ENGINE_VECS_MASK)

isn't xe_hw_engine_types.h file a better fit for this macro?

> +
>  #define GT_VER(gt) ({ \
>  	typeof(gt) gt_ = (gt); \
>  	struct xe_device *xe = gt_to_xe(gt_); \
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> index 0714c758b9c1..0d97a823e702 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> @@ -14,6 +14,7 @@
>  #include "xe_gt_sriov_pf_control.h"
>  #include "xe_gt_sriov_pf_helpers.h"
>  #include "xe_gt_sriov_pf_migration.h"
> +#include "xe_gt_sriov_pf_policy.h"
>  #include "xe_gt_sriov_pf_service.h"
>  #include "xe_gt_sriov_printk.h"
>  #include "xe_guc_submit.h"
> @@ -123,6 +124,8 @@ int xe_gt_sriov_pf_init(struct xe_gt *gt)
>  	if (err)
>  		return err;
>  
> +	xe_gt_sriov_pf_policy_init(gt);
> +
>  	err = xe_gt_sriov_pf_migration_init(gt);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> index 4445f660e6d1..158d68aff4b7 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> @@ -3,6 +3,8 @@
>   * Copyright © 2023-2024 Intel Corporation
>   */
>  
> +#include <drm/drm_managed.h>
> +
>  #include "abi/guc_actions_sriov_abi.h"
>  
>  #include "xe_bo.h"
> @@ -10,6 +12,7 @@
>  #include "xe_gt_sriov_pf_helpers.h"
>  #include "xe_gt_sriov_pf_policy.h"
>  #include "xe_gt_sriov_printk.h"
> +#include "xe_guc.h"
>  #include "xe_guc_buf.h"
>  #include "xe_guc_ct.h"
>  #include "xe_guc_klv_helpers.h"
> @@ -351,6 +354,133 @@ u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt)
>  	return value;
>  }
>  
> +static void pf_sched_group_media_slices(struct xe_gt *gt, u32 **masks, u32 *num_masks)
> +{
> +	u8 slice_to_group[MAX_MEDIA_SLICES];
> +	u32 vecs_mask = VECS_INSTANCES(gt);
> +	u32 gsc_mask = GSCCS_INSTANCES(gt);
> +	u32 vcs_mask = VCS_INSTANCES(gt);
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +	int groups = 0;
> +	u32 *values;
> +	int slice;
> +
> +	xe_gt_assert(gt, xe_gt_is_media_type(gt));
> +
> +	/* A media slice has 2 VCS and a VECS. We bundle the GSC with the first slice */
> +	for (slice = 0; slice < MAX_MEDIA_SLICES; slice++) {
> +		if ((vcs_mask & 0x3) || (vecs_mask & 0x1) || (gsc_mask & 0x1))
> +			slice_to_group[slice] = groups++;
> +
> +		vcs_mask >>= 2;
> +		vecs_mask >>= 1;
> +		gsc_mask >>= 1;
> +	}
> +
> +	xe_gt_assert(gt, !vcs_mask);
> +	xe_gt_assert(gt, !vecs_mask);
> +	xe_gt_assert(gt, !gsc_mask);
> +
> +	/* We need at least 2 slices to split them up */
> +	if (groups < 2)
> +		return;
> +
> +	if (groups > gt->sriov.pf.policy.guc.sched_groups.max_num_of_groups) {

should we care about this limitation here in this function?

we will allocate groups here as required, only GuC might not correctly handle that
but that's mainly a GuC's problem and we may just report that during sending provisioning to GuC

> +		xe_gt_sriov_notice(gt, "media_slice mode has too many groups: %u vs %u\n",
> +				   groups,
> +				   gt->sriov.pf.policy.guc.sched_groups.max_num_of_groups);
> +		return;
> +	}
> +
> +	/*
> +	 * The GuC expects an array with GUC_MAX_ENGINE_CLASSES entries for
> +	 * each group.
> +	 */
> +	values = drmm_kzalloc(&gt_to_xe(gt)->drm,

drmm_kcalloc ?

> +			      GUC_MAX_ENGINE_CLASSES * groups * sizeof(u32),
> +			      GFP_KERNEL);
> +	if (!values)
> +		return;
> +
> +	for_each_hw_engine(hwe, gt, id) {
> +		u8 guc_class = xe_engine_class_to_guc_class(hwe->class);
> +		u8 entry;
> +
> +		switch (hwe->class) {
> +		case XE_ENGINE_CLASS_VIDEO_DECODE:
> +			slice = hwe->instance / 2;
> +			break;
> +		case XE_ENGINE_CLASS_VIDEO_ENHANCE:
> +			slice = hwe->instance;
> +			break;
> +		case XE_ENGINE_CLASS_OTHER:
> +			slice = 0;
> +			break;
> +		default:
> +			xe_gt_assert_msg(gt, false,
> +					 "unknown media gt class %u (%s) during EGS setup\n",
> +					 hwe->class, hwe->name);
> +			drmm_kfree(&gt_to_xe(gt)->drm, values);

hmm, do we really need to abort here?
maybe assert and then still assign this unk engine to slice 0 (like fallback to class_other)

> +			return;
> +		}
> +
> +		entry = slice_to_group[slice] * GUC_MAX_ENGINE_CLASSES + guc_class;
> +		values[entry] |= BIT(hwe->logical_instance);
> +	}
> +
> +	*masks = values;
> +	*num_masks = GUC_MAX_ENGINE_CLASSES * groups;

IMO we should store number of groups only

we know that each group is just set of GUC_MAX_ENGINE_CLASSES instances

maybe even we should have below struct defined somewhere:

	struct guc_sched_group {
		u32 engines[GUC_MAX_ENGINE_CLASSES];
	} __packed;


> +}
> +
> +static void pf_init_sched_groups(struct xe_gt *gt)
> +{
> +	int m;
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +
> +	/*
> +	 * The GuC supports scheduler groups from v70.53.0, but a fix for it has
> +	 * been merged in v70.55.1, so we require the latter. The feature is
> +	 * also only enabled on BMG and newer FW.
> +	 */
> +	if (GUC_FIRMWARE_VER(&gt->uc.guc) < MAKE_GUC_VER(70, 55, 1) ||
> +	    gt_to_xe(gt)->info.platform < XE_BATTLEMAGE)
> +		return;
> +
> +	/*
> +	 * The GuC interface supports up to 8 groups. However, the GuC only
> +	 * fully allocates resources for a subset of groups, based on the number
> +	 * of engines and expected usage. The plan is for this to become
> +	 * queryable via H2G, but for now GuC FW for all devices supports a
> +	 * maximum of 2 groups so we can just hardcode that.
> +	 */
> +	gt->sriov.pf.policy.guc.sched_groups.max_num_of_groups = 2;

maybe this limitation should be introduced in next patch 3/11 where you are
actually trying to provision sched_groups within GuC?

> +
> +	for (m = 0; m < XE_SRIOV_SCHED_GROUPS_MODES_COUNT; m++) {
> +		u32 *masks = NULL;
> +		u32 num_masks = 0;

maybe initialize them as pointers instead:

		u32 *num_masks = &gt->sriov.pf.policy.guc.sched_groups.modes[m].num_masks;
		u32 **masks = &gt->sriov.pf.policy.guc.sched_groups.modes[m].masks;

> +
> +		switch (m) {
> +		case XE_SRIOV_SCHED_GROUPS_NONE:

I'm still not convinced that we need to waste an array index for the NONE mode

can't we just loop over known modes (for now its MEDIA slices only)
and if NONE is selected just implicitly assume .num_masks is zero?

then array will hold only potentially valid group definitions

> +			break;
> +		case XE_SRIOV_SCHED_GROUPS_MEDIA_SLICES:
> +			/* this mode only has groups on the media GT */
> +			if (xe_gt_is_media_type(gt))
> +				pf_sched_group_media_slices(gt, &masks, &num_masks);
> +			break;
> +		default:
> +			xe_gt_assert_msg(gt, false, "unknown sched group mode %u\n", m);
> +			return;
> +		}
> +
> +		xe_gt_assert(gt, (num_masks % GUC_MAX_ENGINE_CLASSES) == 0);
> +
> +		gt->sriov.pf.policy.guc.sched_groups.modes[m].masks = masks;
> +		gt->sriov.pf.policy.guc.sched_groups.modes[m].num_masks = num_masks;
> +	}
> +}
> +
>  static void pf_sanitize_guc_policies(struct xe_gt *gt)
>  {
>  	pf_sanitize_sched_if_idle(gt);
> @@ -401,6 +531,18 @@ int xe_gt_sriov_pf_policy_reprovision(struct xe_gt *gt, bool reset)
>  	return err ? -ENXIO : 0;
>  }
>  
> +/**
> + * xe_gt_sriov_pf_policy_init - Initializes the SW state of the PF policies.

    * xe_gt_sriov_pf_policy_init() - Initializes ...

> + * @gt: the &xe_gt
> + *
> + * This function can only be called on PF. This function does not touch the HW,
> + * but must be called after the engines have been initialized.
> + */
> +void xe_gt_sriov_pf_policy_init(struct xe_gt *gt)
> +{
> +	pf_init_sched_groups(gt);
> +}
> +
>  static void print_guc_policies(struct drm_printer *p, struct xe_gt_sriov_guc_policies *policy)
>  {
>  	drm_printf(p, "%s:\t%s\n",
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
> index 2a5dc33dc6d7..52312d24d527 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
> @@ -18,6 +18,7 @@ bool xe_gt_sriov_pf_policy_get_reset_engine(struct xe_gt *gt);
>  int xe_gt_sriov_pf_policy_set_sample_period(struct xe_gt *gt, u32 value);
>  u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt);
>  
> +void xe_gt_sriov_pf_policy_init(struct xe_gt *gt);
>  void xe_gt_sriov_pf_policy_sanitize(struct xe_gt *gt);
>  int xe_gt_sriov_pf_policy_reprovision(struct xe_gt *gt, bool reset);
>  int xe_gt_sriov_pf_policy_print(struct xe_gt *gt, struct drm_printer *p);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
> index 4de532af135e..1d4cdc87e069 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
> @@ -8,16 +8,45 @@
>  
>  #include <linux/types.h>
>  
> +/**
> + * enum xe_sriov_sched_group_modes - list of possible scheduler group modes
> + * @XE_SRIOV_SCHED_GROUPS_NONE - no separate groups (i.e., all engines in group 0)
> + * @XE_SRIOV_SCHED_GROUPS_MEDIA_SLICES - separate groups for each media slice
> + * @XE_SRIOV_SCHED_GROUPS_MODES_COUNT - number of valid modes
> + */
> +enum xe_sriov_sched_group_modes {
> +	XE_SRIOV_SCHED_GROUPS_NONE = 0,
> +	XE_SRIOV_SCHED_GROUPS_MEDIA_SLICES,

hmm, I was assuming that enum NONE is just an alias for 0,
and that individual supported modes are defined as BITs,

	XE_SRIOV_SCHED_GROUPS_MEDIA_SLICES = BIT(0),

> +	XE_SRIOV_SCHED_GROUPS_MODES_COUNT
> +};
> +
> +/**
> + * struct xe_gt_sriov_scheduler_groups - Scheduler groups policy info
> + * @max_num_of_groups: number of groups supported by the GuC for the platform

nit: just @max_groups ?

> + * @modes: array of masks and their number for each mode

	@modes: array of defined scheduling group modes

> + * @modes.masks: array of masks for a given mode

hmm, 'mask' alone is not the best name here, maybe:

	@modes.groups: array of engine instance groups in given mode,
			or NULL if mode is not supported.
			each group consists of set of
			GUC_MAX_ENGINE_CLASSES of engine instances mask

> + * @modes.num_masks: number of masks in the array

	@modes.num_groups: number of groups in given mode,
			or zero if mode is not supported

> + */
> +struct xe_gt_sriov_scheduler_groups {
> +	u8 max_num_of_groups;
> +	struct {
> +		u32 *masks;
> +		u32 num_masks;

		struct guc_sched_group *groups;
		u32 num_groups;

> +	} modes[XE_SRIOV_SCHED_GROUPS_MODES_COUNT];
> +};
> +
>  /**
>   * struct xe_gt_sriov_guc_policies - GuC SR-IOV policies.
>   * @sched_if_idle: controls strict scheduling policy.
>   * @reset_engine: controls engines reset on VF switch policy.
>   * @sample_period: adverse events sampling period (in milliseconds).
> + * @sched_groups: available scheduling group configurations.
>   */
>  struct xe_gt_sriov_guc_policies {
>  	bool sched_if_idle;
>  	bool reset_engine;
>  	u32 sample_period;
> +	struct xe_gt_sriov_scheduler_groups sched_groups;
>  };
>  
>  /**

