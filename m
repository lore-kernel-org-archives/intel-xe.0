Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CB1F9D0D0
	for <intel-xe@archiver.kernel.org>; Tue, 14 Apr 2026 13:58:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B6D410E239;
	Tue, 14 Apr 2026 13:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ib5o54Qd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67BBE10E239
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Apr 2026 13:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776175108; x=1807711108;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ykyWPi2fqY+jx+3nPCCk3f7zEHrxAXV86SyMZpfdHaI=;
 b=Ib5o54Qd/ZCH4j2Yua58RRZ3q87RYTDadPiE6mfahjh0s3mkl8BZQw7a
 6MN9LhsIax/dmJoQKUc/+xN4hL6EPsUX06jl2HBYToeB+JfAcOTCbjuwP
 sK2FpMVDO+KBdEfbqj75Dkx9Ssd7tqKuhR1rkTN5Sh7JQtHgs+tQ+ajjp
 /g2L2CRLkLKRY+EztX23nki/W2i/Q1dUUpvKIdoOtA5HsTFCaFh/mQjSG
 oDpL3CFI4WeDpsKsnPWiSXavZUbyzYdXyj8Bjyx7wCa90BrjagbESnHWY
 beZ7PNsw6KPWUYgx72Kg6MzH1IAMqoOH71DrLSlch43Ajxu0SDMHg2z+k Q==;
X-CSE-ConnectionGUID: TTJtYo8PTkq2ccDdWI+Cyg==
X-CSE-MsgGUID: 6MGaChpUTVm+q3yzrkbJxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="81016467"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="81016467"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 06:58:27 -0700
X-CSE-ConnectionGUID: us0laSTCSECpMkMZnICtEA==
X-CSE-MsgGUID: BLNwyTNPRGON90q8OA8SoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="230320937"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 06:58:28 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 06:58:26 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 14 Apr 2026 06:58:26 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.45) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 06:58:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VkGaZI6fVr9oDPpZLkkBYD4UBzxtEuyPFw07sE5e9pMhc0O6fZdcC4eBmUkOEsMdzyOmcJ8GjsEoZAI0yLRs2qJUxdHSu/P8gngZPKsQBMD01qmPrn6cw00AsO7Wrf+ng4eQVd4YKoYsqjQkZyU9Rlw9wpnsczFzX5k1YWFNErtthQXLO97TGQ9SN4IZFkhc6o2ZE2rpLm0OiXvkv6zxQtqHokKs42AO8nyz7KV7SaHkyC1G8+sGgvtKeC9G7bvK0wFNJCDEbJvrTUkFHnwM8T/eIplXpbF3WNKZE5HIKevUp6TNami8dZZ7uC2PAa/1KtyK15xrWfmantpDsRqoPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/C0nh8xNEzIh0m26rJkCppILc9EJIrtuTSfYfUEcQ4o=;
 b=jXO0UjM0Kzc3OfEoX6Nke4YAq/5loYREmRBFm6793S/qPI+Vt41umu7HMiP5XJCCsKJo0TuZkdho12rdaR67LAe1ryoWQ+ZGvgIzLXcNlgb2pVgWZl2rK7YcrtGUMbwPR5Y7htTKn2FWbY2dQfxglsv/1pdeXUntQlU2IBWzCZS300vVAkqauONV+LYI28XxgIRZ83Oo6HZzV61YxTNqB63048+JVjgsWo6pBHPsJFZyLeRT6eRUxYze2H8isfC1ZuQLkEHCOL7aFqA5sWbGJ4JM/LBFAIJU4T8TmIsg3cfoM0fbT4G1sC1ulKQsPPFTzX4H8eSnPJiJaQoK0ve88w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH8PR11MB8063.namprd11.prod.outlook.com (2603:10b6:510:252::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 13:58:22 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 13:58:22 +0000
Date: Tue, 14 Apr 2026 09:58:18 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>
Subject: Re: [PATCH] drm/xe/xe_survivability: Fix runtime survivability error
 handling
Message-ID: <ad5H-nLmkCbze65f@intel.com>
References: <20260414124426.566929-2-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260414124426.566929-2-mallesh.koujalagi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0163.namprd03.prod.outlook.com
 (2603:10b6:a03:338::18) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH8PR11MB8063:EE_
X-MS-Office365-Filtering-Correlation-Id: 07e65b72-8c89-48fe-dcc2-08de9a2de3c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 2q51Bn0UjOog23kRxuF6Z7IFS/h+dz+tenXLBx2nMOiDUxqtdA2KPKGrCrlqWCMnVJ2nM/hDpQtTPgJ5V7q42E14B7zG/UCG4GJpuOeRs6tXXEMtY/PsDeVZ3UVQM0g8S3br8mfugZVPlcQwpWpw3U03b1LjmWUr21VAa9IHrnBGF0YitHOLndZTJaky0IdUpwxNL1CKPxYW+v/hzyHqvL2ChqQUzYQPMaObSm8BYPsZZRdnCmsrlKRXkpDPfysIqMKMTbFGGcUtLgPTLyw1com9z4Hp3HENupbbwTuZK8XiIRTmIuv5LXXvw2QQlfqbItF7CQsRk6XqxoPX4FRAfBl83G7aFoi6R88Hn09q7JDg5wYZAyLTVl5bb+ggmA4/mV9zsk9hZG1a6JkwG73Kk5+47gw6NXEjb73AmX7tkjgeMH9kpddsd9UtHUWB6TdW2IwO+pGp2p4/lACm6LkZ+mHjIfrmBfUMIr3TKHZL1rEqkXMKcvsmG0NUw0IgNMJPxTjiSye5wNQGV4dooTwh1qAI1qach8QscqA3ZLWqIro6JdVG8GcXqifmhpkns8skvo10dU0Sas+mIW5klo8JK+awTlYglK6SjFN3zmQLHopcOiHh/NTi5+NJWf+K9QKPymKQUuq3a8aSIBh4NFh552cuNZLzQTLYQQCJstPn98eeec13o+WJ/DBgYqEdTgZg99b2DnBvgaQQz2rJc7IPib3NOrG9g2TiL61qjSxymPg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7Kjp0b7w4CXjkbl92N+0YO4Q4tgPIaofCdOza2Y/9IJNt/P35/HbpnhN7j8r?=
 =?us-ascii?Q?jFPpuVRJcjCYMYlYjWXa9XtiNJFZLlkAGvCa7nnqLKfNrBr0MVGwfnjhqqLz?=
 =?us-ascii?Q?VNdQx9CPHYoqcJ3Ld0Yd8zuk1atdDZuFnFvl1DBxsbugd195jY18QDHd2ar0?=
 =?us-ascii?Q?3qA15UQXMCSJYozGfrVdAXMgMpcCLsCw8TEBQWVlaSS0DtPpnyOcVFLNxK2k?=
 =?us-ascii?Q?CyPQ8x4M9OmQRgLKV9coXMRZl7qMfLzTXLzRzmL/4/su8kEFqeUp1XZjkB5l?=
 =?us-ascii?Q?YTTsohhTpeb6FKtGnVOgdv9vJcC4CWaA37bwBcAWnYaOEryHf5R7+CkHEeSj?=
 =?us-ascii?Q?9x9DrGJ/8vq74rlclK/PBeYIz/zGkDsLdoJ+q+auTUbrmc0jNOhOLXFlcOgt?=
 =?us-ascii?Q?bt6s6HfPVr5uMXgDC2k63yT1Plo15YO3D19RSA78EgDX9q1UiTUgTRKDhU3D?=
 =?us-ascii?Q?z9o50dsIGyZEeENnew6BgQ1fRbIT8Lxi03Xjalee+aHrLvPbnsm4IiLqVYWd?=
 =?us-ascii?Q?reSptAjS5yHfC/prdAFOO0PD+bq+ok+z7KKrOz1oLY85VaIhBv1dXNq/MjFq?=
 =?us-ascii?Q?7iZOhN+JrCPzDNbYxsa/EGzcnY/AGLlFpZ5ZOo2dMQs5t9tlf0UitgSwo65d?=
 =?us-ascii?Q?AAdG23ehbIIAry+I0kHvD/1mAh7kuVHICJChM9rRihGRQzN6V4Vwcod5E6QW?=
 =?us-ascii?Q?DF414PjB9Noq5xgTGUwmySarxguzzUwz4Fnb4J5bthbls7D9HsXMW4Br+ssd?=
 =?us-ascii?Q?NNqIotMNEUKYK9k1p8eGNwxQymZmLmTfCikY7vphDjou/z922A0Is9zf+qDE?=
 =?us-ascii?Q?0I7PgkdaU9tIiE5qrlJBKNNq72iaSC8siP2dWJsX/c9vof5FmYrm/t5dutVN?=
 =?us-ascii?Q?GbPs55CQG9JIsN2QWZ+gpBzqINWYZ+vwqcE+8qgwoQbdrYZGTmaYl73tqH7a?=
 =?us-ascii?Q?IeBqEtlCTwglnwL7OxKvP6sTu8r8HXQFFqvMQIq5tB8WsFgFly1X+YTvJsF1?=
 =?us-ascii?Q?8QtfLebGW8/VVzw7ig49V9KoRzG15ScH2CTBzi1TAcFydACRXzf2fE1gGa4s?=
 =?us-ascii?Q?rLcVcotOyUfDUq1N/IhSWq8dK3JonBINm4JqrxqtVWKWV4h9nC17U75C+fHm?=
 =?us-ascii?Q?FITFj+QjJtomLlOqYLLri83TKD1rAlO+hMRRC+gXe2IXEhprRDO9q2a1zqeY?=
 =?us-ascii?Q?6k8TvEfmD/lXYYe5e+kvz4UJdTnRXMnUML47oDZFyFtrtx9tqbNLyQmQ1ajJ?=
 =?us-ascii?Q?VoEtOlAaqHWB4KujenImFHkh2yc/KsZ2Qxn2sUzK7pzV6BEDmI1RklVL6Rdd?=
 =?us-ascii?Q?EyTeiGKAiTEkkFq/hsnMiaSWBssBXjvZbpk8tmcpt5N0opzk149xHP10S0qv?=
 =?us-ascii?Q?2P1jXKfM3nb0yCpmE8SkauZIXth72jeZopv6Q4nj2ngBDccAQzg6aUuj6cln?=
 =?us-ascii?Q?y+UX1yRoytYqcnlguOgLLs3xy+DYTVCSql7iCOnTgPojP0JAMbcx0GXuoFsl?=
 =?us-ascii?Q?OM/8UOUPcf4DHmOaHaiG4HOV0jTrHJCOZBq+WKRCdCf7MJO0a5d5sNLnZsZZ?=
 =?us-ascii?Q?XI17Ew0QlLFS7RQbEiZhCDcXr4x6ON4FR4ip/WoKu1D0i1/uqWAAGHK8epLG?=
 =?us-ascii?Q?+z98E4egcvObEXNKotOF5giivkfdnl2YXYqinc9JVeRxQmXgEA2r2tzWuQ3y?=
 =?us-ascii?Q?CLVNYOURl/Vzxf7BjLweJ2LVsAVnnD9CZ1cF93WGUtAqpyU9sr0JCvb8vvi/?=
 =?us-ascii?Q?W4n6SzfDRw=3D=3D?=
X-Exchange-RoutingPolicyChecked: nkQgyuDzfin9+EZtd4OryhK7zOhKQ6/JEwCYR27WVqjFRsXaRmFo7QWaJcBqEIQX8jpmSokA7PPbo/oDqc0ezkyA6Zb0hu1ph7tY4WqimCnpLCvkXGP9L4B+3LQE4a9nNSuISjAGhBy8Xc8oK+WaunM0SnaBZmGE8dF/w4YRkzZgEzv+7GmmSZReFX8RNXdC9xNszsMW8n3tZ8QQGT0Gjc29bKrWTkuohofEsczbZlEb64GYh/TEWkjLWgtoDqwo/CWwQefPvOUogj7mWKHMcioeENb3Xo1Yza3qCZuB5pCCUSdtYFThqweLULjqSfYeb6laJo0YCpGxIs9pYdRvGQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 07e65b72-8c89-48fe-dcc2-08de9a2de3c7
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 13:58:22.1480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vLYZEltTdaPIOvkTHEVJ6P0ITWuZ2+cAlGkvxL9B2mFi3HsJQoBXI1wm4LYa/m/R+MzZTmQiKHozyyVZW12vRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8063
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

On Tue, Apr 14, 2026 at 06:14:27PM +0530, Mallesh Koujalagi wrote:
> When enabling survivability mode at runtime, the code tries to create
> a sysfs entry. If that step fails, the error is only logged, but the
> function still reports success. This makes it look like survivability
> mode was enabled even though part of it failed.
> 
> Fixes: a2ca0633a0fe ("drm/xe/xe_survivability: Add support for Runtime survivability mode")
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_survivability_mode.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index db64cac39c94..c2dfc7ea7b83 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -413,8 +413,10 @@ int xe_survivability_mode_runtime_enable(struct xe_device *xe)
>  	populate_survivability_info(xe);
>  
>  	ret = create_survivability_sysfs(pdev);
> -	if (ret)
> +	if (ret) {
>  		dev_err(&pdev->dev, "Failed to create survivability mode sysfs\n");
> +		return ret;

Perhaps this is intentional?
But if so, this function needs to be changed to void and
the extra msg removed from csc_hw_error_work()

Riana, Raag?

> +	}
>  
>  	survivability->type = XE_SURVIVABILITY_TYPE_RUNTIME;
>  	dev_err(&pdev->dev, "Runtime Survivability mode enabled\n");
> -- 
> 2.34.1
> 
