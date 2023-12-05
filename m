Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D22FC4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 17:28:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 566D810E033;
	Tue,  5 Dec 2023 17:28:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF8410E033
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 17:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701797290; x=1733333290;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=A1CMgQrghuQMNZW5xtCktB7eZclaXOQHSuMXiXU7H+g=;
 b=LQ0U7pupx1xKnA2tsdcY/nK9EXK9KWVLEaozzNn/lMcx03PmoZHILG76
 bQq0DXqZo5F7+MU2wNqCldlq0e+wd3ET5GEUzYIjXRc6tQ+mG6GMKhqlq
 tlNrcrd+hc7RsSJ3tt0lpMD2UJdsdAUC/u6/jvB+wXgcZn92RvFoQqd2T
 WGcPYbdOlfSQIpvuGNR9VqzDcS5pjpNJ2LnYfUn4hb0Rx+n17jIHJS9HV
 PXbJd/qtYIOeJE6/UUDR3YGdAffvxLToyixE8LDjvPbxCrAKxpTC2UvXa
 WpqdptVmozHGVpLauuyhqjNP+E96cu9V1JMEqjzK+NdR1Z/Ba4g2iMqy0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="384333242"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="384333242"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 09:28:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1018289400"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="1018289400"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2023 09:28:09 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 09:28:09 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 09:28:08 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Dec 2023 09:28:08 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 5 Dec 2023 09:28:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P5CnfQh9IkGqv9lCih+kGs0t3Wl9l180BJTusUD9WhSLiVN1TuYQ7pZ60+Z0jgxYKOxJ+paLxICoLrxTioDJ4jgIyILx6r448DGdweir7LSJZ1v45yUKLOHcmcQWDUiDLaBJezUmgwM7CSYps1EjqVYk88ClqSdAb6gEKh1e7eG+RpcKg4ctlGT2oJ23IU5TmpHLs/WtGoL3ruexX1KB+AzZtXEaZgyzLf0fT31jXXoKRCcKjpbNoJtNmMrgLdRO5EGAdUjcC/m2J1DfgVmKxgGgrMxn5nTWGeKRh8T9gS/No0WIRsmeXlq4jSIDH1wUfFX8NOaIlxGFF7NbVFping==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=he2HP4j8urNnJRFOeIqMcZ+Q/7cwAAPcVZmV4R4LHXU=;
 b=XXT2idv2fAMovBVfW/6968kZ6clkoyj9JHLyM2U3cyJfX7wNg5hm5+O4M2QZ8qdnl6nmsQlC1ZL6xiQgiAOoRxzZdAlXQ+1FSMwadl+yBBUmLK6laIP361YmxkJoyusNxAR9tEzNcMgX37u0SZjlbTIPvMBCyhWTsKNijGMi2m/CJMT6vLJhcXGmA+IKdEeIR9YUJEYN4BMKBDYSsARdRRqBCp2ERe1FFu2SYbSwE02jOzsFklxntFquozgJecjPLISYw65Pau6b+FKKTRgOQ2S5h2UD3CQYLjJud0RKZqQ2Kvjads5qnJB4Yv4ufPRAk6VZgTy45zKd4qOUzAabfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN0PR11MB6057.namprd11.prod.outlook.com (2603:10b6:208:375::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 17:28:06 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7046.034; Tue, 5 Dec 2023
 17:28:06 +0000
Date: Tue, 5 Dec 2023 09:28:03 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20231205172803.GV5757@mdroper-desk1.amr.corp.intel.com>
References: <20231205155820.2133813-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231205155820.2133813-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY5PR16CA0007.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::20) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN0PR11MB6057:EE_
X-MS-Office365-Filtering-Correlation-Id: f87bb6e0-7981-4751-989c-08dbf5b78b09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KYJZqCvPMbo5ylNtUi8wc8bAgvzvMjNTN1MO81/D4m8sWtOUHSnLs80TD+LjrhW5WU+f5iZwxI5c3x6PgJhOW4vXHJG3QBBQniaMABYor/aE+nYfBLbiYwzfjvhS/oQ+w0K4gBOZbknKi9f24q1PtBp0usCACWyrw9jaf+T3ZEupAdwI7UtwJ+v0eSYAxOyP0KCEmbvnzfUqH2tp52rmaCaasiB2gOuxQxwNBmCJppmTZUJIEC9iGnsfQLk5pCq3N9X/nc9TY5Nwfl1MAm9Ojw2Snet55zwZlyZQ73FkWQ071NyzIRpFhVDJorXVRDFsIEkeZKGUfoHeHnFr00l5qmBFAMtZZkb5nJniqoSNvP9qYvOPEhTv35cRWfQVPRMNPS+iK1ODnVYKsjIh/8ApPMt50A5yqhr8KCqUsw8cB0pBSrm1yv3A6zOMGqEBayIORWTj/2GOMgnf+BSqXa4UX+09/gYV2spkEkLwU7oAusqu82YY6Z8W/MrjEh5O61lhFZMvLHzGhJywAdStpIABFbtpeOlxNVIKR0Ijj0Lci8lN/Dk2UQxFof55ndb7M8jI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(136003)(376002)(396003)(39860400002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(86362001)(33656002)(5660300002)(2906002)(41300700001)(6512007)(6506007)(1076003)(107886003)(26005)(6486002)(6666004)(478600001)(82960400001)(83380400001)(8936002)(8676002)(4326008)(6862004)(6636002)(316002)(66556008)(66476007)(38100700002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oh33raR127fwwBOu5027iK0quYqQlhRLGkviw/pucI84RaBcxFdQthz41T4o?=
 =?us-ascii?Q?70XImr5svF5hEsPAvLTCiiKuQsnhieRun0RAkBUOnnkLLrINRo/24Tu3m4F1?=
 =?us-ascii?Q?vJChFaTu6ul1+I8vn51GU0lK8aqpwNYuAycNanTP1GMwLvmAgmNZeO7Nglni?=
 =?us-ascii?Q?g8c4fOGv4ktjS8BxQ4DxwVRNS1uuUGi4RoamB9XI/rHFSPBWiDhsGRLtYDIi?=
 =?us-ascii?Q?JLknRWvEA5wl6E9LnPON+q1yJ1RCAPkHgbjWSjAQAWtcbhicKRmPFawk/czW?=
 =?us-ascii?Q?3AVN0f3rvbhvJrvJfqyFvGJBRzWe8nx7lfq321zfqsgL7jaBXTs4g5Z059kx?=
 =?us-ascii?Q?V+mZj7W791Bwe5U4jfugjoOSsXBoTDnA+deuihKdqVZ0FK37PE3bW7XbjG32?=
 =?us-ascii?Q?JD1SlZ3/H1ZOeKCiuHpEW5qRSuR1+sRqajkmK6ppU1YSlze/y8+fo2Zh94GY?=
 =?us-ascii?Q?QF11mmTo3k6u1YvFu/6M2mQTU9+aN12JtvTBsSI1LL1C27Ar21R1l7yba+yv?=
 =?us-ascii?Q?u2b5v3BjOjHEObLNCiQmebhdy9aMybIuQz1VucvneHMbrnXP1w/8bO+FNznk?=
 =?us-ascii?Q?bPStk/LnzyQopqMkgkje3039nqbsHZXj0x9q3iq7QiYJYTtXG+gFdY+G6Q3n?=
 =?us-ascii?Q?SnyMbtwotjKrGXKuj1qyVrlyTfWrWOvHgXAOqvWexYlIZxwLhBNLc/PIgiuW?=
 =?us-ascii?Q?NaAU3jG+Pqd8yAGu9zRIAtgqdBvOO0IlA2ETvyCTKBskV4g5/HJ6NUI7scLQ?=
 =?us-ascii?Q?jZFNOGgkGLW7yXqst9Flzot2GsiXThQ/GLC8GF1dU6EPLuUXNyflKmZQlxCz?=
 =?us-ascii?Q?26iy9j/FdOk9p7czO2o3VDJUI3hDyg1ZpUUqiQtGwH4BGNlz0TB0vUXrfjyx?=
 =?us-ascii?Q?JNF6U90erBSGphFHPMcokROCBOhQRwIQGgNccHDVEgq9R5A7Wo8B5HIKKzlf?=
 =?us-ascii?Q?KMo/XO2lbzx8/MfajKtgJ3sDmR1+XpZ3rYe2FWIUFnAjaekW4yeHWoKVvdsm?=
 =?us-ascii?Q?HOC+BToGMPZundJenTcW3v2aokOx9Z6d2tSVaEuz0jDl7SWLYeHubsPCPsFA?=
 =?us-ascii?Q?Ew/mDOyR+L6YLp7xXuaqKFLpCdj6et/SuIc9j3IVlv07AfJH1wglUTQXMIeN?=
 =?us-ascii?Q?2NQRfq9UG+Mb0pe0RpPNhETf7EFy094Q+IQ6ZxXHQd6rgzt08YJ2XQNIma6L?=
 =?us-ascii?Q?aOYM8YBEvnj5MeX/wM/CSzSZe6K3XN3+yYucJs0Qqs4bVt+MBOr/TcrfIEor?=
 =?us-ascii?Q?nX+CajgQP7HDvgqe8wiEjRspZt0a3osGIjlgl5jvGhZEV6HzczycdVsPrL8I?=
 =?us-ascii?Q?BE/zKsGI8zNvk4XpXJ+YjPo0FD4zj+e6Q5J1XOvf5yUGPn9hztG0j6LaBs2+?=
 =?us-ascii?Q?Wiek5kbLtL++lt/JbG+nG+OOF2RvOfZRbmiHv4qI+YgTBKQR8REUtvdkSagS?=
 =?us-ascii?Q?KOHiwLIxd63bXQ/tSBhYyyAoxOVvxfoJzHdpNRRZcp1YC3YRd2vZK1mNTWb7?=
 =?us-ascii?Q?bxiUqeuFZVBF+OvL8RQOJMnYLDrnWW1dkxscQc+LnIHXMok1lcljNwhmUO2j?=
 =?us-ascii?Q?sZGd8JSVKAmDvUQ4vrTzREdWi775RjZBu8tVylOi8O4BpJzgBI6P2grf6XUq?=
 =?us-ascii?Q?UQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f87bb6e0-7981-4751-989c-08dbf5b78b09
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 17:28:06.5198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZouWLO2kHzbWMitg/nCZhyVfbT6FxjJBL7kWUWhr2Mu9BEvglaBMrxAFnPYk6tXd/VU9/2IucE1RrmfqSHHd+Ua1NhWc4wjXWT4aQrqVD3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6057
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Expand XE_REG_OPTION_MASKED
 documentation
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

On Tue, Dec 05, 2023 at 07:58:20AM -0800, Lucas De Marchi wrote:
> Expand documentation and add an example to make clear this isn't about
> generic masks in registers. Also, fix the doc regarding read operations:
> the mask part has no effect on them.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_reg_defs.h | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> index 6e20fc2de9ff..c50e7650c09a 100644
> --- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> @@ -60,7 +60,16 @@ struct xe_reg_mcr {
>  
>  /**
>   * XE_REG_OPTION_MASKED - Register is "masked", with upper 16 bits marking the
> - * read/written bits on the lower 16 bits.
> + * written bits on the lower 16 bits.
> + *
> + * It only applies to registers explicitly marked in bspec with
> + * "Access: Masked". Registers with this option can have write operations to

Unfortunately, this notation isn't always consistently applied in the
bspec.  E.g., FF_SLICE_CS_CHICKEN1 (0x20e0), documented on bspec 55934
lacks the "Access: Masked" notation, but is indeed a masked register.


Matt

> + * specific lower bits by setting the corresponding upper bits. Other bits will
> + * not be affected. This allows register writes without needing a RMW cycle and
> + * without caching in software the register value.
> + *
> + * Example: a write with value 0x00010001 will set bit 0 and all other bits
> + * retain their previous values.
>   *
>   * To be used with XE_REG(). XE_REG_MCR() and XE_REG_INITIALIZER()
>   */
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
