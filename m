Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC855C38142
	for <intel-xe@archiver.kernel.org>; Tue, 31 Jan 2023 18:49:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF40610E382;
	Tue, 31 Jan 2023 18:49:24 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6384F10E382
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Jan 2023 18:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675190961; x=1706726961;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=+WdYFSmPyE7rYOqBVNtcZ1BpwPXWJO277JnWb1lISBA=;
 b=U82ZEeAp7K7bWCmb04gBXpBcdfE7HpR0HKPeNiRR+/BXmkPaRfMF95/T
 nN9tZCdjQkxQWRjMcII4/WBMfpjY/6nrH1TSU7voWEgnE9dye0+S+MPTr
 czSM5fn+6yERtiZYtIE7E2obODU866OnZc3bKssq8kjG2p6CS/FGJM3VU
 3hCNl0asK1cCvVjDqMYDjJjE1UUHMPtJBprGlu61FjZx3ojXE81+91tIv
 HP6TDO8+ODgNGq9AeweTi26HN7f67vHr2ld5ctr1UTR6joqPi5uRuAIU5
 2oI+f/iP7dSLW3T/KwHeE1NgS5V5/WM2aTs+wRofyhcFWq4gC2d4NkGUi w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="414138791"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="414138791"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 10:49:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="666603873"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="666603873"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP; 31 Jan 2023 10:49:15 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 31 Jan 2023 10:49:15 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 31 Jan 2023 10:49:15 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 31 Jan 2023 10:49:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kigLx3WAuK/5XoNG9zgp5P/PMI7McgmBlT4KH1HiHPnxvIFXZHYPqJIFa1WaLlDVffST4+5lYG5/EgdqOno5wrGqn+gSnuSV5JhyP2bR7Gdyjx35Yi9Fc23e7BirTSv+4jmfkjuaiwGqI6tUOtEOS0mAZxpJ0gMXgt3i9ugz/VrBKo2iboq+PGxkuzJ/zZqQDBnBzQspCEmBuXp1LaRmGDAJz7lIXic+am1ZxzhCn/I+K75Bf7qNeVyya3F/qGSWRF8HmHmvbzFFrmrkFjm8tx6Hok2zWpLVaCdJ1+Z82oo/0iyz3y7RXx/0iiuXjRfVS9Ilyw34OmAc43DpOSpwtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjmbH4NYMwJ5tWm7lrn/UbtuV+D862K+dNrueAtJ5C8=;
 b=Xeai146VYnRqSoSjPMqGkVSVMX6QfUZ6eKcu4L8pgYm2AHZfYtvctMcjhHEIQIgAmiyiOjQdjB1E4EsVyrlcwX8T5PV6A/PGaKUZSNXJ06ATgeUBrw+PMtK+n0AmyxJ/UYIMLV8XCGfc3V8EcHva1UTjS7nzIIf3P7OGIKuOUojcWAsXJyzrab6tITeNp5ZjyOnw9kIJlLhhnloJXwVy7dDUlnKXvevwBCPzR1ILhGmgNTp3bZLs3TuTUwsKkWlOMnr9cqnubNhMPVT0i8SOyCLcVVMHCRPxDQ9sapDe3FvlYKpBWQ/Orr49vqUIWRhFIGhIqoZ4l30yMfdKz4X5SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by MN6PR11MB8195.namprd11.prod.outlook.com (2603:10b6:208:47f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Tue, 31 Jan
 2023 18:49:07 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::d12:2d58:992c:aa50]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::d12:2d58:992c:aa50%4]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 18:49:07 +0000
Date: Tue, 31 Jan 2023 13:49:02 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <maarten.lankhorst@linux.intel.com>, <philippe.lecluse@intel.com>,
 <mchehab@kernel.org>
Message-ID: <Y9linmMswlANIT8f@intel.com>
References: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
 <20230112222538.2000142-3-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230112222538.2000142-3-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BYAPR01CA0004.prod.exchangelabs.com (2603:10b6:a02:80::17)
 To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|MN6PR11MB8195:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d635322-78c9-4709-e8d9-08db03bbd539
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qNfb9QZDIJ+HlYHXUdNYtDgosC5EfUfDEv/RTDygMPEvwxq1BFxEJ5wFJTdcQYnDCdBEdUvbcmLPe9SJwB9TBbRUjYtETiUEGFUFt8gobB7LJGOGvyf33nNigigKXt/3W4YRUS/OUR+/MWCm2D8nnBundHyZvFMEZWS1aQUheQU2lvcVCTBtSghH6BfL9rWRklxtMr0W3yUkt0MqnB1KPxx2Cs4WtR72kx7ldCJnfHQdr2YCmqgJBZpNUqfN3YaQNxVY1ksVNSyxJ9DtnZBrm99aMxipPTp4L3mMWqOt6ISJRCuqn0sYftMLSpGg3ToiS+0+wiEUMxEw2cyZwC55WLwncNmjcnYQLHSSZuTWWEe8f14olsA666rBu3DxYn6UTjOPrw3Xn49mry1AIcaz6OdZqlMSnqgdlZqcM96mF1y522vpBFWTSWdEvCSpClwI5G1YQDf4pErFpzkrFp+t3lqccAJ4udoxSPVM6muFZCzhP60rsI8K6iQqTwJY0SOItBUhfbSLf7kTg5XK8SEvctKJ3WvLor6XJNK1G7jnRr0KImt8/BR4nQobyuuwt9A5mbCXITznJ7UvVw6iV5P118s9x1IPIA+6U00YMZ3HDgUTm6kleUUcxfUZyvMJIMKxBEKH94NSNpFcV6/bcP75dQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(346002)(376002)(39860400002)(396003)(136003)(451199018)(2906002)(44832011)(5660300002)(8936002)(2616005)(86362001)(41300700001)(83380400001)(66476007)(186003)(26005)(6506007)(6666004)(66946007)(66556008)(8676002)(6486002)(6512007)(478600001)(38100700002)(82960400001)(36756003)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5TigMp/GD9+kgI/JDHHi1Plhn98u2oB7n10yVPepHxFa8VYIfUwtJP0xds0I?=
 =?us-ascii?Q?k7+JXK0mIlyMfd56A2Jwq0cM7lwZiaPmyhK1BV+EnTDe1IZUs9xQ1sx+mMx1?=
 =?us-ascii?Q?uQJKHbpEJ9kR5m8Tb2MhhReFxLKsPBTw99qvjoYPcewzWFwoDuFxhKDZZ/sd?=
 =?us-ascii?Q?1QXQPdhtJ0r5dIy4Sk0G3aCDDJVCudWh6NXqxTGOZ9ghYyW/K/WTd38UbBJV?=
 =?us-ascii?Q?cTdN1JMzB56o0vKhqIp+7G6dpuCpZoutt78XVFRJWvqe1E0mj4CYNiKXUO8Q?=
 =?us-ascii?Q?jUAeZ/ejE6HDWJKScOXXu6tnuqnolB3csdM2fXuzBjsWlvc4gN/dZSqhHSeM?=
 =?us-ascii?Q?TwWaJHU8e2daGQ5UvRCSVHhdb+1cnM8qJqSFgA9zaCW63n+oUGNAXUsqcmSB?=
 =?us-ascii?Q?qynD1FT5U3IBtCVrIT6gk7yxRNQuOq8pzobqdaQCyYxEk23JhicMb4ayBxL+?=
 =?us-ascii?Q?0kHCgTqa3ENEwPDZlYV7OURPMJ/8AkTBVvJA1S0zukz2th1EyBPEYVY7STe2?=
 =?us-ascii?Q?VdJScvfVv+Y2RIQDdxGd8bbYw72zvO4xsNi2ID4PkK7++kIcvkXwdPk+9Xel?=
 =?us-ascii?Q?jnberiQ4rYFZSpVpDH9sV+f0lIX0lxJT9zGeMhycGGbUOEC2ujG2XgeFIjTJ?=
 =?us-ascii?Q?ifosiK8I4Nufxe0wMs+O3aHuzavyEvEChqlnmP0YcIFkr2GYQ9VIXCQsccme?=
 =?us-ascii?Q?Cc6ko5oSyUZKDhd5vG6rn4tB0bQ3XZKuCGSS/Lf0bejRo1UP89qZrkD7ULb+?=
 =?us-ascii?Q?yLL6XR6fowhC2ROGTpHIAAXj6tMzVoABShDVAVP1YC/IugAUmiQ+o2V6H3qX?=
 =?us-ascii?Q?6fAKaXVnRccsOiWWVZFOPGIYT+LicChKIAU4XvCkZX2mpTkYG7HNSPYlaCFc?=
 =?us-ascii?Q?Q0XtGPQwQG1hHjKtfqrrYeBuHmfyM9H65z6x6rOyB2iBc75D6czgpUV0jDmA?=
 =?us-ascii?Q?DtS569d7hYvJNsvf7gxh7y4YO8xlou1iu5b4FS4crGA9o+3YBuFGOaIjIB/J?=
 =?us-ascii?Q?WS0xZ+v+M1FtAnON94AOxJBgUjB86EeSrwlUWXPmCan0UE8OeG03lySzCLJs?=
 =?us-ascii?Q?L0/Nbv0sEdufFLnxWeZeU0hke+7fb3F+bmKKLTHoLFrXxkg+4Mh8KvfV4S38?=
 =?us-ascii?Q?4QP6UE3Epvwon1ZXbDz7/5rqdvMyjCzJe9r4oB+Vf6gT3Y0xJ/bloVWsZ7mX?=
 =?us-ascii?Q?qD4L9j3XuhvjA0x6B3R1alSOOC+SaNB3qim1JUYJILpjkuYbcoxVHNspJLz8?=
 =?us-ascii?Q?aQ0WRUDx2K2KDw6Me2FgdfJINUxYjV71iU0OUR6Cqp1jTCoPboy8c/Xjcltj?=
 =?us-ascii?Q?O91Vp7mR3FzelX1EPIvk0lTGuzLMGELh2/EzybXZsXiEYwrFCO4QwCSv3svA?=
 =?us-ascii?Q?WZXWpwgALFoJwKhUiyGu664Z0LG9nu8pU9DZ39AW/9r6I+jTd81Wx7YH0ttQ?=
 =?us-ascii?Q?Yvvoc1FRIFYP5+AuxI6y0jBrTQMArNRMQY1hcxj1FnIn7ECexeCb7kcDo7Bu?=
 =?us-ascii?Q?hmFX9IZZFTnYfPGBLLKaKhpB6NM6fSz7fHo7FxMr0iPHvKk/Debx9RYR/fpc?=
 =?us-ascii?Q?EzG41dcQiQ92r2dlftbG4McFM9HdJresHYDzXMmUNBOw4Ctjv6bSQaAaQSQv?=
 =?us-ascii?Q?Yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d635322-78c9-4709-e8d9-08db03bbd539
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 18:49:07.7135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +l6RNgqQFE6+E49usDyqeTeGO7mq1s6YjG7Uq2vAPmKa57XtNmXTckWPJIMUS5oyjTWKH1IPmdOovH344bRIkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8195
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 02/37] drm/xe: Implement a local
 xe_mmio_wait32
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

On Thu, Jan 12, 2023 at 05:25:03PM -0500, Rodrigo Vivi wrote:
> Then, move the i915_utils.h include to its user.
> 
> The overall goal is to kill all the usages of the i915_utils
> stuff.
> 
> Yes, wait_for also depends on <linux/delay.h>, so they go
> together to where it is needed. It will be likely needed
> anyway directly for udelay or usleep_range.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Matt, may I convert your gitlab approvals in reviewed-bys?
or do you want to go one by one here in the ml?

> ---
>  drivers/gpu/drm/xe/xe_force_wake.c |  6 ++++++
>  drivers/gpu/drm/xe/xe_gt_mcr.c     |  7 +++++++
>  drivers/gpu/drm/xe/xe_guc.c        |  7 +++++++
>  drivers/gpu/drm/xe/xe_guc_pc.c     |  7 +++++++
>  drivers/gpu/drm/xe/xe_mmio.h       | 29 ++++++++++++++++++++---------
>  drivers/gpu/drm/xe/xe_pcode.c      |  7 +++++++
>  6 files changed, 54 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index 5a5b6e3e715d..04b22eeb8ab5 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -10,6 +10,12 @@
>  #include "xe_mmio.h"
>  #include "../i915/gt/intel_gt_regs.h"
>  
> +/*
> + * FIXME: This header has been deemed evil and we need to kill it. Temporarily
> + * including so we can use '__mask_next_bit'.
> + */
> +#include "i915_utils.h"
> +
>  #define XE_FORCE_WAKE_ACK_TIMEOUT_MS	50
>  
>  static struct xe_gt *
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index 63829d8c8b54..ce776b260750 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -11,6 +11,13 @@
>  
>  #include "../i915/gt/intel_gt_regs.h"
>  
> +#include <linux/delay.h>
> +/*
> + * FIXME: This header has been deemed evil and we need to kill it. Temporar
> + * including so we can use 'wait_for'.
> + */
> +#include "i915_utils.h"
> +
>  /**
>   * DOC: GT Multicast/Replicated (MCR) Register Support
>   *
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index b5557375804f..373c94230fc3 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -22,6 +22,13 @@
>  #include "i915_reg_defs.h"
>  #include "../i915/gt/intel_gt_regs.h"
>  
> +#include <linux/delay.h>
> +/*
> + * FIXME: This header has been deemed evil and we need to kill it. Temporarily
> + * including so we can use 'wait_for' and range_overflow_t.
> + */
> +#include "i915_utils.h"
> +
>  /* TODO: move to common file */
>  #define GUC_PVC_MOCS_INDEX_MASK		REG_GENMASK(25, 24)
>  #define PVC_MOCS_UC_INDEX		1
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 38b1275ea655..515b7aab03c3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -16,6 +16,13 @@
>  #include "i915_reg_defs.h"
>  #include "../i915/i915_reg.h"
>  
> +#include <linux/delay.h>
> +/*
> + * FIXME: This header has been deemed evil and we need to kill it. Temporarily
> + * including so we can use 'wait_for'.
> + */
> +#include "i915_utils.h"
> +
>  #include "../i915/intel_mchbar_regs.h"
>  /* For GEN6_RP_STATE_CAP.reg to be merged when the definition moves to Xe */
>  #define   RP0_MASK	REG_GENMASK(7, 0)
> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> index e7cca6d2f81f..d3bc0989ce2e 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.h
> +++ b/drivers/gpu/drm/xe/xe_mmio.h
> @@ -10,13 +10,6 @@
>  
>  #include "xe_gt_types.h"
>  
> -/*
> - * FIXME: This header has been deemed evil and we need to kill it. Temporarily
> - * including so we can use 'wait_for' and unblock initial development. A follow
> - * should replace 'wait_for' with a sane version and drop including this header.
> - */
> -#include "i915_utils.h"
> -
>  struct drm_device;
>  struct drm_file;
>  struct xe_device;
> @@ -84,8 +77,26 @@ static inline int xe_mmio_wait32(struct xe_gt *gt,
>  				 u32 reg, u32 val,
>  				 u32 mask, u32 timeout_ms)
>  {
> -	return wait_for((xe_mmio_read32(gt, reg) & mask) == val,
> -			timeout_ms);
> +	ktime_t cur = ktime_get_raw();
> +	const ktime_t end = ktime_add_ms(cur, timeout_ms);
> +	s64 wait = 10;
> +
> +	for (;;) {
> +		if ((xe_mmio_read32(gt, reg) & mask) == val)
> +			return 0;
> +
> +		cur = ktime_get_raw();
> +		if (!ktime_before(cur, end))
> +			return -ETIMEDOUT;
> +
> +		if (ktime_after(ktime_add_us(cur, wait), end))
> +			wait = ktime_us_delta(end, cur);
> +
> +		usleep_range(wait, wait << 1);
> +		wait <<= 1;
> +	}
> +
> +	return -ETIMEDOUT;
>  }
>  
>  int xe_mmio_ioctl(struct drm_device *dev, void *data,
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index 236159c8a6c0..313ccd70d1a9 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -11,6 +11,13 @@
>  
>  #include <linux/errno.h>
>  
> +#include <linux/delay.h>
> +/*
> + * FIXME: This header has been deemed evil and we need to kill it. Temporarily
> + * including so we can use 'wait_for'.
> + */
> +#include "i915_utils.h"
> +
>  /**
>   * DOC: PCODE
>   *
> -- 
> 2.38.1
> 
