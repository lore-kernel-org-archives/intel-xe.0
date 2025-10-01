Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FF0CCA471
	for <intel-xe@archiver.kernel.org>; Wed,  1 Oct 2025 20:59:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A4710E03C;
	Wed,  1 Oct 2025 20:59:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZUYxlt7y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D6810E03C
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Oct 2025 20:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759352382; x=1790888382;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fcKEBRlziMFAbaCRIgzkiv/bMDgOqbjWNNJXKcsCQGY=;
 b=ZUYxlt7ywgNJi7LrfNcU2P6w8Mtn/B+t1QG2jc4w3x45NJNs2NkdgFvF
 wThiz5iPd4DEP8rWrUBEuoXzVviAdaSjVF+zNBpji054eWpvtzFiCPZkj
 0f04aas6Zxd8feHkl/jVE1558uXtPy5jBSDGgXY/47T+NP4u9sPECbQLT
 rrlICTRU8vIK8stx8jcyKt63SdNUjTTvd4fQ99WkpUbQ5BYJybi7KSoF8
 34qkywnEuxOhug2S/6Nc7lBKzhR2ncu8o+LUEc4mhMG2O0Olu4J9FopX+
 wavEHgDajXH+fQARqL4yiQkfWEcrXmF9X/iM9On9LAVAnZeglih9MHug1 w==;
X-CSE-ConnectionGUID: 53wO4gc7Sf2XCiwxlMGVMg==
X-CSE-MsgGUID: V2Z91BxUQYOeqakM7cQ3Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="49194725"
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; d="scan'208";a="49194725"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 13:59:41 -0700
X-CSE-ConnectionGUID: zoQAzHtuQhyRiPaf+l1I3Q==
X-CSE-MsgGUID: 5r2/sHEPSzy9ImT/JNRUZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; d="scan'208";a="202607126"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 13:59:41 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 13:59:40 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 1 Oct 2025 13:59:40 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.29) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 13:59:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dkC9/UxupqvKPgfCokiY8O6imqe7/rAfuqQJdk/raSkhquvxPRlXW2q6rYCg8Prpd/C/O6jdkVUY7rinhg7STU0LDp8ifuC28W4sQt7ZgY37qdvkn5VcUZkFdNT9WQCfQowMA3AB9qB7AKM1+Jm28pEvkyZ2jLTGNgd4CDvs78VdWNPCJByTnrYbA7dNs2wUWoDlxEOpIz3l32PoxpgUeUwA4BQNyQ8PBg7ZIJ4oesXyg/BvsTdgGHMjXoqces3s8Sk7QFmgrcrCP2Bj34EnMDP5aMm0Ijzrfe1t3fHohyHMrLyGhmPBL87VEsarenqZecgTKTGrl8PX4rse4ZSqHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GlPKyzp2/WxbgMaDoDsD7itH6z/BU2dUQ7VsbhiVscA=;
 b=Vx5PFHbmLU0y1yXCV17o5bXWY0g5LHTbsjytzFiV3mvF7aTUhilhrywHQ1PmWuEAx9JG1dHH7kY0AhmIsidy+JW8Mu9JDScb9rNYESTFqLSOkIbJsQyWe6eXYOdD1wvAQTRsqvYDzWQB94A4uTnyPLVYiLGyK4oy6hhnh+rPIQcgPlOXF7W7KHmjpbXSXrdm/8eMJqBWkCtgkAgoj2wjdRekr8Qw1jdGx7kC1knmrKplZy39uHFHxedljGma/YhkJTQuWSt97FBBlNpq3XZI0wWzhx98kf7bLKgE0F2DGVCke1MZrEjFbKw6vyXn810gmUrZLtKFRJIByOF8FX5+2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7258.namprd11.prod.outlook.com (2603:10b6:208:43d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 20:59:37 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 20:59:37 +0000
Date: Wed, 1 Oct 2025 15:59:35 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 11/23] drm/xe/pmu: Initialize PMU event types based on
 first available GT
Message-ID: <5w4gyh7525xtighcfuxr6quzfydfot3iadbkkaach7hgcee53q@oo2l4yzjvyub>
References: <20250930225618.140071-25-matthew.d.roper@intel.com>
 <20250930225618.140071-36-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250930225618.140071-36-matthew.d.roper@intel.com>
X-ClientProxiedBy: BYAPR11CA0091.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7258:EE_
X-MS-Office365-Filtering-Correlation-Id: e3d7e472-ac86-440e-a4aa-08de012d6e67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?w72UVDjCGhRrmHUakttBY8Z9KfkTW0BP2Y0ioFyqhi+3tonNs973jiLy0suV?=
 =?us-ascii?Q?shF463kyFmJFFkR0e/WVmjCpEaZf0BWJVarAmQPKlOQazTM++NvfhdYzfrqI?=
 =?us-ascii?Q?ub6WIUwHuTa6sBPHXmym3Bz2P0+JNLCqRCZFt9LNUP5cTbOtV+GqjDUm9f6A?=
 =?us-ascii?Q?rJjKfVtQTz2yaBmvNBCe1JtjcXRURxvd5EekEcGRKhX0fNscEJyFP6pqjedL?=
 =?us-ascii?Q?ZuIdQm7K3k5OeGH2uTpOgvejgKpnLRc3aCW1xYr4nYHAUlJCOrLD5dy9RaKa?=
 =?us-ascii?Q?G/XVnrD3UW3DfPOr/TIh64l38CKeltC8YZIyWmCObNtdgmY7sFwylust2t40?=
 =?us-ascii?Q?a+IRKG6I5tE8nWzsZmsFlUs/PGYLZsBs5xDYo1JsRoGF+2dfKtacYtcsEgO1?=
 =?us-ascii?Q?AmA/b93k7+kPMmcXWxIJG1cF8pDK9UD127KFisd+sZb43XpOTdusKVCpribe?=
 =?us-ascii?Q?q1g1GZBRW4/W7SAA6ujyqU2lNkiNQ4Rgp2MCIUWdNtGt15lt8KnAyhEfcluq?=
 =?us-ascii?Q?25LyhJ3LeEI1u3zxob08CxmQx1+q28QzMjXWrhZ5tGszHl2vrUMVYGtCvKGu?=
 =?us-ascii?Q?YTNpv+hWh7VdgsyKQooWEXM9IZxcc0BAb4G3b7jw/+2wCNgi/ft+taJCf+0b?=
 =?us-ascii?Q?QzRQVdkaWS7sv/DC4aXI3LhacLSd+5XPQ2e0zIxVQ+q9nhjjS5HAbiMX2PqZ?=
 =?us-ascii?Q?ld5yBecs0U0fnC8GSFk5F1WiFu8AjpbtRqQXTmgbNktAnkaFxuJmXZt7prOA?=
 =?us-ascii?Q?uuTFifmOTVJWEKWnEt+SAimdLIM7gmRRBT+woasgSbA23OCjRTZAOwO4gNQA?=
 =?us-ascii?Q?UU9felYKtgLB4b3E2FMwu1LAhdiiUWumRl70vlB5wPeWoA2HyFYqlCuOpiGm?=
 =?us-ascii?Q?7Autk4f/IcrGLbAD376FdlC8JvXhLUOVJAscy1eh3AU1VFFyEfwWbIRIP14u?=
 =?us-ascii?Q?JXbuSaCwn0nNPSdGrE2KQzUwCDxVvF4gUuv2ZN5XJnqlP0tfYbLfwb8cBJhG?=
 =?us-ascii?Q?zlfy6lku+mrB0Sx5EK5FvO/T11LBy/IobtBzl5wHx+O+RJytqknbOF+9bu6p?=
 =?us-ascii?Q?YK+fdvCpCaBGjXB21Hnf9qYi1lIQNc+vhHpCq4Tf7FSeqZ+pQLzgEOoABONF?=
 =?us-ascii?Q?d+HSshTvL69fuSCFNYd7eZYiQv3g4k0Mp+1r3U8uiehb+YYDs5UEJ3E0UmLd?=
 =?us-ascii?Q?16U8XBC9CXjS3zY/aIpD+asDStdP4crPEJyrC6SfWuvbDjx2V+FmQko0Ug7g?=
 =?us-ascii?Q?ToCP4D1Na0qHEL/lThzQhgv7q9dASI322yaCwtfr0lAXkFun0WuxDJXNjoaN?=
 =?us-ascii?Q?0h6Ji1a4gLcAtwiAjfHVguGGIA5tWFYF0CaEJfuhbXuSCDndwhAFuxKpdDAE?=
 =?us-ascii?Q?lbrlvuJMwe8K9wZwC6JjZNFZ9l+OFWpSTNw1gckj53gENKrL9oZyL3ypA7NR?=
 =?us-ascii?Q?1ts654E4MP9ONuCZ2EecLgswPsSM8/S0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Qe6viptuHH1uckcj+RlbHOYP2E+/cEmLyhkiZZDwIrHZZ2CwvfeQVnqsVI0P?=
 =?us-ascii?Q?krbAe2TZo3odXXawU1HX3z2flEJI2wY/uthZNplWcyEKFtKHr9XIQiOVe075?=
 =?us-ascii?Q?VfWP0++Nf7tYshUAFonwB4PFwxCKrIS9l2sZ/WH2IicA5MtHNLf8m8XlzLCY?=
 =?us-ascii?Q?VAlLQNNGCALsHywNPunVutc6FskUY95OCxAX9Aa6uyfnupdbBtZsF2AamrvT?=
 =?us-ascii?Q?kCGxnT3Fihbnn58FN7vjQeJRgGzSZ4FNMKIcgIAOgcAp2T9r0yNA4qe0gSGK?=
 =?us-ascii?Q?WY/3TorrIQPPh1rO6w8xBKwNqxryWM9rao1PVoAZ0ij8bWOhGZu5GYo7sIUC?=
 =?us-ascii?Q?GSHrZddwU578isLwCYwnCftY0Khd/Q9sMFEfBDupf8QqUQzOTbNHO8uYKfxC?=
 =?us-ascii?Q?O4j5VTEwGsHZmKRYfAWDMc/i7vGozPi8bIJbt8ykyodpisccZYVZg8aaUxJN?=
 =?us-ascii?Q?t0YUw5l0pDWKTrDX3h5QCuIjIC2yaMxiXGKUi5T6RRulEoVqmzC/rXfalwNa?=
 =?us-ascii?Q?niAI7Hp2oXDypslnlrhedJm8Klg0B/oICBSna6NvpXHehzs0dtoMBsBqo0I5?=
 =?us-ascii?Q?D7LrkhxmAOgSxf29WCY9zgUIVW4bQVzu0p8POC6/J9IAHmDSqVCPlMlFZHtJ?=
 =?us-ascii?Q?cppZ6D6dN+mkWCwyKGsqACpK29WOjg1Grb7QfAjqkO4Q3slUOBnTUq6CgOhr?=
 =?us-ascii?Q?0yppDoi/2t5JVc0fixPm3x3kQivtP+74y3BpUvglQFUwQCuyJP385HVvwLcx?=
 =?us-ascii?Q?QcMkWUdDiawCIwlaMabUeMtUMu74d9mCJmaSLAPCh1hUm7j7R5mdnuE5WlXw?=
 =?us-ascii?Q?1tSYC6WAR6tKOSwhIgLHIvZ2p7hPz6XRDBv1wDG80+DBkxjaUino+A/NJ9+s?=
 =?us-ascii?Q?g0jtR+8hyIRVztOrG4wy3LDtzRvZqpH7j3gl7D9bDT87btWJk5hmi6B3kT5O?=
 =?us-ascii?Q?MNjg5BFOVbEFNsQD87mXfWZmlN8UgNIG1azOU7jntvN3lIKAitVEZ4CEmh20?=
 =?us-ascii?Q?zcRaOk299lwTYOROpseq/KrywElJIo3wWtG6mEFLGaOBxVmneKTIjLZi3KPm?=
 =?us-ascii?Q?inZx9AmSQBtjAqyrSfdD3OTjp3fI+v7P7dBOT5Ge9n8vfJsrXpC4kY4ZFyUv?=
 =?us-ascii?Q?hPVG3GlJnaMYqbg6eghs3Q6trg20Gabnb4UB0IVnTEz8f6Owz+s7yt72+MFR?=
 =?us-ascii?Q?wRakwExae1u3nGQTU11Ff/02m1lpOJuUQVGEXrJPsYf2cVOtq9q4OjF9xLGa?=
 =?us-ascii?Q?ccQh6IfXE71UvIbnrAIlMCLImPAoY1WQXRt/GxULeA2hSUfpkmORVcWPA/XE?=
 =?us-ascii?Q?/WK+ZbA9mrBQc1No1CSOznd7/ZvsSYnL9EMN+HKYa+0TUhF9Kk0Snyc9fgW8?=
 =?us-ascii?Q?Hbx/fAk2MoQ/m1fTrROMm2fcQb52QHY1BPw2JKfuxV3aGFfUT5fioQtfi24b?=
 =?us-ascii?Q?cwbG3YWdxQGFm9wK8MUeBc77+AddXH8i43jinO/2TR016XS+poyzQsOHDoGt?=
 =?us-ascii?Q?s1bZwAim8LZSRsTEcytYTkvMOPyOWQDyCqWOeb15lnlFwVjIzvDWLrkJ8pBv?=
 =?us-ascii?Q?uVLh7w9qzxR25JsO4wN/LmU0GjsjBXrR89na9nCcsI64pJF6GJfKIEHLpNwK?=
 =?us-ascii?Q?fA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3d7e472-ac86-440e-a4aa-08de012d6e67
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 20:59:37.2608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CAjccyZBOuxFW+D75GgaxqV6Pe8Ls7AjxWwN4QPxqj30BVghFpFpYclt5/yYYCMMroseeZxJe+eA4PsQkV6H3wuS0ztzH6jBYr3vcO2siIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7258
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

On Tue, Sep 30, 2025 at 03:56:28PM -0700, Matt Roper wrote:
>GT ID#0 (primary GT on tile 0) may not always be available if the
>primary GT has been disabled via configfs.  Instead use the first
>available GT when determining which PMU events are supported.  If there
>are no GTs, then don't advertise any GT-related events.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_pmu.c | 11 ++++++++++-
> 1 file changed, 10 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>index cab51d826345..c63335eb69e5 100644
>--- a/drivers/gpu/drm/xe/xe_pmu.c
>+++ b/drivers/gpu/drm/xe/xe_pmu.c
>@@ -497,7 +497,12 @@ static const struct attribute_group *pmu_events_attr_update[] = {
> static void set_supported_events(struct xe_pmu *pmu)
> {
> 	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>-	struct xe_gt *gt = xe_device_get_gt(xe, 0);
>+	struct xe_gt *gt;
>+	int id;
>+
>+	/* If there are no GTs, don't support any GT-related events */
>+	if (xe->info.gt_count == 0)
>+		return;
>
> 	if (!xe->info.skip_guc_pc) {
> 		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_C6_RESIDENCY);
>@@ -505,6 +510,10 @@ static void set_supported_events(struct xe_pmu *pmu)
> 		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_REQUESTED_FREQUENCY);
> 	}
>
>+	/* Find the first available GT to query engine event capabilities */
>+	for_each_gt(gt, xe, id)
>+		break;
>+
> 	if (xe_guc_engine_activity_supported(&gt->uc.guc)) {
> 		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
> 		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_ENGINE_TOTAL_TICKS);
>-- 
>2.51.0
>
