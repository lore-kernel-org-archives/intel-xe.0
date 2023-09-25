Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5DB5CE79A7
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 23:42:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7719710E260;
	Mon, 25 Sep 2023 23:42:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A82C10E260
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 23:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695685331; x=1727221331;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KJpm5cJf3k9EtOsGiTeDJvk3ao5AoUkTnYioeTJkpJI=;
 b=S8bSUtytEz/ERd5ONsu+kl+lmRMTvcMB3Rnjm9XRbPTMR7jkQPk4c+XW
 eIAV76TwzOjtq1vknKYgten6PRbHQWTSISxkzGGg/8Zpdndzfj6FvDLaK
 5LWOLo6I5K1sWDmd02GfN556iDmkDY8qQ6xKsGG//xo01Ra3qUUXKXbfJ
 vlIvc1Le9kHNuAsQ+2c0GlCoRiXkh71zEZv/eyEVv6NhnvHp7hdZRxmqq
 q+LOPmGJkqK1OVf4qAI2R93v+OY9aHQYsXHBBwTdS9i2MR+Ltu1sBc4LY
 qlSOLjD1k94hY6gymJPBwbgUcMfaSZReSGFe63lXIOgBewESGSaCVbAlb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="380306755"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; d="scan'208";a="380306755"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 16:42:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="838779112"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; d="scan'208";a="838779112"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2023 16:42:10 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 16:42:09 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 16:42:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 25 Sep 2023 16:42:09 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 25 Sep 2023 16:42:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xou0u8wozQZecA1Iqiul6H2/cRtYT21IFAndQx/1gd7e37O07Ll0ZfvVbk2AHmZcXyxfDPvZjco72RxwQ2IJDBp9jmC3fC+3ichuh8sbaMPE3Kmme1JSTDBZwnyhJPvuTeWGPA0fWHk21OQ/TPBpt8Q9cZdJ/MbxSiwjsTIB8Eedztgrj3vRG6tIjk3YHBybWVHAge/B0wUKbMi2TDJyF+P6ZxPT0ItcCuFy/PBvn/tpmcPp09hLs2YSUBVVN+1I9D+ZiZBgXccwi5SpOcBY/gd+H/AVPYX2XMGxGg/nf2NUn0qA6uDOrTMz51tFJLtUOs2BEAas3haJLwCILY293A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QTMB4YJ0NzhzvGoW9ZT8v181UM05DLHYrjfkPAGCSRQ=;
 b=GOVoFRFLlJ1W55anbqyArRB88hzpGrjiUCIsUV5FkDQK3jG205GCqjx0cYNvCnmbJnNlI78ZPlExZHXlfNkMPHpEgEHY3CH2IL4WcsuBnLzVyo9i6zrWzABSxDX6YyY7wr3rin9v6tQqRPdLX+K2mXwOSKwcQQ8hmKuWjw5Hj2+VAcg+6l+Fg4z3olXPKl0JzlYfDktMiNX6Zgjymk/r10Av7Wb2hqvRJGZKEwqHJwmdI6s6J9rnKIvzyDF78LELG4Yrn+4dRLcrCvNBPInAJKqlDZQ2xhwkTAHtpBB19ctlLNPmzx7ka35gT/8ZI8ZgMb7yKD87qJilgDMTC5gxuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA1PR11MB8278.namprd11.prod.outlook.com (2603:10b6:806:25b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Mon, 25 Sep
 2023 23:42:07 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Mon, 25 Sep 2023
 23:42:07 +0000
Date: Mon, 25 Sep 2023 16:42:04 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230925234201.GF2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230925221049.2681491-1-lucas.demarchi@intel.com>
 <20230925221049.2681491-10-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230925221049.2681491-10-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0182.namprd05.prod.outlook.com
 (2603:10b6:a03:330::7) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA1PR11MB8278:EE_
X-MS-Office365-Filtering-Correlation-Id: 510353b5-b9d2-4ef4-890f-08dbbe21075e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8UW2mwfSI4yFQY7cyEINBzG3dRkXeOmwujcL8stS3u/pLb+iH9ScErfGVxVv2NKmKLn3K8AKrR83yxqmORK3VLaTGc+eArsBfrhtUZYkAL/eZeCd7YClEclRcN3/FHusfl1+HAUjcbIPDrg7PDCN10/iuuyNpU1mrDFJ1gPHOKvEI/w6hGOFY6bisHiI/0i/pm3stTdBl+L3qdtOY2esT4fVcSlAofoBXpwu9R2GmlP2j9RRDSqKrl4qGowm9mWgLxmG/4QikKqEjQ1GMS5ZkcAoOvDj0MAutU9qg+CgNMMYguSZdtLGYOCgOHZPkc+cH4vH79dJcnN4FFBJxplolf4EGewWDcWcQEn4Bjw/0A4wSkCeAdP2eO7R8T7NFItCQ3tuFsA71ADNn+aE4AkRPmf26tucHoOG15bZ/sPtwUe+vy4nmgF/bXII+s570N/yS7rL9nbxM4bRtKuNn2UR+UHqLPwvxzVEOyCq2HD3M8T+yc5UIrQNzFFunFtb3Y+k4TOeSTMBZ9uaeaJhRG8ZpITYWnGLHOEyLCn1UnHfJi83gGRzT7P0AN/Ja20zGnSt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(376002)(346002)(396003)(230922051799003)(451199024)(186009)(1800799009)(2906002)(5660300002)(4326008)(6862004)(8936002)(41300700001)(8676002)(6636002)(66476007)(316002)(66946007)(66556008)(478600001)(6666004)(6486002)(6512007)(107886003)(1076003)(26005)(6506007)(83380400001)(82960400001)(86362001)(38100700002)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?31yKqPoWjRbszByrH/CmtDuv6Ja4aTWkNiC2MWAvRb/13F6JZ8wqEOOokUlA?=
 =?us-ascii?Q?yi8LT+VaFZeXEut3lOAtFT+iVYSbYHSQbmbnYaMDjDUUOhg+M2/aFUOfufwr?=
 =?us-ascii?Q?BvHjCHr5UNfQBmMh8gY1SrgpXoWqi44Df8tHkjGlXMSVcVx2rnDFmCjE5sHF?=
 =?us-ascii?Q?aEG7KBYCv3SMxVqo8XQvDRGPyAltcOlLleCaNkm1qxElkqiTsZFlslfRo26j?=
 =?us-ascii?Q?agNSzxyyOeWX4ksDXzU6Iptkb/vB29UfHjRkxGywcfklc9Q266IYkBGyW6NW?=
 =?us-ascii?Q?5zTTNtqhxTuKckeNyrTc+w//PPrXcAuK4RP1JgYQ+Dy+Im/3zy3nlTM+n3FT?=
 =?us-ascii?Q?gR54bUj7YB9B3Rbrw3PRs++C+OzrrYW/2nALY+4lDvPsP/2Ui5giTdSHph9R?=
 =?us-ascii?Q?e76mpQ2X11sa56lUNW8jMuvt7J9J5Yu1wSiz8fuZe9xbATIC3BaaIlPO9WCL?=
 =?us-ascii?Q?UJ1huHracEpV+g8rP/ap8js6/WOwx3JRx/JdAxBEDORVdK7QfVOtpIfL4OUw?=
 =?us-ascii?Q?vdMrtDTQzJ8JZLx1NLPNLm3By9IVSaLEWo/eZvgxJrnsqSHdLE70eNMsC2SI?=
 =?us-ascii?Q?GXSiQl8TapjLDPE7Im6ipjxsMTEcvmmBzwbboEfOrlw5QC/narEsAPY7uVTQ?=
 =?us-ascii?Q?ch3JXW2+aHAWh/94wyCTW3v3a7TJ454GGz5PCzT987Da4SDYZLthgGfWMbJv?=
 =?us-ascii?Q?nmaMH54MQpgjzsRbftC86x9pYFx0hITy+Kdy01bJTu7qt9VJWeKo+99Te662?=
 =?us-ascii?Q?2fkxe1IudfGDinYqEEke2A4qQDE2lRNGxh15KEwg9TOXEiIvM9QUTOLkaFUD?=
 =?us-ascii?Q?Op9kt4jfc8PIzpJJr7z0leeNgbWvgdSVXX/jm3WOsuYTjt8Wc5TCPlaqjSqz?=
 =?us-ascii?Q?N9Qw8CnHiiXDsLlA+NSxuLroHvQ7U3qCnAI0PViRgoQHyL4E9C6NovRTJxDi?=
 =?us-ascii?Q?wq9eaVVJkzKeZlYioKwH0I+FyghitEkddIUZsznoBbb9bET4+IvxJTXpANeS?=
 =?us-ascii?Q?DlC3qYLafue2nlbSdRN0RGWaZ7hSEizlpyK2lh2rYZxlA9zXV5DLnKVpfu5m?=
 =?us-ascii?Q?fy/Akr8om73vk27N9cHpkFwtCnfRdqwtLSGvEPm9eda3zNwJncVC3dpM1PVb?=
 =?us-ascii?Q?MTTOpoHFwH9GhN8heIMY03d6xCla1Od8pJaIq+WAqPCZrhUSlFGExk9nHUVn?=
 =?us-ascii?Q?bNkqwaqk4E8RqEVOlEpAK9MqSZNH6Txu0SsTaGSlgNaOj3MeAQKJVU1Hv8ux?=
 =?us-ascii?Q?g6U8UV+jjbF46MGZiqBWsvdKKTgmWhGvVtug4NMiO1jafS41F1t35V8LCoq1?=
 =?us-ascii?Q?ypUTUjwJsjKb3cTmWBTTH5bwIKFaksLrglqY3y5DjMlxfEbtSlmSpVsNcdIh?=
 =?us-ascii?Q?GBZytZ/lIEnpUDXLHMBygaz7hdJIq30eyOxTwLRCjLXLzHDSA1ICUnHwEiEM?=
 =?us-ascii?Q?sII778GznVOZL1+imLMnDvtL7mEvXJD/JfRtYM2eJVlZfuBCbhnxVuSvB73x?=
 =?us-ascii?Q?VQsK0l1HNAAfLm9XXcoe2dyiuzTCskdShAV4UeCYQgURNtR5lHgbW6hEde+Y?=
 =?us-ascii?Q?LdmfGCU2X/CQcJwyhAqhQeT10VJZDdSILBhzziShfXb2RMEC1l9zJzg6q7gU?=
 =?us-ascii?Q?uQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 510353b5-b9d2-4ef4-890f-08dbbe21075e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 23:42:07.1589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vv0H0XVGFwep5jaec8jJWzJEtKfRTpuW207gXXfdQbRERxw0Pdmn+figx88eNAzKp6P6T6zRuy3NvOi4qQMlaXFFvuPX0PallKHHAQKaO44=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8278
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 9/9] fixup! drm/xe/display: Implement display
 support
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

On Mon, Sep 25, 2023 at 03:10:49PM -0700, Lucas De Marchi wrote:
> Fix build break due to previous commit. Squash on "Implement display
> support" to be moved above the previous commit.

I know Matt Auld's series is going to come through and replace all the
hardcoded cache settings with the proper PAT index for whatever object
we're operating on, but for the time being should we at least switch the
hardcoding in this patch to be CACHE_WT rather than CACHE_WB?  Since
display is never coherent (regardless of the platform's CPU<->GT
coherency behavior), WB would pretty much always be the wrong thing for
surfaces that we're mapping into a DPT.


Matt

> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 32 ++++++++++++++++++--------
>  1 file changed, 23 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index 3422942a9951..b7a04fba3585 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -17,7 +17,10 @@ static void
>  write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_ofs,
>  		  u32 width, u32 height, u32 src_stride, u32 dst_stride)
>  {
> +	struct xe_device *xe = xe_bo_device(bo);
> +	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
>  	u32 column, row;
> +
>  	/* TODO: Maybe rewrite so we can traverse the bo addresses sequentially,
>  	 * by writing dpt/ggtt in a different order?
>  	 */
> @@ -26,8 +29,10 @@ write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_
>  		u32 src_idx = src_stride * (height - 1) + column + bo_ofs;
>  
>  		for (row = 0; row < height; row++) {
> -			iosys_map_wr(map, *dpt_ofs, u64,
> -				     xe_ggtt_pte_encode(bo, src_idx * XE_PAGE_SIZE));
> +			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
> +							      XE_CACHE_WB);
> +
> +			iosys_map_wr(map, *dpt_ofs, u64, pte);
>  			*dpt_ofs += 8;
>  			src_idx -= src_stride;
>  		}
> @@ -46,6 +51,7 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
>  {
>  	struct xe_device *xe = to_xe_device(fb->base.dev);
>  	struct xe_tile *tile0 = xe_device_get_root_tile(xe);
> +	struct xe_ggtt *ggtt = tile0->mem.ggtt;
>  	struct xe_bo *bo = intel_fb_obj(&fb->base), *dpt;
>  	u32 dpt_size, size = bo->ttm.base.size;
>  
> @@ -76,9 +82,12 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
>  	if (view->type == I915_GTT_VIEW_NORMAL) {
>  		u32 x;
>  
> -		for (x = 0; x < size / XE_PAGE_SIZE; x++)
> -			iosys_map_wr(&dpt->vmap, x * 8, u64,
> -				     xe_ggtt_pte_encode(bo, x * XE_PAGE_SIZE));
> +		for (x = 0; x < size / XE_PAGE_SIZE; x++) {
> +			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, x * XE_PAGE_SIZE,
> +							      XE_CACHE_WB);
> +
> +			iosys_map_wr(&dpt->vmap, x * 8, u64, pte);
> +		}
>  	} else {
>  		const struct intel_rotation_info *rot_info = &view->rotated;
>  		u32 i, dpt_ofs = 0;
> @@ -107,8 +116,10 @@ write_ggtt_rotated(struct xe_bo *bo, struct xe_ggtt *ggtt, u32 *ggtt_ofs, u32 bo
>  		u32 src_idx = src_stride * (height - 1) + column + bo_ofs;
>  
>  		for (row = 0; row < height; row++) {
> -			xe_ggtt_set_pte(ggtt, *ggtt_ofs,
> -					xe_ggtt_pte_encode(bo, src_idx * XE_PAGE_SIZE));
> +			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
> +							      XE_CACHE_WB);
> +
> +			xe_ggtt_set_pte(ggtt, *ggtt_ofs, pte);
>  			*ggtt_ofs += XE_PAGE_SIZE;
>  			src_idx -= src_stride;
>  		}
> @@ -150,8 +161,11 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
>  		if (ret)
>  			goto out_unlock;
>  
> -		for (x = 0; x < size; x += XE_PAGE_SIZE)
> -			xe_ggtt_set_pte(ggtt, vma->node.start + x, xe_ggtt_pte_encode(bo, x));
> +		for (x = 0; x < size; x += XE_PAGE_SIZE) {
> +			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, x, XE_CACHE_WB);
> +
> +			xe_ggtt_set_pte(ggtt, vma->node.start + x, pte);
> +		}
>  	} else {
>  		u32 i, ggtt_ofs;
>  		const struct intel_rotation_info *rot_info = &view->rotated;
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
