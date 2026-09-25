Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8523C9832A
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 23:53:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2896410E086;
	Fri, 25 Sep 2026 23:53:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZEwWOjMg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5123E10E086
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 23:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790380385; x=1821916385;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+gDP/axI/TVYtYsfz3ZQdfi9FWj7YlOUeuggF8iF6UA=;
 b=ZEwWOjMguPdtZXCMtxCsEsiUAKsg3jHagD9q41p3g/Ts3MHGRHDot05i
 WYEmgJtZcjCyT1l3BTFv0MbFWQqv+icajYCzduQQUJNz8R+V3WnLzrUt/
 0b4iSvEOE4coknbuRNzG1Xq9S+0q5Mfjyt1W2gsoCArgIHhl+NgOHg+ZA
 IvL2yKRl0vTvBcsAS1bc8RmXo1GKXJ5t3HrF4QOxvsko/TuifD+A/WUKi
 FMoyzTHR57FVsrChnhEa/uYlaFqvsi+l0VOpH4K0oUzhO1XZyccpXVgRC
 6mtJcV/Y5hn9VtLDSjzGZv9BsZ8WLq5kSnA4UmjkakFHlxssjtV+L0FDM A==;
X-CSE-ConnectionGUID: /gTqhvNtQhS9gLhrIxwtIQ==
X-CSE-MsgGUID: nwscDwTdQ4+0jKvI7W5VOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="90212491"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; d="scan'208";a="90212491"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 16:53:05 -0700
X-CSE-ConnectionGUID: 3gbHJ5tjRPCsXXlM0aKfEA==
X-CSE-MsgGUID: 3NOqyRi0SUmwXKG4SC5BSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; d="scan'208";a="272256738"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 16:53:05 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 16:53:04 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 16:53:04 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.4) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 16:53:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WfAQ7J6T0zDihTAKGVNykTcX/SCy9o/QFJlRAy3QZWu/Ma0pRjuFn710gZfeLVBdWN9G/hpO+RH4SjvkEdQJbWD36Dmvgw7z4FE4WIks8cplJsbk4SyUguPJaoCsCYRATGGGSj0K2qzhJ1Pre5LXtZLiDkD5Y9AZNaViWth6Ce7IfS/RzSmWkBUruBo10tEeISV3CAp77+I5dl4wDK3NL/NslbcyGpkP6bw/GkI2IrDoo+2Qn/PRRzoOr07Zqn91VyvqfFPbCijZfoPIS3rZjmT9yCzjXFf87F58E2XRu2omurvwj54Xfpt0iYOcPztGnjhleqnTamBH1sxnqPUWCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fRM0fiPqQHI4MO4s06l51WsvnaBJwwpf0Ubz1n6om/M=;
 b=Is6gLSblnC1haPEwaLAVqYGG1bSfFoj7/8yXK7Xr56S5vd6WR4475mNlj+KW+KcgvduhAWBXUoxnNkB2eWP9uihhPgzhTqE29+jm+B76ouCjCjlHAVVoptIahgBIBu2xmR3zJj085qV4qQ6qeb2KcrJdN7Qe2c8ithrxl7CdNRw5iU08zLHSHMZ5AG1vjVzzOO8K7B33ewhjcRYmq1tOVm3P4sPTWfzc/jQGt3KE7IfplxYCzrRvWjkKf8Nh93LugJHhdt7WAyJxpBNrK1hIwnd9gK9mEqaT7VyJFmwL0L+9vNC9t7M32t0MUDe6AoFOwdGI7w3I8mg3RFkFba4dhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by SJ1PR11MB6252.namprd11.prod.outlook.com (2603:10b6:a03:457::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.14; Fri, 25 Sep
 2026 23:53:02 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 23:53:02 +0000
Date: Fri, 25 Sep 2026 16:53:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Nguyen <brian3.nguyen@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>,
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe: Implement print vfunc for page fault info logging
Message-ID: <arcJXFXLz9fxjrqR@gsse-cloud1.jf.intel.com>
References: <20260925232757.3456172-2-brian3.nguyen@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260925232757.3456172-2-brian3.nguyen@intel.com>
X-ClientProxiedBy: MW4PR03CA0218.namprd03.prod.outlook.com
 (2603:10b6:303:b9::13) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|SJ1PR11MB6252:EE_
X-MS-Office365-Filtering-Correlation-Id: bd7c3719-de32-4342-47fd-08df1b602278
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|11063799006|56012099006|22082099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: HN/w+8/kMEm/hsjSs7RLf6MjIjWaWu38ThlSubO5nBrkg0ITI4Tq3koYpKTaAm31LnExROhmJcL/IIIiNQ+A1iwt+N850474firxzG6RTSmEmG28Z5iEEzTooRtqxKsQutoS/MFaBtpM47T4Hb8bSDFrqmXM/hKZ9SoS3dqqmu/MktzrowPkVe5WyQiz6klKEYFSkVCKhcezu64k/uAtv263l2nfjCQ8syHBgzNdWjrSxPcAZ4zqM/nIjPD57oTVfNc/AAS6AG0IyVZhpzn2ljXUIud0zL7wIi76QGibOdic0TnPW06vjRIw5uMqyd9553M2hxmW7zdDbrr4IOupT0eK1qTcY9iQ6iZ3ItErVmFlYD8UwEkK1W4cQfPnO25z0+cHg6t6GOA3GPV7Cgl8yz/UAObN//RHj6AVgvBVs5+NnQSDopsKyGrhDdALftcK3lBpMWx77NhR6jnA8yHlSzX0TUq/Xe2oEDlIN1Ol54bBkImiVzD+KZANXUUmCSBMg4BNn0Y7kFiRQkiLa72M6CrchZDrcRSEidjCXM/h1fXz6GbhTGQpBdwAZ3QJuV70yq9pRCMqBQOuT7YuO/9Cqujntws6mlbDOL3T8RUywWNp3VONOBywKJDopO04ete2PZo3StFGrnxszjHwRkKz7LLQNAhc5Q7S3s/zzv700iU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(11063799006)(56012099006)(22082099003)(10067099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UFG1WHLD5xI2mjzUaRt/vo3k22VEEEKs7BkmkcNhsl8g9lMLPAGIuqzRTlpY?=
 =?us-ascii?Q?MYJJ5muypcpV+rOw0oiXqi1w5uwt7wzzO9+++FdYsHayFq4hehe5ixpmJgyI?=
 =?us-ascii?Q?pl24Abb8uOd1BQ9UTUiNrzMBaMZ+mhKMYjxkG2tpXzcDsIrnK01dBKhRPBRS?=
 =?us-ascii?Q?grVkSO2H+Luw7hfdXpGyOmnPCUCr1KCgg9CNrPLNE3s+yeTs0JzRcKmlqHOs?=
 =?us-ascii?Q?b5Ti1cfnrImMr0kf1J0rUSqlz2z/zh0YkkZm33A3+qPpJuV8CJzwPuyAA19m?=
 =?us-ascii?Q?8nM4ZEIlILwvdl94x1HvhUz1MA22bB/S2T6qlASNNpfJvdxyQx2K/JLfMr+S?=
 =?us-ascii?Q?Hn1cARi4JPOuzLJilLp/8ivrrbP2eA5isbQ3slFfsNUyeluaCQIg6e4vqivB?=
 =?us-ascii?Q?dkEY603f8hXugDNj2HCMPgrnZwzr00Su+fTTsM+n9pK2/cusXALpy1jPuQUW?=
 =?us-ascii?Q?+18upH+rRmAxIVcUjp1mTjo9cjeuaxo0sqKnfGvHRZEnUEsbyTSU6y0R7Btq?=
 =?us-ascii?Q?z+DNwmpOXBh9PUjnxKh0pkeAnmbZ+nfV45wfcwGtSABvm1bQRe3qkDS7wTv6?=
 =?us-ascii?Q?LmPc2/69DvwjTS6nymeiV/6LXJvEriFy3B3ptPQ1ew9qIyc5S0CqYYoqdEgJ?=
 =?us-ascii?Q?Q0Uy0BRAZqy+hR7coRPb/m95vxhLBFlLzbySXgoGD1qqIGBe4TpDQg+VWG23?=
 =?us-ascii?Q?Hm7daZG4PQirzf/17rldJi3xH2QAUfd4P4tmXsYXSXi8RTRbU27fel4598wx?=
 =?us-ascii?Q?J/idkF+GQs9kfmouOklKDZTBZABdEE84x6P5xpDIK5SfqV5bvj25eqCfETqM?=
 =?us-ascii?Q?59hKHeZxm+n5B7d0DhsNWCuuMWpK8qHJvq4j1RIHY668/wKVNcZgtIInlRDA?=
 =?us-ascii?Q?0K7F42CIdUQn1vYMpOUFIi+HX/ogwCS5OgxD+ktuWiYvJVIVbl0FNuL7v65M?=
 =?us-ascii?Q?BYU00L3/VevJxsZx2wJyglRPId4qVubq6/N91GnOVlRMUr8vtcE78o/2vYa8?=
 =?us-ascii?Q?D+sVxiOP8bqnFMYO3V+/f3P6iehiUhy0eIqIe8dbTLjVB7WsjUbqM87rX+l5?=
 =?us-ascii?Q?q9trRkFKWdoU5dAY5zTlV3H5VIQLjsMUrZFrNhaDeFyP4bxLu4ERlN/vfT+t?=
 =?us-ascii?Q?+QD/JoW6/6tL6zT0Ai2TNmC20PZD3BtRijVge01HWartN6YTiHJ3OUSrld0S?=
 =?us-ascii?Q?ydrQqbfd6zy5d9omH3zxFaW/sNY4vWwmmEcS70xyHeMTF2ypovUsrkM0g4BN?=
 =?us-ascii?Q?6+3UqRI0mqR49qPdLHFkiD/D1Lqha4bGbprB9fzcTsW7CUxZZyRw+VMzva0g?=
 =?us-ascii?Q?Y3zDWo6NSpi2GCMEZSTW4NEd5FNhcGqKm4tISHQ8kDbrR0uZpRo08Uy7+ySp?=
 =?us-ascii?Q?UiuSOnwlkAAOL85wKUBxeHOJWGB9GUjTrIlut3WsZPU6HgCb1YCln9mgm4Ft?=
 =?us-ascii?Q?vK/84lB4xwq8xI2S/E7KjUARh8bAsiG1S3S/XwxXTvKa/4rjx68gSfPVtGvp?=
 =?us-ascii?Q?gUh1teeFwzkNHG4nSemvtVJtYiIwBL31WnzLhn5esMFPAw4JdfPcQYyKwyqV?=
 =?us-ascii?Q?xjAhqb6u3JY6cuh/AVuhdUFpCfNZ27zeEJVoug5AIJ7U6kkIYX+nVshCFJbu?=
 =?us-ascii?Q?apMuQ6YcGwO9LDMcGJ1DuAdWNt0RVOjmZurx4YPWbbnqKEoR24TQUav0qs6r?=
 =?us-ascii?Q?BroJXmdRbNJjaxT57PjnHbPOCdLWAwAXmX4voq6CunyZRdBg55nyRMib1MXS?=
 =?us-ascii?Q?wkPUfWO1QEDZG1VJesUcKis2jDN/mHo=3D?=
X-Exchange-RoutingPolicyChecked: pnfw+uHFEUOzX40hxbEacn/XZB0nNxl/BkG22yOfjLyER2WJhPHmVFekBKl6P8P/bNUQiIYXpoQyGh5TueO5jCW+16qMQUV8pBZWq1xPw4/GoSDso1RoXWTS6lCBjf3WWzfcJMoLa0kotBzMasuoiPsIyGxw3pz7AqNW20LTAe67ZCvAHDETZZNyHabWh36YinWhIsEYW5NzrLfLQCotxkNaWFavdcuoaZSWeH/7DOOEB/yag/pOxWMFpY4sp1vojgc9cHQO6DoPXF/NV9hb7sO7x7996Z8HTQZYzyyU2UFQQkSVTDS+R4csp9ecqAOstSTWXfFrI9u/YI18nQmTyg==
X-MS-Exchange-CrossTenant-Network-Message-Id: bd7c3719-de32-4342-47fd-08df1b602278
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 23:53:02.1194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2XaU9cA75m2X8n+G4+2vJu9efh3ezRH7JdPS91Ssw1MO3jpDrKOzRm9zspHACEwt3bu0DFZgJhtMz13joxqNFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6252
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

On Fri, Sep 25, 2026 at 11:27:58PM +0000, Brian Nguyen wrote:
> Add a print vfunc to xe_pagefault_ops so different producer backends can
> log specific relevant debug info while keeping the consumer layer free
> of potential backend-specific formatting logic.
> 
> Consumer-specific prints are handled separately outside of the vfunc.
> 
> Suggested-by: Stuart Summers <stuart.summers@intel.com>
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_pagefault.c   | 35 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pagefault.c       | 33 +++--------------------
>  drivers/gpu/drm/xe/xe_pagefault_types.h |  8 ++++++
>  3 files changed, 46 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> index df237fd40551..7e4f0df1444b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> @@ -4,9 +4,11 @@
>   */
>  
>  #include "abi/guc_actions_abi.h"
> +#include "xe_gt_printk.h"
>  #include "xe_guc.h"
>  #include "xe_guc_ct.h"
>  #include "xe_guc_pagefault.h"
> +#include "xe_hw_engine.h"
>  #include "xe_pagefault.h"
>  #include "xe_pagefault_types.h"
>  
> @@ -68,10 +70,43 @@ static void guc_ack_fault_end(void *private)
>  	xe_guc_ct_unlock(&guc->ct);
>  }
>  
> +static void xe_guc_pagefault_print(struct xe_pagefault *pf)
> +{
> +	u8 engine_class = FIELD_GET(XE_PAGEFAULT_ENGINE_CLASS_MASK,
> +				    pf->consumer.engine_class_instance);
> +	u64 addr = xe_pagefault_addr(pf);
> +

In general if this vfunc is in the producer layer it should extract
everything from producer part of the page fault otherwise the vfunc is a
bit pointless. That said I do think a vfunc makes sense as it could have
more information than the consumer.

Matt

> +	xe_gt_info(pf->gt, "\n\tASID: %lu\n"
> +		   "\tFaulted Address: 0x%08x%08x\n"
> +		   "\tFaultType: %lu\n"
> +		   "\tAccessType: %lu\n"
> +		   "\tFaultLevel: %lu\n"
> +		   "\tEngineClass: %d %s\n"
> +		   "\tEngineInstance: %lu\n"
> +		   "\tSRCID: 0x%02lx\n",
> +		   FIELD_GET(XE_PAGEFAULT_ASID_MASK,
> +			     pf->consumer.id),
> +		   upper_32_bits(addr),
> +		   lower_32_bits(addr),
> +		   FIELD_GET(XE_PAGEFAULT_TYPE_MASK,
> +			     pf->consumer.fault_type_level),
> +		   FIELD_GET(XE_PAGEFAULT_ACCESS_TYPE_MASK,
> +			     pf->consumer.access_type),
> +		   FIELD_GET(XE_PAGEFAULT_LEVEL_MASK,
> +			     pf->consumer.fault_type_level),
> +		   engine_class,
> +		   xe_hw_engine_class_to_str(engine_class),
> +		   FIELD_GET(XE_PAGEFAULT_ENGINE_INSTANCE_MASK,
> +			     pf->consumer.engine_class_instance),
> +		   FIELD_GET(XE_PAGEFAULT_SRCID_MASK,
> +			     pf->consumer.id));
> +}
> +
>  static const struct xe_pagefault_ops guc_pagefault_ops = {
>  	.ack_fault_begin = guc_ack_fault_begin,
>  	.ack_fault = guc_ack_fault,
>  	.ack_fault_end = guc_ack_fault_end,
> +	.print = xe_guc_pagefault_print,
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index f9e5bd41cfd1..298a67268c0d 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -13,7 +13,6 @@
>  #include "xe_gt_printk.h"
>  #include "xe_gt_types.h"
>  #include "xe_gt_stats.h"
> -#include "xe_hw_engine.h"
>  #include "xe_log.h"
>  #include "xe_pagefault.h"
>  #include "xe_pagefault_types.h"
> @@ -607,35 +606,9 @@ static const char *xe_pagefault_error_to_str(enum xe_pagefault_error error)
>  
>  static void xe_pagefault_print(struct xe_pagefault *pf)
>  {
> -	u8 engine_class = FIELD_GET(XE_PAGEFAULT_ENGINE_CLASS_MASK,
> -				    pf->consumer.engine_class_instance);
> -	u64 addr = xe_pagefault_addr(pf);
> -
> -	xe_gt_info(pf->gt, "\n\tASID: %lu\n"
> -		   "\tFaulted Address: 0x%08x%08x\n"
> -		   "\tFaultType: %lu\n"
> -		   "\tAccessType: %lu\n"
> -		   "\tFaultLevel: %lu\n"
> -		   "\tEngineClass: %d %s\n"
> -		   "\tEngineInstance: %lu\n"
> -		   "\tSRCID: 0x%02lx\n"
> -		   "\tError: %s\n",
> -		   FIELD_GET(XE_PAGEFAULT_ASID_MASK,
> -			     pf->consumer.id),
> -		   upper_32_bits(addr),
> -		   lower_32_bits(addr),
> -		   FIELD_GET(XE_PAGEFAULT_TYPE_MASK,
> -			     pf->consumer.fault_type_level),
> -		   FIELD_GET(XE_PAGEFAULT_ACCESS_TYPE_MASK,
> -			     pf->consumer.access_type),
> -		   FIELD_GET(XE_PAGEFAULT_LEVEL_MASK,
> -			     pf->consumer.fault_type_level),
> -		   engine_class,
> -		   xe_hw_engine_class_to_str(engine_class),
> -		   FIELD_GET(XE_PAGEFAULT_ENGINE_INSTANCE_MASK,
> -			     pf->consumer.engine_class_instance),
> -		   FIELD_GET(XE_PAGEFAULT_SRCID_MASK,
> -			     pf->consumer.id),
> +	xe_gt_assert(pf->gt, pf->producer.ops->print);
> +	pf->producer.ops->print(pf);
> +	xe_gt_info(pf->gt, "\tError: %s\n",
>  		   xe_pagefault_error_to_str(xe_pagefault_get_error(pf)));
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
> index 8ae6b9848bdc..72568ab9686a 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault_types.h
> +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
> @@ -139,6 +139,14 @@ struct xe_pagefault_ops {
>  	 * Page fault producer ends acknowledgment from the consumer.
>  	 */
>  	void (*ack_fault_end)(void *private);
> +	/**
> +	 * @print: Print pagefault info
> +	 * @pf: Page fault
> +	 *
> +	 * Print pagefault identification fields for the fault.
> +	 * Must be implemented by all producers.
> +	 */
> +	void (*print)(struct xe_pagefault *pf);
>  };
>  
>  /**
> -- 
> 2.43.0
> 
