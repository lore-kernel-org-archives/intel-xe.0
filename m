Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA28C64EC4
	for <intel-xe@archiver.kernel.org>; Thu,  9 Mar 2023 21:45:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 116E510E8E8;
	Thu,  9 Mar 2023 21:45:08 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4DDC10E8E8
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Mar 2023 21:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678398305; x=1709934305;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jfIE4YNMyab9ck/a/rmVGo2KnJ32tD8DXr8NhNwqV6k=;
 b=n1NkSxv6g77i5t6scpjRQa3sPjBX1dFW/p92Gz1PNZmT5AqjryODOWCf
 Acmz9qgudZCfA+DMF0Dzs3dEXwfoMjR9U7x3vqgBiXlk7It+b2P0gxT2T
 /aHe4s8BbcV7166u5LDKdjKaJVO8lE2KjSOm0+EUvN8hPN82LByEI82jc
 XikqWWJpeTqJZaI71DN+kdSavVs1dB6VUwEyBo8BJP9bbLHpjj0Bz8xvk
 dTANXGR7Unboq1Lvm2kDKUtRFyJrmPzzBaGjxluUc7cglL8jZZTvKjJrv
 6nfBZj5nqdDl2U8JNnziXnYMlT1bTmqrS5eOtZxc30/T/g0uD3Q6gbMK5 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="338942616"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; d="scan'208";a="338942616"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 13:45:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="923432387"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; d="scan'208";a="923432387"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 09 Mar 2023 13:45:02 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 9 Mar 2023 13:45:01 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 9 Mar 2023 13:45:01 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 9 Mar 2023 13:45:01 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 9 Mar 2023 13:45:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eWPrOqG0fY7JwBFvcpACylp3jZiNnus9TpcPTNI8SsbHW0R9R8gnBQeRfgLmvE7hh3z4Us54JKxcFYnKfKc5dsoPOUHTE4H/ftPXz1PF5FB+ToPeQspNj/p4JhykHsymPjUZi4kmG9nftJW6xPyIQXxEg2VFOzjGI66GrzwZbT9X2ZythrufHBqd7mm8XwyymFj6/yRdzgDTd0HboyEtPLyKcbn07F68f861nVyj4m327+/rwtWRP0vOFPF0qeByBw1Lr82QvAKCUkB11Pife3Vm3PRh4OpVbbB+Y2UiPT7Vfv95oLYqh0oAmydGiExFpENz45xZv9gENqdAvIhyKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aT4NQIFY3YS3y1qx4JBDa9cH97d/toZh4A3/SYVVP1g=;
 b=kCiC0amWfP1uQmt8WYPOPmcWqBr7v9QxFVXGgVZz9CaN5hsTUTaavakWm4+yuH2K2ZviaJ5gXYYyzRWDRGpxO5AdHE0zQXXNnMfG6dSWKuyaU9yzSmeF3lyiRNKFDoKdCjuHsYfnAcvuuOOFjAHDpIxxtX73cJ0fieC0YkZ/Kv3wXFcjf6booGxvBMq/0vaskrDGenCs7PHi+QjrlqOJ7jzX95RPKLxNZnPwCcaB+2l/UuX3Da5CPW2qw7Ns80q39D8JRZufxzhr/4I7Mxuq8F0wQKtpPDgvJI6gVmRd7dXZ2R6cybBaAWBCvwkKx/3yNaUB27XmBoAlqqUdmR695g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH0PR11MB4887.namprd11.prod.outlook.com (2603:10b6:510:30::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.19; Thu, 9 Mar 2023 21:45:00 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%5]) with mapi id 15.20.6178.017; Thu, 9 Mar 2023
 21:44:59 +0000
Date: Thu, 9 Mar 2023 13:44:55 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230309214455.GD3408186@mdroper-desk1.amr.corp.intel.com>
References: <20230309211210.1713613-1-lucas.demarchi@intel.com>
 <20230309211210.1713613-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230309211210.1713613-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY5PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::34) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH0PR11MB4887:EE_
X-MS-Office365-Filtering-Correlation-Id: 8221cb82-d5ff-41e0-4b9b-08db20e787aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tc2SLMi8lVcJwttka2/E9MXF4GTYQBN6OXsQ4ZDx9wE4fBF89Z+PjLZ9IEpIL1CZohMFIzb7ZijU/4jUiRf/RFwCnZZyCwZ7uyCaIbXT8c6fkxSVxgTBRD3hJWzIZSuKj+4DUGYYryu6BqPAFU3rTVlxBamgcCXxCXit80x2yV8ZaRtC2a1zeo1lj9NvosQibNXUS/GA7U4Km8YPxvS9PlZ4a90NcD9Wo7uaw1QR6YSaxdvgscgjTP+cNHBe4oC+LchAUiNoBYDQ8cV3TXXju81DC/6Ev4wAjkRTePD6Hmqgl8g/D26B8qdDyiKRAUwQoyCHuSdr90J1I+bwlBndV2rh8qXcMvEHzu84/m1uvfT/sdaODvgOnnCIOkNRJ9fxS44e7LOegAi6zKCx5RfBmSuxs7YNPjhneq0j7gittBTmFpizfb2uUTUb1c9OyMyzNbjIcyAIFU35fyHcso/Mk4L21Nq8o8eIffK8cWjrk4CKnFSngEGdauqFYb3H+zOI79DXlzmFHzmRxbHcHWiFYSXCAbfr2xjICkx/wSqZnDMR95xWrjOG2gwQgk+9MzQtNoMTgAzSm1XmJUkeWvxuieALCiISn3DtRHDTZQ4wVRUljifGaVLf3rPHfUUrqs5SOS4HbOEs+BwONL7JJ9Mwvg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(39860400002)(396003)(136003)(376002)(366004)(451199018)(41300700001)(5660300002)(83380400001)(1076003)(6666004)(6506007)(6486002)(6512007)(26005)(186003)(478600001)(66556008)(8676002)(4326008)(33656002)(66946007)(66476007)(8936002)(6862004)(86362001)(6636002)(38100700002)(316002)(82960400001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6W5aPPVHfoS7vaojNuR7E+RpMlYvFyw49kX9BwXI4jAom7boIk1OCOzu8cSF?=
 =?us-ascii?Q?nu7URnNq2PIm5UoZxSeUXkCQteLWwigELOLFQX8qsAUqarl5nRQ9DrQlbLYw?=
 =?us-ascii?Q?9G9qzIQ69kmJVodqTmD56IC7P18IUdPxZtYCaiOAJIUV9lGhEgpa8fs2MUM5?=
 =?us-ascii?Q?xkNb4KLZoo88P1M+elviVEIq7X2w294cPFMyBixNho9anIjfpMdhFwc/gYFg?=
 =?us-ascii?Q?4uf7M07s5RC30TcMsVAvWctF/jL370sKlWL4OzGT/9HpfktS/yBGG/Jeh3Gd?=
 =?us-ascii?Q?CEFa0YJbVupaYfj8fqHLg5nSvayJLXPhnRsjaUiWiLEo9Tt+fNbeX/0UHRv4?=
 =?us-ascii?Q?jE6zflxjoKyTMtIQSqCoR9sPySDacBMlzwGOtYDxk2LZYiCVMPBxX3wtoEcY?=
 =?us-ascii?Q?nheRr5mGlIN0HLTdP8u2vJGVqV+lbNtWi9o/JkLCxU/heNZfe6ZdQr8kO96K?=
 =?us-ascii?Q?oT6oef0srjm4sPMBp3rXP05/mZEcU6DHR50dYi6ORLw0Wxv3h0Ta2QTTJKdC?=
 =?us-ascii?Q?SG7a4qB/ZWENoYeg3M6bheR8VPiCEo/SI2Lre8hq13Y9b1jjWqbGZ9/cfu/k?=
 =?us-ascii?Q?Y/WZEZU0UB5mTXJgH672/loJvEPeVQXHlhWmdmMe8F5wQ7uhgP+xW5tynlin?=
 =?us-ascii?Q?7c/QtyAKfL2KYAN100ORK+2AvAf2fmlGKg7RdqcV09CIn7HwbJ3QyB+6kDZB?=
 =?us-ascii?Q?lJcXlWVjK1MpiryFphFzWVGEF164KQKaXgmA2PTlCzCuZi/0I2eMox37ooHT?=
 =?us-ascii?Q?heXqSXZWYR4DQ4LJ81p/Tapan8VpL6XEmWcrM769FDMSlnoEv3K7sei5+eAU?=
 =?us-ascii?Q?JaIlMsiZu54A1CsTfz16HqbNuOK9nvgyN/kxVK+Qqm64Qh2UHEXg5C+AAU/b?=
 =?us-ascii?Q?vOdAiVjO1VQHNz+TmP6hu7COr3hZX93VVfVCc2TqSu2HBFUkkuySuXCYcJvK?=
 =?us-ascii?Q?UK+4fSQBUChvyAA3KaFozHrWVI3180eGTBEJbaOFYyrocQyGcAeeIaHuORNK?=
 =?us-ascii?Q?MkjLw1i3EdKcQMeBB+5MmYkFfnsHsw5GjgT554DJdas/+y4zt8aYw0BQJFdV?=
 =?us-ascii?Q?l2/fO6a+wEbXW8uQCypmfvQ9oFlVEYIe7/QOZUUlSFk+c5JXbZMbItEqZjl4?=
 =?us-ascii?Q?hyR6/bULn0aa0wkb/d9N3rOQl0ek/qwbH46gBbJqlvHLC9o21s2mPSXDQvbo?=
 =?us-ascii?Q?y6lzUCHs5R2ieSXQpzJHYw2r528Gjjd8dkKrnJuIBoL8exDX5946q/0DJIfv?=
 =?us-ascii?Q?0Yk+EmVJw7rH0/hlb9jMWw5WumMzByT/d1/J5RwgHWjJ9hrlpBP+aeoJ4lfK?=
 =?us-ascii?Q?8ARQ50fp76eZ8Go6Lt2MskpV8/2CAJeKBQ7eu51NNCllHJOKf67lwdWEHPLj?=
 =?us-ascii?Q?F6rB6sRJQzkJzvUBM02qjdEhSgCtQ7XD39dZ1JFwX0WpryL/SC8i3LX7qNzA?=
 =?us-ascii?Q?Jc7SR22gDMpImN1LYyAmipVc1Ai42wdv6d334j4Q2gjl/11TuinfiTzHQ2uu?=
 =?us-ascii?Q?8D6oHrjs4+KIYzlrzBKGIOwik7s62odVfXXNoeXPxi2YZQ6ksQtWPFI5kWfH?=
 =?us-ascii?Q?by4JQhFDvM/KDdSBZ/ySxocxjY2KDs7NtlredTEhHTIeau27oiMF0Nyn5FUW?=
 =?us-ascii?Q?8Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8221cb82-d5ff-41e0-4b9b-08db20e787aa
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 21:44:59.0238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T8Ty5Pk/CZgTunyenJf8CrtwvwLd6ZXMAV35IqKjViRTfwnq74989nwTIWFAUoyd566J5zY0i98J7ww7UdLJTyPiJwTO7p5VqDKCB5Gc/sI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4887
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe/mcr: Document how to
 initialize group/instance
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

On Thu, Mar 09, 2023 at 01:12:10PM -0800, Lucas De Marchi wrote:
> Add a sentence about the initialization so it's clear for newcomers
> how to tweak the init functions for new platforms.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_mcr.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index ab8fc649ba52..b7cee438f6e3 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -34,7 +34,10 @@
>   * fused off or currently powered down due to power gating, the MMIO operation
>   * is "terminated" by the hardware.  Terminated read operations will return a
>   * value of zero and terminated unicast write operations will be silently
> - * ignored.
> + * ignored. During device initialization, the goal of the various
> + * ``init_steering_*()`` functions is to apply the termination rules for each
> + * steering type and return a steering that selects an instance that is not
> + * fused off.

Bikeshed:  how about wording it as:

        "During device initialization, the goal of the various
        ``init_steering_*()`` functions is to apply the
        platform-specific rules for each MCR register type to identify
        a steering target that will select a non-terminated instance."

Pretty much the same as what you had except that it clarifies these
rules are platform-specific, that "types" are technically register types
rather than steering types (steering behavior is just a detail of the
register type), and that we're 'identifying' rather than 'returning' the
target (since they're void functions).

Up to you whether you like that better or prefer the original form.
Either way,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


>   */
>  
>  enum {
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
