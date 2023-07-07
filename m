Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E297CEB64D9
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jul 2023 22:05:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D9010E5EC;
	Fri,  7 Jul 2023 22:05:54 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FB8610E5EC
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jul 2023 22:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688767552; x=1720303552;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lc5hdcaW8HXIJd++T5eIGXGnYec10saGIHvIuR4qWbU=;
 b=Vk0wTQhoE+qlDetcH7BhyxaepCqKK7nURFrn76uYehuKa8nGSlFFT0zz
 Gz2KgDupuefSrhWz1tpSXqVtCGXAUIydDa6215209SlvAZWx4qJA/xPWN
 Nu0zddiO6lEF2Mz3B73xu51hu97W4/RNwLaDwzDCOdJaQn95wjrW9oV34
 6Gr4ptJlygHD8P1N1xSLH6Odqr2xWnv9WkV0CQ9hkBc2Pp8x9qWhn78VI
 2bhZ1JWzJRWe1JUd/OeDmHgxCyR1VjL+W/GioJH6/UMwMAwtq+piiLRR3
 lDWc9G+f8dkO9kS6wXBrg5r9hwANDANqPM4xSNxhWtmw6fhfbEzxsAOse A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="361459916"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; d="scan'208";a="361459916"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2023 15:05:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="894132824"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; d="scan'208";a="894132824"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 07 Jul 2023 15:05:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 7 Jul 2023 15:05:43 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 7 Jul 2023 15:05:43 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 7 Jul 2023 15:05:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IxAPJo7wUwPk58yJ3kbVUSaq+4tCVp04XRm5CbHBI7JcT0kFPQvePevlJmZhytIGoRJEhZ7uOsFjeYSJfhKjjhrELkVDAlFH5DXZFOZMr/FpHxYlt+Ytf1JxlCDkeumR9ImRd1rnuEJ1tyJLf9ZOEfwuN8VDfb55klQI384Fa7/UHd/6SGO76y6QoXsmQaGhgIQkKdM8lLn48zA5LWxMfu1YNAD2wY43nP1UE0SAo1ANgFZa1ABLy/TL8yWYJmgkWdIj0+FUJ724FBW21PLjtdC+4g+syTZ0LaKGQ1iEt/0O7K97POS2Qookjc82gu11CP+ht+pz6KFL8FaHmTmD8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4R5owcCNcp+6GHWqgx7ny7o0FxERbx+I56NDTvOKoQ=;
 b=eOdJFhAsZbs2tTxw5/vqGhik/MUdIMDs8UP9q1wozwc4d27CA6H4Of04ZSlw8hEImdsFU9IryiGgyHiEPDM1XPaV/MyBuyohQdcjF/WJ6UHVjF2ARGlUXugOv+jUI7Tgf7Cl89aUTSCa6uKOey5aP5DbbyFBIPCDH+zstamBTzR2+L9be8W7kObJm+Tab2fC/adH8iCJ0ANeS8Yu1EFSBqICxRjMiRBRBx/ULnUV2seatYLR7Iiny1K9ubvjoMPiNrKcELCmxwAaESpJgRBprZblYJm/l6z3aCRK2OhzrlpPa8M9XorOMrLeOIMdczpXN3sz8VP70dZRCHkPbosiVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Fri, 7 Jul
 2023 22:05:38 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2677:dfb9:456f:1227]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2677:dfb9:456f:1227%5]) with mapi id 15.20.6544.024; Fri, 7 Jul 2023
 22:05:38 +0000
Date: Fri, 7 Jul 2023 18:05:32 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Message-ID: <ZKiMLKiWsUy2QIPM@intel.com>
References: <20230706071036.968267-1-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230706071036.968267-1-riana.tauro@intel.com>
X-ClientProxiedBy: SJ0PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::10) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB7551:EE_
X-MS-Office365-Filtering-Correlation-Id: 30e37dec-aa67-4186-9ecb-08db7f364b4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vzPPR0yClewFgCwo9hG0ameAoGG2dCqw8JkzJuotfYQX8cWeCLcK6qMbkakygqzPhb54rYG+YhWaZD71YEUPXKflvGyqeQ4b6Sq4lRFoJj3TeXnPanWlnRhnwbOL8p+Qcvu7FU/9qNNGBDyarnON8n5y+cczdW9VLMyOOGp4IwbQAnCKb46MnszofDxpuonZ6wBAGWz0ef1b8KBYJqzd5IyWM2Q6sFK1TrSWM0Fya/DLgAq/mmMkFImoLnEo7pbahVzVhVk5VZBXBb30TJlJvyG5kI/dJctqd7yXb8MFt/LNr0FQmAU0Lk6PN+c9EuWsCtT2EvPsK8nPzdLG9MdiND2eim7FmRHsCyIYdNjrV7ACtTkDur6a5IVdGFti1XipCzhH+ZJ310eQxmdumyjgulaDs1k4M3tY4UCByKJLqNPl5ZzSfUXWCizUWFa5773Sr+rGugXnvLpmX3LgU22rorSlbxp0e1KdE87ZslmZZlBm/yoNf6xWEa78aJHIJfEKRcAUZTECTBJE/ksxA1NP1oYuy21Wl7mEn1UP4naCGoMXEt64G6g9cNnltQ21KFJw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199021)(37006003)(2906002)(41300700001)(15650500001)(5660300002)(6862004)(44832011)(8676002)(8936002)(36756003)(86362001)(107886003)(6666004)(2616005)(186003)(26005)(66476007)(6506007)(6512007)(82960400001)(478600001)(6486002)(66556008)(4326008)(66946007)(316002)(6636002)(38100700002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ChxZSfFZT+xnYFh67nU/rh/cRo8eXd2RLtyDsZMeZ79wgpmT+2SL1aZXNVi8?=
 =?us-ascii?Q?JHwsuChKM7850xV2qTmGIpILKoGnctlQL9ihWmYgeNRpjyGtWQ1/h4aNjnCL?=
 =?us-ascii?Q?oKtFeZBeEhHOm9k5uEOmO7zFWjuYgsuNjNJ4Z+vsRD58oXCWYA0LLZAU301N?=
 =?us-ascii?Q?0P3CjwFULyFg5bYEzQMg0jmxeow8X/WKtBOJ5CjrS3ewrdKzJhObkOfoj3Di?=
 =?us-ascii?Q?n1UTsixjL4RcxNLlmL8Ue7esjAPxQr02S8gohr1zAkDBRY2lsjxL6Yu4obGY?=
 =?us-ascii?Q?yB6t5RQdWUsJ3yWCv2ElVGR8lMyF9T1bsACQioR3fhJOtU2+ErR2OOyVOFJy?=
 =?us-ascii?Q?mLqF//3R7+5nt8hHj1Tds6YIdaCKUVwFpFEApZpXccGVsq/65JNuWKGRiVXK?=
 =?us-ascii?Q?qygpPfiBDf/nmiLLNCdwNSQdINjtoEEBVmnDMEI4raS+Ng8uv5d3FTytDAlZ?=
 =?us-ascii?Q?CdCqyoKACgaE9kSyppnF+wrjtEELgCXibw3LR32g+vr5TXkojkwa1MLZkK7z?=
 =?us-ascii?Q?HR5+LhYnrlRPIAAx9PRnzUyP5SdfsOpwjvej9qyii3rQnXSDfsgzGtfmcOXu?=
 =?us-ascii?Q?pA4XkvDO+uEN2m2dG7V2wrPyxk4r/7letOXz2hQTmM6a9hDOghhtoNyOz7XP?=
 =?us-ascii?Q?IBKx3lLSUfy6HWZwG33JmCJHalkBs+AYz6FEhgF29vW2NpsCsuE0KaYDxNDO?=
 =?us-ascii?Q?VWRk9hMPh+Zt8ThM7j8qNQGrImvcC9/pu9ihKNEzkuh1BVanhZilOEhSXQjV?=
 =?us-ascii?Q?8o4W81LFmfo4tRXlupogpj0UlxrUprgmE2PhLkPNdnro8DTNN+xF1GeHUITr?=
 =?us-ascii?Q?eYJ1AynK7Wn3m8dAlSDCXbq0aEruVjFfvm/O5pd/YEg3oIeQMPw4wLPTXeQe?=
 =?us-ascii?Q?oGNi+PmPqhV2AuFUAuxU+EFxGR/bY94vBRyRmwj9CubjG59CL3g7e893rJn6?=
 =?us-ascii?Q?bfx2vldPXcb/e+l0+FTfGcJEGS2xaJYyULeaVUEyezRXg+U5KyYcGOXSw1cj?=
 =?us-ascii?Q?VruL3x7IExs971UPIUoymgK9WqNuDAPSzYKvjPfu+f1SiAp91coxU9yUO7et?=
 =?us-ascii?Q?En12sDbvCaqSsZsOVvginIToCsD1BjN7i78nf6SrLbGcpNIGkYowo5ilqAj9?=
 =?us-ascii?Q?z0j30zQ+wKRnBVIRTYFhariOG+z6OF7u9+EofQ34HyBC8vOAEjJ5v7Nn8A73?=
 =?us-ascii?Q?6zMVjnGS4YXHfmT3rmu6BD+8t2oDZ+MHZeDw0hrO1lR4t4QS6HjtsjfarQeF?=
 =?us-ascii?Q?fKaSqGBkAUdFdRSqnUKE4gFBDpJyDKfef4gyVAHKJySTGW4A66jOyYrD7sDc?=
 =?us-ascii?Q?WZDop5dKGq0I5v+t15tRX1kou1j6WPlcEIr/d7MBu51piKqdNrZFL+7NIb+w?=
 =?us-ascii?Q?G+jtfDBKg5hoWGRYkuCPpkD1dTdlUSljd8Hd6I60o02g+DcMzbfPR8x5dSBg?=
 =?us-ascii?Q?Ov9p6bvbhlFXweF9I1hN8kT9hMNcAKamFm+f/oS1+ZAGF1TvQ5wFyte02ewb?=
 =?us-ascii?Q?epWjV9WQ4iosfUh191yMjO48bl+LS+nlRCi1c4SMsYbXirvB6GyiMGS/KQ8P?=
 =?us-ascii?Q?yKkQTT0gHYkr8CSIOenATJ6Gc1TX4PKOeyKMuGAlKlesZjVgALnFBCOHR0en?=
 =?us-ascii?Q?bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30e37dec-aa67-4186-9ecb-08db7f364b4f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 22:05:37.5425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5cyN9qN1zO3w2CjA1rVnJV/kJIgMTi0V3BVYi/IkBsIG0PGYR5HBTgo2uN7xZstXOjE/a5qbU/gR3tYIPAyuaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7551
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH] drm/xe: remove gucrc disable from
 suspend path
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

On Thu, Jul 06, 2023 at 12:40:36PM +0530, Riana Tauro wrote:
> Currently rc6 is disabled in suspend path for xe
> Rc6 is a prerequiste to enable s0ix and
> should not be disabled for s2idle.
> 
> There is no requirement to disable rc6 for S3+,
> so remove gucrc disable from suspend path.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c     |  1 +
>  drivers/gpu/drm/xe/xe_guc_pc.c | 13 +++++++------
>  drivers/gpu/drm/xe/xe_guc_pc.h |  1 +
>  drivers/gpu/drm/xe/xe_uc.c     |  5 +++++
>  drivers/gpu/drm/xe/xe_uc.h     |  1 +
>  5 files changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index bc76678a8276..d3a2bd3db12f 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -517,6 +517,7 @@ static int gt_reset(struct xe_gt *gt)
>  	if (err)
>  		goto err_msg;
>  
> +	xe_uc_gucrc_disable(&gt->uc);
>  	xe_uc_stop_prepare(&gt->uc);
>  	xe_gt_pagefault_reset(gt);
>  	xe_gt_tlb_invalidation_reset(gt);
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 3093cfeff0c2..b675ef903937 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -730,7 +730,11 @@ static int pc_adjust_requested_freq(struct xe_guc_pc *pc)
>  	return ret;
>  }
>  
> -static int pc_gucrc_disable(struct xe_guc_pc *pc)
> +/**
> + * xe_guc_pc_gucrc_disable - disable gucrc

It probably deserves some better wording, or at least "GuCRC" or "GuC RC" since this
goes to visible docs.
> + * @pc: Xe_GuC_PC instance

and also mention what it returns.

Other than that I like the approach. Good catch!

Thanks,
Rodrigo.

> + */
> +int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
>  {
>  	struct xe_gt *gt = pc_to_gt(pc);
>  	int ret;
> @@ -827,7 +831,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>  		goto out;
>  
>  	if (xe->info.platform == XE_PVC) {
> -		pc_gucrc_disable(pc);
> +		xe_guc_pc_gucrc_disable(pc);
>  		ret = 0;
>  		goto out;
>  	}
> @@ -850,10 +854,6 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
>  
>  	xe_device_mem_access_get(pc_to_xe(pc));
>  
> -	ret = pc_gucrc_disable(pc);
> -	if (ret)
> -		goto out;
> -
>  	mutex_lock(&pc->freq_lock);
>  	pc->freq_ready = false;
>  	mutex_unlock(&pc->freq_lock);
> @@ -876,6 +876,7 @@ static void pc_fini(struct drm_device *drm, void *arg)
>  {
>  	struct xe_guc_pc *pc = arg;
>  
> +	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
>  	XE_WARN_ON(xe_guc_pc_stop(pc));
>  	sysfs_remove_files(pc_to_gt(pc)->sysfs, pc_attrs);
>  	xe_bo_unpin_map_no_vm(pc->bo);
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index 370353a40a17..81833a53b3c9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -11,6 +11,7 @@
>  int xe_guc_pc_init(struct xe_guc_pc *pc);
>  int xe_guc_pc_start(struct xe_guc_pc *pc);
>  int xe_guc_pc_stop(struct xe_guc_pc *pc);
> +int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
>  
>  enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
>  u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 70eabf567156..f8cbd292d6d0 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -176,6 +176,11 @@ int xe_uc_reset_prepare(struct xe_uc *uc)
>  	return xe_guc_reset_prepare(&uc->guc);
>  }
>  
> +void xe_uc_gucrc_disable(struct xe_uc *uc)
> +{
> +	XE_WARN_ON(xe_guc_pc_gucrc_disable(&uc->guc.pc));
> +}
> +
>  void xe_uc_stop_prepare(struct xe_uc *uc)
>  {
>  	xe_guc_stop_prepare(&uc->guc);
> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> index d6efc9ef00d3..42219b361df5 100644
> --- a/drivers/gpu/drm/xe/xe_uc.h
> +++ b/drivers/gpu/drm/xe/xe_uc.h
> @@ -12,6 +12,7 @@ int xe_uc_init(struct xe_uc *uc);
>  int xe_uc_init_hwconfig(struct xe_uc *uc);
>  int xe_uc_init_post_hwconfig(struct xe_uc *uc);
>  int xe_uc_init_hw(struct xe_uc *uc);
> +void xe_uc_gucrc_disable(struct xe_uc *uc);
>  int xe_uc_reset_prepare(struct xe_uc *uc);
>  void xe_uc_stop_prepare(struct xe_uc *uc);
>  int xe_uc_stop(struct xe_uc *uc);
> -- 
> 2.40.0
> 
