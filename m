Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E676C6FA8E
	for <intel-xe@archiver.kernel.org>; Sat, 25 Feb 2023 00:24:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 549BD10ED92;
	Sat, 25 Feb 2023 00:24:46 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4131210ED72
 for <intel-xe@lists.freedesktop.org>; Sat, 25 Feb 2023 00:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677284684; x=1708820684;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1Lq3oYHHzpsSXTdaA2mm55j0OgU2VEGkcQwetcDcVxI=;
 b=Of1+txIpEIn8OjWRDYGH3hXCG1hwTu+RrRX+wfSxo/MrPHEvKrNk7cQ4
 uI0zaAC9IDn+XyV9AujcCTbHq40UzCiJDN3DVFWlTqb9NMi8WFFhYT6G3
 1rMfduPQqFGKlxoomDTYrTYt7oAthj+PB9JKSKzaJQV+yYVaR1tjbutPT
 twJass3v/t+rYVOUFHjRiN0fHgXt30e6GILjUREH1AmQ3PJcIXntfcZCL
 CvYg8PQr5myrnajF8KbVD9PkD/xb8TGWKrDcl5op+xn6g4sZpZHgEfQOl
 /skAkqPy9A+blMBUf4/kN+I3mRY62anSnAm4Gd+WnXgVwsJsZ4tlBJLbO g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="317368651"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; d="scan'208";a="317368651"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 16:24:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="736980051"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; d="scan'208";a="736980051"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP; 24 Feb 2023 16:24:42 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 16:24:41 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 24 Feb 2023 16:24:41 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 24 Feb 2023 16:24:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i0jPnXVyOijSfQVdNiRSWovzSU8VyFEzmkFH0A7ZcVRBMD0CNKEpo6sCUOOgEohj+z5wuP+6W3BhFH/eZjMTwtHK3YzlKSISeRyCoAuy1/L+I6LK4NK+fXxctVyAguZFIyKHh5Lin17GULgZTkfm2K4D6xxisjnmj77w50PUaYX0IX+dEQt2uwM2lpdQsRXSD6WCwUEbqvX+EOgWQPsrQOf84nlWeJ0xeENjiaYPVE+w6JwadMVreIdGNBRYfDC/MUUPEz3yserHXTOaqw3DPoTk6WFoFck8Hl7HoJCymTr/GKn/r1aKuiIgH/E813h7sN3T4wO6ddPGZ8YcAqwqnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/PY26xXpiFgqzWMtFPurDjRabNJbik36pn2ZnkZsEh8=;
 b=KDf4RDNTSI2BBHKMjBag5BG4tKEJI3YlbbCLtVWpGy+EVg4849aokBfRcD3J5YxbbIOcCJDhndXE8NDcQaG1/lBbbi3lCVGVAdDTJ5MkbCY3zkCuXFL0xQnQwez9L01ZWuoVG5rHJsec667M7owygTQT1uloU1nba5oBRDgRZV4IX7eiBRBlJuZfwZgEohKSIy0cHnVtazkeE1X2J2QpF21BY7jn/NOVohJzRlxqU74imYdr/EneI4HhdgJQ2oyPfzMJg1Nvg2nx99zUk9Rsyu1nU32yLrJ2Yx+PArA/4Fz9Rq9VFFozNPXcBJn/3hLK0/Ql0JdLsrKAu8+YjGnFPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.24; Sat, 25 Feb 2023 00:24:38 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b%7]) with mapi id 15.20.6134.024; Sat, 25 Feb 2023
 00:24:38 +0000
Date: Fri, 24 Feb 2023 16:24:35 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <Y/lVQ2Oo2hCv40FK@mdroper-desk1.amr.corp.intel.com>
References: <20230225001548.1743820-1-lucas.demarchi@intel.com>
 <20230225001548.1743820-6-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230225001548.1743820-6-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY5PR17CA0046.namprd17.prod.outlook.com
 (2603:10b6:a03:167::23) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DM4PR11MB6479:EE_
X-MS-Office365-Filtering-Correlation-Id: 9765abe5-3351-42d3-dd2e-08db16c6ae17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mWt54Sa8mItykpF8M+R9HJkgmYGAvcLuwQbw4dgS2rKyWROUe/H7QRKN8EZYFhbK8i551J8dC6/gvtegD1e/K8WoW9Suygi0S4VCUYR2D9xDftCrra532O9fbrVCv1X0wjWQaA+9RIUFJkjxydceAGilfbCqMp9Ruor4vLofvb6q3bSbpX8Ec/lwQaI8rvJlhj+Qs61V23H2C9Qoe8mmz++wFtJeUfoxcmuJGNB+5BdmleRXhn6pSCkHwQdG8LP2Hpqdig2VGHf5H6qmD91iRaXz1sLUObj4dSkhptSPhSxlCjDX7AlhFbxsYMWhtMCsL0JiKWyP+mG1mRgft7OV9D52aT9AWfxli/7VYHR2rkMFU2sHqHhzP21JBhqJony1XnJoN9nav9PbRsSist77nlv9wP5i5tSDnDOR4NlsXneNm1u65Toyqds1b/su9HprW6PZKL/eJGbtI248KlwgkSe9iWzcvcQDmJkMwAcoo1aJ/fyG9BI+PxCPlTBaiVFTOnb3PXEv1RSjjQcHJSYNtYKXxT5UA2UCUFstRGhT4c5/Xa5KXs7jkzAo0R5mLBb2YrnGPQZufZLwM4hpo6B7kIPHYdy/tHH5T+Qwu48P0HeTGVX/lFBi+qBy9rkPsrCaWOV+ms1TQbh7qb1TxPDUoQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(39860400002)(366004)(376002)(346002)(396003)(451199018)(83380400001)(2906002)(107886003)(6666004)(6512007)(6506007)(54906003)(6636002)(478600001)(41300700001)(8936002)(6862004)(6486002)(86362001)(82960400001)(186003)(26005)(66476007)(4326008)(5660300002)(8676002)(66556008)(66946007)(316002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?F/2hhScHVlpWCqKlnXBU5nF9cUGT74hLuZ1eliHUKrn+T9cz36Ezi1R6MZ?=
 =?iso-8859-1?Q?xK6FlNSdNMPiw6DJTSbwFLx9qPYAmUV4MMXUMDQmohsUyYKR6HxCHvE2YO?=
 =?iso-8859-1?Q?ZtvlPi3vNRw3einJQ/1kekLaSS7AOx3Be0uVTk4GugFbG22ndKbLQ3aGNZ?=
 =?iso-8859-1?Q?xqpumKjOWtK9LcFcQmRIE+JX12EFMWqi0F92dWF9TE8U0YY6wtKjPbnaGq?=
 =?iso-8859-1?Q?k66engxUpwU4U4RsvPjo/X3Te5odA66bZ7OK+7td1jcqYA0xQ/yHiCLXHg?=
 =?iso-8859-1?Q?qZ5Z7t8xoIyNTBm4cjS+zTauyf34711LwqDgvSNgpG4MrZ/E4J57b1vXEj?=
 =?iso-8859-1?Q?TJCBJFhL+9kV5f3k49ACFDiZ5XzGq8+NDNP/siituiiZXlC3ZvX7x7RBuX?=
 =?iso-8859-1?Q?Zr9CLUV8kBG7Smu/8RzpVh1Npce7Aeng+EjKvvtuKVdMulGm4fRwTWEhjJ?=
 =?iso-8859-1?Q?fIdNxwYDn5q8y1F/L1Xl+BaNgC5+FiiORWb2zSk3NVK/wMvhu5rcQMDCgB?=
 =?iso-8859-1?Q?37AKxHEFZnHJlq6yhO6g9qjE55hYxl8aFjhG3g0YKg/7Wqcqac58DkZalB?=
 =?iso-8859-1?Q?2UKh6TzD0Tl+Oqeoly6XwxiZ8to4S78M9U8nFpUB4ZByObWDW2jtuIDSHb?=
 =?iso-8859-1?Q?OI/IGBvHrYsuaN0gsldmPtLD6DEYrW1hgV1/zT6fLvK6F+6CZgeo6IYpOC?=
 =?iso-8859-1?Q?x6wMHGvbpISLSyXpCM29dR/+oFQbni/rGtKPRm2Kh9p6bdjp44zvXzO+Q3?=
 =?iso-8859-1?Q?ggi07SK1IH5tVFG2Jq/J0ASKU8kyCF/2P8Vyb8n34QEKta0O7vvNtbrSpI?=
 =?iso-8859-1?Q?A7g4jvqoTdApXEZxAyJ9y5HxTdDB+gvmp7qKazdn/br/9U21aJCtuIxyuX?=
 =?iso-8859-1?Q?U3uusExPjbIFHcSt7EKsumWx+EC8YXqGSrtHk1nPQyqkfuFCpeGnagY8+t?=
 =?iso-8859-1?Q?uOJi7ZqP0p/9j4hHYSAHvEJ9oXOUlEdJCwCsc3bw7mji1A/mYI6jJfMb9b?=
 =?iso-8859-1?Q?9MW0SYWK6OjiTdXnfNJK93yoGnlnouuZEEKcugmEULBE9jsgufI0YuiiLs?=
 =?iso-8859-1?Q?cEjVPsK6lgk3EYGdyr2uStq4vT9kU3mKraCUaw3nBnUFbni/r2Z3mokxe8?=
 =?iso-8859-1?Q?P9oTTiBaUzbxvht6tLK2LxE4Udfr5tsJcGX3yLICCgHCGjRoirQjH6nE29?=
 =?iso-8859-1?Q?1IMoKMflWP5/f7u/iCrNfaBUpO1ifRsYkM2kljCdFFvMau54SfGvtfPbP4?=
 =?iso-8859-1?Q?4zfKkzWHFSkZYxzjQmL2KVfQ0H3OLrxI4VyNdDzpaW8BwSNWJWvu5y0r8p?=
 =?iso-8859-1?Q?UVpSEeAkmmsLlILr9IZ1KyysfHUSifQyRbNQq2WUp/xJNwVCi8422eDnCX?=
 =?iso-8859-1?Q?Rz5UifmdB/AMd7n6cf+WIoa6cwxoETHOmKs/JVlACNOrwCREQxTq3lC/o8?=
 =?iso-8859-1?Q?LQDS37vV6Ac7OD41Qgmnz4YOKYyOrdj51jKIHP0J4vS/oQfYymYqJMRPcW?=
 =?iso-8859-1?Q?9irJ8Fa83XRwGg26pUehAopKSgJKbvQu+LgacCpIms/vJsg1OIy4HFPqZF?=
 =?iso-8859-1?Q?uOYK4cyG0yHC9YBDqB6IRhv+Lso3DDvR4fuliRJwPnyQArxKAXxZAPultB?=
 =?iso-8859-1?Q?6aSpdqUHVwmRdPmN/oOioAU5fumV2z4DjcD429Jr3HQBd/1JfxH1Bx+w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9765abe5-3351-42d3-dd2e-08db16c6ae17
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2023 00:24:38.4598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UZQMif0OuBkmQgBwNkN67hwJSfw3yvB1XM0AdYKkKOnQKzBDLHO+aYIvwVTo9ovMc8+2Xh9bBt9ZVGKjhvh7eKLaNFy/EFeNcUrt2IeQqIk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6479
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 05/12] drm/xe: Remove dependency on
 intel_lrc_reg.h
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
Cc: intel-xe@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Feb 24, 2023 at 04:15:41PM -0800, Lucas De Marchi wrote:
> Create regs/xe_lrc_layout.h file with all the offsets used by the xe
> driver. Eventually the xe driver may use a different way to define them
> since it doesn't supported below gen12.
> 
> v2: Rename file to intel_lrc_layout.h since it's not really about
>     registers (Matt Roper)
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_lrc_layout.h | 17 +++++++++++++++++
>  drivers/gpu/drm/xe/xe_execlist.c        |  2 +-
>  drivers/gpu/drm/xe/xe_guc_submit.c      |  3 +--
>  drivers/gpu/drm/xe/xe_lrc.c             |  2 +-
>  drivers/gpu/drm/xe/xe_ring_ops.c        |  2 +-
>  5 files changed, 21 insertions(+), 5 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> new file mode 100644
> index 000000000000..4be81abc86ad
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_LRC_LAYOUT_H_
> +#define _XE_LRC_LAYOUT_H_
> +
> +#define CTX_CONTEXT_CONTROL		(0x02 + 1)
> +#define CTX_RING_HEAD			(0x04 + 1)
> +#define CTX_RING_TAIL			(0x06 + 1)
> +#define CTX_RING_START			(0x08 + 1)
> +#define CTX_RING_CTL			(0x0a + 1)
> +#define CTX_PDP0_UDW			(0x30 + 1)
> +#define CTX_PDP0_LDW			(0x32 + 1)
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index 8a7e0d86fed9..ba9f72694277 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -9,6 +9,7 @@
>  
>  #include "regs/xe_engine_regs.h"
>  #include "regs/xe_gt_regs.h"
> +#include "regs/xe_lrc_layout.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_engine.h"
> @@ -22,7 +23,6 @@
>  #include "xe_sched_job.h"
>  
>  #include "gt/intel_gpu_commands.h"
> -#include "gt/intel_lrc_reg.h"
>  #include "i915_reg.h"
>  
>  #define XE_EXECLIST_HANG_LIMIT 1
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index aca41ecedf7d..5eb11d56e9da 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -13,6 +13,7 @@
>  
>  #include <drm/drm_managed.h>
>  
> +#include "regs/xe_lrc_layout.h"
>  #include "xe_device.h"
>  #include "xe_engine.h"
>  #include "xe_force_wake.h"
> @@ -31,8 +32,6 @@
>  #include "xe_trace.h"
>  #include "xe_vm.h"
>  
> -#include "gt/intel_lrc_reg.h"
> -
>  static struct xe_gt *
>  guc_to_gt(struct xe_guc *guc)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index bf12f71fbe72..5baa3cf53852 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -7,6 +7,7 @@
>  
>  #include "regs/xe_engine_regs.h"
>  #include "regs/xe_gt_regs.h"
> +#include "regs/xe_lrc_layout.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_engine_types.h"
> @@ -16,7 +17,6 @@
>  #include "xe_vm.h"
>  
>  #include "gt/intel_gpu_commands.h"
> -#include "gt/intel_lrc_reg.h"
>  #include "i915_reg.h"
>  
>  #define GEN8_CTX_VALID				(1 << 0)
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 61f22bcec82c..276fc9691986 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -6,6 +6,7 @@
>  #include "xe_ring_ops.h"
>  
>  #include "regs/xe_gt_regs.h"
> +#include "regs/xe_lrc_layout.h"
>  #include "xe_engine_types.h"
>  #include "xe_gt.h"
>  #include "xe_lrc.h"
> @@ -14,7 +15,6 @@
>  #include "xe_vm_types.h"
>  
>  #include "gt/intel_gpu_commands.h"
> -#include "gt/intel_lrc_reg.h"
>  #include "i915_reg.h"
>  
>  static u32 preparser_disable(bool state)
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
