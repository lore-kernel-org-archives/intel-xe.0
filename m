Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A56C3CA5FA2
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 20:53:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4533210E99D;
	Mon, 28 Sep 2026 20:53:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OgZZfJY9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F46E10E99D
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 20:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790628834; x=1822164834;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ho6IlIZzFRcJas1oPhYAmu4kH5oZyIFHgOWiXcz3EBU=;
 b=OgZZfJY9c/m9o6/MlDHzErkdknfBt4Xslm4kigVxgWvTZjKH/YWRlAjc
 OGhYY1SpAnIwabRNGyNohC18MFxkyU0dMqkE6Im5Xn5MRnCtPnVjj7lZ9
 wDlbqlm/OIKRLszy3MEd8Goa4xHqt0pX+pnujWiFi4X0GeSuBbg23GdTT
 JMrsYIWBYcy+QEru5ujLWeTfTwNrLgIrVcd8xjh4vyl2dmSN15T3STrL4
 slbn7bJtLZems7RcuGAJDIVYPUlIf/1Fm0Cx1HyojQCf2eenGWZP2dXDU
 dz/vGwwhT868zj3psnGT96iFblWDsU+UVdhcr4ANYUzbXAyGzjvl1P8WF A==;
X-CSE-ConnectionGUID: VoqAaj0NQFiBv8ThClrFZQ==
X-CSE-MsgGUID: kFsP0FAmR/Sm56kzM+up6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="101998177"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; d="scan'208";a="101998177"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 13:53:54 -0700
X-CSE-ConnectionGUID: IK0FuZhRR5K7/27fTrLHvQ==
X-CSE-MsgGUID: CBVIqtPGTCW5QHnt8koOvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; d="scan'208";a="274671610"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 13:53:53 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 13:53:52 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 13:53:52 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.11) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 13:53:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QGULEuGz6ZiM3/vMjjiu8LdIKY7ZW5K+h7RMOW0439lne1pp7CHAMcm7babSyKGXopKoxSwHy8oTUw3aQBvLpjVyA7/s8yda2JR7jb99ofExXRSUSHZsT083+OiE+tdhIqWN7yIJ9Yg98x2W1KXiZ86pLlzoPZQo1O/CvZQsPAOIX3lKzeA67iLXucLQcEqycX1zSd2eb2zM5qb/V7N/UxuFTc2880GXaxCdXZoEa8us/jyyCbD+vOKcbmjcH24KMbDZ1UzVD5AfQW5IZkEtAfV1JgRZTQZO25OEvnZmimG3f7OPaJa0t/WNE4MPAvIszO8TXs7DnNSJePkj50myoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bs6GfdegzlFkKzjmbFvq97yBd6USQuUrUfHkFfWP+MQ=;
 b=k/MDc3j7+HDYIgkX7kv4mXWM0b2x2rZKMANqGEdmNE3Wa3b0U2jzwwTeLdBSTQcXFp/zrjh/PWSQi3kmtOk7byIF7qonIULmLHR5AHMkTxY5/NozIdW7QBkiz3P86QekVs0BrPYqr0kwyNEbgLFq2bCF/NLjrnw5zLKMJchCYBLSgB0qDYncS2UwjmPjgvYIt9zCZLsYcacUWHr2l29r+tc3N+g9TXTfKVKIkkpZsgBYcrGUlfeAvkUjrrnuWNYdBBsiU8iZlI6nqUx8OQAjK27JGcjbd/EzdS55608jJZKXe4vCfPkTEnPggVpzOc/ggVPXiw7lDvrYIIQ4V4uS6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by IA1PR11MB8788.namprd11.prod.outlook.com (2603:10b6:208:597::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 20:53:50 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 20:53:50 +0000
Date: Mon, 28 Sep 2026 13:53:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Nguyen <brian3.nguyen@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>,
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2] drm/xe: Implement print vfunc for page fault info
 logging
Message-ID: <arrT2/evj15NQc/X@gsse-cloud1.jf.intel.com>
References: <20260928183120.3788244-2-brian3.nguyen@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260928183120.3788244-2-brian3.nguyen@intel.com>
X-ClientProxiedBy: BY3PR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:a03:217::31) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|IA1PR11MB8788:EE_
X-MS-Office365-Filtering-Correlation-Id: 646967e3-aa9f-4c27-70e5-08df1da29926
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 3G+8d6/8BJV6aGe/+8jH/RQk9TFYr0aatjFHpajFi1FIluPtrh3a6Ld7KbnxnoNVQhEieZm1CZczIRYJ6GR55DYM1m/pD49YogbdAxPFyococXddKtl5UyJLX63NayZrIIg5CVC3XjCfNCozmFMMugzT6/ZgVn2FSFRyUSxrXA7emHeYl7yPwqxwDv5LRLwYG38mZ/TbsVpL8VkDrlSaxzWrsSGWlHYbsp25u05/U/GBrhMBKH+NBkFEx+lBvWBfPhz7LhOZJITgmchWalnWDYtifIqTggwOdHG+ZMm85GEEyt7j9CJkTFDlbb2iE1lVLZE8OX0fWK2EyPP2EeY9p41d04Q6l4KTC8sugscMRpZA/XBRHILqe81SzFXbQw5NkB1PlNm8iWoVfUZv8731Lz5AwulxJE2poaWjy5FY0CEAPbOxoeEBf1yXnauObOc8EzSyPTZBuwPWHxFlgKvWMTlvk9vUHBqmBYhLAbXEmlYG3TD5ktBh8DC4p3Z88YSmu+ln/iu9rSH8kWFczvnIvVsSavSra9Dyma0K8LV00WexJfY1Chul87z0iB0IzYMowmL5BQTniIItOvSGKSzFP7WYPZKvLdjnT1l90k44PyC965wjuzNLnnbLJvrjOoivkswtJjQ5kZvmJoZzCF9Bl/HcwoqMmn9v3o/20f+Vbas=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?or/b/4I39TOSoYDMYXlTWvu1DIFjsWvPrphiOytUGQz6BP9Zzu1GyJw1S4Ez?=
 =?us-ascii?Q?Em0Em0AdCHrwS7OJiw38VKMwDGLMYC1axke/7oOrYuFWlYS1k/fgsvezN3To?=
 =?us-ascii?Q?8uEfgZGK2zWU2+QI4rnv6Yy1XAgl05JjWBf/EVdzshYGq95YIBL/mJNLXBlV?=
 =?us-ascii?Q?sGB3B9Atqo756X3DX76Rzk81ydYkd5adZYC2vFMukjMIZawLRMWtVJk2V96k?=
 =?us-ascii?Q?cUzxW6LzX17OGzBn5tLAZtWrsBMw4ZaNxpIs2NvpOc/7buhmkrsUg5adQSFY?=
 =?us-ascii?Q?rofIPn29ZpGwKEJsLamgK6EIKhh8Qw4c4kz4L+DIGW5bqWCRgDOWwqg8qA1G?=
 =?us-ascii?Q?bcEszmpmAX71sTBW4tLSp9MehZU6gAdH1u2R/iB9xQizpDw7v6BgqNn104SG?=
 =?us-ascii?Q?EaUPOpeiwYDtcrKUd6JiLPVLcmeGzeImRatHFJEg5oa2GTYzM7ANuI0Ig5n3?=
 =?us-ascii?Q?S+BGgGVt1KHXVeZUhTSeTfwL9wZ7emsc+1T+ucL5d7CBzuGsEmIBMPENKE7X?=
 =?us-ascii?Q?Dcg/LdgYr8tSKHpXgBgsue+mX4UZ0XkK+gDcXeiTBeEVpHOIiJfPYj7Xa0zp?=
 =?us-ascii?Q?6bq8eAPdLaIJ/1m0LpqgzCGQC+AQNbJsPtRD6KcbubLigRVtRwoX0g73tiQi?=
 =?us-ascii?Q?OV7tLlfosA7/aJdKb/raYSIrRyVRDLXBTi3jk8JHt9m0jYPbex/4zApQjpnN?=
 =?us-ascii?Q?ksuUrqacIDzmoGJC/pGOPfS8UwFK23GlF+kz8Dqe+D2oa4KT/Om0Lr2zRO4F?=
 =?us-ascii?Q?G3mPY/d2Q5FthpLK8rU64XwXM115zO6NzY9ZYDO4kBilx52oSLvlx+L2Tbti?=
 =?us-ascii?Q?RbbWwhUiQW6YA6y0/Wmqs0IgnSOzGXCGYSiA5laJINRM745+M2WD0iKER/Hv?=
 =?us-ascii?Q?hep+rR5K8NBvr5Dki1zPNqRc+iR78gQobGZc6u7CgBR3xMwh53VQiIZz9OIY?=
 =?us-ascii?Q?ZJ6vIAmFWri0p4u135F1zMrtc+HQVHb+RArDNm+Ed3qL5tmhdekcavnPAwct?=
 =?us-ascii?Q?8BGszE6cx3zoOsE80pKotlx5DqrisUclf4ZEdpFXSm+xpuQm0BfrRpAhffDH?=
 =?us-ascii?Q?dyW3bYIdIgHpcPRVpozmg8Topyl7IcJvUhGmNw84yxFXAUan8xlFMEwr5yYA?=
 =?us-ascii?Q?yGh0ypZtJfTwtle82ZnSSOpXGj1AXexUmQSi0WWzj0qTmUHRXiWY3bz87E2t?=
 =?us-ascii?Q?sjrhjCm/hQ8Ub62CWvZUA1W7SZO9FRb5t0Q31cnLfCbPMG5E5sj7as1CK4Ao?=
 =?us-ascii?Q?CZpNDlXUu//n1GvoPtS1jzLCfckJLnmEzFXMqis7kbaEHOu6s81DYOeOI+sO?=
 =?us-ascii?Q?9DDEvh3nyX7YWPROAB3esPg9I654JNgqQrKTP7831vOfv2o2M8tw8Y7csurX?=
 =?us-ascii?Q?X+u/vwEukvtR0z3RYVVRHVNbEiB+58fkb/obJqE3i8d8k6CcQ2Xw7nNAEDkf?=
 =?us-ascii?Q?HNfc6zwVc+ZY9RdpNzknd0Bp+Vcvp/xtMVwQBqFJqieE6YqnrzKFtTYxCA70?=
 =?us-ascii?Q?vB91rbr8YzTk2epFbXlvpfbEH4/9rXnGJeOUyScpJpO26I1+/FYGUvLNJqgO?=
 =?us-ascii?Q?4OMND5aai5WM7Vg2R8fQeT46vo8btwL8f0gKHK3wfEIhB89f9DB/D0mFWKEH?=
 =?us-ascii?Q?fFCtlr9touotEyAeIuCoxwHNB0ao5ESr7c0O0fqfhgqZfH+C2V4pOP2gHA0N?=
 =?us-ascii?Q?JY7r7TTziNfGayZVMOstMzw9bqQD112L08akHAFk8TNIaBqkvin99kSs5U+a?=
 =?us-ascii?Q?bHJdu5S0OA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 2jk173kC+BsoXbH170a3eorRgK/RNk5tgfaJtWhToyYzb+dF1yLvUgeRPvX2A1ybt2HOY2QUKPjd22Qd74byKULDIhTi1tiFJ82OXGBTdZlkEESNAbdYzLcbJX5apmLeAgZijse4iIU6HgYs3HPZpY90oX1xjMUBCYFOAv5f2gvNqgOUEr7g6ZHzUwc2Z5Ku6F5OnL7gn7xal0NgGfH8zJX4hSo7od2AhuABG+WF2rsPX91s4YT3qVdz4Q++o+3nh7258MSe5wciiupxPVToN8cl3w8bq7lG6EstX3AQr3JkCbzuC17xh3PZfyCk0+ZycmaiYUCAM7HcQJCU1lffnA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 646967e3-aa9f-4c27-70e5-08df1da29926
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 20:53:50.2859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rK4T2lZNvkOZZM4vyFN9BJvAtbi5oOd73Oi8CvMdnRtEfAwD+byQ6DGVK0hVSQ+xZLUhrS49MVvHXrs7gWz6lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8788
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

On Mon, Sep 28, 2026 at 06:31:21PM +0000, Brian Nguyen wrote:
> Add a print vfunc to xe_pagefault_ops so different producer backends can
> log specific relevant debug info while keeping the consumer layer free
> of potential backend-specific formatting logic.
> 
> Consumer-specific error prints are handled by passing as input into
> the vfunc.
> 
> v2:
>  - Decode producer specific fields for print message. (Matthew)
>  - Combine consumer and producer prints to one print call. (Sashiko)
> 
> Suggested-by: Stuart Summers <stuart.summers@intel.com>
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_pagefault.c   | 32 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pagefault.c       | 33 +++----------------------
>  drivers/gpu/drm/xe/xe_pagefault_types.h | 10 ++++++++
>  3 files changed, 45 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> index df237fd40551..e65e4962a26c 100644
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
> @@ -68,10 +70,40 @@ static void guc_ack_fault_end(void *private)
>  	xe_guc_ct_unlock(&guc->ct);
>  }
>  
> +static void xe_guc_pagefault_print(struct xe_pagefault *pf,
> +				   const char *err_str)
> +{
> +	const u32 *msg = pf->producer.msg;
> +	u32 engine_class = FIELD_GET(PFD_ENG_CLASS, msg[0]);
> +
> +	xe_gt_info(pf->gt, "\n\tASID: %lu\n"
> +		   "\tFaulted Address: 0x%08lx%08lx\n"
> +		   "\tFaultType: %lu\n"
> +		   "\tAccessType: %lu\n"
> +		   "\tFaultLevel: %lu\n"
> +		   "\tEngineClass: %u %s\n"
> +		   "\tEngineInstance: %lu\n"
> +		   "\tSRCID: 0x%02lx\n"
> +		   "\tError: %s\n",
> +		   FIELD_GET(PFD_ASID, msg[1]),
> +		   FIELD_GET(PFD_VIRTUAL_ADDR_HI, msg[3]),
> +		   FIELD_GET(PFD_VIRTUAL_ADDR_LO, msg[2]) <<
> +		   PFD_VIRTUAL_ADDR_LO_SHIFT,
> +		   FIELD_GET(PFD_FAULT_TYPE, msg[2]),
> +		   FIELD_GET(PFD_ACCESS_TYPE, msg[2]),
> +		   FIELD_GET(PFD_FAULT_LEVEL, msg[0]),
> +		   engine_class,
> +		   xe_hw_engine_class_to_str(engine_class),
> +		   FIELD_GET(PFD_ENG_INSTANCE, msg[0]),
> +		   FIELD_GET(PFD_SRC_ID, msg[0]),
> +		   err_str);
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
> index f219e9e3b73e..dbf9397938df 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -13,7 +13,6 @@
>  #include "xe_gt_printk.h"
>  #include "xe_gt_types.h"
>  #include "xe_gt_stats.h"
> -#include "xe_hw_engine.h"
>  #include "xe_log.h"
>  #include "xe_migrate.h"
>  #include "xe_pagefault.h"
> @@ -610,36 +609,10 @@ static const char *xe_pagefault_error_to_str(enum xe_pagefault_error error)
>  
>  static void xe_pagefault_print(struct xe_pagefault *pf)
>  {
> -	u8 engine_class = FIELD_GET(XE_PAGEFAULT_ENGINE_CLASS_MASK,
> -				    pf->consumer.engine_class_instance);
> -	u64 addr = xe_pagefault_addr(pf);
> +	enum xe_pagefault_error err = xe_pagefault_get_error(pf);
>  
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
> -		   xe_pagefault_error_to_str(xe_pagefault_get_error(pf)));
> +	xe_gt_assert(pf->gt, pf->producer.ops->print);

AI reviews will likely tell you this useless as we'd NULL ptr deref
immediate after this - I got some of those on my code for similar type
of asserts.

I'd say this is correct, so how about...

if (WARN_ON_ONCE(!pf->producer.ops->print))
	return;

pf->producer.ops->print(pf, xe_pagefault_error_to_str(err));

With this changed:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> +	pf->producer.ops->print(pf, xe_pagefault_error_to_str(err));
>  }
>  
>  static void xe_pagefault_save_to_vm(struct xe_device *xe, struct xe_pagefault *pf)
> diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
> index 8ae6b9848bdc..ee467117afe9 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault_types.h
> +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
> @@ -139,6 +139,16 @@ struct xe_pagefault_ops {
>  	 * Page fault producer ends acknowledgment from the consumer.
>  	 */
>  	void (*ack_fault_end)(void *private);
> +	/**
> +	 * @print: Print pagefault info
> +	 * @pf: Page fault
> +	 * @err_str: Consumer servicing error string
> +	 *
> +	 * Print pagefault identification fields decoded from producer,
> +	 * along with consumer-specific @err_str prints.
> +	 * Must be implemented by all producers.
> +	 */
> +	void (*print)(struct xe_pagefault *pf, const char *err_str);
>  };
>  
>  /**
> -- 
> 2.43.0
> 
