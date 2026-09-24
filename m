Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C911C9830E
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 18:03:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B266E10F6EA;
	Thu, 24 Sep 2026 18:03:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ENvMta3M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC6EC10F6EA
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 18:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790273012; x=1821809012;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8qip8mf+zoYV3JpPGVNwtEzph9w+m+LTLXkHWRYG9/c=;
 b=ENvMta3Mg32mIFORvT2TtZXjOU8OpeX2gxWkHVR0L4sUBuKyyh9Zuo6f
 F560fD0yaJemDpX5501WaJ1fgJagSanBJKV+PttPGoj6SJDpcgmT5mAya
 mNCsy/O9n5iRTgZkuxiPPji/VdYg49Yx6ryJth0fsqAzOH7+fo7N28/dW
 jrcmaEFRv2dDZvR6/ajMsoKygLHVfFpOYoWSd525Qpw/uigs06XLtQM4j
 746LIsSRfkkah+BNyOTcCv7RZDuxJHGcSsebmPvbOcw0q/1FFsofuNsh3
 JLwb8JtyFZXyA/GLrc5CKAg02i0p1a0EAPM8Ml4tYJEKT99lg1FNJTA8/ A==;
X-CSE-ConnectionGUID: 5NZNPJIPSoigxaiX3S+xYw==
X-CSE-MsgGUID: Zdre5vq5Q8enwDv7EuQtdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="93945586"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="93945586"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 11:03:30 -0700
X-CSE-ConnectionGUID: JPXkUKlwTM2xAPw2qyxAJA==
X-CSE-MsgGUID: CkMS2j8CSEaagDSxrQhEwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="282183329"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 11:03:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 11:03:29 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 24 Sep 2026 11:03:29 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.54) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 11:03:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jfq3qOH5fLx3LzMB3Bh/7vIjaY35cQizXV1UC38ZXIaWhSoNUp7AK9gYrl9gt9S8lZ80rE/oAUu6RPS8rdm1ra/PWAmdbLIf0YNCPC7maDqypDDFEZuVGA0kbE+k6XF72KLPBJS0toUjjdKELTheF0XmRyFCVKezz1qNTB6j+WTOovd+0cx0jjs+O1LzySOuSRTgJnVW5gRRSWuxY/i+hfosCv05+AUbW/VNB9K9yT+PFpXFJvhSkzivsl8sMjuk0PpFR/w2l+eKYAVWjFmwcKJ0GqyNOQFjEmW2uDdPN8wF+M5uJ1thr1WqQJqxKC4OONMK69emp0PYs1wzEoTOyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1nrpNO3z+rViYd6uih5/ZEFAXKVVoexfgpSEn8SzQzk=;
 b=EaT0HNzodA9MrxdT1qK394WCX9dusJYqnB6EuLDoX0va31ueBxb5eLl6FXmhrd6OirkPZn162GDkYgW/ICyFjnI36JL3ZpQ9XQ9A8wmJsblZjIx1g0USrPnFmaYhAYwhnQWWKDnM8awNSzCcuC0rEKp4fv3DWxpsdc5rdbNJOdgeGRjM+G7mcpJFrQlF1wCzhvHdbMw5Fq9nWCI+k3rYtWWSDIrwbE1Jq2znvwKqp1+vko81j7mYUyGqyLv9/eg75nJ9LD+Ltz6j5NMROPJgU6Gob/PfkkBpRkSogBJizg7LHIAcl/OfWCZ52WOpFs6rJywk1MM00WdJ3X6ddOpyww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS4PR11MB292207.namprd11.prod.outlook.com (2603:10b6:8:4bf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 18:03:26 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%6]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 18:03:26 +0000
Date: Thu, 24 Sep 2026 11:03:24 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe: Do not emit Wa_16010904313 twice
Message-ID: <20260924180324.GB730830@mdroper-desk1.amr.corp.intel.com>
References: <20260924172631.59065-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260924172631.59065-1-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: SJ0PR13CA0047.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::22) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS4PR11MB292207:EE_
X-MS-Office365-Filtering-Correlation-Id: 35387d60-89ed-49da-ca0c-08df1a662197
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 2CGYLITu8RTBUfhzSRSy0AzchKpMM/i/BM84TyBmlu7+TD5bJM3z+Opjsvytx9eQ8+rYex/LWsI75cmcG+tKleDdXnhaR5HVqMd5AHL9OEnowz03UdfX7hb7+z9ubix/9MJfuXkLoemSyIEQnHcWchngka0bjc0sAZ5XLye+pi/WWCWJlT5QoyEFK5Iv94U831ruSOrYLqm1alUrhUHomfYXxUVxjVkAPIhqGT19b8PaWpc46QmOsdWYRryB/drvf1rvwhIYcLeo7VNMwQ+ctXc/pZ6o/2uyxv4CnU5/ulYNzxM9tRYQQehtTNWCqIPSMon8QHJiL5J2MRH9kwtOOVfCARs3ErZX5jlM4twYflNaruX87maB/f7gqEBlrvaYYVSXaWdOShYeqQIqC14/Vhg4JrYlsVOoRXGA2Qu3gNqlB0Z/joV7Yn4Ice1EIF8cjP2Y3bvc+F50rPX45w5AMAxvyRtBf9zkKPrfAr0R7wUYr0QgJja/HlUNJW1VVOGS76ZoRYkKSrZa9cWINEC3eOju7mt2yDnooumD6Urejt8iG2ycrh5bMz++LAESzslvCszxwD6OljiFPpkR/oyEuMYZP2xxNj41akBMl8EG3S3iFwNumjKsGFcEWCwYvUhhQAgjGGB6Ubs6KkBfabgGWmRbqNuJ4mlPb1WcWDb8Nqg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dwdxeNyU6giI/8oPMGJfVsCr3kUz3RuzPnKeMEi2/cyNTAsZ/GUTFRELTYVS?=
 =?us-ascii?Q?DZHi5KY7nqHuNYdOkvIDZvPCMtHOELnvqL1kRONHd5GJ5KUTfkBVLGcq1rlD?=
 =?us-ascii?Q?2Lt3D/UNeSfFxzykvs7LEySfHQQ4AlKCYuDrdih+uSvls3gOw07JUCh5szrO?=
 =?us-ascii?Q?J2TpZCALCr9Gw9d2gEeH0/K3SwdXUr5NmDHk/7KK4a3+eW5OYoO4iXTz66po?=
 =?us-ascii?Q?tyqJdgwo3pr4Xodd8QVLrLtkRV5Zp39ZDLy77Oad3RjJmidF+lIf/ZaND1li?=
 =?us-ascii?Q?o+7vyKInMhl3jf3nxmeBgC521bxIe/jH8WkWf7Y6NTAIss7oX+tx0JcMKHx8?=
 =?us-ascii?Q?j3j5B6e8Vsw4m4yyc9eSV6OHPvIivUHd6I8Os1XJmDh34tiDqp6a5xv1r7kh?=
 =?us-ascii?Q?4LkFiRaqRiIFXVKDhgN/XxHCOju1YdvAoDPQsIcgfUE2YwvqU88GAuzfEyKJ?=
 =?us-ascii?Q?n7mN2GTokdktLDbOtlcQo8yV/hW42ekyaz9OU4qUIZRALO0RNTdlYvknpoUO?=
 =?us-ascii?Q?wuyudfCGPvoyt9yUHNav3EYDwKoTeFT9Ba+1mwhYKedI6uZLIAhXbGpFFQID?=
 =?us-ascii?Q?qvcki730TL1bcJJPDdr53D/bZG3/DbIh6KVPFPoDg+6xB/fu4ZqodhaWAAR4?=
 =?us-ascii?Q?+MX5VD94L81K6nhcadKX2wSRDK0K/g5KoFbpsv3OZrFlpdLzgkloVQh7H0Pp?=
 =?us-ascii?Q?aEpNoxcFaKV6QL3Gaai0twCWJtQhziWV5k2xHtwLSsdKZig/wPPFGxRAuCfx?=
 =?us-ascii?Q?UEbCKYgteck7LknL+cNcqPyA2Zaxiv0+m2LxOtRqGRoc/1Fh33hWrwQuFKYd?=
 =?us-ascii?Q?k4OnX9W4bU6RqluuKh1/msBJ8wXCEYS9BczlHogyKZQZEqmkxl2scXIf4ODo?=
 =?us-ascii?Q?5oRzs0yJdX7ffbNE280nyWgiFOuQHjG2Zs3mQtb1Hc5zBPpGkPwrEt4sf3cJ?=
 =?us-ascii?Q?osDqNjYFc2TAhjLV4JuYo/K1BF4KTKdKFJeUVQiR0Vg5z+K5xJ4uTPwmh1Vj?=
 =?us-ascii?Q?eXyYEWaxUN4XfkYPH+G0UrzIac0rubbrcEUAIluqHv/eAW2Ck3Gtm6IgyYwZ?=
 =?us-ascii?Q?g6cMJ99HHAukFwpYalWZCp64hLBCH5h5Cci4+Rzk1P8BYEbM+kmk0TeRhycP?=
 =?us-ascii?Q?D14pixyIeoJtyDxW/hkZs/1bCpNHZH8DNIs5RLOeGihiKNvz9SR/BtZf/xCc?=
 =?us-ascii?Q?X5JSjuClcw5pSGO9D925PvbL0Sdk9EpKzKSs2al/dsABIJe3EYusZNnW/ZJc?=
 =?us-ascii?Q?z5ko7OQw5IRTlUbywefOZjcK1IvQDTmRochKwgZqRR+bHnjb3//dq8Uxs7Qv?=
 =?us-ascii?Q?nu5rPYVReKg7GOUErMoJex50VNjLPCte53dtlpRkTZX7/A48UjWbrNnYiXoU?=
 =?us-ascii?Q?rMS5DWxMh5+emSTL1Ef+5CaTgwBWZotfaES8bgQjfMp3NK2irWs5aawPqi2r?=
 =?us-ascii?Q?F5TvKNbQbXtPUnieJabXoatLKBkaPz/gC2oOt/OXJTpsmSZYzGiaCQ93CHmC?=
 =?us-ascii?Q?tg0+HVOo2K0755rkTepeWmdQVqCxb5yCx0d9hUfMlURGxni8qV7NgaokQHry?=
 =?us-ascii?Q?UEreutvj9Na8LgZOdhUBQqjM0ZRgnTXaS2TS0/GzS60XluzekIxL1f0hq/uW?=
 =?us-ascii?Q?v47INAyyWfie63/2J/UnVIwMO9tzHdwgTe/T1UQgPPx9hD6gx7GwUU9zGZTa?=
 =?us-ascii?Q?2gLwJAdS0DCWB3+pAudpF3BlC4ug0WMyyFfvDZXesJJHoSEFzGyYkVOI3yqj?=
 =?us-ascii?Q?d5Cq7uBq6JqFCJltsglV3dEjJ99IMgc=3D?=
X-Exchange-RoutingPolicyChecked: z9rvHlZfkS/Q+4dEUKDvDpmpAV4U3bBOoy3OYWkmPUhqpRAEscC4R94mDqV1m4zMkgKYsyg1MWvz2YzKkvjMYqsbsSWY/DcsIHxJzN806lEZDSWim+fqEYPi44Moa9RJorSxoA3ex8mdTeSeEIjJqQT2ZHikf+/YLYCby8djMMngt0RZWYyIBrIuoeQAaSi4cYGSds8w/Mh0tuhiLzpnQOMmULOwtvgx0+PoX4N2YMBNM/d5iY34b6RUDg1OAygYAGeg753zJAAf/zbr/be5KwcsBAhzC70En/WHPurvun6RheD+gIbT6Skv2UHdkRViWZfLLmvWpbRD5tbapJ835w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 35387d60-89ed-49da-ca0c-08df1a662197
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 18:03:26.5064 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hOiSJFVEH8kNbM6Z+OqyqvhKAhMXPHdoH5fXcnkuSczoYCuLq5u3WWfWnu1jKbhwFwAzTveok7gydFOA+WaOoeesPiGJ8Gk2Q02Gw8vj890=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB292207
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

On Thu, Sep 24, 2026 at 06:26:31PM +0100, Tvrtko Ursulin wrote:
> During development of
> e8372edec948 ("drm/xe/xelp: Implement Wa_16010904313")
> one of the interim patch versions contained an incorrect rebase on top of
> some upstream changes, which caused Wa_16010904313 to be emitted both from
> the indirect context and from the workaround batch buffer.

I had to go back and refresh my memory on this one since the changes
here looked more complicated than I expected based on the "don't emit
twice" commit message.  It might be worth adding some additional
explanation that this workaround needs to be placed on the indirect_ctx
batch for rcs/ccs but on the wabb for bcs/vcs/vecs, so we still need to
reference it in both setup_wa_bb() and setup_indirect_ctx().  But now
the setup_timestamp_wa() function will pay attention to which batch
buffer it's being called for and bail out for engines that need the
other type of buffer.

With a slightly expanded commit message, the changes look correct so

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Fixes: e8372edec948 ("drm/xe/xelp: Implement Wa_16010904313")
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_lrc.c | 38 ++++++++++++++++++++++++-------------
>  1 file changed, 25 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index f1cf1463f1b2..3ff4398cb9fe 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1099,8 +1099,7 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
>  #define CONTEXT_ACTIVE XE_LRC_CTX_TIMESTAMP_ACTIVE
>  static ssize_t setup_utilization_wa(struct xe_lrc *lrc,
>  				    struct xe_hw_engine *hwe,
> -				    u32 *batch,
> -				    size_t max_len)
> +				    u32 *batch, size_t max_len, bool indirect)
>  {
>  	u32 *cmd = batch;
>  
> @@ -1131,19 +1130,25 @@ static ssize_t setup_utilization_wa(struct xe_lrc *lrc,
>  }
>  
>  static ssize_t setup_timestamp_wa(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> -				  u32 *batch, size_t max_len)
> +				  u32 *batch, size_t max_len, bool indirect)
>  {
>  	const u32 ts_addr = __xe_lrc_ctx_timestamp_ggtt_addr(lrc);
>  	u32 *cmd = batch;
>  
> -	if (!XE_GT_WA(lrc->gt, 16010904313) ||
> -	    !(hwe->class == XE_ENGINE_CLASS_RENDER ||
> -	      hwe->class == XE_ENGINE_CLASS_COMPUTE ||
> -	      hwe->class == XE_ENGINE_CLASS_COPY ||
> +	if (!XE_GT_WA(lrc->gt, 16010904313))
> +		return 0;
> +
> +	if (!indirect &&
> +	    !(hwe->class == XE_ENGINE_CLASS_COPY ||
>  	      hwe->class == XE_ENGINE_CLASS_VIDEO_DECODE ||
>  	      hwe->class == XE_ENGINE_CLASS_VIDEO_ENHANCE))
>  		return 0;
>  
> +	if (indirect &&
> +	    !(hwe->class == XE_ENGINE_CLASS_RENDER ||
> +	      hwe->class == XE_ENGINE_CLASS_COMPUTE))
> +		return 0;
> +
>  	if (xe_gt_WARN_ON(lrc->gt, max_len < 12))
>  		return -ENOSPC;
>  
> @@ -1169,7 +1174,8 @@ static ssize_t setup_timestamp_wa(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  
>  static ssize_t setup_configfs_post_ctx_restore_bb(struct xe_lrc *lrc,
>  						  struct xe_hw_engine *hwe,
> -						  u32 *batch, size_t max_len)
> +						  u32 *batch, size_t max_len,
> +						  bool indirect)
>  {
>  	struct xe_device *xe = gt_to_xe(lrc->gt);
>  	const u32 *user_batch;
> @@ -1198,7 +1204,8 @@ static ssize_t setup_configfs_post_ctx_restore_bb(struct xe_lrc *lrc,
>  
>  static ssize_t setup_configfs_mid_ctx_restore_bb(struct xe_lrc *lrc,
>  						 struct xe_hw_engine *hwe,
> -						 u32 *batch, size_t max_len)
> +						 u32 *batch, size_t max_len,
> +						 bool indirect)
>  {
>  	struct xe_device *xe = gt_to_xe(lrc->gt);
>  	const u32 *user_batch;
> @@ -1227,7 +1234,8 @@ static ssize_t setup_configfs_mid_ctx_restore_bb(struct xe_lrc *lrc,
>  
>  static ssize_t setup_invalidate_state_cache_wa(struct xe_lrc *lrc,
>  					       struct xe_hw_engine *hwe,
> -					       u32 *batch, size_t max_len)
> +					       u32 *batch, size_t max_len,
> +					       bool indirect)
>  {
>  	u32 *cmd = batch;
>  
> @@ -1247,7 +1255,8 @@ static ssize_t setup_invalidate_state_cache_wa(struct xe_lrc *lrc,
>  
>  static ssize_t setup_invalidate_auxccs_wa(struct xe_lrc *lrc,
>  					  struct xe_hw_engine *hwe,
> -					  u32 *batch, size_t max_len)
> +					  u32 *batch, size_t max_len,
> +					  bool indirect)
>  {
>  	struct xe_gt *gt = lrc->gt;
>  	u32 *(*emit)(struct xe_gt *gt, u32 *cmd) =
> @@ -1264,7 +1273,7 @@ static ssize_t setup_invalidate_auxccs_wa(struct xe_lrc *lrc,
>  
>  struct bo_setup {
>  	ssize_t (*setup)(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> -			 u32 *batch, size_t max_size);
> +			 u32 *batch, size_t max_size, bool indirect);
>  };
>  
>  struct bo_setup_state {
> @@ -1273,6 +1282,7 @@ struct bo_setup_state {
>  	struct xe_hw_engine	*hwe;
>  	size_t			max_size;
>  	size_t                  reserve_dw;
> +	bool			indirect;
>  	unsigned int		offset;
>  	const struct bo_setup	*funcs;
>  	unsigned int		num_funcs;
> @@ -1298,7 +1308,8 @@ static int setup_bo(struct bo_setup_state *state)
>  
>  	for (size_t i = 0; i < state->num_funcs; i++) {
>  		ssize_t len = state->funcs[i].setup(state->lrc, state->hwe,
> -						    state->ptr, remain);
> +						    state->ptr, remain,
> +						    state->indirect);
>  
>  		remain -= len;
>  
> @@ -1404,6 +1415,7 @@ setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>  	struct bo_setup_state state = {
>  		.lrc = lrc,
>  		.hwe = hwe,
> +		.indirect = true,
>  		.max_size = (63 * 64) /* max 63 cachelines */,
>  		.buffer = NULL,
>  		.offset = __xe_lrc_indirect_ctx_offset(lrc),
> -- 
> 2.55.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
