Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5643C4332F
	for <intel-xe@archiver.kernel.org>; Mon, 30 Oct 2023 17:53:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708E410E356;
	Mon, 30 Oct 2023 17:53:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B22CF10E356
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Oct 2023 17:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698688415; x=1730224415;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=G3sYNyLSSgiPs+HLWzGJKj6ylqJr/FvLw/IkcKNpUCk=;
 b=k18yp3D/apN8Vavw3cPGNaawRSEImxK8ugICVAv63/T7IdqThepo6JKg
 e5KIOJrKRh5z7VuMm/+vZfjl5Jm398dgJyaE5S0ukLiHdr/4v61m7Mzvr
 msZiMWnnw5cMuO8UIeTSPnS8eqAGJf9//685eIL303KDriDMtgJ8Y+DJV
 6FtoDYAYJvM4eswTOfLP/3m0cuK2dLBE7uREoTnTGfItqZuDhXW/sRc+d
 IoTFAU5w1UTcwT/YqGphpb65yGuHrOHulN+ldkfxx0+Eewj9Ns1b2XbMh
 eFNqvxDjMxS18KdetWzAoEAsVwqZoPgLEDhaeQHW6HNvowjLBxq95Z2Nv w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="969466"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="969466"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 10:53:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="795330025"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; d="scan'208";a="795330025"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Oct 2023 10:53:33 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 30 Oct 2023 10:53:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 30 Oct 2023 10:53:32 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 30 Oct 2023 10:53:32 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 30 Oct 2023 10:53:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E83MsTHxYp9Gsz4ruArkBdbEcixLrf/qpDycty67pP5VMDtXN4QU/0bnk9pw8rhegctd140juMZTIWBcu/wyQpDrF9bnAb028aCU/8wvu5Tj/q0ZjD1bsUHvBrc9vPdkn+Io8eDgk42AXauIxExGEkEYr27kB71JmbEvR0zo51+EupCTFORiwu9G/GlGs09Kx8/HsADXHH/g+9ZLT+bc8GPTpajxfkZwccZl9xYpcLn1hZBQhpK7wr2WZytjPFYeIxrJ2vlj+1PgMZzMEfhtxWy8pLyCZNXX8k8f2YfDYKODixzOk3EjkLsTcxK6pFHQrUTYZ+LJme+z+Gt+Foj4Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sc53KL1p3pQ2M67fLpiOJCEDYPrlYZJGd5e6iX++oSw=;
 b=UOKpodDgM+P8vg7+oNcM52Uya60quS54JHp5d8y+A5hjm8TYCa4GS69WzO4Z1O5T3ldxYPxwK5xMJMmbK/Z4kk1LsKmmWHhVVmyuJd6ES8sUVwQJEHtbc5NfWXb0TT0BO2mpMITyQeHMb5rWi79Lzp3B47mSjDKrhaZEIjXfRoo2kBnPiWr7M8F/ZYXa6wGVXxBx5pELeCtpXSc5GNAyiO2HEIl6FLMBEJHMp+/ek/p660isFVr4mQ1G5BaEEanpz5iNsjzZVO9Qavq9XUMwpwwSsMcPHgmFJY9PAG2BCC9eBg4COtKb+yA4mOZ91rJ+Jx77KYNlpD/8ye9cEZopYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.28; Mon, 30 Oct 2023 17:53:30 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f723:f4d9:c12a:5b62]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f723:f4d9:c12a:5b62%4]) with mapi id 15.20.6933.028; Mon, 30 Oct 2023
 17:53:30 +0000
Date: Mon, 30 Oct 2023 10:53:28 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>
Message-ID: <20231030175328.GA5757@mdroper-desk1.amr.corp.intel.com>
References: <20231030150756.1011777-1-shekhar.chauhan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231030150756.1011777-1-shekhar.chauhan@intel.com>
X-ClientProxiedBy: BYAPR01CA0020.prod.exchangelabs.com (2603:10b6:a02:80::33)
 To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DS0PR11MB8182:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d90cb4d-a86e-4db0-e05d-08dbd9712084
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bFKBQW6hrM7XBC0LI5LmprIbU4p31RxPa8Qh9on7Mw6KoFUx2xHIUlqcC/3Eia6KQxt+3r5SUtpbZCncOP7KvMUDu6yHYTIAxc837IZH7F0c/jEm30UhH/lsY2FxMhQ1bG1nKn6M787q+/sStrJbv8jXBgPK4cO+hu/rBdqgcoLDM2t9zbokcmW0yIuduVCNppvXzSBpdkmAGyDYXCqgL06jnV5a80pSUB50ROsvT+AovLoTnRz0GK7hWCwZlgBTQNsaUISm2Q+1k6TVNeuW7VDitYPZ6g+p/M1Q+PiNsPhbTmQCWOXvHVWakwzpO/JBdpccBlD+EHf6clOBB9pBU4hxNoSRTmqpcTXaWKVBdWOzrmWNrMISG5pkf7A+v/8QFXGUxLcxxJz97JdRJQwZDpaH90iGUgw/w0e3xVaHfeEjwh/V3e3XGK59P+ebTYxvXT7/EXMjnhf9J0AKoM9a0R3wDdT+UyWSl/xv6XUuIZ0v+wMcfCoYtOk0gPtm+aUbL+JkQIyIiZE4aIOdgvknDjXRV/feCvDwI2w5qCQxGc6VinLjhNKCij6GjtaBSz4e
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(396003)(136003)(376002)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(6862004)(4326008)(8676002)(8936002)(2906002)(82960400001)(6486002)(1076003)(26005)(33656002)(5660300002)(86362001)(478600001)(66556008)(66476007)(66946007)(6636002)(41300700001)(6512007)(6506007)(316002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RSugAmn3eWn1d4eXBHqALkmQ9p9fQzXKUZYSvwkNCAaM9jX0h9rN1noXDVZT?=
 =?us-ascii?Q?fLLEVemWrn+geEL5JWQ9N6I6x3wr/J2xjO+iM+Ry8u4UGWRlPvn+wFbrS1aj?=
 =?us-ascii?Q?INGuwkH/yiYR8UJOiSRH7GgIYNopH50gWy7sEz7i8NDDpo8sZ2SsMi4MdTJ1?=
 =?us-ascii?Q?sb7LSNOECdLZeq7mcWvI3o8ela0MYtxIvZUmhimFptWN+HcYO2dLxvaau4fx?=
 =?us-ascii?Q?GQHNm9Aojor68NVwNpcKR4iaaVAdpE6rXVxmPq87JgjIS3ODq1RtH4ATKuTs?=
 =?us-ascii?Q?S/DgQ48YJFrLSyWuRdRHSw/1ewFCWVQ4mtGGvTDcLK49A63onq8S+19Z/DKl?=
 =?us-ascii?Q?Z6w++uaxsN41/KtBbBNwz10uwfcGRrZ7bxMZLjuj6pFAEq3ESZ5MNFZf4LmN?=
 =?us-ascii?Q?Ik/cu33/3YXT8IGXH/msD2GFeOYH8JDhqPSoGHBmtBj1FiZPTUbK1mv5Kxtg?=
 =?us-ascii?Q?PkDPUTyKwJSC2kJM7ZhkeKvA/FVXfCaSlL8PJ11tcKaCsQaAwFUVfv0F1XQh?=
 =?us-ascii?Q?YE5iAwQlZ/Kg8/rBNmN1gBECS4v0rO0p/d2+SHacmH0pZIjkkGu2jHEJjbOc?=
 =?us-ascii?Q?Wv/2MYP6Ax+WnqaUToFO92hGg/PXZrHq2ihf6/vVci8mXmLiynG7GzWgg0gV?=
 =?us-ascii?Q?ZCZsz75K8VN3BdjAVYeYVT/ak8K5IYKL6htXrGkr+5V0ADDU/vvNUnT3zNNw?=
 =?us-ascii?Q?5/3xiXoYRFKEN3RYTaryxyqudbJgob5PuyZwEW14V8VfltU3MMliPR4a+Bgd?=
 =?us-ascii?Q?cxIhMB3HKVz9mu6hu4QwmQ0y6mE4nJe6KTAzMYX//TYimf/dxRooGNjTWH/m?=
 =?us-ascii?Q?7VDuTJBtScyFAmD0nwuVDe+V47IJ/gd/LJginnNALElDzrzKKurAVuiKT+wY?=
 =?us-ascii?Q?Mvj1UOfFJ/AWCUITLjjWoO2IoMr6yYgD28RiCKV85DM64G2SCsZt28MbssdX?=
 =?us-ascii?Q?7aUH300RAPqPDosd7bTGZg6QaphM+AdJYxHJVEknT1hszvOMDioItBd4HI+y?=
 =?us-ascii?Q?S39F0Cn2tA7BJmsldnNZGxcgTo3Q2IM2s3ljxBIBzA+QYkNMMxfXIh8cgiFA?=
 =?us-ascii?Q?o5smcBLjpSSkT38heCQj/RiuqyzZQqRzgavQR4v+XMywe+TDOHR7Mzfc234V?=
 =?us-ascii?Q?3g4fuwan4RBjx9uI6gve63urkdDwjctTUUv9MAglTDmzKzWpF2SQ1NXzcT9r?=
 =?us-ascii?Q?KRpXr/DHKGZbZfkEDocQVwtBiSD7mAqRSTQV5/oTh8XhJTNPSZr2twpR8qMv?=
 =?us-ascii?Q?uCAE/HM+YsUS4QOH5jdWpNejL5fkebnNJ+NP+cYUO3R17GoPFWustqsr/cyR?=
 =?us-ascii?Q?EH/rfJwezlB8kklJvjLSG5Fa+Wh/Lq9Uv3iwxk3JpO9x3L/IUGbKGO6wkIqf?=
 =?us-ascii?Q?2pIg1lYFDKcDsaeU0ts3/abWno700+du1AeUEWaWV7hX6yRsWWSkqKPZ4uFk?=
 =?us-ascii?Q?cDT87JLAUYMxsCUyPGvKC0SN7cWT+BxuBwKgM8IP81xmkqRligKIHJ4wzWTN?=
 =?us-ascii?Q?Ob2U+8VDwdyzsMgvypcGlS9k99i+vgVtE29vh8vBaLLZu95wAvKRKRYST2ua?=
 =?us-ascii?Q?v0aVTc7+YkK5vZS8EEgYmFSqC+Ip9eqM7lx1g05/8KN+ecg6uabGI5R2mxLD?=
 =?us-ascii?Q?oA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d90cb4d-a86e-4db0-e05d-08dbd9712084
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 17:53:30.4254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QX+n76d3+zZ65m3kIxE9OIFkfA6phP2ghjF3wCADuE8oWII2qAF0X+w6sfi4jaSW5zIj0TAzFiqavQ13ytd93ox9S9erVDC0Cs9Qs7xKe7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8182
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/xelpmp: Extend a workaround to Xe_LPM+
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

On Mon, Oct 30, 2023 at 08:37:56PM +0530, Shekhar Chauhan wrote:
> Add Xe_LPM+ support to an existing workaround.
> BSpec: 51762
> 
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

It might be best to give the workaround number rather than "a
workaround" in the headline, just so it's easier to track.  But we can
make that change while applying the patch; no need to re-send.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

and pushed to drm-xe-next.


Matt

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
>  drivers/gpu/drm/xe/xe_wa.c           | 7 +++++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index b00fe089525a..7a6407e38265 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -152,6 +152,7 @@
>  #define   POLYGON_TRIFAN_LINELOOP_DISABLE	REG_BIT(4)
>  
>  #define SQCNT1					XE_REG_MCR(0x8718)
> +#define XELPMP_SQCNT1				XE_REG(0x8718)
>  #define   ENFORCE_RAR				REG_BIT(23)
>  
>  #define XEHP_SQCM				XE_REG_MCR(0x8724)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index ce61609b001c..2f1782db267b 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -246,6 +246,13 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  	  XE_RTP_ACTIONS(SET(SQCNT1, ENFORCE_RAR))
>  	},
>  
> +	/* Xe_LPM+ */
> +
> +	{ XE_RTP_NAME("22016670082"),
> +	  XE_RTP_RULES(MEDIA_VERSION(1300)),
> +	  XE_RTP_ACTIONS(SET(XELPMP_SQCNT1, ENFORCE_RAR))
> +	},
> +
>  	/* Xe2_LPG */
>  
>  	{ XE_RTP_NAME("16020975621"),
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
