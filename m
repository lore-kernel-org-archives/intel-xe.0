Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B38CCF9E3
	for <intel-xe@archiver.kernel.org>; Sun,  2 Nov 2025 18:02:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A33DE10E1D5;
	Sun,  2 Nov 2025 18:02:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ceh6o2T0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E3910E076
 for <intel-xe@lists.freedesktop.org>; Sun,  2 Nov 2025 18:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762106555; x=1793642555;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FweTKH8wdP1L/1sbN+urr86UbeODFn0VezCaF4bVB4A=;
 b=ceh6o2T0AJaBoGEbQ/T+QXsm5P3k4PYXJZcdDMGQiTzcYdbByrx36Z9J
 zmQz7H/oxWBsLwK2GldDOws+E+cpYOp4L+qekXr+GCwXyZWkHoo2XbXqe
 wdHBcFm5qX3Cq2DKT8uzSZHx/6IdZfxC5U5XRSjMIMRqafwC3Nqude6xP
 m8CZuOj6/6PGG5Kd+REAkcHAud1OIDisXcEndI+3Xv/N+A8HKUL3BaDcf
 TZApRswV3sKoAJL8QCNfL7wxFMEix13eRIsuUSWZHBHfR47XRodiXkw7Y
 tF/8NWd/fBiAcbevOnNWUMgN+wSub0/NuCI1n6RZzmoTMbsURr45VL4Ft g==;
X-CSE-ConnectionGUID: hjvhLunXS/+2fprFjN/JJQ==
X-CSE-MsgGUID: KS7dhSwURpS895oxHjYwWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="64226776"
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; d="scan'208";a="64226776"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2025 10:02:35 -0800
X-CSE-ConnectionGUID: yvjLL/prQhaL6hbs5smuEQ==
X-CSE-MsgGUID: wwWHS8GpSzCYc04ztRSRtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; d="scan'208";a="191023573"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2025 10:02:35 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 2 Nov 2025 10:02:34 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 2 Nov 2025 10:02:34 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.70) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 2 Nov 2025 10:02:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vul0SmzCVKUcZDkmrKe25MI+ymW7sMn7/rt/EFnzlTMGAvG4BDIk+zPRPgDi9EkXFoq1a0D24tgzA1SGvoHuXbak+JkMtAwHkzR7CxjUG6uom9sWHg0oa2829O/Q91Qqr4IH0wpzH0/fBUmXP5Ozd0b1uqT7uV7/C5lcFULtNTq6HBum12XvGRZFOjTgKCFwrGXdiu176ICVBxNyiruTQhOBOlUas3EkTM4SnVEEVwzKPMUGBvtOO0LG4GXzkQ0Q8TfX1I+nm7aVulvjNJW4lPSXrHe8zdus0dcz7zVuurXRAjFo988MVpDST7GTYDtZI88TiHsBipG9dlx1Ykop3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0A5KJEQI+U+SiLAJ3pHzs9E91mn5nfOK2VibEaOK+Hg=;
 b=C//4tR5J6cih/NaeeoUPb2d8dYUFOXVd8w6L2epRyPYO8tU4XPlaLFCUFFMmXJnJpOb1UN+pF1+E/alXDlz/lihZINwhqpDUN/2G/UYHWTaeGcpLW1lRybYXV1O/H82/1jT4/psf6xRG1b9Y5aaEHKq2AdC94OPKwZx3HUNOXvq+/2cvwuuMutM8MrXUWlrBwL6BgKg1MoLNHYkTHDhZx1gxFnS+wZ808pB7cTKzYSVSd+UjF79Uw8TThw3RDDxKzuaXYEVD0Jq95Q7uSddWk1iATFO0Id1H3ZClwp6Sx+bt+z0w+SB4jd3LGTwcNtub8cwmmj/A/w0W1bCGLBgURQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SA1PR11MB5921.namprd11.prod.outlook.com (2603:10b6:806:22a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Sun, 2 Nov
 2025 18:02:32 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%5]) with mapi id 15.20.9275.011; Sun, 2 Nov 2025
 18:02:32 +0000
Date: Sun, 2 Nov 2025 10:02:28 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 03/16] drm/xe/multi_queue: Add GuC interface for multi
 queue support
Message-ID: <aQectLNtpCW8VIgm@lstrano-desk.jf.intel.com>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
 <20251031182936.1882062-4-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251031182936.1882062-4-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: BYAPR01CA0065.prod.exchangelabs.com (2603:10b6:a03:94::42)
 To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SA1PR11MB5921:EE_
X-MS-Office365-Filtering-Correlation-Id: e4ab1aca-4700-4522-2283-08de1a39fe7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hvRqWT3MGWU9Fl2sNOpCkQ6zNMOvUp0c1qsJvbFxYLjr1zAYZmTUDqEhc3JK?=
 =?us-ascii?Q?+OBMMTD9fj+cuc7+P9QRgnXU/LULuUxRy5ggRnQCGE6eY4Wkm17oHr0J3aS1?=
 =?us-ascii?Q?1OYk8q5/MJo+AxVTyRxdU5nZ+KaPQH7JfN6ly1GYXvcbOFuaEXwV7ZV0fqRz?=
 =?us-ascii?Q?vaBwtmVAkSuuxcBqGpwlH3aWbwJzqsyNWn21CKP2wb7+6hZntnsvgNct1kN7?=
 =?us-ascii?Q?yMDkC9sr5RHaXVnMOm7lsLhy4e7aRw5p0hVR3/7+N0XUNHC1tMhDeuXTWsrc?=
 =?us-ascii?Q?4qPPogwNFpxh8Rix44dB5PP55hik0JgBvnfgu/7cqxuemEd7k8luMv9qX93I?=
 =?us-ascii?Q?/bG+MXrQPf3a4kB6UjD82/i1YcunsRFzbCOts33YbpiFniq1u/Q3fRcCzSkJ?=
 =?us-ascii?Q?vWbLnAGe8cug0lILRYlK1C8eRaPsglA3ipaFupFxHIiMEf7qXw9ooEvEzar4?=
 =?us-ascii?Q?/EBjk9gqyfoTpujVY5JzWkEquHogPc7XL5ENptdL6MzSXR+gVsHLWuZWs69m?=
 =?us-ascii?Q?zGQVUuXT2/NgyGRZeMz4r4viotne91/oXJf3oq3kMxmzdxfASx+tz1Hw8jUd?=
 =?us-ascii?Q?BvSYmb+tBRKoxPeUuaP0OXX4p55UHWKdoWmip5xoIaL8wWSF7SKrSCkRUFCG?=
 =?us-ascii?Q?k6x5rN/E3TDwA2MiNv6VIc7fbLRIRyRvbe5jBANJ071rOCKfVtZPEqESkTUF?=
 =?us-ascii?Q?ZgR46NHQSheAc46Fe3OGNTu/277DfLJsQ3ineNl+DG/FJHPmoHkuRylNacVZ?=
 =?us-ascii?Q?W7qXo342jmV5/fxYoE0YZ6dk+ZorcBomvqEUMyX5FiPuNm1sko3FIR+FPRbg?=
 =?us-ascii?Q?MAXaLjaJAkLiQlm0sUbIFRZ/hrQZ6rMqpQOhRVbU3Dnjjk85BkP8SJcH2VGl?=
 =?us-ascii?Q?nTcOfv3T6Y1FGcscVd/PuSyFoe2r2AcbzD0hOYQc44If2oKn/+CEDUye8060?=
 =?us-ascii?Q?VxAktyd282q01SOjEJyIasrEDgEzKMDdxlTCeKHqrwp7VdG46V1OLAAODyKT?=
 =?us-ascii?Q?rvNej2AT1mRNlpx85PkvX81XuSLiHxV2A84PN8aP8567l4zR9wCREe0tOZ1A?=
 =?us-ascii?Q?7/8uwntDy3k5QVngM1OWB0EPd2Xv7pqY2jRFE/bTwaw7ZRa0IlyvZhf1qQAs?=
 =?us-ascii?Q?y+xNIertWgYYw1vrug2N1xU7QN4Sr26f64CTfUGBeJIJycJhUOOU4OhBANOQ?=
 =?us-ascii?Q?S2G8uCNgAcxdrC1Rd+B6pR7ALGaFuq2+eKl+Aw5X/gky4jhhUrx8+Ic8hWtZ?=
 =?us-ascii?Q?t/GAklx8gpnMAyEzCXACyyVnbRX0c25rOtAjB861ygmks0y1a4PyyjAx2fHO?=
 =?us-ascii?Q?2gqm9nxEPbwkqCVXeyE5wqpzwgQTB+0YEMvVJxy18eqh1lEl6/hbUggUyNQT?=
 =?us-ascii?Q?CaS6qsC5ZnAlfHrSx7dP8bsx0MOYL4cyC0+1g+JSwAj6ZkHHexCftBkBnocq?=
 =?us-ascii?Q?ReJusfE+BEH1kGo7UIoUvwRRHIxDgJH1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dE8YuE/Q2xz57N8rwSzjoQ7ZdBOUHsWCJ2av7/xIY8eXzTlmC2LvJta9SQGA?=
 =?us-ascii?Q?PIRV0QN8l5wduSfIBjC9LwqqXgeKJ5AIJ3f+GznbehFoFjXzYOCT8hj4Za91?=
 =?us-ascii?Q?1/NpsywYH6V1acMngu/ZgFsNtqxhCidzXdQjzKfh5YHJws1L5WBplgztZvx7?=
 =?us-ascii?Q?5KHsio1n1+nezCtBMxmupQgjyG7MIq4btNAapQ7W8YOhSz+YK+c9ZbiEuhcy?=
 =?us-ascii?Q?Ib+PnqWOMJOAyC+s8k/4IyYTEpdNgeKgUwJMLUdf8IiFwXBEu/6gi3aHJVIl?=
 =?us-ascii?Q?6b2epoeR5aVEfIbpKiFNv5e3GFeVJXYGOPttJn8JxkYMn3h/U+LUXAvwDD9J?=
 =?us-ascii?Q?aS7m3I68pMAxP03DFYLJCuEs6Nl/aw+gNh7GjQ1xjfNoZ9tK/072LmnebUyu?=
 =?us-ascii?Q?jt8MayxBhVAjBBUqBwR6PAmTsjHmdAT+Hw6AonDgpE1+XpoEWB78fQtkz4Yh?=
 =?us-ascii?Q?BwB+jufttjB01TgZ6BDFXgqAaaN05ymRimu6nCV0RL6C52Qekkw2nLLFxDwy?=
 =?us-ascii?Q?SdBiaJ4jfo5BJoTkObSnYkOOKa6zhh+xLH3IkyRXTr5FbPusgaSGqWi7/yZ5?=
 =?us-ascii?Q?nbAt4Zo6O+snW0NIqd6SG6W593LMD5qrKd0+XjrtDUxfjMR7xdne7mk+3y8O?=
 =?us-ascii?Q?xtSDmgVTd99BmugZbqMrK70Oc+A5WyoIX1uTd+BOjo7aRv5o9iqFLWvsUpg8?=
 =?us-ascii?Q?9UPOrFxVtk3cHtyOIqPaB8iu/U7qhrsxWm2/O7GDt07KIbPd0i2WfshCm4GS?=
 =?us-ascii?Q?mzIten7Y9fq6c3/V51AsfMDvg1vlEbr962WDjOyW4HlBkq+9i6TINWj+Q5bV?=
 =?us-ascii?Q?vZh0jbZmUYd0fiDjAH0SujIz0IIFFt4rqB2TaP6eY3mODiU3u53Vy+/WmKWh?=
 =?us-ascii?Q?+m4c+oiYSMFxGPhoZzVXCL37YUTZf5Gv0iJ8D7ZO9d5T3gjXgN/WdXcKTDT8?=
 =?us-ascii?Q?mrnrpSfg6tTt2G3awS2SFJ9XIepwYKWfvxd6KqU5gzt6QxS/jVD9gruuU3IH?=
 =?us-ascii?Q?jESrLWAOtOJ+CctnpXBpmWO8xI5993bbRSGZzxk40c0hPZkWM8qx9Dvq14k/?=
 =?us-ascii?Q?aan6tvxLRgnD2X+k7B6Gr+EeXRnM7gozD4PkbmSeCgHcq9WMwTUNlq8e/Ghk?=
 =?us-ascii?Q?674u78SL5IhoMwoKI6UYP/Q38Xibfxj5YqeWBAu6D2gzKMhzUlpN+19jKKFZ?=
 =?us-ascii?Q?V41HWFNcPYm+LgZ1SrUrXKZGOerFtmTPc+VVhzUL71HIvxVEoKQpJDO+VylC?=
 =?us-ascii?Q?glXcEnhmEKMFHT2hLvOek2fBRgcHWaIggJN110Sv8wuugVBXpo29r7SvkpEf?=
 =?us-ascii?Q?jR4KUbs5Ypb5Ho8Wl/26VgDJtfeu5wRhWXA9vj+n5ZFP+047j2ZMZulsPyNV?=
 =?us-ascii?Q?FU9DwaUkgdbka2v1dwhe/qlqr0r1hIeWSmKI6p2GvCmEUk00ApSVQbd3B61Y?=
 =?us-ascii?Q?sokroDZy/qh34PyWe4UFmNe8CwPQeA/Z/8xEuBsPOZpN7apmaLnxsyjtq47p?=
 =?us-ascii?Q?ZigdwDVvGf9QxWVHHix8oPdc9VFty+qoARS+aYYRvnVOJTOck9XkqRY8/lSI?=
 =?us-ascii?Q?SBkOkMAkvmwBbpbTNepZTgx8nfs6E0UPCymEEWWNElbX+antKERUqzGTgCRI?=
 =?us-ascii?Q?hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4ab1aca-4700-4522-2283-08de1a39fe7e
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2025 18:02:32.0522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7SG0HzCo3Y8fhoCyUxB96t2cf4qdqh1kFISJCvncNfVKRHjv9+w3zOjg3okS3uPNdQlVXPlGaC0IiO4XNy27wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5921
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

On Fri, Oct 31, 2025 at 11:29:23AM -0700, Niranjana Vishwanathapura wrote:
> Implement GuC commands and response along with the Context
> Group Page (CGP) interface for multi queue support.
> 
> Ensure that only primary queue (q0) of a multi queue group
> communicate with GuC. The secondary queues of the group only
> need to maintain LRCA and interface with drm scheduler.
> 
> Use primary queue's submit_wq for all secondary queues of a multi
> queue group. This serialization avoids any locking around CGP
> synchronization with GuC.
> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_actions_abi.h |   3 +
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 +
>  drivers/gpu/drm/xe/xe_guc_ct.c           |   4 +
>  drivers/gpu/drm/xe/xe_guc_fwif.h         |   3 +
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 302 +++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_guc_submit.h       |   1 +
>  6 files changed, 270 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> index 47756e4674a1..3e9fbed9cda6 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> @@ -139,6 +139,9 @@ enum xe_guc_action {
>  	XE_GUC_ACTION_DEREGISTER_G2G = 0x4508,
>  	XE_GUC_ACTION_DEREGISTER_CONTEXT_DONE = 0x4600,
>  	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
> +	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_QUEUE = 0x4602,
> +	XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC = 0x4603,
> +	XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE = 0x4604,
>  	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
>  	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
>  	XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 3856776df5c4..38e47b003259 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -47,6 +47,8 @@ struct xe_exec_queue_group {
>  	struct xarray xa;
>  	/** @list_lock: Secondary queue list lock */
>  	struct mutex list_lock;
> +	/** @sync_pending: CGP_SYNC_DONE g2h response pending */
> +	bool sync_pending;
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index e68953ef3a00..48b5006eb080 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1304,6 +1304,7 @@ static int parse_g2h_event(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  	lockdep_assert_held(&ct->lock);
>  
>  	switch (action) {
> +	case XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE:
>  	case XE_GUC_ACTION_SCHED_CONTEXT_MODE_DONE:
>  	case XE_GUC_ACTION_DEREGISTER_CONTEXT_DONE:
>  	case XE_GUC_ACTION_SCHED_ENGINE_MODE_DONE:
> @@ -1570,6 +1571,9 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  		ret = xe_guc_g2g_test_notification(guc, payload, adj_len);
>  		break;
>  #endif
> +	case XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE:
> +		ret = xe_guc_exec_queue_cgp_sync_done_handler(guc, payload, adj_len);
> +		break;
>  	default:
>  		xe_gt_err(gt, "unexpected G2H action 0x%04x\n", action);
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index c90dd266e9cf..610dfb2f1cb5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -16,6 +16,7 @@
>  #define G2H_LEN_DW_DEREGISTER_CONTEXT		3
>  #define G2H_LEN_DW_TLB_INVALIDATE		3
>  #define G2H_LEN_DW_G2G_NOTIFY_MIN		3
> +#define G2H_LEN_DW_MULTI_QUEUE_CONTEXT		4
>  
>  #define GUC_ID_MAX			65535
>  #define GUC_ID_UNKNOWN			0xffffffff
> @@ -62,6 +63,8 @@ struct guc_ctxt_registration_info {

Side note - this struct could probably move to private struct
xe_guc_submit.c.

>  	u32 wq_base_lo;
>  	u32 wq_base_hi;
>  	u32 wq_size;
> +	u32 cgp_lo;
> +	u32 cgp_hi;
>  	u32 hwlrca_lo;
>  	u32 hwlrca_hi;
>  };
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index d4ffdb71ef3d..d2aa9a2524e7 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -46,6 +46,7 @@
>  #include "xe_trace.h"
>  #include "xe_uc_fw.h"
>  #include "xe_vm.h"
> +#include "xe_bo.h"

Why do you need xe_bo.h? It is not obvious to me. If you need it,
alphabetical order.

>  
>  static struct xe_guc *
>  exec_queue_to_guc(struct xe_exec_queue *q)
> @@ -541,7 +542,8 @@ static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
>  	u32 slpc_exec_queue_freq_req = 0;
>  	u32 preempt_timeout_us = q->sched_props.preempt_timeout_us;
>  
> -	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> +	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q) &&
> +		     !xe_exec_queue_is_multi_queue_secondary(q));
>  
>  	if (q->flags & EXEC_QUEUE_FLAG_LOW_LATENCY)
>  		slpc_exec_queue_freq_req |= SLPC_CTX_FREQ_REQ_IS_COMPUTE;
> @@ -561,6 +563,8 @@ static void set_min_preemption_timeout(struct xe_guc *guc, struct xe_exec_queue
>  {
>  	struct exec_queue_policy policy;
>  
> +	xe_assert(guc_to_xe(guc), !xe_exec_queue_is_multi_queue_secondary(q));
> +
>  	__guc_exec_queue_policy_start_klv(&policy, q->guc->id);
>  	__guc_exec_queue_policy_add_preemption_timeout(&policy, 1);
>  
> @@ -575,6 +579,130 @@ static void set_min_preemption_timeout(struct xe_guc *guc, struct xe_exec_queue
>  	xe_map_wr_field(xe_, &map_, 0, struct guc_submit_parallel_scratch, \
>  			field_, val_)
>  
> +#define CGP_VERSION_MAJOR_SHIFT	8
> +
> +static void xe_guc_exec_queue_group_cgp_update(struct xe_device *xe,
> +					       struct xe_exec_queue *q)
> +{
> +	struct xe_exec_queue_group *group = q->multi_queue.group;
> +	u32 guc_id = group->primary->guc->id;
> +
> +	/* Currently implementing CGP version 1.0 */
> +	xe_map_wr(xe, &group->cgp_bo->vmap, 0, u32,
> +		  1 << CGP_VERSION_MAJOR_SHIFT);
> +
> +	xe_map_wr(xe, &group->cgp_bo->vmap,
> +		  (32 + q->multi_queue.pos * 2) * sizeof(u32),
> +		  u32, lower_32_bits(xe_lrc_descriptor(q->lrc[0])));
> +
> +	xe_map_wr(xe, &group->cgp_bo->vmap,
> +		  (33 + q->multi_queue.pos * 2) * sizeof(u32),
> +		  u32, guc_id);
> +
> +	if (q->multi_queue.pos / 32) {
> +		xe_map_wr(xe, &group->cgp_bo->vmap, 17 * sizeof(u32),
> +			  u32, BIT(q->multi_queue.pos % 32));
> +		xe_map_wr(xe, &group->cgp_bo->vmap, 16 * sizeof(u32), u32, 0);
> +	} else {
> +		xe_map_wr(xe, &group->cgp_bo->vmap, 16 * sizeof(u32),
> +			  u32, BIT(q->multi_queue.pos));
> +		xe_map_wr(xe, &group->cgp_bo->vmap, 17 * sizeof(u32), u32, 0);

Maybe some defines for all these numbers (16, 17, 32, 33) in this
function? Or some comments? It is very hard to look at this code and
know what it is doing.

> +	}
> +}
> +
> +static void xe_guc_exec_queue_group_cgp_sync(struct xe_guc *guc,
> +					     struct xe_exec_queue *q,
> +					     const u32 *action, u32 len)
> +{
> +	struct xe_exec_queue_group *group = q->multi_queue.group;
> +	struct xe_device *xe = guc_to_xe(guc);
> +	long ret;
> +
> +	/*
> +	 * As all queues of a multi queue group use single drm scheduler
> +	 * submit workqueue, CGP synchronization with GuC are serialized.
> +	 * Hence, no locking is required here.
> +	 * Wait for any pending CGP_SYNC_DONE response before updating the
> +	 * CGP page and sending CGP_SYNC message.
> +	 */
> +	ret = wait_event_timeout(guc->ct.wq,
> +				 !READ_ONCE(group->sync_pending) ||
> +				 xe_guc_read_stopped(guc), HZ);
> +	if (!ret || xe_guc_read_stopped(guc)) {
> +		drm_err(&xe->drm, "Wait for CGP_SYNC_DONE response failed!\n");
> +		/* Something wrong with the CTB or GuC, no need to proceed */
> +		return;
> +	}
> +
> +	xe_guc_exec_queue_group_cgp_update(xe, q);
> +
> +	WRITE_ONCE(group->sync_pending, true);
> +	xe_guc_ct_send(&guc->ct, action, len, G2H_LEN_DW_MULTI_QUEUE_CONTEXT, 1);
> +}
> +
> +static void __register_exec_queue(struct xe_guc *guc,
> +				  struct guc_ctxt_registration_info *info)
> +{
> +	u32 action[] = {
> +		XE_GUC_ACTION_REGISTER_CONTEXT,
> +		info->flags,
> +		info->context_idx,
> +		info->engine_class,
> +		info->engine_submit_mask,
> +		info->wq_desc_lo,
> +		info->wq_desc_hi,
> +		info->wq_base_lo,
> +		info->wq_base_hi,
> +		info->wq_size,
> +		info->hwlrca_lo,
> +		info->hwlrca_hi,
> +	};
> +
> +	/* explicitly checks some fields that we might fixup later */
> +	xe_gt_assert(guc_to_gt(guc), info->wq_desc_lo ==
> +		     action[XE_GUC_REGISTER_CONTEXT_DATA_5_WQ_DESC_ADDR_LOWER]);
> +	xe_gt_assert(guc_to_gt(guc), info->wq_base_lo ==
> +		     action[XE_GUC_REGISTER_CONTEXT_DATA_7_WQ_BUF_BASE_LOWER]);
> +	xe_gt_assert(guc_to_gt(guc), info->hwlrca_lo ==
> +		     action[XE_GUC_REGISTER_CONTEXT_DATA_10_HW_LRC_ADDR]);
> +
> +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
> +}
> +
> +static void __register_exec_queue_group(struct xe_guc *guc,
> +					struct xe_exec_queue *q,
> +					struct guc_ctxt_registration_info *info)
> +{
> +#define MAX_MULTI_QUEUE_REG_SIZE	(8)
> +	struct xe_device *xe = guc_to_xe(guc);
> +	u32 action[MAX_MULTI_QUEUE_REG_SIZE];
> +	int len = 0;
> +
> +	if (xe_exec_queue_is_multi_queue_primary(q)) {
> +		action[len++] = XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_QUEUE;
> +		action[len++] = info->flags;
> +		action[len++] = info->context_idx;
> +		action[len++] = info->engine_class;
> +		action[len++] = info->engine_submit_mask;
> +		action[len++] = 0; /* Reserved */
> +		action[len++] = info->cgp_lo;
> +		action[len++] = info->cgp_hi;
> +	} else {
> +		/*
> +		 * No need to wait before CGP sync since CT descriptors
> +		 * should be ordered.
> +		 */
> +
> +		action[len++] = XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC;
> +		action[len++] = q->multi_queue.group->primary->guc->id;
> +	}
> +
> +	xe_assert(xe, len <= MAX_MULTI_QUEUE_REG_SIZE);
> +#undef MAX_MULTI_QUEUE_REG_SIZE
> +
> +	xe_guc_exec_queue_group_cgp_sync(guc, q, action, len);
> +}
> +
>  static void __register_mlrc_exec_queue(struct xe_guc *guc,
>  				       struct xe_exec_queue *q,
>  				       struct guc_ctxt_registration_info *info)
> @@ -622,35 +750,6 @@ static void __register_mlrc_exec_queue(struct xe_guc *guc,
>  	xe_guc_ct_send(&guc->ct, action, len, 0, 0);
>  }
>  
> -static void __register_exec_queue(struct xe_guc *guc,
> -				  struct guc_ctxt_registration_info *info)
> -{
> -	u32 action[] = {
> -		XE_GUC_ACTION_REGISTER_CONTEXT,
> -		info->flags,
> -		info->context_idx,
> -		info->engine_class,
> -		info->engine_submit_mask,
> -		info->wq_desc_lo,
> -		info->wq_desc_hi,
> -		info->wq_base_lo,
> -		info->wq_base_hi,
> -		info->wq_size,
> -		info->hwlrca_lo,
> -		info->hwlrca_hi,
> -	};
> -
> -	/* explicitly checks some fields that we might fixup later */
> -	xe_gt_assert(guc_to_gt(guc), info->wq_desc_lo ==
> -		     action[XE_GUC_REGISTER_CONTEXT_DATA_5_WQ_DESC_ADDR_LOWER]);
> -	xe_gt_assert(guc_to_gt(guc), info->wq_base_lo ==
> -		     action[XE_GUC_REGISTER_CONTEXT_DATA_7_WQ_BUF_BASE_LOWER]);
> -	xe_gt_assert(guc_to_gt(guc), info->hwlrca_lo ==
> -		     action[XE_GUC_REGISTER_CONTEXT_DATA_10_HW_LRC_ADDR]);
> -
> -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
> -}
> -
>  static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
>  {
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> @@ -670,6 +769,13 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
>  	info.flags = CONTEXT_REGISTRATION_FLAG_KMD |
>  		FIELD_PREP(CONTEXT_REGISTRATION_FLAG_TYPE, ctx_type);
>  
> +	if (xe_exec_queue_is_multi_queue(q)) {
> +		struct xe_exec_queue_group *group = q->multi_queue.group;
> +
> +		info.cgp_lo = xe_bo_ggtt_addr(group->cgp_bo);
> +		info.cgp_hi = 0;
> +	}
> +
>  	if (xe_exec_queue_is_parallel(q)) {
>  		u64 ggtt_addr = xe_lrc_parallel_ggtt_addr(lrc);
>  		struct iosys_map map = xe_lrc_parallel_map(lrc);
> @@ -700,11 +806,15 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
>  
>  	set_exec_queue_registered(q);
>  	trace_xe_exec_queue_register(q);
> -	if (xe_exec_queue_is_parallel(q))
> +	if (xe_exec_queue_is_multi_queue(q))
> +		__register_exec_queue_group(guc, q, &info);
> +	else if (xe_exec_queue_is_parallel(q))
>  		__register_mlrc_exec_queue(guc, q, &info);
>  	else
>  		__register_exec_queue(guc, &info);
> -	init_policies(guc, q);
> +
> +	if (!xe_exec_queue_is_multi_queue_secondary(q))
> +		init_policies(guc, q);
>  }
>  
>  static u32 wq_space_until_wrap(struct xe_exec_queue *q)
> @@ -833,6 +943,12 @@ static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
>  	if (exec_queue_suspended(q) && !xe_exec_queue_is_parallel(q))
>  		return;
>  
> +	/*
> +	 * All queues in a multi-queue group will use the primary queue
> +	 * of the group to interface with GuC.
> +	 */
> +	q = xe_exec_queue_multi_queue_primary(q);
> +

I think we might need a bit more thought which bits each queue owns in
q->guc->state. The state machine is pretty complicated and now pointing
secondary -> primary in some cases makes this even worse. I guess I'd
ask to figure out which bits a owned by primary, which ones by the
secondary, and which owns are mirrored and write this down somewhere.

Matt

>  	if (!exec_queue_enabled(q) && !exec_queue_suspended(q)) {
>  		action[len++] = XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET;
>  		action[len++] = q->guc->id;
> @@ -879,6 +995,18 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>  	trace_xe_sched_job_run(job);
>  
>  	if (!killed_or_banned_or_wedged && !xe_sched_job_is_error(job)) {
> +		if (xe_exec_queue_is_multi_queue_secondary(q)) {
> +			struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
> +
> +			if (exec_queue_killed_or_banned_or_wedged(primary)) {
> +				killed_or_banned_or_wedged = true;
> +				goto run_job_out;
> +			}
> +
> +			if (!exec_queue_registered(primary))
> +				register_exec_queue(primary, GUC_CONTEXT_NORMAL);
> +		}
> +
>  		if (!exec_queue_registered(q))
>  			register_exec_queue(q, GUC_CONTEXT_NORMAL);
>  		if (!job->skip_emit)
> @@ -887,6 +1015,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>  		job->skip_emit = false;
>  	}
>  
> +run_job_out:
>  	/*
>  	 * We don't care about job-fence ordering in LR VMs because these fences
>  	 * are never exported; they are used solely to keep jobs on the pending
> @@ -912,6 +1041,11 @@ int xe_guc_read_stopped(struct xe_guc *guc)
>  	return atomic_read(&guc->submission_state.stopped);
>  }
>  
> +static void handle_multi_queue_secondary_sched_done(struct xe_guc *guc,
> +						    struct xe_exec_queue *q,
> +						    u32 runnable_state);
> +static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q);
> +
>  #define MAKE_SCHED_CONTEXT_ACTION(q, enable_disable)			\
>  	u32 action[] = {						\
>  		XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET,			\
> @@ -925,7 +1059,9 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
>  	MAKE_SCHED_CONTEXT_ACTION(q, DISABLE);
>  	int ret;
>  
> -	set_min_preemption_timeout(guc, q);
> +	if (!xe_exec_queue_is_multi_queue_secondary(q))
> +		set_min_preemption_timeout(guc, q);
> +
>  	smp_rmb();
>  	ret = wait_event_timeout(guc->ct.wq,
>  				 (!exec_queue_pending_enable(q) &&
> @@ -953,9 +1089,12 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
>  	 * Reserve space for both G2H here as the 2nd G2H is sent from a G2H
>  	 * handler and we are not allowed to reserved G2H space in handlers.
>  	 */
> -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> -		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET +
> -		       G2H_LEN_DW_DEREGISTER_CONTEXT, 2);
> +	if (xe_exec_queue_is_multi_queue_secondary(q))
> +		handle_multi_queue_secondary_sched_done(guc, q, 0);
> +	else
> +		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> +			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET +
> +			       G2H_LEN_DW_DEREGISTER_CONTEXT, 2);
>  }
>  
>  static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
> @@ -1161,8 +1300,11 @@ static void enable_scheduling(struct xe_exec_queue *q)
>  	set_exec_queue_enabled(q);
>  	trace_xe_exec_queue_scheduling_enable(q);
>  
> -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> -		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> +	if (xe_exec_queue_is_multi_queue_secondary(q))
> +		handle_multi_queue_secondary_sched_done(guc, q, 1);
> +	else
> +		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> +			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
>  
>  	ret = wait_event_timeout(guc->ct.wq,
>  				 !exec_queue_pending_enable(q) ||
> @@ -1186,14 +1328,17 @@ static void disable_scheduling(struct xe_exec_queue *q, bool immediate)
>  	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
>  	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
>  
> -	if (immediate)
> +	if (immediate && !xe_exec_queue_is_multi_queue_secondary(q))
>  		set_min_preemption_timeout(guc, q);
>  	clear_exec_queue_enabled(q);
>  	set_exec_queue_pending_disable(q);
>  	trace_xe_exec_queue_scheduling_disable(q);
>  
> -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> -		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> +	if (xe_exec_queue_is_multi_queue_secondary(q))
> +		handle_multi_queue_secondary_sched_done(guc, q, 0);
> +	else
> +		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> +			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
>  }
>  
>  static void __deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
> @@ -1211,8 +1356,11 @@ static void __deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
>  	set_exec_queue_destroyed(q);
>  	trace_xe_exec_queue_deregister(q);
>  
> -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> -		       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
> +	if (xe_exec_queue_is_multi_queue_secondary(q))
> +		handle_deregister_done(guc, q);
> +	else
> +		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> +			       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
>  }
>  
>  static enum drm_gpu_sched_stat
> @@ -1660,6 +1808,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  {
>  	struct xe_gpu_scheduler *sched;
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct workqueue_struct *submit_wq = NULL;
>  	struct xe_guc_exec_queue *ge;
>  	long timeout;
>  	int err, i;
> @@ -1680,8 +1829,20 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  
>  	timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
>  		  msecs_to_jiffies(q->sched_props.job_timeout_ms);
> +
> +	/*
> +	 * Use primary queue's submit_wq for all secondary queues of a
> +	 * multi queue group. This serialization avoids any locking around
> +	 * CGP synchronization with GuC.
> +	 */
> +	if (xe_exec_queue_is_multi_queue_secondary(q)) {
> +		struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
> +
> +		submit_wq = primary->guc->sched.base.submit_wq;
> +	}
> +
>  	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
> -			    NULL, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 64,
> +			    submit_wq, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 64,
>  			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
>  			    q->name, gt_to_xe(q->gt)->drm.dev);
>  	if (err)
> @@ -2418,7 +2579,11 @@ static void deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
>  
>  	trace_xe_exec_queue_deregister(q);
>  
> -	xe_guc_ct_send_g2h_handler(&guc->ct, action, ARRAY_SIZE(action));
> +	if (xe_exec_queue_is_multi_queue_secondary(q))
> +		handle_deregister_done(guc, q);
> +	else
> +		xe_guc_ct_send_g2h_handler(&guc->ct, action,
> +					   ARRAY_SIZE(action));
>  }
>  
>  static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
> @@ -2468,6 +2633,15 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
>  	}
>  }
>  
> +static void handle_multi_queue_secondary_sched_done(struct xe_guc *guc,
> +						    struct xe_exec_queue *q,
> +						    u32 runnable_state)
> +{
> +	mutex_lock(&guc->ct.lock);
> +	handle_sched_done(guc, q, runnable_state);
> +	mutex_unlock(&guc->ct.lock);
> +}
> +
>  int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  {
>  	struct xe_exec_queue *q;
> @@ -2672,6 +2846,44 @@ int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 le
>  	return 0;
>  }
>  
> +/**
> + * xe_guc_exec_queue_cgp_sync_done_handler - CGP synchronization done handler
> + * @guc: guc
> + * @msg: message indicating CGP sync done
> + * @len: length of message
> + *
> + * Set multi queue group's sync_pending flag to false and wakeup anyone waiting
> + * for CGP synchronization to complete.
> + *
> + * Return: 0 on success, -EPROTO for malformed messages.
> + */
> +int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
> +{
> +	struct xe_device *xe = guc_to_xe(guc);
> +	struct xe_exec_queue *q;
> +	u32 guc_id = msg[0];
> +
> +	if (unlikely(len < 1)) {
> +		drm_err(&xe->drm, "Invalid CGP_SYNC_DONE length %u", len);
> +		return -EPROTO;
> +	}
> +
> +	q = g2h_exec_queue_lookup(guc, guc_id);
> +	if (unlikely(!q))
> +		return -EPROTO;
> +
> +	if (!xe_exec_queue_is_multi_queue_primary(q)) {
> +		drm_err(&xe->drm, "Unexpected CGP_SYNC_DONE response");
> +		return -EPROTO;
> +	}
> +
> +	/* Wakeup the serialized cgp update wait */
> +	WRITE_ONCE(q->multi_queue.group->sync_pending, false);
> +	wake_up_all(&guc->ct.wq);
> +
> +	return 0;
> +}
> +
>  static void
>  guc_exec_queue_wq_snapshot_capture(struct xe_exec_queue *q,
>  				   struct xe_guc_submit_exec_queue_snapshot *snapshot)
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index b49a2748ec46..abfa94bce391 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -34,6 +34,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>  					       u32 len);
>  int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len);
>  int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len);
> +int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
>  
>  struct xe_guc_submit_exec_queue_snapshot *
>  xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q);
> -- 
> 2.43.0
> 
