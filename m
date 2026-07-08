Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191BAC43458
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jul 2026 03:29:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC7510E53D;
	Wed,  8 Jul 2026 03:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k70usqN/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4857110E53D
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jul 2026 03:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783481365; x=1815017365;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fdLcKbzAuvqVu0O3vJbFsIJttmyYoEtHxUVu1ryJlR0=;
 b=k70usqN/90zRrnIkkuLdgAQzQapT22zxFOIDZPeV1JVx3qmaqsr0FOW0
 jubYu6vtaFdyN6m+hhEy5LKjJ0nAAKyvAn/QxRHB3p7lq9QrPHAJyhvog
 2/rCOLpT/bMLdEDi+XovSAQXQgPzgsnx+1K8GdtEce0l+rXgWhQ44AWIv
 uRqiDqiRtP7h5R5o/d/TuLpwuY//wOh30IVFpZ9A8PBrxWMnH9jkcnOI0
 BpPrOYlzOkJ6a60TUyAD8NZ/clb+s2LTwWWDMsFg44jJrNlQFnvMMCfbY
 cWYh4VNsuQ62xyqn5CSfHqetUwGcVnno2gyo6YCK0girNdwranDlKkZry A==;
X-CSE-ConnectionGUID: FMLSNFwDTYmXnD5y/rlaKA==
X-CSE-MsgGUID: kwOwNIUdRXqEXPUUAnpVqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="83913804"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="83913804"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 20:29:25 -0700
X-CSE-ConnectionGUID: o9dcXnZhTYCvWpvPLt3tuA==
X-CSE-MsgGUID: g4vla7r5QD+++Trc/J3c+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="254243991"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 20:29:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 7 Jul 2026 20:29:24 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 7 Jul 2026 20:29:24 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.49) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 7 Jul 2026 20:29:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ooGs6t9C7AIJCF+pM5VmBi4ODF/uvfUGu8j5FYxEQt9CGnYMyi3+AxmIPruBuigTV1hWYZbG8txxt5qghb+fHLPehBQ3KqF1hYhQmshK6WkB2wKEHwA6YfalddQ2m8tYgCNHWSPCqfE9MGXPgkYpZ7d7snj4EfnmT43yti0aI5UP+vmIMaE9dAfF2+QdcSPUICgtwjvYThH4To3KwWcWoLUmKKDUaclL30Lg4STJkc2oSVUjhY8+9iOwtHx/f3kLVKosuMC+iAKZaC8OHeffjgpek/0p2LUp0qPK0bGBYOq0JiuVPL8wzM+YIJTKfQW8v77YAcfnonhuYBuj2JLghg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fhbrKk3b5rXZp/rJgez5HQ++Dv9Its1+kB3wwg8jxkI=;
 b=fIO8bCMxe8fE3IlWUD339HCuDp+g8fup/VoGj6RDhHpZXxX3665MQyMNocH5ymFSkROapABWPjBsI5HO30sV9eeQbnrT6MBaJgmBtTmiDrsZe3to5zWJrYDgtdWgEfPqdcRYpc/BjnjMQ83cfpVCSrZgRdRvjWvnxKr+06H/VJdkzxeszV/ovU3nAtQtGT78jdhIKlgm532qRWp+BFUT30hHz9w2xpdHMaVnZckRiNZPUg0r8+IuXWqCR3Pl1vVRoCmHW6xIUqxTfLFPPqsc3Sa7FAcq8jOMzOeOEzogkksxKxjy2uoj6KFz2W4jKTdhFv6pDwZz8NBv/DYxZEaILQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by SN4PR11MB9944.namprd11.prod.outlook.com (2603:10b6:806:4ff::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 03:29:22 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.21.0181.008; Wed, 8 Jul 2026
 03:29:21 +0000
Date: Tue, 7 Jul 2026 20:29:17 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Stuart Summers <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe/configfs: Add disable_multi_queue attribute
Message-ID: <ak3EDcmH4KCEFP3a@nvishwa1-desk>
References: <20260701203805.3007798-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260701203805.3007798-1-shuicheng.lin@intel.com>
X-ClientProxiedBy: SJ0PR05CA0183.namprd05.prod.outlook.com
 (2603:10b6:a03:330::8) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|SN4PR11MB9944:EE_
X-MS-Office365-Filtering-Correlation-Id: ccac7977-def2-4213-cdf3-08dedca11949
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|6133799003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: rF4iuQY3ixvv+lxa+cWQe/Pax3NCd0c5ayiQ5qZIq8Sap5Y4RQ/ho8NcOjHcodjkjG1s6ZXNt0dzjYmK0Gxvm636ZNNv4q8bSddi/ZS4aw/cVi3abbJxFM3qeXIbszdgZ1I7/9uCaFrHhw/uhzjCRIN7RBXTZabfHAYGtKw/0KGSRUWorGoZ5ZHHh+CuSEtHlrzu+jfBy+AQP9de5Zsq4kE6jPQozAAeeueTUI73gQ8jgx4H5MQVKvIOrCUNOKFESnn0OizH1zj477jo0L694/x45PaV6k7zg5rL02r/5OKYgCYBMHAhKnXnWKasiO55LM169y97XIt3uQnNT/d1DrJZQBdUCGp/QC6kNK1cSzuhFAtlNuuGdR6NNZxRn6SQU05H11RVG9mEZjsBphmxho996EEDOGPNgTyUg1rAmTL5GAASl4Tej5zixpniHWPiZQMsWjV1Cae5cf2rwf0D1N41cZ3Hp0Zl2dwKpzT/uQlL8Rhm94Trkl//EAyLdkNf0S0pj90MMtwUGUs+eAMqHyvRWaDneW/S6na7oCjbmqaDtIX17VtH6FcSakM+mPJqkUo6dLcRwt6aFsefhFYaRV8vp1dX15kkrgNL/Z1f/fIUtOSuhkAlrp16y5PJPekMGk6CuJuk/Ov45GrsrlFirPRrqiNBXUxcygIDTl1tRnU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K5rOSHozPxSNGIRmmkD0IE+dgVHB8ZPALSqtlg5l2yevtItX6/pDKf1LS3mk?=
 =?us-ascii?Q?wdamK0hjA0HPQn01eaQKInWdUVEz2e8s3Cda1QYWUyuQlyUtYDVuLvoomKS5?=
 =?us-ascii?Q?h6pbb789K/8kMVUNeG8cOsex1WetcuDIgTcjR2A5T0dC7y4hpSe2cZ5Aj1b2?=
 =?us-ascii?Q?DwKMgPFc6cBYK4viQFcy1lj4CxXeTOuH9eTV0raMQhzNIli9ahTV+PvMxSeT?=
 =?us-ascii?Q?xoVuZ8TXZa/7W9m9F+xC7gSzXFsi80zQGYQtXVB8DrmHGReVRxiPq4XKyMkw?=
 =?us-ascii?Q?9yINRvY2XkDzbiyN/eaagprTMbjcZhV5tv3FfuOpXniWXS7Ip6F+o0k4lkRK?=
 =?us-ascii?Q?SxkBUru2bgG0pjgnR4IRDQhs5y7RYZa5fjHD/O/L3NaOfV4Z9NJJXa0cCWE+?=
 =?us-ascii?Q?qn+Gr9NENAvnIXqmk7Afkyjn6/FrqqYsi8R9flp03zZ9PMOTtPPxsgCqQpYe?=
 =?us-ascii?Q?sA8ujCus5PDuPviPJsKvvLt+joNrHUqIc9qMMK1p0EL1fXDLuf8hPMk4+tBA?=
 =?us-ascii?Q?+Qt1V+g2flFPEaDmACgD+0IJSWt78Zy/jp0SCGudD2/4j3TSM/lWAU5y72ih?=
 =?us-ascii?Q?hwOViF3yytDSFQF+CW2aLh3lzwfgH3DanbDotfdfco3taNJIHDPznV4mL+5p?=
 =?us-ascii?Q?58fzatUiFLenjPQL6bvTITHTpxslCUwUVXutnfC9zbyIkBWL+OpxOaqgpn4T?=
 =?us-ascii?Q?Z6UFvIpKn/4WBEmWgkjxoJm1iN3mC7QpeclesyFxB4lFgsbmONDOTk14Aeyu?=
 =?us-ascii?Q?BF31rCGmdMCxPBU8ubG5DVnBPNo7ACzi2fxtYDCr2j8Y1GGR7TS+McP8yPND?=
 =?us-ascii?Q?3mzNpVQfZPfltaTQfdWNq5ube+GHj7PAlH3Js3WOKPRrvF3XzuISak59gyR3?=
 =?us-ascii?Q?PFNgsZEbFbWWfGb7T8QV3wGETgP5XFOJ2JtFie9iLunwolnWfJK+yUw3D42B?=
 =?us-ascii?Q?zcgwq6hFVwYDFDMm3Di1o2RpMGYOWWufOPORfIxE8MngZske7yfTtvuuqxOb?=
 =?us-ascii?Q?Y8NA69IuKvudfVAiW2riaRnJNehPwFNNqAqgtrfA0Ll4j8wVgxFtxPaJ6GNk?=
 =?us-ascii?Q?TkaQ8510u66G8n9yPz34tzUu5LkdpngcM6uDMB/tLM0Jcj0L44PEDRwn2sa3?=
 =?us-ascii?Q?ywgy98YfY6H76tL2NMBHA3sv5XoBOd/feq14zAoOqgTvi2FYipYj7tQ/htvk?=
 =?us-ascii?Q?OO5NvhLXzXUsaKjfQSzZgU/5fc/rJJFopZQnyPJGBr8BmXc5PSaLikWfl/WA?=
 =?us-ascii?Q?90hmDoiMy/iv+DF8vN8qCHYpzJHqHbUOpRrKeIrM1NF/vl9Um4nuyPm++ZgQ?=
 =?us-ascii?Q?C303AjZ73iWIyGAGww4Z8JJkW6IxQgVgzKPdkgaZ/0Njywll4sdCBVvgg9Sn?=
 =?us-ascii?Q?m13GdN0OHS0BE6x37wfo6RS7iOTwBYCMVUR9NDF7FaAy1DjC1y9d90OFeYX6?=
 =?us-ascii?Q?/LXNx7WKLt1ZbLY3qzi6Oqc2H08coYRCDAeDnSCt7JQMzJTZC+OuoGQUfmzp?=
 =?us-ascii?Q?OtG+dOy5dkMYxCmecmh992WXsBlzr6ABjMMu+27bNeoV2QOLYko7tpiT3rAI?=
 =?us-ascii?Q?KWey3M85eUBHGlZGO12AM5ip8UUcj643I7CKeaiNaXMYJPmmgEHkEXFdc+PV?=
 =?us-ascii?Q?oZ3h7m+SZtOKZDzFRJsmQ4/Qkg7xa6UJXm+MQ5ZtJeN0cAohXtavyKNx2q5q?=
 =?us-ascii?Q?3XXuk3QXmyRoCn8sEKPJflGs8vQ91jdhbXPPnpl0+c0HhTDOgcpdiWio1mrg?=
 =?us-ascii?Q?Y8Q7t4k4P9uSAuApNGpTttbO86EEWoHUTr64B7vW7Hpktxaom7V7?=
X-Exchange-RoutingPolicyChecked: RZzF4J0eKwgZNopIP52kewSg23xRW5zkuZoBBI45U6bpl7PLdKQD49o0PlqVjqSs4PMTlzMKZwVPyGyhr/M+e9YycZUxBZitEsaOw3QEpz8oI1f6BbKhB48ZX3u5hZR8NjVtzuFA1kgBE2BxlcEY0hHvSg18jeP9uIw8gxxHf93wLmXfnptxef+3+qd+OmqSYuVaCh7nlJoXVkZhX5j1TdgIBUpuhekG0/gk5OvF65TeMsGbCk9XxhGcOvvmG/vAua6uRH7a6pYwEJPfAcJGsSovvsgSDgJrSGtM52CMC+Z4o+cU+BvUeas24vp2NVavBdXUvD0vu7JGIwW32fMR+Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: ccac7977-def2-4213-cdf3-08dedca11949
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 03:29:21.7553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DNWrj57lCHI3elJxfKrRBA0fkizs5TZg1jsxj01bBxaOSJ+msK7LiupKrmz7j+5XaGVcTTJlH3wFrUnQ+uqJxZc8TwIFYQGA9ORxdU+1K3c9WythWyLo4kNIeUopS0Ah
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR11MB9944
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

On Wed, Jul 01, 2026 at 08:38:05PM +0000, Shuicheng Lin wrote:
>Add a new configfs boolean attribute 'disable_multi_queue' that lets an
>administrator force-disable multi-queue support on a device before it
>binds to the driver. This is intended for debugging and for validating
>non-multi-queue code paths on hardware that would otherwise expose
>multi-queue.
>
>The hook disables multi-queue at two levels:
>
>- UAPI: In alloc_primary_gt(), clear
>  gt->info.multi_queue_engine_class_mask on the primary GT so that
>  xe_gt_supports_multi_queue() returns false and attempts to create
>  a multi-queue group via DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP
>  are rejected.
>
>- GuC: In guc_ctl_feature_flags(), set the GUC_CTL_DISABLE_MULTI_QUEUE
>  (BIT(24)) init-params bit on GuC firmware older than 70.66. On GuC
>  firmware 70.66 and above, guc_waklv_init() emits the new
>  GUC_FEATURE_KLV_DISABLE_MULTI_QUEUE Feature KLV (0x5001) via the ADS
>  WA/Feature KLV buffer instead. Feature KLVs share the WA KLV buffer.

Looks like we are not at guc firmware version 70.66 yet. I am not sure
about coding for future guc firmware releases. Probably fine if the
firmware has been already released to the public and just that we are
not upgraded to it here.

>
>The attribute is rejected after the device has been bound, so it only
>takes effect during probe:
>
>	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/disable_multi_queue
>	# echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind
>
>Assisted-by: Claude:claude-opus-4.7
>Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
>---
>Cc: Stuart Summers <stuart.summers@intel.com>
>Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>---
> drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  3 +-
> drivers/gpu/drm/xe/xe_configfs.c      | 63 +++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_configfs.h      |  2 +
> drivers/gpu/drm/xe/xe_guc.c           |  8 ++++
> drivers/gpu/drm/xe/xe_guc_ads.c       | 14 ++++++
> drivers/gpu/drm/xe/xe_guc_fwif.h      |  1 +
> drivers/gpu/drm/xe/xe_pci.c           |  2 +
> 7 files changed, 92 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>index 644f5a4226d7..998272a007e5 100644
>--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>@@ -491,9 +491,10 @@ enum  {
> #define GUC_KLV_VF_CFG_ENGINE_GROUP_PREEMPT_TIMEOUT_MIN_LEN	1u
> #define GUC_KLV_VF_CFG_ENGINE_GROUP_PREEMPT_TIMEOUT_MAX_LEN	GUC_MAX_SCHED_GROUPS
> /*
>- * Workaround keys:
>+ * Feature and Workaround keys:
>  */
> enum xe_guc_klv_ids {
>+	GUC_FEATURE_KLV_DISABLE_MULTI_QUEUE						= 0x5001,
> 	GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED				= 0x9002,
> 	GUC_WORKAROUND_KLV_DISABLE_PSMI_INTERRUPTS_AT_C6_ENTRY_RESTORE_AT_EXIT		= 0x9004,
> 	GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING				= 0x9005,
>diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>index 32102600a148..cd94f0d80edd 100644
>--- a/drivers/gpu/drm/xe/xe_configfs.c
>+++ b/drivers/gpu/drm/xe/xe_configfs.c
>@@ -237,6 +237,16 @@
>  *
>  * This setting only takes effect when probing the device.
>  *
>+ * Disable multi-queue
>+ * -------------------
>+ *
>+ * Disable multi-queue support on the device. Multi-queue exec-queue
>+ * group creation via ioctl is refused, and the GuC feature is disabled.
>+ *
>+ *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/disable_multi_queue
>+ *
>+ * This attribute can only be set before binding to the device.
>+ *
>  * Remove devices
>  * ==============
>  *
>@@ -262,6 +272,7 @@ struct xe_config_group_device {
> 		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
> 		bool survivability_mode;
> 		bool enable_psmi;
>+		bool disable_multi_queue;

Why not just name it enable_multi_queue and have it enabled by default?
Looks like that is the generally followed convention.

> 		struct {
> 			unsigned int max_vfs;
> 			bool admin_only_pf;
>@@ -281,6 +292,7 @@ static const struct xe_config_device device_defaults = {
> 	.engines_allowed = U64_MAX,
> 	.survivability_mode = false,
> 	.enable_psmi = false,
>+	.disable_multi_queue = false,
> 	.sriov = {
> 		.max_vfs = XE_DEFAULT_MAX_VFS,
> 		.admin_only_pf = XE_DEFAULT_ADMIN_ONLY_PF,
>@@ -575,6 +587,33 @@ static ssize_t enable_psmi_store(struct config_item *item, const char *page, siz
> 	return len;
> }
>
>+static ssize_t disable_multi_queue_show(struct config_item *item, char *page)
>+{
>+	struct xe_config_device *dev = to_xe_config_device(item);
>+
>+	return sprintf(page, "%d\n", dev->disable_multi_queue);
>+}
>+
>+static ssize_t disable_multi_queue_store(struct config_item *item, const char *page,
>+					 size_t len)
>+{
>+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
>+	bool val;
>+	int ret;
>+
>+	ret = kstrtobool(page, &val);
>+	if (ret)
>+		return ret;
>+
>+	guard(mutex)(&dev->lock);
>+	if (is_bound(dev))
>+		return -EBUSY;
>+
>+	dev->config.disable_multi_queue = val;
>+
>+	return len;
>+}
>+
> static bool wa_bb_read_advance(bool dereference, char **p,
> 			       const char *append, size_t len,
> 			       size_t *max_size)
>@@ -812,6 +851,7 @@ static ssize_t ctx_restore_post_bb_store(struct config_item *item,
>
> CONFIGFS_ATTR(, ctx_restore_mid_bb);
> CONFIGFS_ATTR(, ctx_restore_post_bb);
>+CONFIGFS_ATTR(, disable_multi_queue);
> CONFIGFS_ATTR(, enable_psmi);
> CONFIGFS_ATTR(, engines_allowed);
> CONFIGFS_ATTR(, gt_types_allowed);
>@@ -820,6 +860,7 @@ CONFIGFS_ATTR(, survivability_mode);
> static struct configfs_attribute *xe_config_device_attrs[] = {
> 	&attr_ctx_restore_mid_bb,
> 	&attr_ctx_restore_post_bb,
>+	&attr_disable_multi_queue,
> 	&attr_enable_psmi,
> 	&attr_engines_allowed,
> 	&attr_gt_types_allowed,
>@@ -1098,6 +1139,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
> 	PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
> 	PRI_CUSTOM_ATTR("%llx", engines_allowed);
> 	PRI_CUSTOM_ATTR("%d", enable_psmi);
>+	PRI_CUSTOM_ATTR("%d", disable_multi_queue);
> 	PRI_CUSTOM_ATTR("%d", survivability_mode);
> 	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
>
>@@ -1225,6 +1267,27 @@ bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev)
> 	return ret;
> }
>
>+/**
>+ * xe_configfs_get_disable_multi_queue - get configfs disable_multi_queue setting
>+ * @pdev: pci device
>+ *
>+ * Return: true if multi-queue should be disabled for this device, false
>+ * otherwise.
>+ */
>+bool xe_configfs_get_disable_multi_queue(struct pci_dev *pdev)
>+{
>+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
>+	bool ret;
>+
>+	if (!dev)
>+		return false;
>+
>+	ret = dev->config.disable_multi_queue;
>+	config_group_put(&dev->group);
>+
>+	return ret;
>+}
>+
> /**
>  * xe_configfs_get_ctx_restore_mid_bb - get configfs ctx_restore_mid_bb setting
>  * @pdev: pci device
>diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
>index 07d62bf0c152..d41f52bd66b7 100644
>--- a/drivers/gpu/drm/xe/xe_configfs.h
>+++ b/drivers/gpu/drm/xe/xe_configfs.h
>@@ -23,6 +23,7 @@ bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
> bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
> u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
> bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
>+bool xe_configfs_get_disable_multi_queue(struct pci_dev *pdev);
> u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
> 				       enum xe_engine_class class,
> 				       const u32 **cs);
>@@ -42,6 +43,7 @@ static inline bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev) { return
> static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return true; }
> static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
> static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
>+static inline bool xe_configfs_get_disable_multi_queue(struct pci_dev *pdev) { return false; }
> static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
> 						     enum xe_engine_class class,
> 						     const u32 **cs) { return 0; }
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index 4023700ff2a9..cdd096a37e05 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -101,6 +101,14 @@ static u32 guc_ctl_feature_flags(struct xe_guc *guc)
> 	if (xe_device_is_l2_flush_optimized(xe) && xe_gt_is_media_type(guc_to_gt(guc)))
> 		flags |= GUC_CTL_ENABLE_L2FLUSH_OPT;
>
>+	/*
>+	 * On GuC firmware 70.66 and above, the GUC_FEATURE_KLV_DISABLE_MULTI_QUEUE
>+	 * Feature KLV is used instead.
>+	 */
>+	if (xe_configfs_get_disable_multi_queue(to_pci_dev(xe->drm.dev)) &&
>+	    !GUC_FIRMWARE_VER_AT_LEAST(guc, 70, 66))
>+		flags |= GUC_CTL_DISABLE_MULTI_QUEUE;
>+
> 	return flags;
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>index c98454545a85..898ec2c6f015 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ads.c
>+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>@@ -16,6 +16,7 @@
> #include "regs/xe_gt_regs.h"
> #include "regs/xe_guc_regs.h"
> #include "xe_bo.h"
>+#include "xe_configfs.h"
> #include "xe_gt.h"
> #include "xe_gt_ccs_mode.h"
> #include "xe_gt_mcr.h"
>@@ -364,6 +365,19 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
> 		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
> 				 GUC_WA_KLV_CLR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CTX_REG);
>
>+	/*
>+	 * On GuC firmware 70.66 and above, use the Feature KLV (shared with the
>+	 * WA KLV buffer); older firmware uses GUC_CTL_DISABLE_MULTI_QUEUE in
>+	 * the init params instead.
>+	 */
>+	if (xe_configfs_get_disable_multi_queue(to_pci_dev(gt_to_xe(gt)->drm.dev)) &&
>+	    GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 66)) {
>+		u32 data = 1;
>+
>+		guc_waklv_enable(ads, &data, 1, &offset, &remain,
>+				 GUC_FEATURE_KLV_DISABLE_MULTI_QUEUE);
>+	}
>+
> 	size = guc_ads_waklv_size(ads) - remain;
> 	if (!size)
> 		return;
>diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
>index 3fbda4798cff..971b850f2136 100644
>--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>@@ -68,6 +68,7 @@ struct guc_update_exec_queue_policy {
> #define   GUC_CTL_MAIN_GAMCTRL_QUEUES	BIT(9)
> #define   GUC_CTL_DISABLE_SCHEDULER	BIT(14)
> #define   GUC_CTL_ENABLE_L2FLUSH_OPT	BIT(15)
>+#define   GUC_CTL_DISABLE_MULTI_QUEUE	BIT(24)
>
> #define GUC_CTL_DEBUG			3
> #define   GUC_LOG_VERBOSITY		REG_GENMASK(1, 0)
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 03362480e3e0..23ef2c7b6bce 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -862,6 +862,8 @@ static struct xe_gt *alloc_primary_gt(struct xe_tile *tile,
> 	gt->info.id = tile->id * xe->info.max_gt_per_tile;
> 	gt->info.has_indirect_ring_state = graphics_desc->has_indirect_ring_state;
> 	gt->info.multi_queue_engine_class_mask = graphics_desc->multi_queue_engine_class_mask;
>+	if (xe_configfs_get_disable_multi_queue(to_pci_dev(xe->drm.dev)))
>+		gt->info.multi_queue_engine_class_mask = 0;

May be add a print statement here like "disabled via configfs" similar to one
in check_sw_disable() in xe_hw_engine.c?

Niranjana

> 	gt->info.engine_mask = graphics_desc->hw_engine_mask;
> 	gt->info.num_geometry_xecore_fuse_regs = graphics_desc->num_geometry_xecore_fuse_regs;
> 	gt->info.num_compute_xecore_fuse_regs = graphics_desc->num_compute_xecore_fuse_regs;
>-- 
>2.43.0
>
