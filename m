Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB45FCA1012
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 18:59:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 916E310E26D;
	Thu,  4 Sep 2025 18:59:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aUzBaKfv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AED310E26D
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 18:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757012368; x=1788548368;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7yLV37M7OzEyvma+0uSNMf0nXU0saeXoWomSR/lL4Z8=;
 b=aUzBaKfvwLimcsyL+LgaK4uS03tvw0UJqhVt4iyauyRf7gHbtjfV1aFq
 9eFtsIoSDwtmHmi1iHTX7AWfTCDZSUA6X3CAs2fMMLTEgMAA67vH28+cB
 EtblilyCl5eSNClIjc+EX14z+6ubkgfY0ZJAh3A2u5BAYg/on58FUf0gk
 e4QFvb3bLbN2w7Wfq2Abl4rPsqLAGyKZEX+vVQGpHq++acLHcll+CjEbH
 HvsqGkI8ZT2rge/EJr/5wwTXpRdz6k0I5Js11CB2IvIAJn6AI6RlKIwKS
 EpsWmWbuBut2vnd2ODdFmXCbpS+/3a+NPan2JKucYInb/8bgN8u1TuMTt Q==;
X-CSE-ConnectionGUID: ZcbE45jzQ0GJHWACPvnT2Q==
X-CSE-MsgGUID: uWEg0GWvRwK6HFNvvtCfVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="63188965"
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="63188965"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 11:59:28 -0700
X-CSE-ConnectionGUID: YU731jQkQEKnIG85FfsdCQ==
X-CSE-MsgGUID: W65h82l+RyGekwykPb2+jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="177232389"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 11:59:28 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 11:59:27 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 4 Sep 2025 11:59:27 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.48) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 11:59:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=isMNG/2bo97jCd2YhzZrXLzGLVfeITQe3a7W9pEA7DlmJPnwcPugrT4gRalNsGN8ikXl9pd4guQnOHrgNqFVvdf4Xh+pp2LUntyTf73tRX9mmetuHnb57WiC+OSZ4TojjVEsa/HBDPki/+RDOnChTEFfRBAKT7RMwQ9EHzy+o84GwBHkkAp+4JVyIOzsnnOzKKTNCBoGpAciVNPm36t4bqRdfcmmMI+LlK/qkuq3oJfsAJjcLHgQOibwf/fW7SJGw7Aihtn3MX3UVezXnxWAMt4jp9QyoCEAmq9uiLUlo2vFuAjYAzuLCOgNLwxctth4Pms65l9GqqcUvm/QYjDSbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HKtfl/5RnQe7cHD2El0RmNBccUmzkZyRL+L+BLV7gJs=;
 b=RCZHf3+ABhJ/KBKQrnvBvhso6znqtX+jgcwEqxFqujrc1QrAMP3pE/hu7EXx7FaEM8ddT3rWl0FJmvBp7qQPts3gzCvw5GRksIAM5zANHeeDfWVWYoQfCpKlO96PHG1b3uJrOJJ/2R3fLnmn0SmAAHncaVDSQ4yvX+sHUhZiiqCqnxBSbGP1GWHTXEOFYKDfosc+rulSQZRvP30PqPVV2vJmM06EAZne/oSBW1n5jVNzg8PTC/JtzLeVOC1CzPpkRNphaEXNo0wSKy4f2rJU5JXBbnKQZHLgT/b5Sis/lDl9EcEnno1p0jL1tj9+J1lmtkh1hhsX9gCbd/alcqeNSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by BL4PR11MB8871.namprd11.prod.outlook.com (2603:10b6:208:5a8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.18; Thu, 4 Sep
 2025 18:59:24 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.9073.026; Thu, 4 Sep 2025
 18:59:22 +0000
Date: Thu, 4 Sep 2025 11:59:19 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <tilak.tirumalesh.tangudu@intel.com>,
 <michal.wajdeczko@intel.com>, <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe: Extend wa_13012615864 to additional Xe2 and Xe3
 platforms
Message-ID: <20250904185919.GB5752@mdroper-desk1.amr.corp.intel.com>
References: <20250731220143.72942-2-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250731220143.72942-2-jonathan.cavitt@intel.com>
X-ClientProxiedBy: SJ0PR13CA0074.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::19) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|BL4PR11MB8871:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ae223d1-8761-4306-660f-08ddebe528e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?whOXhsxFSDZtvLykN0JTrsSFe/H92nbIsbzX0ucvuy+Koxzh98Pw/NfObRwI?=
 =?us-ascii?Q?7prPSnNnH2kJANlbyebELZNND4azgOb6TwV2SmdnJ9Xrc6hvZDNOZ/Avt3DU?=
 =?us-ascii?Q?C1asbYsUvZv4QnjlvpGFEJp5dliEBYMYB43aRibqmhL3PtrlaL0+32kMJqWc?=
 =?us-ascii?Q?ojRDwlyt3y0Sx7b3JVmS+TOvptM0r8YVIo1wEF/AIqmHdnR83JIRSWJJQKgY?=
 =?us-ascii?Q?qBjFAyZN9BfCGdxX3PqKl7ys4bBCDPU9c9pM2UTFMD8DMVkqexYNn6WyI4yX?=
 =?us-ascii?Q?9xwynmbSQrn/EJDZhR0j/M1grb5RCNF4LpOrvOylCckGqINVWin4KZO2Kop7?=
 =?us-ascii?Q?02tfAb+FpVjHR+YXRCNNuM/76RYWKnlyB1EPDY16t2CrO6GhRdRP8/xNfYpw?=
 =?us-ascii?Q?bTviLg0xLolFYWBr/Z+2qx3b51vML3x31NylGd39Ng/9orjnbliPxrRmUiWq?=
 =?us-ascii?Q?wlcOaTtYVQdep2/9rKP1Munzpe5iD6Alg4L/oB6bNzLNhlZ4dHi7yIX7CuYh?=
 =?us-ascii?Q?MuGBzRIolFzJFWogcRvuTGzbM0Sc0lp1fLDgoPP3nMHl5lN3910YmVxjYMHT?=
 =?us-ascii?Q?BXRUqMd9lTSuqMHirWl7v0EYAIEtXfP3k9o+bTP6ajVg03YExD91LwwHS7fM?=
 =?us-ascii?Q?Ka71lGwDs9veWp2LYfHGqu0eW2dyuJTXYHyF+x14EnSRg3X8TDz3L+uBkpJq?=
 =?us-ascii?Q?whUiIfUu1DjVQ/gWo5CV4AcDpo7wgoQkLHjfLIdhCEUaQb6u58UXo7k0i+GC?=
 =?us-ascii?Q?p+KJGFZV2E+rj+WxHokJr1yBUfRSMHoMQEkfoFIQ4KzDK+6pk7qL/QMgMNGJ?=
 =?us-ascii?Q?1d2sjX/mJ5EX6b9KpdEM5T2XJDm/LX5dqSFBOq1dbatLYksNW3eDxtgyCl0k?=
 =?us-ascii?Q?EK0bh+PV8HcO+mhIS9W/zfNyDaXxBugzb1S0pHIA0omEuxLV5qcP8A14qw17?=
 =?us-ascii?Q?pywkQ6Hn4576ieorclweKaGjcodqetQwFySQuM2vTLuh5s45KHrcwWN6T3SL?=
 =?us-ascii?Q?at62UQL/gQOTGvhrLzuNaZO6qRtOivW7XDL5so+/vktlMsPxj5f2Wbm6cwXj?=
 =?us-ascii?Q?Peq7ctn4A38TM2OHzvRoK0PiC+ARySJVS/d/+dYRXvZzFD+QbRMWoed++xFM?=
 =?us-ascii?Q?5e6mzEmQuqs25U3BS1+D3fUJ45ZhuVbJpvoX82aii/PdPfzBF+PldvlvZsdG?=
 =?us-ascii?Q?GIS120vpUDPc/k99BVA8R5L9YNOKujBzGT2XPAx76/9zFxewgj470lyy1ukO?=
 =?us-ascii?Q?NMj8d74HfHe7GFKHpLh6fIgdbqteir/CrHTedWhASyCNwD1Ja8c9hSPXJpn0?=
 =?us-ascii?Q?NnQs0EYjJT3A2SkQy2Cq/XoD7Ka/7M9OodtrGzaMbAmm9zyx8tg/RybWYWvv?=
 =?us-ascii?Q?ZMpYgSOeknjm6+ZJN7VTanaaNyNSwVUDSbhwdyKGVGaY0GVaZg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vpGy60Y+q/gUB4Ho3utKaqWWpdvwXKdiPKPAc0WhffcCmxAULcf7p/IKc6p5?=
 =?us-ascii?Q?ws95L4j1boHapwGs3jkj4ks+sWcYXb1RVrxezNSiFItrX2l+czCww1FpEJpX?=
 =?us-ascii?Q?f1+gL5Pg42XRXDulbB7xsQB4kF7VtZFr58JMCMO6M32oDx5RcknJh0s4Mrax?=
 =?us-ascii?Q?5hEuA2uWzM3S5iD7+5HoAXNni8F1O89B0G6yoTHBQRuT3ot3oLee9QZ9MkG7?=
 =?us-ascii?Q?RiNHiFwCokqxozN5XiFWZ/hst7C8dT/8Vy1Cw2YD8ndckPb/J4deqmki5vFx?=
 =?us-ascii?Q?F/blDkXqhgAykKuWUsCf+aP5+0uT8JpyzC7P25dIJrGguC7R45vxgS1Exukj?=
 =?us-ascii?Q?v2/i9/+3eKetubmaIwlyCizc6siNxwTP1EvBjrNcwXKmM6y4DqXNYdrU8SNa?=
 =?us-ascii?Q?wOeJGNdwPkRWA6CURnAMuG4Tc2mFWN87XLVE2/CGjGS/baCRBmAE6mqSCqRi?=
 =?us-ascii?Q?BhdcoVE8utW5hnGzzXQQl3aKqY5g1fpZyWJKcCs7hgD+NK8B5aQZInTRRbw+?=
 =?us-ascii?Q?TEynhFFzzdAeFR43bq6NnZQhCZCC7N5Y/r4TrHM600xr12JddbusZ9RqHbBT?=
 =?us-ascii?Q?IPb/QPJcxnDekaeg7VC1vxh37BKx5yUGcOsNKqCa2T2olEK8fcIYdnIWeOBa?=
 =?us-ascii?Q?Mjb59tHpqqb8n4uzMbPPYlgrx2uPzClISM2om0rbsYXSbu59sgrMUPBfcfQ3?=
 =?us-ascii?Q?irvKJbrzCBdge3ZREZPldjTBUo6kVP9bgQ3VJItNHHa7NzN64IhjPEaExyQ4?=
 =?us-ascii?Q?/q1MuBC52JLSBZpwAln5pv4Y1ytB0bwgz4yjIZ74vJAYTmv3TzgC4tJ3YTax?=
 =?us-ascii?Q?ispwZqZxrEW+c17x8f+2JDxhcFbjLejBX7lHGK1JGXhErrpQzrynNj7Pq6cY?=
 =?us-ascii?Q?skyfybhezOYRMC6gH2rkfSLe32EKPuQV1AkPkkyEMpTfN5MAx7hd4NazUSA5?=
 =?us-ascii?Q?nPptnEiEOgDhJAy5HgKHxBKaiEtv8s/1EGMmyQ6isCphXYy8OhyYL+Qth1yR?=
 =?us-ascii?Q?sKiRlA9fdpEXIW8lWWcf8uS75u9UvU/dSGkvsBnQ4CPAmogjvkEuwHcYdLtz?=
 =?us-ascii?Q?B2HuUbmq9BLlQ0OA1kuSy/YB6mdO7P+lD20I+hn90+IpLCuXVNti8UH40Qk4?=
 =?us-ascii?Q?ErP/npLqk9V7fkQviQWEekvqG4qL09wp7u3Npz0jY4oKjHMATuAgerpZwQsp?=
 =?us-ascii?Q?JG4Uv6YDhIthXOkTbF950jYiKxGPWSYO4e62bG/5T9LFRGZaRagD82jkwCFx?=
 =?us-ascii?Q?nLtJrqDa+gE0HLtJ0pxeiCqN69tmbsIRB3/4aJsp1Gq23wsxSA02d9eoXzsQ?=
 =?us-ascii?Q?ytDWFqI7lFq2MajPqnNWvG/Xu7JTUP3z2XWH7svBj6lfqcNy+wyhkcpU8jX+?=
 =?us-ascii?Q?Ah4eFS6+hZOukjQBUofFLjfWmoKkXqCwA3P3gewGgOG56Ni5NUbuCTXgKUsB?=
 =?us-ascii?Q?/SlCM4foSl3OaBfhKwZoO1HouaPxeC0nJJucEh4vdYB2JCXIZg36491ZaA6I?=
 =?us-ascii?Q?9cdlAw/J4V4n32eXhUN4YawNfOEAe7JNSjjCPh9/DvKDlJjmHeQmYSbEfKWb?=
 =?us-ascii?Q?s1RRObujDy/iiQfziSiQJ+SZ+q90mk2QZfDSC1NHrmw7CteWcXug9dJibtck?=
 =?us-ascii?Q?xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ae223d1-8761-4306-660f-08ddebe528e1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 18:59:22.5140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2tNFj3vch6derDL2yp5m7/xbm2iduuKlb2/BYHwBePqrD7YiswkfWlUAsETLIbMfFiF/KUeffaS0Y3RQF1OLEU7Cj6niiL5zt6L0rmxgVBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8871
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

On Thu, Jul 31, 2025 at 10:01:44PM +0000, Jonathan Cavitt wrote:
> From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
> 
> Extend WA 13012615864 to Graphics Versions 20.01,20.02,20.04
> and 30.03.
> 
> Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wa.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 22a98600fd8f..535067e7fb0c 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -538,6 +538,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
>  	},
> +	{ XE_RTP_NAME("13012615864"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
> +	},
>  
>  	/* Xe2_HPG */
>  
> @@ -602,6 +607,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, STK_ID_RESTRICT))
>  	},
> +	{ XE_RTP_NAME("13012615864"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
> +	},
>  
>  	/* Xe2_LPM */
>  
> @@ -647,7 +657,8 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, QID_WAIT_FOR_THREAD_NOT_RUN_DISABLE))
>  	},
>  	{ XE_RTP_NAME("13012615864"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001), OR,
> +		       GRAPHICS_VERSION(3003),
>  		       FUNC(xe_rtp_match_first_render_or_compute)),

I don't think this works.  If the graphics version matches
(30.00/30.01), then as soon as the parser in rule_matches() hits 'OR' we
consider the rule to evaluate to true and apply the action, even though
you haven't checked the engine yet.

I.e., what you've written here gets treated as

  ( 30.00/30.01 ) OR ( 30.03 AND first_render_compute )

when the proper logic for this workaround should have been

  ( 30.00/30.01 OR 30.03 ) AND first_render_compute

So at the moment we're probably accidentally applying this to a bunch of
engines that we didn't intend to on 30.00/30.01 platforms.


Since the new version is non-contiguous you can just create another
table entry for the new 30.03 version.  At some point farther down the
road if it turns out no platform ever shows up to use the 30.02 version
number then we consolidate the two entries into a single entry that
spans 30.00 - 30.03, but we're not far enough past Xe3 (or even Xe2) to
do those kinds of consolidation yet.


Matt

>  	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
>  	},
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
