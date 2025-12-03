Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB89D116F3
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 03:40:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D4D510E08C;
	Wed,  3 Dec 2025 03:40:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZM9B81D6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2169010E08C
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Dec 2025 03:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764733210; x=1796269210;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kz1CCNpzyeAnP1dtHwNv8kZQyLp4EoNPzDXT16nrhvc=;
 b=ZM9B81D6h0tA9Fgr9DTX2pN9JWQe5PqXryltjdpe2vLdlw/xBW1LIBOY
 Cp2/SO/qu2xYytrdggxbmnYY+iJzZXHelOI3S5MKnNSxZvI1D941hEmwW
 NguWgg2mqFaSKFnMQUS7qf5rKM7MuS46MgIV5Sm3MqlJJoN58mRP3U/uD
 KcLeT6C1hLZN/VglDj1Fjd2SxZC9rxPyWwh0d+pi3zshodtxz3oZ2/TQP
 awiXhr8mvLvwav93mW1vR3oKsf/j6cgIP1Mn4IxYwIlZtBHa9HBDKSzzC
 b1WQpTKkeKJnXo/uq/lbB9tXAvAW4EEFY+aZckMV9MkasaNiNFgYEwvlQ g==;
X-CSE-ConnectionGUID: blhUjVQiTouyOlozJllKiQ==
X-CSE-MsgGUID: lZn4VC3XQ16yWNGw6CaEcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="78063736"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="78063736"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 19:40:10 -0800
X-CSE-ConnectionGUID: imvPAr1HRzqqjbukltMM2g==
X-CSE-MsgGUID: uU20fAqwSeGYX6mqYmjJKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="194660420"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 19:40:10 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 19:40:08 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 19:40:08 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.10) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 19:40:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hQi4MrsRQgiDJ7BdrNHv947GxzAMD/oouqLMB9d9/3yT3Audo+sZYhpG1aYGcenxn8AptgKlUDK8Xt1IyOnix9ZckG7xbqPA/c7CzuoeFe4ujFg5u63Bth8SHpgp8xoRlklxlBrUM7rwsDrYrzS5qOuKU+iBb0osDihVrMWhwh6A6Ta3m4yWtmxHL449hr0mksPkjKOBIuVrz2bcyvZy0Y/g/L4FyvCvGZlK8Z35g+pNsFFc3DBXhNlpQ5HHZtUArrFHUESzn+xbO0NG7awg283gICwMXK5c7bu122LjmgJZKuRElD9Tg3jVmVOKoQ8jJZaydhE6JKGE782UVDLvWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=suchv+WrF8EZ7Lgjj7cxq5jxmzLIbQ5CxVs0EEQSDmU=;
 b=DEsN/EGkZphBblbEreY3wIjLbv/DKYh4gVRa+Bux6bhP02l1c711clLNCWS5vX4OcW6CDgPObVqPG/CtPBWaUBZjQGMezLr2cc2wRkR9cql9Q5p6Xa3Ng5rQ1AXLrZK+4ChwZctCjWPxzImGlRHYPmLsHTAy++55+C+9ZHzYvjA7oi0IGsv7SCRQgRcJ5vuzzGrt8y6+yC0Efv7A31NYPkKzIlglfVi9qHkYoyV5vbGyP2IjWGWFprR45pCcRGzO4LvqPwFpT5Ygj02qL8f0VAiIFSyNDFwSndJIg6YiL/h/LLDkKFLVFz8mxqRF8oXJ0POw+ldQsY6tDaNVjLy70g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by PH0PR11MB5029.namprd11.prod.outlook.com (2603:10b6:510:30::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 03:40:06 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 03:40:06 +0000
Date: Tue, 2 Dec 2025 19:40:03 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 03/18] drm/xe/multi_queue: Add GuC interface for multi
 queue support
Message-ID: <aS-xE1bPFfbNq9On@nvishwa1-desk>
References: <20251121035147.766072-20-niranjana.vishwanathapura@intel.com>
 <20251121035147.766072-23-niranjana.vishwanathapura@intel.com>
 <aSI2INADswba/Fha@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aSI2INADswba/Fha@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SJ0PR13CA0172.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::27) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|PH0PR11MB5029:EE_
X-MS-Office365-Filtering-Correlation-Id: 732d3c49-7ca5-49b2-78e7-08de321da67f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xq+bXn76rc+iNz6t4KaETUxKWBsqsZUgfwF6lV3oE3CfPqoj3gvzm62qBR/Q?=
 =?us-ascii?Q?Nfha+sDYyGMGmeeNt2f/ptRoyslzXzpi8g7PFqyWBHVLh+sljABDqfLB+4aO?=
 =?us-ascii?Q?2YeXRQNTLfvLSRKqvMuLn4XMPmRKdgU1KNEVEFwikh2W0dJawgt2sNjtNPX3?=
 =?us-ascii?Q?5NuCqDesCU+eSOZhK2DN/fW7zAUaamECcFDyZ0Eek23rc5sbTed+DB041ItD?=
 =?us-ascii?Q?dG2FmRs6AUpFpo1IC9zw2qy5I7BibnHcZZOWLkX3ogcLzfxGpExhXctop6BS?=
 =?us-ascii?Q?Uzibt2B03eEdYC5GrKSv1lVM0i6UJG6YDD9BsmLW4EN0i7Sj6AVIbTQ2QmqG?=
 =?us-ascii?Q?QQi4q+sxLTFP7JYVeHPZ+RLe70CPVwuf8yW+OEP5tLoritnyZUluaK5jJNPW?=
 =?us-ascii?Q?sUyD6C73E+LUfgL+jKjwBuYnj4dchmzhQEJ1y++ZMjI5aqJY71vuqn5MfoLX?=
 =?us-ascii?Q?/IffrrSPIRSEiVxKrs3hJUQFD+8Zycp7hw9/7RlLMRHOWqQ5ZFkijueIbL/e?=
 =?us-ascii?Q?nNX+aK48FcBMsoXDD/cjXwr7yI28MNcZfmb6/eQFMXS8xL5uHGM2hv9QojtK?=
 =?us-ascii?Q?h+t1KpkvoRhqLxOr4EPBjrGPrX8feX2Z2FBCsvh/5GOAFDCrHz0DsU7tlF46?=
 =?us-ascii?Q?zLwnq622AbMWVY3wR/FJOfL950IhmMrkUb6AJwMimRLJU4Sa4G4BRfhLsLEJ?=
 =?us-ascii?Q?xmltFCkZA2GzjyaxBrmu7eajjTYY/MseVmwxctraSjumKlWTL2lcsR4JsKPc?=
 =?us-ascii?Q?aoHUzAcYT2DTc2YLxBB41QKLJN96iniK8lZZOw3BWJaKaJJNeyLc7g5UA3yS?=
 =?us-ascii?Q?0SUJ+ZgaJa1sNCVOsj7TA3b0DWLN6YKv+DI7BbUh1afJhnETlRCmdBfYnn7H?=
 =?us-ascii?Q?kj97mIMWcAX0JzELytn0WualLSgmAFrOEpuuVNf+zHmiobvYiKZMBRNn23Zz?=
 =?us-ascii?Q?DGq/6PmEeJz0DKhQDFws6KyNFkUp75kPxoIvmYwQM0N3kxCfJh5W5ZkRnZRO?=
 =?us-ascii?Q?SIhto3SymgJGxUuMNbwWhjkvYunTE9ZjazAiwUCHimd6UUj9hZzfrc4SgPj1?=
 =?us-ascii?Q?9ZA5i/NcL+7z1DUVuDg+RL2wMbFv/0NjhGwATinmrlbOPTTFDT5A9obKe2s5?=
 =?us-ascii?Q?UTybNMuAg/F/4qt5W+dirz0ROG4nGwhdCF5abNFA/fQDsXWxTpu/R1dgZQQV?=
 =?us-ascii?Q?tmJMX6BGHCiSvNd2u4enUPBN0t/NAJQwLMKlT7StqnvonioPDw/uxkD7mFO5?=
 =?us-ascii?Q?BLJjdEJPUEsiA7JZNH3irCg3ZefI+2YCaEMLUtuESQ2/iqHPeChbD61pBg1F?=
 =?us-ascii?Q?bl8t5YGVNjLN3nURxIb4ocHax+Fhj90uzq4jgGLDot44FpPy8XPfJbT8qiJa?=
 =?us-ascii?Q?3GHukx4Ruv/2lqjHAwCGKMvkER0FqJ5yJ06DDp8BEh7yuaFNsOPznPedWS19?=
 =?us-ascii?Q?AJyPNX7A9bCIjxMCQMWhntC+fZ7n4v9+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lRViHmDUjqWkt1qyRzisjR0O8X5OYk7++40SN5iUw+r+pZ6uZP+3Va4O8bU9?=
 =?us-ascii?Q?Xw7Dc/aLb4NEEC03vxYROrc7s0eqaGuMVWztM/oVa0ACzlMx7IkN1Q1fpDlu?=
 =?us-ascii?Q?tUjVedd2/tBuaDhL8owMzoKlOoivd3XZ78PnyjTWJGohXKEiaNr5AknTy1LK?=
 =?us-ascii?Q?bUP2CjQRLOM65eJLbRBKJxKDR3jhyz14HypLaeGKfgUjXFwOpSwmc3l+Xydp?=
 =?us-ascii?Q?pfkLcMcDg25uP24YOpymu7SxYWj/9Q4gXeFAXQ8z4W58y2ktztEMg9/ZZ82B?=
 =?us-ascii?Q?5fOHJMziaBoJjn+pGUBW4J+mpbeggkn7CrCO5/Y9vWHQdG/Pfowx61tvbzvu?=
 =?us-ascii?Q?3upBujBsa3ya9qd7rxGxB0HtS986NZ6wShMVamYBKvWlVSBpQo0UGJhyn9af?=
 =?us-ascii?Q?mbMhgtwTXXotS2UPEPS3H+A90gxoSO4iBBRMgVYGGU4IIURQz2mX9RexzSjF?=
 =?us-ascii?Q?gW1OtPdeeVSIWuarc3SKp1fLAklxj7Kg0Z1Z66E9RiZ2jHGycfZheiigrj8g?=
 =?us-ascii?Q?jIDZ7aBPoxw2R7/hOlBfXZw23/ade5iR8cx2NrFqrgkaNr3ONtTtxDutm2r4?=
 =?us-ascii?Q?gdgiKjlyWvP8VYFxwz9OHTcF3IIjg8VH5tpnagY6bliGK9RFQiufK9j2pazn?=
 =?us-ascii?Q?kVZ+tGizfaxYm+cCGNHFZ9VTmoFZl0xHJUj7Z8AUKcjRMVrUQ0VbmNaQZ0/A?=
 =?us-ascii?Q?771nUhBjIj3xElnxilLgAmyEf29kMFg4nwibKu0h2c9tDNa9ijNdilrxsJhK?=
 =?us-ascii?Q?6vscHtggF+lPD8YZfr3eyYEgsSa9oW8Bj6GBnb6gxLsW3RcOfviOfD/a8/2j?=
 =?us-ascii?Q?EErU/Uz6uGd5RWgr1kqjR5N1x7xT0V5XOxNvrM5+VnBkwXBG/fnAx7YWD+rI?=
 =?us-ascii?Q?UDvqP88/Fu8GYpDxU7ut1cNdjO+L7uEavTi5qt0WP4Wukni4i33yG6GxVg6k?=
 =?us-ascii?Q?nMPNv3skZ9KrwH4l1GKOqvQKrrAA4BAsup30q5/Xxb1U/5kOdKdoutqsB+Bq?=
 =?us-ascii?Q?LS+oj5TpXqg7edz/vOWdSWzUmAGahPlJ3dWFLi3yIkmVwciDdSB2flSvB1uk?=
 =?us-ascii?Q?OR6STVvL1XQWFWI4qs2pXuQKnmIbxq6Pf0rGMan6R7B4pNBzy8BOtAGIMDHQ?=
 =?us-ascii?Q?wM0yGuXz0vvk6IhLvNYDzPAoET0w168UGmW/6nKO23+5Kke5Hu0z0J/ica+/?=
 =?us-ascii?Q?xA7mCA6+3Ws+S5Iez0mLGY4AzFZRlHUirm4iB7gnSq9Lrn2z146eBJCHQNee?=
 =?us-ascii?Q?CWhm7eh9luvavsuCNAeK+gZeUhMJzK2wVMAEhAOf9+pDB/2IZZZW2G4lMQJq?=
 =?us-ascii?Q?lvZrI3k4uSNjXnh38H2nymW41ixq4YAZ6RcNyKKWhbH8FlPcbyX/z5JNkOM2?=
 =?us-ascii?Q?ET3kRGVKwWry+mR1c9Sd2WufQaveKs0rGsq9o3Lgbkolig13hsbQGNJt2A4U?=
 =?us-ascii?Q?k/B03flQNEh4ddtNgv21txyrvBj77E+TRR3mnZnD2n4ZeBmr7taBtNQy4tH3?=
 =?us-ascii?Q?Hjkj4LaH1aMLFCLAk1NchLtnkQVSlOcPQlM/H3WCJyrd0izhM9oX96f32PRb?=
 =?us-ascii?Q?ZGXSCreCoofZtWpcXTL2qQYgYMlyElCMh3fEq1ixg0XldMacjpKAQ/6ST/Ti?=
 =?us-ascii?Q?opE98jnoOc3dfrZKIqz+0y4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 732d3c49-7ca5-49b2-78e7-08de321da67f
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 03:40:06.5790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BRGJRBUub5Y5lj57pIDnQguTDWVsdq8nZ8g104JjF0fpkF2s9cHCLOS5QDd7wb8CBFUyVEeQR8l42g2rfwuCMWAHAaLr1P3ON95K4q/U2TC1jSxf/ZB3YngcGwTcOVAl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5029
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

On Sat, Nov 22, 2025 at 02:16:00PM -0800, Matthew Brost wrote:
>On Thu, Nov 20, 2025 at 07:51:37PM -0800, Niranjana Vishwanathapura wrote:
>> Implement GuC commands and response along with the Context
>> Group Page (CGP) interface for multi queue support.
>>
>> Ensure that only primary queue (q0) of a multi queue group
>> communicate with GuC. The secondary queues of the group only
>> need to maintain LRCA and interface with drm scheduler.
>>
>> Use primary queue's submit_wq for all secondary queues of a multi
>> queue group. This serialization avoids any locking around CGP
>> synchronization with GuC.
>>
>> v2: Fix G2H_LEN_DW_MULTI_QUEUE_CONTEXT value, add more comments
>>     (Matt Brost)
>> v3: Minor code refactro, use xe_gt_assert
>>
>> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/xe/abi/guc_actions_abi.h |   3 +
>>  drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 +
>>  drivers/gpu/drm/xe/xe_guc_ct.c           |   4 +
>>  drivers/gpu/drm/xe/xe_guc_fwif.h         |   3 +
>>  drivers/gpu/drm/xe/xe_guc_submit.c       | 276 +++++++++++++++++++++--
>>  drivers/gpu/drm/xe/xe_guc_submit.h       |   1 +
>>  6 files changed, 267 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> index 47756e4674a1..3e9fbed9cda6 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> @@ -139,6 +139,9 @@ enum xe_guc_action {
>>  	XE_GUC_ACTION_DEREGISTER_G2G = 0x4508,
>>  	XE_GUC_ACTION_DEREGISTER_CONTEXT_DONE = 0x4600,
>>  	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
>> +	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_QUEUE = 0x4602,
>> +	XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC = 0x4603,
>> +	XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE = 0x4604,
>>  	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
>>  	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
>>  	XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> index f429b1952be9..b9da51ab7eaf 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> @@ -44,6 +44,8 @@ struct xe_exec_queue_group {
>>  	struct xe_bo *cgp_bo;
>>  	/** @xa: xarray to store LRCs */
>>  	struct xarray xa;
>> +	/** @sync_pending: CGP_SYNC_DONE g2h response pending */
>> +	bool sync_pending;
>>  };
>>
>>  /**
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index 2697d711adb2..43a79bcdfb18 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -1307,6 +1307,7 @@ static int parse_g2h_event(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>  	lockdep_assert_held(&ct->lock);
>>
>>  	switch (action) {
>> +	case XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE:
>>  	case XE_GUC_ACTION_SCHED_CONTEXT_MODE_DONE:
>>  	case XE_GUC_ACTION_DEREGISTER_CONTEXT_DONE:
>>  	case XE_GUC_ACTION_SCHED_ENGINE_MODE_DONE:
>> @@ -1569,6 +1570,9 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>  		ret = xe_guc_g2g_test_notification(guc, payload, adj_len);
>>  		break;
>>  #endif
>> +	case XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE:
>> +		ret = xe_guc_exec_queue_cgp_sync_done_handler(guc, payload, adj_len);
>> +		break;
>>  	default:
>>  		xe_gt_err(gt, "unexpected G2H action 0x%04x\n", action);
>>  	}
>> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> index c90dd266e9cf..9b090d9b95f1 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> @@ -16,6 +16,7 @@
>>  #define G2H_LEN_DW_DEREGISTER_CONTEXT		3
>>  #define G2H_LEN_DW_TLB_INVALIDATE		3
>>  #define G2H_LEN_DW_G2G_NOTIFY_MIN		3
>> +#define G2H_LEN_DW_MULTI_QUEUE_CONTEXT		3
>>
>>  #define GUC_ID_MAX			65535
>>  #define GUC_ID_UNKNOWN			0xffffffff
>> @@ -62,6 +63,8 @@ struct guc_ctxt_registration_info {
>>  	u32 wq_base_lo;
>>  	u32 wq_base_hi;
>>  	u32 wq_size;
>> +	u32 cgp_lo;
>> +	u32 cgp_hi;
>>  	u32 hwlrca_lo;
>>  	u32 hwlrca_hi;
>>  };
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 7e0882074a99..c68739fd7592 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -19,6 +19,7 @@
>>  #include "abi/guc_klvs_abi.h"
>>  #include "regs/xe_lrc_layout.h"
>>  #include "xe_assert.h"
>> +#include "xe_bo.h"
>>  #include "xe_devcoredump.h"
>>  #include "xe_device.h"
>>  #include "xe_exec_queue.h"
>> @@ -541,7 +542,8 @@ static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
>>  	u32 slpc_exec_queue_freq_req = 0;
>>  	u32 preempt_timeout_us = q->sched_props.preempt_timeout_us;
>>
>> -	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
>> +	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q) &&
>> +		     !xe_exec_queue_is_multi_queue_secondary(q));
>>
>>  	if (q->flags & EXEC_QUEUE_FLAG_LOW_LATENCY)
>>  		slpc_exec_queue_freq_req |= SLPC_CTX_FREQ_REQ_IS_COMPUTE;
>> @@ -561,6 +563,8 @@ static void set_min_preemption_timeout(struct xe_guc *guc, struct xe_exec_queue
>>  {
>>  	struct exec_queue_policy policy;
>>
>> +	xe_assert(guc_to_xe(guc), !xe_exec_queue_is_multi_queue_secondary(q));
>> +
>>  	__guc_exec_queue_policy_start_klv(&policy, q->guc->id);
>>  	__guc_exec_queue_policy_add_preemption_timeout(&policy, 1);
>>
>> @@ -568,6 +572,11 @@ static void set_min_preemption_timeout(struct xe_guc *guc, struct xe_exec_queue
>>  		       __guc_exec_queue_policy_action_size(&policy), 0, 0);
>>  }
>>
>> +static bool vf_recovery(struct xe_guc *guc)
>> +{
>> +	return xe_gt_recovery_pending(guc_to_gt(guc));
>> +}
>> +
>>  #define parallel_read(xe_, map_, field_) \
>>  	xe_map_rd_field(xe_, &map_, 0, struct guc_submit_parallel_scratch, \
>>  			field_)
>> @@ -575,6 +584,117 @@ static void set_min_preemption_timeout(struct xe_guc *guc, struct xe_exec_queue
>>  	xe_map_wr_field(xe_, &map_, 0, struct guc_submit_parallel_scratch, \
>>  			field_, val_)
>>
>> +#define CGP_VERSION_MAJOR_SHIFT	8
>> +
>> +static void xe_guc_exec_queue_group_cgp_update(struct xe_device *xe,
>> +					       struct xe_exec_queue *q)
>> +{
>> +	struct xe_exec_queue_group *group = q->multi_queue.group;
>> +	u32 guc_id = group->primary->guc->id;
>> +
>> +	/* Currently implementing CGP version 1.0 */
>> +	xe_map_wr(xe, &group->cgp_bo->vmap, 0, u32,
>> +		  1 << CGP_VERSION_MAJOR_SHIFT);
>> +
>> +	xe_map_wr(xe, &group->cgp_bo->vmap,
>> +		  (32 + q->multi_queue.pos * 2) * sizeof(u32),
>> +		  u32, lower_32_bits(xe_lrc_descriptor(q->lrc[0])));
>> +
>> +	xe_map_wr(xe, &group->cgp_bo->vmap,
>> +		  (33 + q->multi_queue.pos * 2) * sizeof(u32),
>> +		  u32, guc_id);
>> +
>> +	if (q->multi_queue.pos / 32) {
>> +		xe_map_wr(xe, &group->cgp_bo->vmap, 17 * sizeof(u32),
>> +			  u32, BIT(q->multi_queue.pos % 32));
>> +		xe_map_wr(xe, &group->cgp_bo->vmap, 16 * sizeof(u32), u32, 0);
>> +	} else {
>> +		xe_map_wr(xe, &group->cgp_bo->vmap, 16 * sizeof(u32),
>> +			  u32, BIT(q->multi_queue.pos));
>> +		xe_map_wr(xe, &group->cgp_bo->vmap, 17 * sizeof(u32), u32, 0);
>> +	}
>> +}
>> +
>> +static void xe_guc_exec_queue_group_cgp_sync(struct xe_guc *guc,
>> +					     struct xe_exec_queue *q,
>> +					     const u32 *action, u32 len)
>> +{
>> +	struct xe_exec_queue_group *group = q->multi_queue.group;
>> +	struct xe_device *xe = guc_to_xe(guc);
>> +	long ret;
>> +
>> +	/*
>> +	 * As all queues of a multi queue group use single drm scheduler
>> +	 * submit workqueue, CGP synchronization with GuC are serialized.
>> +	 * Hence, no locking is required here.
>> +	 * Wait for any pending CGP_SYNC_DONE response before updating the
>> +	 * CGP page and sending CGP_SYNC message.
>> +	 */
>> +	ret = wait_event_timeout(guc->ct.wq,
>> +				 !READ_ONCE(group->sync_pending) ||
>> +				 xe_guc_read_stopped(guc), HZ);
>> +	if ((!ret && !vf_recovery(guc)) || xe_guc_read_stopped(guc)) {
>
>As this series isn't quite right for VF migration, I'd leave out any VF
>migration changes. However I'd add a "FIXME: VF migration" in a follow
>up + maybe open a Jira to track. I'd like to VF migration working for
>multi-queue by the time we remove force probe for a device with
>multi-queue, so have a bit of time and we discuss further on how to make
>this work but I think it shouldn't be too bad.

Ok, will do.

>
>> +		xe_gt_warn(guc_to_gt(guc), "Wait for CGP_SYNC_DONE response failed!\n");
>> +		return;
>> +	}
>> +
>> +	xe_guc_exec_queue_group_cgp_update(xe, q);
>> +
>> +	WRITE_ONCE(group->sync_pending, true);
>> +	xe_guc_ct_send(&guc->ct, action, len, G2H_LEN_DW_MULTI_QUEUE_CONTEXT, 1);
>> +}
>> +
>> +static void __register_exec_queue_group(struct xe_guc *guc,
>> +					struct xe_exec_queue *q,
>> +					struct guc_ctxt_registration_info *info)
>> +{
>> +#define MAX_MULTI_QUEUE_REG_SIZE	(8)
>> +	u32 action[MAX_MULTI_QUEUE_REG_SIZE];
>> +	int len = 0;
>> +
>> +	action[len++] = XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_QUEUE;
>> +	action[len++] = info->flags;
>> +	action[len++] = info->context_idx;
>> +	action[len++] = info->engine_class;
>> +	action[len++] = info->engine_submit_mask;
>> +	action[len++] = 0; /* Reserved */
>> +	action[len++] = info->cgp_lo;
>> +	action[len++] = info->cgp_hi;
>> +
>> +	xe_gt_assert(guc_to_gt(guc), len <= MAX_MULTI_QUEUE_REG_SIZE);
>> +#undef MAX_MULTI_QUEUE_REG_SIZE
>> +
>> +	/*
>> +	 * The above XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_QUEUE do expect a
>> +	 * XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE response
>> +	 * from guc.
>> +	 */
>> +	xe_guc_exec_queue_group_cgp_sync(guc, q, action, len);
>> +}
>> +
>> +static void xe_guc_exec_queue_group_add(struct xe_guc *guc,
>> +					struct xe_exec_queue *q)
>> +{
>> +#define MAX_MULTI_QUEUE_CGP_SYNC_SIZE  (2)
>> +	u32 action[MAX_MULTI_QUEUE_CGP_SYNC_SIZE];
>> +	int len = 0;
>> +
>> +	xe_gt_assert(guc_to_gt(guc), xe_exec_queue_is_multi_queue_secondary(q));
>> +
>> +	action[len++] = XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC;
>> +	action[len++] = q->multi_queue.group->primary->guc->id;
>> +
>> +	xe_gt_assert(guc_to_gt(guc), len <= MAX_MULTI_QUEUE_CGP_SYNC_SIZE);
>> +#undef MAX_MULTI_QUEUE_CGP_SYNC_SIZE
>> +
>> +	/*
>> +	 * The above XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC do expect a
>> +	 * XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE response
>> +	 * from guc.
>> +	 */
>> +	xe_guc_exec_queue_group_cgp_sync(guc, q, action, len);
>> +}
>> +
>>  static void __register_mlrc_exec_queue(struct xe_guc *guc,
>>  				       struct xe_exec_queue *q,
>>  				       struct guc_ctxt_registration_info *info)
>> @@ -670,6 +790,13 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
>>  	info.flags = CONTEXT_REGISTRATION_FLAG_KMD |
>>  		FIELD_PREP(CONTEXT_REGISTRATION_FLAG_TYPE, ctx_type);
>>
>> +	if (xe_exec_queue_is_multi_queue(q)) {
>> +		struct xe_exec_queue_group *group = q->multi_queue.group;
>> +
>> +		info.cgp_lo = xe_bo_ggtt_addr(group->cgp_bo);
>> +		info.cgp_hi = 0;
>> +	}
>> +
>>  	if (xe_exec_queue_is_parallel(q)) {
>>  		u64 ggtt_addr = xe_lrc_parallel_ggtt_addr(lrc);
>>  		struct iosys_map map = xe_lrc_parallel_map(lrc);
>> @@ -700,11 +827,18 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
>>
>>  	set_exec_queue_registered(q);
>>  	trace_xe_exec_queue_register(q);
>> -	if (xe_exec_queue_is_parallel(q))
>> +	if (xe_exec_queue_is_multi_queue_primary(q))
>> +		__register_exec_queue_group(guc, q, &info);
>> +	else if (xe_exec_queue_is_parallel(q))
>>  		__register_mlrc_exec_queue(guc, q, &info);
>> -	else
>> +	else if (!xe_exec_queue_is_multi_queue_secondary(q))
>>  		__register_exec_queue(guc, &info);
>> -	init_policies(guc, q);
>> +
>> +	if (!xe_exec_queue_is_multi_queue_secondary(q))
>> +		init_policies(guc, q);
>> +
>> +	if (xe_exec_queue_is_multi_queue_secondary(q))
>> +		xe_guc_exec_queue_group_add(guc, q);
>>  }
>>
>>  static u32 wq_space_until_wrap(struct xe_exec_queue *q)
>> @@ -712,11 +846,6 @@ static u32 wq_space_until_wrap(struct xe_exec_queue *q)
>>  	return (WQ_SIZE - q->guc->wqi_tail);
>>  }
>>
>> -static bool vf_recovery(struct xe_guc *guc)
>> -{
>> -	return xe_gt_recovery_pending(guc_to_gt(guc));
>> -}
>> -
>>  static int wq_wait_for_space(struct xe_exec_queue *q, u32 wqi_size)
>>  {
>>  	struct xe_guc *guc = exec_queue_to_guc(q);
>> @@ -833,6 +962,12 @@ static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
>>  	if (exec_queue_suspended(q) && !xe_exec_queue_is_parallel(q))
>>  		return;
>>
>> +	/*
>> +	 * All queues in a multi-queue group will use the primary queue
>> +	 * of the group to interface with GuC.
>> +	 */
>> +	q = xe_exec_queue_multi_queue_primary(q);
>> +
>>  	if (!exec_queue_enabled(q) && !exec_queue_suspended(q)) {
>>  		action[len++] = XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET;
>>  		action[len++] = q->guc->id;
>> @@ -879,6 +1014,18 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>>  	trace_xe_sched_job_run(job);
>>
>>  	if (!killed_or_banned_or_wedged && !xe_sched_job_is_error(job)) {
>> +		if (xe_exec_queue_is_multi_queue_secondary(q)) {
>> +			struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
>> +
>> +			if (exec_queue_killed_or_banned_or_wedged(primary)) {
>> +				killed_or_banned_or_wedged = true;
>> +				goto run_job_out;
>> +			}
>> +
>> +			if (!exec_queue_registered(primary))
>> +				register_exec_queue(primary, GUC_CONTEXT_NORMAL);
>> +		}
>> +
>>  		if (!exec_queue_registered(q))
>>  			register_exec_queue(q, GUC_CONTEXT_NORMAL);
>>  		if (!job->skip_emit)
>> @@ -887,6 +1034,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>>  		job->skip_emit = false;
>>  	}
>>
>> +run_job_out:
>>  	/*
>>  	 * We don't care about job-fence ordering in LR VMs because these fences
>>  	 * are never exported; they are used solely to keep jobs on the pending
>> @@ -912,6 +1060,11 @@ int xe_guc_read_stopped(struct xe_guc *guc)
>>  	return atomic_read(&guc->submission_state.stopped);
>>  }
>>
>> +static void handle_multi_queue_secondary_sched_done(struct xe_guc *guc,
>> +						    struct xe_exec_queue *q,
>> +						    u32 runnable_state);
>> +static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q);
>> +
>>  #define MAKE_SCHED_CONTEXT_ACTION(q, enable_disable)			\
>>  	u32 action[] = {						\
>>  		XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET,			\
>> @@ -925,7 +1078,9 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
>>  	MAKE_SCHED_CONTEXT_ACTION(q, DISABLE);
>>  	int ret;
>>
>> -	set_min_preemption_timeout(guc, q);
>> +	if (!xe_exec_queue_is_multi_queue_secondary(q))
>> +		set_min_preemption_timeout(guc, q);
>> +
>>  	smp_rmb();
>>  	ret = wait_event_timeout(guc->ct.wq,
>>  				 (!exec_queue_pending_enable(q) &&
>> @@ -953,9 +1108,12 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
>>  	 * Reserve space for both G2H here as the 2nd G2H is sent from a G2H
>>  	 * handler and we are not allowed to reserved G2H space in handlers.
>>  	 */
>> -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
>> -		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET +
>> -		       G2H_LEN_DW_DEREGISTER_CONTEXT, 2);
>> +	if (xe_exec_queue_is_multi_queue_secondary(q))
>> +		handle_multi_queue_secondary_sched_done(guc, q, 0);
>> +	else
>> +		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
>> +			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET +
>> +			       G2H_LEN_DW_DEREGISTER_CONTEXT, 2);
>>  }
>>
>>  static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
>> @@ -1161,8 +1319,11 @@ static void enable_scheduling(struct xe_exec_queue *q)
>>  	set_exec_queue_enabled(q);
>>  	trace_xe_exec_queue_scheduling_enable(q);
>>
>> -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
>> -		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
>> +	if (xe_exec_queue_is_multi_queue_secondary(q))
>> +		handle_multi_queue_secondary_sched_done(guc, q, 1);
>> +	else
>> +		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
>> +			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
>>
>>  	ret = wait_event_timeout(guc->ct.wq,
>>  				 !exec_queue_pending_enable(q) ||
>> @@ -1186,14 +1347,17 @@ static void disable_scheduling(struct xe_exec_queue *q, bool immediate)
>>  	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
>>  	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
>>
>> -	if (immediate)
>> +	if (immediate && !xe_exec_queue_is_multi_queue_secondary(q))
>>  		set_min_preemption_timeout(guc, q);
>>  	clear_exec_queue_enabled(q);
>>  	set_exec_queue_pending_disable(q);
>>  	trace_xe_exec_queue_scheduling_disable(q);
>>
>> -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
>> -		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
>> +	if (xe_exec_queue_is_multi_queue_secondary(q))
>> +		handle_multi_queue_secondary_sched_done(guc, q, 0);
>> +	else
>> +		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
>> +			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
>>  }
>>
>>  static void __deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
>> @@ -1211,8 +1375,11 @@ static void __deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
>>  	set_exec_queue_destroyed(q);
>>  	trace_xe_exec_queue_deregister(q);
>>
>> -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
>> -		       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
>> +	if (xe_exec_queue_is_multi_queue_secondary(q))
>> +		handle_deregister_done(guc, q);
>> +	else
>> +		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
>> +			       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
>>  }
>>
>>  static enum drm_gpu_sched_stat
>> @@ -1655,6 +1822,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>>  {
>>  	struct xe_gpu_scheduler *sched;
>>  	struct xe_guc *guc = exec_queue_to_guc(q);
>> +	struct workqueue_struct *submit_wq = NULL;
>>  	struct xe_guc_exec_queue *ge;
>>  	long timeout;
>>  	int err, i;
>> @@ -1675,8 +1843,20 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>>
>>  	timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
>>  		  msecs_to_jiffies(q->sched_props.job_timeout_ms);
>> +
>> +	/*
>> +	 * Use primary queue's submit_wq for all secondary queues of a
>> +	 * multi queue group. This serialization avoids any locking around
>> +	 * CGP synchronization with GuC.
>> +	 */
>> +	if (xe_exec_queue_is_multi_queue_secondary(q)) {
>> +		struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
>> +
>> +		submit_wq = primary->guc->sched.base.submit_wq;
>> +	}
>> +
>>  	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
>> -			    NULL, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 64,
>> +			    submit_wq, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 64,
>>  			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
>>  			    q->name, gt_to_xe(q->gt)->drm.dev);
>>  	if (err)
>> @@ -2413,7 +2593,11 @@ static void deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
>>
>>  	trace_xe_exec_queue_deregister(q);
>>
>> -	xe_guc_ct_send_g2h_handler(&guc->ct, action, ARRAY_SIZE(action));
>> +	if (xe_exec_queue_is_multi_queue_secondary(q))
>> +		handle_deregister_done(guc, q);
>> +	else
>> +		xe_guc_ct_send_g2h_handler(&guc->ct, action,
>> +					   ARRAY_SIZE(action));
>>  }
>>
>>  static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
>> @@ -2463,6 +2647,16 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
>>  	}
>>  }
>>
>> +static void handle_multi_queue_secondary_sched_done(struct xe_guc *guc,
>> +						    struct xe_exec_queue *q,
>> +						    u32 runnable_state)
>> +{
>> +	/* Take CT lock here as handle_sched_done() do send a h2g message */
>> +	mutex_lock(&guc->ct.lock);
>> +	handle_sched_done(guc, q, runnable_state);
>> +	mutex_unlock(&guc->ct.lock);
>> +}
>> +
>>  int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>  {
>>  	struct xe_exec_queue *q;
>> @@ -2667,6 +2861,44 @@ int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 le
>>  	return 0;
>>  }
>>
>> +/**
>> + * xe_guc_exec_queue_cgp_sync_done_handler - CGP synchronization done handler
>> + * @guc: guc
>> + * @msg: message indicating CGP sync done
>> + * @len: length of message
>> + *
>> + * Set multi queue group's sync_pending flag to false and wakeup anyone waiting
>> + * for CGP synchronization to complete.
>> + *
>> + * Return: 0 on success, -EPROTO for malformed messages.
>> + */
>> +int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>> +{
>> +	struct xe_device *xe = guc_to_xe(guc);
>> +	struct xe_exec_queue *q;
>> +	u32 guc_id = msg[0];
>> +
>> +	if (unlikely(len < 1)) {
>> +		drm_err(&xe->drm, "Invalid CGP_SYNC_DONE length %u", len);
>> +		return -EPROTO;
>> +	}
>> +
>> +	q = g2h_exec_queue_lookup(guc, guc_id);
>> +	if (unlikely(!q))
>> +		return -EPROTO;
>> +
>> +	if (!xe_exec_queue_is_multi_queue_primary(q)) {
>> +		drm_err(&xe->drm, "Unexpected CGP_SYNC_DONE response");
>> +		return -EPROTO;
>> +	}
>> +
>> +	/* Wakeup the serialized cgp update wait */
>> +	WRITE_ONCE(q->multi_queue.group->sync_pending, false);
>> +	wake_up_all(&guc->ct.wq);
>
>We have helper for this now: xe_guc_ct_wake_waiters
>
>Still need to scrub the entire code for 'wake_up_all(&guc->ct.wq)' and
>fix those up but let's use this in new code.
>

Ok, will use the helper here.

Niranjana

>Other than these mirror nit, lgtm.
>
>Matt
>
>> +
>> +	return 0;
>> +}
>> +
>>  static void
>>  guc_exec_queue_wq_snapshot_capture(struct xe_exec_queue *q,
>>  				   struct xe_guc_submit_exec_queue_snapshot *snapshot)
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
>> index b49a2748ec46..abfa94bce391 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
>> @@ -34,6 +34,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>>  					       u32 len);
>>  int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len);
>>  int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len);
>> +int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
>>
>>  struct xe_guc_submit_exec_queue_snapshot *
>>  xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q);
>> --
>> 2.43.0
>>
