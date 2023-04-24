Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E23C77B61
	for <intel-xe@archiver.kernel.org>; Mon, 24 Apr 2023 21:21:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38D5710E07D;
	Mon, 24 Apr 2023 21:21:03 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A985B10E07D
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Apr 2023 21:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682371261; x=1713907261;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+oaZ+Y0PpL7oVomf4WG1hedGOVkIgUts69WvPMaOAnQ=;
 b=j9dHzbPJ1c5kDo38hXKNltUKgsBuYU6mW0LS4BPaVjmvzEdLXkhDuOht
 BVgAoPAUzJ8dmtIQWOYcjeIMSsQZ3Q/AXdzt9KY8yM3RgpWSGjKms3H2G
 k9FfHzfAGmQgHGu0m5FddaPwcHOn6qLkKOPNfbWmC0KTuOZOKNbADi/Xe
 6Z8idtlDjsvnVXKTmO4GWzNxc6agveS1pJqslUloIXzKAlyh/ogy6+GrP
 dF1Dwka58vE1hIqm9KMVKsR+3yPy4hbvfgSaIDAXcTjGX3ztSk3OjK1j0
 47HrOTflhFUXCyLktWz9GmrTQPrYcCfLiMxMDoUAgjmjWRDG5t/7gGk60 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="335459412"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="335459412"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 14:21:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="762594044"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="762594044"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 24 Apr 2023 14:21:00 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 24 Apr 2023 14:21:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 24 Apr 2023 14:20:59 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 24 Apr 2023 14:20:59 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 24 Apr 2023 14:20:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EsiitICoBPnV3PAZdD015+872drax2ABfudrzW4+2GkOn72XI3zLfFYRjyXYFZcnc2TM8W3eEsCOa2nAamrdlzUhjbppMFUVuwEamehpFEi6URS/jMmPs5CwWxmO+jsqyUEGf1jrA4odq3QHzWcXiZPgyUemF93SBBh8T11pOIXyUO/IWRv8yd2wILdAjcBt5TgF12TnQF4Sxy+Duq6vq5pQGxNeu5uhwn+VYMVgjXf4t4bMozOiQKpwxmDi/bSx3pq8iVF3a1tL0V/7dRbcEpxCiQgtPSjAmHtzTUz7tKcQ9kubV9Vynq+xGjclPHR/WjXTm1lDhkyrkHCEOYe6tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2f62P0QaJhgUwyvE9607h4LFxDGv3PQhUL7g4GoK17E=;
 b=VwGFbATvuM7n+GtLFVOPX34GoRycuHFekRV6qFDTrE2ekotH3iYrfnI6XLh/OMUOMAeQkLu+oExcDj/4OMDuLwjH6c6lS6xa2Q7gwqGSKoJGpQaE2D7UL+y3uBBVcX8QF/g12M60C6HmwIuEMxt6SCRO3/+LQhprUZCGmBae0W4QLoHcmcQKP82a0pzXDzZTEI3+gbAXZa54dc+3KM0g1xm4oQUpiURJ0MfQnVY/ITUJzKvo5pxW8nfAjs2ft2BE4p2EQID02eIfIBEtJj0SbeOJih8oyChm0jBgk5RnpYpTufjs2Hey7Qslrh2LiLMg4c8iuHHPT4js6GaCprNyMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH7PR11MB6553.namprd11.prod.outlook.com (2603:10b6:510:1a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.32; Mon, 24 Apr
 2023 21:20:56 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 21:20:56 +0000
Date: Mon, 24 Apr 2023 14:20:52 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230424212052.GE10045@mdroper-desk1.amr.corp.intel.com>
References: <20230421223258.128781-1-lucas.demarchi@intel.com>
 <20230421223258.128781-17-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230421223258.128781-17-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0018.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::23) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH7PR11MB6553:EE_
X-MS-Office365-Filtering-Correlation-Id: 3caf030b-aa5b-43e9-c42d-08db4509ca69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r+oQRdnSxLWLkGjBNSNMvtmiSvh1Tq8GLgPh5w5DmOU9QCGP48FcTGHd58KZ7KR1okwyuGRRE0NT7FLXwPlkPV0IucANw+DIHI/f949l+Y8zheZCVwalA4+xJ8ly+5GEXcs1nPMSZeDRYKyS31mdbzddquome6SEEig3HFqbrnPnlu6uIQzsLyksHu4sMrfgLu85P6Gk6EnFwhgcjVoj3xO2wpWorYKK/AKI0S+age9wsQU57I80cBrnc2Qad+Ah8pPVp/o1Orj/rh0DW7SUl3qlRVs5SSR2xK5aDft2Ak7PPHISkp1wZ1t64mTsfoZbO48IHxCjlTlBSpVTeNOvfhZoacjfYVi9reWGuwBxobSH4u/3H4FLKyllGmhc/ODnhYEGIIYMMYMLaHKgvh9Ew7IQOskbUkBLZzkQJLZvprzRP+fdTTZLi1RK6fZDExMBJggnQpdFaNCYf1Fc0//zKaNznEK09z915arxkN1LIJxwpfIQbmSpw1t9+n1Tq3koMFYuQhGSCiv8p+8nsANLEBftyOc3C6sNh2P/L4y2+62atPGKpLCugm5bQpjTW3gp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(376002)(136003)(396003)(346002)(451199021)(30864003)(2906002)(66476007)(66556008)(66946007)(316002)(4326008)(6862004)(66899021)(8676002)(5660300002)(8936002)(41300700001)(33656002)(86362001)(186003)(6512007)(26005)(1076003)(38100700002)(478600001)(6486002)(6666004)(83380400001)(6506007)(82960400001)(6636002)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HmRDXwrBceQcrvmpdEgqb23GUACEqSIYLLwz0TJfD15l9cNbW1eRNrCRDCW7?=
 =?us-ascii?Q?YA3bHfWtFOnptTg3cEIXIuh2htmrYOF/xwrhEy1ibCQ3VK3peDxMyOY1KwDU?=
 =?us-ascii?Q?Oynz4/j7IOalP146PUsziJib7ROe5J0U9FjieIJOgd6XFbUcYs1QRb0AdZJa?=
 =?us-ascii?Q?oWh8GCOmBDSFiTAppRJbxAIRlTCH4H8ie5POAe+375wTsRpBygTo+oDTyfUq?=
 =?us-ascii?Q?ykOu54rs/TVFDth2HtkDdhujxAd7Fq0fQeqJ7ooUpUbhhaQxYvycey5E119/?=
 =?us-ascii?Q?4nlGgluxFrwiJo3xlPu4tI/a0CPIKj5AgGAYbn7KfeMPRp9xgegXc3axedPn?=
 =?us-ascii?Q?/kGslDbFNnFVbwsNNIGcBen4fkOs5S2XZQe9Y/Dgy7/g+aFlJn1Qcn3oevwG?=
 =?us-ascii?Q?kY5BVUl2x+i9MMekrHephIxw2djXjdQexjgo5FDujRWQ4WmRFZt56lNtQ+s/?=
 =?us-ascii?Q?ca0Bad/TpDabjkPLHW6+GqYxCfpVJWymz7yVX4epQzQXwkRPNqLhoK8F5CZC?=
 =?us-ascii?Q?skdf19MgYE1whCM0FkU3fm9ziPDn/3j6r8OEIc1vrzLEIjRsxVPks4unbgP4?=
 =?us-ascii?Q?6EcpCHdIzFCw2eB43MoqYEiO16QMiKZFvC3e5YQNR147W5vCeNWlJ+38EFxk?=
 =?us-ascii?Q?DiWMuiRd51a98oY/OioDGKN9krpk2fXhfJQ8Hd4O9c97umFkhXphg+RpwTUF?=
 =?us-ascii?Q?3c9SqWPhBDNGmnEgJSsYVSBLR9iJ0IRh8G1d/sfCQ9AhPaOJNppE5Ab3sGyM?=
 =?us-ascii?Q?fYss9OkESkwwx7JBVYDJSAdP0j1RgPMHQ/rF2Vq3k4ZZNIGWcc+zglYuHpq+?=
 =?us-ascii?Q?0jjbwiwMjVyx+cv6qt6RuwXnaJ72lSfYrqIIKSaE5vGJPU5n6qe6Ud5KZUWf?=
 =?us-ascii?Q?JKF1hZ11PE5n87ubKIXkYsU+zAYUrWA7IEtl+Q9araOMxv0bw9jm3ed4cI38?=
 =?us-ascii?Q?LU0MY6NsTa1pfq1CRNmZdRMlem/6w3jw+ikqjWlKCmXCPpXTSEiZ4mEUm6+1?=
 =?us-ascii?Q?iwj+OsSFpprltiRpeQIXqvlY4WkkPSJuKipHSP9lf/rH4nzIeVIe0/oDMx5p?=
 =?us-ascii?Q?qimYwW6ETj93lJLzT/QOD0lypUNdCV2Tn1kdROqfQTdQSU54NaodOYzh32IN?=
 =?us-ascii?Q?Kj1fn5rew3tA86MlWSLojlbl3ZgBYFyocxJzYICOgEP/LVJXMyec4BnOURJE?=
 =?us-ascii?Q?vv40YgmlSvb+PZYeUCv+Oqw5l9VPgrcSuQKWG8hZunE0Zc2Zh/y6g+FpGcb5?=
 =?us-ascii?Q?nHV4Jwh8QX8lc4+ipdIM8E678gZNT+GOZpl+o5NXr4/yIa2XSG0OhDLeORGo?=
 =?us-ascii?Q?ZLp10694r6o4L2i2ksodxOvboL6A2FWXQEC/vyGZQXFmVDU8ab6OeNUstZv3?=
 =?us-ascii?Q?dR42XgfUyj7UqdpPawez4g0749LhFWw1nqIe1uw49aMgUTMLX4boEBVhTJ6B?=
 =?us-ascii?Q?deBbHMSRaikMfASR+opT2HjhYoL2xVeRNX7bmIj3Dv0XDm61yvuqZdR2AmVp?=
 =?us-ascii?Q?Ke5TcHiGl8fRsfFgRvNPo9g6zZ622OVZ4NcBPYMv3BO0In1cIqvS/Pj3kMtb?=
 =?us-ascii?Q?vIQTJn24hhM2sgj31UFkNf91DQeXM1Cykoq/hbIZ4fQ6cWHuuuUYlLMBTFm7?=
 =?us-ascii?Q?VQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3caf030b-aa5b-43e9-c42d-08db4509ca69
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 21:20:55.9388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kGyLNpLjDnn4Se2AGF78njodrkKUelhghijXs/FX1ivR9TVV7/xxMAho72UK78hxnUbON/thWCxga16z1ZapXpKJNmxmSnZQirKlLieFCCw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6553
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 16/17] drm/xe: Plumb xe_reg_t into WAs, rtp,
 etc
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Apr 21, 2023 at 03:32:57PM -0700, Lucas De Marchi wrote:
> Now that xe_reg_t is a type that can be used by xe, convert the rest of
> the driver to use it:

s/the rest of the driver/more of the driver/

We still need to fix xe_mmio_*() to take this type instead of a u32
before we consider the conversion "done."  I assume that's coming in
another series after this one?

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> 
> 	- The RTP tables don't need the MASKED flags anymore in the
> 	  actions as that information now comes from the register
> 	  definition
> 
> 	- There is no need for the _XE_RTP_REG/_XE_RTP_REG_MCR macros an
> 	  the register types on RTP infra: that comes from the register
> 	  definitions.
> 
> 	- When declaring the RTP entries, there is no need anymore to
> 	  undef XE_REG and friends: the RTP macros deal with removing
> 	  the cast where needed due to not being able to use a compound
> 	  statement for initialization in the tables
> 
> 	- The index in the reg-sr xarray is the register offset only.
> 	  Otherwise we wouldn't catch mistakes about adding both a
> 	  MCR-style and normal-style registers. For that, the register
> 	  is now also part of the entry, so the options can be compared
> 	  to check for compatible entries.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_rtp_test.c |  41 ++++----
>  drivers/gpu/drm/xe/xe_guc_ads.c        |   2 +-
>  drivers/gpu/drm/xe/xe_reg_sr.c         |  51 ++++++----
>  drivers/gpu/drm/xe/xe_reg_sr.h         |   3 +-
>  drivers/gpu/drm/xe/xe_reg_sr_types.h   |  10 +-
>  drivers/gpu/drm/xe/xe_reg_whitelist.c  |   4 +-
>  drivers/gpu/drm/xe/xe_rtp.c            |   7 +-
>  drivers/gpu/drm/xe/xe_rtp.h            |  46 ++++-----
>  drivers/gpu/drm/xe/xe_rtp_types.h      |  22 ++--
>  drivers/gpu/drm/xe/xe_tuning.c         |   7 +-
>  drivers/gpu/drm/xe/xe_wa.c             | 134 ++++++++-----------------
>  11 files changed, 131 insertions(+), 196 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> index 51d215f08113..ad2fe8a39a78 100644
> --- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> @@ -18,25 +18,21 @@
>  #include "xe_reg_sr.h"
>  #include "xe_rtp.h"
>  
> -#undef XE_REG
> -#undef XE_REG_MCR
> -#define XE_REG(x, ...)		_XE_RTP_REG(x)
> -#define XE_REG_MCR(x, ...)	_XE_RTP_MCR_REG(x)
> -
>  #define REGULAR_REG1	XE_REG(1)
>  #define REGULAR_REG2	XE_REG(2)
>  #define REGULAR_REG3	XE_REG(3)
>  #define MCR_REG1	XE_REG_MCR(1)
>  #define MCR_REG2	XE_REG_MCR(2)
>  #define MCR_REG3	XE_REG_MCR(3)
> +#define MASKED_REG1	XE_REG(1, XE_REG_OPTION_MASKED)
> +
> +#undef XE_REG_MCR
> +#define XE_REG_MCR(...)     XE_REG(__VA_ARGS__, .mcr = 1)
>  
>  struct rtp_test_case {
>  	const char *name;
> -	struct {
> -		u32 offset;
> -		u32 type;
> -	} expected_reg;
> -        u32 expected_set_bits;
> +	struct xe_reg expected_reg;
> +	u32 expected_set_bits;
>  	u32 expected_clr_bits;
>  	unsigned long expected_count;
>  	unsigned int expected_sr_errors;
> @@ -56,7 +52,7 @@ static bool match_no(const struct xe_gt *gt, const struct xe_hw_engine *hwe)
>  static const struct rtp_test_case cases[] = {
>  	{
>  		.name = "coalesce-same-reg",
> -		.expected_reg = { REGULAR_REG1 },
> +		.expected_reg = REGULAR_REG1,
>  		.expected_set_bits = REG_BIT(0) | REG_BIT(1),
>  		.expected_clr_bits = REG_BIT(0) | REG_BIT(1),
>  		.expected_count = 1,
> @@ -75,7 +71,7 @@ static const struct rtp_test_case cases[] = {
>  	},
>  	{
>  		.name = "no-match-no-add",
> -		.expected_reg = { REGULAR_REG1 },
> +		.expected_reg = REGULAR_REG1,
>  		.expected_set_bits = REG_BIT(0),
>  		.expected_clr_bits = REG_BIT(0),
>  		.expected_count = 1,
> @@ -94,7 +90,7 @@ static const struct rtp_test_case cases[] = {
>  	},
>  	{
>  		.name = "no-match-no-add-multiple-rules",
> -		.expected_reg = { REGULAR_REG1 },
> +		.expected_reg = REGULAR_REG1,
>  		.expected_set_bits = REG_BIT(0),
>  		.expected_clr_bits = REG_BIT(0),
>  		.expected_count = 1,
> @@ -113,7 +109,7 @@ static const struct rtp_test_case cases[] = {
>  	},
>  	{
>  		.name = "two-regs-two-entries",
> -		.expected_reg = { REGULAR_REG1 },
> +		.expected_reg = REGULAR_REG1,
>  		.expected_set_bits = REG_BIT(0),
>  		.expected_clr_bits = REG_BIT(0),
>  		.expected_count = 2,
> @@ -132,7 +128,7 @@ static const struct rtp_test_case cases[] = {
>  	},
>  	{
>  		.name = "clr-one-set-other",
> -		.expected_reg = { REGULAR_REG1 },
> +		.expected_reg = REGULAR_REG1,
>  		.expected_set_bits = REG_BIT(0),
>  		.expected_clr_bits = REG_BIT(1) | REG_BIT(0),
>  		.expected_count = 1,
> @@ -153,7 +149,7 @@ static const struct rtp_test_case cases[] = {
>  #define TEMP_MASK	REG_GENMASK(10, 8)
>  #define TEMP_FIELD	REG_FIELD_PREP(TEMP_MASK, 2)
>  		.name = "set-field",
> -		.expected_reg = { REGULAR_REG1 },
> +		.expected_reg = REGULAR_REG1,
>  		.expected_set_bits = TEMP_FIELD,
>  		.expected_clr_bits = TEMP_MASK,
>  		.expected_count = 1,
> @@ -171,7 +167,7 @@ static const struct rtp_test_case cases[] = {
>  	},
>  	{
>  		.name = "conflict-duplicate",
> -		.expected_reg = { REGULAR_REG1 },
> +		.expected_reg = REGULAR_REG1,
>  		.expected_set_bits = REG_BIT(0),
>  		.expected_clr_bits = REG_BIT(0),
>  		.expected_count = 1,
> @@ -191,7 +187,7 @@ static const struct rtp_test_case cases[] = {
>  	},
>  	{
>  		.name = "conflict-not-disjoint",
> -		.expected_reg = { REGULAR_REG1 },
> +		.expected_reg = REGULAR_REG1,
>  		.expected_set_bits = REG_BIT(0),
>  		.expected_clr_bits = REG_BIT(0),
>  		.expected_count = 1,
> @@ -211,7 +207,7 @@ static const struct rtp_test_case cases[] = {
>  	},
>  	{
>  		.name = "conflict-reg-type",
> -		.expected_reg = { REGULAR_REG1 },
> +		.expected_reg = REGULAR_REG1,
>  		.expected_set_bits = REG_BIT(0),
>  		.expected_clr_bits = REG_BIT(0),
>  		.expected_count = 1,
> @@ -229,8 +225,7 @@ static const struct rtp_test_case cases[] = {
>  			/* drop: regular vs masked */
>  			{ XE_RTP_NAME("basic-3"),
>  			  XE_RTP_RULES(FUNC(match_yes)),
> -			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0),
> -					     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +			  XE_RTP_ACTIONS(SET(MASKED_REG1, REG_BIT(0)))
>  			},
>  			{}
>  		},
> @@ -249,7 +244,7 @@ static void xe_rtp_process_tests(struct kunit *test)
>  	xe_rtp_process(param->entries, reg_sr, &xe->gt[0], NULL);
>  
>  	xa_for_each(&reg_sr->xa, idx, sre) {
> -		if (idx == param->expected_reg.offset)
> +		if (idx == param->expected_reg.reg)
>  			sr_entry = sre;
>  
>  		count++;
> @@ -258,7 +253,7 @@ static void xe_rtp_process_tests(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, count, param->expected_count);
>  	KUNIT_EXPECT_EQ(test, sr_entry->clr_bits, param->expected_clr_bits);
>  	KUNIT_EXPECT_EQ(test, sr_entry->set_bits, param->expected_set_bits);
> -	KUNIT_EXPECT_EQ(test, sr_entry->reg_type, param->expected_reg.type);
> +	KUNIT_EXPECT_EQ(test, sr_entry->reg.raw, param->expected_reg.raw);
>  	KUNIT_EXPECT_EQ(test, reg_sr->errors, param->expected_sr_errors);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 6a723bda2aa9..676137dcb510 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -461,7 +461,7 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
>  	BUILD_BUG_ON(ARRAY_SIZE(extra_regs) > ADS_REGSET_EXTRA_MAX);
>  
>  	xa_for_each(&hwe->reg_sr.xa, idx, entry) {
> -		u32 flags = entry->masked_reg ? GUC_REGSET_MASKED : 0;
> +		u32 flags = entry->reg.masked ? GUC_REGSET_MASKED : 0;
>  
>  		guc_mmio_regset_write_one(ads, regset_map, idx, flags, count++);
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index 1e792ec8239b..801f211fb733 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -77,10 +77,7 @@ static bool compatible_entries(const struct xe_reg_sr_entry *e1,
>  	    e1->clr_bits & e2->set_bits || e1->set_bits & e2->clr_bits)
>  		return false;
>  
> -	if (e1->masked_reg != e2->masked_reg)
> -		return false;
> -
> -	if (e1->reg_type != e2->reg_type)
> +	if (e1->reg.raw != e2->reg.raw)
>  		return false;
>  
>  	return true;
> @@ -93,10 +90,10 @@ static void reg_sr_inc_error(struct xe_reg_sr *sr)
>  #endif
>  }
>  
> -int xe_reg_sr_add(struct xe_reg_sr *sr, u32 reg,
> +int xe_reg_sr_add(struct xe_reg_sr *sr,
>  		  const struct xe_reg_sr_entry *e)
>  {
> -	unsigned long idx = reg;
> +	unsigned long idx = e->reg.reg;
>  	struct xe_reg_sr_entry *pentry = xa_load(&sr->xa, idx);
>  	int ret;
>  
> @@ -127,18 +124,30 @@ int xe_reg_sr_add(struct xe_reg_sr *sr, u32 reg,
>  	return 0;
>  
>  fail:
> -	DRM_ERROR("Discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s): ret=%d\n",
> +	DRM_ERROR("Discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n",
>  		  idx, e->clr_bits, e->set_bits,
> -		  str_yes_no(e->masked_reg), ret);
> +		  str_yes_no(e->reg.masked),
> +		  str_yes_no(e->reg.mcr),
> +		  ret);
>  	reg_sr_inc_error(sr);
>  
>  	return ret;
>  }
>  
> -static void apply_one_mmio(struct xe_gt *gt, u32 reg,
> -			   struct xe_reg_sr_entry *entry)
> +/*
> + * Convert back from encoded value to type-safe, only to be used when reg.mcr
> + * is true
> + */
> +static struct xe_reg_mcr to_xe_reg_mcr(const struct xe_reg reg)
> +{
> +	return (const struct xe_reg_mcr){.__reg.raw = reg.raw };
> +}
> +
> +static void apply_one_mmio(struct xe_gt *gt, struct xe_reg_sr_entry *entry)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_reg reg = entry->reg;
> +	struct xe_reg_mcr reg_mcr = to_xe_reg_mcr(reg);
>  	u32 val;
>  
>  	/*
> @@ -149,12 +158,12 @@ static void apply_one_mmio(struct xe_gt *gt, u32 reg,
>  	 * When it's not masked, we have to read it from hardware, unless we are
>  	 * supposed to set all bits.
>  	 */
> -	if (entry->masked_reg)
> +	if (reg.masked)
>  		val = (entry->clr_bits ?: entry->set_bits) << 16;
>  	else if (entry->clr_bits + 1)
> -		val = (entry->reg_type == XE_RTP_REG_MCR ?
> -		       xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(reg)) :
> -		       xe_mmio_read32(gt, reg)) & (~entry->clr_bits);
> +		val = (reg.mcr ?
> +		       xe_gt_mcr_unicast_read_any(gt, reg_mcr) :
> +		       xe_mmio_read32(gt, reg.reg)) & (~entry->clr_bits);
>  	else
>  		val = 0;
>  
> @@ -165,12 +174,12 @@ static void apply_one_mmio(struct xe_gt *gt, u32 reg,
>  	 */
>  	val |= entry->set_bits;
>  
> -	drm_dbg(&xe->drm, "REG[0x%x] = 0x%08x", reg, val);
> +	drm_dbg(&xe->drm, "REG[0x%x] = 0x%08x", reg.reg, val);
>  
> -	if (entry->reg_type == XE_RTP_REG_MCR)
> -		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(reg), val);
> +	if (entry->reg.mcr)
> +		xe_gt_mcr_multicast_write(gt, reg_mcr, val);
>  	else
> -		xe_mmio_write32(gt, reg, val);
> +		xe_mmio_write32(gt, reg.reg, val);
>  }
>  
>  void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
> @@ -190,7 +199,7 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
>  		goto err_force_wake;
>  
>  	xa_for_each(&sr->xa, reg, entry)
> -		apply_one_mmio(gt, reg, entry);
> +		apply_one_mmio(gt, entry);
>  
>  	err = xe_force_wake_put(&gt->mmio.fw, XE_FORCEWAKE_ALL);
>  	XE_WARN_ON(err);
> @@ -259,6 +268,6 @@ void xe_reg_sr_dump(struct xe_reg_sr *sr, struct drm_printer *p)
>  	xa_for_each(&sr->xa, reg, entry)
>  		drm_printf(p, "\tREG[0x%lx] clr=0x%08x set=0x%08x masked=%s mcr=%s\n",
>  			   reg, entry->clr_bits, entry->set_bits,
> -			   str_yes_no(entry->masked_reg),
> -			   str_yes_no(entry->reg_type == XE_RTP_REG_MCR));
> +			   str_yes_no(entry->reg.masked),
> +			   str_yes_no(entry->reg.mcr));
>  }
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.h b/drivers/gpu/drm/xe/xe_reg_sr.h
> index 3af369089faa..0bfe66ea29bf 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.h
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.h
> @@ -19,8 +19,7 @@ struct drm_printer;
>  int xe_reg_sr_init(struct xe_reg_sr *sr, const char *name, struct xe_device *xe);
>  void xe_reg_sr_dump(struct xe_reg_sr *sr, struct drm_printer *p);
>  
> -int xe_reg_sr_add(struct xe_reg_sr *sr, u32 reg,
> -		  const struct xe_reg_sr_entry *e);
> +int xe_reg_sr_add(struct xe_reg_sr *sr, const struct xe_reg_sr_entry *e);
>  void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt);
>  void xe_reg_sr_apply_whitelist(struct xe_reg_sr *sr, u32 mmio_base,
>  			       struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr_types.h b/drivers/gpu/drm/xe/xe_reg_sr_types.h
> index 91469784fd90..ad48a52b824a 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr_types.h
> +++ b/drivers/gpu/drm/xe/xe_reg_sr_types.h
> @@ -9,18 +9,14 @@
>  #include <linux/types.h>
>  #include <linux/xarray.h>
>  
> +#include "regs/xe_reg_defs.h"
> +
>  struct xe_reg_sr_entry {
> +	struct xe_reg	reg;
>  	u32		clr_bits;
>  	u32		set_bits;
>  	/* Mask for bits to consider when reading value back */
>  	u32		read_mask;
> -	/*
> -	 * "Masked registers" are marked in spec as register with the upper 16
> -	 * bits as a mask for the bits that is being updated on the lower 16
> -	 * bits when writing to it.
> -	 */
> -	u8		masked_reg;
> -	u8		reg_type;
>  };
>  
>  struct xe_reg_sr {
> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> index 310d5dfe30d5..7a2bb60ebd85 100644
> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> @@ -11,10 +11,8 @@
>  #include "xe_platform_types.h"
>  #include "xe_rtp.h"
>  
> -#undef XE_REG
>  #undef XE_REG_MCR
> -#define XE_REG(x, ...)		_XE_RTP_REG(x)
> -#define XE_REG_MCR(x, ...)	_XE_RTP_MCR_REG(x)
> +#define XE_REG_MCR(...)     XE_REG(__VA_ARGS__, .mcr = 1)
>  
>  static bool match_not_render(const struct xe_gt *gt,
>  			     const struct xe_hw_engine *hwe)
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index 20acd43cb60b..f2a0e8eb4936 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -94,16 +94,15 @@ static void rtp_add_sr_entry(const struct xe_rtp_action *action,
>  			     u32 mmio_base,
>  			     struct xe_reg_sr *sr)
>  {
> -	u32 reg = action->reg + mmio_base;
>  	struct xe_reg_sr_entry sr_entry = {
> +		.reg = action->reg,
>  		.clr_bits = action->clr_bits,
>  		.set_bits = action->set_bits,
>  		.read_mask = action->read_mask,
> -		.masked_reg = action->flags & XE_RTP_ACTION_FLAG_MASKED_REG,
> -		.reg_type = action->reg_type,
>  	};
>  
> -	xe_reg_sr_add(sr, reg, &sr_entry);
> +	sr_entry.reg.reg += mmio_base;
> +	xe_reg_sr_add(sr, &sr_entry);
>  }
>  
>  static void rtp_process_one(const struct xe_rtp_entry *entry, struct xe_gt *gt,
> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> index 9148f32baa02..85b107967eeb 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.h
> +++ b/drivers/gpu/drm/xe/xe_rtp.h
> @@ -42,8 +42,8 @@ struct xe_reg_sr;
>  #define __XE_PASTE_3(prefix_, sep_, args_) prefix_(_XE_FIRST args_) __XE_PASTE_SEP_ ## sep_ __XE_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)
>  #define __XE_PASTE_4(prefix_, sep_, args_) prefix_(_XE_FIRST args_) __XE_PASTE_SEP_ ## sep_ __XE_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)
>  
> -#define _XE_RTP_REG(x_)		(x_), XE_RTP_REG_REGULAR
> -#define _XE_RTP_MCR_REG(x_)	(x_), XE_RTP_REG_MCR
> +#define _XE_DROP_FIRST(x_, ...) __VA_ARGS__
> +#define _XE_DROP_CAST(...) _XE_ESC(_XE_DROP_FIRST _XE_ESC __VA_ARGS__)
>  
>  /*
>   * Helper macros for concatenating prefix - do not use them directly outside
> @@ -196,7 +196,6 @@ struct xe_reg_sr;
>   * XE_RTP_ACTION_WR - Helper to write a value to the register, overriding all
>   *                    the bits
>   * @reg_: Register
> - * @reg_type_: Register type - automatically expanded by XE_REG
>   * @val_: Value to set
>   * @...: Additional fields to override in the struct xe_rtp_action entry
>   *
> @@ -204,15 +203,14 @@ struct xe_reg_sr;
>   *
>   *	REGNAME = VALUE
>   */
> -#define XE_RTP_ACTION_WR(reg_, reg_type_, val_, ...)				\
> -	{ .reg = (reg_), .reg_type = (reg_type_),				\
> +#define XE_RTP_ACTION_WR(reg_, val_, ...)					\
> +	{ .reg = _XE_DROP_CAST(reg_),						\
>  	  .clr_bits = ~0u, .set_bits = (val_),					\
>  	  .read_mask = (~0u), ##__VA_ARGS__ }
>  
>  /**
>   * XE_RTP_ACTION_SET - Set bits from @val_ in the register.
>   * @reg_: Register
> - * @reg_type_: Register type - automatically expanded by XE_REG
>   * @val_: Bits to set in the register
>   * @...: Additional fields to override in the struct xe_rtp_action entry
>   *
> @@ -223,15 +221,14 @@ struct xe_reg_sr;
>   *	REGNAME[2] = 1
>   *	REGNAME[5] = 1
>   */
> -#define XE_RTP_ACTION_SET(reg_, reg_type_, val_, ...)				\
> -	{ .reg = (reg_), .reg_type = (reg_type_),				\
> -	  .clr_bits = (val_), .set_bits = (val_),				\
> -	  .read_mask = (val_), ##__VA_ARGS__ }
> +#define XE_RTP_ACTION_SET(reg_, val_, ...)					\
> +	{ .reg = _XE_DROP_CAST(reg_),						\
> +	  .clr_bits = val_, .set_bits = val_,					\
> +	  .read_mask = val_, ##__VA_ARGS__ }
>  
>  /**
>   * XE_RTP_ACTION_CLR: Clear bits from @val_ in the register.
>   * @reg_: Register
> - * @reg_type_: Register type - automatically expanded by XE_REG
>   * @val_: Bits to clear in the register
>   * @...: Additional fields to override in the struct xe_rtp_action entry
>   *
> @@ -242,15 +239,14 @@ struct xe_reg_sr;
>   *	REGNAME[2] = 0
>   *	REGNAME[5] = 0
>   */
> -#define XE_RTP_ACTION_CLR(reg_, reg_type_, val_, ...)				\
> -	{ .reg = (reg_), .reg_type = (reg_type_),				\
> -	  .clr_bits = (val_), .set_bits = 0,					\
> -	  .read_mask = (val_), ##__VA_ARGS__ }
> +#define XE_RTP_ACTION_CLR(reg_, val_, ...)					\
> +	{ .reg = _XE_DROP_CAST(reg_),						\
> +	  .clr_bits = val_, .set_bits = 0,					\
> +	  .read_mask = val_, ##__VA_ARGS__ }
>  
>  /**
>   * XE_RTP_ACTION_FIELD_SET: Set a bit range
>   * @reg_: Register
> - * @reg_type_: Register type - automatically expanded by XE_REG
>   * @mask_bits_: Mask of bits to be changed in the register, forming a field
>   * @val_: Value to set in the field denoted by @mask_bits_
>   * @...: Additional fields to override in the struct xe_rtp_action entry
> @@ -260,29 +256,29 @@ struct xe_reg_sr;
>   *
>   *	REGNAME[<end>:<start>] = VALUE
>   */
> -#define XE_RTP_ACTION_FIELD_SET(reg_, reg_type_, mask_bits_, val_, ...)		\
> -	{ .reg = (reg_), .reg_type = (reg_type_),				\
> -	  .clr_bits = (mask_bits_), .set_bits = (val_),				\
> -	  .read_mask = (mask_bits_), ##__VA_ARGS__ }
> +#define XE_RTP_ACTION_FIELD_SET(reg_, mask_bits_, val_, ...)			\
> +	{ .reg = _XE_DROP_CAST(reg_),						\
> +	  .clr_bits = mask_bits_, .set_bits = val_,				\
> +	  .read_mask = mask_bits_, ##__VA_ARGS__ }
>  
> -#define XE_RTP_ACTION_FIELD_SET_NO_READ_MASK(reg_, reg_type_, mask_bits_, val_, ...)	\
> -	{ .reg = (reg_), .reg_type = (reg_type_),				\
> +#define XE_RTP_ACTION_FIELD_SET_NO_READ_MASK(reg_, mask_bits_, val_, ...)	\
> +	{ .reg = _XE_DROP_CAST(reg_),						\
>  	  .clr_bits = (mask_bits_), .set_bits = (val_),				\
>  	  .read_mask = 0, ##__VA_ARGS__ }
>  
>  /**
>   * XE_RTP_ACTION_WHITELIST - Add register to userspace whitelist
>   * @reg_: Register
> - * @reg_type_: Register type - automatically expanded by XE_REG
>   * @val_: Whitelist-specific flags to set
>   * @...: Additional fields to override in the struct xe_rtp_action entry
>   *
>   * Add a register to the whitelist, allowing userspace to modify the ster with
>   * regular user privileges.
>   */
> -#define XE_RTP_ACTION_WHITELIST(reg_, reg_type_, val_, ...)			\
> +#define XE_RTP_ACTION_WHITELIST(reg_, val_, ...)				\
>  	/* TODO fail build if ((flags) & ~(RING_FORCE_TO_NONPRIV_MASK_VALID)) */\
> -	{ .reg = (reg_), .reg_type = (reg_type_), .set_bits = (val_),		\
> +	{ .reg = _XE_DROP_CAST(reg_),						\
> +	  .set_bits = val_,							\
>  	  .clr_bits = RING_FORCE_TO_NONPRIV_MASK_VALID,				\
>  	  ##__VA_ARGS__ }
>  
> diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
> index e87f1b280d96..12df8a9e9c45 100644
> --- a/drivers/gpu/drm/xe/xe_rtp_types.h
> +++ b/drivers/gpu/drm/xe/xe_rtp_types.h
> @@ -8,14 +8,11 @@
>  
>  #include <linux/types.h>
>  
> +#include "regs/xe_reg_defs.h"
> +
>  struct xe_hw_engine;
>  struct xe_gt;
>  
> -enum {
> -	XE_RTP_REG_REGULAR,
> -	XE_RTP_REG_MCR,
> -};
> -
>  /**
>   * struct xe_rtp_action - action to take for any matching rule
>   *
> @@ -24,20 +21,17 @@ enum {
>   */
>  struct xe_rtp_action {
>  	/** @reg: Register */
> -	u32		reg;
> +	struct xe_reg		reg;
>  	/** @clr_bits: bits to clear when updating register */
> -	u32		clr_bits;
> +	u32			clr_bits;
>  	/** @set_bits: bits to set when updating register */
> -	u32		set_bits;
> +	u32			set_bits;
>  #define XE_RTP_NOCHECK		.read_mask = 0
>  	/** @read_mask: mask for bits to consider when reading value back */
> -	u32		read_mask;
> -#define XE_RTP_ACTION_FLAG_MASKED_REG		BIT(0)
> -#define XE_RTP_ACTION_FLAG_ENGINE_BASE		BIT(1)
> +	u32			read_mask;
> +#define XE_RTP_ACTION_FLAG_ENGINE_BASE		BIT(0)
>  	/** @flags: flags to apply on rule evaluation or action */
> -	u8		flags;
> -	/** @reg_type: register type, see ``XE_RTP_REG_*`` */
> -	u8		reg_type;
> +	u8			flags;
>  };
>  
>  enum {
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index f6eefa951175..5fc6a408429b 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -12,10 +12,8 @@
>  #include "xe_platform_types.h"
>  #include "xe_rtp.h"
>  
> -#undef XE_REG
>  #undef XE_REG_MCR
> -#define XE_REG(x, ...)		_XE_RTP_REG(x)
> -#define XE_REG_MCR(x, ...)	_XE_RTP_MCR_REG(x)
> +#define XE_REG_MCR(...)     XE_REG(__VA_ARGS__, .mcr = 1)
>  
>  static const struct xe_rtp_entry gt_tunings[] = {
>  	{ XE_RTP_NAME("Tuning: Blend Fill Caching Optimization Disable"),
> @@ -54,8 +52,7 @@ static const struct xe_rtp_entry lrc_tunings[] = {
>  	},
>  	{ XE_RTP_NAME("Tuning: TBIMR fast clip"),
>  	  XE_RTP_RULES(PLATFORM(DG2)),
> -	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_2, TBIMR_FAST_CLIP,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_2, TBIMR_FAST_CLIP))
>  	},
>  	{}
>  };
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index b7dc71f63c8a..aaeb4938e164 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -87,10 +87,8 @@
>   *    a more declarative approach rather than procedural.
>   */
>  
> -#undef XE_REG
>  #undef XE_REG_MCR
> -#define XE_REG(x, ...)		_XE_RTP_REG(x)
> -#define XE_REG_MCR(x, ...)	_XE_RTP_MCR_REG(x)
> +#define XE_REG_MCR(...)     XE_REG(__VA_ARGS__, .mcr = 1)
>  
>  __diag_push();
>  __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
> @@ -232,8 +230,7 @@ static const struct xe_rtp_entry gt_was[] = {
>  	},
>  	{ XE_RTP_NAME("16016694945"),
>  	  XE_RTP_RULES(PLATFORM(PVC)),
> -	  XE_RTP_ACTIONS(SET(XEHPC_LNCFMISCCFGREG0, XEHPC_OVRLSCCC,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	  XE_RTP_ACTIONS(SET(XEHPC_LNCFMISCCFGREG0, XEHPC_OVRLSCCC))
>  	},
>  	{}
>  };
> @@ -248,36 +245,30 @@ static const struct xe_rtp_entry engine_was[] = {
>  	  XE_RTP_RULES(GRAPHICS_VERSION(1200),
>  		       ENGINE_CLASS(RENDER),
>  		       IS_INTEGRATED),
> -	  XE_RTP_ACTIONS(SET(ROW_CHICKEN2, PUSH_CONST_DEREF_HOLD_DIS,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	  XE_RTP_ACTIONS(SET(ROW_CHICKEN2, PUSH_CONST_DEREF_HOLD_DIS))
>  	},
>  	{ XE_RTP_NAME("14010229206, 1409085225"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION(1200),
>  		       ENGINE_CLASS(RENDER),
>  		       IS_INTEGRATED),
> -	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
>  	},
>  	{ XE_RTP_NAME("1606931601"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(ROW_CHICKEN2, DISABLE_EARLY_READ,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	  XE_RTP_ACTIONS(SET(ROW_CHICKEN2, DISABLE_EARLY_READ))
>  	},
>  	{ XE_RTP_NAME("14010826681, 1606700617, 22010271021, 18019627453"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1255), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(CS_DEBUG_MODE1, FF_DOP_CLOCK_GATE_DISABLE,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	  XE_RTP_ACTIONS(SET(CS_DEBUG_MODE1, FF_DOP_CLOCK_GATE_DISABLE))
>  	},
>  	{ XE_RTP_NAME("1406941453"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(SAMPLER_MODE, ENABLE_SMALLPL,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	  XE_RTP_ACTIONS(SET(SAMPLER_MODE, ENABLE_SMALLPL))
>  	},
>  	{ XE_RTP_NAME("FtrPerCtxtPreemptionGranularityControl"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1250), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(FF_SLICE_CS_CHICKEN1,
> -			     FFSC_PERCTX_PREEMPT_CTRL,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +			     FFSC_PERCTX_PREEMPT_CTRL))
>  	},
>  
>  	/* TGL */
> @@ -286,8 +277,7 @@ static const struct xe_rtp_entry engine_was[] = {
>  	  XE_RTP_RULES(PLATFORM(TIGERLAKE), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(RING_PSMI_CTL(RENDER_RING_BASE),
>  			     WAIT_FOR_EVENT_POWER_DOWN_DISABLE |
> -			     RC_SEMA_IDLE_MSG_DISABLE,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +			     RC_SEMA_IDLE_MSG_DISABLE))
>  	},
>  
>  	/* RKL */
> @@ -296,8 +286,7 @@ static const struct xe_rtp_entry engine_was[] = {
>  	  XE_RTP_RULES(PLATFORM(ROCKETLAKE), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(RING_PSMI_CTL(RENDER_RING_BASE),
>  			     WAIT_FOR_EVENT_POWER_DOWN_DISABLE |
> -			     RC_SEMA_IDLE_MSG_DISABLE,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +			     RC_SEMA_IDLE_MSG_DISABLE))
>  	},
>  
>  	/* ADL-P */
> @@ -306,8 +295,7 @@ static const struct xe_rtp_entry engine_was[] = {
>  	  XE_RTP_RULES(PLATFORM(ALDERLAKE_P), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(RING_PSMI_CTL(RENDER_RING_BASE),
>  			     WAIT_FOR_EVENT_POWER_DOWN_DISABLE |
> -			     RC_SEMA_IDLE_MSG_DISABLE,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +			     RC_SEMA_IDLE_MSG_DISABLE))
>  	},
>  
>  	/* DG2 */
> @@ -324,8 +312,7 @@ static const struct xe_rtp_entry engine_was[] = {
>  	{ XE_RTP_NAME("18017747507"),
>  	  XE_RTP_RULES(PLATFORM(DG2), FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(VFG_PREEMPTION_CHICKEN,
> -			     POLYGON_TRIFAN_LINELOOP_DISABLE,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +			     POLYGON_TRIFAN_LINELOOP_DISABLE))
>  	},
>  	{ XE_RTP_NAME("22012826095, 22013059131"),
>  	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(B0, C0),
> @@ -366,15 +353,13 @@ static const struct xe_rtp_entry engine_was[] = {
>  	{ XE_RTP_NAME("14015227452"),
>  	  XE_RTP_RULES(PLATFORM(DG2),
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
> -	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, XEHP_DIS_BBL_SYSPIPE,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, XEHP_DIS_BBL_SYSPIPE))
>  	},
>  	{ XE_RTP_NAME("16015675438"),
>  	  XE_RTP_RULES(PLATFORM(DG2),
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(FF_SLICE_CS_CHICKEN2,
> -			     PERF_FIX_BALANCING_CFE_DISABLE,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +			     PERF_FIX_BALANCING_CFE_DISABLE))
>  	},
>  	{ XE_RTP_NAME("16011620976, 22015475538"),
>  	  XE_RTP_RULES(PLATFORM(DG2),
> @@ -385,7 +370,6 @@ static const struct xe_rtp_entry engine_was[] = {
>  	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, C0),
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS, ENABLE_PREFETCH_INTO_IC,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG),
>  			     /*
>  			      * Register can't be read back for verification on
>  			      * DG2 due to Wa_14012342262
> @@ -396,7 +380,6 @@ static const struct xe_rtp_entry engine_was[] = {
>  	  XE_RTP_RULES(SUBPLATFORM(DG2, G11),
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS, ENABLE_PREFETCH_INTO_IC,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG),
>  			     /*
>  			      * Register can't be read back for verification on
>  			      * DG2 due to Wa_14012342262
> @@ -405,55 +388,46 @@ static const struct xe_rtp_entry engine_was[] = {
>  	},
>  	{ XE_RTP_NAME("1509727124"),
>  	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(SAMPLER_MODE, SC_DISABLE_POWER_OPTIMIZATION_EBB,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	  XE_RTP_ACTIONS(SET(SAMPLER_MODE, SC_DISABLE_POWER_OPTIMIZATION_EBB))
>  	},
>  	{ XE_RTP_NAME("22012856258"),
>  	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(ROW_CHICKEN2, DISABLE_READ_SUPPRESSION,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	  XE_RTP_ACTIONS(SET(ROW_CHICKEN2, DISABLE_READ_SUPPRESSION))
>  	},
>  	{ XE_RTP_NAME("14013392000"),
>  	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(A0, B0), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(ROW_CHICKEN2, ENABLE_LARGE_GRF_MODE,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	  XE_RTP_ACTIONS(SET(ROW_CHICKEN2, ENABLE_LARGE_GRF_MODE))
>  	},
>  	{ XE_RTP_NAME("14012419201"),
>  	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4,
> -			     DISABLE_HDR_PAST_PAYLOAD_HOLD_FIX,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +			     DISABLE_HDR_PAST_PAYLOAD_HOLD_FIX))
>  	},
>  	{ XE_RTP_NAME("14012419201"),
>  	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(A0, B0), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4,
> -			     DISABLE_HDR_PAST_PAYLOAD_HOLD_FIX,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +			     DISABLE_HDR_PAST_PAYLOAD_HOLD_FIX))
>  	},
>  	{ XE_RTP_NAME("1308578152"),
>  	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(B0, C0), ENGINE_CLASS(RENDER),
>  		       FUNC(xe_rtp_match_first_gslice_fused_off)),
>  	  XE_RTP_ACTIONS(CLR(CS_DEBUG_MODE1,
> -			     REPLAY_MODE_GRANULARITY,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +			     REPLAY_MODE_GRANULARITY))
>  	},
>  	{ XE_RTP_NAME("22010960976, 14013347512"),
>  	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(CLR(XEHP_HDC_CHICKEN0,
> -			     LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +			     LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK))
>  	},
>  	{ XE_RTP_NAME("1608949956, 14010198302"),
>  	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN,
> -			     MDQ_ARBITRATION_MODE | UGM_BACKUP_MODE,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +			     MDQ_ARBITRATION_MODE | UGM_BACKUP_MODE))
>  	},
>  	{ XE_RTP_NAME("22010430635"),
>  	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4,
> -			     DISABLE_GRF_CLEAR,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +			     DISABLE_GRF_CLEAR))
>  	},
>  	{ XE_RTP_NAME("14013202645"),
>  	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(B0, C0), ENGINE_CLASS(RENDER)),
> @@ -466,21 +440,18 @@ static const struct xe_rtp_entry engine_was[] = {
>  	{ XE_RTP_NAME("22012532006"),
>  	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, C0), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7,
> -			     DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +			     DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA))
>  	},
>  	{ XE_RTP_NAME("22012532006"),
>  	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(A0, B0), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7,
> -			     DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +			     DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA))
>  	},
>  	{ XE_RTP_NAME("22014600077"),
>  	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(B0, FOREVER),
>  		       ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS,
>  			     ENABLE_EU_COUNT_FOR_TDL_FLUSH,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG),
>  			     /* 
>  			      * Wa_14012342262 write-only reg, so skip
>  			      * verification
> @@ -491,7 +462,6 @@ static const struct xe_rtp_entry engine_was[] = {
>  	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS,
>  			     ENABLE_EU_COUNT_FOR_TDL_FLUSH,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG),
>  			     /* 
>  			      * Wa_14012342262 write-only reg, so skip
>  			      * verification
> @@ -507,18 +477,15 @@ static const struct xe_rtp_entry engine_was[] = {
>  	},
>  	{ XE_RTP_NAME("14015227452"),
>  	  XE_RTP_RULES(PLATFORM(PVC), FUNC(xe_rtp_match_first_render_or_compute)),
> -	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, XEHP_DIS_BBL_SYSPIPE,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, XEHP_DIS_BBL_SYSPIPE))
>  	},
>  	{ XE_RTP_NAME("16015675438"),
>  	  XE_RTP_RULES(PLATFORM(PVC), FUNC(xe_rtp_match_first_render_or_compute)),
> -	  XE_RTP_ACTIONS(SET(FF_SLICE_CS_CHICKEN2, PERF_FIX_BALANCING_CFE_DISABLE,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	  XE_RTP_ACTIONS(SET(FF_SLICE_CS_CHICKEN2, PERF_FIX_BALANCING_CFE_DISABLE))
>  	},
>  	{ XE_RTP_NAME("14014999345"),
>  	  XE_RTP_RULES(PLATFORM(PVC), ENGINE_CLASS(COMPUTE), STEP(B0, C0)),
> -	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS, DISABLE_ECC,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS, DISABLE_ECC))
>  	},
>  	{}
>  };
> @@ -527,25 +494,21 @@ static const struct xe_rtp_entry lrc_was[] = {
>  	{ XE_RTP_NAME("1409342910, 14010698770, 14010443199, 1408979724, 1409178076, 1409207793, 1409217633, 1409252684, 1409347922, 1409142259"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210)),
>  	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN3,
> -			     DISABLE_CPS_AWARE_COLOR_PIPE,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +			     DISABLE_CPS_AWARE_COLOR_PIPE))
>  	},
>  	{ XE_RTP_NAME("WaDisableGPGPUMidThreadPreemption"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210)),
>  	  XE_RTP_ACTIONS(FIELD_SET(CS_CHICKEN1,
>  				   PREEMPT_GPGPU_LEVEL_MASK,
> -				   PREEMPT_GPGPU_THREAD_GROUP_LEVEL,
> -				   XE_RTP_ACTION_FLAG(MASKED_REG)))
> +				   PREEMPT_GPGPU_THREAD_GROUP_LEVEL))
>  	},
>  	{ XE_RTP_NAME("1806527549"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION(1200)),
> -	  XE_RTP_ACTIONS(SET(HIZ_CHICKEN, HZ_DEPTH_TEST_LE_GE_OPT_DISABLE,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	  XE_RTP_ACTIONS(SET(HIZ_CHICKEN, HZ_DEPTH_TEST_LE_GE_OPT_DISABLE))
>  	},
>  	{ XE_RTP_NAME("1606376872"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION(1200)),
> -	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4, DISABLE_TDC_LOAD_BALANCING_CALC,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4, DISABLE_TDC_LOAD_BALANCING_CALC))
>  	},
>  
>  	/* DG1 */
> @@ -553,65 +516,54 @@ static const struct xe_rtp_entry lrc_was[] = {
>  	{ XE_RTP_NAME("1409044764"),
>  	  XE_RTP_RULES(PLATFORM(DG1)),
>  	  XE_RTP_ACTIONS(CLR(COMMON_SLICE_CHICKEN3,
> -			     DG1_FLOAT_POINT_BLEND_OPT_STRICT_MODE_EN,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +			     DG1_FLOAT_POINT_BLEND_OPT_STRICT_MODE_EN))
>  	},
>  	{ XE_RTP_NAME("22010493298"),
>  	  XE_RTP_RULES(PLATFORM(DG1)),
>  	  XE_RTP_ACTIONS(SET(HIZ_CHICKEN,
> -			     DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +			     DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE))
>  	},
>  
>  	/* DG2 */
>  
>  	{ XE_RTP_NAME("16011186671"),
>  	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(A0, B0)),
> -	  XE_RTP_ACTIONS(CLR(VFLSKPD, DIS_MULT_MISS_RD_SQUASH,
> -			     .flags = XE_RTP_ACTION_FLAG_MASKED_REG),
> -			 SET(VFLSKPD, DIS_OVER_FETCH_CACHE,
> -			     .flags = XE_RTP_ACTION_FLAG_MASKED_REG))
> +	  XE_RTP_ACTIONS(CLR(VFLSKPD, DIS_MULT_MISS_RD_SQUASH),
> +			 SET(VFLSKPD, DIS_OVER_FETCH_CACHE))
>  	},
>  	{ XE_RTP_NAME("14010469329"),
>  	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
>  	  XE_RTP_ACTIONS(SET(XEHP_COMMON_SLICE_CHICKEN3,
> -			     XEHP_DUAL_SIMD8_SEQ_MERGE_DISABLE,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +			     XEHP_DUAL_SIMD8_SEQ_MERGE_DISABLE))
>  	},
>  	{ XE_RTP_NAME("14010698770, 22010613112, 22010465075"),
>  	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
>  	  XE_RTP_ACTIONS(SET(XEHP_COMMON_SLICE_CHICKEN3,
> -			     DISABLE_CPS_AWARE_COLOR_PIPE,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +			     DISABLE_CPS_AWARE_COLOR_PIPE))
>  	},
>  	{ XE_RTP_NAME("16013271637"),
>  	  XE_RTP_RULES(PLATFORM(DG2)),
>  	  XE_RTP_ACTIONS(SET(XEHP_SLICE_COMMON_ECO_CHICKEN1,
> -			     MSC_MSAA_REODER_BUF_BYPASS_DISABLE,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +			     MSC_MSAA_REODER_BUF_BYPASS_DISABLE))
>  	},
>  	{ XE_RTP_NAME("14014947963"),
>  	  XE_RTP_RULES(PLATFORM(DG2)),
>  	  XE_RTP_ACTIONS(FIELD_SET(VF_PREEMPTION,
>  				   PREEMPTION_VERTEX_COUNT,
> -				   0x4000,
> -				   XE_RTP_ACTION_FLAG(MASKED_REG)))
> +				   0x4000))
>  	},
>  	{ XE_RTP_NAME("18018764978"),
>  	  XE_RTP_RULES(PLATFORM(DG2)),
>  	  XE_RTP_ACTIONS(SET(XEHP_PSS_MODE2,
> -			     SCOREBOARD_STALL_FLUSH_CONTROL,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +			     SCOREBOARD_STALL_FLUSH_CONTROL))
>  	},
>  	{ XE_RTP_NAME("15010599737"),
>  	  XE_RTP_RULES(PLATFORM(DG2)),
> -	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_SF_ROUND_NEAREST_EVEN,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_SF_ROUND_NEAREST_EVEN))
>  	},
>  	{ XE_RTP_NAME("18019271663"),
>  	  XE_RTP_RULES(PLATFORM(DG2)),
> -	  XE_RTP_ACTIONS(SET(CACHE_MODE_1, MSAA_OPTIMIZATION_REDUC_DISABLE,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	  XE_RTP_ACTIONS(SET(CACHE_MODE_1, MSAA_OPTIMIZATION_REDUC_DISABLE))
>  	},
>  	{}
>  };
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
