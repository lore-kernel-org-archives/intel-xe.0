Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08405C001B0
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 14:39:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C87FF10E485;
	Wed, 26 Jul 2023 14:39:31 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED2D310E485
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 14:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690382369; x=1721918369;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UaPO6s3bJMVKVYiOiTN+kq7FULXOdFcjKC31rcZNR0Y=;
 b=KY7Dbi6rhXXyKlE0VEaiy5Scwc/KyaDVBYR9MNaWcTWBgZZE8rQm3J+4
 UCeiu0+NABbL9aqtkyIoIoSFcqO7Wk+kkKUwP5z0Unhr/ZS89K97YZR3D
 PtWFlEyOq46x6VfqYqfjsiJaoxJ2cnHLs9SGM0Z8W/ICmZTK/0EdLfK5c
 GAL80xvzbEvTSwJSMe+n3Hf6dx6ShOcP1Xf6kqll63XXy+UjzH4sPUn+E
 weW4Bi4LEqcAMnQCdTBC8rSdwTnsNXanQ8gCAj1tTUHk4zTVUMxat2xQy
 kaWQrfaU8Hr9+3tobOHL+eD8Kq+aFB2s49v9nQUzswpOpvlsiNdMf9mob Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="358032966"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="358032966"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 07:39:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="973136472"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="973136472"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 26 Jul 2023 07:39:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 07:39:28 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 07:39:28 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 07:39:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PF5tDBkUdf+1OEW6pUBWUpY+hDE5Yj95Qbaqku66JAoyxo/QnNW4KJwSBq+Dw/c1XCuaqs2j/+QZBC/BxFS/82cYcmXvd5OaYLMBgydtreRJg8gxZ+jBK8dgTVhBvmaxZETD7cIZvFeYueg2YoIHGTLoB19ajMXRUNE4AOYjT/tHsNgj/ciOX2fH+nrBo/xgJpmYWr9eaysSnb09Nik8WxfJSsqtB6ZcAYMQrCnvSC5/vqDwP7uXgEViBoGcYg6v9Zz72an4LZxYtJ4d6drTWQuisnUnvC6hKse7M6LW29r9TkzQ0et4sJvwsmyLnEaEZVbkmliOuwMNkcqGs47LzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQYRtHqDFhYVhI+89VNj5FlH7qmTTXpd8z15PodbZz8=;
 b=GyZtMgd3Fl45crgLRyghDV8jxRRriT3jcQYgdQAq1MNuER9pWAcuMF+OysV+J2aurvCAHmUCjTAKRFxwzx9n7UFNmTpo6qXu1SljRyhKKLwfRdLIiF2vW4+8FJf4qQErD8ImnYreO8MCnRtsPlezFtoEvlr6Lq8K3s5xPrAudZLxRonv4/S2o2Z1NrWFnovhcZ5eTk/jRK9GyiW3+SXatpOoRzQrVJ/+Lc7lLRmpuE/bci+by545EVlnPi5j0atOxZ7oaQR4hp8/tUZmn4zWeZfQhB7+f4vmaiP88UxH4jd1GTAlNnOSsERuABi3Y0CmEXL54npnjwSkThvLl7qS4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA2PR11MB5209.namprd11.prod.outlook.com (2603:10b6:806:110::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 14:39:27 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 14:39:27 +0000
Date: Wed, 26 Jul 2023 10:39:23 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Message-ID: <ZMEwG8O9dZ8Ri7Kc@intel.com>
References: <20230725155115.3759312-1-himal.prasad.ghimiray@intel.com>
 <20230725155115.3759312-3-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230725155115.3759312-3-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: SJ0PR13CA0060.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA2PR11MB5209:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c150dae-24ec-48eb-9664-08db8de61cb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q98Brf8uH62sqv4jjAI6TtUoTfpRw2WYFHMCm7/oBROgo3d7rlUuQVvlQ77llAqP8PqYPMMyQNx7UvgQ6T/Dt0i+9RVTJ4HtxlRxxprJstMFo9mnCb7/UGoPqVzASx5cg038YFY5/FyYRW7lSq90Tmiqu+J6zpCnNDfvBUIkO+WsgULZ9NiZ40dzCxoX3Yub4jGLa00vpW2b9Inyk0NrNqV2lwD4KgUUQyzMS0HGLMKdAqKw8KQirLIcWkDrbVRR5v8FW5EkhB0LEqoz8cIRSX86q8gpuWhGMQu2FVKIXFUoUFeIokgBirkpJeIvS7SLYBr/affk1iJ03gf6t2ucgbIiUvTuOpzP0u2Y5qCj7VKcgsEY1uRY8Q32GL0OSLEykf4BJVSG13ixPV6RTJnU+WW+TJ/XY7b69iweAsB8RkKCE1SV1wRm1b2UV/V3cbFXCNQ8zV091pon497ObX3X4EyYLUR4yZUr05ZNM+h5Skb6CzKgToDIUxCdVUDAYPAqTelFWJRBgiEycSkhYmS2rs+oS+XYhJmavEOwUlkP8MZVTD05Y2EtaFV0HBSvcMCx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(39860400002)(346002)(366004)(136003)(451199021)(86362001)(36756003)(2906002)(37006003)(478600001)(38100700002)(82960400001)(26005)(186003)(2616005)(6506007)(6862004)(44832011)(5660300002)(41300700001)(6666004)(6512007)(6486002)(66476007)(66556008)(316002)(66946007)(8676002)(83380400001)(6636002)(4326008)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DIqgVkJfiBRhVDX+UwpuKDUJWsz3PVi8Sbyas6KscNbkoJv9JcpXFVA17H8A?=
 =?us-ascii?Q?LHrSuMAzv5NEjj88ZCT6WI3IYAWTNLycKCI6g9YJF767Ui0RrsDt0yWW5mb8?=
 =?us-ascii?Q?0avTPOqxza5oA4Vd3jWXWLnn5GyN3dXQuIEqNJ/+PRnZJStM2HBv77ECVc8Z?=
 =?us-ascii?Q?9hefuAxYPOl/A4+KDUPH43D/40ikG2R6ByKGonjWLbbkhgFC6yqmfpssf44s?=
 =?us-ascii?Q?SJtpTKv/NGs1DmSvggNx14d23y8jDjrQmNhKrWvJ3Asfhaluuz0nZllPT1wT?=
 =?us-ascii?Q?zfHGc7W8xWAJPl57KJFDJujsbOKNyYCTD1X9SpOqKK1v1noAeicXzEllINaa?=
 =?us-ascii?Q?RY3XAbWcoz9KlBflCYduz6BH5nKChKZe1Ykk83+Uq606Df0I8SBDyJbRCJRo?=
 =?us-ascii?Q?CqPDxDMGQwKS64bpb+o94/ROb8WxM3q53RRWWBygJ5zG1QEEFAJT8YPYQxAx?=
 =?us-ascii?Q?2KxSnrjF4pPZEo+VKlUUjv6SCb4xcqA9CJUwsW53attoexMauwA49+zqvbQT?=
 =?us-ascii?Q?ScTfDUprTznoOoO1iCZ3zy8KckZc+SlZgYznjdJ9lx5bV1few12mBJwp7iwO?=
 =?us-ascii?Q?7hwBTq7fJdnh9HlLt/3xkt4/0pGM8v9NV5kzJ1+7kDBCHqGRp33KMXmzG8Wt?=
 =?us-ascii?Q?IMnxsLuw12kHL0NAAhE1xDtzVzNZi3OUD7TLvhu1EhingVWAXUbwB5n4+p44?=
 =?us-ascii?Q?Q7Ft9wBXsPzQyG26NWejhPVk7DS8OMh+bJGTDyeA3mpz69EvpXJHDEu9GRwa?=
 =?us-ascii?Q?g3AkLoO+8l5PRoOq9BwZb+Q+83EZVo6VybOp/hTkVsM1YakgbSZggOnyi2Wv?=
 =?us-ascii?Q?T1UZ+FH0Kogwc7hanzyDsZRcrWWKYH/ifWCpqj9ajzwU/VWpX8N0n8ZHDAy8?=
 =?us-ascii?Q?0MFKN7/rsmcrgUTes2XATs6eWP2CcssuVHi6gvaF7v5cipd3pzKZoHyQqt7H?=
 =?us-ascii?Q?UiDIvTy52g3LMZZ+fW6GoPBLXQEfduSCXUgyW39Frb5YUlhrDSsND1bPRVwS?=
 =?us-ascii?Q?apFVJLdnrYnrML+vHtFaxJHG/UfWoHQmdBxOnn2PYZlC/aZ1zx46s44QEaZu?=
 =?us-ascii?Q?FDPGxtw+yWSzIG+WdKRnWumJ0KqntX506Z2y3a1zoCnUOpQqbwarVdhgw3kK?=
 =?us-ascii?Q?J35S/cqbUs4SYBpkkVfKbDdZHzr9v3WLj47XVOSyZrnWIL/LBoWEJhcHy1+h?=
 =?us-ascii?Q?BiOcLxlZiLRQJ/u4hws1K05wbExhnhsM0ib7RFS7Xm806Qsddzp2q/iFLIkS?=
 =?us-ascii?Q?pg8GkUOxdx5wPX95pKUbbo5fKWmyv7TG7r+0sHej4o+wS9M642sTg+jmd8xT?=
 =?us-ascii?Q?Piq83YMGRYF1CTDaYq6sUUK3MCUEzigIqPM1W9one4r7J4VXMb5g9JO2azCU?=
 =?us-ascii?Q?HEhpPD7X795m8jVDl5DaAdNqGXgULrZhk1UgBhO3gicYhNdLBhQOAqN+EpHc?=
 =?us-ascii?Q?L1PGBzG4CbG2CmlKkJKNy6llr7lLQpNhZVcY5x6r+fygoOZ4/cyGpEwVxDER?=
 =?us-ascii?Q?SRg9qpYpX3VbZQ51FQESBroXFVzRezGKkV/VjdxQ7h5z7mbYUcioO5wnXAa7?=
 =?us-ascii?Q?RHifUk0lTj3B/7sC0ys2hxBqKWg1GmiyHBG4M9J++SmJdTSgfRTfyXVB+GJH?=
 =?us-ascii?Q?sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c150dae-24ec-48eb-9664-08db8de61cb7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 14:39:27.0432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w7BGDLPwh+wnh6Xtw2hDQmQ3Pi2s216nMqJKEBCI8vWwvoAxuLgKk5rXk6xaxs1hpUsaH/UAUhNc1g6TSg1VSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5209
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v8 2/3] drm/xe: Notify Userspace when gt
 reset fails
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

On Tue, Jul 25, 2023 at 09:21:14PM +0530, Himal Prasad Ghimiray wrote:
> Send uevent in case of gt reset failure. This intimation can be used by
> userspace monitoring tool to do the device level reset/reboot
> when GT reset fails. udevadm can be used to monitor the uevents.
> 
> v2:
> - Support only gt failure notification (Rodrigo)
> 
> v3
> - Rectify the comments in header file.
> 
> v4
> - Use pci kobj instead of drm kobj for notification.(Rodrigo)
> - Cleanup (Badal)
> 
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Cc: Matt Roper Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt.c | 17 +++++++++++++++++
>  include/uapi/drm/xe_drm.h  |  8 ++++++++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 3e32d38aeeea..f4766fb6bfdb 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -8,6 +8,7 @@
>  #include <linux/minmax.h>
>  
>  #include <drm/drm_managed.h>
> +#include <drm/xe_drm.h>
>  
>  #include "regs/xe_gt_regs.h"
>  #include "xe_bb.h"
> @@ -500,6 +501,19 @@ static int do_gt_restart(struct xe_gt *gt)
>  	return 0;
>  }
>  
> +static void xe_uevent_gt_reset_failure(struct pci_dev *pdev, u8 id)
> +{
> +	char *reset_event[4];
> +
> +	reset_event[0] = XE_RESET_FAILED_UEVENT "=NEEDS_RESET";
> +	reset_event[1] = "RESET_FAILED=gt";
> +	reset_event[2] = kasprintf(GFP_KERNEL, "RESET_ID=%d", id);

should we also put which tile this is coming from?
Matt?

> +	reset_event[3] = NULL;
> +	kobject_uevent_env(&pdev->dev.kobj, KOBJ_CHANGE, reset_event);

Himal, could you please paste here an example of the output of this event
when monitoring it with the:
$ udevadm monitor
?

> +
> +	kfree(reset_event[2]);
> +}
> +
>  static int gt_reset(struct xe_gt *gt)
>  {
>  	int err;
> @@ -550,6 +564,9 @@ static int gt_reset(struct xe_gt *gt)
>  	xe_device_mem_access_put(gt_to_xe(gt));
>  	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
>  
> +	/* Notify userspace about gt reset failure */
> +	xe_uevent_gt_reset_failure(to_pci_dev(gt_to_xe(gt)->drm.dev), gt->info.id);
> +
>  	return err;
>  }
>  
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 347351a8f618..fdacee0a27c5 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -16,6 +16,14 @@ extern "C" {
>   * subject to backwards-compatibility constraints.
>   */
>  
> +/*
> + * Uevent generated by xe on it's pci node.
> + *
> + * XE_RESET_FAILED_UEVENT - Event is generated when attempt to reset engine
> + * fails. The value supplied with the event is always "NEEDS_RESET".
> + */
> +#define XE_RESET_FAILED_UEVENT "DEVICE_STATUS"
> +
>  /**
>   * struct xe_user_extension - Base class for defining a chain of extensions
>   *
> -- 
> 2.25.1
> 
