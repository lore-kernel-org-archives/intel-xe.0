Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CF3C0015E
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 19:30:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C18D410E4A9;
	Wed, 26 Jul 2023 19:30:37 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C297C10E4A9
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 19:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690399835; x=1721935835;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8Tq/sXtzpKTFECb6ncf/HbdO2d7RW2gltvudkGOkC7s=;
 b=kuqTFI3pYayuh2BnmyVicihUh+BBLLQl6r8IxFV0Gm2r8cuv6x5wy0kR
 3xJ+w+prG79TpDboprKWW4QEKctIOTIdhaPIT+K1P8flkFNcZOO1s95PT
 HrI+gCLm74TegBQ/PEV2JSLzrEXpJ4LMmTfcfWucZzsjLdkRu7izDr2S9
 chP4tDzh6P0PmgNCjWMWzE9Aico+PWHg8DCWv2A/QzyQQbP5mBVE32w7E
 gVgcrjpypNtiwI4igP0RGkbDNyFYUKtmZR7HbyokiVy1gSW1lHC+jlDRu
 XCzV4ybmcZuJAlC84dSI61tRhMt0B58D40yXQnuoKFR5PipaRQh2L9Mpk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="368132499"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="368132499"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 12:30:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="729978643"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="729978643"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 26 Jul 2023 12:30:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 12:30:34 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 12:30:34 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 12:30:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XxaLc1AR0tlcwKam7sVZFjkhcrq9JKAXRpxH/PCeqxwzlWKs6OiQA5yzw5ohEaioaCf0MefvG7UGydwPaiYP3usSeMNnZ5YhKdF+BeuxforbvHkr1TMrbFchmphtr7vuc0+XLhzU8Mxc1aybGKVFg5kvtDmYx4EAT1UigQZDwpBdmlnkQ1mnb0FWPPJPuTOXxqp/UD6DFt8R0wz8NhPU9UwZh6h0zwJSHKGGnIzP18GOd09/Ru+Uv1TA63OQatTYT9o5dCz2+xr3jXlJ1wzBU5tN/ZzNJOp8G0yI+ORRRhu85FmGZ8FUGfpI+sZcBQpJHCswlMo/l0eiE9B2B15coQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LY6LQUpifr5PzarmZl/HAuCX8iO8J4xbqQkl73ksclw=;
 b=MmROUFmamTDV8Io85xblIlgjVH30i71dLbxKdE/B5lerN2+Gy5XINJnc64ah2Gho/Ziyk9syb4jz3KjCJmT4vTUxl4O8bNnnskIYd/osYmOt/JVPgiVNs8vbzVAHQErkwYXQ3QFz2mM6TKO4Je43nkGC05TKSAaBsPeu5YRZzkdUFc20idykh09f9p37i+DZLO8FhO1Xa/eBYdBvzE18tcPmtfw33amtY51lE0qWnPIOPlA75JGjY76NUx4UEbTooLOHpH/qvFYhzf7VmguWnZA4l7wNzowkha2NznwchZ5orxU11gIgBZJaBUuZrX6AVLS3MkwJsH6dPKRVpxCWtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6703.namprd11.prod.outlook.com (2603:10b6:806:268::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 19:30:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0%3]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 19:30:32 +0000
Date: Wed, 26 Jul 2023 19:29:48 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZMF0LMxahswx9wyn@DUT025-TGLU.fm.intel.com>
References: <20230726192520.383531-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230726192520.383531-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BYAPR11CA0097.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::38) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6703:EE_
X-MS-Office365-Filtering-Correlation-Id: fad61838-1d76-4881-e6d6-08db8e0ec751
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hWtaM+EEkmPpeD9nHCv2CivtU76bJ5Y98WcuoQoQLIN4DjaqQDwBdfz7+GyXjO+Z2BHx8qspb6jxmmx6+SPKh3w3chiw7xZaSSCh07XaSJYjKRFQdbZG3mdEA4Phwhq+7L3pv0mAB5+sVp2TCBq9uaxXO63gllaxpYhqDLxrcjLndUx2MxIHiheXql8mVRK3gY9PrQcWwlGzgkVCjoSswuQJY3psTQpUa63+lB6W+bStTymmJD5FnbIEWqgvRKiBfFHZPy2HKxsbsKIC5AN5Z2fOaSCslq016RqDINQ0AVLgwgPohY8sIQbcAH1f6qVCx7DKniyPqq7C06TuPKfVKcMNfhOFGgBUaA9S/QM335F7MCP05/BtWYKp69p7iSlX3weMVbcwtiLftVK7Z0/XfcN990i2jUKhW3ap7gJw+L5Y517hkoSSzX2KOQ7Ecg6YUEc34mPbkaTOjf6bQHTwfwZM11qO7l6i/vdA8tbXbw1jo5oG06pntQwgaFQ/FDflK4Q42WXd2E6sLGsplMH4ilmfnMnPPwr0vsBo/UnbfWJgP1hhu9I1wh5OFi//jldU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(346002)(39860400002)(136003)(366004)(451199021)(26005)(186003)(6506007)(2906002)(6862004)(86362001)(6636002)(82960400001)(8936002)(8676002)(478600001)(6512007)(6666004)(6486002)(4326008)(38100700002)(41300700001)(83380400001)(66476007)(66556008)(66946007)(44832011)(5660300002)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n5+47o6NDo7fpk3iLQPUlBKhRk4Zes+cYik/1GZyW9WcmBP7SSbPYzcsZHQt?=
 =?us-ascii?Q?Suof0MQBSk1sTKFaOu+yt7RW5/5KiA2AumFNNjQ3Tv/9OVvs6mNzZBEF+EEP?=
 =?us-ascii?Q?0xdSfAZK3Zto47cmzHW6yNF9gVB6ayh20PrEeDqi4AG2+J8uaHevLYtT3F3d?=
 =?us-ascii?Q?LAFymMGf5eqRFg4Wb4OB75WjT9oNBIzMQ3AfgWBtEDBWb929I/YCCTtE//L8?=
 =?us-ascii?Q?GKnqAhqtZZleWR9vrWEo4AFCuIXefGrVh9ax8agYjKhHgYfLKtZ82QDyGSpm?=
 =?us-ascii?Q?/hjlRHSMpMscTzEfJ+uwXYjAWXY4OqcJsrFS0vSaFj1sgPIurbsMllpFkYL4?=
 =?us-ascii?Q?aB7HrVETQDabiy8QUHUOLWfd8ox9872oq1XJ/icTQPbXteJIwKhbC5Nk5T9U?=
 =?us-ascii?Q?s2X23V2VTXIQrgs1visXIXqB945UvJNX0QhDoXZeXELU7+ZcDRvfGOlCXGu6?=
 =?us-ascii?Q?7HfHc5+fJBSLQIw7NhzEIDf/Y7IOc+AMI9iFvVEMUFsgvL4tknRlGYensY+f?=
 =?us-ascii?Q?x0TpVpQ7Wb3jAdVE0XRAIuaM/7lIFJLAiM6cedwsZ3bBlzHkuCi54iVC3AnG?=
 =?us-ascii?Q?U9bvlHSwob3HVpjV5ofiYnGS/kadpQ/qOowxS8lGaT/4kXhNdlIln8jlERSH?=
 =?us-ascii?Q?p+8nSfMYdkFrMt5W6VUNHraIpnTwX/TGNp208StpKkFJqzI3eK+AXUHKUxHB?=
 =?us-ascii?Q?4JVDtXgatTZSuDTLtXVvXF2HgpgNJHA5DgmhbqxQK6YbeUoj6nFuqJBp5KWe?=
 =?us-ascii?Q?a4UnYjHvYII3rzLYbVWjQmGqQgbkwWUzR8VpWvY8iM5iA5LfEbT9QK0JOrnC?=
 =?us-ascii?Q?IfzyLyYR5CmhQ4dEnIAy4GDSD8d0+guPMXP8xTm434SwMQTx0i38enIfeBH9?=
 =?us-ascii?Q?VN42899O9LLIpaEDOs0FWyeWdexu0Lk0hXnAcip2sYTpAlXHsnrOPdNH+Nc2?=
 =?us-ascii?Q?YvOC4IO2Jce/UEA1IX3pLfi2LqeXW1VwNggGjnmNvMDi2vaH8Tu2TrhLQYGJ?=
 =?us-ascii?Q?fBOZpmYzdvsZYegsKufYtExHQ0tlbUom/xfLLn8DcPM705IzWnryEhh7cPDs?=
 =?us-ascii?Q?CXMqnuvWe91ClG8VhutKkP9UUw73/iJnAvSSWG4WF/6P+2I9wxY9qmA+UTkw?=
 =?us-ascii?Q?RsfyUGl2oKx1wf8VIIgNBnE8FUDS9fjbRIR9TSoicwvWx+EdJdVUtQS9LDpU?=
 =?us-ascii?Q?SzuYyRtTk1/q+IFr/Lj5XVKo3DCUEAEf3OH1v8Vln36MjiWOcSFG9Zx2e1U9?=
 =?us-ascii?Q?O00TPpDJ8FppDr+OO+rIS0ZsLGQMu0lMHwo6fSHwcCJKM1P3BhxTTgyqILkv?=
 =?us-ascii?Q?9gCsgpVtckT1/fs45LwTRjUBVbf/vMAWM1iUcVEqJoWXiD+1/yp329WfGEuB?=
 =?us-ascii?Q?/bAImKz5UtBwVWqBwLyXkourNuRiujK01oETrnPkek7bhwDbZmpgTWEX25mE?=
 =?us-ascii?Q?Dwl3DrcxhIHf8BlXoBlSY0SHwDvmxPyXkBcuOV5CKB5sniKRIGXKngMzghoC?=
 =?us-ascii?Q?HVga0cbknaWkxkjw2qcnwUy2oC8F6LGU0FOKyhmskjf7iu+tRp0k+f1yirZZ?=
 =?us-ascii?Q?1a/nAWtn0M2JlZJFEnPGirQoexAS4rH8QkCAa6+Bqj5SE9PDzz34q8lhAmCO?=
 =?us-ascii?Q?uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fad61838-1d76-4881-e6d6-08db8e0ec751
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 19:30:32.8980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0njys5xS9tXaezoNpySL0BNROUPVyTPEWFu951hZ9mhB1ktgtFT80ZpGPsFK+nqdKJuFsUtWuo42lv2cljhYhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6703
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Add DRIVER_DATE to coredump
 error.
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

On Wed, Jul 26, 2023 at 03:25:19PM -0400, Rodrigo Vivi wrote:
> This might be an useful debugging information if the driver
> date is properly updated with a certain cadence. With this
> we know from which point in time in our development the
> driver was from.
>

Make sense to have this, wondering what the cadence should be...

Anyways:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index f53f4b51233a..79b506dc2622 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -10,6 +10,7 @@
>  #include <generated/utsrelease.h>
>  
>  #include "xe_device.h"
> +#include "xe_drv.h"
>  #include "xe_engine.h"
>  #include "xe_force_wake.h"
>  #include "xe_gt.h"
> @@ -83,6 +84,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  	drm_printf(&p, "**** Xe Device Coredump ****\n");
>  	drm_printf(&p, "kernel: " UTS_RELEASE "\n");
>  	drm_printf(&p, "module: " KBUILD_MODNAME "\n");
> +	drm_printf(&p, "driver date: " DRIVER_DATE "\n");
>  
>  	ts = ktime_to_timespec64(ss->snapshot_time);
>  	drm_printf(&p, "Snapshot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
> -- 
> 2.41.0
> 
