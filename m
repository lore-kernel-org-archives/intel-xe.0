Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103D6C636CC
	for <intel-xe@archiver.kernel.org>; Tue, 31 Jan 2023 18:51:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E61EF10E382;
	Tue, 31 Jan 2023 18:51:22 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB2310E382
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Jan 2023 18:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675191080; x=1706727080;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=Ti5TZ1MqhYak04GEwYvWpnGi142E4RdVzoIVoBisMhE=;
 b=O8cti3zREe9/fBM4YlXyBGY3UXx38IOerWnL7g4eAiy2l6/LXCufYWCj
 KuHE+i8NtxU9SC0TQBlJHYy/Nw6fUIsyIGRyhIc/7gIReH+KNc+5C6p32
 htfOoxQ2IxOvNbwKJckKdTfllEzEuQDCmxCWMib66XPUo905S3hvXvbZw
 D5XBbzOtHvvmDZ+IUAScrebQdC07A1g+PO/TYVJbX0duBxf/8z3twOI29
 2Qoh5e59zaB/QfSpNQpiZ1TIOfnw+U0TvnRX8vBFJqpsRCO7EfHHIlp44
 uGZbDpE8N76+p5o8FEWqTyfrYbLb7R07bVP7KSWOyMmsesKC+0JiONSU8 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="414139266"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="414139266"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 10:51:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="666604455"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="666604455"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP; 31 Jan 2023 10:51:20 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 31 Jan 2023 10:51:19 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 31 Jan 2023 10:51:19 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 31 Jan 2023 10:51:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=haqEtk073JKOHoDcmjKZFjrr7waZxfOb/g5Aq/q9cJECRvm1Rd3nDDtUwmIIJ4ruLU2U4wKAkFnF48vlQpyEgswksPtXK12oua2W46SFhunjog8V5o9IpjYLygXLsmIcV5wNns3dWWUYuISJ4SZJNkd/ZImYqKv4zFwjRX2Qs5/C9ocz1EtgMn7BaY5anxdHDczUSRg4ZvZxZSkZ1ZCqbPpOovUeZEL2f4K8Hy1CaZN/44Nc1MW6uvePn4iLTNSxyF0GCYbHgSXlBGq6LCm12fAK80CKrqwJ5nsw23sey0qyvChuwcRcfZeXe+jd/u5y+KDWz9tVeOIgTgp/Z0OfDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WIHv9Q+xngeDgA9TnRCe/TqeD7ab5FIQ1L6duTSJox0=;
 b=iFI18Bx4bfrRtznf0IYunIhwsCG68lUKpRqmM0Wti5izWQATduQSiueM8GoN/9EubZbl4XIlqcowNdkhgF5pAUxmCS9W5Ticq1OtGVcoo+I0gd5+OvAjry81IK9WI3ALEpOCJEMRwmkVXJakKKpbJDSAMZRIGanJL32n7CUPEtm7F0C13qnfyFoUcz6+SowLPGnEFjVMpoQ9bxIaJxS4q/JYjjiE6L875uOf0I1m5UqJhZSWMw1Bby/qLsMg0p5YK9Tp6u3hIbn87ovBvF1hxRom2V4/akL6PfILUayI2mI7fSIEATrr/lJPuhXpO/16JssmYCOCE+c2mKIlloaCTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by MN6PR11MB8195.namprd11.prod.outlook.com (2603:10b6:208:47f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Tue, 31 Jan
 2023 18:51:07 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::d12:2d58:992c:aa50]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::d12:2d58:992c:aa50%4]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 18:51:07 +0000
Date: Tue, 31 Jan 2023 13:51:04 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <maarten.lankhorst@linux.intel.com>, <philippe.lecluse@intel.com>,
 <mchehab@kernel.org>
Message-ID: <Y9ljGJwM9Ks/DabI@intel.com>
References: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
 <20230112222538.2000142-29-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230112222538.2000142-29-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0182.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::7) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|MN6PR11MB8195:EE_
X-MS-Office365-Filtering-Correlation-Id: 82e64440-aa99-4d80-f401-08db03bc1cb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xxz+ycoj29EuLzDE3LyCnB9MuNufSH139I5nkJJChVDBljQGo3c0WENfjrkSXX504+h3Uy0oXG+9iB0h3a1K/Y4A2piMFECRaBMrf1irF57KGzRHHLrWAu3tu5QeIB62JMTnaO2Av1LrXF8XlOYGkUfNjH5Qblzs+29dYaJmNCk57v1EZpD6UzpBytjriUwCr4WqAGKF/G+AbhfMGmcGHyckHUuBJ1/4CzHZQVtPPYtoLIbWcgndXXkmbGx6JUQiyKc6ntw825w2p06BDxJeBvkh0TmqD5irEDLbZPyj0nKysOKmkD5/RYXPVnxtzfE2B83mnUx4wkT2PewqEx0ranAwlBfHBxrlP6ZYCMl27jtmJy2SMdwbrU60os40Oesg/GKYLIQeyCQk5hQlpUvMwySt9UHedgezpxvC6LyhMOFDaE+YzLhQ9FhCBE8UgE8TMcBU3FOhfELVPE8pQsRpKsIDCfJwLDBPWUsEfvkF3R3QjzyQIUXAtqLZN03Fecrcjd6a4q29fx8o2TNzJ3p3RAggtwl5SnqSAkqiDOhuZuI+6no7WTfWOjiYCZSm6zz9Vhv8lPiC/vwBWaWd7/6n4gWq1LTY2lD2gdy8oPDpWclaTChJzD96H7J5MfxmjPCqdKjU8kVZVK4JWa2ya3aw/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(346002)(376002)(39860400002)(396003)(136003)(451199018)(2906002)(44832011)(5660300002)(8936002)(2616005)(86362001)(41300700001)(83380400001)(66476007)(186003)(26005)(6506007)(6666004)(66946007)(66556008)(8676002)(6486002)(6512007)(478600001)(38100700002)(82960400001)(36756003)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AE4SEuz5jGamnJHsWEcyj4DWKXWnoTkxu/yHI+uVss3QczWOUSMhb6FqG61j?=
 =?us-ascii?Q?zvKzut6QgcZDIOSPwtH5+cntPKL21bD65LYL5nePLT7Id0fUId9ADqfbq442?=
 =?us-ascii?Q?WFBFSg63wWDvqQcbv/hexSAQCKcfiDm693/9X+IN/D84GIeuYYGvoUXZiJhN?=
 =?us-ascii?Q?apYiuvw0ZwTUlc0/IfMheSff3Bh2SI7B05f7gfWtJz+wxbGoDW2jffQb/YX+?=
 =?us-ascii?Q?6KKeg5TL9i0KU1IP0alJ892ptVmts2ITcJ5blRnHdHXb3/KUAHZbwDazpgwX?=
 =?us-ascii?Q?RxnBvR+Aki9pwnB0GbDddWW7vMK9F3IvHwszyG7jlSIEzMtZMqfHkyFDUJTb?=
 =?us-ascii?Q?tEkTt0gTr20F5S7I3DQBjwyFZebL4fxFKdwOYXXuC4w8Mm3thx8lKMdwuEzT?=
 =?us-ascii?Q?qffDZGRhZspYywu2XbwJ0uV8E5fw/P3rzCMmTxQrk1+Hn/jT7K6CDjlAluZs?=
 =?us-ascii?Q?f83oAyBQehiPwKyC/S9hFcJ0AfvHcwchxKS2uL1JhG9/D9t6UKvt7HLCaU3+?=
 =?us-ascii?Q?hREfri8+C8o47HbVcWMai0WWt3oa5BRrUc8ECTmw3xjtfp8iOaQUxSliIehz?=
 =?us-ascii?Q?SxX2rEV9hAZqJjPcK1gYQuL1WoifvRm0BhwJ8MSiBg/N+VYIz5OhKv4tOkB0?=
 =?us-ascii?Q?HN1UfINTunzNaJVnGZkFMXzCFo9IfiDYcyhCTafoTJfMIocecE+eanoBoH4r?=
 =?us-ascii?Q?l8bMkGcnpC0tuBO3YoH+1/s11O2jjmsyhiX+ojU83HNestTLG8N+nw6E/QNc?=
 =?us-ascii?Q?slqbs5his/vpZ7klrw7HierdxYYNyvIX5cCDfMU6OQM20mQKI1141xApHkOQ?=
 =?us-ascii?Q?qbv0PqgwsfXWwqt0krFup35q2yfUqB9ymjULYlzNdKUj6453VBQqOVBLCd9x?=
 =?us-ascii?Q?noqS6xbZzcUjUWxOZU1OsE696cOxt6ZKpXoqH+K3XUfYO05JxGaDFX16NtUD?=
 =?us-ascii?Q?sbHgrwoWXk+pkAQEtJ97HApcrsiRBwxYjB5zzGCrlod23QaKxFRviMNhcaGA?=
 =?us-ascii?Q?ad1ND4Gnc/cueX5imqmDFfH8GkYsfRzCq1N3nwiwcOYZ6RN5Vh3UgaaOUO7N?=
 =?us-ascii?Q?fi5WuVCAfKgG9MafhwHNWJ///wzPvQJmLFpOzytTlWEsjscILOpX2rSn3TxJ?=
 =?us-ascii?Q?IhjPMFCa0hlM4R42udse3gP+iA4EFI0D4oiddpzhiUDs1kS7n2JtxtqGvEfD?=
 =?us-ascii?Q?QaeTl6/doWBQvkRCs1pGOQh6CjS6lDgpxF5cCC+ncN2iODSbxQwloXpPPVYN?=
 =?us-ascii?Q?lpZjQkSVbRpuoUDCJhWBK57gEkPZyqXtHSwKMsgLVKR45JriUpI5Plxyr9WC?=
 =?us-ascii?Q?7XowqVWBZlwMfTJeMl2OA36OTcUfI8TqQ9fZnpEOjM/CH7zG/1sxx6yU9RNn?=
 =?us-ascii?Q?tjfQxRvA/EHUeSIMhxdToYuUWMy+RVmq2GdnerTz5QbnW41EesbkhhkK5FdW?=
 =?us-ascii?Q?s6/KW15VAmmETbw2dyjec+R1jIOBjdiLQ66ZVkrVPZ8UVSxRx400UbJuHtOE?=
 =?us-ascii?Q?vqbEMcPSnEma7PbKdg0uD0YcOsEfMrr28QT4qGdyzcI07leb62sQwYxda0mQ?=
 =?us-ascii?Q?BIoFbVuN+kJ3NNsDfDWCv4TtIrLM7oZdlCTnUsUC95E91cRQctg+vf92P44+?=
 =?us-ascii?Q?/A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82e64440-aa99-4d80-f401-08db03bc1cb8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 18:51:07.6643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KLR3snSE6FNsWjG7QphMpB3HReQDdxiFdNJfuXFjcFuGpKAnyRzMcXjAjbGdIadPT7BB+aeOkEue4nuzTbuUyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8195
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 28/37] drm/xe: Don't use engine_mask until
 after hwconfig parse
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

On Thu, Jan 12, 2023 at 05:25:29PM -0500, Rodrigo Vivi wrote:
> From: Matthew Brost <matthew.brost@intel.com>
> 
> The IRQ and MCR init used engine_mask before hwconfig parse (currently
> faked), move these steps after the hwconfig parse.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt.c  |  7 +++++++
>  drivers/gpu/drm/xe/xe_irq.c | 34 +++++++++++++++++++---------------
>  drivers/gpu/drm/xe/xe_irq.h |  2 ++
>  3 files changed, 28 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 6cea15725cae..75150077d62c 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -21,6 +21,7 @@
>  #include "xe_gt_sysfs.h"
>  #include "xe_gt_topology.h"
>  #include "xe_hw_fence.h"
> +#include "xe_irq.h"
>  #include "xe_lrc.h"
>  #include "xe_map.h"
>  #include "xe_migrate.h"
> @@ -449,6 +450,12 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>  	if (err)
>  		goto err_force_wake;
>  
> +	/* Enables per hw engine IRQs */
> +	xe_gt_irq_postinstall(gt);
> +
> +	/* Rerun MCR init as we now have hw engine list */
> +	xe_gt_mcr_init(gt);
> +
>  	err = xe_hw_engines_init_early(gt);
>  	if (err)
>  		goto err_force_wake;
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index edebe1817400..92fe6b38d735 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -492,26 +492,32 @@ void xe_irq_reset(struct xe_device *xe)
>  #endif
>  }
>  
> -void xe_irq_postinstall(struct xe_device *xe)
> +void xe_gt_irq_postinstall(struct xe_gt *gt)
>  {
> -	struct xe_gt *gt;
> -	u8 id;
> +	struct xe_device *xe = gt_to_xe(gt);
>  
> -	for_each_gt(gt, xe, id) {
> -		if (GRAPHICS_VERx100(xe) >= 1210) {
> -			dg1_irq_postinstall(xe, gt);
> -		} else if (GRAPHICS_VER(xe) >= 11) {
> -			gen11_irq_postinstall(xe, gt);
> -		} else {
> -			drm_err(&xe->drm, "No interrupt postinstall hook");
> -		}
> -	}
> +	if (GRAPHICS_VERx100(xe) >= 1210)
> +		dg1_irq_postinstall(xe, gt);
> +	else if (GRAPHICS_VER(xe) >= 11)
> +		gen11_irq_postinstall(xe, gt);
> +	else
> +		drm_err(&xe->drm, "No interrupt postinstall hook");
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> -	gen11_display_irq_postinstall(xe);
> +	if (gt->info.id == XE_GT0)
> +		gen11_display_irq_postinstall(gt_to_xe(gt));
>  #endif
>  }
>  
> +static void xe_irq_postinstall(struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	u8 id;
> +
> +	for_each_gt(gt, xe, id)
> +		xe_gt_irq_postinstall(gt);
> +}
> +
>  static irq_handler_t xe_irq_handler(struct xe_device *xe)
>  {
>  	if (GRAPHICS_VERx100(xe) >= 1210) {
> @@ -566,8 +572,6 @@ int xe_irq_install(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> -	xe_irq_postinstall(xe);
> -
>  	return err;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_irq.h b/drivers/gpu/drm/xe/xe_irq.h
> index 7aee8d259353..34ecf22b32d3 100644
> --- a/drivers/gpu/drm/xe/xe_irq.h
> +++ b/drivers/gpu/drm/xe/xe_irq.h
> @@ -7,8 +7,10 @@
>  #define _XE_IRQ_H_
>  
>  struct xe_device;
> +struct xe_gt;
>  
>  int xe_irq_install(struct xe_device *xe);
> +void xe_gt_irq_postinstall(struct xe_gt *gt);
>  void xe_irq_shutdown(struct xe_device *xe);
>  void xe_irq_suspend(struct xe_device *xe);
>  void xe_irq_resume(struct xe_device *xe);
> -- 
> 2.38.1
> 
