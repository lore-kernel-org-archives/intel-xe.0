Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6095C6FA8F
	for <intel-xe@archiver.kernel.org>; Thu, 24 Aug 2023 17:48:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71C3610E58F;
	Thu, 24 Aug 2023 17:48:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D19110E58F
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Aug 2023 17:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692899296; x=1724435296;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gZZPMEo75PbG0SPlsEQoGwinRvVrDg2+YNfuOWz0ZX4=;
 b=Vff1NSVKE1u0VQeqK+FPD3S5mD0MSU4PCxbombvMflAwR77CerB/3ISO
 WEsaCrbPbswO43Rkk18cds7QXKus4V2L+dQZMuJMIf2KHOLfIZ8k4nspP
 7Z23canaCegkTnSg9kCTGqhTEdyVG6eHQsD0qBaLDyYIsk5Ma/uJgnpBw
 8/BxqJsvA776Qfr+Fv4oDeva0wgKSSwmIV8OaT/zNa/Q2dsbZLlssUAcT
 rdDnZvCfpD1Gs8SCHZxZWL+O0yJSDzUqP8EsRnqPApLyyPaXbmQWTf+yq
 pIxsihvd+TJ94ChWftGMe9e/nd2D6Aijt94Yv+4YyKz8jgvAjpzZPkfps w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="438461722"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="438461722"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 10:48:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="1067926039"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="1067926039"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 24 Aug 2023 10:47:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 24 Aug 2023 10:47:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 24 Aug 2023 10:47:55 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 24 Aug 2023 10:47:55 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 24 Aug 2023 10:47:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Caqg0C3T0rAQLxEN0d/eeT8eFx/5O3o3AOM/HWYpV4z4OYgo8LiDanISJCR3Ik63BiGhpwB4gevYqwr0PdicXALRca0DRnLkk3dsxqobyxH9tyvNZQ/JaFsf2arCwUGWghjMNLur2TRsChX49nJsrjCdPsMxDWA7ZeUFMwoW5sex51qRDe87tSTCj2htjCReaOeyfIFzRvdl58KoBtFqyw9QWaZG+2wD90v4k1guFT585BMr98Gsw2FYGUSwRKEqtyb2ztmA+wSLT5XneR90fk9fy4HXA9ZDvCGl1hBcFAMIuXSPPc1ikSIUOJc1XrTBLzy3OzOREMrFL842HvjlOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L03ftClMJNXa3Qv8wSLOvc6QiOkeOoE4hz75tFkgm4w=;
 b=V8n/3Z9EfI3gwqJlo56Z9v/h22Z8SKR7kRVtGY0nqXaT5W1U0JcLH3QnKiCtkmXkpwOahhOpCz4dcBKkHS654/WjIeAQeE8DR2aawOCRYWRS9P2IBamC/tsaIh23xudHJBPJPffANCQzR/ckKFph8RIHsDCo7QmdiOMRu/YQM+rO/b/aL/M7k2nIBmdEIBtS4omjqVlUV0X9JQXoMvwEt0/DH9ymyXMR2W2SaZRQNlZMTuv0cEJxOJfBoNXmNjj58Skj3GNC90Txi37xfIjaiWw2bp8LTYS78w2UhwI42qU6hfYMDKNUnjjHXsxlqQ/+aXC6fr1/fOUxkSHdL7h+PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH0PR11MB7423.namprd11.prod.outlook.com (2603:10b6:510:282::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 17:47:52 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::a9b6:9a74:51f5:2d2b]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::a9b6:9a74:51f5:2d2b%4]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 17:47:52 +0000
Date: Thu, 24 Aug 2023 17:46:29 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZOeXdQhWgx8yhhQK@DUT025-TGLU.fm.intel.com>
References: <20230824160444.494648-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230824160444.494648-2-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR13CA0129.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::14) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH0PR11MB7423:EE_
X-MS-Office365-Filtering-Correlation-Id: d374f082-f8b9-4ebf-ae7a-08dba4ca3d4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s39J4AWHvZ2OCB3EyNrLo3bS88hppHHZR2qViJVKNOVxpg73EoY67mS/mXjqqG5tDWeoLIk1Nhp2ezT1uLKvR1T2a7qJyi9QepUNdgGd4HbDHLxq5Ec0xGt61hUbTXFkPdyZKb0iOlmG/8czFCU2hjkJ+HX9rxvscUnYPk+uM4IZ2PwH6ZQkL+XdfP7Pm6XKihvEvq1EWceQqfVb7lhH6TQP8H92P79px3D1Vk7BltENA1Nd61ctWr2EJQH+MMyyEM0pj/qo+T0mfGxg+6Jf06iB+YPq6jO//3qARC/8ddxdA6+9JzG1KbgAy7HCjLXT5DNdaEQeN8ZSWq1meNdr8dB/ZpaaA4t3cvvOvoNKX9+XSAPlxLqP+NcmAj9bdqTd/xQRJvhW+V3f+OHFuHgjLaOWvYqVajFNUyWmUMDr5iykP0VSmgDKa+ccwj3aePR8hVClMEFCFCyTlD1R8+D5IVSsvN3XJBUNI7zVPV9BSVON4KblZWDkN1KWIQ9+EDx3Vrt/fZBTskagSXGuBNNX3KuAjKU2+ihqO5rNPKl4RaNueAD26k9HDgkLvI9KFAIjPDPOK+vagkDCm4jXs64JEw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(366004)(346002)(396003)(136003)(186009)(1800799009)(451199024)(66476007)(66946007)(66556008)(6636002)(316002)(82960400001)(478600001)(26005)(6666004)(38100700002)(41300700001)(6506007)(6486002)(86362001)(2906002)(6512007)(966005)(4326008)(6862004)(8676002)(8936002)(83380400001)(107886003)(5660300002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tkOx3qMdam33B57bzhWRVwsr+gNwz/OSPZ0hFI+w6cIoHyL6tp5IoBJhmt2z?=
 =?us-ascii?Q?m3VH0/0sjtEV6LXcZuovXy7WtaUhEHBHawoWji765FTD3EMYZSsjnP9E0uu5?=
 =?us-ascii?Q?uyu3vbp8VBQyB3S+C7G/RqMoKWfWkFTCnrIr2YvC/7xXuRPsGpOllE1yc9mi?=
 =?us-ascii?Q?BDMivkon/KXcVhKUMW4zLeYBvTao9IQZm44D9iDG1na9Nn2cqf1KiVvQjpX6?=
 =?us-ascii?Q?41gjqKcmDpTrKkNVg9crystvpH917y1Ps1ja2sUSI7YOXhOo+f3Ruvhk89iA?=
 =?us-ascii?Q?HCNV0RLfe9dHCdTALU5dF8WLIlO0mxmUSbw5MIz0iVaTmDV4ORZ7Piji0/zZ?=
 =?us-ascii?Q?gAGFMi8ZRi0oxftO4a/oODQSVXqYvZt6/k9YBoCDiSRCKAabmfb4AAdnyGT9?=
 =?us-ascii?Q?PR2fIMsfgkenUMKIdJMocBB1c+sxntigZORfNhdPZnIsMghRK9NLfyzbExWr?=
 =?us-ascii?Q?Sj9IKiAocY772m+tglyRTVEDnJcdIfmDsNe/+WQgyaXlIiBjtym+oaa9rQLE?=
 =?us-ascii?Q?uLb96g7Lqwshbrc2gI4rdqOSud4AcrefleLEyN7Sj37VCNbN1E5EY92GZsmW?=
 =?us-ascii?Q?S8AiWAWrxu0kTeAzPaD9bppezyt0vc/ATdyIK9GFblmpgEDktdsj1yLghK+F?=
 =?us-ascii?Q?fTLAPyQfhMgmiRToyD3HlT/Y1IBVPmQ61jb2SV5aBG3ogfWh/V3+usYRLmzg?=
 =?us-ascii?Q?iuY8YshUkeqg5rly6VVXLvOLVtHAP9RoF2djIYyNo7kJtPWBpRDwSXXXGeh1?=
 =?us-ascii?Q?8fE06L/lUdFU3iTYqFw17MJc9BGoO71Pc/gxr7VUSoJiS25Iz4G+ISGWFnm/?=
 =?us-ascii?Q?BZutVLUzo2Z+MMRZKOwHs860bP3yjFjhwapAG73dnayzj/wRNbZNvCqAwhq9?=
 =?us-ascii?Q?dL545n6rRLHsqQyQygQTAI2PWeM/0GI/lg6UKlel6Hfy6pqfQjQkuxtIR6Rg?=
 =?us-ascii?Q?wz81vwuxi6o6Q9ig1hKI2fltv6U2FYLsO/sNVge0lWenK1kjJBUrjfKPslD7?=
 =?us-ascii?Q?M4zpsleHI99/yfImJxGQLQt4jT3Cd+KTEMr5/9N0zcgNadHT8a671xYGuUQh?=
 =?us-ascii?Q?IzD1eqPFf6tg+chec+ecWFTIto7sOv9awbTTkb7QjNQ3g/brPHRTKx3whXAz?=
 =?us-ascii?Q?e1+FGQya3MV7hwfTc+rVnp9HWravuUBNFNRwEQrRXTgz1ZpbOkqy/bOPF5KC?=
 =?us-ascii?Q?qSUrAkiYcXAblxev9ZTj8agh+OQ4EJtC5ccq+aF5hKuS+tAcO8T4wwX3z2Xx?=
 =?us-ascii?Q?/aSjJGC6rxMRnFHBTTNubESfuJR15t3mxk1tok2aSlu5V8XKVaHLR9ocXHZ7?=
 =?us-ascii?Q?LDi9f953w46iA/D6eSZyms1iIBADi1AkG7+pScOBKtD6LjJwtQNq6CCx7BTK?=
 =?us-ascii?Q?QR4veVr+FlE29RJx+0WIYOId2sr1WD77t9XtL8VLgdmn37D0Iv9K6xhN7xOG?=
 =?us-ascii?Q?R/8YT2KAYbRluKotqhaVAOvUDjIpo6G3TA32AalR7550h9am8Q9NgciVxfo+?=
 =?us-ascii?Q?R8VE0kuZrRFmvJdpmhj/pvp0/LKJvbfUplOh8KpT2/WNooKQ7guo8TdmSi5L?=
 =?us-ascii?Q?YCr04zfLwh6tZpechIAJOaEqoFuOaSdGloTSf9xjGbJPEQBx8vRkNtW+51Ib?=
 =?us-ascii?Q?7w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d374f082-f8b9-4ebf-ae7a-08dba4ca3d4d
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 17:47:52.4154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XyPQRVlcTCXgj5BaFp7Zmy47lgeHlPjcJaWOWZdLQH7JPwnZkU/nYtfraaz6sC9WwSKmV70vkhNeh7JsMQd9nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7423
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: nuke GuC on unload
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Aug 24, 2023 at 05:04:45PM +0100, Matthew Auld wrote:
> On PVC unloading followed by reloading the module often results in a
> completely dead machine (seems to be plaguing CI). Resetting the GuC
> like we do at load seems to cure it at least when locally testing this.
> 
> v2:
>   - Move pc_fini into guc_fini. We want to do the GuC reset just after
>     calling pc_fini, otherwise we encounter communication failures. It
>     also seems like a good idea to do the reset before we start releasing
>     the various other GuC resources. In the case of pc_fini there is an
>     explicit stop, but for other stuff like logs, ads, ctb there is not.
> 
> References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/542
> References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/597
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c    | 17 +++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_pc.c |  8 +-------
>  drivers/gpu/drm/xe/xe_guc_pc.h |  1 +
>  drivers/gpu/drm/xe/xe_uc.c     |  5 +++++
>  drivers/gpu/drm/xe/xe_uc.h     |  1 +
>  5 files changed, 25 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index e102637c0695..3cea4323113f 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -5,6 +5,8 @@
>  
>  #include "xe_guc.h"
>  
> +#include <drm/drm_managed.h>
> +
>  #include "generated/xe_wa_oob.h"
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_guc_regs.h"
> @@ -20,6 +22,7 @@
>  #include "xe_guc_submit.h"
>  #include "xe_mmio.h"
>  #include "xe_platform_types.h"
> +#include "xe_uc.h"
>  #include "xe_uc_fw.h"
>  #include "xe_wa.h"
>  #include "xe_wopcm.h"
> @@ -217,6 +220,16 @@ static void guc_write_params(struct xe_guc *guc)
>  		xe_mmio_write32(gt, SOFT_SCRATCH(1 + i), guc->params[i]);
>  }
>  
> +static void guc_fini(struct drm_device *drm, void *arg)
> +{
> +	struct xe_guc *guc = arg;
> +
> +	xe_force_wake_get(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
> +	xe_guc_pc_fini(&guc->pc);
> +	xe_uc_fini_hw(&guc_to_gt(guc)->uc);
> +	xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
> +}
> +
>  int xe_guc_init(struct xe_guc *guc)
>  {
>  	struct xe_device *xe = guc_to_xe(guc);
> @@ -244,6 +257,10 @@ int xe_guc_init(struct xe_guc *guc)
>  	if (ret)
>  		goto out;
>  
> +	ret = drmm_add_action_or_reset(&gt_to_xe(gt)->drm, guc_fini, guc);
> +	if (ret)
> +		return ret;
> +
>  	guc_init_params(guc);
>  
>  	if (xe_gt_is_media_type(gt))
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index c03bb58e7049..87de1ce40e07 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -884,10 +884,8 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
>  	return ret;
>  }
>  
> -static void pc_fini(struct drm_device *drm, void *arg)
> +void xe_guc_pc_fini(struct xe_guc_pc *pc)
>  {
> -	struct xe_guc_pc *pc = arg;
> -
>  	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
>  	XE_WARN_ON(xe_guc_pc_stop(pc));
>  	sysfs_remove_files(pc_to_gt(pc)->sysfs, pc_attrs);
> @@ -925,9 +923,5 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>  	if (err)
>  		return err;
>  
> -	err = drmm_add_action_or_reset(&xe->drm, pc_fini, pc);
> -	if (err)
> -		return err;
> -
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index 81833a53b3c9..43ea582545b5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -9,6 +9,7 @@
>  #include "xe_guc_pc_types.h"
>  
>  int xe_guc_pc_init(struct xe_guc_pc *pc);
> +void xe_guc_pc_fini(struct xe_guc_pc *pc);
>  int xe_guc_pc_start(struct xe_guc_pc *pc);
>  int xe_guc_pc_stop(struct xe_guc_pc *pc);
>  int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index addd6f2681b9..9c8ce504f4da 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -167,6 +167,11 @@ int xe_uc_init_hw(struct xe_uc *uc)
>  	return 0;
>  }
>  
> +int xe_uc_fini_hw(struct xe_uc *uc)
> +{
> +	return xe_uc_sanitize_reset(uc);
> +}
> +
>  int xe_uc_reset_prepare(struct xe_uc *uc)
>  {
>  	/* GuC submission not enabled, nothing to do */
> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> index 42219b361df5..4109ae7028af 100644
> --- a/drivers/gpu/drm/xe/xe_uc.h
> +++ b/drivers/gpu/drm/xe/xe_uc.h
> @@ -12,6 +12,7 @@ int xe_uc_init(struct xe_uc *uc);
>  int xe_uc_init_hwconfig(struct xe_uc *uc);
>  int xe_uc_init_post_hwconfig(struct xe_uc *uc);
>  int xe_uc_init_hw(struct xe_uc *uc);
> +int xe_uc_fini_hw(struct xe_uc *uc);
>  void xe_uc_gucrc_disable(struct xe_uc *uc);
>  int xe_uc_reset_prepare(struct xe_uc *uc);
>  void xe_uc_stop_prepare(struct xe_uc *uc);
> -- 
> 2.41.0
> 
