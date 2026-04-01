Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4B210FCAF0
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 22:29:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A25B10E19C;
	Wed,  1 Apr 2026 22:29:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OOB9b4Ht";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 663BA10E19C
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Apr 2026 22:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775082593; x=1806618593;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KRCHPejE/fBS1K6UkJNVZsbAh/84Xg/clzrba06Uojk=;
 b=OOB9b4Htvym1hUsOFKRFKfC8vlgTd8cFTkzsLlWBvwZCmU//qkQ3sjbC
 D8MrqDKZcnYHRgDF8gJNv5CijHgU5QY0eD7tHDWtvCTjtmYeA6byFyM7G
 644UhU/18LCIj/C//kEpQ/Uh9arDUqP6zI4GDxyavOAX8M3FHXbSu4JqM
 Npv4PdrxQTQt8RMoXSnwaW/I8dBPaVRKam08Uy2+cguwsM8If48jUfo41
 uSR2xvYUrmQCDQkZ4qJl8F8l+FBl+euWw+MDFoCe4ENlOiPB2qOiAHNbg
 ShatLXAJEDH8KGWsPLlV3Xbs9nh+up4GWBfuqPXDCP+UT0Jf2+yrSX8Vj w==;
X-CSE-ConnectionGUID: c+tha69dSvKLEW7v17ccDg==
X-CSE-MsgGUID: DxtjvubtRV67ZOwJ6sgt8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="87531041"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="87531041"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 15:29:53 -0700
X-CSE-ConnectionGUID: GtuNrJSTTC+GjaO6Jy0eRQ==
X-CSE-MsgGUID: TAriaJb0SOCSyvlNC3Oo9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="225789992"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 15:29:52 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 15:29:51 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 1 Apr 2026 15:29:51 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.17) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 15:29:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MAtjHz8Q0p9H1e52A0pLUyPFhbDOmUPT6wBqG7J9Wnv6IMTrohPX6IzjxCtUb3RouXBtPN38VrfjAFndFddNwnkqQTpcVzwsHXIAqiQ81aR9biJHx1sSCEwUVCjkML/czwLWgcRgx+KwlB+e3XmGCz5oZHzxp7f5p3Rd6I8ZGgKhN4BwUQqFdCCsmP3Jydtf16icRVp5z2t5OOqrBJvvbwF7xc9vqejxWU0LTqHIiyF4zce+OesUvPpdJfJ9/iv7s1j5h3w4pb2hzxJZ4dHgSsvEr6SwX2lcnsJW7p53TEej6gxoCsUFQPPbNOsf+XPsl7yo+wr5Y8M2Ag3RDbnqoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G1mX+Nc3a9TAhEa9xWwFcWy68Oc7HCZVLeUMm6OpMIA=;
 b=M//BD8e8ff/IsKsPBNrh+LAEPH7LY+RXAMO7Wryz2D/8FiGXqm0UT1cVeFxJoeBMEjb7nQz5P0EOH8APdv+zuauU+R8XoMsRompKu8efrJl626CpLf+euOHvEPUDqskqst26tEDTwVD5azgV3h1UmqXq0f9up3OWe0pH2vnoA4RHgPg/KxnWYjC6QJ2d9Byo2QVkkcrTmbTapEpUB0oQudm3TW7I7AvdeSvwXqRfbkoZZo+nTWSlct8hTrizJrGSWLXZIcuRr4BaL746sHwBjB1MloXmJJ3CNfO1DxIxcd7vvvtgM1zd6kbpRuvXsytR/OKZ81A91JScIdSFLpE4WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW4PR11MB5869.namprd11.prod.outlook.com (2603:10b6:303:168::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 22:29:40 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 22:29:40 +0000
Date: Wed, 1 Apr 2026 15:29:37 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Xin Wang <x.wang@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Niranjana Vishwanathapura
 <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH v4 1/2] drm/xe: improve readability of debugfs engine
 info output
Message-ID: <20260401222937.GF183713@mdroper-desk1.amr.corp.intel.com>
References: <20260324212348.4142888-1-x.wang@intel.com>
 <20260401212637.732424-1-x.wang@intel.com>
 <20260401212637.732424-2-x.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260401212637.732424-2-x.wang@intel.com>
X-ClientProxiedBy: SJ0PR03CA0069.namprd03.prod.outlook.com
 (2603:10b6:a03:331::14) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW4PR11MB5869:EE_
X-MS-Office365-Filtering-Correlation-Id: 67a73b00-201a-48ae-3017-08de903e29df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: y5iQOg6zYL3KWlX0u3ae4DSQ9DwFEHif+Abf7B5SKgmk80U2HLauPttzl75nhT1v6QQy62T/0oFCURHfSn7pYqqs/30eFGjOuyj0FdNncM9lIBzky1sGqLXxfXXluTc0RPppa0mCHsCT63FM9t8zHcPwCtjQtsF7Tn/bfagPEiW+t5/NU5l0nzQtNArMD+4C8GJUkUrjvG2rLV1jOwjP9v+jCDh5fwD4SOUQv4pFfiVisq4voj6i0Eg3EKKjGvDp60MiQnL++An0TvxGSWS7wJqWtdqGtD0D7C+w/fbGZyJ+YeHcGUWR07BnIx+xM1g+PP0LFnfK2hCVS0wa+pKmFKd9WmFjQ9B9v9fEoo1gbA+s+HUWDfYWtJPUQCyEuPCbvV2F9A+Q5wDGFGO0vMFFtSD6aIvAHQox3Q0ooUZMfSFiDcdBRQ/U0RWvpPyJ8R/pT8izcNn2Gpnb+gYXOaO1LMyY0ztzoaIpKZQmUrjt51uapokUNuci4ssfgXXOJX9WMwID44L73lzk8cwBpg772coTuF6Ye0dsTFFwAk9EwdXfbngOUGwMZh5XZEPhVETRMxBEBR5OZ7Fpk1Erk/jZenZ4ACs2cTOayJx4EMZ2VCo3x+PrD6zjejnLhC0j9OMAaPrLocYu3Zoa1cfmZV5UrbldzCGAOL7FX+fE+kOpqOMJM77JYCVV8F/V8cRWdXN+MsLRbW7Qsfo6lQw0LnH1wreFOlOPz9Hsl4guLxz4K7w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t/hLnS6N6QK46cBlFZaUHP0+lv6RvsrQ3lwwee/gQS/ico4ArK7drBXdkUkP?=
 =?us-ascii?Q?vXaki+G8KNp3Z2D7+oJ/JNf5R9WV+1VCUzLcVOTQWPhSu/hBmIZj4kDV/xQ8?=
 =?us-ascii?Q?1wqkW3dD93tgjeLEims1B2+lgk3t928L4TcU2XQJcZBytFIjV//TLvXv5j7H?=
 =?us-ascii?Q?G5njabDqldMhjvcO6oap/ZCWGH6IVz7G80avnjYSf4lIfkLCDQ9LlS1zlxDy?=
 =?us-ascii?Q?HYK/AL6MeucZM+1dGUFcgZLDRwI7jrvcjRkBCwwSH3GGmQlVjH8sJS+lbtNV?=
 =?us-ascii?Q?hrN38+zsxCjkfrOq1HF134Gam7Pq9sMgv0YWzdptcfmSPSqbubF4SlECsua4?=
 =?us-ascii?Q?LBiEAbmb0420ijd4ynZt6+SArojokjDkmj4Ybu+suiBuJ4YdhxrEERVSJZKn?=
 =?us-ascii?Q?Vah1EtVa//21EDfe28vR52JvC6krsyuE55uElf3AKuAuQs2Xot9XT6pqPQv1?=
 =?us-ascii?Q?T/H3MFSDSdEs6gGyg0lv3/3MJe8o2f8ABrXGa4BvXVAOfmYIW2oNcPzq+aHM?=
 =?us-ascii?Q?a/hWRPSOpzQypoTmLQLhSZl+heESc0pCPDLGair2Zk72UzDuY5qAZCcyTBlM?=
 =?us-ascii?Q?6cjvOH7Z4DH7kzL6/cJLggJXQ76vhEBErWyY9W72m4s0jIPbbTCBvk8erQmL?=
 =?us-ascii?Q?/6J400fyycByvbDgHuVReegxaO/faUTq1KMTmIo1fb15iQpBv8g9WynKCpZB?=
 =?us-ascii?Q?/nKMXW8Ln1CQ9LcDWWcyi2SNFqwY8YI7vLgZUM0S22hwEwFuRlu7JP65Za6U?=
 =?us-ascii?Q?d0gI8RlNvgS61oUKKJQ0pqzL5Sqht3oonJjwoT61gzUnOp+aZqhecZ+OYO1F?=
 =?us-ascii?Q?89EkO4B7ScbZ0dvVHUPK7u9SSW/y00+fl9MDxr90WWpRQQiOARKw0AGjt9F2?=
 =?us-ascii?Q?vW1nLb2JH9bF4yN8CMlAHmXatiZ3hY2Yq651lQHRs5ptO/s7bqy8jc3bLtH3?=
 =?us-ascii?Q?hbSQ1lS1kvpx/nduVERTaLnIDYCG1nf+Yziz+0hcIfIxK4votnBbqyOW2GO6?=
 =?us-ascii?Q?MUtW92KBzs4+SHmL1SoI0PaJbP3BvWcGbuIRTR403YJd+tSuD+8phMjaRF+Y?=
 =?us-ascii?Q?JIJQz8pKQuQeL0WIYOoCOchsDMo+xVAJgb7vG7LuPajgy2zW38iIuewxzs+0?=
 =?us-ascii?Q?BqE2WTuN8y1CdVdqHkj1+gvnaI6VZX6OxXl/v5p9HO+e4CbLMesCu6v+m5Mt?=
 =?us-ascii?Q?PahnDNGA6odjP7q2xaTlmUhur6i9j7fF6upJexF8yXB9T7c4x8X3D7WgJd2z?=
 =?us-ascii?Q?aEeZcXqT6I4suAhC6cZWX43wIFVzArBOgEBes9+kUpT3TQSZs0SoaxsglbC8?=
 =?us-ascii?Q?EHoBBVP0xLkvGyW2EOh0keUnzgL9bOGfrzOnMIH5ZLP1aHH24XfKey2DKZCA?=
 =?us-ascii?Q?QxsuLCPtZm929vf6eQ4cNIKqCVA+n5wV9AAoNfh5dAxdC1+SQWRdaS+loWEI?=
 =?us-ascii?Q?yasvFRcae1lQN16DO5UpKpOs0fcor+YjZOf4t5cBVqnRa1z9tG2zdmOU6zqg?=
 =?us-ascii?Q?Xqk/e7yJgfSn2oGsST7XrlOgapiJ9DBO1fHcTtrgLAhdUY8syjewto7rm0Ga?=
 =?us-ascii?Q?YbVVmsTsvb5yND3UyQiIW/ypErkBALzcvQCNRxulsLSQdgKjbFta+M7gmYUd?=
 =?us-ascii?Q?nQo26FhWda1exd20FkMYJp3JovSYFGD8ChaPp5+HRFzpUMJbNG1bFdKvLz2Y?=
 =?us-ascii?Q?txVePubRlfifnvzaWS/jZLXS654htXJV9/act4EnjjW9UX0U926m8Z5AqGOB?=
 =?us-ascii?Q?VNxZFTbdWH+zf1qQ0SUn5s0howDZI4Q=3D?=
X-Exchange-RoutingPolicyChecked: Y4JJPC8ZfeTot6wPZmCqg+XBzrXx3Ufd6U3iZ7CJJtoD6h2PGmTDD+xaA7xZ/Xk/+5GnFjet+ygI1ZPrEm+DRc/DhtxtuuKH4MDzLRDHwygd7sEKciifC526Om/MX1q0KA3PKkwt+9nSakSvcUOQwDB8FD+roSUHvK0Neo/d3pWP403NfwW2m/+Mcgy5SwhjKLDkV2Nzsitx4GfMhfb4htqwJBOO6KTsN2Su4QNsM53DBKZHkuf2tB6wkBCcCYg4+iourB0LwFtm5pxRpss8GnX8asDFoNNQJGVGRFFwtPSaWI2hsTOEiC83n8KsPKV/1Q+rWMAeN7+z1NbShICwow==
X-MS-Exchange-CrossTenant-Network-Message-Id: 67a73b00-201a-48ae-3017-08de903e29df
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 22:29:39.9701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y1Yaz9Z/3xnFA4/6F3LL2r0Wo/aOgywSIrQtCr1ayLkQXwazwi4nHQ5Zfcrld1/Qhod+CFK5ObxGQNHJFyUbAzsxHHgzPie83/OhHAT5ADw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5869
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

On Wed, Apr 01, 2026 at 02:26:36PM -0700, Xin Wang wrote:
> Improve the readability of the info debugfs output by replacing
> raw numeric engine masks with human-readable engine and class
> names.
> 
> Also print per-GT engine capability data in a form that is easier
> to inspect manually and simpler for userspace tests to consume.
> 
> This avoids requiring userspace to duplicate kernel mask decoding

Minor nitpick:  usually when people refer to "userspace" in commit
messages and such, they're referring to "real" userspace, not manual
inspection of debugfs (via 'cat'), and not the artificial tests of the
kernel itself (IGT) that are snooping on internal details specifically
for test coverage purposes.  I worry that using "userspace" like this
might convey the wrong impression that we consider it valid for actual
userspace software to consume the contents of debugfs, which isn't what
we want.

I'd reword the commit message here to just say that it makes it easier
for a human to interpret the data (which is really the primary purpose
of this debugfs interface in general), and as a side effect it makes it
easier for IGT tests to use to ensure appropriate test coverage of the
kernel's uapi.

> logic when validating engine capabilities.
> 
> Signed-off-by: Xin Wang <x.wang@intel.com>
> Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c | 38 +++++++++++++++++++++++++++++----
>  1 file changed, 34 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 844cfafe1ec7..9986a0310c36 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -15,9 +15,11 @@
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_force_wake.h"
> +#include "xe_gt.h"
>  #include "xe_gt_debugfs.h"
>  #include "xe_gt_printk.h"
>  #include "xe_guc_ads.h"
> +#include "xe_hw_engine.h"
>  #include "xe_mmio.h"
>  #include "xe_pm.h"
>  #include "xe_psmi.h"
> @@ -61,6 +63,34 @@ static struct xe_device *node_to_xe(struct drm_info_node *node)
>  	return to_xe_device(node->minor->dev);
>  }
>  
> +static void print_engine_class_mask(struct drm_printer *p, u8 mask)
> +{
> +	if (mask) {
> +		for (enum xe_engine_class ec = 0; ec < XE_ENGINE_CLASS_MAX; ec++) {
> +			if (mask & BIT(ec))
> +				drm_printf(p, " %s", xe_hw_engine_class_to_str(ec));
> +		}
> +	} else {
> +		drm_printf(p, " none");
> +	}

Another minor nitpick:  when possible it's nice to minimize indentation
levels since it makes the code easier to read.  In this case it be
simpler to do something like

        if (!mask) {
                drm_printf(p, " none\n");
                return;
        }

        for (...) {

        }

Same for the function below.


Aside from the nitpicks, the overall change looks good so,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


> +	drm_printf(p, "\n");
> +}
> +
> +static void print_engine_mask(struct drm_printer *p, struct xe_gt *gt, u64 mask)
> +{
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +
> +	if (mask) {
> +		for_each_hw_engine(hwe, gt, id)
> +			if (mask & BIT_ULL(id))
> +				drm_printf(p, " %s", hwe->name);
> +	} else {
> +		drm_printf(p, " none");
> +	}
> +	drm_printf(p, "\n");
> +}
> +
>  static int info(struct seq_file *m, void *data)
>  {
>  	struct xe_device *xe = node_to_xe(m->private);
> @@ -91,10 +121,10 @@ static int info(struct seq_file *m, void *data)
>  	for_each_gt(gt, xe, id) {
>  		drm_printf(&p, "gt%d force wake %d\n", id,
>  			   xe_force_wake_ref(gt_to_fw(gt), XE_FW_GT));
> -		drm_printf(&p, "gt%d engine_mask 0x%llx\n", id,
> -			   gt->info.engine_mask);
> -		drm_printf(&p, "gt%d multi_queue_engine_class_mask 0x%x\n", id,
> -			   gt->info.multi_queue_engine_class_mask);
> +		drm_printf(&p, "gt%d engines", id);
> +		print_engine_mask(&p, gt, gt->info.engine_mask);
> +		drm_printf(&p, "gt%d multi_queue_engine_classes", id);
> +		print_engine_class_mask(&p, gt->info.multi_queue_engine_class_mask);
>  	}
>  
>  	return 0;
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
