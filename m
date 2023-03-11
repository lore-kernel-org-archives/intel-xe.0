Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF78C6FA99
	for <intel-xe@archiver.kernel.org>; Sat, 11 Mar 2023 00:28:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4775210E009;
	Sat, 11 Mar 2023 00:28:56 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1988910E009
 for <intel-xe@lists.freedesktop.org>; Sat, 11 Mar 2023 00:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678494535; x=1710030535;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cuJ/FOq7Xv/o00KdOLOAKDh5ydKAEpYI2W2QD+JZnZ8=;
 b=ar63oK04wUPSuOcCSjU323mYcMdT2tp5veY5rUvJyHOCPzXS1op+hTzj
 o6cigT/HE8VXyf4o0fEyl4P3EWCs5slq00nJzr0+zR6enVEIicHfAQ/+a
 dmsQP1Nmx64DlHXDT9Ys4HUShlGGWtohstviRBTqqhzzyZ1kmzK62g/xz
 af7QJgKH6n1MZR0j/lZjZcqB7e6MIJH7hkN0Hdo8Svk3TsIYNbk72sAYW
 Ac7G5ux+lvKlzRxDKgtSfPaIn0RQpuUmP9eFaZEBHB2s40MII61qUVCze
 ZU/7aq2AL9KDB/FfZT4Voo7WoaN4RFXvZq7tQ/juWqG9BcON9A7riEeeQ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="399456640"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="399456640"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 16:28:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="852117684"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="852117684"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP; 10 Mar 2023 16:28:51 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 10 Mar 2023 16:28:50 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 10 Mar 2023 16:28:50 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 10 Mar 2023 16:28:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fYMHru6glV74fX2F8SpkVh07dKh32OdrFg9QH5NAtkR8NUBC2ZjcGkCWSX2TI5goieuGMgJHnZyyLzIweQLjn78pZ2iVeNy8YdRGDPmsubQfTXmVy6XnIEIoUhNF8DUtFnj8Bidz/8FEZicJs80Ce201pZ5BZSM7jGWanFNRi1CgWLEb7UK7sL3GIvI9BHE6ZFBUtUuRCblKrSHtKBHYNF0Y8yX0CzWej+17FF8fgYbDiVnjwx5UbVZP3/QKmmtXeWw4s1NX+MJ1ieR0hPfsxA64Ad2T/4wjzckCu0bsZFt1lvhglBQ4asrzWkvYu8ax9FijGKLrYgSRcVulg1C2Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kmb2Ur5VVw3LPfDhtciSPyrTVoiSX2vtihCNQhUdVVg=;
 b=CkwyzuN4bL0TiLb2Fgg2lZO7/zKiahJUc+nmy7ceCKDjPrSAqX9AfNlLZ2BbVfUrlx5AcWfCysxWy1Ayny6+pgYWbstskNJnmpyR17uFJKA9aPhEgIv32oyLgPaAW/ALxrw38iImLszJqHLIRNgpw8+yEJEisStUz1w9qLiQzo2BJZj3P/OgkV1wk4R6aSle46JBkq3u6C4bprJyT4a3X7USn6YPcrMohQ16qCKe32eIcbq8GLX1jmGI3qmKj4AiVtI1QroqvoLLy4lvX1sL02xibd6QIQivCUfUWVaag0Fbq3Ie2RuhZMB01yhkgDfQo/FoYATJO655PFCh7ab72Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 IA1PR11MB6148.namprd11.prod.outlook.com (2603:10b6:208:3ec::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Sat, 11 Mar
 2023 00:28:48 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%6]) with mapi id 15.20.6178.022; Sat, 11 Mar 2023
 00:28:48 +0000
Date: Fri, 10 Mar 2023 16:28:45 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230311002845.GD1175070@mdroper-desk1.amr.corp.intel.com>
References: <20230310221549.2337402-1-lucas.demarchi@intel.com>
 <20230310221549.2337402-12-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230310221549.2337402-12-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY5PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::29) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|IA1PR11MB6148:EE_
X-MS-Office365-Filtering-Correlation-Id: bfc51266-7640-4993-e9e9-08db21c7949b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x7dnVSACdnRrw+9RWoHcv341/bA7B1lEUw9IhsP9cvJqjiGqrCF6wFZRml8o4uKR7TbjZQv5cz/MkIM8IH9D7UFtPVqDQgK5n+/3jTIK3dlmeoGsxDCBpl72YFPTyFAV+FXofy61iDh4PRGxV/1h7p6G95qewIDwvI7X55hsXJM/hkomU7K1/mT7ZrwInU5n0NvvvHQMsb4lWAAQloP/DibxOXS+0dnhxv/vrjn7Axx/X/gG5i4/veA/h/+nYyddQFeC3JXYj9UO6bC7qjETfG9MGNUxxXAbFQ7OhWcQ2Bx6EBg+MDwUv+QbMvBXIKtLpFiLpyv96a6x2pIwuzxNFvobyctQ/b80MKAgUdxeuU2Qh9b7w4hNTb8DFjOiSvDuF8NdmZRNXVyj7GoBaM0chb2oKW05ix6yFSix1D0KwsxQctGZ/Wirh1QdX8/xJNLxKIVGaMTwJ18Z38U2i+XhZmnV4GFJ7FXkNji5jMAQL8qYj7bQWiX8S30whjBGJLKFzjsjEzhpQg8SNOPU7oDNTBUjoskfIROFCJzAqsSCBOCNIvBLd9rZEAqlZEeFEP+zwsFa6wC3V2EKbw0ydzRuaGndGj3fCTydwCTf00srpVhMS4kdW4GIDOoQmX3P1CeRYV2NwVkG38odz01m/DQb/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(346002)(136003)(366004)(39860400002)(396003)(451199018)(38100700002)(6636002)(33656002)(86362001)(1076003)(186003)(26005)(478600001)(6512007)(6506007)(83380400001)(6666004)(82960400001)(316002)(6862004)(6486002)(5660300002)(66476007)(41300700001)(4326008)(8936002)(2906002)(66556008)(8676002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NShjIimk8O1uFwEFEDwbEHxb0PNjmdHjQLPTVzJxplnLHSHGxYUQ6UannmX1?=
 =?us-ascii?Q?67PWQ8Z/0aMtTf/R+XsIDu6Bo4UNglA9JLVXoc4TPxFzCNPV4tScb86poNV5?=
 =?us-ascii?Q?szCfpYtX+nnlh8sR3caXdQtyLi0WcnVQNc6Agm4m4+LXveH6c4ATPAWLYMrt?=
 =?us-ascii?Q?fxLDqO5J4NG+8uXvG9TGvuOxU18Y73Pj8l5RFEBFoSbHT4wtxp+epq1SRA8I?=
 =?us-ascii?Q?uABr6UImu2W5+PhnQLiLneup0QPXcR7X0kHRh6oEjSfxb3y/L0/7xClPAl29?=
 =?us-ascii?Q?GcAIfrJXegwoqnobspFOaML5pd+IkiirXKNaldOq8t5Y/LcwoK1KW202GhrN?=
 =?us-ascii?Q?0pMtwlOyj8y+NCG+90YhCFfZvNVf0VSbslzjrU1Ynpq0/a4wl8C6XTbfuXkn?=
 =?us-ascii?Q?YBj46fqozA3pKTooBhgQpUkiSdwyN7tLP7T+oNK/1Uapv6KkjNpi4e/NwKUD?=
 =?us-ascii?Q?Nln1kIJi7OXCh43dcPzlOok2UWo1nbbDoJhfGoihFYmGhQ3gVjUHyodZXVmN?=
 =?us-ascii?Q?JaUxDvqUkBcsr4x0X6oYO8DsOLuJzPtxaog3y/lG+3Y2gdffs25O4eO2QTtE?=
 =?us-ascii?Q?M/QUNQ5XWrSUfN7qV6AQ4nYRXIsbUDo3tem9kA9TOTpLNibp+kJSShkYB+Qy?=
 =?us-ascii?Q?ozMe3xJ9JPobnRraZXSQx3tZyspJmlKbRKTAFO2hP0cub5wRzhdH25f7/VWR?=
 =?us-ascii?Q?lQiCAEVZNTk9FfQP+kfJBIs4mpj+2UbSNBs9IQNXJVKGt5shhuBIzj70CgC5?=
 =?us-ascii?Q?YbrLFeDTdBIgYLM4kxg9nd4xccI4REIpbQk1r30e0pC/3ypViKj5LPeo65Fc?=
 =?us-ascii?Q?ShrLsfdb7m7WYmuvKYzs0k2Fs6UsIR+/Z7jFD+gA3tB7vJz2eWi/McDOMpiH?=
 =?us-ascii?Q?2Ef7kFZd5RTikDyAFTukM+ZXupB3AAc05xhbBAAyzHPxyirtl/TB1askN674?=
 =?us-ascii?Q?EL9gUncoI2q8IbTG4DHOcokmg0kC7qUqvwpNiJ3qT7f1AvyOOgUoJy3HdrFt?=
 =?us-ascii?Q?PjOcp/GvUJGlzGoTPRAavo6W82SwuovrQ0UBwM8vHK3c6X01qZl2zi5oeqyJ?=
 =?us-ascii?Q?LBYvjeNJPSqdYmPkGigVFa3HsNg/BLzXe7nRzlx2gySpG7S/olIC9P3EtaV2?=
 =?us-ascii?Q?jb0QkwQZh9oNn975VOu8wo3lRH6288B913PKQ7Zn0+j/eh2cWehC+uzDnIyW?=
 =?us-ascii?Q?PF78Cd6K7nJgVMqybqgazT/oP0I7v06oePeDB+SPeyTOuj/zh4mvzgB/9/PC?=
 =?us-ascii?Q?paOPaG2Ozv45lCmLLOjy5n2vRGsT4D8KNfvs3mcuM4FDCNIJCBngUQ1Q6BMd?=
 =?us-ascii?Q?yyPw9bttum+ZQ6ku/qSkg8ck1zvTQpOsocmXXdL3UmWSp4iapROJ4YHDhlBY?=
 =?us-ascii?Q?bbyVeZlIrkJe3BQ9ZhRs79XcKg8odiDn350ooHiOkoCLGi4dp+ZZGF7cKs/8?=
 =?us-ascii?Q?1ihjx+8BwLlnK/3AWbXU29tLSjP6Aamss8xvYFMspdegLl/LtWtfJhRULxak?=
 =?us-ascii?Q?HiiTJcsMMd7IR75dttzmy6vzFj9icLrZkdDMWtVMlGy3jdZBsnAr1f/bZS99?=
 =?us-ascii?Q?uUODYWAAIaxeA8f+S/9uPw9FyXqdq96xcrC+TABYS62kcHHNa+L4f5wHueE+?=
 =?us-ascii?Q?mg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bfc51266-7640-4993-e9e9-08db21c7949b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2023 00:28:47.9605 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cU1k4z+KaYxHgm2Fzh3/5p9m0pbm2p4XyN36+IsUWYlNLtzpyu0T4hNwZObFJar3DpLg5oqker02nv2P6c+2Jm++HRe/MwEEYAUGJk8IhpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6148
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 11/12] drm/xe: Add missing DG2 lrc tunings
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

On Fri, Mar 10, 2023 at 02:15:48PM -0800, Lucas De Marchi wrote:
> Synchronize with i915 the DG2 tunings as of
> commit 4d14d7717f19 ("drm/i915/selftest: Fix ktime_get() and h/w access
> order").
> 
> Contrary to the tuning "gang timer" for TGL, there is no quick
> justification for why the read back is disabled in i915. Keep it
> with that flag for now. That can be tentatively removed later when the
> read values are checked.
> 
> v2: Use XEHP_FF_MODE2 instead of GEN12_FF_MODE2 (Matt Roper)
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  7 +++++++
>  drivers/gpu/drm/xe/xe_tuning.c       | 21 +++++++++++++++++++++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 2600704ace0a..7a578672a818 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -73,7 +73,11 @@
>  #define XEHP_TILE0_ADDR_RANGE			MCR_REG(0x4900)
>  #define XEHP_FLAT_CCS_BASE_ADDR			MCR_REG(0x4910)
>  
> +#define CHICKEN_RASTER_2			MCR_REG(0x6208)
> +#define   TBIMR_FAST_CLIP			REG_BIT(5)
> +
>  #define GEN12_FF_MODE2				_MMIO(0x6604)
> +#define XEHP_FF_MODE2				MCR_REG(0x6604)
>  #define   FF_MODE2_GS_TIMER_MASK		REG_GENMASK(31, 24)
>  #define   FF_MODE2_GS_TIMER_224			REG_FIELD_PREP(FF_MODE2_GS_TIMER_MASK, 224)
>  #define   FF_MODE2_TDS_TIMER_MASK		REG_GENMASK(23, 16)
> @@ -228,6 +232,9 @@
>  #define XEHP_L3NODEARBCFG			MCR_REG(0xb0b4)
>  #define   XEHP_LNESPARE				REG_BIT(19)
>  
> +#define XEHP_L3SQCREG5				MCR_REG(0xb158)
> +#define   L3_PWM_TIMER_INIT_VAL_MASK		REG_GENMASK(9, 0)
> +
>  #define XEHP_L3SCQREG7				MCR_REG(0xb188)
>  #define   BLEND_FILL_CACHING_OPT_DIS		REG_BIT(3)
>  
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index 47b27dccb385..928453b4636a 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -35,6 +35,27 @@ static const struct xe_rtp_entry lrc_tunings[] = {
>  						FF_MODE2_GS_TIMER_MASK,
>  						FF_MODE2_GS_TIMER_224))
>  	},
> +
> +	/* DG2 */
> +
> +	{ XE_RTP_NAME("Tuning: L3 cache"),
> +	  XE_RTP_RULES(PLATFORM(DG2)),
> +	  XE_RTP_ACTIONS(FIELD_SET(XEHP_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
> +				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
> +	},
> +	{ XE_RTP_NAME("Tuning: TDS gang timer"),
> +	  XE_RTP_RULES(PLATFORM(DG2)),
> +	  /* read verification is ignored as in i915 - need to check enabling */
> +	  XE_RTP_ACTIONS(FIELD_SET_NO_READ_MASK(XEHP_FF_MODE2,
> +						FF_MODE2_TDS_TIMER_MASK,
> +						FF_MODE2_TDS_TIMER_128))
> +	},
> +	{ XE_RTP_NAME("Tuning: TBIMR fast clip"),
> +	  XE_RTP_RULES(PLATFORM(DG2)),
> +	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_2, TBIMR_FAST_CLIP,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +
>  	{}
>  };
>  
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
