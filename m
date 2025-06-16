Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFDBC71136
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 18:53:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB48A10E41A;
	Mon, 16 Jun 2025 18:53:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hMjnvrFN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D7A10E41A
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Jun 2025 18:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750099978; x=1781635978;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Cf3LShd1dR1+JQQxoIJqHYtgm9IRpfy3i+VSMmxU7Qc=;
 b=hMjnvrFNTifRgSQK5PJxvaVK7ELZlBHzaxqL2bBoOrXkAFwyhrWg8LrY
 0BUn9Fqxeny0tbSwZJA/VtggGlUFnV/a5yFKfflDy805CZxnpPeDUesl/
 9cxd2eDATiXNbCbtgZAen9/Emucu1Tl7jS+/pgRJe6XRcpu2+1voCaVVH
 vwbLlIusn07+q6xBLIS2sKk5XuShYsXLAH/5lh4h1WkW9UOK442IjMMgM
 Iyu4u5s2HnPdeLalFgkgf0JL4zbqe5BbaFpdA3ekzuZIY4SRCB0eUYnoc
 FwAYIdZq4HnmtuJ1d+jZn79OInvJWlOpcwUxwaHCJjd1nv0MCPxqHwRsz g==;
X-CSE-ConnectionGUID: aKa7ClswSPaksNSWtuSLJA==
X-CSE-MsgGUID: ohFkGNJGTVKuuRHHydMsjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="51960027"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="51960027"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 11:52:55 -0700
X-CSE-ConnectionGUID: iR1ljkayQemGoTYEhUKVVw==
X-CSE-MsgGUID: 9brkeE9/QTSPxxyarNjtRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="179538956"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 11:52:53 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 11:52:44 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 11:52:44 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.87)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 11:52:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tRf6qmfSedcx5gKw5ke34innIPPDkk+IO5MaNCyPM9RPVKWgnF00PTC0CW7K5CKWkvT0vhoW867hIiJvoroayvq2XOXvtH5zCPfXywLYR0pOEyMDIeIAzsn0wU+8dFKYN76SLBQ7wOIJqQKWBwzSlMD7LyOcyS3kAhLj4rvWipe1HJizXTzHXk0SWy/drDiuVcvml0OBjw3S2z4pR5lFBcmUJ5eEl2JElLDNFjUZCTNbQckjndbV5wl5o4WpCJrn8NE7ZUVT6//nDoUL3h50EYpG6Z6IOktBy74jUPioI0Lr0dJ12X+J8EGxY+yGxByU6pSeMFH6AmkIOWg9CMYCxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ydloNbNHiCvsoN/acnktlQUOwETWN9q39bgnhPu1NtM=;
 b=K9s3jO95hwnsa72WJx6OQ0Mwln2aQvdGMT53+MIbD2N6HQjLFZn6r/es/SCSAR7k7MqTYP9Hgn4gqivDNmhSETQMfahDFvr+WtA8PQ5I7GsRJhHqZcox+2GWFN0GfEdib24F7Gqr9Enri1cI9DIhHMeeg14lasPRC5VbG0nr4tXnk+e+2c+KjFc2fGZJFWoB1OAoN9+LWFnjMIRTMyk+RZLEbXR1L1HQarFn9c+6xQfwc9ljBAbkzWSrNb/1oS5lElevaz0EAo1B6XmTIVtmqDlaNPp6bAInLMA0prDw213dQAbiAWtrPKTkv6hVB79idTY7oTtK0H7VnoZC80N4OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB8398.namprd11.prod.outlook.com (2603:10b6:208:487::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 18:52:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8835.018; Mon, 16 Jun 2025
 18:52:41 +0000
Date: Mon, 16 Jun 2025 13:52:39 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Mrozek <michal.mrozek@intel.com>, 
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2 3/3] drm/xe: Normalize default param values
Message-ID: <jfkgpylqiujyudvqr4ivn3653arznibeofzqrdyhiy4fv3tgsk@tjf4hde4izg3>
References: <20250613-guc-log-level-v2-0-cb84a63e49fe@intel.com>
 <20250613-guc-log-level-v2-3-cb84a63e49fe@intel.com>
 <4ac790b0-5c9c-4c15-a073-9007b3624e23@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <4ac790b0-5c9c-4c15-a073-9007b3624e23@intel.com>
X-ClientProxiedBy: BYAPR21CA0017.namprd21.prod.outlook.com
 (2603:10b6:a03:114::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB8398:EE_
X-MS-Office365-Filtering-Correlation-Id: a7ebdceb-6ffa-4851-284b-08ddad06f917
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?clqDdPyRcDw6Y46NDz6cySfQAWMNzVyIDNx6mexb1GG+UVA7dYej0Myx9NRU?=
 =?us-ascii?Q?1NZ9smUgK5o8oiYqY4h7RXNFQuud8hSzVpgqsbxfa8BLDNcn8jF9MBShtpB/?=
 =?us-ascii?Q?f5EaPkzq8b+M+PkRBI/28Gxy7s8NYlarAECI7x8w9cdnBZFqu+n5Cu3PsHZK?=
 =?us-ascii?Q?c7PNYY8cWpmj8MImXZdaPbucbSfYVULkzqRvGqTIxsFiteDHAMhY/uelpcTC?=
 =?us-ascii?Q?8W519s3j+nUOUA+rMUCBCiw3TydIjYJaGhO8vlaWuOH/7B8wdmJ1abLWRC0t?=
 =?us-ascii?Q?w4VgHtYnZ8ANwnyDr4x+hMKGlVTrgBHQrOsuhu1LvxQJm5ENq5CQWTuzxbgm?=
 =?us-ascii?Q?aeLUGGVQOZ7q8ptoqWElIP0LCaLENCcl8rfavCWmzHRDoU/k26IXJG9IWZ5M?=
 =?us-ascii?Q?qVvNTkdWOpcJTO1ZrDFwl7KPaLZcXrcxs6kX9gxzJDf5gduNqd4vjOmhfcyU?=
 =?us-ascii?Q?sRFa0gYORatYGAn/Y9OkpZeEvGzWfQfEPgF5hRSO2IvMyhB4D29V4F8pb3eI?=
 =?us-ascii?Q?+GsSEHPrKDbGnp2ZhNlHRSW6QSVcczvRiDTU1ZhOqhv1w1D+bbqzn8qnrtCb?=
 =?us-ascii?Q?aoE5XsuCNamHz/CmGuRD7ySeC81/1f4d1EJcr3b93YFwb3wRy7xG1r6f/I5l?=
 =?us-ascii?Q?3hNz5eZSEb3zRzqCVtCbd5W61ZOi/7V+boS4qvvesYcA10Gl8VPBJj2DHn7o?=
 =?us-ascii?Q?Yj0c7+XWpJmur5bAVYhKQcmRmCznWzPZ5CR8YjYBGXiNbdO/Cb70DUfC6IYq?=
 =?us-ascii?Q?x61Yaf0XRdxirwg6v+lRbVwpiFbTXlal3wB2NvORK3CwKzgqnclJlw5HITRX?=
 =?us-ascii?Q?zQqxC+ZW+MNh98QO/i59ti1SQW58IiMw0jPGItHR/9O2+uUVBfZ23ViXBrdO?=
 =?us-ascii?Q?YAIuoYsfHQeGq5NV++9x1LH3TwBmOEOztLR79zEg9EzCGcp2j+lZBcu1No9w?=
 =?us-ascii?Q?BnSJTE8ABipbCdzxKZU3IJMS0KWsL7KyhR0pAEIwKugmLcyw5UmjxKr003wX?=
 =?us-ascii?Q?hWpDBJRMKhbNCBXJy8Dh002VpkLCtw9hZhu07BHJ3og1izqt4U935LlhljEj?=
 =?us-ascii?Q?UeFy10NFRUUzbx6tx4ZPP5D0MWNY+AI2v+HU/HdPR1dRfsHE7AyKgLqVPZze?=
 =?us-ascii?Q?a+70m2G+gaMHTOiuIvPLfTkhizycUAezTcMq7Uej/ebtA9JqijgdQJ8ommWb?=
 =?us-ascii?Q?cw9i9iNoAF74MsFQCEvrRymd6TF/Cqo49E0klzrM1JWMITYd/9e5I1qTSdZT?=
 =?us-ascii?Q?pbhmbOxfaQ7TnEXCbY+TBQY1pppQrGWFUqjIguzGGPVPR2i6x2gyzg83idFn?=
 =?us-ascii?Q?i8PNkGLxnhRl6ykbyhL0G38242ddN6lVS066wdTe8ekxycYdQny8e5KMhz+t?=
 =?us-ascii?Q?3xo1qY+Miq+CoRqIHCkn0tgRsKHQfllao8WpmBh8fV2JIm6Tqb5YH9Eeavwq?=
 =?us-ascii?Q?WOcZZubqmtc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A0tC4yAR28S6/CjMWf1b3uXw9w2/Wt92UwuaCP0+T8Tmb3jLfGrBIaEOG0gs?=
 =?us-ascii?Q?+2gMEYWTdQho0+nB6/dclLGjSNiPC1rzQC9S2FUm+QoHymNGUUhY+d6+ATtH?=
 =?us-ascii?Q?ix9cjBPF2sPDoHYW1hAL1I8q+0BsXPthXuqnnR8gT7ZkhZTC5eIEuk4d63Lm?=
 =?us-ascii?Q?xueFQM/I8V4K0skIOGL2w7sd86s3nWP00gX4W/3NvrzwoMtPTyX2FEipSDaN?=
 =?us-ascii?Q?4xSrAFAW8F/pbUlwWyxnD56l9D5EIrM6F73BO9udZLKxyLJRtg58dqBjXdeu?=
 =?us-ascii?Q?rS79+9GflN2PTsygfZaSpiEZxxnoGXal3oOX6cc/0OwoKvA/+XRnq4mq+Rfd?=
 =?us-ascii?Q?sdl0fsUnMS0kMy0Nz87K/4y2cyC5RGdd+6AZd4qAjin/oRZdtB9sG0rysg2f?=
 =?us-ascii?Q?3CSs30l3ZwTHGpPBdzoSFiXsKn/dzPB38M92qZa0Dy4H0HEnpRYm4yLWTz/f?=
 =?us-ascii?Q?j6zRQS8XbsArJHNl5Le1/t5DxTmx7MTeR3PutRk3PxYvrbu+POLsP5IgXA7X?=
 =?us-ascii?Q?ZOLTcdXykwNSrm7l1EiPh4kAfMnUEZtjGQwB0J+zWMkeICB0WOzD3KUbPWH5?=
 =?us-ascii?Q?3GvRmSMj/jeJ0BbD6BnvpB5A94Ze5BeFTeDqFkZOY1htc3LBwv+Oqdb4Qn50?=
 =?us-ascii?Q?UqUKiLcvphONQiYfj2hcRQ21XE3EwuP0Nll+kVLRqCKeruQ2sIGiwzZqbsC2?=
 =?us-ascii?Q?CzJySUAx+626WsAdPlzhJ6xyebe1UghCBEVhDpVm063jZt2kUPA1Q8qd/nhY?=
 =?us-ascii?Q?iqktT/11OTVgx3w9ZVqe4NyKOg+qAX3/Hz1UDbX5DZYrkMm+VYTD3TYc8xJK?=
 =?us-ascii?Q?FJDIg+htzFDwY/3tSMbykhfVqovbnTg4uTnVtImEI+2dS9on2cX8Zgt7Kdgb?=
 =?us-ascii?Q?m5+2qbjl6aH6coXgGhdB9VCdWONT8GDsk3mCPlPBSEID4UylFgqlN35Vf7b6?=
 =?us-ascii?Q?GMgWPuvmfXC+PFYoCrEGpW9LJcLda3YrJN7Zv8v5cvKXlSf8aCJ7X6HDWOeX?=
 =?us-ascii?Q?oKpO9MvMVOOJ1rdICPHvNNGfaFaacUiMgYDLs+2PLTYe7Cwx6TbjqLJxbFYK?=
 =?us-ascii?Q?iW9hhNcKPYq9bPy9Mefrzb4dtps4CnTe9J2gnWRp0ffniz/QNRCQqTr57Rxj?=
 =?us-ascii?Q?cmBUFPxzUIzInlkspCvMviojB8tTf+xbKghwC+akw0rIzbcNSk1Pt0OIiVei?=
 =?us-ascii?Q?xRLOq1o16PfCJjLAvjtYvyy0JcE9lZV/7iGfJVEanG4KMJrvbfvvmPs89yL7?=
 =?us-ascii?Q?tORjb1Y9YOlXxh4kj6rU7M4BG/s4a5xXLkgc/uSyaKTBEplgMVBj2PSOxff+?=
 =?us-ascii?Q?FtX5So0kbDkK9aC0ga8tNWbu2uxK3enE/BtM8xNsx/fK04JKyV7Y7u2LYyCV?=
 =?us-ascii?Q?rZCqcGRL4qY++nEOW/h/vYRRIXXF/Ro1CvaYDDEfU07iRe28wUf7pO4lollP?=
 =?us-ascii?Q?ZLnA1A8f7mQFnpjw0B3p8dI17dWoLY0eeT2QKmUcQ8PXp9BVq44+0YsSrYt0?=
 =?us-ascii?Q?ClwK0gOTUBoNaM87z5jKYN8GAg/dx9mAVrAvGRmV9R8pokBEKwzDIEpAPrxJ?=
 =?us-ascii?Q?UAJVT9ZjfpojxC5jv7qiK+pvmsQXwBV0IPJb6hPtGCjPPQEeCwRINTrVdAXN?=
 =?us-ascii?Q?iQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7ebdceb-6ffa-4851-284b-08ddad06f917
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 18:52:41.8345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4io+Esy9OW//aWkKuWYvfQ3mqMhul20xeZdSbrFugz6MowdFR0KzWeRJ4CxxMx5CgEcoL2avaCayG0m/O5HV0iIRg3yCd7PPkRxo5+GygWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8398
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

On Mon, Jun 16, 2025 at 11:46:57AM -0700, John Harrison wrote:
>On 6/13/2025 1:00 PM, Lucas De Marchi wrote:
>>Document xe module params with the default values following a similar
>>strategy for all of them:
>>
>>	1) Define a DEFAULT_* macro with the default value. When the
>>	   value can't be directly stringified, also define a *_STR
>>	   variant
>>	2) Use __stringify() or the _STR variant to make sure the
>>	   default value shows up in the param description
>>
>>This allows us to show the correct default according to the
>>configuration. max_vfs for example was wrongly documented for
>>CONFIG_DRM_XE_DEBUG and svm_notifier_size didn't have its default
>>documented.
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>  drivers/gpu/drm/xe/xe_module.c | 44 +++++++++++++++++++++++++++---------------
>>  1 file changed, 28 insertions(+), 16 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>>index 192908fa074cb..2068c579d5c3b 100644
>>--- a/drivers/gpu/drm/xe/xe_module.c
>>+++ b/drivers/gpu/drm/xe/xe_module.c
>>@@ -19,34 +19,43 @@
>>  #include "xe_sched_job.h"
>>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>>-#define DEFAULT_GUC_LOG_LEVEL	3
>>+#define DEFAULT_GUC_LOG_LEVEL		3
>>+#define DEFAULT_MAX_VFS			~0
>>+#define DEFAULT_MAX_VFS_STR		"unlimited"
>>  #else
>>-#define DEFAULT_GUC_LOG_LEVEL	1
>>+#define DEFAULT_GUC_LOG_LEVEL		1
>>+#define DEFAULT_MAX_VFS			0
>>+#define DEFAULT_MAX_VFS_STR		"0"
>Could be 'stringify(MAX_VFS)'.

I think it's better to pair with the one above.
We don't want to print the the default is ~0 in the other case so we
create a manual _STR.


>
>>  #endif
>>+#define DEFAULT_PROBE_DISPLAY		true
>>+#define DEFAULT_FORCE_PROBE		CONFIG_DRM_XE_FORCE_PROBE
>>+#define DEFAULT_WEDGED_MODE		1
>>+#define DEFAULT_SVM_NOTIFIER_SIZE	512
>>+
>>  struct xe_modparam xe_modparam = {
>>-	.probe_display = true,
>>-	.guc_log_level = DEFAULT_GUC_LOG_LEVEL,
>>-	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
>>-#ifdef CONFIG_PCI_IOV
>This ifdef is lost from the new version?

yeah, dropped it by mistake... will need to add it back.
>
>>-	.max_vfs = IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? ~0 : 0,
>>-#endif
>>-	.wedged_mode = 1,
>>-	.svm_notifier_size = 512,
>>+	.probe_display =	DEFAULT_PROBE_DISPLAY,
>>+	.guc_log_level =	DEFAULT_GUC_LOG_LEVEL,
>>+	.force_probe =		DEFAULT_FORCE_PROBE,
>>+	.max_vfs =		DEFAULT_MAX_VFS,
>>+	.wedged_mode =		DEFAULT_WEDGED_MODE,
>>+	.svm_notifier_size =	DEFAULT_SVM_NOTIFIER_SIZE,
>>  	/* the rest are 0 by default */
>>  };
>>  module_param_named(svm_notifier_size, xe_modparam.svm_notifier_size, uint, 0600);
>>-MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size(in MiB), must be power of 2");
>>+MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size in MiB, must be power of 2 "
>>+		 "[default=" __stringify(DEFAULT_SVM_NOTIFIER_SIZE) "]");
>>  module_param_named_unsafe(force_execlist, xe_modparam.force_execlist, bool, 0444);
>>  MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
>>  module_param_named(probe_display, xe_modparam.probe_display, bool, 0444);
>>-MODULE_PARM_DESC(probe_display, "Probe display HW, otherwise it's left untouched (default: true)");
>>+MODULE_PARM_DESC(probe_display, "Probe display HW, otherwise it's left untouched "
>>+		 "[default=" __stringify(DEFAULT_PROBE_DISPLAY) "])");
>>  module_param_named(vram_bar_size, xe_modparam.force_vram_bar_size, int, 0600);
>>-MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size (in MiB) - <0=disable-resize, 0=max-needed-size[default], >0=force-size");
>>+MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size in MiB (<0=disable-resize, 0=max-needed-size, >0=force-size [default=0])");
>Why leave this one as hard coded value rather than a define?

there wasn't an assignment xe_modparam, so I overlooked it. I will fix
those up in next rev

thanks
Lucas De Marchi


>
>John.
>
>>  module_param_named(guc_log_level, xe_modparam.guc_log_level, int, 0600);
>>  MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1=normal, 2..5=verbose-levels "
>>@@ -66,18 +75,21 @@ MODULE_PARM_DESC(gsc_firmware_path,
>>  module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
>>  MODULE_PARM_DESC(force_probe,
>>-		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
>>+		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details "
>>+		 "[default=" DEFAULT_FORCE_PROBE "])");
>>  #ifdef CONFIG_PCI_IOV
>>  module_param_named(max_vfs, xe_modparam.max_vfs, uint, 0400);
>>  MODULE_PARM_DESC(max_vfs,
>>  		 "Limit number of Virtual Functions (VFs) that could be managed. "
>>-		 "(0 = no VFs [default]; N = allow up to N VFs)");
>>+		 "(0=no VFs; N=allow up to N VFs "
>>+		 "[default=" DEFAULT_MAX_VFS_STR "])");
>>  #endif
>>  module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, int, 0600);
>>  MODULE_PARM_DESC(wedged_mode,
>>-		 "Module's default policy for the wedged mode - 0=never, 1=upon-critical-errors[default], 2=upon-any-hang");
>>+		 "Module's default policy for the wedged mode (0=never, 1=upon-critical-errors, 2=upon-any-hang "
>>+		 "[default=" __stringify(DEFAULT_WEDGED_MODE) "])");
>>  static int xe_check_nomodeset(void)
>>  {
>>
>
