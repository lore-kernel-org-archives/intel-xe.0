Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D84C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 22:23:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6068310E0ED;
	Tue, 12 Dec 2023 22:23:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C16E10E0ED
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 22:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702419828; x=1733955828;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SWnnYtUh8WmAk8AzQhzNPUqOd/cpYm36o1/tfiqbE58=;
 b=a3RDgDLVt+yGSGTuQzDhCVnpmsOjcaiKig7g2WW63IxTGp4P9YFdLEDj
 RnaqFUwmcYBg2+WoU7Zg0u9DtXIL1/MsjI4199AuJrImY8ltxkxQFdBV9
 KbiyFDxb8q+NfFuriPt76BQnG5QJRaKwtN3kbpPaGbeJBqHGZbtwJUV83
 +WKHRwB1Xjy0ylnhf4qPqAe594fuuBO9ebgtcL99B2k6YOheBIssRU2SD
 Uo8Jhn/KKmnwo5NgzMueKo4PYkEPoC2YLT4pzE0SnFPtW3GjKiiFgWNBy
 KENQ6qUVpF8COHX6CRZ+T4wfAQRiH5yCgCiQ08k53nAWVGZ9yNDNcn8Ks Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="398722878"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="398722878"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 14:23:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="773723945"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="773723945"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2023 14:23:47 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 14:23:47 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 14:23:47 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Dec 2023 14:23:47 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Dec 2023 14:23:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K0FxkoDLt0IvUg2VfGluRi7ber+bVvUiyI8gWfFQfAm0FIYZOSvLZ/RzEqqNHjbXzZVMECytZdULum0eum6Vw677uxvu19qnAnXAwEjT5pcGDPxbIhqaR+vvnRpeKWJvCvAngSGb5mxPa7X62p5UerNEd0eSQSfodWiMmZfp+fAn01iheQ8eg9isbSpbVOPGD+mX8SIrYs9nTNu/HjWzY1iCWCIrPzsVqKf1BbwqlUkJR7/94jPwy0x+XllB/w2uKUURqAHWyPp8KtM9t5lOcaIw8ymXuyu4P8mNmEQYchkf7U9O3v5ZkffQaBGSy43LOxI2rIg1XFOEWcdaumTMcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SPgreAFaMPTUuBtiuN9olQFe4m+ofF+nafOn0+tdgUU=;
 b=gSrAAHq+WHz8pGrfaUyZLMng2nhZAX8UwgA6qrus6N2tCBOxCENW0y73syVX9VTSX2IL8vcRoQIv8qEExCJ0yvKTfbZ22Vn9XSAK9RbL4a9FlaCxVWxslRM8uk/j93RKfPZ4pid/bsA30+UixlDprXR1CASA+zarbMO8Q+XlHg9nj+eVD/mUV3XVFAKwggJt2fxPdMotPQjIFV/nuKRkkxAsVtshk0d9k5JrsxFCRUELIs1w6pG/CkXyi7oyxPFXre4Rid0HAqHAVHFLqUa0/3Z0HWqUMpolldqXnnpN+LgAvu6JoJwtHzZoP9miCr8wxHvpzLB1hrFGpnuHULH0jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB7477.namprd11.prod.outlook.com (2603:10b6:510:279::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.29; Tue, 12 Dec
 2023 22:23:44 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7068.033; Tue, 12 Dec 2023
 22:23:44 +0000
Date: Tue, 12 Dec 2023 14:23:41 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 05/10] drm/xe: Update definition of GT_INTR_DW
Message-ID: <20231212222341.GL1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231212210054.1747-1-michal.wajdeczko@intel.com>
 <20231212210054.1747-6-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231212210054.1747-6-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY3PR04CA0020.namprd04.prod.outlook.com
 (2603:10b6:a03:217::25) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB7477:EE_
X-MS-Office365-Filtering-Correlation-Id: 6909847c-7f8b-45d3-242c-08dbfb610051
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6GtCMj02pUKRb72T9JkY02xE2mrcUZegeHAz+Z5HbwO8toAia7JJHH5NntfbBzsT6Ns+O+Hry4Q/nyUusvju5SApPMWp6QLqTMy2VOBJDiHOiOBKdf6Hr7ofqZaDjJPKtWEAY3e3ryX4JfMzPtwRD1HwNQ76JlMZu4KnpKP623fTF8GoPd6HKyuXsqCbql6X+DcRc7pXTlaGKPvYqmTNLkoVWpfj06OVdnZfz61p+AmotRoQ+GRpQQlh4+JjCmI50halNW2J7wN5kU7SYv1vR7K4kF+IGRU8V8qzv4dfB6JKnc4zPt0mfeiujd8t2eEenKpa0sz1NfPURjRxDl2BVAlfhzJmK8rZbs+g3RjspQWckdzMdNqvHqkh+0RxmG3DreKELAlRxYtifGZZLOXRJVQuJ9fI1J8fCxtZPgpLbxr4RRhSQpMl1mn521eDWBQLKyZdA9Ssx973h2y0uP8OLyU0hU9Ihv8i1nAqqPoTKtjT4xMCPFpEELCV/GPBH2Cw1OU67s/xG8C25Q/hHabk+oaWCIdvnp83Hl3Ux3mG3et/IgtGB6zc499BwIBo5JlE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(366004)(346002)(39860400002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(6666004)(1076003)(26005)(6506007)(6512007)(5660300002)(41300700001)(2906002)(478600001)(4326008)(8676002)(8936002)(6862004)(66946007)(6486002)(316002)(6636002)(66476007)(66556008)(82960400001)(86362001)(38100700002)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OGKYW8D9eyk6+cb0kxEisBnQN0ULfne1AMVJyPDSfIntPVMPwSUjcC6WSUw2?=
 =?us-ascii?Q?OIAt998huhvYWRBeGyN/ppGIn+Ts9zMpXvysjAvOxSiD1K+xYuniG7EXPU1g?=
 =?us-ascii?Q?hwqP2F4vwUCKBqezyroy+qiCRIEj5nSSbHhfo9Fppy3j76lOfXgwKvwaOiJ5?=
 =?us-ascii?Q?EZ6MyobCMqEk2/ZGE45CRLuQeQu6yyLywHot82wMBSO76a3WX+AF52LISOD+?=
 =?us-ascii?Q?k4SUw9gJYNGr1kmiQp8G1ECWrOT2+orjPEn2lVks0oTPy/PmUlc4Ut6Kw5JX?=
 =?us-ascii?Q?+zjGbiIuL+OlRwGqc+mI7X7Tm9szl19PF0kZNxBaZme4xWUBon0HRPKa00NJ?=
 =?us-ascii?Q?Jz49pL1Q5CDIJziphELlMHOhsBx6JAJZv6QxOJuurcZ+xdKWSPMmQvrBOwP0?=
 =?us-ascii?Q?TvRk7mQqFbrfigXzu0aipAavOWRKrSC4qGT1Y+Reu1HVNtWKOkv1sENwAu9z?=
 =?us-ascii?Q?yGhhYObUE1IPoWFuWg2fFCX01ax9nvUJye3wzBr6Q6U2Z9R3bCSaEkCJl2Sw?=
 =?us-ascii?Q?3whbbOc4eobuQRB78hKVMkyxSW2rtTOI91HRrwmYqxEd+yInqjoJm/xu6def?=
 =?us-ascii?Q?3pbwFjh0GBmSquQyvsvu7jUtBM+OVNbzWYY5IebhxQy3xslhlwIIPZVgrK5Y?=
 =?us-ascii?Q?2HS1REIKD9SatX4X0XBSTZJhN9bhX9hjkHj6INY00Vv/QcBtDktSMkKPzHpi?=
 =?us-ascii?Q?9pHyDEVASdFgaQDsNnhyhWGUqQna3Myn29M5+/1dBQmRPBY0IHTq9AojB+oG?=
 =?us-ascii?Q?89luuTorVV9DLTbJuvsFuq0GMFoesFoX1zBtzFjZiFwctl+z3duOUGVCPgRs?=
 =?us-ascii?Q?//oHTOftDJ+2OsbiWW1OxRBy08EqN351EKvSweB2tojq2bhxst+K5B3hzv94?=
 =?us-ascii?Q?Ps2YGqZp+4GytdnUxrtsYpPlC5jpaUwqDseG/PlrT3k3bbAmSLvFNQNxM0Uq?=
 =?us-ascii?Q?2CjTgEF+4e2uq1uOBfzOno6GlLwbD8+HJinG6Os6LiOhIZbD4wD1HwBGiI8L?=
 =?us-ascii?Q?xYhWC9vgDp5mZ+m33dZEkXoWdweBSrsOHnfC2Fh6ZGy+/Tge2wffixv169E9?=
 =?us-ascii?Q?pxCNbZOLfuXGca7pbOhmmCm/bH1lKg++xZPc5Zdgm3kcXPW8H+PPblAL5y6l?=
 =?us-ascii?Q?7YKTY4xvrfRUXPHTQuCCW9Hu973X7Ufzay2nOeWqY0/2iF4DFw9zRjvLxmtB?=
 =?us-ascii?Q?M6XEQNV71K0RmKwLlnc+8V7iAvT/VQM9Mk+1nNnXoY0izhtCgjASvzWbATTa?=
 =?us-ascii?Q?fLK3etB8jeDHJmSG6ADXXu8zAQXMHEUfZ34Ci22f7U7DZwr06RpGiobuS3Ik?=
 =?us-ascii?Q?+523/5EQ0jm/9hfPlJLGUSjouvjSGVBno2YpGc4bUAad6WGUKBX/9BgQSLWJ?=
 =?us-ascii?Q?XYTd/H85WIEUIS0lt+h+luYozg9ybI3X1yXOl4t4GEce5fx5XXOMQKnAyxse?=
 =?us-ascii?Q?8XOk7iHCh310cDOkVTeApJWy9h4ry0tApxJF0KODZ+xGhn5nK21cllXSwC+Y?=
 =?us-ascii?Q?f4Qx5n2vqZc50F6m/oY/R9KIgN1NGuOXrEWtNtNLhIW4mb9j1EX+qn5A6Hpr?=
 =?us-ascii?Q?RUgCaGHNOpJl0n7nB5dHpCQ71NxXpB0ITZaSTYTdZrH9Jw5XQAGYiijJJkej?=
 =?us-ascii?Q?rA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6909847c-7f8b-45d3-242c-08dbfb610051
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 22:23:44.0321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QkYvH7efDYGUqL2c2eG5lGw1pjsQVlZmgE5G7DeCjNWTMc4c6y/UNSwDGXVGhBwB5BZNEcGIrjWbmql7AQAwMHdWdj8r5wwvsfp3TqsX1Kc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7477
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Dec 12, 2023 at 10:00:49PM +0100, Michal Wajdeczko wrote:
> Add bits definitions that we will be using in upcoming patch.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 5f5a72e9d0d8..f2562834ca59 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -437,6 +437,15 @@
>  #define   VOLTAGE_MASK				REG_GENMASK(10, 0)
>  
>  #define GT_INTR_DW(x)				XE_REG(0x190018 + ((x) * 4))
> +#define   INTR_GSC				REG_BIT(31)
> +#define   INTR_GUC				REG_BIT(25)
> +#define   MTL_INTR_MGUC				REG_BIT(24)
> +#define   XEHPC_INTR_BCS8			REG_BIT(23)

Personally I'd drop the "MTL_" and "XEHPC_" prefixes since these
registers are going to exist on every platform "officially" supported by
the Xe driver, and even for the older platforms we're using as
development vehicles right now, they don't clash with anything else
either.  Up to you though; the bit definitions here match the two
GT_INTR_DW registers, so

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> +#define   INTR_BCS(x)				REG_BIT(15 - (x))
> +#define   INTR_CCS(x)				REG_BIT(4 + (x))
> +#define   INTR_RCS0				REG_BIT(0)
> +#define   INTR_VECS(x)				REG_BIT(31 - (x))
> +#define   INTR_VCS(x)				REG_BIT(x)
>  
>  #define GUC_SG_INTR_ENABLE			XE_REG(0x190038)
>  #define   ENGINE1_MASK				REG_GENMASK(31, 16)
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
