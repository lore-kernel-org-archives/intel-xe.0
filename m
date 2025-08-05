Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 647D4C87FD1
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 20:07:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0802810E2A6;
	Tue,  5 Aug 2025 20:07:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZbfPln0V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E482410E2A6
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 20:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754424423; x=1785960423;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1uWCjIlPUxJ2CjRojrJUBMxQ2atO3Sr+FQXbiu8dNB0=;
 b=ZbfPln0VN4Ui3+a5Nd4BqvY6Kph2+qEFCGed3x68h7kvjqIeKHzAoevZ
 XUyqJQhsCTj8SSUQVBZaDAw+fO5s9rz1p4Srg9F7OELunxp2ABtEWOM76
 Q/muCiXUYL84tNjphVIdDXpeB8Hq3v1Obe+mQcxB9hlJ1Lx3PKapD9dy0
 Fc6yeKbSQVp1q/ha5Nz8z8X2txsVyd3Fl5ab2APaOPLDroGxmXg50RGj4
 H7Q67nWiLUfxx6+LA7GyTF56MJ7u61tpGIGasCUZfqmruZwpIm/UZ47Hn
 znGhDEAv7fN9QPTMZyhJ8wEKaJKx915Wv2oeYEgWGuAq1gt8Is4dJSOlL A==;
X-CSE-ConnectionGUID: Xq5h34YdQKKwzRmtqibJzg==
X-CSE-MsgGUID: ctQxhVbLSySaC7Qyq/iZdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="82181065"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="82181065"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 13:07:03 -0700
X-CSE-ConnectionGUID: aqfRp/QvSyOBFkE7P4gRxA==
X-CSE-MsgGUID: hteVF1znQZa29OJ6ypIhMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="164120452"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 13:07:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 13:07:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 5 Aug 2025 13:07:02 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.71)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 13:07:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wPU2ZBOh0yhbGSnAfMR483k2ffgkSGls97GONTCadUA2DYQ3m9a8IezesDBWZn/ciYfEFe1UREQ4Yol2e7NFadHNnkdCS5ZnCzO/3ivuAxqSdtnWTJxYHMjONP/69Iu/v/msZQl+hBt6hoeJ2EquOiPo/VZ18NhomrE4GEBJoPN3hFtcuw0rGy5u/J618EeZHYyA9hN8RkGhu85CaJeIDC4hUJRrQPLXs+/1x0iAH5Kg13m22SFPR+DYlv/dS916TCIIoSO7x1HdRsjgt0gnkTjXlZmVuG1wG2DpVWw0tLsw+Kv0AYAsNMiIAko7c48g5iEFcp70KpKGrRYB1dcOgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qkhR4y9zLUiSrnnTgyAYVxkN5x9Aqusc1lpJ+sCxJD0=;
 b=Muv2IORQ2J5Sr7Wq9oCbrlfmJMf4rqaAFE9DkXAcz+67+qVH7VEoQccR7yWhOCLrHGzMr04OMwecgxp/SnQFBeX17SlLtAKkC3kOKiZieWcoCWJbd46mWSf3ls41uMV7CNC/uQFnJ8ZZGlvwFve0DK2XXKQuqYxMgWTUMVowoe7ac2fcMDosHVX2Q/9p4k1ORTzqQ/RwxRjpDfnbKTW7BZVANk0osT1oJYpNN4okMvmZCEDm8Xlnh5kagWIg2XyvWRWdFmd9qtNIQCzfMQmgZdzBsYttA2X6WMmRvfUhtqaWr9lLf2ReL65FSPq+y9EuEVCBOJtC77yQFd3v6hit9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7429.namprd11.prod.outlook.com (2603:10b6:510:270::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Tue, 5 Aug
 2025 20:06:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 20:06:25 +0000
Date: Tue, 5 Aug 2025 13:06:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v5 20/25] drm/xe/bo: Update atomic_access attribute on
 madvise
Message-ID: <aJJkPr8e3l/uCsyJ@lstrano-desk.jf.intel.com>
References: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
 <20250730130050.1001648-21-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250730130050.1001648-21-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0085.namprd04.prod.outlook.com
 (2603:10b6:303:6b::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7429:EE_
X-MS-Office365-Filtering-Correlation-Id: 1abb9bc3-8f8e-483d-8644-08ddd45b8e41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?t7CHblgojRhetxIxUwPSSN2M5Mvquuf+XXB+/F6nFk++qYcUP79pQZvgMFE4?=
 =?us-ascii?Q?5TAIDEjhKeRHUk6BU58a5xUFEosnRADIKnf+ElcrhLZbJM2A9qSvxtU5n0Zh?=
 =?us-ascii?Q?4cnJcZ9EedvAbFE+m8Dg1mrhsPBIO0Zbm4jh+jpNE+D0X77P0DKMqy2cXT1z?=
 =?us-ascii?Q?TIJm2mt9maXc/DyQyu1jtrfl7rnmGHaNbJ8aO0fz7gA6p+Y7fM/V4EQEiWRT?=
 =?us-ascii?Q?cI7ToOiOMrnjVXc6GGsumrb1CGMwu2jO4GbRFBgTsVR31CemA8iMc9hFku+f?=
 =?us-ascii?Q?xteIyf7uKgbEzQQj0yzlKEzjM/zUM+sbH+5EoGIuzMbw88qp/o4fWXWe03W1?=
 =?us-ascii?Q?aaQkujhe24mvxDWfxEY934Mg3xI0sjwbEmd5VCxdhrDek0uclxcLM9Ztfmxq?=
 =?us-ascii?Q?z2eVr8nBsDA63Th0irtbBeGy8rb8mNdF+pUBELSD9RkN3TyRV6rftJqLZ485?=
 =?us-ascii?Q?mjTs8NMswf8neOxuxw+Gnt9jq7054dc/gpZ0K7aDNDF6L0qUw8AtUOCVBxc3?=
 =?us-ascii?Q?hMJJhvqrtwRm0SuaTSd9cVAPGLbq2jEvp9G8ksly/B8EkHgPMbszm1wgs03E?=
 =?us-ascii?Q?A2K38pntkaaUZW5PrFjK9tOr8WJzS+vG5aOViaWj5VQ6dZXdrkuQIQATlSJN?=
 =?us-ascii?Q?ganuH88VOefFipAyUmdH2VjQo2hA6qJc7NU56eDAE0iz6DIjn2oFCY58YnHH?=
 =?us-ascii?Q?cPFuyCFGPc6WTfn8f0PA6M3gfe0dVpGGlYFOxnCTlaVFJsuGu6bHzBnO9mE7?=
 =?us-ascii?Q?hAM8s2G6NO1MwKMHo2pA9VOiohZb9Jvkygu/ypSFD17Ari8entSgv8Ed4Sm5?=
 =?us-ascii?Q?BD2uJWI7IsVOVw2fzoZZbV9e8yXBI/fLmxz6c1VFdE0GgtiAii4YcPRm61nt?=
 =?us-ascii?Q?0l/G9fg7vlKFMLkKzdIRT7R3PDM8+CnpF62myis4bi4czjT1hP+9hYgYyDDc?=
 =?us-ascii?Q?XuzWHmjJaGlSeKMgnlxZ/+XXhiV0kEnSIau24st2AoNdq+uP4ADxC034vzye?=
 =?us-ascii?Q?PhC2qemaZZW9qkUiYa5WmODIQcXAQpeoWfteL7aWAO/VnWwy5zIgjgpSY2z2?=
 =?us-ascii?Q?0GxbpsPfXP7nxa4TRJZD39aXv1Lu8WCG1qhI70FqmL7Hy1U7A0aczcWLbcjA?=
 =?us-ascii?Q?lfqZ8RL3B4I5nEmioaAfY1XvVPcqWKMF3vgSqDQ25ifaKV2+9KfAI8dozePb?=
 =?us-ascii?Q?ijqCQm2vYQX/iBZuy09apvAlDU1evntKEkhqZTSkWcsktn2gEXDwXA0DR288?=
 =?us-ascii?Q?RviN08QW7PSVj8xE87Yp669952s0br6jf6l7uwgCDG2lKdJqp6oR0sDw5ZkX?=
 =?us-ascii?Q?U7YdHLNBWzOZyt9ip3SB8GhF9TECUTm9IWTHGEXLJ8Q2n7FMij/27kswybxf?=
 =?us-ascii?Q?5cnrD5ZAo/6IQ4cxO0nhlbpwetP/SdQG7UZJcWmrO6EkOsaLnzovmYg84CIy?=
 =?us-ascii?Q?7C6lOKuEPm0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TemIsAJvNfYjbXhm9wBGktf+hQvsrFl0bijMx4mUfKtQyOnSZyYApqJkwxc1?=
 =?us-ascii?Q?T5N+9saCeLVP/AleGnQJBHqfM6BPenNQhFyYgeSVOXdUP+9RcoFRv2gZfiPg?=
 =?us-ascii?Q?sXa0J72048NSUL5Gcu5G+1heC5bR+GJvQXz2oYC8ZfsUubsPEzvnAetQX9gv?=
 =?us-ascii?Q?X1NTmvVQC7MeUS4z654LDsgOPyRPAtY39d4tEM2FfXXQhxmkMi9XTEPRmKiN?=
 =?us-ascii?Q?Jv/snxnkMzHBLaCtRTwAHKmPto5zWT9aZYLszk4/cJ7jU1Nls6axXm9GcSDZ?=
 =?us-ascii?Q?YKaiRf5gZvswfo+oOLmn+3JBCasM1O5OH3H0XpMekD/nlVTtBi3vRFCrRGkN?=
 =?us-ascii?Q?aWjxXekhyiwYznI46nMlzfPT9+7eV2x31eNt/vzaW4/h9sZYObzaHLn5AYqR?=
 =?us-ascii?Q?vaBdZdlCBfuDJ3E15uzSiC11QxZf42/VEXMBaFgApRmS7tPKuZszMvejQPPj?=
 =?us-ascii?Q?o50Bv/tvxSSfGwbTIMJ+rM+rcQGKlLOTeI23eNIjR2M7i41hIBlAv1JheZ6D?=
 =?us-ascii?Q?pi0pTInKKup1fZnB5cfCgaa/pKscWmLjR4l2GK5e18d1szciwB652QrV6VvY?=
 =?us-ascii?Q?/LSzqo0F/i6Fm3b8hvxMmk/89OrQ9iWjr+scA0glzZyGbprL5F0+A4w3rl1x?=
 =?us-ascii?Q?Mj9CU3DIMOFoAYu1IxkV9n9XOfgibSAaXeBKrP5jmHWsn/Nz3/GYfxc4oG1P?=
 =?us-ascii?Q?hYc7PgtnxCJFFOwajHJRYugSHjXzbynxuVWVR48jpPrJ/e90MEaJnH1dJHaE?=
 =?us-ascii?Q?fqvKbD2haVc2a9/Ty2Dw0BU/Cdoyi3gB9lWWHboP+n+FEwIuCylBLSGSOdjv?=
 =?us-ascii?Q?4v4EJQbeEaaZc4T2GDdIdTBacdT4BdlaV/lhl4sgcVbgR6NU6smP25Z6emN1?=
 =?us-ascii?Q?QJYkvUBkvmdmvdgoyMu0QlG9rniGRPkNlMNTeG9nyWx136gV1mU1MRMhW3Uw?=
 =?us-ascii?Q?CysBSNVI8uCKP1jDWcZcj9Hua+Z+d2lFCI5cTt/VTFFRpI6GNXLAoGKG/3Mz?=
 =?us-ascii?Q?4eM9u3ovfyCIXhrcViwAiDD+tIktDdQsoxl+sOyXH5NcYNRX+AojhJ1PwiY0?=
 =?us-ascii?Q?l+A1O1S6sXl8t85lIvQkd6Yq1Ax8uttWR7B5nWq30Ty/zsG4430eqVql8HLA?=
 =?us-ascii?Q?cUCeHFZ5fGbSCZciLcWmFBgZiQhv96vDG5nIA0+bxxQs56CoCdXdofzhDS9L?=
 =?us-ascii?Q?nXjTc/O4Kt3LOHF11wCMbB4pMlE6rQCSJ4p9I3mdCaZ8U1pD1JeGGdSprTjl?=
 =?us-ascii?Q?0WMkKNci7ewCWma1bHxPkQuU3yMBqy9ew7H0GYkK7LOttVvn/Sv4D5DKKLao?=
 =?us-ascii?Q?kE9+58p39QlJC+Ak/YKUkyGF1bkm6ciMoX8bbPx+2J5IYxDe92fL1Yq3l0kB?=
 =?us-ascii?Q?twDt4VO4deBKceSVr23DhOCNP2MCg54VHo4zoroUluAFZThsVdvuaZIRdxE5?=
 =?us-ascii?Q?6seP2yPqBN3WzUHExoziQ8fZ+eZk2/0bzR91uqHp9jTYJS/daVib7dCbFfq9?=
 =?us-ascii?Q?QThLQY2rfwP1ys0irRyB8hnN2AyDzBudHhEo134lHDcCRPzEsUHH7/2EEJRH?=
 =?us-ascii?Q?HZedfwxgfS6elXMVNpPNRqtTn520Rc5cFX48G0xBRwvzTwqhti4Xrv1BIKeb?=
 =?us-ascii?Q?0A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1abb9bc3-8f8e-483d-8644-08ddd45b8e41
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 20:06:25.1798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tcd2Ku1kYEbYRrOj/HkEW5ptygHEA8dPpuib2bAb4PGmkfCKcyBHXVmRJFPdtDNVR7fdVaUlbM9dKxkfmYnUlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7429
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

On Wed, Jul 30, 2025 at 06:30:45PM +0530, Himal Prasad Ghimiray wrote:
> Update the bo_atomic_access based on user-provided input and determine
> the migration to smem during a CPU fault
> 
> v2 (Matthew Brost)
> - Avoid cpu unmapping if bo is already in smem
> - check atomics on smem too for ioctl
> - Add comments
> 
> v3
> - Avoid migration in prefetch
> 
> v4 (Matthew Brost)
> - make sanity check function bool
> - add assert for smem placement
> - fix doc
> 
> v5 (Matthew Brost)
> - NACK atomic fault with  DRM_XE_ATOMIC_CPU
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c           | 29 ++++++++++++--
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 35 ++++++----------
>  drivers/gpu/drm/xe/xe_vm.c           |  7 +++-
>  drivers/gpu/drm/xe/xe_vm_madvise.c   | 60 +++++++++++++++++++++++++++-
>  4 files changed, 103 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index ffca1cea5585..6ab297f94d12 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1709,6 +1709,18 @@ static void xe_gem_object_close(struct drm_gem_object *obj,
>  	}
>  }
>  
> +static bool should_migrate_to_smem(struct xe_bo *bo)
> +{
> +	/*
> +	 * NOTE: The following atomic checks are platform-specific. For example,
> +	 * if a device supports CXL atomics, these may not be necessary or
> +	 * may behave differently.
> +	 */
> +
> +	return bo->attr.atomic_access == DRM_XE_ATOMIC_GLOBAL ||
> +	       bo->attr.atomic_access == DRM_XE_ATOMIC_CPU;
> +}
> +
>  static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>  {
>  	struct ttm_buffer_object *tbo = vmf->vma->vm_private_data;
> @@ -1717,7 +1729,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>  	struct xe_bo *bo = ttm_to_xe_bo(tbo);
>  	bool needs_rpm = bo->flags & XE_BO_FLAG_VRAM_MASK;
>  	vm_fault_t ret;
> -	int idx;
> +	int idx, r = 0;
>  
>  	if (needs_rpm)
>  		xe_pm_runtime_get(xe);
> @@ -1729,8 +1741,19 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>  	if (drm_dev_enter(ddev, &idx)) {
>  		trace_xe_bo_cpu_fault(bo);
>  
> -		ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
> -					       TTM_BO_VM_NUM_PREFAULT);
> +		if (should_migrate_to_smem(bo)) {
> +			xe_assert(xe, bo->flags & XE_BO_FLAG_SYSTEM);
> +
> +			r = xe_bo_migrate(bo, XE_PL_TT);
> +			if (r == -EBUSY || r == -ERESTARTSYS || r == -EINTR)
> +				ret = VM_FAULT_NOPAGE;
> +			else if (r)
> +				ret = VM_FAULT_SIGBUS;
> +		}
> +		if (!ret)
> +			ret = ttm_bo_vm_fault_reserved(vmf,
> +						       vmf->vma->vm_page_prot,
> +						       TTM_BO_VM_NUM_PREFAULT);
>  		drm_dev_exit(idx);
>  	} else {
>  		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index ab43dec52776..4ea30fbce9bd 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -75,7 +75,7 @@ static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
>  }
>  
>  static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
> -		       bool atomic, struct xe_vram_region *vram)
> +		       bool need_vram_move, struct xe_vram_region *vram)
>  {
>  	struct xe_bo *bo = xe_vma_bo(vma);
>  	struct xe_vm *vm = xe_vma_vm(vma);
> @@ -85,26 +85,13 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
>  	if (err)
>  		return err;
>  
> -	if (atomic && vram) {
> -		xe_assert(vm->xe, IS_DGFX(vm->xe));
> +	if (!bo)
> +		return 0;
>  
> -		if (xe_vma_is_userptr(vma)) {
> -			err = -EACCES;
> -			return err;
> -		}
> +	err = need_vram_move ? xe_bo_migrate(bo, vram->placement) :
> +			       xe_bo_validate(bo, vm, true);
>  
> -		/* Migrate to VRAM, move should invalidate the VMA first */
> -		err = xe_bo_migrate(bo, vram->placement);
> -		if (err)
> -			return err;
> -	} else if (bo) {
> -		/* Create backing store if needed */
> -		err = xe_bo_validate(bo, vm, true);
> -		if (err)
> -			return err;
> -	}
> -
> -	return 0;
> +	return err;
>  }
>  
>  static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
> @@ -115,10 +102,14 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
>  	struct drm_exec exec;
>  	struct dma_fence *fence;
>  	ktime_t end = 0;
> -	int err;
> +	int err, needs_vram;
>  
>  	lockdep_assert_held_write(&vm->lock);
>  
> +	needs_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
> +	if (needs_vram < 0 || (needs_vram && xe_vma_is_userptr(vma)))
> +		return needs_vram < 0 ? needs_vram : -EACCES;
> +
>  	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT, 1);
>  	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_KB, xe_vma_size(vma) / 1024);
>  
> @@ -141,7 +132,7 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
>  	/* Lock VM and BOs dma-resv */
>  	drm_exec_init(&exec, 0, 0);
>  	drm_exec_until_all_locked(&exec) {
> -		err = xe_pf_begin(&exec, vma, atomic, tile->mem.vram);
> +		err = xe_pf_begin(&exec, vma, needs_vram == 1, tile->mem.vram);
>  		drm_exec_retry_on_contention(&exec);
>  		if (xe_vm_validate_should_retry(&exec, err, &end))
>  			err = -EAGAIN;
> @@ -576,7 +567,7 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
>  	/* Lock VM and BOs dma-resv */
>  	drm_exec_init(&exec, 0, 0);
>  	drm_exec_until_all_locked(&exec) {
> -		ret = xe_pf_begin(&exec, vma, true, tile->mem.vram);
> +		ret = xe_pf_begin(&exec, vma, IS_DGFX(vm->xe), tile->mem.vram);
>  		drm_exec_retry_on_contention(&exec);
>  		if (ret)
>  			break;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d57fc1071142..0774b40bc37b 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -4214,15 +4214,18 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
>   */
>  int xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool is_atomic)
>  {
> +	u32 atomic_access = xe_vma_bo(vma) ? xe_vma_bo(vma)->attr.atomic_access :
> +					     vma->attr.atomic_access;
> +
>  	if (!IS_DGFX(xe) || !is_atomic)
> -		return 0;
> +		return false;
>  
>  	/*
>  	 * NOTE: The checks implemented here are platform-specific. For
>  	 * instance, on a device supporting CXL atomics, these would ideally
>  	 * work universally without additional handling.
>  	 */
> -	switch (vma->attr.atomic_access) {
> +	switch (atomic_access) {
>  	case DRM_XE_ATOMIC_DEVICE:
>  		return !xe->info.has_device_atomics_on_smem;
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index 51a9364abc72..16ab1267ad21 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -102,6 +102,7 @@ static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
>  			   struct xe_vma **vmas, int num_vmas,
>  			   struct drm_xe_madvise *op)
>  {
> +	struct xe_bo *bo;
>  	int i;
>  
>  	xe_assert(vm->xe, op->type == DRM_XE_MEM_RANGE_ATTR_ATOMIC);
> @@ -113,8 +114,21 @@ static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
>  			      xe->info.has_device_atomics_on_smem))
>  				continue;
>  		}
> +
>  		vmas[i]->attr.atomic_access = op->atomic.val;
> -	/*TODO: handle bo backed vmas */
> +
> +		bo = xe_vma_bo(vmas[i]);
> +		if (!bo)
> +			continue;
> +
> +		xe_bo_assert_held(bo);
> +		bo->attr.atomic_access = op->atomic.val;
> +
> +		/* Invalidate cpu page table, so bo can migrate to smem in next access */
> +		if (xe_bo_is_vram(bo) &&
> +		    (bo->attr.atomic_access == DRM_XE_ATOMIC_CPU ||
> +		     bo->attr.atomic_access == DRM_XE_ATOMIC_GLOBAL))
> +			ttm_bo_unmap_virtual(&bo->ttm);
>  	}
>  }
>  
> @@ -263,6 +277,41 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
>  	return true;
>  }
>  
> +static bool check_bo_args_are_sane(struct xe_vm *vm, struct xe_vma **vmas,
> +				   int num_vmas, u32 atomic_val)
> +{
> +	struct xe_device *xe = vm->xe;
> +	struct xe_bo *bo;
> +	int i;
> +
> +	for (i = 0; i < num_vmas; i++) {
> +		bo = xe_vma_bo(vmas[i]);
> +		if (!bo)
> +			continue;
> +		/*
> +		 * NOTE: The following atomic checks are platform-specific. For example,
> +		 * if a device supports CXL atomics, these may not be necessary or
> +		 * may behave differently.
> +		 */
> +		if (XE_IOCTL_DBG(xe, atomic_val == DRM_XE_ATOMIC_CPU &&
> +				 !(bo->flags & XE_BO_FLAG_SYSTEM)))
> +			return false;
> +
> +		if (XE_IOCTL_DBG(xe, atomic_val == DRM_XE_ATOMIC_DEVICE &&
> +				 !(bo->flags & XE_BO_FLAG_VRAM0) &&
> +				 !(bo->flags & XE_BO_FLAG_VRAM1) &&
> +				 !(bo->flags & XE_BO_FLAG_SYSTEM &&
> +				   xe->info.has_device_atomics_on_smem)))
> +			return false;
> +
> +		if (XE_IOCTL_DBG(xe, atomic_val == DRM_XE_ATOMIC_GLOBAL &&
> +				 (!(bo->flags & XE_BO_FLAG_SYSTEM) ||
> +				  (!(bo->flags & XE_BO_FLAG_VRAM0) &&
> +				   !(bo->flags & XE_BO_FLAG_VRAM1)))))
> +			return false;
> +	}
> +	return true;
> +}
>  /**
>   * xe_vm_madvise_ioctl - Handle MADVise ioctl for a VM
>   * @dev: DRM device pointer
> @@ -314,6 +363,15 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>  		goto unlock_vm;
>  
>  	if (madvise_range.has_bo_vmas) {
> +		if (args->type == DRM_XE_MEM_RANGE_ATTR_ATOMIC) {
> +			if (!check_bo_args_are_sane(vm, madvise_range.vmas,
> +						    madvise_range.num_vmas,
> +						    args->atomic.val)) {
> +				err = -EINVAL;
> +				goto unlock_vm;
> +			}
> +		}
> +
>  		drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES | DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
>  		drm_exec_until_all_locked(&exec) {
>  			for (int i = 0; i < madvise_range.num_vmas; i++) {
> -- 
> 2.34.1
> 
