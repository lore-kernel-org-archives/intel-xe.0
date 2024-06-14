Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81521C27C6E
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 20:46:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEB5210EE64;
	Fri, 14 Jun 2024 20:46:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kwX8yDtm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B19A10EE64
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 20:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718397978; x=1749933978;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=K4xGDH2raYkBNA8F6VBYo0Y8Ov+b/Tp6OBdGueDacwg=;
 b=kwX8yDtmKbAiy8Xx1yLyQsA/27Zkjjvt85F6P0WI4rGUqx3DI951oVzy
 /MBhoAtJFTGj2R5nesFy+cWHXBODtK5IImMpkucCoXE3ZGoIPi+UR8rZA
 4FE7mhLsWxJW5mVzbN0B/CkJWyVfUXC458RHXyxW5gwzEkvrbrtA8XiC8
 /9fkDpjCNtJbWZDca4PjrUUbY5kWEmV3+ktAH+4spvYZ/IfutrYp1o6cu
 kYY8i9LxY+nA2mJIcNLV9qs66VlQ/u19OOWK1EQh8gZ9efXIdycwFy1HV
 DDAcgQ1DZkTrVDoSCuv6D9OGcfo5+mQ2PrQB9vq/9DwSVd13SJ5I1hbXv g==;
X-CSE-ConnectionGUID: 7Nd6EdELTyCDO51sRRw+Jg==
X-CSE-MsgGUID: 37swhyhzS7qy866k6zUvTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="19158890"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="19158890"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 13:46:18 -0700
X-CSE-ConnectionGUID: 2Vy/01cyQIqMHD3onPNr4w==
X-CSE-MsgGUID: 08obhxdeTNeeXBMppkmQng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="40547850"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jun 2024 13:46:18 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 14 Jun 2024 13:46:17 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 14 Jun 2024 13:46:16 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 14 Jun 2024 13:46:16 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 13:46:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HMG8MqGuBgcBp5CNrn0QBeNBWQWff4wx5q9NJa/ufbeuD/dCZf0pV/1P2gpZk4j55qTY2cjn7KeFwwLc/27DWgQugfHwSyOHXRu1h/jewwRuli0tWzQ6wiGqEGP8AZ2MKlcMY20O3kw0/QeE5r0FVzBPeA0wyWteju2LOfkXAEvF5Dxxb7MsXT+AkMKOTW6YEHWY9mfy34O2t6SvUu85WJpI+0IiSL0TLfifANNL0mmjJYpZNpzwdkVU6NroRnwM76AiK0LpU8GCfzQt31Z3Q2763JMb8LYRve5crgILAIJob3WG+DERX4SiJCqTGZlia9HO2jsdv/jQ9ppxPDAA+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j8EKBSJfdBePvaTHVuyCMHp2cwkiTwFjg9XblLQJ+To=;
 b=HsTVLMcC5CS8PbpOGsELdK2oEpBb27BhOM3BgyffvmsWUIDNwaeT3AuvCcu+zu1m6y2UGucT2+OzxqDhZZiGWYA/45wZ1QFF99UYBSLlijhlSd1F/BwYkERczJXIHnL7n7XNhJsu9x3VdbYM5G4BuSo6DHhwWOehtspx68ZMJJJ14XMPqJH28Lz0Wo7cDb+lv+UmJ9YwRKGq0QVyp6rx7ItxOYamMttHhm1FnXEzh3g+dtAz/ucgBQqxt8SP6QxKgwsRPKRDyHmfbAWLASFqWKQF+C0LgBrGQwUeT4oXfEQ9qXKadmd33+g4Q+8tFJ2nxpgf3xKMvkmutKbKnEyYzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SA1PR11MB6871.namprd11.prod.outlook.com (2603:10b6:806:2b1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 14 Jun
 2024 20:46:14 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 20:46:14 +0000
Date: Fri, 14 Jun 2024 16:46:11 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe/sched_job: Promote xe_sched_job_add_deps()
Message-ID: <ZmysExm-ZB121uuD@intel.com>
References: <20240614094433.775866-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240614094433.775866-1-francois.dugast@intel.com>
X-ClientProxiedBy: BY3PR04CA0027.namprd04.prod.outlook.com
 (2603:10b6:a03:217::32) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SA1PR11MB6871:EE_
X-MS-Office365-Filtering-Correlation-Id: c3b63395-8172-4587-e057-08dc8cb307ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?glqQ6R1mSU3kDcbxidrm8s0sw3Fw+pbmcTS/syKdctnV1zsSOc5VmgNTEX5+?=
 =?us-ascii?Q?8Zl8WOXPUinNDOXNHq4NGeYSua186jLHoxvpVdAIdUCKmoxEBsUFZJXLUPbP?=
 =?us-ascii?Q?EoBtGlHDramciyQ6IPqhctuELq05eMgBoetxoSmGumOvy8zQQbJSi1FMSPBl?=
 =?us-ascii?Q?l7puyyhIJrmk3K521NFmItF7bX0GIRPqXjodwVjxc9erPy3qzCt2Aca49Ni+?=
 =?us-ascii?Q?vY/EDznMcH7rk0fOF+JmciJFp2Owm2+++3QGGqtOKMh3hg7043fL82Vl2FcK?=
 =?us-ascii?Q?qLMaCVMCr1/dyZoe4QNcBQBerx29sNr3x26Xeow55wp0jx7I0sEafhdd9fu2?=
 =?us-ascii?Q?0LhL1HryK7BY8WAYRtYu/7+LZj9951SInDK2vhPlLfXsicxWi7845bXEhkNJ?=
 =?us-ascii?Q?RqA9Im+zLOQUDOJ9KZlDEWyrP+trkZlud4wALiO3VQsSFAIx6S/iG8gb2gur?=
 =?us-ascii?Q?cikW+cEkfqGnKniiz23kAu/qlT10f6cmrjdk8a0Hl+GSgCuYy7eIOEGXNMs+?=
 =?us-ascii?Q?zDvo/mafu7yi1IGYqHv8vDGhe3Q8jpeCttAYeT5DjBHuF7fCjW6bLE13LnBV?=
 =?us-ascii?Q?V2G/d+BRFTNSnPeVhsH6alGh2sjgrWZPC4eVOQDjsvzqD295zBxezKgPOsCD?=
 =?us-ascii?Q?dvhBwtXUTWn1opRCoMRPD3QqEjhJ+7BVt41duwHFfpwpyLg6aoEUuQzJMaGA?=
 =?us-ascii?Q?6QoUmEVH/4nk7U1K+ZxCMRCmjelwQoKLixCIuF+4rquNzUYyBdWIg6IREpK1?=
 =?us-ascii?Q?a9IiuFuM0bxMtLX/fsb3qdzZg482H4r58z+iAXd9oR7iTzcNWodU4qAQXYgF?=
 =?us-ascii?Q?wiLCH9aJFMwERIktSAxS4f3d+rwDxuYUtSH2joU/8AbQhkKL54LZEJhRFL9X?=
 =?us-ascii?Q?0Udap3uSwDdhyZ28yoWd9kd74uXTqsm7W2DhDQVjRK5xU/5JlNhXs8xBdR1w?=
 =?us-ascii?Q?eyWLVCAVXz1O1/kASTzhizehynaNqHhR9QaLE86S44mh0okY2HPpS4WEUIuG?=
 =?us-ascii?Q?tRXV3LrXavtsJuUMU6D/K+cJ6qEF6MOBacEUbHwSGIhrIVcpseckD6G3tY4p?=
 =?us-ascii?Q?lGljLnj5uIcUejNuu+Uwtn8Rjm31TLsPQG+To/9Wk9i9fFj+nD0onLWm2WR0?=
 =?us-ascii?Q?7os4w9e0A8Fmxoey35DoZ2cgno21xl1okT5TQIcURe56VsETEwMfCEmLMWX2?=
 =?us-ascii?Q?8vQ5k3Cjc87YasoQ8LLac7taD4RJwADSKOHYGm1k1zpf5yOHlUCy8qFdzXek?=
 =?us-ascii?Q?SnwRmmn82QYQC3ArDu9scfedYTN1NHQvQrTiC2Fl8IAManL5Ki887UrubJLA?=
 =?us-ascii?Q?JaI4D85VT/fll4X3vc/puIrt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qtwAKVKcRzgiZWnRRe/mk8XwOgGiKHEH/7vLB3mb3HH22k9rbxgDoeWa3xOv?=
 =?us-ascii?Q?DhgtiA9JKNbT8pFlueAjWmX4p4oPnFuFQhkEgUD1GlKYtZwRYfCo1UKKBRao?=
 =?us-ascii?Q?wulOtAFWSA5qfqkNgsrCA34sT12cDDhBtmoqiuUcLtWM9oDc2lBGN+t6I192?=
 =?us-ascii?Q?TIw1wzGKb3m1iZMbt91xM8pqwdvhC36rqpK/WX/ODL25Qftkan3qujTulSwj?=
 =?us-ascii?Q?xjMIR6bRaRHPxMrdpHWzhyitRcW9ce3xEb7Zkh7GAW5ETdtT0qou5K/i7Yri?=
 =?us-ascii?Q?FuzRWCyBPXeHeywgoBBXh/hB4DHJWC3eLTq5hS6kF26VtbrnnKX6YCMJVmxF?=
 =?us-ascii?Q?jSxAb1GZCjRyOiKuKQllkc0E6B7Fl3pKeNhhPcL5l1Yov6JJ0l30ySp5zkzQ?=
 =?us-ascii?Q?sLin5r3lHgHVa/p1MvLYQNeYXLQ/adPZRmhY4iqe8FoBRjwt+9MX8pTSXNdo?=
 =?us-ascii?Q?05mHGuf9u0rzOEc10X16MkbLK/thlSsoZzgQlVqb1GwyGT6spXvIe3swmBsv?=
 =?us-ascii?Q?E3XbE2jteRi5B7sAMsYjMBQ+EtklvgPIUMztFZXVuzApg3WxDMf6bAJoiepY?=
 =?us-ascii?Q?CfFsX1zE8Jz80dJvlsbM1CsvXLTpAEQZ0qVsqoAJijyG7QUAUlU/YWVpCISJ?=
 =?us-ascii?Q?y6YJiTz5ivLWiiszJip8zn9+u2NKtUyXJviHGu+n8enaX092Ve/p7Bq3bX9w?=
 =?us-ascii?Q?D8LxjO9v8ubY6X7sP/P5Gg9vVzdvfpq+JG2hmdH8srIKuz0tt7OpPe/3UiCP?=
 =?us-ascii?Q?qpmoXGEl4Il+oRzKSm5y2OPCtrDV3NN/kKfFXBjJOgTwNE/FOvw1kyQ4YSLQ?=
 =?us-ascii?Q?Ly9cgayzbHKDQfbIOlo0Pl04XE7VWB3u8zj+NXrz1WDbk7wMgSXNB5KGyocz?=
 =?us-ascii?Q?hmmqvBGML3S/gBQIbb5yUk0dKfaLKSdS7zUfd0naV/4gZcGWh+sav2XzVMNa?=
 =?us-ascii?Q?bjGYPdd/zrokm09gWW2XKUvCx7GCtBY8DwT2ZEx43i+Nwun8bWdY7BIOiiOq?=
 =?us-ascii?Q?Vyhnb6zugKF4cINCikBjeSF5uuf1jYbec2H/sCOLtIoUt+PoTwy51wKe8QK+?=
 =?us-ascii?Q?jYKympDQj4EIg+Vw80uRIEaAKlIRJdS610C/5cqk4/IwadWv3dUKuqrfETv+?=
 =?us-ascii?Q?MEXtwtii5oWx1SVW9vbPjO0TPLVfDoF5JDe7LDgYMTdeZIIEG5XAFe+J1LQj?=
 =?us-ascii?Q?gPwQ3zfPH6GduVSgzeqfECDJf3WO85FIRryrheqXUnhHA+8k9n5yr86yPd6g?=
 =?us-ascii?Q?VuiRSSxIP+hur8iLf231zgoC4j6pB+RU7Q8dEWdORgrKz1MvwQt8UQUimK1t?=
 =?us-ascii?Q?R8wzRNCiMvN5qIRewodrOhJfahHmDqlTwSYkpTbKY5tEGlSy/3w/hdPXSEDQ?=
 =?us-ascii?Q?JA8gxhuDnLnO25KrP09UoPLn7mAPc/Pnou/wpAKR8XwmQ8gi6+AAPbIu0RFk?=
 =?us-ascii?Q?8l9r9tGKsbjYREVkG/naZe2+U1ajfc6fNVgpkwwTRVVAvbDDN4NNFDJJreXH?=
 =?us-ascii?Q?UyA5jhf5RK3YW4ssavpViX2t0/cLJIyH7bQqe797QTL1YI+lilP5YawHuury?=
 =?us-ascii?Q?1h2VX5Ppgr2oKfCOWT6RqOKGrnuDfqbIRGoHjDXfHFm8Pb/PzhwbJvzjCwN3?=
 =?us-ascii?Q?lA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3b63395-8172-4587-e057-08dc8cb307ce
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 20:46:14.0023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qH3PKFVBObNgj4MrrTLKP1T3yfqZB9DNaC5ubGxLNZnh9sBOUl+MplVBoN7Ygm+rEt8B0ptOTuTF/f3N8fGzNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6871
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

On Fri, Jun 14, 2024 at 11:44:33AM +0200, Francois Dugast wrote:
> Move it out of the xe_migrate compilation unit so it can be re-used in
> other places.

I would call it 'component' instead of 'compilation unit' but anyway,
nothing wrong and the change is good.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
(and pushing soon)

> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec.c      |  6 +++---
>  drivers/gpu/drm/xe/xe_migrate.c   | 26 ++++++++++----------------
>  drivers/gpu/drm/xe/xe_sched_job.c |  6 ++++++
>  drivers/gpu/drm/xe/xe_sched_job.h |  3 +++
>  4 files changed, 22 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 4cf6c6ab4866..2d72cdec3a0b 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -259,9 +259,9 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  
>  	/* Wait behind rebinds */
>  	if (!xe_vm_in_lr_mode(vm)) {
> -		err = drm_sched_job_add_resv_dependencies(&job->drm,
> -							  xe_vm_resv(vm),
> -							  DMA_RESV_USAGE_KERNEL);
> +		err = xe_sched_job_add_deps(job,
> +					    xe_vm_resv(vm),
> +					    DMA_RESV_USAGE_KERNEL);
>  		if (err)
>  			goto err_put_job;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 7e3fb33110d9..efdf148ae59e 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -647,12 +647,6 @@ static void emit_copy(struct xe_gt *gt, struct xe_bb *bb,
>  	bb->cs[bb->len++] = upper_32_bits(src_ofs);
>  }
>  
> -static int job_add_deps(struct xe_sched_job *job, struct dma_resv *resv,
> -			enum dma_resv_usage usage)
> -{
> -	return drm_sched_job_add_resv_dependencies(&job->drm, resv, usage);
> -}
> -
>  static u64 xe_migrate_batch_base(struct xe_migrate *m, bool usm)
>  {
>  	return usm ? m->usm_batch_base_ofs : m->batch_base_ofs;
> @@ -849,11 +843,11 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  
>  		xe_sched_job_add_migrate_flush(job, flush_flags);
>  		if (!fence) {
> -			err = job_add_deps(job, src_bo->ttm.base.resv,
> -					   DMA_RESV_USAGE_BOOKKEEP);
> +			err = xe_sched_job_add_deps(job, src_bo->ttm.base.resv,
> +						    DMA_RESV_USAGE_BOOKKEEP);
>  			if (!err && src_bo != dst_bo)
> -				err = job_add_deps(job, dst_bo->ttm.base.resv,
> -						   DMA_RESV_USAGE_BOOKKEEP);
> +				err = xe_sched_job_add_deps(job, dst_bo->ttm.base.resv,
> +							    DMA_RESV_USAGE_BOOKKEEP);
>  			if (err)
>  				goto err_job;
>  		}
> @@ -1091,8 +1085,8 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  			 * fences, which are always tracked as
>  			 * DMA_RESV_USAGE_KERNEL.
>  			 */
> -			err = job_add_deps(job, bo->ttm.base.resv,
> -					   DMA_RESV_USAGE_KERNEL);
> +			err = xe_sched_job_add_deps(job, bo->ttm.base.resv,
> +						    DMA_RESV_USAGE_KERNEL);
>  			if (err)
>  				goto err_job;
>  		}
> @@ -1417,8 +1411,8 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>  
>  	/* Wait on BO move */
>  	if (bo) {
> -		err = job_add_deps(job, bo->ttm.base.resv,
> -				   DMA_RESV_USAGE_KERNEL);
> +		err = xe_sched_job_add_deps(job, bo->ttm.base.resv,
> +					    DMA_RESV_USAGE_KERNEL);
>  		if (err)
>  			goto err_job;
>  	}
> @@ -1428,8 +1422,8 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>  	 * trigger preempts before moving forward
>  	 */
>  	if (first_munmap_rebind) {
> -		err = job_add_deps(job, xe_vm_resv(vm),
> -				   DMA_RESV_USAGE_BOOKKEEP);
> +		err = xe_sched_job_add_deps(job, xe_vm_resv(vm),
> +					    DMA_RESV_USAGE_BOOKKEEP);
>  		if (err)
>  			goto err_job;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index 5c013904877a..44d534e362cd 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -363,3 +363,9 @@ xe_sched_job_snapshot_print(struct xe_sched_job_snapshot *snapshot,
>  	for (i = 0; i < snapshot->batch_addr_len; i++)
>  		drm_printf(p, "batch_addr[%u]: 0x%016llx\n", i, snapshot->batch_addr[i]);
>  }
> +
> +int xe_sched_job_add_deps(struct xe_sched_job *job, struct dma_resv *resv,
> +			  enum dma_resv_usage usage)
> +{
> +	return drm_sched_job_add_resv_dependencies(&job->drm, resv, usage);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.h b/drivers/gpu/drm/xe/xe_sched_job.h
> index f362e28455db..3dc72c5c1f13 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.h
> +++ b/drivers/gpu/drm/xe/xe_sched_job.h
> @@ -90,4 +90,7 @@ struct xe_sched_job_snapshot *xe_sched_job_snapshot_capture(struct xe_sched_job
>  void xe_sched_job_snapshot_free(struct xe_sched_job_snapshot *snapshot);
>  void xe_sched_job_snapshot_print(struct xe_sched_job_snapshot *snapshot, struct drm_printer *p);
>  
> +int xe_sched_job_add_deps(struct xe_sched_job *job, struct dma_resv *resv,
> +			  enum dma_resv_usage usage);
> +
>  #endif
> -- 
> 2.43.0
> 
