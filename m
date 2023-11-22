Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA342C61D97
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 18:34:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99BDC10E0DF;
	Wed, 22 Nov 2023 18:34:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4277310E0DF
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 18:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700678064; x=1732214064;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=76n7pFKYX/oXpL6/OtqAbkc5PUJAPFlqU5oWqFDeE08=;
 b=h/g9lb+1Fim+0AqFM9R6AUCzpp4kRE16gkGuLGGcprEecCsDniuPY5h4
 zoodgTYXg4e8w5ZSTOawyUnOfOdTzuTWAFDch1eag6SsZ1xXIKUIJPR6t
 T3p7d0OseMGSKd9MfjVAX/Ga7gLQJrEfPNr2L2he4EJR6+9G/+gbj8ExF
 uBFUTgW4MonwvhYVCBR8+3yDzHE35wkU+UcZOB1TDIQxycaN/W38Ug/ii
 iWQoyyu56lxmVtylKJ4DYhazKlRhCUEmOZtYuFxHkl8NaJRjmA0FgIcqP
 9COnNugz44p1St/ChNGgZO2+bbCq62WbUeqrZy9bOjCCLYQ6R9u2duI6s A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="456453530"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="456453530"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 10:33:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="884725067"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="884725067"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Nov 2023 10:33:01 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 10:33:00 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 10:33:00 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 22 Nov 2023 10:33:00 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 22 Nov 2023 10:32:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LyeNBEBoAjVZRl8WV9LiDuL8ZDzZX+WDlIx7NJlXhU4ZRal52QGRheaF8bdALCwFrsk9s63pvKpE2/zcGY6g7EHC/U0TBDSl35o7I+FJEji8r1bUPVB56WVrGk0KtJfjLCyd2gebrhJPGstD0MvWCze5U+uMzGZppavJTmin2jUHyskmx0l9hyFcotUEFRNJwsXE2qEFzLAVbjdBEBxmIycbMjCteprqZItaAuuU7y8dfsvck2A6akr/57jq97wQfH2eFDAgN1gDYHl/RgndyvENvWFPvIaNa1HIXhxhK515x6mLigipjY6sd0DVRKy6qeXWBeucNQDToh2XgSwoPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=apgZL9FkWok6qC084DMaQ5bNO9D8x35LolxVSjqpR6I=;
 b=l540Bc9E01IOSSNbjHyVkJhWKOdALASPNuCqtmtRLq5QDrj1+cGR9WxfdDJL+DngV+J22THqmbj8ZP0Jzr/cOiKgjIskUgE15qYAoj59gcJPfm9lr1HcypnodnbFq1aK4nIVZBUrZqo7IxHczLf0jtXrfYpumAcmXJY/hi4wDrB4p48L2DlFZ9R5fvve8rW58ttXb2RhbA6LvAWelH8sUximO9wLUnO7OPWX/OxUW34QLDvynBDijiLrCs0vcG/S39tBLXH8xG90b+zvzejy2UMyWEeG7GfbDMJiJJ0oqxD+EjyrWLfZZdbevuO9WjDRmsyxckyoXVggABolfukAaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW6PR11MB8337.namprd11.prod.outlook.com (2603:10b6:303:248::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19; Wed, 22 Nov
 2023 18:32:57 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7025.017; Wed, 22 Nov 2023
 18:32:57 +0000
Date: Wed, 22 Nov 2023 10:32:54 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20231122183254.GN1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231121195209.802235-1-lucas.demarchi@intel.com>
 <20231121195209.802235-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231121195209.802235-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR11CA0063.namprd11.prod.outlook.com
 (2603:10b6:a03:80::40) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW6PR11MB8337:EE_
X-MS-Office365-Filtering-Correlation-Id: db5b2be2-c019-4527-6e0c-08dbeb897294
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZEpRYwKvIazifGMu2bxT3iRwN0YsGp9fVwTp4yb5nlCYO4UbyVQUhFKpPdndCnmTv3WwIOLJDCxHDMUm2zJ3iY2tGYFhv5Knu+1ZrUBsr6YVvXR7yhedKJjbhP+XHHdS8H1xCFwluxK5tZX5Tswm7tykzslQIRyfEYVYzT7vkf4YZVa1LUUxgIt8eyXpt/aVjYlsTal9effhml4TQMDmaxU9InpWGjUziJhYiomOmGPLWYp1Jqd9Sz1bvxkZP1o04cgD1PrOlrt+w54Can9EugvwSYTgj5BnMZbnZeCU9huv7ojxuYb+v0ZBUWiwKH6y7PLj9rcbb57GUKoLcxeVnj4e4tE0qHDxeEneYnQ8N1rbUBbd4PcDALjUeZMwACAQTQywRXHhvr7uJPoi+pW2kZvpdkqQpPG5/+JKNP004rfouCW0MpCo83R0mi5NZhnRI8plTqjnoCyP+SnXn+1P0mL1jY3miJA/0mNmObHOOYJ1RR2RvgYMcEwlfpy5omaonq1J7aNeCnWy3I87Adgs8UuoC1CzWdigyk1LbOQlwTQAGFrfT0B6ztTBwPy2SEv3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(136003)(396003)(376002)(39860400002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(41300700001)(2906002)(5660300002)(8936002)(6862004)(316002)(6636002)(4326008)(66946007)(66556008)(66476007)(478600001)(6486002)(8676002)(6506007)(6666004)(6512007)(26005)(1076003)(83380400001)(86362001)(33656002)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?egkgwp34a3G/fROTLdmXJYZivOq2mn8kjOCDeAd+Vy/PlAYgJ9RYCK7gat+S?=
 =?us-ascii?Q?84zozf0zNuFqjKL1L1Y1go96qndz83zd1jwbQRmPHelsFznuow7H47a3rFDU?=
 =?us-ascii?Q?AH47v/HSitar6fmwT1eIAbU7ztdAaj6VA3hjGbTcli+3khSrf3mmw+cbUEpp?=
 =?us-ascii?Q?WHMPnGS0SZW0qAgTM0toZpz6dfkKen1M8sasr8uEaY/H6NBOw+4DfwOdkY0K?=
 =?us-ascii?Q?KtuzDzH4hTsyYUOT9WwqWooox534AzKe2stCMT1U82ZKEdXL2wrhx4t/ipXo?=
 =?us-ascii?Q?Bf3gigm3hkGHsL0YcgHE3YPXexcnUYdGeZTIH5dfEKfq/KyiLDOv/FWlusYR?=
 =?us-ascii?Q?ymgYx1qbN1sJP+VnM1/Hpk0AHbl7VXCsns8pzYM5NjZ9DLZ8owZ5YeBS1JQj?=
 =?us-ascii?Q?fFwahJXDP5ZxxrlVdpvbuvg5M+pfQDAM56Q8wDEvxTxSU4BfM4lat48+jjKh?=
 =?us-ascii?Q?OdO6P7EyxSZ10PDkzfPk4xAa4kp/w5ZKl6W+52Ru6OQihNLm3rc4MSQxNalO?=
 =?us-ascii?Q?MNzR5gGgjPbwAgWnxft02oqP5RAVg+0W4w3ewFdAEg+Km+S8GBOOXTIaXNaZ?=
 =?us-ascii?Q?5C1QMAgPjtqr0yQf0a2K95KdwD0AdA1Xwt6F+Z3evJ0t3ERpoheEbeT4etch?=
 =?us-ascii?Q?MJLjeDq6vNJs6X6aAgrLxIa+Lz+Vw1WOnVFYVsTQKOYHarmYpGXMx8a7/JQD?=
 =?us-ascii?Q?N7jTrSb7f9Nq1Pm0eNQXLDt1jVv7QUBntFoTtlMPCCei+gSI1OGZBbx32jMx?=
 =?us-ascii?Q?0MuG58GR61tZZKpbMHT1nMPU/qOElnzQVjifcIUd5mq3A1Zr5f+/Qu1WjfSN?=
 =?us-ascii?Q?NOCsUtszr6nr516lN8IKvquPua5b59m1Ygm+VAzC3IRdTiB4jJsxZCNarx63?=
 =?us-ascii?Q?hBmoySRNHcb07PF2kiy9pKPJN063oGfP9QQSqDRr55tN68wUCPAZP7H55Ge+?=
 =?us-ascii?Q?7MYFu0FH0ASTpXKywJGKegvHeiQoHxt1AmRqwG41fsapiQMsZ72SGm/AQ8W0?=
 =?us-ascii?Q?t/WcvHCChvPC1X+m++3iodw4D9ErUOI0qx7CA4V1B3dFCLyaXG9q9bHb7u+W?=
 =?us-ascii?Q?/72OClTH4l1iL1sExbQ68mcgrfGGx6w17YIo/4ohTLBEs74y607JI+ff4/T4?=
 =?us-ascii?Q?kV3BCjjP0hvB9E0Yho960Q9rjA117k6A3jnNgmraImMdEL5F/Ku5DTWttpER?=
 =?us-ascii?Q?m0CtSEHxEuMwNn8cfDDnY1aq4rJdzbbnkHWaQSEquAVXND/P3dAHYeiY3y+q?=
 =?us-ascii?Q?NWMuGD1W9GqnaSoFi3V3Std3kA11qb5FXhn2O9pahGIkog4SDWMdRtXq4lJy?=
 =?us-ascii?Q?am8CPytrLj7szHvZPGCop4kqtsWHkDPD0K79awf297vhBR2tko67dU+UU4iW?=
 =?us-ascii?Q?e+1zxpr3xoTgg+okaq/K/G/vxsiWtpB46xufTLjm2k53sz8nBIVNoJdC9xtM?=
 =?us-ascii?Q?3wdU3Jkrw8yXLRyLMYMLsauGzj00NnLVnIK6Bo30TR+yIywDH/55zAMvaawj?=
 =?us-ascii?Q?ED2mTD0M2KBveEvHXDsOzTg+8zHuPejS7dsVDVzE8OMAevNzu4wUPzbmqd72?=
 =?us-ascii?Q?fsK6ne0fFW9qaH7iTSPqTp/kEcz7rK6KERBJs8/X99klu28NoffmtTHCu4sb?=
 =?us-ascii?Q?9A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db5b2be2-c019-4527-6e0c-08dbeb897294
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 18:32:56.9843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /eDlFImkVhN+TJ0uWVh1vxneOgU1xcvvdhjWpT8hEqDbJhHEJ58DCUYoPEFt02HzwfWl7DzsNrJ3J+dmOe5Aq8yVxVSSKQRJs+k66ZMsBxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8337
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Sync MTL PCI IDs with i915
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Nov 21, 2023 at 11:52:09AM -0800, Lucas De Marchi wrote:
> For Xe1 platforms, it's better to follow the way i915 adds the PCI IDs
> to the header, so it's easier to catch up when there is an update. This
> brings the same logic applied in commit 2e3c369f23a7 ("drm/i915/mtl:
> Eliminate subplatforms") to the equivalent xe header.
> 
> The end result of this header for Xe1 platforms is now in sync with i915
> as of commit 5032c607e886 ("drm/i915: ATS-M device ID update"). This can
> be seen by
> 
> 	$ git show 5032c607e886:include/drm/i915_pciids.h > a.h
> 	$ git diff --color-words  --no-index a.h include/drm/xe_pciids.h
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  include/drm/xe_pciids.h | 37 +++++++++----------------------------
>  1 file changed, 9 insertions(+), 28 deletions(-)
> 
> diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
> index c7d73d6476c8..3011d99a05c5 100644
> --- a/include/drm/xe_pciids.h
> +++ b/include/drm/xe_pciids.h
> @@ -173,6 +173,15 @@
>  	XE_ATS_M150_IDS(MACRO__, ## __VA_ARGS__),\
>  	XE_ATS_M75_IDS(MACRO__, ## __VA_ARGS__)
>  
> +/* MTL / ARL */
> +#define XE_MTL_IDS(MACRO__, ...)		\
> +	MACRO__(0x7D40, ## __VA_ARGS__),	\
> +	MACRO__(0x7D45, ## __VA_ARGS__),	\
> +	MACRO__(0x7D55, ## __VA_ARGS__),	\
> +	MACRO__(0x7D60, ## __VA_ARGS__),	\
> +	MACRO__(0x7D67, ## __VA_ARGS__),	\
> +	MACRO__(0x7DD5, ## __VA_ARGS__)
> +
>  /* PVC */
>  #define XE_PVC_IDS(MACRO__, ...)		\
>  	MACRO__(0x0B69, ## __VA_ARGS__),	\
> @@ -188,34 +197,6 @@
>  	MACRO__(0x0BE1, ## __VA_ARGS__),	\
>  	MACRO__(0x0BE5, ## __VA_ARGS__)
>  
> -/* MTL */
> -#define XE_MTL_M_IDS(MACRO__, ...)		\
> -	MACRO__(0x7D40, ## __VA_ARGS__),	\
> -	MACRO__(0x7D43, ## __VA_ARGS__),	\
> -	MACRO__(0x7DC0, ## __VA_ARGS__)
> -
> -#define XE_MTL_P_IDS(MACRO__, ...)		\
> -	MACRO__(0x7D45, ## __VA_ARGS__),	\
> -	MACRO__(0x7D47, ## __VA_ARGS__),	\
> -	MACRO__(0x7D50, ## __VA_ARGS__),	\
> -	MACRO__(0x7D55, ## __VA_ARGS__),	\
> -	MACRO__(0x7DC5, ## __VA_ARGS__),	\
> -	MACRO__(0x7DD0, ## __VA_ARGS__),	\
> -	MACRO__(0x7DD5, ## __VA_ARGS__)
> -
> -#define XE_MTL_S_IDS(MACRO__, ...)		\
> -	MACRO__(0x7D60, ## __VA_ARGS__),	\
> -	MACRO__(0x7DE0, ## __VA_ARGS__)
> -
> -#define XE_ARL_IDS(MACRO__, ...)		\
> -	MACRO__(0x7D67, ## __VA_ARGS__)
> -
> -#define XE_MTL_IDS(MACRO__, ...)		\
> -	XE_MTL_M_IDS(MACRO__, ## __VA_ARGS__),	\
> -	XE_MTL_P_IDS(MACRO__, ## __VA_ARGS__),	\
> -	XE_MTL_S_IDS(MACRO__, ## __VA_ARGS__),	\
> -	XE_ARL_IDS(MACRO__, ## __VA_ARGS__)
> -
>  #define XE_LNL_IDS(MACRO__, ...) \
>  	MACRO__(0x6420, ## __VA_ARGS__), \
>  	MACRO__(0x64A0, ## __VA_ARGS__), \
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
