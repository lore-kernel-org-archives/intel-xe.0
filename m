Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D63CDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 20:24:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 425B210E03B;
	Fri, 13 Oct 2023 20:24:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5810810E03B
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 20:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697228674; x=1728764674;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=07/xbo6ObqcrtkDtjlcFvG4p8jrWZZ6q/YINjj2Oa+c=;
 b=OELuu5krRrE52Ku9KQnc/QlKf+vErW1lUULWwrp5hcupc1ZnqaLYP9Dd
 FsQtrRl8l8YnvyRjHrjkTrdvPlVKpX7RrOwVCLNt18VQ8QGs4xIvBmpQb
 +t4KKJ/CNMN9N+vIXyfPXl6ltNoP1rlDVqlSZU0N6MciX0o2D8/P/WgmJ
 qPqXogbCiFiE1kYAAftaIpJtdC2vEtHCUX/J7jyFiisDzBqk+0qUD8D0/
 PE3z8czdgR+nvuQRQaWIWfo1leS5kHX1+OtJMj2Rw+RemJw52rCTQjtr2
 AYz772ukUFJEGPnMCbw2D2BqWkzpo5SHH0bete6xaxMoxuSN6Qh1/7a/W g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="416318727"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; d="scan'208";a="416318727"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 13:23:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="1002085300"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; d="scan'208";a="1002085300"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Oct 2023 13:22:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 13:22:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 13:22:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 13 Oct 2023 13:22:47 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 13 Oct 2023 13:22:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UOgcO/UAzNTZweEExaaKyRLWI6WlZYvNUAVae+VeQIWg4Uj+niAtm+47n/9x2ttDV6dt+zFgaZW/XD6TVL4kqindjaYbdB9Am6YE4tMEoj0rNd3iIoKQvXlaYVLFLA8dLIr7+EUptLFjYASaIwVrTDkavdvG9EuZOJ0eHq+Zf1XJgaWAdsHYgm78cqIjROno/63L9TEQpPOHifyIAOInJe/RpjGO1CmHqa9+7DSgqnykf6TEuDifSknT6Zdq82800xfPRUwQ9YF8Y7q5vCTYCiyfnu2u+oMaP8Uz4dXdqKWLchy/voJEFPqvk4KfckFT96IOF9w/Bo10NNhHnQmKXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WNRglcDdfygLoG8VLh6m+HsWjM55X7dNHkPSM43ryc=;
 b=ZLbpjePDayyiRbO6+UlZIvMVrWu1rb/Kg9q79iIO/q6Pau+a8xVJB2EApJ5lnxbQDShNjYmBuwjh2Xl8CgxtxJV0zv8XWo9MLywSDil2xtmRO91wwDERJsXnuy8RexbDLqnvnctXOmec9lwQ9Gr2KtrHNEy4ajwH4DalroEqjUuiMYPeSuWrRX0+TnMfq/jTAg53umaKdv9RjWZEa88gOLqoywEFBu16d5lsiC4kET4h+syqR3T3sXIExZ67CZHfz9V5I8aG+fG0dQDbVNCnsoPHrgooB631DPYJ8mS8voziyvn1ttXcUDMAIEC5OZR4Qrdj2V+AjYpZdgD/Vghkvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB6568.namprd11.prod.outlook.com (2603:10b6:806:253::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Fri, 13 Oct
 2023 20:22:46 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.040; Fri, 13 Oct 2023
 20:22:46 +0000
Date: Fri, 13 Oct 2023 16:22:42 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Message-ID: <ZSmnEgxaOCw3XLAc@intel.com>
References: <20231013025321.2972772-1-aravind.iddamsetty@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231013025321.2972772-1-aravind.iddamsetty@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0107.namprd03.prod.outlook.com
 (2603:10b6:a03:333::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB6568:EE_
X-MS-Office365-Filtering-Correlation-Id: 48769753-c441-4eef-820c-08dbcc2a2968
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tDhATEh6ovUWPm7Q1KcNvAZmwFefCt6w/8kKQ5SZwG3248FEfe/lZ7idyxE0aOSkdE+w9j+CEOK5xxEIBV3TJsTGE6jBkqReJ8yZlziMp8W7nZ+2hAYAGUtCJS4IF05rzVPlpmLgJNFevJMZFjZrfp+UZYeJ5fIKC9gk6KP3490xcY56ls7eiVBT3uIN+kXl6/KP+9zYDH84CvT+IqkfkBatcVamFbTDY8Wa2LWwyeFWV5ShLhyPH8LfSekiKDB9bPOW3YY7/s9Y+2P3hLNc4GwcKRFtSfSy+1PxWeu2Z0vCIhjcgC4CVkrXgylH06UYPiDQRPTjPh6CJts2ar3A5bUASD4sL7n9hBnZFA62zS7VvIuRZa3LTj6RqpHrfVZF+KVC/TC0Tp/7mmdPyrASAcdt8D2tQVtqINH8oooZoDcRNgYP68qdvSfxMB7aEC6GaeN6jHMhI/xF7ZIYWeVZZxjCo8gdel35gzKt2Fmld0yIYh3AgEhQ0dbmsVXzoO6Q4Ua/KBauodxjNuuo5XuE1E6ytrJEYzA8naikC4lZsjP2VG2slBTHudunaoJSpZP4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(396003)(346002)(366004)(376002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(6512007)(6486002)(2616005)(66476007)(8936002)(44832011)(6666004)(83380400001)(2906002)(4326008)(5660300002)(66946007)(41300700001)(6916009)(26005)(8676002)(316002)(36756003)(82960400001)(86362001)(478600001)(38100700002)(6506007)(66556008)(66899024);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pKwzNtbkNE6PRiILZlXN+0xdM0X99kU4gB8v0G1UICWOs5HIHaOjrI5qF95G?=
 =?us-ascii?Q?+NUxpil6btPD8TF1vFtE27v6sWfTyb185We0ZmXcO/FjsXamjLAZlVlk2g+I?=
 =?us-ascii?Q?rhKnfM53nZB+h6A+l3zOs0+P4UOgHYPXBJjzdScIWnj+WhuY5pOmLj2WA+h7?=
 =?us-ascii?Q?cGcQe2EezGaorHEvcDnsYe5vTiiQfyuGrlZTl+EHnPJaqu3kjjke2gN6TmTc?=
 =?us-ascii?Q?Mh0Vp9WzydOqgnLeMkxPLp296vXt5hpxHHtN7BA6X+1NazxnPwsw7XoTkP+A?=
 =?us-ascii?Q?XDenjTZi3k6BfeltiFVUYcS5J49Lgr8LUi1mRJ56EXDZKoPLJaAGrRBb9PQ1?=
 =?us-ascii?Q?wAicmbqx1Iyv2VRnbXeMDh8iWJEf8P/GH3SRCOk234MN0jpvmS3srfZG4QQs?=
 =?us-ascii?Q?2JEux7R1DNYR3n+SSYmlzqqDP6Jd8CMjQYiF6Vl6ZdVcITtlwKb8MMdSceCR?=
 =?us-ascii?Q?8db0UIRL/KY4OeHlz79YRnkW1zw/QECCmv9QdOZRUNmTPaV7NPeKgSkPENVP?=
 =?us-ascii?Q?QEt6om9jPw53bRCuhBl+YkRQlKegnI9AJhXv5RhLUEGRbVjiIXlXZ1eFv0FB?=
 =?us-ascii?Q?732eNBPvkEkNEfiZh0HdVmMxyNNJgPLiP6vmnANC3IeVbgg9dujobcnVphKJ?=
 =?us-ascii?Q?hZdKfLL5Ub+rkShu3Hypqlu5U6I2rLm7QusYivpm6ixVkducheG3ULlYhr0M?=
 =?us-ascii?Q?RhrkY8Pkq0LejAwTuoOt3LwKp3AifMPzJ248esi6mVHZKdjBi3ZlWwMqAb0f?=
 =?us-ascii?Q?GdlgpVNxDeLURhhMipbkFDw++aplCf3NUXBrtobxdA2EhYdOUjnAQeIaM86x?=
 =?us-ascii?Q?H/HOYUL7+/AZNTK+BTp8yBnQb8+hT+OqWjUH7EleHWX2HkWfKeNVzWm4vKhr?=
 =?us-ascii?Q?UM8GfQoPlMSI+9ZRvl4QfFniABBS1hpkt78DOeuTMopkDhoisCGmyvLIn24w?=
 =?us-ascii?Q?cOPwgKCTBaqTKywh/IR91XmGszGbVGprr//+vqrmkmENLN2A0AVNbfJxeglZ?=
 =?us-ascii?Q?pPtDuw/zo0n8ncWE9uWr2o97OFkQCSvf1tJu0OAPJSa9L9jCW0KU2M8wM276?=
 =?us-ascii?Q?ycFtBGoBQPAS+cRy75TJu2opzLUEruUAQXSq7TMmFv6hYY6ZqOM1Dbvdssz9?=
 =?us-ascii?Q?A/8y8fmpLfAQN1TUc9YfnUFRTVBTS0BEHKtGa/LioNYNNJ1NrrPXqxUIvGhJ?=
 =?us-ascii?Q?7kQw4GEtukhwN3rJfYYuJoRs+1ZaSrWo9PRIYU7lK9oiPQWZzmqRp49k3wi+?=
 =?us-ascii?Q?ZSLtZ23uZmcI6uUPoTfTc0h7qAwWFy0UeFBTDZMP6Ct0mS/ptzv5vxNp66+5?=
 =?us-ascii?Q?UZOFUjsnQR3YATdzRiDniE0Ob+DOtQThO3VLq7Ey02nQhFxioWZHcJ1rCZ5L?=
 =?us-ascii?Q?gXHV6me013J1yFeXnC2DQHFQas3XGYHgkJKyFcq/oEEjviMy319m3ZjgrtE7?=
 =?us-ascii?Q?k4N0cH0xk2CqLD/kOW4LFAsgEI9DsiHZJYd6RmMG4COP0r2UuYYUy0cl/L+j?=
 =?us-ascii?Q?t3yJMy2QzLtaV43O3w3q67S5c/UF41FMTASzowqS4qM30oGmBxlMN0UX4qO7?=
 =?us-ascii?Q?lymmalXxukidCe9DuL9k0yKBT6qBKKDDKB/RH1SKFPMxlR+VYcl+o/hkZk8a?=
 =?us-ascii?Q?eg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48769753-c441-4eef-820c-08dbcc2a2968
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 20:22:46.0895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g8JJtLZKgpOEzvz1o9pumUXiq7zhuiHOmM1SQ5osRp4w3K9XSW1f52rmUFXMaDU1j7w3KCS/7IQRn8ped+1O8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6568
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe/pmu: Enable PMU interface
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Oct 13, 2023 at 08:23:21AM +0530, Aravind Iddamsetty wrote:
> Drop interrupt event from PMU as that is not useful and not being used
> by any UMD.

Let's make this a standalone patch instead of a fixup, and integrate
to Francois take 2.

> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_irq.c       | 18 ------------------
>  drivers/gpu/drm/xe/xe_pmu.c       |  9 ---------
>  drivers/gpu/drm/xe/xe_pmu_types.h |  8 --------
>  include/uapi/drm/xe_drm.h         | 13 ++++++-------
>  4 files changed, 6 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index def9369eb488..4c22b97047b3 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -27,20 +27,6 @@
>  #define IIR(offset)				XE_REG(offset + 0x8)
>  #define IER(offset)				XE_REG(offset + 0xc)
>  
> -/*
> - * Interrupt statistic for PMU. Increments the counter only if the
> - * interrupt originated from the GPU so interrupts from a device which
> - * shares the interrupt line are not accounted.
> - */
> -static __always_inline void xe_pmu_irq_stats(struct xe_device *xe)
> -{
> -	/*
> -	 * A clever compiler translates that into INC. A not so clever one
> -	 * should at least prevent store tearing.
> -	 */
> -	WRITE_ONCE(xe->pmu.irq_count, xe->pmu.irq_count + 1);
> -}
> -
>  static void assert_iir_is_zero(struct xe_gt *mmio, struct xe_reg reg)
>  {
>  	u32 val = xe_mmio_read32(mmio, reg);
> @@ -351,8 +337,6 @@ static irqreturn_t xelp_irq_handler(int irq, void *arg)
>  
>  	xe_display_irq_enable(xe, gu_misc_iir);
>  
> -	xe_pmu_irq_stats(xe);
> -
>  	return IRQ_HANDLED;
>  }
>  
> @@ -449,8 +433,6 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>  	dg1_intr_enable(xe, false);
>  	xe_display_irq_enable(xe, gu_misc_iir);
>  
> -	xe_pmu_irq_stats(xe);
> -
>  	return IRQ_HANDLED;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
> index abfc0b3aeac4..318bbc9c1c9b 100644
> --- a/drivers/gpu/drm/xe/xe_pmu.c
> +++ b/drivers/gpu/drm/xe/xe_pmu.c
> @@ -114,10 +114,6 @@ config_status(struct xe_device *xe, u64 config)
>  		return -ENOENT;
>  
>  	switch (config_counter(config)) {
> -	case XE_PMU_INTERRUPTS(0):
> -		if (gt_id)
> -			return -ENOENT;
> -		break;
>  	case XE_PMU_RENDER_GROUP_BUSY(0):
>  	case XE_PMU_COPY_GROUP_BUSY(0):
>  	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
> @@ -181,13 +177,9 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
>  	const unsigned int gt_id = config_gt_id(event->attr.config);
>  	const u64 config = event->attr.config;
>  	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
> -	struct xe_pmu *pmu = &xe->pmu;
>  	u64 val;
>  
>  	switch (config_counter(config)) {
> -	case XE_PMU_INTERRUPTS(0):
> -		val = READ_ONCE(pmu->irq_count);
> -		break;
>  	case XE_PMU_RENDER_GROUP_BUSY(0):
>  	case XE_PMU_COPY_GROUP_BUSY(0):
>  	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
> @@ -361,7 +353,6 @@ create_event_attributes(struct xe_pmu *pmu)
>  		const char *unit;
>  		bool global;
>  	} events[] = {
> -		__global_event(0, "interrupts", NULL),
>  		__event(1, "render-group-busy", "ns"),
>  		__event(2, "copy-group-busy", "ns"),
>  		__event(3, "media-group-busy", "ns"),
> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
> index 4ccc7e9042f6..9cadbd243f57 100644
> --- a/drivers/gpu/drm/xe/xe_pmu_types.h
> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
> @@ -51,14 +51,6 @@ struct xe_pmu {
>  	 *
>  	 */
>  	u64 sample[XE_PMU_MAX_GT][__XE_NUM_PMU_SAMPLERS];
> -	/**
> -	 * @irq_count: Number of interrupts
> -	 *
> -	 * Intentionally unsigned long to avoid atomics or heuristics on 32bit.
> -	 * 4e9 interrupts are a lot and postprocessing can really deal with an
> -	 * occasional wraparound easily. It's 32bit after all.
> -	 */
> -	unsigned long irq_count;
>  	/**
>  	 * @events_attr_group: Device events attribute group.
>  	 */
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index d48d8e3c898c..b183c9693887 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1060,7 +1060,7 @@ struct drm_xe_vm_madvise {
>   * in 'struct perf_event_attr' as part of perf_event_open syscall to read a
>   * particular event.
>   *
> - * For example to open the XE_PMU_INTERRUPTS(0):
> + * For example to open the XE_PMU_RENDER_GROUP_BUSY(0):
>   *
>   * .. code-block:: C
>   *
> @@ -1074,7 +1074,7 @@ struct drm_xe_vm_madvise {
>   *	attr.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED;
>   *	attr.use_clockid = 1;
>   *	attr.clockid = CLOCK_MONOTONIC;
> - *	attr.config = XE_PMU_INTERRUPTS(0);
> + *	attr.config = XE_PMU_RENDER_GROUP_BUSY(0);
>   *
>   *	fd = syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);
>   */
> @@ -1087,11 +1087,10 @@ struct drm_xe_vm_madvise {
>  #define ___XE_PMU_OTHER(gt, x) \
>  	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
>  
> -#define XE_PMU_INTERRUPTS(gt)			___XE_PMU_OTHER(gt, 0)
> -#define XE_PMU_RENDER_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 1)
> -#define XE_PMU_COPY_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 2)
> -#define XE_PMU_MEDIA_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 3)
> -#define XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___XE_PMU_OTHER(gt, 4)
> +#define XE_PMU_RENDER_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 0)
> +#define XE_PMU_COPY_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 1)
> +#define XE_PMU_MEDIA_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 2)
> +#define XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___XE_PMU_OTHER(gt, 3)
>  
>  #if defined(__cplusplus)
>  }
> -- 
> 2.25.1
> 
