Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B07CCD1A7
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 18:41:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E7B10E4AD;
	Mon, 20 Oct 2025 18:41:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dcXUQRTK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6AE10E4AD
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 18:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760985679; x=1792521679;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NA6yb9dlSP7yS6CLZFjuAAIpHuZv5WDYwBKSyhQbAIc=;
 b=dcXUQRTKVlMcli7NY3cwKi4+ZutwssN0WSaF+tIMCO07wSfc7dzNgDQN
 i1uP7wrqtdvBjbdFmv4tWgxTeYQtNevwIG0BIo1hnrxs9oeVy/o/LQzXd
 e9wrrtPTzMziOBMdusqNWq2S3XFiZ421q5m6j1SB0+5ss+EryHMPiBK40
 oNERVrW00dIpuYetaAKZETnMzU61oM+qxwr7lw5PPe9cnYvH5erLmZlMS
 KckgR6QVY8uvlfB684g33a+5ylE5TDvRQsVt+Rk8x8Rdzxxh2LZsT8Tk9
 jJsdbEn8yw8j3VIaormkfYybf/3O0XqItFVoyq4JnkR8CbUyoURYW2I15 Q==;
X-CSE-ConnectionGUID: CfbNmBwSQQexF4Dzzh24RQ==
X-CSE-MsgGUID: q12a0D0kQ8CAULMoWTRZyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63253898"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="63253898"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 11:41:09 -0700
X-CSE-ConnectionGUID: TMh34CXaRWWI4rau+np0lA==
X-CSE-MsgGUID: ZP6Xln5uThu4tgpmjUrFTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="187416001"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 11:41:09 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 11:41:07 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 11:41:07 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.57)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 11:41:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k3gZtKX437YMxZYODGLJl6kKz4zD5WWPEgFNzao+I4JDW9st804XxfI5PmmaCogwqhyqIi3DXnatRPA9huJLhlCSZVSnjdGsnlKxcIP5IG2NA3fVPEDSOz+5uvWMyxoB7lKpx8G++ytrzpi3er58P+TkUXWlitv7t/UkzDad0KQRcTF4YLWksyiwqQWRtS70Pf3m+6XdXb8JUuT0U0MVeiC7ZKCuLpV/O/iqdtaVo4Wpm6PhSsO7ihODecItk61QdtS9BdgGcoUQq/2ItzBNUOP8lzl9loSspgw5bXM51eYbLW6uQ/m0eM0cghgGulYiLl007fVza4DODN8qF6Xbng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5DY4GNWjwy5WoPQUEJr9NN6tLIEMmOCE/dOZfgoHtYQ=;
 b=l2mg91AHWoe8IN26vNX/Xpp7rK6UooMKuRyMq90iIZFP7bUkgWWoLLXl67z44oCVn6TLaPoGCeazbXngJenwIfuvJiemjc9I5UVr97bEtjz4gvec7lxxONR3BxFkQld/lzpjovuNQcQEA7aeDaNchkIx2OJH8on1oAkRXQqNTMutgVF9rv1SI+IoS/0P4ljn5W4wFoYYEkPUQbtKnGp7yZ2rQM5PPSnGzKQqrog6Z4WHs58zDVY4rAeJki1uFa8RJsU5N+zo1XBQggHwjxJuB3NkVeoFeTzVzfdxI+8szN1nmlDOyuPTAgDQXBEjJBNRk6IYA7Q3D1J/wAR5aKigrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB6992.namprd11.prod.outlook.com (2603:10b6:806:2b6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 18:41:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 18:41:06 +0000
Date: Mon, 20 Oct 2025 11:41:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 5/7] drm/xe/migrate: support MEM_COPY instruction
Message-ID: <aPaCP5WV8KNyJTk1@lstrano-desk.jf.intel.com>
References: <20251020125431.41153-9-matthew.auld@intel.com>
 <20251020125431.41153-14-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251020125431.41153-14-matthew.auld@intel.com>
X-ClientProxiedBy: MW4PR03CA0282.namprd03.prod.outlook.com
 (2603:10b6:303:b5::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB6992:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c687f50-c4cb-4cae-da4e-08de10083a75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/SvOPsS8WIYfRU5x2vM+NooSeb628bjup6eCIaPZzSRtFYoEV4AFJQ00OmUO?=
 =?us-ascii?Q?JRm48n/dQVrlK4OrsOvJfRzSQxcMBCt8Drjm8/+P5PgEjbytDo+xIgBCaBrL?=
 =?us-ascii?Q?XEq8tcr+K6IK5qmtVSHf/th40BsRGSrilQmpKLxbR10JkLPpJQ71liG8Ozib?=
 =?us-ascii?Q?9/OV4N5BFJW0tz1BmSc+Uaq6GMC3E4C1+I7jbwfoMlk75EpUeLpPDoPKqSr0?=
 =?us-ascii?Q?l18KbebEr6QvllQiEQYtYuZyAXkYA9ueqfP/wlAtq+5LzGR73thSD0m85O+N?=
 =?us-ascii?Q?Uuph0b7s1Ms8DU77qSpOFH0D9LMGAiXV3Eas669ydqk5BOw71K7UqzMTfjqF?=
 =?us-ascii?Q?QznsE9NpKPR1xFfgTTqeYnWg48F545hztT8ZLhFk4Xk4E4uRbaFHa6Iinut7?=
 =?us-ascii?Q?uA5/RUuAcWzt/FOVDfTW/X8IjzWFXweQh25GZ4ml76+4vpbf2Tf7JHTOa+59?=
 =?us-ascii?Q?XrAf+OIbqk8o43F9rFykUCaKcOdlKWtEggagKWz8epMg2IpSJ1/d2YaABqNO?=
 =?us-ascii?Q?newnj5x5GvmT7PDtmhdeLHZaMw5Fz40wftbrHiuCBgTgjgZZFnFDuVwVfuNx?=
 =?us-ascii?Q?e/u3nsUhMpu3GZSLFY6wMJyVsKfL3do7Vfao1BnJr3dOlTrJVc/cRyv9mr49?=
 =?us-ascii?Q?2ojFmQTZTuKdviX1DRvpOgn2j75hkfoDsxP7vhJ8yD1r8R7q+EVvxgnxTgpD?=
 =?us-ascii?Q?378Yy/RmTuDFiEPQBj/W2aTU7WgH2p0SAlCuUQ+ImgXO/pw6jcb8dG/qfJ+b?=
 =?us-ascii?Q?vcf5SHJF7pb8oKSCjw9IjRupGDpT+fzrWMY2FmfmtwM3GKwbDtSGGrtpiMpv?=
 =?us-ascii?Q?FrgvqCxuQoyqR2UJHks0+u3T1PbbBG+EDR5ncgrypz0kL8qfrdOjUfsblG1Y?=
 =?us-ascii?Q?9GAXz4qOb3Rn+rOI8S1sdLR86P3I504DT/CUBJADFAWARaAqX57ps+Yqr0lL?=
 =?us-ascii?Q?CRzVPedPRkpw9XDCAtRF8S03EIUM54U1Ks/KL5XbPx6bFimMeMsKGk/Uarg8?=
 =?us-ascii?Q?fV2XFwIbVct1Nle/rmDj4JIIjCLSezm3KWFn9IrGEC5BgV+83qw9lOILLNGe?=
 =?us-ascii?Q?p6csnTICfj1P0QZ4/qREEF1b9BRrVQkSkMZtFLyYl3JMr4Q73DGYfm36mwT+?=
 =?us-ascii?Q?BIGLMg0ZvoI2ABkhI6kRTRIFnCL+wQXsXGmuWwyi1bh8vZTKXlUEu87SBMHf?=
 =?us-ascii?Q?GzJRviuce1+9YCH7vNbbECGMv1uMHg1AU8gidLvlcxN89JK4dL81NGpasTcZ?=
 =?us-ascii?Q?lgZg48PXfgU8Fp8bASBMIgdjN49X2Ws4k22GAseiGVWNCMJFG579EnkKz94M?=
 =?us-ascii?Q?X8xJV7KhlkbQKtHBGGdh9ZriI9EbHjii74QErO4kEIh3MvxsO48RXwRFka/o?=
 =?us-ascii?Q?lCrn/Do0+oJk35ixdv3VY2wkxiOjKAshc0YSLgD9gtX9kMT+2uxm/+07A7gs?=
 =?us-ascii?Q?iBZRjauxChS8FJ4YP7xq9jXKO0fmVfpz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?54t0QulbnWEdZodEWJpcbxRpZEhH6lJ3O/Gy0YfKeun0Bqr/4hY5gpjd4dTS?=
 =?us-ascii?Q?GIWRwb7jSoy5LRAQPMO3omupCNyhikz4scszAf+CA0HXIjvyi3xjKHfPBX5G?=
 =?us-ascii?Q?3Ditu/w+31OupVdSIsgYwtTKe5ATJNtrXPdZhFdIByYQ/KB4EpaHuELteF9h?=
 =?us-ascii?Q?fmXGuD5H0LSEtKZEz3Pw0WRSCrOkn0XAm/1o8x2YP+e9sF7mRPePTKG1qIP1?=
 =?us-ascii?Q?GqrFAFosR43mWtht9LlJDhzFxaGJDCT/vsI5QPurlIqiHBMLe7o6NsyIsCtX?=
 =?us-ascii?Q?aE6TE+QMuaTnD+IotCCJCs4piyE27LDcTICShBlFK4sJQqXyBhJFlo+1XWg2?=
 =?us-ascii?Q?RWiY6tZcL2gbrYse9r+Sa1jc/3g03V/d2NaKSWxA/dcXZ0ODC9lrOZNBMEWe?=
 =?us-ascii?Q?UPgNlM5M0uht5FxZRlgTZKuMDT/GcFVRFTgqywdnBPOJPRmN7A4SFr40ALXl?=
 =?us-ascii?Q?rl29mvnbk1Fqjg71iHN04kLJ1UH7G/alFKlxferpBLSWIFl+a/8IXRVDupQH?=
 =?us-ascii?Q?9AcTkWz4VlnA7OBIDiqpidT7BRe4CRQijo2i6l3kwWNdO4oBI7xTyDg+0BWp?=
 =?us-ascii?Q?yu5/txsKbabN9rrqoUYNcFA9Tr+izd/r4L0rc1STLP/fotjLOIj2uPfVVHOv?=
 =?us-ascii?Q?/y0zOyR++gvgcfmBktQbjb4llM5ok1UCdgKs1eOoI2qGdblHlnf7Pe8ZPrzr?=
 =?us-ascii?Q?JfaWNLF1ATLtSSkPT09VrUsp1qLdAAm/1OwHqSLLt9ky15CNLgMnTkvaekKd?=
 =?us-ascii?Q?Lyw/ChWhE/xXlMtmbPdBmZ8Aj+HtV2psKsuaGWeNiolQT+vnry15XaMDJBgS?=
 =?us-ascii?Q?g3rmOSf8ViFUIEFeM942j6/bYs3nUvAqazjJ8xM9hEtlD/9DUQKH7IezGFyv?=
 =?us-ascii?Q?W0o7fKFlvMmPdrs73VOVf0rzO4bV9ym9KT8h9g/qJXH0IoYvkYs+5vZs5Bwq?=
 =?us-ascii?Q?iovf2pRaZDstWUSAMEUKAeuW4lylC9CBZ65O7bmKWdRH59yrg4a79m+nTebL?=
 =?us-ascii?Q?4r0eHkUNSUYaD1+Gehy7xdEJoL1f0+jA16lq1o3SsXwNzacpRb4p//1M/nvQ?=
 =?us-ascii?Q?9pYMbrzcmWQnKJQ7FPX/DdesxNMEQE0DEgGKiFE6Ap5LfPlkvu0tZoa0eH1G?=
 =?us-ascii?Q?PTDNFiVEfoTmgOod70lAIhaHfwJnhJCzK3XOjyWPbgQvWt+wdjEjD+ycSuJC?=
 =?us-ascii?Q?1qUJY8T9dGmpovszD00tMxwNR4ZvSUiKtZs7NIU2eH6+5OyFArwpiyXomEEd?=
 =?us-ascii?Q?zvZYTffjqaDLr44xrZKkRxJYg7GBA4/FA5hbCE6Xedctdj8xZoOLDBysf1zj?=
 =?us-ascii?Q?587VoPb5je54OWylFHQAMiUx7nOf5kXYIMMdSRa03z2SkbGSstkKu19SJBCm?=
 =?us-ascii?Q?xxaHOychABJtZPbjJuvc2UATzxZ8R+/ksovw7MOcG5IXy6OtPL7cfZzqiJWC?=
 =?us-ascii?Q?z/vNlIJJa49alKAwdhPJd0Zg66IKxTP1Blku/9Xgpo+o5yR0s/wL0vufO8bx?=
 =?us-ascii?Q?ZubdbnbtQqFskei40OIpORofvOPUFGwZqy/mUGEdSng9Wfl5EK/d/Zh8+9ZI?=
 =?us-ascii?Q?fhfknOs7HMxLDFFMrHgvl4633fj+X4dQouE9RslVlwJTwbqgUeQlQFuJmkDu?=
 =?us-ascii?Q?aQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c687f50-c4cb-4cae-da4e-08de10083a75
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 18:41:06.1284 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SvEtVzVA8L0j0eRlUtCwUONf2XPo9ws7gLRck2vedk/9CzMv2VVklpp8JtCNOapnO8QeWX2/3I/KWymadwHs+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6992
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

On Mon, Oct 20, 2025 at 01:54:37PM +0100, Matthew Auld wrote:
> Make this the default on xe2+ when doing a copy. This has a few
> advantages over the exiting copy instruction:
> 
> 1) It has a special PAGE_COPY mode that claims to be optimised for
>    page-in/page-out, which is the vast majority of current users.
> 
> 2) It also has a simple BYTE_COPY mode that supports byte granularity
>    copying without any restrictions.
> 
> With 2) we can now easily skip the bounce buffer flow when copying
> buffers with strange sizing/alignment, like for memory_access. But that
> is left for the next patch.
> 
> v2 (Matt Brost):
>   - Use device info to check whether device should use the MEM_COPY
>     path. This should fit better with making this a configfs tunable.
>   - And with that also keep old path still functional on xe2 for possible
>     experimentation.
>   - Add a define for PAGE_COPY page-size.
> 
> BSpec: 57561
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  .../gpu/drm/xe/instructions/xe_gpu_commands.h |  6 ++
>  drivers/gpu/drm/xe/xe_device_types.h          |  2 +
>  drivers/gpu/drm/xe/xe_migrate.c               | 56 ++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_pci.c                   |  4 ++
>  drivers/gpu/drm/xe/xe_pci_types.h             |  1 +
>  5 files changed, 66 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> index 8cfcd3360896..5d41ca297447 100644
> --- a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> +++ b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> @@ -31,6 +31,12 @@
>  #define   XY_FAST_COPY_BLT_D1_DST_TILE4	REG_BIT(30)
>  #define   XE2_XY_FAST_COPY_BLT_MOCS_INDEX_MASK	GENMASK(23, 20)
>  
> +#define MEM_COPY_CMD (2 << 29 | 0x5a << 22 | 0x8)
> +#define   MEM_COPY_PAGE_COPY_MODE REG_BIT(19)
> +#define   MEM_COPY_MATRIX_COPY REG_BIT(17)
> +#define   MEM_COPY_SRC_MOCS_INDEX_MASK	GENMASK(31, 28)
> +#define   MEM_COPY_DST_MOCS_INDEX_MASK	GENMASK(6, 3)
> +
>  #define	PVC_MEM_SET_CMD		(2 << 29 | 0x5b << 22)
>  #define   PVC_MEM_SET_CMD_LEN_DW	7
>  #define   PVC_MEM_SET_MATRIX		REG_BIT(17)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 02c04ad7296e..6a62b520f5b5 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -305,6 +305,8 @@ struct xe_device {
>  		 * pcode mailbox commands.
>  		 */
>  		u8 has_mbx_power_limits:1;
> +		/** @info.has_mem_copy_instr: Device supports MEM_COPY instruction */
> +		u8 has_mem_copy_instr:1;
>  		/** @info.has_pxp: Device has PXP support */
>  		u8 has_pxp:1;
>  		/** @info.has_range_tlb_inval: Has range based TLB invalidations */
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index c966b6bad930..14ade32b8b69 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -699,9 +699,9 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>  }
>  
>  #define EMIT_COPY_DW 10
> -static void emit_copy(struct xe_gt *gt, struct xe_bb *bb,
> -		      u64 src_ofs, u64 dst_ofs, unsigned int size,
> -		      unsigned int pitch)
> +static void emit_xy_fast_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
> +			      u64 dst_ofs, unsigned int size,
> +			      unsigned int pitch)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  	u32 mocs = 0;
> @@ -730,6 +730,56 @@ static void emit_copy(struct xe_gt *gt, struct xe_bb *bb,
>  	bb->cs[bb->len++] = upper_32_bits(src_ofs);
>  }
>  
> +#define PAGE_COPY_MODE_PS SZ_256 /* hw uses 256 bytes as the page-size */
> +static void emit_mem_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
> +			  u64 dst_ofs, unsigned int size, unsigned int pitch)
> +{
> +	u32 mode, copy_type, width;
> +
> +	xe_gt_assert(gt, IS_ALIGNED(size, pitch));
> +	xe_gt_assert(gt, pitch <= U16_MAX);
> +	xe_gt_assert(gt, size);
> +
> +	if (IS_ALIGNED(size, PAGE_COPY_MODE_PS) &&
> +	    IS_ALIGNED(lower_32_bits(src_ofs), PAGE_COPY_MODE_PS) &&
> +	    IS_ALIGNED(lower_32_bits(dst_ofs), PAGE_COPY_MODE_PS)) {
> +		mode = MEM_COPY_PAGE_COPY_MODE;
> +		copy_type = 0; /* linear copy */
> +		width = size / PAGE_COPY_MODE_PS;
> +	} else {
> +		xe_gt_assert(gt, size / pitch <= U16_MAX);
> +		mode = 0; /* BYTE_COPY */
> +		copy_type = MEM_COPY_MATRIX_COPY;
> +		width = pitch;
> +	}
> +
> +	xe_gt_assert(gt, width <= U16_MAX);
> +
> +	bb->cs[bb->len++] = MEM_COPY_CMD | mode | copy_type;
> +	bb->cs[bb->len++] = width - 1;
> +	bb->cs[bb->len++] = size / pitch - 1; /* ignored by hw for page copy above */
> +	bb->cs[bb->len++] = pitch - 1;
> +	bb->cs[bb->len++] = pitch - 1;
> +	bb->cs[bb->len++] = lower_32_bits(src_ofs);
> +	bb->cs[bb->len++] = upper_32_bits(src_ofs);
> +	bb->cs[bb->len++] = lower_32_bits(dst_ofs);
> +	bb->cs[bb->len++] = upper_32_bits(dst_ofs);
> +	bb->cs[bb->len++] = FIELD_PREP(MEM_COPY_SRC_MOCS_INDEX_MASK, gt->mocs.uc_index) |
> +			    FIELD_PREP(MEM_COPY_DST_MOCS_INDEX_MASK, gt->mocs.uc_index);
> +}
> +
> +static void emit_copy(struct xe_gt *gt, struct xe_bb *bb,
> +		      u64 src_ofs, u64 dst_ofs, unsigned int size,
> +		      unsigned int pitch)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	if (xe->info.has_mem_copy_instr)
> +		emit_mem_copy(gt, bb, src_ofs, dst_ofs, size, pitch);
> +	else
> +		emit_xy_fast_copy(gt, bb, src_ofs, dst_ofs, size, pitch);
> +}
> +
>  static u64 xe_migrate_batch_base(struct xe_migrate *m, bool usm)
>  {
>  	return usm ? m->usm_batch_base_ofs : m->batch_base_ofs;
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index c3136141a953..8458d4ae8ee7 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -342,6 +342,7 @@ static const struct xe_device_desc lnl_desc = {
>  	.has_display = true,
>  	.has_flat_ccs = 1,
>  	.has_pxp = true,
> +	.has_mem_copy_instr = true,
>  	.max_gt_per_tile = 2,
>  	.needs_scratch = true,
>  	.va_bits = 48,
> @@ -362,6 +363,7 @@ static const struct xe_device_desc bmg_desc = {
>  	.has_heci_cscfi = 1,
>  	.has_late_bind = true,
>  	.has_sriov = true,
> +	.has_mem_copy_instr = true,
>  	.max_gt_per_tile = 2,
>  	.needs_scratch = true,
>  	.subplatforms = (const struct xe_subplatform_desc[]) {
> @@ -378,6 +380,7 @@ static const struct xe_device_desc ptl_desc = {
>  	.has_display = true,
>  	.has_flat_ccs = 1,
>  	.has_sriov = true,
> +	.has_mem_copy_instr = true,
>  	.max_gt_per_tile = 2,
>  	.needs_scratch = true,
>  	.needs_shared_vf_gt_wq = true,
> @@ -657,6 +660,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.has_pxp = desc->has_pxp;
>  	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
>  		desc->has_sriov;
> +	xe->info.has_mem_copy_instr = desc->has_mem_copy_instr;
>  	xe->info.skip_guc_pc = desc->skip_guc_pc;
>  	xe->info.skip_mtcfg = desc->skip_mtcfg;
>  	xe->info.skip_pcode = desc->skip_pcode;
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index a4451bdc79fb..9892c063a9c5 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -46,6 +46,7 @@ struct xe_device_desc {
>  	u8 has_late_bind:1;
>  	u8 has_llc:1;
>  	u8 has_mbx_power_limits:1;
> +	u8 has_mem_copy_instr:1;
>  	u8 has_pxp:1;
>  	u8 has_sriov:1;
>  	u8 needs_scratch:1;
> -- 
> 2.51.0
> 
