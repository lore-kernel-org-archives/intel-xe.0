Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51887C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 23:54:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 002ED10E387;
	Wed, 29 Nov 2023 23:54:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B5B10E387
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 23:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701302079; x=1732838079;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7E8hwJGfsxBvol+RgksoJstfTgw0PmPY13mla9k7uUE=;
 b=L9Aa6j7iRr3Wg8d0UT9Q/8zpmJm3gcnoTa0k7rX1Q4VfxQoZA9Xh0J4o
 6J1z6xorzKbpsK7K8IRmQTUpdz76FPZwBPzQ1zsWsoWvqlSpCIhoKSXF0
 uVWE0ZW6VUns8H5Q+QAyWh2NgDASMfuIuUMSxXxyiOJUaBopUimevCBrE
 1bej7vkhrqUuiafiyr68ckMjKev8AL345/yr5+Lu3YDLF7+/z+oPLEkpw
 qS/3je1LvEsdWhsu72+9sd8xaedcfuXW/hdzZ6ziFk5JDvlrvzKKj4Ig9
 EzJ7h31thS7RggfC6ZWDSLx7nPC3Af+RVMTY/5cEDPcHLafb2rM53oo8W A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="390401530"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="390401530"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 15:54:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="10541890"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 15:54:38 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 15:54:37 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 15:54:37 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 15:54:37 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 15:54:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E32ZX78MafhjFPmOCnqfXrlcfThUAiCmR+sInHa955SedJEODvRNONTYHiu/aYxBHZaehbWuid/sxoPx/xPh7tj7UrpQopDEpAVAG1EzKEvZl39afsZM7V6Uzo1zzeY/NpzIuI+RgLl1cPJrx0swy6x+tdGhOULBfV1E74i/bF7syVVQL5JX/Op6uqkQDAnEvwDhY8FmMLlEnt+PNCGVnH34OqB3zHopnc88PDnBlqeWdrLUVe6nbcZH1dTbaaESSThPjr+mW/jRjRn0RiYFlXegcgxXGgJbIp2BMztmmWTTP6W/l0p4VFGnRpZ0qeHXIk3U7WCwG0eudqOWR95RWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sRWjdh8U95WvYTuIj/0F9NXZ7vaglBlFg9VW1ngcCLI=;
 b=UFDbom44doAIUe5yE9ezPkHmm8cG95e0YrIyy+plsd18z9PKx7NXDENG4eFx8K10Erux4W+XIFX7F3qgFIw3mUIu8UZLV8a/WKyfnDyfEsqvkmFITrDfKDBbUY3Ndo6WgmX7oH0c4UN6k9TLnOyoB4OMCj17Wlu5T+gDHNuSP0BDGHfhV/ccpAeXER2T0N51mm6i/wrYoWGsIg8XUwcox+NzyLWtXzHwh4CgmG7K9gdeWHBBZNLUoDV1sQn0BKwKSFq/9aosU6sdyMpcs1rxg8JCinrNSNU6wjcy4NKVustBmaiqjCmNKfJKhKhJdQXlytVTpq+/u1kJfvbAVPhQGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ2PR11MB8297.namprd11.prod.outlook.com (2603:10b6:a03:539::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Wed, 29 Nov
 2023 23:54:33 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 23:54:33 +0000
Date: Wed, 29 Nov 2023 15:54:31 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20231129235431.GP5757@mdroper-desk1.amr.corp.intel.com>
References: <20231129232807.1499826-1-lucas.demarchi@intel.com>
 <20231129232807.1499826-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231129232807.1499826-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0193.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::18) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ2PR11MB8297:EE_
X-MS-Office365-Filtering-Correlation-Id: 0020ac2c-a3c0-41a2-7396-08dbf13688f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y+mCnsog94qBqrJUYhhY1TMNFGkXLVqMVqecqc/2asoJFJFwDZTXdRFaUy/GY1kYVWGhhNJw7WuW4fHA2R6unFUEc0msZ3L5ByrPoTGPt1TA+mJXqufX6puFviPnAdf9Z6+lHABMi6ZChrN4EQvrvbu9XhVIf7ydVpiKbJTn7hEfYcrkuje8DJ7vWcwJ/hh4fdvtARnKrHNHu5IpwreSXKCjvKMNlzhmVD0Rz1Y6EcUPZ3gad1uOiu2nXNJtgMNQQdyqvBQysLlWNt6trs8xgOtE7Q5PCOaRoA/OJ19hHELktJKmI1lEUTurQZnGpDfV1LBHn7vNtKPO7ArMqVQr93lLTGfYq7mE9cQKekZVHP6yVp8cmmoKOLTmzjvqA9ZinuGhAaTMrld9xQLYLmJ33eD0XbEmRAi7d8kOer6TcCLWWMlcMObf4XIBf/h18KxNjog5Q20itk/uQCgnDfNZgnjpgI1ZlIyTW3XytLcLZm9P5L2tSL48+bpqRt0/qo/Wde01dCjN+oMQzHzLOj3NQVf4WhyV/Qfqj2rjNMDm8ezX8WSyelwZ8neYYq+lSYpjxd6UC9y5O6KvSbKqqUYlsBDBn/+zWaJ56SxMqLYVpZoDOrvinuET3sH2UDETc+Jm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(346002)(396003)(39860400002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(83380400001)(26005)(1076003)(107886003)(66556008)(66476007)(66946007)(6636002)(316002)(2906002)(5660300002)(4326008)(6862004)(8676002)(8936002)(86362001)(6506007)(41300700001)(33656002)(6512007)(478600001)(6486002)(82960400001)(38100700002)(202311291699003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r3d29uf2HlVDlqoWv/qyTsbgFYjmSwmsPZv1WV/FV9TtcdCTq0FJ2d4f5/VK?=
 =?us-ascii?Q?J3tIHbPDK7zWyHXDws4HUSFhSB2QHhUsE/FvOZmuc3NA5uEk4XAV+TMqCaxy?=
 =?us-ascii?Q?RLg2WMaoCGab/xWss12RiGB8GTQw1QMZY8qGHfKw+QKWLV0nHrHxoy7jbP60?=
 =?us-ascii?Q?X3w/8zUfpqriM3IsuYH4P270D3yaXfq+na49spmP8mREd6wyFIIsO1EzsDJp?=
 =?us-ascii?Q?nOgjFj/nlB5K7FVGrBVHjXZlESG0XwewhLa0fzCBZ3w5O8EV98aSc0Il4Rqm?=
 =?us-ascii?Q?rw4g6RtdtB2ab8GKxJmplpdaE+aTC+31vr+vPWHCbZd2zqgxKDFFaC76lRFS?=
 =?us-ascii?Q?c8bv/BAUATwt+3oakSFEfjJAnjE/CZ9+7btriIe3H1c4Re6p42gu7ZDnCk2b?=
 =?us-ascii?Q?IGrclMLxgpI6Veargc5hd83rztF1VKxaKSZsEzoUZgOfHV5QRKXKN7UVvvKI?=
 =?us-ascii?Q?6wIvH2Fh5Ysj21ZzJj0g3K7YJ5KwcpCep4X3amjogXw5FiTOBtkPZ31xeFn/?=
 =?us-ascii?Q?wQMAftEGoWX78LICo+6eYWH5k56r42SEP6y10tvNRGViyCmCo2/u7/Puxy2A?=
 =?us-ascii?Q?EwBKdydqPa+7FF8pkWpRVTTlzHw92LCvj9UMEnIA7V6viURpBLqM+gwp0zSl?=
 =?us-ascii?Q?QvGX89E0QEGZKtsVO6v3hpBjnqJHR+ISpl7pEKEzzzUoHkwySla1N7KXJPMn?=
 =?us-ascii?Q?7035Eyvh8jVKDMNQUlbOE0X2ylgtGvAZtWLI6UpkfJnoRcFHh6L7lcfBn2nH?=
 =?us-ascii?Q?IP2+KFsr8nAsW33A44FgMlaQp87iwJZbsWTpDGDo4jEebCcdK8alOhyuTR4S?=
 =?us-ascii?Q?nGBj2nBUVl6U1H5TMnEu9RmLZnc1Dyndk421qLIbAcz06xIxPuVi0ROY2CUh?=
 =?us-ascii?Q?5pQFdV5axv9i04IQ9JHJRjytbCbbfxeq/ZbMOIJlAKTnxm9hs+yk8ntAtS0t?=
 =?us-ascii?Q?AMIieSFnmK6crUAkq2cTs/59BWSug4zdGNEWFCDqKchF8I48ZPsy5iknQBoG?=
 =?us-ascii?Q?YjUE7sBYC3PItmqGU8H3tpO2PY9CJ6qxkKqp8NtzCVnKFVxJWEg/ac1ADiAv?=
 =?us-ascii?Q?vefSoTwzvAgM7PVkBTLTRt6SAXnTWENFV2lqRSBHITTCqNJUZcgWp5LCZ/oG?=
 =?us-ascii?Q?uvQUBXxrSkUsRvAvSb/iuV2ea5oNCdayDZK18Nhm+yWTnDVtGBm4EUne4Ulo?=
 =?us-ascii?Q?4qpwXX3xwftR48e86kZDk9llTLCltmFo3U07aXDvWsPnKlWWbQJH+iTGoqFz?=
 =?us-ascii?Q?UG28heVWw4e9emAMMxaK4lcLYZEhtnJ8ksVoCNBRAniy+ZOksc8n4hRCO4A9?=
 =?us-ascii?Q?nlKmTtaUyp3Y/uI2HEG8HL/T4YP3nfRA5EdiXvYkmvCfSGspt4ZYZwDXhZ1/?=
 =?us-ascii?Q?uuMsLCTsd2ZBorphwljkMR2xBl0eavy0AALMOxR+7XId4K8Z632hJRAWOICn?=
 =?us-ascii?Q?HzqAueQSe5vYLqq+ND/+PSiFbB52sbzLpR36EodXteMl1pFcAK8vXpNp3Vqo?=
 =?us-ascii?Q?kbMIIN480AEgUgGmYQBYVjbMWY2faDocmjo8yGgSx9WlDwLXPM5svQI3RA+z?=
 =?us-ascii?Q?TsJFmeQBzDgEk07Et/iRKZ+jOtGnUkeKInoVSuI5osfouV8AaDSzzY3bE0ps?=
 =?us-ascii?Q?rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0020ac2c-a3c0-41a2-7396-08dbf13688f5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 23:54:33.2372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 60fKxeGsf8J0ztfothNWzqiHLYvYeTWhUxBzvWBVhIIm3+ItuafxHVk5cuXwHDK0be0VQ/HOyH2LQ2dwWAM8hCBKEuEwnwCkAfpne7XH/YE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8297
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/5] drm/xe/kunit: Remove handling of
 XE_TEST_SUBPLATFORM_ANY
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

On Wed, Nov 29, 2023 at 03:28:04PM -0800, Lucas De Marchi wrote:
> The only user passing XE_TEST_SUBPLATFORM_ANY is
> xe_pci_fake_device_init_any(), but then the function would return
> earlier when handling XE_TEST_PLATFORM_ANY. Platforms without a
> subplatform use XE_SUBPLATFORM_NONE.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

I was going to say we should remove the define completely, but I see
that happens in a later patch.  So

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/tests/xe_pci.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
> index f2cdc9bb4612..3d260edd5849 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
> @@ -128,11 +128,6 @@ int xe_pci_fake_device_init(struct xe_device *xe, enum xe_platform platform,
>  	if (!ent->device)
>  		return -ENODEV;
>  
> -	if (subplatform == XE_TEST_SUBPLATFORM_ANY) {
> -		subplatform_desc = desc->subplatforms;
> -		goto done;
> -	}
> -
>  	for (subplatform_desc = desc->subplatforms;
>  	     subplatform_desc && subplatform_desc->subplatform;
>  	     subplatform_desc++)
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
