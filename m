Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5C0C3ABCB
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 02:35:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 813F810E4CD;
	Tue, 13 May 2025 02:35:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WRu8bAAN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A46EE10E4CD
 for <intel-xe@lists.freedesktop.org>; Tue, 13 May 2025 02:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747103747; x=1778639747;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=71pWV48z9/Z1e9mQvQCHcEzKhP+rC9OM6KLdvh5qon8=;
 b=WRu8bAAN3jQB7oAsTEdBlJTgQ40peabUA+P0b0miZjwtWzSbFuQhecST
 6adKksw4E/SDscTeuXhLCJqjbYXy3YMWYmRjFtHQQjEiOMXSycfeZg+ch
 w4q7/WEsbEgm8jylI2rEDfeJu6fnOJsxThFe0HA4F1EQcFb4U0BbVZSRu
 gMEHUPsjLY3nc0KQQ6a2qJWAVIvlk6hzIYql3XPdfvLvAjSYQgbufxzz+
 XEbkjuBdy3E4CJQsoR9J970IU+JZdtsnR/+IVNP+9cI9CTgroMGrxxC8p
 RTwpEgLrnRf/4bQ1HbRDLK4giQd29jfJCPqLU79Hjnr5KhQj7co67MqV0 A==;
X-CSE-ConnectionGUID: dr3YG565TsSeMop1TKDeIA==
X-CSE-MsgGUID: 6+CGcrNVSA+B4dAQulg8xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="52733122"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="52733122"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 19:35:46 -0700
X-CSE-ConnectionGUID: yEqQUEaBTkWZOhS44P098w==
X-CSE-MsgGUID: hQ2WDCn1SVG1p7qxqMZE4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="137274753"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 19:35:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 12 May 2025 19:35:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 12 May 2025 19:35:45 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 12 May 2025 19:35:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BvMKUPuTM17qv1gTBrSZUFn2ikp2SHOGIZwKizfCrnJkIygGEe4BhNuVOwBkDhOBH6KPOcikQFG+WXNoXqohRfHErhtKc91VEHv0fq9GXJux3BFzdSfE/jx+XhN36QV27wsJpPBmY/q/H4YqqYOHNpoBD9X0RkdCEK5uPuPbknYvXV4wURaBVaBfaWr3V3fCfIjNefDwZ0UvKtChyt5PgVDQ5LqZLZamXp59Iq/CNuc64S60jGWIMGBJAjyY1eJhI5ghM4RrrIsl055rjv6GCgOxrN2oR60NS6H7dxSV4dgRBCUyg5guupWsSQLj6VxBG34ii6jT4jJ4WdkaN2D9LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d4Xa/+vBn/2yAbNvJgH2wgFrjetT+FqyFLGRNfde5aw=;
 b=mQlBEqDoKGoNJvKwPOC8sxH0bDJadlIo7BKyJXm8ReTirV6ErDhoUKZ2JIln5foR8Lp7ZGX28YZCyaZbS/BQfDBAr7SwQnmxdrURQdTFSp4hYz4ZD752duDXqTAPDwqXoJ7RXMObFNOKNxOwnaXkfuBuAFLQSg4ei4qIO16lYL9utaMj3S6qGw9odLpA3lfQWTA6n2rQ0kfRyTPfvhvt8GDk3O/Vit+CpDS5se8GJzQ8eHquKibUW49EGOlN40ASujoDiOsXaEGK38GBq3EcUTCyimKPqQzd8WW8J7Dsx3pYF/7OJx8Ao4bvmPXcIR416ztEzTbMHTgm4nKBLifXVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB6246.namprd11.prod.outlook.com (2603:10b6:8:99::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 02:35:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Tue, 13 May 2025
 02:35:30 +0000
Date: Mon, 12 May 2025 19:36:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 20/32] drm/xe/vma: Modify new_vma to accept struct
 xe_vma_mem_attr as parameter
Message-ID: <aCKwSLSJvGF1n6AV@lstrano-desk.jf.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-21-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250407101719.3350996-21-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4P223CA0001.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB6246:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d8e7e6a-ddc0-4fca-3761-08dd91c6d3a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dNXa0JosudJUERDCXsIe5SKRSm0jCsz53cpALyYcG4LPP/0ftjPyI48irSfd?=
 =?us-ascii?Q?eEWqCytD/JerHkSsv4YwDfGsRovX7MHclV13gbV3jHlguCFyMbqRGWl1oqtq?=
 =?us-ascii?Q?ZBvmIZeHXvLYI30PdXVUhsMTkXSs6LtSDssyTGCbxCCU/4fRvmazSOLrGlom?=
 =?us-ascii?Q?rRQ/1CLh0+npLG8GXVwUJDtxm+KGbWR+TZjth9Bh19KBGGexWzYcxIOhgP1n?=
 =?us-ascii?Q?gr3EpkOMD1buz2tBmZ63HsdChA5Se97T/4BDsknaH89iTlLwusnBbtkOKIWk?=
 =?us-ascii?Q?GO7RkmBILuK8NqLE/PXTVsc8CffMPHUgbBOvsd6v+NgtT/XRrzmTmDZL6elr?=
 =?us-ascii?Q?qCWuR5WGOtqUndGzyPJ/9pZyanb9aDtHb+T3E+fHmWb2CLPTEFRu/bzz8SXB?=
 =?us-ascii?Q?fc2T3GdJAXiwBFiie0LU5Sbk0zSMYdFvO7mSLHNgrsUoVSMCq5Z7D6Kld38s?=
 =?us-ascii?Q?NnpMdSQcK0hcblKmxigLm8Qork96gyqQ32oYsPLtkrwxRzSYxsV8NyuZ/2PD?=
 =?us-ascii?Q?hySHz6wIJgY0HhOws8Nm5Mcg2IkBADvdtE+MGTJb74I/ybPl2nFaTLqEUigF?=
 =?us-ascii?Q?jk8laIXwT32Kt8ntduBAveD9WFdR7+dYoKHftiZNtxl9x7BDmAUFuH0Rbirf?=
 =?us-ascii?Q?dt+or0vNGNSvjW8lP8mGMS6pphUMHXQfo81sHcOOfZQOmE4kgLYMz1pey+/4?=
 =?us-ascii?Q?erSVrUzWm4nysZzwAJJvd7a+4Em2m3IIS9Afb/m6V1/HtXqj1qkwIIQvxpk/?=
 =?us-ascii?Q?Lc3xgzpnrDJyGb1mcSXqe+Ptn7Yl94AkbWl59dNEsXYPNatWzl88f8l9J4vF?=
 =?us-ascii?Q?QRvJhBaLQwP86at4KxvmqmznAUgcj0jiQedAwahmqv35fR4cnKXRDR8Tzi7m?=
 =?us-ascii?Q?1Lu0Wb13MfjbSPhpBKAWz3gFBRUKC8n96wIxOxRSuXFLw28AMgPQ/KVwHl9m?=
 =?us-ascii?Q?hGNNCFJ8CTqkC3W4IoYASslpWFeZVRHLX0laBUsHqtiY04br9tLSRkRy8vuW?=
 =?us-ascii?Q?Ubov/vrDaRWHkbjrBONCxPv0pB1j118N0DSXluH8BnCPYlNeJ1J0oywrh/i4?=
 =?us-ascii?Q?cDmQYC/fa2mPQ2uYWpx88WxroQnobxMGbv+3dqrmdfPSRep2ZjA8QEtp3ig/?=
 =?us-ascii?Q?asuKQCcoToDeyRSMsfvxb+wAXyLnBwduyU4bA6q0FARBFQxO+3ix4VNhVO/i?=
 =?us-ascii?Q?ihDmSzKC6vu+ckcU+VLae1JYlEjNtBKIs+Y3E/uE6oH+KR77+mh4K5qbtb9o?=
 =?us-ascii?Q?fX54/pXyjPcv0WosJ012H8iaS+p5lCemJb3UDP5UEKxIBzIk45zctdvk47uA?=
 =?us-ascii?Q?JzSqkF3jcOe7l668ZGrNk0riHOvBOoQOGyJOqT6NiiwAIf/LrOiy7Jj8IIRu?=
 =?us-ascii?Q?Fe1uYANkbrBi1m5vbUcTVoZD5whCWiY6c+lYib/Qff/HlihlpTrWc4ZHRC3V?=
 =?us-ascii?Q?IKWTV4Rcrtw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pKhIqBqY5ZW0f9DsEHFFeMSxgEIAJBC99IlrxEZv+nVM2DJXfY5Jn73Z47kM?=
 =?us-ascii?Q?pPOsGrqocSmRspRPNtWKWNiru3mjK7Oz/+O6VfB9XYoC0+gtNFagCCxmcMSj?=
 =?us-ascii?Q?J7Ktens+9OcOYhFkGiHeGuxv1z7Vz7bgsk5jmfBcdHaUkbdhsRFKb9kP6gJw?=
 =?us-ascii?Q?PBO05khYsbneak+tRolTWVQyCfBwK+pJ9jOtvjUc8yhpiIPJrsbhwNBjuKzg?=
 =?us-ascii?Q?LxEi3WDUJNRPgLIwmsMh2fDXZjENrR5ZcvH2gmBylr8paeGWabkYvv3ZhnW8?=
 =?us-ascii?Q?BUzGWQGWSKQEMAX5gd+yK4hYFKWqFhAwnwFM1J94JcVC/dvedOXpTJ94AqLk?=
 =?us-ascii?Q?lFGnpIEnpuoAJmUdUcQUywggXYmf/6qJu6X1cRrB2veRfDsek8MIRnbsSwin?=
 =?us-ascii?Q?1nIYXiPCDgiYW1v5vVJGbe6Au6SUml6lVnAg3BAawlkQIpiL8eKpZ2znBmLA?=
 =?us-ascii?Q?dlz/QvCpEKBWQP+GMURAO6LQK/yBDbs+Isub+v/Vyq+TJHuBWln9CUKuDsvS?=
 =?us-ascii?Q?9m2+XfnrN9BVOsWAM1cLOWmuYIyNxJB0Cdwbr4BM0+D7alSps0nSG77JbqM/?=
 =?us-ascii?Q?21QJvpAEUGe4Zkj7XkSL2JLzQLiAYa+/GJu0bjBsSfw6aADgQ5hgUld/VeEr?=
 =?us-ascii?Q?hFyV6H84y7N+4ZOdSm0cCXYug13+apMivkU30jYgr1cwk3tYoBs9skMvubOh?=
 =?us-ascii?Q?rNHEhwhZjIkaYd9sOaey4uN4EDXVC4bxYlrA3xUY5myDu2n0JzqTND2f+3AW?=
 =?us-ascii?Q?2o48pghkJj+uiAMaD7tO+e90YZGoapfIgEX4kVwRQj+E6yjIktxZ1N3gX7M8?=
 =?us-ascii?Q?adV37hUwb2V3Q1s3e4mcAKr0gQixspRQ65ZOtudiES6oLXJUxQqEIhlAtc51?=
 =?us-ascii?Q?xqLFJ4KaWxl1ymYPBdNAzV+StKtHoYKuRiBM5Q4sH5MKRLR3vq+8vOLRao+e?=
 =?us-ascii?Q?mpHPgH/z3rSsfA0f87FN2pEUNbCqbHqFcjza/tJJseXIj4bko37GpPbXZNqL?=
 =?us-ascii?Q?GxAa0O+dh0PpduiorKNrpU9AvBFp94KOeYCuTVVGKwY/cQn1V7celrQwFWL+?=
 =?us-ascii?Q?gL+4eQ2Px1yfH0QLYw9MSJzlPRBh8IVGObNAgCuQguLN69AzYonEtJQnGm/P?=
 =?us-ascii?Q?krL0YgB32j+C8tXeWpRQQ9tz8+OzeyznwW0/fUwNnsK8WoiMNcRHb9dpoYw9?=
 =?us-ascii?Q?Ylqzdit4qytQLvwgQ6MY1otbnqtmiowr11jjteI8/p2h3a2tH9NL5wcrmK5x?=
 =?us-ascii?Q?bG7frPK2kaV5O7DmAZA/EYfL+8P+TO6ajvVG9bUgP98jR/+PFKG07z4Y6lL2?=
 =?us-ascii?Q?CiE/jXelBAsybQWez+rRpnRplEJBHDqAyuB/sp99nEB1duBYbe8PjzLoATty?=
 =?us-ascii?Q?KqBAJbGxxrwumQdgOBfuxRmELe1rFLNkiMAsQpW40da+JHlJFqf0+gpaceM+?=
 =?us-ascii?Q?W74E5Ul0iaIjM1z0NkmienwNwdMOASK1/NWuLApvPIwe41LBHgqNyP+r4esB?=
 =?us-ascii?Q?Z1xS8OAJI0vSm4fNd8IxPywfTRHlKHAPZd+RCx6fn4g1k0hqgKNLVlx9uPOp?=
 =?us-ascii?Q?klWdeeEop4fvZ5i78ZMjFyh0j6hg3EFyw4e0ntPj+CjTU2NsAQa6PEu6kdkg?=
 =?us-ascii?Q?LQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d8e7e6a-ddc0-4fca-3761-08dd91c6d3a2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 02:35:29.9373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TpSKcu4yIgJ4MGWdj9Z515cIvR2lw+T/wVZMJSjUAnTh3lEcFxotyacIh9gH4pA+HkYo+Zxz0DKh/xDUem5lFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6246
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

On Mon, Apr 07, 2025 at 03:47:07PM +0530, Himal Prasad Ghimiray wrote:
> This change simplifies the logic by ensuring that remapped previous or
> next VMAs are created with the same memory attributes as the original VMA.
> By passing struct xe_vma_mem_attr as a parameter, we maintain consistency
> in memory attributes.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 37 ++++++++++++++++++++++++++-----------
>  1 file changed, 26 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 59e2a951db25..6e5ba58d475e 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2421,8 +2421,16 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>  
>  ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_create, ERRNO);
>  
> +static void cp_mem_attr(struct xe_vma_mem_attr *dst, struct xe_vma_mem_attr *src)

Drive by commment - not need.

memcopy(dst, src, sizeof(*src));

Matt

> +{
> +	dst->preferred_loc.migration_policy = src->preferred_loc.migration_policy;
> +	dst->preferred_loc.devmem_fd =  src->preferred_loc.devmem_fd;
> +	dst->atomic_access = src->atomic_access;
> +	dst->pat_index = src->pat_index;
> +}
> +
>  static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
> -			      u16 pat_index, unsigned int flags)
> +			      struct xe_vma_mem_attr attr, unsigned int flags)
>  {
>  	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
>  	struct drm_exec exec;
> @@ -2451,7 +2459,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>  	}
>  	vma = xe_vma_create(vm, bo, op->gem.offset,
>  			    op->va.addr, op->va.addr +
> -			    op->va.range - 1, pat_index, flags);
> +			    op->va.range - 1, attr.pat_index, flags);
>  	if (IS_ERR(vma))
>  		goto err_unlock;
>  
> @@ -2468,14 +2476,10 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>  		prep_vma_destroy(vm, vma, false);
>  		xe_vma_destroy_unlocked(vma);
>  		vma = ERR_PTR(err);
> +	} else {
> +		cp_mem_attr(&vma->attr, &attr);
>  	}
>  
> -	/*TODO: assign devmem_fd of local vram once multi device
> -	 * support is added.
> -	 */
> -	vma->attr.preferred_loc.devmem_fd = 1;
> -	vma->attr.atomic_access = DRM_XE_VMA_ATOMIC_UNDEFINED;
> -
>  	return vma;
>  }
>  
> @@ -2600,6 +2604,17 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  		switch (op->base.op) {
>  		case DRM_GPUVA_OP_MAP:
>  		{
> +			struct xe_vma_mem_attr default_attr = {
> +				.preferred_loc = {
> +						  /*TODO: assign devmem_fd of local vram
> +						   * once multi device support is added.
> +						   */
> +						   .devmem_fd = IS_DGFX(vm->xe) ? 1 : 0,
> +						   .migration_policy = 1,	},
> +				.atomic_access = DRM_XE_VMA_ATOMIC_UNDEFINED,
> +				.pat_index = op->map.pat_index
> +			};
> +
>  			flags |= op->map.read_only ?
>  				VMA_CREATE_FLAG_READ_ONLY : 0;
>  			flags |= op->map.is_null ?
> @@ -2609,7 +2624,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  			flags |= op->map.is_cpu_addr_mirror ?
>  				VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR : 0;
>  
> -			vma = new_vma(vm, &op->base.map, op->map.pat_index,
> +			vma = new_vma(vm, &op->base.map, default_attr,
>  				      flags);
>  			if (IS_ERR(vma))
>  				return PTR_ERR(vma);
> @@ -2657,7 +2672,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  
>  			if (op->base.remap.prev) {
>  				vma = new_vma(vm, op->base.remap.prev,
> -					      old->attr.pat_index, flags);
> +					      old->attr, flags);
>  				if (IS_ERR(vma))
>  					return PTR_ERR(vma);
>  
> @@ -2687,7 +2702,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  
>  			if (op->base.remap.next) {
>  				vma = new_vma(vm, op->base.remap.next,
> -					      old->attr.pat_index, flags);
> +					      old->attr, flags);
>  				if (IS_ERR(vma))
>  					return PTR_ERR(vma);
>  
> -- 
> 2.34.1
> 
