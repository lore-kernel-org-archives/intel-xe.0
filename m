Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38924C0015E
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 00:15:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7EC010E044;
	Thu, 27 Jul 2023 00:15:28 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E33E10E044
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jul 2023 00:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690416926; x=1721952926;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gM6znm0nngrzM074LwDEwASS3qiW87L9/QyzppymHhw=;
 b=FZ1Wp279ejm/bwUhw7X0YFdndKoTInfD+kr56GF2zYktEYe0W9trM/kA
 yVOksPzrcU0L6Z7yV8q4UG/WXvdX2HWee+t36rt6a0Pa/CRZQ7s6ba346
 AN/9tyMT55q83Q2fEkP7ocukJWZ1NDMo033ZRFhWUQ26508J6bBt2rg6V
 7f+s7SHUD3U1I/Fn4r7F5Ad6es29vvv702qqKJSCF44TkZ6Rj0EgrgpZl
 7gLP5EnlbLQGY3M3n4oq71ONbeXUHs1tJF2Gz61E90iYG3bLOdO9LEXbV
 V/kwY61EBXr6aoLwnM1j0gc3+A48/1nuK6/AHnJ2n06lR4eLDHXO+oVaN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="367041814"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; d="scan'208";a="367041814"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 17:15:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="1057443250"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; d="scan'208";a="1057443250"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 26 Jul 2023 17:15:23 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 17:15:22 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 17:15:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 17:15:22 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 17:15:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XrxWoCRp9fnNbLGV4+9BXeIswf/WLyRyhWEHUn6ukLT+M/HjASoImDG4Ag5QwwN93/FJnmoPAzfuGMJiMj7EH7bmQHbkHn2g5iDktNcJh5GRoh/v4SXzHdu6NSz8PnPPVqYbz0m0IdxRAJ3gSoxmOILARru752aLgJb4Ekb3zXwcFMe1LW4snQGYaP9NGjvTMX7YgF2mbgHjQM8ZcRCN8/OIGELc9hEnhg/hyiWtiH9+71ex3bbTSkFVGrEPFcDlWeYfoNjMd1BfZ8fwEIJ9PdYkMikyu6fSDFzFpsRqxYr9/4aCkovORqnn8pZIX09eO6y3Gckm8XvC+445LyNpkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lcMjWAL8ogctDQAaJI7JHMi3s7bp8qSCPNwbwD+tLZo=;
 b=VPRIC9157mnn3fFMmUBGGYxBbtBzjJrMYYHChd0eLyTImfwxUVaWqIAHew4mjc0xB4vHex9zh1Y4llvrE/jUY4SGsbO6K6/iN/ovvQVjtBLTCrjFsEv+rgsU/DpIFpvbHUtWRZpNHTykf6L4n88HdRZi1IDIc587iMrWxiH7m+1aG1JV+afjWr77OgZgO8t4/IJS4rBDZ/GS48ASgo8c5bqxP52uinJWTRanVKo14O+0ZUaPB7CTlfmzIQOxhTZVRPCWnSsEFw4JSbODSsdvloE27ey64Z8S0+SAnwyCOLZqvKNsMwXu9M039OTYWqd0AyBhcPseqTfOPkrho+7OTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB5028.namprd11.prod.outlook.com (2603:10b6:303:9a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 00:15:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0%3]) with mapi id 15.20.6609.032; Thu, 27 Jul 2023
 00:15:20 +0000
Date: Thu, 27 Jul 2023 00:14:35 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZMG264IyZ+5gqsAj@DUT025-TGLU.fm.intel.com>
References: <20230726210352.390864-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230726210352.390864-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BYAPR06CA0053.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB5028:EE_
X-MS-Office365-Filtering-Correlation-Id: 16ad5917-b622-4351-e01d-08db8e36902a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oAOGvW+KGgk/yrkcp7OWTEJdvN+FegX5bnxvV3hVd1dyW0S/HVSoeniH4e1v1eqFu084RNx/Z3l8kCNO7G4yF/3eku1ng1ZDJdko8sQvU2hHtQNUTVnWIXemcsuRI/zh8JFEf6XQVdc8bV7BpM2YITnMQXXeAR7DF+g0WxSMJ03s4zd4VWQuFwi10+y3Okk8Y5pdO+GA2d0G4vmgXxXWqqK6Gc8iG43aDKxFUE6SiL82J33If67qOW8O5wbL/x4KK4OlHQeakR0EHsZdB3y7IGFB9ytXykOlM7deaHBfw4/s9UTly+1Sv1oemJtDQcFlSAnFWoi1/2YRaZ+clPqM+4xNF18yfiDbKwanWtXVyhL1q8sEqmXzqt1MXVKlpkmoIDZDf9s746230f8EdQA7WVUPMI0/oghjOLuyut3At9mCFn28PfSvdF+N71l7OKzQok6vhq/pxhWDWA2pZ2TLC+ARfcwek4R1rNiOf9EqC+K+cIcUJ/ZXYxdw6BRsxtdh1ErUhICuSqNxHK3YYf9WRq4OsVjS4nM5bmhv3hZQCbk1mWGVAiGMeRxkrukX2sOAMVYrO7oxzJQ36oqRG18tCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(136003)(376002)(396003)(346002)(451199021)(6862004)(2906002)(6506007)(186003)(26005)(316002)(38100700002)(83380400001)(41300700001)(5660300002)(66476007)(66946007)(44832011)(66556008)(4326008)(6636002)(8676002)(8936002)(86362001)(82960400001)(6486002)(6666004)(6512007)(478600001)(966005)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NnEUBNWoIti2MFZXyHvj99wC5HKeDXw/+stlB16+XvOvgb583cfJF9m6qSPt?=
 =?us-ascii?Q?0ol+EOYjLQg4YrIr1hY4U+lf6GgcNgtB4TwB81j/F2xonw25bmnP7A4ZBv5p?=
 =?us-ascii?Q?/S+VfBN83Wo0MR0P8hBKfJkdLiB2WnIX/TSUMnWHK/EoZSP7HKMLW8llg6Dj?=
 =?us-ascii?Q?SCsDAwbaBltEF/wgOY16OHgsILcqT41wb04GohtFuNO1bJMRQgp/gmpm8Zk6?=
 =?us-ascii?Q?TgzDvFIdTIpaUng8JKgH7cFNzhTn8SsnJktGMWGJc0Z41etFyB4PfH6SNM8S?=
 =?us-ascii?Q?4F55jBhMm348HBz9SmxkCg5Sba2decDj0NJC51COc4pzmbgXxRQwKp7Qp15g?=
 =?us-ascii?Q?OYXXxwoRm4Bb1KNT4eqqm+8RI5ZEAMCifoF+qFKzFVkfmaXO+BI4+EeuMiBl?=
 =?us-ascii?Q?kejEf3BByXt5TnRSqkxFmC6M0/NpHUmpCIsBB/hCfz/SB5aTGbkxbuXzznew?=
 =?us-ascii?Q?jJi79PQbJgxgXm0eJxeZjBdv8FRcsLSTh6yJTi8LyWvj4NZ2T4hq1WsU7oiG?=
 =?us-ascii?Q?W8aPhljLUhGOFjvfrG3fFhoK/WJftbqV3ZmYgmQcubHYpJe4qbWKSjmfI7TD?=
 =?us-ascii?Q?ehc+KFjpG7Hpvtocf2IgDqSSH40O3JhVn6P63H9DqrWozu/ZD4a97voPQClF?=
 =?us-ascii?Q?yg4imQOHelEypd2WnqBlXYLdp/8Ca4/eIrPZs3zZusxzc2fdnQgJamJOEuEk?=
 =?us-ascii?Q?GCIDn84Hnx6jDmWfzyXoud6nenuzzY6z6JeR+bdY2/zFLg380iXTIjWXSRWW?=
 =?us-ascii?Q?5kZB1Oe0pdKPVl+6VlSQu1N72R8kknYK+kSnZwz5Yp/Y9Z3CzTxggyWAvz74?=
 =?us-ascii?Q?DT7mTW6YnM1/GDfx4/E/TopfohcjjY1Gx5puGMv160wdqLXm0pLYZrAGfRFm?=
 =?us-ascii?Q?QSvrjBKiT5up6galh/RAGz12TVvVb+8aE4uNZpuBTvPGXuvlNWHBQ0eNRYfT?=
 =?us-ascii?Q?X8TogkMPDWGtQ1qUhYqDOF8qjJZ/35mch/Jn8yZ2c1C6BmonMHWedYhJV+Gd?=
 =?us-ascii?Q?CqmRSWk3I7h2S/GAr6mYV2POFj2qnVYuINikVtnD5q7wVqhYDI7NVqrMdVHD?=
 =?us-ascii?Q?3zUX2rGSRi9dTf35JQX254jrN7XXnGxecBwUaMXpFZrTaVaMV2IEzbBv+qu4?=
 =?us-ascii?Q?579OamSB1L3HYUN1exJz2dwtXh7j2VdX1/AC0dFcKDokuYghjygvuQ2toLpq?=
 =?us-ascii?Q?EEafTyapatUTAcbNVCSI4Ohi+AG0MBMNOjsJE1EcC8uhCcsMEkANMWU4CxaO?=
 =?us-ascii?Q?hbrXFtDRwRGxp9bcc22NLjffq+TZCxIWO8ySg1MB/tSjCWpAkCAgHgODaqIB?=
 =?us-ascii?Q?yn7eWIsuCDRsgHXoMdeNqjTL4+HNuUjOMl2ijC0nBDFtyktCC1oiSScsmhRD?=
 =?us-ascii?Q?w0wovdL9ZilFGnlc+WXXq5gkejK8z0nY4NsQPotsCFtBxHJmM1lCzpUV6uH0?=
 =?us-ascii?Q?Ac0C654RgVWsB0qgHSgEaBspg8cYTe8uk2XnM5ZIEQ4zvq8VYhNef8r1yc31?=
 =?us-ascii?Q?sGdVQL2vV5oKNjK6UCTmfMKEzJnbI81+uwwvjG2AetXRhPPdrpjm9oQSp0d2?=
 =?us-ascii?Q?Q2VLeJHtGHLHt1EnYGB56SmBWYB18HwtRhWUK+b1CjyijCoAW2v2KO5RvJA2?=
 =?us-ascii?Q?nA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16ad5917-b622-4351-e01d-08db8e36902a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 00:15:20.2500 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LnOH+fxXTaTNX5fMe90GyItiVTCj9Rg7n+TCgTwBZspzk0zYJ42phue1PMvfp0ZRFEMZXVAu7PRZp3US8uY63A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5028
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Invert mask and val in
 xe_mmio_wait32.
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

On Wed, Jul 26, 2023 at 05:03:52PM -0400, Rodrigo Vivi wrote:
> The order: 'offset, mask, val'; is more common in other
> drivers and in special in i915, where any dev could copy
> a sequence and end up with unexpected behavior.
> 
> Done with coccinelle:
> @rule1@
> expression gt, reg, val, mask, timeout, out, atomic;
> @@
> - xe_mmio_wait32(gt, reg, val, mask, timeout, out, atomic)
> + xe_mmio_wait32(gt, reg, mask, val, timeout, out, atomic)
> 
> spatch -sp_file mmio.cocci *.c *.h compat-i915-headers/intel_uncore.h \
>        --in-place
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Just a heads up Daniele has a patch [1] in flight that will conflict with
one so I'd coordinate the merges together.

Matt

[1] https://patchwork.freedesktop.org/series/121390/

> ---
>  .../drm/xe/compat-i915-headers/intel_uncore.h |  6 ++---
>  drivers/gpu/drm/xe/xe_force_wake.c            |  2 +-
>  drivers/gpu/drm/xe/xe_gt.c                    |  3 +--
>  drivers/gpu/drm/xe/xe_gt_mcr.c                |  2 +-
>  drivers/gpu/drm/xe/xe_guc.c                   | 25 ++++++++-----------
>  drivers/gpu/drm/xe/xe_huc.c                   |  3 +--
>  drivers/gpu/drm/xe/xe_mmio.h                  |  4 +--
>  drivers/gpu/drm/xe/xe_pcode.c                 |  2 +-
>  drivers/gpu/drm/xe/xe_uc_fw.c                 |  2 +-
>  9 files changed, 21 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> index ec2d4885bff0..cd26ddc0f69e 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> @@ -90,7 +90,7 @@ static inline int intel_wait_for_register(struct intel_uncore *uncore,
>  {
>  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>  
> -	return xe_mmio_wait32(__compat_uncore_to_gt(uncore), reg, value, mask,
> +	return xe_mmio_wait32(__compat_uncore_to_gt(uncore), reg, mask, value,
>  			      timeout * USEC_PER_MSEC, NULL, false);
>  }
>  
> @@ -100,7 +100,7 @@ static inline int intel_wait_for_register_fw(struct intel_uncore *uncore,
>  {
>  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>  
> -	return xe_mmio_wait32(__compat_uncore_to_gt(uncore), reg, value, mask,
> +	return xe_mmio_wait32(__compat_uncore_to_gt(uncore), reg, mask, value,
>  			      timeout * USEC_PER_MSEC, NULL, false);
>  }
>  
> @@ -111,7 +111,7 @@ __intel_wait_for_register(struct intel_uncore *uncore, i915_reg_t i915_reg,
>  {
>  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>  
> -	return xe_mmio_wait32(__compat_uncore_to_gt(uncore), reg, value, mask,
> +	return xe_mmio_wait32(__compat_uncore_to_gt(uncore), reg, mask, value,
>  			      fast_timeout_us + 1000 * slow_timeout_ms,
>  			      out_value, false);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index 7403673d532d..aba0784b608e 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -120,7 +120,7 @@ static void domain_sleep(struct xe_gt *gt, struct xe_force_wake_domain *domain)
>  static int domain_sleep_wait(struct xe_gt *gt,
>  			     struct xe_force_wake_domain *domain)
>  {
> -	return xe_mmio_wait32(gt, domain->reg_ack, 0, domain->val,
> +	return xe_mmio_wait32(gt, domain->reg_ack, domain->val, 0,
>  			      XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
>  			      NULL, false);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 3e32d38aeeea..bb7794cf2c1a 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -456,8 +456,7 @@ static int do_gt_reset(struct xe_gt *gt)
>  	int err;
>  
>  	xe_mmio_write32(gt, GDRST, GRDOM_FULL);
> -	err = xe_mmio_wait32(gt, GDRST, 0, GRDOM_FULL, 5000,
> -			     NULL, false);
> +	err = xe_mmio_wait32(gt, GDRST, GRDOM_FULL, 0, 5000, NULL, false);
>  	if (err)
>  		xe_gt_err(gt, "failed to clear GEN11_GRDOM_FULL (%pe)\n",
>  			  ERR_PTR(err));
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index c56815af0686..bb906cace7bd 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -423,7 +423,7 @@ static void mcr_lock(struct xe_gt *gt)
>  	 * shares the same steering control register.
>  	 */
>  	if (GRAPHICS_VERx100(xe) >= 1270)
> -		ret = xe_mmio_wait32(gt, STEER_SEMAPHORE, 0, 0x1, 10, NULL,
> +		ret = xe_mmio_wait32(gt, STEER_SEMAPHORE, 0x1, 0, 10, NULL,
>  				     true);
>  
>  	drm_WARN_ON_ONCE(&xe->drm, ret == -ETIMEDOUT);
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 8ae026838702..2530b6243661 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -290,8 +290,7 @@ int xe_guc_reset(struct xe_guc *guc)
>  
>  	xe_mmio_write32(gt, GDRST, GRDOM_GUC);
>  
> -	ret = xe_mmio_wait32(gt, GDRST, 0, GRDOM_GUC, 5000,
> -			     &gdrst, false);
> +	ret = xe_mmio_wait32(gt, GDRST, GRDOM_GUC, 0, 5000, &gdrst, false);
>  	if (ret) {
>  		drm_err(&xe->drm, "GuC reset timed out, GEN6_GDRST=0x%8x\n",
>  			gdrst);
> @@ -386,10 +385,9 @@ static int guc_wait_ucode(struct xe_guc *guc)
>  	 * 200ms. Even at slowest clock, this should be sufficient. And
>  	 * in the working case, a larger timeout makes no difference.
>  	 */
> -	ret = xe_mmio_wait32(guc_to_gt(guc), GUC_STATUS,
> -			     FIELD_PREP(GS_UKERNEL_MASK,
> -					XE_GUC_LOAD_STATUS_READY),
> -			     GS_UKERNEL_MASK, 200000, &status, false);
> +	ret = xe_mmio_wait32(guc_to_gt(guc), GUC_STATUS, GS_UKERNEL_MASK,
> +			     FIELD_PREP(GS_UKERNEL_MASK, XE_GUC_LOAD_STATUS_READY),
> +			     200000, &status, false);
>  
>  	if (ret) {
>  		struct drm_device *drm = &xe->drm;
> @@ -639,10 +637,9 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  
>  	xe_guc_notify(guc);
>  
> -	ret = xe_mmio_wait32(gt, reply_reg,
> -			     FIELD_PREP(GUC_HXG_MSG_0_ORIGIN,
> -					GUC_HXG_ORIGIN_GUC),
> -			     GUC_HXG_MSG_0_ORIGIN, 50000, &reply, false);
> +	ret = xe_mmio_wait32(gt, reply_reg, GUC_HXG_MSG_0_ORIGIN,
> +			     FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_GUC),
> +			     50000, &reply, false);
>  	if (ret) {
>  timeout:
>  		drm_err(&xe->drm, "mmio request %#x: no reply %#x\n",
> @@ -654,11 +651,9 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) ==
>  	    GUC_HXG_TYPE_NO_RESPONSE_BUSY) {
>  
> -		ret = xe_mmio_wait32(gt, reply_reg,
> -				     FIELD_PREP(GUC_HXG_MSG_0_TYPE,
> -						GUC_HXG_TYPE_RESPONSE_SUCCESS),
> -				     GUC_HXG_MSG_0_TYPE, 1000000, &header,
> -				     false);
> +		ret = xe_mmio_wait32(gt, reply_reg, GUC_HXG_MSG_0_TYPE,
> +				     FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_RESPONSE_SUCCESS),
> +				     1000000, &header, false);
>  
>  		if (unlikely(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, header) !=
>  			     GUC_HXG_ORIGIN_GUC))
> diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
> index 373a65c77946..dc1708b4e94a 100644
> --- a/drivers/gpu/drm/xe/xe_huc.c
> +++ b/drivers/gpu/drm/xe/xe_huc.c
> @@ -85,8 +85,7 @@ int xe_huc_auth(struct xe_huc *huc)
>  		goto fail;
>  	}
>  
> -	ret = xe_mmio_wait32(gt, HUC_KERNEL_LOAD_INFO,
> -			     HUC_LOAD_SUCCESSFUL,
> +	ret = xe_mmio_wait32(gt, HUC_KERNEL_LOAD_INFO, HUC_LOAD_SUCCESSFUL,
>  			     HUC_LOAD_SUCCESSFUL, 100000, NULL, false);
>  	if (ret) {
>  		drm_err(&xe->drm, "HuC: Firmware not verified %d\n", ret);
> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> index 4953a9a3f1fb..d24badca8677 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.h
> +++ b/drivers/gpu/drm/xe/xe_mmio.h
> @@ -107,8 +107,8 @@ static inline int xe_mmio_write32_and_verify(struct xe_gt *gt,
>  	return (reg_val & mask) != eval ? -EINVAL : 0;
>  }
>  
> -static inline int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 val,
> -				 u32 mask, u32 timeout_us, u32 *out_val,
> +static inline int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask,
> +				 u32 val, u32 timeout_us, u32 *out_val,
>  				 bool atomic)
>  {
>  	ktime_t cur = ktime_get_raw();
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index e3ab1d3a367f..7f1bf2297f51 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -68,7 +68,7 @@ static int pcode_mailbox_rw(struct xe_gt *gt, u32 mbox, u32 *data0, u32 *data1,
>  	xe_mmio_write32(gt, PCODE_DATA1, data1 ? *data1 : 0);
>  	xe_mmio_write32(gt, PCODE_MAILBOX, PCODE_READY | mbox);
>  
> -	err = xe_mmio_wait32(gt, PCODE_MAILBOX, 0, PCODE_READY,
> +	err = xe_mmio_wait32(gt, PCODE_MAILBOX, PCODE_READY, 0,
>  			     timeout_ms * 1000, NULL, atomic);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index def19e64f2c1..a65ddae6808c 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -484,7 +484,7 @@ static int uc_fw_xfer(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags)
>  			_MASKED_BIT_ENABLE(dma_flags | START_DMA));
>  
>  	/* Wait for DMA to finish */
> -	ret = xe_mmio_wait32(gt, DMA_CTRL, 0, START_DMA, 100000, &dma_ctrl,
> +	ret = xe_mmio_wait32(gt, DMA_CTRL, START_DMA, 0, 100000, &dma_ctrl,
>  			     false);
>  	if (ret)
>  		drm_err(&xe->drm, "DMA for %s fw failed, DMA_CTRL=%u\n",
> -- 
> 2.41.0
> 
