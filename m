Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A75E7CD98C7
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 20:58:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5611810E248;
	Thu, 11 Jun 2026 20:58:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U5aIVRMU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B5B10E248
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 20:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781211506; x=1812747506;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7+EmnV5qLy0D4Ra5/6bZA+QqUnRA6vqBNG60Bk6HZEU=;
 b=U5aIVRMUT4r68PQ36i3yVKX+uTYamK8X7CU9tJ8WQ6kK+otCbFIOsc6c
 ZuSmc+A++P/Evt8Q+NEBITRMhv7FC1UQr5ahiZhEI9aN0WUvkRIFH/b2c
 Ulxf7ZqU7ZRBvC+KpWs6PWhygz5+V2RY4HmRFHs5JqlFduslMK+adXbJF
 pb+lrsvHKVVmwJ2znsGRfTIfhaHEKjZj/HJCV28AQvMM3xhWAarxQzHub
 sjZ7Kt8au0lILdfO/E1+9hFM4fNnxJrMbJyoeCOiNwMGb26B4LWG6V/hm
 A2hL1A3YmpS/p6OgWrqQ8D95f0yR/lufRT+1Rb9DyYlA87iwaUR2Zf2lc A==;
X-CSE-ConnectionGUID: EWccpYv0Q46nHhGi3HdOYQ==
X-CSE-MsgGUID: vmo6VLocQc6ZhFMrtvPJZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82100861"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="82100861"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 13:58:12 -0700
X-CSE-ConnectionGUID: lGl073dGS16PK6jtlRigaQ==
X-CSE-MsgGUID: FOi/X4iWQSm1XsIq+z3kEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="245724416"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 13:58:12 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 13:58:11 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 11 Jun 2026 13:58:11 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.63) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 13:58:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dUQsq3IDUS0GL7Sv+cVmSfURCjzxhXDKCRGYOHgxrxmBnwOL85/tJEQAwi9raTQ5f0tocnv1incpoDvHE7nOOe51eV/UAkD0iMakR4XP0Aq48FVrhHuHync3nYQ8Ue2RgqD+SbBpC+hX/nlF+kURTqGTPcKc0UJHzpFgLMQdQGaHlBeMfjZdKEK2DdYlPrm9k6gWCx4TP/vFcAT0WryvrhVqnwDkDXwiQlPRlRagw/e5GyJ91AcupFnES/Ji47FSyoc8COBAKeu4LblQDwkglAeeTkAPRUkUBsqpxpA7qfTqTSLw5tWSIjLlDe1oLSNXPsqrhIGNe/O11W98KysOew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=myAkdU8bto2oEOj+gjt6ex3LWIfKmEmnkFUGgOUAVZU=;
 b=PomR5wkLg1onCaPVp+8oiqsJDgGdPop670ZXABEFnFmyrz27vsgRkWDCWRNtvLMr+U7jateheCIE0i1lXA9YHYu4p1Qxe/ZOOTlZPabQeBeRusQ+78yqhNhSd13eEaJ7tsejGhAcCuhP6THHyjL9a87k++Ke7E2su6Bt/p2uNOhehv3duplcblLyKNCPdIKxts+IjLThRj5jif0M9PRLV8SKdBwQJSqOyxT/EAfBBk0Jeqtv2A8PM0B7gC3T3bqUfhtHdtxMyJnKytzRn50zTJQ7IpEi9YY+B6SGWTdjpXQkds70Nc2RwqXunMqP9LrqqT8Is+SdUantZX8/uBDRdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by LV2PR11MB9538.namprd11.prod.outlook.com (2603:10b6:408:378::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Thu, 11 Jun
 2026 20:58:09 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0092.016; Thu, 11 Jun 2026
 20:58:09 +0000
Date: Thu, 11 Jun 2026 13:58:07 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <riana.tauro@intel.com>, <soham.purkait@intel.com>,
 <michael.j.ruhl@intel.com>
Subject: Re: [PATCH v3 2/2] drm/xe/debugfs: Add debugfs for pcode information
Message-ID: <20260611205807.GH6214@mdroper-desk1.amr.corp.intel.com>
References: <20260611165607.3653019-1-karthik.poosa@intel.com>
 <20260611165607.3653019-3-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260611165607.3653019-3-karthik.poosa@intel.com>
X-ClientProxiedBy: SJ0PR03CA0196.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::21) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|LV2PR11MB9538:EE_
X-MS-Office365-Filtering-Correlation-Id: 11ff70e7-dc09-486e-f9a9-08dec7fc24a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|18002099003|22082099003|11063799006|6133799003|5023799004|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: /239VnpbYcsu+q+EYgOc1ml1wRojOARgSxCtQS/wm6mxKVktYuOyeFjM2XlWHVyZAF+lQeC6GW9pyLfCwltoxxaJFAf03FPXc+4rmFkyj/x4ZaX7B5fJNbGaXItLYXIvn8jLXDKBY1ACQuDJ3VdccCTmGR9phIsGg/DSo2/3JVepM0TRItQfrMtwSVjJf6jvxql0Vj0NFe+MG6TOBBfdeUjkjt2US5/3cn5/oh1wK4wHZgn+gaMEO7qgiIvrIWkl3oth2ULJdnzSoTdXhlXvTM6NFu4M/mhZQdaRk20ZuOQriRb2gwpg2TPVJlmedfuyHoNPb2tANqYH3pkxKxmm1O2Va0y3LBWmwthNRQb06HWf1adHapSKNYRS3tF0lDK44eSIqAweeiNT7OqV3FC/pofMo9P7P9GEwLCVsNzwpZcP3uCIwJ3bGnBi+NByqWikm26wYw+GNKGOMHDovv2uBZfGJdoX8I1T/KkiirCaku5gmZ2B8gCEjZ9XcNRUj+LisHJ+BqvhswDw3IDbpCKZd13eg2XsHyvu790kce35JaTQewSKHcOT39RQW9YuKldEapVCUCvF9s4Un7Es7Z0FP9QEL20//C3Mo+dxV2vcL+aAo9Zhn0K7NGOknL4NHCXH/fnY+uDTXunvRcqdwwHt5B6h/gyguTQw14ooDiQyHgwXdyt4810fHLl6rpKtHCnB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(18002099003)(22082099003)(11063799006)(6133799003)(5023799004)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h2BQAItSP0zZ3EDXdr352J+03tBfvjhjiVylrrVotf7VZoWMhpTCGEbNaEt9?=
 =?us-ascii?Q?jTMvPtq/ECd1Zgbuw/42YGqZCwWFTaDnuP+7F517MkRaB3qWZKEN79YYjyur?=
 =?us-ascii?Q?D9UKZXQEy/cvgJxUaa3V8kpvTAHkD3hEX4iMhBIClm0G9sFMU4agowdA9SCP?=
 =?us-ascii?Q?ZR7TG6P8kVSGcgcaOsAu5r4UB3iiXGgy4sisuI/Br5QuO0OebZf/R4lKWMD8?=
 =?us-ascii?Q?+TNs4mzhJwcfmA2PrhN1T2XFt8u/OqKTphYMpO7iB/KatSs5SYQmnIstrHTi?=
 =?us-ascii?Q?bkQ2LiGIgNqlzP60fzCxyucnXReOvx1xJ1pbZUC1QNEDC9LaxSE17lxxDani?=
 =?us-ascii?Q?F3fam7EMKblOu3gTeFnJ0jtJOz814X3D/Hbx3nx++SAmxd4W6StStbV6MJP2?=
 =?us-ascii?Q?aoSrRsskIRVo23PXcBEF9PkfblM1aw3VauqkkbBUqUq1e3daEQQ+mshiCuyK?=
 =?us-ascii?Q?+o3jQDvr3+egNpAS+7CD+HyV1V9Ri810oYtAEy9yPw1RRGyvEb8YPj3lJAG2?=
 =?us-ascii?Q?a/Gi1hzlvKRpIKnGnidvga1Gb+LTjwD9brsNSNo5RQQVEfZ1uDt2mrP8g1L5?=
 =?us-ascii?Q?uoJgzfEP2NaVpMucHydfD0ArVroTLRsJ4FhnuBmHN6UtUc476x6P3jeMQc2F?=
 =?us-ascii?Q?KRupIFecl77m4MuzfW9U4zNJP2EyU6GGXSzeIf87S3RhsKJTsQ8T2xOgj6Ct?=
 =?us-ascii?Q?YPSWDR1MTnWpwTWMxLwIMIQJHd39be2Dba7l7sglpeZJdmsD+lT7sU6lHPf7?=
 =?us-ascii?Q?FtKJQ6wEjdMK5ZmDt4AwuCM+ZGLTpySJnCEpQ5K3k8rt+UWcUSYQpd4OJCe0?=
 =?us-ascii?Q?G5EWJ3G6gGyN5/9Orezi12Iq2UpJYKveJ8cj2cdYhS+/969da5UKBpmqnjnw?=
 =?us-ascii?Q?73N27P2pwWiblFGqn+fdv/kxnnEH5QmeF/T8I7cKiCrPPvS5wdm9spw9VpoY?=
 =?us-ascii?Q?HuKw9aUsEkxi2EyJJIuG6qyNu7/9AiUJB4KI/c7eojthReOV5wbbOQhtVPEC?=
 =?us-ascii?Q?HCcYzxshzLObtMZPI0EdnrVYBTn//ApGi8Iz6z/8vvR8PKK3wja3HPoRubJI?=
 =?us-ascii?Q?GBq7eXLxh0KQVUEn5DC65AUrHQoWjWBJkyOGxlUGEBmHK0erIRVueVW7dmCt?=
 =?us-ascii?Q?YjCCSKAtBpLffJiKSetsU+S/AMTVOBoan/+8LuIRSMyAZyGDRvZIRkcCNfrZ?=
 =?us-ascii?Q?Snnjj47pNte1QmAN5u2cOS+ziQS0uTPZj0fwndgyOoiYvtGGJ0GbH+FkpsT4?=
 =?us-ascii?Q?RNkD3SDYpk7rQOfk2FmArJFkFBwaAMVpxQNOL3ieW1fMeQayEf6eiunESDOG?=
 =?us-ascii?Q?L4oc8qhie+AQARy3hUnlQ7ZtMKGHYeJofijg4d5IV0hRyDUbHp6+NGTOkr+x?=
 =?us-ascii?Q?LgQyYK0rmlfDPflRoNhMClFYhNNRniurLdjzcezqCY3mM/tEGweWAbp9pe7o?=
 =?us-ascii?Q?TQ9MxZs71Xj0zNJz7MeUf6XqiTAfbauue2Bk9LDGxLHvSq2E4rpC1bLlbXDc?=
 =?us-ascii?Q?nDRW6yo3Ztn6U9AFpktt/MnhxiKATvFmTH1bVKbZJ+rJmsCmbMSXoOf23lfZ?=
 =?us-ascii?Q?j8eJrEx5rUAikKGTuP3XHlnVTR/pCxfWhaQJzQow+GAEYJCSH3uFXVtDNtQX?=
 =?us-ascii?Q?hcFHlBBbV3Ku0F0EmO1JBa7O3uVpj9AcwaqOsfwMmqzzJzMCiPJlmKzETZCl?=
 =?us-ascii?Q?frAYiXndbng3ayAGOaVrznMpvC+gSCmHDDcGHsNO8Y+/YMTSV0vo1En+n+TA?=
 =?us-ascii?Q?trWlvM5qM359mpuiJzSB1XmVVosjBA8=3D?=
X-Exchange-RoutingPolicyChecked: e+525NB1uY6o6yAdptaJ2NBGRF+WemgkcihY7F3rR3jo74cPg7LW0YsXLQQv2qPoYrn5OX/nzFVy7uoTOg3KNOsZmZxgc3cYS+YUJxicpVw9YxOHEFXWKBZ9jkKGNwoboda+/TuUmnVOxmxY3sVkfLgNxiiOXYIEwKjsnvXcbIMIP+N9VHBJsuezB4EaY7UAlGg2X3OA/S4Jvked+TJfdBri4ZNX4lyChyTpt0q45gNi8AQqwuYY5A1KUCONrTSsXlLe5XbbiIrs3LuMwZ2/AK4GzeT/2RLnO2U8U/nDFE9aHbfzgUi4l/8yOh8to6KbEDeZWCsVZrXLh/kFGDV90Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 11ff70e7-dc09-486e-f9a9-08dec7fc24a0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 20:58:09.5082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M1rLTHPIvpd/fJM7cn3owTQqOHyqki7pbfbqfwjzMUjjRmYV8XxnEKpTYdY5oQZs4UQYy93uIyxLBIjYwLplm9c8owjGmBV4JVHFUXDwSzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB9538
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

On Thu, Jun 11, 2026 at 10:26:07PM +0530, Karthik Poosa wrote:
> Introduce a pcode_info debugfs entry to report pcode details.
> This initial implementation exposes the pcode version.
> This can aid debugging when the pcode version is needed.
> 
> v2:
>  - Enable the debugfs only for supported platforms. (Micheal Ruhl)
> 
> v3:
>  - Move the platform check out of this patch, as it is not relevant here.
>    This patch solely enables debugfs; debugfs creation will be determined
>    based on the return value of get_pcode_version. (Karthik)
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 22b471303984..65049916e42c 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -31,6 +31,7 @@
>  #include "xe_tile_debugfs.h"
>  #include "xe_vsec.h"
>  #include "xe_wa.h"
> +#include "xe_pcode.h"
>  
>  #ifdef CONFIG_DRM_XE_DEBUG
>  #include "xe_bo_evict.h"
> @@ -161,6 +162,23 @@ static int workaround_info(struct seq_file *m, void *data)
>  	return 0;
>  }
>  
> +static int pcode_info(struct seq_file *m, void *data)
> +{
> +	struct xe_device *xe = node_to_xe(m->private);
> +	struct drm_printer p = drm_seq_file_printer(m);
> +	struct pcode_version version;
> +	int ret = 0;
> +
> +	ret = get_pcode_version(xe, &version);
> +	if (ret) {
> +		drm_warn(&xe->drm, "couldn't read pcode version ret %d\n", ret);
> +		return ret;
> +	}
> +	drm_printf(&p, "pcode version: %d.%d.%d\n", version.major,
> +		   version.minor, version.engg);
> +	return 0;
> +}
> +
>  static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
>  {
>  	struct xe_device *xe;
> @@ -219,6 +237,7 @@ static const struct drm_info_list debugfs_list[] = {

Based on the CI results it doesn't look like we can access the register
on SR-IOV VFs, so this debugfs is only relevant to the PF.  We probably
need to add a pf-only list of debugfs files, similar to what we have in
the GT debugfs code.


Matt

>  	{"info", info, 0},
>  	{ .name = "sriov_info", .show = sriov_info, },
>  	{ .name = "workarounds", .show = workaround_info, },
> +	{ .name = "pcode_info", .show = pcode_info, },
>  };
>  
>  static const struct drm_info_list debugfs_residencies[] = {
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
