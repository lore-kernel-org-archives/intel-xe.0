Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FDACEB64DD
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jul 2023 19:41:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E07C010E606;
	Thu, 20 Jul 2023 19:41:42 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10AD310E606
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jul 2023 19:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689882102; x=1721418102;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UHrJVQlSpWhnw6P7/zg/B8ZJrjSFq+WpuNqKx3FLOmc=;
 b=HR1DM2/BsSues5eqbuTdIETB0/W9SLuTgJyPoCSA7Ed47WD9o5TgyJVW
 PeqGn47MV/6B0Ct9SdElEoncyDgjxlxMgcrqRrhEGhuzff8IUWDRfO5sd
 JC17V+BoRXEwGNLnOfY+0hCKhsbKoQDqu76MF3Das6FJYOwRjiK2n5v2N
 TvdkPY5hduzWEmrd6WayOZQnyEmvXmZscY19VudqCENaiIlqh18HAPLDx
 SWHLTK/G742jadEByTolQ8lRfAp074FUEIsSl9pQH+RPagJ8NnO2QHLwu
 /HI6VTSHsISqOzLsXZVqxA6sj+EChuM2pmDo9OJgcF+3/33I08qk3kbQi w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="364312017"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="364312017"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 12:41:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="701775263"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="701775263"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 20 Jul 2023 12:41:41 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 12:41:40 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 12:41:40 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 20 Jul 2023 12:41:40 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 20 Jul 2023 12:41:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eS0BkR2QrdYxBGGmY7u66x5UJrUTO8EbteBUxtOTFnjHl+A/dYBJeQHxz2j+jDGQfIbLzbZPlnNcQfDhUxu08sEsOZEFdArke/WE9hTzMc9ljBCsSg9zAr8BOnMAMV0yAiLLn17YJjAjNT9giTKdF3E3nf9RkI+WVzs4lQmjHX4VApdaSvo3RNDW9UTydndN0Qh45DWl1MkDDuD55uM23PI1w7Je2ZiO726PGjTx7On54C5CHC8kXb9eSuwGZWzjvhfWGdvDL6MD2etl8D8+sYr+UcYsuAttnHYkZ8iSU/hfQzljlqm0Spiodaa75oON5xbkMWhYDeXXBGuqisrKsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WHooxi3HDlnogI1dAKJ7UVZ7PXF5wIsRuQsrGgQEHkw=;
 b=NFlzxfELMZDGK43p8JBQyUDIN7WccyrOhUSRPoVbI8c8Ql4MuG9KU1YodKoz1JlYJbSsjlQkFQpi5+/+ySBgLlDc/raraLT2IG44gEkxssqBujpahcy2PjJELqFc3wRmnqldpWy9TC/1F649iqkplfbgwYe2BcT8KSkeOzmieWE+Ze6rr6FBDalPN1QhybGvYqqlUHSaaaWn7hO9xuNKDGLfDdeO8xnH4XZSN2dR3ZWNNLhO4uaSVTwmSRsmK0h4WwVAQ1DPgiuG4H++nhrhhLoXOvG0+F0R15zc4JyomyW4InLbAHyiwiH5fOFFgmICxMOAcqb/6kg5vWD0aXvWNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB6229.namprd11.prod.outlook.com (2603:10b6:208:3c6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.23; Thu, 20 Jul
 2023 19:41:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0%3]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 19:41:36 +0000
Date: Thu, 20 Jul 2023 19:40:51 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <ZLmNw482x0YhI5zl@DUT025-TGLU.fm.intel.com>
References: <20230720142510.534057-1-tejas.upadhyay@intel.com>
 <20230720142510.534057-7-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230720142510.534057-7-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BYAPR06CA0001.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB6229:EE_
X-MS-Office365-Filtering-Correlation-Id: 834812d9-90ef-40f0-afef-08db89595474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KPqDB8p7ikUSkrzB1pBgyI05/dbKw86efX61hJcCu1caZMqmCjRpqYHaSmjTen69ZoDrllem/RROGHvM+KgyjLCpwSXAkO3AOPnzclwTuY3QvxzzkbI+6tMITyBD8bLJrZsK1vE9UUTUg3aQ6WmhYdDeu8Aud5k4ccKUaXTlEjxCGWw2yhPBT4QBxn55NSL+5P3hB1LXnSQw9nDh2FELHabSVGFKFPfit9QRZNNQrf5b6UVKaNaqfniC3VK6lKrgJGpTXeoewrIhsntR4XufvAxtMz3Kd0zeiOa3XbJvzVDXtmO7oOcvOanCqsgfdY371RlEEi1yuOo6u6ueDmeoRVDXbVq4IMdsR8gEM58LjSm+CZFvjNPSEOE6UtfdRS/0wz1yLsborSfhatYVQKm3MOaK92grlpqEtgBDKJ+lq+ZTp3c8IPa3MGN4rGnQ7xJYSXTt9muimVLPvvNZT5orgNEyu2pHnJnA7eauT8Iqobvs+JUapGv1d4pFumND93++pYTaYW4IkWPekU0AbzQoYjK6FVMgn0BV3blpjsHOeYRqWPn9T62JVxfk8I4JYqKJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(346002)(376002)(366004)(396003)(451199021)(2906002)(30864003)(44832011)(8936002)(8676002)(66556008)(66476007)(4326008)(6636002)(66946007)(316002)(41300700001)(6862004)(5660300002)(6506007)(6486002)(6512007)(186003)(478600001)(19627235002)(6666004)(83380400001)(26005)(86362001)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c8pKKBCVYEQ8ipBxsqU8mTKD8GHI3ig3Z9T256Y+6L2Iki8FHcso4BrVkAYG?=
 =?us-ascii?Q?WaOi7A8cx+MsM2/+Gmz3C5/bIArqiWa0Nm68aPRoFWJOJfRM/o7poWad6OF5?=
 =?us-ascii?Q?b/PKvvpdfLonWJcdzxQ9Ia1ek1bUPISnQqSxFNYHcfRJKeTgBkW+VqBR3PXm?=
 =?us-ascii?Q?2sbF/flKKQNARV3FN3EqXhB6oPBmcUx26sP7n1LcWhE8HFcWgu8RoPuMj11h?=
 =?us-ascii?Q?wol7Tcf/o1oGz3kiTGnbNnFY9Yn/MeqOm7ZpakxiUl1LdyieW/RmAD28JkXS?=
 =?us-ascii?Q?oOxyCUrKQPES5kqHdHeN4dxRgX4NoCsm+P8QaISLQ2wORi4gCfv3tpJ4DKaB?=
 =?us-ascii?Q?rIm5k1em9wKzdZbO+pVBwi25C7VKuxr6fVZpkmtkF93cmOoU+6+2EpQj/dCz?=
 =?us-ascii?Q?8AodHULhnWmH3GoZRqXDJ+DYaDH5TRCxPTj93r/CmDm7ktPOe5gbfTX+ikq4?=
 =?us-ascii?Q?Vie2Nef4S1JrDqbd8Lz+Jq5eHLAhssDR3qyZQNSXqXyyGPpew8oSO7QGRey2?=
 =?us-ascii?Q?AC5WkoJyHVYx/funFnvjePnIg7EkI1SocSsuI9PmIVzDstg4ikwO+KxOMe99?=
 =?us-ascii?Q?wrGbq/Hrr/iV9NMn5topotjOQK2LKvi+yNntYHHQuO2JFVMs9OmacC9gBTb8?=
 =?us-ascii?Q?00T4LxqlB90gWuMqSBD3Oex5kkhnK8TNIw8lVj+MkqRuooHhwnJkPlev1/tV?=
 =?us-ascii?Q?10mEHOO/UEGuxh77djhITFK0yklNwRRe9ooYqOmvNsTmEJ5m16PwbWzvHhD3?=
 =?us-ascii?Q?J7aIMDlysKbT2rL6cdyXIdD98aAyxWvEwPb1txh8CgSOqpfLoltlhmuEwjth?=
 =?us-ascii?Q?VBwtZjIExWNL8HKOVi0EQ/Pd3bHV0uNsCWWkI6Q+G9vzVDsTaYuYneNmjcdd?=
 =?us-ascii?Q?Ga5cgIy3Dos5K4hQ7mCQ8FRyaNEQSOVCHNeo0QdHOhQ3gNDWkgxF1RxaYklN?=
 =?us-ascii?Q?4KUzmaACpZN263/GrplfLu4deGWPXkySj/i0NNemBuFmKWz1tmsuN3TBRJ5y?=
 =?us-ascii?Q?xy45dIqN5qbcC/GXMpRgKVbWnNOvdFENXtsvKw1//N89XbnW8YPsHZ+bkV9T?=
 =?us-ascii?Q?fZoA9OyT1NDqUwkcA1KkV8VHV0uhPo5zofLs0DEawLixbY4f7rppO21P09Rp?=
 =?us-ascii?Q?QRz4Q7gCShzc1QA21XeFq2jOwxpqC5qdyUJX/9FOGg8UrJRaUogKC3oTqquT?=
 =?us-ascii?Q?pzEgzaNx7th1fnILF2wg+P4lkeNJYjuL8ozrssiv6vGzD2nSkN/9xYLtrfn6?=
 =?us-ascii?Q?IH47AAEMAd3K/6+fIbyul+XUI1+9xMKx2hGDYb62Eegjj9PhyRIrvoiC8yXy?=
 =?us-ascii?Q?1yqB7cVhuxvPrMeVC1svdq7JuqtRVpH0Vy3zgDCvA1QLtMseWPKo/wwI0j6y?=
 =?us-ascii?Q?/KUG1fPzjbRRRG81Ch8eQ/kdFlPd81jsakQkzI/r8UsB3SKG9+MKQAsrov0y?=
 =?us-ascii?Q?bIMnxxaEdZud3d6Vg4oRxUwz2cVzgq9Z9N/g2wGMAeJ2kFL/9T32zq1sS+PK?=
 =?us-ascii?Q?R/nD0pDWKHSyIXdiLCJnuORDYXjqRe0CGqed1fstXejtcHm/OiYXE+R3RUWC?=
 =?us-ascii?Q?40Gk9DI3MyKjcRMy9iHocWvpHhWmIQNUEpGZ7fcHzqJwOFgg8QvWSqgVM+Zn?=
 =?us-ascii?Q?cA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 834812d9-90ef-40f0-afef-08db89595474
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 19:41:36.7490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3X937VGnIlnG7tzRwamqItUjk1QaYMM/69Mprko8ngm1YCvS7vdQ8qT4WB+z+TPC1erREvCWekOF4fhNpLqY0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6229
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V5 6/6] drm/xe: Add min/max cap for engine
 scheduler properties
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

On Thu, Jul 20, 2023 at 07:55:10PM +0530, Tejas Upadhyay wrote:
> Add sysfs entries for the min, max, and defaults for each of
> engine scheduler controls for every hardware engine class.
> 
> Non-elevated user IOCTLs to set these controls must be within
> the min-max ranges of the sysfs entries, elevated user can set
> these controls to any value. However, introduced compile time
> CONFIG min-max values which restricts elevated user to be in
> compile time min-max range if at all sysfs min/max are violated.
> 
> Sysfs entries examples are,
> DUT# cat /sys/class/drm/cardX/device/tileN/gtN/engines/ccs/.defaults/
> job_timeout_max         job_timeout_ms          preempt_timeout_min     timeslice_duration_max  timeslice_duration_us
> job_timeout_min         preempt_timeout_max     preempt_timeout_us      timeslice_duration_min
> 
> DUT# cat /sys/class/drm/card1/device/tileN/gtN/engines/ccs/
> .defaults/              job_timeout_min         preempt_timeout_max     preempt_timeout_us      timeslice_duration_min
> job_timeout_max         job_timeout_ms          preempt_timeout_min     timeslice_duration_max  timeslice_duration_us
> 
> V5 :
>    - Rebase to resolve conflicts - CI
> V4 :
>    - Rebase
>    - Update commit to reflect tile addition
>    - Use XE_HW macro directly as they are already filtered
>      for CONFIG checks - Niranjana
>    - Add CONFIG for enable/disable min/max limitation
>      on elevated user. Default is enable - Matt/Joonas
> V3 :
>    - Resolve CI hooks warning for kernel-doc
> V2 :
>    - Restric min/max setting to #define default min/max for
>      elevated user - Himal
>    - Remove unrelated changes from patch - Niranjana
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig                 |   7 +
>  drivers/gpu/drm/xe/Kconfig.profile         |  45 +++
>  drivers/gpu/drm/xe/xe_engine.c             |  43 ++-
>  drivers/gpu/drm/xe/xe_engine_class_sysfs.c | 392 ++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_engine_class_sysfs.h |   1 +
>  drivers/gpu/drm/xe/xe_hw_engine.c          |   6 +
>  drivers/gpu/drm/xe/xe_hw_engine.h          |  31 ++
>  drivers/gpu/drm/xe/xe_hw_engine_types.h    |  12 +
>  8 files changed, 530 insertions(+), 7 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/Kconfig.profile
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index d44794f99338..9d587c3ccffa 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -83,3 +83,10 @@ depends on DRM_XE
>  depends on EXPERT
>  source "drivers/gpu/drm/xe/Kconfig.debug"
>  endmenu
> +
> +menu "drm/xe Profile Guided Optimisation"
> +	visible if EXPERT
> +	depends on DRM_XE
> +	source "drivers/gpu/drm/xe/Kconfig.profile"
> +endmenu
> +
> diff --git a/drivers/gpu/drm/xe/Kconfig.profile b/drivers/gpu/drm/xe/Kconfig.profile
> new file mode 100644
> index 000000000000..0cc87d286587
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/Kconfig.profile
> @@ -0,0 +1,45 @@
> +config DRM_XE_JOB_TIMEOUT_MAX
> +       int "Default max job timeout (ms)"
> +       default 10000 # milliseconds
> +       help
> +         Configures the default max job timeout after which job will
> +         be forcefully taken away from scheduler.
> +config DRM_XE_JOB_TIMEOUT_MIN
> +       int "Default max job timeout (ms)"
> +       default 1 # milliseconds
> +       help
> +         Configures the default min job timeout after which job will
> +         be forcefully taken away from scheduler.
> +config DRM_XE_TIMESLICE_MAX
> +       int "Default max timeslice duration (us)"
> +       default 10000000 # microseconds
> +       help
> +         Configures the default max timeslice duration between multiple
> +         contexts by guc scheduling.
> +config DRM_XE_TIMESLICE_MIN
> +       int "Default min timeslice duration (us)"
> +       default 1 # microseconds
> +       help
> +         Configures the default min timeslice duration between multiple
> +         contexts by guc scheduling.
> +config DRM_XE_PREEMPT_TIMEOUT_MAX
> +       int "Default max  preempt timeout (us)"
> +       default 10000000 # microseconds
> +       help
> +         Configures the default max preempt timeout after which context
> +         will be forcefully taken away and higher priority context will
> +         run.
> +config DRM_XE_PREEMPT_TIMEOUT_MIN
> +       int "Default min  preempt timeout (us)"
> +       default 1 # microseconds
> +       help
> +         Configures the default min preempt timeout after which context
> +         will be forcefully taken away and higher priority context will
> +         run.
> +config DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
> +       bool "Default configuration of limitation on scheduler timeout"
> +       default y
> +       help
> +         Configures the enablement of limitation on scheduler timeout
> +	 to apply to applicable user. For elevated user, all above MIN
> +	 and MAX values will apply when this configuration is enable.
> diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
> index aa2d49efb9bb..e64b84dc24de 100644
> --- a/drivers/gpu/drm/xe/xe_engine.c
> +++ b/drivers/gpu/drm/xe/xe_engine.c
> @@ -12,6 +12,7 @@
>  #include <drm/xe_drm.h>
>  
>  #include "xe_device.h"
> +#include "xe_engine_class_sysfs.h"
>  #include "xe_gt.h"
>  #include "xe_hw_fence.h"
>  #include "xe_lrc.h"
> @@ -191,9 +192,21 @@ static int engine_set_priority(struct xe_device *xe, struct xe_engine *e,
>  static int engine_set_timeslice(struct xe_device *xe, struct xe_engine *e,
>  				u64 value, bool create)
>  {
> -	if (!capable(CAP_SYS_NICE))
> +	if (!capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(value,
> +				     e->hwe->sched_props.timeslice_min,
> +				     e->hwe->sched_props.timeslice_max))
>  		return -EPERM;
>  
> +#ifdef CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
> +	if (CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT &&

CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT is checked twice, seems redundant.

Other than this NIT, patch LGTM.

Matt

> +	    capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(value,
> +				     XE_HW_ENGINE_TIMESLICE_MIN,
> +				     XE_HW_ENGINE_TIMESLICE_MAX))
> +		return -EPERM;
> +#endif
> +
>  	return e->ops->set_timeslice(e, value);
>  }
>  
> @@ -201,8 +214,20 @@ static int engine_set_preemption_timeout(struct xe_device *xe,
>  					 struct xe_engine *e, u64 value,
>  					 bool create)
>  {
> -	if (!capable(CAP_SYS_NICE))
> +	if (!capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(value,
> +				     e->hwe->sched_props.preempt_timeout_min,
> +				     e->hwe->sched_props.preempt_timeout_max))
> +		return -EPERM;
> +
> +#ifdef CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
> +	if (CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT &&
> +	    capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(value,
> +				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
> +				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
>  		return -EPERM;
> +#endif
>  
>  	return e->ops->set_preempt_timeout(e, value);
>  }
> @@ -269,8 +294,20 @@ static int engine_set_job_timeout(struct xe_device *xe, struct xe_engine *e,
>  	if (XE_IOCTL_DBG(xe, !create))
>  		return -EINVAL;
>  
> -	if (!capable(CAP_SYS_NICE))
> +	if (!capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(value,
> +				     e->hwe->sched_props.job_timeout_min,
> +				     e->hwe->sched_props.job_timeout_max))
> +		return -EPERM;
> +
> +#ifdef CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
> +	if (CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT &&
> +	    capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(value,
> +				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
> +				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
>  		return -EPERM;
> +#endif
>  
>  	return e->ops->set_job_timeout(e, value);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
> index 8350f7441af6..42299a024c44 100644
> --- a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
> @@ -11,6 +11,11 @@
>  
>  static int xe_add_engine_class_defaults(struct kobject *parent);
>  
> +bool engine_timeout_in_range(u64 timeout, u64 min, u64 max)
> +{
> +	return timeout >= min && timeout <= max;
> +}
> +
>  static void kobj_xe_engine_release(struct kobject *kobj)
>  {
>  	kfree(kobj);
> @@ -39,6 +44,92 @@ kobj_xe_engine(struct kobject *parent, char *name)
>  	return khwe;
>  }
>  
> +static ssize_t job_timeout_max_store(struct kobject *kobj,
> +				     struct kobj_attribute *attr,
> +				     const char *buf, size_t count)
> +{
> +	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
> +	u32 timeout;
> +	int err;
> +
> +	err = kstrtou32(buf, 0, &timeout);
> +	if (err)
> +		return err;
> +
> +	if (!capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(timeout,
> +				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
> +				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
> +		return -EINVAL;
> +
> +#ifdef CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
> +	if (CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT &&
> +	    capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(timeout,
> +				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
> +				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
> +		return -EINVAL;
> +#endif
> +
> +	WRITE_ONCE(hwe->sched_props.job_timeout_max, timeout);
> +
> +	return count;
> +}
> +
> +static ssize_t job_timeout_max_show(struct kobject *kobj,
> +				    struct kobj_attribute *attr, char *buf)
> +{
> +	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
> +
> +	return sprintf(buf, "%u\n", hwe->sched_props.job_timeout_max);
> +}
> +
> +static struct kobj_attribute job_timeout_max_attr =
> +__ATTR(job_timeout_max, 0644, job_timeout_max_show, job_timeout_max_store);
> +
> +static ssize_t job_timeout_min_store(struct kobject *kobj,
> +				     struct kobj_attribute *attr,
> +				     const char *buf, size_t count)
> +{
> +	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
> +	u32 timeout;
> +	int err;
> +
> +	err = kstrtou32(buf, 0, &timeout);
> +	if (err)
> +		return err;
> +
> +	if (!capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(timeout,
> +				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
> +				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
> +		return -EINVAL;
> +
> +#ifdef CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
> +	if (CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT &&
> +	    capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(timeout,
> +				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
> +				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
> +		return -EINVAL;
> +#endif
> +
> +	WRITE_ONCE(hwe->sched_props.job_timeout_min, timeout);
> +
> +	return count;
> +}
> +
> +static ssize_t job_timeout_min_show(struct kobject *kobj,
> +				    struct kobj_attribute *attr, char *buf)
> +{
> +	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
> +
> +	return sprintf(buf, "%u\n", hwe->sched_props.job_timeout_min);
> +}
> +
> +static struct kobj_attribute job_timeout_min_attr =
> +__ATTR(job_timeout_min, 0644, job_timeout_min_show, job_timeout_min_store);
> +
>  static ssize_t job_timeout_store(struct kobject *kobj,
>  				 struct kobj_attribute *attr,
>  				 const char *buf, size_t count)
> @@ -51,8 +142,20 @@ static ssize_t job_timeout_store(struct kobject *kobj,
>  	if (err)
>  		return err;
>  
> -	if (timeout > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
> +	if (!capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(timeout,
> +				     hwe->sched_props.job_timeout_min,
> +				     hwe->sched_props.job_timeout_max))
> +		return -EINVAL;
> +
> +#ifdef CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
> +	if (CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT &&
> +	    capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(timeout,
> +				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
> +				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
>  		return -EINVAL;
> +#endif
>  
>  	WRITE_ONCE(hwe->sched_props.job_timeout_ms, timeout);
>  
> @@ -81,6 +184,28 @@ static ssize_t job_timeout_default(struct kobject *kobj,
>  static struct kobj_attribute job_timeout_def =
>  __ATTR(job_timeout_ms, 0444, job_timeout_default, NULL);
>  
> +static ssize_t job_timeout_min_default(struct kobject *kobj,
> +				       struct kobj_attribute *attr, char *buf)
> +{
> +	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);
> +
> +	return sprintf(buf, "%u\n", hwe->defaults.job_timeout_min);
> +}
> +
> +static struct kobj_attribute job_timeout_min_def =
> +__ATTR(job_timeout_min, 0444, job_timeout_min_default, NULL);
> +
> +static ssize_t job_timeout_max_default(struct kobject *kobj,
> +				       struct kobj_attribute *attr, char *buf)
> +{
> +	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);
> +
> +	return sprintf(buf, "%u\n", hwe->defaults.job_timeout_max);
> +}
> +
> +static struct kobj_attribute job_timeout_max_def =
> +__ATTR(job_timeout_max, 0444, job_timeout_max_default, NULL);
> +
>  static ssize_t timeslice_duration_store(struct kobject *kobj,
>  					struct kobj_attribute *attr,
>  					const char *buf, size_t count)
> @@ -93,14 +218,115 @@ static ssize_t timeslice_duration_store(struct kobject *kobj,
>  	if (err)
>  		return err;
>  
> -	if (duration > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
> +	if (!capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(duration,
> +				     hwe->sched_props.timeslice_min,
> +				     hwe->sched_props.timeslice_max))
>  		return -EINVAL;
>  
> +#ifdef CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
> +	if (CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT &&
> +	    capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(duration,
> +				     XE_HW_ENGINE_TIMESLICE_MIN,
> +				     XE_HW_ENGINE_TIMESLICE_MAX))
> +		return -EINVAL;
> +#endif
> +
>  	WRITE_ONCE(hwe->sched_props.timeslice_us, duration);
>  
>  	return count;
>  }
>  
> +static ssize_t timeslice_duration_max_store(struct kobject *kobj,
> +					    struct kobj_attribute *attr,
> +					    const char *buf, size_t count)
> +{
> +	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
> +	u32 duration;
> +	int err;
> +
> +	err = kstrtou32(buf, 0, &duration);
> +	if (err)
> +		return err;
> +
> +	if (!capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(duration,
> +				     XE_HW_ENGINE_TIMESLICE_MIN,
> +				     XE_HW_ENGINE_TIMESLICE_MAX))
> +		return -EINVAL;
> +
> +#ifdef CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
> +	if (CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT &&
> +	    capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(duration,
> +				     XE_HW_ENGINE_TIMESLICE_MIN,
> +				     XE_HW_ENGINE_TIMESLICE_MAX))
> +		return -EINVAL;
> +#endif
> +
> +	WRITE_ONCE(hwe->sched_props.timeslice_max, duration);
> +
> +	return count;
> +}
> +
> +static ssize_t timeslice_duration_max_show(struct kobject *kobj,
> +		struct kobj_attribute *attr,
> +		char *buf)
> +{
> +	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
> +
> +	return sprintf(buf, "%u\n", hwe->sched_props.timeslice_max);
> +}
> +
> +static struct kobj_attribute timeslice_duration_max_attr =
> +	__ATTR(timeslice_duration_max, 0644, timeslice_duration_max_show,
> +	       timeslice_duration_max_store);
> +
> +static ssize_t timeslice_duration_min_store(struct kobject *kobj,
> +					    struct kobj_attribute *attr,
> +					    const char *buf, size_t count)
> +{
> +	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
> +	u32 duration;
> +	int err;
> +
> +	err = kstrtou32(buf, 0, &duration);
> +	if (err)
> +		return err;
> +
> +	if (!capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(duration,
> +				     XE_HW_ENGINE_TIMESLICE_MIN,
> +				     XE_HW_ENGINE_TIMESLICE_MAX))
> +		return -EINVAL;
> +
> +#ifdef CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
> +	if (CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT &&
> +	    capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(duration,
> +				     XE_HW_ENGINE_TIMESLICE_MIN,
> +				     XE_HW_ENGINE_TIMESLICE_MAX))
> +		return -EINVAL;
> +#endif
> +
> +	WRITE_ONCE(hwe->sched_props.timeslice_min, duration);
> +
> +	return count;
> +}
> +
> +static ssize_t timeslice_duration_min_show(struct kobject *kobj,
> +					   struct kobj_attribute *attr, char *buf)
> +{
> +	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
> +
> +	return sprintf(buf, "%u\n", hwe->sched_props.timeslice_min);
> +}
> +
> +static struct kobj_attribute timeslice_duration_min_attr =
> +	__ATTR(timeslice_duration_min, 0644, timeslice_duration_min_show,
> +	       timeslice_duration_min_store);
> +
>  static ssize_t timeslice_duration_show(struct kobject *kobj,
>  		struct kobj_attribute *attr, char *buf)
>  {
> @@ -110,7 +336,7 @@ static ssize_t timeslice_duration_show(struct kobject *kobj,
>  }
>  
>  static struct kobj_attribute timeslice_duration_attr =
> -	__ATTR(timeslice_duration_us, 0644, timeslice_duration_show, 
> +	__ATTR(timeslice_duration_us, 0644, timeslice_duration_show,
>  	       timeslice_duration_store);
>  
>  static ssize_t timeslice_default(struct kobject *kobj,
> @@ -124,6 +350,28 @@ static ssize_t timeslice_default(struct kobject *kobj,
>  static struct kobj_attribute timeslice_duration_def =
>  __ATTR(timeslice_duration_us, 0444, timeslice_default, NULL);
>  
> +static ssize_t timeslice_min_default(struct kobject *kobj,
> +				     struct kobj_attribute *attr, char *buf)
> +{
> +	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);
> +
> +	return sprintf(buf, "%u\n", hwe->defaults.timeslice_min);
> +}
> +
> +static struct kobj_attribute timeslice_duration_min_def =
> +__ATTR(timeslice_duration_min, 0444, timeslice_min_default, NULL);
> +
> +static ssize_t timeslice_max_default(struct kobject *kobj,
> +				     struct kobj_attribute *attr, char *buf)
> +{
> +	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);
> +
> +	return sprintf(buf, "%u\n", hwe->defaults.timeslice_max);
> +}
> +
> +static struct kobj_attribute timeslice_duration_max_def =
> +__ATTR(timeslice_duration_max, 0444, timeslice_max_default, NULL);
> +
>  static ssize_t preempt_timeout_store(struct kobject *kobj,
>  				     struct kobj_attribute *attr,
>  				     const char *buf, size_t count)
> @@ -136,8 +384,20 @@ static ssize_t preempt_timeout_store(struct kobject *kobj,
>  	if (err)
>  		return err;
>  
> -	if (timeout > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
> +	if (!capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(timeout,
> +				     hwe->sched_props.preempt_timeout_min,
> +				     hwe->sched_props.preempt_timeout_max))
> +		return -EINVAL;
> +
> +#ifdef CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
> +	if (CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT &&
> +	    capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(timeout,
> +				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
> +				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
>  		return -EINVAL;
> +#endif
>  
>  	WRITE_ONCE(hwe->sched_props.preempt_timeout_us, timeout);
>  
> @@ -167,17 +427,141 @@ static ssize_t preempt_timeout_default(struct kobject *kobj,
>  static struct kobj_attribute preempt_timeout_def =
>  __ATTR(preempt_timeout_us, 0444, preempt_timeout_default, NULL);
>  
> +static ssize_t preempt_timeout_min_default(struct kobject *kobj,
> +					   struct kobj_attribute *attr,
> +					   char *buf)
> +{
> +	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);
> +
> +	return sprintf(buf, "%u\n", hwe->defaults.preempt_timeout_min);
> +}
> +
> +static struct kobj_attribute preempt_timeout_min_def =
> +__ATTR(preempt_timeout_min, 0444, preempt_timeout_min_default, NULL);
> +
> +static ssize_t preempt_timeout_max_default(struct kobject *kobj,
> +					   struct kobj_attribute *attr,
> +					   char *buf)
> +{
> +	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);
> +
> +	return sprintf(buf, "%u\n", hwe->defaults.preempt_timeout_max);
> +}
> +
> +static struct kobj_attribute preempt_timeout_max_def =
> +__ATTR(preempt_timeout_max, 0444, preempt_timeout_max_default, NULL);
> +
> +static ssize_t preempt_timeout_max_store(struct kobject *kobj,
> +					 struct kobj_attribute *attr,
> +					 const char *buf, size_t count)
> +{
> +	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
> +	u32 timeout;
> +	int err;
> +
> +	err = kstrtou32(buf, 0, &timeout);
> +	if (err)
> +		return err;
> +
> +	if (!capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(timeout,
> +				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
> +				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
> +		return -EINVAL;
> +
> +#ifdef CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
> +	if (CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT &&
> +	    capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(timeout,
> +				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
> +				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
> +		return -EINVAL;
> +#endif
> +
> +	WRITE_ONCE(hwe->sched_props.preempt_timeout_max, timeout);
> +
> +	return count;
> +}
> +
> +static ssize_t preempt_timeout_max_show(struct kobject *kobj,
> +					struct kobj_attribute *attr, char *buf)
> +{
> +	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
> +
> +	return sprintf(buf, "%u\n", hwe->sched_props.preempt_timeout_max);
> +}
> +
> +static struct kobj_attribute preempt_timeout_max_attr =
> +	__ATTR(preempt_timeout_max, 0644, preempt_timeout_max_show,
> +	       preempt_timeout_max_store);
> +
> +static ssize_t preempt_timeout_min_store(struct kobject *kobj,
> +					 struct kobj_attribute *attr,
> +					 const char *buf, size_t count)
> +{
> +	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
> +	u32 timeout;
> +	int err;
> +
> +	err = kstrtou32(buf, 0, &timeout);
> +	if (err)
> +		return err;
> +
> +	if (!capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(timeout,
> +				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
> +				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
> +		return -EINVAL;
> +
> +#ifdef CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
> +	if (CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT &&
> +	    capable(CAP_SYS_NICE) &&
> +	    !engine_timeout_in_range(timeout,
> +				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
> +				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
> +		return -EINVAL;
> +#endif
> +
> +	WRITE_ONCE(hwe->sched_props.preempt_timeout_min, timeout);
> +
> +	return count;
> +}
> +
> +static ssize_t preempt_timeout_min_show(struct kobject *kobj,
> +					struct kobj_attribute *attr, char *buf)
> +{
> +	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
> +
> +	return sprintf(buf, "%u\n", hwe->sched_props.preempt_timeout_min);
> +}
> +
> +static struct kobj_attribute preempt_timeout_min_attr =
> +	__ATTR(preempt_timeout_min, 0644, preempt_timeout_min_show,
> +	       preempt_timeout_min_store);
> +
>  static const struct attribute *defaults[] = {
>  	&job_timeout_def.attr,
> +	&job_timeout_min_def.attr,
> +	&job_timeout_max_def.attr,
>  	&timeslice_duration_def.attr,
> +	&timeslice_duration_min_def.attr,
> +	&timeslice_duration_max_def.attr,
>  	&preempt_timeout_def.attr,
> +	&preempt_timeout_min_def.attr,
> +	&preempt_timeout_max_def.attr,
>  	NULL
>  };
>  
>  static const struct attribute *files[] = {
>  	&job_timeout_attr.attr,
> +	&job_timeout_min_attr.attr,
> +	&job_timeout_max_attr.attr,
>  	&timeslice_duration_attr.attr,
> +	&timeslice_duration_min_attr.attr,
> +	&timeslice_duration_max_attr.attr,
>  	&preempt_timeout_attr.attr,
> +	&preempt_timeout_min_attr.attr,
> +	&preempt_timeout_max_attr.attr,
>  	NULL
>  };
>  
> diff --git a/drivers/gpu/drm/xe/xe_engine_class_sysfs.h b/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
> index 492a84a22c30..7b4ae8b726a3 100644
> --- a/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
> +++ b/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
> @@ -10,6 +10,7 @@
>  
>  #define MAX_ENGINE_CLASS_NAME_LEN    16
>  int xe_engine_class_sysfs_init(struct xe_gt *gt);
> +bool engine_timeout_in_range(u64 timeout, u64 min, u64 max);
>  
>  /**
>   * struct kobj_hwe - A hwe's kobject struct that connects the kobject and the
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 0a254a59735d..2951fa999520 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -363,8 +363,14 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  	hwe->engine_id = id;
>  	/* FIXME: Wire up to configurable default value */
>  	hwe->sched_props.job_timeout_ms = HZ * 5;
> +	hwe->sched_props.job_timeout_min = XE_HW_ENGINE_JOB_TIMEOUT_MIN;
> +	hwe->sched_props.job_timeout_max = XE_HW_ENGINE_JOB_TIMEOUT_MAX;
>  	hwe->sched_props.timeslice_us = 1 * 1000;
> +	hwe->sched_props.timeslice_min = XE_HW_ENGINE_TIMESLICE_MIN;
> +	hwe->sched_props.timeslice_max = XE_HW_ENGINE_TIMESLICE_MAX;
>  	hwe->sched_props.preempt_timeout_us = 640 * 1000;
> +	hwe->sched_props.preempt_timeout_min = XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
> +	hwe->sched_props.preempt_timeout_max = XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
>  	hwe->defaults = hwe->sched_props; /* Record default props */
>  
>  	xe_reg_sr_init(&hwe->reg_sr, hwe->name, gt_to_xe(gt));
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
> index 7eca9d53c7b1..3d37d6d44261 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> @@ -10,6 +10,37 @@
>  
>  struct drm_printer;
>  
> +#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN
> +#define XE_HW_ENGINE_JOB_TIMEOUT_MIN CONFIG_DRM_XE_JOB_TIMEOUT_MIN
> +#else
> +#define XE_HW_ENGINE_JOB_TIMEOUT_MIN 1
> +#endif
> +#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MAX
> +#define XE_HW_ENGINE_JOB_TIMEOUT_MAX CONFIG_DRM_XE_JOB_TIMEOUT_MAX
> +#else
> +#define XE_HW_ENGINE_JOB_TIMEOUT_MAX (10 * 1000)
> +#endif
> +#ifdef CONFIG_DRM_XE_TIMESLICE_MIN
> +#define XE_HW_ENGINE_TIMESLICE_MIN CONFIG_DRM_XE_TIMESLICE_MIN
> +#else
> +#define XE_HW_ENGINE_TIMESLICE_MIN 1
> +#endif
> +#ifdef CONFIG_DRM_XE_TIMESLICE_MAX
> +#define XE_HW_ENGINE_TIMESLICE_MAX CONFIG_DRM_XE_TIMESLICE_MAX
> +#else
> +#define XE_HW_ENGINE_TIMESLICE_MAX (10 * 1000 * 1000)
> +#endif
> +#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
> +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
> +#else
> +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 1
> +#endif
> +#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
> +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
> +#else
> +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX (10 * 1000 * 1000)
> +#endif
> +
>  int xe_hw_engines_init_early(struct xe_gt *gt);
>  int xe_hw_engines_init(struct xe_gt *gt);
>  void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index 167a13fac3c5..f3bd9a5a468f 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -114,10 +114,22 @@ struct xe_hw_engine {
>  	struct {
>  		/** @set_job_timeout: Set job timeout in ms for engine */
>  		u32 job_timeout_ms;
> +		/** @job_timeout_min: Min job timeout in ms for engine */
> +		u32 job_timeout_min;
> +		/** @job_timeout_max: Max job timeout in ms for engine */
> +		u32 job_timeout_max;
>  		/** @timeslice_us: timeslice period in micro-seconds */
>  		u32 timeslice_us;
> +		/** @timeslice_min: min timeslice period in micro-seconds */
> +		u32 timeslice_min;
> +		/** @timeslice_max: max timeslice period in micro-seconds */
> +		u32 timeslice_max;
>  		/** @preempt_timeout_us: preemption timeout in micro-seconds */
>  		u32 preempt_timeout_us;
> +		/** @preempt_timeout_min: min preemption timeout in micro-seconds */
> +		u32 preempt_timeout_min;
> +		/** @preempt_timeout_max: max preemption timeout in micro-seconds */
> +		u32 preempt_timeout_max;
>  	} sched_props, defaults;
>  };
>  
> -- 
> 2.25.1
> 
