Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45941EE14B0
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 16:44:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2FDD10E1B7;
	Wed,  6 Sep 2023 16:44:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF43810E6C6
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 16:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694018694; x=1725554694;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TQyIwokrlRAFDYk3KyfES2hlvGPyOQg1Oic8qWepBxI=;
 b=D9gfFWRBexaG2DVMJEN/z0ZHRbYeHZevDk35yeHRWjxoi5M4xCJcKd6R
 LwUVHLsGiss/msQnHBTXHHoUUWw4r/42/Wf6unSksUUhiwpHdbdFykDRU
 rf+LHH4Vob6krrmoH9R9jks08q5eD4MFsUY/pIaMcVjhEdT4KD914TVZh
 7yb4zzg17Ix4K1S8vjo0CR1Q8p0m2S23lfxNeREclvHl3Hc5KF/heOFHU
 tIPfz/mzh6LAn99B7DBTOU2M+dClDLv6CB76tXlsardIcTlK6l4iV1MNw
 gvCOJFjHlBwX5alwD06rKiWiNZyyoZDJ428RkDf6AaR25NtNxA/pZnjAA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="367341268"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="367341268"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 09:44:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="776688783"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="776688783"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2023 09:44:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 6 Sep 2023 09:44:54 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 6 Sep 2023 09:44:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 6 Sep 2023 09:44:53 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 6 Sep 2023 09:44:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YDmX7e2Ik6EBgQb5flI+UJCNjaRHRvpz6R6//AyeLHuCIaclM5T70PnkxYkq+5JNxlw35gR0SpX7femRkXxjo4OY2Fwg3+MyOf7Vi8D0JLdqBrmWo8GXtYJ5CcCjieP+sbmTK6piZhf+rqfkwAsMK5HdHmbAnvKgXe6JLNxDQdkxuEWN2qeQynbJLdQLmxmlpng+vuuRsjWdZF2e5jMMRDwFsB5+eYiS7fZum1XGlqF9NeWS/GJdZuCCa1+RXkeDr+jAx4fxXX9n7LvR5n3jemj8DcrXzWE9l/e0TIQEIn5JmCXFfG0svjtUIRD/dncVAr5QaVigPKATHRWRm4eigw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RuyBFCWAmnclNxflGK8dAOkm37K1WgiyVEtkLXdydsA=;
 b=Nh9XQvTxRa3Cpo5GMkh3xfXML60G2CUrYzOg1luTj5sUXTZUn3gMQainBWhRfiEvzWzUhxevhg55LAWJ7n5ZppuWRtk8QeYKFG4XucM/GxSqgSrEN/rBiI2p2E/12TQNgrXnU9cANBDHpJX3+HUjEaWyvKCrooFhm1ftL8OxGQcNCi3tGhzZqUDga0E60fwAPlSRAMdS2rWsmUQW9PhrRm8sKWEFUZ+II5jxLD0uFXcazD4bMkJ7kkybsg9hgZtpdlrDsgLxpA/q1ynAN0Z0iwXwTk3QBasWHr4AMaF7CXLwKLJQOyCNOuFdATxgbNfa2bBg47TRgeDjtwaDahnQgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA2PR11MB5129.namprd11.prod.outlook.com (2603:10b6:806:11f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 16:44:51 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6745.030; Wed, 6 Sep 2023
 16:44:51 +0000
Date: Wed, 6 Sep 2023 09:44:47 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230906164447.GY6080@mdroper-desk1.amr.corp.intel.com>
References: <20230906012053.1733755-1-lucas.demarchi@intel.com>
 <20230906012053.1733755-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230906012053.1733755-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0170.namprd05.prod.outlook.com
 (2603:10b6:a03:339::25) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA2PR11MB5129:EE_
X-MS-Office365-Filtering-Correlation-Id: d61180ca-8ca4-45da-5349-08dbaef896a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +x2RMe5kEfu8pybztt7BCauEsGChMo8QLGFzR23aQQmd9uUz94wpxLzH/3/jHRcLPntx9WOQe08PtucxCJhigqHdjRhi2yBnX28pIQFttNOYSiEJaRs/ZLaqsjIZhLf+XCSDYpkQqMZvdF2APvKNW1zVZEdGwJJq3gUW7c6Fatk6A9JYl43jzarZif6MxqEKK1ghUMzf3zQP08d1bi29bTU1asytjP7K1q25yFpXxYQiMSpFBagvK+HERmWnsR/NrqlPz5/zDcY/PFr7n2l4+Q5lBmT0H40AeHJTI/zEymHplDt4n2ueJa0/DLFx7fUo/gj7hqina/sCUz3Hryn6DuZ0abc0zBmpKqKz1IgmPaJ2llr3Iki3dwHqLMjGkTcXr/YK9IBTn6+nmVt9MQK7EvtFb5LxbD7EVpqB67BZQshfkENODc/2K65Aw5+bKwf11BHcpbxK7MbX/KElUdUTzsQxu5UBo7D9evoPNqrMHxkAtD63hs4ZAMpdq4t9+OJtjJKNEp3EU/5dZOnMr3R+xlZoMG2/IW072pz6zJvEd60EMZ1BS8MU8CFJi1wQWyju
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(39860400002)(136003)(396003)(346002)(451199024)(1800799009)(186009)(478600001)(6666004)(6512007)(6506007)(6486002)(316002)(6636002)(4326008)(8676002)(6862004)(8936002)(26005)(1076003)(41300700001)(83380400001)(2906002)(5660300002)(82960400001)(38100700002)(33656002)(66556008)(66946007)(66476007)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d6MwhJoT9z5Q2A+iHT/gsUmCF5rFqdJDEyg06W37Y4VFqATr5Md9Y0LhsvVt?=
 =?us-ascii?Q?p++zvU4aa6Oh64FKL+ADLhprwbwMxfXCjCSPxV6gViyBTP67YUnY3aNNotPl?=
 =?us-ascii?Q?j8L3Oluq+18Xj8Woofo/bUIQNGfFGfCC64vXyzgOlzoRmoZT3tLoDJM5Yb3p?=
 =?us-ascii?Q?twg+rWZcu85nCpdCHv+r5draA6SgV7X5kVwr+WDRrMvB9Gmqlht0Xy3JdEoP?=
 =?us-ascii?Q?SzQk7EliBuAY6iNDt4HuqjPR8T94zVAdQS/bOiaOf6ll1s9L6FpuKpGdy3VD?=
 =?us-ascii?Q?+Y4mVfX4QnuYiCGuP2YHojBemSNQGVnhvKzkg2LbMfKUiAskkJiPfiHgLALr?=
 =?us-ascii?Q?3DP1oISNHTSSUKdCD+w4QUuqs6qEQ2VRqH9pe7s5buyTnnJ4s0CdeBRb56u1?=
 =?us-ascii?Q?wDJ5lsDd/U8L0ZfymbylUva8496TbcpDPzuCNi6zSCTK79Xobcd2TcS2jEZf?=
 =?us-ascii?Q?IF2mnMB6hV65SM+H9FyjhGOqGGRQtHQ3tM4lo0kSPmfyaGifore51OO0yosg?=
 =?us-ascii?Q?YEQKNDSyTvON4xDw0jQQ+pi9v7Y9HZ+9oK4UXYrhhJxKXjnYqj5tvZ5fR/ht?=
 =?us-ascii?Q?8yza/nRA7qIp0quOsPLqgp3Bo1DzEiXcx6ktLBqJ0Q9uZnEJFph944LjFMMk?=
 =?us-ascii?Q?rlFu+Hjk34DBjLAtmXqyiEC9VwuwY2QkEKg05inilNDOeSTRDmCP6RaAqn/Y?=
 =?us-ascii?Q?eUmrYEqLK6RXRWy99HApBVGOKhDucVURc/OqK1Fp2mDWQgvONOdH85yWIBx+?=
 =?us-ascii?Q?33PXrzJGAXqJmwuGu3LzYRgPegFugrPJmN9yO9Fm9bDezaX1kMF6aSBNPUlw?=
 =?us-ascii?Q?28TwtWsNimqbCzYhSjfnuCCplkJlQjs26eFnPg07vKE4BeBxfI7kEjbEBUqf?=
 =?us-ascii?Q?ba4HRDE9plFdYHoVflxQ6zi4XusV+ugv944uqYbcs35xXs7DOG51qSTtNR48?=
 =?us-ascii?Q?QbATHQEm+cMHnvPW4E3UAwWd4J16FXvGztWG2mI1qy1Ro5/JHYbwZfZ5PEQ3?=
 =?us-ascii?Q?gXBLO8ASuFjxnUZdkXUKo8n3QGw6IPddQt0C4w1gsbNHbssW8Z6v0yCep+4J?=
 =?us-ascii?Q?TlrodjmopWPswuspFaxAxdf828wrg5jMX8Qt3/21neTOnEPCnDiYE+hODB2o?=
 =?us-ascii?Q?bT+8B6Xd8YIAEYv0XqFVmouVQh4SOzlPPoOroDKknCwZnrqItfCe98EFXeVp?=
 =?us-ascii?Q?EeJZDbTKC56Hzg/EZzlcGAxTnSp9jPoW1dPbZ45vvTK24B3McmBOJTecy2pU?=
 =?us-ascii?Q?0T+7TSJYEcObHlv4EmQLHu9N9j8lZapIyVTvCcEjtQ/u3PuYXzLqzNvNEIW1?=
 =?us-ascii?Q?xhfxaPdTuqt6IJyayao+w2wfrxTWpQzCAVtGwBse+W93tGSLUTzTsOHt0ATy?=
 =?us-ascii?Q?mupXpmISF/aorLAoDRJwElE/SvFsr/nBkZXFFXPrFtNsB7DXWnBhT+nFEsG0?=
 =?us-ascii?Q?gXcGFYvq8vp9ak2uV9Rgtpyur9q51qAs0IqMkdbn38Hau/9fx4I72pZ2AqGF?=
 =?us-ascii?Q?l65214fc1GPiOw+x5RgHVP/m18gjSHQlzdb25bOFdJ6274+5HzdZ7G1CF3wJ?=
 =?us-ascii?Q?RpIAC0taEyxD0HGdDQhKvlalGoxlBfuy1P3lT/d41aSyVJvzMRRQqEiRTgdb?=
 =?us-ascii?Q?3w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d61180ca-8ca4-45da-5349-08dbaef896a6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 16:44:50.6741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HHpAW0JqaeOz3TTyW9wJMuV+oS7vpURoJNsLQ1GcNMw8SRxlsh2BPg8F3DPfH5lVDv4AMch1rPWTFp/0e7J+9QnfpJD2Q/7KWaRPKjd1O2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5129
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/4] drm/xe/reg_sr: Use xe_gt_dbg
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

On Tue, Sep 05, 2023 at 06:20:51PM -0700, Lucas De Marchi wrote:
> Use xe_gt_dbg() instead of drm_dbg() so the GT is added to the log for
> easy identification.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_reg_sr.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index 264520015861..87adefb56024 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -147,7 +147,6 @@ static struct xe_reg_mcr to_xe_reg_mcr(const struct xe_reg reg)
>  
>  static void apply_one_mmio(struct xe_gt *gt, struct xe_reg_sr_entry *entry)
>  {
> -	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_reg reg = entry->reg;
>  	struct xe_reg_mcr reg_mcr = to_xe_reg_mcr(reg);
>  	u32 val;
> @@ -176,7 +175,7 @@ static void apply_one_mmio(struct xe_gt *gt, struct xe_reg_sr_entry *entry)
>  	 */
>  	val |= entry->set_bits;
>  
> -	drm_dbg(&xe->drm, "REG[0x%x] = 0x%08x", reg.addr, val);
> +	xe_gt_dbg(gt, "REG[0x%x] = 0x%08x", reg.addr, val);
>  
>  	if (entry->reg.mcr)
>  		xe_gt_mcr_multicast_write(gt, reg_mcr, val);
> @@ -186,7 +185,6 @@ static void apply_one_mmio(struct xe_gt *gt, struct xe_reg_sr_entry *entry)
>  
>  void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
>  {
> -	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_reg_sr_entry *entry;
>  	unsigned long reg;
>  	int err;
> @@ -194,7 +192,7 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
>  	if (xa_empty(&sr->xa))
>  		return;
>  
> -	drm_dbg(&xe->drm, "Applying %s save-restore MMIOs\n", sr->name);
> +	xe_gt_dbg(gt, "Applying %s save-restore MMIOs\n", sr->name);
>  
>  	err = xe_force_wake_get(&gt->mmio.fw, XE_FORCEWAKE_ALL);
>  	if (err)
> @@ -209,7 +207,7 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
>  	return;
>  
>  err_force_wake:
> -	drm_err(&xe->drm, "Failed to apply, err=%d\n", err);
> +	xe_gt_err(gt, "Failed to apply, err=%d\n", err);
>  }
>  
>  void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
> -- 
> 2.40.1
> 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
