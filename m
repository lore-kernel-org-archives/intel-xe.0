Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAEB5C3DA7F
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 18:27:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5214810E4E7;
	Thu, 15 Aug 2024 18:27:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d2gjcULC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD9C310E4E7
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Aug 2024 18:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723746458; x=1755282458;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pTcxyagO/7OSumvHvamtbYUlLCYR4UAB1KlFMnc5yIc=;
 b=d2gjcULCtDXXhnJamsLPkwZS7W6iHDlB0OeYSiSvrt2TUjrJlVtLzhLE
 YDXQx3daxXxJRRKm6L15mUTcgGKgRKITo9AGj0+DeKH5y71VNBZEJV1e0
 9bDHFXa32uXmNDJwjOfR9e8vNdFXYuOcW8R1QfqNkVopkX4xzrJqcbDn7
 EAaOZ+eR+fJ0uN3L6Bq1068dokje8ROOwbqvYkSKQjZMXCc7yfG+31gsW
 6k+IVZ6OEZXh5TWmk5kRUfaj2wKt0uG9EgtUJtyAS7Nyw6ULUfNBG/mZs
 /XNwyIM/5Iw0S56mPBMCGoMrBaO+K7fMDYhqR72lH1MpQf1M3sYWLSDME g==;
X-CSE-ConnectionGUID: yIU85JJ3R3yF0ow2qTaZ5g==
X-CSE-MsgGUID: Yg4+qYlFQGGF26tzlD/nRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="21572433"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="21572433"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 11:27:37 -0700
X-CSE-ConnectionGUID: w5qzNqGmTXK2y7fbhT+beg==
X-CSE-MsgGUID: L2G1uv2sS3qU4YnyyaLP2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="59594389"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 11:27:37 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 11:27:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 11:27:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 11:27:36 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 11:27:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pEX3qehgKXWXoQ+uS4hzFdRkaj3KcQbAvhN5mx6fQBCR2wLtvCV7EGbgn9fZCn7sZoZS8T7F1VnuIHvbMeTfYY9qK3I1tRfNuWbErGiIgAck7sDWhpZR11xR9mQyQ9sXj2DT7LAoi8MsBEPMGjnV9lWtrSzFnUfOua9qKPngjFFb5yHBcwJaztT00oCx1EClIbq4jdChXNUng1dRewCuiFHICR2j4rpZTIqQL3G+6mmSSq0Y8S6dj/RBLYwLvzBELr7neGS6Zq6oAkF1OdTNKvnx0KdNW86CkQ8IASHBuP0nWxDqmoioURUtCntaFhLDyljUdJV8iIUtypCKtABtdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FEgmagXKtuy+nHQNw8vg6uF+Xx7fMvwq/v+9KZZlU2M=;
 b=w6PBQeRVOZbsOfdZIit2lYjfnPeiGNkyOIbJKyjJ6BSlhN+hw2m/tapKV9rAYjzur32HHV/X/Z4pNynLxLIPUpkM7/uJ+EGc8f4s+nNP1GckvBQxn7mNUTvauY1f2yhmwwndjTfzP/oxysSzs1yWHZ5fwVAg86fT4Tkttf3NjtqOYKu5TpJFxG8BQZ/5bzb6V+5vDjuZBnQ+9yV3+XU8OmZt7AugeC7zYYnRLdKiQy3C8KGShP9PGrQkzKNNAatd8z4j/FfdiOJ7NXFw5L8Qn5RhYfr8Auk6KLh+uOjaOeEyTXCDfO/EsVzGDKWAbSE+o0OrHW8pnVZ4nLcWTKkj1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by LV3PR11MB8578.namprd11.prod.outlook.com (2603:10b6:408:1b3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Thu, 15 Aug
 2024 18:27:26 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7828.023; Thu, 15 Aug 2024
 18:27:25 +0000
Date: Thu, 15 Aug 2024 14:27:21 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinod Govindapillai <vinod.govindapillai@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <imre.deak@intel.com>,
 <arun.r.murthy@intel.com>
Subject: Re: [PATCH] drm/xe/display: handle HPD polling in display runtime
 suspend/resume
Message-ID: <Zr5IiefJuIR9tpzo@intel.com>
References: <20240815172500.78479-1-vinod.govindapillai@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240815172500.78479-1-vinod.govindapillai@intel.com>
X-ClientProxiedBy: SJ0PR13CA0172.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::27) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|LV3PR11MB8578:EE_
X-MS-Office365-Filtering-Correlation-Id: 07813b36-3fdf-483a-357b-08dcbd57e8de
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/mtvkRCKx4WzZGq+oOe9+03UxA1HujS1nkWHWZV05fOzDR2zInq5LgmvB8J1?=
 =?us-ascii?Q?PY7NtV4F5XYX4fy2awJvQPhDykslcyO5e236kVKSJBMo8SDAiNw9MXgyZplC?=
 =?us-ascii?Q?00R/fYoGvykqanfDX1WnU96tVWyuApJWn6YL5y/gUqSSLZMT14FAMQhe1yHp?=
 =?us-ascii?Q?DDaPT8A29FMRX7AtGh7hcxoy1MjQl2q4itKTyIFmlfZ5gbV+ZixkZjS5PYrr?=
 =?us-ascii?Q?yy0QjFuKcZjG6uSRsJ98abGu3H/16Op275cw3JtgW+0Bf8HMVJH6jSvjBtpH?=
 =?us-ascii?Q?iYxiO1S/MS+khoRPp1iRu0qWwgPaC0GI9q6tXMVXzGVc86zQyxHDCQLqxffE?=
 =?us-ascii?Q?Tpri/i27bseLCMxI0XUOsqbQM6dnBOnLdUhQeiHVxaqzMEfPi7aJ24SgKaC3?=
 =?us-ascii?Q?7UFlfQUh0UupcOw2hDHxGX75RHpOGEKvNdAtPhyOMeNGs6omYWlIxHXEmorc?=
 =?us-ascii?Q?96m6NOtlMeEiG2XJHxqkQEN3M2H+knftdCDTfVbxCdEDKTCSxDOoClQDgnu0?=
 =?us-ascii?Q?V2szJP1+edliC8Kl0dlnuCdhXo3G/fH3isy47ueqPbA8lpxplKUclUmJQRz+?=
 =?us-ascii?Q?bWIm96ZGL+WklmcESVqwRXFp6jVAu1ibyOEhKCzqJwiD9SR4D+m420ogN1i1?=
 =?us-ascii?Q?3INmYGV2gcO6Sqv4m1zVK4nzI511fSBkT8372SLatkui7T9XEeiGf9bxmjKU?=
 =?us-ascii?Q?gveVD28Blm0jd2A5BQKDvhbzHn99cehXCunSJgQdgHM5PbNgmRw9JzBeqF6G?=
 =?us-ascii?Q?5wiPg8YhLYspOAbZH3o6BcAqI9TL7gVVlHIDsfgd+amrdbPmbyFMyA0cqY6t?=
 =?us-ascii?Q?6/3Bq5m6h8M76ZBUUhRam38jClbgAFGZ/me78vvtZ2iiHKRZjaR3KwmAIa6v?=
 =?us-ascii?Q?YLG0h2xpu2TFRLb+rGCSvPv7x8ropx8pAXbvkdoaOYf92ik+A97eo1z1jcML?=
 =?us-ascii?Q?xYQor+kDS97eLtDH5G18+hQ9un2MQU2vXf63LwrDlIsgGRUtIjjpGP4H4lsN?=
 =?us-ascii?Q?6AIcMjjJHPEXaLFqgp4sRFYL5ljuMpdSLL8qkmfqI/pPUciTRoCQo31EaM1Z?=
 =?us-ascii?Q?l5zzTNkvpVyhl5HWecq3ccXNttAn/sTESYuc1KslyVZiPd3d7Vzg36b4Z8Dg?=
 =?us-ascii?Q?hdnIrjBz4GFS5l3uDTFNqRHkTheEUNLa5SKm/Zav3Qqtg1WnzQcRwNkHj689?=
 =?us-ascii?Q?/h+5PHECgHDr66OWv8mUO787MlsoG3LV/8uvTBHBNNFfLg+i8NCAFvNPzeMg?=
 =?us-ascii?Q?SJmfHxjcwCEZo25aoXz4h7YmTofhBcZu3dTJ6Tl1gUw/S00tcWXoa4kHxLKX?=
 =?us-ascii?Q?a7Y4jGWGHHIOXFYjuDzMJk7xYVutOoGGX2I1TfCuyepg2Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o6396c5gGjloRnkJLx6ZK3MlqrG80M1wd4i2iMTVBWT/g0R6XNrBPk/7tcZC?=
 =?us-ascii?Q?K5Nqtq2ztTWwiDWsJX0xNgaWkqgGLPAzu9dbsGmMrI1axCltSjKW8p3qbchu?=
 =?us-ascii?Q?G0SevcqQb3DTI9I8/4zuZRNhOSoUWT1aMo10tb26AUBDZVFQhfwU/KE1Kt4S?=
 =?us-ascii?Q?RP2kyZm78dBVTs+O5nCBxr6GubsFpj3MK+6yc7rclR7B8gO6Ho65+16B13do?=
 =?us-ascii?Q?sFa2ovMAbycYPtt2vgwUeYaW+IZNmuq1Qjru/tSaP08wfNjE9zNC4uYxiXvK?=
 =?us-ascii?Q?Zc0uxYCZa9X25+mXOnvtPACBh/wjYKKSzTdIM0IKxYvPgwd/AC1IMwMzJUp3?=
 =?us-ascii?Q?fvl+8nNE9kBCerpVYfhhBayPgywxrbVJha8ctuql94YtDjhuywv5Iv7hfCQc?=
 =?us-ascii?Q?ckzKQZ0KaF13KOJIsadjTpWeoMm8QDA3IOeaIQKYER87ayzmCQxYhqVuwrAq?=
 =?us-ascii?Q?LQ/p8Okh5m9aFNcsBxc3JNMx91Zb2TMjIw8U3qnHmQ6lAFs6deUc/mYfJbkX?=
 =?us-ascii?Q?pnqpvpv8nEWik4m5Q72PHMcNI49L0ZjfB/Swx9wXsrYHCPja0fFpRIl/iWJh?=
 =?us-ascii?Q?qo7rA5PPd7Jlqqx1pU6QNbT3J3Sp70c/sv0hMKCyyrXZ0w9EUimHhLCKxI8s?=
 =?us-ascii?Q?ptDxytnPIB7xLtPe1eV0X6n6RWDCDshjnvpf8i0fcGJab1X+V7dCTaqFoWBv?=
 =?us-ascii?Q?2xpyWuTmX2Lbm3TSI7DYkPLoB5W4UakDJnDRORnyk0WRjlbpM5DENJSFlEIY?=
 =?us-ascii?Q?6B9GFK/G8GbF3Ntyp5W+eC8EEutvD62SyRh/P4QmgKLey1Qivx9eF0LhZQ1M?=
 =?us-ascii?Q?nhLz6rw+TdQLxEAm495RdXT6dAW+SPJbOYn+hYiwYgiaGB52RV1bCYnFxeqx?=
 =?us-ascii?Q?73pGGnW3zhStInoUwQJyBoz4cjbgAnBBSAj20C/Y3+Dw1xwXVbaRMEqRVUz4?=
 =?us-ascii?Q?O15uTUAe7vtaCi7l8BiERW7Kim1XNIld4C1uDPErnbJXsjNAd4zNOjtwm1fA?=
 =?us-ascii?Q?nIf9BFGlup2B+lXuYsNUX3rOMwjmnxCyoOXyEUeafo6SzxJglAWr14zLBmrM?=
 =?us-ascii?Q?l3/9r9itF0jd/yjLh4aDo/M9BEh/a9A/JaF2am0K/SKfdWtWBeTl0Jx4GDj0?=
 =?us-ascii?Q?rdfrevVzC3sK2pDywsi6LUfCewflOn3bZTkx0DXukINmh9TjrvCnw6KENYWg?=
 =?us-ascii?Q?edIs/MB4MC18SvPcIa/ObVt/Gig7EFhntxLyoCRN9acV8x4TtP5ty28fOvhN?=
 =?us-ascii?Q?zH3dVvv+HbSxui8iKjr8iFMZIqaLDM9hp8Xcjt37/dFvtt0LUcuU1DB7kDIi?=
 =?us-ascii?Q?v/0H3QSzVwapLrz6GCnjCXCwqd+b0aKizw3WNjylopYQKJsyXzJ6upZQsyVi?=
 =?us-ascii?Q?b0E3+g1AEt52rjlNilfDihHvxW8tQlV2KNxo8NMyRqrVd+kEJAjJdw5fKDd0?=
 =?us-ascii?Q?YxYxUEHaPAwf0XwVzlVCqMNpUz9YFHQ8Cd/Vi8V+BssyB4S7qfyQft6yk+fZ?=
 =?us-ascii?Q?+KbAdyhtmksbBGNsVKxFWoYiUVhLqhwE4UxoI+IduIR61KzNsc7n+MawwWig?=
 =?us-ascii?Q?IM2+5/Gtng49XqtNcsIw+Nb8RCWKax4dF9ncjxcC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 07813b36-3fdf-483a-357b-08dcbd57e8de
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 18:27:24.9521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CUhu6+DHZRYPDzV8IvQJLIXPaloM7sASIeEBxaGllPhJ+AiO93EBahuLkvuDpmgpGO3Knyeg2RRMflRe8PkgTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8578
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

On Thu, Aug 15, 2024 at 08:25:00PM +0300, Vinod Govindapillai wrote:
> In XE, display runtime suspend / resume routines are called only
> if d3cold is allowed. This makes the driver unable to detect any
> HPDs once the device goes into runtime suspend state in platforms
> like LNL. Update the display runtime suspend / resume routines
> to include HPD polling regardless of d3cold status.
> 
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_display.c | 20 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pm.c              |  5 +++--
>  2 files changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index 982b9c5b440f..0cddf55351c8 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -294,6 +294,9 @@ void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
>  	if (!xe->info.probe_display)
>  		return;
>  
> +	if (!xe->d3cold.allowed)
> +		goto enable_hpd_poll;
> +
>  	/*
>  	 * We do a lot of poking in a lot of registers, make sure they work
>  	 * properly.
> @@ -308,6 +311,8 @@ void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
>  	intel_dp_mst_suspend(xe);
>  
>  	intel_hpd_cancel_work(xe);
> +	if (runtime)
> +		intel_hpd_poll_enable(xe);

If we need to do this, please do not use this function.

Let's first spin out the runtime function to a separate function and then
add the hpd poll only there. But also I don't believe we need anything
of this call in d3hot case anyway. So we need a better refactor with
minimal change.

>  
>  	intel_encoder_suspend_all(&xe->display);
>  
> @@ -316,6 +321,12 @@ void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
>  	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
>  
>  	intel_dmc_suspend(xe);
> +
> +	return;

with return here your code below is not executed.

> +
> +enable_hpd_poll:
> +	if (runtime)
> +		intel_hpd_poll_enable(xe);
>  }
>  
>  void xe_display_pm_suspend_late(struct xe_device *xe)
> @@ -346,6 +357,9 @@ void xe_display_pm_resume(struct xe_device *xe, bool runtime)
>  	if (!xe->info.probe_display)
>  		return;
>  
> +	if (!xe->d3cold.allowed)
> +		goto disable_hpd_poll;
> +
>  	intel_dmc_resume(xe);
>  
>  	if (has_display(xe))
> @@ -368,6 +382,12 @@ void xe_display_pm_resume(struct xe_device *xe, bool runtime)
>  	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_RUNNING, false);
>  
>  	intel_power_domains_enable(xe);
> +
> +	return;

another bogus place:

> +
> +disable_hpd_poll:
> +	intel_hpd_init(xe);
> +	intel_hpd_poll_disable(xe);
>  }
>  
>  static void display_device_remove(struct drm_device *dev, void *arg)
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 9f3c14fd9f33..2abfe70d2697 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -370,8 +370,8 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>  		err = xe_bo_evict_all(xe);
>  		if (err)
>  			goto out;
> -		xe_display_pm_suspend(xe, true);
>  	}
> +	xe_display_pm_suspend(xe, true);

... please, let's not add extra unecessary calls to the d3hot path.
If hpd_poll is the only missing thing we need to create a function
only for that.

>  
>  	for_each_gt(gt, xe, id) {
>  		err = xe_gt_suspend(gt);
> @@ -431,11 +431,12 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  		xe_gt_resume(gt);
>  
>  	if (xe->d3cold.allowed) {
> -		xe_display_pm_resume(xe, true);
>  		err = xe_bo_restore_user(xe);
>  		if (err)
>  			goto out;
>  	}
> +	xe_display_pm_resume(xe, true);
> +
>  out:
>  	lock_map_release(&xe_pm_runtime_lockdep_map);
>  	xe_pm_write_callback_task(xe, NULL);
> -- 
> 2.34.1
> 
