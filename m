Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8889CCCF9E3
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 23:49:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30A6C10E106;
	Tue,  4 Nov 2025 23:49:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nlgfnb6i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F98E10E106
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 23:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762300189; x=1793836189;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3rfgUYUQbKPo8XMSfgNnOZNEKDarjgNLFoQNoBzHUYI=;
 b=Nlgfnb6iqqQH0XWvqMkA8r1I7DUtpZ87y7MMwdwK4sW2+T2VGwnFQhcX
 fyi/HXRSqqp2HUqI0SfjnW0iwjgUmZUgOUYkvtyznCEW5w5B8ywdWCzo3
 0UYkPG+gbuTA0yehMleYKc8JZF/h4dAzzd91e/C6ljE6EDg5QTBEO+T6b
 CiE7ZWHF+yhK1FhwTD09db2x46vzuQqpuPac5eNdqENRMZvguK/5TupvA
 A7LQb0tKoea+QCal8VvdqVoZaejkgDvGmDzgPh+kv0nZSiZYciC39y4e0
 rsFt3+ZGFxNTT+WUgU5jTlGBjabM+0NH6LmVjIf03I6tIPuk3lmd+lNwG g==;
X-CSE-ConnectionGUID: Mp8/ZzizSO+LY+peEYONSg==
X-CSE-MsgGUID: EwKYp+nKRJCuhuVGDqEOsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64438502"
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; d="scan'208";a="64438502"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 15:49:49 -0800
X-CSE-ConnectionGUID: S+cyS1UTQuW/395KbpUDug==
X-CSE-MsgGUID: 7RZfnaV5SweSstNmVArsQQ==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 15:49:49 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 15:49:48 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 15:49:48 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.50) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 15:49:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O3Tz/FxcSUFeQhqEKin686dx4Ju9ANYOVkHU9nWqgfOL0jNMg4CSQHRi8dMRgo5IglfKoyd+qrj2TOZsZRu/amu8BSVEJgrUnKn/AKxB0v+Xc/JnvB0F//vD7LDdmRXaL//+758e7N18Nt4UKIyM1dto906z0v95P/oOkeUIubOiFFflyPJH1xk83BavZL21imFODh2I0Jvkm8J696i/WfBzFYpZ4+55mMtS863PmPquRdvuw7xBakmATy8bH1wWB2xJcyWVNA9+/ro1mYz9mRuKK+qrhPJ9cndPW4ldduVxdxZb1fmPkaCWmt62F2PoO0oY2evE97Bp0Ousn8Wn/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rh1xSD4C28lwkbLlQ7b3DuXNa3umaBWr+kz5XlmtCh8=;
 b=Dppq2K1qXAPZib8ZUBeRmG0bm+EEroQV5l4MjcCS3cp62eWmsUoN73oRZihNLZe1rBPrifdAsrgO0yXnwCQbtfW4aPpRIZPcFGkxduiB7Hg4r5Fa8o5U6dc9N/Td8hU0EBOufCq05+poaS++rc6zAnV2EwUdaGgmtP7PWr1qoIA0PHPHc2zXVz+gHGsGqr++uoSgvDAby7Gty7zJW+yh6yhf2MD7YwsJmPn0q6O706XPSWGckyvJxYZHGQrilX+PxelB3RJJ0KfEug26R94cmF3kncPeFteRrxzyThjfmruftax+uVeBE5wJ7VGlDTLJUKBSZOZdUkiVZJtEaJdAMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by PH8PR11MB6998.namprd11.prod.outlook.com (2603:10b6:510:222::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 23:49:46 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 23:49:46 +0000
Date: Tue, 4 Nov 2025 15:49:43 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 07/16] drm/xe/multi_queue: Add support for multi queue
 dynamic priority change
Message-ID: <aQqRF6PKS5nyKePW@nvishwa1-desk>
References: <20251104185150.246345-1-niranjana.vishwanathapura@intel.com>
 <20251104185150.246345-8-niranjana.vishwanathapura@intel.com>
 <aQqGG5izr0hka5Ww@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aQqGG5izr0hka5Ww@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SJ0PR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::15) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|PH8PR11MB6998:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e08a0ad-fbcf-479a-8384-08de1bfcd576
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mQWnkSoasxvQp2tG6rGKfCcdZyuXVPld3BwRHkYVBg6xy7Qi9MpcahlKWOZ4?=
 =?us-ascii?Q?rOjJQD9YGJbVmnzVBwFfkx4QoFS7lIhN582Gb3VnhyH4LvnYPe+9TM74hMAI?=
 =?us-ascii?Q?m10TElGbuaxhFWixNK6tL+OpchX6IUtTD3j2giSu1h4ncUVYFRmiu+kDQYjb?=
 =?us-ascii?Q?E+Aq5f46UJBBrVmX3y3RSdmG6iJDwaxoE4LqBwqYxh66BElaK8/Co8DGFd5L?=
 =?us-ascii?Q?vYepSyRD2LDPQd7MFVGIkFOW2SKWnNzHbdgFnYXcgAAPghwNsnHgb+kKBPhL?=
 =?us-ascii?Q?vVZejfiExaJZgtX9zoiKezQq9ZXYE6hwOZK64QjMI02+uKnNR9+ToMShUNTt?=
 =?us-ascii?Q?/JC5YYu6Yb9v9aM38B2sWH9BLH+8X+1g3Qgj2abv89tnD3Y11Bgk2hWxKvNl?=
 =?us-ascii?Q?Ge4ALOw9KsyfCC4RmU8O000YhEWEjxMpZwTnqq/2Y4YARAACJwGh7tY2W6Ot?=
 =?us-ascii?Q?b8NMb2Q7Vo8cynRAYg99EDhJAHmrjz4J5NoTI97pnFGpauheFK+j6O8/K9UU?=
 =?us-ascii?Q?waNgrBuAiV1kukB74N07D6K6lj6BveaaaPYGLSL8ebuNmbIH/nPCm2hhub79?=
 =?us-ascii?Q?gzVl7C2bekj7mOkVhzIMen6+MHXxP8GGcRUBmd8PIPhVMMxdHEbqD7lkpprT?=
 =?us-ascii?Q?tSSxrLc969O196oZ/o8t/zNWT/UXOQRtjBmtgL4WAWgHWm4OE/vTRo7MQ/ll?=
 =?us-ascii?Q?hm8vPpwurs5Mas9Jca6yrFEvSr56OACpMGm1XqJ0aW5A6I55H7a91GK3AGrm?=
 =?us-ascii?Q?I+uAD7Yp4EXcLKo6G/qcDywvSc+g5iBE6Esr1IXgwYANp7j9Quwvn4vlNiia?=
 =?us-ascii?Q?h3TqfFJ6aIUGmWQPWJsOb7E9bxOAvAjgFdzpWI5l6j9KHayxKHaUuKAEUP1h?=
 =?us-ascii?Q?uyAa2NqVloo68KjP5Y/8kW48w4f2a19maiD4X/+gK79LoYdsWRlww/XOqXrj?=
 =?us-ascii?Q?/ksQ0V388Om/3Elk8c9ITPysrPvjvDDcghH65+xTBtZ4fNWNfoL/JoGY6I2o?=
 =?us-ascii?Q?Gqq7KKVgfrYiaWH5adIYNMxyKrbgwxhPtqQQW9vRZb4ua7ZnSMBCmIPz+QyV?=
 =?us-ascii?Q?VYIzyxHhm0pft/4ycbb4P5CY1Njv/GnCgvetTXjFH5NYf7yjE26D+DeaN+0b?=
 =?us-ascii?Q?+AGFPfbRR6jwksHeFJ824cTeoUBfNrwFAX8AIKiUAqmCFHT3ZOjEVcgnvk42?=
 =?us-ascii?Q?fo3VpMjYVnk4pUpvDvCpVCVZ5QzGGvNSykNiXANUQCSNoTxqG7hcMch9DVuG?=
 =?us-ascii?Q?Yi3geO3vNr7cBV98+UFLBEoTyUzPSbDp/peH4n3RoZNAjzw8V7W/pxoy2C4B?=
 =?us-ascii?Q?DTw1NUF17+YVy92O3JlMMLAtUVPf9A58b1gH+FJNsF2S56z5vy2Es2WB0ABV?=
 =?us-ascii?Q?QI9LSIzBy9pi0tWBJFJVtLwccc8E8zyn/dU0Miaxlz3xGtaRC02DyJszncUv?=
 =?us-ascii?Q?H9jAu5KVQJw4V7fzuJmWBIzYMGkfnDHH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iA/3AMFzmndtOjopvk2Fc9dMcnntAV2zDKpLfaYfgEMMsFcjHC/L0CuJxbvE?=
 =?us-ascii?Q?KyyyTfg3IsHNqo38Lp30EmVcc2xDRsGFkJCdfxaytCBap9kdUrHcTSMrhexq?=
 =?us-ascii?Q?SWVUrPanhl9yEYiFw9fJ/fKBQFzBVNQ85lbKCEt6uaPI0RetnygciEZEg2Bt?=
 =?us-ascii?Q?WncRbgxCep7LX5beREFor+4qs2kRJHUPDHvUrrz+45OQpF3PMYU4uyKnUDgW?=
 =?us-ascii?Q?gGPNgjUMjZudtSte54qQt3t/BFHa3j6vVl4ivfyuKX81XPJ8JinnFf+Kbtst?=
 =?us-ascii?Q?AaQrRLo7MseW/ecfHw/AOPt8rKL0aQ5qzikIUoXisMrli0sr/W+4ku2c56yP?=
 =?us-ascii?Q?+wHFVQvaqpZgAhEkXYlPgNN5zNU58/qrryxqt0prxJVb7Aag3+hnCYmGVPFQ?=
 =?us-ascii?Q?/3LRZeVYKhRf3rPiYQFVT8nDMj8JH9Wo5OnrENaXrPa6tzq/G5+1u8f7Sb69?=
 =?us-ascii?Q?+pltwgOwOg551KYIG7elkBmKthMuTtdS6VNB0XCTZ9wNOT3ER5SiUXlzfIbm?=
 =?us-ascii?Q?3Y2yoYq0mmH4fRQoSXBM1NtFRiNd+5hUUeTcNTfZ2F1yLtTT87/ZQJ5V3oSd?=
 =?us-ascii?Q?r/X1Oo0Mq9G9XvMLLNAXLwsciHqg+vksn3P26rYuv2T+442gvzjxh66d13Ou?=
 =?us-ascii?Q?5ff8GQ6JOvOiTBM4CzUp3zXBh1OnEm9rg78IqdcNcoCQuXE4LI025WDy46Uv?=
 =?us-ascii?Q?uK7clvocELux2Z3+ltLbtYki9mkPq3AiMcPVaHjlQdFmjx4zbE1/FtllVfWb?=
 =?us-ascii?Q?eQhk+1OJhB22GtLjb3J67w76sgUR3Xcu/mUaTiosK7fJwldWhDHfDDzR3zPx?=
 =?us-ascii?Q?hS3sEuNqubzLZoUSsfx1i4PhsIgIJqvlcjzFtwztcAVr+Mp8T0CAEl5Ax337?=
 =?us-ascii?Q?DpIoHVx6H/PR6OrYfUjJdILrBPdSCWeduQ5eOR3YC4ns6oA3AqsbfadwagMv?=
 =?us-ascii?Q?HgB9YIQ8IKNw5BW22tHT0MkPajMsHiNZUr91kW4m0vlOj3Gn0zDKYrX/j0kT?=
 =?us-ascii?Q?uN/RWwk388kMvPiVbHdEnu6vWlpk555BCP7pRlXB9mKRn8oMC/mWet6QvZPP?=
 =?us-ascii?Q?YW9ZGnz0R8qcqZ7JOu73+LfDGHBgGyG+A38HqzplHQpyEQx1hodrADoEj/c1?=
 =?us-ascii?Q?6VE7Dg2aMFawgkzz9+RrEmKRxDbQdG1g+uwMGZxr8OeRqEtwmkM3/DVROxs+?=
 =?us-ascii?Q?ZshAcM0P3Hc1U3PEBdfZI4OCN3zR631dU61gPs4MHqc8lHUP4qQVYDzXcMab?=
 =?us-ascii?Q?1+Of90eBrQcYOu27glD0s4zCKC9dk/WbnsZJ8NhYyi0iKTdE+ZvBHJyblD14?=
 =?us-ascii?Q?xBhfEItUQAsJ/O4Q+EX04o/bsvN4NqZcsSadMx+jKJvuvjevI01a5v0UZJ+l?=
 =?us-ascii?Q?vvmUYPYtFMV70C72hbkgkJ5Z4FqvcdTxcntHs+mW/ij4Z4wMR8wO/0s4ClTs?=
 =?us-ascii?Q?tM7dZfe95Tu+vvizvKViI7LPxD7qmqWK2SYobZ/f4OjBy2RahJg8qIr6x6wt?=
 =?us-ascii?Q?eIED4UvgXRJ0cddPge3c5INP5uiBliObryecqDJxfMFjpObewMrZs2/sSXcG?=
 =?us-ascii?Q?o1Am4cCwcYNzaMTRyyPbeyy8lRMGtycVI944OBZsT+i8XXdCDYySnyPaEHrr?=
 =?us-ascii?Q?fkt0SabVkcOGck9z1wQwcSw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e08a0ad-fbcf-479a-8384-08de1bfcd576
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 23:49:46.2391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fEm+fI6C3seTNP1DxuSOKUW2STivhUL5CQFQEOuM55pCAeJmyBEwW1Wv1PMhtKzcdwjNrigX0mXReoS0+E/24PF97s+nNZDB+O6UlDM0HzjjDI1TsUu6ujv3BsV9Q1yr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6998
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

On Tue, Nov 04, 2025 at 03:02:51PM -0800, Matthew Brost wrote:
>On Tue, Nov 04, 2025 at 10:51:41AM -0800, Niranjana Vishwanathapura wrote:
>> Support dynamic priority change for multi queue group queues via
>> exec queue set_property ioctl. Issue CGP_SYNC command to GuC through
>> the drm scheduler message interface for priority to take effect.
>>
>> v2: Move is_multi_queue check to exec_queue layer and assert
>>     is_multi_queue being set in guc submission layer (Matt Brost)
>>
>> Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_exec_queue.c       | 11 ++++-
>>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  3 ++
>>  drivers/gpu/drm/xe/xe_guc_submit.c       | 55 ++++++++++++++++++++++--
>>  3 files changed, 63 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index c96cc085e8e8..fef48b82b189 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -744,9 +744,16 @@ static int exec_queue_set_multi_queue_priority(struct xe_device *xe, struct xe_e
>>  	if (XE_IOCTL_DBG(xe, value > XE_MULTI_QUEUE_PRIORITY_HIGH))
>>  		return -EINVAL;
>>
>> -	q->multi_queue.priority = value;
>> +	/* For queue creation time (!q->xef) setting, just store the priority value */
>> +	if (!q->xef) {
>> +		q->multi_queue.priority = value;
>> +		return 0;
>> +	}
>>
>> -	return 0;
>> +	if (!xe_exec_queue_is_multi_queue(q))
>> +		return -EINVAL;
>> +
>> +	return q->ops->set_multi_queue_priority(q, value);
>>  }
>>
>>  typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> index 445ae4979c0c..cafb3ba9a123 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> @@ -257,6 +257,9 @@ struct xe_exec_queue_ops {
>>  	int (*set_timeslice)(struct xe_exec_queue *q, u32 timeslice_us);
>>  	/** @set_preempt_timeout: Set preemption timeout for exec queue */
>>  	int (*set_preempt_timeout)(struct xe_exec_queue *q, u32 preempt_timeout_us);
>> +	/** @set_multi_queue_priority: Set multi queue priority */
>> +	int (*set_multi_queue_priority)(struct xe_exec_queue *q,
>> +					enum xe_multi_queue_priority priority);
>>  	/**
>>  	 * @suspend: Suspend exec queue from executing, allowed to be called
>>  	 * multiple times in a row before resume with the caveat that
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index b01d852ae526..27ef83524a34 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -1767,10 +1767,32 @@ static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
>>  	}
>>  }
>>
>> -#define CLEANUP		1	/* Non-zero values to catch uninitialized msg */
>> -#define SET_SCHED_PROPS	2
>> -#define SUSPEND		3
>> -#define RESUME		4
>> +static void __guc_exec_queue_process_msg_set_multi_queue_priority(struct xe_sched_msg *msg)
>> +{
>> +	struct xe_exec_queue *q = msg->private_data;
>> +
>> +	if (guc_exec_queue_allowed_to_change_state(q)) {
>> +#define MAX_MULTI_QUEUE_REG_SIZE        (2)
>> +		struct xe_guc *guc = exec_queue_to_guc(q);
>> +		struct xe_exec_queue_group *group = q->multi_queue.group;
>> +		u32 action[MAX_MULTI_QUEUE_REG_SIZE];
>> +		int len = 0;
>> +
>> +		action[len++] = XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC;
>> +		action[len++] = group->primary->guc->id;
>
>If we want to be really paranoid;
>
>xe_gt_assert(..., len <= MAX_MULTI_QUEUE_REG_SIZE);
>
>Anyways:
>Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>

Ok, will add the assert.

Niranjana

>> +#undef MAX_MULTI_QUEUE_REG_SIZE
>> +
>> +		xe_guc_exec_queue_group_cgp_sync(guc, q, action, len);
>> +	}
>> +
>> +	kfree(msg);
>> +}
>> +
>> +#define CLEANUP				1	/* Non-zero values to catch uninitialized msg */
>> +#define SET_SCHED_PROPS			2
>> +#define SUSPEND				3
>> +#define RESUME				4
>> +#define SET_MULTI_QUEUE_PRIORITY	5
>>  #define OPCODE_MASK	0xf
>>  #define MSG_LOCKED	BIT(8)
>>  #define MSG_HEAD	BIT(9)
>> @@ -1794,6 +1816,9 @@ static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
>>  	case RESUME:
>>  		__guc_exec_queue_process_msg_resume(msg);
>>  		break;
>> +	case SET_MULTI_QUEUE_PRIORITY:
>> +		__guc_exec_queue_process_msg_set_multi_queue_priority(msg);
>> +		break;
>>  	default:
>>  		XE_WARN_ON("Unknown message type");
>>  	}
>> @@ -2010,6 +2035,27 @@ static int guc_exec_queue_set_preempt_timeout(struct xe_exec_queue *q,
>>  	return 0;
>>  }
>>
>> +static int guc_exec_queue_set_multi_queue_priority(struct xe_exec_queue *q,
>> +						   enum xe_multi_queue_priority priority)
>> +{
>> +	struct xe_sched_msg *msg;
>> +
>> +	xe_gt_assert(guc_to_gt(exec_queue_to_guc(q)), xe_exec_queue_is_multi_queue(q));
>> +
>> +	if (q->multi_queue.priority == priority ||
>> +	    exec_queue_killed_or_banned_or_wedged(q))
>> +		return 0;
>> +
>> +	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
>> +	if (!msg)
>> +		return -ENOMEM;
>> +
>> +	q->multi_queue.priority = priority;
>> +	guc_exec_queue_add_msg(q, msg, SET_MULTI_QUEUE_PRIORITY);
>> +
>> +	return 0;
>> +}
>> +
>>  static int guc_exec_queue_suspend(struct xe_exec_queue *q)
>>  {
>>  	struct xe_gpu_scheduler *sched = &q->guc->sched;
>> @@ -2101,6 +2147,7 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
>>  	.set_priority = guc_exec_queue_set_priority,
>>  	.set_timeslice = guc_exec_queue_set_timeslice,
>>  	.set_preempt_timeout = guc_exec_queue_set_preempt_timeout,
>> +	.set_multi_queue_priority = guc_exec_queue_set_multi_queue_priority,
>>  	.suspend = guc_exec_queue_suspend,
>>  	.suspend_wait = guc_exec_queue_suspend_wait,
>>  	.resume = guc_exec_queue_resume,
>> --
>> 2.43.0
>>
