Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233ADCD37AC
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 22:07:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA53410E0DB;
	Wed, 13 May 2026 22:07:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ku02f5sG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B425610E0DB
 for <intel-xe@lists.freedesktop.org>; Wed, 13 May 2026 22:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778710053; x=1810246053;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sJ3TPxZrsHVMpdIbCdtSI4b1msPyiZNmQ36g9T7Ojgc=;
 b=Ku02f5sGaUalx0iMmu+/bdoGGEdMiQPKYYnfsdjlnq5C9i5PU+SCX7sD
 BfKQtrAvu0jaazP/9QFoJJ9K8UIXqDlbJxrE3bpgk4o2zprqpWSeae93C
 1bWm4m3cJ+CihhLIRaLh5nW1gNnz/gE86+kcaSjgbYWU7E+fOU6v+pFUv
 UEGxHzu+ILAi6wtELBCG2DCiO5km4Gb0pQc/HNJkQ6A8YsR0UNNH8Y9Zy
 sRg42r8QrABIbMK5sHHzG6pWY3C59PMN63JhbyQOT9kMafze+C/YCJYcr
 Hr5PI0UHTHNfUHQPTUiBNYYou+ILRVH6D0ilpV1IcaAvQmuFxWyLQh+FR w==;
X-CSE-ConnectionGUID: RcNv7jSTTHS6O3Ff62bq3g==
X-CSE-MsgGUID: vhh83I4wRfWGyMfbddAsuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="91033867"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="91033867"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 15:07:33 -0700
X-CSE-ConnectionGUID: 7jYHE+HaQe+8LUjrNMFGjg==
X-CSE-MsgGUID: 4pWBArgXTTKE0O5LG9mDZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="237225817"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 15:07:33 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 15:07:32 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 13 May 2026 15:07:32 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.10) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 15:07:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mgfL9ZmaGZ8GzhKL6qij1bjcH4Ul8mTluk6D9ZVhToVt54zW4E5RTgOesp9Wc0NNl+1pxMgY34MyfjjtvWDa6Lp143vTWZTWPnEpcWQwhfma7a0iHsRoexUDI1YxpzS4GDuSNsUDFFpP6fk4ZyGOnSDENQzSHDcockKQvHRIkwBFndzEQxEI+8y9MApVPBzyPIpc2qC6ysxZp3t9G3Qrd2vXgugsXvObsJcnvv0OKrRrjuDWEfDwuiy8jh/7n0oWff6SLcy/k4Ba3++XpdO+IgBNtBuiOjLWpXyEAMd35ktkjBNE7uIZR0Fn09XD50r0wHRkqywom1Y4o7AHkwqmrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WVfjc4FH4AdIygMLmfu7tQ3ILgg9ci8NSl6Qi2tUEns=;
 b=Gl5ATzD7koktB5An01LShSJ4ygHr7HRrGaHQCREU5mzmwOJLhAtyr0a554fkkpg2EV8w1DqipggwhUWBz6wuE6zk8BBcRUsTFdXnNKeP8jhXsC7D/vPFWteSksMu8VWMFMrSTGHb555JHL/dgjK5rnhPvYnpd5G79pKTOXRGZUTnslTX6lJPTzBY+0z6U161sZ8Mzh+9rDHiLSYN8Xy3cUY5o1eLg92Hc5ub07URas+rcraInhaMS4sVV8VItzizxqOiJgs8mS4tq6vVDJ45EJIXDekyHHUo4MiR0o6n4eOxcIo3QFDR3GWWaiET2RQJIKRodkzqhc7cwSC7oz7Ebg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8284.namprd11.prod.outlook.com (2603:10b6:806:268::21)
 by DS4PPF1DFB73954.namprd11.prod.outlook.com (2603:10b6:f:fc02::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 22:07:29 +0000
Received: from SN7PR11MB8284.namprd11.prod.outlook.com
 ([fe80::65e5:898b:2231:bf65]) by SN7PR11MB8284.namprd11.prod.outlook.com
 ([fe80::65e5:898b:2231:bf65%6]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 22:07:29 +0000
Date: Wed, 13 May 2026 15:07:48 -0700
From: Violet Monti <violet.monti@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 6/7] drm/xe/rtp: Fully parse the ruleset
Message-ID: <agT2NK_Q6VR-yoym@vmonti-desk>
References: <20260430-rtp-rule-parser-v2-0-157e98b4ab51@intel.com>
 <20260430-rtp-rule-parser-v2-6-157e98b4ab51@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260430-rtp-rule-parser-v2-6-157e98b4ab51@intel.com>
X-ClientProxiedBy: MW4PR03CA0252.namprd03.prod.outlook.com
 (2603:10b6:303:b4::17) To SN7PR11MB8284.namprd11.prod.outlook.com
 (2603:10b6:806:268::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8284:EE_|DS4PPF1DFB73954:EE_
X-MS-Office365-Filtering-Correlation-Id: 59757cec-aa0e-47b8-eddf-08deb13c0646
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|4143699003|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info: 1bM4THtB7dy6KksOURKSueIJoMSVjz2fHu2fTVDPmh2ru4kq3Mng6rkolWrjE9elWRFOt4PC2jzRZlt6cPd+Da9c6yLY8drIHwTsPx0Bch2xv+L+21ec5r+xF9VRIukp7a19TEVup/Ufj+WFpVLU+kMhErrPbPFUMG/fXx8t4ulTlnyftOxEx+gcOtgNkvA2YE409PplKyC3q5d/kXGUzQyGN4UtUh6mvkCvwCfFMYCxL2eWW4Ea0ljZgfEK3ag/cVfvPMO+obRvM9YXTiKu+VMQhDdiAU7QYDyHFqarI5m/1T+kIiMEVnD+eIJEwOFCVcoV3LxA/oSJgPfQ2m+vc3pKqcC34bJGhZh2tmUUWakU+yJXHD9tXBIflWR1uf0I4wO7bWC2oOO3rf3FKGZaNjdwZI9oDOTS3xA6n/c3UA5nL5TZ/bhrIMzG4drgJs25f+cg9A/gDVleMro/8DfyzzoGWg0IsRmSF7Z5ad2uq1Tgnt/rgzcx4UksL8U7j5fdkW2O3UfazMd2ggSTgOMzdiwgMiIagl6S2GJJBlG+KVuH+Sb62vECGJXlxSlbX4khBBKwU0eTWpqJZDJOekj9kBjVgx8llMTZs6OPGVKHZ9/7CJ31OOA9LvzGAplMQw4LHKcT2gFn9V3gV6U/Fr8ordO2iBK7IZNHcPzH3qp2FJa7/0RiwCMEUb73PF3hwNxc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8284.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(4143699003)(56012099003)(22082099003)(18002099003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7paMTxfRYxDHD4AOyYCRV+0+O4SyQPj7X90mCDdK6nhtoUTagA60WRewNs6D?=
 =?us-ascii?Q?t4fWrrotRjdskaQ6BF0pSJCgJPPZcksA5yAZvrp2JD7nvcycirIKcPdxyaUH?=
 =?us-ascii?Q?WiHjZEkHZxLxK7IJxFLWyBHm1FWjjNeYxY5r2BX+5Jh6/W9rUPg2ER6Ifmtm?=
 =?us-ascii?Q?BS6ESk0eHEORi5Qukn+ze+zd321umEGiRERPXraa5/76iZ85jYMxNercssGX?=
 =?us-ascii?Q?bi5y45Y7A1j1SefmD48UDFricFqwnjXj1lbjx5LZCL0Ws2Vpic47WiLsAgC/?=
 =?us-ascii?Q?W2tou3+4XfJPfblvIdOnwewhGcMt/f/mGY64a9NKqxGLoEwb8FIxge040SqV?=
 =?us-ascii?Q?pC2L8R6T1FSgCmx+G+Qq1K/tSthkAQwXloNNWcXjWmwA9KFtZYYknwAj8f01?=
 =?us-ascii?Q?JJTy/ZF6Ivm/FEQtRrPAMWVPcpxvYE+OsxrBZHKdDKg10W6zdIOGfZkmljdv?=
 =?us-ascii?Q?sHOdL9fTuqKXsMuUWgSAurvP2pPxj2XRKSiMjhpjuoafgrS1QwV05CNJwPxJ?=
 =?us-ascii?Q?UPqBC55H7jzobZp5NLAazGmBRF4YPXkeDflXLPvrk+pOYAr/k4IxTcQz0RMj?=
 =?us-ascii?Q?sQlsfzBbYbNm+ZgrqND9Q9YC/vBPuTnvjwqI+6tl8gXjAQ1JA6PhB49SOVlA?=
 =?us-ascii?Q?cVw/zXcG4OWctcPAcSMPB2Tyy+0Op+T3QxnPcNzoJR67wVZWSovXRopxExAT?=
 =?us-ascii?Q?/8iCabzZTwpEt5fxrolBsRZUGqYQRBS7uSFlqdmBqKyyQbLCaCBzXhr16F9+?=
 =?us-ascii?Q?zoX4iE2fOe+08CIjz9KbXvg2WpShkPux8sIsKr3vdUpbRjgUPXe3AoJeYpMz?=
 =?us-ascii?Q?enwy+fTSJGqtLXu30R4LC/vJ3QBq1nuYwRjRRVI1K+5hPawRHMasqiPhICgb?=
 =?us-ascii?Q?exOIBzk36+YccoMM/H8PuSoLSdDblip6a9lRBmo8kkftUvmgrC0YzJhSTThp?=
 =?us-ascii?Q?OpS01wpj3XBIf6oE5ZTbhk9cRHMfKJPP/GWASeBMacFRubIUYT5uCcivux/9?=
 =?us-ascii?Q?GgYQA6wiB/bLCqUJNKMdgxZCEBhbVwsUv55S4hnvQCm7xxmqjXAcim47ieLS?=
 =?us-ascii?Q?B0giKq1RZb73eUJ2cPZaRhX3YdSzwT+pd7rZ6hGCbJCvTCBY5zyk2wdQmyp7?=
 =?us-ascii?Q?fUrdrF+eMIG4DYhnDNIz1GQJDXjZ5c7qFDbdFfTYNmgQ1o9s6W/gznmV0SAn?=
 =?us-ascii?Q?hKnEaX/50cR3xR4jFHM2Gqu/9B0bzPvV/fR5vzgKEJsfdrw/Ml8fPiAy28EM?=
 =?us-ascii?Q?UGpqx0Xt1OH9WFi3UuKjIRn9a15hJlhdKBRb3cUQriwp4IjOvZgwTvbkvRXh?=
 =?us-ascii?Q?KGJtYJlH256c8i//un7JRFa+kG7kVs+RsYskigUdiwrGcy+Jkl8XMnX0Xjt9?=
 =?us-ascii?Q?SqecuFszYYYkBgTNqmMFsfRx0p6DgAhVqAZwOdX55+jdlTpiM9vyvEZeqZpU?=
 =?us-ascii?Q?WdW/xsvEz31BVEN3qxhALPRlHiTVODWpxmO09tjnlp4BYE+D8cDDmq0uXafB?=
 =?us-ascii?Q?DOk5IR4FRLZWrbp4nsFbUhtZTJMjImF5Cs0+LrJf0Yr9c/bYSkrqDT39WjBl?=
 =?us-ascii?Q?RhotLAK7VaVHh1AOhgU42SOTc7AwYMvAzIZe9kc5CTs3rSDW5/43rOKUwHcw?=
 =?us-ascii?Q?+i+uGg9fOFbGpC/uhhtE2ebtjWpBe8z9bKYZb39uInsmEl1olT0VYDClcGrA?=
 =?us-ascii?Q?gSRTeCKO3UlJoC4jlKh/AAC1rgq/w8LTJVDil+eOVwAIq2ELqmGC531Jk+i7?=
 =?us-ascii?Q?b7icVo/GiA=3D=3D?=
X-Exchange-RoutingPolicyChecked: ThNt+x6gRvlTuw/zw85jARyk9O/jmMwfJ2EW+aqC5xrBrgMaQF711jahka/HaN+jdv9nhZ8PBEv/dX+f07rHNqUpayD0O2+Km73bbxMMw3OrtDPPaV/oiGiFf1bcOCNXyuCx+3huyrYjUR4ODayaVQhlYyx7mMpvkIAF+ncrRdds7Lxbhnsjjp8zYvdmbiF8okiUw14VtjrbFOX8XQ0SLFvJoAoAgqhBDw3Hjni7EN+h6S2RHssmPvXaWU439ZrTwqBFlapiVaQbd1OY+qHsdyDGzyJQZ8j5YM2PycFGKiRmCAs+mrOeTNfI+Q8vtJOw5JzNmfIbYI4LvQqGcCSAmQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 59757cec-aa0e-47b8-eddf-08deb13c0646
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8284.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 22:07:29.5969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rWPRY+agfZPO2O/vtlCddC5GVqHGuQT7+4W1600PD6X+xn9sL1E6o6xMIgw7h/M2q3S6KJoh/RWpe0LqtV+GKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF1DFB73954
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

On Thu, Apr 30, 2026 at 05:20:07PM -0300, Gustavo Sousa wrote:
> The function rule_matches() short-circuits evaluation of the implicit
> conjunctions (each substring of rules not containing OR) and the
> explicit disjunctions (implicit conjunctions joined by OR). In other
> words:
> 
>   - in a conjunction, once a rule evaluate to false, we skip to the next
>     OR (if any) to evaluate the next conjunction;
>   - in a disjunction, once a conjunction evaluates to true, we return
>     true and skip evaluating all the remaining rules.
> 
> While this behavior results in a correct logical value, due to how the
> "OR" short-circuiting is implemented, it has the side-effect that rule
> set does not get fully "parsed", allowing incomplete constructs like
> (rule1, OR) to evaluate to true when rule1 is true.  We should treat
> such constructs as invalid and treat them the same way we do for stuff
> like (OR, rule1).
> 
> As such, update rule_matches() to "parse" the whole rule set, and that
> while keeping the short-circuit aspect of evaluation.  With that, we can
> fix the FIXME test cases that cover that behavior.
> 
> v2:
>   - Do not change short-circuit *evaluation* behavior. (Matt)
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Violet Monti <violet.monti@intel.com>

> ---
>  drivers/gpu/drm/xe/tests/xe_rtp_test.c |  6 ++----
>  drivers/gpu/drm/xe/xe_rtp.c            | 26 +++++++++++++-------------
>  2 files changed, 15 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> index e009c1243b7c..3429c5d1b5b6 100644
> --- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> @@ -186,8 +186,7 @@ static const struct rtp_rules_test_case rtp_rules_cases[] = {
>  	{
>  		.name = "yes-or",
>  		.expected_match = true,
> -		/* FIXME: The parser should raise an error here. */
> -		.expected_err = 0,
> +		.expected_err = -EINVAL,
>  		XE_RTP_RULES(FUNC(match_yes), OR),
>  	},
>  	{
> @@ -205,8 +204,7 @@ static const struct rtp_rules_test_case rtp_rules_cases[] = {
>  	{
>  		.name = "yes-or-or-no",
>  		.expected_match = true,
> -		/* FIXME: The parser should raise an error here. */
> -		.expected_err = 0,
> +		.expected_err = -EINVAL,
>  		XE_RTP_RULES(FUNC(match_yes), OR, OR, FUNC(match_no)),
>  	},
>  	{
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index c49f80f398af..976a2e1f5592 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -129,6 +129,7 @@ static bool rule_matches_with_err(const struct xe_device *xe,
>  {
>  	const struct xe_rtp_rule *r;
>  	unsigned int i, rcount = 0;
> +	bool short_circuit_or = false;
>  
>  	if (err)
>  		*err = 0;
> @@ -143,13 +144,16 @@ static bool rule_matches_with_err(const struct xe_device *xe,
>  
>  			/*
>  			 * This is only reached if a complete conjunction of
> -			 * rules passed, in which case we shortcut the other
> -			 * rules and return true.
> +			 * rules passed, in which case we short-circuit rule
> +			 * evaluation, but still keep parsing to find any syntax
> +			 * errors.
>  			 */
> -			return true;
> +			short_circuit_or = true;
> +			rcount = 0;
> +			continue;
>  		}
>  
> -		if (rule_match_item(xe, gt, hwe, r)) {
> +		if (short_circuit_or || rule_match_item(xe, gt, hwe, r)) {
>  			rcount++;
>  		} else {
>  			/*
> @@ -166,16 +170,12 @@ static bool rule_matches_with_err(const struct xe_device *xe,
>  		}
>  	}
>  
> -	if (drm_WARN_ON(&xe->drm, !rcount))
> -		goto error;
> -
> -	return true;
> -
> -error:
> -	if (err)
> -		*err = -EINVAL;
> +	if (drm_WARN_ON(&xe->drm, !rcount)) {
> +		if (err)
> +			*err = -EINVAL;
> +	}
>  
> -	return false;
> +	return short_circuit_or || rcount;
>  }
>  
>  static bool rule_matches(const struct xe_device *xe,
> 
> -- 
> 2.53.0
> 

-- 
--
Violet Monti
