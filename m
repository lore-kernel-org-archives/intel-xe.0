Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42926C27C6D
	for <intel-xe@archiver.kernel.org>; Wed, 16 Aug 2023 22:51:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1CAF10E3DB;
	Wed, 16 Aug 2023 22:51:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5663810E3DB
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Aug 2023 22:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692226276; x=1723762276;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1ExXqPgL9eHFhRaoJusOL8iI9u9wj3uRpMyyPZQZ2P0=;
 b=isKeNA87Vco3lW3sKpVrO5CjmUmhWm9LoLYQdRqY/tCb/RWNv0aD09Ub
 iR1mwe8i/M2W/17wt0neG3LLU2b/JvJKAc+9qj6xYxzZUrMHF8tDonsXY
 lSncLFTHLzk7cUF9RA+Z4oC1EsCuqX42tAR/bz5IS10vXkHdw/4CXEW3a
 tJv4yb2A0s7xmGodrrTAOvAbyBNOKRSUKRTA4SxP9XEiFlf9knkbHqgXb
 qW+CzHDoZa5jllETWGUCdOe6yrKHYEq39gZCtt5l0RNHF0zpYHmFThJJU
 RQ2YuwLKMezCAo+wfGLLakBNGyd93G8G1Czt0Lkuu9n0U37wVDT5Szur4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="370127966"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; d="scan'208";a="370127966"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 15:51:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="769373205"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; d="scan'208";a="769373205"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 16 Aug 2023 15:51:15 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 15:51:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 16 Aug 2023 15:51:15 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 16 Aug 2023 15:51:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I3XiYrAfOxBDlOQNMwqcx3UJD7FladWW2lWeTXYM/lms6P/x4NjvKvRNnK2A9VU3clZpgmMz2DALktsweK+Xx+RHas9+jbHZiRYabpvP6Oi4+CMHPNVjvTzVNB4vxF6GpWSOG6Q79uHZOdZsg8md7w8k4ewzMtfvz8qEXBjfCc6QbqcMGI/gYUWxp9EBDgmj0XnJ1YBRVYJsKrMc2ifBe3+fhfdSHCauVKlNcoJAfKzMuGbfsKsyEey+MXjsHdbPszRFBUjwSvW7iQiGi4Y0UUIrXqZgCm992k/Q0aOgUAHD4mJRQwjFJU59/wV1l+W5NSRvk8y/Tv+W38iHxYDPgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LrxFYEMlp+C+n9EvPIYdPNNQdcSgunSz28B76n2ysjk=;
 b=ON4DvMEajlYfzISTP2/SOdzqj5kXtgjFVOoHYhjXcEz5zDZ/RwgHx+5qQMlSkH47xr+FlG57VzbBKSIoBorFlfhsiKX6Jdu7lR2GS9hlbHiIuoDooSWcKuaewWTOCzo5Ai8X6sCNdfVJTyjzNekr/jYJxdI8IhK74GwAM+8xIGJrZrXAjO1/6+fOD/ApIGRZXN5p99+6Tf2TwKZdakwX+TXMoe4ThyouVZipELj5ZMqtuW3/D2RA/j0NH/2qAVUgv7yg1xZ87aZeblSdASwWyJfo4A9uDejuuX5OJHACPOBjBOotr/kJPG0J2AzPGjm+/QxSQTu0YOlOoLL7Y/IZUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 IA1PR11MB7270.namprd11.prod.outlook.com (2603:10b6:208:42a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 22:51:13 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6678.025; Wed, 16 Aug 2023
 22:51:13 +0000
Date: Wed, 16 Aug 2023 15:51:10 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <20230816225110.GX3375865@mdroper-desk1.amr.corp.intel.com>
References: <20230816180425.1481448-1-daniele.ceraolospurio@intel.com>
 <20230816180425.1481448-4-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230816180425.1481448-4-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: SJ0PR03CA0078.namprd03.prod.outlook.com
 (2603:10b6:a03:331::23) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|IA1PR11MB7270:EE_
X-MS-Office365-Filtering-Correlation-Id: b5f22461-a36c-4a14-6a1f-08db9eab4a9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G1wgSqQBVXlY7Wt2/VZQiNO+bC9iMoALSgFQmqA5hhI/opWAPpjCqClmhPBELhPdKjcbrGiBN159N+zEFQGGv36VHBCtY7IsYNUhwZL+j7RQTBqPjYPFUTdY4pSYBTO9Q4nKZaDxuQ52OlKIAXQFCOhxrJRkiu+j2M4ev8iHu+7AxiJtDseXrw1du7PNg7HfamLLCmAz13FEdfrQzK6T8ZMfKAf4ACVGFivrgGnLCWNws6dBnYwyyOzEXOnfK4v9y4EYYeVg+L/YnPO3eZ36HJVrOPd1WtTo5mUSIt08K+pZJKL9Pt3g46w9Je1mIpBfxhewzHSMgcoE65hU1fDC6Mo8XajvVgnZW8kinyzDx24FkCA0YbOGpkArfc7tNxxGJe9hyoVHGAzm041dK64nyG8bkyX3M9GLNMmgIjGmNFQgTTsPlLkLl4JkR7ozCfqO7CuiPeK1u29XxOA376YKsDEGKTw4ivnSqqG8t9xgGkba3Cj6ckFL4akQ8cAdXD8IbbUGOFtK8AViu+y5lZIOU2dt90ctw8xTPhJy+G9IF9GUU74sjbUlSzVhCn6nCfvK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(346002)(136003)(396003)(39860400002)(1800799009)(451199024)(186009)(2906002)(83380400001)(26005)(86362001)(478600001)(6506007)(6486002)(1076003)(33656002)(6512007)(5660300002)(41300700001)(6636002)(316002)(66946007)(66556008)(66476007)(8676002)(6862004)(4326008)(8936002)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1eLw6p5Wl6j4V57rZawf7zpaj0lOe1f5VXPVM0m6T9+J60P67PhlxKi23ZRE?=
 =?us-ascii?Q?rBacyBtM/uSEktgSuUZG4ZJuAGJZZceCn7SVXltpyiTF3bqXwe1YDmhGdtBG?=
 =?us-ascii?Q?X8yqfLkSNZWjtMGlNCXXyJfGXCsjGmgnldxVPGYqwDGshSGYuZh/qlUEXUcX?=
 =?us-ascii?Q?eofpfB13Wkl2i885B0ghjsT/wiVnbOg/Lxf2WOlI9fZ7Q+JuftbmSsox0Onh?=
 =?us-ascii?Q?0X7tRiAYAPqYQEkvCPeGINfWWqTw8Q9ZuVC2z5pBlbegjFXwM0DickELJ1/E?=
 =?us-ascii?Q?4FA10YFDbrU4DLbytNca6g7J0V+bv5IY6U64mQOMbNgsKYEZCo4Ib1me6w+D?=
 =?us-ascii?Q?HjUlordoYCjKG6mTWGZ2iLVQXc6rnFwOnfvavtDlaaB4BFXKKprwPo4Wu1z3?=
 =?us-ascii?Q?GA+cDwELlKkQD3keJKcFTrlJJ3F9C9Dlnr9mFUIjlkoBifmdg+0o5C0aoBrU?=
 =?us-ascii?Q?cTfYprnoiVk+0Pqv2cJ0M4EYtYN+wWUFq6It6NqSgKXzxhakELpyfGKacOgv?=
 =?us-ascii?Q?GljAkT9Vj4jqPh4ANwVQgM5xLk4UummQQNEUD7Q7IV0VF7To+Sby7SUJS+l7?=
 =?us-ascii?Q?mY0+OYp267rCkm/wg8nVVmpe6f2xyZm9zHMXuDRgR3ZTcrWMVtXDYE4LgBpq?=
 =?us-ascii?Q?pVHQ+1LAPnYwWWqFl/VzrRzbV+cNEREk/iuKl1sy7BpMb77ajVT5VmoJWzfX?=
 =?us-ascii?Q?bEmAJiuVRlpuz/ikFhw8n4eVYJUsisqIzm8Ns5GtI8t/MflSrCpCUzBAEk14?=
 =?us-ascii?Q?daCNyf42BCxO+zeYTA5tqftVZfJmK5mCCHe2T1nRmRi/VS0Lx94pAb84t8Tr?=
 =?us-ascii?Q?onCFX5vXMiMoeGpEZ47UdXqB4ViZLeEYBVTSgiMc2lmZ1Flm4HrNc1pKfq3F?=
 =?us-ascii?Q?yQT1MmOm6N4UIAvHUCCHnVvETB5MpmhQizPLvwkK7NEIDzP7yfXgz3LIIOgS?=
 =?us-ascii?Q?VfIqgaq+by0uhhsZOTYXMHj4JK/b9t58+3IeUDVVLyNxQQ1mlMsVwQblWFLE?=
 =?us-ascii?Q?PtHE2r9ipyOsJhbqv8Ix6N+jLJ1LLS1DY+46YBbYjntIBAGSzExygFX5CISI?=
 =?us-ascii?Q?tf5jZm/6xefHXaAUxWiJWplHCs1lPUFbPPKTrBvOuHEK4EShzsg+FFBcd0ok?=
 =?us-ascii?Q?hr6EyL2ui9W93Ti0YANC0Glh5V/hiXtDSle1VOpkmMxRzj+CTgHrselw2cS/?=
 =?us-ascii?Q?skIl41a3Wm153yv25qkl/7xFpM3ch2j/yzPhZ2/J0ag+kLgOd49YeWhXaE6a?=
 =?us-ascii?Q?K9OVJlD41niMXaOxl27rekjPlTy8EwOZSOMX6lc5Mbu0R5naxrL/fL7q3MkX?=
 =?us-ascii?Q?kJ6Uciuu79/CiYI2KBp8IgYf3Me9WIKOLSxad65J3ZOv0F4nry4xCR0NvTiL?=
 =?us-ascii?Q?YiWDg7er+MEMIF65aKd141KPseXczaznLlxh4IcGWceVfbxiBeeNj2+LEF4Y?=
 =?us-ascii?Q?c0WahL7QuvTYJ//K9k1Mi3mtauTxqeKVNsXTZmtThV3xkNhm3GFOvqkwDcTT?=
 =?us-ascii?Q?odqEu99TO2qWCk9iFZP6z5PP0Fj9JwbLuGiWmUSmsLXN7k2RBZvJOHR6NmkF?=
 =?us-ascii?Q?m7pZfzwg48MyKOwAJul6Wgi0oqQtX2a6d5KQlql65MCbgSqB3mNkgND3nCFQ?=
 =?us-ascii?Q?RQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5f22461-a36c-4a14-6a1f-08db9eab4a9d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 22:51:13.2690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Aj0X83I2LS5N8nqtGWOtuz4aN9x4D8MAcwslrtgF2PLu5dAs7y6KJVYx45My6e5XhOOWpXffDvmfGLbRbDpVPxXuH6i1lw6ygLHlrtW4h4M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7270
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/6] drm/xe: add GSCCS irq support
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

On Wed, Aug 16, 2023 at 11:04:22AM -0700, Daniele Ceraolo Spurio wrote:
> The GSCCS has its own enable and mask registers. The interrupt identity
> for the GSCCS shows OTHER_CLASS instance 6.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Register offsets match documentation at bspec 54029 / 54030.  Other
changes all look correct for handling enabling/masking in the right
places.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  2 ++
>  drivers/gpu/drm/xe/xe_irq.c          | 25 ++++++++++++++++++-------
>  2 files changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 69c188999e73..e3d1cec7ba8d 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -383,6 +383,7 @@
>  
>  #define RENDER_COPY_INTR_ENABLE			XE_REG(0x190030)
>  #define VCS_VECS_INTR_ENABLE			XE_REG(0x190034)
> +#define GUNIT_GSC_INTR_ENABLE			XE_REG(0x190044)
>  #define CCS_RSVD_INTR_ENABLE			XE_REG(0x190048)
>  #define IIR_REG_SELECTOR(x)			XE_REG(0x190070 + ((x) * 4))
>  #define RCS0_RSVD_INTR_MASK			XE_REG(0x190090)
> @@ -392,6 +393,7 @@
>  #define VECS0_VECS1_INTR_MASK			XE_REG(0x1900d0)
>  #define GUC_SG_INTR_MASK			XE_REG(0x1900e8)
>  #define GPM_WGBOXPERF_INTR_MASK			XE_REG(0x1900ec)
> +#define GUNIT_GSC_INTR_MASK			XE_REG(0x1900f4)
>  #define CCS0_CCS1_INTR_MASK			XE_REG(0x190100)
>  #define CCS2_CCS3_INTR_MASK			XE_REG(0x190104)
>  #define XEHPC_BCS1_BCS2_INTR_MASK		XE_REG(0x190110)
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 2022a5643e01..1dee3e832eb5 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -176,6 +176,11 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
>  		xe_mmio_write32(gt, VCS0_VCS1_INTR_MASK, ~dmask);
>  		xe_mmio_write32(gt, VCS2_VCS3_INTR_MASK, ~dmask);
>  		xe_mmio_write32(gt, VECS0_VECS1_INTR_MASK, ~dmask);
> +
> +		if (xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_OTHER)) {
> +			xe_mmio_write32(gt, GUNIT_GSC_INTR_ENABLE, irqs);
> +			xe_mmio_write32(gt, GUNIT_GSC_INTR_MASK, ~irqs);
> +		}
>  	}
>  }
>  
> @@ -244,7 +249,7 @@ static struct xe_gt *pick_engine_gt(struct xe_tile *tile,
>  		return tile->media_gt;
>  
>  	if (class == XE_ENGINE_CLASS_OTHER &&
> -	    instance == OTHER_MEDIA_GUC_INSTANCE)
> +	    (instance == OTHER_MEDIA_GUC_INSTANCE || instance == OTHER_GSC_INSTANCE))
>  		return tile->media_gt;
>  
>  	return tile->primary_gt;
> @@ -281,16 +286,16 @@ static void gt_irq_handler(struct xe_tile *tile,
>  
>  			engine_gt = pick_engine_gt(tile, class, instance);
>  
> -			if (class == XE_ENGINE_CLASS_OTHER) {
> -				gt_other_irq_handler(engine_gt, instance, intr_vec);
> +			hwe = xe_gt_hw_engine(engine_gt, class, instance, false);
> +			if (hwe) {
> +				xe_hw_engine_handle_irq(hwe, intr_vec);
>  				continue;
>  			}
>  
> -			hwe = xe_gt_hw_engine(engine_gt, class, instance, false);
> -			if (!hwe)
> +			if (class == XE_ENGINE_CLASS_OTHER) {
> +				gt_other_irq_handler(engine_gt, instance, intr_vec);
>  				continue;
> -
> -			xe_hw_engine_handle_irq(hwe, intr_vec);
> +			}
>  		}
>  	}
>  
> @@ -465,6 +470,12 @@ static void gt_irq_reset(struct xe_tile *tile)
>  	if (ccs_mask & (BIT(2)|BIT(3)))
>  		xe_mmio_write32(mmio,  CCS2_CCS3_INTR_MASK, ~0);
>  
> +	if (tile->media_gt &&
> +	    xe_hw_engine_mask_per_class(tile->media_gt, XE_ENGINE_CLASS_OTHER)) {
> +		xe_mmio_write32(mmio, GUNIT_GSC_INTR_ENABLE, 0);
> +		xe_mmio_write32(mmio, GUNIT_GSC_INTR_MASK, ~0);
> +	}
> +
>  	xe_mmio_write32(mmio, GPM_WGBOXPERF_INTR_ENABLE, 0);
>  	xe_mmio_write32(mmio, GPM_WGBOXPERF_INTR_MASK,  ~0);
>  	xe_mmio_write32(mmio, GUC_SG_INTR_ENABLE,	 0);
> -- 
> 2.41.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
