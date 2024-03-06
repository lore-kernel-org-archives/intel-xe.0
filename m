Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33107C54E41
	for <intel-xe@archiver.kernel.org>; Wed,  6 Mar 2024 23:09:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8DD110ED74;
	Wed,  6 Mar 2024 23:09:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dcXEcs7K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DEB210ED74
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Mar 2024 23:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709766552; x=1741302552;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EuyQDueSt9S0aomP3lltCNqTbuDfpAu3OqRDqLV2woQ=;
 b=dcXEcs7KtZx/pI5H1m34RTE7qFaM4bpOvW/UwRn3anGegp68LZ26wAAz
 Iu9d5/lRTyPEOhA3Yla45hWo7ufpzFisKa3mSuvUJ4UlvJv0ETizGTjHL
 Imys0NXKZ9fIXYiAM4JyfPTD1hIevLub/KQ+QMpDuTwLvtDulsF0bs+hJ
 ZBGG/dcmCf8zrCX99J7BPYghrYFbk6nI2wfzkaTGQ6gr70H6ryXoHhhQv
 bTgVVUSjHc6TEAc9oG1zKldZCbfqjOME9vZBpKGiyPj5U2fkueK+5gpEa
 OtiT+YuEycYvUuF9jAxjrzZFRWg1tQb11jcAWPy1Qj3IGG7lF6RJuE1mq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4277559"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="4277559"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 15:09:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="40891531"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2024 15:09:11 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 15:09:10 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 15:09:10 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Mar 2024 15:09:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lIfJxuz5TAvkS98UEn/HofcW5tQYCTL9DW7Ms7FiJELSpAshRP1xrPCXXpw5h+5ltnbwQqBiAP8mR1hLDCL5o3l0bKNSLg+YhA9pGnBoqKun8G+NxPGmR5b0vGIZGJPteTclbETYwCuMWYegby2MJKojbDqLgmB4g16aNvP/SLbOnYHM84rqQtYSmAQ9eNxeGaOYSILIBPLO+TvLkYWhXU5zrU9CxMsfg8iuB2twKHUwBfEVOdEPl8W29Bstp1aeavFtRi/PegNfjL41DG9mfsodyfLlwCbsELhJPmrenAFTHSrk7Mt0zj0IMjzlMjdcpjfc9FSz2yzU1EsUzi95cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XlEYPljXKvNn3h5Vg3Di/0X63EWVGKycBn6aSC8lsMs=;
 b=WsyfWQnTAlpx0k4ThYAdf024uyThbpF/1t+j3m8rKMJBh++RJap9CYPLyH6Bua8saQYMKWpoX2UFI+jdWe9Yk3Sky6nzNRNn9v+59Fzwyexf+om4JeFTN47kvsWc6jXrGz9N2nYbMkITFRLyOq0daeAUdJrzu4Kri3SXdk7+VDAnrKDFmF9VH69e0K0xrwOX9KKtzA1gWbWau4n1rsNxxmRqZAyHDjvI9f19SkEXJnzrd4Ab5hZgcXWtNKXjDseq3lFhMeZe1vs+3zvdVvA5PxJeQrRVIOacV3BewVJSPh83UCFaDWpJ1PbaV7P10KMbxj9/mfwtbbnw0WezRLhKgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB4990.namprd11.prod.outlook.com (2603:10b6:a03:2d8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.22; Wed, 6 Mar
 2024 23:09:06 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 23:09:06 +0000
Date: Wed, 6 Mar 2024 15:09:04 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe: Remove unused FF_SLICE_CS_CHICKEN2
Message-ID: <20240306230904.GD718896@mdroper-desk1.amr.corp.intel.com>
References: <20240306192128.1895603-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240306192128.1895603-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0354.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::29) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB4990:EE_
X-MS-Office365-Filtering-Correlation-Id: 18fe57b2-fb38-4962-fc7a-08dc3e326c55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZTosmME0htFzIleEZ0+YEo8SUMRehvjwxe1NCQz8XkVNxhNT3raZSQ+8WBpgOw2xk/XAZ16BwegAfTKfME2OL5HoOLbYC//Mw111rSIugNLdCCMgxQg0dOHcDpkslJE2Kq8Cir2Qdq1OHS+n3IHlWRJ3qMQAOHVtCmzlX5ei8EJZcMn3mamMQse6tYKmInX9oS5opBUAjtypgxPseGdQTomRiZzca5CGi5pfNJnEv8lS8ZNDsfrOvBgnglzC3QVYCbo1H9yh2YhNC4uiqoRTlC3ArqchZjHsfN+dpH7PdWLgwg2zM9sjZ9Xu+xI41MzLXntMVSUWguZeilPeh8pLYKRgJ2F5lkNdPpzrKwK8x4CA/ThHzLl03j2GCy7ob2z50E1JuJeN7NXIPxe6MP0ucZzJORyORkCXFnpU4tH6AtnqgPzkWVnSi2t64Xv5xjxXHcvGpjyP4JOxcuMgRKJDoUPZpxXybm2dAVz0lI2GuZaa8SpFORZ8npnj78CAVPH5RhySQSELQXDNHxwOXI+hDvX56/YHfMGfntiYSwakVolpvuVmjmLIrn7Z4f3dK5MZZcPMSZafQDWUCEYgp2SZbKPyHoXKyXx8op+cMxFMdKYQsZ/4oxvop3DoCJP+gV66eA4dbih/q5CGiccAUgNakjhMgUmIw1r/X4pwqsztcKs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ztlshva9CYb7YPF1JZspwLDvf7TuVoDU3sCfqxYGI3olsnBCoBekNREDe0Hv?=
 =?us-ascii?Q?ueLnKVo9q3gAX1QRblos15jRPEFQcGxejgnPBJ97PKQNi9Puv0rgxjRSDZAc?=
 =?us-ascii?Q?BnrN5CVbddNzLechB+cnpl7Xf0ovY8JZ8zbXzWcsnYDu67OBVXqNS83U07Bj?=
 =?us-ascii?Q?Mu0yCgHnKiwZ2zsIvTMLJ2Qr4LZLcRHoQRNrPCqVAQNz8xiiTwCOQrOPs0+Y?=
 =?us-ascii?Q?BUHf4PWC7vJ/bR//EBmskycZsmEiTCAGjuyYDCWa3anx47KwJq7vRJQ7RWnl?=
 =?us-ascii?Q?NY3l5LXNl7xl8ylxAKlCU4f8XlEpE5ZhpdP4th7ld6TVUF10HlXgHFEcyWAr?=
 =?us-ascii?Q?Y/BdTuaKJOQvcxfUVa7uvO3Iq7H70yPU8AWhAc5hSzkugf0z8FYyPdFSjM2z?=
 =?us-ascii?Q?eZ2OB5MRfCDJadGvPOypw8ryJ6FZMPImWvP1jr9iKezPmPg3eqM3vg23QBUa?=
 =?us-ascii?Q?62Qxexphe2sn8WHFsB8QpDLWV4ZibD6fjBKuldYFpQ9T3kVvpb7LaehQWPnG?=
 =?us-ascii?Q?nb1FLzMUkLIJ9sJGUxbZCcqe0rJFeEMMCJ6MPa/rD38f8qoRyOWbhENKnXy3?=
 =?us-ascii?Q?SgFxqUpqpr7SXoxbqWvMK3Pp8erAEr64XxZhJ7ZczU5hx0zDqfAARDoJaPBx?=
 =?us-ascii?Q?luSEenl4c1gqDf7fFl11sS8AJ3r0ppVYmAwVrK7z/WeCHg86hjomy+qCkKWp?=
 =?us-ascii?Q?Qe2rYbBfj/ct518Ro5foTv4UU9LlBajf5cBNKT+lympeGPjbRuizSRbuo0qt?=
 =?us-ascii?Q?PqDluv1ULSS4a52QLGsWs8xfvp98Rr74hsUK7WHBRUGXRDC80rLkcykIhAfH?=
 =?us-ascii?Q?4dgxkSUoTw3n43PGGqGWcQfFboFDk5XVylS3+u5/dF2xPdFyvHZA/PTFgv8H?=
 =?us-ascii?Q?huvcfM14ur7QAN9odyyPUuQcYIX3lrx6h3PumA6vxNadZVtg7+keyQZkLQsc?=
 =?us-ascii?Q?C5y38mHlBIvmp3yNcSwoNprdo52qmkjRnL6+Vqh6PoplM9OO5mpVuhb/0U7D?=
 =?us-ascii?Q?zwVS1gwrbnXPkz4bMiicNeddICWaaGmVRp9B6a54tb+Lm177HZl+BnQXqdXd?=
 =?us-ascii?Q?s7/nzTjo5IokNX98JV41jhfQKh6m09Cds0xgoVkZGl8D/zmMtNdXNI5JBW+o?=
 =?us-ascii?Q?/HSIPDVqRHqu+NU7R57dNWvZpz/vcKXjcV6c+2cKY4nvsqR2igW/9p0SUdOa?=
 =?us-ascii?Q?LrH4dkinhXBwJhGEWrGUq+bpPE8ldSwrhlR8hO0dtnAQ0rmzTs01xQoiRBsk?=
 =?us-ascii?Q?7FhmB9aKXQYZsKRr7bhqLNZKTb8Qgzl9uBONx4zMjyyc1pmqP+J2g+GJ6SUB?=
 =?us-ascii?Q?hvAiN+oLvThGDyKcV1TIqZKujmg2pQxTWH812E+Xu7y23Lbi+0EWRFx3s2vq?=
 =?us-ascii?Q?L4EsMO16NLtxtBmk1K7e6MdIkW/E8TrY/LYb4rBxK9pd7eu5abwHD3k3XkkB?=
 =?us-ascii?Q?WNnt5QEJnDhAUy8fw6fctUXpTt33LyBzzU5x36q4puxKZFO7jqDRv7oLpK6X?=
 =?us-ascii?Q?a0maM2V/vxS1yEWq+RxG/u1fMmkFMPmlx5YzU7V5YsJ+P9GdMBclP4Nak0Wy?=
 =?us-ascii?Q?Veg3Hap36NqOzgGteIAKjL5e3GcnvWSym/dLDkHG9gGcutD5uJv36t4xh7AH?=
 =?us-ascii?Q?+Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18fe57b2-fb38-4962-fc7a-08dc3e326c55
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 23:09:06.8340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C+a3pgCtKZkC5/LsvXtSZaFqgjJvxfuXJs5jOhGA6FiMc1Jyn21ALAd2oR9++FUM8E6XcMzlpz0qmq73lj1ogo3Z8Z+1GyoRQITlJIaR/fw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4990
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

On Wed, Mar 06, 2024 at 11:21:27AM -0800, Lucas De Marchi wrote:
> Commit e89f4967d90c ("drm/xe: Drop WA 16015675438") removed the only
> user of that register and should have removed it. Remove it now.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 0b1266c88a6a..a08528d9c76b 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -104,9 +104,6 @@
>  #define FF_SLICE_CS_CHICKEN1(base)		XE_REG((base) + 0xe0, XE_REG_OPTION_MASKED)
>  #define   FFSC_PERCTX_PREEMPT_CTRL		REG_BIT(14)
>  
> -#define FF_SLICE_CS_CHICKEN2(base)		XE_REG((base) + 0xe4, XE_REG_OPTION_MASKED)
> -#define   PERF_FIX_BALANCING_CFE_DISABLE	REG_BIT(15)
> -
>  #define CS_DEBUG_MODE1(base)			XE_REG((base) + 0xec, XE_REG_OPTION_MASKED)
>  #define   FF_DOP_CLOCK_GATE_DISABLE		REG_BIT(1)
>  #define   REPLAY_MODE_GRANULARITY		REG_BIT(0)
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
