Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6CEFEB64D9
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jul 2023 22:00:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A281810E5F0;
	Fri,  7 Jul 2023 22:00:32 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6080210E5F0
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jul 2023 22:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688767230; x=1720303230;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jpXMkrzzfJsENmWJw08pI3P+bgRQHsVK4ploWoM2nLk=;
 b=l4OQamRuDuWnXsOF+6HXzEXdOOExgfxphQ4KnNkonZOenkYdt9Ddfosd
 DrJe298uuGemIswTF/AGEZeLKotWNA6602bFOozYKjk7KBmJWIyBKv3tq
 qcgSFAqInrFbWwdjJzDCo4H8lPwuUE74yvSS6oTfpwCXEZJgHaoASEdFU
 qvdMSdILT6wdST33q7itH1MqmGUc09nG+2LGZ/GYcBc7wH5jlnVMPcyF1
 Pb1HMhd9Nid1/o+NpGPdRNTcFQdWtM7WQdQF+D5JaTASOcHz0rZkCVDKE
 ZhwhGd2v/IiBYRLoj7KckbX1tB88qv9NmO9tJTsGoo13tSSAtuvlguwvi g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="394759397"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; d="scan'208";a="394759397"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2023 15:00:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="670295936"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; d="scan'208";a="670295936"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 07 Jul 2023 15:00:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 7 Jul 2023 15:00:28 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 7 Jul 2023 15:00:28 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 7 Jul 2023 15:00:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jUr7QVBmfeGMihRP+IJpa0CxrF2FIf7aAHqsjEKDUEdONtpubKpqbkM+M8DZmFjEU8loiHQvWN5yvaiXgXc2zap+IimcK0qpL8aaqr01wxG9kPKKKq7uy03G1e9dJpSzCpiK9PdX0+A9nSJVF8NmsZT4igZpqKiFUgzvC3TTcZZufcUt/1Nehzpr00xpm8dpnSK8BR12RT3ZDdrAOEgSuZu653w1rGxxiOYUKhgyZiFRVTA6a4wFkbiJHEzyCVKm5vNi+SdMbB27XFoNULVXrPeQHWCACIzkY9JYAun3tawzzUbUUtuxal4sRaBk+pCefNcFfcg58ErYzLcX+DRUfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fc6YeVmOuH+bm7+Si54413q+SWkuae6u/A+ReFN8Xi0=;
 b=OjxfLAIStFgTMgaAxJJsur7lo7ycXMLJu6d3vAhMAic1nqC6W4paB9Cf1OIRNIp0SFpRprTb/kFMDryLryldj+zRZ+oIyyTFpbLeaFhkndvBMITPVsAo6nJfM/lzaXHnQoyTB8Pyg9c8oJZBST7CUfJMgHi4nLowgJvI9hQgirb5ZTjecOujj+lIvqA/YgpULUWF5jeCoJL8AZQIdKtFGqUFbGgmBNRPlKoPJp4w0es7/d+EUPlbIYQGiZzmWs4TpGOWReOO7PmrhSuHee2kAQ0ZS7WB+ctT265EFST0IaH/GPNi1PVdgdyYkjwLobTG07Vbq5s+em93947ALKfmkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL1PR11MB5222.namprd11.prod.outlook.com (2603:10b6:208:313::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.26; Fri, 7 Jul
 2023 22:00:26 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2677:dfb9:456f:1227]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2677:dfb9:456f:1227%5]) with mapi id 15.20.6544.024; Fri, 7 Jul 2023
 22:00:26 +0000
Date: Fri, 7 Jul 2023 18:00:21 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Message-ID: <ZKiK9UQl8cXaKZZH@intel.com>
References: <20230706120208.2828158-1-anshuman.gupta@intel.com>
 <20230706120208.2828158-6-anshuman.gupta@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230706120208.2828158-6-anshuman.gupta@intel.com>
X-ClientProxiedBy: SJ0PR13CA0155.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::10) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL1PR11MB5222:EE_
X-MS-Office365-Filtering-Correlation-Id: a86fbb57-f74a-49b2-e925-08db7f3591ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YocQtrOGKcvwOxFFuGYiPiygvqkg80FipHpi7fyiR289qETl9VG/Mdata8eRcHf91ycMVdby3EoYoapSu6ffcWvKFmj/KGRkfzWT7LzMB8IhFZuAM/aF0YYZLcIOF6+OHW6WaeoxwBpUNViGNBRS/zdKJ5mb7jv0HA/PFx8XO+FYt+Lef5Qt1mG7dJupwTUGBFeTEdy6iplkg9MdryNTX166qnv2BmQYB1a+sa8/4wSzeov5z3/W0jPLB/ncpSBRGgDKIvqqjlSZXcdjbI2x1uxeWBHzc1+UIntvoSSkwXqo+74dqhz6lX1RYi3Ng4TlY6Ym7hxl1IvQSaiJbR0aNR2RDLOTIYN8Kw2T7d9p985hyvRxLsVjD8yV74G0SUVHAu3/1fUWfH+MAiPEE1mO1reaX7PbSpdwpqfXGZREFsh+A1Eoen5EufM+h2yWgLK/BdWj8IGjmDBzD4AnczJdKsES84b9+sQ3Hb2+YVLZ9yaRw+Q6o3ci0AGuk7mzt3mxT9nVsh/S1eHysQecDLcdBq2HiPldsyQSQ3HmejDDkNeMDhB83+jy/LI0jCBZiGmE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(366004)(346002)(39860400002)(396003)(376002)(451199021)(26005)(6506007)(5660300002)(6512007)(107886003)(186003)(2616005)(83380400001)(41300700001)(4326008)(6636002)(66476007)(2906002)(316002)(44832011)(66556008)(8936002)(6862004)(8676002)(6486002)(6666004)(478600001)(66946007)(37006003)(36756003)(82960400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?STGRiQKRbPTdUeHzPgUkZknL1Az48m57LmazcoSHh9wzyVnznGXLQPzajODT?=
 =?us-ascii?Q?4ll9VvhKQhLqRVexBmOMUo2TqHf8+DwS4j7OO6GJZ2aUCeHJpSmbaOKl8/zm?=
 =?us-ascii?Q?xLQQJ8oUV9Z87dVTWQwRV9cy17tJGPOQL1yCEgQNtQoW0CMkz9kqe7tOMT5B?=
 =?us-ascii?Q?TNlrKxiWWA+WareQoPVnz3oVYCGmJc4TNRmT8mauFIyfMXZ2xNaPrSAmSCNI?=
 =?us-ascii?Q?2UUXOuoizFD0xfTqZ1/2N37rkPD7ypz3DiYwerFq8RttjDHJM55+fKHnf9tD?=
 =?us-ascii?Q?SqofJ64YnqtkyJJeAW8OOCtHvM+Onw2v3rp8U6eO1XeY53L7Kot7r0E0Esek?=
 =?us-ascii?Q?ZPa8bvfGLCUrMuOTdPwAkCgkFbb/dc2zCi4aB/jlnfRH7/hRjqNOV5x8zWVw?=
 =?us-ascii?Q?5JoDjW76dL7o56AVOh8SfNPBxFQ/57kKdPFTN/P9dg1G3l/veScgOcG441so?=
 =?us-ascii?Q?xJrruFsWMXPZpZD43cLOz6Uuv+b9IVgDHOvNKNBgxvMXDqcmnesN/M84YXPd?=
 =?us-ascii?Q?w1hrrqKzQ/HI3chOGgBBX/6PJPjbTlYXBe8VDQB2SgyamZFxwTMLYKgPoU+m?=
 =?us-ascii?Q?Jf2ZxCgDKKfCeWE3KZbxK6o6iSG7hzytTaGbhxIr7JPewer/aEGyB05QiDEf?=
 =?us-ascii?Q?yHxs2jUMM3Qj6PnLALW7ibAZKIeS0h9op8UUlYJ7BTuNEAM1hQe/feLzQyAw?=
 =?us-ascii?Q?GwcX4nKvlADzj4YC+KO3+5t4IVS3XIY7A5f1T6wjhtb0ZlSOZncYISaKw6dk?=
 =?us-ascii?Q?ITWIVZS7WXbYviqRgOFqzI86x43+mg+vtqw6YNpD7IbjfGIKTN+ZPejanJt9?=
 =?us-ascii?Q?IGAGgNS5EpTFmWJB4qJcpe2OYNHt2HjfGihVZB4HhcQiG25wsf/K+IyIZhTn?=
 =?us-ascii?Q?UrAMLMfxiELZVQ/5FjzO8ymCPIEaAzEtN3iyEtdMvkXmKFBfrtvYdmw4D9A+?=
 =?us-ascii?Q?pY8FlqE5C5XASfBEw1tuKvKTP5ycRydcCNFmcMdaPclTjOIT4TW9JAFDD6Gt?=
 =?us-ascii?Q?R9w5GrRdRKGcQT5oh/xSIWSuyRWFcdfP8j1huw0ZV76JQhNnuSemxpSawJXS?=
 =?us-ascii?Q?AZuovJnDalL8yBr9PrIFTo0InwiYWYCRorWQUglhbcZ96AT8CZA7bUHLnKfc?=
 =?us-ascii?Q?vtT7TL17LfvhYIMg6YrX7jpjYcLTnqhzRG7I7yyoNEC4rB5L60USp8pMNNcF?=
 =?us-ascii?Q?BLueUouJ6qbe2cLsOnkmlgQ38LNXe+vwem0sOx+2RnH4MRaUGDR3ZlaKkWe5?=
 =?us-ascii?Q?AfT37KFnhpKkunmQ6oPF9BWrvDCqFgjbFqzDasphnRUYb+dJKXFetOpqbsha?=
 =?us-ascii?Q?P/6Em1lgIMHyIn/UJZt+vDm8YxrNUDERNOTBNjYiPUQFxljkyvWWfLHukAn+?=
 =?us-ascii?Q?rsZ/mLJqdGzweLULN7eUOTn7cQSKSNuEpvuchHnSCchcMLv0lITb5ISLXkJH?=
 =?us-ascii?Q?PeiBXxuvSkOGZ4P8AvhzPUjPb24euwDZjfntVgdrF1UI72u8Fytt9VCkOJ1v?=
 =?us-ascii?Q?3JQ59+eyVKN6YtqL2x5ZxGPgLbyivFlmCSQouuLAaWDfT3nxH/93ZPrRgWcm?=
 =?us-ascii?Q?pLaTlPbK5fnzr09mZFc7ykQ47YqB10flIyg8lQw3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a86fbb57-f74a-49b2-e925-08db7f3591ac
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 22:00:26.1054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rtEny55wUHdTThWBBATXp5DjLPBm7iWz3ZQP46+I/3gHcfVbWP71SGSWvAeO2svmWHz0jR/7p03XN//o61onCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5222
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 5/5] drm/xe/pm: Init pcode and restore
 vram on power lost
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
Cc: sujaritha.sundaresan@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jul 06, 2023 at 05:32:08PM +0530, Anshuman Gupta wrote:
> Don't init pcode and restore VRAM objects in vain.
> We can rely on primary GT GUC_STATUS to detect whether
> card has really lost power even when d3cold is allowed by xe.
> Adding d3cold.lost_power flag to avoid pcode init and vram
> restoration.

Overall, the approach looks great!

> Also cleaning up the TODO code comment.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  3 +++
>  drivers/gpu/drm/xe/xe_guc.c          | 17 +++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc.h          |  1 +
>  drivers/gpu/drm/xe/xe_pci.c          |  2 --
>  drivers/gpu/drm/xe/xe_pm.c           | 15 ++++++++++++---
>  5 files changed, 33 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 8e69a6d4627a..cb4298b83373 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -354,6 +354,9 @@ struct xe_device {
>  		/** @allowed: Indicates if d3cold is a valid device state */
>  		bool allowed;
>  
> +		/** @power_lost Indicates if card has really lost power. */
> +		bool power_lost;
> +
>  		/**
>  		 * @vram_threshold is the permissible threshold(in megabytes)
>  		 * for vram save/restore. d3cold will be disallowed,
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 8245bbc58770..0c20ffd7db98 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -844,3 +844,20 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
>  	xe_guc_ct_print(&guc->ct, p, false);
>  	xe_guc_submit_print(guc, p);
>  }
> +
> +/* Srtictly to be called from RPM resume handler */

There's a typo here, but could you please make this a kernel
doc instead of the comment here?

> +bool xe_guc_has_lost_power(struct xe_guc *guc)

I wonder if there would be a better name for this function,
but I'm not that good with names, so I don't have anything
better to suggest.

> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	u32 status;
> +	int err;
> +
> +	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (err)
> +		return false;
> +
> +	status = xe_mmio_read32(gt, GUC_STATUS);
> +	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +
> +	return  status & GS_MIA_IN_RESET;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index 74a74051f354..3e628bbbe69e 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -35,6 +35,7 @@ void xe_guc_reset_wait(struct xe_guc *guc);
>  void xe_guc_stop_prepare(struct xe_guc *guc);
>  int xe_guc_stop(struct xe_guc *guc);
>  int xe_guc_start(struct xe_guc *guc);
> +bool xe_guc_has_lost_power(struct xe_guc *guc);
>  
>  static inline u16 xe_engine_class_to_guc_class(enum xe_engine_class class)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 8585b090ff0e..40f03a9d6fb7 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -837,8 +837,6 @@ static int xe_pci_runtime_idle(struct device *dev)
>  		 * but maybe include some other conditions. So, before
>  		 * we can re-enable the D3cold, we need to:
>  		 * 1. rewrite the VRAM save / restore to avoid buffer object locks
> -		 * 2. at resume, detect if we really lost power and avoid memory
> -		 *    restoration if we were only up to d3cold
>  		 */
>  		xe->d3cold.allowed = false;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 74a9bccb78c7..761d0e3e31ad 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -17,6 +17,7 @@
>  #include "xe_display.h"
>  #include "xe_ggtt.h"
>  #include "xe_gt.h"
> +#include "xe_guc.h"
>  #include "xe_irq.h"
>  #include "xe_pcode.h"
>  
> @@ -193,11 +194,19 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>  
>  int xe_pm_runtime_resume(struct xe_device *xe)
>  {
> -	struct xe_gt *gt;
> +	struct xe_gt *gt, *gt0;

I think we should just use the existent 'gt' instead of adding a new variable.

>  	u8 id;
>  	int err;
>  
> -	if (xe->d3cold.allowed) {
> +	/*
> +	 * It can be possible that xe has allowed d3cold but other pcie devices
> +	 * in gfx card soc would have blocked d3cold, therefore card has not
> +	 * really lost power. Detecting primary Gt power is sufficient.
> +	 */
> +	gt0 = xe_device_get_gt(xe, 0);
> +	xe->d3cold.power_lost = xe_guc_has_lost_power(&gt0->uc.guc);
> +
> +	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
>  		for_each_gt(gt, xe, id) {
>  			err = xe_pcode_init(gt);
>  			if (err)
> @@ -218,7 +227,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  	for_each_gt(gt, xe, id)
>  		xe_gt_resume(gt);
>  
> -	if (xe->d3cold.allowed) {
> +	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
>  		err = xe_bo_restore_user(xe);
>  		if (err)
>  			return err;
> -- 
> 2.38.0
> 
