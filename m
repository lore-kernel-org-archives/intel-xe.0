Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A32CDB47F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jun 2026 21:07:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3CD810F060;
	Wed, 24 Jun 2026 21:07:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bD63b+mw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B9410F060
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jun 2026 21:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782335239; x=1813871239;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+HP6GG9y6w0UH8LPB6Iy5eATb8UD+QeCL6YV916QTSg=;
 b=bD63b+mwc4XiRz3kJh7fG6ktuPkBEHPWuBOb01PyjLzYEOhsq6lbwoxp
 hFUMrqRpol4JRnPK8g4Iw1KjyYxeyR3gRIjD+teZeGwxRoo/MuADTFxFY
 dhFJ8/JdMGGHrJssI1a7gt+s5iqqCXWmyRRPFEr0TJ/U1eXYPM1vzlo+W
 8/XLE4hsFWeawcYBJFHhY1dDa+pZF7wbOHEZO1VrUIZrisPDilo7gdPtz
 p1zsbi7srlEvyS1d7tEklY2GpgTdUHQPvgU5GJ4IYm22QGfbMl+j7zbhT
 0QT2KUSgwOnnCVZzeoBmqv2B3o3DECuy3EgKSEB3Oudzz2JCnVT1X4Wzu g==;
X-CSE-ConnectionGUID: WjtDxpUzSVqiK+5fZFyaBA==
X-CSE-MsgGUID: 9mXm3WlVQauqzntaowU/aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="83110036"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; d="scan'208";a="83110036"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 14:07:19 -0700
X-CSE-ConnectionGUID: bz5brDNhT52jO1eycq9jvw==
X-CSE-MsgGUID: L4y6ESLLQiWe5LiP0hj+RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; d="scan'208";a="273687335"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 14:07:19 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 14:07:18 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 14:07:18 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.34) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 14:07:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fqhkJs5B9g1ruwpP1z7Qb37P28UDCEjejyLL/icrspBme6X8Bs8tfSD5OVlTIDWXdjNlX40/qVBMnYOqqZ5t/ccnx/UhfY7CN0CVG065m5HJPOFeAYQ95mMb/W5X11anGh290oehocoB9XYa2V9e8LUVpWcQbQhjsz6JGjnxAhI/w5ceFDa+FwxnT9pV0tPNz+zQeq5BjCaQgQr+ooTK4f6P9qZYkO48thSDvQF8eFVLJu83VWpSr2LaZ8bSwbVTYAiM/82Tjny2gwxZUrX3dqFvouDLvP9d3KxhJ4RfsyA8/M3YCtco+ds6hLacwBxmQ9zcH2uNGfZTVcg9Gd731g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3LWrTHEzxba6d9QpuzNJB4u24yFHptQKbCNUUkE2D54=;
 b=AUsXhOiDd4MFkx4sNhvt1ZYKqIw8tBKIx4PGLdy4rpo+VJX1yuWA8F4z8Lp4GHKqVkntBZ61KNkjWgSQ794YQE799X86sdHuBEgjONwt2xAUPsgbPqWLju7XHPQDCQ/Gw4Hl7zI1BuTPCtoyg8VvRj9w8xIogF45z/xAQ6CEUet5B80+04rMP6F1c4pCCYVPdJB7bFhwNDDKFzfxDXVu85thePe0HHShhN+oCC8/byWTfkU8jPFENgVQJMSAUggD1WDH3wWw+FBphuvJfVsdrMoy6VfpB2LzRWTr0k3lQdUaRNbKjDkTG636b5pObD+GArga2rGG/6jzSz8xLTwYcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 21:07:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0159.014; Wed, 24 Jun 2026
 21:07:15 +0000
Date: Wed, 24 Jun 2026 14:07:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Martin Hodo <martin.hodo@intel.com>
Subject: Re: [PATCH v2] drm/xe/vm: Fix BO prefetch with
 CONSULT_MEM_ADVISE_PREF_LOC
Message-ID: <ajxHAYwu866e2i6m@gsse-cloud1.jf.intel.com>
References: <20260624174943.2808767-2-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260624174943.2808767-2-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BY1P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7651:EE_
X-MS-Office365-Filtering-Correlation-Id: b49388b8-8d7c-4b65-7cc1-08ded234914c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|22082099003|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: QpxprR0a8swDQaimD9zqilovASsKClYCiscX3FKH2yZH+GnvlZ5m74m1Zim0UTIOyQhE93PQubL7ozfkP2QkhTwTLKBoD+kMz7LXIXQ4nkDLCdNm34OlaWRDAM6ZovULmT+Y3vGyXBwFnaBngCQ8rzmoYf/P0/+1IJNzdiilAE4iLXFciDISwyWjAlJM5bB5gzNxHXhO+komec5MVVW8N+NXqYUAWz4IMWTFRtvd0QLG2vNwEce+yawnxVIijqYyLFor2w+CegXm3en1wrx3N9QRlbBdLtX9ZgHEWxrWXO8T0Ia6UeTKVAmoYsbzjZvGFFLpN8VnO/PTgVQ2bI6QpzzP9WB5gKWkvH3OrmcsrIH/ql9KSnKmuoKz6lTWcct6kVOcltqSJDlTRY/SCSOcfNzbJLaar0dPqxLdgfWl2fmtMUaYImh1rSpUYeDlEJ/3ARgIe1o/OTq/P7JK2tKaGybWSKF+tcQqS7oplQZqDDYAo5Auc/WpnZigDAE3QNltm0g77FeZmb9iLvZgSOn8jVksEVtHVfrM3pkEe5W+Qsy4EWWPluaSLINglDlBohkCHPPgHf80DfxZ3jJFyRLdnYqdTpz1OoWgcpjTKMpyQ+OiG54SqKu+QjGSEVfxlYXI4LiPxQHRO/8j/OQOwkn+yAK9pug8GtPHHNiIyqkXC8E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(22082099003)(56012099006)(18002099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5F0GMRrprcJ8nIGeU5Ewx8ldbKy7f8GlEWDCNa1nFmAiXBwug+Kq1X9zVT6T?=
 =?us-ascii?Q?xS5Asokvbk+YQdEXfRe48VKoaN+ByvovUaDf3yK2at9rnBu0XybJ/qomivOu?=
 =?us-ascii?Q?O4t5buauWQDgqwN7r06dKrMVPKaisH7xnTE+GiOUJp90PmfLtZw6z6NvdM/P?=
 =?us-ascii?Q?Mk+XFj3AnZJIf+Hc39jt7irwQZxJ9Wju08ArpFOeupJ7Ui2HQp7LdxMxcg90?=
 =?us-ascii?Q?ZypJWiWNiICQNMmT0jLYf7s3upYjM16K/Ap86v3qmunIZjmLSmylcAS9Ou3h?=
 =?us-ascii?Q?Qwmv4IukiuGSNFv+ZCMLxnG0056UDqb1Fc8+S7du7JFbGAZr+aDI1mmDToai?=
 =?us-ascii?Q?mi+u5HzZaVS1whgUn9btMA8vSRyHn1lk2vi2Atv3hI6cfMFIdvOChapmzd38?=
 =?us-ascii?Q?i5GG0NwE1Q1g3/DShCBZPTeMaQfN40BsWB8psSccC5qEBnG7+HU2WPDf82YJ?=
 =?us-ascii?Q?lIT7NtcjReHa1YT7K6D5b0zHSTjntfpOb3vaZMlqQZd3K9KFwlKKDjsanDWs?=
 =?us-ascii?Q?5925C0d6BOrI1wbyyIcuWih+2+6XlvvrmHrcdd8fteEb5i1bMu3zG/6bWfgu?=
 =?us-ascii?Q?hg8XHIRJRA/f5T3M/KWZyyeXhcrLGsJAZf8sMf4IRY1jc4THELzPNQtItIJh?=
 =?us-ascii?Q?17nsongKEdf//XYGulFfIdm23BJhnHvzlLWrICapbR4g3+yXI8/e6KlIzmOF?=
 =?us-ascii?Q?JNH4Blx4yTvGCf2PXktwNQpmyX7IdAdYpPN4fjT61nr9jP7AyGxp8+oU4Xdq?=
 =?us-ascii?Q?Eq7rbEwaw0dBebRqzuhXGco2sTl4OcaBzN4RvAKGUo8YG0Bc1TewuSLx+4xd?=
 =?us-ascii?Q?VWO4g8gW1j1T6UGNK6GwC6CgJP2iTCUAR5MSPtwrO+KOfnEtp9NHpjkXtJmZ?=
 =?us-ascii?Q?ewy9iulwVpG4Dymu/CdHA8JmT7szJQ6RCCtHD7N1wHKXZfuVb3hNjFmb0MOv?=
 =?us-ascii?Q?fprvaNwm0yfCnp9vdkCK5jsOjJOX/zarvaIj+tBJ0luRbfrqXPTuJWjeMhh7?=
 =?us-ascii?Q?CLG+Pzv2lUN2Ii7uNAA3UVKWm3n59Hoaj7ZAdtclgEp1hzAMxpH4FXnxqCTK?=
 =?us-ascii?Q?Aud6R0UyupsJ290VGtbHE/TCKJvE4QNk3oNROqRPAU6Oj6vpT9t2i2hOpZ0p?=
 =?us-ascii?Q?E2mBKdJHDL8We/hN5uKy8h9EyFD7CMh6caTcJukQ60vUGDfyCSIPJ1AERZg1?=
 =?us-ascii?Q?th6x6hWi+yH1DNw9Z4CzYYjms5NBBwHLVI2+0YwAw/6Z72mMFLzbkYPPc4re?=
 =?us-ascii?Q?dsgKN+trAhuuSEaqfdaLgfHpazh0PpAR4riBdGjUH6hpX6CxH6wkmN3USrhV?=
 =?us-ascii?Q?xN3NonNXIImM5WGGzjemJbm6KpMFm9nUezg5Ff2sbcP2dp07bBmNyOK1oUOf?=
 =?us-ascii?Q?xRg8bZp5AUzxBef1lGmCvwOOImGSD+RDyJAGUXPLOd2japS8pQ+YTi2VmyV2?=
 =?us-ascii?Q?fF03WiCGj5ccdcw8CMwzOJM86Xh/m2D2QzThEFYLqhgzw32Uk/9Sg0xeJH2W?=
 =?us-ascii?Q?A5UaZLaWiHtL6V3LGgsezcdOwpM1fj2AJqtDkP0jC6QpkwiDROu6lwFIy0Qz?=
 =?us-ascii?Q?TH4xTFesAH4LGY7bySo1+wu6OJOIMO4oF37uFvqorJRtfyGHCKAWf9n7SQ0G?=
 =?us-ascii?Q?dxxWSvGR2hdxSyYtRBT6NwAhCrDNDNuG69xnLXefsqF9GalJgKP/ZRzzHm7u?=
 =?us-ascii?Q?cJq9sjLWGMieaRFBh86wcFpdxxZobRUUZNHtCVvuUQPWOlkKvCZhCbk3Pc+p?=
 =?us-ascii?Q?yamRSoHMqg=3D=3D?=
X-Exchange-RoutingPolicyChecked: Qi3x2eSRQPPQ72kDGARvjyL0fy2LLiN7zQgiOtUdh8IMEzjdR2QW3CLPNFUDnYcEuFFvS08YP64Zx/ubCbBwXj7zWNdpqstD5tQ0MvueHiuETUtACMWwGKYp5RBzP0oRQIoxOs1zDCLADFT6v9zLftxSz4pHZydVpVzepliitab3S4TId76bnmDLlS3/QTjazNFe1tZNkYYYz+q0m2hUXFZg62rs8YiIJ/0/HCSV7SWGVebMCokU09h+WFFX7VUepUJQ8aZW809o6y61n4T+lHDo7oCwfHnvVcPdSNbl0iQYwaRO2gYPq3gInJGQwd/2g1oqjMtKMrXQ1R6wJChHnQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b49388b8-8d7c-4b65-7cc1-08ded234914c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 21:07:15.3460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ehIqolSYvH/l99TSaEClBdQGQVg64KkzmSFLMHz5anka/uiXpULtpF0fKOKhHM2nsqwL/heCDlUYIy5oMZuIIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7651
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

On Wed, Jun 24, 2026 at 11:19:44PM +0530, Himal Prasad Ghimiray wrote:
> When prefetch region is DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC for a BO VMA,
> the code used it as an index into region_to_mem_type[], causing an
> out-of-bounds access since the value is -1.
> 
> Resolve the preferred location for BO VMAs directly: local VRAM on dGFX
> (using the BO's tile placement) or system memory on iGPU.
> 
> Discovered using AI-assisted static analysis confirmed by Intel Product
> Security.
> 
> v2:
> -Fix null dereference
> 
> Reported-by: Martin Hodo <martin.hodo@intel.com>
> Fixes: c1bb69a2e8e2 ("drm/xe/svm: Consult madvise preferred location in prefetch")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 25 ++++++++++++++++++++-----
>  1 file changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 080c2fff0e95..32ded13491ca 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3255,11 +3255,26 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  						    .request_decompress = false,
>  						    .check_purged = true,
>  					    });
> -		if (!err && !xe_vma_has_no_bo(vma))
> -			err = xe_bo_migrate(xe_vma_bo(vma),
> -					    region_to_mem_type[region],
> -					    NULL,
> -					    exec);
> +		if (!err && !xe_vma_has_no_bo(vma)) {
> +			struct xe_bo *bo = xe_vma_bo(vma);
> +			u32 mem_type;
> +
> +			if (region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC) {

Shouldn't logic more or less look like xe_vma_resolve_pagemap which
picks the region based on vma->attr.preferred_loc.devmem_fd?

So roughly:

mem_type = mem_type = bo->placements[i].mem_type;

for (i = 0; i < bo->placement.num_placement; i++) {
	if(mem_type_is_vram(bo->placements[i].mem_type) &&
	   vma->attr.preferred_loc.devmem_fd == DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE) {
		mem_type = bo->placements[i].mem_type;
		break;
	} else if (!mem_type_is_vram(bo->placements[i].mem_type &&
		   vma->attr.preferred_loc.devmem_fd == DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM) {
		mem_type = bo->placements[i].mem_type;
		break;
	}
}

Matt

> +				unsigned int i;
> +
> +				mem_type = XE_PL_TT;
> +				for (i = 0; i < bo->placement.num_placement; i++) {
> +					if (mem_type_is_vram(bo->placements[i].mem_type)) {
> +						mem_type = bo->placements[i].mem_type;
> +						break;
> +					}
> +				}
> +			} else {
> +				mem_type = region_to_mem_type[region];
> +			}
> +
> +			err = xe_bo_migrate(bo, mem_type, NULL, exec);
> +		}
>  		break;
>  	}
>  	default:
> -- 
> 2.43.0
> 
