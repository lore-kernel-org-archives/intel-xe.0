Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9234AC87FD1
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 22:16:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32D7310E2C5;
	Tue,  5 Aug 2025 22:16:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mh4RzHzP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C37DF10E2C5
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 22:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754432179; x=1785968179;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2yR9/fdnUp8vOCsiW+oEClYHxdJy5Fe9V84erxjBN2s=;
 b=mh4RzHzPVFi0KWV0beKnyAisVSkONKcrQpb+5IXgBqutddADMCd0MeQu
 45CHu9z+KfKw6J1clVHXEdOGDObApUZ+NcbgtYkdK6bSla9VcrYWeY5MB
 mhI7YZWwTwqIE9mowr/TP85Zwf4R91UAz8sdL8/3kb/s93B77JUfjrbvs
 VFZ4ocY1liCwiBViadIbZhVikOmtga7VT4wf8CzI6p+VgBcBjxRnlLXCc
 0lEOW9PCqBlia2TkN0AuTfxyVRqbcrBhORKz9XZOJQEx+nS9lYaCwABdt
 jYT5QE6FshEquq9oEJzg81x0q51Ey2fStxwltvrsOkXjIpBozLHN1qzGa w==;
X-CSE-ConnectionGUID: nyz+KafbSYS+QrOUwDmvBg==
X-CSE-MsgGUID: ro5ZMY7/QLGKHa6VRz4u9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="67333262"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="67333262"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 15:16:19 -0700
X-CSE-ConnectionGUID: 8ouQg38tS+6y35jhHuohDQ==
X-CSE-MsgGUID: guHwC8N4Sw+lnHQ0UhEP8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="165371291"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 15:16:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 15:16:17 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 5 Aug 2025 15:16:17 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.76) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 15:16:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DLBaaCGzZowt+g+z5YnoJIpSBj3Z1U0j5ot7cZaUWUSumlC5NgxoV+YEY5O0fQdhhOH3zq4dRCGbe0wJplvjnYHtajKKgOsGrhSsAhv/Xg8cgXJIm3HALdEwCz78CO1Sw/G8h7wJrW1qxds1JUcmnb/wB6oroye/5MXveR4iNuM4FHxX+BaUCwLMIMBmjbWHJor8ZKhb6WDOHEDv1LYKJZI63PwwGERz7hWMPal/kHhD8Z+FZ/LANfsYAOiO3bqDB1bAsLAvy+dSeL61kP37VHXU35GSE7aipF1aByWtvo0Q4fUL2IwOqlNh8MH2EFOw3QLLS0jkVh+OHNUu5mVLlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lPifP0rDGqFl4fVhdQ4ajqfUe1umBONSfOR26FHJdfY=;
 b=J7FNHUCcgqTgBXqLBe0NDICr3qcE9E6uNJ5sY4GXxarsTUX2ES5ndcSkLxGSN5kwXEAIeqqNOOAR3nC+M5gsNtXkdya1hld+oGL/2jCtIu6xYqlZyJ13mDVxPsl7gcMDZxT2loBw5pglrWwgDcskywW81xwteSPRYr6Wh49Uwh2spuaLAYgmftkRgl7L5qb0knzgS+V+QMqSj3lQcMDMYvskTaDVG9mfl8JjoOKHhWfWkawgkuLZKRSUDnxOMCkOBIk5wuLGkVp9eWST5/H7r8RLvTL1lUwY9hbi3nFhIORFGrNbYgCHM/0FAjwj0oSWA7kDob6eBVJUSK5SDNOd4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH8PR11MB6729.namprd11.prod.outlook.com (2603:10b6:510:1c5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.17; Tue, 5 Aug
 2025 22:15:28 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 22:15:28 +0000
Date: Tue, 5 Aug 2025 18:15:24 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lukasz Laguna <lukasz.laguna@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.wajdeczko@intel.com>,
 <matthew.brost@intel.com>
Subject: Re: [PATCH v8 2/4] drm/xe: Don't update wedged mode in case of an
 error
Message-ID: <aJKCfFvucbl-7lKN@intel.com>
References: <20250731123756.29259-1-lukasz.laguna@intel.com>
 <20250731123756.29259-3-lukasz.laguna@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250731123756.29259-3-lukasz.laguna@intel.com>
X-ClientProxiedBy: SJ0PR13CA0018.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::23) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH8PR11MB6729:EE_
X-MS-Office365-Filtering-Correlation-Id: d3368b4a-7685-4ca0-d299-08ddd46d953f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?be711Wc+kxFQvuafJVlDaJle724oixwgqkXXBwKQo/V0GnsHMXpZLXZ2tSWo?=
 =?us-ascii?Q?F7eaN16f5wTE6N04xc+qOqgzTrnITjo9uwSiMb2AcjTDqSYnEVHqLY+x8lOT?=
 =?us-ascii?Q?aGdgA/5ZVPTdRrnjf15nnRtP8jEgn5OIRv8ElxibsWr7tBlFk+BX6SVw70n0?=
 =?us-ascii?Q?IETFHqzOUIBG6UZA/1DWOQ8uqOIBwIOyotrpR9ynCEaakpcNk6kBf2oeT+do?=
 =?us-ascii?Q?A3/31c8UlJO/6sY+1Up1e1PXdNOLEZsTrcsHXcMb4kyL7FtbuzW9LuBGeNfa?=
 =?us-ascii?Q?SjWe3aJsf2HLvu2Myp8oIbRvRmouR1TIDAPzDNu07Md1bdBBYBR8ebYgKRh1?=
 =?us-ascii?Q?jR1ky5xO/nKcRng9eWh0/z62QAjWy6YzNre0g0bVi/8Wv9gimrP9cHQuHvJ5?=
 =?us-ascii?Q?o096SOcALehhN6d4r6E+52F2tJpXsLGrLrR8VmEvN4rTyU+WgtwgFu5SNMu9?=
 =?us-ascii?Q?h2EI5XJ5eMcDjPihoymzeGEOa1oD3UczzJQwELr7XwbSApINjLGL884PLOqN?=
 =?us-ascii?Q?HYzaT7eZ3qkfjksIEo3PaHP+Smfw/5LiCv0f1kQh/Aj74jUes1olMj82PiPC?=
 =?us-ascii?Q?l2gnq5DWHHlndX9JnCJBc6hubHujJ9cy9hc5vJPixcRGWImXZ9sNCeiEVzPl?=
 =?us-ascii?Q?Wqcrnhyh28XWiiKb/KnCTjc7dWtZzY+m78cNrzbCsI0YQKLrFtrH9NN+KFxK?=
 =?us-ascii?Q?Tc1zalxtREIV6TrRWqoTkBQyDNwzQpzerTQOTH7SJAbx5kcVo+uKjhb3culO?=
 =?us-ascii?Q?aFEIGCd8kBRbEGFMhOvMOB+rMUAzOC3BHmdJI3sg9e1iVWwIhvT+XO7dktsO?=
 =?us-ascii?Q?1O2mVA0IVQvT0uuA5XRrs5jGRapxIxJE/Onx7gKEulcUiidhk38cZ4QiGHgH?=
 =?us-ascii?Q?fVWQX7lvy3cS2XvA4Cvr+KNMHZ0KP5656toS7z5HcpHqTTv1mTSSF3RMd/9Q?=
 =?us-ascii?Q?sStNYcntYtj5e75mrtl0cChKyWE76JpITkPsThlKWleNVsnQpy+4VnUyu0nQ?=
 =?us-ascii?Q?M3qH+i/eGk+qvYCTW0JnxIJdLA3g3PmDwPk/TeWhrthohnfnk9eie+Lhhb8e?=
 =?us-ascii?Q?b/rIPXHxAoiU2odnsyWJYmy4LekdoePzEQ9hfj3ximPWGnPub4pVVBqsCtiA?=
 =?us-ascii?Q?fhfYyUWTizHykCXsJwMoE+YlcBbLzv8pbln9DlxRoZ4vX3hlZ8X2VPbusjjX?=
 =?us-ascii?Q?P0lDXCaV7IvTIpNexYkAj1A+zZvA7CGjFTW34SaGe9RIz3/UjPrHrFX9cbcJ?=
 =?us-ascii?Q?k5AO2ZhV67Axeg7dnIqTLQKuW6ox8+g+ahTfTMqAPZ116JWX11zhHSFbp8xP?=
 =?us-ascii?Q?cny7bNMCXN15TPduy4IRvUAV12IDYX1ei+U1uahMt4ZqHhRnWwO3/Ygt36y6?=
 =?us-ascii?Q?YHSxl9fDBudnXcCDoMh64FxSKelCJQs/NHb8iT12YZu5zBe7/v1xVr/by+LQ?=
 =?us-ascii?Q?BfCJFExemt8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RlZBuNhP0T9J3N0qVfQpczSVa1BOtSSAq0uBuRE4q9jOzhpSfSzFnoin7PPD?=
 =?us-ascii?Q?88CQHK2D0SPTu7Tfltv3LledfoRN9Q1MJZW1ehMIlrnCC36kafP+VKV5nRuJ?=
 =?us-ascii?Q?ktCCfYy9ctA/G7C3uziBgLzKvQ+wn9uflaRwjOkGjNfm2bThWe3bD00kLOHl?=
 =?us-ascii?Q?YvD3tzoZFqrMghslVmuwpvn9/gLtMOBXQBB/uDOmaJt0T844IoTvXacdZ8kV?=
 =?us-ascii?Q?Z+w38+JBviTXCmw1+TbfRIdYHnYTrjUYgMJbbFznYgvlgKSVSnXCCSkJoPl6?=
 =?us-ascii?Q?Vrk4iH8f//bDA+iuQ2Iu6Dpe+ZoW3TB7IVtSoc2+WwYh0qml79VjubfidnNP?=
 =?us-ascii?Q?L3OdOMf10h/dy1U4jmEeh3Lc51eXSOt3uK8bvGE6t9wyj9/8mNqs8iw+mBXP?=
 =?us-ascii?Q?Zb7LIYPPc8P0M9t+6g5anrtRmSKrP5sX97IEsG9NKWBi/RG7wFCzoGlXQu6I?=
 =?us-ascii?Q?VVnYhF9PElMKglzCTIEBZYbkebUW76KQ5os4+EGTOPR3lfl7JoIEB+cQaASw?=
 =?us-ascii?Q?WoX0fOxQEr69GMWkK7FOLdZa1+SV2FQCha4WqBh9HCmVQRKnUdVM6hXiUnSu?=
 =?us-ascii?Q?xRF+0KskKTK/VXJyNwYiWXytaEWiN5GDy+9VOf1DgVHlgW6bhfsqxwtcRCkK?=
 =?us-ascii?Q?BGIuafwprncMegWYQVW70IIcV5AnwYTNfCOA39XVep+Bry+aWt2CKYSWvTFv?=
 =?us-ascii?Q?3tligN1tD0D3icVcehlLSQePwZ2PBL7ql7qO6fe3D0LkPbrxX35D9bVWBsRU?=
 =?us-ascii?Q?aT9jaavPILqeM8b/claxgZI5rD/VfMOvoC9B6PQK1ak7SsBoG5uXDHwa72q1?=
 =?us-ascii?Q?ZdSXpbcyELCNPy7/g1qCPjqXqmy+AYjPtX0MIp91JKz6uUfK9BmqdZ7nISN/?=
 =?us-ascii?Q?YPx9PNWkvPt2zUsE4ZP9/0sdzpT4xvqUjbWyx3OUxTZQCt/pWawzc14K9z9x?=
 =?us-ascii?Q?tKGNK4CuFEqIO6HKvzt1eABevG7urcMdb+YWDI8Z1Gq6dMRJmWbH2IXuaAPl?=
 =?us-ascii?Q?MffkzDxeBFm0Al98nyHBuGEzB0PE1xm+aSefGLsqEerA/vlhyjfKOKpaByKm?=
 =?us-ascii?Q?XO69FogG3RwML6/V7ashJDmv+andXBTBi8iQlonmUUI4BZtDcFLtX8+ahQ8L?=
 =?us-ascii?Q?ozMUP3FXOi11579Bnq8guwY+PJB2ELSQSyxIholkb5HxrsP85tyPmLCAsBpx?=
 =?us-ascii?Q?jT+kN3v9oRzBPso+fy5Ov+Enbx1T4VTkdjqWOkztTb6hpjZSGXaXjPXK9XVm?=
 =?us-ascii?Q?pXh8X0skrw7snwKNuFLaZRjxW6KJa58H7OiLQE1M7BEdQD2noRRH4rsNNXrW?=
 =?us-ascii?Q?KpN6mF33O6eUtEDFgNJ0l4Vzw4jzgmqfzhzwUrEqrouKdICUZLLS6NAHWyUm?=
 =?us-ascii?Q?sViLcwcAIpHkZwQ8UjWQv8heZKIgCsSsFWAr/wacJpQPdsDI71xsEDKdww9P?=
 =?us-ascii?Q?NEM6L+NVdzzmePK7+kCcb9cKgVr2rRFip7NMkWstK/v2OaxTI9W6jnU9c2Vj?=
 =?us-ascii?Q?zgnBVzRMO2MuLUsliu9o2szNZnD1dYBvoGoxE6ziGFbD9iKv2FUxJKd9ITDt?=
 =?us-ascii?Q?9pJNAAB3h11gvrde3ox6cfKti/qZg0gNWK2KYVTwb0/A51r2ePe497vLxKCZ?=
 =?us-ascii?Q?qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3368b4a-7685-4ca0-d299-08ddd46d953f
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 22:15:27.9536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M0FHIa8SEMlPaQr/UiMjD+jvv0Z2iE4Vfnys8RwsijKlC6wc44fhHUDFLOrC9WyjIKM5GJ9Pd0rAZXbsDDcZ1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6729
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

On Thu, Jul 31, 2025 at 02:37:54PM +0200, Lukasz Laguna wrote:
> Change driver's internal wedged.mode state only in case of a success and
> update GuC's reset policy only when it's necessary.
> 
> Fixes: 6b8ef44cc0a9 ("drm/xe: Introduce the wedged_mode debugfs")
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
> v7: Don't introduce XE_WEDGED_MODE_MISCONFIGURED enum field (Michal)
>     Add needs_policy_update helper (Michal)
>     Rename wedged_mode_set_reset_policy to set_reset_policy (Lukasz)
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c      | 72 ++++++++++++++++++++++------
>  drivers/gpu/drm/xe/xe_device_types.h |  2 +
>  drivers/gpu/drm/xe/xe_guc_ads.c      | 12 ++---
>  drivers/gpu/drm/xe/xe_guc_ads.h      |  4 +-
>  4 files changed, 68 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 16b2e306559a..8aff93401eb9 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -251,14 +251,64 @@ static ssize_t wedged_mode_show(struct file *f, char __user *ubuf,
>  	return simple_read_from_buffer(ubuf, size, pos, buf, len);
>  }
>  
> +static int __set_reset_policy(struct xe_gt *gt, enum xe_wedged_mode mode)
> +{
> +	int ret;
> +
> +	ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads,
> +						       !(mode == XE_WEDGED_MODE_UPON_ANY_HANG));

mode != XE_WEDGED_MODE_UPON_ANY_HANG please

> +	if (ret)
> +		xe_gt_err(gt, "Failed to update GuC ADS scheduler policy (%pe)\n", ERR_PTR(ret));
> +
> +	return ret;
> +}
> +
> +static int set_reset_policy(struct xe_device *xe, enum xe_wedged_mode mode)
> +{
> +	struct xe_gt *gt;
> +	int ret;
> +	u8 id;
> +
> +	xe_pm_runtime_get(xe);
> +	for_each_gt(gt, xe, id) {
> +		ret = __set_reset_policy(gt, mode);
> +		if (ret) {
> +			if (id > 0) {
> +				xe->wedged.inconsistent_reset = true;
> +				drm_err(&xe->drm, "Inconsistent reset policy state between GTs\n");
> +			}
> +
> +			xe_pm_runtime_put(xe);
> +			return ret;

Why to return on the first GT? perhaps we should continue and just leave one
behind?
perhaps we should have a 3 times retry attempt logic before giving up?
perhaps both combined?

> +		}
> +	}
> +	xe_pm_runtime_put(xe);
> +
> +	xe->wedged.inconsistent_reset = false;

then move this to the beginning of the function
also ret = 0; up there

> +
> +	return 0;

and simply return ret; here

> +}
> +
> +static bool needs_policy_update(struct xe_device *xe, enum xe_wedged_mode mode)
> +{
> +	if (xe->wedged.inconsistent_reset)
> +		return true;
> +
> +	if (xe->wedged.mode == mode)
> +		return false;
> +
> +	return !((xe->wedged.mode == XE_WEDGED_MODE_NEVER &&
> +		  mode == XE_WEDGED_MODE_UPON_CRITICAL_ERROR) ||
> +		 (xe->wedged.mode == XE_WEDGED_MODE_UPON_CRITICAL_ERROR &&
> +		  mode == XE_WEDGED_MODE_NEVER));

This is worst then the one above... please expand this to inside
the function instead of this overloaded return full of not-or-and logic.

Some wording about what cases are this in the commit message should be very
helpful

> +}
> +
>  static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>  			       size_t size, loff_t *pos)
>  {
>  	struct xe_device *xe = file_inode(f)->i_private;
> -	struct xe_gt *gt;
>  	u32 wedged_mode;
>  	ssize_t ret;
> -	u8 id;
>  
>  	ret = kstrtouint_from_user(ubuf, size, 0, &wedged_mode);
>  	if (ret)
> @@ -268,22 +318,14 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>  	if (ret)
>  		return ret;
>  
> -	if (xe->wedged.mode == wedged_mode)
> -		return size;
> +	if (needs_policy_update(xe, wedged_mode)) {
> +		ret = set_reset_policy(xe, wedged_mode);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	xe->wedged.mode = wedged_mode;
>  
> -	xe_pm_runtime_get(xe);
> -	for_each_gt(gt, xe, id) {
> -		ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads);
> -		if (ret) {
> -			xe_gt_err(gt, "Failed to update GuC ADS scheduler policy. GuC may still cause engine reset even with wedged_mode=2\n");
> -			xe_pm_runtime_put(xe);
> -			return -EIO;
> -		}
> -	}
> -	xe_pm_runtime_put(xe);
> -
>  	return size;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 1e496845c91f..829252db3a47 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -546,6 +546,8 @@ struct xe_device {
>  			XE_WEDGED_MODE_UPON_ANY_HANG = 2,
>  			XE_WEDGED_MODE_DEFAULT = XE_WEDGED_MODE_UPON_CRITICAL_ERROR,
>  		} mode;
> +		/** @wedged.inconsistent_reset: Inconsistent reset policy state between GTs */
> +		bool inconsistent_reset;
>  	} wedged;
>  
>  	/** @bo_device: Struct to control async free of BOs */
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index c4ea4e6d82ce..7f58d77e0ab9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -1033,16 +1033,16 @@ static int guc_ads_action_update_policies(struct xe_guc_ads *ads, u32 policy_off
>  /**
>   * xe_guc_ads_scheduler_policy_toggle_reset - Toggle reset policy
>   * @ads: Additional data structures object
> + * @enable: true to enable engine resets, false otherwise
>   *
> - * This function update the GuC's engine reset policy based on wedged.mode.
> + * This function update the GuC's engine reset policy.
>   *
>   * Return: 0 on success, and negative error code otherwise.
>   */
> -int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
> +int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads, bool enable)
>  {
>  	struct guc_policies *policies;
>  	struct xe_guc *guc = ads_to_guc(ads);
> -	struct xe_device *xe = ads_to_xe(ads);
>  	CLASS(xe_guc_buf, buf)(&guc->buf, sizeof(*policies));
>  
>  	if (!xe_guc_buf_is_valid(buf))
> @@ -1054,10 +1054,10 @@ int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
>  	policies->dpc_promote_time = ads_blob_read(ads, policies.dpc_promote_time);
>  	policies->max_num_work_items = ads_blob_read(ads, policies.max_num_work_items);
>  	policies->is_valid = 1;
> -	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG)
> -		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
> -	else
> +	if (enable)
>  		policies->global_flags &= ~GLOBAL_POLICY_DISABLE_ENGINE_RESET;
> +	else
> +		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
>  
>  	return guc_ads_action_update_policies(ads, xe_guc_buf_flush(buf));
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.h b/drivers/gpu/drm/xe/xe_guc_ads.h
> index 2e6674c760ff..9879aadd22d6 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.h
> @@ -6,6 +6,8 @@
>  #ifndef _XE_GUC_ADS_H_
>  #define _XE_GUC_ADS_H_
>  
> +#include <linux/types.h>
> +
>  struct xe_guc_ads;
>  
>  int xe_guc_ads_init(struct xe_guc_ads *ads);
> @@ -13,6 +15,6 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads);
>  void xe_guc_ads_populate(struct xe_guc_ads *ads);
>  void xe_guc_ads_populate_minimal(struct xe_guc_ads *ads);
>  void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads);
> -int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads);
> +int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads, bool enable);
>  
>  #endif
> -- 
> 2.40.0
> 
