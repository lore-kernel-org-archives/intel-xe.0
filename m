Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C03C5AE59
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 20:44:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B83E10E8E0;
	Thu,  5 Jun 2025 20:43:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UnSsmzOA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC0910E9B4
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 20:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749156234; x=1780692234;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=d5ZFKgJMNd2KpszRRBbitIYwRSYS8nobpXY2uBd3EgY=;
 b=UnSsmzOALLa2aI3cp1A4h/Q/GMHlIdm6Bx8B7Pz8FFIyEs2CrW56dxDj
 1zRU3Ktj+XEQaLlGDvFoSWb7dyIu/4X/XlekiiE5jaeg7hCWbvnSFhCaC
 XbSpNDaeZ04+d/CG6A58Zp5Rf8/SSH12lwUfKgKTO0W2ARpjDzjwl+v6u
 heM481GzSKvt8AHwsOkVqZXIY5qy2ST40xoaO9VdbsoOdLmcBVCGHbWKO
 0rfu/KC1Qcm/etoRzhcM5em+T5LCtBYlf10Uyngu1maYV17zXS9VHE4N2
 OzK5qTXP6Hfji/n61NH5XQdzHt2fuM35b8q167gzsbqzL8JKuzUwbX8m7 w==;
X-CSE-ConnectionGUID: DEC73wxTT8ykkHYpU8TeOg==
X-CSE-MsgGUID: Z0FJVUoGStSmbkUEK7Az4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51205357"
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; d="scan'208";a="51205357"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 13:43:51 -0700
X-CSE-ConnectionGUID: PlUuTNLNRpKSzDOOT+NAyw==
X-CSE-MsgGUID: 233ABRbnQcGRm34JiYCa2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; d="scan'208";a="146128618"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 13:43:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 13:43:50 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 13:43:50 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.80)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 5 Jun 2025 13:43:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PEmjQxAnIhwDjkCgQxaZZzvsStUN3vMKu56MpQHMm1m9xqBVKZSCGsCzsIkE+m7/ig+5Gn7p9wS0KZlWrfeuthKJgQVEQ9pkF84n10XDMconsktKfKYgZfImemO3QQ3kOtn4scOJ4Y2ProAWwxYSX9G7HZpxQ8yFq/+Z9uTFZ36WoOQvzfCSkMZU0Yb1OxZJbrHHgTtjQSKjI3M83U3NoL6+zgblNVy3RBkWR6Kn4K6bi0iaNKT8Mi+YAt6+kKbfIA/pMIWS89drDP5r1G3gQkJME16NGbukjlCH7LATYr78suS/EFnqgqqUt8nfVyOBoRCjpf451ULchJEBpXR48g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Im2czVod6Kj6igzE9ehktBynO6wkiawOVpsO3/81Kp0=;
 b=guBWntxbJzThJgIV/GG9QoKzOysOjI/uG2QDk0aycbfjO+7zEHUmUVLYcldumwXiGet6oVafnBsvVbiEopzWyPnIbex9iMLWmTzZJTBQWYWjPTeMHNH4bUyN+bdISdOzVEVir35Y1tRRAV/rKOkFXtHGjr0b1a7rjFRPcioqRjGrtOoy7u8kdCin3oTg197+ZiGT3rlnKJMfebPii3k6+C/Sox/pvH2FctaWn6ChgYy4YucH87KWBvKNSqGEh4Kmt7a7/hqkp9fYfJSA89Jrk0uLBkanJFrn8r1J2d0QK7bZZg09SP1nDlE2uiGIX+OSAbjfhaxYSZLLc/vKf66Xtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6007.namprd11.prod.outlook.com (2603:10b6:510:1e2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Thu, 5 Jun
 2025 20:43:42 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8813.018; Thu, 5 Jun 2025
 20:43:42 +0000
Date: Thu, 5 Jun 2025 13:43:39 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>
Subject: Re: [PATCH v3 2/3] drm/xe/xe2_hpg: Add set of workarounds
Message-ID: <20250605204339.GG5080@mdroper-desk1.amr.corp.intel.com>
References: <20250605190804.1287289-1-dnyaneshwar.bhadane@intel.com>
 <20250605190804.1287289-3-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250605190804.1287289-3-dnyaneshwar.bhadane@intel.com>
X-ClientProxiedBy: BYAPR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::29) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6007:EE_
X-MS-Office365-Filtering-Correlation-Id: 78f16649-e058-407c-7e04-08dda471a884
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8p/5Axl+VeZOJzY6lwnNKdjnxHCKeJSBTwnaqH6jpuIyFTo5XcisAnqEOxSS?=
 =?us-ascii?Q?oPplh5q4ct/lodK3HH9iTY8w7povNwx6t3n11ogD53+Ef/jXrcYKcI8SZ100?=
 =?us-ascii?Q?bjzME/bFjTXX48d958bR+UtYvMrq6VyHuQbdLyscTrWd0Im0gS/B49FfrkLT?=
 =?us-ascii?Q?iuVV4MgROX3gmbyzuamK6jyUe1zqM06ln02b7r5x0dPffxHbwTIPpadcZCyN?=
 =?us-ascii?Q?DQAjoOl9ymqr3Ykd7aHhY4BX+zfnL4aO6gEejZ8mVh16IInkZDUpMbSiZle3?=
 =?us-ascii?Q?pykfUurXsIJdDa0F5scML1mVnkyZjPlyR1E6GBc90PspmUdgpofe/iPdTzDk?=
 =?us-ascii?Q?TBQDmSZ5L7r+YJA6xkB/DyofzF/Ne6Cf3G4x/R/+av7vTShMKXMMZK63JN+a?=
 =?us-ascii?Q?IZcAz4Ihk+79oDo3liGatkaecx6/xDdrNywcV3x1G8df5HzCSZfxFAVsqX5Q?=
 =?us-ascii?Q?UoeG6263QYWLHnUDC5Hsoj2fRI32jQq3H2hEHuBgm1GM7LbSIssPnHyf0Vpk?=
 =?us-ascii?Q?Qp2VOr0G9R9WJSOFaZkSnBckMURR8/zU44gNSYN404a2tKcK6jpua95GpGa6?=
 =?us-ascii?Q?QDBtMO7sLLPIZrr5ISWGujwv0mdHWgWsJetKkl/lf/05dTysRrXv4fMqVHEK?=
 =?us-ascii?Q?Lv54AKsJt1ASAuve6pK5vuYFkqsFjHAvNhQhDPfaY54/rfIqE0jDP2QM5ZxN?=
 =?us-ascii?Q?ILUxMJM13U7PSC5uuKP/l5asOy3ICmu0Gb/2rCkeX9NvFKfASwcd2IlXKYnF?=
 =?us-ascii?Q?Wm93tW5qqJ4msaXw2QGrNHoNM36KMn0ibrCWPe0CqFiXyi1KqHoVX2H/VYDA?=
 =?us-ascii?Q?7N+xPd9A350iNt8edbrLx9QpS1crUHSGucfNNQ22N20k5SuC1n8iGSrHDXNR?=
 =?us-ascii?Q?6cVqALKvdY015wIHDk5HhSbLT04dEAoqWBsi8SY2MHg1SA2hDGRl+s4M+TC6?=
 =?us-ascii?Q?1xAO0xotaAwG3PdUyFr8yescd5devGSZVRIgrh+RgEMGaDH8tr8ap5jEWE/L?=
 =?us-ascii?Q?wm2wla7SoQ4Is3JYYXjB46lT8Ls3zunGew+P45ie3WRlnpMJA1KMhM163LzQ?=
 =?us-ascii?Q?xo+fj1IBSm9b1i1BU10rS1x9bAsAcMdAOL3npj2kq+swD1JRQzi/3KjBeATy?=
 =?us-ascii?Q?s8PI1ikq7x9LdDkfudbM6OYr8ZvJxVEDxv9VHTHO1LHnH8PfqoCcgfGl1mwE?=
 =?us-ascii?Q?EguJyO3UA8aymV5E2wRxmZTwQKDV/wNWER0coJ5MrDl3pgpkS9flHCJIYLA/?=
 =?us-ascii?Q?9Wqs3ONPC3T6sUcGq1sAcCM2HzOHokN4SEx/4NYcVZQXVpiFxTzihjyZItH+?=
 =?us-ascii?Q?zmdKxHu7GsB1f+cec4/YO+16aqSLtsx3c0XhwckhHgJ9w0WZG26C5SxJqniT?=
 =?us-ascii?Q?VIqsfGYpT2bfFzoDVTR7ne9Jje/r2CZwvjx044YKmVYK/flsgEGF9WnKpksI?=
 =?us-ascii?Q?Qf0xK7wlZ9E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NIJd99NofiyIcy3UUn/MBdSOSuvFGqlty/isnzsG+O+BKzElG/9wSLgQ+c+K?=
 =?us-ascii?Q?7HFNf6nY0JbwpH60s5tTXER19hQW3A9RV84LphH1ooZ1Youfcjf8M5pFUuD9?=
 =?us-ascii?Q?/xgIxYVy+rTz1BF/Ji8mHHrjX/WcgMXYvuz+TSyLgyTsrSYCZGJrJA+yeSYB?=
 =?us-ascii?Q?8NmC2oQTA91V37k0EDCbnBluwxkb9wfFC2fUkc63YtCbq9qEdPkkk7KmkhrN?=
 =?us-ascii?Q?C6ELxP7TPnoxh3h2ffpgMhURrwt1sFzUj2WKxTm/lv3EUFQx+rYjdgbnIDhs?=
 =?us-ascii?Q?L+FcWZeBWaObtW4XAY4GD+8GmrluE9qoAakA3EyfO2tZ4XKe2P7dPYt7FuAp?=
 =?us-ascii?Q?MjE4D93XPiQLwwO+HMbHnblPVlnZnjyuZeq4kaAJ/eqcOFOnYLrQXLRvkP4S?=
 =?us-ascii?Q?/m+6v9Q5vVLUS7KD/UrMQZRZtED+W/teu/x6ZOwYlKMG+k86IE84N+OVxuNu?=
 =?us-ascii?Q?ie+2P7wwTGdwYSrd4XKiVRnB3nzsntKB00LXckd4u+mZiJTRAJX8ZlRfuXON?=
 =?us-ascii?Q?yttMwnIqpWzG4bLKnrAeSOXTpjKyjf4u+aOL28COSlZIAtapOM2hPQWP7OhC?=
 =?us-ascii?Q?lyMpSHp+9QrnHkVt8AqDX1nywms1j8x4y4zxR4DixeltcWmuQsve6rRicocN?=
 =?us-ascii?Q?UKeR2Dq17IAF6g0ZJmDf5uq2iqeJnsJzaZJW5sDk0lj/8cau4J4H4zAPH3rf?=
 =?us-ascii?Q?C97K1lXTt0tZRGWqqS3zZiH7/UI3c/BsDvU+2m66VZ7rKUtum5V/RDNOYgjH?=
 =?us-ascii?Q?k4QP6khuhliL/TmVphgdUKOt8/A37WaP7Y/7I7hOLZJkHr9MWQtyO7YZ18FQ?=
 =?us-ascii?Q?rHKr+Hcs3NAqdy0vKPtfkI9U2vtivyuUHffEk6pEkEtLCICE9knP6Iymn4qY?=
 =?us-ascii?Q?Rl78GyJee03iqT27r/PSf+ZxNPDs8SRP1zcE1rYncUHpio2iiTfrOmCfsKNu?=
 =?us-ascii?Q?aE8EidL2i9Aw3Tl+PnJt8lJK2aMC0P+/e6ve5G8m9j8kNwfRJQ3DH9aSYEqU?=
 =?us-ascii?Q?mH5GuH7RSBa4CZnMeVvrRh2Jr5ni5hAWwtZUCXlYLRT2k+yPvcXNR0MLDWAL?=
 =?us-ascii?Q?6+B9d9vwfSxSP38CSQbIF7uZFqfV69xFJIlazeGfYyiKA9uP5TPPz3+Cw6yw?=
 =?us-ascii?Q?Jd/kGwdaHHfChbE5H8YQUmOdQVX7kgsAtFaBcskERF6unB5BwnT0kOgObEDF?=
 =?us-ascii?Q?4pzsEn4oE4nW6nu+4F1NjCVIMKJbc4b3dxC+CBstBx5BZ6nyyHzu6GuZd6TJ?=
 =?us-ascii?Q?IUDnUevq8JlPg049hqgji4UUFtLZC6knjOd1es/6EhPrxL2o0ryOXomjs4rk?=
 =?us-ascii?Q?Z8z0JaKL3QdZeMKBD8KW0fMl9hzZEAcleFP08HPttkkciCEqPWVDxsudPHl5?=
 =?us-ascii?Q?JTlBDBdS5Z02tI3LMnX21i60Q3lC2nSBA4lhSdQNY0ztHe+uHwyTComyK/aF?=
 =?us-ascii?Q?pRGjsJSDTfRNAgbRI1M/Loka3urlWsn62WSNRXIwtZc74LDoR51Fbgt7se7I?=
 =?us-ascii?Q?GnNIZ1XTuXZVXRwmStlZI+7yjiyzRmWVnsdrDT7BPrdnYLgMHnK9o6jMw+Bl?=
 =?us-ascii?Q?T4AaXldW3swptoExXxKCZgi4rg8oRk2dazN/uk6ZWmyMbb2y1/pXG/K+SOIV?=
 =?us-ascii?Q?Vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 78f16649-e058-407c-7e04-08dda471a884
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 20:43:42.3723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g3zCM/UFqUvzFw15znUUIMfnkAUc04GPsCVbDr39SAYDQuhVnbn5EAbmP0adLkDuttZwcoWGrZ4XXz+hcPu/6jswZxBGC47T76op4cRG9CY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6007
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

On Fri, Jun 06, 2025 at 12:38:03AM +0530, Dnyaneshwar Bhadane wrote:
> From: Shekhar Chauhan <shekhar.chauhan@intel.com>
> 
> Add set of workarounds for xe2_hpg.
> 
> -v2: Fix xe2_hpg GMD version for some workarounds.
> -v3: Removed extra Workaround (Matt Roper)
> 
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_wa.c         | 46 ++++++++++++++++++------------
>  drivers/gpu/drm/xe/xe_wa_oob.rules |  4 +--
>  2 files changed, 29 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 67196baa4249..4a76de391abb 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -503,10 +503,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, ENABLE_SMP_LD_RENDER_SURFACE_CONTROL))
>  	},
> -	{ XE_RTP_NAME("16018737384"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
> -	  XE_RTP_ACTIONS(SET(ROW_CHICKEN, EARLY_EOT_DIS))
> -	},
>  	/*
>  	 * These two workarounds are the same, just applying to different
>  	 * engines.  Although Wa_18032095049 (for the RCS) isn't required on
> @@ -533,31 +529,38 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  	/* Xe2_HPG */
>  
>  	{ XE_RTP_NAME("16018712365"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, XE2_ALLOC_DPA_STARVE_FIX_DIS))
>  	},
>  	{ XE_RTP_NAME("16018737384"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN, EARLY_EOT_DIS))
>  	},
>  	{ XE_RTP_NAME("14019988906"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FLSH_IGNORES_PSD))
>  	},
>  	{ XE_RTP_NAME("14019877138"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
>  	},
>  	{ XE_RTP_NAME("14020338487"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
>  	},
>  	{ XE_RTP_NAME("18032247524"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, SEQUENTIAL_ACCESS_UPGRADE_DISABLE))
>  	},
>  	{ XE_RTP_NAME("14018471104"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, ENABLE_SMP_LD_RENDER_SURFACE_CONTROL))
>  	},
>  	/*
> @@ -566,7 +569,7 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  	 * apply this to all engines for simplicity.
>  	 */
>  	{ XE_RTP_NAME("16021639441"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2001)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002)),
>  	  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0),
>  			     GHWSP_CSB_REPORT_DIS |
>  			     PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS,
> @@ -578,11 +581,12 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, WR_REQ_CHAINING_DIS))
>  	},
>  	{ XE_RTP_NAME("14021402888"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
>  	},
> -	{ XE_RTP_NAME("14021821874"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
> +	{ XE_RTP_NAME("14021821874, 14022954250"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, STK_ID_RESTRICT))
>  	},
>  
> @@ -774,7 +778,7 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  	  XE_RTP_ACTIONS(SET(INSTPM(RENDER_RING_BASE), ENABLE_SEMAPHORE_POLL_BIT))
>  	},
>  	{ XE_RTP_NAME("18033852989"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
>  	},
>  	{ XE_RTP_NAME("14021567978"),
> @@ -807,7 +811,7 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_SF_ROUND_NEAREST_EVEN))
>  	},
>  	{ XE_RTP_NAME("14019386621"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(VF_SCRATCHPAD, XE2_VFG_TED_CREDIT_INTERFACE_DISABLE))
>  	},
>  	{ XE_RTP_NAME("14020756599"),
> @@ -824,13 +828,17 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  			     DIS_AUTOSTRIP))
>  	},
>  	{ XE_RTP_NAME("15016589081"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_CLIP_NEGATIVE_BOUNDING_BOX))
>  	},
>  	{ XE_RTP_NAME("22021007897"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4, SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE))
>  	},
> +	{ XE_RTP_NAME("18033852989"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
> +	},
>  
>  	/* Xe3_LPG */
>  	{ XE_RTP_NAME("14021490052"),
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 9efc5accd43d..425cb401c276 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -30,10 +30,10 @@
>  		GRAPHICS_VERSION(2004)
>  13011645652	GRAPHICS_VERSION(2004)
>  		GRAPHICS_VERSION(3001)
> -14022293748	GRAPHICS_VERSION(2001)
> +14022293748	GRAPHICS_VERSION_RANGE(2001, 2002)
>  		GRAPHICS_VERSION(2004)
>  		GRAPHICS_VERSION_RANGE(3000, 3001)
> -22019794406	GRAPHICS_VERSION(2001)
> +22019794406	GRAPHICS_VERSION_RANGE(2001, 2002)
>  		GRAPHICS_VERSION(2004)
>  		GRAPHICS_VERSION_RANGE(3000, 3001)
>  22019338487	MEDIA_VERSION(2000)
> -- 
> 2.34.1
> 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
