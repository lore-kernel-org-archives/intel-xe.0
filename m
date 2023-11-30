Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87070C4167B
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 00:04:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5398E10E387;
	Thu, 30 Nov 2023 00:04:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5345E10E387
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 00:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701302662; x=1732838662;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DQ2AEdEX+/HVDd+XIMF8qgj2TKXAyyjv2NMPyUSgHVU=;
 b=ZAg9X/CXsqqJgaRcQBgugLo7BZBl88BS5tJEkCHMx+aB0DpG3LlvBld6
 bhESwHBmgEOf3fdSyM/i3l4Q5aJZNbPfrEvqRFnvz5wx6yeh1MzCY8qsB
 agggfYISu1+plKWVz6YiZey1ZCMDUAb/vGESUaQhnOCXOliNLPjmFYTYy
 4Dp5xhOBwtyIOhWJcmIhyqtTlUX3UcFOHVgsTdo++xJZZeP98qp0P3KK0
 X1DLqH/skzCUVCTs9QOUWiVxNAPOVupJFCwbyeyPSf0+TbCNfVYxmbw07
 e83Hda4Px7q+CVAIU9DDTPMkG5fdaVgiuv40jovnQMdYufOpjYMpBU7uY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="111460"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="111460"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 16:04:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="772860056"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="772860056"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 16:04:20 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 16:04:19 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 16:04:19 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 16:04:19 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 16:04:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=is8754Zy9+uigETnf3X9tcCKlLFIvBPPk+hwoiAvsNFq1ya6KbuWAmjP0czhkeT9jXsZFLAzssgxMCa/H+X9XrnSp+qW1PzET0Y8L5brqk7counZuzSiiN9iG6HbRpLHhvBnjitSDN4uQlJbDY8ain5oYM72Ip4JPs2/D3JXjnEVZgdYYUV9Zhmz1EA8L0DhvxxzZt0+4uoBw+VemBVRv6MmRgzU1EDi1O6ynTzHchYeL7/tB8uiBooMYl0gCbJScRKZgVVu2mvOpxC7/21k2HquAKKUI5znocf6UcRsiEhlwV2Q5+Jjx/r5nDcbgjmH7qdHGYXYEQyszbbdKhG3pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oyxaUKERmQiZipiBY8k9jH3VGehU6iZvRwOQSlTvBN8=;
 b=GJU3664OOvBqy8ilcX+7FQQpjyhcXFwkQZrIFp3wJyxU2zXMD/7PYlh32Jde7d+qZ7U8sv4ygTLOlGwQsZylXJbikEMIO89eWV0JrDOX+CVlciH3Qdj0SIwR2lJHpSfbf6Gns4wILebe7aGuRTnEmwLjqdzX3KyZJ0u8+8abIgEM2EHofjM/8e+woziRZGyjk2KQLKRWFpVwEf/AWZUHNATk4VH4kySkWiuzrnVTi2SLjdTpL7Rl21Y/QUUPki+8HZ0aTDh6qb9ftnAy/eLmsTQrvauJU/KWx6QIH2xAxixsoZy+RoqfehmrjI4njencJtfi1v+zwc16eYfbsbxCFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB6760.namprd11.prod.outlook.com (2603:10b6:806:25f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28; Thu, 30 Nov
 2023 00:04:17 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7025.022; Thu, 30 Nov 2023
 00:04:16 +0000
Date: Wed, 29 Nov 2023 16:04:14 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20231130000410.GR5757@mdroper-desk1.amr.corp.intel.com>
References: <20231129232807.1499826-1-lucas.demarchi@intel.com>
 <20231129232807.1499826-6-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231129232807.1499826-6-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR06CA0034.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::47) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB6760:EE_
X-MS-Office365-Filtering-Correlation-Id: 1285afce-dc56-4d5e-5ac6-08dbf137e4a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K4Srfome8xj/ALYGdEwQjsglZOcDAiGpVP00A7RXp6nD6amIOFjKu9wRRvgLJn7x2jlqtpCueEpGxdkpRPZtccAOfBdLtxjhkPqVTIQ1+NKOUv5n2D55E2FC2jXvgEN3ykdOAO/5CaXlqBwvGmG6CR0yYiCT4A0BuWefjeJDKVUXaSVtatpM+kCIDjh9+QFTdhsEbhHzVayRLHs2fnR7slFB435l2eo/HPzmhxSO37p/QYkFYgNkMbsEM8vf5eEUWiR/zt6UZmRR+GedIpGlFbfgYh+tmgQzrubGbSCmsN9pi5cLwV+gdvlqk9xMRjFKn6GW/3IfdMp+s2zDF0ot/cshM44XLhjmXJirOrLlOVwToA1GmfbVBU3JuaqgEqwgtw+xavWFhm1Sl4+Z/4vXFCzgNaW6mcpGFeZzq08f+GGaGaQ4yzy3u5wl/bT7sUcyJHUu2MLlVrhD6cXTTCWNXNMoula2ToQO+YZfHIQJVp0PSiTGK67nR/9eqsIYttbRlvRGFvwD+L1ggCBl0uC8UtguyfMfYU8vhZnXsUnUOsyJ+2ZrNQHpXArqOvEcK/IoU+HF3z4nM/FHQSFy1FKBHfnTV7TOac00U9Bu/C905sSILhJ4Yoc1vslkJ1XeaM/U
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(396003)(366004)(136003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(41300700001)(33656002)(86362001)(38100700002)(1076003)(83380400001)(5660300002)(82960400001)(107886003)(26005)(202311291699003)(6512007)(6506007)(2906002)(4326008)(8676002)(8936002)(6862004)(478600001)(6486002)(6636002)(66946007)(66476007)(66556008)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zsH8JW9Gd4M6mdNns+FSOye5O+lo3HL+j2D+r3/Mg9joRNs1NvZGANSWbEgl?=
 =?us-ascii?Q?+Qt9XBmD9P375fVDRCi0jFRx3cAaqpVSpBxhiwoIqI1JDSWs/jZXUoislhLD?=
 =?us-ascii?Q?tasn6ee76HkOfWNnKMeInID9ri9FBw4AY0DQolDfQTOeGQDh8B5ijyj6mCTa?=
 =?us-ascii?Q?KXLig6aWLXsImXyynnYGKFPD5kbk5Rq7t4gh7k4EtfdRW1Jd3cXjeA55+yYn?=
 =?us-ascii?Q?CFM2F+HYUJ7QH2KSFib70EbKTLLsXxRbFwJF4MGdi9s6Dyi2zvaR/QO1GgEn?=
 =?us-ascii?Q?T98JLGRfTF3QWLLm/jdEoyjYiHX87nWVGy6uqQnIibVbzO333vuH8nbLz9hE?=
 =?us-ascii?Q?vqaFxK3Eiql8v581vRubgBwm7oOxK6YevC6wEawN+aVK1xwm1SCCdnv/+z4W?=
 =?us-ascii?Q?s3ut5qKrLYhzrCcGcfRqAJhissE5l/HCUquCoXUJnDSx8NlksIOCW7heCSE/?=
 =?us-ascii?Q?p2xrwsEHgI70Npj+VSmZrHZnaHt4p8mzZlR+GSdm/GUC2AGB8CkOfzttttu/?=
 =?us-ascii?Q?xwxi09t5IOMchF5iFvT1tQC8anRwI6nJ6WbmBa4oEMUO7uTaQofFzenwe+Ey?=
 =?us-ascii?Q?cFh0g2EBlHt3oHx/Y614zCx3UE+li7tmGD892/pN9LvTSdbkQRZnXz+JY0Bq?=
 =?us-ascii?Q?eQBCK/wy9Xo6bHTkxuzFQlCt+5Ke+meWPNPiGGfnxxKvx/o9pBga03SBMdrk?=
 =?us-ascii?Q?JJ0OPhoJHMN6jmhJ4iRelUUByQ7DeQOZUpthyUfC+bINECe83RqsZNL9rXZz?=
 =?us-ascii?Q?yOsAZz/zX/7JaDT76xqcwq77vKeFdBiPplzSYcInFUxiXjVLmqASTFEZaU97?=
 =?us-ascii?Q?bfyWN4ljHkNJRf4W5YuxQyNiRwZ7tQ/twURDP6WB9iI6hnl590YBrZG/NqM/?=
 =?us-ascii?Q?e03bz45LFH1eGDSIr8g404eLTMCB9meuIjd5lgWtf6f9bHiJYiH3is4iW31a?=
 =?us-ascii?Q?PCGAUFuwVCLZjpiMV2eFOUB+XDWRsZfeDPTNlw6qhhTItxWdECJqhBscy2oF?=
 =?us-ascii?Q?bqE+f1n2IyLYZgPV2A6/4gEQL4SaAQrD0PRf3MSRyvvC0k6Qnl7Aa8ZcxSmp?=
 =?us-ascii?Q?hb7raS7/OfSVOyky/nnO8CymDauko+bmq7dk3OxHtTajVu7YU9FpMytGmzGJ?=
 =?us-ascii?Q?KTowIvSKeMffKrWghsQowozvzaJca6rl17hxCytux0cBpMDiMIK7GNNnsSTi?=
 =?us-ascii?Q?TH4bwon+0v6Zui1COzURteAXPDqtfGjf0MXyGBbzn4BMfcJoBrwvDsnzlcBr?=
 =?us-ascii?Q?VMjyH48bf1nu1TtSNve5kd+d6e+IyTyOhSVRsL7ywfsBjY1MtwMkaHM8Em10?=
 =?us-ascii?Q?MG+QD9CYrInX2ZVoTFP3BPZaQtF3bA43IC2UHr0pMglX2TSknKNi+/h1JBGj?=
 =?us-ascii?Q?ORIshIH5uvbgTbw5LYmW883oUNv74yLtvEDJ3z7F26Q9U/N8gmJU7ZNcMC+B?=
 =?us-ascii?Q?v9MgxCoBDeRPDx56Ov4+WNffxZ1VWYOZd4Kvfm+rsbO0suxpIKicYqxQXBHz?=
 =?us-ascii?Q?NeX+0qu77BrPREuwG2HFnf0c6gSchdScyc/NN1axgluBnwNk11quGhK3etxV?=
 =?us-ascii?Q?3uC3ilNhU33OkvAMbxooDk95hgUBhV2zXmMOSecdVDI6+J2yb/i6luxIIhz4?=
 =?us-ascii?Q?jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1285afce-dc56-4d5e-5ac6-08dbf137e4a1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 00:04:16.5621 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aiyH26ZBM4Jfm0JTo6DoIiUC/+pB11geuUyIC3ONfJSkkZXId2pUJSRL/fMArFBZNNzsZUqm/y+CA51TOkenYh44aeIaRzJzf2NeUxprvDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6760
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 5/5] drm/xe/kunit: Test WAs for MTL and LNL
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

On Wed, Nov 29, 2023 at 03:28:07PM -0800, Lucas De Marchi wrote:
> Now that the kunit infra has proper support for GMD_ID platforms, add a
> few variants of MTL and LNL.
> 
> v2: Remove bogus check for setting both media and graphics version in
>     test (Matt Roper)
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/tests/xe_wa_test.c | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
> index 045afae43891..a53c22a19582 100644
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
> @@ -78,6 +96,10 @@ static int xe_wa_test_init(struct kunit *test)
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
> @@ -95,7 +117,8 @@ static int xe_wa_test_init(struct kunit *test)
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
