Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A3BC77B7D
	for <intel-xe@archiver.kernel.org>; Thu, 18 May 2023 22:41:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 034E010E56E;
	Thu, 18 May 2023 22:41:07 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04FC010E56E
 for <intel-xe@lists.freedesktop.org>; Thu, 18 May 2023 22:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684449666; x=1715985666;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mbgr+e2cKo8JEjg1N5QKewc7rx1Lppa0DSSfGlWVQ3w=;
 b=A6dK1XF7IRUwPF846zZs0zRF31rf3c4ZUcL5PsoiNQ7NaMdJ+ixwPeUg
 0TXc/KtJiav7w4KmC/3yuQYcWSJl8WovabgABp8GFWPFgJSe6ABgSmllS
 R/pda/EFyacod+YsK7ipf+v6CufZndAZlzu6lgMbJAvFJ16FCft1hUBnx
 +qumBW14WAs7e5FIw9rsKcYvdmK5k8+7wXeWr9hlX7sL5e++VmWl1X7o0
 39ccu6OJAaqs0QhJEaipq+1FqqH8Nb6hstXAtKJWg9fNd5iQP3B42d48u
 Vi0hDBsGOWSbace0Oq8NHBM5n+Ld8fnYaIBB/q0C+eN5Qgu9s0+CQyDno g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="336799847"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="336799847"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 15:41:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="702292928"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="702292928"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 18 May 2023 15:41:05 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 15:41:04 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 18 May 2023 15:41:04 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 18 May 2023 15:41:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GRmZEsZncRq0aNrQvIdv0yR/WwPTi2InOusTkQGAXwf3cXLkojAyh57ZBTh/no+ks6hU/+Do1jimhBGg6P2BZS1CAgoiup8xeJ1vfZIkt3/oukn5L8ZzSDeutRugXDfMl+vVrsu6m+dWCGljC35HwsDFqUWHse9I+efU2P9pfznt2uwOnxhrrB8No3WitDuq4Zqp56EN8ROHtPfYP0jJcmSUkbL+JS/ISHlnmByYCdePXQpIsFcIhrPvfXgi3XLj2E8y1+LNbjuS69U72kJc1le3qqYIrOaSFwWOhrVjdVh79ZGpNZW+6lQxNk7unAS0GSqMq4ARsjJLjXs2yZvIww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSpbcB4xgF8VmHk/OLZW/qZl+hh2tg/KzXw8c0Z9kuM=;
 b=PWKKUZTASbxKRE7+rZhBFk8/edBvrbnP0rZ3mq5ZWog2BktQjRfFX1OrwGqJe+xzeE6VbS+Ms5yhuDCKpIXgI6E2ri1l8wHxm0VOOACKvuiUGEf/zcQwPx07w2/NGB4hRdYClhPrlxSboTJ1y0LAweHo1kXlgrLhdh+5UIA7ooPL2YyM9NPJN925iz5ao32OwypSHHSzkqdVTa2WlDS5udxtAr8NH7m80NRbCb9zGbptZPngkHkAmNdFxXM2fgahIfcrwgl5diCSjGz+o1Doj85kMrrlhTBpGmGXQwK1YfcKBczfrEYnn6lsB0RReenJV7QIaa8p3r8LvFOmZIlq1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA1PR11MB5801.namprd11.prod.outlook.com (2603:10b6:806:23d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Thu, 18 May
 2023 22:41:03 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%7]) with mapi id 15.20.6411.019; Thu, 18 May 2023
 22:41:03 +0000
Date: Thu, 18 May 2023 15:40:59 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230518224059.GY6250@mdroper-desk1.amr.corp.intel.com>
References: <20230518212446.3570168-1-lucas.demarchi@intel.com>
 <20230518212446.3570168-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230518212446.3570168-4-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR11CA0078.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::19) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA1PR11MB5801:EE_
X-MS-Office365-Filtering-Correlation-Id: 868b1ea5-53f7-4fde-1ea1-08db57f0f58a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jX+C49tj8QaVK6UqKmLGGDLhudhUAXA8gc1VOtwOoYm6/KG6RRvxZ55ivpNphedbYtpGY4JLp+Gi3v9AzUmfSNPQFQAV5IAjWNDMB+Jfi1RMjptkRJd5WMNVEL4whjLYg9H8vfehFiFwfioBTpWRdKABjtluI97d534aS7Ht9U4LfJB3yM7TnCPzFhE8xz26nMGO14BWO5AymK3+zXMRcsQFxf7FLkLSXklgZbw47GIg30Nwf2fBiyaykrCAzrWgmIPonGq1PPbOaqZclBBhb3iwuOj77riPIgj3g5XLIyVhTo8VGQGe4g+yFj9N9sRb6SfYHFdJFzpT3kLqlr6hJh4IKhXr/8H+SuZOJIbRxm7p+K2G30KPwIGsM1EB+dCUHFQumozN+HL5elbjUwllr500nejXVG+OQa3HeuIHuXBJ2bel9jikC0kNoGBe9Ln6ZBWYYX8jmtGZsHsiZ1AMAO9RLLoYoK1vkVtvOu77nkUEYWkBkx5zTTJwSgUiTVgyj5TTfJayX4l26BNIeeFOB9wW14/9qWoPjQkoPNW4FyfXG6Ao6FM0Vn1kIz4LHOQR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(366004)(346002)(39860400002)(376002)(396003)(451199021)(33656002)(316002)(6512007)(2906002)(66946007)(6506007)(86362001)(66556008)(186003)(66476007)(26005)(1076003)(6636002)(5660300002)(4326008)(8936002)(66899021)(8676002)(6862004)(6666004)(6486002)(82960400001)(478600001)(38100700002)(83380400001)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w3/SG+ONZpt0EAZzqIeCkqbfKQC+9TXNpguZaHihjIyl621uxsjUgzp76HFc?=
 =?us-ascii?Q?NMuojTeZIBoPyFq7HNriDnz98Z5za2xyKfOr++Sc5/4wYktfg0s6TX+bI+b3?=
 =?us-ascii?Q?QHySnE044Vj38LYEOVviJ2HXeLfTdyhOP2441/0pImpN8e2QsEKOHHC5+CF1?=
 =?us-ascii?Q?lPetqFMaoSToGQsoLMnMlqgSbj79a60fgvNP8/Dyb0W534NLG2PgqzK+00aS?=
 =?us-ascii?Q?rpzupq3G6y391Gj0bjbt6vkQL8wxOKqk5mWPdRGHh1q5ehRNNw4Pc1L8EVvM?=
 =?us-ascii?Q?63ZlD5HuFIOKR88GD9+ltFEA0YnCdqXr51nW3dG/Gp1LlpGOkxWsyYYQdxlJ?=
 =?us-ascii?Q?VnMiafsGKE2Jn89ZQEY4hmS/zLDCRmWfc6keVDTVwObRViwW8MQhjnEJMRR1?=
 =?us-ascii?Q?UQIGaMl6iQBOZ76aEjM2HbH4ZWLWJ2oiTpBUvZyXYGpBk1jmtdk+4s5kFzPr?=
 =?us-ascii?Q?exFzGQoVZXlkIesTymONNhJgcRI/1HxJcaXqnYgRJ6jDX5aFT8PPu2i3M2lD?=
 =?us-ascii?Q?rL0PmYKRFy0eMeigR0ZjqqUatrVmCMHJ6MOV4tADIC9nR908pWQHYylba9EQ?=
 =?us-ascii?Q?kVvDDc9uCqVT0IyAbApJniSSr7uTKJHEIdM1udGruHpYSoPiXF/Njcq15c5T?=
 =?us-ascii?Q?AV9lDOoFaYnr1Pdms7pWpQ2KjLnWUkhETSRljgTCxzr0Rw3EKTqgEdBQYUr6?=
 =?us-ascii?Q?tJb/hCVGk+BEGn8HEf7keFAvODUu9XWkMHT23cV/cWvRiFDwpjGPqdDKvGRQ?=
 =?us-ascii?Q?TJsPpM/yte+PyD8El1HViOW/RU6khffJGeTzHAVG1uMo95Exzv/q+mHMf/OL?=
 =?us-ascii?Q?2lHFp3PvdqdqJARftE0dQQnlpy1T3BPjRcIMNTnnya6xRXpJczfh5uUBD7yQ?=
 =?us-ascii?Q?VaRw1BZ9IqCiyCxdNaAHFk3zQh0vDJmGuXLQRq7Y4cHKREzFfeRFuDEpWZg4?=
 =?us-ascii?Q?9lLtxvgKgC3qHrH8kHANzMjd/081TJfn13qJPvQdgyWOrx+HG7sAE2yiDcC0?=
 =?us-ascii?Q?WyyUZUcI2JieNFdWJbwzpbU4MAwSeVrWDGIQpV59N9x8Hs8Osx9hlLGyXlvx?=
 =?us-ascii?Q?CQ9PzBe0vW/eYM7fkXyyexzcN2VPOluFmbX8Ac9w5FiD6IFAEBxPu1pQ2Myb?=
 =?us-ascii?Q?J2CW4iZQIrtAB1poOUBDegJZGHO6Em+A9FnbSr2Ecpm8lRDT9QgoCzPjcD7+?=
 =?us-ascii?Q?iyDYcR+eBVl1zOJgQDIP5kNSGmxxyfDRDk+vTJ4hvGZ7w2kK8mVsUFTUylHY?=
 =?us-ascii?Q?BhGTR+mHA1QSY227TY089uCmLHWalolUpwHCG6mVCCJf8oa1CAr9X5EWsMSD?=
 =?us-ascii?Q?Y32/Cef7qvkJxnV+nolW5jl0YSdfE8C4LMbFl8B+35p/XpL4E9F194J/z/tG?=
 =?us-ascii?Q?/6AyBr4fb4UIwLfH+GY3l3Y2uzchtpmnTwL4m7Jbv2sdjn3YZze5C9NI65h9?=
 =?us-ascii?Q?+rouaPv0tEuTerNqqj6KazUsA1lcwvvAuidUgOsbg++WWUOHhOTPNayCO1oL?=
 =?us-ascii?Q?weANnHNuxE8NwJ/23N0q3Xz8+MZxmtyLVAZyVC7/uF9anwklo5e7W9G/Vb+q?=
 =?us-ascii?Q?/Ay97RX+gQSKgyNIcYI+gNnejGvrkUqWHLRb7r+cUeQByBRKw7HhvDJHxi0w?=
 =?us-ascii?Q?9g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 868b1ea5-53f7-4fde-1ea1-08db57f0f58a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 22:41:02.8950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZsFs023Picko+8xMJ1dwkFK2ElcF1fAawAHi9Ks4srTBeZDKEC/GgOcUzLDZfJAlnuJH1z2iDfcCDxhYPJ4gZqGaGWj+LGzozVtscQM3ptg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5801
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] fixup! drm/xe: Introduce
 xe_reg/xe_reg_mcr
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

On Thu, May 18, 2023 at 02:24:46PM -0700, Lucas De Marchi wrote:
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_reg_defs.h | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> index 4554362ff4d9..557a1cd65531 100644
> --- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> @@ -27,7 +27,7 @@ struct xe_reg {
>  			 */
>  			u32 masked:1;
>  			/**
> -			 * @__mcr: register is multicast/replicated in the
> +			 * @mcr: register is multicast/replicated in the
>  			 * hardware and needs special handling. Any register
>  			 * with this set should also use a type of xe_reg_mcr_t.
>  			 * It's only here so the few places that deal with MCR
> @@ -42,12 +42,14 @@ struct xe_reg {
>  };
>  
>  /**
> - * xe_reg_mcr_t - MCR register is the same as a regular register, but uses
> - * another type since the internal API used for accessing them is different:
> - * it's never correct to use regular MMIO access.
> + * struct xe_reg_mcr - MCR register definition
> + *
> + * MCR register is the same as a regular register, but uses another type since
> + * the internal API used for accessing them is different: it's never correct to
> + * use regular MMIO access.
>   */
>  struct xe_reg_mcr {
> -	/** reg: The register */
> +	/** @__reg: The register */
>  	struct xe_reg __reg;
>  };
>  
> @@ -76,7 +78,7 @@ struct xe_reg_mcr {
>  
>  /**
>   * XE_REG - Create a struct xe_reg from offset and additional flags
> - * @r: Register offset
> + * @r_: Register offset
>   * @...: Additional options like access mode. See struct xe_reg for available
>   *       options.
>   */
> @@ -84,7 +86,7 @@ struct xe_reg_mcr {
>  
>  /**
>   * XE_REG_MCR - Create a struct xe_reg_mcr from offset and additional flags
> - * @r: Register offset
> + * @r_: Register offset
>   * @...: Additional options like access mode. See struct xe_reg for available
>   *       options.
>   */
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
