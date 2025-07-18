Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8041C83F34
	for <intel-xe@archiver.kernel.org>; Fri, 18 Jul 2025 21:37:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 645E810EA6B;
	Fri, 18 Jul 2025 21:37:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iU6KTzdt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D306B10EA4D
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Jul 2025 21:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752874657; x=1784410657;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Zy/UvwNIt3zr8auM2TYlLbfALUydFEZWBQWNXrC0k1k=;
 b=iU6KTzdtbVVx9NSQcyaAubctx5qjUdAn5Wqg1KKINlhywk+qal90K/lz
 2MlLLSbpy3ONIpTTNLhQIEl7SKHxGvEUoVq3YfIaBpitwJi6qHBx/Ps4u
 YTLiB0+jOQGdC0QBmUER4+3kH1Zts2tblgkv/bBVPzYZeHr6b/T0+n5uP
 wEM7231xHvteqYqA9jHJaHrniHpLy74JacY7DchM8sgK4z1IHF/UWYCqo
 Wlk5JYHwRGifxPGjeiaHVFZEs5tDCo0zfQ65lx9JbpasFO0xIJZFHmCWa
 +5jaHMKGHiNo3YT0O1MXrPm6mxxQaLwP8ptYTzJIA3qkr/tcsDuqP1tM1 g==;
X-CSE-ConnectionGUID: bUudbvtSRMCdioaVk9HCKQ==
X-CSE-MsgGUID: 9OGee3NbRoG7pohvN2PpMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="72627967"
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; d="scan'208";a="72627967"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 14:37:37 -0700
X-CSE-ConnectionGUID: n696wqF2ToSWmJBuwscfgA==
X-CSE-MsgGUID: AiAlp4n/SuOa5qTye2xuXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; d="scan'208";a="163730545"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 14:37:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 18 Jul 2025 14:37:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 18 Jul 2025 14:37:35 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.49)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 18 Jul 2025 14:37:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mxnsMaFBHlCNK/MMKIqzIIxxM0uX+PrCr3saroyVYJPHs8U9c76zcxi1dipC8EQg+LP+C1Kdzcf7K37nkf/IRRKZZTDhk6h2ECGvkAdvgpSGXUUWjRtucov3GYkaSCXTUlUEnHYiIfi1usbvBg1+fB02PyvMb3cNlw5YIO2aueZemPHCL2etBAEXXH7WJ2TqjydTdFI6OFQumKI0tw6MYXN3Uyl7WdC6m5fyzg3ZUZh9bdOkDrjYWwg+4ktdsoOglnzLBW5a9iu50N1Owy+D/VWes8ugJMCoMD0bny2TqdKYZ8BEygWif9RBo8oK0jpWEefaED5DttqNGJC77QeRjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KCwFuwawUd4wMPWEP2Qoiun+OHigvA9GgTCSeqBnA/U=;
 b=JlLspN1vpdObBXjFJ/m0fBNBV2mw/G3keJy9MUVxo3ktzK3YAF6FHV8qzfwnKGiV4VPy2hQL/7YIZnj6xZXhzi6IWy6MrDwXPoYKIIaT8Uj537eaYvd5qhg9ZTc+bmWZNw8BZr+HWabMDB2yo9VkpojGNdCf6L7wfP1Q0eZNmU/W+hwhxdb7XELLeOcYcZzq926BtFA34wkL7akVvZcr/QQTSxMGPhyYstwCziV4wI4WXqFyYNIcJcPBsh61Xn2EWCp1/afOYqnD79TTe7d1UlNznTd2Gz34sRegkTdT9HsbHGbkIbrIs82yrVeXc9Ukq5vRI4NX/McZdG8FyZ7CPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DS7PR11MB5989.namprd11.prod.outlook.com (2603:10b6:8:70::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 21:36:52 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%7]) with mapi id 15.20.8880.021; Fri, 18 Jul 2025
 21:36:52 +0000
Date: Fri, 18 Jul 2025 14:38:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Misc refine for svm
Message-ID: <aHq+2MMN8Mly6KFZ@lstrano-desk.jf.intel.com>
References: <20250718212409.86516-2-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250718212409.86516-2-shuicheng.lin@intel.com>
X-ClientProxiedBy: MW4P223CA0009.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::14) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DS7PR11MB5989:EE_
X-MS-Office365-Filtering-Correlation-Id: 22dd740f-11e4-47a2-b29b-08ddc6433593
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GnfUmE4ZVGX34sfNWcU716Do2TF+EnQ5W6yYiMXumVyWBjW+TkxR3MYupfyE?=
 =?us-ascii?Q?U1ZaYd22D9ipCeK118GBdBWNEOevO9xUf7pFHz89Zlf3Vi4qC25PCfxFyJZu?=
 =?us-ascii?Q?NCfY8EP2LMzcH87WN+yJUTJskI3W4NgpqoHovcYDJFbvBtUP69PELhX5iSe4?=
 =?us-ascii?Q?jHEiZMAADsM8xiME7OvwEFViBTpu0Fg1KsK7ZZDO+3PDmyTral6g8z9b7CiT?=
 =?us-ascii?Q?1ZZ6qy+aMQoAIuG8V8EPs5QVcEfREuGiwbycjsJLEctKzD9JIKo1lZjBe7FL?=
 =?us-ascii?Q?9YD+VZLhNzH299SGf6moNV52tBe3CXjbfx7sJwF5b8ld2YDvhzg1An0uj54B?=
 =?us-ascii?Q?e/RjbPe6SrU2BdfX0c9FxTSyN4eGhHYM6JlTzvU5PdS5BOex2jQfmq1pgPme?=
 =?us-ascii?Q?8KuwCFUe4owYuasNH4si8RsxdTKuWK4vR6W7X7CeyNoP38e9vceme03h6MQd?=
 =?us-ascii?Q?peuB6phJBBksuXPWnKFf3GjP4IVZGRO04694HbHgP80HgkwXH5lNgUV0aIzl?=
 =?us-ascii?Q?o2AhlPMmZZ0iBt/dLvBsPRJRVZBvfnLCWkSvP+Wg0AUWyfH/ZWBGVV8SiWOS?=
 =?us-ascii?Q?z6f9E16LvtbaKtajeLqMgCZgcBy8AKXb65DZVcO6TFcFUyWmZbzhE1JljcG2?=
 =?us-ascii?Q?CRIgpK+V6vKyR6e+KkIhpR9FYD6A4F+sDsUVqEwHwKwfpA6bd3IaNpmO9wBf?=
 =?us-ascii?Q?B5jNuZVG7i27Z3VC8LJnmnRkLqfjZ39ek+RBp5kwlC9RhPWgnSRZV6Vsejsv?=
 =?us-ascii?Q?cQ0tVu0yOdVTt8KdnmNWRH/YSDsjp4HPMbUSUnpl4lk6zA0AW+hVw18aRMp9?=
 =?us-ascii?Q?Pvrlzp02HqQ58kDHhzyrErfs/Mm3PdhF9HJITd6tnwRvpm8apz4/WDLDbPwp?=
 =?us-ascii?Q?S+/iIrcRivru09Bp14RQ9f0y0k5rtGbkOL5MMjSoT2p7orM7MLEasZi+bD7L?=
 =?us-ascii?Q?BJhS+TnW2Y8Zqrs9LB0tOFNYyYA+XdgYixRVhLYdZhNpOP9UadhNHVFH5CJ2?=
 =?us-ascii?Q?mCpUwSFPlUOmQ8CxEstGxPF2hHtMzZaMQommSvFJKUXJzeEN0mCLsUloZ/iv?=
 =?us-ascii?Q?HL4XfzBtGNIke29lkMEiz79fWYYsDoVUt/52gmUGHo+wLpESBcCKS9TbetXX?=
 =?us-ascii?Q?/nMTKjDn8/o+op7dr2d3S9yDqKlSB0rFwgP0gB6J0L8M6ZUZLOeYcstUMYYp?=
 =?us-ascii?Q?Me2I6rob09Oc6IwQtHewE+vrcFhZ+irlJa/A9GPo80TEr+bIGYguf3q0+e1e?=
 =?us-ascii?Q?yQ7FJUAgPauIfKoE/mTjf5YBDgUr2f5ASpoHBu3Fn9Wyl4Ktu5wYLM0U3GP2?=
 =?us-ascii?Q?rlLa+XYfy+MCJ5JYHcpyTR8nkVt74NTn3QGE+GE2E3bB5cgDtvKbb55ux4+D?=
 =?us-ascii?Q?oXcL8ATMNyMQJ/d4bAetNCQ2i+uSk8rmSbMgFauTWng1cUE3H+ZKxNipa6ez?=
 =?us-ascii?Q?ZdZAunkO0qI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QfxNWjoMn/d567bDupJBdYmqoeB6L6g8o+GMKeYNv8ZMTP2r6FtpCIDF5Rvw?=
 =?us-ascii?Q?W79ZQPKXNtkqgF6O5mDqm3iQF53i7xfCe9Ds7uVvY48tKPzNdMS8hKC0/L1/?=
 =?us-ascii?Q?cENIfd4qSCpVtvbZ3ZOSJ8nKGReQp2GWYu3o5HoVdTyStvsTzTNUjUxgRZEa?=
 =?us-ascii?Q?p/dYJRKSMUSGTg0dwOEDW3Y/55GZ9y0K9trcmnwemCs0oZYr1az1QtEy6kQk?=
 =?us-ascii?Q?l/xbcpElrq16w02KZb94XcHqsoqTkL/2NaemUpbDZONtwSZIdJDMX3JSa8pW?=
 =?us-ascii?Q?52xByCKT6fiRdb9JKyfJPAlIh4WiFJodGbLi0HpXeavcmJEYK5CQPQj0iE3C?=
 =?us-ascii?Q?e8So3cllH7ys3XgrvhaJoml/tmeH/NE/jgA8gbWUFY3ugL7EtezUy24Ivrwe?=
 =?us-ascii?Q?3FXlZtYSYT6XJz7sk3MxYkrbs1hDe0OeWH11oows0cKyo5YanjNQIHO6/6Op?=
 =?us-ascii?Q?6QnbVQkhPPE/zbYtQlc3LWgp5nI/8dhycuqbOmcYfLCSGaVHPiNCwipdtZWb?=
 =?us-ascii?Q?kmFvZle4DMEzWkN+wxmyWff65G0HVl9ZdfYpN7aDpzfQNA1+YNKwAIEvFJ31?=
 =?us-ascii?Q?qZkaVeruDfBB1GAn0N6d66u9WPqtzR+nSnmPvdYorp4aluw7dA5N+kp/uU4f?=
 =?us-ascii?Q?eLstCFuOB8KlHxzirEUEavCFrhKVKDWliUK4idYEFe7hy8EMbeSLEgY+7cHD?=
 =?us-ascii?Q?jkts0RBRcdYPTvTNEEwmOcIGz1eQ7A/CUVrqK4N5wu+Dr0TbfdBXqjqliKIV?=
 =?us-ascii?Q?WixdBMK5xA7uofxiOIyXZJBU9q16r0saS186CTMWwN3GdmLpgNZCspPgS72X?=
 =?us-ascii?Q?/FdHcEguPDcKnfn8glHeB6iH6/f+1nqg/se3lVnYKT7EHkFVwYjYohmKpYrH?=
 =?us-ascii?Q?vS4/JAMuyd3HqkwHjUJHHnPkj0nS+AuSZkUhb809tfcBcjbQYuBLGRL7mNZa?=
 =?us-ascii?Q?ESB9BcK8w6hY4qzr7QhXMXvwX1lm6PoReqbon9OeTnugfTD5d2HZ7rop3Ady?=
 =?us-ascii?Q?Vxj/kLH7+kXVk5/+2HYmT52akpRqU6H50x4KsuOSmeYanMW7MddzHWWZci3c?=
 =?us-ascii?Q?/OmwzykcDhJHA8ynHoTv+ogyAwBrLun8gM0Ta7cD0hMTybqdduzjWX8Y9lxm?=
 =?us-ascii?Q?28JaYEZaCsJ8LDBpZFdib0YqIo7qxw8nrgwbP/iGfGqGAWMsSCMyVZ1zRpZe?=
 =?us-ascii?Q?I8lj5v9vSq4ksFbfmbK7NFwmYt6sL44wqcefE/T+RsxBKkRNL6LaJjCCEOXs?=
 =?us-ascii?Q?QE02e3LRL0MdNZam3jT3oafLhbcc3kVZxpr58E0ncSJmx66Czx3/GL08Krzs?=
 =?us-ascii?Q?/6kthq9bSw4Y6IgCFof1XL0xe+VOx/M56PX0EExj/LUdPZrGxzqh65kpCE8h?=
 =?us-ascii?Q?50J8mYeZ30FzSoQBsSCjoG6mQlaUUj8K7f8DxRSiw72zOS6kpTC23bAknkwJ?=
 =?us-ascii?Q?VNHXGezrLGYcxKEACk+Yae5eKU3uhd84wS+DTBz7qqHBIQ0Sp5LhMpSoy8Zr?=
 =?us-ascii?Q?pMTRqSRsS4YIBx0VcFKM7wynYxlhFRMXXwM1QNZa23ORp/RNssAcIlNceCpF?=
 =?us-ascii?Q?utCfyQZpxR/ZDLe1oiqh6UmuXKwWVCNcbPc3QJxw9VUexcJ7y8q4wlqT7AEy?=
 =?us-ascii?Q?RA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22dd740f-11e4-47a2-b29b-08ddc6433593
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 21:36:52.3426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8q+0oizqFepY3D9KCoD0yLibnrcU9zMFs+PTV/EIB/8Uj65PzbznFoDhckdLe47JekFPQxgvOPQAMaBX/2yAJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5989
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

On Fri, Jul 18, 2025 at 09:24:10PM +0000, Shuicheng Lin wrote:
> in function xe_svm_handle_pagefault(), migrate_try_count is set to 3 when
> ctx.devmem_only is true. If ctx.devmem_only is false, the try count is 1,
> which means no retry. Remove the "!ctx.devmem_only" check for the retry
> path.
> 
> Below other changes should have no function effect.
> 1. Correct typo of "operation"in macro range_debug().
> 2. Combine 2 spin_lock() call in xe_svm_garbage_collector() into 1.
> 3. Remove preferred_region_is_vram check in xe_svm_range_needs_migrate_to_vram()
>    as it is already checked in the begin of this function.
> 4. Combine the devmem_possible check in xe_svm_handle_pagefault().
> 5. Combine 2 xe_vm_unlock() call in xe_svm_handle_pagefault() into 1.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 34 ++++++++++++++--------------------
>  1 file changed, 14 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 10c8a1bcb86e..2c47bbe7d4b4 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -50,11 +50,11 @@ static struct xe_vm *range_to_vm(struct drm_gpusvm_range *r)
>  	return gpusvm_to_vm(r->gpusvm);
>  }
>  
> -#define range_debug(r__, operaton__)					\
> +#define range_debug(r__, operation__)					\
>  	vm_dbg(&range_to_vm(&(r__)->base)->xe->drm,			\
>  	       "%s: asid=%u, gpusvm=%p, vram=%d,%d, seqno=%lu, " \
>  	       "start=0x%014lx, end=0x%014lx, size=%lu",		\
> -	       (operaton__), range_to_vm(&(r__)->base)->usm.asid,	\
> +	       (operation__), range_to_vm(&(r__)->base)->usm.asid,	\

Looks good.

>  	       (r__)->base.gpusvm,					\
>  	       xe_svm_range_in_vram((r__)) ? 1 : 0,			\
>  	       xe_svm_range_has_vram_binding((r__)) ? 1 : 0,		\
> @@ -263,8 +263,8 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
>  	if (xe_vm_is_closed_or_banned(vm))
>  		return -ENOENT;
>  
> -	spin_lock(&vm->svm.garbage_collector.lock);
>  	for (;;) {
> +		spin_lock(&vm->svm.garbage_collector.lock);

Also looks good.

>  		range = list_first_entry_or_null(&vm->svm.garbage_collector.range_list,
>  						 typeof(*range),
>  						 garbage_collector_link);
> @@ -282,8 +282,6 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
>  			xe_vm_kill(vm, true);
>  			return err;
>  		}
> -
> -		spin_lock(&vm->svm.garbage_collector.lock);
>  	}
>  	spin_unlock(&vm->svm.garbage_collector.lock);
>  
> @@ -763,12 +761,12 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
>  
>  	xe_assert(vm->xe, IS_DGFX(vm->xe));
>  
> -	if (preferred_region_is_vram && xe_svm_range_in_vram(range)) {
> +	if (xe_svm_range_in_vram(range)) {
>  		drm_info(&vm->xe->drm, "Range is already in VRAM\n");
>  		return false;
>  	}
>  
> -	if (preferred_region_is_vram && range_size < SZ_64K && !supports_4K_migration(vm->xe)) {
> +	if (range_size < SZ_64K && !supports_4K_migration(vm->xe)) {

Also looks good.

>  		drm_dbg(&vm->xe->drm, "Platform doesn't support SZ_4K range migration\n");
>  		return false;
>  	}
> @@ -793,16 +791,14 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  			    struct xe_gt *gt, u64 fault_addr,
>  			    bool atomic)
>  {
> +	int devmem_possible = IS_DGFX(vm->xe) &&
> +		IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
>  	struct drm_gpusvm_ctx ctx = {
>  		.read_only = xe_vma_read_only(vma),
> -		.devmem_possible = IS_DGFX(vm->xe) &&
> -			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
> -		.check_pages_threshold = IS_DGFX(vm->xe) &&
> -			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ? SZ_64K : 0,
> -		.devmem_only = atomic && IS_DGFX(vm->xe) &&
> -			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
> -		.timeslice_ms = atomic && IS_DGFX(vm->xe) &&
> -			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ?
> +		.devmem_possible = devmem_possible,
> +		.check_pages_threshold = devmem_possible ? SZ_64K : 0,
> +		.devmem_only = atomic && devmem_possible,
> +		.timeslice_ms = atomic && devmem_possible ?

Also good.

>  			vm->xe->atomic_svm_timeslice_ms : 0,
>  	};
>  	struct xe_svm_range *range;
> @@ -841,7 +837,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  		err = xe_svm_alloc_vram(tile, range, &ctx);
>  		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
>  		if (err) {
> -			if (migrate_try_count || !ctx.devmem_only) {
> +			if (migrate_try_count) {

This is a behavior change. Instead of retrying non-devmem only faults in
SRAM we'd abort which is not the desired behavior. Run
xe_exec_system_allocator on BMG and I suspect it will quickly fail.

>  				drm_dbg(&vm->xe->drm,
>  					"VRAM allocation failed, falling back to retrying fault, asid=%u, errno=%pe\n",
>  					vm->usm.asid, ERR_PTR(err));
> @@ -860,7 +856,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  	/* Corner where CPU mappings have changed */
>  	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
>  		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
> -		if (migrate_try_count > 0 || !ctx.devmem_only) {
> +		if (migrate_try_count > 0) {

Same thing here.

>  			drm_dbg(&vm->xe->drm,
>  				"Get pages failed, falling back to retrying, asid=%u, gpusvm=%p, errno=%pe\n",
>  				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> @@ -882,8 +878,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  retry_bind:
>  	xe_vm_lock(vm, false);
>  	fence = xe_vm_range_rebind(vm, vma, range, BIT(tile->id));
> +	xe_vm_unlock(vm);

Also good.

Matt

>  	if (IS_ERR(fence)) {
> -		xe_vm_unlock(vm);
>  		err = PTR_ERR(fence);
>  		if (err == -EAGAIN) {
>  			ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
> @@ -894,13 +890,11 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  			goto retry_bind;
>  		goto err_out;
>  	}
> -	xe_vm_unlock(vm);
>  
>  	dma_fence_wait(fence, false);
>  	dma_fence_put(fence);
>  
>  err_out:
> -
>  	return err;
>  }
>  
> -- 
> 2.49.0
> 
