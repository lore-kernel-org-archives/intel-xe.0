Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC5C5C3ABB2
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 02:02:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E2A010E6DB;
	Thu, 29 May 2025 02:02:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AemcR4xA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 473DF10E6DB
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 02:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748484153; x=1780020153;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=D2gRSDUsy7Ej7ROifDRA58Axh71F6HKtbjFDkgT4Asw=;
 b=AemcR4xANPQanF4wp067KpIVQxBNJITDz0fpWbU3L9E81joRzsDOPTpY
 /GtkStcjrGm9romqPOvBqbPu9R7/oFRQdlgmBQ5O8sFqM9PgdIMfbr6L8
 df0TL7I6HLeYnsl2PUqBKZeQdr37mkSyUKXCOLGE2gY9nNTSBrISDTUbt
 +Tf+UkfoZxNzi7sA+pC43f7sLbufuGyfbmmJAFfX4QT1cDnBPaf/Qwgf1
 0hx0GbRLNQ56hNiuXPLlEKoPu7oZhBRvTjKaoQclH2ZaVkhF+g421g/jb
 BaNBwWD7uFjhnfVKJZom4jobNDqyXTMrphs5Iohtai1I1ZTV/lSXPqxhT g==;
X-CSE-ConnectionGUID: GctiW+vYQFqZ0+TWRHVu3g==
X-CSE-MsgGUID: w/1DfrhBQ2+okKxiwXAWfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50406999"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="50406999"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 19:02:28 -0700
X-CSE-ConnectionGUID: aegpQGomRRS+3FOD74D2Ew==
X-CSE-MsgGUID: CWyGwr35Ra2qvAJC41RD1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="144399981"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 19:02:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 19:02:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 19:02:27 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.43)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 19:02:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b4G1QX1PSrQEhc9ZS1mJnNNVJ0ep+Q4Z4S3IpLjkxG63ZOnknD60ei+OF3btAloRiu1biBEN+T4qMM04kmBeQzpCK2S06Shn8827NeZk06cmk/cyUhvCAixz2/yq3axoBp4XWY5KH1R7NVKFX4Gjl5IOPQZRq5PT3pAzkRoE8c2ZzKEI+5QrdG2oFcHVqBAoW1QqChVALF5JEa+hQMII6hxPNxYBZ13pNoD3x8rvVH+Ygm0R/z5/xtOJrVt99SuMGbVw4rDiiB2WZZG8EB68ZvuZWpl5UtLCZe0TtYb4cSAKjgr/7KfgfcZKlbWesHUMrRwWEIoqT3G7B1PfUvOMgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vVlz1pSEBM1iVM0zekP7i3KbeFAZF7qagaHxtwa5iw=;
 b=u18Hs9jrPbVT1EkeCr2yYabS27SGA65vfL3v9CbTNbQ3EOjVZX6XvU8TcrVRzASSzIYAQ0LuuxoveE4/srWFiTKoMAROx/Vnn4gwaMIYhXeGAQ0kUDNWyssHtusT/mZcu6H1sz+kdrpvSXzPHnQurWUvk8qBiclIz2U432XAcKK+ypP8wsSAYMYndhtn2mkD2SEYajrsy6KypfNgAQKrVu0RzNO40nizPL0rnlvze6EmToUuCBeF1WfO9FTzs4FuGPVi1EBFIPjXrJb/bbaFacQ+R2kWhsNFdBS22/4gwSN8Y3hvX/RS7DSe0VVdlQBPHBYk0tO7G08n3934dj+WXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Thu, 29 May
 2025 02:02:18 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 02:02:18 +0000
Date: Wed, 28 May 2025 19:02:16 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Stuart Summers
 <stuart.summers@intel.com>, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v4 5/5] drm/xe/configfs: Add internal API to documentation
Message-ID: <20250529020216.GZ6239@mdroper-desk1.amr.corp.intel.com>
References: <20250528-engine-mask-v4-0-f4636d2a890a@intel.com>
 <20250528-engine-mask-v4-5-f4636d2a890a@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250528-engine-mask-v4-5-f4636d2a890a@intel.com>
X-ClientProxiedBy: SJ0PR03CA0150.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::35) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB6360:EE_
X-MS-Office365-Filtering-Correlation-Id: bde04670-7787-4a66-fee5-08dd9e54d74e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+Wlccg+Vodl9oUVUyhEkD9mgsS8BeNVmEmPqoDplq9MDxsz9f0Z3Keq48RlJ?=
 =?us-ascii?Q?+NMzQZ7U5EHewVos8Wp/eM2AGT9zG1GHGs0Q2b9+BEQ8XoDdjR3MqD36m/f8?=
 =?us-ascii?Q?RKYqT1n79PHR71+YH3KxtZV7LyG+oBLr3VJtBJxpLktKEdg5OVUzIb6a88+W?=
 =?us-ascii?Q?R5UlJ4ybJsUF5C6VGOLCDX8mgJhFWpGdY9dB4IJUEI6EmDIiezCBlgqYSsQe?=
 =?us-ascii?Q?jXbN2LVy1OIlEBq0e2hOMADBA0ghYzGJ65w+n2EzDfZ+fBiB1Rk2nEhbqqlV?=
 =?us-ascii?Q?QnCXaaQw1u1OosPhLp91Ti2Sl8q51riOX0LvkNse19hMVe+4SkVM37Tzmub1?=
 =?us-ascii?Q?UaoMXepn4bpk/5icGRhD2Z6xCg09hXww/NPnbmVE4VhGgNBKWKRKulf3Tytu?=
 =?us-ascii?Q?xAjKSl57NbxosKTQQurZThysJoMvBh0U1zc43MXS5/XZvwBR4WMGSJFkzyuK?=
 =?us-ascii?Q?uDhoPrDjbZqvnBdI/rWZbeKKn+WA+pA0lGv+RDYB88/vBj2nNMyw0t/i47im?=
 =?us-ascii?Q?WBcalE10XXgqmb57yohBtYwOC4lu55gWSr36K1a7lXaQDNvi0+G+HZOzz/2g?=
 =?us-ascii?Q?ODJsp13jTAIeNrvmLixnFa0FT3GjorNWN3ebbtvdSV8lcazdSKlalmwypIzf?=
 =?us-ascii?Q?c8ZmoxsDwJBN5kpN0Y9qmv0m9SdAnL+FAQ3kiJF8vamuOnu9jEuqNtnnhKdg?=
 =?us-ascii?Q?Qj0EIdicnhTEpVjcYqUe1HhU3XSFNAh33W8GtStkeIJargm0/vIw0CpZ2aau?=
 =?us-ascii?Q?bUaxnUZ+5ng5/g2PoalHebb7ThCwoFGeb9ciLi7lmugfHL1dAtdTNyXEVyHa?=
 =?us-ascii?Q?nzH06TzeL8HtEk6V4IZ3wARtL+1dZsw5QL3oY4bZEXF5tF//sNuZbj9AohCL?=
 =?us-ascii?Q?ja/szIV7gk369Eskz0dkt8Zjto1IS4OT1x6BDDWizBIrA+xFrFQ6tD7Iw1A9?=
 =?us-ascii?Q?1NVVyPJLCUr/hFnoPgem2T/6U5VWqibYQEQB1qxSPBu9H+45QPQZyUlKCGSd?=
 =?us-ascii?Q?gSC8mHVKHlxWNlvLRgl2jRbuAW3WqibiKICPPF8FFls9bIdOkG5sT+gw+7XJ?=
 =?us-ascii?Q?Fa+p2IrwhmxqLKq43j+qcPzfx6UOPFB2vOTmvT/lmHF3IEH91nPd+3uwWdk7?=
 =?us-ascii?Q?IFTfTMYDBQcG1ZCwCnLlnUl96OkUFoJf6Vnx1mHgpOajJ04yLSXohJ67cpDe?=
 =?us-ascii?Q?YfBVklzYhJJwZkt2nwZ1kReRLFnsqpBgJBJLlRH0QC3j6AtUdkg5LnBbAs2g?=
 =?us-ascii?Q?QAlPZALHzUawyWs5tLunMiP4MBb754B5NZzq0GkID9h4+cWgZGfGLKWX8vY6?=
 =?us-ascii?Q?LpnTHt7rdfDzZC/+LBiTH5jv1KgRHmKXsPkTaS8WpyyeShHNIcbksIYUiN43?=
 =?us-ascii?Q?wvC/Jcwv0aBpRotbmI6hS/ilojB0JB/DTIhPg6OCZWB7xW/8datWDUflvNcA?=
 =?us-ascii?Q?12oR/HH5nHQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Zaf6StL8N9pXf50QNh2k/t/7HJN8k5HgLUm9WuRtnLmnCr9Maf7jRZ4r70f1?=
 =?us-ascii?Q?78qbBzvTepZzc7WXr8ockpWg+A/Y0e3h5xG20vyzhufK0fEJavgImL8Eanmk?=
 =?us-ascii?Q?Tj8baY/PXC0aGy4Be6I99ssMFhOf49424OKtW/dsn25I7QszhlVNMn3FLOxg?=
 =?us-ascii?Q?7h8L7OY7D5qRrJuTEkQdIiGrlGukWEVaxIpnjtQJrlxeJeSWgdTMgxv1L+RX?=
 =?us-ascii?Q?hncLLvwU27THICTWGdM8YNyrYAXeQONLLlmdbgEH3Q2lubKcKAAtjNbglvhw?=
 =?us-ascii?Q?FuWaiYmf15+D8JYmJpxlcbQK0xVhN+MkLyhCH25RVdgMAGd+E1kyTL3zHcjI?=
 =?us-ascii?Q?hdi8IApZ9Y82lbSNlZcaEg4sZhxmqAGJfhV4eUczif2PTgb1F5bpsmEv1Nx3?=
 =?us-ascii?Q?9yynCwt1fr41lwJ7XQXtS3gh69jq0x00gL5gq2q1h0+MtE9ggdeNsgRFGZsI?=
 =?us-ascii?Q?snucTqaV43r+moRfOkutpVL9VOyM3neOopIRwVmQCBCx4ZDBWqQUxYm/pTb8?=
 =?us-ascii?Q?rc0v32lwrijGS3E+n/1R+4M1y70V7Isfjjy8um+p8FhphbZbvMkMunxCPKl1?=
 =?us-ascii?Q?YvPqEPPkrAV0rukjZPY9dnFJG+7wy1SQ8WKI8KQlVMHz1wGKy6h3htSU/XC4?=
 =?us-ascii?Q?VtKZbt9UsOoSJr1TBFsiBveO6DhaIvnZ5anl2kHtdW3Fj6Z+LcopEDjQi041?=
 =?us-ascii?Q?No5mH5oQhBA5LmSvKFRjJOBz6NV1cAHyQnDxkz3vXtsQ8ezq/YcJeDI92ixv?=
 =?us-ascii?Q?1Dtp4Wxh09d8bWq0V7fnzNzSlensSclqK2xWNrS067egyymb8JI3SBP7ifpA?=
 =?us-ascii?Q?ifeKXpoGXGvKp5nGmzg15S6y/NKBunzj7bydB55B3/PV4rE1D5Cs6NjfNOkH?=
 =?us-ascii?Q?bU66+wciVzn1LBeUtUAI7p3IzpyOPpjxjJXQOOOF8TKg6qi5cdN3XLsUFfWx?=
 =?us-ascii?Q?s7EmUbvVE+a4KJk5IKqqfuJHbEeqQA1Tl7bfq6W6WradHWpAn4t7YQnuaqwP?=
 =?us-ascii?Q?BJKLTx/egPGZlrQmG884eB5pJcZWHljy8lUyVg3nD4D4fYElcNsh8/j4AoIt?=
 =?us-ascii?Q?99gp4SLLSyGMEOOqfjbIL9NBBBJAra596YkRQCuTxUfISbjwObegmhpMacG+?=
 =?us-ascii?Q?SPtz/sZZ4YP7RM0ffBucPPa79gNX9sxndrxvjCXetBEgOljuoDWK3LnppaLs?=
 =?us-ascii?Q?xyZQZCZvSQQu478d1ofKLanKrn9uQY0DMhSVODqogaCj5k+Fn6fvKDTXG057?=
 =?us-ascii?Q?Eb4ItDV4MkJwepiXRLoPFs9PFr5r/7AS1nX3VLWy7FQMELeOSQCnFEPkJBEg?=
 =?us-ascii?Q?ktYys2vF2q+GbkhDTBIj60L9JqLU6xw2VN8MPZ2tJ7Sw4dZbr+hNDuzxNFLw?=
 =?us-ascii?Q?EcsWqjAAsvUdJS8dDU14TRSw1x3Wxh8kPGmPF6Iqr+cqskWoJ3DH2ZoUyIPU?=
 =?us-ascii?Q?Iosx5cpXFxhZU+IbqE5Tgv7EJgfaRAvvftfpR/O9hrXp/mZpufbu4OxFwpAH?=
 =?us-ascii?Q?ipjA61kHHlIGTsCot4kLAJuG9No2CuTGDFZFmlO0aPyZUo/fS8tU2PqEIwA5?=
 =?us-ascii?Q?ju4cIsWHkG97ylt2cfkop4f3Om+l8FxqiociAwTcaBT0q5c6KUWf0mxCgopM?=
 =?us-ascii?Q?WA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bde04670-7787-4a66-fee5-08dd9e54d74e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 02:02:18.4977 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZculDHHzBbufvh+L5Xvb9/9s/TqWTmNyECgmwicb0nVESso0liXTXZJnkvTMCWx0CAcEE4PDVVTueDsB5Se5X7+NBxnE76qBCngPGPZgAA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6360
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

On Wed, May 28, 2025 at 02:54:08PM -0700, Lucas De Marchi wrote:
> Add the internal configfs API like is done with other parts of the
> driver. Also ensure the correct number of '=' chars are used for the
> header.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  Documentation/gpu/xe/xe_configfs.rst | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/gpu/xe/xe_configfs.rst b/Documentation/gpu/xe/xe_configfs.rst
> index 9b9d941eb20ed..7f8ec39dc6dd5 100644
> --- a/Documentation/gpu/xe/xe_configfs.rst
> +++ b/Documentation/gpu/xe/xe_configfs.rst
> @@ -2,9 +2,15 @@
>  
>  .. _xe_configfs:
>  
> -============
> +===========
>  Xe Configfs
> -============
> +===========
>  
>  .. kernel-doc:: drivers/gpu/drm/xe/xe_configfs.c
>     :doc: Xe Configfs
> +
> +Internal API
> +============
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_configfs.c
> +   :internal:
> 
> -- 
> 2.49.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
