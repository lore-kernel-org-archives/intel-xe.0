Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01361C44516
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 22:42:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A58F910E2E5;
	Fri, 17 Jul 2026 22:42:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cZnH4rwA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A2110E2E5
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Jul 2026 22:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784328162; x=1815864162;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1IBVm2QAanP/5PVSWAfdFbMkKL+7ShCzZoOB5A2oNfw=;
 b=cZnH4rwAVNVG3cM4bYMyHrDwAKJ/9ISTWbQU8EBV64BSyce9PZitze8N
 Q7VTHc1Oq85pBYpnsVMArVtPtFq5y5YUvaCrNOko9B8MgNkYN+oOq5WyN
 zwXTxEOVHlADRwPIuNdV97PFo+9Ub/YybRHrmE2OcaN1WEVgfJkIAtWkh
 yy2mMyBeLnAzezY2CXQVYpUo54gjPBJJtNGGW29bJsw7mbp9bCcOyc7JV
 AcmH50tsH3bgYH+s7v+YL23YHm+DCZisQ6+N9cac+8iakWIxefSSwgSHa
 70cGr5Wdrh9mGkDNSpUDNYQSsT8VADUPyAdKZ1sYcKb0XJd/VIQia6x/j w==;
X-CSE-ConnectionGUID: k+I3NrFyRfOBq1EVVLApiQ==
X-CSE-MsgGUID: ilDaLJ9FTMKCh7Ie3HbdFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="88680203"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; d="scan'208";a="88680203"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 15:42:42 -0700
X-CSE-ConnectionGUID: oqBscSwvSAG7loeBbCZJqg==
X-CSE-MsgGUID: UkarytYTSQiK9RuXHIeR7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; d="scan'208";a="281350491"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 15:42:41 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 17 Jul 2026 15:42:41 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 17 Jul 2026 15:42:41 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.44)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 17 Jul 2026 15:42:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L8ebO5liVMP6Lu9PxMym0ccSGSLALMrHEkJgeZoMC3CgOsgurUOOOxFq1x8vn5rJqclmNrLR/cv/52aK3o9LDNsYNwu5xUdf+L9pnQzvrQDwlzZHUXl8pHG/t96jKR1+UqwOf/COg4lhgu0wUkBbISS/RwukTNtB32bUippvJd06fx5cHm2C3RJXGd6PYjAmuc4CrwYx6LHbWy8MDZCayP/L89WKjaxxDe8BP712yUrSHmu+GvqekQWTT4Qb/PlVAghCv+U5/xSCX0z41d1UFekjPm7ylKCvZ8kVBjrWhSy+8m0FoJACxWX5I8PpvYCxcxc/PxLQ/66pf3hALbIvxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vdAcdl7CDufE9Yk3i40av+sYfufetMbXlexNCIDgHfs=;
 b=cG9eF9Px4j9Z8a4Jp4XP4DFsZ9L7At9queYfrJ/C2pt/qUgcnjAZUSVoRAQef3pHZqQa9UpiJX0xhf1ijlTWjJABfJ7GeamiPN20FFQTI81jPsvteFNnxOneH1mzAHJKU4YaeDmcjIdBSeIBYy+gzrRjRMnoYCKpPhJeikbxccQqiV3XVMFsdInFcIeFle4BTjNA1KrjMWdoC/RZBMkF7kV3KMN4qc2XB/Em61eM03WHispxQ7xRufoMwhE1XkifIFHi/zB5FrnarKZyN6zRn9F+5myJfIwyWyusu6WFZPxSb0VQx2e6GUibEZ3fRiG9jrWye4O2+UAAK46Exfbzog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4957.namprd11.prod.outlook.com (2603:10b6:a03:2df::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Fri, 17 Jul
 2026 22:42:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 22:42:35 +0000
Date: Fri, 17 Jul 2026 15:42:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Ilia Levi <ilia.levi@intel.com>
Subject: Re: [PATCH] drm/xe: convert PCI barrier mmap to use xe_mmio_gem
Message-ID: <alqv2b+dt/KaxEKi@gsse-cloud1.jf.intel.com>
References: <20260717112455.840392-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260717112455.840392-2-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR03CA0148.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4957:EE_
X-MS-Office365-Filtering-Correlation-Id: b5fc207d-1f03-4033-2ee4-08dee454b279
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|56012099006|18002099003|22082099003|6133799003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: BckGG9xIECqLo2/+CWtMZIu5cHrRR58t99aKE00+zoiRZVI/dscDlzhO3TWmIcb4MEeNYb/5aukGRaVfegU/A625XFBVslIHwVUQ8KhuotWTRK2z3CRr+OFPodspGgycvhbbZ1MoGWEFZf+kukA9FRfwajlr+MRkQHvHaQH2VmttHEIWtl/NWbarisulyZ4qQCwZhK9TovWbg19EVSTkG+Yofde9pMmO+iPuRIHuSEP0QWLQdKRuHJXE0/Kqkt/HUFQxZWs2fPFWN5Lqwjm67oY5Uo1yrjORyg0t3V/IzHwISibPt+d0ujpy9/As6tQzsuTXWsQEOToWaR5/M/LIot8lcVb+XysWrI/l0zA7lEvHmryobcKZHuD7qPjN4QnPeIMGAfb8Koyab4W1mIF8BdphkEq/3yiWlUqNj1MizUR3KnJ5GN0RQdljSaBfgdvyRIXS3FalaRLeQ5crS5veJbnl/E/wXJq9upVUJscAGJGqDAC4y+vvgTMDcZuISDRxUD9V9UptbcqPq7qu3JSydh1a1eV8fEt6WTSvDqLmpwZI+XNnGoeW+F95GzsHlJzBhzZ8ytG8C7t/b8zUPDoI6yWmGG1IYhEQ32jVXIkXvJlqleNTDE7wx1gMObJgqAoo9g7lXKHHXlI3BBWwsx5FyNT2qKtrnMJnU2rdQcUj2ag=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(18002099003)(22082099003)(6133799003)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?61fUz8bvTZs7vJI9KpHCI/SwhWjbR0nk8o3kXMHrrsSKmza8r3xGAvCQl/?=
 =?iso-8859-1?Q?6eLKf7lcrOctFDqFvBCnV50JGbES9ow8fgy+NNXkymO6vmmjW/HaisVwvb?=
 =?iso-8859-1?Q?HW17eltp+xx9u/pQ20psczYh/hW5Mx8Ygq1z0LqBBLfkt5iaaMpwbM4iAi?=
 =?iso-8859-1?Q?+QDnQG5eVi15Mdvf/G/ZDx4mPao5j0ucj9Fp+ckWyiWGHwRTRyRY6klADp?=
 =?iso-8859-1?Q?R/5PTYscBMkfSJbXSUrv/7NF6FP81HNT9PRGszahahLu4RzdtjFvPJgxuO?=
 =?iso-8859-1?Q?qPkvsIC6qU/48R+r0x6peN6d/OD++9ZSzl6KlxFNAjSiFi/sbeUk3Xa81R?=
 =?iso-8859-1?Q?KlZL/7iupLwrjmh0ULXnCWjd4tXoW7pQFvRflhAX6IlcP+beYm61/30G+8?=
 =?iso-8859-1?Q?s0FUoFuMQn+4Fej7TGKN8eXdWlinyRS6Zl5aeJUJZxh8RsYMVG0lnYjB7l?=
 =?iso-8859-1?Q?C1Yf75Bl84uJPRUm3itnukU9BmN0uRLsDiuipkL0gTR1Tp7GuGdk0dI29B?=
 =?iso-8859-1?Q?wz456uR5ZCBmPbPCl8Ts0ZBNjz6j9wXpVxxdVYw7iJkws0XEJauP027iNq?=
 =?iso-8859-1?Q?qJj5xNFJrnApes6Rnv0cQFGrSBHi1NUgUSjW1eM6SNxRSDKfFEJRBMaDa3?=
 =?iso-8859-1?Q?xHnSLx9gBEdFwWkLMdaqfcnWIH3PMbrHtKPUWIj2aiyZ61QP+HBcDobaD7?=
 =?iso-8859-1?Q?odip4IrzuFV/M/UYJydm7tlBw+bCAeq4gbgzP3rScnaUg8+Jxs2OLwEppa?=
 =?iso-8859-1?Q?dlO+HDCXvsN+f7AS5wsj8Y7IxJJGIZgC5TyeVVjuyHLJ8b98Iqqdy3gy1P?=
 =?iso-8859-1?Q?n1EOPTqM3IXLerxGP8vfQUnsoZXX0IMKN8m8ufO03S7qPBuTGfXH41Y/wM?=
 =?iso-8859-1?Q?iakzkikLfnyzg/jIPtCEivmcjZ84M+0qY8v/qXPmrJb+XYglUv+hkhpjUU?=
 =?iso-8859-1?Q?rUYt0sQRniL9daVWVv2z0lEnuaDf2bwCmSjeqw73N6emnhJE0ttBGgkitl?=
 =?iso-8859-1?Q?5wtP4L8nzuekOvNq7tFWBu6XduTCbnmsiaGdqLsjaEhsZcxfV+a8WlJZO7?=
 =?iso-8859-1?Q?Yemxm9rfEdzHrCFwS3kFn+67fwTfkCc8vVV7IMAth1QTBE/0y/U8k8MRCw?=
 =?iso-8859-1?Q?bvL64g9fITrl45p4eJ3fSEw3RAxglZ7oB76CpVERC473je8NYJz/Bi2Uua?=
 =?iso-8859-1?Q?V5rgwthx40NxG6NvBEP/MErpZZsQyuo7yTqu30ZYtIQBKmgb6d97A4MNGo?=
 =?iso-8859-1?Q?QSw9nGmZ9phm9aaWW66Eo8iiphdLhKGFPWu/bI9g3AEWkZ/PS3L4UOht+C?=
 =?iso-8859-1?Q?P4vkXruIvnX2RuEwpiM0LqwwZYrJBVGg5VxrJ5ZTtWWkknVJtRH/sIBie5?=
 =?iso-8859-1?Q?bl7mR0Stb0eXI4z9mm2JiY0AMPVBxhKc0Pw6b7MEiV5NkSWwCkqC7zYxjf?=
 =?iso-8859-1?Q?27m9YYNy7mIrmczxrTqudy06Nd04NDhwYzN6XO+MhNxLBwQNFq0DfQGH2t?=
 =?iso-8859-1?Q?3Y1+JaiPP2TVQAnBGCs18a0+fW31UT1pxnWOKAI+W7/GFnx364cT1F+PAd?=
 =?iso-8859-1?Q?ELSKiN03PFo0SfUOe1S8TOO4EnwPf+FCOcMtUGrSrCVKtP4QjQLPDY3mIb?=
 =?iso-8859-1?Q?pbtm9JWJHlQCOmhzWHKnB0GMOdHKHcNF3g+j6qiJ53eIY8zCJACU1tFhGm?=
 =?iso-8859-1?Q?V4KTOv/+UrYO0vsP7/igi2sFMdENo6KIyEyIhBCvuuOGICSY/ZhosHNhYP?=
 =?iso-8859-1?Q?Yojr53fBUqb28RZOhtNBh3QT+Ix1Dw0KARvgvoqteBTjoWZyQmRsTBrq+4?=
 =?iso-8859-1?Q?3Q8ZJ5JU3A=3D=3D?=
X-Exchange-RoutingPolicyChecked: YDdgEJdJT7X4hj3QKFJW6A+NAlTr+Qc2Q8Ub4fA7tIDgRqs8KgV2wr9kxOoPM8xzCXRuROvmBrZQBweB9t5B8tduicK03veMpPBCQJiFVk8/0LDd+jPcOs5KM7jTUz1OwZ91ugcDv62dIhm75nEWDonIBp9OWB7Avyqv2qSBZhJhGPR5V1Mv+nnsTteAOphg5tO90kKw9fUC1ZhL7ZKBHYu/wEqLIxC64QHWClcK1rgjOqHkJ/UDGJBOgF9/+l/ahP037Bx/WQYkVwi0REnPArkugHX61ENNqEexi/OX2gjQigAqzxDX5+z9+aygP8UO1SMGrylh3IYhMLRjgxwsvA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b5fc207d-1f03-4033-2ee4-08dee454b279
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 22:42:35.7816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cPybHG4WOiq6jgys9J7rJf/pnM3byB8RCEdIW67IWzu7IRbQRh+VQqFNG69U32fAuB/TqhLEnWShpNCCi13zew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4957
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

On Fri, Jul 17, 2026 at 12:24:56PM +0100, Matthew Auld wrote:
> Convert the PCI barrier mmap over to use xe_mmio_gem, which is a good
> match for this functionality. This has the following advantages:
> 
>  1) Removes a bunch of code.
>  2) Replaces the fragile hard coded fake offset design.
>  3) Adds the first user for xe_mmio_gem, which is preferred over nuking
>     it.
> 
> There shouldn't be any big functional change here. From userspace pov,
> they still query the fake offset like before, just that now it is no
> longer hard coded in the KMD.
> 
> TODO: We still need to fixup all existing mmio_gem issues.

This patch itself looks sane enough but Sashiko did point out several
valid issues with mmio_gem. What is the plan here? I would think while
we are here clean those up too as part of this series?

The big ones I think are:

- Leaking a VMA node
- Honor GEM refcount (i.e., xe_mmio_gem_destroy should be a put) 
- Add some permission control to mmio_gem

Matt

> 
> Assisted-by: Gemini:gemini-3.1-pro-preview
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Ilia Levi <ilia.levi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c           |  24 +++++--
>  drivers/gpu/drm/xe/xe_bo.h           |   1 -
>  drivers/gpu/drm/xe/xe_device.c       | 102 +++------------------------
>  drivers/gpu/drm/xe/xe_device_types.h |  12 ++++
>  4 files changed, 39 insertions(+), 100 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index c266fa6bade1..16ddbdf7628f 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -28,6 +28,7 @@
>  #include "xe_ggtt.h"
>  #include "xe_map.h"
>  #include "xe_migrate.h"
> +#include "xe_mmio_gem.h"
>  #include "xe_pat.h"
>  #include "xe_pm.h"
>  #include "xe_preempt_fence.h"
> @@ -3503,18 +3504,31 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
>  		return -EINVAL;
>  
>  	if (args->flags & DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER) {
> +		struct xe_file *xef = file->driver_priv;
> +
>  		if (XE_IOCTL_DBG(xe, !IS_DGFX(xe)))
>  			return -EINVAL;
>  
>  		if (XE_IOCTL_DBG(xe, args->handle))
>  			return -EINVAL;
>  
> -		if (XE_IOCTL_DBG(xe, PAGE_SIZE > SZ_4K))
> -			return -EINVAL;
> +		guard(mutex)(&xef->mmio_gem.lock);
> +		if (!xef->mmio_gem.pci_barrier) {
> +			phys_addr_t phys_addr;
> +			int err;
>  
> -		BUILD_BUG_ON(((XE_PCI_BARRIER_MMAP_OFFSET >> XE_PTE_SHIFT) +
> -			      SZ_4K) >= DRM_FILE_PAGE_OFFSET_START);
> -		args->offset = XE_PCI_BARRIER_MMAP_OFFSET;
> +#define LAST_DB_PAGE_OFFSET 0x7ff000
> +			phys_addr = pci_resource_start(to_pci_dev(dev->dev), 0) +
> +				LAST_DB_PAGE_OFFSET;
> +			xef->mmio_gem.pci_barrier = xe_mmio_gem_create(xe, file, phys_addr, SZ_4K);
> +			if (IS_ERR(xef->mmio_gem.pci_barrier)) {
> +				err = PTR_ERR(xef->mmio_gem.pci_barrier);
> +				xef->mmio_gem.pci_barrier = NULL;
> +				return err;
> +			}
> +		}
> +
> +		args->offset = xe_mmio_gem_mmap_offset(xef->mmio_gem.pci_barrier);
>  		return 0;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 7ae1d9ac0574..82a4666ca51e 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -85,7 +85,6 @@
>  
>  #define XE_BO_PROPS_INVALID	(-1)
>  
> -#define XE_PCI_BARRIER_MMAP_OFFSET	(0x50 << XE_PTE_SHIFT)
>  
>  /**
>   * enum xe_madv_purgeable_state - Buffer object purgeable state enumeration
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 4eed9a251e65..35a701980061 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -49,6 +49,7 @@
>  #include "xe_irq.h"
>  #include "xe_late_bind_fw.h"
>  #include "xe_mmio.h"
> +#include "xe_mmio_gem.h"
>  #include "xe_module.h"
>  #include "xe_nvm.h"
>  #include "xe_oa.h"
> @@ -110,6 +111,8 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>  	mutex_init(&xef->exec_queue.lock);
>  	xa_init_flags(&xef->exec_queue.xa, XA_FLAGS_ALLOC1);
>  
> +	mutex_init(&xef->mmio_gem.lock);
> +
>  	file->driver_priv = xef;
>  	kref_init(&xef->refcount);
>  
> @@ -132,6 +135,8 @@ static void xe_file_destroy(struct kref *ref)
>  	xa_destroy(&xef->vm.xa);
>  	mutex_destroy(&xef->vm.lock);
>  
> +	mutex_destroy(&xef->mmio_gem.lock);
> +
>  	xe_drm_client_put(xef->client);
>  	kfree(xef->process_name);
>  	kfree(xef);
> @@ -188,6 +193,9 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>  	xa_for_each(&xef->vm.xa, idx, vm)
>  		xe_vm_close_and_put(vm);
>  
> +	if (xef->mmio_gem.pci_barrier)
> +		xe_mmio_gem_destroy(xef->mmio_gem.pci_barrier);
> +
>  	xe_file_put(xef);
>  }
>  
> @@ -257,95 +265,6 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
>  #define xe_drm_compat_ioctl NULL
>  #endif
>  
> -static void barrier_open(struct vm_area_struct *vma)
> -{
> -	drm_dev_get(vma->vm_private_data);
> -}
> -
> -static void barrier_close(struct vm_area_struct *vma)
> -{
> -	drm_dev_put(vma->vm_private_data);
> -}
> -
> -static void barrier_release_dummy_page(struct drm_device *dev, void *res)
> -{
> -	struct page *dummy_page = (struct page *)res;
> -
> -	__free_page(dummy_page);
> -}
> -
> -static vm_fault_t barrier_fault(struct vm_fault *vmf)
> -{
> -	struct drm_device *dev = vmf->vma->vm_private_data;
> -	struct vm_area_struct *vma = vmf->vma;
> -	vm_fault_t ret = VM_FAULT_NOPAGE;
> -	pgprot_t prot;
> -	int idx;
> -
> -	prot = vm_get_page_prot(vma->vm_flags);
> -
> -	if (drm_dev_enter(dev, &idx)) {
> -		unsigned long pfn;
> -
> -#define LAST_DB_PAGE_OFFSET 0x7ff001
> -		pfn = PHYS_PFN(pci_resource_start(to_pci_dev(dev->dev), 0) +
> -				LAST_DB_PAGE_OFFSET);
> -		ret = vmf_insert_pfn_prot(vma, vma->vm_start, pfn,
> -					  pgprot_noncached(prot));
> -		drm_dev_exit(idx);
> -	} else {
> -		struct page *page;
> -
> -		/* Allocate new dummy page to map all the VA range in this VMA to it*/
> -		page = alloc_page(GFP_KERNEL | __GFP_ZERO);
> -		if (!page)
> -			return VM_FAULT_OOM;
> -
> -		/* Set the page to be freed using drmm release action */
> -		if (drmm_add_action_or_reset(dev, barrier_release_dummy_page, page))
> -			return VM_FAULT_OOM;
> -
> -		ret = vmf_insert_pfn_prot(vma, vma->vm_start, page_to_pfn(page),
> -					  prot);
> -	}
> -
> -	return ret;
> -}
> -
> -static const struct vm_operations_struct vm_ops_barrier = {
> -	.open = barrier_open,
> -	.close = barrier_close,
> -	.fault = barrier_fault,
> -};
> -
> -static int xe_pci_barrier_mmap(struct file *filp,
> -			       struct vm_area_struct *vma)
> -{
> -	struct drm_file *priv = filp->private_data;
> -	struct drm_device *dev = priv->minor->dev;
> -	struct xe_device *xe = to_xe_device(dev);
> -
> -	if (!IS_DGFX(xe))
> -		return -EINVAL;
> -
> -	if (vma->vm_end - vma->vm_start > SZ_4K)
> -		return -EINVAL;
> -
> -	if (is_cow_mapping(vma->vm_flags))
> -		return -EINVAL;
> -
> -	if (vma->vm_flags & (VM_READ | VM_EXEC))
> -		return -EINVAL;
> -
> -	vm_flags_clear(vma, VM_MAYREAD | VM_MAYEXEC);
> -	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP | VM_IO);
> -	vma->vm_ops = &vm_ops_barrier;
> -	vma->vm_private_data = dev;
> -	drm_dev_get(vma->vm_private_data);
> -
> -	return 0;
> -}
> -
>  static int xe_mmap(struct file *filp, struct vm_area_struct *vma)
>  {
>  	struct drm_file *priv = filp->private_data;
> @@ -354,11 +273,6 @@ static int xe_mmap(struct file *filp, struct vm_area_struct *vma)
>  	if (drm_dev_is_unplugged(dev))
>  		return -ENODEV;
>  
> -	switch (vma->vm_pgoff) {
> -	case XE_PCI_BARRIER_MMAP_OFFSET >> XE_PTE_SHIFT:
> -		return xe_pci_barrier_mmap(filp, vma);
> -	}
> -
>  	return drm_gem_mmap(filp, vma);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 56c17cca79c0..932aabb16570 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -38,6 +38,7 @@
>  struct drm_pagemap_shrinker;
>  struct intel_display;
>  struct intel_dg_nvm_dev;
> +struct xe_mmio_gem;
>  struct xe_ggtt;
>  struct xe_i2c;
>  struct xe_pat_ops;
> @@ -638,6 +639,17 @@ struct xe_file {
>  
>  	/** @refcount: ref count of this xe file */
>  	struct kref refcount;
> +
> +	/** @mmio_gem: MMIO GEM objects for this xe file */
> +	struct {
> +		/**
> +		 * @mmio_gem.lock: Protects allocation and attach of MMIO GEM
> +		 * objects (singleton).
> +		 */
> +		struct mutex lock;
> +		/** @mmio_gem.pci_barrier: MMIO GEM object for PCI barrier mmap. */
> +		struct xe_mmio_gem *pci_barrier;
> +	} mmio_gem;
>  };
>  
>  #endif
> -- 
> 2.55.0
> 
