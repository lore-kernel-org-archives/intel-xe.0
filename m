Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34955C6FD1C
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 18:36:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05ECA10E188;
	Fri, 24 Mar 2023 18:36:33 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D4E10E188
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 18:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679682991; x=1711218991;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Q5FR26wjmVaEEZy3JAbKktAoU5t5id+18gclUuIXMWY=;
 b=SHWi6LwTpwDbILof0TH1+CMu5LeOrMN345eQbi6ynO2JrY3Ae4ePZPVY
 KJz45IC01DnN9nMGOkqurCplb+omeuXsgve1J7QKs8NULne/gtYMMSUsd
 MAsk+vrJifpRmF3nwi1ucvfuACYW2WOTGpIPYBlyrTRJPlyqUPS65MMdi
 jav5JyaGDzQcs/e0B53fxr81Yvhy4u2H0XxVQUaBNCi5p9mNiMOhTb+Wo
 58iGqWlCbscfA85UFknWMOwWtH7Y2TRa37QZl/6fwMt12gXOkkZ4aHzav
 XmmvfQLg5JpkzcwyNVDNbzgXkKziZw5DgDOdrJGXkbDWDw82g/r5FQWr/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="402451353"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="402451353"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 11:36:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="826353779"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="826353779"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 24 Mar 2023 11:36:31 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 11:36:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 11:36:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 24 Mar 2023 11:36:30 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 24 Mar 2023 11:36:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZTI8edNPUTzi1xkz8DGMatw+bRPZgvc7kPWLAk/mx4c0m+6iTHLU7vHp0MhhQskB+CKe0pyzIG0FkuDZkDWr4iIaBd6R4sHVLmIyCsAgz1E1X5UQK97Wv4xeJwCqfgIdmZwxpLN3awk+KOW/kExRnWvk9Tnn+3KQvjIHAbpGDP3DClTN2qX3Ub6f5NaXTSW2Ou5pvuA76WwpW5yDBHfj6Vl8tgBchbutcDrGbYncVDPsB007RKCHGTo5SxvSyS2rGDoEJ8Mc60pO5cNDXMBvuH71mRNf1qsLcatSqJdibFRj4+EupkQcXo7K9VbJrh+/FqrBbnwRVTHg3PR9QtTjIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5pUN9qxoWq+oTRIUfXDubzbGj4tObXejml97qOGkieQ=;
 b=WUlK3CKyUHyyWIOFUELo96/2LQKByBxQg73SS6xqKOGRc1R5S9BD0SbOi/ryllD2UHsDc4PX1lmNE+OWVUa5Y/q9v/GqMdBw6+oz+AvZ5iW8m5LI4BxTFbsgH/kXnAvzUEOraUG5W2Jdtt54s9TFZds7bwak2v2o24VpkonXE9QurGqUn69TGEpzwtcZHGb3OgaXNg/0APYwwHlsLNjoVIt2C9pyoO5dZuhdRlbsMJknARUSXITDKFZ6HRA6cStEJEPuz5txf+VILDtL9e0pJ31HXc1HYmapISJw/JtQHJeZ0ImA4hAGQlWRcq3DdoXorjdV0g5YZCnjjrzN/X+5yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB8229.namprd11.prod.outlook.com (2603:10b6:8:15e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 18:36:28 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6178.038; Fri, 24 Mar 2023
 18:36:27 +0000
Date: Fri, 24 Mar 2023 14:36:22 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <ZB3tpsMC6DTOBHyM@intel.com>
References: <20230312191442.1609-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230312191442.1609-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR05CA0043.namprd05.prod.outlook.com
 (2603:10b6:a03:74::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB8229:EE_
X-MS-Office365-Filtering-Correlation-Id: 84e7a4d2-d049-4b13-40a7-08db2c96adab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lIbT/YUCt3/0x5TPQq+2n6yihM6EH2ZUXH/M9STouBxFYZlXsUuEoK++WReJ/PyxrVxWtvCcKUuMOvO3qe3qrvZpf8nqyn2YaQc9O0NT85e6WURmD3fjsjtRepmUoiLmD/hHvq0aVo9Ip8DXPxlb9f+WNLeTYZOAVePX/xAVHvbp/4pWtLi2Li0b66VOZBz9MWSuj+0IzdF7u1//sJGvGQUAu+wAnOhBuNvOQR09cqzGLxDwOAhhi2R48ijtCVDEe2hPRKGF9EhK8Hc4/Vht+UeR84rUJNgy4riAUTbLfh2z5m+8frHGDQzrbMzOADqsl15tO48w/pvl8qVf9g5voSYkstO/BNjGYTZbaD5hRzo87rrNAfZn4lwA7oqyAAjrgb4KOIZy6ykxw5CPSbMVKuV8raKotjf3zYD5e21IUN1t56yeDB0Z4a3FepofoixcT04/aCMJ0zAXPam3WPMYhEvelZOboxtn/2aVa1icSNZ7LtocbGWSW87P0RqcttbPza7LZOD9A1Dls0h/QATfAH5AgzefxgZWRu6MysymoiJ9HYc7/jQx244c2RpxvNtcg1L/GyFDFQDOQpVz0BsTpZehJqXrgKNEIvJ07MS9255GzwN9Vqhr2ykfpoEFR8/bRUX9K958UTIFrroTXNxQGQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(39860400002)(346002)(376002)(366004)(451199021)(6486002)(36756003)(8676002)(66556008)(6636002)(38100700002)(2906002)(66946007)(6862004)(37006003)(41300700001)(5660300002)(8936002)(316002)(44832011)(82960400001)(6666004)(26005)(6512007)(6506007)(2616005)(83380400001)(15650500001)(4326008)(86362001)(66476007)(478600001)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1Y/v4lGHCZaE1Oz0sN1RGAi+naoKFlP+fB/mTXZ7kjrlwUXPjLn+I7U9NV?=
 =?iso-8859-1?Q?VezCBLF8mAB1Gp7bmA2lqSgbDsXQL24srZ522Dk2aTRCNPcJWJbWFuqGMM?=
 =?iso-8859-1?Q?XboyAGKLYXHA7uFJd5roCFkljtK3VBZfr3raUX2azOdhnF4avR+Oc2TTbO?=
 =?iso-8859-1?Q?hybG7+p2WGNkqdG7pSOK7BmUF72B8zXiCiLDUnf1Z9D7dxWUEczT9XkOFk?=
 =?iso-8859-1?Q?iJ6E7IfwK+C7nXqm72aT+gr/3h/Pyw1mFagfKcTo2P4MQbgxjTeD8BoT5B?=
 =?iso-8859-1?Q?65DGuTgUfQWJoH/TthHAHHS0vluPvKVb+EOCK0OMJPS2BZfcbDiRVLeKxt?=
 =?iso-8859-1?Q?lwUkwQZ/EKWfRUWgIEN5Y+klXw/sEO59CiZp/ZA8AZRULPcSOLS4+pcj+w?=
 =?iso-8859-1?Q?dWxfP1mkhxFVfovRXr+NHkJDV5a1RtfN2x1aZ6aCXpR5ZM1gxNgIeOv5gu?=
 =?iso-8859-1?Q?pz89PEnq/Y1oVsM4FFRkGfVVH/1jsyn9cDNFxDeZL9B2wK+fyaH9paxAJu?=
 =?iso-8859-1?Q?cfeYnJOSuEiDZ2Qi5SR6qSJKB6SD/P7vW9ThATBHmzLiOjV3sQkSvwNj9P?=
 =?iso-8859-1?Q?ICJv0UAeGSG35ygYVyhIF6tecPOiAVdG32lwkX6PN5vPlZoBU+dXBwOX99?=
 =?iso-8859-1?Q?NqnPgJov6/CvEtq0RCZ82P3EZJqlRjIJ16VMNhxQMI5cIUoXSY1zAT91N0?=
 =?iso-8859-1?Q?7n3h0pnHcFkfgjXHBaUNKpNpS5zSWYGfZSqQOH3TIfMALvmSkx1IjPzEuj?=
 =?iso-8859-1?Q?/uQV0uKTTUn8+K6xdxjy1knpYMidkZe1G28VKQpmtQuxY1/yIsnwdBBrF0?=
 =?iso-8859-1?Q?T/CyQc6IY3cjLmZcThH8vT1qxhAVF+xBE3yQg57MZOeF2gKVmLBe/KzcMk?=
 =?iso-8859-1?Q?nBsHtojYL/bUivKTvXzG9/+KjtzXa28n6baXT8hLbMQIgIi3Jva73j+0Zq?=
 =?iso-8859-1?Q?gb9xfEsHNC20NCtbD39eX0ghQQUnr0OfgPE3x6h8CSLzGue5Htg8HZptQ6?=
 =?iso-8859-1?Q?J1vj7PrSIJVGIPfWHjh2T/9kDtIxDZXcTS+R7m/I/ut0k/kSdhj8N49whs?=
 =?iso-8859-1?Q?Pg8WT0CD/skVn3a3UGrA4ePu3j95qFxqe00TOqqyXsvgLizQ4PSE65Ny17?=
 =?iso-8859-1?Q?l1wWfPXqki6o88w+HnZpZeXqcZqncwMUVsVghz/RWPxCXiYxwCQUdVnyUD?=
 =?iso-8859-1?Q?HKP/roWDksQRqj4uh2eHHW8dBWcBZ3AtjpwsouhMoagmvBn7Xozp6ACTCo?=
 =?iso-8859-1?Q?p16XuMQNRBprSXkr6GZx5qWQZFm1SxRUtbsOctntEm6JEdCnn+KwqcjnAG?=
 =?iso-8859-1?Q?Yl0g/awS4CdaanDQwlP7pv8FZx62bHhnjfxz+P2Gu8ok+YeNm4LtEaNhRL?=
 =?iso-8859-1?Q?qvc4b0RGFHd/sO6iNSHA8MFQSHwYlTslulHvrvdSg0o4CTvUV5KYypAKBB?=
 =?iso-8859-1?Q?LWzTs62AFgFgPy7XRswotxV0PixWQKyjIH3Ope8VvHHSQmcypIzpzGq0KI?=
 =?iso-8859-1?Q?F2v5KkU3Zm1uSgclnklqs02HOcJP8rijFljRl9ScB88gHqZZXpazSrLWI7?=
 =?iso-8859-1?Q?XoEZ1C+H7JnOCSiXHhLj8TO9UD4xZ3fHF4+ozlrPcSFbDtr2T8AMEt4NQt?=
 =?iso-8859-1?Q?8SQTbTXKW4W6enpGNOZFYre+qjcGhKZTlz071t5pHG+SM6f1tpuC/aZA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 84e7a4d2-d049-4b13-40a7-08db2c96adab
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 18:36:27.7673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iVvPnMEIeGCiTZ5GF7infs6qbyqVywDN0mn7H/6NIm/gMf/DfNUilyxEiqOzoXDxsvU83jBsMPTYUiDwaq35sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8229
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Introduce GT oriented log
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Sun, Mar 12, 2023 at 08:14:41PM +0100, Michal Wajdeczko wrote:
> While debugging GT related problems, it's good to know which GT was
> reporting problems. Introduce helper macros to allow prefix GT logs
> with GT idetifier. We will use them in upcoming patches.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_printk.h | 45 +++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_printk.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
> new file mode 100644
> index 000000000000..b12a92024126
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_printk.h
> @@ -0,0 +1,45 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_PRINTK_H_
> +#define _XE_GT_PRINTK_H_
> +
> +#include <drm/drm_print.h>
> +#include "xe_gt_types.h"
> +
> +#define gt_printk(_gt, _level, _fmt, ...) \
> +	drm_##_level(&(_gt)->xe->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)

do we really need this one? setting the level as a second argument sounds not
aligned with the rest.

But everything else in this series is great.
you know I hate these macros in general, but this one makes everything
cleaner and straighforward when you are withing the gt...

My only concern is that we will always end up with patches using
the other drm helpers directly... but probably just a matter of time
until folks gets used to it...

> +
> +#define gt_err(_gt, _fmt, ...) \
> +	gt_printk((_gt), err, _fmt, ##__VA_ARGS__)
> +
> +#define gt_warn(_gt, _fmt, ...) \
> +	gt_printk((_gt), warn, _fmt, ##__VA_ARGS__)
> +
> +#define gt_notice(_gt, _fmt, ...) \
> +	gt_printk((_gt), notice, _fmt, ##__VA_ARGS__)
> +
> +#define gt_info(_gt, _fmt, ...) \
> +	gt_printk((_gt), info, _fmt, ##__VA_ARGS__)
> +
> +#define gt_dbg(_gt, _fmt, ...) \
> +	gt_printk((_gt), dbg, _fmt, ##__VA_ARGS__)
> +
> +#define gt_err_ratelimited(_gt, _fmt, ...) \
> +	gt_printk((_gt), err_ratelimited, _fmt, ##__VA_ARGS__)
> +
> +#define gt_WARN(_gt, _condition, _fmt, ...) \
> +	drm_WARN(&(_gt)->xe->drm, _condition, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
> +
> +#define gt_WARN_ONCE(_gt, _condition, _fmt, ...) \
> +	drm_WARN_ONCE(&(_gt)->xe->drm, _condition, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
> +
> +#define gt_WARN_ON(_gt, _condition) \
> +	gt_WARN((_gt), _condition, "%s(%s)", "gt_WARN_ON", __stringify(_condition))
> +
> +#define gt_WARN_ON_ONCE(_gt, _condition) \
> +	gt_WARN_ONCE((_gt), _condition, "%s(%s)", "gt_WARN_ON_ONCE", __stringify(_condition))
> +
> +#endif
> -- 
> 2.25.1
> 
