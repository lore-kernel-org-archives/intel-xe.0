Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F12CA1005
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 18:04:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4BB410E817;
	Tue,  2 Sep 2025 18:04:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TzEXgwP6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B7B10E817
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 18:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756836258; x=1788372258;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YZrYv7bYH/RUbeuV7DywXiIMZ8bTaz3H6Vn55Q0o16w=;
 b=TzEXgwP6MMpVpGg2dT8AR7ebB7DCEWmGzJuwBKInhatRXNfUKX5cxPRO
 2B2ziSKxWhIXzwO+qzAMJNstfDaY/IDEwPuzcZepJbjO1kpQpy9R3n4Sz
 swajGY0qZW2l+zPbHeSVOmyFK+TRwr7a+RdDzEZHZYpreGr0DVyMBRfd3
 3qL8Mpdliaz3lUS4bDrLolZ6+MN1afuaX7pOYc77jZfBwJeoEmn1bAK6s
 pZiiSiWjHAm6R3n8GFefHFLOoQSq3rdRhcSx5kTHV1Lm1dqSe0MZ1Oo1/
 57PiYZOGwKxrMMzu3thvg0ViYVDPfQvStvdgZWhvVP8FBc8Zse+RlMh8a g==;
X-CSE-ConnectionGUID: /hlcPdyTT0upe/dutBhJCg==
X-CSE-MsgGUID: 2Z9r7n2ASJGl9F/hRUYWqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="59238127"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="59238127"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 11:04:16 -0700
X-CSE-ConnectionGUID: xQLyfMeHRamZlU+zuWNwEw==
X-CSE-MsgGUID: 3B3iePKISf6dg8hO+jAlew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="202304574"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 11:04:16 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 11:04:15 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 2 Sep 2025 11:04:15 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.59)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 11:04:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kp55uypilyB9KgHJtJ+abLDFzs9EUCxqvbufiLfn3beivwXHISKndN6JNf4RSLPStQ3q4fnFST9Ly1/dYODuReGvgFcl3tlR7oRvVelZikDMztI+z/lJ56C9IvCFHSaEmPasp4OsLWzUkXr+3pdZwo5gRPQY7iRU2W59msVrCQ3+6jAPqTRHrC+sB8JeG9IIVjhiZ3cJs4eXj1Vrt5n8t2jqm2xPgji2MeCuYAuo9ecg6uvL/rcPcBm5uBLYY1zbL7b3IchcnJKSiLc9ohudA88YejRmFVlRBUQ8ZYJqsN9j2OUEPVEd+I6MDONIguSYSfJKy1qyBxjso8nvVbAQXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kJpdHLpr51ksNRoOYb+0peDMl2q4wNrAIkpexHSuk/E=;
 b=w/7ZXd0qXhawiLIm/telA9YoGd1xeb6QwLu61t5Gojztchrj4Baxz+oCrsUzQJXUkrt/QN4v3XNyvTCdohaOAT4BqfIOCil5xEwY5DBfTG62QL/JZowIY/lXupDme0AfmJX5YMJdYaysBLUPaWpEcNeqGKu96746cc2TzOhCgLRidB+XRmfeBetdF2y8emDv69/UcG+gUyKwQm8jugKo/Qlm4ug9o8UF51ibeRrP/lJD1rR2tFL2lnTdTarYAg3uLRRksOLDFULWktPcpbS/J7Yh9TQAqUdbUPtQhGYXfE+jxOObhB5L8EL3z7EMgK/ATjNSciF+11N63b1EdtlCvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH0PR11MB5300.namprd11.prod.outlook.com (2603:10b6:610:bf::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Tue, 2 Sep
 2025 18:04:12 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 18:04:12 +0000
Date: Tue, 2 Sep 2025 13:04:10 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>
Subject: Re: [PATCH 1/3] drm/xe/configfs: Don't touch survivability_mode on
 fini
Message-ID: <qeq32k6xksjwzg7saglvxlodqxkr75mofjnmfv2bx2dzanciol@2c7ouidjtxly>
References: <20250902131744.5076-1-michal.wajdeczko@intel.com>
 <20250902131744.5076-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250902131744.5076-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR11CA0074.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH0PR11MB5300:EE_
X-MS-Office365-Filtering-Correlation-Id: 440db679-8963-44a5-3bf8-08ddea4b1f21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XMbesFl/D/sepNEqNoG0wlquVKGU+7/87Fx4Sa0Tp5Ue17wCtTafJY8mlEmH?=
 =?us-ascii?Q?7f+SgXr/3rapJVWulWV6+jLnX487mp2tqjnWrhY40LI5v4B8Mnoh7fviK43p?=
 =?us-ascii?Q?xAzplJiHfPgVvGKRMQdVcWIHGOrfHfB5RVTlrH5uY05THu2xC07MjW6RoNvU?=
 =?us-ascii?Q?JrHGJKXJNocOjTWxgKOicTPNHe3QmbxbO2arqN6bl3dA0xVbY6p23RVhW2fi?=
 =?us-ascii?Q?i23l3o80Z7BxwZCq5pgdLhLpYBre6rqW439XYd9+OaWA66oKHV/UAdyucZ6E?=
 =?us-ascii?Q?ynciYMqUy4knDBATB9DNJ5YODuyYnOiVUJOKOGVSzMQabzyup6/ey4yN+ifK?=
 =?us-ascii?Q?8TQeoOSGFkqETVfSK2zhlh7Cqvwj4/ahXG9J/PCo/cmaIVQbci029K72/a49?=
 =?us-ascii?Q?X3nSoc3GCtu7koelHf9ohZCMUwTP6guB9Q5oMuVzDGDXF8+n1N5BY5PhNZUd?=
 =?us-ascii?Q?mMS0P5oM9a6gCSFRewcDPAuUYp905gEKjzeNkQ/jNZH9CBuZACB7N4h+kfPK?=
 =?us-ascii?Q?t4IXFHy69zDqX/tdGlQTpGYD3sQ83GUhPjlwfrdd/QBDNvxMTF6WjYY7j+W8?=
 =?us-ascii?Q?0WPywcbplFDijV8GTrD28d2rDHmEMNNJC7Fq8PIQDg3aPgscwjEgipmpUKnJ?=
 =?us-ascii?Q?C6DRX6KwlEGpRN67hg4+iZkebMoAAiY+JvHuyoGa5+GX3mbnD0WKC0WEPKoc?=
 =?us-ascii?Q?b8Ong4kJErQqPEMRI22KGRO2KnXEb9U4ONSdJMpxswH97eBHC9oRkBigk9Un?=
 =?us-ascii?Q?FGmM7K+5qOi/Jt6nvpCNCjg1rFSk6Vzof51qOu6SYnPsvzNIvh8WdqdYVr04?=
 =?us-ascii?Q?w3TTP/z2I/sO2J+fHaAdjN47UypYxEpEtOJRX9gFxjwzkSlxyoV/CAFlFSOZ?=
 =?us-ascii?Q?yJK/romK+Sq1paGnE4IJ2XDnNuJOtJqMtMKRW7LUC6uDrYAE1zCwQL9Im1at?=
 =?us-ascii?Q?1vz3xuTWjijv1DyPVgo8Y4V1HmQ2RLIlXMCeGiNJ2+l7CNgOq6OG3wnIhHI+?=
 =?us-ascii?Q?6WPZ4DhHFAq+ePi0tc2XiBoBiZM9liXvN98Y+GxFC1LX2LFZ/UmKY8ExRVB3?=
 =?us-ascii?Q?J0Fgxo0pWit5A3k3FR7HvGB+wTAT3kXi0IOKiPY9Ey7QCVGLCrxLIvot/PBJ?=
 =?us-ascii?Q?RJC9+T0FXp+NZmKHUQeLPMLv/sU8+Yaix0OpYuvRsW3GqB94HZv8NEcdAqlC?=
 =?us-ascii?Q?8WFAs7Q6pnTbLuYfmShc+CjRUCsDU9L9ubYAgBtqbnUomqbv9MJZ3Ujpq/h6?=
 =?us-ascii?Q?a8iVieyIsNsysbrSegfwe9i9nJUa8nygiyYZwzfu4OXTbiDMrfV8/RgTP17i?=
 =?us-ascii?Q?3UQdK0PyUGbf6ay8eKkZYRdZk8fYhHn2V/1f5/fZ55TS0Rdgp0W1C3es/KYx?=
 =?us-ascii?Q?dRU3XETjDYMSXk5yh0e2NsJ+eP0zmow1fc+1zYwrpSvmIKRvAslPvlzOT8X7?=
 =?us-ascii?Q?KNL0EfyDt5I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ie5J0K2WKtWm0BTu+0B84InZBZFD5Khr4tVLBuOjxGyj7SGjn1jeCZDd73xM?=
 =?us-ascii?Q?tzMEOA9YB0rlIRvEd/xi7UhM671S6NFmGfUELsjG74jR+1HoOwS26nZwZk1I?=
 =?us-ascii?Q?91T7AsAIUWIdgD47MN6SV5KYVaK4Lm08Gqa+CV9Zuq/8dxT2r1rmnii9okvt?=
 =?us-ascii?Q?wzbo+3fZFh0unKo2T7cDELhhaIVULrHUQsvuz2CK7+GyNsCKhbU95p7c/5ZY?=
 =?us-ascii?Q?aQBWai8Ded/zInbRrd7FgTJHqmHwfCmzTbqFxFGs/Z0drqq4W5rn7rY2OgGN?=
 =?us-ascii?Q?81k6cggPg6Q3wwA43yWvoyBQNh4eKFlIv6xqkBQhXkmRz0yHQnyCvk6Wituj?=
 =?us-ascii?Q?OG1p69gZc6OAG4kIC0Rtp/epU5XibE9Cxtmtxkq6NtWcaEDADxga1kNjKSsY?=
 =?us-ascii?Q?iO7WOsm6zo19I8qn0tzrrNRAyWU78I8LNz7S9GpV39tmh+vmQf9x5oNsMDd6?=
 =?us-ascii?Q?WpR2cBazMt/Gg3wS0yGDJ3FsmZV8ScEwouONSOtxKwX6tokoTp0bX/HlVHus?=
 =?us-ascii?Q?Mt3iZooeq4vcLyf4W6vL3tEcer0FaFqZR0SZ9LQdqv+r4KS7OqrJIzAeB3GE?=
 =?us-ascii?Q?GtjVd74y0YZQW6+z6xrAw+1VztJ3JhR1xKSFX+8MKM4GtHUKs1NelXxLLYJl?=
 =?us-ascii?Q?3qZR45a6va7D/N+rDNUIDwZ17KC+RkhrV9gXwteJir58izTwIzh2U0F4ix4Y?=
 =?us-ascii?Q?qU7vKsoTQuHOQWucGWvN/LW5GGMx/6Ma39FDDkn9VPjIgwKqlB8noqmCbogd?=
 =?us-ascii?Q?uly3gIvwim6lw6HEcr+EQ4PtO2GsGO0whZ4+i47lny1lwPKvtOU1DxzICoDO?=
 =?us-ascii?Q?YNs+kigO3VuVLi5fx6miNnxlu+Y08gpNl/OYTcKKbhcafV7IOSvHnJNs6reJ?=
 =?us-ascii?Q?vdiuQfol5B2i0gqWHTqszyIvVBc7awr/lrZWiZD3jVC984T6alsjFHVAhVqF?=
 =?us-ascii?Q?YCRxetKPjLCIUbrHLTZGS/Ug0m+IPd0EVrSh71fah6NmmX4lyH91eUXJOI39?=
 =?us-ascii?Q?jkGyHeulI7KBW3vm6zeZ7RRY+jbqIFwJDangx+wJQsZg4XcLR7lc2HQ0M+B+?=
 =?us-ascii?Q?J3cm5zYL4b9aVgvyH1zIp7X2AQRmbP1wsJ3+OsIselYEeuY6G/FsMb01KohC?=
 =?us-ascii?Q?tKd8usMpNEPZp9jaYmSfLEFli4YFpNnjG72DzM4rZNDRyU8Xx2ub5U8M5X8l?=
 =?us-ascii?Q?gdK+Fx+klJTCEcc+ZHoZ8dYj4SWLrm2NHKPkFpDgOGa5Q4/rqHXxRvJSm2r3?=
 =?us-ascii?Q?n86cq0lgmjsDuulU4Efn9fLKJv8gs9du98e+SccAyZRPZnbfGUZWSdsoR2Bl?=
 =?us-ascii?Q?COMuFcNcUt2caGiKQVVuKNTOISRy3h+Wp2eRePkeQRbuYjpcfFXzXpVjnby5?=
 =?us-ascii?Q?bQjEkpC/uveuTv2HdVEit2J4klYwQyY8NS/PFeGfGdx8Kvg+yY5McIfsHils?=
 =?us-ascii?Q?3Bml2Kybk17Hka9ETfp4Tn1r2xYSPEv8nabfiE7LkqRTv/TH1QTElR5LmKLq?=
 =?us-ascii?Q?UbwlgrZ9qb1s6almM1nyCJzDLKoeNM56oErbCqhuxTVo6z6Hf6UcCWISPyZW?=
 =?us-ascii?Q?eIl900xv1sL1dRrNJfan21ZXgey6tQIL9AIi/7n6GaV8RFOcEJjF24MZ6ftA?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 440db679-8963-44a5-3bf8-08ddea4b1f21
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 18:04:12.4101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MEk5Rf6egKam/gsVRq7Hu20bQ8OUod1FicPdcQAM1GKGBAnWxHofglXR99DV4v8b2rBEP1YVk1sT9UlLgviZlo26tRM9hJqU1S59yiAKFaA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5300
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

On Tue, Sep 02, 2025 at 03:17:42PM +0200, Michal Wajdeczko wrote:
>This is a user controlled configfs attribute, we should not
>modify that outside the configfs attr.store() implementation.

agreed... this was the first user of configfs and I don't think it was
the right to do it. However for such a change we should propagate it to
stable too. Riana, any possible issue in userspace? With this change
userspace should do a rmdir() before proceeding so it drops the
configuration.

Lucas De Marchi

>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Riana Tauro <riana.tauro@intel.com>
>---
> drivers/gpu/drm/xe/xe_survivability_mode.c | 1 -
> 1 file changed, 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>index 53c5af4b810c..79426ea46861 100644
>--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>@@ -180,7 +180,6 @@ static void xe_survivability_mode_fini(void *arg)
> 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> 	struct device *dev = &pdev->dev;
>
>-	xe_configfs_clear_survivability_mode(pdev);
> 	sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
> }
>
>-- 
>2.47.1
>
