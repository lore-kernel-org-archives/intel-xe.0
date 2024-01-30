Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C7BC46CD2
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jan 2024 19:23:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A58B113483;
	Tue, 30 Jan 2024 19:23:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B0511347F
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jan 2024 19:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706642600; x=1738178600;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0/UC9WIvsFJ2P9xnoPQdnSEckZGqop700blDTQHjaeI=;
 b=GhuhZLlk+BAZRATBcmXB/jezznIam2kJP7lb1wMSo78QbJbW+kaGruGp
 A0Dj8BIHpQYPr221basKyIrDfkOWZLzhOtuON72Eu5lC/hn+D3cvA96OC
 Sx3fzzBntG2s3rMwjF92fO94DYMktycxSxxZi5W9khFiddZgk6TqG0YIE
 xtqVhUEtui/WWGe5RuIjIvX3zA3OXUP8IxU1oeDaFhuRmyWK8qd0N6sfn
 7X0uRzav8fglhcgSXfOpW5QPWW2pE5SEePwWav8vgMSTnGKxwYMnN6+Aa
 zxGdPN6LZteul42r4SYqYkr5VSauN20AjM1cShIHWdMyxifB/z62JBI5M Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="2315879"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="2315879"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 11:23:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="3898298"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2024 11:23:19 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 11:23:18 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Jan 2024 11:23:18 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Jan 2024 11:23:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EjvRE+05Ue0k/si9SY48OOYChGdfmNT/JgzNwSMUSeuBhjFqI7VXl3nfD4ezU46pmjlbijeSgns1BqChkvYLLcN773qpl9aU8gyR2pU6XlNemTN31qSqXHCUwTABC/1wwfJqUYAST98+I+/h0bTWXP8AcsYwdfp8rKmuhnYeZGbVlcYAglUOKh8T1U1brq0Fg+rSpx2D7SBCvpsTFIgnPsbJv2X1pQS8Spl+zgwhE47DFqSUjF4Uui9/Nc9hdC2kogzujjn3BR2mFKUun3OJLBjhcAjehv0bPSkq5S0toifiEm8duKIWZUH3nyi31S9I6iR2ecIhTyhEosp3ANeJOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+QzXsLfd/V1xD7pj4QqkgmxCpKe84tufDE53vsmRJlM=;
 b=m+lRfhjKdNkOlZKf/3mFjHseZEj6jeJuT6rEZ3OHrqfObolB7sZN3vdL7ylOSXA6J6e/hIsN4mnN7Us3rSxkpPdlQuNu5QyRAWA4yHDIB9sw2wZ4GvWBe1frC+nNggOfojcv9D8RtsIqFhA8nwcou9HVQzIaEn468C24obGx7GZLd82N3GNc+SIAFYRNKSovI6BTy/n1nPVF9dYPEvXLrFafaXc7vCFLZBvFf9qMNhx3jGoJsKBHgJ3F784AC3aITZZzGGAsrcUmZNBWJ4xxehDfQ2R19KFGv2IwGoVuna2ImP9ngKI9UMPKkDzTKoi0UgLsg303ofFFpzHIxpCz+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB6157.namprd11.prod.outlook.com (2603:10b6:208:3cb::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22; Tue, 30 Jan
 2024 19:23:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7228.028; Tue, 30 Jan 2024
 19:23:15 +0000
Date: Tue, 30 Jan 2024 19:22:53 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe: Convert kernel job timeout from assert to warning
Message-ID: <ZblMjdTJdlj44026@DUT025-TGLU.fm.intel.com>
References: <20240130180452.1416603-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240130180452.1416603-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR13CA0224.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB6157:EE_
X-MS-Office365-Filtering-Correlation-Id: 05f42adc-7aa3-407d-ccd0-08dc21c8e86a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rnYasK/xobrO50R0gmGhWJTWrfq15+FQk1dBjXY1mmBmQkKzDODMnv2Sc3SKZZ5dv7aOvRaUjJVDy/FemY4xeCGt7uQAt66TbMxLap5DtNvRRlAap7SVu4lhYx9OAR+GePUAfiuZDb6kiBteD0j45/h/KoALSNRor4Jmj6hR/lP30Q2OW4krCx0Mw+W89OQ4um/nsaWoDNd3126x2oRZ7Wrlp+i7EO/oW4T7HxZclILZ+VbIjQhKs/aFPwhyJtbujO9FraY5w8kHZ8RS2OWot0rhE+lLczSx81vMmwQAhHKGtlY3vAs18xtWSOjMVXSxgdpWC5u7qzaC6WCHD1KlXkFg6T7XhivicNLk9SSYMv4BISO/yce6FXcWbkQOPve88sGb28hyEBR5m08dkW9417qWvV12asDz0S/rp4B4enYo7YsRktnxRZ08JKOkNMG5RLMqG+t/yqlNS+tCjojd6QyACEqOPXVAnXlCyHNWgwPaTETNA5bYjq9U6oQEQ7Lzad7WmXEtwJ6YK7Mll7xydIvgFAedrI/y1s2s/UJvc+4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(39860400002)(376002)(136003)(366004)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(2906002)(41300700001)(26005)(6512007)(6666004)(6506007)(83380400001)(478600001)(316002)(66946007)(6636002)(66476007)(66556008)(86362001)(6486002)(966005)(38100700002)(44832011)(82960400001)(8936002)(6862004)(8676002)(4326008)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nSLSNx7rg4SZefBmh76K9Igfbe70V+sKpWWEjn/tJ0/YCXhpyJzmskMJG4oK?=
 =?us-ascii?Q?bkjOykd+KmrFZtgUJM7jvQCVVx5AsnnQsX657H7pjCyWTxJbbfduEONOTv4H?=
 =?us-ascii?Q?ZBdcun5fPWGZrZ/BkXVWtydLWNnLtctK6WBhA6ToQR3tGxQUm64TEeeuf13P?=
 =?us-ascii?Q?ofG9GMYCc8wvJzSD6RSBt7r63dDaEFjc7WGL7YbdzOit5mkVaxb4lqJdzUHL?=
 =?us-ascii?Q?GXdtjvbri9MQRo4bH+ci7fz8ITCvhHXWYtfhk43p5esSxIj2Gku7xmR0CZ5n?=
 =?us-ascii?Q?VWKSPsEtXSs7hzdxoeTdy75s8YjMokn6BKnIFXn/h68KJjwPiJLzJyJg+2mA?=
 =?us-ascii?Q?mjpvm1TKS4KV3uRDGMScdeiiZ4UST58GgOFL9MMf9Y5KhZ/fEsBP/4iMr9gq?=
 =?us-ascii?Q?lv9Z3tyWwkX7BOb2OPRIUSkyeXFrVJO9eOm0CFFkjYnGeqz9mrfFiO1xhkGA?=
 =?us-ascii?Q?s/Cx++Lo7ZUjRywP7C3R+prJ5Y9z0/yhXUH/6cRiv05CW7FoW+08VgLnYGG0?=
 =?us-ascii?Q?3siUWZdZknrm+ISVacSqkpLPZnhvdkRM5RMHTaJBw00SChek/pZhSuO6D9iC?=
 =?us-ascii?Q?ItPnPZwQZf0VzJTmEGgfC198f2q3YUvYhc3gzB11TFP29+fmTJNClMW2ZY9p?=
 =?us-ascii?Q?vNr5yQEDhfvRDmnP/2RTtJxxqYfyE98jAXmEsGux2YsT0m/WTSJ7DrNDY268?=
 =?us-ascii?Q?lMOc4/DIElujgL9CLIIWLc/xZMMrWZWkY8TnfR6w4N+6fveZE8O/iFCqTdbg?=
 =?us-ascii?Q?AFRYHZqUeh9/j3oammbCrqMzfSg9pdthrGIspM2AbhQCZOLpofwRqAycHHcK?=
 =?us-ascii?Q?plrnOQ/M9AhI7AyC9aHr14xoD6R7s02bnL6aM3AMQwZoZs1PKdjzq73yqAUK?=
 =?us-ascii?Q?0XyPSRx9/L718Tm8lW5mAwFG1vB5QroiafbhjNc2mXHUCoCug8V29n3i+o+f?=
 =?us-ascii?Q?TDKm9hNgzKzFchNcJW0cdejvcZ1efnRdtLDrM5f9NK6qi/3f9oGdG26lgkoI?=
 =?us-ascii?Q?XDzthTt07KGbQH4lDKjsTAkxxafEpxr9SA+CzFNdJ6ikJP0TCXcicHTV3egz?=
 =?us-ascii?Q?gpsw8xgaMTyZ9Yxl8xKdfajsZratMfsD4RJ0IW22fd8ReRhT8R4Fl20sIA28?=
 =?us-ascii?Q?svJyA0W+Oz897yGbgEeXf5W4yqRZ/soKWQ0tv+tR7GbCujflHgdmCauWA4gR?=
 =?us-ascii?Q?z6TsZUzh3UooND2ZlReTd35j3Kz5AbN++oIGb8CPH6MBWDk07c9yNWzDcaUl?=
 =?us-ascii?Q?uIroWPFQy3k20HNAsBjm5d26KVgxySClnoBK/tXrnaD8fC6O1z9aGBl3DS3o?=
 =?us-ascii?Q?NYKY9hxvLW8chU3byBNDtivV/HhqzjKcx7Cj/S4+oHAnB4hVQCLep1Q5mxNh?=
 =?us-ascii?Q?4tW/e6dYyxIO+uqiXKYx6O1HvFpJirYDi6T8FYpDcc9wRwO/THBPSutEonSs?=
 =?us-ascii?Q?xPJWcsoo6kqik3KcMvRZQtinb8YH+qL5TwSsZzwUUn4L9194wCg6E3NZPF5r?=
 =?us-ascii?Q?Fr6JswAFCva0ka0i0CN8i0RmKpjwJS6WofQowiOrEHfBnuhCrfX+rtNJlsE5?=
 =?us-ascii?Q?cWd1ya23Z88O5WkVeIgqyAhQd6xkfFcLQYDvzAM8KQtSRThJehBsST7c51tt?=
 =?us-ascii?Q?UQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05f42adc-7aa3-407d-ccd0-08dc21c8e86a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 19:23:15.7515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3k4vnhsa3f319ceft5z4NgGoh5EDth1w6Ly9YNOT7lf7ubgyXwwUvnViwZdfZRDjIlBTnSXxMa0FuzlCT2JAVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6157
X-OriginatorOrg: intel.com
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

On Tue, Jan 30, 2024 at 10:04:53AM -0800, Matt Roper wrote:
> xe_assert() is intended to be used only for "impossible" situations that
> should never be hit (and if they are hit it means there's a driver bug
> somewhere); assertions are only compiled into debug builds.
> 
> Although we expect jobs submitted by the kernel to be well-behaved and
> run without error, timeouts are a legitimate possibility for reasons
> beyond our control (bad firmware, flaky hardware, etc.).  We should use
> a real WARN if we encounter these, even for non-debug builds, to ensure
> the issue is being properly highlighted in bug reports and such.
> 
> Also give the WARN a more human-readable message and move it below the
> general notice-level message that gets printed for any kind of timeout
> to make the errors a bit more understandable.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 2b008ec1b6de..4efc9601e050 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -23,6 +23,7 @@
>  #include "xe_force_wake.h"
>  #include "xe_gpu_scheduler.h"
>  #include "xe_gt.h"
> +#include "xe_gt_printk.h"
>  #include "xe_guc.h"
>  #include "xe_guc_ct.h"
>  #include "xe_guc_exec_queue_types.h"
> @@ -928,11 +929,12 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	int i = 0;
>  
>  	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags)) {
> -		xe_assert(xe, !(q->flags & EXEC_QUEUE_FLAG_KERNEL));
>  		xe_assert(xe, !(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)));

The above condition should also be converted to warn, I had a patch for
this too [1] but prefer yours. Want to post a follow up with this
converted to a warn too?

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

[1] https://patchwork.freedesktop.org/series/128408/

>  
>  		drm_notice(&xe->drm, "Timedout job: seqno=%u, guc_id=%d, flags=0x%lx",
>  			   xe_sched_job_seqno(job), q->guc->id, q->flags);
> +		xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
> +			   "Kernel-submitted job timed out");
>  		simple_error_capture(q);
>  		xe_devcoredump(job);
>  	} else {
> -- 
> 2.43.0
> 
