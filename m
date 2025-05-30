Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BA4C5B543
	for <intel-xe@archiver.kernel.org>; Fri, 30 May 2025 17:34:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11BAF10E833;
	Fri, 30 May 2025 17:34:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MIEfLo6R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 165F510E833
 for <intel-xe@lists.freedesktop.org>; Fri, 30 May 2025 17:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748626486; x=1780162486;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WA777+wjgCxZA2MLva4BdZ6SFRSjOB7qrP8jbC5DXtg=;
 b=MIEfLo6R0kNArswdAVP5cIeb7I/FRv0m0tHmrJa1+B8WTvLwqdJIR2Yp
 P7vv2ciqCSn7cCl/TVdtafz895g6YN54Lxj/lbaAMNldTQgouVA5JGBy9
 mdMMWidLIXl2XzKu5NaILidC8XOcZNZ+SN1LDlVHch7dZFjzUmUVaVRPr
 6FcgbvQSD6bD3z3KRyBKy2ZUQ84u/VZECpVSSyMqvFv3JKO43DXYMaRFE
 jheMO61nszBCmB7Gf5I62y8Jj7QA95hEFBZgFO75VLT8iFXcmv3ALtdcm
 HLZWWBS3sZfeL++RqPrmQ+huc9T+4kz1XiFChApCyV2CQLsfruTl6yvl+ A==;
X-CSE-ConnectionGUID: KtAQtpWTTgq6Z+rjhYjVFg==
X-CSE-MsgGUID: qTXSwetzTWejJWN0TtdqLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="62070443"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="62070443"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 10:34:46 -0700
X-CSE-ConnectionGUID: XX4K96vLTPuEgCI6v1uw5Q==
X-CSE-MsgGUID: hOfVqd+FQHaVsq8TGEBgXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="148797912"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 10:34:45 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 30 May 2025 10:34:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 30 May 2025 10:34:45 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.69)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 30 May 2025 10:34:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L647KVhaBHyts0QwNsEoV4Xv0drj5S5rjsuglbZ9e4euWKAGcIJGqwg4IN66KuIBzP2nUe2q4zWNj5PTv9C2+g47VBksd83HBDPsi+mnKBJ75QhhUG6zhfym3KMOhQZHlQCN9zu7NnckSJnWZkeP1OgsUzqlFAjBYS5iwxKKutj37/1EcdBYDibzf4p7QLLz45mvuhlLtYRfFVtt/EfyYEXASA1bcSivKnR9liRcDRLjDx0YCVcYNXIlg5T1g3/lwDALvo5NHb+cHoKhpDquKI/+O9AWeJuq+P8IVkNqVPKTrgnAw2t7SdfN9z6t67y+soBc98MW+IZlBIzviqkWhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=REZSiRM8on92/e2t1qdoPFQHEJEmYOXM/cq/VIrybkA=;
 b=iBjxCm0eJ32Fs/SfksYgU/tiH5Akv9+0obELNI383mMm0p3+9UAl8RlgSRA0wei8u7w47WKkN7Eeu3RNAViXF9QXV4VIVZ/mCxAnSQI4u90a8B2nzzEkUvHmLgqxToX3nxyriRx1UnKXHNbkUreFXxJeNyHYnWPjwmNPZwsrBkBfqsXzyK/oDuUJYrM1m5ZPRCKG7u2dhId8MQ5bV2uhD6VzAlBuacndqC3A2htu/z8e5jpI6FA9qRM4XwWGg7XsoCf6Wxxw/nu56gQU2rpl9RrYHIYPJdK/xYTU0eAvQCasv8WpkcN+WpnW8lNI5OzRTn9ENIcEGZFvkyhNakBS5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW4PR11MB7104.namprd11.prod.outlook.com (2603:10b6:303:22e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.25; Fri, 30 May
 2025 17:33:57 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8769.029; Fri, 30 May 2025
 17:33:57 +0000
Date: Fri, 30 May 2025 10:33:53 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe: Convert page fault messages to be GT-oriented
Message-ID: <20250530173353.GC6239@mdroper-desk1.amr.corp.intel.com>
References: <20250530164835.461-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250530164835.461-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MN0P222CA0017.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:531::22) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW4PR11MB7104:EE_
X-MS-Office365-Filtering-Correlation-Id: c2b57a2a-a71e-4971-38ee-08dd9fa0280a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2u4f8W76iEI2Rlrz3jeM+r6WNvjnqFSc1UcwOug11OPpTcBSbCEfU1/cSjzj?=
 =?us-ascii?Q?F7UZs9k77dR1yXoCH8y92sPM2arnmkqLLCh+Xf23cDiRq9OTBHUrrWyx8+Bf?=
 =?us-ascii?Q?TDhMtex1B2ERuH+mFwox3vV5rObGTU9Kc7Sar9xAYx8+zMsLD3sKyiVZ/dOa?=
 =?us-ascii?Q?/ngZSfDM/JzWcES7fmNHu1xhhk/mMqJ39sUivYNp9ylIaEBBxvoZAOYon+WI?=
 =?us-ascii?Q?VOHSG0jP3O73RamrW/5E35ttzhmQYMCTuTSkSvR2NbnA3dddljJhF07vfDwI?=
 =?us-ascii?Q?tRimlGIV6nNu5MTVU12WsvNUyzCy7HdpHyEXcfpv3b/rs03lZiU0Wi+vq06q?=
 =?us-ascii?Q?RmZ7zHiQYCRc3eC+rbrDcak5ir+Q8RTfBNvr/vwYPsgS5l7SdDcHR+iSBXcq?=
 =?us-ascii?Q?TbI/0zJ6i/aBRtDJXvynkeeuI4HyaAlvyGES/zvSu+tYDxfMmOFoPkDtDez2?=
 =?us-ascii?Q?4IoLlyVlYDorK9eXgmnz/v0K2dqMwJUk854z40PQYScFOQXFBgp/EKaBL1d1?=
 =?us-ascii?Q?2zXwq756N/gqjexq/KO5qaKpl8at2hkA/5h1dAak+FWAJKKzA4sDxLh0x0ao?=
 =?us-ascii?Q?J0xJI4ECo8J0wIXeGyrDbDH+j+UasY1m+L7MAFUXLZHXZKJy/t0oAt3JGZwX?=
 =?us-ascii?Q?Difpr50qsEKIq51EOL6dbv7GLT3stwCAkeNEkAcKPgeIGb7uK+KHydDRIASK?=
 =?us-ascii?Q?BwOrwSVVjX/Gv+6AZSiYQ1zJ/nNGY5vGYDok6kSv+HkdevAblLtK/mv3q4xL?=
 =?us-ascii?Q?I9TD6Ljq0UPRYq/QXIfRZxBP5Q1eTaQ2UaEOSfcpw9aLvM8lPQx0qVKBvT4K?=
 =?us-ascii?Q?9XvQKPo7pvcvDUKuxSYISWr2kNT/ikUiexFDdEaQ5jBoNASMeRRmFANv6/C4?=
 =?us-ascii?Q?j9S9wrCzPTrjkZNhyfUZ+BmjjbmbeOHojFNhycFgM02WloI86h5mF6wV40j0?=
 =?us-ascii?Q?L1ewwsmGeHwwq0QJ33mI7HN4pXzJ7NmvJOBMn9AmoRYNrmOtyiZu5gqdK2gD?=
 =?us-ascii?Q?pSmuhgvwZUu1aIyhRKcwG2wqDDDLSWmkVCuKaf4xVhoJDd87B15Om9G0nR8D?=
 =?us-ascii?Q?S5HQ6jdqxWobemIQSOczR2jaG95TmWHCZ4243ouxMlCLR2ZywWe/VCi84jJs?=
 =?us-ascii?Q?CDFaHE4+ufLmyhtW2j/TO2RY4ZVolOdEneU/2787bVYpalfwXdA8mq2dLyTv?=
 =?us-ascii?Q?Xslz/k8iFDceEWdKnrsWfQfK200SAK+3Yjdk6AcD6YY3w2nVq5W4Ymb06RVp?=
 =?us-ascii?Q?4qKRzTtWmbrLiGFGjnCVtmI3gCB2M2oUPw2d02qA7NGH679ciV4Ujfu/u+oR?=
 =?us-ascii?Q?swB6Z2KyCIl/NfveiDAQnrBMPx4SPOpJeofFl25hUWvjgJs4sK5BPiA60/pq?=
 =?us-ascii?Q?1pObnqG1vEPxziOaxVoRXCSk5Tfoc5ckyZgalDexOaKkHaaRxVaiRb8r5nfh?=
 =?us-ascii?Q?5TxTDgeLI6o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5X5hbuyoxNmse5mQQQQB9MRST6qqio4KhqBPrNTK/RlbDNsnC/kaUH7bwywd?=
 =?us-ascii?Q?4hK0R7yLqnLcYuLGtpWNaY4B8b6Or9LINyzyXvPa3sCMm69GKxPzLIdZo2TD?=
 =?us-ascii?Q?2FW2tymld6fmEKUpC978vQeSu9zO63vwAr2toZzWM6Gg6wQmYF600AZ2YMub?=
 =?us-ascii?Q?HAvJVpdyNiXz+LLXK1GTbksCGIFaW9XJFGMBkJS335Utbp+9VXbdB6LK5piU?=
 =?us-ascii?Q?TRfOHdTiuDc/3yTNFVhzvls7WCVFy+yw4T5uCeFIO/xJ/n/0hstX+W9AeFRD?=
 =?us-ascii?Q?E+2Mp2iUOrFFAMJ7gObWNFd4SIRjyWSqlz8Y+O+W/XfpQkxAMfFDsMNmlclN?=
 =?us-ascii?Q?FWTR9ID/NPKALiYcyIgY14Dlou+PYkHNcfJdwl71+Kt3eNZCt0OEpNp1zmrm?=
 =?us-ascii?Q?3ESdnvIF3fnqoWbEZhsY5Qs9IEXehjBwyb1olakxoC7iGLBDibuBo6s1ULvu?=
 =?us-ascii?Q?ImnecXCk58pJyeuqeqtcNSX3Yrq4lOwxFqRt4JLm6V7c3JDcGZ7fzpLKLlXf?=
 =?us-ascii?Q?bKI60Kc64NPCWKHvfVa94+PslhkfUQid8pX/zxPrcv9Mr1PzEuDzi7Q5TwCt?=
 =?us-ascii?Q?TTaa6BBLu9itq2wrCFhQukGdtvKcmrrUkXYR8cOEQXSo0nYgqH6ktZH3Igof?=
 =?us-ascii?Q?0j/1fQsk4nmKDIf/AnWXRKvqvT4nYWE5HUmSQEOW7buZd+9U2fVwU4W+CW44?=
 =?us-ascii?Q?Fj39cnvZ0lJggx/jEx6hTySTMB5iMBzRvVPAEJDtEVBZ/Y9466XXuo22434L?=
 =?us-ascii?Q?A5suSs1lB+y4VGQ8ePS5TxGhZm+1aIrFkJDXCGzYiYsDzOUsiyPnnLYwVhlf?=
 =?us-ascii?Q?+TbPxK2DTo6YKJpi4t14NfielXL+Llt5JtPX5n4rauweKZuh7foeREdgXFJo?=
 =?us-ascii?Q?CvXyRmXiiJBrbRiNkYiP4bYl+4iccng+dzS4zrbrTYjBj2U45rm6iaPZjWFY?=
 =?us-ascii?Q?JnckR8clH4nNgcV/iXq4JHts4yzHvPeyHtWxoVOOKZAq3upQ/T1Tj8/z1pXp?=
 =?us-ascii?Q?l0NomisVJIvOp9TOFUgPQSu3WG3ULNFX7HuGIFsR6yHegBChut6JxndmcrGa?=
 =?us-ascii?Q?zOqeet5hC8a+y/JJ9ymV0Hl9Gsx7CgvgBF6HqpzCYmqqLuX393Z76/E5N5rt?=
 =?us-ascii?Q?hgv9jv+3HGuSW+upzDEzpPzVNZjbB+k6qJrXFt61cmlTaRNWDYgLyx7KqII2?=
 =?us-ascii?Q?2R1ai6FHsIbjXMXgjadSxwH2agElTT5QT8ep5lBhWarTmuAHaHWqzjtB1CeX?=
 =?us-ascii?Q?y37ZIxX1kh+xK6+L7JKR1ln1GIz/YIh/1MoLqM2DgqsTE/cIk0Ta4j6JT2Um?=
 =?us-ascii?Q?t4Nf9CQwiVgjmjfbK0qzewkkzv54pDQcaCq3X36VbOAe/u7sugMGoMJYbfHW?=
 =?us-ascii?Q?HUY1QCPCM+HbtV3ii7KXOEw9Y2ZIMwVonlq6AYh8G2JlwpBL3g/q+xIT/bwA?=
 =?us-ascii?Q?tXShCZ8j44eK+pmc5Sv5pK+jduck8SFnfIJS0E7Y0xMvUAHeMqyZ8v12O+Yb?=
 =?us-ascii?Q?FnzpdM3lpDC7Rm8xcGk7LO6ITO5abmQfbJx8CPjJaAEUYUXf5xzKYM9Adkad?=
 =?us-ascii?Q?l2GHDZ2uriDPZox+HCQPL094HtNgmuC2BYuAThZ+QwLnzAGgaH9zZlBIGXU6?=
 =?us-ascii?Q?Bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2b57a2a-a71e-4971-38ee-08dd9fa0280a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 17:33:57.3352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H+zi1V0Ot6DSEHbzgaeWuvmVe7A545/GL/JkThD24+GyV6NMYgRIer7/AqlR0r6/ko5WuaYUjkv9gsWqtbeRz/tFVzCed+iIjBrcPcs5EI0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7104
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

On Fri, May 30, 2025 at 06:48:35PM +0200, Michal Wajdeczko wrote:
> We are processing here G2H messages, so we should use GT oriented
> messages to retain information about the origin GT.  While at it,
> print error codes in a user-friendly way.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 74 ++++++++++++++--------------
>  1 file changed, 36 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 7a8f87709e39..e0e68eda82bd 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -14,6 +14,7 @@
>  #include "abi/guc_actions_abi.h"
>  #include "xe_bo.h"
>  #include "xe_gt.h"
> +#include "xe_gt_printk.h"
>  #include "xe_gt_stats.h"
>  #include "xe_gt_tlb_invalidation.h"
>  #include "xe_guc.h"
> @@ -244,22 +245,22 @@ static int send_pagefault_reply(struct xe_guc *guc,
>  	return xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
>  }
>  
> -static void print_pagefault(struct xe_device *xe, struct pagefault *pf)
> +static void print_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  {
> -	drm_dbg(&xe->drm, "\n\tASID: %d\n"
> -		 "\tVFID: %d\n"
> -		 "\tPDATA: 0x%04x\n"
> -		 "\tFaulted Address: 0x%08x%08x\n"
> -		 "\tFaultType: %d\n"
> -		 "\tAccessType: %d\n"
> -		 "\tFaultLevel: %d\n"
> -		 "\tEngineClass: %d %s\n"
> -		 "\tEngineInstance: %d\n",
> -		 pf->asid, pf->vfid, pf->pdata, upper_32_bits(pf->page_addr),
> -		 lower_32_bits(pf->page_addr),
> -		 pf->fault_type, pf->access_type, pf->fault_level,
> -		 pf->engine_class, xe_hw_engine_class_to_str(pf->engine_class),
> -		 pf->engine_instance);
> +	xe_gt_dbg(gt, "\n\tASID: %d\n"
> +		  "\tVFID: %d\n"
> +		  "\tPDATA: 0x%04x\n"
> +		  "\tFaulted Address: 0x%08x%08x\n"
> +		  "\tFaultType: %d\n"
> +		  "\tAccessType: %d\n"
> +		  "\tFaultLevel: %d\n"
> +		  "\tEngineClass: %d %s\n"
> +		  "\tEngineInstance: %d\n",
> +		  pf->asid, pf->vfid, pf->pdata, upper_32_bits(pf->page_addr),
> +		  lower_32_bits(pf->page_addr),
> +		  pf->fault_type, pf->access_type, pf->fault_level,
> +		  pf->engine_class, xe_hw_engine_class_to_str(pf->engine_class),
> +		  pf->engine_instance);
>  }
>  
>  #define PF_MSG_LEN_DW	4
> @@ -311,7 +312,6 @@ static bool pf_queue_full(struct pf_queue *pf_queue)
>  int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  {
>  	struct xe_gt *gt = guc_to_gt(guc);
> -	struct xe_device *xe = gt_to_xe(gt);
>  	struct pf_queue *pf_queue;
>  	unsigned long flags;
>  	u32 asid;
> @@ -336,7 +336,7 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  			pf_queue->num_dw;
>  		queue_work(gt->usm.pf_wq, &pf_queue->worker);
>  	} else {
> -		drm_warn(&xe->drm, "PF Queue full, shouldn't be possible");
> +		xe_gt_warn(gt, "PageFault Queue full, shouldn't be possible\n");
>  	}
>  	spin_unlock_irqrestore(&pf_queue->lock, flags);
>  
> @@ -349,7 +349,6 @@ static void pf_queue_work_func(struct work_struct *w)
>  {
>  	struct pf_queue *pf_queue = container_of(w, struct pf_queue, worker);
>  	struct xe_gt *gt = pf_queue->gt;
> -	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_guc_pagefault_reply reply = {};
>  	struct pagefault pf = {};
>  	unsigned long threshold;
> @@ -360,9 +359,9 @@ static void pf_queue_work_func(struct work_struct *w)
>  	while (get_pagefault(pf_queue, &pf)) {
>  		ret = handle_pagefault(gt, &pf);
>  		if (unlikely(ret)) {
> -			print_pagefault(xe, &pf);
> +			print_pagefault(gt, &pf);
>  			pf.fault_unsuccessful = 1;
> -			drm_dbg(&xe->drm, "Fault response: Unsuccessful %d\n", ret);
> +			xe_gt_dbg(gt, "Fault response: Unsuccessful %pe\n", ERR_PTR(ret));
>  		}
>  
>  		reply.dw0 = FIELD_PREP(PFR_VALID, 1) |
> @@ -515,21 +514,21 @@ static int sub_granularity_in_byte(int val)
>  	return (granularity_in_byte(val) / 32);
>  }
>  
> -static void print_acc(struct xe_device *xe, struct acc *acc)
> +static void print_acc(struct xe_gt *gt, struct acc *acc)
>  {
> -	drm_warn(&xe->drm, "Access counter request:\n"
> -		 "\tType: %s\n"
> -		 "\tASID: %d\n"
> -		 "\tVFID: %d\n"
> -		 "\tEngine: %d:%d\n"
> -		 "\tGranularity: 0x%x KB Region/ %d KB sub-granularity\n"
> -		 "\tSub_Granularity Vector: 0x%08x\n"
> -		 "\tVA Range base: 0x%016llx\n",
> -		 acc->access_type ? "AC_NTFY_VAL" : "AC_TRIG_VAL",
> -		 acc->asid, acc->vfid, acc->engine_class, acc->engine_instance,
> -		 granularity_in_byte(acc->granularity) / SZ_1K,
> -		 sub_granularity_in_byte(acc->granularity) / SZ_1K,
> -		 acc->sub_granularity, acc->va_range_base);
> +	xe_gt_warn(gt, "Access counter request:\n"
> +		   "\tType: %s\n"
> +		   "\tASID: %d\n"
> +		   "\tVFID: %d\n"
> +		   "\tEngine: %d:%d\n"
> +		   "\tGranularity: 0x%x KB Region/ %d KB sub-granularity\n"
> +		   "\tSub_Granularity Vector: 0x%08x\n"
> +		   "\tVA Range base: 0x%016llx\n",
> +		   acc->access_type ? "AC_NTFY_VAL" : "AC_TRIG_VAL",
> +		   acc->asid, acc->vfid, acc->engine_class, acc->engine_instance,
> +		   granularity_in_byte(acc->granularity) / SZ_1K,
> +		   sub_granularity_in_byte(acc->granularity) / SZ_1K,
> +		   acc->sub_granularity, acc->va_range_base);
>  }
>  
>  static struct xe_vma *get_acc_vma(struct xe_vm *vm, struct acc *acc)
> @@ -627,7 +626,6 @@ static void acc_queue_work_func(struct work_struct *w)
>  {
>  	struct acc_queue *acc_queue = container_of(w, struct acc_queue, worker);
>  	struct xe_gt *gt = acc_queue->gt;
> -	struct xe_device *xe = gt_to_xe(gt);
>  	struct acc acc = {};
>  	unsigned long threshold;
>  	int ret;
> @@ -637,8 +635,8 @@ static void acc_queue_work_func(struct work_struct *w)
>  	while (get_acc(acc_queue, &acc)) {
>  		ret = handle_acc(gt, &acc);
>  		if (unlikely(ret)) {
> -			print_acc(xe, &acc);
> -			drm_warn(&xe->drm, "ACC: Unsuccessful %d\n", ret);
> +			print_acc(gt, &acc);
> +			xe_gt_warn(gt, "ACC: Unsuccessful %pe\n", ERR_PTR(ret));
>  		}
>  
>  		if (time_after(jiffies, threshold) &&
> @@ -683,7 +681,7 @@ int xe_guc_access_counter_notify_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  		acc_queue->head = (acc_queue->head + len) % ACC_QUEUE_NUM_DW;
>  		queue_work(gt->usm.acc_wq, &acc_queue->worker);
>  	} else {
> -		drm_warn(&gt_to_xe(gt)->drm, "ACC Queue full, dropping ACC");
> +		xe_gt_warn(gt, "ACC Queue full, dropping ACC\n");
>  	}
>  	spin_unlock(&acc_queue->lock);
>  
> -- 
> 2.47.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
