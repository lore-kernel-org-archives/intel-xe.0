Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D32E9370C
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 20:27:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3584B10E180;
	Thu,  5 Oct 2023 20:27:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 762B410E180
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 20:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696537673; x=1728073673;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=49dh8+iQTG8MIfPs5ceIHlJIio7iN8BJoUG1OANksNM=;
 b=iSqJ9A4untkNkMWPnuBWZAAaik4ihXfHFqhL2WxU0p4ZgbmcwzfqdvnF
 kiCBLxrfZFAjiJAsfqK3/gYHj3mVpdtumxYtXgwm3xNPsx7T8N3VKQoZa
 go0NOrZgqhyMKyA+5/tBaoIyUifc9oSTqr6e6eoiB5oy22aJzLDPqKNgr
 KtPMVtWu2u262ehoVi+fpjg205blSFJzFHA6HTiCDNN/qVYM5WtZ6cHII
 iPUrkbHJDfOoj2zaed/HBKxIBbvsR/OsGaeJnpe3P30pP6KdzMHMZTa6D
 6F1+nQGZ3aaJCHSZcT7NxK7PpDjBdWcYwbjY5TUhM3+ILYvMME602EvjK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="387484902"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="387484902"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 13:27:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="895590673"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="895590673"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Oct 2023 13:26:22 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 13:27:51 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 5 Oct 2023 13:27:51 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 5 Oct 2023 13:27:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n0af34xXQWhHIQ35FP12HDGuGXN18S/ZsrSPJayMotsubjr/RrgmZ0nCmQVbSfuURSLF3cyniR+EykADyDHK3QTVE2aN/cKMWTHTEFP4bE7yfSJSOVKxLMpb0PjK4KAdV8K8zsBxzana1S341SmSv8KKDNDIWSpV4oVBfVnsHJ4m1JbPQaKaKyW3uyEBXFl8uNdRjnAC0f9SAmQETitw+88DtV/UAD3y+zub3KcQ4kMiAyAOatKMCnu+9aH8bOtBG0qRgE+35RpcEPhl4OH32kW0zT0KlpOleQ7NML9RdDdedJSLNQ3vuwF4JR5hGgE+Y7GAE/DeRiFIXTjQ2//BZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dBVsedr1LMDP0n52w0FkietM54AfcPLr2OmB6Ez0m+c=;
 b=Y7YAJLgbegTHkHX9HiZjeVq3d1s2yV06PEIf71C2WKegth8ATOnSFxJ6z8MtJooaZ4/3pEEvDQQ/iYvZ457ar7av0RT00Z4nl9fWVWHfUwTPbrYSiL+cRdUhpE3m2nLQ5SkHFaUlqCq7wBamAIlliLdx6bjX+FvUZZLy0XKHFlCbx5b0aH3dmdh8B5sL9OrYB8x2MbCp1XZv35g9/cSIbBx5ENm1gaGj1c9xSYfzqCmgq+ktGQv7C9zP1FXOvxkM0y8i36nDe8QHUPbfOfGPRHNSx+VIL2LFiEXtE7h7CycbzVuIGSKOL+zmB6N915iWAlQHADE6L+IKCSnhniKooQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BN9PR11MB5433.namprd11.prod.outlook.com (2603:10b6:408:11e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.35; Thu, 5 Oct
 2023 20:27:50 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 20:27:50 +0000
Date: Thu, 5 Oct 2023 16:27:46 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>, Francois Dugast
 <francois.dugast@intel.com>
Message-ID: <ZR8cQh9MR6ARjACI@intel.com>
References: <20231005163854.483488-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231005163854.483488-2-matthew.auld@intel.com>
X-ClientProxiedBy: BYAPR05CA0065.namprd05.prod.outlook.com
 (2603:10b6:a03:74::42) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BN9PR11MB5433:EE_
X-MS-Office365-Filtering-Correlation-Id: 134fbe6e-045e-4e66-ffd5-08dbc5e18b6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +fHHmYkLA2p2JfWl1cJd/MUxkjg+rtLu5Xs54b6tBXA29baagLtESqRCenta5bW0QYE1g/6JeN7Y43jHfF3admJyqaexi7hnDDVJg7D3E8c9DEAj+uA8XvCRz2dS7q7KvDOhc4u2gjab04bDGh/3S8Ky7/rGNxWfCtWkzgcqQAPe7Fxqb8vr0bKBeREy1YLhGH0p5TgmB1SOf7Bn5+mH7nLxVX5qwRCOT5/f8UI0Ol+qbZXXcWRF4i5+EL9JdTDW/JujM4o0bld6W237LI3RnxcC8i21kuwXjofRKhIT3NwIt3PPb7/86QZHuKaw1U6TiH4f3ifsJrfWruS5DTWpr0VEZ6x7+rGXxOoezCRQjKyZylmtAj2WYlnwTJJo4AUz4W1rTclq6JMOG8nLaSHKKgBCKqtUtuLbILleCCkz7+4ONRdZlp28Yo8nYdMaTYYoOgAQztRZl3xZTUlhwelOve3RzaPeL8s7LiH2iU8l8lCog3y2hXb3NFSc4DU1jbHUv30hFdAtFH7/jBkX+eneHOkMFcUkrgAC261m8VUNDhE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(346002)(39860400002)(396003)(136003)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(6666004)(6512007)(6486002)(6506007)(478600001)(966005)(86362001)(38100700002)(82960400001)(2906002)(83380400001)(26005)(2616005)(36756003)(66556008)(5660300002)(66476007)(44832011)(41300700001)(66946007)(110136005)(6636002)(4326008)(316002)(8936002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oSZWjV6aFirj0X4bb/NrQrjg9unD0aUx2lVW2hipjURsJ3k6tjWI0JHR8TbY?=
 =?us-ascii?Q?AO1gUjuXmpoL+qXU+eEwZCIsjdjceZCSJ5xxFHuEF+nc7cw/17388yu4hlK6?=
 =?us-ascii?Q?Np11hizBMH39PbBdbK6yw5/Y97E8x4W2qEgHlch+zcsshmX21GTu4EZSJgEk?=
 =?us-ascii?Q?SBpmzSsSKYiEvCpdSAd9mc+PTsUzVltknbSgA9PbncQ566rjxMlmsEa7kkIE?=
 =?us-ascii?Q?DKNwV/bIe1fsjn57DRU+E/2Xopj1FkOnk/b9keETLE1DMeLr0p1ybsgY+TQa?=
 =?us-ascii?Q?Qq4Tgs5dRTATOaGEv/nL908GEpUWTY4F8r43Elz0HCeiUMoUb/S6cR6Scf4j?=
 =?us-ascii?Q?ITBNED6iiEpXDguUPU0ondBgqbMad4F16BogAOELciQDjCrHWmNHqyCakdOZ?=
 =?us-ascii?Q?kqfcX7PnT43UMVXzDWeYSEJVoc2kZSm8CcK2dj4eXGuGVPoTptH1ODEWZFXO?=
 =?us-ascii?Q?lDyva6/3Lwb3P+4SyeMDni6Qqt5Mn5hgJDwwt0NxHwL+UuWk+RytuHCEqcMo?=
 =?us-ascii?Q?NiLxFr9yefHHhg+ck1GvCp/nnlitYjmwYlbFOIBnHUQhTWV20C/pq607GeOx?=
 =?us-ascii?Q?D6hy6n/z/UDkOJxrPTsRbk431JQWl/G2CrJdI6FeLzqhO4zQPzEIEUj8tjpi?=
 =?us-ascii?Q?avBLpBn0Pm1WYB2BK353ZNz+CzrgKHm1ZUm32hx82NuBCPK2I+ck5AWOxboY?=
 =?us-ascii?Q?jgdVOz2yS4qaNJgLqUqB2D2oqQEeHPS/lKDNTQont/el/iwLv6GHp0XycNw7?=
 =?us-ascii?Q?P1mWNW1Bs+QdiCcA0nY7nDZK8GeXDutC8Mgfsrkcsu6a7uRfHsNKxXtvXAJ/?=
 =?us-ascii?Q?1cfr585+DIrthJQioxnj2dwfamZZ7IaoZjnPPd43U5HLiZqTUWedckCA37v+?=
 =?us-ascii?Q?WU7yFltl7WmbgOj3tGOVzhTG191DfTFiJFzcvhZxwmxW89IxjlppKmpqlKrg?=
 =?us-ascii?Q?is1chFr8B5o80/WxVnlKU1Mi6IfLzg749QWn47bkV+EkKPQJYK+WCz5mq9PY?=
 =?us-ascii?Q?YekJClieJAC/DjAyci0iesob8INRjbUv/WRvJqYLj2xf4FtllASOUMpttATh?=
 =?us-ascii?Q?7IkmGZcaJgvKCDZE8+hblef6dBXpMiout3Syjl804BpuYMprcXYxgPQPz8x4?=
 =?us-ascii?Q?K7nazAclwuR/HKePbuiPEjXEH6IAQ4WA41lC5NEDEMRItIJGpsPRgaRb9ivd?=
 =?us-ascii?Q?lOosIWpYygO+zY/u5139jK8LKiddjnrxKrzeakSviU6MHgOTKnCMElIpSj20?=
 =?us-ascii?Q?kKGAndaybKIzb0KvNY5xTl2QFbRx1S7FqI9ci/piAdbhuAQSXE8WAMljBEWK?=
 =?us-ascii?Q?hW/oyzYCXYtfLVW15uZrHkAEjSNUE3by6lroBzp+otEYtIeF1fFZTHvkpRLC?=
 =?us-ascii?Q?8dmvlwoVm8gLQ4BNjCzcbBxnrHH7+0xW5fHxaWvAsZHz/BvraqzY9ZmYDRBN?=
 =?us-ascii?Q?P7vvRrrjBIx23roy9H2XKj9DoDjzmZqzp2JUYD3DP3Y+sQKJ7EXGn79T3/oC?=
 =?us-ascii?Q?zQAse9NJwczRcrTb8KyNSIBhH4BfuC3MZ97VECKjlog6Q+c6YYrxPshRUlLA?=
 =?us-ascii?Q?F+EjPmlf9TB2SUO9E723Dimri7NW5PnEx1M/lrEI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 134fbe6e-045e-4e66-ffd5-08dbc5e18b6d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 20:27:50.3320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MIAU7CO/JfnblnWFMPClVdC9LLAa0MGZhenkWN2roqi2wowpJoxJJqJHUyvIHj07tocqcBja0HtezM94bnFZGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5433
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/hwmon: fix uaf on unload
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

On Thu, Oct 05, 2023 at 05:38:55PM +0100, Matthew Auld wrote:
> It doesn't look like you can mix and match devm_ and drmmm_ for a
> managed resource. For drmmm the resources are all tracked in drm with
> its own list, and there is only one devm_ resource for the entire list.
> If the driver itself also adds some of its own devm resources, then
> those will be released first. In the case of hwmon the devm_kzalloc will
> be freed before the drmmm_ action to destroy the mutex allocated within,
> leading to uaf.
> 
> Since hwmon itself wants to use devm, rather use that for the mutex
> destroy.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/766
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_hwmon.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 1deb5007e1e2..9d3e06b96073 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -584,6 +584,13 @@ xe_hwmon_get_preregistration_info(struct xe_device *xe)
>  		xe_hwmon_energy_get(hwmon, &energy);
>  }
>  
> +static void xe_hwmon_mutex_destroy(void *arg)
> +{
> +	struct xe_hwmon *hwmon = arg;
> +
> +	mutex_destroy(&hwmon->hwmon_lock);
> +}
> +
>  void xe_hwmon_register(struct xe_device *xe)
>  {
>  	struct device *dev = xe->drm.dev;
> @@ -599,7 +606,9 @@ void xe_hwmon_register(struct xe_device *xe)
>  
>  	xe->hwmon = hwmon;
>  
> -	drmm_mutex_init(&xe->drm, &hwmon->hwmon_lock);
> +	mutex_init(&hwmon->hwmon_lock);
> +	if (devm_add_action_or_reset(dev, xe_hwmon_mutex_destroy, hwmon))
> +		return;
>  
>  	/* primary GT to access device level properties */
>  	hwmon->gt = xe->tiles[0].primary_gt;
> -- 
> 2.41.0
> 
