Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74810C25B74
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 16:00:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06BCA898C4;
	Tue, 21 May 2024 16:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dLV4ZYzo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2128E898C4
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 16:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716307230; x=1747843230;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sVhk9TLCnSYAfDkiEq/NDlNpULtd5+ao6c+q0KXjsT8=;
 b=dLV4ZYzocleZdvdZhZ2/rmg3wt/oksND+2f00cA7aOCGBsYHRG6VDFVR
 C6NtGfXlx7jwO8wdnkW+awVp8eaejSOfvRpvq+VhmSJMzwm19oac0lKJX
 6prlCqoN6x2bB7lv7htedMb9pk+5cLNj2eQXOrs86y/dJ+Rny4xm1/FQk
 PC3NJuW9JCQqcVsyKnS2H192ZC9DMpzdTW6FweNkImuyjvOAqQpRdzvG5
 A195F0fE97rB28QJs3Gt8ArZFoVmF2aUw4TGGBWWMMWizd1h6DVH0lCp6
 IjGzKp82X7TjMwWAZeOKS5Urs5WQEtbRCGKo1ahQX6pV7agAzWNq1hZbY A==;
X-CSE-ConnectionGUID: cVjuDvxrSqKg4g0+qdnoWg==
X-CSE-MsgGUID: EPfVzcKCQpWvbow4OGHHZg==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12381172"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="12381172"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 08:59:45 -0700
X-CSE-ConnectionGUID: S+B/qBqqR+qKvqnSKmCwnA==
X-CSE-MsgGUID: J5Cj5DtAQPuEfSLiI3RSGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="32891203"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 May 2024 08:59:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 08:59:44 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 08:59:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 21 May 2024 08:59:44 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 May 2024 08:59:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HL339fFIdEtD2BLha0dlC1lBLR5Mzjqx6ws1m8paJeH/eJ1PjGrQ/fW3Qvi7+iAWeTUcyjg++EM+zZcx/+7ooGgrj9yeIEaEPC/USJNrsGkYugdWaRdogjau2NGAEJQMkVhspNs4tUXtYE7Boensbz/75FuOQDrr8aYtxkvGut1E7C9xXJPHekEf0CfD8/4rtRn0uWkVz7U+d/dK4pLroWvRqHzKXQkFPXeDIrW1AKcAnBd3tgtgkZMDhe2oWbUSA3v89xu4z9FimMb4413ZsyZwvZ8SN7qOQ0GHNI9OIVwNmNtkE5oBkvxnw4QS78K+nb7t/BSY/ZLCVcrE7v3yUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJHwflDIk2kWf+fd6mtKKpd6WFeLVb+aMJyCuJFGn5Q=;
 b=AbWyhp+MrJKquzVcP191N9YX6MoSWbitg3qM7sLznLC7qy05NshgMiCq0y5D50M2VparXQh7oivYf0NToM/rQ/8EEhwpXjHFBYXUQUFR0a+2vUvPNVC0iIXZvrEnidYZQnuOrO0xoww9FpGK2EE2buEmwFtn7AepbRHupXp4VJjJSPNJjkXrzENErsYSqHeuF2JrSlRE6lS8K+K1h9IZdt9ooTuoMhifUzvc0Y585ArkzPnbzijJdRWaaamI1Qm3FGbQwtBhVGdKWIPwwP2M4mSN0TOfziADdniieEBGsFDsXfwY33MjpTEEEtEM++O+ZW7W4hPf6tItETlMwbFwqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CH0PR11MB5282.namprd11.prod.outlook.com (2603:10b6:610:bd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 15:59:42 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.7587.030; Tue, 21 May 2024
 15:59:42 +0000
Date: Tue, 21 May 2024 15:59:16 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/xe: flush gtt before signalling user fence on media
 engines
Message-ID: <ZkzE1DFaYsl1bkv7@DUT025-TGLU.fm.intel.com>
References: <20240521-xu_flush_vcs_before_ufence-v1-1-ded38b56c8c9@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240521-xu_flush_vcs_before_ufence-v1-1-ded38b56c8c9@intel.com>
X-ClientProxiedBy: BYAPR08CA0012.namprd08.prod.outlook.com
 (2603:10b6:a03:100::25) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CH0PR11MB5282:EE_
X-MS-Office365-Filtering-Correlation-Id: b05f2770-4500-4fff-8f9e-08dc79af06c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YY8kPG6+mj+6wuFqboqJfzXKpo3cp0o8kI+2h8Q+lJfDpwn5YlogSGZTWArH?=
 =?us-ascii?Q?QXgGVzagQIpdE9UM/QqvOcaI6BE5TnOek2W0TkTnxc+Gr2sB7ETrlhbxPqQ0?=
 =?us-ascii?Q?oUSsbID9BovMfDp3qgRe1T/JTt7d03Oq8HpVbob3MIqE0gmeE1HKRcsi/BpH?=
 =?us-ascii?Q?sfHPpnH9d/SOaHaoGFQT1IXvCZwMNcWCbnw6YSuBgvxDu3If1LYFrc3TUFD3?=
 =?us-ascii?Q?d38q7A1hxH8QSGGmt6l7eiZHh7Y5wX9pyeAhIcx44TcEfR3Sg70+ELl1xKmG?=
 =?us-ascii?Q?QXNeB6yGZO4WW6DV/04o+jC+hh1tFjSeYx1lI4Z82Y4VGYEs8r0q7ZDVoskZ?=
 =?us-ascii?Q?Jip4Y+DCM5DiaRNZ8mDbpOjAi5QAV1mS2ZG3ko9WE/sq+x2M/QfBimPaIOCb?=
 =?us-ascii?Q?XF6ihY7Cv0bSEFb35GXhNhMeIsTCc+TYEGUYOuZOsRRUT6VyuNp2sehmkTHe?=
 =?us-ascii?Q?7m4CmVxopNL4xDousNTogx54RyW5kr92alCt8sTrqabsASN9qwBx73YzV8o+?=
 =?us-ascii?Q?q130Hu9St+RvBQzpHv2QrLuZBsuJ6IM1twsRT+B0QPjuTc3JHEyciNiNXHJQ?=
 =?us-ascii?Q?DHs5kNfKalwE90ujrV0A8xV8jpnAPSEly1H01GjDkIJdHD5TvTIF8GlQgj/m?=
 =?us-ascii?Q?nZt03mCjQzDdTa1pp/8VEMAJFLFHMMFxk76QV7Ie/6fQPcZzY+DI5C5FlW57?=
 =?us-ascii?Q?y8liqoBYsECEnEkZZUS67QgIFpaQg6R+hxC0MlTLhf3LrbV12Dzt1MAyr8Ne?=
 =?us-ascii?Q?AV91dtCKNVedj4wgYT3SC3n+TTY95FLCXVcdQ+UfAqpS8HJQ/D3SdvwHzMme?=
 =?us-ascii?Q?eQ1Zxd9nqfEU5rsweufGmIuMtOCZhgwsgwQD0ro8GfhWUasV0ELhRsro2knk?=
 =?us-ascii?Q?WnDHCMaiTrSKBDUUBMHABG13/P/+tyOMp6kpe8aVyK+uXXesDN0xkZbedXQA?=
 =?us-ascii?Q?9kTAhtBylz8uda9U5cYHWI///OjWrtYekuSu+IcYqwH9FCv0jhmhXkmZgVw7?=
 =?us-ascii?Q?6C+PW99dMhIXHvedudeD7Ckdccm0O+6Qu4JhOCS0Q/BmI9MfJOrDuHBt8btq?=
 =?us-ascii?Q?etUbtZCkpCuI9Jstye5wEyrVBVK87y4lKUWP4jWQtwYKc8CBPj1PbDqQTjEn?=
 =?us-ascii?Q?QX57AZK75tB+z1l/VTFw2LUu6ednLR72JgKlbxprx1pc9/C0Z7XpOTixg+SS?=
 =?us-ascii?Q?m+L1cpuqLdyYRZygJuUUyt40pwsUQfyy3Tfsg+L/h9FHG2ygMC6d+zcpuJY?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uRAkr4lxmeuoYX9n9JIQTGYrJ9uvrrvkcXG9TeLeVcOragzIZOjofD2gsu6X?=
 =?us-ascii?Q?jrNuzqQQjU2qDVKQBX0o976iPwXBQJTkkDWDEObLBxFSJBTZf9Awa4FR5O6z?=
 =?us-ascii?Q?Fyj5lSXqdaEGHrnUCzClxJbuppCHIvbqcSkiVsQvBTowFDRc75ZAuli+yGXk?=
 =?us-ascii?Q?vqa/sH3aLGj6Z4NG8KBpA3XI/2tG8ZXy/5rxTtYcEOBUh9c/Z2tTKFOxS/T0?=
 =?us-ascii?Q?UrIJHxLQtGuCLXWUclbAcGpbo/v6/OqceJhT+OXMk/U0Fg6cDjJJF9yXBcw9?=
 =?us-ascii?Q?EHtkYPbcDjZi/Z2X3vkOJWXiXOPzY0X/tR8fwS0dtXOVmXQEll81mg+VtPbx?=
 =?us-ascii?Q?TJD1MJOfYWg2GPFI0r6AXYAXSnyl6JMAGdJTSEKS4hlYD+YXIhtDHqORUZZZ?=
 =?us-ascii?Q?VeKcvnza6qw4OYAklEOc62H2gC7wYLNE9+cU+/lNrz3z5wjMiYwhYDKpxxzV?=
 =?us-ascii?Q?HKBswIRQDvgqu2VrsalANyJbBA7hnYheF3a5h4ND/8mYh1zdS3Kz7RCiAUNO?=
 =?us-ascii?Q?PJr38dDEfFP0rkgUb+X+IHCSE5Bk82l+9aJ3yEopFHCVoSzhreUpYkl4/Cb9?=
 =?us-ascii?Q?EjaTu5VCljkWNfyqotfJl/ijIEZ6y0n10qXNzV97PRAvKsfUql0rr1OYBkmO?=
 =?us-ascii?Q?HCRU3y9pLz3dW8frnCuBKUt49QAdCOYyZGNuJFcpgz0Dyo0qi8Bfxx+uvBXj?=
 =?us-ascii?Q?fVLAoNvROHZrUudk3ok6jwy8BNDmBi8R8lw5OmL84BQexYGxwT9ZSpF8idh/?=
 =?us-ascii?Q?8vKd6LUYOp7K34kvVMwyP9A8S5i51l/Ker/dwk1s9STr8EJmpUI2cRs30T0D?=
 =?us-ascii?Q?t2KL3koQE6jYqJoEBd20q5LSC3FzAtO8FBot4QRmkMiCGLjoO/helhbdhGz8?=
 =?us-ascii?Q?WOG54Pyx+UIvcK4yBFPDNomlSQJIJgYbtoHYnMF5/nrA82B/8H3nXq0h1Lgn?=
 =?us-ascii?Q?8QDpMmOYnZGYHzuLxT9u0MMR2PLfpzB177i44TUE+qOYUzaMG5hFChfTaqCO?=
 =?us-ascii?Q?m6IxXiq8En1Pi49flVNs625U+aaXF91njkfStJVx21VFU3qt4Q1OWdTSmMlD?=
 =?us-ascii?Q?+OcMvsg6w+A44ECdlWac7eM70eSYwTTU/XoZdLRSzcUxsYoBq6j0u5IztVqM?=
 =?us-ascii?Q?7T7tm4TeBVOmuhLW7XJjkMuEhHl+W3fztXqXU9laIJOhdDfsVLgO+c3aYVae?=
 =?us-ascii?Q?sfffo6pbu0RgH8TPKCdAPubw6h0qftbg82YDzc9b1ekTCA4J7nKJdS2A8RFE?=
 =?us-ascii?Q?s9agDPdd7zdVUEaDiJ1iUbcLRgUBms6NfWnkGsAc5l8Mi3iT2wdRwjV95a15?=
 =?us-ascii?Q?00dKF1o09eXun1t7AnxYeg7PN4POfgq1RIrjoPrNXFCtS0HhdMK+8RBNOpiZ?=
 =?us-ascii?Q?Vecb/6IfZja1R/RFnCgYtAxxnQuvSockOG03nkVV+NB1dEhitv0CPXcumvd8?=
 =?us-ascii?Q?8wh/NoCdCwoUYJ3VpTwcv/zjI0V4tdqIht2vtKhZp7VAmQjS5tOufoN1kwtT?=
 =?us-ascii?Q?M4zpJ4iGR4U7SuBLlNZneue1v3tqouAXgx9DlYn7BNKl721YTqRoxLXNZTqw?=
 =?us-ascii?Q?6Pbpwbg/rc7Hfpfmfmz76B3FmIeSaVEOOuGsu4IxxNWkgP8ajye/dGJF1KuI?=
 =?us-ascii?Q?fQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b05f2770-4500-4fff-8f9e-08dc79af06c0
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 15:59:42.0210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nOIYqOEZ8IR2P+GitvXm53uiTxEn1Ao2V0UuKxHabKyoX2V5OpHYU0HV+gp+q/G1wHwwoPEouDNTSKWm30N1PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5282
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, May 21, 2024 at 05:23:46PM +0200, Andrzej Hajda wrote:
> Tests show that user fence signalling requires kind of write barrier,
> otherwise not all writes performed by the workload will be available
> to userspace.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1488
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

Fixes tag?

With a proper fixes tag:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_ring_ops.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index a3ca718456f6..eb36901f96ff 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -293,13 +293,13 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
>  
>  	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
>  
> +	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, false, dw, i);
> +
>  	if (job->user_fence.used)
>  		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
>  						job->user_fence.value,
>  						dw, i);
>  
> -	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, false, dw, i);
> -
>  	i = emit_user_interrupt(dw, i);
>  
>  	xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);
> 
> ---
> base-commit: 188ced1e0ff892f0948f20480e2e0122380ae46d
> change-id: 20240521-xu_flush_vcs_before_ufence-a7b45d94cf33
> 
> Best regards,
> -- 
> Andrzej Hajda <andrzej.hajda@intel.com>
> 
