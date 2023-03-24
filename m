Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31329C6FD1C
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 18:40:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BAE210E188;
	Fri, 24 Mar 2023 18:40:47 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F0B410EC46
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 18:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679683245; x=1711219245;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Vnwmrs9YiEG7i6axRVIdQJiYyZ4FK8g9rDAQnlGX7pc=;
 b=Hcvq8nDR4+BsImkxopGe7eFf3gIQDUb7rvHB68wMUNhd1Vx64r1OfHZH
 PiyV/zgpvJ9oGHCprbfsRXb9L9R+aNNAzs3zf3GFWMbURvmY5nhiGhA42
 Yw+uK6tAqWPMnk2bYXl+ojg3oPGGwfelJr6kNlEYqxaSMDvsmRI9wnJxR
 vEe1W1mxBbw2uo0pbt7H/M8dfwyX0T7U5tMP6ExFL0u4accOzp3LJhTHw
 VnWh3cmYf0svsVmteVZbGga6/t2fgR1+qzDIww6Jl4JpceGSRR+1aJWQ3
 GzBLozjC5G9eRz6AnwdpTe1Ho6rafYLJ2cenCZ95/ZVEetlOpEvdEp4Es Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="319508289"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="319508289"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 11:40:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="676256147"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="676256147"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 24 Mar 2023 11:40:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 11:40:43 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 24 Mar 2023 11:40:43 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 24 Mar 2023 11:40:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lto/Fj+LYNPvmQHhiYOZuijGwcNF4N/7FiufAUDqploBvjeierbAhLfgUKM/0Xb9uVlnHgsU6e4tUfnFOODNlivC4pwC/Gvg0xGeR9Uj7ZR1E18w+hNiNpT1jmQe5ydyegEn1PY2n7RvYv1YiNyLLAo1pY3287OGqEBaBEinq8+UzpmkkfmXf/adY8qhqVPLf2EoLkJRefw/yzNRJhBlGTmmMCaHhAhWq4SXHQMPWPZ6eiljnwVSHbXYoNZ8R2V+e485IWuWMXv22gfag/V4zPxB5U+auRDDe0BT9/2ec06MCvb+I1yXtCarKe5yo1Tr9azXJEi/O2qH4QnhpZWBwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DRohx3yJ0hJdJyhZfuTystnAF/ccZxS42EA62FnZe7g=;
 b=gE5IRz2lfu85o9YMg9ki4JMtyh0uNfBQl7xYb6h07TCINa8JRNN0uD+6FjqV/QfGzvbzCc/BQJPOEFzR0acJNQ4rPIHcOm2gSrpyJStxzX9jhfqrVAnWuzyGHNl3WGpsQZn3LtUFmjypocCroUsfLRWXW2W3A9J7je6QvEHb6mBcebfquoPhL8CUEr6spq9gFyzBAcM2ITS9HpWFHiexd++haZVxbiVxy5XfH2abzWUPHUO64Bg4xsegA0DM27paGVPR5WjyE0nPow6/4g5xSsgU8ofG62AiFx1K8dNpa6iPOLB1oWBIhnlk2FvQfS7GBe1ladMQkFSz2mBoCfBZKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH8PR11MB6903.namprd11.prod.outlook.com (2603:10b6:510:228::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 18:40:36 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6178.038; Fri, 24 Mar 2023
 18:40:36 +0000
Date: Fri, 24 Mar 2023 14:40:31 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <ZB3unyFtQlmOFZHS@intel.com>
References: <20230313080117.2320-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230313080117.2320-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0146.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH8PR11MB6903:EE_
X-MS-Office365-Filtering-Correlation-Id: 041a13e3-ded4-4a63-8bf9-08db2c974202
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q2GdQY1F1Q7ikVSiGxkjiJ6xGP1meAb/0NKQy8+oguFsjZpWdTzZHnVui/hm2XVhhNEsic9ni0CwOhrsmO3nziu9c+8+s/bKeEfNihWlCbtpPAbhRf+iJuForFB2DfZ5Svs7PjBugNgMlJgKIlX5KUtxjT7QkwVHXx322OvOSggy27u8ExCndAmn4H1rHR4wUx/UCpRBAeWPkd6rrIc7cf1KGrtLYAfnJaCKEiebNxHPmKv087KDKu4zYn9Jcu3bf2mip9iQO8lJIO6uI0eIbLjn75KWsVkcaJwu99ChNy1aiD9n9/6nKxBJ/FPAKeSKUs9Luqc++qwDM2oU/ndxRliZU5lRHYu/SXeV/OFabsaOqQrk9MIaF6z79pc9ujj1B2hZAMVHWhJN/2nup67dTBcYSOG9kVpgGvmXAI/HMywdXEjnty2XDS8XWW8qDSCJiYPCW2XkCqr16/XNm8QcGxRUuv+jvzMgSHoqYet9OJi75zv4GMQxIGwch7fpbP+rgE4vKBtAod8f4T8W1knWCtclY6y8ywaGC7fTi0AXwOthnPvgqNho5fVAwcUrcjnYquE8gw34a3+38k5Kf7i18SknXhn1gcuwsibpSlOSrprZYZ5eFh+vKao93WXn09aQ1muMkWYyklNaCLcDuL1MiKiIFm0g4HaCXDYbnghGiE4SKTtW+KbvPTXhbg/LiKfcV6+xSWl0S2f39bRXlkryDw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(376002)(136003)(346002)(366004)(451199021)(36756003)(6512007)(38100700002)(8676002)(26005)(5660300002)(6862004)(8936002)(66476007)(316002)(66556008)(4326008)(6486002)(2906002)(82960400001)(44832011)(2616005)(66946007)(6506007)(41300700001)(83380400001)(37006003)(86362001)(6666004)(6636002)(478600001)(186003)(142923001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+Jm4bvPAFHGh+2snElQwb6/P4gPZq1A0CCnrfEaheh20XCpHSstiAZggkqub?=
 =?us-ascii?Q?PbY+VWREuadQMwBKCeBWvYQ8cXIIxPwcbQFEwZk44N3hTV3Q7qNXIrtRPT6z?=
 =?us-ascii?Q?jM/DtUuzPrfYDgcI642esTeTC1fv1CJ9Xd9kCAPSvlm2XSsJ7VHspyduEKQL?=
 =?us-ascii?Q?Eo56aoaWYq+MedVH2rC9SHaOdpw+AfQ3L+TOkIfV+XBvgjvwfo6I/XNRUJz1?=
 =?us-ascii?Q?B7IrQYtzzR++HE9/U3kx8VlGXCLKt7A+kmTcq+X1EfumJcfRpiU2kfMEqTqN?=
 =?us-ascii?Q?41CZxF5N6SuBe3h+jIU67BCIPVoWvpBEFx2iiHmmkMZz9IXUYQl5mzDL6x2M?=
 =?us-ascii?Q?z/4EoyI2GicLXZ4Escu4/RZF4Ofo9KzM+lexwoch1ENp+33SG4+6dzKgz+5q?=
 =?us-ascii?Q?JmnnIB0vbZ0+CnWCmpUR19CBX50S5iZntGaX0Lyujn/7uW4eY9bgBCnewLWA?=
 =?us-ascii?Q?ljEiayT2vBeovQsR2byJ6Y/Rty23prt99ipjNzlQxRhIHCk7WP/IaYhd/EWT?=
 =?us-ascii?Q?ZhGsiS49INBJx3SefV4NnqIf7fOOpdCeRTRU+raIj0K93eGCXBgo+VeqBucV?=
 =?us-ascii?Q?aOGfbqPwj1yeLnDkS4U4i93FLzWkc5Q2VsLH/RCcp/oXTR8u+jJnyBtZ4yTY?=
 =?us-ascii?Q?hoIFHrtbdxOY0beselzhR+PHZxh6UhfopwJHu8DwyIJ0Em/9BikjDzW1tCsE?=
 =?us-ascii?Q?AWwJ0gp4EC7JMl7CbGXK+J63qWxYLI7tUQwmBtMfuY+ram+f2gYwI4VbbqYM?=
 =?us-ascii?Q?UfJ099cNB5L9jsvG4U73oPFOpMdqJ7vCVvA9Z17pOxixuuLwHzexg0JYOMoJ?=
 =?us-ascii?Q?3I5muP7E7fxyo1Gj6NNcvQ5q/C2Z2me+cpK4tG6dmmH27YXTxgqJz0msvK5h?=
 =?us-ascii?Q?Do7VanxjxULL+YYnToxGzo1wIYyJPz4CFbt18/25uOh0lmqcXctHIcnI0t5d?=
 =?us-ascii?Q?Env+KhNyVqw3tQjGBKeJKP03mXkfVgNwrT6elbxObSBJEdJ4J8qwoJxpU6ZD?=
 =?us-ascii?Q?m7DEDajtRX4zhcNFtOspPs87DNWZM+jTJn5vHfwxLcif1eY9MGUgO58STwoh?=
 =?us-ascii?Q?hsYQ+trm016Cz3reWx/pSdDBKHeIPvdmyKPDEvL7F9/VZU5CxMS6526ZdjII?=
 =?us-ascii?Q?rGuzAe6hIVGm+uGBhDU8LzW8Guw2o0PMIILCOr8eR3qxiUIQ+G3/pTrUrBZM?=
 =?us-ascii?Q?Qdpwg3XOV66XCJrQUKNoYWphEfnzpxdiUf9yAL9o7kL8pRQEdmFneHSjy6n5?=
 =?us-ascii?Q?3ci1Y2b2lPAi7mnHyXAc9xZ4blfZStSkcB5vi0UCSGaMe0G5818LsEPgEOyk?=
 =?us-ascii?Q?DSuwAYlOu1IiiKsiduWr5i2JNIc7jPwYAyF6SNAKp3RxggbwCPjwBIVZom4I?=
 =?us-ascii?Q?be7qsUXbhiMd3r9vBaG3Jqn+fCx5p2BcO0BY9oTa297UEhJEm6LkPoPcQy6U?=
 =?us-ascii?Q?f0Gm8/TO3XbxTUJorYaV6KLyQB63uvPk5YyyLS4FO5E6eIl9JyGv2zGbGIjU?=
 =?us-ascii?Q?379Es/T2IVcLeEQnvSaWt9glky5vj5LbL4xP96mqJ70ZsxX3ZrqPdXTnQ1ua?=
 =?us-ascii?Q?Fv5g+5yVSebedwfN/IVj1G4dM8v3rmHyUA6q+byy7jK2GRyCLW5yx7BYpsCz?=
 =?us-ascii?Q?bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 041a13e3-ded4-4a63-8bf9-08db2c974202
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 18:40:36.5464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ohdyY+qh+VqFBoxyOEd778VSGSnPknAU38b/R+sFKau8Zb7ZORRbFYLwpMbP6Nn30GimtfLu76VFjuWOt/fjZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6903
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Promote guc_to_gt/xe helpers to .h
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Mar 13, 2023 at 09:01:17AM +0100, Michal Wajdeczko wrote:
> Duplicating these helpers in almost every .c file was a bad idea.
> Define them as inlines in .h file to allow proper reuse.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c        |  6 ------
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  6 ------
>  drivers/gpu/drm/xe/xe_guc.c                 | 12 ------------
>  drivers/gpu/drm/xe/xe_guc.h                 | 11 +++++++++++
>  drivers/gpu/drm/xe/xe_guc_debugfs.c         | 12 ------------
>  drivers/gpu/drm/xe/xe_guc_hwconfig.c        | 12 ------------
>  drivers/gpu/drm/xe/xe_guc_submit.c          | 12 ------------
>  7 files changed, 11 insertions(+), 60 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 1677640e1075..2ae54fecf4ab 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -58,12 +58,6 @@ struct acc {
>  	u8 engine_instance;
>  };
>  
> -static struct xe_gt *
> -guc_to_gt(struct xe_guc *guc)
> -{
> -	return container_of(guc, struct xe_gt, uc.guc);
> -}
> -
>  static bool access_is_atomic(enum access_type access_type)
>  {
>  	return access_type == ACCESS_TYPE_ATOMIC;
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index f279e21300aa..259382d54871 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -12,12 +12,6 @@
>  
>  #define TLB_TIMEOUT	(HZ / 4)
>  
> -static struct xe_gt *
> -guc_to_gt(struct xe_guc *guc)
> -{
> -	return container_of(guc, struct xe_gt, uc.guc);
> -}
> -
>  static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>  {
>  	struct xe_gt *gt = container_of(work, struct xe_gt,
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 58b9841616e4..8fb2920d96da 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -22,18 +22,6 @@
>  #include "xe_uc_fw.h"
>  #include "xe_wopcm.h"
>  
> -static struct xe_gt *
> -guc_to_gt(struct xe_guc *guc)
> -{
> -	return container_of(guc, struct xe_gt, uc.guc);
> -}
> -
> -static struct xe_device *
> -guc_to_xe(struct xe_guc *guc)
> -{
> -	return gt_to_xe(guc_to_gt(guc));
> -}
> -
>  /* GuC addresses above GUC_GGTT_TOP also don't map through the GTT */
>  #define GUC_GGTT_TOP    0xFEE00000
>  static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index 74a74051f354..96f6e3f46ed7 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -6,6 +6,7 @@
>  #ifndef _XE_GUC_H_
>  #define _XE_GUC_H_
>  
> +#include "xe_gt.h"

sometimes the duplication is better then forcing more dependencies then needed.

I'm really not saying that this is the case here... If we are sure that the
xe_gt.h was already affecting all the cases that include xe_guc.h then we
should go with your patch...

>  #include "xe_guc_types.h"
>  #include "xe_hw_engine_types.h"
>  #include "xe_macros.h"
> @@ -56,4 +57,14 @@ static inline u16 xe_engine_class_to_guc_class(enum xe_engine_class class)
>  	}
>  }
>  
> +static inline struct xe_gt *guc_to_gt(struct xe_guc *guc)
> +{
> +	return container_of(guc, struct xe_gt, uc.guc);
> +}
> +
> +static inline struct xe_device *guc_to_xe(struct xe_guc *guc)
> +{
> +	return gt_to_xe(guc_to_gt(guc));
> +}
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
> index 6b72db4d5bb2..dbb3001db928 100644
> --- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
> @@ -15,18 +15,6 @@
>  #include "xe_guc_log.h"
>  #include "xe_macros.h"
>  
> -static struct xe_gt *
> -guc_to_gt(struct xe_guc *guc)
> -{
> -	return container_of(guc, struct xe_gt, uc.guc);
> -}
> -
> -static struct xe_device *
> -guc_to_xe(struct xe_guc *guc)
> -{
> -	return gt_to_xe(guc_to_gt(guc));
> -}
> -
>  static struct xe_guc *node_to_guc(struct drm_info_node *node)
>  {
>  	return node->info_ent->data;
> diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> index a6982f323ed1..a89d26565fdd 100644
> --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> @@ -13,18 +13,6 @@
>  #include "xe_guc.h"
>  #include "xe_map.h"
>  
> -static struct xe_gt *
> -guc_to_gt(struct xe_guc *guc)
> -{
> -	return container_of(guc, struct xe_gt, uc.guc);
> -}
> -
> -static struct xe_device *
> -guc_to_xe(struct xe_guc *guc)
> -{
> -	return gt_to_xe(guc_to_gt(guc));
> -}
> -
>  static int send_get_hwconfig(struct xe_guc *guc, u32 ggtt_addr, u32 size)
>  {
>  	u32 action[] = {
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index e857013070b9..6b3159e75be9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -32,18 +32,6 @@
>  #include "xe_trace.h"
>  #include "xe_vm.h"
>  
> -static struct xe_gt *
> -guc_to_gt(struct xe_guc *guc)
> -{
> -	return container_of(guc, struct xe_gt, uc.guc);
> -}
> -
> -static struct xe_device *
> -guc_to_xe(struct xe_guc *guc)
> -{
> -	return gt_to_xe(guc_to_gt(guc));
> -}
> -
>  static struct xe_guc *
>  engine_to_guc(struct xe_engine *e)
>  {
> -- 
> 2.25.1
> 
