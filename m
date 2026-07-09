Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E41C3C44501
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jul 2026 21:27:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA8A10F6E1;
	Thu,  9 Jul 2026 21:27:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lyCtSoDI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4AE410E0DF
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Jul 2026 21:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783632472; x=1815168472;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3wbWBKHu0HgK469r/k93gmbVz2mWtJ0dK+8gLk93l8Q=;
 b=lyCtSoDIUAs7zps8JCFvNQc7+4qGmeHGrptEoYArZ9yrqAaUTBxTRgrW
 GS3JT38um6RvgA+J2btqkxaDd3oLbxBjc19EvJOem4vJT4hPgSazYpyrD
 as4DpENCOW9GarK44VERou/4rBzIYOqUjHSyGLBtmDu0ob94tBOIDJbal
 yZbPt4TBZT8VYXQenw3kGSXAZEuOnfaQFUUErWxlY+RCNyD4ylwYlry9w
 kHsyb35xX4qcJreB6irSvbwGRUHCj8Gtluf0Xc8f9kBVRbnaqyB3SmePL
 4h1BntxjD5adZO9+w1CUxQcRWN21AJ/c8zy6WIV5mQswbMSMw0Lye4YGd w==;
X-CSE-ConnectionGUID: xuQEr8IgR/mFwErNgwlzOg==
X-CSE-MsgGUID: g4D4GhRuS7+pvmoXwdXtHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="94681295"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="94681295"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 14:27:51 -0700
X-CSE-ConnectionGUID: fejeacOaRQ2Sru/TNowGGQ==
X-CSE-MsgGUID: xMlwxegWTRCiUIkmHFpbZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="284796952"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 14:27:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 14:27:51 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 9 Jul 2026 14:27:51 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.2) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 14:27:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=epILpZN0dYcPuu4pjik70kc7Kzqc+ss5vMC8JkYPuaFg76pgprprnMa8fJqPztbRkqVqMPiZ8LX7CHcojJR/EpPMAn9wU1iMICebsrSqdBT1Rcs1fM/G9fby51hrHcn6uuchtEawyw0SXMx7qSl+YWMgWDqVPcdsJ8PF5oVwVtTNkCu92yTPfMEFXivf5oWcv2QzlAmXklyhmco4ICrrZ4VYT1GBJs+8Yew0AmTHinup/Z+70Nw7Cd8ufss/kJVsmDgZhkoCk8Ol6uhbynsFc9ulQSHoeLLsgj13uGEUlvcpkg+QKrfsuEdtADi7qELBewnkgQ5A1ztPlnyNEi8GsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E1HRrmghf6kMJ+KpRdCDsHajCrSNUvkhOYM5Le7EXkk=;
 b=LORBaVY4Nmc9WvqxoKn/DTssnHVHyM2il9b2RAfuq2ESDBmwIpQsgope4Lo5e7qstyspCBm6WYEARQIXjqf89Dz5InSOwNUtDLfV3+zTSJO3OdnQEzmzbEgEzNRmgJDqi1ah0F9GCOLyiXgiCDeANCaUJ9WRQj51DU3Tt8M+hMTdZVK/jBZfI6ibmNcO43+p0uTJSblj0TM8H62mlkz2yHym3aFQQHQwZ/RXXCSNpCajFOrS0qSYQc5idgA0gl7eQHdI8seUa+jWrHLrIC3KK2MUlYifTdnrG2ry3yuNnHwyGzbv9QAh32beSXsqS4YzGO4uGAZs6ItmPK2Vd97KFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ0PR11MB8293.namprd11.prod.outlook.com (2603:10b6:a03:44f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Thu, 9 Jul 2026
 21:27:45 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.21.0181.009; Thu, 9 Jul 2026
 21:27:44 +0000
Date: Thu, 9 Jul 2026 14:27:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <michal.winiarski@intel.com>, <matthew.auld@intel.com>, <dev@lankhorst.se>,
 <jani.nikula@intel.com>, <lukasz.laguna@intel.com>, <zhanjun.dong@intel.com>, 
 <lukas@wunner.de>, <daniele.ceraolospurio@intel.com>,
 <badal.nilawar@intel.com>
Subject: Re: [PATCH v9 08/10] drm/xe: Improve wedged state management
Message-ID: <alASTH5nHedKPPP8@gsse-cloud1.jf.intel.com>
References: <20260701083051.450259-1-raag.jadav@intel.com>
 <20260701083051.450259-9-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260701083051.450259-9-raag.jadav@intel.com>
X-ClientProxiedBy: BYAPR21CA0004.namprd21.prod.outlook.com
 (2603:10b6:a03:114::14) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ0PR11MB8293:EE_
X-MS-Office365-Filtering-Correlation-Id: 87dcfd99-a5f0-4a8d-d65e-08dede00ea2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|13003099007|22082099003|18002099003|11063799006|5023799004|56012099006|6133799003|4143699003;
X-Microsoft-Antispam-Message-Info: IRWl5M8juktsb5NuXyN5vfEWhi7JGv7f+M7sogV/N0sPZM64Vt/bSCDiAcACLtqFMUZeeHoF++HT51NPcg9nlOczpdAC8GeZM+LKO+z/hInKpN7fFYfmfEpBD39M+UDB5HnEewtQWI5LexTE8aLYtziek/nouveCgmIWPgp94C2cyYBq0b5mWDjXQdbkHDmXoAlaZcxTexi6rF+klPn6fUCzbTKErtV9DwSwpLOH33secEd9n/KqmSdMiFBUOJx2VTbWJmNe0Y0Mb4f38ggC3a+HLwWXwNaxbdAiBQe2OEkQ8iOmR3xDOTV5pwZ9hxMNJj+KFG8oDygJI8JxIPAyV7VL5HTWIIPCp5iudHSHF0bLbB1hw6nu69NGKro9dIyzwhcdvQORkqGKUlmDE6nZMjclN06Cta9zVDxXfBbxMwLMJtFoxpA4TzXSPvT9Pxwxa/nQY59FazyIs4JyC+XIqtDMlCZtsbVaHFKPOyyD1slrzddmMAxY4musNT7t2Tam78AH4CftxfrBr6ICIGA5T374m863gzMrYnWTv5rIRO6IED1EFzVTPl4GEzYuhBlJo0wVDEr2BnBBKG/38SCD6Q84nQQg/FG3xf4xK3DHauhtfRzMNgzq3YQ2rVmSVPdt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(13003099007)(22082099003)(18002099003)(11063799006)(5023799004)(56012099006)(6133799003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MpiecA0bgg6p13T3HpFtbzAX07X+esfBf5ohoXx2UpPOpARcU9iLT1SdBGfo?=
 =?us-ascii?Q?n5Z9R6ObMPrrhBdNMM8+I6vY34535yQ5S/dIYvB1jpmMxJL8E5i6PJVo1HW4?=
 =?us-ascii?Q?LNPz4+KVaWIOLS3Es5UqUow7LNY0F/A4zzueZb2ov3C7mnGKiL/XW5nDSV2g?=
 =?us-ascii?Q?DbuYkvILc2qA9FLOxOBdaot+ctTaiJDFdifpBoELXwbFotRT5b0tiVyQtC0u?=
 =?us-ascii?Q?YVfnIM+zcriv/7EBJYAPcjryepF7eqEyC2L71MqcreRwp3ImFPTCeSogRcI5?=
 =?us-ascii?Q?a5ODvqV8OwD45OBwBs6f0U8tB4ddoaXQhkzcOSu6ZE0Ah+52uvqgp5aABxNG?=
 =?us-ascii?Q?+rHqQk56+TTB6vsmdGVCRS0nCw/Jhl27PoBfzZZXzab2eAcoNrQK5nmiUr89?=
 =?us-ascii?Q?nu04tcn5aZbxhxad+JtJQLsLkjq9gzSKrrPUyH7vcaneQffNLdm9L4wz4696?=
 =?us-ascii?Q?6Cy8EI22+pbqsfpLXaxuQc9QTk8eq2vFdF8+Kl6KdNkH9LFMDhZFSLB1PeIR?=
 =?us-ascii?Q?eFoYCH04zEM58l9G5hkrcOr2631CSUr0GjgEoZNYqQ/pnLSE269qgkkr5pxH?=
 =?us-ascii?Q?YtzaIotniLoJ48UPZ+BvCOiHA9GnVYoMSo26S5nDM+P4z8xJu00YXit5Msqi?=
 =?us-ascii?Q?ZcQK14INcssoRCgoPgmK/K422Rdpi3tHeqZy0s+hevcL5vdiCR0IogswrxDr?=
 =?us-ascii?Q?rsp9EcGQcLfOqVZqFbm80HsJq9J06V64KDBIm02vz3yE3srdcw+LfcF5cA9V?=
 =?us-ascii?Q?T/EVJwC9MmbJvCCj3JZh1R4g27oS3gMS4y+u4IPECwxb6QJn2ODu84qKy9Bp?=
 =?us-ascii?Q?7xpIuzEf3EapiN+kYJwNsvu45EE6KO83R3Pzb2eqYQt/yrQkp2g95x2Bz/Ii?=
 =?us-ascii?Q?19r5TmjHkyg3Wsjn9xgY6FXTjOrmu6mAc9noKjtqhqCdqZ/qP9YKRMRtAJB5?=
 =?us-ascii?Q?PS1XATd9w5Bh3S6topAhL986gULvf8oWiqIJpIjCAqJ/lb0SlhTrcfMgrIOh?=
 =?us-ascii?Q?fEVuFuIz3/uanTkaln8DTaObfMGarnc7+YTB0kG7m3lxR476msa4izmfOvF3?=
 =?us-ascii?Q?XEvF8C5/zyz+vLfVtfPCI/Su+4EWlZHtJfnA2FHhYFPH1qM3kDMEPpE4yRNx?=
 =?us-ascii?Q?ZYdKp2/xjYscv9UQyT0NQ9YZl9mBgBRagf2hb4arJhUKgBiUScw8WRVQLk8Z?=
 =?us-ascii?Q?z5JUpv6LIg3uGikH27HDkUSa1KXNaN1LE7gqHjoQf18OpuvEo832KXcrUY3f?=
 =?us-ascii?Q?l/rbgVWQ08kFnXCO+oXeZ1nv5Mrx1BE4pwCHA/8yWTt1uZFeLASBBWYsJXwa?=
 =?us-ascii?Q?MILu1ysQLogec7D/xsJ+0iipxNHnwcswlSOAtGq1IoWwPbSBCQUDsn3WF22i?=
 =?us-ascii?Q?ebNSIbAuJWvsM3RBCexMz4cbQc0zU3wp3erZs2W4yfHqvSZKU6b8ixXxmZdm?=
 =?us-ascii?Q?Hk1NGU2n+JylapmGkq/fWaeQT8M5IxopG4cTRDVxU2Tpw3eWFrlOYOenlzj4?=
 =?us-ascii?Q?xw3fcfmQkIJd48L6MNoy1HOZ7Tzf5qE4L04m9mXqk5Ifz0e4R4RviV6Tr0Es?=
 =?us-ascii?Q?CiqlOW3VYgvW0Kt4Et5m+TDCS9IGSFpompgiVmtKsc19GVkADxD9eFSzIETm?=
 =?us-ascii?Q?qhmc9fhoUL6Q7ygEwp2nMo/b03REGgNR7XUGpZrE+q901/oCzpTiNo42Xodg?=
 =?us-ascii?Q?RHk+HmUZ4FGRcLYy0l4NSSUwZyCYDdYWLNGeFjX58QCkc4Y7Cik+toxZZ1xt?=
 =?us-ascii?Q?w39TrXWHOeo+IqAhn4ik6mNEXa1U0gc=3D?=
X-Exchange-RoutingPolicyChecked: c/CRTqwZPiYQn0h2xcLEEuIJb4TlBCF5W2TDCAlHDztaqgEbAu91NUe4W4VJ0WnVsx+CKWy4I1GY+EccxCD5kP3U2x6XzYEm04t4TZZ5SlT3Ax2rjWPHRewitJ3ht+ILSY9UkThpjJg+yyS1YbLH6SHGr/V5NIVZS5MPyN8bshE4h2ezMG3BB1DlfTjVPjCaMLyqWjIZ5foCMLpvGQgujCznN0nqXCeq7LSFx3027pWjUc86iQnp2U7ZESJqSnK4aWzt19ZIsXi+YeaAW0f8YdqSDmEHqEYiwI6yGIlXbbT1gvgP9I7eYdqO3O1ayOLP+GmcsbyD+qNfbFO93K136Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 87dcfd99-a5f0-4a8d-d65e-08dede00ea2d
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 21:27:44.7464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w0mUyCXfm1rWgR7o/wJMLy21iQjXooqyXxgJGn193GnugAS7OuZMwZ0LaeI01HYhHEKf+Q7esRoi3prnkGZSvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8293
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

On Wed, Jul 01, 2026 at 01:59:32PM +0530, Raag Jadav wrote:
> Currently, wedged state is serving a single usecase where the device is
> permanently declared wedged, but this doesn't allow any wedged state
> management for runtime usecases. In preparation of usecases which require
> to facilitate temporary device wedging, convert wedged.flag to wedged.ref
> which serves as a driver internal refcount for wedged state and blocks
> critical path execution during device lifetime. While at it, introduce
> wedged.perm which signifies permanent device wedging and operates
> independent of the refcount allowing relevant cleanup action on unwind
> path.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
> v9: Redesign to prevent races
> ---
>  drivers/gpu/drm/xe/xe_device.c       | 102 ++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_device.h       |   8 +--
>  drivers/gpu/drm/xe/xe_device_types.h |   8 ++-
>  3 files changed, 84 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index c5e3e2d1f7c3..e8b6afb29ab6 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -598,6 +598,10 @@ int xe_device_init_early(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> +	err = drmm_mutex_init(&xe->drm, &xe->wedged.lock);
> +	if (err)
> +		return err;
> +
>  	err = xe_pm_init_early(xe);
>  	if (err)
>  		return err;
> @@ -920,8 +924,10 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
>  {
>  	struct xe_device *xe = arg;
>  
> -	if (atomic_read(&xe->wedged.flag))
> -		xe_pm_runtime_put(xe);
> +	if (xe->wedged.perm)
> +		xe_device_wedged_put(xe);
> +
> +	xe_assert(xe, !xe_device_wedged(xe));
>  }
>  
>  int xe_device_probe(struct xe_device *xe)
> @@ -1387,6 +1393,44 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
>   *   firmware and restore device to normal operation.
>   */
>  
> +/**
> + * xe_device_wedged_get() - Acquire wedged reference
> + * @xe: xe device instance
> + *
> + * Get runtime PM reference and block critical path execution.
> + */
> +void xe_device_wedged_get(struct xe_device *xe)
> +{
> +	int ref;
> +
> +	/* We should not be runtime suspending as long as critical paths are blocked */
> +	xe_pm_runtime_get_noresume(xe);
> +
> +	ref = atomic_inc_return(&xe->wedged.ref);
> +	xe_assert(xe, ref > 0);
> +}
> +
> +/**
> + * xe_device_wedged_put() - Relinquish wedged reference
> + * @xe: xe device instance
> + *
> + * Restore critical path execution and put runtime PM reference.
> + */
> +void xe_device_wedged_put(struct xe_device *xe)
> +{
> +	int ref;
> +
> +	ref = atomic_dec_return(&xe->wedged.ref);
> +	xe_assert(xe, ref >= 0);
> +
> +	xe_pm_runtime_put(xe);
> +}
> +
> +bool xe_device_wedged(struct xe_device *xe)
> +{
> +	return atomic_read(&xe->wedged.ref);
> +}
> +
>  /**
>   * xe_device_set_wedged_method - Set wedged recovery method
>   * @xe: xe device instance
> @@ -1427,36 +1471,40 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  		return;
>  	}
>  
> -	if (!atomic_xchg(&xe->wedged.flag, 1)) {
> -		xe->needs_flr_on_fini = true;
> -		xe_pm_runtime_get_noresume(xe);
> -		drm_err(&xe->drm,
> -			"CRITICAL: Xe has declared device %s as wedged.\n"
> -			"IOCTLs and executions are blocked.\n"
> -			"For recovery procedure, refer to https://docs.kernel.org/gpu/drm-uapi.html#device-wedging\n"
> -			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
> -			dev_name(xe->drm.dev));
> -	}
> +	mutex_lock(&xe->wedged.lock);

Sashiko pointed out what is likely a pre existing issue:


Can this mutex_lock() trigger a scheduling while atomic panic?
Looking at the call chain, xe_device_declare_wedged() can be invoked from
a hardirq context when a hardware error occurs:
xe_irq_handler()
  xe_mert_irq_handler()
    mert_handle_cat_error()
      xe_device_declare_wedged()
Since the interrupt handler runs in atomic context, acquiring a sleeping
lock here causes a crash.
Could this synchronization be handled without introducing a mutex in the
interrupt path?

This is an issue and currently unsafe too as we take mutexes deeper in
xe_device_declare_wedged call stack too. Maybe declare wedged in an
async work item? We have other issues in xe_device_declare_wedged too
which stop / start scheduling which also isn't safe unless this is on
the GT ordered work queue too.

Matt

> +
> +	if (xe->wedged.perm)
> +		goto out;
> +
> +	xe_device_wedged_get(xe);
> +	xe->wedged.perm = true;
> +	xe->needs_flr_on_fini = true;
> +	drm_err(&xe->drm,
> +		"CRITICAL: Xe has declared device %s as wedged.\n"
> +		"IOCTLs and executions are blocked.\n"
> +		"For recovery procedure, refer to https://docs.kernel.org/gpu/drm-uapi.html#device-wedging\n"
> +		"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
> +		dev_name(xe->drm.dev));
>  
>  	for_each_gt(gt, xe, id)
>  		xe_gt_declare_wedged(gt);
>  
> -	if (xe_device_wedged(xe)) {
> -		/*
> -		 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
> -		 * hangs, so wedge the device with 'none' recovery method and have
> -		 * it available to the user for debugging.
> -		 */
> -		if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> -			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_NONE);
> -		/* If no wedge recovery method is set, use default */
> -		else if (!xe->wedged.method)
> -			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
> -						    DRM_WEDGE_RECOVERY_BUS_RESET);
> +	/*
> +	 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
> +	 * hangs, so wedge the device with 'none' recovery method and have
> +	 * it available to the user for debugging.
> +	 */
> +	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> +		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_NONE);
> +	/* If no wedge recovery method is set, use default */
> +	else if (!xe->wedged.method)
> +		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
> +					    DRM_WEDGE_RECOVERY_BUS_RESET);
>  
> -		/* Notify userspace of wedged device */
> -		drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
> -	}
> +	/* Notify userspace of wedged device */
> +	drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
> +out:
> +	mutex_unlock(&xe->wedged.lock);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 11b67820eb67..89bf909c96e0 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -194,11 +194,9 @@ bool xe_device_is_l2_flush_optimized(struct xe_device *xe);
>  void xe_device_td_flush(struct xe_device *xe);
>  void xe_device_l2_flush(struct xe_device *xe);
>  
> -static inline bool xe_device_wedged(struct xe_device *xe)
> -{
> -	return atomic_read(&xe->wedged.flag);
> -}
> -
> +void xe_device_wedged_get(struct xe_device *xe);
> +void xe_device_wedged_put(struct xe_device *xe);
> +bool xe_device_wedged(struct xe_device *xe);
>  void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
>  void xe_device_declare_wedged(struct xe_device *xe);
>  int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 46a9e9fad7a9..80fa60821a47 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -485,14 +485,18 @@ struct xe_device {
>  
>  	/** @wedged: Struct to control Wedged States and mode */
>  	struct {
> -		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
> -		atomic_t flag;
> +		/** @wedged.ref: Refcount for wedged device, blocks critical path execution */
> +		atomic_t ref;
>  		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
>  		enum xe_wedged_mode mode;
>  		/** @wedged.method: Recovery method to be sent in the drm device wedged uevent */
>  		unsigned long method;
>  		/** @wedged.inconsistent_reset: Inconsistent reset policy state between GTs */
>  		bool inconsistent_reset;
> +		/** @wedged.perm: Permanently wedged, needs cleanup on fini */
> +		bool perm;
> +		/** @wedged.lock: Lock protecting wedged state */
> +		struct mutex lock;
>  	} wedged;
>  
>  	/** @bo_device: Struct to control async free of BOs */
> -- 
> 2.43.0
> 
