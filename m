Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B07C77B7A
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 16:41:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA13410E57A;
	Thu,  1 Jun 2023 16:41:36 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6433F10E57A
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 16:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685637695; x=1717173695;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vfyeiSwBkV2VR4R0qLBPNYP3kzxyTnAPQZh9OdOglQQ=;
 b=e72pw5r5wkb6iP8taOlYAr0jCJmEUb6c03zD5s5FqikldS8VWKpvLvrx
 kU/4Fg+lJ27NVBB67Mb0YBNwnAe2GZ6tbN/Bst7QeSbt+0oz26a084WB/
 PqOg/k1U2GKotyl55VAm/ZoR3R/ihKaNTzzurVXz7Vzl20NYbnJuGGR65
 HLDiMfs6mvENJxVSRO/AM2zCX+0axbtJ+Gm2kPJRKn5782g09O/MSCmDd
 tZwAfZfuvDMalzLQ1a3bFw5LxktVsSrS9rrSSIMqcNJV5MbQMxUU6hFPZ
 07aN+pGCBzoV4aghUagb1MKIRttRT0zPCy5+1Y8npqK0adf7w7QR+ubTx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="358036351"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="358036351"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 09:41:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="701618070"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="701618070"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP; 01 Jun 2023 09:41:17 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 09:41:17 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 1 Jun 2023 09:41:17 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 1 Jun 2023 09:41:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AfKxzh4cBIOjAO+IdpkKsoJfIyylKAoII0Mcft+V7zin/aJjyQ4J8NKunaciDbNSuKCj+UOr/xu7IsokvFYoJ8XBk8kfRCs5o/wub67TOQZlTKWvH6JnuTBjsoOvPttyKZBoIuo73aKa/4on0b87RFQEWQQx2ttQNk7xiy1hJBUmlGff4t+cZeDNqpEfGDW/eJGD5Wbq7T7Nc/ktcFAMCo6Z42iIDyzRvBUM0OqWIS6O7x+lYF/xNbdSvmKlCVxUWUVb3Guv0O5fj0kn+VtVoku5DkjwKpM72qJmJkx7hnA1hjs4p+FPJulM/bpG/S+4f+aFOHVuA6adOr2ZAl5Trg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6IeueFbpQFXAlkHsQ+nBznOLDUJXDJeU8psIrzNc2OU=;
 b=CVU1/dL5ajmb/LKm/tDJSXaSmkMqjRGesVVrW0eKkyXhdfJ49cEPRMO2xYqnA+LYhdbe0QCmenfo9FCDELp93BvVlnqOMA3Nh3qbdl0Iu0GTUfN+DyK6ym2s3b72OwH4VnsiPErNtIXO0qYXqMOJftnDK/HwlVjc1zVf3gRYGvYq6D5fV+5SGNFegtvt5gsSUWS47Qtot86PyzgxXa8TKkzZAGSlzFzn+v6OOCrYNMB+OprGh9dA/WtW4e4eh2Mhqcl42RcVa5KcoMPCkG7sX1gxN/GSgWKfzYR+PFUOHKSkL6a4wCGswGlUcPBEr+4vnoPKdGIXzexnp2k6GXwCjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SJ0PR11MB5600.namprd11.prod.outlook.com (2603:10b6:a03:3ab::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Thu, 1 Jun
 2023 16:41:09 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%3]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 16:41:09 +0000
Date: Thu, 1 Jun 2023 09:41:06 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230601164106.GJ6953@mdroper-desk1.amr.corp.intel.com>
References: <20230525161643.7-1-francois.dugast@intel.com>
 <jxctfqc4627xgu3nxumherp724kyqiz6iqhtxkrbp3ibtagpjn@mqeyghmdhwvf>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <jxctfqc4627xgu3nxumherp724kyqiz6iqhtxkrbp3ibtagpjn@mqeyghmdhwvf>
X-ClientProxiedBy: BY5PR17CA0038.namprd17.prod.outlook.com
 (2603:10b6:a03:167::15) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SJ0PR11MB5600:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a9dad8b-0808-495f-5647-08db62bf0090
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C9rIPp/rAzPmFi4OFu5xIBMqCetlU62IVfJBHt73pVKkEbUiT9Uv+AM3anwYKhI2xmKo+ZO0bcJ3amvex4gHmQRaOlw//EngpW8xOa38+CfHls0gjtTxD17hu6U4SkHyT2xGMXXvmLnV7NGa8jmS1zBW35Bapg72WeZAygPauNieQ7nf5pwcnEepnXH1a4RJZd95amam9kcDeOH7bEtpabteH6D4AkplKTRC/C10C7YYrXs51y9AAK3gc+v5o02m8SvCN6LRGW3L/sdgHBq4ALZoHnx+6AsTN+ckpdN+bZ5NU4+ukQ2nsoY+W0D2fLe10/uXkH8bknkUChHhrNMEoGlMn/BMd6GB3aRcWWl6zsFPuK2PRHd6AgGwGZheowGxBOuEJ2FTB0uLysLXmCCWX2tbd82bVZ4n2YbS5PKlIWkj1SMTlpD8a/bBhGxjdX35K7T8JQqO/2Ra9fuos7HZwnqb5JX0RrVd2D28Ozbb7xtWfaTdufS9h61NJ5WFXfAt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(346002)(136003)(396003)(366004)(451199021)(41300700001)(2906002)(6862004)(66556008)(66476007)(66946007)(5660300002)(4326008)(6636002)(316002)(8676002)(8936002)(6486002)(1076003)(966005)(6666004)(478600001)(26005)(6512007)(186003)(83380400001)(33656002)(82960400001)(86362001)(6506007)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5UwFc01p6i7WjiNab/yVK54VpBtEtT+0Vqc74EPpPuDnNL9C3zB7IXpA9sG6?=
 =?us-ascii?Q?jQ1szhLwko2Jtn5lXwkq0KraoPNW6VDB34JQ1OxG0CIIgcwAyrkNCXCpqUud?=
 =?us-ascii?Q?65slRAj9/Lh1+EC1L6GG9axtZOwN+wd4N2EC4uHxPwesQ5+GWAI7gblrhQtE?=
 =?us-ascii?Q?7nuS5HIxp25PHOyqVxRIqEgyUizefwkvzBVUBIxNwONmPz7a0rziK4U70EaK?=
 =?us-ascii?Q?VwKDOwEId4xjvw987tXB2/pUU7cVEhzVzNKPy+4bZ36V9p5SFjCQgCqqZoR6?=
 =?us-ascii?Q?8PehGpJcm2ffNLlgD4KWMurq3XJn6OOVSwkwigWQ4a48BSYh+IVsiZoqvZuz?=
 =?us-ascii?Q?1tMmTk0ZOtqITZ8TR2KS6TjpF6p7W2fS9Ml0D2XBT+EZgpHdIGaaHCovqNm2?=
 =?us-ascii?Q?Ba6k9uT5XLJIwuq4E0Djp7U2r8Z2G51yZUVTlhsMN8LG1CQQPcVGYQce4X2+?=
 =?us-ascii?Q?x6C/a03FE/2s8cOac3/ziKPMqdNFaX2TmOKJcZ/nxkp2sNTN9i0RGvDq5WO1?=
 =?us-ascii?Q?6tIeRItoO2vy0Uf4KdK7LSfbwetN09elhjUJplVChBW6tdQ4edHXMvbHs1sg?=
 =?us-ascii?Q?KhHql1Wnf4zNtfGAMF8ow5M4hE38ZNqhe/PkYcnDf/NBADvlSm34Mc15FQwe?=
 =?us-ascii?Q?2eCFcM/wkDSD5YXHaqc404dCSLNy2D91lss1KEuPWqUmneORZ02d9mxhy9/C?=
 =?us-ascii?Q?P49UhiZGxwrhHXf8CRAQ1ZqUR+a3q05hqiUZ3G+NPdtvhB4X/5IsvNc9Gkey?=
 =?us-ascii?Q?83HbsRRM//FXPCc6d68DGatFq9Gnve1hOn5+3bYh8ySBH86Z3JtCcP527OgI?=
 =?us-ascii?Q?ffKQ8cKwhsTkMIWSKhk5UfjyYktKd/TzFYBPXzkU9QMNsGLM2WqTsU1ylCRu?=
 =?us-ascii?Q?7Ka2v/P2GB2hZZi4UUiv7v4JhQTkbX8KwJV2yIPtnroSE6REBLnOV53e42rA?=
 =?us-ascii?Q?CYLClf+IPOyvL/ikY0qEpsK1Scfe1jwNm6Ze/wPczMPv6L4pURuE3CjdPcGO?=
 =?us-ascii?Q?JPg8UxsYgzGWfPEpmpt9DtNx4cPTw4ty7NDeJ7BR7jpUrsO0Z2icYZwIlR2X?=
 =?us-ascii?Q?5MEsoCJgQprSe8toi+kqPAzUzoe8+kBXBDo6iiha3X2Gzt6CCPEK/eY7mQJV?=
 =?us-ascii?Q?euTE/9WDDBjM4hi0E8wePx6+7pTv4T0VRglJMcHtMCNTj+NMpEFX7ZfXnBpy?=
 =?us-ascii?Q?J3egSIMitT5I9IJflQKtf7WbhCLUveaTcS7Co8Ep9uy6rLmvWGBnTh+TWqE0?=
 =?us-ascii?Q?tMulCoJ76BDo2KfRFlbPxf8DNiEtsP3HbeyekdhPhlA+iASu8+tsymZ3vSLS?=
 =?us-ascii?Q?LN4J3CX2dlqUIQjHwH3+6iCmp0IDm+CaaiU4NUaggb5LXle3d0UjRIXQHCbf?=
 =?us-ascii?Q?ZwFmH54VZ0jfJisfndwHac2cxRWb8Rght3VC8VCYrFBL99VQg9v1T87HSNI+?=
 =?us-ascii?Q?MrfZrRPIAYpqQULgPksntYYHf5l/6qgI/zWOlp9c+86YfUm8/Sp/XxGjO8fw?=
 =?us-ascii?Q?o9IGC8Bf6x8++vuZfO30U2gsTKUgH/sNsSGkeNGnhw5+1dFzzPlqUfyKV1pn?=
 =?us-ascii?Q?2d6VDt3gZm0TwlDFKLHEKfvYAZIwJH8YsTsLhr3ZcD+giloD4K7OuXPMz+p5?=
 =?us-ascii?Q?dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a9dad8b-0808-495f-5647-08db62bf0090
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 16:41:09.3131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kNGxKgfOddRWwWAzlhGhwXfVRUWaXIJzScV7MFct7vs4yFl+z78bwWGnXyfYgBvl68SqnmJJBvWzcIx+EoXifMMrfrXg+S7tKenWNuJDRPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5600
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Prevent flooding the kernel log with
 XE_IOCTL_ERR
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

On Wed, May 31, 2023 at 09:45:07AM -0700, Lucas De Marchi wrote:
> On Thu, May 25, 2023 at 04:16:43PM +0000, Francois Dugast wrote:
> > Lower log level of XE_IOCTL_ERR macro to debug in order to prevent
> > flooding kernel log. Rely on drm_dbg macro output which includes
> > function name, so removing file and name macros.
> > 
> > Reported-by: Oded Gabbay <ogabbay@kernel.org>
> > Link: https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.html
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_macros.h | 6 +++---
> > 1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
> > index 0d24c124d202..2b8a46ffb93e 100644
> > --- a/drivers/gpu/drm/xe/xe_macros.h
> > +++ b/drivers/gpu/drm/xe/xe_macros.h
> > @@ -13,8 +13,8 @@
> > #define XE_BUG_ON BUG_ON
> > 
> > #define XE_IOCTL_ERR(xe, cond) \
> 
> 		   ^^^
> 
> > -	((cond) && (drm_info(&(xe)->drm, \
> > -			    "Ioctl argument check failed at %s:%d: %s", \
> > -			    __FILE__, __LINE__, #cond), 1))
> > +	((cond) && (drm_dbg(&(xe)->drm, \
> 
> 			^^^
> 
> now you have a mismatch.
> 
> From a quick look we already have
> several places with mixed usage. See e.g. engine_set_timeslice(),
> engine_set_preemption_timeout(), engine_set_priority(). There are also a
> few places that will log on ENOMEM, which should not be there, but is
> not caught by checkpatch since it's obfuscated in the macro (see
> scripts/checkpatch.pl - "# check for unnecessary "Out of Memory"
> messages")
> 
> Can we get away simply removing it?  retsnoop is a thing nowadays and to
> understand where the error is coming from, userspace could simply run it
> on the side... something like
> 
> 	# ./retsnoop -e '*sys_ioctl' -a ':drivers/gpu/drm/xe/*.c'
> 
> which returns more useful things if the error is farther down the
> call stack.

That requires manual execution though...I think there's still value in
having debug-level messages for failures like these so that we get
meaningful CI logs when something goes wrong.  It's not always quick or
easy to grab a suitable machine to reproduce a CI-reported failure
locally with retsnoop.


Matt

> 
> Lucas De Marchi
> 
> > +			    "Ioctl argument check failed: %s", \
> > +			    #cond), 1))
> > 
> > #endif
> > -- 
> > 2.34.1
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
