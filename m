Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3712BCCF2C3
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 18:44:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3B9B10E13E;
	Fri, 16 Oct 2026 18:44:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB21210E13E
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 18:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792176246; x=1823712246;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=RMCXR5+6tHrAbTvFsy9brPcV/33wpdyz2OYkUYU4VFc=;
 b=KRKcsC367d2zTCYnn84tJbrSfbrDKtyRF/Dgmo/guj8qWXdPSyoEEjEK
 GvoqQqlTbjxYLwONLA2g8fC9z+SweYzYqceOdXiAwmyfhYyUDyrZNJK7J
 Wo2UQFhsh7AW+63blLA4FahShM6PkhS9GGycKcgfU+Sv9wWsi9RySqpYp
 8/aQ022utx8NPvIP8pEXOiaIjMiPxp1Ua3/eXaAxFVAU7o+sYWt1OnnMH
 ACMMfeypTQoYWFOFhweqtCZv0t/D6wTZQk7jX9uKxSs24LYuCMIaQvUWe
 7M81M56uhRMiG/Ixw1Cau5vcLQTBcssBXoVPwNzavtv4u7DxNFzHjip2Y g==;
X-CSE-ConnectionGUID: ihWdYkClQ3CTcB6YP9WqZw==
X-CSE-MsgGUID: lWSoB2F4R9uABGaFG8edEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="977151"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="977151"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 11:44:04 -0700
X-CSE-ConnectionGUID: SwWBTUR4QLypIiGwsJIh+w==
X-CSE-MsgGUID: 9Q4dm6DXRuOYIgQpXDuXPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="3851327"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 11:44:04 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 11:44:03 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 16 Oct 2026 11:44:03 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.5) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 11:44:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pelLWa91TVx6o35KVbCgXv273o6vUMmkq9M6pye3vtb+5iuI15Unl6ZedS/nfuJPltWBZ5l1sB1/7SjgOxVIZPrsKEd1fICFa9Gr/UYKwFaMmkuebZw2bBb+OOeqLAhWaFXFQYlpygNUYTW8K+L9IsiLCLgQ1dAhU1iEW0fv8nC0kgPfC6AHTo2/1x+3lqpVfE7gG/Q5tXqzc0ed/fcoTgK1h6a7cRcoWJ/Kh/hU65z9OmIGKI0g3WVP+HLFiXFWecpZlCKtju5bEYwpGUL0twmC4z08xmH/wxxcUxX7XXbz5gu+ejXMCdNMjBkTxMC/NFqPTGYGqPovGhnIeqbnFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJ3wr+tY5dk5pJzRyESnRfRT8Y5HWhfsay18NEjaQR4=;
 b=OCjMXZ5l1fuxD7scX+tRd8qBJ/MFjApNSrkBpfFRNK9Jt2w5G1HQjgS8CIdMrMIqw/MD+Dfl3qZr/G8Y5KY0xlUPJqVT4yV4XT74ZyDhgEIGsRLynJ3CjD3KX6aKSKVftwyftILilBS/WtAm4jC0wcXhliI7Bkw0D1NyfY+wsphXCxyCczGp0zoyD6xrfHwEHtoDl7a1Gg/gI3MWGXjXxhLWGbCT6Hwd1XQrTrrilNVPdTeySSQkOqwjHwX4eU4fBRgMg397Z893CY4SEN8WusOSUzuYFpMTCZv3nFPLjC1GsdPqCm+ypxK/G3cJKV36dwowHJw8O027C7kSIsbuzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by LV0PR11MB9790.namprd11.prod.outlook.com (2603:10b6:408:385::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 18:44:02 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 18:44:02 +0000
Date: Fri, 16 Oct 2026 11:44:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v4 4/4] drm/xe: Update non-purgeable shrinker batch size
 based on average BO size
Message-ID: <atJwcKZTBf1lKhID@gsse-cloud1.jf.intel.com>
References: <20261016133523.3622-1-thomas.hellstrom@linux.intel.com>
 <20261016133523.3622-5-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261016133523.3622-5-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0125.namprd04.prod.outlook.com
 (2603:10b6:303:84::10) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|LV0PR11MB9790:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d28ac69-26ae-4041-6161-08df2bb57270
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|56012099006|11063799006|4143699003|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Dje9NoQeBPO5szvoy7hVIqTlKpbqN0hgs/BAt9TukKQ99KgbY+4IHGn+/liNmxF9PHRulcyt1akd2g3u71WUVfDwbKmMfHEwr5u5RiCSezmW2XBDEDlJPcCkVgofHVGj2b2a/pTZgd0GKJtGMSw3B0e/DCWgu8jhPFfvGPZUHkmzRR9nR+unuiQE6Xwxr7USG2DpkNR6zslhMCcCm3ajxh8MNZkZ2nG/nXwjGax2xXpFWQqadDp7PPmFiAT/EqUCIOJQ4wqqyC8k+vR9OTB3QrF0IddoWPl/HNOmhXhRawdGWCgRIDZbecPol8m60kinzUs3wEz8DmGhh7QPt3pmQ3xP9zxWnhsBQ4TxkI1hP59ex466ulA2+DFv02LzntG2kpLAZvVgXK7XzEAAqZIYSPc9dil6xzMaRTiNRsoHWRoLgr8uMSrzxn/V+tAEj4J6j+XWmow5BibN7a75fs6UaeXQz77SP5XowkGi7qqoPupBqMJcXJiK8jUOulmsuNvMvDr2+9e8YfMoPAkxwTkxCcBC0cU0W/Gr+oTFU/2YNHkN9iy4zLYPJx/RbkWjb7SfJbbiZ4GExqpQSKnEuSYOxI3bE1k73PHz4grSdgFcAdnNR/i8t4RP+kXGykZGbfTSrpFbXwxIKBuAR/D91yUfUlnR6sOezbQbqg6BTAIeb6o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?U2X9F3w4hyy9pyW+ygbi8ATFpkmpgKnviWBQ+T4/NvrXr8XRVDQZF+wKC8?=
 =?iso-8859-1?Q?T2uvM3Rt+hkToKv+b1btqe/NgrW2LpzziLRmf6xNXnYV4TaU7CqRntJfgb?=
 =?iso-8859-1?Q?uwaj4O90XAHc3OtFMCgYKwzRKWozacyTPMgvYj2NZNy3DplWK6UH6x/ECm?=
 =?iso-8859-1?Q?VbTuRsUl5mr3hRElYin0KbrkKlgBYC8PgZXdgiHugAHcz35H5jiyU5pRV6?=
 =?iso-8859-1?Q?5Y/Orkge7ThQ//mj2ZGOu9/l9qctl7gcyefWMcLXdJlBIadZOUscmsXaZ+?=
 =?iso-8859-1?Q?E35yj1RCs9uJuzIqhewsLMhHiqApU/GClGZk4jf35UB+QWyV5iBwBbIQGH?=
 =?iso-8859-1?Q?uRfy88UPSC6aA/9fBOTIBPcudytdx7zwPBq/pw39dHyLn1nlKyTYk9IDbx?=
 =?iso-8859-1?Q?VhNxFaE5Ow6yrNIDvRAIjdmHCfy4Z6q1O/s6MUM9hLKplVnV1eqLvs/Wi3?=
 =?iso-8859-1?Q?QWpz69hGlP4/xlsr3Fzk204yhjBUlvZyjGYNyqBunpSK2tyOpYghA8FxJo?=
 =?iso-8859-1?Q?WVwT0bvq7ylgmbzGbtXdugI+ji1gQ0lJRNIujGSocK6ySy01pA3/cKjOTT?=
 =?iso-8859-1?Q?hI+DavY5KCTIg4dPxxJaKfX/Rn1w8g0oQXnZulCws9MPYARpBUrIZoFt6O?=
 =?iso-8859-1?Q?2Re5TSLytUMn2HC6s03NtgvVxp/8g6rxap5JJhOjaGIg2xQr102joSRyx7?=
 =?iso-8859-1?Q?QMnwoqcKwZPsCD0vEr9CUzon9NToUqDqMF9rIV5qJ4U5YSWsoCuJpIBnAr?=
 =?iso-8859-1?Q?I/Bcfje/3Bddx7DbfGDFHwY/0dFt1hA+JXJwA5qu1IcXWSsQJaVLoaJYuf?=
 =?iso-8859-1?Q?zreRNBIdtqO7rtllB/HD18bSTdHcmBQT2l3SqJ5KJCJkWiSHYqq9iSfgUG?=
 =?iso-8859-1?Q?Zl8nLHAF9j2Es/WtdiH7uQMlX0mfeoLFHRMZThG8t/bMtGIpLTbpT3V9yN?=
 =?iso-8859-1?Q?mqaI71EbKCMWN4nFVcSCSJuzReOTPKYvhw4z04F93Jolei1t+4u7tMNEtz?=
 =?iso-8859-1?Q?OgkWrLyg30R8EDUFJn5VZ+/cUpUshJiedL4Vm3IJjROC55mYEhLY8CBoUz?=
 =?iso-8859-1?Q?OYX6LFqNuCgdlDTwYimixmWQ6bNWmYZuLodJKyARJYJk3TvudOBb9s8WL0?=
 =?iso-8859-1?Q?Hh+uAfGwIo2jcbdd7D19Ygmh+Kxndix67LZrVYs4Yh2ozRNJ4g/wA2oJua?=
 =?iso-8859-1?Q?S3ZzD9ONswi3gJCW7QzrpSjoNhecrEmOtZaujlwO9FAFh3i4I/aEBo2rsU?=
 =?iso-8859-1?Q?jlwQcKAU2CnPp1T/ttRjLhxdlPCGkk3O6iaS3Ylvr/uXLYdkD4EsWX7X8o?=
 =?iso-8859-1?Q?HcXdxaTTF5y1c8spnXjyUyQcuM1GD+0RrPvuT/5LBfBcx7NmslZk2+wC8h?=
 =?iso-8859-1?Q?e2JnI+zTmE1Zn9Kf1+TczDWTc4ddnxNjbASPioxOG5uSewKXpjbZw6ugG3?=
 =?iso-8859-1?Q?mCg6p2tAQ44EufGELoaEiIbUFP2pHsgtX0tbeksqzg6iQ0pLL3U0UWBY61?=
 =?iso-8859-1?Q?k+gOVgt/Chk9ZANpg1/JWhMyJRn+S7wkUXn4IhDdafso+ySsZ9d4piJkEQ?=
 =?iso-8859-1?Q?t0ISfVJI+x5gBUW0tAImf/l0QCJaWthO+JRp8kXsBNqxCggg2aV4qWt8/q?=
 =?iso-8859-1?Q?QAX9e09oZr3Vri6rFFMYIKhK4PO3NfpK39BfuUGfTi+q+YeLcnl7IgIL9m?=
 =?iso-8859-1?Q?MeqyVbDUwSBHhOBQ+KTUqQndGknXfjf9Z3yjyWuwDmo1NZpT5/JZtRCpEL?=
 =?iso-8859-1?Q?yFPp7kKgK5TzQkaCL0eidPfXh1XDXkWcvqEA2UdRTbdykGYsJWBPqxfs8P?=
 =?iso-8859-1?Q?zwm9iF4GXljJ0qEPrEyhThx46esAVXU=3D?=
X-Exchange-RoutingPolicyChecked: kP3S4ki3/ZxHThm4wfVSjL3D1D7/DRqfvpS1PnZjiMtRNRaFb57SGBxkrB4h108Ma3dcwajlI+cGMjUzFR++einmQilnNhu7wa+iXq+k5Kz8gH1wyL6WH6rZJOaX6D7cK5nL+XOg/6VjiO8ZcmImmeXTSfh0beNJ88Ht4PU1jaL0ZGpEDeSLQxxpR/zqSCcluu1l6TQHqYHkdXmbSMFR7xvhj05gPZAnLLscgcbdYIIHwVC+svuooy7AgqyfQGkCTohyQ/mpZ6M/wcMu54hWGQzPOY4NDGLTv9OJknvEJEoaKGW4O58W0qwK5EjiGRZqWJZH6fdGrAHMiF6J9YTDgw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d28ac69-26ae-4041-6161-08df2bb57270
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 18:44:02.0135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PDkXh3xxXaPIc/W4fJukhtaSD34XBwwhwBlJZ23z0ggUoMSZC4P06lrN+VLM02VBDIsdgKLRGGBRmlXPSNij3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB9790
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

On Fri, Oct 16, 2026 at 03:35:23PM +0200, Thomas Hellström wrote:
> Update our preferred vmscan batch size for the non-purgeable shrinker
> on count passes that allow backup (__GFP_FS), to avoid invoking
> scan_objects() for requests too small to free even a single
> average-sized GEM object. Our rough estimate for an effective batch
> is twice the average number of pages per populated ttm_tt across
> the full shrinkable and purgeable population. The factor of two
> provides headroom so that most scan invocations can free at least one
> GEM object despite variability in object sizes.
> 
> The batch value is updated as an exponential moving average,
> (old_batch + avg) / 2, to smooth out sudden changes in the object
> population. It is floored at 128 pages, the kernel default
> SHRINK_BATCH, to ensure the shrinker remains responsive when there
> are very few objects.
> 
> The populated_tts counter introduced in an earlier commit provides the
> object count needed for the average. We inherit the same justification
> as the analogous mechanism in i915: shrinking a GEM object has
> non-trivial per-object overhead, so firing the shrinker for requests
> smaller than a single object is wasteful.
> 
> This is only applied to the non-purgeable shrinker: purgeable objects
> are reclaimed without writeback or GPU idling, so they're cheap enough
> that the core default batch size is fine for them.
> 
> v3:
> - Original patch reworked on top of shrinker split (Matt Brost)
> 
> Assisted-by: LLM
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_shrinker.c | 48 ++++++++++++++++++++++++++++----
>  1 file changed, 42 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
> index 8e3fe675e0f3..955908b3bdf3 100644
> --- a/drivers/gpu/drm/xe/xe_shrinker.c
> +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> @@ -30,6 +30,8 @@
>   * @shrinkable_pages: Number of pages that are currently shrinkable.
>   * @purgeable_pages: Number of pages that are currently purgeable.
>   * @populated_tts: Number of populated ttm_tts currently shrinkable or purgeable.
> + * @batch_avg: Exponential moving average of the preferred non-purgeable
> + * batch size, based on the average populated ttm_tt size.
>   * @shrink: Pointer to the mm shrinker handling non-purgeable (shrinkable) objects.
>   * @purge_shrink: Pointer to the mm shrinker handling purgeable objects.
>   * @pm_worker: Worker to wake up the device if required.
> @@ -40,6 +42,7 @@ struct xe_shrinker {
>  	long shrinkable_pages;
>  	long purgeable_pages;
>  	long populated_tts;
> +	long batch_avg;
>  	struct shrinker *shrink;
>  	struct shrinker *purge_shrink;
>  	struct work_struct pm_worker;
> @@ -203,6 +206,28 @@ xe_shrinker_count_purgeable(struct shrinker *shrink, struct shrink_control *sc)
>  	return num_pages ? num_pages : SHRINK_EMPTY;
>  }
>  
> +/**
> + * DOC: Batch size calculation
> + *
> + * Update our preferred vmscan batch size for the non-purgeable shrinker
> + * on count passes that allow backup (__GFP_FS), to avoid invoking
> + * scan_objects() for requests too small to free even a single
> + * average-sized GEM object. Our rough estimate for an effective batch
> + * is twice the average number of pages per populated ttm_tt across
> + * the full shrinkable and purgeable population. The factor of two
> + * provides headroom so that most scan invocations can free at least one
> + * GEM object despite variability in object sizes.
> + *
> + * The batch value is updated as an exponential moving average,
> + * (old_batch + avg) / 2, to smooth out sudden changes in the object
> + * population. It is floored at 128 pages, the kernel default
> + * SHRINK_BATCH, to ensure the shrinker remains responsive when there
> + * are very few objects.
> + *
> + * We only do this for the non-purgeable shrinker: purgeable objects are
> + * reclaimed without writeback or GPU idling, so shrinking them is cheap
> + * enough that the core default batch size is fine.
> + */
>  static unsigned long
>  xe_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
>  {
> @@ -210,15 +235,26 @@ xe_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
>  	unsigned long num_pages;
>  	bool can_backup = !!(sc->gfp_mask & __GFP_FS);
>  
> +	if (!can_backup)
> +		return SHRINK_EMPTY;
> +
>  	num_pages = ttm_backup_bytes_avail() >> PAGE_SHIFT;
> -	read_lock(&shrinker->lock);
> +	/* Consistently use write_lock() for simplicity. */
> +	write_lock(&shrinker->lock);
>  
> -	if (can_backup)
> -		num_pages = min_t(unsigned long, num_pages, shrinker->shrinkable_pages);
> -	else
> -		num_pages = 0;
> +	num_pages = min_t(unsigned long, num_pages, shrinker->shrinkable_pages);
>  
> -	read_unlock(&shrinker->lock);
> +	if (shrinker->populated_tts) {
> +		unsigned long avg = 2 * (shrinker->shrinkable_pages +
> +					 shrinker->purgeable_pages) /
> +				     shrinker->populated_tts;
> +
> +		shrinker->batch_avg = max((shrinker->batch_avg + (long)avg) >> 1,
> +					  128L /* default SHRINK_BATCH */);
> +		WRITE_ONCE(shrink->batch, shrinker->batch_avg);
> +	}
> +
> +	write_unlock(&shrinker->lock);
>  
>  	return num_pages ? num_pages : SHRINK_EMPTY;
>  }
> -- 
> 2.56.0
> 
