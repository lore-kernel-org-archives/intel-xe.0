Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A916D1D478
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 16:15:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3347410E790;
	Thu,  8 Jan 2026 16:15:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fae2hVI2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6ED310E790
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 16:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767888907; x=1799424907;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hSt5Ae+aA4gb8NIn3ODfyjtxiaKjh6nVCUeMpF1mZs4=;
 b=Fae2hVI27AkSbj3K5eoajUh155o5efkBlHeJLG++cphcLi77/K0uaYw9
 iI3H2PHxfZuaJ/2LfPuVpa0YfgqSqV2hvImVrFZVUoYMuq46a0Hs7BlK7
 RvtR3BKzpG5T0GEb/Pl8DPS6gH6a9NMwWO/GL+m+bNqI/iVhwSespW444
 NuvuS1NnF9WLh3xVJ3D9Bi2VkpgJlyjWeY+z1XMWcKzb+ulFsBq6gDrbS
 sJIxoAaZj5vibknoha1R/wVyA9YVffPmClaw1nT6/V0gK7nazN8sgAvHs
 iNfgJJwB0chk1RSwCJXdY9dCLPYLmvFx1E3E/eIx39930PyxmxaXUcL/c A==;
X-CSE-ConnectionGUID: 2U/KTVIxQmCzBt9uRF3KEg==
X-CSE-MsgGUID: 5kAoDC+PQhWQc0BxR+Vu8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="86858638"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="86858638"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 08:15:07 -0800
X-CSE-ConnectionGUID: mKEvtc3NR62pFKWWyN6Cnw==
X-CSE-MsgGUID: UMU5ogfkTIOXRlAjYOCZyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="203672493"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 08:15:07 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 08:15:07 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 8 Jan 2026 08:15:06 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.34) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 08:15:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R8WawakOMzmvsX1bu7xQCv1jAo8HWzn12Ai05BlG1YOxX6VgShsvPlKc3N2AeRUGl/zsIoQKbLEQUcgocNt2XmFFherLa5CtKZ4moBxdMQ9qHkgb6ktF+HSCd+IO89jdPTaGUgRiwgQOEiCK+Bk/ahpA0u2fGWudrGFobiv29Sw9l1qe7ZmY03SHMd9okS+cuH5TA6nJOc/RkMGHTyxA1FcWD3LB0cXLp8MwCQ/fPu8h4Cb7Kgut61jR3PlIAIpfn2Iyf6cVQ8IT39REb6NGebIDa0sGBp/MPzQjnINfEPuNlJcPsFpcgzxBgnXSyBqUW14xBDcXjLgm2YHRR+R8zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VbQVfuc5jLkZATDxZ1dI4AF8CRdX1uGFEX1lyjzpICE=;
 b=vJTuOJ9d7qFu/zmnKcX6CvE3oc/9pjZ5gWX1a2UwYVR4kzzK1769Xx27dolERq0/f2BHgjAhspGMvg93oaGYODavyfM1YTrdIqxutbhJzCvRqJz3SHrohhUGe+leXFllDt1gdhDN8i7bkBxq9Ufs+uoZWdgPTwweQoB081WM1o3qqO1vGoDOz2FdH8E25G97ljE5DrS5a1vWvw/KWhqj3qvkkrFtI3X2H7Zoa1tC5uDaaonm9YAhJ80oeTHveaCVgrYvJGRBJUroQM29az1CYQh/DJ8J+09qirtVjwCzrjg0RKWt/OCilIGWxFoooAaaIXkcb/PddQqCXWZC0p3Bxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7251.namprd11.prod.outlook.com (2603:10b6:610:147::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 16:15:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Thu, 8 Jan 2026
 16:15:03 +0000
Date: Thu, 8 Jan 2026 08:15:01 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 3/7] drm/xe: Add xe_ggtt_node_addr() to avoid
 dereferencing xe_ggtt_node
Message-ID: <aV/YBVI1nKv1RMFZ@lstrano-desk.jf.intel.com>
References: <20260108101014.579906-9-dev@lankhorst.se>
 <20260108101014.579906-12-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260108101014.579906-12-dev@lankhorst.se>
X-ClientProxiedBy: BY5PR20CA0025.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::38) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7251:EE_
X-MS-Office365-Filtering-Correlation-Id: 940a6ec0-c471-4179-7d01-08de4ed11466
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rHzeHwACkbEsZqc5LJ6W8tr4gbz2UNXKTfE+P6kjh1l2zpBxFnVIxW/XgDyb?=
 =?us-ascii?Q?h+HHTT4w7yGyYlds9KdOY0+5y+C7YCVkCw64iwJsDiCM82J99LkK9e7c/J5n?=
 =?us-ascii?Q?Pe2xaA8JK5enUVsnpgVXtGn0D2+5avZmJCCO3eUNjXxwoCWtwNaOKJGkH6q1?=
 =?us-ascii?Q?4Q38ovNAtMMiWQHr2YOmCwbr1mlyObbwe4jLkR5+UQdHIGNIaSddMEd9zwB6?=
 =?us-ascii?Q?LC0GBu65HQhleucyVr1LTGmyIjhK2KJMSThxnZd1+XwAWWm4MohjSNunEdCc?=
 =?us-ascii?Q?1KBwPYDr4xUYXfWv94e8YrKWHBmgsIYOaDKyK/g/eEFK4XZue/ALTARZ+6w+?=
 =?us-ascii?Q?FOkOW1SKWrhw8JiSSnfXrejldiJmh+zZBdTJtjc9qD0hR71gC8kEAduCGJxL?=
 =?us-ascii?Q?E1F34jVnQr7SY8+9aLshX23vk6UHO0ONflRdIlwHWbnl5BcnLEbl6cyEDRdZ?=
 =?us-ascii?Q?WWD2JG932XZs5gSXxXVUTMa8OlcsrbK588nuMZSGJDQVblDHJ7/rLiKJjc8g?=
 =?us-ascii?Q?WwWaOjev8V9FnAemHLNaIIEUDQjyW/Yap02E6JpFDQsQxzZfJiw+gjBbOOLQ?=
 =?us-ascii?Q?PQ4ifqjG4VdZQP9nUSNDOI4AL2keMKDTZDeZx8j/6kf6Sz2yM0p6Pbpbd+y4?=
 =?us-ascii?Q?1FPagFQbEBfofRCo4ywshavCXVwio/iAyIEXoVJMHzS70LXjkesx5RZ6bkSq?=
 =?us-ascii?Q?YwFdYKX5Rlo2cy6o2g+iguOqxoCYFXKvcuc1fyEQdrc8c9G1nZtVSaJf8BmS?=
 =?us-ascii?Q?BQUzayseATKs+e/FtKgie3rgfL3MFR2IW1atyvU6tkvTw6WA5sqL0+y10wUh?=
 =?us-ascii?Q?JAU/WKYBSjfEhoUQJfGPP0OYuBr/yahsO+levhitRan11kTzctBa82NPEPLb?=
 =?us-ascii?Q?fTnZvw/fG48n+xwdkioM+oh0Rr/bnSa5br+xZ/FruajjgXeUDpZ/NOCAvdJi?=
 =?us-ascii?Q?Bct0KyjohT0DHm6CbwJDog88rW062PIDuH25f3lnYNajlT3oelM9Tqrwf3I5?=
 =?us-ascii?Q?wwggZOJ6N1IsDmAQzMHuO31glLTl9dTnqrppXFPy4hE8I0POnTFB1RbZtsM8?=
 =?us-ascii?Q?+MS8dChIK24FnHz8qdUjXXPSuQV4aVOfKKAcXLF+/DWdg9Q1MAqRAQO9jkrs?=
 =?us-ascii?Q?NuYEq80gSQEJuLNjKOS8veT7daZ+ExQoUtNWucqkW5uR2rOi1MHjOMWjKEC3?=
 =?us-ascii?Q?CTAS6QfuYEkJJJDO1dZBLL66v+6f1JIc5hSn4yC8EzMbOFynbQMjuD++DeGK?=
 =?us-ascii?Q?BQX1vLKMIQrO+Boz1+trTCtH4rzDK0yhKyJSQbMWE0gquYhKZi4AwkVhewx1?=
 =?us-ascii?Q?/3oq/8vXAxbtL11IG4p+vFfvHLu74odGoa4U/nocjk9Qg8ISkNIpfBlWu7fM?=
 =?us-ascii?Q?UwU3CjI/7bMwi89UPxGsNl1WKVr0FYh3rtgG+duRILiJ7QmA9FUt3jYIcyyp?=
 =?us-ascii?Q?PGdkVuOJev7+6mSe9tljc+kuhnYxZurO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0roWw41lF4SIOgNBshDjFRoW+Cv2bw+Bhbns/t6fEsnjU/pSrAgYYLtLU1D3?=
 =?us-ascii?Q?j3VVjF701Slez8N6ql/uOzIrev1tlfd++bhCxW9FIU+6Mj0k1e8lcugtCx8M?=
 =?us-ascii?Q?QKFwv6WKNQJFb4Cafx1tKYPQBtxnHSzECGW4c7gGX49cTvbopBotH1ngmVjM?=
 =?us-ascii?Q?4U170tf39R8ZEk/MBiebx03zpNHPRc0+gqF3fdZtdV0xSByx1H/GylKwGt2f?=
 =?us-ascii?Q?LGPgfC9BujmyZSdMjSnf8d2yVnTgUy2GVa3ei+U7IdZ+UwpLNy84scEjvXrk?=
 =?us-ascii?Q?vlgD++2KRIAuCicrTSD8BJPlOY61mpPB5HMZa7ydC6cdP1++bM4leddZY5M2?=
 =?us-ascii?Q?RY3W0DIhE9mCsGjkWYO2K/JUi4Uyzl6+69Nyu1NSGNFOQUuXm477auffassb?=
 =?us-ascii?Q?th61wlqdGYCkPjVjdGl47BPs1LDSI5pm73B6H4QNQOpQztrAgPufcAnjfoor?=
 =?us-ascii?Q?fWGgflizR4VZ1A6dLwOMKU14EEbMOQj8q3zxTaHRF95dAAhEqucH+kOrB9Yw?=
 =?us-ascii?Q?SvEypWjEdSdYV2yKbXrMRkVd9MpK1dNqwspeLmPFAH/hfBb1rNQEwFY0SX+T?=
 =?us-ascii?Q?wrlV7AroW9ZSfg3eRWCOj+WTh6ZC17TgpptxubC8QkdpHjoxZcvkAxlRy9zk?=
 =?us-ascii?Q?X6sNBImJrRRcm0nW7JIzYbrJ6OCJ+oJGvbsXeOuKaLRuM1kGuNAE+eKgbCYI?=
 =?us-ascii?Q?bgd5HRDwPEgchSOTSeZUHimY1s3mytu1p6eAHPuLsL19yhygmPE9m81NqY2l?=
 =?us-ascii?Q?hQSsp8b7NoBzAFRem+ZtULcum/+QLtYPhKrgVIlY0qn534lqUmJt9S2TSZPP?=
 =?us-ascii?Q?9A2kSBCZCZBiWq0IcMJdFHXYeOv8QoLCm9zU/MD2oe32p9P6uejFVWOy6XpZ?=
 =?us-ascii?Q?SSK272jX4TDJ0l6iigEP/kj4t3hOds5+mQtrconvMh85ohLn9XeDu9FzLylR?=
 =?us-ascii?Q?Kg81C4ryV6MzPFL4g5iGNj3csCZ+Siab5LfbKErKJ4ogu5AbqDEwtbhOZcHD?=
 =?us-ascii?Q?vHDL1TGbfnk/79Vf2O9wAGLK2HAnwVbPKuN5a8Q302cBS2GlFD8buWQeAr84?=
 =?us-ascii?Q?N0iLAdB2pe5vhqKj7TxtdtDYntUS5Qs0m8CsyNslZPwO0QT19bDlUnre1BL9?=
 =?us-ascii?Q?PDFH0YQe+3tTSVn/rh+mJxB5SwoXYVNyjUs9bLxUCPuTIp0iQkbKmt3uzvHD?=
 =?us-ascii?Q?pRkDHCpS3i52GvrXv1xF5yYcBLRihwTZgkxWN0enwViAhMlCGjgCfZ/NZgts?=
 =?us-ascii?Q?tPCgnAhsVL6wbR3HPj88yh8bi3rbO5hFbjyKmvi7RAPNULr0RoMp/nlYI81/?=
 =?us-ascii?Q?liDhyKIvXgXzQVStgcAGjQgHaAqvBpH8i9PQLu+FtCcDkwDUOwRFoZ/M9uox?=
 =?us-ascii?Q?GPCF7mBxNmqelFMZ8ufbvmVjA4VhSavZh2worRhyF0Tv1HAibkUqULpOobf3?=
 =?us-ascii?Q?6ONwfR/YuztvR7giIjMZjm97cYWiwKB22RKcFHdUY6er2Uk++Ci+XbK2shyR?=
 =?us-ascii?Q?j/NdJf/eBvJ0um3PnRlecwftCj4PyorlQWpZKDRmehCr1w4Py01qSdcO0m9K?=
 =?us-ascii?Q?CfiT7Bsw+1sYGKnyIsM4hN+Z/rgiArnInONWu58FOu94z1RR339s39sTxPVR?=
 =?us-ascii?Q?78hMhnfTO/rydnBiKMHz5LKBotCqvSnZ2amy7pPc1F07bO0XFdsao430zTIx?=
 =?us-ascii?Q?OXPuK2ayVXk+XeMmYPUfJGPvwYZhCJacg4fZ8PvGAGCBE+OPNbOjsQuG2IQk?=
 =?us-ascii?Q?yih9gM6xNDbOgnr8SQp6bRtGMoVseVM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 940a6ec0-c471-4179-7d01-08de4ed11466
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 16:15:03.1778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sNjAFiQUdgfwL9uw0JoGdIvVsH/BTV37Ixbd8i80SXE2Ok56fB5FzRqoiP5c18oHzTRRWicUUSx0IXkpzN6oAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7251
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

On Thu, Jan 08, 2026 at 11:10:18AM +0100, Maarten Lankhorst wrote:
> This function makes it possible to add an offset that is applied to
> all xe_ggtt_node's, and hides the internals from all its users.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bo.h   |  8 +++++---
>  drivers/gpu/drm/xe/xe_ggtt.c | 11 +++++++++++
>  drivers/gpu/drm/xe/xe_ggtt.h |  2 ++
>  3 files changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 8ab4474129c3d..c914ab719f20e 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -9,6 +9,7 @@
>  #include <drm/ttm/ttm_tt.h>
>  
>  #include "xe_bo_types.h"
> +#include "xe_ggtt.h"
>  #include "xe_macros.h"
>  #include "xe_validation.h"
>  #include "xe_vm_types.h"
> @@ -252,13 +253,14 @@ static inline u32
>  __xe_bo_ggtt_addr(struct xe_bo *bo, u8 tile_id)
>  {
>  	struct xe_ggtt_node *ggtt_node = bo->ggtt_node[tile_id];
> +	u64 offset;
>  
>  	if (XE_WARN_ON(!ggtt_node))
>  		return 0;
>  
> -	XE_WARN_ON(ggtt_node->base.size > xe_bo_size(bo));
> -	XE_WARN_ON(ggtt_node->base.start + ggtt_node->base.size > (1ull << 32));
> -	return ggtt_node->base.start;
> +	offset = xe_ggtt_node_addr(ggtt_node);
> +	XE_WARN_ON(offset + xe_bo_size(bo) > (1ull << 32));
> +	return offset;
>  }
>  
>  static inline u32
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 6bb6dcb0419ad..7f45bcd0c56b0 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -1185,3 +1185,14 @@ u64 xe_ggtt_read_pte(struct xe_ggtt *ggtt, u64 offset)
>  {
>  	return ioread64(ggtt->gsm + (offset / XE_PAGE_SIZE));
>  }
> +
> +/**
> + * xe_ggtt_node_addr - Get @node offset in GGTT.
> + * @node: &xe_ggtt_node
> + *
> + * Get the GGTT offset for allocated node.
> + */
> +u64 xe_ggtt_node_addr(const struct xe_ggtt_node *node)
> +{
> +	return node->base.start;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index 9adfc58edf581..76336a6296c45 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -61,4 +61,6 @@ void xe_ggtt_might_lock(struct xe_ggtt *ggtt);
>  u64 xe_ggtt_encode_pte_flags(struct xe_ggtt *ggtt, struct xe_bo *bo, u16 pat_index);
>  u64 xe_ggtt_read_pte(struct xe_ggtt *ggtt, u64 offset);
>  
> +u64 xe_ggtt_node_addr(const struct xe_ggtt_node *node);
> +
>  #endif
> -- 
> 2.51.0
> 
