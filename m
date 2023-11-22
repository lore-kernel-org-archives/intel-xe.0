Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F27EC61D9B
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 18:13:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E996F10E0A7;
	Wed, 22 Nov 2023 18:13:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9457410E0A7
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 18:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700676808; x=1732212808;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pwD41kpWLpum4kHBpmgKBGQB5WHyKbd6cRDyvUsndnk=;
 b=hxzMu57H1yUo4TDB/dSOKaIjTG1ZFhXsSiLWNp/1/4KakudOR72/llhM
 oTSTVGdQei0dxtr8E8KaB6GrM7MdyqRe7D2Iydjz506J+5b5BSrc6kOTJ
 QRpk1TxdmTPUkAoTwn6MuuhRAS8LP0qB0JcPboYuBxpV4CfXbMWkrI6iL
 CHrUllWl4PKk3RD0JQ7efOOc2MYoADTQir+FaYdej/MPjes9zQG/sC2OJ
 AI2n/tU5I88JoP+a2E69RgVwgDB4GiG46+IX/zsqCZBD2exGYj+w0q6bF
 SUQi7O7jL4I3IrxxtGKX00THhtqAPZl75Oz1YVhTQc5uOdzMM/whh3cok A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="389273416"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="389273416"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 10:13:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="857849443"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="857849443"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Nov 2023 10:13:28 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 10:13:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 22 Nov 2023 10:13:27 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 22 Nov 2023 10:13:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TjO0gSPX6o3wUe+cdODaZAfdhP+/5sLywIEJLyklrN5klXawo/zDkwMx9qpAPtGKYlCP1Q1ljKW6eiBJ2PQAlYv/G2Pn7RZgwPbzC/imPyKWas1Fx91/8A172OuJbDNH46X8D/DeoY80S6A+CU1vUjb3/Gdsl802CVWycBAGwwgkSr5ONTzBw8D/E9AaI0D0AjRnXau8q5brfHDPB74N6R6ZQGXs2Ak8vZiG1S9KWYB9qQ7I06Pcf20LxTWTfuY4APpHDy9goASCWutBmlQzZYBFpSzayNf5SEcO9uwlLHeF05GVH/jhwglHRn7X0kpxCJ7kza2m1ACr9Ep8qr5jng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TXm/wiHcBxV2/hO4eBYnZ2mahaVCV97kiDb581kYwBc=;
 b=eKbOEDzyZWDZBSq1v429Im3FBjh5i3b7XO9Nns7NhuzH4Q9k1PMqD7d/l0W3qJHrg1YPeo6qmwmjQAt9pyV7NBufEPgCPKqC1mO9Z1l7jdS8sAQrFGNQrWKv6GwGA9ulDZOt4AcY0neQ8XBObvpeQBheZ9vRb8rTacWcxlfHN0UaCH7CZmWbmPNkpZdaZB/OTETZtfjjn2hMvUtJEPMALaGx4bMs4ZlX+CZ6qXef29Db5dxvIUDJ0EdQxQVdz4BaNV6YZw2k7aRxYNX0CLn/Q/hFljjXYxCp0EvPod9SpQCui+q/ORWKzAjgiErztfNHZiNNhjNzF/IkhZeoayGUdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CO1PR11MB4947.namprd11.prod.outlook.com (2603:10b6:303:99::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 18:13:23 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7025.017; Wed, 22 Nov 2023
 18:13:23 +0000
Date: Wed, 22 Nov 2023 10:13:20 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <20231122181320.GI1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231120121428.3576569-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231120121428.3576569-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BYAPR08CA0059.namprd08.prod.outlook.com
 (2603:10b6:a03:117::36) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CO1PR11MB4947:EE_
X-MS-Office365-Filtering-Correlation-Id: d92d7fcf-91ca-494d-7bf7-08dbeb86b6cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zWWhvvQIh3e8h6Mu63eALIfEfy0OywYb8VW2rjgOzP6wQWLB/CDqArbjg0HWPmE1iusZ7JMFO3rhedzqSL4hcGztgupHgip+rYsU35rQq8JtHYXOpqs2LRLskDXuMBZ18tvhmo0E13020mgitcMhqllHkltQv3eGGedm++hNT3Nn5q4R2sbtcebd6SDg5QhuTJ0baSjY31z9jn8MsOSP5noM7wb9NhtO/MmCLmBVgWUQZggkalYRKiowLUrSNQIndDDmBGgGZ+gziiQtuh1GnXNNTF19dsR5bVbvOmMJyhF6RIMwx8deMEyD+thEGuUQTgXoBUJbQ578g/U2PPEnCa4+7JrKdFucw9Q49dLBJENbFiQm3gTPgW2mlky8umQuBHVqPDaD8fU8TfwkG0X0mhsWOYGexLyx7U54CHvEDa3XZQsywNYDSNN5onOq3qFgumtQ6L47ZO4po5GMYDSqqlEydHjhDF4medj4AdSR+Fs/woNl7SU6tUw04IxS1E2PPMggqrQpFxhqgvbXyx0SeYoe+D4BqS4MfljqifP/sKWRv5v7CwKrg/Amj7av37ji
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(136003)(346002)(366004)(396003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(66556008)(1076003)(5660300002)(26005)(82960400001)(6506007)(86362001)(66946007)(8936002)(8676002)(6862004)(4326008)(6636002)(4744005)(66476007)(6512007)(478600001)(33656002)(6486002)(316002)(41300700001)(38100700002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?roK0zuZqk4yJpowJaLa5MkA2AolVXbxxAP+Zn2uP+wELOQrxgEkfvAnPlsV+?=
 =?us-ascii?Q?EnjEL2wxObHeJDzh7hwpRktsxZJPIQuhaz+MNuO+JNt0jnMy0F9bT0xtFZG7?=
 =?us-ascii?Q?TvLtsKGBTFhwA/kmrJPN7h75LXKsp/dzl/+ZPYvSItBLAqG9+ZJeokEmSnvD?=
 =?us-ascii?Q?K+BSx3dUBXU9L6KVuwpiyvW5548tnU5QTLORkgXM4weLEc5bAse9NHriCrTm?=
 =?us-ascii?Q?9WdF7LDtYSW+F7Yevhn+j8oZZAsU1JU9z/XKB4DYdPUPLBM8Sa3383Ft1Nr1?=
 =?us-ascii?Q?fDiTpsxGxcQE/2Xj8VmXolMpDPrVOqqJ7Y4+6ekU9BXB7PKaCDh2I2Xlvfm6?=
 =?us-ascii?Q?YdYU3MdW7wbN4P7NnbTjuXJs9jFNxaMyZQkR8CNakwRPW00gwPQoF/ZRiplX?=
 =?us-ascii?Q?EEcJ3x11SdnEFBlfTIF3bWZvTjVJsoQ57vFulrsv+czkR9mCO/Y+6biHZjM+?=
 =?us-ascii?Q?8Dr/b9ntUZLWCAYRxcABDcuiTtT1vvJ+GT6hKYQaa7ItEkvqkqcxdwkKqkJ6?=
 =?us-ascii?Q?g0meG9DwKA8Ys+oBDgb9jowleGsPUTB3RahiWAXcW+nPd+PnjMQqWMm7xHDf?=
 =?us-ascii?Q?cmJuwiRvMSOPmBpJW08QuiJYfuwSugwoZ1dQcwnvd0Tm8EDMGu8nfqbIEAFr?=
 =?us-ascii?Q?m+pIXh8iK59WlJgBIFJ1bt3opoHtqZT2qtfIbeRq4C9jQBYnKtx6s0KdUl+n?=
 =?us-ascii?Q?DL4mHfWuijrv63hwb76+UrZQ/mAwOlyqpm1tvBIBMaqw2RQdohf4my9is4Ty?=
 =?us-ascii?Q?x5QX86rQml4VMqNs2eq+dInppKIV7O+TTa1OheuVUKnJUDYp5JgLRHfKAwwQ?=
 =?us-ascii?Q?hsjWGdackS0hHUQwkE9R5TTBZq++RQTtHUNBQ2vKHDeRYEem6xmNPv3EYDrN?=
 =?us-ascii?Q?7gJFMSjFEJhxB8epOwTtYxlBJpOkdLE8bW67KhEgbhZthj5GG3CZM85tdcHT?=
 =?us-ascii?Q?Y3ZGrL8J97GCEJB0X4zICPaCEFIF2xoOw8d+VaJqYiM7uS2+iKNBv6Iit+m7?=
 =?us-ascii?Q?OLnlE8hN4wOR+71fojnV5EZPjXZlCbvGqVGih3zFmkR3YCiYmH+dst1E+ZVI?=
 =?us-ascii?Q?QSRHjNkgC5uw8fiiJXQZSbrvF60y9eGOFWIOrZY/mWOIu0axVsvhGTrEMTz7?=
 =?us-ascii?Q?c8XDA4CU8ezuZZjfAqbmHn37yU0fEQ91v+pQb+1yeY+tApkXm4wKWs3EeubS?=
 =?us-ascii?Q?zvLZjFFAgVZF8Ih/CS04S54o3sfoDck+l5DPAtyrpY5IP5Q++OoZxSveRH/0?=
 =?us-ascii?Q?i/IEqZH16vv5uQw/CEnWGS4xVD1rVX/8iYNWQ7HQbdEVH18dueazpl4XINyy?=
 =?us-ascii?Q?kK0j6vadIetW5jkdpAxm5GTEkqbiOcmd2VuIQOUI0eHT9uYI8B8+vjcqywni?=
 =?us-ascii?Q?FZFWNSpDMOdzRsaoMzFCTaarVXjrGRzPmCfZiG2SSZsoZYwzkNVk/jCVUWBQ?=
 =?us-ascii?Q?rj0OecBTObJkjxOnPF9uYQ5x+HmP1iGWcucp0YyzfS30Hye7G3eYQ2jCMVXZ?=
 =?us-ascii?Q?F6jH1q6Dl3G2dXhmyWy+ns4auECUe0Qf9qWsvJSQQnwcfzHmT2QNESIaAttQ?=
 =?us-ascii?Q?3YG2vWEx3PpEdwhhLNS0BRCQiwKi2k1EjAFvosVToQ6c07GxQiCFdxTshKd3?=
 =?us-ascii?Q?Iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d92d7fcf-91ca-494d-7bf7-08dbeb86b6cf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 18:13:22.9616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cYLYCF8DwF8CaG7CiSHijoZPm0wl70WhacD3yDu6SeCZ64DaVlxQXTMLulwR33J8IVDkAmg52rO7RIf6L6P69MOXhMdwdG11hlMlNqNJiPc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4947
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/xe2: Add workaround 14017421178
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

On Mon, Nov 20, 2023 at 05:44:28PM +0530, Tejas Upadhyay wrote:
> This workaround applies to Xe2_LPM
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_wa.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 6572715dfc09..13962b8a677a 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -273,6 +273,15 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  			 SET(XEHPC_L3CLOS_MASK(3), ~0))
>  	},
>  
> +	/* Xe2_LPM */
> +
> +	{ XE_RTP_NAME("14017421178"),
> +	  XE_RTP_RULES(MEDIA_VERSION(2000),
> +		       ENGINE_CLASS(VIDEO_DECODE)),
> +	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS)),
> +	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
> +	},
> +
>  	{}
>  };
>  
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
