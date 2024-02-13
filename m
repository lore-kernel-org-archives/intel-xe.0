Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE4FAC48260
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 15:27:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9408110E15F;
	Tue, 13 Feb 2024 15:27:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cx6/pfKw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AFDF10E15F
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Feb 2024 15:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707838050; x=1739374050;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/j6wqUgzcVU1WT6djNn3XebEzWzkU0+ZoTqXs/+ZqNY=;
 b=Cx6/pfKwBPmsHL+SKIMrdx/8JoTRUKGBB3yfApWhtMo9BQjEsLtz1/Rb
 KNmhLnXLG6pdv1bTY/koTPLMaK3uR2iHg0sexL/kK8x+cgZIB8S2mzpjA
 YPo5qXEiR1pHOD3640OzTg6P98E7Mo9mN9rNZ/A/xg33EbEZxMYMSWO1p
 J0rlfWKjAOzBiKWeLaloJJOHFadsr7r+A6oAd/r5l2NmhvUeYVCucy8Bn
 U3ITWtMCQ8eUxJUBRs+/OOafqpvx4kPi+ZV+NrNlNYYytjviEN3Vxnbfw
 Xz4UYilCoDhNaX/MadpfFOrKe14EVrF3SdI/Zo5fKtaUc6bUvgYKPTVSa g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1703630"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="1703630"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 07:27:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="3272882"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2024 07:27:28 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 07:27:27 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 07:27:27 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 13 Feb 2024 07:27:27 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 13 Feb 2024 07:27:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SJzyo7+O5sGKAcSdCDUZmg1msh0JufiO5sFdVNoyAFPvg3xI52I9hNbKsCgd+SbWXp0ZNYJ4q1Rse79v5QGhWxV7OdabUk6UP1nwWU6oN+Jj/SyhY5U9yQaEbk+evkB51oO75SJJXn78X1NgzBUyMLnHB3/zm1j4q+oQoCnLDc+TL1BJcA9ErmgpWNTHKSWKg1d9EzgLWNyDwqEN5kJoMmtcEUxIci/AwU1JnNB79xlqyuG/KBMZ5G+ePDWUtnkS8ldU3Ie4U0+ypImtGx1AWgzA8FWaqqIC3FW6de2e0Gz60PpK6GLVQJS8LDfk23C+noKVYhInsZ17BUVn2ToOFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ygRqSJ9PWn2LnZD/FoNm89n2l9H1Zn3eEmJeeDcfx3Y=;
 b=B6RZGehJaf5VeVx9tK/+4qVaewkXf/LM0anSe5MSWFvVNc4qYE4KGfeALSfTxRdwJ4uqTqQr+qNJ5kTHinDyg1pi7SQEmU7hbq3w9x6vPC35eIVlEhkxtrfilGuRY05cNHBXg7N86HRjVn0PhBIHMTJpaZn9l+IiFhlRjmKxV2HKgrO6K20pq51p6skckhWX5R2V9GQLKynBz11HaCezEwudrkcUzKd2EsN+eSuBLerOrI6iMejYLLjXeKXfIizGp/Y579y2hojkHJMt19rGVpqBrSup4aY11bH8qP0UTic8GnPF1SN9rAC18G0Lgr+NJVxWX26vr2qZYZYvdao/MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA2PR11MB4923.namprd11.prod.outlook.com (2603:10b6:806:fa::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Tue, 13 Feb
 2024 15:27:25 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7270.036; Tue, 13 Feb 2024
 15:27:25 +0000
Date: Tue, 13 Feb 2024 10:27:22 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <ruthuvikas.ravikumar@intel.com>
Subject: Re: [PATCH] drm/xe: Fix modpost warning on xe_mocs kunit module
Message-ID: <ZcuKWlUMIEZV_vQ6@intel.com>
References: <20240213033548.76219-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240213033548.76219-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA2PR11MB4923:EE_
X-MS-Office365-Filtering-Correlation-Id: 867c349e-4d7e-4a87-76ed-08dc2ca847f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6gtgjGwpdLUzjxfdpW7UW1OayPPTIThjd4710qMsK51Wbr9ub17PUa+idF6a4oceaocQPDd7+WiyOG6vYIyyqJnFpr4+IPnLlPQFkG7EOWadcIQ0euQVC4oj1RZK4RZidgPanjc6GjE7k6TqD0XcrugrFK4ahZfUOTxR6IM8AOd9blNbBkMp/JSFJabKIKLlaWtlXQqTeGqd179h83FCXxSatniC4xWBCmv3nT2G+Y7vNHhpHg3AUu9iwOedEodzLLjxf4t9QuOJ2C6vrrcUyo2yGJfwS8AU9fSO/prDKAE990E6tLEzY7nFcXHUzBMpTW8yF/137jmwAu6mJdoU6H2uoXr+a4P9673VHuW96YZNmOTzZjVOyCvFa5FSbEEF3YUQKceNtZhQ4UHjEXbOo5jVMFu+GYHyOp5NoTLiDvYc2LCHsCRKrijpDbwEQmwkD4jfWvKxKhtmITXIQ/I6hozCLuBTH6RMmajKkAHP+RXP6X3Gb+fHWsQDH8f+d6bL59Ykggfawxyjqz/+p5qaM8qMUMLM7iB+bDMOwmS5l3QoJPf7I/cLsZzmz8Xn6Jfp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(39860400002)(376002)(346002)(366004)(230922051799003)(230273577357003)(186009)(64100799003)(451199024)(1800799012)(83380400001)(86362001)(36756003)(82960400001)(38100700002)(66556008)(2906002)(44832011)(5660300002)(26005)(66946007)(66476007)(37006003)(316002)(6666004)(8676002)(4326008)(8936002)(6862004)(6636002)(478600001)(6486002)(6512007)(6506007)(41300700001)(107886003)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AjKM6XO3VGh1NIIfB3LWOckXe2HtHIsFy9giXEFTG8aBV5qQrhhzrU1ieHPl?=
 =?us-ascii?Q?/wIoP3zsEEocxMNpXW7YrxgMb6J6tGCFkWEgtGWJGHxt6Y/uVCAI+wNGknXs?=
 =?us-ascii?Q?GyRlvJhf0XgpEg8v5cUpKPwqyQ4dwpjT4uP89SPvq0siTfOs0L1axfCjJudJ?=
 =?us-ascii?Q?Kvwqm739nug0FFKrSB0Zd9ulvwk1sXYjV1VUNwlDvmQeiOfvpNms8c3Qf93y?=
 =?us-ascii?Q?Kf1+BHmxGUL4YMHnA+yGsUrEADlN0oFR1Q/TgLHMnKEgI2PFWA+Wh+eS8jF0?=
 =?us-ascii?Q?GapAUTyM+bK2WOqAfURg9Q1uQcJA+al0IZjhU0+AVLaJBgxwVt8qf+2EDm5n?=
 =?us-ascii?Q?kEebac1IslYw8N7hpO9ZHkM2w9ivNC1o0pLlNLsituw5BV7wZQmbccN2m/17?=
 =?us-ascii?Q?1S6c9cGs/ISrjXu8BV0dxJcMq8DhIy66o6wcLl0q3Z3aZlIvth51wTjsv8rj?=
 =?us-ascii?Q?jSgVKPJUCOoNw5F4lDiyKadW7pOixssRybNw4XyC0nA0Wr9CgQ7tNiRKgYNU?=
 =?us-ascii?Q?9TdYAQNPAsu47x0XbAIZm5dvJsllTj/pKUYIipm+tlF3F5n/sYENCLI2nDzz?=
 =?us-ascii?Q?Kv2xdJYIhouU2oCqEN0bOXU8FddaHCfjfhGJVmzpxNQwAjyCEGDze1TQPOmJ?=
 =?us-ascii?Q?npQDe7qhGfmKjAY7Q9fEDAHEOes2T2eMRX/IIZrN5VUHoogOZ/9+oqDZyP0q?=
 =?us-ascii?Q?j2ArLkVQBJqfwjhwjwBcHu95ORgO2FSrF0vGCWVpc5++pKcctFZSXY49oOLd?=
 =?us-ascii?Q?Bfp72gUWGbhm1b3xtmQmYBti/uVZENfHhcHW8tTsIsbadI0JvPVNHADwHKEC?=
 =?us-ascii?Q?PJ9li2/Ye4IGiry7FvMYFkICo3xka5QfyEo6CEvPrA7d6gYilQkwHUVw8oGN?=
 =?us-ascii?Q?eg18zY9LbpBqQV4HUBZAgE5d6dDESkCLBovgGBjKXyd5JqzPx2iRZ81TUQym?=
 =?us-ascii?Q?zPeZOHFcPhpE0xRlCwdnxAu3qcEBqJvRwP7U7EPa0ZlefrksFDjZpFidID9e?=
 =?us-ascii?Q?9Al28WzlBv4GsE1UQBK4jgwRPuBk326ttxIizOJNfK56/MNreUnUarbHiQlA?=
 =?us-ascii?Q?RfXV6bJ+SANnsbbQqa50zhYWezQFr4j4EZYjkPxmP2lqTZZ3BmwtuDHWDAsn?=
 =?us-ascii?Q?Q+gWRwAEKWSebTUpQF4th6NCt6OHiUKACGf9yrng/GvXjXCL7IIQsJjNoOOK?=
 =?us-ascii?Q?SGW9uR+YTKTD0dt2BMeFE81RcT0cG608aAdlhuNuZICfmUg6Djj9KFK5basP?=
 =?us-ascii?Q?MtIdNeD0J9K4tPb5Up9iPek4HMKZYKq4NKHCps5+uO5M+tB/6r43IFwAHOeD?=
 =?us-ascii?Q?Noxf9c0jNvb2ZhRcKFZh6Q922+0i5pA3dAz+9PLGPTDIcDBPsvhD5p2+m6LK?=
 =?us-ascii?Q?1GqQOKyR1cu3NrUUr/XOctX3qMVF5Ngq4lhi6OCqCgdegegfP5qiXs/Gs3w+?=
 =?us-ascii?Q?sJS0UmW3Q+G0NDXkRxOveA6RSXWUH+Sg9FfZIrmTCTEbCHMmPRqoa0LNZ3NE?=
 =?us-ascii?Q?Wpt92TFhJ1Hc/z8X4vjCpfi8S4pH8I2y6g0Ispr3uNdgYillPayJDtauak0o?=
 =?us-ascii?Q?6TC/lAIWlisDlpq6YU8bwCbQRAeyxGEe+k+zcCw2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 867c349e-4d7e-4a87-76ed-08dc2ca847f5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 15:27:25.5198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5c/udnKyd5W/PtdA95+FQVB8mfto/suUW/ERkVj3+gYrCgFHfUuS27Jmvct3FCa8gRfdslcGP7df1tRjuOZUlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4923
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

On Mon, Feb 12, 2024 at 07:35:48PM -0800, Ashutosh Dixit wrote:
> $ make W=1 -j100 M=drivers/gpu/drm/xe
> MODPOST drivers/gpu/drm/xe/Module.symvers
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/xe/tests/xe_mocs_test.o
> 
> Fix is identical to '1d425066f15f ("drm/xe: Fix modpost warning on kunit
> modules")'.

I don't see this widely used in the kernel, but since this style
is already in Xe, and this is fixing the warning, let's move fwd.

Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Fixes: a6a4ea6d7d37 ("drm/xe: Add mocs kunit")
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_mocs_test.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_mocs_test.c b/drivers/gpu/drm/xe/tests/xe_mocs_test.c
> index 4f62e7a4270bd..ee40f31e1e12c 100644
> --- a/drivers/gpu/drm/xe/tests/xe_mocs_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_mocs_test.c
> @@ -22,4 +22,5 @@ kunit_test_suite(xe_mocs_test_suite);
>  
>  MODULE_AUTHOR("Intel Corporation");
>  MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("xe_mocs kunit test");
>  MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
> -- 
> 2.41.0
> 
