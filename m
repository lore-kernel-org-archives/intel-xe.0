Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE72BC77B73
	for <intel-xe@archiver.kernel.org>; Wed, 31 May 2023 14:47:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1ACC10E067;
	Wed, 31 May 2023 14:47:07 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A51F410E067
 for <intel-xe@lists.freedesktop.org>; Wed, 31 May 2023 14:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685544425; x=1717080425;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2EGGAEHitnegdOOzBMEyZM154U232fOPA9L1orf019s=;
 b=KykHQJIA/rg8SLN5vgsdRx4AcJK/+rm3vW7+p3VXPsKiV9SMmBLGgHm3
 z6+qE0RVLwn5KCoJ6JpIv+PlryVmA98M4HaUfNEZops2r8+dqGy0GmxUJ
 567n1i/qBlLEdv5y05FQPJIE6VOeAXLvphJ07XnCFV1EQtHO/IKE8Vvum
 mRJrnEOd2Vc4SBliMNMNvD5ayuR5oC7BRtVFnI+fcgO4rWkpSSMg1UKGZ
 C7btMS69ioIR5KkfCp6CXNfbWt6kAAryWQ1OooGj0yQmW8cLqfdFG7BPI
 TQP8Gf+ZiGTAMsf65ReWA4JoGHiblwktt+GyvHVltNBNR2BPjo1eYrQdY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="355267324"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="355267324"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 07:46:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="1037079924"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="1037079924"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 31 May 2023 07:46:56 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 31 May 2023 07:46:54 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 31 May 2023 07:46:53 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 31 May 2023 07:46:53 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 31 May 2023 07:46:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VIUQH6CCcLr2bfF6ECol2PHy8l4KpMvHjiJrwV26hZbTZEj0br8TQXeYc7EECATUUgBifblBqI1LF5+2cbWoszpaFVUTm2ZPaQNYU5NvOhtKjTqU5FE6a3DmQhmt0qQqtjfi3QWexvgFK3oo/xOwF9nDRzaw99eq2YfM+JyW3jJwAFEUD8ybLTTkK7t11QVtNiz0N/QW4bMVlyCRJq/GXjd/Gg8uM1kLuEUfJempznCG4Nn2PEPXnoo3rHSDfFRmOQzcUvUIAzThKt2a4ZHVmyLfFEDE31VWfVL7YR1wWwd22xgfSUbF8COMBuMcMwvVz8AOhStqsCh+veFtSr4Gig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GD7aTXzk8BXFheCJYVd0gvi6zuMtWb1TvYmvtLoTPT8=;
 b=hNeHmT8wwnIpdHvmWyZTeCB8lAPbcsm5GG8bQ0kddO4azSzXqZ29ypuHWIo/xdj7yb3u9INdBPTaTyLQZ0DNSX2LNHf+XJRCtaoD2fTjB1k0zVZSqLqKUD/hfFWTbE/X6fqXlIfTxQcsznJepaM2+UGilbwSaRKTlh1sc5I5ISCXuw9sLLlYzoZIHl1baRr2cSpD7jrSuk1FeVZsi9jIHAZ9Asdzai1BU2YYDFodz3A1xdhlTlCyGz1nwiS/vV0vCmnnmuf3W50f/XaJ0uf3Ys39CW/G7F/bIZQbI+pI4hwEcqf+Gzsq21oggikUkYswAzBEeTzdPqnTB3uta/mBDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MN2PR11MB4598.namprd11.prod.outlook.com (2603:10b6:208:26f::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.22; Wed, 31 May 2023 14:46:51 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%3]) with mapi id 15.20.6455.020; Wed, 31 May 2023
 14:46:50 +0000
Date: Wed, 31 May 2023 07:46:46 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230531144646.GC39212@mdroper-mobl2.amr.corp.intel.com>
References: <20230531061902.389333-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230531061902.389333-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0224.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::19) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MN2PR11MB4598:EE_
X-MS-Office365-Filtering-Correlation-Id: 5524b24c-9151-43bc-56f9-08db61e5de13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bd1DIIfUHVhuoJSaI4AxV5kIsE84h11AjmzWh9cUHcafH0JB9TMS53Ou5/S76l3lsBJUYWn7ErJM9TKPElzQUsVHsrX4r1jsevtV/jp1eyKs55rUVo0YSE+HiPXG9zSClqNxw4SJ31MXiN/igKv0B8hd+IH0dZ+Rr88zOuEyJKCFoHkdYCTYriaw0xcHKjhIeZMQQZ8sHFLyeKSpdyxfwv3EJH9Rz2JZBHokCgTY/2WwIYJkESwNYTVf3ewNDFA3QrKofrM1mHy6ojb1YCUzsFcdnv/ZIgAdEr4lj/Inafpa0KsDXUbIw2Q4NJZW337JDAtldgYw156z/MfQCImQbLbhe4sClLTFG6jBqXnmKxx1MBPKHeAaaT44OpmonMMliIvyvjiwidO149FwwfXy5ZFFv73Cntx+vI4K9pXKtC+Jj2qRoNjkyRHhJFvw/I+WY7y36P9Zvl59xGy6duPisHo9tP+iwMxH7Y4IViqwTNRF6yhLiz6eIYGmAo/8mXVlfKHxLC5bze2EfouqqoB3mXyGDAK66Re+qPkPq+gG8f47EYjo09MezN8rnZ/iVBZw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(396003)(346002)(366004)(39860400002)(451199021)(86362001)(83380400001)(33656002)(6666004)(66476007)(40140700001)(316002)(5660300002)(6636002)(4326008)(66556008)(66946007)(6486002)(8936002)(82960400001)(38100700002)(6862004)(8676002)(41300700001)(2906002)(6506007)(6512007)(186003)(478600001)(1076003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PhP0EkAZ3t1xq/kAJIcG299a3YZ62DRsfbJeTsLZ+JRJ2KAWuDDqy2Hio+M0?=
 =?us-ascii?Q?tAOkKhucmkYVyOvZdbFs1+bLb2K8LitkKqDpmPdnbJ8hFQZRuJFl57GGt6aY?=
 =?us-ascii?Q?/YBsBLt5aW5HGWEFNp/L2PS0z4pJ7m/3RmlL8lRRTxe7Ty5z2kUQyS8kDPeG?=
 =?us-ascii?Q?cuvdIaqmjOCj9GXh6gvrxgaue7iFla25SVUAvgUAOE3JXhtFUbISttSktFF+?=
 =?us-ascii?Q?TF4/Uzf6AeTIIOOu0ZQ/IyjmNUd2LpjxtXd+QFtnqun/8WD8h5ZweAQ3ul88?=
 =?us-ascii?Q?axAnffnZsiPsDurFRUj+tvbAH4P+rkFaeTdnMdHUOhyjw+G/v3nI1W0DjzAO?=
 =?us-ascii?Q?lh7A0hL8bSrfGVHxdfwEJNETRD1su1ZNIiBwGSEEvDJ8LhADYUbfwOGn2eix?=
 =?us-ascii?Q?ytgNVArhLI3hDcJIF+jxJls0fFNjpQwxsL3ifiWiBNeGqobIR1cy9ltJ/PuL?=
 =?us-ascii?Q?IMras4QGLLP/EIywMlLodngr3aH5kIC50J+pqZqOWLrHg1b1TNK8bFShpebR?=
 =?us-ascii?Q?VJhjBvqyagFBdwMn4yC+ai/Iel7hFjoh3xTpL9Z0UpYeV7EPQdykgfpb2ee+?=
 =?us-ascii?Q?HxM5ydMzquIR51TlkUhuNyoVKjHSzQBNWgiB71/2ZnLwLeXHK3osS7bt81Xm?=
 =?us-ascii?Q?Y1Ll5R9ZwXfY0+gPOBeuGWPKVNoCwZJ5LFsrtH+t1wb/xOJzLSQI+xOxeziQ?=
 =?us-ascii?Q?5FEMIdfKblIkzPD6LZM6CuHEHyU2iOjuH3cMlE58v+bjMpvP3i7wx/adh+34?=
 =?us-ascii?Q?SoTynk+/76NydVXB9OKvXGvKhZxL0II/OR4hhu5cO7tiCArXLAwr+ADLcM4H?=
 =?us-ascii?Q?2lCwc3+LI3kowIBdUqWCCdetN0HYCOrIZgI66+rrgcW37aM+hNIsLN6TgS87?=
 =?us-ascii?Q?S9lqn6pYbM/djiHQi5uMKYIpf5u7XnZIrf8F6rjUPbm3kRBxnK20iytA7Y0x?=
 =?us-ascii?Q?uQn+h2qM1j/eGsKrbGEm145JanHbvICbmvECO78SNGH4NSXCScJ7iv1Mne0T?=
 =?us-ascii?Q?DJKiRoUsg6i3+zV72dYP2x0gLctj+hqfO/CpLEgEl/IWer9NQVpXWf1lj3z6?=
 =?us-ascii?Q?7GJ7+xXKVNeH84xvNoZMuLBKibFNqtgI1HMU7WHDt22t34mOsAbq9qqPV0Q6?=
 =?us-ascii?Q?zlahw5RO9MWAT8VXWZ+YBlclvomLv94KO/ErbVtWWzRF6nQFrxcRp37bh/rt?=
 =?us-ascii?Q?jMZvIaBQb2GtD/I+k1kdcJZ8l31+kABY5zluHpKV2gwVEXm1WmcRZ3kvq4oU?=
 =?us-ascii?Q?SJSZzZBsaqTZduVH9lRV9BmfFC7CtrPCSmSyKfa/g+OUiU/+vax5f5hRdG6v?=
 =?us-ascii?Q?ibvdU2dcv6HsdOs6fI6bFPTh5Z+3WF8kC5l8T9bSjqiw28gNhAM1zI4/i8u3?=
 =?us-ascii?Q?hEMYOMWbSX3JEMHmemhIOLBWOIuyji/JlThGYWdChPpCmHmhrlaZnHSlC7PN?=
 =?us-ascii?Q?vVzGe0OnLJjovQca9qQWFw/O2ApWUAMPPQK0u6csISBmVDsJQ7TDlhrQZyvn?=
 =?us-ascii?Q?1Zz+jhHU/L/zol6bpRs3u7SyCzlc9kaD2fVbeu1XXgja2VlYRu9IZSC2/shR?=
 =?us-ascii?Q?4pt4z/X1L2e5VYMLamQaP7CgWC1kNMQsN9iaXoFZm+HJX10/PqWJtPY++4Ua?=
 =?us-ascii?Q?zA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5524b24c-9151-43bc-56f9-08db61e5de13
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 14:46:50.7434 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9LpbRHuuIbf9WLPdHz9JKd6IG61fTUczp51kgVQxaGBLW78liaVtsz3ugX1LE5MgQ9SD8Q7twVHiR0j/gUC6fx2dPiDFTetVNidnQeFdW14=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4598
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe: Introduce a new DRM driver
 for Intel GPUs
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

On Tue, May 30, 2023 at 11:19:02PM -0700, Lucas De Marchi wrote:
> drm/xe/sr: Fix too many kfree() on reallocation
> 
> When re-allocating the array, the previous location shouldn't be freed.
> The issue can be more easily reproduced by reducing
> XE_REG_SR_GROW_STEP_DEFAULT. This was crashing kunit during cleanup
> on semi-random places depending on the number of save-restore entries.
> 
> Jointly debugged with Matt Roper.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_reg_sr.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index 24d9c73ef279..434133444d74 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -57,7 +57,6 @@ static struct xe_reg_sr_entry *alloc_entry(struct xe_reg_sr *sr)
>  		if (!arr)
>  			return NULL;
>  
> -		kfree(sr->pool.arr);
>  		sr->pool.arr = arr;
>  		sr->pool.allocated += sr->pool.grow_step;
>  	}
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
