Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D0C2CD6E77
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 14:56:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD07410E505;
	Wed, 11 Oct 2023 14:56:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3FC510E505
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 14:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697036197; x=1728572197;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=R70qQDGUWzL/dYbChfaT6m63H9H4+1nwZCWSxCTevgc=;
 b=SJRiYaJkqcmyivJMT42BMFbGXMoBH3JGF+wf0s5c8sLEr6OLUtd/SWlQ
 ppuEjBlZbCozhVJ4xRzeY0Lq6CFASDn54QrFi7+LegFEjahBDxmSX85xg
 HvADFI745taavtFHAxHlFWeFpViHeFXV8ZZjEqRmHySQtOltozVSpq8qs
 pirVqGC+EzulPGoGJtByoBJonzEdkdT06iUy1WFhpmfLWRlgEBPhZNLxm
 qd87Nkn6wSmLOot7HBvTVBI+ytE5N6YYMw/B0LeP2+WJuSL/8rcTvWCqk
 1NtKdSj6tndFrLNP2riycPDDZLIK30/yU0ee0VsPYelQIBGEs3DFXXDYF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="448885411"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="448885411"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 07:56:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="747486592"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="747486592"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2023 07:56:25 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 07:56:24 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 07:56:24 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 11 Oct 2023 07:56:24 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 11 Oct 2023 07:56:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VLJv3MnlBsyEfFMOmPFrDxeMp7Q9epv6AsEX2XbJ9APQbqE0IKLxddPFBP2qr3d5ciokk6EkjU91ncGZA5BxAWQOrWuamwdyGjkrlvm0TH+a3aOp8BoqXKUtRC3kXSN55WdQbR+d5dALT8TPR40zmMhm8N0dRnzsldSwBcx+y8/iptjH2Q/R9yYNGBQTaDTCED4bOwi7faxithIm2FhreNYi3EDA0P2kZZx0ahQIpPinU5g0ZLSLH6kuAvMYzNGTauKPoXQWwbq4RBtR+hhtCfDkFQJO0mz+ieTfuUuisbsJy8x8VvYG0Fr1PQS3yGYjEApque0UsSa8Dom2oz0u6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbO3ULDq5ldsT93kQSTBycqgFPTy0nhUCh4wEzkIBT4=;
 b=nSFaduS2EwW/aruca6Zu5jRVUESUEyn+HplLtjHoZ/NzNWW0Wzg1t5pMX7Onf7qwyPqZtaHD9nNm+BErlTq4VwnbdxRSjICAjC7eDpyLLN5kafE7I1adkhgPAfo+5hzxRb9V/3/+FuRMwXykJ2lX/5rSaeKLgRVqTTNqcWNi00X7xlJhHup302bkIQwmayUIVCwsO13/GPy/APFZA81OADv3d20ec/JsbaeYnv9EZjhFrCNSZb6Z8ceUinWE7fnx3K2zMASCxjtAlt0I+skauOLQuWOkhJHNx+AodgHusDhxiVCFBp6xiNNto1fRMEbHhyDXSq3hBVf2Yy6lwTYtTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH7PR11MB7147.namprd11.prod.outlook.com (2603:10b6:510:1ee::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Wed, 11 Oct
 2023 14:56:20 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f957:c15a:9c34:71db]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f957:c15a:9c34:71db%3]) with mapi id 15.20.6863.032; Wed, 11 Oct 2023
 14:56:19 +0000
Date: Wed, 11 Oct 2023 07:56:14 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <20231011145614.GD21382@mdroper-desk1.amr.corp.intel.com>
References: <20231011135926.7-1-francois.dugast@intel.com>
 <20231011135926.7-14-francois.dugast@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231011135926.7-14-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR13CA0209.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::34) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH7PR11MB7147:EE_
X-MS-Office365-Filtering-Correlation-Id: 39c59c37-b529-4b3a-32a6-08dbca6a3a05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o8CWjipcqP6YOAPE3bLOU/uYwGg/W1mmc59E6xsovXn2+BFC5rQgJM+KIqy6+KzBRGNbcD1sra4K/OXB348PHH4F5PA/G7JIvTQDBcgKUBDaTc/iqEl2FfDtl5chWoCuZMtaE/hgxSYyzhHoRjaQ89h3iLof814Y4OOwfz1HvNqv/pxlWNNDTgRJOGfl7TOFASIveZNprL8MincMoL7ob7DAMLeiOl787NE5/WeHAFzCPismmxeDAktRP0d28YO7aLaumLCM2BGIAKnQV4jOomxb1GsiMZ+TjNwNOZt6CPs2tSWyfYuiUDk/yLLE84wSl22xLKM/hPYCZLywUQhw6KDSJeI2iIUozSvzozAN6d8HESZwK05ApMRHdNQd9ikOevmPpxObOcyNFjtFJToNZpVaKKulCESgUeL3dENSOdAZDKBRMFsFnuKn7tKxGICSL65K3QCEb9paK/S5/8gYkajbJuZgKdZvigANtnQy4gFqU6V5qB1NswLcQPU6AKEv6+wMeTx5MULVx8cd3+kuTB27TN5gY13Xq1mYWC1uE/nVCwmGVZJlWak6pz/3Fbow
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(346002)(136003)(396003)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(82960400001)(107886003)(1076003)(6512007)(6666004)(6506007)(66476007)(478600001)(26005)(83380400001)(2906002)(66556008)(66946007)(8676002)(316002)(54906003)(6862004)(4326008)(41300700001)(8936002)(5660300002)(38100700002)(86362001)(33656002)(6636002)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1+PcSPy1LSXlwKTm8muB3vylDuTf+lhpYuXurZsULwRNPX1U/TqHudzVVd?=
 =?iso-8859-1?Q?uACS2ulkWQQR9Mt8keSpb79n2Htpg3BO8O6t151MpjhYo5qZUaFYFlcO7n?=
 =?iso-8859-1?Q?QhQTVIvGBEfeNEIZl+NApxcfuue48gT5AcVQvnhdJ/AHs/218b3to+GiUH?=
 =?iso-8859-1?Q?XiYXHMT5uTvozkgVH+xnYBEWTPu7g2Me4KXRSzApgFqdVM3QSvwv7M4YHr?=
 =?iso-8859-1?Q?tVqk72mpfwvDHTzUJWvhYC8TrSmSLKb2fRm5M0P3k8H/a/Guw7wSmR0IC0?=
 =?iso-8859-1?Q?8aEPNi6EWFrNQeWRyEN66HhdKc4+fm15G7JpEkyBgjkt8yAaCjjwsYuXmE?=
 =?iso-8859-1?Q?Sx+3jcErqXSYrU3V/vvQcE6EwjFKr0/XaSTsmaLPBGUbfjqnKXHGgwUisJ?=
 =?iso-8859-1?Q?8UzHaTTWd3+liEhv8HF4Y1LlBwHlX+4Z/1ZFrvq/aRMhqFS1ayW1mfVEhv?=
 =?iso-8859-1?Q?regd5Q5sWtCyMwxMWoMZxSqeLwVSHS4m1t33aTveNYDrUjTG9R1bR1f+WW?=
 =?iso-8859-1?Q?LveuNNQuZiowhmY44bC6hPoa9eik12j616WQjCTzjIdjQpP5XHdMdAiM+a?=
 =?iso-8859-1?Q?M4UUif5ZxMJcPGT7vqn+5fye8XMTQvo6he3+cUA2jTwxc26mhTbaMw+aiY?=
 =?iso-8859-1?Q?zABGl59YXHJ5s+YTZMEZiQMtiUY+x9GfDXA8DIYBusJTkN7iCbl619MTA1?=
 =?iso-8859-1?Q?ndqSATwpiOGXi6LMSKCUB8FbK1HR/KrUFYmKNmysmsP2yNqbgLjdOWk3IF?=
 =?iso-8859-1?Q?yXdvfBkrPqmOhjJ01gnBYFicE7h/BadxNr2ni3iAc51SoK5MdEYjw9s2cb?=
 =?iso-8859-1?Q?ZKjSzkpR98tfUZKCrD79Luy5jDxAVvtOj2FoTLCuzW9sp1xPHa9xXwNBrN?=
 =?iso-8859-1?Q?izoAV2u6A8rg9/l+RtIcuOjH9bm7eHmlaIIOxDqeCYktrK3ry6niFf7+LR?=
 =?iso-8859-1?Q?dYVbzb5nOFqCRPQnG9YgMMKUvDrxHF1lmfNG8fiMxCh7ylh6FVtVX703+M?=
 =?iso-8859-1?Q?v6GE+W80jFbzFkG6X8MILKd+ZxlmY1vpH0tXrddBANcBBpIce2OsaskNmt?=
 =?iso-8859-1?Q?5AadKoGfG6FFAeza5qFFMKo+TE/bRX0+Hw35szOmYXqOOq1W1PvURz23fW?=
 =?iso-8859-1?Q?E2TISUXWpofau6Q93tz9csNRtFSanlKbnTVg0688y3LuuMwBSswxcxcSv4?=
 =?iso-8859-1?Q?0grm/2nJNmIljEgtrUHzLWkzhkTPfsphyXmfGaUb61HvGJ6V1iMnzLVnwX?=
 =?iso-8859-1?Q?n2xs92urUY1GGrNWocirlqVmm6cIhqxvIIu0zqkEg78/ezHrq9mhSxoYiO?=
 =?iso-8859-1?Q?2PDgtGLYLalH2KejfqklXVg5C9cH6Q6oZLIjYxP7Uo+oIaDTjhUU1nnjxq?=
 =?iso-8859-1?Q?5w/SE6z7Z47TYIWTzkGcwBztk3+HA5m6dqtQTWRB1DQbvWB0XKRJaLgL31?=
 =?iso-8859-1?Q?7lFgLifk5x7Uf2exyqaOIlU69bDlI1bv5bhKIxbPbTTOAtZInV26gVeKaj?=
 =?iso-8859-1?Q?mrYD6aJv8LXma4Z549IzUamaP1MBz0124hjuC6qbisCjM8se39pehqd6Pf?=
 =?iso-8859-1?Q?ipoTuNAa8ehPjZSWMsCxWuBO1zCa37rEihs54sjpPAt1j5lkusnP5WbDW1?=
 =?iso-8859-1?Q?LceefQnnrSocNp7MwrodDlP/U7xXgXyOkDXwOpp+VVhUUTKhsdiRZDLQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39c59c37-b529-4b3a-32a6-08dbca6a3a05
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 14:56:19.3288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3vqxCg3viaJNLozTZOBUML74a73opef2QYhxT8BbitVYx70Jpgs/CaS9Q6/CX0WCbhuc6Fsi2B86s22IgLVEVOT5TQlm8zNZx7JIEKg0MbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7147
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC v1 13/17] drm/xe/uapi: Remove GT_TYPE_REMOTE
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
Cc: Carl Zhang <carl.zhang@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Oct 11, 2023 at 01:59:22PM +0000, Francois Dugast wrote:
> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> With the split between tile and gt, this is currently unused.
> Also it is bringing confusion because main vs remote would be
> more a concept of the tile itself and not about GT.
> 
> So, the MAIN one is the traditional GT used for every operation
> in older platforms, and for render/graphics and compute on platforms
> that contains the stand-alone Media GT.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Carl Zhang <carl.zhang@intel.com>
> Cc: José Roberto de Souza <jose.souza@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_query.c | 2 --
>  include/uapi/drm/xe_drm.h     | 5 ++---
>  2 files changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 063a224492eb..c5196abbd15d 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -375,8 +375,6 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
>  	for_each_gt(gt, xe, id) {
>  		if (xe_gt_is_media_type(gt))
>  			gt_list->gt_list[id].type = DRM_XE_QUERY_GT_TYPE_MEDIA;
> -		else if (gt_to_tile(gt)->id > 0)
> -			gt_list->gt_list[id].type = DRM_XE_QUERY_GT_TYPE_REMOTE;
>  		else
>  			gt_list->gt_list[id].type = DRM_XE_QUERY_GT_TYPE_MAIN;
>  		gt_list->gt_list[id].gt_id = gt->info.id;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 2c5bf02c9b0b..2008a7e61178 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -376,9 +376,8 @@ struct drm_xe_query_config {
>   */
>  struct drm_xe_query_gt {
>  #define DRM_XE_QUERY_GT_TYPE_MAIN		0
> -#define DRM_XE_QUERY_GT_TYPE_REMOTE		1
> -#define DRM_XE_QUERY_GT_TYPE_MEDIA		2
> -	/** @type: GT type: Main, Remote, or Media */
> +#define DRM_XE_QUERY_GT_TYPE_MEDIA		1
> +	/** @type: GT type: Main or Media */
>  	__u16 type;
>  	/** @gt_id: Unique ID of this GT within the PCI Device */
>  	__u16 gt_id;
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
