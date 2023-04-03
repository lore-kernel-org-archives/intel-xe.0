Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 772A8C76196
	for <intel-xe@archiver.kernel.org>; Mon,  3 Apr 2023 04:33:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33B4210E121;
	Mon,  3 Apr 2023 04:33:19 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED1210E121
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Apr 2023 04:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680496396; x=1712032396;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=FaISwfXnswUlZtXCpw7MHWCCCYlk6HRS4DO4O8kNGHE=;
 b=YGke76TIQsgW5qbiY5msaH7tMG3HVHcPuyto2BqGawyiXHriHmQ22lDp
 D47OUE7dT6D5qscdxTFEIYYdNsQl1E1pC6fYnnLShKbSz0gkJMJ6xrhoT
 HEcOrIqdq2+zaPKRIoHICFW1t18Y1dsRpdaQuohBUXarXqBfaoD5ECoim
 Co9Nk+EKP9AQ4ohWq/TszRJHqurfvahctE5nHiFbZ7xiGsZGW6jPOV06n
 V5LUpdnnWQegzem4dUJV/6iYOydGJwSLdiomS4IE2h2HTCYAXwlKmPKa6
 +cMhrASnS35f7kJX/rfjc9/fnFjZcDbs735LUI9Gf6MUMplYt9/KMTMMp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="369612230"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="369612230"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2023 21:33:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="829417754"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="829417754"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 02 Apr 2023 21:33:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sun, 2 Apr 2023 21:33:15 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Sun, 2 Apr 2023 21:33:15 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Sun, 2 Apr 2023 21:33:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gMK4dNRZm9dhZTw+E4IVsPI6kb0dkz/Eo2IPNZ08cZddzXXi3lnmwXplgJvfEbhN6cNUZRO1OqASRgNozbKDRP6ucGVNsIQAWvWwe8dPuxyQtf22Rf+SBvoWFkZt+32hVc7ahPwRc9+mx+8B90KOOtlHa1a4u0uptPwmTpsoaratPBM765jq90uN2SSDo06fGEwkEcDvZZMRcEd4hnK4u9hVgEcb69PnlyASL/CYNWPXE1eN/r1+RyiY1mRXKnpJdBaz8tpvB3ah33ky/m8u2SCaRl1k98NMWiIIH4I6kbg311z122jCbGmEq2pqMU/6S/b9UTgqH2fKaht4NajfAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dAVVhII8YTga9+c9Babd3ckv4tr5VlNvGA1Z/dXGlG4=;
 b=niUTjNeAMqc/U//gXSJ5aAbZMj4SClo6xGzeYh8TaeHj5w0zz/e3oo54FHgA+9evwExus3GG2mNaU78pdC8OldLgeNQJDrXGutaSzziEMFC4zlYGspYq3rvlb4tNvIsHCGNDy4rx+RPu7PkPGe6cHFVjsk8lbtLoaGbeeW7qRchc98ETo1/r63pUa9FXcbS+8hFaZvx2yT3tbqnJwd8JAxJZvpVlafxNr8NVp8RAfUwlrVZNcKtDDjwpWflFj6SRz/TXV5x4/hRrN42QlBlnvxEBkQM8oj9LJtCH0b6+H2SNQ3lreYYyrrsJu+IZ+6l9WwGGig/mjlMNCLhbe/u4vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7938.namprd11.prod.outlook.com (2603:10b6:610:12f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.28; Mon, 3 Apr
 2023 04:33:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%8]) with mapi id 15.20.6254.028; Mon, 3 Apr 2023
 04:33:12 +0000
Date: Mon, 3 Apr 2023 04:33:08 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <ZCpXBAxBZ4aeMbZ2@DUT025-TGLU.fm.intel.com>
References: <20230402070930.2994410-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230402070930.2994410-1-matthew.brost@intel.com>
X-ClientProxiedBy: BY3PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:a03:254::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7938:EE_
X-MS-Office365-Filtering-Correlation-Id: cb08637f-4666-41a6-c568-08db33fc88bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1GVCBh48vhi1UaNZ4F/9ke3tKunMI6QS9oQpXW2QfF1Z8yAlT2tN/TrrbGoIum6IocNu9RnZaxA/NIGUeP56B3pSz7JLGFYVMlxpFfOwZi7F3EPnrUbYVHyR3FfxkUeRHI1Khi/qIW9Ba58WhLik7RnkexHB0BDBK23acM4szHhCgaOJWgzrUwN+mi8qK7jKdBHFbLvGdnfpvo4QTxrF1BxK4ZDzD/B/OskbTkoGc/4K0zPeFlLUbxGviDTXkvtMWbuR+Fv7ySAcKCWScxQjlLerayHv5zaRlr1UOZ4hUthex21d8GQQX2ATUWI0iAt96wmu90SlmCCfock3TGO+JssbPTRvyrHH3Sp5BDgMCidthLaHLaB3poMRB/HBKa4fS/FhVK1wWYt92Irub8maemcBqbBqq8eVc48c1zoGtehnrEHm6Z6aD71E/LhwhcZHASSDKE3afYXuIdmFZIuwPFn0tfGhlKocBehwg6IoncP24lAxBCV8ULtGZJwIMf9HbnWH1L4dv1GsXUbmSCT4Ysijn5GCBFkUSKZDpLqdkm4zF2UuxG7EKxsw/Yyz8nHc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(136003)(376002)(39860400002)(396003)(451199021)(6916009)(6666004)(6486002)(966005)(316002)(8676002)(66476007)(66946007)(66556008)(6512007)(26005)(38100700002)(186003)(83380400001)(6506007)(41300700001)(5660300002)(478600001)(8936002)(86362001)(2906002)(82960400001)(44832011)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iyQn3qEHccSIVI712/GDJKZnJDYuIRCiZIKWMbYaMFjm6h9iFdMjj14xU3YJ?=
 =?us-ascii?Q?3saNuxt12mTQkRd4ddJE7zZVgjIrzqwRx73yKd8YjNqKsXO5i6TsbdQcMZ05?=
 =?us-ascii?Q?Mk7JGzXyqcf1lsHlmV55Bnc71QFwmf3DRCyG3tWhL8kqG3sw0WCPW6lzeD+k?=
 =?us-ascii?Q?XOnqyILr4cdw5QCus9cFYkhZTJn1SpC/s6Blv7FyiBA9wqWLIHPPC8Ryt1/a?=
 =?us-ascii?Q?yZ/5gwjBCvGFWyZO00CS9JFxffYfIpE6ebOx65Ji3Pr66ELHZsKAGLaDzn84?=
 =?us-ascii?Q?q6QxrEIt5w3HA8r2pSHy3mWULWBSzZqAcqCvtWvNxj3zVeDnQswu6Ur9h3F9?=
 =?us-ascii?Q?2QG0Z5l0yRlzy8wREYdoQO6CCggqbGath0wxB7G3lAiKnaYuV1sC3dRCNsJG?=
 =?us-ascii?Q?w9mQvvZsmun0uo3+hKnxVY7n9vIL2hvziJkNlSnqHvrlXRDbi8jsNlLlz0oN?=
 =?us-ascii?Q?uxmuzYOv0YVZSZ90oG9dDK7uBxVMxO6pgiLTptNHksOTCvSESaizjSRZusff?=
 =?us-ascii?Q?gnwZCf3xVQK0EmFCzEOkiN9Jt2vFcbaQDkEAygLR2p/wU4y6Kpk0UNdIROh+?=
 =?us-ascii?Q?CHGFWt1LhBZPG8qs+Ud3lFQALzxSxamD1Tx/azvdG3wMXst46J/TtNQe7IyC?=
 =?us-ascii?Q?6zfjE0tZdhW8KsYGPlkLeAauQ4h05Li/Qq8C+7VbfdGoeoXhS0G3modGel/b?=
 =?us-ascii?Q?ZsGiSH2vbQ/eV4sYEFaAKNryOKB1kV9TWZubb2mV2JPqU2v5nh6dvSErcnju?=
 =?us-ascii?Q?AT4FhR+LRcYipTOYfIeoo966jTGRFdgqsQINf1XLy7NjOeOvm0U4bK+/Hb9j?=
 =?us-ascii?Q?svdrTgDLig0etyLzVEyGYoknFe1j07iVB1s06XLmzrGLzQ51P4DhabwPnyk+?=
 =?us-ascii?Q?2El+eQfN/2CrP7Ogm4TZOxpaC11/Z07tLdiJjplwOgwifk7iK5JACFGxLwrq?=
 =?us-ascii?Q?7ZJzI5gmSLSMUCLWUzw0HNogz3aQcRpoJwYcUQAhjFvgyUjjtvG2EMGjABWA?=
 =?us-ascii?Q?s3VXERP/acrgfnuC23+6dVnjJWmOkwMpbgqZv5SbrVebVezrgeNYVAmvOJ+O?=
 =?us-ascii?Q?LJVMw96StqpyQ/fLCRnoACQTr4zUO6W+4BxZ+b6EPP6at78IYJQ1fCQUw4qX?=
 =?us-ascii?Q?IKeuX/i23MCpSLlMVgOR5H/MT2XYH6eVATdshBZRMDNqzVrLJ/zWIPWa5poP?=
 =?us-ascii?Q?09JT5nRlywNnAkiBGbAcRej/31f6B/CriYKcYqCYhv9K9fIWBcsY+uu1EROG?=
 =?us-ascii?Q?T8HtiuW/D8ovbeq5ZiqaE0XmtH9EoNesENYFOMeevKEsCLx+cHilmNJvNVtL?=
 =?us-ascii?Q?b6ZaqTyekbNCExvjCCbuY9xj+95Zx92S2fiPE37IYO8Cm6I/7dudi3cpQmN3?=
 =?us-ascii?Q?DhAkWt1VDg0yinOusXJEwqRsPYRIbZldVqEQKjOVCsfuZbb2pop41ldEZp9+?=
 =?us-ascii?Q?Y4ln7LW0ARohJbr+6F5FSt25QStYnk5vklNzQ6S7Ohv8JSsWXIeuLVvuG4z4?=
 =?us-ascii?Q?CZuHt8F6YfIffjgD+mnuK28ia95CCAChA3nibjydx5YC6XQqaX+aD+/KIc3S?=
 =?us-ascii?Q?wHycJ4AZvmY5hA+4PezGo4RsxSzmqu05gxvpvY20kTMMeNifGjRw/z0Qie3G?=
 =?us-ascii?Q?/A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb08637f-4666-41a6-c568-08db33fc88bd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 04:33:12.3959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kHlgVkjvwXEMCOrSwxDb+6Jmc9bN9vYXvdq3Rft2V4WcN1eFwWItF4fvzy8Apf5WGjkpy7OvNDrX2Ng/GdlUwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7938
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix driver load with
 CONFIG_DRM_XE_LARGE_GUC_BUFFER
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

On Sun, Apr 02, 2023 at 12:09:30AM -0700, Matthew Brost wrote:
> While debugging [1] I noticed the GuC log was corrupt. I believe our
> logic to program the GuC log size was incorrect resulting driver load
> failures. Shameless copy from to fix this. A follow up will wire the GuC
> log sizes to modparams.
> 
> [1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/232
> 

Everyone ignore this patch, mistakenly thought this patch fixed something.

> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c           |  47 ++-------
>  drivers/gpu/drm/xe/xe_guc_log.c       | 145 +++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_guc_log.h       |   9 --
>  drivers/gpu/drm/xe/xe_guc_log_types.h |  20 ++++
>  4 files changed, 167 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 58b9841616e4..1694fdc3a7fa 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -69,54 +69,21 @@ static u32 guc_ctl_feature_flags(struct xe_guc *guc)
>  
>  static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
>  {
> +	struct xe_guc_log *log = &guc->log;
>  	u32 offset = guc_bo_ggtt_addr(guc, guc->log.bo) >> PAGE_SHIFT;
>  	u32 flags;
>  
> -	#if (((CRASH_BUFFER_SIZE) % SZ_1M) == 0)
> -	#define LOG_UNIT SZ_1M
> -	#define LOG_FLAG GUC_LOG_LOG_ALLOC_UNITS
> -	#else
> -	#define LOG_UNIT SZ_4K
> -	#define LOG_FLAG 0
> -	#endif
> -
> -	#if (((CAPTURE_BUFFER_SIZE) % SZ_1M) == 0)
> -	#define CAPTURE_UNIT SZ_1M
> -	#define CAPTURE_FLAG GUC_LOG_CAPTURE_ALLOC_UNITS
> -	#else
> -	#define CAPTURE_UNIT SZ_4K
> -	#define CAPTURE_FLAG 0
> -	#endif
> -
> -	BUILD_BUG_ON(!CRASH_BUFFER_SIZE);
> -	BUILD_BUG_ON(!IS_ALIGNED(CRASH_BUFFER_SIZE, LOG_UNIT));
> -	BUILD_BUG_ON(!DEBUG_BUFFER_SIZE);
> -	BUILD_BUG_ON(!IS_ALIGNED(DEBUG_BUFFER_SIZE, LOG_UNIT));
> -	BUILD_BUG_ON(!CAPTURE_BUFFER_SIZE);
> -	BUILD_BUG_ON(!IS_ALIGNED(CAPTURE_BUFFER_SIZE, CAPTURE_UNIT));
> -
> -	BUILD_BUG_ON((CRASH_BUFFER_SIZE / LOG_UNIT - 1) >
> -			(GUC_LOG_CRASH_MASK >> GUC_LOG_CRASH_SHIFT));
> -	BUILD_BUG_ON((DEBUG_BUFFER_SIZE / LOG_UNIT - 1) >
> -			(GUC_LOG_DEBUG_MASK >> GUC_LOG_DEBUG_SHIFT));
> -	BUILD_BUG_ON((CAPTURE_BUFFER_SIZE / CAPTURE_UNIT - 1) >
> -			(GUC_LOG_CAPTURE_MASK >> GUC_LOG_CAPTURE_SHIFT));
> +	XE_BUG_ON(!log->sizes_initialised);
>  
>  	flags = GUC_LOG_VALID |
>  		GUC_LOG_NOTIFY_ON_HALF_FULL |
> -		CAPTURE_FLAG |
> -		LOG_FLAG |
> -		((CRASH_BUFFER_SIZE / LOG_UNIT - 1) << GUC_LOG_CRASH_SHIFT) |
> -		((DEBUG_BUFFER_SIZE / LOG_UNIT - 1) << GUC_LOG_DEBUG_SHIFT) |
> -		((CAPTURE_BUFFER_SIZE / CAPTURE_UNIT - 1) <<
> -		 GUC_LOG_CAPTURE_SHIFT) |
> +		log->sizes[GUC_LOG_SECTIONS_DEBUG].flag |
> +		log->sizes[GUC_LOG_SECTIONS_CAPTURE].flag |
> +		(log->sizes[GUC_LOG_SECTIONS_CRASH].count << GUC_LOG_CRASH_SHIFT) |
> +		(log->sizes[GUC_LOG_SECTIONS_DEBUG].count << GUC_LOG_DEBUG_SHIFT) |
> +		(log->sizes[GUC_LOG_SECTIONS_CAPTURE].count << GUC_LOG_CAPTURE_SHIFT) |
>  		(offset << GUC_LOG_BUF_ADDR_SHIFT);
>  
> -	#undef LOG_UNIT
> -	#undef LOG_FLAG
> -	#undef CAPTURE_UNIT
> -	#undef CAPTURE_FLAG
> -
>  	return flags;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index 9a7b5d5906c1..f171b997b4cb 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -12,6 +12,16 @@
>  #include "xe_map.h"
>  #include "xe_module.h"
>  
> +#if IS_ENABLED(CONFIG_DRM_XE_LARGE_GUC_BUFFER)
> +#define CRASH_BUFFER_SIZE       SZ_1M
> +#define DEBUG_BUFFER_SIZE       SZ_8M
> +#define CAPTURE_BUFFER_SIZE     SZ_2M
> +#else
> +#define CRASH_BUFFER_SIZE	SZ_8K
> +#define DEBUG_BUFFER_SIZE	SZ_64K
> +#define CAPTURE_BUFFER_SIZE	SZ_16K
> +#endif
> +
>  static struct xe_gt *
>  log_to_gt(struct xe_guc_log *log)
>  {
> @@ -24,7 +34,130 @@ log_to_xe(struct xe_guc_log *log)
>  	return gt_to_xe(log_to_gt(log));
>  }
>  
> -static size_t guc_log_size(void)
> +struct guc_log_section {
> +	u32 max;
> +	u32 flag;
> +	u32 default_val;
> +	const char *name;
> +};
> +
> +static s32 scale_log_param(struct xe_guc_log *log,
> +			   const struct guc_log_section *section)
> +{
> +	/* XXX: Add modparams */
> +	return section->default_val;
> +}
> +
> +static void _guc_log_init_sizes(struct xe_guc_log *log)
> +{
> +	struct xe_device *xe = log_to_xe(log);
> +	static const struct guc_log_section sections[GUC_LOG_SECTIONS_LIMIT] = {
> +		{
> +			GUC_LOG_CRASH_MASK >> GUC_LOG_CRASH_SHIFT,
> +			GUC_LOG_LOG_ALLOC_UNITS,
> +			CRASH_BUFFER_SIZE,
> +			"crash dump"
> +		},
> +		{
> +			GUC_LOG_DEBUG_MASK >> GUC_LOG_DEBUG_SHIFT,
> +			GUC_LOG_LOG_ALLOC_UNITS,
> +			DEBUG_BUFFER_SIZE,
> +			"debug",
> +		},
> +		{
> +			GUC_LOG_CAPTURE_MASK >> GUC_LOG_CAPTURE_SHIFT,
> +			GUC_LOG_CAPTURE_ALLOC_UNITS,
> +			CAPTURE_BUFFER_SIZE,
> +			"capture",
> +		}
> +	};
> +	int i;
> +
> +	for (i = 0; i < GUC_LOG_SECTIONS_LIMIT; i++)
> +		log->sizes[i].bytes = scale_log_param(log, sections + i);
> +
> +	/* If debug size > 1MB then bump default crash size to keep the same units */
> +	if ((log->sizes[GUC_LOG_SECTIONS_DEBUG].bytes >= SZ_1M) &&
> +	    (CRASH_BUFFER_SIZE < SZ_1M))
> +		log->sizes[GUC_LOG_SECTIONS_CRASH].bytes = SZ_1M;
> +
> +	/* Prepare the GuC API structure fields: */
> +	for (i = 0; i < GUC_LOG_SECTIONS_LIMIT; i++) {
> +		/* Convert to correct units */
> +		if ((log->sizes[i].bytes % SZ_1M) == 0) {
> +			log->sizes[i].units = SZ_1M;
> +			log->sizes[i].flag = sections[i].flag;
> +		} else {
> +			log->sizes[i].units = SZ_4K;
> +			log->sizes[i].flag = 0;
> +		}
> +
> +		if (!IS_ALIGNED(log->sizes[i].bytes, log->sizes[i].units))
> +			drm_err(&xe->drm, "Mis-aligned GuC log %s size: 0x%X vs 0x%X!",
> +				sections[i].name, log->sizes[i].bytes,
> +				log->sizes[i].units);
> +		log->sizes[i].count = log->sizes[i].bytes / log->sizes[i].units;
> +
> +		if (!log->sizes[i].count) {
> +			drm_err(&xe->drm, "Zero GuC log %s size!",
> +				sections[i].name);
> +		} else {
> +			/* Size is +1 unit */
> +			log->sizes[i].count--;
> +		}
> +
> +		/* Clip to field size */
> +		if (log->sizes[i].count > sections[i].max) {
> +			drm_err(&xe->drm, "GuC log %s size too large: %d vs %d!",
> +				sections[i].name, log->sizes[i].count + 1,
> +				sections[i].max + 1);
> +			log->sizes[i].count = sections[i].max;
> +		}
> +	}
> +
> +	if (log->sizes[GUC_LOG_SECTIONS_CRASH].units !=
> +	    log->sizes[GUC_LOG_SECTIONS_DEBUG].units) {
> +		drm_err(&xe->drm, "Unit mis-match for GuC log crash and debug sections: %d vs %d!",
> +			log->sizes[GUC_LOG_SECTIONS_CRASH].units,
> +			log->sizes[GUC_LOG_SECTIONS_DEBUG].units);
> +		log->sizes[GUC_LOG_SECTIONS_CRASH].units =
> +			log->sizes[GUC_LOG_SECTIONS_DEBUG].units;
> +		log->sizes[GUC_LOG_SECTIONS_CRASH].count = 0;
> +	}
> +
> +	log->sizes_initialised = true;
> +}
> +
> +static void guc_log_init_sizes(struct xe_guc_log *log)
> +{
> +	if (log->sizes_initialised)
> +		return;
> +
> +	_guc_log_init_sizes(log);
> +}
> +
> +static u32 xe_guc_log_section_size_crash(struct xe_guc_log *log)
> +{
> +	guc_log_init_sizes(log);
> +
> +	return log->sizes[GUC_LOG_SECTIONS_CRASH].bytes;
> +}
> +
> +static u32 xe_guc_log_section_size_debug(struct xe_guc_log *log)
> +{
> +	guc_log_init_sizes(log);
> +
> +	return log->sizes[GUC_LOG_SECTIONS_DEBUG].bytes;
> +}
> +
> +u32 xe_guc_log_section_size_capture(struct xe_guc_log *log)
> +{
> +	guc_log_init_sizes(log);
> +
> +	return log->sizes[GUC_LOG_SECTIONS_CAPTURE].bytes;
> +}
> +
> +static size_t guc_log_size(struct xe_guc_log *log)
>  {
>  	/*
>  	 *  GuC Log buffer Layout
> @@ -45,8 +178,10 @@ static size_t guc_log_size(void)
>  	 *  |         Capture logs          |
>  	 *  +===============================+ + CAPTURE_SIZE
>  	 */
> -	return PAGE_SIZE + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE +
> -		CAPTURE_BUFFER_SIZE;
> +	return PAGE_SIZE +
> +		xe_guc_log_section_size_crash(log) +
> +		xe_guc_log_section_size_debug(log) +
> +		xe_guc_log_section_size_capture(log);
>  }
>  
>  void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
> @@ -91,14 +226,14 @@ int xe_guc_log_init(struct xe_guc_log *log)
>  	struct xe_bo *bo;
>  	int err;
>  
> -	bo = xe_bo_create_pin_map(xe, gt, NULL, guc_log_size(),
> +	bo = xe_bo_create_pin_map(xe, gt, NULL, guc_log_size(log),
>  				  ttm_bo_type_kernel,
>  				  XE_BO_CREATE_VRAM_IF_DGFX(gt) |
>  				  XE_BO_CREATE_GGTT_BIT);
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
>  
> -	xe_map_memset(xe, &bo->vmap, 0, 0, guc_log_size());
> +	xe_map_memset(xe, &bo->vmap, 0, 0, guc_log_size(log));
>  	log->bo = bo;
>  	log->level = xe_guc_log_level;
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
> index 2d25ab28b4b3..52dc264ca540 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.h
> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
> @@ -10,15 +10,6 @@
>  
>  struct drm_printer;
>  
> -#if IS_ENABLED(CONFIG_DRM_XE_LARGE_GUC_BUFFER)
> -#define CRASH_BUFFER_SIZE       SZ_1M
> -#define DEBUG_BUFFER_SIZE       SZ_8M
> -#define CAPTURE_BUFFER_SIZE     SZ_2M
> -#else
> -#define CRASH_BUFFER_SIZE	SZ_8K
> -#define DEBUG_BUFFER_SIZE	SZ_64K
> -#define CAPTURE_BUFFER_SIZE	SZ_16K
> -#endif
>  /*
>   * While we're using plain log level in i915, GuC controls are much more...
>   * "elaborate"? We have a couple of bits for verbosity, separate bit for actual
> diff --git a/drivers/gpu/drm/xe/xe_guc_log_types.h b/drivers/gpu/drm/xe/xe_guc_log_types.h
> index 125080d138a7..8807d7bc6ec9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_log_types.h
> @@ -10,6 +10,13 @@
>  
>  struct xe_bo;
>  
> +enum {
> +	GUC_LOG_SECTIONS_CRASH,
> +	GUC_LOG_SECTIONS_DEBUG,
> +	GUC_LOG_SECTIONS_CAPTURE,
> +	GUC_LOG_SECTIONS_LIMIT
> +};
> +
>  /**
>   * struct xe_guc_log - GuC log
>   */
> @@ -18,6 +25,19 @@ struct xe_guc_log {
>  	u32 level;
>  	/** @bo: XE BO for GuC log */
>  	struct xe_bo *bo;
> +	/** @sizes: Allocation settings */
> +	struct {
> +		/** @bytes: Size in bytes */
> +		s32 bytes;
> +		/** @units: GuC API units - 1MB or 4KB */
> +		s32 units;
> +		/** @count: Number of API units */
> +		s32 count;
> +		/** @flag: GuC API units flag */
> +		u32 flag;
> +	} sizes[GUC_LOG_SECTIONS_LIMIT];
> +	/** @sizes_initialised: sizes of log initialized */
> +	bool sizes_initialised;
>  };
>  
>  #endif
> -- 
> 2.34.1
> 
