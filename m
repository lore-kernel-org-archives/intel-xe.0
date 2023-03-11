Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48735C6FD19
	for <intel-xe@archiver.kernel.org>; Sat, 11 Mar 2023 00:10:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC3410E04B;
	Sat, 11 Mar 2023 00:10:57 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA9310EA2B
 for <intel-xe@lists.freedesktop.org>; Sat, 11 Mar 2023 00:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678493455; x=1710029455;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NpYOmq0tc3B8oIP56iozyycL6lq7okYg26dhJAfb8qE=;
 b=kkbssUPeo2lQ0jHhfSRJsfu/sLPCehvpU3RuX8ankaJ2ljwHTm9w5B6h
 VX71+B7opLeHIDl5d5DQdmVz9sdmtnwwTwtP19tD0sJQo9v2Vej9ni57X
 hFTpfeGnc/PIrsOryLiIlsZOvF2YdUiXLf1lahlA1LGLOIGmXNJ+3e0jP
 QnhzjLEknb/RhrxvovHLIMe2TVsSYfMnILrYg+0Ja8kpG6IyYIAba91ew
 hyWbkklKjrjDdmcT/5wejtUp9nxsAymM5aj5QKw0RgVb1KFmmUwjfYexJ
 MGP0kzpeQcpDBexK5tMguQIhayEefZ6/D9P8n9CEYxBK1SzNBp+bpt2k4 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="339219761"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="339219761"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 16:10:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="746929000"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="746929000"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 10 Mar 2023 16:10:54 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 10 Mar 2023 16:10:54 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 10 Mar 2023 16:10:54 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 10 Mar 2023 16:10:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n/7G/XRo7aTXcZQhnB561TWMFJUg0lBXMjr4D9FuuQuNABTIn0quJ/3xo5I35Wua57cPG+wUO1kaJD/oUe+akGNiJEMW2FKP4ASHnaenEJbnQ/x95wc4wQPot2gYgIzp3yr8Sgw5Aow2wwHvA0hgLWRJQCIRKRl3F33FYWGvsw641oieQBY0VbOhV3ssQkc2wydqCOoQkudyUX7wZm2HZt9bEX5IA1ZkTpJw7pB5jwTRciBiNgCfa+cjCpTTkBZ7gCxVOgwlPbGRpgvKns8XpznfnGwwkBnQw2H9UOv4m3+RZTJJA5/3bbywRprU36MQFbYQxTVItHSLW7KswpBcPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ClHOyxQI5wU2qrEJpNB/PYIHJzIsyuh1iNRrCzNnQX0=;
 b=lGr+/4HdO0XPA6tnkn+HdR00VAVt/xGR82D1HKX4U8C5Uu3zxlqhbv8Qua5T98d8UisdSWK1h75yAtqf+n7zjjop59DS7MFmmaPn+Ky1dtcHrHOw1EgWGk0K9ZP8P1TYw2NRMr+aR1Z0bR7lWGXZwzkgBF8N9yTwF+u2ohGRS3ZABBXaIbl0s+leAvNd9k4UmYOBz7tfx4+fH1vyNkGYlWOME6MNck2MrfjIHJs2PXV4/MF5UKDnk81wpWFTx5YJHrfqOLvs4N/72VC9+Z2BqxBH0BvrWT0p9orspVF1GXbtYT/+l0dsg7tfgD9CoPkgf3M43I3v3YbIY8Ikb9FrqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SJ1PR11MB6108.namprd11.prod.outlook.com (2603:10b6:a03:489::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Sat, 11 Mar
 2023 00:10:52 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%6]) with mapi id 15.20.6178.022; Sat, 11 Mar 2023
 00:10:52 +0000
Date: Fri, 10 Mar 2023 16:10:49 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230311001049.GY1175070@mdroper-desk1.amr.corp.intel.com>
References: <20230310221549.2337402-1-lucas.demarchi@intel.com>
 <20230310221549.2337402-6-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230310221549.2337402-6-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR07CA0048.namprd07.prod.outlook.com
 (2603:10b6:a03:60::25) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SJ1PR11MB6108:EE_
X-MS-Office365-Filtering-Correlation-Id: a36e0937-9399-4aae-b62e-08db21c5134a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QDkL/3TaqB66TNCIGCiGmfyrazBeeE0gEt7/JiDzrlfCjcqmhAAti1+GNvE9lrpXykPyoOUP5YcySSvzEkHPmmLrwZghj3Kz13ObHRyi4KeEpJT3altxf11pVVydMawx9Y0Cd9Dco4xovh5840MDSQqZyjIG5cYNHpjhmQXCar8mgIB77uV1ztmUj3xl90ha3o8tMN26Rl4yFcKQoDpabvwHEyS8RWqG+f46vIU1C3buoZiG8hZbk777sdloYOAbzn8Wr/+lAtS0XGMHR8A5xX2E/esg0BQ5wm3P7SBeFfHauIFGxvjhQR8AbCJdD/V+c1NM6hnpKydhR3qjT75sUGa61SB/tcDnji2szjEsZgKCESC7SqJ85UQSmwvhxk0g+5uTrpuOXGHnGgDElMhSVXilIF2rWI1J5HPezxlp/gxvCsDSO0puTrfkc7WC7yakks6yRh2yKpAje9vufgTwV87Vgp9CIvIzn4z4hhLVNRxa80BhwhVdFr1xurGHm/xb7BksDW8e8gwrEcTVDtKXqwq9xx3QHpoyOU8Sw7jVHX8WBmUzf9+iSMjIhnity0V6UyXkQlRs1Wc6LY+nr692JEZ4C0HQaIXt7l9Sln7NlJ0QLWgLe6cK65JJh+e8XR8HP12gwpMFBG8fmXgweZaHPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(346002)(366004)(396003)(376002)(136003)(451199018)(33656002)(186003)(6636002)(6486002)(5660300002)(316002)(66476007)(41300700001)(6862004)(66946007)(8676002)(66556008)(8936002)(4326008)(6506007)(38100700002)(26005)(1076003)(86362001)(6666004)(82960400001)(6512007)(83380400001)(478600001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QUst4AVMYXxYeaNgyh5vb/kmeOkGOEOaHrb8kUt+54QoqpsQj2FjWw45+k4X?=
 =?us-ascii?Q?NrqYKgsGkF8GWe3LpL3bb8/0WOqRhSawx1LoeZUmpHd2s/+Kq1qaTZXSMJfH?=
 =?us-ascii?Q?mhWZR2ZJm5u94eWf7ioh+4rCBKyk4Bw/kVgp8kTwK+jgZ1PG0RJIi6Cv6wCd?=
 =?us-ascii?Q?pmNAQFMbd3UP4O2eI8TkjWg5cN2EsMAKlu8DUw45wJWm6+Ms1KI81Mhme2ap?=
 =?us-ascii?Q?l/yrDSlouLK3/Eu2/GPq+RrTR2ybNd/k8e+cqltdNjo+R9CQxtUpU6KwxLKs?=
 =?us-ascii?Q?Y0w8PmSD3CotvUjTM7LFenRmEJiMElkC5CW5twMoPcOOTfgY9YI5vuBgHsSh?=
 =?us-ascii?Q?aXBm7LrsXNLRjyN29a8B37nQ5CLvFs3d3JFaN4feWkipNYsw2CXge+3kibxA?=
 =?us-ascii?Q?9FUzmGNlrK/bgGMUkKBVDatPvHoQk02avKZMgpz83aII5IfF4OMmVQTOfA31?=
 =?us-ascii?Q?dtl5ZQpq1p1u7Hm5eOu60at4pwuuu/sETWa+IeRHlDvPHf0Dc4gRJRnw7JeW?=
 =?us-ascii?Q?xN8JKjnwiO6irylp2/dBRZwJXbKlv0dr+nZphwtOegtd6KxrXgNyT4XM12Pu?=
 =?us-ascii?Q?VRJTVLrRxJQ17dG5ec/qDAMq5ldkBPfpyX43/CuS6JCpGOhWLJsycMbheZju?=
 =?us-ascii?Q?bywHXqWge1Qd6AOeJCVf+UnRc+jmSL5aV/L/GF+DVWhq1BTCva+6kj1h2pXZ?=
 =?us-ascii?Q?/YQxx+rlNUCoLNq/bbvO6MuZk8TSX3cmv0efOFM2b+TRbuETHocJsnFNgivO?=
 =?us-ascii?Q?4MUrV1QHR8vhdhQrF3Gb3NfnkNI5SIDCZucqYU/gpgNog6TbR9Fg3f9jxCzt?=
 =?us-ascii?Q?+6tIeivdbw/XUbpL8lqsXTvK7MI16rST0TrJ5R6UvVkVgPb54LO9oCG13ZBm?=
 =?us-ascii?Q?tRTtkjZeDBOE89UprD743mLI6BKXfNCNknuHYw2X5zRwOloXQ/yA0zYQOB+f?=
 =?us-ascii?Q?5BuR22WsrYOK2CCQb8zEUV4Oot3pvdvnGMeFhUk5pscr3RBmM+PEyuf08U51?=
 =?us-ascii?Q?NI+aYA7rHa10Mi3MPbMrpzQidsrMJ15tb58LDSxitvRAfB+C+wdF0VFJP4xE?=
 =?us-ascii?Q?ch5U9/MKuhapDwkBzaBARtKo0+giScbEpwYBA3bdYxbSvHsaUznZTdIS2P10?=
 =?us-ascii?Q?jK075EZd4Wtej8jevG+7iXBlHehaMC5PNyn/qg//Aznbad2NceX0Hdj2suFT?=
 =?us-ascii?Q?ATmnost37kUqcH1vuDsIvQLkwJYFrMzWphgw78/FSZyEKfZkPo9UADcn8U5D?=
 =?us-ascii?Q?igdYAfickvHyBY7zgdaoF4D8IRVHbtVoKHwpOIXh2Jr8WIBxKG12az75t5lh?=
 =?us-ascii?Q?v1wrJu4H5Yrcm1XrONcwbD7CcrS29iXCUBuXMvmGC8ZrxKChMPKwm4/Gluaw?=
 =?us-ascii?Q?FPaxBmL/FBxU3mJUQmaUEYXAj7iB1vqlzV/gMBEDVOXtslJm1VIgYWh55jxy?=
 =?us-ascii?Q?szzF1cf1okrW7bVqc644GBVAnGI/rY/DDIzvGJBgHKkIcrRD2BmyUnDChWIp?=
 =?us-ascii?Q?+rbUSafaQ46g80gtqGvQkDCrzwMVqbLi3zk/VeJOyjpQE4J+ScxgT/zwVloD?=
 =?us-ascii?Q?AR21WOv5xlq3Q8690ZcKjpfV7Cvtl7cWqnUfaQxvRrAvrXNgE+CxG1OoGb/n?=
 =?us-ascii?Q?jQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a36e0937-9399-4aae-b62e-08db21c5134a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2023 00:10:52.1182 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0D93viKcmzGPPAJBU8gDCrJZEwDLjHV+5fANvuV6UMzuQuyOLfSrxcGGEQ8PzvynWQ7r9PtwfI8IBzzZoxuGQJpal2N0ecPu3UZ9Kdl+8OY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6108
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 05/12] drm/xe: Remove policy on preemption
 from WAs
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

On Fri, Mar 10, 2023 at 02:15:42PM -0800, Lucas De Marchi wrote:
> The fake WA FtrPerCtxtPreemptionGranularityControl is documented in i915
> and is not a true WA, it's a policy chosen to allow preemption settings
> to be controlled on a per-context basis by userspace.  The policy for
> the xe driver is to be decided, and if the same is chosen, it should be

Is there any reason why we wouldn't want to carry the same policy
forward to the Xe driver?  Giving the UMDs more flexibility seems like a
good thing (especially if there wind up being UMD-side workarounds for
any platforms that rely on us following this policy).  I'd go ahead and
just move this over to xe_tuning right now rather than removing it.


Matt

> set in another place, like xe_tuning.c. Certainly not the place it
> currently is.
> 
> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wa.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 67539f9d70b4..76c603dfc030 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -236,12 +236,6 @@ static const struct xe_rtp_entry engine_was[] = {
>  	  XE_RTP_ACTIONS(SET(GEN10_SAMPLER_MODE, ENABLE_SMALLPL,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
> -	{ XE_RTP_NAME("FtrPerCtxtPreemptionGranularityControl"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1250), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(GEN7_FF_SLICE_CS_CHICKEN1,
> -			     GEN9_FFSC_PERCTX_PREEMPT_CTRL,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> -	},
>  	{}
>  };
>  
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
