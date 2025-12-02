Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF1CD1266A
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 20:02:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4727B10E6A5;
	Tue,  2 Dec 2025 20:02:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="acwkRh0P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2AEB10E6A5
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 20:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764705729; x=1796241729;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=lv8G2XNpQwnnZIKD8od4O2vJ7nZWTS9gp6vinaq2eb0=;
 b=acwkRh0PzFCbuCSDiqKWUvJ9Q8EXxljkEE8mQgWDpsVduXW3jZ0US8a9
 R28bLExFyXUHlYhFSHhxYhPOSUzqNpd5OZHvZCEdulIlFnfbKdeyyjMHq
 1AItfmpXzpSnkwqGeLepW08gSVnloI22DUV5XPsYms6udsIxDZF9ToVOZ
 JXPFFMiMbGFt/oOHlQ3VUfydSDRscL0JzxXYHdHoGJknD/CFMt82XlDvn
 OoeIC7mVCamCQwnijnODdcxz7OQ1rj4FA4idLx55Lc3hi32+ZEOV+DZAr
 3SiWkilSCEcxhYXZvg0tXsQlIeD/y2NU86qTtpHACqh0OiGZ5QZ6AeAgN w==;
X-CSE-ConnectionGUID: amzdBH/mS3qbQNR1V3JZpQ==
X-CSE-MsgGUID: r113sypdSZa0N3leDU4brw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="65692601"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="65692601"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 12:01:22 -0800
X-CSE-ConnectionGUID: oXCbwJJJSxiGM8gzBRCAhw==
X-CSE-MsgGUID: ZJ10k1AIR2Gj/ylGvX9odw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="217819129"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 12:01:19 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 12:01:19 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 12:01:19 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.2) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 12:01:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KE2FNbgjFG0UHXLpQop5M7VPcWG0+ymo9kUrfCivkfV4XU61LQ0ahxuvBeihLIHsm1BxZVzWGbDFLfP5aciACJaq4p6Pl5RIeRjSqgLzsu2d6WWQ6PMlbQUUhQiiNOM0TdZelbciTbxZC52wLILipZbOVIITSGu2hBKkXVO+hPLjxTB6IewK4tsMbvrjUV7i81OUoK/hL4fuEUd5JektmZmHYdSzkEVNtKQoH+uDIt3AyhGCi4WLJQgZQykKaSwUl0saDIwlq+2kMV8vBeYgrdynWWdg8MjlEf2gNluV54s0fZ7vhkSnhaYP8UmUGnpCS6voXxwofgtq3oDVdmyBew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3bW1Z7EnnBkiOGFkkzlCwhLcOTiesKGRjVWmK/dWkR4=;
 b=RRYcSQSO5HMpr4dlvPJ2I7CI7FM8UYkjL9l38/f5sQG7BBTw0x5v/mtgkKmRhmJtXRl/qhVmgiVJFxCY3YH1YCNOKovsEEv6JPWi1yceUWLSTSzPRZCZQ7WxaJ+BQ2Gs6xcHm13+B3EROt+XGXDvPx9yr2xDmjfYOrkse/Gszo404WROdkXQP4iLva37ITinzr4magesK9myoA3jGTqUqvcnemmcKFKkkObV0uuSvTRan/eeFzUb2rLNldzvyP5Vsar5BthmvvjFw0EFKwVOVm6E+b0PcpQxvxAeSXpLB2vHX1XWVdd5IErZPIOE5nK+ffY6AC0Xqet9sTaRu4+2Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Tue, 2 Dec 2025 20:01:11 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 20:01:11 +0000
Message-ID: <cc4c6142-17ef-428d-bc4b-59cdac7f446b@intel.com>
Date: Tue, 2 Dec 2025 21:01:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] drm/xe/sriov: Add functions to set preempt timeouts
 for each group
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251127014507.2323746-12-daniele.ceraolospurio@intel.com>
 <20251127014507.2323746-21-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251127014507.2323746-21-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0167.eurprd09.prod.outlook.com
 (2603:10a6:800:120::21) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS0PR11MB6399:EE_
X-MS-Office365-Filtering-Correlation-Id: c10375a0-cc3a-4e3e-92c3-08de31dd8a48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V0liTmVJTEFmVEdBVEhDWEFzUFllVUdHUHU5VTNQTUhMdGtZd2h1b3huT1RH?=
 =?utf-8?B?OXR4TkpCUjNNTTVia1gwQXliRnBXQStyZDBqRnZDOTEyRVoxUG5TNlJxRW9p?=
 =?utf-8?B?bDhEcEN3NDZOUForUUZKTzdPbzZXcHRESi9tNk41eU5Cd2ZxQWpnT3U2R1VR?=
 =?utf-8?B?eDRVN2dINjFNT0hDdzBWcmd0b0RTTHF5cjhSTndISXdCTmdWaFZKbndWZUNV?=
 =?utf-8?B?U1M0ZGF2UXcwbmQ4MVE5Zk9YSXJ2aFF5bVhVYzdsdE45dVBEdTJUQWtXOTdI?=
 =?utf-8?B?S0tPNmdlSHU0T2pYdm5IRyt6dGtrd01kK09GRmtyNGs5QjVvVEV1WkMxQzk4?=
 =?utf-8?B?U3F0KzF3TXgxbHhoSXpKekNibVQxamZoYmVPalVrN0cyelFhUjR5Z040TnNi?=
 =?utf-8?B?Y2lRc2k5TnZVRjRFUjNvOU5IS1Q2RHpRMjhGOFlmSCtJVU1IdzJPbG9LUHVH?=
 =?utf-8?B?U3FtUG1ucURxM0wrVHVYNXcxdlhMWFZGR0pXdmxkaFFuK2l2Qm5XWUNmYkFZ?=
 =?utf-8?B?b2x2RHlpNzZHcnFSQjgyVmNybktETWp0Tm11dUhXQjlVL3h6T3E5WDQwdFQ1?=
 =?utf-8?B?UmRkMFpsU1F5UTFoeFhoZFBoNExJOHVpL21HakJRUXI0aUtpZWc1ZTRuSlFp?=
 =?utf-8?B?aHUzNmtKUUora3dsRGVSanhYaDM1bmcyb3VybGo5WE0rejRuMEp0eHZiWVdJ?=
 =?utf-8?B?empxOElBOHN0ejR1ZVN0djMzanByajFnU2FUWWRlcmU4Q3ltcUk2QlM3dTJl?=
 =?utf-8?B?Qmc1RmZuazhkNW5OTWhveW5nUTF3MmFsNjllakZzbHh3VC9wdUEvZ0Y4c3lQ?=
 =?utf-8?B?WmpmQ2cxTnlXTUxXM2ZzOWZIOHFuUWFPT3k2N0ZzV05naEFNMU9kbDFQdjZV?=
 =?utf-8?B?eFVBaWRLUmd0Mkp0NFU5WGJzZGlMVkhwaE96V1I4OVpvR0hkdE9PZHFmRU1O?=
 =?utf-8?B?Vm1ZVWVFb2lwbE5mTzN2NkxScnJPTDRUQ3RsRDVyYW8vOGp0Y2cxVGtoQkhU?=
 =?utf-8?B?Sm9hNHpjdFlGaWxKYUlOd2ZlWEg1aThieTI3S1JVMnRlK0NuU3RnSXBvdnRP?=
 =?utf-8?B?VlRWSFpqWnVBS0N2Q3RwUU9XVHhUKzNCVGltKzBIMnRMK3hENnZ1aGZEWjgy?=
 =?utf-8?B?YWh6QmhRS2U3Uk9SSXZTYlhZb3NjajJzWXY3emJXRnVJTnNDdEZEZHNvcFFF?=
 =?utf-8?B?SDBrd0xRb2hSbUdNZEtodjJwWnVrcjJLRDVrL3ZibWNHNnQ0K0tLNUNZMTAz?=
 =?utf-8?B?RHlFZUMzZmE1bTc0NjNRVUppZjRrUWhUSWsrc3FnLzR0aXpabTN1WDFvMDhG?=
 =?utf-8?B?QmkxZEpMUGgyQ0lKVTlqUUo4L0VXMFlPQW9TQUVHTEFNb1dicmE3dXVldmoz?=
 =?utf-8?B?aEJQQ3JjQVVDMU5NR3QyL283blc0cDd6QjVsbjNxYnRMazNwVnI3ZktxN0Rk?=
 =?utf-8?B?NGNNMVJTOGQ3WkV5Sk5pZnU2RzdJSTRCR29hVGlQeFByYlA1MzN6Um9nZU5X?=
 =?utf-8?B?VUFsakNyUDNsai9iSmxGR1FubWc3dUxLc3M0RndBTFBXWCs2dWpaUTlvMWw5?=
 =?utf-8?B?RmJLMXZRWnBTR3VnM1dPblJqU09GU201L3ppVldGcWdBaDBFQ21KQS9CTkNV?=
 =?utf-8?B?R2FtN3E0Zmxnb1dySTNOS0g4RkVOSzBON2pGRERmSDVlb2d6VHIzWVZRZzcy?=
 =?utf-8?B?MXp0cEpqRkJqNmNtdEI2dEdhV2pGSHRHQ3phYXlhbmsvNUo4aXYyL3VvLzNH?=
 =?utf-8?B?V2R6M0ZqWHlPZjlZZ3lVMzZrQ3ovejNKb3dLbWl4VTU2cWR6Z1JRb3VPUDBa?=
 =?utf-8?B?VzRKeGhJQjR5MXFnVjZOaGdXS3p4c3d6YlBDOXQvem4yeGx6N05XaVlBQ2t1?=
 =?utf-8?B?UlVUOWl5MjU3aTJJVVJ1NzJtTXZ1azZOWUxVRU5QaDhkY0pCeDd3bEJsNXFG?=
 =?utf-8?Q?ebffPgK4OYcr1fyD7QwpSdHXXMqs59J5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGxybWFJaUJBN1pXZFlHSEM1SFVmbkJrTG13OE9TcE9JQzJxbEpYNUU0VXdq?=
 =?utf-8?B?RHg4WnliSW1WYUpFaUtrU3h2THBQeDloVTRsbnh2R1pPUVVNVW5XelZXcmlM?=
 =?utf-8?B?bkFtNC81cmRZVWpST0RELyt5c24xdkZUWWJUZXhQekxjV2pUNWNFRzFLamxh?=
 =?utf-8?B?VlpEZGxqTldlbld3N24yZWpJd3hoSTBNSUI3akdFKyt4akVGbHprUXA0ZnMr?=
 =?utf-8?B?U0xPTFdQRTNDWS9DN0w5eDRrMkxVTGlZNU1KMnVzd083NlVWazRkWFgzVHJ1?=
 =?utf-8?B?MVpna0UvSlplYWRWNHRnK3BMU29RSTRIa1BiNnlZSmhqQTJib0FnNTY2OURr?=
 =?utf-8?B?TUlZVE0zV3VhbWxibWtTZVlGRDJLYTY1WEhDMHVpSXMvSVRUUk1aZ0djOEg1?=
 =?utf-8?B?UzFwbWVkQWVtVStOWWVwNVcvTjMzNnlyMFlLM095cGM2R2JkZU42YW9CUEJT?=
 =?utf-8?B?d1hwQXZsVlBtS2FJalVIVFpDVGhvNkJkem1DK2lORUFTL29hVmFYTkxTemh3?=
 =?utf-8?B?OTBlN0cwaEQ2YlhFQXVFc2l1UDhTaitvRzBmclVzUEh6dWhwNGJMeGlld1kw?=
 =?utf-8?B?L3pIcnErRzdLdzdKRWY2UzJjQkx5M09HOThaWjgvMmhhNS9YM0JHdVJ6VmVU?=
 =?utf-8?B?RzZ2T01Sa1Y0OWxFNDlZU3Q3OExZeURiTm1IaGpMMytUaTRmZE92RWIwZ1Ju?=
 =?utf-8?B?ZndpY2l6dVEyMTFrckRQLzJyOE14c0VQQ3NLS3RwYXkxQmhXRnJIQi9xRlBT?=
 =?utf-8?B?NHdCZ1NyOHFhRWovbDlIZEdMNXZ1Tkc1ZE92SXRxSlordCt5SkZQVFFFVm1h?=
 =?utf-8?B?Ni9aL3dsZFBHSkZyczcxYXZNVk5MOXVJK21uUXl5MTYwdVkrWFYyeU5qR2dx?=
 =?utf-8?B?M0ZzblJ0UU9iOGc1Zy8vd1ludm9MTjFUeGFrRkZWOEFxY3RMSHlwclNtVTl4?=
 =?utf-8?B?MHYzeGJHWWwzQ0lDVnhFMjM1bjJzTlp1UzBYS3ZaUmlCYXpOcldweUdhSHlD?=
 =?utf-8?B?MDUwN3VKZjBqUGc5ckhFaEI2TEJxTlJZbUlEL280MWR6S3dHZGVyZFRQUFVt?=
 =?utf-8?B?VWtzYm0zbkZma1hOWC92dUJNSCtZQ0xsNmNacUpnUlVXbzFxc3FEaTRjS3Rh?=
 =?utf-8?B?RHdDbk44ZTl2NDNuTFpTZ0lEbTJMMEFiNXppam5pTUhsSE1ZbURyNjJhc2Rm?=
 =?utf-8?B?UHp0TnllK0M3VlNkUHo2OHZpNU5TQmxINEFpbnhyOFBKUHZQN0RJNVZlOGVz?=
 =?utf-8?B?Z3YrT3hSVDVoTUNCZGFWZDYyWTJaaWVadFZjZXBDaXlTSnNTdW15Y3ozeUhL?=
 =?utf-8?B?RzBTWnQyeDNlZnJWelA3OG9iZWUrR3Q3alF6dWl5Sm1zUVE2VDZPRHBGZGJV?=
 =?utf-8?B?UUg5c2dGOUFpdVk3Ly9aQURDN0JyZXFvSHNyYXA0Tmk3UTFobzJYWWhrdGo2?=
 =?utf-8?B?UmtPdWp2SkZUUkxUWWxQbFBiQzUyVHFVbmR2OFdKZEM0Szk0cW1BVWoyTThT?=
 =?utf-8?B?ZEJIZGxVYlFQVEVCWlVjcmt6Q0RxMGNnMGxEZ0dJbThHTExtb0pqbEY1UTJa?=
 =?utf-8?B?RmhldE5uSE9SVzJQa1NFS3BqeEJ0WkRSbzBxZnNwY1ZTdE1nT0U0YjI3blUr?=
 =?utf-8?B?QTRZZTBEU3lZbDJBTGVhOFdjbkZyd2NsQnAzRERBUk5vTGh1ekJEY2NJcitV?=
 =?utf-8?B?cHYrZXpNcUxyTHRnWmVzTTlLUC82WDNQTHo4bjNTdjgzYjlVelU4UnRTTnlV?=
 =?utf-8?B?c2lETGhHOWIrL0M3c1BkZFlBbytWMUJFQ0JKSDNIbGVPR2hYS3NqaDBhY1hq?=
 =?utf-8?B?alcvWWV2Q1NQMlN3ZWxqQVJ0OXhzcTAwK29ENENpWVY5Q01mVXJ2cmpSbWZX?=
 =?utf-8?B?eisxLzdqcUlJcVFGVmJDMnhPY1ZqTEw0NXU4TzdXa0hNd3UxejkvUnRJMGsz?=
 =?utf-8?B?VjVTbjljbTdHaXNpdEtsNERJc1JFL1hrNldJaExyMjRqSGtlaEZ1VjBTYTA0?=
 =?utf-8?B?cEozTlpsaFNubThELzFyZ3J6ZFN5am8zL210ekpiRHVDbmt1VGVJbEFtZTY5?=
 =?utf-8?B?TlJqdUIrbUl4d0xXQ0JGendNSlpSMlpEWmpFR2xJblFZQ21XRnpCY05VdWY1?=
 =?utf-8?B?ZXZtOVpVek5GVVlOYnNFMnA2RUlpZlBzSjh3QWRDbTZtVkRZeXFydDlQVWJY?=
 =?utf-8?B?a2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c10375a0-cc3a-4e3e-92c3-08de31dd8a48
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 20:01:11.4276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L0hcAl6xcmPIZ+irSOSmtEg6G9d5XHYOhj03TKDLsA0Rbenh0ewU1m18jqPs3PUIv+XXt4MEXEWJ6JTW9lUzMoA4Lk0CCQnajx5nl9hmg+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6399
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



On 11/27/2025 2:45 AM, Daniele Ceraolo Spurio wrote:
> The KLV to set the preemption timeout for each groups works the exact
> same way as the one for the exec quantums, so we add similar functions.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_klvs_abi.h      |  12 ++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 157 ++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |   8 ++
>  3 files changed, 173 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index a0763cc15518..02547043a9e0 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -393,6 +393,16 @@ enum  {
>   *      the GuC always sets the EQ for all groups (even the non-enabled ones),
>   *      so if we provide fewer values than the max the GuC will use 0 for the
>   *      remaining groups.
> + *
> + * _`GUC_KLV_VF_CFG_ENGINE_GROUP_PREEMPT_TIMEOUT' : 0x8A0F
> + *      This config sets the VFs-preemption-timeout for each scheduling group in
> + *      microseconds. The driver must provide an array of values, with each of
> + *      them matching the respective group index (first value goes to group 0,
> + *      second to group 1, etc). The setting of group values follows the same
> + *      behavior and rules as setting via GUC_KLV_VF_CFG_PREEMPT_TIMEOUT. Note
> + *      that the GuC always sets the EQ for all groups (even the non-enabled
> + *      ones), so if we provide fewer values than the max the GuC will use 0 for
> + *      the remaining groups.

update xe_guc_klv_key_to_string()


>   */
>  
>  #define GUC_KLV_VF_CFG_GGTT_START_KEY		0x0001
> @@ -456,6 +466,8 @@ enum  {
>  
>  #define GUC_KLV_VF_CFG_ENGINE_GROUP_EXEC_QUANTUM_KEY	0x8a0e
>  
> +#define GUC_KLV_VF_CFG_ENGINE_GROUP_PREEMPT_TIMEOUT_KEY	0x8a0f

add MIN_LEN and MAX_LEN

> +
>  /*
>   * Workaround keys:
>   */
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 1bfb25bda432..deb79b2a7527 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -325,8 +325,15 @@ static u32 encode_config(struct xe_gt *gt, u32 *cfg,
>  		cfg[n++] = config->exec_quantum[0];
>  	}
>  
> -	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_PREEMPT_TIMEOUT);
> -	cfg[n++] = config->preempt_timeout[0];
> +	if (xe_sriov_gt_pf_policy_has_valid_sched_group_modes(gt)) {
> +		cfg[n++] = PREP_GUC_KLV_CONST(GUC_KLV_VF_CFG_ENGINE_GROUP_PREEMPT_TIMEOUT_KEY,
> +					      GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT);
> +		for (i = 0; i < GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT; i++)
> +			cfg[n++] = config->exec_quantum[i];
> +	} else {
> +		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_PREEMPT_TIMEOUT);
> +		cfg[n++] = config->preempt_timeout[0];
> +	}

move to new encode_sched() 

>  
>  #define encode_threshold_config(TAG, ...) ({					\
>  	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_THRESHOLD_##TAG);			\
> @@ -2207,11 +2214,16 @@ static int pf_provision_preempt_timeout(struct xe_gt *gt, unsigned int vfid,
>  	return 0;
>  }
>  
> -static u32 pf_get_preempt_timeout(struct xe_gt *gt, unsigned int vfid)
> +static u32 pf_get_group_preempt_timeout(struct xe_gt *gt, unsigned int vfid, u8 group)
>  {
>  	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
>  
> -	return config->preempt_timeout[0];
> +	return config->preempt_timeout[group];
> +}
> +
> +static u32 pf_get_preempt_timeout(struct xe_gt *gt, unsigned int vfid)
> +{
> +	return pf_get_group_preempt_timeout(gt, vfid, 0);
>  }
>  
>  /**
> @@ -2317,6 +2329,138 @@ int xe_gt_sriov_pf_config_bulk_set_preempt_timeout_locked(struct xe_gt *gt, u32
>  					   preempt_timeout_unit, n, err);
>  }
>  
> +static int pf_provision_groups_preempt_timeouts(struct xe_gt *gt, unsigned int vfid,
> +						const u32 *preempt_timeouts, u32 count)
> +{
> +	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
> +	int err;
> +	int i;
> +
> +	err = pf_push_vf_grp_cfg_u32(gt, vfid, GUC_KLV_VF_CFG_ENGINE_GROUP_PREEMPT_TIMEOUT_KEY,
> +				     preempt_timeouts, count);
> +	if (unlikely(err))
> +		return err;
> +
> +	/*
> +	 * GuC silently clamps values exceeding the max and zeroes out the
> +	 * quantum for groups not in the array

" .. not in the KLV payload" ?

> +	 */
> +	for (i = 0; i < GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT; i++) {
> +		if (i < count)
> +			config->preempt_timeout[i] =
> +				min_t(u32, preempt_timeouts[i],
> +				      GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_MAX_VALUE);
> +		else
> +			config->preempt_timeout[i] = 0;
> +	}
> +
> +	return 0;
> +}
> +
> +static void pf_get_groups_preempt_timeouts(struct xe_gt *gt, unsigned int vfid,
> +					   u32 *preempt_timeouts, u32 max_count)
> +{
> +	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
> +	u32 count = min_t(u32, max_count, GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT);
> +
> +	memcpy(preempt_timeouts, config->preempt_timeout, sizeof(u32) * count);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_set_groups_preempt_timeouts() - Configure PF/VF PTs for sched groups.
> + * @gt: the &xe_gt
> + * @vfid: the PF or VF identifier
> + * @preempt_timeouts: array of requested PTs in microseconds (0 is infinity)
> + * @count: number of entries in the array
> + *
> + * This function can only be called on PF.
> + * It will log the provisioned value or an error in case of the failure.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_set_groups_preempt_timeouts(struct xe_gt *gt, unsigned int vfid,
> +						      u32 *preempt_timeouts, u32 count)
> +{
> +	int err;
> +
> +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	err = pf_provision_groups_preempt_timeouts(gt, vfid, preempt_timeouts, count);
> +
> +	return pf_groups_cfg_set_u32_array_done(gt, vfid, preempt_timeouts, count,
> +						pf_get_groups_preempt_timeouts,
> +						"preempt_timeout",
> +						preempt_timeout_unit, err);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_get_groups_preempt_timeouts - Get PF/VF sched groups PTs
> + * @gt: the &xe_gt
> + * @vfid: the PF or VF identifier
> + * @preempt_timeouts: array in which to store the preemption timeouts values
> + * @max_count: maximum number of entries to store
> + *
> + * This function can only be called on PF.
> + */
> +void xe_gt_sriov_pf_config_get_groups_preempt_timeouts(struct xe_gt *gt, unsigned int vfid,
> +						       u32 *preempt_timeouts, u32 max_count)
> +{
> +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return pf_get_groups_preempt_timeouts(gt, vfid, preempt_timeouts, max_count);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_set_group_preempt_timeout - Configure PF/VF PT for a sched group.
> + * @gt: the &xe_gt
> + * @vfid: the PF or VF identifier
> + * @group: index of the group to configure

I don't think we need to expose per-group function to change PT as
GuC ABI does not allow to do that directly

for debugfs purposes it should be sufficient to read/configure all at once

> + * @preempt_timeout: requested PT in microseconds (0 is infinity)
> + *
> + * This function can only be called on PF.
> + * It will log the provisioned value or an error in case of the failure.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_set_group_preempt_timeout(struct xe_gt *gt, unsigned int vfid,
> +						    u8 group, u32 preempt_timeout)
> +{
> +	u32 values[GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT];
> +	int err;
> +
> +	xe_gt_assert(gt, group < GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT);
> +
> +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	pf_get_groups_preempt_timeouts(gt, vfid, values, ARRAY_SIZE(values));
> +	values[group] = preempt_timeout;
> +
> +	err = pf_provision_groups_preempt_timeouts(gt, vfid, values, ARRAY_SIZE(values));
> +
> +	return pf_group_config_set_u32_done(gt, vfid, group, preempt_timeout,
> +					    pf_get_group_preempt_timeout(gt, vfid, group),
> +					    "preempt_timeout", preempt_timeout_unit, err);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_get_group_preempt_timeout - Get PF/VF PT for a sched groups
> + * @gt: the &xe_gt
> + * @vfid: the PF or VF identifier
> + * @group: index of the group for which to get the PT
> + *
> + * This function can only be called on PF.
> + *
> + * Return: preemption timeout in microseconds (or 0 if infinity).
> + */
> +u32 xe_gt_sriov_pf_config_get_group_preempt_timeout(struct xe_gt *gt, unsigned int vfid, u8 group)
> +{
> +	xe_gt_assert(gt, group < GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT);
> +
> +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return pf_get_group_preempt_timeout(gt, vfid, group);
> +}
> +
>  static const char *sched_priority_unit(u32 priority)
>  {
>  	return priority == GUC_SCHED_PRIORITY_LOW ? "(low)" :
> @@ -2764,6 +2908,11 @@ static int pf_restore_vf_config_klv(struct xe_gt *gt, unsigned int vfid,
>  			return -EBADMSG;
>  		return pf_provision_groups_exec_quantums(gt, vfid, value, len);
>  
> +	case GUC_KLV_VF_CFG_ENGINE_GROUP_PREEMPT_TIMEOUT_KEY:
> +		if (len > GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT)
> +			return -EBADMSG;
> +		return pf_provision_groups_preempt_timeouts(gt, vfid, value, len);
> +
>  	case GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_KEY:
>  		if (len != GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_LEN)
>  			return -EBADMSG;
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> index aaf6bb824bc9..f4bfb26b2407 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> @@ -63,6 +63,14 @@ int xe_gt_sriov_pf_config_set_preempt_timeout_locked(struct xe_gt *gt, unsigned
>  						     u32 preempt_timeout);
>  int xe_gt_sriov_pf_config_bulk_set_preempt_timeout_locked(struct xe_gt *gt, u32 preempt_timeout);
>  
> +void xe_gt_sriov_pf_config_get_groups_preempt_timeouts(struct xe_gt *gt, unsigned int vfid,
> +						       u32 *preempt_timeout, u32 max_count);
> +int xe_gt_sriov_pf_config_set_groups_preempt_timeouts(struct xe_gt *gt, unsigned int vfid,
> +						      u32 *preempt_timeout, u32 count);
> +u32 xe_gt_sriov_pf_config_get_group_preempt_timeout(struct xe_gt *gt, unsigned int vfid, u8 group);
> +int xe_gt_sriov_pf_config_set_group_preempt_timeout(struct xe_gt *gt, unsigned int vfid,
> +						    u8 group, u32 preempt_timeout);
> +
>  u32 xe_gt_sriov_pf_config_get_sched_priority(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_config_set_sched_priority(struct xe_gt *gt, unsigned int vfid, u32 priority);
>  

