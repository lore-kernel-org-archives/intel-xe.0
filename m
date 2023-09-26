Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59530E7F140
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 22:44:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94D010E44D;
	Tue, 26 Sep 2023 22:44:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CF3A10E386;
 Tue, 26 Sep 2023 22:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695768245; x=1727304245;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CFZ5NtH6yIBo7XF+QsSzzRz5hhfO3s8+CDogWZqJB9M=;
 b=cSscl9t3fvO7pPTq17T7DuVPsuHn2asfSf4Xnq0XTsJxocvMQCh5WEUN
 aPGv8XJ6orrqAKC9DPYOzTy4UCvDNedOw0poybTUdqha9C90DnBnhlcGz
 y4tZhk0WW4PDYWMZluQvlu7n58C9NSL3VOak/7UDF+nO8m500hCLRT1OW
 L1TNppPplJtu/pTg19YzxFeDx/V5X86vQ/IDORGkd6BIL/hFw9VoAJclv
 Oxd9Ql1Klz7629JrClLXnM2g5GDoy3+N6AEGYwO6Lvn10hCTe6dpYEhxN
 HSsYQOHbhOuQHfVJ2c4sBNJs5xq6HETU7wdWlBvNsD62FixpxAu4m1wYG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="361933637"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="361933637"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 15:44:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="872663432"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="872663432"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 15:44:02 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 15:44:03 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 15:44:03 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 15:44:03 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 15:44:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HqWaH3CslJl0uzKFMitIfAp7dEzW+3vuJaUFX9wuWk5EDBWy6oT/zSY3hDIg2j4V47jnhttDfbDYGIo4nBWb7qep361f1yaiipnC9vSW7HVzvA3DknofeJViVj8E3Tx4XZc8zpteUQi9SjsOkxNODVIm1nAEBNytXpAKrTYpcw3Gg3nSLRvOvCpsXzmkQT+0Xp7kiGDtuKbNiO7yMJqsHO+e80hqWG6KACwdNhSlpE75zhJvOwQCFuevbppB1A0HlA3JgkjZqbK1/JX0JDOHwJjL9fSxt34Wxn5W2jUeJ7LR74OKoVrIhoxBqklCne0hxuR8EiuxXOqkwCRb2gyctA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w1GQJVB1HtJPkMTdWZFRLrc9kSeIQQb29JIdoNTFuP8=;
 b=FuKVbKGPqXfNOyaz5S9+0i+rDfK+WEvpYSTQFHsoEQbimFJGRznIoLYCLzTsNci7CA5VdhseFdYgysXAF9lA1ZiKDJW5w2iaTaFmUu2z8NyZ2pARpGepo0i7HLecmOToLpbH54/kwrsjyfwezoZ80FuPzlhyF2VM7x2OaMW1e57NS6/w0VcObHIB7MQpRdfh1bB3rjSapUsGeT0ze+KvpaMWdAQ50RglM4S1JRX2AO2tIbOVWIRzgus+8zmML7vKFdwriJE1sEC9npBIMHCI5orUn9oqG+x97rQ/rWkb4yKErhwBf0l/DBGbfhr4xB1ch6JciKJgnlfuQUZfhTFBtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SJ0PR11MB5939.namprd11.prod.outlook.com (2603:10b6:a03:42e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 26 Sep
 2023 22:44:01 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Tue, 26 Sep 2023
 22:44:01 +0000
Date: Tue, 26 Sep 2023 15:43:59 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230926224359.GO2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230915132346.1845909-1-lucas.demarchi@intel.com>
 <20230915132346.1845909-9-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230915132346.1845909-9-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY3PR05CA0058.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::33) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SJ0PR11MB5939:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c09e742-ad86-46a3-d57c-08dbbee21445
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iNWbtPyJHYT1oCGjUf+yjedYGLP1z+oLfkW3V+D4P6SmsKNJIkUxL5OtqacXaeK8wcj1GM8Mt6Kp0PYJMGkSWsQm1zPDkr2hoxxZ1yjnT2Ijp7dY8CgxEzjcW8weN9oZKj5aUITucq3etKJwWXxmFYG0lUNdw1UVBOACVJ7DTtBzclEenHJwxXPVUCb9s2z29sklHyvUXpSMA3PvQdAzjjdagTX8Z5ShEj8aafZwtb1kyVJSz988Y5/F65x8i3lySV6h6V8Y2W/VSb1/U4231pJUOIesiLozaM8wqvwXkSlh5Bx8QZzO2UivXh8q8XM8Ueq8U9hi4/2VB2EK5WDIqATH+XctT2uL02UtuAa69KBN01iQapUNQfpvInl24es8sDIhLUGYOIQwemTC7PRPIrbtDP5ika4YIyqeWFJMF7CngGegrvLisdMa1nMs9vWBA6zbcgzquHE1rBL7fkkojFlTtwMfrsMdlenP+zRrUaeRiIxlC6PrYlk90+h6Ek5dm7VQk9UZdL/YbEhy94UGnEYHFeNAJg4Yp7mSA99uiDHb+w5cfLR9ZNVrjTJFZO3O
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(136003)(366004)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(6506007)(6486002)(478600001)(5660300002)(83380400001)(316002)(6636002)(33656002)(1076003)(82960400001)(6512007)(66946007)(86362001)(26005)(8936002)(66476007)(2906002)(4326008)(8676002)(66556008)(41300700001)(450100002)(38100700002)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mfia4YacTSn7+gBfYgcFGfq8EHbvOYs1h4D60FfDHiWZZ/T767rsNcKA0BPQ?=
 =?us-ascii?Q?XJbY+RD9zz82+gKw0PB7u4H/3d8rFg9NyHIFLitZyWRTVMn3Eg60BUxSEwyB?=
 =?us-ascii?Q?8gAjcm6MJSybdvI6BXQP7Bu7StGwZ4sSCWc0hK9Gnt/3S9auYNWypU8IJmFC?=
 =?us-ascii?Q?oiYfWxvrcZ1ZO+QhVN4dgC/GOBmJXCGNUH55H0LfiK9k7Q5N7wHKO9rVWTrA?=
 =?us-ascii?Q?jmi4KBsQB7d1tz70LqIOTGm6cmWmze0lcb+c8oF/bi51oFJfPZRSP8ZJ+ohe?=
 =?us-ascii?Q?jAO/qT4Gz9MBKQTexGZWip3fbWpB40qnqAq6ulAnXpeLpmQbROcDQo81ynPn?=
 =?us-ascii?Q?Rec7HtcUl6F+XcwkpNNCLmPrGTlWc+mA4wZFe6JgYG/3uJVF+E42B33OhV+n?=
 =?us-ascii?Q?CRv7dZxA5G/a3wM85h179uhtZdj1xBHWlGXJ9oEFVCL/eFzgFED0aJq5tqfF?=
 =?us-ascii?Q?faPkXfKl9AMiRnjugfh7u3EQP7PSVv2oZk1cIVOt3wx921gKkGpwp6LySJv6?=
 =?us-ascii?Q?IPHwGXaNj9dMriObrMEE/UYnl5WYil2i/1zevETAl3LBFO2myjCxdPFqd7Hi?=
 =?us-ascii?Q?rckjfHKsDucppx6iRRYKYUy645gzT4pZVuDXAbKZ0BMhdZQJs+7P8h4yfAwZ?=
 =?us-ascii?Q?VClbB5KOiB1l8kdKC8rR33Avcq9vDYZ4ZZifrGavS2c3cc3WS4hHPFNo8Fqk?=
 =?us-ascii?Q?7AN1w0I/e7n+DbNvUOHJbPNoaa9gk6ocNcv8waGPD6mWn4+dgt8+zZGb8Ezl?=
 =?us-ascii?Q?Vliu1oM/oe7TjC0QHv+RJAOOxtDsRNVceHXBzxP52Hrq5lB/ZiZnfr4nV9EJ?=
 =?us-ascii?Q?XhNS5TWzimO5cQwjtLjwCpJbeQxdrjuTqL2KfWl26zEQQof7Vwwf1JXFD9sB?=
 =?us-ascii?Q?lPLg09CVAS+D16gKjSy5CwVnOq14V5586Wqi0JeUkVoZzm+qMBEaZ8pFOGNM?=
 =?us-ascii?Q?tLRNpiCixfkTVhUW+/LTL0XpfZdMCE/7qcY0XMyPJjRR2NfpCRjS+pyp6EBs?=
 =?us-ascii?Q?JstlL2/Dzi1P1IO5/BpeOVQbHmK4GNOiR/s0nWFdketjxaDyVDotS0k12qK0?=
 =?us-ascii?Q?3aPewuI5HeKLWCAk6rmpdghI6KFNtexhKqPjF4EszeMcwkSTYDT7xbVaXvJc?=
 =?us-ascii?Q?TqkpiVhMjn9fyNUHHJaDojudWjMop1sXrNzdkCVzBBXnLwc2lNdcUDmSOa74?=
 =?us-ascii?Q?D03IPm0PtHePwi+/Wi+2mcL6SnkY7Rl69vs9HgCUd1cnCEVSu+t2qwo+zwKd?=
 =?us-ascii?Q?eyXpnO2P/SczrTUp1nQxcHf+rZ9JkcFDKOjD05Qu/GcyyrufdBPYEJClXaUa?=
 =?us-ascii?Q?r4Cet/7R8vrW7CkGSEtupiwCg+KcrqNXK6pUtwjIhwjGSZXLRw9zu4uYrfn7?=
 =?us-ascii?Q?lzOvaoSPSrMY7vsa7HWIEqxd0bovMvwYQsnV1GcG655jH/hQ340xnGqcCnGH?=
 =?us-ascii?Q?Yh5ijT2XY6OPth7ixL3MTLNamQ4cc2RiW+8HCIwz/VyxCeBILtKPVwDbxMqq?=
 =?us-ascii?Q?Gsdj7h/KGyZN3nGnyS8GipTx/QGYa4M6yG8pkENP3QwgIn5ArUTaE/FlV77I?=
 =?us-ascii?Q?UabeF/Zgv7hVysgkBtwoyrsDZYfisqcChmUsplaeg+sBVa3D7WnaL16tKtNw?=
 =?us-ascii?Q?SQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c09e742-ad86-46a3-d57c-08dbbee21445
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 22:44:01.6311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L0RmNt6Ff0lJLeHqopKV0s2jv2UHlvyc0KfleXhbnB9G6J22JKMJsS5+TNLaOik6xkk6Zb/RkRE0xxYG8NA+35W/ITGFExRHOEqRCOdrCSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5939
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH i-g-t 08/14] lib/intel_mocs: Add Xe2 mocs
 indexes
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
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Sep 15, 2023 at 06:23:40AM -0700, Lucas De Marchi wrote:
> Add WB and UC mocs indexes for Xe2 architecture and later.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  lib/intel_mocs.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/intel_mocs.c b/lib/intel_mocs.c
> index 6a4ec25e4..d9de16932 100644
> --- a/lib/intel_mocs.c
> +++ b/lib/intel_mocs.c
> @@ -14,6 +14,8 @@
>  #define MTL_MOCS_WB_IDX				10
>  #define GEN12_MOCS_UC_IDX			3
>  #define GEN12_MOCS_WB_IDX			2
> +#define XE2_MOCS_UC_IDX				3
> +#define XE2_MOCS_WB_IDX				1

Wouldn't it make more sense to use index 4 here so that this is fully
cached in both L3 and L4 rather than just for L3?


Matt

>  #define XY_BLOCK_COPY_BLT_MOCS_SHIFT		21
>  #define XY_CTRL_SURF_COPY_BLT_MOCS_SHIFT	25
>  
> @@ -33,7 +35,10 @@ static void get_mocs_index(int fd, struct drm_intel_mocs_index *mocs)
>  	 * This helper function is providing current UC as well
>  	 * as WB MOCS index based on platform.
>  	 */
> -	if (IS_METEORLAKE(devid)) {
> +	if (intel_graphics_ver(devid) >= IP_VER(20, 0)) {
> +		mocs->uc_index = XE2_MOCS_UC_IDX;
> +		mocs->wb_index = XE2_MOCS_WB_IDX;
> +	} else if (IS_METEORLAKE(devid)) {
>  		mocs->uc_index = MTL_MOCS_UC_IDX;
>  		mocs->wb_index = MTL_MOCS_WB_IDX;
>  	} else if (IS_DG2(devid)) {
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
