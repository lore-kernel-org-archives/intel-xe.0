Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2AD2E7C4ED
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 18:48:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B79C10E1A1;
	Wed,  4 Oct 2023 18:48:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6678710E1A1
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 18:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696445314; x=1727981314;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5spiZNSYQlyTyVzuCQ34SmSVqaa1fgVc1lghI+u84pk=;
 b=dAjfa4Kbb70ESd9jml1TqI09N9JVoWVRXOVU5x7VxEn4VDH36Z/0HN7J
 DszPcxAmXfLqwApkliCrR1ag8bYCh419pHoBXij7Y1ywcWQMNOaI0ovI1
 A5TdwvmmACI+UMlWPz8GgYwxJdh8+xcA5I5zAhCyJQpxEw4xTiG2r02GC
 ndgSSGsYkGVjxUvyy9nFoNob/Qd4J5q/sdmDshlTN/PJUYaZ1mfksmwz6
 dodugDyxyd7CWsJkkyGY0M397d2UUtbNXZfZKM1HBNHYl23jcYxbsoFzS
 8VCO5DxieTVcnS27mEUIy+tl57h72C+1Mxz4lLZWF/N9zIDFWGAYL9q2K Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="4833624"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="4833624"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 11:48:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="817235310"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="817235310"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 11:48:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 11:48:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 11:48:31 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 11:48:31 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 11:48:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wa/GWUURHlJ5groTsliI3kS+llSD+QJGV0WCy2oh3lTUglfvBe5bcP7KlGJM/wXTzddsH62a33p/1KJIQteldidNODuktI4d67vTqXlUxHUniSszMnIR6zT+MsB9abU2m2Xyrld2ca9iEqAKU9UjW5VY7Vc3K6Im7Lrm/4Wodi2CWQnO/PD2LjlchtUezDGcnK3HIiVJsvs4tYnDk/3uS/gJh8JLYwl3eN4ze1ORlVtI1tMRj4X9dHKg0e50m4/3xWOfhuP/LcUunhS7pAQpwp/QIBaza9PprwA1cerJkvzYlXw3hNuY8YwED6sBaTM0NoaBpd/B4LpUmQU5/3uB9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X+VnfM4AWnJVNEJCTHlRoLaQES7eNmZhnx8GrhchjzM=;
 b=K19GEGQIG4MTZ+Ygr3pi3knP6iDn4DZ0SSyC5ENBgJPhuqlnzS3xXs4NTvUe4qjv1nozW2hOu/XauYBaqQ2P9cS1/rCMIBvkmR2bZp3g8ZIFFXg/unOo8sv+pvqaH4CyCeS87QV6vRPYC94CUagoVpSmV70CtJCa01xHH9YQiPZ9AVg6/P05ZFNqrJIg3JL3UwQoam9q0B3ITwQieOfb1QywLBxM65/aFc6yU0ZxtwOE/GvoB+D+UjxZRcxuFCbUhpSFy2u64JabkjUCEtS4eAILdTMGng1RUyPJYoJ1JfYiQuzHwXu4vz4GiyVUHYLLCf06XSbDQKtA0I6Wzkd4Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 BN9PR11MB5339.namprd11.prod.outlook.com (2603:10b6:408:118::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.35; Wed, 4 Oct
 2023 18:48:28 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0%7]) with mapi id 15.20.6838.024; Wed, 4 Oct 2023
 18:48:28 +0000
Date: Wed, 4 Oct 2023 11:48:24 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20231004184824.GC53570@mdroper-desk1.amr.corp.intel.com>
References: <20231004150317.3473731-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231004150317.3473731-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW3PR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:303:2b::9) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|BN9PR11MB5339:EE_
X-MS-Office365-Filtering-Correlation-Id: c2dde794-1012-4dd4-0d8d-08dbc50a7f56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k9crgY00sD7irJFqpuaq9ticiOmcIUQZw98RoOpFZrctlPUXbvJWQxpJIN6IozdqP8tD39SLKauKVewx6S8Ja/BrP4edxSad6SfJXKoGW9go9vlhFzzfrVNwE6mWUhAXfH3kHds54vk78cN88D3JzdQBERl7SVmzZSAuXnnjRB7JFy1/0FRi83rN/fcAonaBNtgDpX3yh7bZo9ARkBKYtDsKhF9u5rtgt+fD2kwRzsyMSf9hnBnNWHVTWt3NQJihHOmjcfJhYeteLNIYrWGKn19nb+IdvpNkfe31/+XQ3bmSu/gMg739esV02Pmd8YvQHoMXXeqjKAnntdbOBJciEA1oeHnfDChc7lmEBgYfnDuK2a+tUADvqVs5f6HmKgZQcAYph3idxGwM5afpgE72kp/RrYb16VggLvNlzD8FtumtjEMFtMh+zMe2mZevvhNqE38luzyxVTKm3VjAx3LpV0K367zRiyL52BKdzTQDgzoTS4D8Slr1hc4xYInRPRw+KsGFPD9h8/11Eh7qYqDC9qu2JDhwOWYv49eT8zjqX3M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(39860400002)(136003)(396003)(366004)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(5660300002)(8676002)(2906002)(4326008)(8936002)(6862004)(41300700001)(316002)(6636002)(66556008)(66476007)(66946007)(26005)(6666004)(6506007)(1076003)(33656002)(6512007)(82960400001)(38100700002)(86362001)(478600001)(966005)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9u81SdJgQlB3sS/IQCih6crrsXBQPPRLgmVSZwfxwGxbHu5ZKP/kFGgC9QVx?=
 =?us-ascii?Q?1yJjeEvaaMxuG/Y43/nw1ohauw7/uaGBceIbs3OwPL0qrBeDlrX7nI1QN2Bk?=
 =?us-ascii?Q?cB4mA9RxjOnydZgWKWh4HOchaftcXYCUtgMb105Tt9xOgznGTkvAsUK+9dtd?=
 =?us-ascii?Q?jIuRLmyA7Ie4zXTJu4bV1QwMfiJg+UFJgpQk37Au7OupuvhiLZO47KpON1kJ?=
 =?us-ascii?Q?kV9aHDTt2aSSy/B6HHpgoBDC5tDtgQDX4piMzM9Gt5hnJZAFvj8gl+U5zpbG?=
 =?us-ascii?Q?1V/YCshXXbUd87g9vnde6rqLOBA9aKDMmFfwKL6wlFXwIWf16wgs7d3CRW/G?=
 =?us-ascii?Q?rkrr2p78jAOGXxLzD0JSu3pj188H4UcN0Hd9TYCInfR819EBaASsA7Znl+0Y?=
 =?us-ascii?Q?CYnxCdTL7t8+xio+zEJJPmZBhX+2gvzyBHXjplzkL56mo8UzGTGNBcSs1cIe?=
 =?us-ascii?Q?xI4DFWxEIBn+AxfpS7otexOqNVMnIqCMJEfBokuicR+Sa9riMvqp/UdP3w8D?=
 =?us-ascii?Q?WAwGTUvM15OKt+jplZ5nsrAZJTCt7I7h9pHbn3yJrN8AEjhVgoDuJv28IJpX?=
 =?us-ascii?Q?/VP/+QTLugrHK6+8Bcc+KsmijfzG2bTpeEfDYCXonzOAoZl6lgi7Fs3yYm4m?=
 =?us-ascii?Q?Z4SgppOvJ4lx6EkyWy6P5BxFr5E7RClG+UXaQsapsY9we88/Sryougj6zAvu?=
 =?us-ascii?Q?jCRXmCB0nEp8OnCZzPAa9AViwMdXpGs+1Ec/jGNf3zJX+nuK2vBRdaAsOd9U?=
 =?us-ascii?Q?ut7mDJT9rhdZxh5PxlD8tGskNql/Yaie3aTAigkLZ+nqxoOirfoN8LNZ37cm?=
 =?us-ascii?Q?xia1p5wEE41fUSgcJGkX9ICYJkYNz4VDC8Jy5zTTBtwO4YTxDGF0U9OgkFTN?=
 =?us-ascii?Q?BebWWNWKN2aWtD/ySSxaZ6O1NUKMJ72kK2ITkjQl6EIFn2ZHz4oRjXn9MISt?=
 =?us-ascii?Q?g4qZ3TLcQDgiFr4qVuC3FHg68289PXx3rClglh7mVaXUDy2446sLAXTmeRdS?=
 =?us-ascii?Q?RHdtBk5nVpilIa83H9iWbDatTyByLFGx15qWlMPgoocLeWRMBeDSNoxflwo0?=
 =?us-ascii?Q?OscGJ7dHzIpqKtf0qUzsRQRR+rejUSHP7SjD/U4ajia8HWcoSLdIorp0SdC0?=
 =?us-ascii?Q?31wRHyBhRFN0u1Os88VpzDZBExJF8CxzBJrE23v1EV1eu1+0mDnb8QFBQFSL?=
 =?us-ascii?Q?Ho59GMI1+txulD1ssm+cOREo0EOGYTIY4ncXbFtF658n9BAnBtheG7TKkUzS?=
 =?us-ascii?Q?38jzOr6MMVSbec8UzYSx6jmEsxv3yb0SXdwc6DqfbIrSTw3PcUtUPvPicb/I?=
 =?us-ascii?Q?MosV6JoUN6jPAZh05BI2uc9FRo9Td+lRHClTEJ9TmqfE80eYPEeW/FYCABrF?=
 =?us-ascii?Q?5jms/0aQiRgxbPhf6M203hCpnAafd/Ke/OF+DjNreeFsYtWxIdRM6hBATCQx?=
 =?us-ascii?Q?7RhwApB6j/uUMPAqY2S5EZasEiJqNVnXQ6WVAfCk4zqAmFyIk59vKew8ieN9?=
 =?us-ascii?Q?vEFdIJRNl9GD+5sD490ohf5/ZeE0C/nIuFSbIf844ibEEjzbSUGyUpmBheNf?=
 =?us-ascii?Q?KV9614BZ902Mqjm3A9b13jX5suhH2DiRYmxckl3nepz9HyqzDoAdFI9qZA0v?=
 =?us-ascii?Q?JQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2dde794-1012-4dd4-0d8d-08dbc50a7f56
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 18:48:28.1310 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2frL+kp7FNuOBEqMw2slgicKhox9cI4ZskzsjuNO2ZMRBhvlglf9rtvMDRxwdEpiZgCeq8V9fpwPm0g5rvZUS4RmSqkS9fg2flKcuqvvYv8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5339
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/xe2: Add missing mocs entry
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

On Wed, Oct 04, 2023 at 08:03:17AM -0700, Lucas De Marchi wrote:
> Add index 4 so WB on both L3 and L4 can be used by userspace.
> 
> Bspec: 71582
> Link: https://lore.kernel.org/all/7oqovb356dx2hm5muop3xjqr4kv7m5fzjisch3vmsmxm33ygtv@eib4jielia35/
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_mocs.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index ada3114be4fa..19a8146ded9a 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -385,6 +385,8 @@ static const struct xe_mocs_entry xe2_mocs_table[] = {
>  	MOCS_ENTRY(2, IG_PAT | XE2_L3_3_UC | L4_0_WB, 0),
>  	/* Uncached L3 + L4 */
>  	MOCS_ENTRY(3, IG_PAT | XE2_L3_3_UC | L4_3_UC, 0),
> +	/* Cached L3 + L4 */
> +	MOCS_ENTRY(4, IG_PAT | XE2_L3_0_WB | L4_0_WB, 0),
>  };
>  
>  static unsigned int get_mocs_settings(struct xe_device *xe,
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
