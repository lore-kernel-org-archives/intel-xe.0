Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE99C072A2
	for <intel-xe@archiver.kernel.org>; Sat, 18 Nov 2023 00:31:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 852EC10E037;
	Sat, 18 Nov 2023 00:31:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED09510E037
 for <intel-xe@lists.freedesktop.org>; Sat, 18 Nov 2023 00:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700267517; x=1731803517;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0E2zp2v2PDfcfwP9c6mprJpBqh7+VfAugZu4whQCes4=;
 b=CCo4aO+2oG96eUPohggZ64CNvvBhQNrprwOfHZ8I/S+yesFumAViXtMV
 4FlgyaXLhJmts6uupe8cRsAbyfGMCxye9NLMz2lZxl8R5Z0uKUR59yuRS
 Xwn+/2np/8orUAOdWzD4BZ5bdpk1x9lFGKvJVwdetLQ01UhXf8D/G69ol
 hChTTz8UNoRvAPF0yYKtR3/lbE5bgWvrLfFPqp57leHTYD9YV9wY0sU6f
 PDzhRlZ1f6d0sjHaPDyBfhOoPO95aRx1ozvvT63adgIabP+M+M972JgJC
 SI6x39lBOYYJz2jm3N2p8dzH14UFkKtL3wqCpeWFN3aC98NVzJpn2g+/M w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="4475481"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="4475481"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 16:31:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="1097251194"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="1097251194"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Nov 2023 16:31:55 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 16:31:55 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 16:31:54 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 17 Nov 2023 16:31:54 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 17 Nov 2023 16:31:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V3YzT8gWHTNxPhRRKwHI+CJ6gJ0PmxfoCm25dNRr/vjoba9dCNDEIjgPcvTWaZtsLC3+kGAYfXA2qZcirz08y8EMkPA6N18HM3ml/fa3JlLsKIezOWA7ZAjGnbF5L2/cT7NE2gVk/GMDX2KvPJMppdNqQj9xV6xtDAoatbjUeB9XRzYcyUovQ1dZYTUOqbAuCsvOmiYBSFXwAEPd/J9KBw0BXVesbOA0F4rrbDvb/RZWi5YSWOz96PH1mwgUZe5SmyasreO3w6+t+nqr9Onsc+fBclKyMxBGfxXBKqSqIwTeLsH0qFl+8VvuY2ldStXW1A0HZ9Xak/g6/fu+Et4mvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DRygvkzS2d9lyDcbQuUqleaHenHJ8+sh0rrgNw2tUKE=;
 b=IFSmudYTBxe+iedbk/+230kYTiZfKgepfJwaXKSx51vSCMhxOo7yeV5hgWgxk9hGH3PVCm1mOxwiDNldn6sbAmmH3cAXQf7x0qUf/o51IYkijh9CvcAa8F2ofsHghVzBigEHndvCy47kVrA0zy6CWkg//nglJiQfI0wIALVF2pRLyVVIUVzTViyzUHnIZXs0/rDK/eCq49kwsVTz9Qj1SEXKCc3GFiii+fKXkLVhGSFCY3tjPYXHEMFYIJ2MQ/4gzNYxQoQVO8WXYd8r5sbeAGEJQNLaCnU8trcSdyO08rf26mrkochF6U52wA4cBVGtDQfX5YQbd58IVtwIw64fQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB7421.namprd11.prod.outlook.com (2603:10b6:510:281::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.25; Sat, 18 Nov
 2023 00:31:43 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7002.025; Sat, 18 Nov 2023
 00:31:37 +0000
Date: Fri, 17 Nov 2023 16:31:35 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20231118003135.GF1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231117231411.631895-1-lucas.demarchi@intel.com>
 <20231117231411.631895-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231117231411.631895-4-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0116.namprd05.prod.outlook.com
 (2603:10b6:a03:334::31) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB7421:EE_
X-MS-Office365-Filtering-Correlation-Id: feefb697-fd4a-4186-8c3f-08dbe7cdb9fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w4aMKB4RVPiAWvwrWmS6z82jhXLRUCqY6lwoAZuxvv9DmzcJDmIhOzFJC9A2RSTRzNybwpcA2zZ24tfsd89RG/Lvm2DCXmg7GD2EASMZgstT8rI/EPTRSvj2U+QEspS0SHUjvT3Bgfsz+HhxfSSpaIYCZo4hCAn+tiX7vOq7SPgzeqZ/87pAt3n+W79/eIsP0Wn6eZX3XgqPBF2VGzvQ2IP+bK5gbGWs2JhI1NDa43pkazN1tPqVv5+TPo2fbVxV9vY8pdbxgKt5gmkkIDGRW5+9GiK0gXrFL1V4cJTNCSlflyM2K83ioKn6cCz+8KH+7jwQpn9fzuE+m/V4NP4Qc55ilAvnNQCGBQvq0tzQ8ByF9aNopMRMh63MWiOsJYaLv7duL0cg5MCQq40HUyRGbronbPDOjb4tjQYxsl4L6kcnQKuNofaxSLe2BFegkKv4+NrN4ilIYn9xR6Huc7UhPcL3d3W/t2mLWdVTc13DL/iwooOjJWdR6N4IJM3ecRJVWMueNmQakU7qceJH5rleshn0SXvqDaGj+SPAkNxhiVfFEzKN0PnfE3kbfd5/AIj4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(366004)(346002)(396003)(39860400002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(66946007)(66556008)(66476007)(2906002)(86362001)(8936002)(4326008)(6862004)(8676002)(38100700002)(82960400001)(6636002)(316002)(5660300002)(6486002)(83380400001)(478600001)(26005)(41300700001)(33656002)(1076003)(107886003)(6512007)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+pr5KSffHjAQu+yaSK9fYNEItxwiPkzvgPs+Z+TZ+dg8cmwhLaFTTGQgBZat?=
 =?us-ascii?Q?rfbHwaS8d5G4W6WKkSfSjhOBYIPk1l2fHOWVMW/6w2Ki2jz78eWHQdzERdX9?=
 =?us-ascii?Q?s7LUkK438EasZlY23cyjYpfFUdlKa8sYwCau+Rx8RleOrLRj9IdJFh/UPV+C?=
 =?us-ascii?Q?Oiu2Na2q6VrpJQy4Kym5yu2HfwtukHR8j+2hlwdie4HpQX4Yjf0hZMdv56wv?=
 =?us-ascii?Q?Iw+MyMtlzhkfEzKBq89Fn1aEP1wEEmopvgPzZUlWcnH9XsJL5yrvVaAtKxGA?=
 =?us-ascii?Q?QzH94e/AVvYSjujFN7oAbT3v+peeh3N8k/qfqQUsBaTo8oHqywo2pNi9oS4P?=
 =?us-ascii?Q?i5awxIDSXl63QJ8t6f15bIXAmS4C+I8ZvcbuKKUWNuB6SiEwCnyseqcy/X+Y?=
 =?us-ascii?Q?rbhkSDLuasu2ozWXs90g7Lwy19LrxFcXRkh/zZnpK4RW7mSAcmEvXwJ8oJBJ?=
 =?us-ascii?Q?udriJTMdpUAURSqBU5069NLhselY/TBjiEadRJ+u+/ScRRayssNSOeMovT5T?=
 =?us-ascii?Q?qxWbFQXwxh5ZYQI4UVXQUGg7rXiqfORai33+Yf9MaOLd6mOC5/8SCR8EEIfL?=
 =?us-ascii?Q?g5a0Dstufe3xT4v/GhxOMN94A0UJh/pCtjoO+8Shwyq0PVq1UQtRTiTLLJpw?=
 =?us-ascii?Q?rpY5T4F8qXkddoycptOW3XUjgQbn/dYPqI88P+io6wNPFIMZgvctSo+UcPQv?=
 =?us-ascii?Q?wSvnHWPixGbkMS6bWxRH5mz5ktgVYDUTfCgfSJrOPK6u9RS0rOlN2L2toBKP?=
 =?us-ascii?Q?QHTFr/7YaaDT/U7dgkx+7D8p20lVp+dFIh4h8qfJQPFXnyjTmmmLj224m2yW?=
 =?us-ascii?Q?o/kv1viqLIndKFavYxQPhWmoyq+y36RBUZRnZNVl+LcpK+YF88fxIG2YT+on?=
 =?us-ascii?Q?M6+m46CCb2ykm4vlRMu3DajZOuTl8ejIJti8Pn8gOYGxq7wfnrdta9+8BKbv?=
 =?us-ascii?Q?kF2HZfsn/nSDdI6BytfPNqP8iQvXll35vPtCVZy+2eQXB2eUOiclXcwgGSpV?=
 =?us-ascii?Q?TxvW9f+5XSuSd2ropyiyq9FccRSa2nUvSHBtLRqtTCe6jIwVmIvbpRG7m6NF?=
 =?us-ascii?Q?wxXV9o8fBjR8AzibCXCUe6WLCNtOdqOO7Q2hrqFH2Yx7T2ewAvKEsfyvlhuw?=
 =?us-ascii?Q?RO6TrmkVTRCsoMyYgHQPG06TLUqaHVU5nP0avAQ1kqw9wPlUinAYsu7XOORi?=
 =?us-ascii?Q?vL25bGkfA0oRHk/vXpgAAr7nN4oLwzpt96X1NE+6ZrLEqstMsIgJjq3jqNMB?=
 =?us-ascii?Q?rNmpBSy1ZPjJtumMdGYtYnB2GaN50AlJd41I9qM6taKsFu/VFF+bVjnq3aGA?=
 =?us-ascii?Q?gCMAOlLqffJwQYaS5IpTw5A6skyhrBbNelohg4/JuujhcHjuYMleFgoYfkPu?=
 =?us-ascii?Q?rccGbeqS12A9dv9ZGadr77LAuJeEmdyn/PQmSil15lt3xIIuMWprDfWAgEdn?=
 =?us-ascii?Q?3cb+Rt+jf95dIUgp9AuRFMGGL+q5VyxX57PdSLkxpzEYL8e7G+UsrMJ0k2Ff?=
 =?us-ascii?Q?1uJ/gzY5DWsqGlJrn2T/3xl/4OmhYUc0irA/eQogZkVM7e9Rl1uO16C6asxa?=
 =?us-ascii?Q?qj+rFXWWjnfzjnvChsCkRXhS/bjnggeIDCm+moAqVZn9+T2+RfTd5PwkCKOO?=
 =?us-ascii?Q?3w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: feefb697-fd4a-4186-8c3f-08dbe7cdb9fb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2023 00:31:37.9056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GCX3ZUlRtXbpvRiH5nrEr4nV9QvDOPCCu9Pdt0mnFy+B3AoRSwT9l7XUyhAbPcHjY3ktSbp2YYAgCcQSkFcddgm+8bquHsCMgaQ3lEz5zUs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7421
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe/kunit: Test WAs for MTL and LNL
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
Cc: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Nov 17, 2023 at 03:14:11PM -0800, Lucas De Marchi wrote:
> Now that the kunit infra has proper support for GMD_ID platforms, add a
> few variants of MTL and LNL.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_wa_test.c | 34 ++++++++++++++++++++++++++-
>  1 file changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
> index 9185e520af58..458ad725802d 100644
> --- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
> @@ -18,6 +18,8 @@ struct platform_test_case {
>  	const char *name;
>  	enum xe_platform platform;
>  	enum xe_subplatform subplatform;
> +	u32 graphics_verx100;
> +	u32 media_verx100;
>  	struct xe_step_info step;
>  };
>  
> @@ -38,6 +40,18 @@ struct platform_test_case {
>  		.step = { .graphics = STEP_ ## graphics_step__ }			\
>  	}
>  
> +#define GMDID_CASE(platform__, graphics_verx100__, graphics_step__,		\
> +		   media_verx100__, media_step__)				\
> +	{									\
> +		.name = #platform__ " (g:" #graphics_step__ ", m:" #media_step__ ")",\
> +		.platform = XE_ ## platform__,					\
> +		.subplatform = XE_SUBPLATFORM_NONE,				\
> +		.graphics_verx100 = graphics_verx100__,				\
> +		.media_verx100 = media_verx100__,				\
> +		.step = { .graphics = STEP_ ## graphics_step__,			\
> +			   .media = STEP_ ## media_step__ }			\
> +	}
> +
>  static const struct platform_test_case cases[] = {
>  	PLATFORM_CASE(TIGERLAKE, B0),
>  	PLATFORM_CASE(DG1, A0),
> @@ -63,6 +77,10 @@ static const struct platform_test_case cases[] = {
>  	PLATFORM_CASE(PVC, B0),
>  	PLATFORM_CASE(PVC, B1),
>  	PLATFORM_CASE(PVC, C0),
> +	GMDID_CASE(METEORLAKE, 1270, A0, 1300, A0),
> +	GMDID_CASE(METEORLAKE, 1271, A0, 1300, A0),
> +	GMDID_CASE(LUNARLAKE, 2004, A0, 2000, A0),
> +	GMDID_CASE(LUNARLAKE, 2004, B0, 2000, A0),
>  };
>  
>  static void platform_desc(const struct platform_test_case *t, char *desc)
> @@ -78,11 +96,24 @@ static int xe_wa_test_init(struct kunit *test)
>  	struct xe_pci_fake_data data = {
>  		.platform = param->platform,
>  		.subplatform = param->subplatform,
> +		.graphics_verx100 = param->graphics_verx100,
> +		.media_verx100 = param->media_verx100,
> +		.graphics_step = param->step.graphics,
> +		.media_step = param->step.media,
>  	};
>  	struct xe_device *xe;
>  	struct device *dev;
>  	int ret;
>  
> +	/*
> +	 * Make sure graphics/media version are only ever set together - only
> +	 * GMDID platforms should have that
> +	 */
> +	if (param->graphics_verx100) {
> +		KUNIT_ASSERT_TRUE(test, param->media_verx100);
> +		KUNIT_ASSERT_TRUE(test, param->step.media > STEP_NONE);
> +	}

This is true for now (MTL / LNL), but what if a future platform is like
PVC and doesn't have any media at all?

It seems like the opposite is more useful to test (if media version is
set, then make sure graphics is also set) since it seems less likely
that we'd have a "media only" platform with no graphics.


Matt

> +
>  	dev = drm_kunit_helper_alloc_device(test);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
>  
> @@ -95,7 +126,8 @@ static int xe_wa_test_init(struct kunit *test)
>  	ret = xe_pci_fake_device_init(xe);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
> -	xe->info.step = param->step;
> +	if (!param->graphics_verx100)
> +		xe->info.step = param->step;
>  
>  	/* TODO: init hw engines for engine/LRC WAs */
>  	xe->drm.dev = dev;
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
