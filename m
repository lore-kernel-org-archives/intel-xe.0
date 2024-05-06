Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7953CC25B4F
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 22:51:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D89B110F36C;
	Mon,  6 May 2024 22:51:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YcZe8Zwr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F52F10F36C
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 22:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715035870; x=1746571870;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=N7bQ8owqu2fEzzpbw+V+1DfFJW/n2bLYebqvmyYnZDc=;
 b=YcZe8ZwrNJvI672pmb5vWDDTl11c12EzUP4+OlO+f09ovRScc0csS8cG
 T0j6XXW/X+aty0BJBKSgbTFonmeoMWkS9Cu2+K26WT7B97b7RKq9stCg5
 6CThDN41JZkJ/3gsKRW90GjK4DHBIFvsbjH8YeMSD1wDhablI17b5YCE0
 jl9xGBJq91ENuleaaUIQD1SrsvGP5I44qul+8e6wLtorBmTebe4Y+pv2O
 yERxa7pgfHDG2QHowqMp5wjXhS8qeDnenGL4PH9C/JrqHhYwbsMKasO6t
 VXjG43gVkVFtqKNpIaopPy83kKv0Z62zgPnjx5pVdKLJDeCiLCSV2mxI/ w==;
X-CSE-ConnectionGUID: /P09cdmLTyy4gejlPXdKtQ==
X-CSE-MsgGUID: Jklivq4IQVm3rQvHbTXuqA==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="11344742"
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="11344742"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 15:51:09 -0700
X-CSE-ConnectionGUID: MMfvqtHrQK+7ipDePAYy1g==
X-CSE-MsgGUID: awWryCaFSCu2TLE/HCIrNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="28417989"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 May 2024 15:51:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 15:51:08 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 15:51:07 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 6 May 2024 15:51:07 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 6 May 2024 15:51:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xh0WI5sq39vYTwXEX4ur2HSlRdD4lB5Oxg2dHIPKS1BNH99h4xlS30EGrhoK0mahICFcjSvKzniJRElNlB8EqCRRIymRJNs9guANODwCHJLtgICIPrP/QKQZvq5dt/depoWNYqUk+0Ri/2Uy6LmnaIhQZRbWkIs4+u7a5FhYfPVECEnLcQ6uF/vpvR4cAh8KNUgkshB2bhi6aUBk9Bu70hmhMO1So7FeBGgjMhLJYD0sGuRwa8FoY74Yn93EKAps5YA1ipHgUiLMwM87C7BkKVgAHwUS1GyhxEJdJ5lVlvn1XlutnlTV4MysVqhZoolD+BjqcmJhVluw10Yqj1gERg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OGet1b31rHfUhns+RkJfhI2UvhG3av8ppJsy7tTb2Gw=;
 b=UOraXayq1xPOTPx31kWEXcTI6PrOW0CakcHTq2o7zJOE+YkMharLlQofJfauRoaXRDRi8HdSyYcRJbIzO2cp7/QYSy/DpQRc25qADQ3Dwq/ygbMmn09faEVkNhqMgKyWMcrHhprfIhjVXD/fS6hZ7EXakqaf9vrdCvzIodu2OU9/iWih9fSVPYfPy0IymUBgfAJrfp/6YfbPSr5Q0Whf00nbGz7JEZKQxg5GOuSiCdCbW1A4oye1NjHRZE5y7ZFLQ9bpDdfzi9ZBguWKanFtPdWC4VeMP0PdYGGMkFWSFuOohUUhxeDH19BCijmpSoUjssB2ymP8BrGHqiDFYeVv2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB7028.namprd11.prod.outlook.com (2603:10b6:510:20b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 22:51:05 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7544.036; Mon, 6 May 2024
 22:51:05 +0000
Date: Mon, 6 May 2024 15:51:03 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Fix xe_mocs.h
Message-ID: <20240506225103.GD5615@mdroper-desk1.amr.corp.intel.com>
References: <20240506205254.2659-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240506205254.2659-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR01CA0047.prod.exchangelabs.com (2603:10b6:a03:94::24)
 To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB7028:EE_
X-MS-Office365-Filtering-Correlation-Id: c45e41e3-4f95-4ed7-25ed-08dc6e1f0329
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZKeVkDIPD1/QmeGkcVO0EQ/65h4AZMGLwFnsH4CnQ9+ZLsc47CH64kwY6A3p?=
 =?us-ascii?Q?xygb1LIL9gVu6/idDCQWQYqaywLzjs+tXadwEgISIc+1j/inzPDIB6mqrqWP?=
 =?us-ascii?Q?NLjhR3prbNK0OShD9uS8TL8bAg233LpJEBb0/s5z2SGuxFxrgjzgj9E+/qv7?=
 =?us-ascii?Q?asvDv32NC83ND9rc9+/Ew9kB9Ho/8xRpT8b6AHSC1r2EH9iHz5NbSK6ttnfS?=
 =?us-ascii?Q?EC1Px+ytdFDWxmIsQvMFTR1pbjf7rPuj5Vuibi8eB0z4Afg4d6DZo0Q8/wPZ?=
 =?us-ascii?Q?XXokKFh5C/FieQbxnU1akcnsUpq25CI3AXgKcALLyd68j3lQ/X6e/F32MIrG?=
 =?us-ascii?Q?a2tBLTQhT5EBjMTmZerIO2rYMv2wJ6soIdTU5V/gOA9SPr+RgrYU7JUT+aSV?=
 =?us-ascii?Q?hpkuXGGOh4UUJoXv0cP8Xhe8nbsfzT6sGt8q5HJBga8AauYdv+eeJkRVej9h?=
 =?us-ascii?Q?93iQoCi+yLWtDFuflTmPWnVLohMr00B25aBKUTy7SQnPvAayGXCaZVYsqvT9?=
 =?us-ascii?Q?UFaxlzB02hjKrp6pUxcgs4z4uwfiV0uGTB2XwqIJknFmz+7SZmJPwHtQfL56?=
 =?us-ascii?Q?Xd7Z6zk7pT/RHHwVw/qTLCVZslYQeGqW18ZL8Ne1NqWMzpFMp4gQDKTJj0eu?=
 =?us-ascii?Q?83e6yXNJwx8+dAowq3lqO06CGvIQKWa7E+A/oGvFME+yajTYBY0ZnbIory8I?=
 =?us-ascii?Q?ZHGtbICYaKS0k0i/hbwiH4MOwL3TUAC6lh+hXCMDXW2SlRsrBJxXv2X51R7z?=
 =?us-ascii?Q?PI4mYdOK2aLsWjIovUvxzhW+1ULbqG2gOFz548mdSAVQLE0TsiOVAVCtR2+J?=
 =?us-ascii?Q?2FLk7gOvTgGr0S2PHLT7chlJi/vN4CiO2Qp0zxy3OcTcv7MuUhfu6LyjRtSV?=
 =?us-ascii?Q?NGU5Vg/AXmf6kW8sApImQtotYtC3qMY7QqqsVp+/Ah5pVlXNvEXVa5tWIyeH?=
 =?us-ascii?Q?JDt8KSEzbRLPzbgHe5YmbBpxdU1JzNC/nUW/CL7Li2ZQeIixjE9yMfQoEURI?=
 =?us-ascii?Q?PmdI9LaCcd4fLR72YQ1Kfh63rrcexbZ91AYjA44BzwpDwct7ala1/jE/9orq?=
 =?us-ascii?Q?w1bPmPmssP3WfzURyfYPXNmFOMfbTPE3baYmeJO5C1CzH1ZoXpC3kwFiWleo?=
 =?us-ascii?Q?/rU3aT3a5IS2Hgk6vAMXjVQQbBdzPNnp4beF2jQYEPFQNIpI4bQVQIk4wNqx?=
 =?us-ascii?Q?CbhIK9R9gEu0qMJ+0QoPLIDnY1M6br+hCVPTmlMJQbYb01CsRnQoZ6ZecN+8?=
 =?us-ascii?Q?ZDRh3SgTKlqLiBAUk2hU/kcV23yXaYwOeJ6b/43/bg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?caYQIFkCEz9YBHkB/8xrwhfDxvvFdSxyaF+05T4tOkdiMBllSGkmDNe1NOKA?=
 =?us-ascii?Q?bpy7NIElZhjfeH0HdTz55dvF75uJ/iq+a0BnNMTME3h3L1fnd4ikRKP17XSk?=
 =?us-ascii?Q?mv/6uo54KteFWufFI0kT5k8LO3wiHt/AD1dcbWmKtMPHbl2wi6bLdxSRZdsf?=
 =?us-ascii?Q?jpZoHsR/ujj6pWCprjSRFb5KOtKCJudSGwK8OWfUvfuggY7n5g84wlC832lq?=
 =?us-ascii?Q?th6NLuC3vgO2BmZGWA7LSPqbN6Mh5CPkI5AV/QwgcwJ/PC2Wh/tZ4BeqFmVE?=
 =?us-ascii?Q?t5NMUF0/n79rbYT1ao4A68bczI8UfVu10zpkmWTh1o65Jqfr1EbLHNT2dla6?=
 =?us-ascii?Q?Nyb6CYsQbDTk4+Y39hfaKLV0R/KDVx4cmLXXg1iKI+mteQc6JuaXnxv2FK66?=
 =?us-ascii?Q?sdFry+BcW5+yYenOidRFF1ZwFSdmVfJyQIDNYzrJBDiLY/BTw5qRKBB0XYiz?=
 =?us-ascii?Q?8EtGGKTkxT1iR+7XmZgUiGQwqK0bt92bva0lOp4Z/qygUpJBa/7wPCYdLBdz?=
 =?us-ascii?Q?66MYaC87jSr8K04lIoWx0wBwL60JLT4WNUKsPMcuvTcAtaKwaDIpYHIfcjJo?=
 =?us-ascii?Q?y8eq5MBkM7ZI2rOqPCe/+MzuqFf3uvG6oHgo982K33wrkooG7OYhaasbwfUe?=
 =?us-ascii?Q?XimGWB9vgCQAH/mAHvOYYfw2mM7JIGzFTvc9OwwVwWDBJJu/ZnqPNAMC9D2Q?=
 =?us-ascii?Q?qnZatPL5zS5TmNk/44vQhkAyOkxgCg1Ale7JCNhR+/FG1xFMQdOwBn9m7YtF?=
 =?us-ascii?Q?Blk8BkZSs/YcXpuzCBilsUiqfi0V1GrhU+zk/hT54zP0EXZiw2WxBz6NOgUY?=
 =?us-ascii?Q?dH5rRsGuyECbcCsissdzMK0lu5g9zUMtwk7lDSdUPkCb3KTuFemMwWecNjBe?=
 =?us-ascii?Q?adP6xo2D9a6sF6O1cOvkq/2Dh3NAmYsmXW16+aCATGxKa7nxVNtsDT/YbyLV?=
 =?us-ascii?Q?sCAVhhWgK3S++V0wziRbUanfFpTtlVU79zxEZ3XRAme9RAcUUzy+X/LPBr8W?=
 =?us-ascii?Q?u3UjxF5U1iW0YnvdHrdS8hAz5tzV5TU66t49jUfeXvy0BMFskaz6qYVftH9N?=
 =?us-ascii?Q?RahiTToLqe3POx2gP5NDfynQuoIdmOJE/rBVba9LjxwhX2X/vLH+IDEMgAq4?=
 =?us-ascii?Q?BinrRSZv1M9biJq9u7vFEbSh0fYZjj3+wT8lq7qmpZ6Cp91cYYjFK4ds9qaA?=
 =?us-ascii?Q?VA+LHsgtxc02fco8LDPk0EgbliMOh12XWHafoOVNe71CUHui1t4WpHcAxc97?=
 =?us-ascii?Q?5eAfdtiKtKvsEEw4+OoHHAoyaPgkZqD5mfjnkkyOMFrZZ2WwHSkUJFQwYUlu?=
 =?us-ascii?Q?5f4zVzkS+m1v/qU93n4zbMe4OSTOrRdjtt8U97Y09W9FQiu6XlvmfWA/jMA3?=
 =?us-ascii?Q?d5LZ69m63nVdnqqknl/fXDSFA2GhSKwYAwFSzxnfpyneDfVF/E8XYnoUWgep?=
 =?us-ascii?Q?EdqaXxGOwcyyoiv9gkACwVnK6LFUVfUos+S9v0vIOiXSj42j8bsEDf74DvbL?=
 =?us-ascii?Q?ziJQnPRDqBDyUPFdPbgFPkW03zGJHX1KOa53Qg/DIgUGX65j+t6BLauP0y1c?=
 =?us-ascii?Q?TF/4la5AwlzGokrAVd0SHE141xTxQB+oov0HJQo9RSkIKfeqo+BT14gp3pBe?=
 =?us-ascii?Q?7w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c45e41e3-4f95-4ed7-25ed-08dc6e1f0329
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 22:51:05.6874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e66Smh2XnrNmYGgu9jQgNru8KaBci8ZfJLg1D53oUtwTsmaqXMduhXc5XXpbmFKnKMHeFsSHP3uPMDG04Qm3Q9ch0yZWgDBNePJ20hjEzK8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7028
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

On Mon, May 06, 2024 at 10:52:54PM +0200, Michal Wajdeczko wrote:
> We don't need to include <linux/types.h>.
> We don't use struct xe_exec_queue here.
> We should sort forward declarations.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_mocs.h | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mocs.h b/drivers/gpu/drm/xe/xe_mocs.h
> index d6fa4485a6e9..dc972ffd4d07 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.h
> +++ b/drivers/gpu/drm/xe/xe_mocs.h
> @@ -6,11 +6,8 @@
>  #ifndef _XE_MOCS_H_
>  #define _XE_MOCS_H_
>  
> -#include <linux/types.h>
> -
> -struct xe_exec_queue;
> -struct xe_gt;
>  struct drm_printer;
> +struct xe_gt;
>  
>  void xe_mocs_init_early(struct xe_gt *gt);
>  void xe_mocs_init(struct xe_gt *gt);
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
