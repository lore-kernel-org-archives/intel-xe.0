Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C39C67861
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 21:25:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AABEB10E058;
	Tue,  9 Apr 2024 21:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M47Uk7Mm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1EB410E058
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 21:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712697938; x=1744233938;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ML3MMUgs6icdOMva5T0pMayCpSZFI+WiAznxjWVmI8Q=;
 b=M47Uk7Mm4qFnQL8rqWkQN1sMeh4w8vJLJz4tFX5gbIqGAp+D8V2WSGCY
 nxMe9GLrRYtQZOHwAZ4/7fT73hZvUENQ+xP09hf4061PiGkj7jlYS7BrI
 8RYTss40lKi442IRDQJ8m7ACRQlgd93oqRSbGFdiqqbO+cbmTqZMJ6bm0
 kitiGmwr1eqztgFj0FzuciYMAQt0UTroepUvg1hSmid6fMJGO/JKASjnD
 1XMqAb7W9cpL7k3Shdp4PfcoO4s48KcwFAO7DSugg/fbnB21A/Ri98aMq
 Pdmh6XZ9arZWj2OuSQdJDUKDbpeQkX3nb24tea5QjNcv0jU224zWggv9N g==;
X-CSE-ConnectionGUID: Uot8oHMFTP+aKrphUDB5pg==
X-CSE-MsgGUID: GzpSnXddQe61Lteqp7o/IA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8206138"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8206138"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 14:25:35 -0700
X-CSE-ConnectionGUID: /i6hMT3tRMOh9CdOxVNn7g==
X-CSE-MsgGUID: RKOMKM9mSKmuYZAKqFLGIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="51554995"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Apr 2024 14:25:22 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 14:25:19 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 14:25:19 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 14:25:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AJgrWip3poPg/5izkTJHxPutpJkclhHsgbV8EOXXVkGSPcXOLYb09MnyoWRvB/DtvPuhQbwlzE4BNfRk0Vd1OJV1t/umRLVXKYugSYWDqFIj7eGmMmxhb6LmYEqO7kaBDfuUHsZy7umuf2S7iFHGTfGxFNJVHzqJndE+x8A6lALo8t7PKQ4GSr8JA6tzpuGs8tUtJHx0HjM1tLG27P2SE2/XRMo9KR0X7wGccbqzpcXgPmB/4c/cA0GrIIwKSX5h+dUg4KnDL8nHEAEhdjaIJi8/+jKRM57QeP1ojdceJpgsx85tzehxBWVOd0Ue6W+V+LoFVObK6ia4rVAlB9Lt+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Niy3Bi4XVx35p8m3qteKL5tDPDX/gtnHbGWindQq0o4=;
 b=PWbPDKOZsl487VAsbaiC40uQOnPHLOeG6KfU4J7D7R7YdCl8NEbUd50TQTLmO/ttRs2q6VPh3dyn2rHhLmS+bFZndXUxpchpOy6tfEOtyJBO9m+YFqaXm0eFx+LWjofineNR70blcED5/hT4g9SaareG9KgOkN3HtqWcQPVi2gtbI45KFpImpGEggBxNyh62nHRKnkEpigjAJEdcuioXubNR6Dpy/FhnuYSOGnKvVIhRWFHPe2PdL4LagpoRhB+Q0H3yKwUHXurKT7L6el6j5o3P94m+HelzjxF//mRSFMa2Xy42bHNadL16YVEbWfwjgZcLUJ240wj9lz3jnRL1nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB5110.namprd11.prod.outlook.com (2603:10b6:510:3f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Tue, 9 Apr
 2024 21:25:17 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.7430.045; Tue, 9 Apr 2024
 21:25:17 +0000
Date: Tue, 9 Apr 2024 14:25:14 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v3 00/11] Add Battlemage support
Message-ID: <20240409212514.GE958162@mdroper-desk1.amr.corp.intel.com>
References: <20240408170545.3769566-1-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240408170545.3769566-1-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: BYAPR01CA0022.prod.exchangelabs.com (2603:10b6:a02:80::35)
 To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB5110:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 94DCv1bmiwAbwdlaNG6yekNuI5XiV6L4/1V4vLq519mcYkk3I4G2oKTnzca/f+dTAX9kUCnWnw0Nyzp3j8hhsQagfyanwNoBQRjfuXjJburJPUt/49qqaTiP1ZY6GpXlZKng6O36jLl8Z2Q62AZqUWb07v4YCt+MFVpwgAwTso9Vc8Fcgl6qdsHBS/0bgCityJ6Xba52Ew5aGdRqR96d2pJO+NnouyLtsuj4VujQHpnLwNNo/+U1WjEYWVgf/VGbfJbV3kXRibr9Cz/e590Szaz9rQko3i78DKet/w5JgsbpcXDnYVCBrpTZz0++FUd73Ax7Eqji6JD0DJTdH5VROQXafoL5Ve9VXcy8931Iy0ZFTRAqHKiHr/HPdAUaUnrpvw+9Ye2+89y+GFvrd92N4TaP24HMe/H8XURBvtO5OEhGBuOEvT9FEE3Kr5YSKBc4abJmtYC1EczqBBhw0pLoLDgUiixm2gnouwW45k//YiD4H4aiZrnxqtcO1/eQMEGDtjG0TqTWGp4dODvE8Uw7OzyRt6mSbgvgJ45d02Ej434kfW6KnejidPEwQJ9RrZfm2Mgs/AqiJv0OqQPZXmaDH/Jw5wv8RRbFICLKzvQPmPo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wbXYcbsAXbqeOdrxWuPyY7rLVq8mplKE4O4tBpvCD0p2NGbsgb/Dy7sqSgOV?=
 =?us-ascii?Q?3VmD/62/kyqehvblH56WBaJh2InsHl5qHj0yqmiN4+Pb3DfZtQXU7Wy7vBM5?=
 =?us-ascii?Q?6ei6L8RlaC6ceJ5/w1Etd2nMsYwNnsvfPfAKZ9Sn2+6myR9c30f+6nvItNVH?=
 =?us-ascii?Q?dguFRkOnSxtK4cuFhmE5EvM/I67ClTk7+MF5At1TlKJC38K6szoufjSeGQb4?=
 =?us-ascii?Q?nSmC1xmQvzwnfAgK0kVi1psEoOghQ3kDnygiG/8TcBk49uVydDshj24U02QF?=
 =?us-ascii?Q?NZozrAmxAQ6drBbcjOZDcln+9pG/MDX25b3+Uo7Bvh5UfgdzF+ddFRMtf5XM?=
 =?us-ascii?Q?br7ByBDwtNpnL9AuwpxNV4IIZjnTE+BJ0GbcWEELiofu5bPEOaM9lIBRYnGE?=
 =?us-ascii?Q?RzsGnFqfE+gqNdwa5bYcuxJpTcxCLgq85KzwDXq71sVNLkwwSh6RrZO4xJjB?=
 =?us-ascii?Q?sHr2RMHyIjOljIeNo4Zzyzq13xthSbc/1UUjOQ3B/NzwTf8+PbW6O5fUyypY?=
 =?us-ascii?Q?5UtUzxUSl4xig4t1O3adfLC21sdPdp1BFKNBCH1PbSXZwXmamTysrQ3mFB+w?=
 =?us-ascii?Q?J0S2A4l6ViY3GJh1mTdjlzK2uqlbe3p8FTh059b6zwzurfD5lH6cxRcNtYrO?=
 =?us-ascii?Q?svjAQMJv1LwoHcTM/GYoc5ADv4OIEijLhSB/TrOZLH2kica6GUDydXV9KDBD?=
 =?us-ascii?Q?3fBrkxBCl05Gb9mlWOaZBMZrm7A8zeKIAL/+AEP77Dcmqe1YMRjl6oeaVqbx?=
 =?us-ascii?Q?YZUt0YIzhJbdRU58E74hi/4K0hC1qxLvjKY1DPtV1rjJrZECpiVaT6hb0Tnt?=
 =?us-ascii?Q?e8dZ2pBnXlwTIHoiqnvenqunoh+hSfqC+XwPOFsR5OSbL2y8gWTaJErwyXFY?=
 =?us-ascii?Q?yxWztVWs8kJ5dYwYaqgV2fE1VOD4AL23ELaV9+XmOVL+UbrhXxeyXrjyIG1V?=
 =?us-ascii?Q?nOBN0f2N6MubKc8i+Ih1icV5ZvhYkY5PcVxNAhAyqvLvYO1pdPZFWq8n/pBk?=
 =?us-ascii?Q?sf1SITyZtIuRPPpXR8cCs8STT1HHUctG3CC8dGfEAzkRnuiKGerEloUCEXL2?=
 =?us-ascii?Q?xm67PCMQ3LaACsgIYeK7aWQtpUh0v2Djw1/COms3cYxxDJzaYrb42yREyDfA?=
 =?us-ascii?Q?qkRZr0WmVfs/nnOSyyLtRenuPazj7eyhnFQ6k1hQXZE51ez4s8V2A9FKHSmx?=
 =?us-ascii?Q?1sUtEPQPJZe1OQE2EyaxbJSnYYtQs5tVIxKWvG0J4VYoPW8hL4mmgHzQF75f?=
 =?us-ascii?Q?uQlr86HWNBRvsEj/6FWcqEZEIFpI8AupogmqKfc8tYVpOPH+/QSAXbk8nyCh?=
 =?us-ascii?Q?WnY4vHWEi2KUhPEQxZArmrzZVNsUzfyNISF0jlhSHht5U6QEdGPYtHqOCFl7?=
 =?us-ascii?Q?Nq4FHYFoBoDEa8MxEc2CIf4XBSfYwxZysKJ9e8d15i9I4IuFmu2dxpZaJc2m?=
 =?us-ascii?Q?EVGLlXQhD/9ag3cMUFrGXeCtU5o279IZcuw1Jd+sXzUoqKyJb93EaulOxerA?=
 =?us-ascii?Q?vEqHkChuA6ITMElYWPSLUmZElRrscMib1n9MwOBBFfpSpEIz7QV817/ml/o8?=
 =?us-ascii?Q?yaFGiT4kOvFTXWLRbVUgVx0e5phmGw52tPTO08NhSrwPJ5zZ/osrhBvZn4YU?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc50eda6-b133-451d-4642-08dc58db8d4c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 21:25:17.4563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cq+dOMJIWoqGI/R9clEENxVFjiK1T3pEUV7jGEwiYfPAh2s+mrh3BFitz6QhfJ/2Le0zGz5gNGAogxkCQ3ZTnzOzci5t7IssLZzYDH1WB/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5110
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

On Mon, Apr 08, 2024 at 10:35:34PM +0530, Balasubramani Vivekanandan wrote:
> Add basic support for Battlemage, which is a discrete graphics card
> based on Xe2 architecture.
> This series provides basic enabling support. This will be followed with
> further patches series to enable display support and loading of required
> firwares.
> 
> v3: Resubmission because v2 had mixup of patches

Series applied to drm-xe-next (with the one-liner IS_BATTLEMAGE patch
squashed in as suggested on Lucas' review).  Thanks for the patches and
reviews.


Matt

> 
> v2:
> * Removed the BMG PCI IDs to stop driver from binding to it. Will be
>   added later after enabling patches are merged.
> * Function argument modified for function get_flat_ccs_offset
> * Removed WA_16020183090 which is no more applicable.
>   Extended WA_18033852989,WA_18034896535 to xe2hpg
> * Switched to open upper bound for "Tuning: L3 Cache" setting
> * improved commit description for
>   "drm/xe/xe2hpg: Remove extra allocation of CCS pages for dgfx"
> * Included the patch from [1] as the patch "Add initial GT workarounds"
>   has a dependency on it
>   [1]: https://patchwork.freedesktop.org/patch/587168/?series=131912&rev=3
> 
> Akshata Jahagirdar (1):
>   drm/xe/xe2hpg: Remove extra allocation of CCS pages for dgfx
> 
> Balasubramani Vivekanandan (1):
>   drm/xe/bmg: Add BMG mocs table
> 
> Bommu Krishnaiah (1):
>   drm/xe/xe2: Add workaround 18034896535
> 
> Gustavo Sousa (1):
>   drm/xe/xe2hpm: Add initial set of workarounds
> 
> Haridhar Kalvala (1):
>   drm/xe/xe2hpg: Add initial GT workarounds
> 
> Himal Prasad Ghimiray (1):
>   drm/xe/xe2hpg: Determine flat ccs offset for vram
> 
> Matt Roper (4):
>   drm/xe/xe2: Recognize Xe2_HPG IP
>   drm/xe/xe2: Recognize Xe2_HPM IP
>   drm/xe/bmg: Add BMG platform definition
>   drm/xe/bmg: Program an additional discrete-specific PAT setting
> 
> Shekhar Chauhan (1):
>   drm/xe/xe2hpg: Introduce performance tuning changes for Xe2_HPG.
> 
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h   |  14 ++++
>  drivers/gpu/drm/xe/xe_bo.c             |   3 +
>  drivers/gpu/drm/xe/xe_mmio.c           |  39 +++++++++-
>  drivers/gpu/drm/xe/xe_mocs.c           |   1 +
>  drivers/gpu/drm/xe/xe_pat.c            |   7 ++
>  drivers/gpu/drm/xe/xe_pci.c            |  12 ++-
>  drivers/gpu/drm/xe/xe_platform_types.h |   1 +
>  drivers/gpu/drm/xe/xe_tuning.c         |   6 +-
>  drivers/gpu/drm/xe/xe_wa.c             | 102 ++++++++++++++++++++++++-
>  9 files changed, 177 insertions(+), 8 deletions(-)
> 
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
