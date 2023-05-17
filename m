Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20379C77B75
	for <intel-xe@archiver.kernel.org>; Wed, 17 May 2023 16:21:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC74410E453;
	Wed, 17 May 2023 16:21:03 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E4BA10E453
 for <intel-xe@lists.freedesktop.org>; Wed, 17 May 2023 16:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684340462; x=1715876462;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9Twh6sJXRQ+VpkB4Iv21f4E+Y4aezmZJxAwrarKpbyI=;
 b=AnEWKPIlfJVpPiJ9qqLMGDhOroEn42yUzlP5to8JbIJ/xGVebRI7CFNb
 OYmwI6WLWGG/X5P/fLU4Gn760wtbiiuwHcO02PS82rHH5tfOJXlmq/QPM
 ACF1V8MorsnD9fpJ1vdwpa+pU4XwAZiepi1jXxZcA5PR8XEQgXNSskEEX
 s10u8REsl1VxIaf9SSIF5TJs8mkb6EWmt/wkWi9rDVua3/ope0IV5GJNc
 WbK3hlBprLRyYhecTNieOWneNLcfkoO6ofd5PokpPSO6JtKBZSzndua4N
 m7WcJ12l9edJtUNPrVZUGGHOi39fFyPCAgn/sokpTCwz8Ng4Sg5yVYWIn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="336360224"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="336360224"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 09:21:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="771518604"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="771518604"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 17 May 2023 09:21:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 17 May 2023 09:21:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 17 May 2023 09:21:01 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 17 May 2023 09:21:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fiy3akNAcpuSZbsugOOnj1QhuDwgmcrajmgFKTU/8dGq9xKgQBQBgxY+ecAQXiKI7DrJquz4oA01E7QxF0ZZegETV/ksUo2qrQoGyKAE3sUDP4W7GmRmzBI8vKr6K7SaOIv2cSzmzsIG2W8W/c3vC+r0ISDRz7VxHhFz4aLTeVS0tPnfOpbFFTSgIpGsxOQBW20zIFdD9zfuNNv81J8svDLig54+DY/ybeEgeZZUduA4UkyFCijNlc5q+fbqzuc6tFlcuy44QjD75KLd8JA5Qi/muKvpl0IOgw5fAvtDkKohAeNjscQ5FApwMGS8oxOEAOh2Ek5pqx8RtlRwHfXQhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zDTV6fhe51sWFhOvunRu4QrWIp+OCro85Ew8zvcfFNo=;
 b=Gjg5BdTOI8xy/1ZgoWsWXxdGzsIkLc1oVEMPB/VkWB3Xk1no8pa1Q2Y/kU1uof6IDLeVUBzVDYAWxRWBBiQ+oardYxGxp8hXIGPLLxKjSEQHKFZd6johO9Vx7XI/V1PziWVxw2SXVYjj+KB2LW68NkJUQ+/uXjvtIkHJW0Sfi+dpP193vgCwbGPuoBmfCIfgL/xrRhXCtqz7rL9eg0loRZoeW9Qzff3emUMuE5Eet/GMRTWnfq0ZjSHfum88vxzTzokxLHZDsGEQK1ZQLXab9iIVmTTYjkh1RnKd+l5NPiq//zKF58rUDVfw0pBx026huroYghpJrmC0BFtzEcq4HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SJ2PR11MB8565.namprd11.prod.outlook.com (2603:10b6:a03:56b::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.17; Wed, 17 May 2023 16:20:57 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%6]) with mapi id 15.20.6387.030; Wed, 17 May 2023
 16:20:57 +0000
Date: Wed, 17 May 2023 09:20:53 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230517162053.GN10045@mdroper-desk1.amr.corp.intel.com>
References: <20230516221950.3512818-1-lucas.demarchi@intel.com>
 <20230516221950.3512818-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230516221950.3512818-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0203.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::28) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SJ2PR11MB8565:EE_
X-MS-Office365-Filtering-Correlation-Id: de8a7c47-18a9-4170-83db-08db56f2b18f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fUsVRP53sjVLmDnpcLSXVzIdJVFs5R93fjTckyfmTQc0OOCsdBGE+KGQj4Me+lDKsH+oyCxSgYVcPKROSyFbOJB+7ZMCzrr9myO33tkhVrFC1JiafTWwWu0QkK4KF8ZXgfy7DWhbYy6M4MeeNKxpFFN9gvtH3FhcEJ43K+isx4OW3B8XqRnTHqk7CaEeFyli1XtomigGkueILtO8dVhRT791f3Zppq/HfBwvqepsV1CXqe4tE/7JbDU/NTJMgG7fPMyraf8NtmVOWDYChSd1B2JGzv8Ugga1WiT5KbzTsMTJbUMKK6QbGcLnlWVtlTRVzxU9RjNf1J1+lrn4aBVeejGPYATu9XHl6sq9v40aV3PzCUjkgF7Eqa5sqVeiBiZ4tpZLDrnlcTo0gwlEM6q/qqalAB7YD+OzcTyplX3k4aqo4gRePKsJcmGsazVkVopj9Pq2XwYWxeTia6aNnF4CLnPFxD6uVBwrVcqfZuA9AnkaDsQkLP/BSVykc+lElMnvUwnog8LBhVX48SX7gF7DtrDDCd6MXMHH6XCtDmCzoPFGAtGmUq2eUJo/yNIuNw0P
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(376002)(346002)(136003)(366004)(451199021)(6506007)(6512007)(186003)(2906002)(86362001)(107886003)(1076003)(26005)(83380400001)(33656002)(38100700002)(82960400001)(6666004)(41300700001)(6486002)(6636002)(66946007)(66476007)(316002)(66556008)(4326008)(478600001)(5660300002)(8676002)(8936002)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gZQd+m7O61jFRgmnc1a6tiz+nSkpy1ANcgijeoXSxrICfqn2yfrHO88+5JsS?=
 =?us-ascii?Q?pSV9RydSqQyue5qyoq4DWdTGyN5Awvnd4ZE+f5cA725Mzxsv4opoEPNSl3i4?=
 =?us-ascii?Q?onBeI4evGgGf1AKsAlulARr5uWKS9XEDFqgQZHB2y4sCbtqPY5zyDdrCj28W?=
 =?us-ascii?Q?gZjZqOp5LoXCkgaXDetlMfc8EssdcEzeleyX8b5FeVd/qhjaa2CvJWdDDFlD?=
 =?us-ascii?Q?FnvFxb+W60McrYoXc36KStDFQyFfTS2YwjAiYXkbx+QNZOh+OUkBl8OdSNhl?=
 =?us-ascii?Q?Ii/l/gwKdjNfV8/bhfnzt8nDLtb3b292onyLl9pxSUyLZYj1BerkMuGCQZAZ?=
 =?us-ascii?Q?q1R/Brmg8SKgtEF5CAOnkeZzbxveOdb+lXK4U5kuVIGr8UhPgVFYjmkFt7kI?=
 =?us-ascii?Q?T7mi50Pc4I+A0jXciwViAvJcvPvB0+1JqAh+3bnsJYqSefOe7anBY1358RIk?=
 =?us-ascii?Q?TWtGZKwm5Ed+ZebesPuMuNDDdjfKQrnaGAVgxxir/COyEBpgtlZRoERJr9j+?=
 =?us-ascii?Q?Nr/Q9eMUvQNEwNwjZKU0ju0bQAS9il5gEDlzqVjwcFGKiSQOieKTDlE3Pno3?=
 =?us-ascii?Q?uPripGqg58rYyZFvcipHPbpmxRdcun37ZSQ2o5XeyHeqvAaYi5qEvxwjYLb0?=
 =?us-ascii?Q?hvDc0W088cwAzAZX4G0XKqKOzp+Xmezlg2GzxDmwBOiYJYDtZLK/XD/a75Ez?=
 =?us-ascii?Q?Qs6eQlmt8ScLz1mVk88EPV3ieUkR0HAgwUOh0iI1D7eFLS89yfHv5am5+b6C?=
 =?us-ascii?Q?M9gjqORv8pmqQ0Qgdlog/BX9u5NSNZskMF6Tg2t1+08x1leuaUdoSKTZkwS1?=
 =?us-ascii?Q?BsLgXZEbBehDQo0EWrm7vCs3FGraH48mDdceWQG7q+Bp5e+HYn8sjytk9cc+?=
 =?us-ascii?Q?fBZzLGDh7GnLyKzFqOerrNPM9axM7t5Ovr4b1CVFHDS5y38OZDcoqnV99x4S?=
 =?us-ascii?Q?c/bWdeNUqfjcy0YkFDOKSK0thl8goGR6lxPKkJ/CI82O7j7HGRMf5PB0oLP5?=
 =?us-ascii?Q?8VQDR6AgH2TlWPJm8hCbtd3IUudUCICf/bsSo4kGPaB3ZcbhY1YNPLZPEV6m?=
 =?us-ascii?Q?KIgbwcPDwmohAGyrC946iP6ohL9vk9O+dRbFMXmaluOxrlzXeKXB8vKuSPXS?=
 =?us-ascii?Q?Uji1tqB2d8ffDHroAR7QXllB7lHeFTgBn9JC3KAiRGCUTzw/wj/dcJdh9NYb?=
 =?us-ascii?Q?e6zEZkpQ7PuLt3JOtt/gj6IZ4mW7ko/aAEICsf7jQ39tFkAZieHNeObScWJ3?=
 =?us-ascii?Q?PfrE93BAu5ij+qb0FRGucUFAkLBa8aEoK/MbOXu8YNwzk/YOowVeqstDfuAR?=
 =?us-ascii?Q?3WgOZXr+xiQSz7mS8pcZB+y1MEoiHeCL7f7iuF/S57lAjnuUv53zuCyVUOyF?=
 =?us-ascii?Q?CR5s4SlgUTFMM91jENGisKfcnXC3vnIHc84B0mPwhKCQv/5mg5iaxhW6P/Jo?=
 =?us-ascii?Q?3LIuTH5jpzaEhsn7SNnc0A8Jg9/rh1tTTEkcILUGaJJeu+suX7D9yXO7UiT/?=
 =?us-ascii?Q?0NlkqEikIW0hQmT23ooNTshLXrnClgNffq0KF9JW7yGyQhPaBbwELCdhLN1P?=
 =?us-ascii?Q?FncfP4TEMNneCvg07Z36r/lwteevOjy7PAMmXbyZ5M4HOTooa5k5kzrQE5L1?=
 =?us-ascii?Q?rg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de8a7c47-18a9-4170-83db-08db56f2b18f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 16:20:56.6922 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F+WUyFJII5KobC5roVBo7guDUGRbhC18E4aH+7KocJrDF/pcMbekH/SO6G1qPFuUoumHvzk8Ei/Fm4yoAj7TdD1Fixyz4Nt0Yu23aJsrido=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8565
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 1/9] drm/xe: Fix Wa_22011802037 annotation
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, May 16, 2023 at 03:19:42PM -0700, Lucas De Marchi wrote:
> It was missing one digit, so not showing up as a proper WA number. Add
> the missing number and annotate it with a FIXME as there are more to be
> implemented to consider this WA done: ensure CS is stop before doing a
> reset, wait for pending.

Should we open a gitlab issue about this workaround being incomplete so
it doesn't slip through the cracks?  I'm not sure anyone will remember
to come back and address the FIXME otherwise.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> 
> Also, this WA applies to platforms up to graphics version 1270 (with the
> exception of MTL A*, that are not supported in xe). Fix platform check.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index eb4af4c71124..1b5d0b6ad180 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -162,9 +162,11 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>  		flags |= GUC_WA_DUAL_QUEUE;
>  
>  	/*
> -	 * Wa_2201180203
> +	 * Wa_22011802037: FIXME - there's more to be done than simply setting
> +	 * this flag: make sure each CS is stopped when preparing for GT reset
> +	 * and wait for pending MI_FW.
>  	 */
> -	if (GRAPHICS_VER(xe) <= 12)
> +	if (GRAPHICS_VERx100(xe) < 1270)
>  		flags |= GUC_WA_PRE_PARSER;
>  
>  	/* Wa_16011777198 */
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
