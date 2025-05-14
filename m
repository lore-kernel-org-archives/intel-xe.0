Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 343B1C3ABDA
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 18:22:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F04F110E6CE;
	Wed, 14 May 2025 18:22:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SEybEoOg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B76310E6CE
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 18:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747246955; x=1778782955;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dHTzkpmYO8We6P52m2tcq8kIPCJp2EkYOhLbUK5fFvY=;
 b=SEybEoOgtdyZwGJ4B/iRNPevKKJ7F0drpmbgWl3LAY8SH1zJRUZcDVM7
 2sHrwVMYMfWrLlGPH54ojrTW02yykRewG3hi/sPWzvWnz4tJ2Cy8S0plc
 fOpqmHVGvOmVMp6ZFJsZgWC6uvL/+zOAjNSCf22/3sNuNrSPjQey9m00/
 8PSk41QsgZuY0jwHd6SVLzSB10+o4nUq3RlruLnU6twQJxRB+zbVFAMNg
 ARovZ7uA0zbwkn5msnTFQ1P6MvIT7RS1eRTi0PabqDWJnUFQIpGF94Ic3
 Aro55qUVPjh2hWzEkBk1F8yQMUtd8cI8zFYQGnH16CMJILBgagZ1xRq7P g==;
X-CSE-ConnectionGUID: q5rbQ2kORb2iae35paBKAQ==
X-CSE-MsgGUID: 3mgDCkbNRmS+v5+a0UmkIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="59815785"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="59815785"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 11:22:31 -0700
X-CSE-ConnectionGUID: e1XgzvIqSxmEQMXc2YWaxQ==
X-CSE-MsgGUID: 38vYx+vxTbCccx6YUdUbkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="139120979"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 11:22:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 11:22:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 11:22:30 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 11:22:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ruILir4Xr9DjqCfaCDBlxeioKVWtRNReiC9Ocfp+exU/kSTgx0Ti6KAtI8k0fGdRQamrqYkA0RvNcKP3QiijhJYAHSlaaOArcs+NC5l6ejjeLEVqwlt3cNvaLw3LERa81N+uzS/OEUzGShQkH5KJrDd8V/6gGfmhGbOpgH4Lpn1PMZqAQ306K1iTMJV+RsvXWbqa+7BueS76hZkum4oF8tLGUlENGo4aZZTSYvhlfzG3HqQcAuKkmiWEsvfZaNkKDnV5bvzSAA5udR4ie/sSbQ6bJbf10Szy6AeJZaCic1Sj/NDPHCp66UvnQ5Bv7sG7hmhWGbT9I7i/AJTqC38rKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+sMyZzJ7AnJ4AjQgawh38LRCskyfLnY/gKR1CFXtIo=;
 b=QVve1wRJEOafUPMAdvJuVACLXh1OpioyfqnIBXA9OSOIfLD7fUkAGy1RQJjZdVK5PwvL1EWxbkZahf6nArkgML4Mv1f2cvZg8YVzFbO3e9Ih37JU+nVFa2imhJjpH71MtEI5AvodrlCVheSCGyyiIfwYhKouU3UIymyDpIMoEyCO14AOk7RiylMHImHtz9DDYWdBD0YG0qKKzxxciGZZLUZLebA/f1JKpwcIQ7esAVyAJEk/0GbsQT2lGg1/C6u0htZEvvqRiQwq7psGxQeYUOiw+5k9sECaF93IdvWQ1/rfRe0f9BzoATXSBgQXVebu61fDGOB59mQlJ+DDqG+dlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4954.namprd11.prod.outlook.com (2603:10b6:806:11b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Wed, 14 May
 2025 18:22:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Wed, 14 May 2025
 18:22:27 +0000
Date: Wed, 14 May 2025 11:23:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tomasz Lis <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v1 1/7] drm/xe/sa: Avoid caching GGTT address within the
 manager
Message-ID: <aCTfuTFN0eWjx5oa@lstrano-desk.jf.intel.com>
References: <20250513224952.701343-1-tomasz.lis@intel.com>
 <20250513224952.701343-2-tomasz.lis@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250513224952.701343-2-tomasz.lis@intel.com>
X-ClientProxiedBy: MW4PR04CA0111.namprd04.prod.outlook.com
 (2603:10b6:303:83::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4954:EE_
X-MS-Office365-Filtering-Correlation-Id: 23dc7ecf-6d58-421a-cc40-08dd93144782
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qELxjQCQax4DA5TZD1Dt/hHFk4eS9pD3YFyHBWRDMKHmsxQuWoYUVpexBfnL?=
 =?us-ascii?Q?l86XWsbolAj1dKruv1LQY/MwpiYkzqQXIMGuIUeYsfkAG2QnTreZkszv/ETY?=
 =?us-ascii?Q?tr3SJlSW529tguWWG5odVJAq4DlK3qg0L14GEptes4oHIHuh1NbtDZtRkDB2?=
 =?us-ascii?Q?Bbeed7rcRcenmiDEa0oADot4NR+au+4yS6m/MimdN0y5q0I5Q7nxe7AlRhxi?=
 =?us-ascii?Q?m1I7vsndxmo4ejihjzWQUFPOAwmTRSy8Ucn609mMab7OteZd+fHdudH/wFFz?=
 =?us-ascii?Q?Fzb6eHWcvPDM+Y9kxUvnajblb4xjaewLz7bd+zRsxVXmU+7HFd1ox+KntjHf?=
 =?us-ascii?Q?SAJHHDknlFOEbK2t5Eic2AUM1VNUr/4HCu8ItMBCJ8tFgYZ27hIgpk3etkZb?=
 =?us-ascii?Q?qtbZO38EdaqYGcQ1S7FUDJTuVqpmrB4kUo2qzgrANi6HH+ZdLLVGJwLyBl8m?=
 =?us-ascii?Q?vT+ctDOlrnV+Iwo+XYImCd9zJWYrBBuuunbEay5IWENLueTImqITkV6pj/1N?=
 =?us-ascii?Q?gydNI74GOrqiZCzLqLTdriNQTV0ee4Xa1jLqJU9evsT5VXENPf6N6Svxhwd+?=
 =?us-ascii?Q?lfAkMd1Q/SiUnHUuXF6P/pQf0VIGz4ws58UOztuO8rCnPExrASEiQrVw+QYj?=
 =?us-ascii?Q?msCVB/HQHpso6gScVk/NLAVLsle4uVC1VtqR0ehK5jedwuthaT6BUZRkPzAO?=
 =?us-ascii?Q?OE3iZGaAu7i9YGqQSjyXFyQMkVFM7T7TSB7+J+Iu9k/5z7pvc2zAsy26QNx1?=
 =?us-ascii?Q?XQs78yLH/S9qcQ6DJiXVVnKaW/seJieVbT6Hwt7OcDYe2xPu7Izp2w/HB8ra?=
 =?us-ascii?Q?bf17uFM74hpDz8DCUrP6x1OvXq3PqjnjS3cMAxTXm1SlB4fIlUvJRzeVfDcB?=
 =?us-ascii?Q?fXXRl3hPW7g4bl60KdvOvRaTFvq97HMSNccDbZSmuNo/s3L4QDzrDidjKmDQ?=
 =?us-ascii?Q?yYrFbCN40zs7O4F6sWKlXrocSxWEQjxB9q11y1i/q/lC7Ol6GmbJwGu/OrR7?=
 =?us-ascii?Q?lgYgEqxr/0XAGWu8vaf/Roh/xWdFJK64qIE6/rU+XjSBVpl8E7T6wVwUYdDK?=
 =?us-ascii?Q?3TIaZmEW9XDfbBvS7DvmfSLo7k+JPC0IvNmaeoGE+HyIK7QRvnXGJddvQODI?=
 =?us-ascii?Q?u71kUsuun1DZYrALYnqCRk/nUZNYq8+sCAzcaV40JtGoOCbGaCaCSzmEtlrK?=
 =?us-ascii?Q?ZP2UXr6s2nSI/AndtKzQmvucDND8DdaFglThiYn672wyZTe946KaZLG6Qrsf?=
 =?us-ascii?Q?djEfOnZnsVB/uQE8nZw0Oi1vTlf3gx/SS8YhIzHRYTEckOo3em++kE1bTpO/?=
 =?us-ascii?Q?6nbomorY51wlUhoaRtegp15S3RC9DMqp+8VewzlH/awE3yX4G1ioIQl4BZEG?=
 =?us-ascii?Q?Zv4ZeF2GG2F6bLsVyaBt+/iXioQ8c5laUUNXAYbzGzqi0IBA3DypkaNE/t5L?=
 =?us-ascii?Q?L+DM/DDz5Zo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r7Yvz8+Ha0ytSTXiErKeKhpi6rSJr4QV5KxS4+XrdpCO8a34559xI0+foYcU?=
 =?us-ascii?Q?1OS9pojcckJIu0fAuqzbJE4wIoIwcJ3Ep3pEMj/65bb2NQ7wKvNHldyfhI5o?=
 =?us-ascii?Q?IDWMhjE3sVbx1ZnmGQEdpY4o6Hg0Pda+YLJZG/qpwWf5CqerW8s/ffsZoJlA?=
 =?us-ascii?Q?4aL1OfCXSUCIMM1i3aZGADUbwhv3N+cBhBRwnWX9DrXjp86MoRl5GgaasZ8H?=
 =?us-ascii?Q?8+aDtyCA944uUq46k6fz1A+fAyuq1xNIDG5b68Kzq+3cZ6JTouXH6IRsXrrW?=
 =?us-ascii?Q?u+a9S8CL+8L5kwDJM/avsVC+8x1BRNFfesk8uLIx5dDUW+sLqUuTQK3KHaLa?=
 =?us-ascii?Q?BXHWMRVrymNsSVIUu8+SJH3jlOiLxVE1mqqU7p8W6bZJbTPIukL0d8s2j7SA?=
 =?us-ascii?Q?qKdCLoGhWWc0YGgPUWJKQHD+Du5N3AMrcrKndXU8mH2N8jh1mPIjtk+Wr0bK?=
 =?us-ascii?Q?4/9sPazl4wXeuLfobLSzv09KMYHE199mkk3oM7Cj6MO+bblWzYTH6A6PXAA1?=
 =?us-ascii?Q?81a7+Rhgwqea4rmxfpNH70eqvitcDQSlBXbb5zNLZPkWdEkLaigMkhiSD8Hi?=
 =?us-ascii?Q?1oWh7UZtjxEvdBujsZpfACd3yRvSy368rR1eD1aIV6J2J3E/lbl63M28rBqB?=
 =?us-ascii?Q?KI9SPhloP2udyS0yuTkkXwUglHCKgCdqH5B7fraxYPuryflKun0ie4ZjStWT?=
 =?us-ascii?Q?2hq6pYToMcRzddy7AHL5kh2hHhsaLjTqVG+PFL/V4VtBPWn0bsHKj9v4gvAn?=
 =?us-ascii?Q?AmFkpDj7Q/gcIa/4cYfymPIotccfiTAv1ixCTeXNgz55T825ntTYAU1yqrGW?=
 =?us-ascii?Q?lm1o9C6cuaigRO4kYhWUZ6fiUxthRQ5d85/F4LozxsjLj08KOr7GkqGXa5BV?=
 =?us-ascii?Q?MG0+8JzStN2fl8TTcl9logoRs+ApTWhu4K9tmwxSkwKwJiI+p2JfVCRVY9ci?=
 =?us-ascii?Q?gAK43aJNyK6J4RHmWqFRiff5FTd9+Ztn2XWEhs1hU6so2Sj6cjGodeO5MZWC?=
 =?us-ascii?Q?M2mZGfdyo+CG2+vakNpbxl+T5vcY1ZBf2d1LM6SQZENQ5RBinSC7ZAzzHcJh?=
 =?us-ascii?Q?bJycIYO/01bEanOPCFFqF+SrSnO27IJwQ/BWYzDpdxCF2m316P4iIaHswvKQ?=
 =?us-ascii?Q?YkmxVv+eP1toLgflZ0xnttnoweQuaLBHBtgrI7DfP2ZQx82+M6NP1D/Wf7oe?=
 =?us-ascii?Q?h8nCGUJd9NYMhI3EmRzVrc3LHZpXgm0/rL3V5ldNSfejbFRX/HyaiaoYnpDY?=
 =?us-ascii?Q?PdzD7nv/Mbi72Of+fFJAgHXdZiZaYucahwSe5z2iwUXgFUIKVdHXNWDVM9Gh?=
 =?us-ascii?Q?ulFem2PGhMRJ8QlPeQtj8f+B8TqkKo9z6NeFgrx8rlBkswDY7GC8wQQRpKdG?=
 =?us-ascii?Q?xM8I9OPiNhtf+TLwMKZ9SNippfbX7Wb9dM466rv8k+FXxaOnZmFc6e7bPne3?=
 =?us-ascii?Q?M/G6B0dJ2rZj38yyl0jP/WoTnzo0PIxR4BpHiAZ+bjCcoj+L+yDc3JCXl9+K?=
 =?us-ascii?Q?wU947o48EfhBy+941TRz+vutqJxRNcwUzXdEtUK8UQjPSKjxum2bEkmJFv3Q?=
 =?us-ascii?Q?tf7TpTZZ2ATcgmWwrRqAcR36OImL2nkIV3Mc/6VvS9YPnBTuilEbI6YCUsNA?=
 =?us-ascii?Q?hQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23dc7ecf-6d58-421a-cc40-08dd93144782
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 18:22:27.0119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uE0i8/392Nx5iu0U050GJfKCrGChzEg5gQVyD+AT3q9bY7bFdx/LjiYZhyRctYo68pnhZAbvFlf4d4IPeuGK+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4954
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

On Wed, May 14, 2025 at 12:49:46AM +0200, Tomasz Lis wrote:
> Non-virtualized resources require fixups after SRIOV VF migration.
> Caching GGTT references rather than re-computing them from the
> underlying Buffer Object is something we want to avoid, as such
> code would require additional fixup step and additional locking
> around all the places where the address is accessed.
> 
> This change removes the cached address, and introduces a function
> which recomputes and returns the address instead.
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c | 3 ++-
>  drivers/gpu/drm/xe/xe_guc_buf.c    | 2 +-
>  drivers/gpu/drm/xe/xe_sa.c         | 1 -
>  drivers/gpu/drm/xe/xe_sa.h         | 8 +++++++-
>  drivers/gpu/drm/xe/xe_sa_types.h   | 1 -
>  5 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 119a55bb7580..8aa84050c18b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -29,6 +29,7 @@
>  #include "xe_pm.h"
>  #include "xe_reg_sr.h"
>  #include "xe_reg_whitelist.h"
> +#include "xe_sa.h"
>  #include "xe_sriov.h"
>  #include "xe_tuning.h"
>  #include "xe_uc_debugfs.h"
> @@ -146,7 +147,7 @@ static int sa_info(struct xe_gt *gt, struct drm_printer *p)
>  

Drive by comment - on devices which support faults we have 2 SA pools.

We should probably print both SA on those devices.

Matt

>  	xe_pm_runtime_get(gt_to_xe(gt));
>  	drm_suballoc_dump_debug_info(&tile->mem.kernel_bb_pool->base, p,
> -				     tile->mem.kernel_bb_pool->gpu_addr);
> +				     xe_sa_bo_manager_gpu_addr(tile->mem.kernel_bb_pool));
>  	xe_pm_runtime_put(gt_to_xe(gt));
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
> index 0193c94dd6a0..c459c71a3510 100644
> --- a/drivers/gpu/drm/xe/xe_guc_buf.c
> +++ b/drivers/gpu/drm/xe/xe_guc_buf.c
> @@ -168,7 +168,7 @@ u64 xe_guc_cache_gpu_addr_from_ptr(struct xe_guc_buf_cache *cache, const void *p
>  	if (offset < 0 || offset + size > cache->sam->base.size)
>  		return 0;
>  
> -	return cache->sam->gpu_addr + offset;
> +	return xe_sa_bo_manager_gpu_addr(cache->sam) + offset;
>  }
>  
>  #if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
> diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
> index 1d43e183ca21..fedd017d6dd3 100644
> --- a/drivers/gpu/drm/xe/xe_sa.c
> +++ b/drivers/gpu/drm/xe/xe_sa.c
> @@ -69,7 +69,6 @@ struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u3
>  	}
>  	sa_manager->bo = bo;
>  	sa_manager->is_iomem = bo->vmap.is_iomem;
> -	sa_manager->gpu_addr = xe_bo_ggtt_addr(bo);
>  
>  	if (bo->vmap.is_iomem) {
>  		sa_manager->cpu_ptr = kvzalloc(managed_size, GFP_KERNEL);
> diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
> index 1170ee5a81a8..614d858b2183 100644
> --- a/drivers/gpu/drm/xe/xe_sa.h
> +++ b/drivers/gpu/drm/xe/xe_sa.h
> @@ -7,6 +7,7 @@
>  
>  #include <linux/sizes.h>
>  #include <linux/types.h>
> +#include "xe_bo.h"
>  #include "xe_sa_types.h"
>  
>  struct dma_fence;
> @@ -43,9 +44,14 @@ to_xe_sa_manager(struct drm_suballoc_manager *mng)
>  	return container_of(mng, struct xe_sa_manager, base);
>  }
>  
> +static inline u64 xe_sa_bo_manager_gpu_addr(struct xe_sa_manager *sa_manager)
> +{
> +	return xe_bo_ggtt_addr(sa_manager->bo);
> +}
> +
>  static inline u64 xe_sa_bo_gpu_addr(struct drm_suballoc *sa)
>  {
> -	return to_xe_sa_manager(sa->manager)->gpu_addr +
> +	return xe_sa_bo_manager_gpu_addr(to_xe_sa_manager(sa->manager)) +
>  		drm_suballoc_soffset(sa);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_sa_types.h b/drivers/gpu/drm/xe/xe_sa_types.h
> index 2b070ff1292e..cb7238799dcb 100644
> --- a/drivers/gpu/drm/xe/xe_sa_types.h
> +++ b/drivers/gpu/drm/xe/xe_sa_types.h
> @@ -12,7 +12,6 @@ struct xe_bo;
>  struct xe_sa_manager {
>  	struct drm_suballoc_manager base;
>  	struct xe_bo *bo;
> -	u64 gpu_addr;
>  	void *cpu_ptr;
>  	bool is_iomem;
>  };
> -- 
> 2.25.1
> 
