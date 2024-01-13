Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE7EC4706C
	for <intel-xe@archiver.kernel.org>; Sat, 13 Jan 2024 00:54:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BE1610E021;
	Sat, 13 Jan 2024 00:54:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80CF110E021
 for <intel-xe@lists.freedesktop.org>; Sat, 13 Jan 2024 00:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705107275; x=1736643275;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=c/bcSn9Q9kyLQRVrT4feIj5YfrNAx1ms0JE1xme6CgY=;
 b=Dl8fHFXzM561BQ/yB5eFHIdzjjoHq73V1ak1boUyOrW8TH+yagPZN75Y
 S6U3v4xB4FxGbm+AeT/r3qRHrv4UbPPbG+7dNxJIhLRB7cvYSTGgr/Qp3
 4UPIM74Rht8rytN+qdNPmzKC51y4RvnyFbapHRaNiFwhyJCR+Iq6ULktG
 vEVZ9dDWmXIA0EIHk82s5o7JogL/JR/V8lFDgdKcosODhifg/oyKgCwva
 6RntOztJQDYS4xe+EMt/VOkQ5V1mPrI6gEip0UunEBr8ZR7pVpRife5jp
 wNI+xL/JnVVoA3bO0ERkF2dEuVuCcPcWeGasBQB5EJHwJAwcGTw3VC7OS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="389771912"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; d="scan'208";a="389771912"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 16:54:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="853435705"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; d="scan'208";a="853435705"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jan 2024 16:54:34 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Jan 2024 16:54:34 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Jan 2024 16:54:34 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Jan 2024 16:54:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JcFaosVpXpjQVB7EYP6YnRzAVWNxKryDFWzVZLQThuZBtrreaj9bSlXEqxFsmnDfE1bsc96DmeZpJcKD4nwaA8XPAD3rdi0y0As8mWG2u88/7N0U46EYXG6+9EFCxMiAtOLyXMA7nqYv4HLe83pnxBaMdgdDpfaJZdAP8Nzm7uvVzqi1Y5GFZra9r+svQsTU2kMD+aXxM+GfD+LRgIGQhwTGJwNdsFA7id9kKb0/TUbfX4PBqKztoAw+aUpaqawQPC4b9RRVzU/Bj6LXQZc+9v+m4raGfqXxEmMQF1q8n9GsWJ1ET3icRFNXXqWBdXC1aHnqv9JkWlpl8vVy2chTnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N39aGoG82AB22PbB40RVUFaAqTEGQByy/PA7FmVqtbA=;
 b=j7w0eq7E7UzWXqDfQNZOzkrlhgsPJ2jxvC2hHjofrWF29855Kg8TV9Mh+oPXqUgA/hdcWygXD6RLtzpgBkvqH70pbyY9h1L77/lxhZMphDDDTA/aJzxPZ4GCBDLYO+FwRe7WRXd21VJ8Wkmqc6Jxk19Mp+KYdrOeA3Vv0XtuxAAVkobFHTOGdm1ECiZrty4k/2TFE8pJO7pLNCNLuuRqYim5wRlKLsb4krF+se6MNqBydddgBhQ2NOf8Db1/FjnFaLLMaiBRbgwLz2txeFxhNz1EjSrJunXNrG0MEI+bbu8VGlHL0Ot5Abm2mZCNHTpFiP5X9eYkw5Y5f2CJdv9sXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by CH3PR11MB8520.namprd11.prod.outlook.com (2603:10b6:610:1af::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Sat, 13 Jan
 2024 00:54:26 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::c59:e321:133a:3515]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::c59:e321:133a:3515%5]) with mapi id 15.20.7181.015; Sat, 13 Jan 2024
 00:54:26 +0000
Date: Fri, 12 Jan 2024 16:54:24 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 3/8] drm/xe/vf: Don't program MOCS if VF
Message-ID: <20240113005424.GC45138@mdroper-desk1.amr.corp.intel.com>
References: <20240112152649.849-1-michal.wajdeczko@intel.com>
 <20240112152649.849-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240112152649.849-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR02CA0013.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::26) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|CH3PR11MB8520:EE_
X-MS-Office365-Filtering-Correlation-Id: 44fd87f3-9b99-4572-c7ef-08dc13d23108
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2PBbFfXQMSp069pQougi8gUJPhs8hLKLbJLkKhnam+K2Ry338O0TwpAukn8euSzPzsbGJc0EaACek0La79LuB9F40FWytO7NrhGzWD+e4Lw02DEGvBn0tl1JZqBS6WItJZvZTqjT2pJ1mjWWzEp2TofY4Exi9uggASNo5zpO2CmPmI0YQzvyt4i/LpwS1daE06FZfKoLi8tIdxPnDQC1UNz7oYz4ITOo5Q5cZ1vYaOZpDA3Y6K8uqsYOjTIwXNd4HStIae+hVYfIuTt0N2kNUzYD6L0J6O9GnidmzZGr3TsNaLjR4nhi3zGcdchFg91oP7gOjcmDXa+uwu+gkKfvRMQznlt9fom9GtSPDQ8ddCjSZKQeJAbN95Y0GMGOVlhK9pmqHHomM+pqSnnrfPV4N2Jq9XY5/NepDTrGZeQSU0jpYbSVsyB2f5YpWlJB3krJ3hQAsg1kmNb5dUoo7W3E4ZgQ7Oe/yT0VQ5NJTvauQWcXGSk+lt7YbdzQcmdkx/5wXrms6uuDROB8KY+zEJcWVIFj1IFaKSxKeXiVp6J/0AMLtaxjsxkKf5tF6hL91lhw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(39860400002)(396003)(346002)(136003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(26005)(8936002)(1076003)(6512007)(316002)(6506007)(8676002)(66556008)(6486002)(66476007)(66946007)(41300700001)(86362001)(6636002)(478600001)(5660300002)(38100700002)(2906002)(82960400001)(33656002)(4326008)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zqlYnTzBKvTlaW0Frqjn4YODsBGlIpRA2ecCM2jkYqbuEccGbTXt+Dz0O2Br?=
 =?us-ascii?Q?ZgsvC7H5gl3hm4L+NR6p/L+TyQi7ipAdajek4QzRJ+QbR0tfeHF+noxFJxky?=
 =?us-ascii?Q?WcAijN6nqhXKGUGadAzlvxKqIb9koA6F/X/7CdP3ETsgcjFSzfA2LuZGTBuq?=
 =?us-ascii?Q?RR83wAn01dJF7OdCqPbzPBUWoVGQ8prEw0sOMGgxRMmkst7HJNJDKjZN1Qgd?=
 =?us-ascii?Q?tlT9L1JpJiS4Zgi4emGPkkTYML2aoGWjg3VVbtVp2ZcpWmhpbfi8iNWr1dw/?=
 =?us-ascii?Q?ySbpCz2jmtX0/ivSgRVyHhG7uQSUd95KNOdkxWxe+NokeHGRKPagjn6gnVkm?=
 =?us-ascii?Q?Jg2Mk33yDkweiAn2nRy9fgB7s/xp2aiQFXMvYYfkxpAeaGzLxPWK5UyCBzT9?=
 =?us-ascii?Q?mOetiXA3eWrrtk7RfxKIxNeUxb0K2vtDrUZ3El0hyh6mS7Lw7ASLFYNJ/b3Z?=
 =?us-ascii?Q?+h1+IlwypnK5wgFjkTeNY4G3U8nS6OB7jmhBW3kiXxubq4o61kMv9Y9TGy3C?=
 =?us-ascii?Q?9hsmPNqTmE8E961+3cWH3wx5+b7dwCBsdkm+iqYNSsSWiFxMLr/7R6MaD1g4?=
 =?us-ascii?Q?aPWHtyVVlMgZlFghNpzKNl/IThhLGy35rd8Ez6ToxNEwkEulKKRNX3Jz7bXH?=
 =?us-ascii?Q?F0Os0pgDtQK6bWUPRhVwBO5Ljr3/1O8FM6MRsHARlPlXtjDe/xLYzXWe+ee+?=
 =?us-ascii?Q?9ZmVvRYWzc6BaOwHHMhsiIzOPsV31LvP0xrPPb0FilBGzX4d0pm4v9vKZOXm?=
 =?us-ascii?Q?rNB3cPi3aR9puCL4A36remA2beFTBZaCQAukv7WyWfjw6iYOKC83t1lgIs7F?=
 =?us-ascii?Q?DU2N4jGGvuSLRGADnEnj+lB7JRJQHybjv4XvZXpVz9tbnG9XJCNNc7JJvUGk?=
 =?us-ascii?Q?uy8bt5PlVkxr+6wCZFXt5szH8NVsp46k4+Oar7wytXKwZi0yuJrgJxoY9Nen?=
 =?us-ascii?Q?zW5aghH5ig6gq7CjKp4F0apOAN2vDniDSO4nAdSn2l4XwYGomT260+qbUQdt?=
 =?us-ascii?Q?0FaYfNtzFl0t3G2JHSfPY+bv/PSO2DGylfMmzJw9+M+/x2f8ek17qiltg8hX?=
 =?us-ascii?Q?++DerzYtXnzgs7mNUQ75AcF7A2jAM4RGhO0IUZr1SO8lgmM1DOn9Dof9U6jm?=
 =?us-ascii?Q?nPRFT1C16O5uob3O+FKs9dJiZxQYv/k77hvBVBCqDHSjvtx6edNxpbEKgGFW?=
 =?us-ascii?Q?BvJiW8bFwVXxb/+c811Z+t+aQfJY+ADfUOhiUIN49RkJk8b/c5oa1l35cz+K?=
 =?us-ascii?Q?b3h2+Q/kSlRenJGvuDRL+JSkstvZc4vOhkVrZqzd9qUwG58yctup0DuUAj4N?=
 =?us-ascii?Q?2UZjU5ekYQ4GqHJFTqjY98m6yHlbu15Z3V5K3IjvZqJZ015/Ve8KWAhbjm6w?=
 =?us-ascii?Q?KHO8QllSM8QHL0GZZUhioF0FnF4oTn3XxXnsDmStIYdbHiDvUyrMWWOUsmUk?=
 =?us-ascii?Q?F84ehD3UkNVwqx2ALjJvrN+Gqn7HI/oXv6UVA68F+EaP6k22HWwky3mUyweE?=
 =?us-ascii?Q?xlhHsniqBmtsWBQ/ZDdQIx2LXKLrud6Z4uKTzM6SAt/XYSi/3NTLFpGOPOpW?=
 =?us-ascii?Q?HrLy2J+OW6fWfFlSE2km1t3aF9oZ78z79MxWTQ/2AsntkHkwKSDIvDY9b3pO?=
 =?us-ascii?Q?0g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44fd87f3-9b99-4572-c7ef-08dc13d23108
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2024 00:54:26.7549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jJLUZqFVzZaPN8CWAcHYL0aP2Ej1G++CfS8oeOq3cIaN3jzpwuNptXcjuFMF6AvI+xAt3LhllTQs7kVv34OUA/A7IG4hrk5ev91I2NR1UB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8520
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jan 12, 2024 at 04:26:44PM +0100, Michal Wajdeczko wrote:
> MOCS programming may only be done by the PF driver.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_mocs.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index d205d684d809..609d997b3e9b 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -13,6 +13,7 @@
>  #include "xe_gt_mcr.h"
>  #include "xe_mmio.h"
>  #include "xe_platform_types.h"
> +#include "xe_sriov.h"
>  #include "xe_step_types.h"
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> @@ -539,6 +540,9 @@ void xe_mocs_init(struct xe_gt *gt)
>  	struct xe_mocs_info table;
>  	unsigned int flags;
>  
> +	if (IS_SRIOV_VF(gt_to_xe(gt)))
> +		return;
> +
>  	/*
>  	 * MOCS settings are split between "GLOB_MOCS" and/or "LNCFCMOCS"
>  	 * registers depending on platform.
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
