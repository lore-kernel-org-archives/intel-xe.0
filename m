Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29DDC4332F
	for <intel-xe@archiver.kernel.org>; Fri, 10 Nov 2023 20:18:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 873FF10E247;
	Fri, 10 Nov 2023 20:18:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3AD310E247
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Nov 2023 20:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699647493; x=1731183493;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RdWq/oELWXG59DRPOz+KexEQ46NhV1KlnksEACTrk88=;
 b=lMqjgGXjEnGSNZ2JXtWvQIh/aumefKyjoTrLG1Kd0ZxV79xUvKDJQvba
 63HyNhpXe3EGvClJlisw3cUR1lnRaWRxQuXP/58Mfi4NGM3wJETExSjjY
 uAM9auPqnrwK6RYGtJ5GqqiwOZ8ul3WeCbLMReXePJNXPbNqRLtKiDO9X
 LXWNGy6XymEVbrrd962oa0vCHK8/rbuxT8TuBkPUQIkwhwqhehwUatEVN
 HXKQxQ4bb/q2BUWN5F3e0YQMoPJW+J3keAGqNOgKyUn2a/C6chVaGmE6O
 jkxpisf5zFlI4r0PZpkGJAtun9o3zvkZmaLD8fbkQ76AeFBD7ITqXepFS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="380617209"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; d="scan'208";a="380617209"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 12:18:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="767409529"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; d="scan'208";a="767409529"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Nov 2023 12:18:12 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 10 Nov 2023 12:18:12 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 10 Nov 2023 12:18:12 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 10 Nov 2023 12:18:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XwUrNZe6qZe9x9sHV8PwBC5MAdui/KxdhthLWnN+hzCeMmwLaEabHM0Vk8advYcVS7wwPwRSMleRuDB6Rk1Pp3QqEyVdLFIlVMyYR9mqwxQQ9rzAy3+CVECXDwoDOrZimQ3IZ5qgkk/zMb5hp0BgT6oH6wLDnpxshBuN47Z0eD5Y50KKU9W9pII04vKPAMY/WZzQspYovvYp5hhNyCzX1gC7yPTE3K6+DvupXBxKmfzHwaF7iObUouil0L5N4BteHMW5nOiVUsbBL95n0Yi1yCGvUputDTqRP1SOShoOg+OekJt6WtZBWvc3hqac7pvBO1ZIeHqgIoMVaQhyqZu0hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uj7cngXDAZwXKhMc19tK5V0YxXAUbo25L34djr72GyI=;
 b=NlViQ8wB4Gtzm6UII2RUBTRE/UWdNszPpbA+NNHlsiUlKJ4XTlZa11gufKG9Ci4pWlViqQw2Fn5L+eeQ12GYXUh+ORtEsi6PoeMqPEWy7YcwgqXx12YUtiQ0EL66WcQfNhr0dtpc+kgFWiPYBaWSSi2k/ce0d+XpZvpd4wi7iMrisWzjVmhJMVGVxkDcUjUZSJ2iefRNQxM1H8+xIepikwJ2aPRM0JSXwM9OTE5pCCYnyUKuj2WOYGkUIYJoxWocBdtv+cj5e4KbVJzb0fsT3Pmon/NOnXe2h1JE74aLLnhqJKkDXIfwMiXyUG4lYMIw7bQlKEiC3CSyGXaCPMe+tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW5PR11MB5881.namprd11.prod.outlook.com (2603:10b6:303:19d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Fri, 10 Nov
 2023 20:18:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9%3]) with mapi id 15.20.6977.019; Fri, 10 Nov 2023
 20:18:09 +0000
Date: Fri, 10 Nov 2023 13:17:13 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Message-ID: <ZU4tWZXqWSlIG7GZ@DUT025-TGLU.fm.intel.com>
References: <20231110062907.3604598-1-aravind.iddamsetty@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231110062907.3604598-1-aravind.iddamsetty@linux.intel.com>
X-ClientProxiedBy: BYAPR07CA0104.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::45) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW5PR11MB5881:EE_
X-MS-Office365-Filtering-Correlation-Id: ccbf5ef6-6b76-4825-d6a2-08dbe22a284f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: llwMPDKGpIMEtwMBgmrBQUvtFCqnDT3aH7M4DaCwVgyim6QiEjKFEOSiNSr3cdHUcoQAqkUIfl4NW2zSeDljiQkbLemvMEi97R4UOrVQ0VELYa8Oi2OYXfOlAcNk5dUItnkCIydit3MnPH1eWbBpHaRuqk2edPm9HG3nHNaSXNbwfbLnnfW4FhUR2+cgRcuW0Yy6AlGUXZyfLvBVQ8Bgqeppyii9WX8oFTuLFbU2dFGLCWRZcdOkV48lRvMM+pCGKQPZgRgQPapmpgiWOyOloC5MR8yt3HuhmEGFrR2K/5smyCc0WQdE9RI9sGI76pjXsemSqDxSqFrCYuaMGvCtJQC7rYNvsMrxSZCXlJOfkby1p5T8VyNa6qF8caIbHovUIjxxlsD6sRctYKt7Ky9oEcFowx94Jpjr7n/GPuCUCi05y3vQHKzbz55GUnXzIOyhinmVyNPqLIG0+rUhpkmWtP9hSc8dyLqk9Obvfyqp3MnpzsBbCtgOPrbWarjUP+iWij7uHQA11H16iRudDoJO0XQC0y3Ns6NbcDud7jlPu+StoYTJFltQD7HPZsB2wdCjOl83oBiSQYnP6znxOTLOmg+CYv4wUpvb13vcfr+PCRB0z0CRZ8oo5yyfmjAml6DS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(396003)(376002)(136003)(346002)(230922051799003)(230173577357003)(230273577357003)(1800799009)(186009)(64100799003)(451199024)(6486002)(66556008)(83380400001)(26005)(38100700002)(6916009)(5660300002)(2906002)(44832011)(8936002)(4326008)(41300700001)(8676002)(316002)(66476007)(6506007)(66946007)(6666004)(6512007)(478600001)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PMoWCrkYCTkebvioU2GfPYRmCjtO+PRPHm9qL7+hKDPnp5lt6r0qoMX5v11g?=
 =?us-ascii?Q?mqNs0GQjp2cZ1Kq5s8SkGPEyo9u5MPCmQF1eECOeKfBJCLvDyxNATxsGXpuj?=
 =?us-ascii?Q?HkCD6yT8Ndr3wRfuFTT6Sec5VU5S3bIpMUqriTW/JA5iCmWCxJK9E/aweB6M?=
 =?us-ascii?Q?fAQ8sh6j+7B/WDsg8lJct8Xh4LY0nH09tjtLBe8CBS7NmPqQaV/YcdhAhQFM?=
 =?us-ascii?Q?ez0SbntTbJzYq6PdFFkweazguNTEKUp/IEtXO/uG/ClQ6GUrEwhWLPLetoA9?=
 =?us-ascii?Q?sawWo0LmroIMt6J62aVxfXwadImKkpO89CSRNADGiyJNHJyH+s/nfLy/TzSR?=
 =?us-ascii?Q?iu7xwgOwY3mvHeazq7mL2g9BZxvMLr3dALE9MY9FwTH2HgqRCgKvvsmIL/BS?=
 =?us-ascii?Q?1+L5tW636c5sdEbahDi3+GzvargoJ4h8pk3TIyqqfFgc+4ySEnciCkJhI3bH?=
 =?us-ascii?Q?9HkZWOKDKgP5XCpn7lPshd67y0wzFs/mbQClRY+obG9Y6PafIRQCLmVkbN4r?=
 =?us-ascii?Q?mMK4110+ICPCGOQiAkU5bcj9V1/KJjHakQ2P6MMB2S6j3Y7ohRbcwuCDJBqu?=
 =?us-ascii?Q?BWa3okugJloI/KyPtTPauhecoCtL809tloL4a3rkw05L79a3owxQD4LKA6k0?=
 =?us-ascii?Q?OY5plIKqZSVTXzaoN3KIlxUne1WjGXf3VgxjUxefg/ZyI6H5tAzcOi1MhQqU?=
 =?us-ascii?Q?OxxgFyFthyeEFY/SJ+RYYWTP5ySZlNMLuISl9dgkYU+Na3BqTU5yyeJxH/c6?=
 =?us-ascii?Q?RcG44mlAomerdEuzyvEYsZHJrgnNDMEI2nSTSlSHQkyMYBxhlkYddEXjix0Y?=
 =?us-ascii?Q?+YXj2c5hwLyByEy4bCxGz6Y1RmEuOKFYmFiYg/cwdN3AJaSA4z8G5ROs8IQ3?=
 =?us-ascii?Q?jq8mjZekRQa9HEkTwAaRYYcfxCHXcUPisK5k18SrHp+8QrRrrGTQahZlNXQI?=
 =?us-ascii?Q?BGn+w4AXJsll7u0/OV2pk9QT5g+AnoRiJmZwPWkzGsJnzIA1tsM9F5O+39Fs?=
 =?us-ascii?Q?tjip410NaHkIcsoIQl52wigrUe6hyOdIMd8mTYW00s6eoZTKMqgkWnn9HJMq?=
 =?us-ascii?Q?A4zjt45sOGOYbryJSjIAl4FbYZvGWDbHaBKqwTvdjI78E53yngNUkJefRTky?=
 =?us-ascii?Q?sFmGyrJONgg7sZJg8x13rzX6U5gC9UwG9wZACejEAO58euOBHHjY94TsBfWB?=
 =?us-ascii?Q?k+q7jtPfxGLIuTH5FWg1pocyCgJoaH/76XEcnjQIrEEG1TAo4Pg4wef17OMf?=
 =?us-ascii?Q?Kmn1eY1tQ4aO1FVKHDUcvzl/E5smtIO/L9vrzu4qvlN4YjV8SHFqVam2N3sg?=
 =?us-ascii?Q?+UdaTiV3+znWqcnOSipRJ0r2/Isp2d3A7mTGtcO7lE7AESc63TgU2EhL9f02?=
 =?us-ascii?Q?oqohXBvZcAij99Hvx0j3ZActINIWVK9jcO5yOQuKXtUvLXFKom7FF3Qcz/Uq?=
 =?us-ascii?Q?xxDvcEUh2qxIY8wjy4BSY9fT1qCTUXjNoxgcOEJ3HvR4BQooFHyAJVhTvBW0?=
 =?us-ascii?Q?DMwG4jLI9nMBa2o3oQ+Gg9jBeyv28HdHlcDCyf2S20bnaZQN+6jIeM+fGhNe?=
 =?us-ascii?Q?OUA5yHoLVf5K6sHK5oGnwcwZg88LnSq3rx+j5wBpfSQOBl1h+lXta2FArKrE?=
 =?us-ascii?Q?aQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ccbf5ef6-6b76-4825-d6a2-08dbe22a284f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 20:18:09.6919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TIxsky3ZqlcX7oOb0yDbE7s6TRL1+6BzDjBoKCTThzWWqSC0Kp4eUrx738SIsN/9zr5VyJaY6bGzk/UJZ2hpEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5881
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix lockdep warning in xe_force_wake
 calls
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

On Fri, Nov 10, 2023 at 11:59:07AM +0530, Aravind Iddamsetty wrote:
> Use spin_lock_irqsave, spin_unlock_irqrestore
> 
> Fix for below:
> [13994.811263] ========================================================
> [13994.811295] WARNING: possible irq lock inversion dependency detected
> [13994.811326] 6.6.0-rc3-xe #2 Tainted: G     U
> [13994.811358] --------------------------------------------------------
> [13994.811388] swapper/0/0 just changed the state of lock:
> [13994.811416] ffff895c7e044db8 (&cpuctx_lock){-...}-{2:2}, at:
> __perf_event_read+0xb7/0x3a0
> [13994.811494] but this lock took another, HARDIRQ-unsafe lock in the
> past:
> [13994.811528]  (&fw->lock){+.+.}-{2:2}
> [13994.811544]
> 
>                and interrupts could create inverse lock ordering between
> them.
> 
> [13994.811606]
>                other info that might help us debug this:
> [13994.811636]  Possible interrupt unsafe locking scenario:
> 
> [13994.811667]        CPU0                    CPU1
> [13994.811691]        ----                    ----
> [13994.811715]   lock(&fw->lock);
> [13994.811744]                                local_irq_disable();
> [13994.811773]                                lock(&cpuctx_lock);
> [13994.811810]                                lock(&fw->lock);
> [13994.811846]   <Interrupt>
> [13994.811865]     lock(&cpuctx_lock);
> [13994.811895]
>                 *** DEADLOCK ***
> 

I don't personally like this. Where in an irq context do we grab this
lock? FW probably shouldn't ever be grabbed from an irq context. I see
this was changed from a mutex to spin lock in which is pretty suspect
IMO.

'drm/xe: Use spinlock in forcewake instead of mutex'  

If this really needs to be a spin lock I'd rather have versions of
xe_force_wake_get/put that called from non-atomic contexts (e.g. use
spin_lock_irq) and atomic contexts (e.g. use spin_lock) rather than
using spin_lock_irqsave.

Matt

> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_force_wake.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index 32d6c4dd2807..9bbe8a5040da 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -145,9 +145,10 @@ int xe_force_wake_get(struct xe_force_wake *fw,
>  	struct xe_gt *gt = fw_to_gt(fw);
>  	struct xe_force_wake_domain *domain;
>  	enum xe_force_wake_domains tmp, woken = 0;
> +	unsigned long flags;
>  	int ret, ret2 = 0;
>  
> -	spin_lock(&fw->lock);
> +	spin_lock_irqsave(&fw->lock, flags);
>  	for_each_fw_domain_masked(domain, domains, fw, tmp) {
>  		if (!domain->ref++) {
>  			woken |= BIT(domain->id);
> @@ -162,7 +163,7 @@ int xe_force_wake_get(struct xe_force_wake *fw,
>  				   domain->id, ret);
>  	}
>  	fw->awake_domains |= woken;
> -	spin_unlock(&fw->lock);
> +	spin_unlock_irqrestore(&fw->lock, flags);
>  
>  	return ret2;
>  }
> @@ -174,9 +175,10 @@ int xe_force_wake_put(struct xe_force_wake *fw,
>  	struct xe_gt *gt = fw_to_gt(fw);
>  	struct xe_force_wake_domain *domain;
>  	enum xe_force_wake_domains tmp, sleep = 0;
> +	unsigned long flags;
>  	int ret, ret2 = 0;
>  
> -	spin_lock(&fw->lock);
> +	spin_lock_irqsave(&fw->lock, flags);
>  	for_each_fw_domain_masked(domain, domains, fw, tmp) {
>  		if (!--domain->ref) {
>  			sleep |= BIT(domain->id);
> @@ -191,7 +193,7 @@ int xe_force_wake_put(struct xe_force_wake *fw,
>  				   domain->id, ret);
>  	}
>  	fw->awake_domains &= ~sleep;
> -	spin_unlock(&fw->lock);
> +	spin_unlock_irqrestore(&fw->lock, flags);
>  
>  	return ret2;
>  }
> -- 
> 2.25.1
> 
