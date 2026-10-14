Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF4DC3DA7A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 18:20:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D67F810E1C6;
	Wed, 14 Oct 2026 18:20:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2C410E1C6
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 18:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792002019; x=1823538019;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Z+RsqY48R/8aLBy7buzaANfAe1LZmnUB0PrILKTSBfM=;
 b=IuxefkmUEvI6gemc8/AXTxn3qYQBoOeB4OfseIEeCm3Icsx3AWCV8ZI7
 SHIT1BLVoE2wDdTDsrfQRObnXy1JGepFOCM+qXyYg/pNcYaOSX+wsu36M
 h0hwK8+y3uP6IaoiM7Ta20oSK6dGMJd+7EqIZQG7OUNOfk/iWJsaaIaQA
 SPJpOjzk96IgfIuoKPvfA4nt6KdgPaOm108mKSKXpIkipZ1MfDtiIh7EZ
 oGadisAepyu3B2n6uEsvtvsk9crmdH+Zwq5bH/2HWKU5+bfEGuGV9D/hn
 Wpy3FwBkJ7eo/MZDIFr3s3cyCWDePBtX0tdhFlNUB8igJKYge6qRV37Hf g==;
X-CSE-ConnectionGUID: tVe9oUM8SoadmnqXSN0NVA==
X-CSE-MsgGUID: AiX+UIGYSmG9sijLmXSTnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="647605"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="647605"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 11:20:19 -0700
X-CSE-ConnectionGUID: PVSsueK/Sqm+9Vl3ASZhLw==
X-CSE-MsgGUID: AZKVbxv4SnepTX4ixW8wpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1824764"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 11:20:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 11:20:17 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 11:20:17 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.46) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 11:20:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c7ri2pjatjpOgBkwkleKMhwa82bEYOVI5YAvVu7RDnNONqWMF88Up5zl8CKMJ0jcrjrIjq/hNQfJlYDPbv8hG8aIE/5mJu+9snOUmE9Vy2FkHqD9FZro0cbyjJa9DFUCQ1trPM5ZURpg4LIDeeroYHaC4KrbkKG+DpA7KtuhTNKKSAowtxXe9FfvbeO5Y3QyVI+cFKhvLo07+Do7DA1ii9Em90AyNs8D3/h1EwENqX5chyPsDzLKQk5IUp/Ugrp8FDJ9jELi1jytUZQUdM0jgWfzHMr40/spVS1Pe77EoB8NS+rgzUpZCQgzy/o1paevpYgmpW7mAOI5VtFsIl+uRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V7FxlUyI/yjfeceQXQ5cizF7UPGESILL01DpK0Ee8Io=;
 b=GcD/rcp/ah8vA4goCqzEMtoJ1frJwaCcl/V4BTQHaJ6Uip7eGSEXLWkGz+Fswn9bmDXsBButmkVa6OzvkUodG2L3PviF6vrlFxrBy5rfZ3kJugcmMbydLvE/00aB8pwZBPlhIuSKIHevexeOp1ry9GvrIFcI781QSxxwr/CTsDUsDETJGkFoZUHVh3pEjV+lchCPtRcXSp3EyLe14A5bg3ES9LbOl6a/bw4DQwEK4vOdFDA/fIB9L/jHY9GX4SnUCr9j7M63RqzNVVr+TmpVlkEGRGwBMciw8I8TiYNCHbt0X6yHSkqF9CRp2Nzrx6P8Yl5s8yFXEuMiVz/douXT2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 by SN7PR11MB6797.namprd11.prod.outlook.com (2603:10b6:806:263::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 18:20:15 +0000
Received: from CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8]) by CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8%7]) with mapi id 15.21.0496.021; Wed, 14 Oct 2026
 18:20:15 +0000
Date: Wed, 14 Oct 2026 14:20:11 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <julia.filipchuk@intel.com>,
 <matthew.brost@intel.com>, Zhanjun Dong <zhanjun.dong@intel.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Subject: Re: [PATCH v11 0/3] drm/xe/guc: Compress GuC log and CTB dump with
 zstd
Message-ID: <as_H29n4po3u1v6O@intel.com>
References: <20261013222846.308259-5-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261013222846.308259-5-alan.previn.teres.alexis@intel.com>
X-ClientProxiedBy: BY3PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::16) To CH3PR11MB7180.namprd11.prod.outlook.com
 (2603:10b6:610:148::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7180:EE_|SN7PR11MB6797:EE_
X-MS-Office365-Filtering-Correlation-Id: 1114e82c-f4dd-47d7-b575-08df2a1fcafe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|10067099003|22082099003|18002099003|260925022911599003|260925021911599003|3023799007|260925021311599003|11063799006|261009220027099003|261009223027099003|261009223327099003|261009221227099003|261009221727099003|56012099006;
X-Microsoft-Antispam-Message-Info: JZTLuLY7ht2Ct466viy9Z1up9roG4TVY6dibybWvXUwwklvgVO0ebn5IfoNX3UDo8XKIje5uswHrgGHSqlQo5VJXXGXW2EUZPkySWHUqJvzQ5ncqLH4NY3U3AFY9jT37E9TYn14oopUe4M9O+oZtNiEX24V63tmtgs9zbEk/RHre9AAJdpf+8t8Zxgs20QX80KqedBQ/Kbfd58UrYXw4voaJAKXpwNYWpom6ZdwJMRlMgjSDpzMCM1F5QGbiNPPacXeyQFPT/0CVw0mGlE/aCzTW6npTLp4jwMGFGAKVLuY/8yvvWO0/nEdFvDuXoV4dxsDkcQSKEL/fu/j6wW1NnvSqrGUtZWhIYXJRNtM55727iv1f/ZDibJa3PTBBMDlfis/fkfER4kJMNFY3oIC0+8OfiaFqoqwCF8J3KGOclvNSV7mtID4NMfwIgyyOniuJ0oBm9rm9gBIvz1Uc0M2j5iNwdkOJBscT490rEIlm+q5dcrXDuP2OrhuvMozSMzcRXIn9IcJ+g9p68upiptJY5smlviiUG7jceOFGCnlSfxuYoXCU8p5qO1m7VOTGAMNWigfC+azhxlA3eY8qyUPS39Hoe0Uqs68SAlm7OivTvyQBVPs1iVVoSANfEOopFpqGqJPFYEqdeGjGAcVTsQHzhIqiaGICQYf+Z+5mokBqrrg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(10067099003)(22082099003)(18002099003)(260925022911599003)(260925021911599003)(3023799007)(260925021311599003)(11063799006)(261009220027099003)(261009223027099003)(261009223327099003)(261009221227099003)(261009221727099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7hNxgfj+EXMH78bQWyUIP263pc2ma06e3LOzJJaWOPpYU3ANroa+lNwEwHsU?=
 =?us-ascii?Q?2EFsrLVsGs1xbsH/iLjv4pBiqYpxTp4HMJyBmJU2P57I/2m95gd5kW6at3Ti?=
 =?us-ascii?Q?L52UvPScdxEQCOvGcuz/cUmlva4kfWLFlxmGSJdQhIQ601yTOSHIAjgbvADM?=
 =?us-ascii?Q?OqMAWwEu6p5jJrc1qGYfvcvIhCfZdXyGhEl54/yoZpmTAcMJHOZcBIPpSvgc?=
 =?us-ascii?Q?DCGDy9tkA5H7CYkcaSGTNoiAlWmhXlMxRHahfC+z/Uo4t36iPO6F3DTMzEEs?=
 =?us-ascii?Q?EnhtZSwDaLNsBeCTZyUoRbiqqJx70pXpZfA+gszj5WYjtNTFGcoRKBDOuqj3?=
 =?us-ascii?Q?pekQnYBoxiVuFuqAKUzrJMOD6P9Vj/lmoyfeUeIcvW8ThnXRRrZ4ijbmMgLi?=
 =?us-ascii?Q?ZcmNf1ch+SvgdOgerzBJDKgnJzgL/pHZJvUZ27tA8uhksVbKOz0Rux5VPir1?=
 =?us-ascii?Q?7APg6s5Ap+sXA98AXZb2/gkhbMaXT4qoe8X5UOMEwttfqL2KhuKjgSGd+7Kg?=
 =?us-ascii?Q?KC6wKjOyINmLDYLJ8bpEdsqiY03cZxfB9OEDClCbSJhDKmimGTrCimQNyhmJ?=
 =?us-ascii?Q?6zqNgoXwVFtGpEJypzP/l5t1SL4y5ZOAhFwIaFoxEQROb0hsmBcnXzlbyiFy?=
 =?us-ascii?Q?kwacqz4wM1cJvw4jk8gK0g+k19eeobV6AMXtCqA4Flvq6oc1GvIYysKqvjku?=
 =?us-ascii?Q?pEs7buhgEAb9YcwyyG3Ts+9krhC94bOv3+OW2/iNSizLwkTt0BxJ8xJw6+B+?=
 =?us-ascii?Q?uZC3Rq6u0v/F1PzVdeUxrSfF2vdku2DfzW1DNXa6xo67jH1ZttB83XKpbQdo?=
 =?us-ascii?Q?JBR9Bh1vWYrl81dRHxouGvKmnY34zJ6cBoDZGlNF84JG0WFzkunfnWp+/Qwp?=
 =?us-ascii?Q?2aDVAVIy8zZsYQ0Ty30RaQ0Rm8vY7fBLXIcJf2i1hrDxWr2kRTMjLbhrh6e0?=
 =?us-ascii?Q?H1US4aqkMcqnwG6QlPpW7GUdChPHv8PaKX6grH0S4p/ZiF0XYgPrn+ft/8BK?=
 =?us-ascii?Q?O31sWPLleYGmpqZoB0ZEs0wsCC9aynpo7NQ8HX94MyW2e5cI5Nly4vaj3U5B?=
 =?us-ascii?Q?qO1dyKt/EKxjhlOLfmQ7OuabT4CrAO1AvjJILww13rGNeW01alTUtdzMm8zo?=
 =?us-ascii?Q?UVZ3FtjN+9Ymgp1eNgYXiCxbLOHbzOlJLIEC3mRsfwhLYmszH4dngKFX9lKv?=
 =?us-ascii?Q?Ffl/r4dCPyMeZp28UUwaMJbhU8fumot7rgG81oLkjJZUXDT8Goette0IHinL?=
 =?us-ascii?Q?W+IvXNUs54sDB/CH/jC1mMYpi/0O0l/15P1DoLpA++PfNzzwGJIEwZb36vOn?=
 =?us-ascii?Q?uTK/s51WRJdJtaJI/kH8OcDgQMsED/zw/x3VaQeKJChpgAN+zVYzq97Iahjo?=
 =?us-ascii?Q?sg90+GLWMHcLIfcaM0Bn+asdop0+v6F+Nn5esxRz4p4VgSHnaK41W5cfrWcX?=
 =?us-ascii?Q?0zaJJfvLv+H+B4WQ/4DBa+He3xoaghfd+HyciMpJ7lepyihHsg0YZEXchyof?=
 =?us-ascii?Q?vw0chWgvm3mwyL52y+NxHA8qFY5DUjqnNn3GctQJJR6UytgZ0HXpfxXnLY5M?=
 =?us-ascii?Q?us+wOUIh5bVu2nvgK/yboERMqMUbGxh44mYFiCsBJj3p0cQ3VgI5UrinhLLo?=
 =?us-ascii?Q?U8kKOJVb64c4FFrD+qzC7o6gwdpK1YtZjb9c9Gx88Jj7DtrRbEl7HG9wBy1c?=
 =?us-ascii?Q?q8uQQ++RZmcZLDd8aFVUyRuWbhzarpP7tv42wIAo4sDo9po9eOQZoeEqwgpv?=
 =?us-ascii?Q?oMxY8qF5nQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: hww1qELND0UoD1nT1UAiwU+eCNMGGSathaxP7BDTHw4iscL9VgooemhvvrZn97w8pHs/+bPn/pfrhj+CycrReILMkf/NoYG9bljZyfFVk096w2HhllknEtyHHYq75XkOeUtFvGP175BT/+SQQFWZ6iqSOtoQcogHWIqY58ef5+z43nvP4g7ycEvyiqclaB3X6hYzfnaZV57DqOpAs3wEQQgCS1RziB8nmemHPdAHvkbdWfQkRMbXd3KA7EZZVh2XDE8ZkASaIK5jp2rRLi8QpVvE+zXLfryf10eDME1cbOClXOoHiET/kyUV+2Tu6ExrAK8PMsw7PmCN4Vllqo73EA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1114e82c-f4dd-47d7-b575-08df2a1fcafe
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 18:20:15.3384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ofzzeaahxCWfCOKu5dka4RmIwPwoeqcDala0MtonCVYsA2z2XSI54kZsqDV+3Inbq5WDaqYoDJUKqiaKSk1N4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6797
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

On Tue, Oct 13, 2026 at 03:28:44PM -0700, Alan Previn wrote:
> GuC snapshot output is currently expensive in both size and latency: large
> log buffers are emitted as raw ascii85, and the surrounding dump text
> includes a bit of avoidable noise. This series makes xe snapshot dumps more
> compact and easier to handle by compressing the large binary payloads,
> tightening the textual output.
> 
> Select ZSTD_COMPRESS in DRM_XE so the xe module pulls in the zstd
> compressor when built.
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>

pushed to drm-xe-next, thank you!

> 
> ---
> History:
> V11: Patch3: In ct_dead_worker_func, call xe_guc_log/ct_snapshot_free
>      after xe_guc_ct_snapshot_free (Sashiko).
> v10: Add a new patch to introduce dump_cache to optimize GuC CT/ Log
>      compression e2e flows and manage errors across parses. (Sashiko
>      and Rodrigo).
>      Patch2: Reorder Kconfig compression dependency (Rodrigo) and round
>      up buffer size to dword as per final output-dump expectation.
> v9: Rebase to latest drm-tip, no functional changes, added Signed-
>     off by Alan on 2nd patch. (Rodrigo)
> v8: Improve patch #2 description on clarity and wording (Rodrigo)
> v7: Add *why* to the commit message (Rodrigo)
> v6: Remove intermediate build files(Julia)
>     Remvoe unnecessary comment(Julia)
> v5: Update cover letter messages to remove shrink log size.
>     Fix kernel-doc warning.
> v4: Remove ZSTD_DECOMPRESS dependency.
> v3: Add Kconfig option to control compression of GuC log and CTB dumps,
>     allowing users to choose between reduced dump sizes or lower memory
>     usage.
>     Remove "reduce GuC log size from 8MB to 2MB" patch, to be added later
>     if needed.
>     Replace pr_err with xe_gt_err and add more error print.
> v2: Fix Kunit test error by selecting ZSTD_DECOMPRESS in DRM_XE config,
>     required by zstd_is_error/zstd_get_error_name.
> 
> Alan Previn (1):
>   drm/xe/guc: Add dump_cache to optimize GuC CT/Log compression flow
> 
> Zhanjun Dong (2):
>   drm/xe: Remove extra newlines from LRC snapshot dump
>   drm/xe/guc: Compress GuC log and CTB dump with zstd
> 
>  drivers/gpu/drm/xe/Kconfig            |  15 ++
>  drivers/gpu/drm/xe/xe_devcoredump.c   |   4 +-
>  drivers/gpu/drm/xe/xe_guc_ct.c        |  31 ++--
>  drivers/gpu/drm/xe/xe_guc_ct.h        |   4 +-
>  drivers/gpu/drm/xe/xe_guc_ct_types.h  |   3 +
>  drivers/gpu/drm/xe/xe_guc_log.c       | 222 ++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_guc_log.h       |  11 +-
>  drivers/gpu/drm/xe/xe_guc_log_types.h |  20 +++
>  drivers/gpu/drm/xe/xe_lrc.c           |   4 +-
>  9 files changed, 281 insertions(+), 33 deletions(-)
> 
> 
> base-commit: 83b6bc1390606facc1c0426727905f9fcd75836d
> -- 
> 2.43.0
> 
