Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2408FC77B73
	for <intel-xe@archiver.kernel.org>; Thu, 18 May 2023 22:39:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E44EF10E56E;
	Thu, 18 May 2023 22:39:10 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3718610E56E
 for <intel-xe@lists.freedesktop.org>; Thu, 18 May 2023 22:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684449550; x=1715985550;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8cCOoJGxIHh6vOdUtfDnZQgl/T6bTFBRBifRRLHxFH0=;
 b=NXixpIoDm9bbsdL/QElA4TZUAPxJT/KwcDZCGIZ3ZI6qGQX86fwpRjN1
 +XW7yF+ybmEhhsAdKGLlsZMAVmINVYuEjHzd6e4bGOWkTkwkmTPoPqW1w
 eRoykLlu20niSdsiuCZWMTMniva2TuTer/1Uh4ZCQqr4ibgZQG5zAEob3
 7P5D5xlIqAGm1oiI2P1ZrezL1KymrrKbfU/d9aPCXazt3AoYMyPrFQnRX
 WhUT5+i/DGsrCuDPpKYUS5+Sw4ZCQPv6EVPVlqiKgY+4SVZ928JZ61zLL
 JRVLiJ7t5FU96rgmuzFpknzE6E6oUh3/8ZJoMmHjsD2VhXgz+ewZZwTRN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="417898205"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="417898205"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 15:39:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="772057883"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="772057883"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 18 May 2023 15:39:08 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 15:39:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 15:39:08 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 18 May 2023 15:39:08 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 18 May 2023 15:38:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U65Y6Lu3URiK3XgcE0hyFfuQuvj0Hbcb0tLLiwV6rqqcN44dNeYCVPIGLpGUUAepUXUJPJ9z7N89x9YAjuRmYbpAf4R72xlgqpF66luHZ88tL1+DWQia2QStaeiy+ssjAghva0KYf4voBG5WbmFd4e/AtWbc+vwm0BSI8cPh2ylGr0w6BrUAsmj3Xfpg7AnVCmwVmAvgbynIPI6CXeM4eCHIzbFx+mAA3korQeZpPh+KQEDvIEas736BVs109+8YyBUa1XdrzX1KSYTWg6FbxSFQyqceR/3v9/0q2uy+D7/bSCZMGZ19DNDWwSdWp98BiO3vy/whv2aysXXd8heZ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8UfMrc3KjbDPut2ExhxcmhKmnuLIO3XJCy/60cNXMsY=;
 b=kW/fc8oNDRD4BaecvRr39MFv60sBceq+U/HPyJqbpwaz7REIJlJTg/MpP6S3AFl1AzqYF/QxL6mg469MBJu/EQSIIiUPB9m96vBd4NlXw0Iw08pIY8eNzDQ1rGaavcRxD6GCJXs2lmXwQsOZ0QJsT1cE7LZK4rF/9ygs9F0/6k2K22+6Lvh0t5Nn+BPJLnD1MBmMdj6J8uNQz8s6w9CvNjc8tk6IFSQGMLSN2uL5h5q4AEn21iVpCdwtIpx2gAaCVQB3LaCJtrSuevl4W52J8Qsq/0NgtQgGoqQrkvVyuIX0plJqGkO19F7x6C81EXWMjxXgBdErK+kEw4NpfWv6Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA1PR11MB8375.namprd11.prod.outlook.com (2603:10b6:806:38b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Thu, 18 May
 2023 22:38:30 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%7]) with mapi id 15.20.6411.019; Thu, 18 May 2023
 22:38:30 +0000
Date: Thu, 18 May 2023 15:38:26 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230518223826.GW6250@mdroper-desk1.amr.corp.intel.com>
References: <20230518212446.3570168-1-lucas.demarchi@intel.com>
 <20230518212446.3570168-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230518212446.3570168-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::36) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA1PR11MB8375:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c8cf5bc-5e85-4904-7cb3-08db57f09a77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6NU3UgNUyhzWBGg2rt+JnI0GfpB+25u09Rf7cFpsr+jah3ER32UgSTHzEcDU+2EOTSU91Kbg0eZ1c/8d3x0reaUmr6smZMc0R0DKF5XZeJTi9oLtxOFpHgzMcrb2gBdVvm659IkntRLYYyZisxnfWBriISqIUpzI1/EtMa//NyyKl6mAKdEZLmBAuZdXk3SDW9wxNtI6eLvcH2kB9VKtEWCK8ugOP1u36MOZ5YqP7R1KUun4bRbankwfYmmaGWFkAMK/xWqteK4CFYzbGNnrfn5o8HiDUXg4YBlsk6yMcrv6fnSx0e7fW834z5SR05MEPoYUEXshhXuMiMNMT5nCSskUJYTNTA38tn6lUSxuurxsBbf6G+Ojpdb/gNiCe8p3wdKVNo9AXSI1TEHJ2hpdOiHuSRL8yBMOIhZl8HTQMl/+BgTkm9vG1v9G140HTKcUUN53BhWJRA5dTiuP977wK4lf3xsi3UiMrg1dieUquSIMJYttTlbLpfQ22lXxzqqQz0/WWxihhh6mKpoRwUq4VKMcur/NS1YjB7XcAI9T7EK6iABQ24Nc4qGSI281oFBB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(136003)(376002)(39860400002)(346002)(451199021)(316002)(66476007)(6636002)(66556008)(478600001)(4326008)(66946007)(33656002)(83380400001)(1076003)(6512007)(186003)(26005)(6506007)(86362001)(5660300002)(6486002)(2906002)(8676002)(8936002)(6862004)(6666004)(38100700002)(82960400001)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iaw2P9VjqmJjTMwIekjs/0k0RkWu1Iv0moTtoRKH27LdeTThJa4RnQmwByhe?=
 =?us-ascii?Q?yIeK0c411etJvymMJE4JDZXxD15oWux0Fmv/h1+4NE+7A+RNSMy6hD/hGB34?=
 =?us-ascii?Q?TsiuYSDKedCTzVaeQkXwT7kAQslrTIgVh2FHr2BveFG6DyY5V4T6YOd4R5NA?=
 =?us-ascii?Q?M/6CvyKl/CONGFF5nSiCZlIUKNEllesasq2M+THkgyXCyw7/QRd/5NVkXvN8?=
 =?us-ascii?Q?PB2KqXVY4B3Q6jtrTsCfJhGB3d75f6Q4ugzWJ5vrrjBSbTc3iT57cZPuy5dk?=
 =?us-ascii?Q?hGOYWY4Pzn1XZrIdqVtaJYj02BRdjbsS7GhvsGlXBwVE8SY14LlFgtifTafk?=
 =?us-ascii?Q?imtgsR1G7HI1qGaipGkU7lp+Wkg/soUxRvOb0a4ctXOafihV7ApFdG4mP2tf?=
 =?us-ascii?Q?fFBw37ApvTGjFf6THDTKhYSraU8f6jW/5HFrDLZmlUaUyz3k+6a31C3tqbo7?=
 =?us-ascii?Q?mRH6g5AVBpaKMKpE4UmO0JvqWAOlTf9TPlgmKsc8lhidpeYeH/lhQxZu2l6z?=
 =?us-ascii?Q?o3dxTMXyrQ8wn5kNGyKjHl6VR3utZI56nIsq7uQXvhraCvbxYuVn675wMhzf?=
 =?us-ascii?Q?t/EjxMZtxs2LV7KedHzIEUiEp93YJyQOQruz64ZHOXAn6IfrbYKtPvL7v6Hy?=
 =?us-ascii?Q?jSDewMgsuA1TPq99y2GT0hAMp5CFStkEdzNC7NkYSvZOwO4vzDjUZaANsj+e?=
 =?us-ascii?Q?VvIIXBj4J6/A38T3wr2t2R+8vgkAay4zw76j9aMfzoMHEZMRCsi4FXufbpbm?=
 =?us-ascii?Q?wIqBghAcs/2Js1+Hdtxt/ubQ9vDyWYxaWRJdy9JkUnaWy+Dyin0b1UxpIYIS?=
 =?us-ascii?Q?V13uXX+Dd7MsLmyHkrH7d7lzGYeeK83kUspq235sD2xhqfpz41GKSM7JoYcp?=
 =?us-ascii?Q?va9+NrBEs20GOCNYRUXCEpq/rlzhcf/ypw9U+4ij5XPL4ksyGIov99mysFx0?=
 =?us-ascii?Q?3PUAmeIReZIWBaCkf+Hgde2WOw5CSN02moexSRrP0/Jx7Hnocpzwi723MDzF?=
 =?us-ascii?Q?JrqtO62U1YRHauhlPU/QbjUNS9RE5kAhJ7zpqcgzOu/na/8CqsrWx2uvFklA?=
 =?us-ascii?Q?TcwlHFHJY8iItgM8+WGHfIhLF408wGgpuBGlNfeS9TcM+RXytw/hOV2+eH9c?=
 =?us-ascii?Q?6ksL14PyNkLSqmuSlid+IHAofe/FTXNGFPArLMI/0OxcG1sKjlqjTJYpdudU?=
 =?us-ascii?Q?etSl4mKcnzh48YEwFcs/Tii8TaNDv8mTJ7XuvPediM6op7mgspu5z2RWzLsU?=
 =?us-ascii?Q?RvGjBHXr+vRvqq2rU5hSWLLXpEfG394W7yi+uxVvLkflFQxzb3uUchc0IghT?=
 =?us-ascii?Q?fYf5VNoZkcrsuxghDpkAHyHj18z9n//c0l0WI3/PUxmfzBVnZ/CK8pl1AEeK?=
 =?us-ascii?Q?t1IYdalWpBZQBW5tvOv6TIisQy6rP2LyL/EbIXFf+l9RzExWllfT4XChVxQD?=
 =?us-ascii?Q?RQurLcdvr055XOwvAq9O5qdQ110JdRvzLEnOXx2Z3ApZmILU4M0cxC8hVShc?=
 =?us-ascii?Q?VQ8fU7eOY2YtDAWdOVSYDOAbZMGizA6CFXfiXJi4nb7gMeLKzrTM3OsvRwJO?=
 =?us-ascii?Q?kbW6XFkUd4wFePzcufzxkveUOWP1jG3mi+Jxm/bySyaICyb+4j30+YWbHOeJ?=
 =?us-ascii?Q?rA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c8cf5bc-5e85-4904-7cb3-08db57f09a77
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 22:38:30.0155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZlaODk2Mb4XAmNnv0mLjQjdVIRNleAM5EI7eJHR3Iklp4VXalN6NZF0EGtxXUVJdZUfBa6KZXfkLsC0ecbou5HX1MSiMhYOzDs3WkVz/+7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8375
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] fixup! drm/xe: Update GuC/HuC firmware
 autoselect logic
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

On Thu, May 18, 2023 at 02:24:44PM -0700, Lucas De Marchi wrote:
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_uc_fw_types.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h b/drivers/gpu/drm/xe/xe_uc_fw_types.h
> index 6c595aaa2399..837f49a2347e 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
> +++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
> @@ -79,7 +79,7 @@ struct xe_uc_fw {
>  	/** @user_overridden: user provided path to uC firmware via modparam */
>  	bool user_overridden;
>  	/**
> -	 * @full_version_required: driver still under development and not ready
> +	 * @full_ver_required: driver still under development and not ready
>  	 * for backward-compatible firmware. To be used only for **new**
>  	 * platforms, i.e. still under require_force_probe protection and not
>  	 * supported by i915.
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
