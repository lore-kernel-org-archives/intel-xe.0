Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0302C0015E
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 17:03:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8564E10E4A0;
	Wed, 26 Jul 2023 17:03:17 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E4610E4A0
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 17:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690390995; x=1721926995;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GdzsYlMkRkT2/gTVfM+lczwAoGThiiSptuCbdpb2Psk=;
 b=gswUu9nLc2ay7elCGW6LLywByWEOFWu/7Ny8nJBtA8V2IJpng06pibUq
 0h1kx5SJabRejlIDWTbChOI7uxJNxK+v0R9Pok9I3YjDItpG8yGoysF67
 blz3lATTLW4xQNw4X97dYyk1JBl14SS7rz9lsrzVOtoiBMuZXXmPyaAsv
 JB2L3serXyrhbYlXo/ZNMXyIDRCa221NHLRPGFACQM39MOAq2cHcNTtrp
 9lvMYQNxpmGX6IgM5IBZ26Zg/TJbraLstuZylK7pnnjefFTCBSC2uMaHK
 uBqf9K0DXoldACnInLNCZPJYTMpbszOdEL+P6kzSgzcp4AvrIvq05k+WP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="365533967"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="365533967"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 10:01:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="756304793"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="756304793"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 26 Jul 2023 10:01:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 10:01:42 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 10:01:42 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 10:01:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Io2F02NrEgxThRghZRgRzZvCXtHxyJHMkZDduUl6yHT4T7ihVFBSUrlew1eOQVWyeBRE3nckqK3kbE9x8hAf7nx6Wb9NDIoh6IONRdFKex6wtzLYcty+J6bFUwVUIB1sEMaOjlErMbtbPhRTt6asmcffJuEV3Kid0iYPVxBlDivlY4HWgxlMwbxGq1UMGCXjqSeUrE2BXBsvtWa+phHH/U9juu22d8M1+u51U4jY7GIVxxMWO+2KLHbnBjJU3eH5S1t+22KtK4U6tcHaSWqH98sm1xu1DEjG1LyxFf4+muOYdiBYd0FW7bTE58ZoHOU+1rvdTwlg6WyPWZnAB6Z70Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aAgKO4qGUktV9H6CsMkwMXxZJYSlpTjg8NUl8YMcoJ0=;
 b=g/4k+Gv+DSPrPEgMDIO2+BRLqm9Cb7G4KVQs6IXhqEAxhY05yD52LS5b/KFP+foc3lCFeXwZscW1MfXk4CzrFyXqYA8H/+5q3d2+qD8e2qHtxBqLZtBW4zG1z7Ag98o3weo7GmrrpUfTWOgW/MDb8798QUclxJEZfDYJkT3mlfcpHE5nLyZ5ZaabLBgP23JQ/nmWf7K+kelTxh/Qjz8CJyVFQ3nhK242JXu3Exgma/OLu4C/z3xni3RcWGlHQI3jJz5ztwd2diVB+B1CraWsLtJkFZghrSR8dORyXecP3p7FktIAOPpLuu+RKkODNwnfr0Lb1gmLOMxm3wYh76kqvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CY8PR11MB7244.namprd11.prod.outlook.com (2603:10b6:930:97::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.29; Wed, 26 Jul 2023 17:01:40 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 17:01:40 +0000
Date: Wed, 26 Jul 2023 10:01:37 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230726170137.GQ138014@mdroper-desk1.amr.corp.intel.com>
References: <20230726160708.3967790-1-lucas.demarchi@intel.com>
 <20230726160708.3967790-9-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230726160708.3967790-9-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::34) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CY8PR11MB7244:EE_
X-MS-Office365-Filtering-Correlation-Id: c3fdae9a-40ba-478c-5504-08db8df9fafe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n/0HlfemXCpkprULHNvFyfMmcV6PxOS1LdieFdihwUVkPCMyk/UlJG0eGgbjjQ6DXGCfuTEt72y1CUYr2voB4ikvSB52oK5IlSfRcsNHhJtyaxjdRS6SnRb8ZxLDJMBZlhipo3hqlKv2+6txWNAUzo7JIq+ZE4HrncjqbeVTKo+hsmaW+DU4CKbRkQJ9cqm24rBdaeOqidygVyX0YecvoV6/cMgAIMCG84MgOlUnscUMFEm++TrcrFQh/XRwmeF0w5QnL76eDkjMXXO/fsIjC28/n8+4IYyz32yWXZU9EX6sbdoxDYauQAQWBDduD+OaGpoZ9kd/1bJB7nyl5GWUkbJP5NZVvLLhe1MsINbI6Gbe+MFbfJCmcKmOkmoW8vhy8PzZqHis4u2qOhuCGjFdn5BmwghrFLRI05JHoGroIlYLb58ffM72fgbaRDtKTxj1puYhc3lXRYy12RSYiH1NpL2kE7qwxiC+NfNTRQIgDka5INUS+Z4cF733BI4DENzNbWvTLbpy09c6goq5GkTGDw1zJL7ivQbvWDx8Lc4doE0pQlfjmWnTTeqpk8l30aVQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(376002)(136003)(346002)(39860400002)(451199021)(83380400001)(6506007)(1076003)(6862004)(33656002)(8936002)(26005)(186003)(8676002)(5660300002)(86362001)(6512007)(41300700001)(6666004)(82960400001)(478600001)(2906002)(6486002)(54906003)(38100700002)(316002)(6636002)(66556008)(66946007)(4326008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KI6e9GV0Rc9QPtq+CQ5CSi7P+0PVV3YzUwG/uaXAu5RkeA9PfqqjRPORKN5a?=
 =?us-ascii?Q?ZEjr2px8nS9Cil3ZDr2+XPPxb8XmGIBeCR1GfBeHFELtqMhnuf9JJCP1xww6?=
 =?us-ascii?Q?exYWWF3Fq5h41vIqNc+pkGvPuvZyLC27zOCG61JqMirWn/LxwIkT7Qxw1XsK?=
 =?us-ascii?Q?XWW3p9U2+80Af0ZU6c0w6Kh0Uaiea0ZsfEk6KfNcoUb1fv1RTkWMaHFpRg/E?=
 =?us-ascii?Q?dG32cMS3oBqEvZEa9msTipHxFOeeCmcGwKW/mbc92wW4tObEBzC/9hSc4gCZ?=
 =?us-ascii?Q?B9aoM0B0b0PDbppwHnsVMhnhplBGzDrUK/jcPIMLV9rfj0L7oeWKk/5N91UU?=
 =?us-ascii?Q?lb4RpgqS5IqCa+5bc5VGhsRnNN2rWmp04jXq6lExJ2PufA+/dnZL5VWUBUgS?=
 =?us-ascii?Q?J5KMjvzQI2uNGqtwk5IND5ZqwzGBIwGmIvnOJU+oPAOnuN6g5JvIrG186bgx?=
 =?us-ascii?Q?FMqFtMsPD1u08uLdQ7xmU+dS0ivbLZXe3F8FVw8lmj7CU5LiBfJcroD/OJlP?=
 =?us-ascii?Q?hcbYNmy+FicrdAUmPSL4lXQ5XKlZ26CwcFvKKjiA/IwZ1BnGNBPfGGMy4Dwd?=
 =?us-ascii?Q?nCbhjw2G7T7GzYbIZa8j4PycFSZtxEI1Cc8xIHGDEZBBur3X5p3hlWoXpoZK?=
 =?us-ascii?Q?QQAxsyeEU9gDedriUYQdK49QmqlsbhZLmEkjS8ymU+17umap2/2Uwvb6Pdyl?=
 =?us-ascii?Q?KmLiXHwHWASWhX3UL1iZujaHMXI5p+USWJ9Srpv14w3dsqeUQWacy94ftWWA?=
 =?us-ascii?Q?dyuPC8lvb2z14cTqsib68i5U7mgWvLENpSwcLx2YU0Ztr7UAK3CT1KTFWhk5?=
 =?us-ascii?Q?U7+mFkix5aUnc5vVdqMFOGyh6q9xyf66fJHCqytBNHXvDegH3ffngGbqfIA7?=
 =?us-ascii?Q?u5sSW7b7YE4Nr3eZbxsUYtbz4uwjFky9XuGGD11zj4HdMdCZdah4pQewkLDf?=
 =?us-ascii?Q?ad6dEU1Emc2NLa4LeHdP2uu9zztdT4WS31cm+5f85f0MLFG4JWMIenaj5Kix?=
 =?us-ascii?Q?EHqUVYYpx/05SV/JvVBX5ypHHAsoYHGstbR+UlPjd3//GsaeHYn5Ou5kQmE8?=
 =?us-ascii?Q?UZvsc1X+InfpBYoIcfo4/JapAxuAAUYweOpyVa8zlATJ0auKrmaCv/Mmb9op?=
 =?us-ascii?Q?4P0ac1mtpezerPqLUl3yK2qngj4IdTkegwlm++w++h4cAzDErlHAJr4pjjrU?=
 =?us-ascii?Q?Ij/uXRY1b+RThTyh0QDFuf2uXROnPJBsOiC3oZkrxS+ZeMvlk1MlAJh9H8Oh?=
 =?us-ascii?Q?G3Q/Vyoj47dydvnq7qKQcruO/xgnkIDkM2bHZ7uHhicdVqznv81mACD4HtkW?=
 =?us-ascii?Q?qwYWFvodTpwl2NEffp0NcK/liFkjLt42OBnGAQhIDPpb0D/VaKmk3ZlDuRDz?=
 =?us-ascii?Q?npcpn7ecLIhhr4vW7AaimCK76eW+ZpWtx2g8SRQvtyo5IF2ooiVFOpPfrFtA?=
 =?us-ascii?Q?pA4Vz5OtT4TEQjTaQN0gZc/PLYG4KFUtmWorhXKdEgLeIUQjuQKWz7koWidl?=
 =?us-ascii?Q?ppmXHYofGbM9IoQSl5VI+hwbKoySYBGSS8l6wyE8D6mVyMs6Y0CY1cuXiXZ6?=
 =?us-ascii?Q?MpgG0mZ83pEOJLjyX+JMvBZ7d/nfrWNM+2Dcq5lkGzD8weN0igXqXPvhxjl0?=
 =?us-ascii?Q?1A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3fdae9a-40ba-478c-5504-08db8df9fafe
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 17:01:40.2077 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ZThKG3BYZvJdFqHmbJFetBLNdxBKJHtsPJU6BpUM1oWCN8c9OHcfeueykCYq/+C3G5cEJ11NjC0BN70kacm99VIep2+rWji6UaY6jeGQNA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7244
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 08/10] drm/xe: Fix MTL+ stolen memory
 mapping
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
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jul 26, 2023 at 09:07:06AM -0700, Lucas De Marchi wrote:
> Based on commit 8d8d062be6b9 ("drm/i915/mtl: Fix MTL stolen memory GGTT
> mapping"). For stolen on MTL and beyond, the address in the PTE is the
> offset from DSM base. While at it, update the comments explaining each
> part of the calculation.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> index 21ecc734f10a..271b3fba4129 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> @@ -94,11 +94,22 @@ static u32 detect_bar2_integrated(struct xe_device *xe, struct xe_ttm_stolen_mgr
>  
>  	ggc = xe_mmio_read32(xe_root_mmio_gt(xe), GGC);
>  
> -	/* check GGMS, should be fixed 0x3 (8MB) */
> +	/*
> +	 * Check GGMS: it should be fixed 0x3 (8MB), which corresponds to the
> +	 * GTT size
> +	 */
>  	if (drm_WARN_ON(&xe->drm, (ggc & GGMS_MASK) != GGMS_MASK))
>  		return 0;
>  
> -	mgr->stolen_base = mgr->io_base = pci_resource_start(pdev, 2) + SZ_8M;
> +	/*
> +	 * Graphics >= 1270 uses the offset to the GSMBASE as address in the
> +	 * PTEs, together with the DM flag being set. Previously there was no
> +	 * such flag so the address was the io_base.
> +	 *
> +	 * DSMBASE = GSMBASE + 8MB
> +	 */
> +	mgr->stolen_base = SZ_8M;
> +	mgr->io_base = pci_resource_start(pdev, 2) + mgr->stolen_base;
>  
>  	/* return valid GMS value, -EIO if invalid */
>  	gms = REG_FIELD_GET(GMS_MASK, ggc);
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
