Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15277C77B75
	for <intel-xe@archiver.kernel.org>; Wed, 17 May 2023 22:58:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC43A10E2D7;
	Wed, 17 May 2023 22:58:21 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F62010E2D7
 for <intel-xe@lists.freedesktop.org>; Wed, 17 May 2023 22:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684364300; x=1715900300;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9/WJpcOXbdNM/1J/F/j+51YmkkE3hVnbQ+WVZ0sUSbc=;
 b=jU1wcZf4LyZ0ldm9vakHNFy2FR745yR9CbnCtJTCIvzWj5/RH+GSqe3n
 Vs1hjm3HdRl7s5vGD9gJnLqO/3Q5B+YzwWeZNvuZznj7d6MaRUmtxahnv
 YpEZree4xMMA8vUggBJn/3REONJlvhiwTz91q6ajj3t72NUCRxAhj/JIL
 jQEeGJVx5ukyEGx/h8jUISfAYt1iu3sZ60GpBggBGJ5FjWs251xEU2s2I
 yT7dm9no/JtB0m4dkpZLL7K2q0PqodLFGtuYQQaH+Mdx10CKfUdyo4+LJ
 AsrO5TJKoZRZ02OVmRx2fh9Xop/RmJk6CcBdV1z0CyMx5APSFN6I4Q3oc A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="415316001"
X-IronPort-AV: E=Sophos;i="5.99,283,1677571200"; d="scan'208";a="415316001"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 15:58:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="948440937"
X-IronPort-AV: E=Sophos;i="5.99,283,1677571200"; d="scan'208";a="948440937"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 17 May 2023 15:58:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 17 May 2023 15:58:18 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 17 May 2023 15:58:18 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 17 May 2023 15:58:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oXVdf7qhObgKpvXoslp+ytl5FEVr1Aiob6S7qjv/3kYJRUjQg0nsnYrXfQ0vQ1L2tNm5AqQzvLS2ia2zRVcYHE+AC6jS2lu0QxA7NWy4OxCOmavXtOIGi+NdJ+sidlPep4xc8xfujEYsON13rlGhljbvw4tdaYqBePJZILgKiPbitmaJWJ/2MLmmz1SuzBpAMG4uLppx11yZhq0i4ks/EntR24mFq5btxR/e7Ac707QG7LKpQDDGvkRjwdVk1UnUebnP7nCEjdRdnt2gkfuSqCUnzPCwHC88BN0P4YpjEcEyy8TD406DZcISojpq/rKWI0DUq6qQOsJw856lbJxr3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MGsWJPKQGAp6zk3tF17dJ+YNzWJ/ahBdbK8kH2uFgrM=;
 b=jBjZ/q8epsxw0wINaG6rmvp3X9Isq1Ab45orOd/J6E3BEXkRAOJluLo5Xrs/vocbbtWBlE/tur3wHnHSmLlRMAd9QB6R1EalnAsLOIXniTh4SzVylls4Q8fcqFDgPL2MmWHcAjFefzQ/SaQxrDwY4i/wbuXoGEb6VSAEW/89TPto9jKOZI62VzrrEMATWPIF32WkYUQxncyTgJFO7d1mqvV804Lx71MJT2eRRzcYU6qt7UVAe7C5/jefvN5zX7jpcpV4ZlWnCQ2840Mpu5NgHhzFjHGrqMk/c8AsSvLqNfQVI3M9sqjOeaAZ5aJL/q3/P0qClKgCYyQW9Lg2voEY8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CY8PR11MB7846.namprd11.prod.outlook.com (2603:10b6:930:79::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6387.32; Wed, 17 May 2023 22:58:16 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%6]) with mapi id 15.20.6387.030; Wed, 17 May 2023
 22:58:16 +0000
Date: Wed, 17 May 2023 15:58:12 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <20230517225812.GY10045@mdroper-desk1.amr.corp.intel.com>
References: <20230511165636.1772-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230511165636.1772-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0173.namprd03.prod.outlook.com
 (2603:10b6:a03:338::28) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CY8PR11MB7846:EE_
X-MS-Office365-Filtering-Correlation-Id: 38a3e643-bebe-4ef7-1fe6-08db572a327b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yheRlmpb5YzdOjnmRsklUwN9JCSSBVcc85+yv6h9NFkl5zPo4MxucVS73wAtIsHBtihge7aKoF/uW3rIbcwQ/qXKntZrwNDFMG5MhMXKf+/69qcyR5CD8zamTdFApoV+XVZTRNRAohBST7dY3Gfy3SFT1hmN1cjDi8ayvw2GQsxG+AhxNOh2mzEzAGPXnlnvZJT+5J7JRnpywC+m7OvlcnkmGAffB6yMKGSgNJnyVIwv7dmNqo+tDLs3ehIIyDAyfwJjKHG2/8OH9h9pd89DAydFEUF4f/mwhraDr8CY4q9aX9Vbt+ENTZk7N55W93yQCDiHPFnr4uni8leqUkYmIETolEyxoC0CIwvrKX1SMH88YFEdB09dLBVEF93I3k6zeYqk7j21hjlUHIOt6QdbsW86JJpgwrUN6sCbSino7V1LqhPc4TrqIe/1XYq3bZreYzClMFv8WEhUMqttD/KEWpHvTtSmNZ5f4ctQyvHpNkA57zi3RIy+o9QBYIPzdheAQpAPkQBgS+aeJDuedHpWGkkWtqErtl4AuqpMQ+UOfyLpO3SE+EIU/Mi8M6B0z98t
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(346002)(366004)(39860400002)(376002)(451199021)(8936002)(6636002)(6862004)(8676002)(86362001)(4326008)(316002)(66556008)(41300700001)(66946007)(66476007)(54906003)(5660300002)(15650500001)(2906002)(478600001)(38100700002)(82960400001)(6666004)(6486002)(186003)(6506007)(1076003)(33656002)(26005)(107886003)(6512007)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?OV0g9xR6Fircab+QKK0diMmSgja5IkGWRYJ8io5IL/JNzbthtL7cd1RSob?=
 =?iso-8859-1?Q?dFUecjp4DlUcL5Poj3lPlZIENPrkC81ykfBmBLks7g+CF2eYFPEWuscbUq?=
 =?iso-8859-1?Q?0s5aYsauHrUVxmw4fE4hweMynyYQSuZeHdqnyc9brxEQK9DRBs0rscAcuY?=
 =?iso-8859-1?Q?pQTzXeR4K0sH2eMtSe0+NEhwU6DeraUEI0He22saPQbeq3dB8j/gmQIPXS?=
 =?iso-8859-1?Q?kKUKoJaSCgFPMe3Y2CMa1KUjnHwXxCiaQW9/kxlmBs5lmc2IDU+CfLnuuX?=
 =?iso-8859-1?Q?htwLMN965NkNuYyhDNyWcE4b9k/VFHOzyk/bdnNqrGGjBMaH/Gf4Qq7d2w?=
 =?iso-8859-1?Q?YLzuQOhaErEd3JJE8iructwvNjIA7xSYZ2z55IY/vjM+NLZJZp/VD83D4D?=
 =?iso-8859-1?Q?m1gurlmZ/AE4KpI/TAMuRu9k2RkXKZasN7L3jF/jk0683j8mt8IrZ5UEWf?=
 =?iso-8859-1?Q?18FOuke6mQM0voNA3sLe/NcJRqbJi5nwcgJ9Cmd+fWwcNB4GwZ+g9ePJJe?=
 =?iso-8859-1?Q?ZViSFnJEv+u0TXTcg8f2JudCHp5IfeL03RkR7kqgiDtCm3z3nkHEtFmsCz?=
 =?iso-8859-1?Q?ZD+D+/E/b37Mz7nYZgA6CQGoueUt0R2woXJo2RFh9eTkn598QWA+AgnkpS?=
 =?iso-8859-1?Q?HW5W1o560kHyZUxWe0OAisy6G9bVTj3BtSwsGZMKw0RqlaZmPutT8M0fUC?=
 =?iso-8859-1?Q?Eya0BnYUSzSclKE+8gea83jPSHWM6vgXESZsmaX2JW5n1XhaNTN7w+1C2j?=
 =?iso-8859-1?Q?qJgy8wkaBnjqbEF5NznaqAsAXk6+z0FZMeljGTeGdhUi0Z6DacHAp9Bn28?=
 =?iso-8859-1?Q?n6VxkoFhd18B9GSV3hrojcyYQZtg7MZPcFkCfivFqKJj9gyjZOMO8yLQrC?=
 =?iso-8859-1?Q?xkDKv1+ysOkIIIO9i+E9bVjQBUEn4+b8JvsLDFJ4t+5bzpa20wyQDt/5fp?=
 =?iso-8859-1?Q?eR7mf2SL8mOnB+BhBj/m0LHmQ/GwmbH3029t8M3/pvUj6wsg+koplrWcbW?=
 =?iso-8859-1?Q?d08VrIJxyaLpOr3Xj+dc1RZ2yxl0BT0dD6KWozu+/LIgX/GN6B2K8oCGvk?=
 =?iso-8859-1?Q?wG/EWG80bZPB1ZK43ul258/RRRv7EDRtW3UGlrBlAqt3sKl+pQ6AU7FSoG?=
 =?iso-8859-1?Q?Uq3W3HXleJY7P8xaQEJ/zHKU0BMt4/mNIFdJ2IjY6S/RpIqM4C9coKvp0l?=
 =?iso-8859-1?Q?yTOS/tcPEMjBn4qGOe3t0pkbFbTgzFmmVaJe2jwiZLWLbiC5Gn3S+egWip?=
 =?iso-8859-1?Q?SBmrqqTU/3gBx9q5zEBGb8FQliRDC3qp+773oUpldI/E8Pj+dPyPWuV46p?=
 =?iso-8859-1?Q?d3qcA8mzk8iwE02INEUwvIgTW4Njl+xsHUGHmtKPOTF6q+ZdX5HDyFdwya?=
 =?iso-8859-1?Q?be0aPSbCrWHN3iaL/b/alac7i0Q0hp5/YYqmY2vHGelqXXAEvONDrt+eoi?=
 =?iso-8859-1?Q?wnS5rIF3MvdR2nmNkbxCBWVcpoattDYICGwzSuZB0iQTjw3HaN06BXUeuK?=
 =?iso-8859-1?Q?XcBq672cQPlJK/7f4qAO3gjyAZHxJV8wjlQLhiYtwmwG4cSq/udBmKBlTE?=
 =?iso-8859-1?Q?2TfeazmFg467fSYfAr21GCoX/pGe1amPSv7ygBuCy/aQhi9QMcoDUBZkmt?=
 =?iso-8859-1?Q?LwDtmlldtpiKSMQUeRx/4IoYyIj5q0GD5ovA3dk8f+kkwcmJ1ZCZTJqg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38a3e643-bebe-4ef7-1fe6-08db572a327b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 22:58:15.3668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SSFBCgUcD2WEt13ORdp2Q6xqKpI6+5/z644x/RWozu6IxjiUTuH/b0UlYOaQmtLRioZi0E5qXqmCowINLXRmuhAg96CrXrb1687JFT3FKFc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7846
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 1/2] drm/xe: Introduce GT oriented log
 messages
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, May 11, 2023 at 06:56:35PM +0200, Michal Wajdeczko wrote:
> While debugging GT related problems, it's good to know which GT was
> reporting problems. Introduce helper macros to allow prefix GT logs
> with GT idetifier. We will use them in upcoming patches.

Minor typo in "identifier."  Otherwise,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

This will be a _huge_ help when reading the logs and debugging issues on
PVC, MTL, and all future platforms.


Matt

> 
> v2: use xe_ prefix (Lucas)
> v3: use correct include
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_printk.h | 46 +++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_printk.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
> new file mode 100644
> index 000000000000..0b801429cf1a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_printk.h
> @@ -0,0 +1,46 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_PRINTK_H_
> +#define _XE_GT_PRINTK_H_
> +
> +#include <drm/drm_print.h>
> +
> +#include "xe_device_types.h"
> +
> +#define xe_gt_printk(_gt, _level, _fmt, ...) \
> +	drm_##_level(&(_gt)->xe->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
> +
> +#define xe_gt_err(_gt, _fmt, ...) \
> +	xe_gt_printk((_gt), err, _fmt, ##__VA_ARGS__)
> +
> +#define xe_gt_warn(_gt, _fmt, ...) \
> +	xe_gt_printk((_gt), warn, _fmt, ##__VA_ARGS__)
> +
> +#define xe_gt_notice(_gt, _fmt, ...) \
> +	xe_gt_printk((_gt), notice, _fmt, ##__VA_ARGS__)
> +
> +#define xe_gt_info(_gt, _fmt, ...) \
> +	xe_gt_printk((_gt), info, _fmt, ##__VA_ARGS__)
> +
> +#define xe_gt_dbg(_gt, _fmt, ...) \
> +	xe_gt_printk((_gt), dbg, _fmt, ##__VA_ARGS__)
> +
> +#define xe_gt_err_ratelimited(_gt, _fmt, ...) \
> +	xe_gt_printk((_gt), err_ratelimited, _fmt, ##__VA_ARGS__)
> +
> +#define xe_gt_WARN(_gt, _condition, _fmt, ...) \
> +	drm_WARN(&(_gt)->xe->drm, _condition, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
> +
> +#define xe_gt_WARN_ONCE(_gt, _condition, _fmt, ...) \
> +	drm_WARN_ONCE(&(_gt)->xe->drm, _condition, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
> +
> +#define xe_gt_WARN_ON(_gt, _condition) \
> +	xe_gt_WARN((_gt), _condition, "%s(%s)", "gt_WARN_ON", __stringify(_condition))
> +
> +#define xe_gt_WARN_ON_ONCE(_gt, _condition) \
> +	xe_gt_WARN_ONCE((_gt), _condition, "%s(%s)", "gt_WARN_ON_ONCE", __stringify(_condition))
> +
> +#endif
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
