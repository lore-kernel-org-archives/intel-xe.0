Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3139DC636CC
	for <intel-xe@archiver.kernel.org>; Tue, 31 Jan 2023 19:04:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7CFB10E3A4;
	Tue, 31 Jan 2023 19:04:09 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A91BB10E39D
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Jan 2023 19:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675191847; x=1706727847;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=6QtjHGmX8pARPr0easHzXPtNKXT3DNiMFdx4GG/45nA=;
 b=d/yDiDbQeXFk1GjFwAa6Jz9CsSlm3Te3rb++SmpvUUxMjy518c72eDjV
 754CFqBHyUIcwPTDM3XPy6+31j9uWC3dKUvrMbiOZkztlcc/BClh+aJgX
 NeV3AGPmq0j/C81QB9VfiAnhQwkB2OUUuoL8ihBskHaAo6ucIGnI8kM0Q
 Rg5bSG88HpGySA6uqPQ8z57BCZLFFDWsR17efDzM+yOwbTQ7vWPRn2yGM
 rsikRimwRYTnWjx8jj7TxJClBbBEmXIhMZsb6754o+24vK1drVPoAq23V
 Mw0K0ZyUzoIW4Z4KOLI2cnkeC13IK6gNh+jAa83FNDoW2ybytmDmJl05a g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="311549806"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="311549806"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 11:04:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="993384644"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="993384644"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 31 Jan 2023 11:04:01 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 31 Jan 2023 11:04:01 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 31 Jan 2023 11:04:01 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 31 Jan 2023 11:04:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XB/LQT9v681kXpzzXcZPeZ/8UMAeOMz44+9+ejNys3YfUavF31wqp04XlvyCrhqLcfxjE8fAUfKA/232nm9VYmyHDjrM3nr3SZu2/lpIv0vD7HsjDFA7Y/rVurPYWRI+FnZ0MOE3Ye4fYSRS0d5lkSIt0kWgKfA6dLLtavbxDeAo5bOMUj1WTgYeSvD7W49RdGoKLE3p9yFio/cEuqzmF/b0LaG84UmmJI4jIen2AhmdUun0BAH+x7nYkABk3qYYklkIbO/KTH6V6VwR1aKwbiVnOe05k2y6hsRNSQDZYa3St9e5420Fi0EWvxdEWyISs56wySWikLrM+gxIxHUudQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=57zVbzQDG10YJfUmUtPEvf0VAWf6PTJdlxp/hA7r8JE=;
 b=KY3+9XFMKlFp4IjM+PYLrL10WNAtfAgwpBKXmGa7H4AwvxEHdPkU777UevnLhr7qA4ZroemXQogi7Gc4VJuMEvOCPAMU9Oht+Qx0iwtSpzPlKSHdcMIgz2eTqDfOt+7Kn08zToMZLDq/uZ2FUzLnlJT0Bzgb30gqEhIXmHuXaTRsaQ69IGan6zAh+d/44GiW3+n7+Vi98vbpCExfiG6tCy7iBZtjQGG7V4GHLDcK7A2ZxewiQiRQzl+kutayZx2wc2VUy+Jd/TBuLLDdVZJaGtB9w72uEqV3rpro8C/70jabRDPdk4RNCnyxF9OtvBzHSYZeu+dohgwyFwuSuuEnPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by SN7PR11MB7604.namprd11.prod.outlook.com (2603:10b6:806:343::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 19:03:59 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::d12:2d58:992c:aa50]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::d12:2d58:992c:aa50%4]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 19:03:59 +0000
Date: Tue, 31 Jan 2023 14:03:55 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <maarten.lankhorst@linux.intel.com>, <philippe.lecluse@intel.com>,
 <mchehab@kernel.org>
Message-ID: <Y9lmGy6PtzHkYlTA@intel.com>
References: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
 <20230112222538.2000142-30-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230112222538.2000142-30-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BYAPR06CA0019.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::32) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|SN7PR11MB7604:EE_
X-MS-Office365-Filtering-Correlation-Id: ed0824d7-4c74-4339-e59c-08db03bde86a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ALK6G9uj/b1xER42MpBGwdqzUyVguk3w5HfhLPehfp0susTL+tEdfnjIzACXrIHOJFPL0ercRRsHe88hegaEuwlfz4g04tEvEl0Xm/yTDkx7rpkqG5gFDjLjSa8MJhZkkBY1r3MenkXtAzQ/FQvo36d89b7vOYX3yfv9nK/jIBDtmGHQ8swhl9DotG8GXK8a8oKi2/5SgVIgd/IA0AURqLdGDgkTy6J1j4PvrE4xon+GM84nad0mmoiqTRx3xm1ZHOFa1yl6Exsb/IN5+BxhtG0gVg94iTcAa8Bwm8AHsbGKKJatSI0IvuEeH7QjqpIdYscu50sTEc1GlD5ef7GO2l65aq8qaq9yu89ISMNiN2NgOr1xsekQbnfSBKLZRaagRn1xEgg4iqZlc98yBJkvLgpnR6r/7CeKhNCnzU9AtHf9gw7bLHnf+nYWRHsypTgDcUfncnCs0pv3a2zzy2FrTU6tcUlMhJP1Rr8RATwn3IDVlbN9/C7LCn7XQVmctkmUWLTQXseiGkznUE8U3SchNfPcyVsf2yuGlbFa19Tvu7XbcYYMUKHS0aCqmmLdfuHyLIkZPVBlucyABp0uP3+y37dTdjFbrL9WthE24e4z01wIcPabVy71C05BZZd/JRcgyCchVkYWIJFWhd88cyQllSO4YyEIJifVt90KHru+2LksbqjPucSbvbfBVnSpBkoJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(366004)(346002)(136003)(39860400002)(451199018)(41300700001)(66476007)(8676002)(8936002)(316002)(66946007)(66556008)(6666004)(5660300002)(6486002)(44832011)(83380400001)(36756003)(26005)(2906002)(6512007)(478600001)(186003)(6506007)(2616005)(86362001)(82960400001)(38100700002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kzAWlMNV2m+tMJUA2NNZlLXkPQSO1aTxMYE7Gvo8B8JyhQAva9S3j/agZgCh?=
 =?us-ascii?Q?CnWw2uPzzhvt9YnLdOQBgfN0/m82IuL036loUbhQIQ38tQfAb+hjzUIzDS+i?=
 =?us-ascii?Q?/ljcVGxaPRpIFDiWc9Dlw+CU2GlkUJ73WQUAsvjAoHoi5s6+soaWQnAhUkLl?=
 =?us-ascii?Q?c0Wi0CQA49dBjEVXoSCCyqLvmyxVlNTpHC00lREwEZoartoKMkCdxW2xuNSU?=
 =?us-ascii?Q?HsKzNZKtLwKlctXv+HxeBHh4Ykap1hnMy9CDsC6YWpA1M6ZEAronk0MnHLqy?=
 =?us-ascii?Q?777F+02epxtOhYYk/022raZiya+FS4qL5YBMM/Ss9J/KOi6i1FSYcHweYNsv?=
 =?us-ascii?Q?slQ1wA/SQWbA5XJ7FwNXq8cjmbzrIlDhrtWYARJVh4fKvYPFUGnKLTBcsMJD?=
 =?us-ascii?Q?F8ruameSkoevUsMR2vwkUHqy3RyPF5eFXJDqk23NbDfs6guWIuBBrREnaaPc?=
 =?us-ascii?Q?ZCUuPviRb0qt6Z1bKH6KjGBofu4qu2UA1A9XszvebLE2YQ+BHZSkVmgP+lv4?=
 =?us-ascii?Q?0OYI4h8uT6c8fAJHKr6/ubnUF7BDw9KWHiRG46AxRDUA0WSSyuyMfQ8AbH26?=
 =?us-ascii?Q?Dpif2Le/DUrfROIjoafPm3Cx0SiQyU+giii1TKvGfKW+MQiqmroOThVMFm38?=
 =?us-ascii?Q?p6P8hHA9vfI8iVWISSYObtj2XO85YCGtOKHPvRQZL+RO6OduRG3pxC6bm2aK?=
 =?us-ascii?Q?aj1WoPG4g6K9Lu55NvkVXIOFoQl2V27dHxIQfT3xMw0/D3FUQC+jhqWl++gY?=
 =?us-ascii?Q?QW2yECQ0cYcYtRZx6JVbT5HF46yR6vs7dzwh7oKqxzZM1k4PEkNwA27ICcLf?=
 =?us-ascii?Q?jkPv7SYjDVTuTOrTUlxqdZmLMOnJwcHssp8Pi1guS3+E8aVwju/jXD/m81ZG?=
 =?us-ascii?Q?V8l4q0Jo9E2hb7gcptowY9rY+6XUWp72+hV3yppl8sle66olqMJzs3gEGM20?=
 =?us-ascii?Q?5IugVvBSoEnXyBX7BXSi5uGnWviKLrI4d0IImqQ4/muhhVeKmtFRDPWLL9KI?=
 =?us-ascii?Q?rlhrBVFrdxj/fIqHI+o6wRPN6bSf6PXQZdoHkn2VRGr7Z4f/Hy7ur73R1Y/x?=
 =?us-ascii?Q?bOiR/Z0NMylfc5oJ4zJ06SPUL6ymbV83mDKFyQzzvt5Q9imd0pnJ5lOriiD9?=
 =?us-ascii?Q?sPki4qhmIGcnFe45nLIbBNPnODOpPWDww0G2jZRvdG0+a27uaylExJBXhwqq?=
 =?us-ascii?Q?kQ5SLUm0gOnR2KJbPy73EkWOtXpxp1upbOwzGTpkpyVWlBMaNSxNua/WdRoz?=
 =?us-ascii?Q?cBHW0qu8KE2SSHPD5pqbJaEJFOv8hjqcXqWbT6prqMXA5owVoy4NTo3A8lLj?=
 =?us-ascii?Q?cNL+q76iDK/1rLwZoCEvXiXLmiolnzpsHdyhWY/hcV2832astcEG7RcFoPKA?=
 =?us-ascii?Q?bWw1oDMoCK4xIf/qdqQtBkQwnKpIZSF6dpdTSfn+KvIzuB5Nn3rpF/iOObnG?=
 =?us-ascii?Q?4vgaEZ1CotJVtrPquytUHj5xRnPuwRccgOt1Ab7tlZg8HSVPUXFPUaVAVKAk?=
 =?us-ascii?Q?mEJepbZTq0/huvMEvw7ipmpB3/WOtuFsccAc2GHxjpz6vrjLLpliLHgdrpZa?=
 =?us-ascii?Q?IEBGQVWZkqJy0OLExSxUPO4wJMsSuMJ5qNFm1CNhXfKg1x3Kg/5WHWk/f23K?=
 =?us-ascii?Q?rA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed0824d7-4c74-4339-e59c-08db03bde86a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 19:03:58.9047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LdFe/j/TvvMNUOitlfzOws+Tw1donTjAt1KZ4oyjH0FLNEPFqq37PdDhGmj05R6EFcP0VUoTxGOpfh4GEPXPiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7604
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 29/37] drm/xe: Fake pulling
 gt->info.engine_mask from hwconfig blob
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

On Thu, Jan 12, 2023 at 05:25:30PM -0500, Rodrigo Vivi wrote:
> From: Matthew Brost <matthew.brost@intel.com>
> 
> The blob doesn't fully support this yet, so fake for now to ensure our
> driver load order is correct.
> 
> Once the blob supports pulling gt->info.engine_mask from the blob, this
> patch can be removed.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt.c       | 3 +++
>  drivers/gpu/drm/xe/xe_gt_types.h | 6 ++++++
>  drivers/gpu/drm/xe/xe_pci.c      | 4 ++--
>  3 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 75150077d62c..cb837745d893 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -450,6 +450,9 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>  	if (err)
>  		goto err_force_wake;
>  
> +	/* XXX: Fake that we pull the engine mask from hwconfig blob */
> +	gt->info.engine_mask = gt->info.__engine_mask;
> +
>  	/* Enables per hw engine IRQs */
>  	xe_gt_irq_postinstall(gt);
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index c80a9215098d..2dbc8cedd630 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -93,6 +93,12 @@ struct xe_gt {
>  		u32 clock_freq;
>  		/** @engine_mask: mask of engines present on GT */
>  		u64 engine_mask;
> +		/**
> +		 * @__engine_mask: mask of engines present on GT read from
> +		 * xe_pci.c, used to fake reading the engine_mask from the
> +		 * hwconfig blob.
> +		 */
> +		u64 __engine_mask;
>  	} info;
>  
>  	/**
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index bcf6fd610881..d654f2351557 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -509,13 +509,13 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  		if (id == 0) {
>  			gt->info.type = XE_GT_TYPE_MAIN;
>  			gt->info.vram_id = id;
> -			gt->info.engine_mask = desc->platform_engine_mask;
> +			gt->info.__engine_mask = desc->platform_engine_mask;
>  			gt->mmio.adj_limit = 0;
>  			gt->mmio.adj_offset = 0;
>  		} else {
>  			gt->info.type = desc->extra_gts[id - 1].type;
>  			gt->info.vram_id = desc->extra_gts[id - 1].vram_id;
> -			gt->info.engine_mask =
> +			gt->info.__engine_mask =
>  				desc->extra_gts[id - 1].engine_mask;
>  			gt->mmio.adj_limit =
>  				desc->extra_gts[id - 1].mmio_adj_limit;
> -- 
> 2.38.1
> 
