Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA69FC27C53
	for <intel-xe@archiver.kernel.org>; Wed, 16 Aug 2023 23:05:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6663810E03C;
	Wed, 16 Aug 2023 23:05:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB5DB10E03C
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Aug 2023 23:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692227110; x=1723763110;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dSOssHmePD93wY2as3Y/Xcuizy4aOXL4SxCte0WpFd4=;
 b=GgCjioIFHDTpLoL6ztilQ0vGM40f1uIrRTsWCQrlXK7DqnYwhDUbe3Da
 p+QIaIyv+8LmHFObi31TjRHMJpyDN/pcIVghFMDQJT1o3KENM4MPgFcC1
 /Eox7vqfHTcVr8YDdKC7dI9LqhCBR2PcqzwgSnmtK3C+KH8UjlL7/C3aj
 3UxXBrGSBqr508wGgDaNtKM4SP/kLeLE7C2YSKwzoAXdT+21Mirlia83g
 pNawT5TbSi/gFCiGpeYC494TGnWcNhk2aW7FRj+bGpt5Gdj9eIPBpLn7t
 4DiO8jynUUaXiMs+DrgsN2T32bIByIfqF442xVRqTHC65bulIRw0uL3+l A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="375427914"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; d="scan'208";a="375427914"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 16:05:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="980898701"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; d="scan'208";a="980898701"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP; 16 Aug 2023 16:05:09 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 16:05:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 16:05:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 16 Aug 2023 16:05:05 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 16 Aug 2023 16:05:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aBR3/3xsN59MoMJolac0VUQTOwavihx9/piIG46OheXYG2e2Zd3meIb70Chg7lON7Uvx7yjL3wKMq9vyAgAVoXm2Rq0I8nWbzcF8EhKYckVuWNyp6n6qc5Qjp26TX/RR4rVS8Xbi2ETJ4+qGArP97lb/xbQ/8Koz7SZj21aYlso/d1uvbNccKILgyzM3/Wiwz/LH1Q2wEqYhVtGbVY5cRcYMR8pMxiOh9bNCrR4fIBT9f9OcLk3I8iSvySKIH0veebuuqVWbkiCxolHmDD8/5SlTUhHxbJ0r7HluTPHDom+Kqd35PSx2oF3Kv65z2NYvIXf/GN977CKwwvBx0VsjbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6aWOZcNTGSmbyz40tF5sRygQ5lnbE85oGK7Pl4lp7as=;
 b=ayDi1D8COIN47BgapVmmghfWkT85v/GUMTMBqpp5ENueKe8GhZMhRP7s+84ft7+FAL70PohbCcVfGmU8lXN1UPROpPo2i3uBU1JPvbVDse4gPWqTknsrqzorbVIoam+5rx60EgvBxR8TomIdJIbzjROzuTFlu6f2PfOMaqK+vR/krGdLBx1gM/VVYcCgo3V0UflDTnxxAbrbtN0ZgXEgwcYNgx6nnXN2oxuBF1HgrbXc9XLWlD9V4AUlRuugth+Nuu30/fq+j2PzkfB9i/jt5L0vlYkPiz29TK8oNpcxdzIFxXSICQp1EKZVnRa0KNX09sCvHtnfnjpgzIpgHKiuMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH7PR11MB6450.namprd11.prod.outlook.com (2603:10b6:510:1f5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Wed, 16 Aug
 2023 23:05:02 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6678.025; Wed, 16 Aug 2023
 23:05:02 +0000
Date: Wed, 16 Aug 2023 16:05:00 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <20230816230500.GY3375865@mdroper-desk1.amr.corp.intel.com>
References: <20230816180425.1481448-1-daniele.ceraolospurio@intel.com>
 <20230816180425.1481448-5-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230816180425.1481448-5-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: BYAPR11CA0041.namprd11.prod.outlook.com
 (2603:10b6:a03:80::18) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH7PR11MB6450:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bcf70d0-1456-497f-f6f7-08db9ead38de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0vmhQdS4viqSaa2gAt+g9PnDioxN5YhK1L/SexX2EX1mk8aXS0CbebRR5Qg94dpmOdpp4ZCJlgzdJOE6p7sAX7KDoyFUXZsho31sBlmJ4aJN3txJFE5iT26iqzwcFV6U2DNRIrDPfp18FRlZJBQanvnULC/tZBqoDvH57KfWms6CO/xFCu2iyZ4PjEBWzzT2wKcjDjvkTG2hmPY3ZrgQAcoHxVAVjd9Mk/2A5W2I9zDNtmEBKUtIMsL0BmlJD/8XSTp3qI5Luv/AJKVwwP9kvj22goTSlNyTskfpA3ku1d0lgsjbKiTvzLT47J2hqQE96NIRI9XAx2q7bUkBYz5FMGoOmqodKZYhMwf0/gvo/+wFHDqnUrfOoKWXNa8bT4mtjDUkT43zVLrJr82rV15nSGtYCrrKuhsdGEdMMq2ukT7KFpT5k/N7WC8pweQwu+vpwViFhr/EqhSe8ZeDRNln6EreFIgNSgXYzIoQJtgAjPW1Y7XRL/dBdl9yxv9N67uN5gSXEJXOOUIvkY9oIiJsac788SVDbVhneZqxWkfi6faP8xE4gb15UrFlKJG9xBNY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(136003)(346002)(366004)(376002)(451199024)(1800799009)(186009)(316002)(6636002)(66556008)(66946007)(66476007)(5660300002)(41300700001)(38100700002)(8676002)(6862004)(4326008)(8936002)(82960400001)(2906002)(83380400001)(26005)(478600001)(86362001)(6512007)(33656002)(6506007)(1076003)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pTrcZ89tuNwgOSThDPqbO0oHGO+MJVs8ix89xS5DLCnLFVukcCpJKgpHx8SO?=
 =?us-ascii?Q?GKbHepp2avYAmBiYsIcnIQwIPC+pW9kzVIzK40nyJwLQa9fB01iRDPClQUA8?=
 =?us-ascii?Q?PT3vWty6FMcCVB288/RTjKmNOf4TqGTsORHKe+U4JI1V2tA55U6dwvRqvAzx?=
 =?us-ascii?Q?y9bRgUS6+kF1Ux6T746Vb6bT4xPyRCXVVPephPeLm2P7a5dtnOyRZ0NJX4k7?=
 =?us-ascii?Q?C2wsHxps23A33x1t59yNCdZAOSRe0M6gpw+oW8GbmK+f89305jzFP0nuXHLN?=
 =?us-ascii?Q?K6/lOQq2W/heyHz1SNIKkc4Tkym71q/4aVlTlvGggfIOGze7UusdJXgugM8h?=
 =?us-ascii?Q?yKkbbgx6g9YT4F7ek6GwNPZ2w32IqXnLozhlax32BIzbm2T3yhj51r59FsMZ?=
 =?us-ascii?Q?DvM54cxRMZiqpbOaGWcG3Hp4C9Ns/l5G29PDe4H9YSaWx6Nlh1YO/Ul/XG6Q?=
 =?us-ascii?Q?BtqEiOXWcIvQ81MjYe+MViR5O2CTpHk680CEGq9mSwEooJ7qJNCzPH0zFcNI?=
 =?us-ascii?Q?zKwCJyd9DbddSgbY4EI0beAsvl2JBO7tvXsKrTTMb0dCOkU3F38IGh4O3+MG?=
 =?us-ascii?Q?RpMpcN6krraD78EHo5U0ZDx2WhISMBLed6F4LrzIM8c40kN/Hn0i+MUZBdpp?=
 =?us-ascii?Q?dCbovVuN1tUMfaVcjlZqpstr28hXChMWFQe1mkzaDTL5895NtfR45MydJeTF?=
 =?us-ascii?Q?f8NZaTLBAs5Z1vcOU9C0Zd2oOmcQiJ3CCFTK1RP/u7amNhO7IW7d21DCbr3D?=
 =?us-ascii?Q?t6E/r/hc6KJOxeN1+x8J3tsoJ2NiLnnpzgXeKQRtmMr2ms1sI6cTRF8PTnKn?=
 =?us-ascii?Q?miDP7wt/5+RlqxvtvAwUfzeLIExG3XrijYNWZyyuuD655twfpBxVlVeYFkRl?=
 =?us-ascii?Q?BanH2MsQZ5oYblFBcfPemOud/vRF6DNISly5hyRFqT2vqu+jgOpcpwsY0vX+?=
 =?us-ascii?Q?VyoYIYXwJAj29QM6nLvvldvqCZpYzG7pi1r7ba/WLQ8i0XtxUO/q+YoCVGw1?=
 =?us-ascii?Q?mk1S8aZSA4s+Dl0nf9nfixyy6MZu8fTFG7l6brNJscucWOpUaJcKsejiy/b6?=
 =?us-ascii?Q?6jLWhAYU9wDSrZSOv5eWoQ1o8Tu3BEu19EYW7gSlNVpgZlPdcyKxDBZY5RZi?=
 =?us-ascii?Q?Xvd14Ko5DyuMomrS1THQNb+YV9uyCwbVnUUTmGEhBsxwts5Qt4DRA5+UcH9b?=
 =?us-ascii?Q?GeMsDrcUi4Z6RbF5c4XIFB1wB3dMMegiLXQlmDMFART1ZtxBZ7oCnbvKXli6?=
 =?us-ascii?Q?mO8dWsGi0lovn4ULEItM6gSTbDuP/BnVRxaMmoHxSA/8NWCT+k1pLSaclG3m?=
 =?us-ascii?Q?A6mQnibOSasgrU43PJItio/ao59aqNOPm+8VCpNDacF1IUvAvkdUyytfy/Fp?=
 =?us-ascii?Q?CW23SeSW7bpz0M30XS91m7+GcYH/hg/INMqM9sgUt5/Yz0NyBDrjHeHx2DrX?=
 =?us-ascii?Q?kzw9BLDvzrTR4IAxQ7tnuQEXvTvCtEJHYwZa1UYhI/3hXL7PlWejYB1OIFwZ?=
 =?us-ascii?Q?HWOzIWxsg2q5ogpjrzEoYcfV+BuzLsHMgKfU4OQONS/lkMjwtDMVZdfHtAqk?=
 =?us-ascii?Q?uC5IZ8EB+pKyC3aC4VT99yqqqkhbZW5BFC6zcUxiyPTf9nPLlMm3vQlXZJ34?=
 =?us-ascii?Q?GA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bcf70d0-1456-497f-f6f7-08db9ead38de
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 23:05:02.5110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZEHsqGik8igsINCIaP0ODnY/tq40fgpBanp7ztvDUNvzNTssQkHuZZH162xAQzfzVMrdx37Zmy3hqA9zwW4l7SSWAY5/YyWLqWD1YatXg7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6450
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 4/6] drm/xe: add GSCCS ring ops
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

On Wed, Aug 16, 2023 at 11:04:23AM -0700, Daniele Ceraolo Spurio wrote:
> Like the BCS, the GSCCS doesn't have any special HW that needs handling
> when emitting commands, so we can re-use the same emit_job code. To make
> it clear that this is now a shared low-level function, it has been
> renamed to use the "simple" postfix, instead of "copy", to indicate that
> it applies to all engines that don't need any additional engine-specific
> handling.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

GSCCS changes look okay, although this does make me realize that we
probably need to update the BCS handling to do aux invalidation on MTL.
But that's not important to this series.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_ring_ops.c | 26 +++++++++++++++++++++-----
>  1 file changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 4a474ab04f96..11a089ae79b2 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -205,8 +205,9 @@ static u32 get_ppgtt_flag(struct xe_sched_job *job)
>  	return !(job->q->flags & EXEC_QUEUE_FLAG_WA) ? BIT(8) : 0;
>  }
>  
> -static void __emit_job_gen12_copy(struct xe_sched_job *job, struct xe_lrc *lrc,
> -				  u64 batch_addr, u32 seqno)
> +/* for engines that don't require any special HW handling (no EUs, no aux inval, etc) */
> +static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc,
> +				    u64 batch_addr, u32 seqno)
>  {
>  	u32 dw[MAX_JOB_SIZE_DW], i = 0;
>  	u32 ppgtt_flag = get_ppgtt_flag(job);
> @@ -374,6 +375,15 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
>  	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
>  }
>  
> +static void emit_job_gen12_gsc(struct xe_sched_job *job)
> +{
> +	XE_WARN_ON(job->q->width > 1); /* no parallel submission for GSCCS */
> +
> +	__emit_job_gen12_simple(job, job->q->lrc,
> +				job->batch_addr[0],
> +				xe_sched_job_seqno(job));
> +}
> +
>  static void emit_job_gen12_copy(struct xe_sched_job *job)
>  {
>  	int i;
> @@ -385,9 +395,9 @@ static void emit_job_gen12_copy(struct xe_sched_job *job)
>  	}
>  
>  	for (i = 0; i < job->q->width; ++i)
> -		__emit_job_gen12_copy(job, job->q->lrc + i,
> -				      job->batch_addr[i],
> -				      xe_sched_job_seqno(job));
> +		__emit_job_gen12_simple(job, job->q->lrc + i,
> +				        job->batch_addr[i],
> +				        xe_sched_job_seqno(job));
>  }
>  
>  static void emit_job_gen12_video(struct xe_sched_job *job)
> @@ -411,6 +421,10 @@ static void emit_job_gen12_render_compute(struct xe_sched_job *job)
>  						xe_sched_job_seqno(job));
>  }
>  
> +static const struct xe_ring_ops ring_ops_gen12_gsc = {
> +	.emit_job = emit_job_gen12_gsc,
> +};
> +
>  static const struct xe_ring_ops ring_ops_gen12_copy = {
>  	.emit_job = emit_job_gen12_copy,
>  };
> @@ -427,6 +441,8 @@ const struct xe_ring_ops *
>  xe_ring_ops_get(struct xe_gt *gt, enum xe_engine_class class)
>  {
>  	switch (class) {
> +	case XE_ENGINE_CLASS_OTHER:
> +		return &ring_ops_gen12_gsc;
>  	case XE_ENGINE_CLASS_COPY:
>  		return &ring_ops_gen12_copy;
>  	case XE_ENGINE_CLASS_VIDEO_DECODE:
> -- 
> 2.41.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
