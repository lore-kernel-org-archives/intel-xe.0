Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB354C001B0
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 14:19:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75E9C10E480;
	Wed, 26 Jul 2023 14:19:13 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 133C310E480
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 14:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690381151; x=1721917151;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=N8oJx1QhCQZVOpwIuIp7kaasZMT6l3xYhuBBCqy/SEU=;
 b=EwlIK7xZugPkonF/PplyZ1fanLen89sqlk3QBOUVBQdjzPfz9pUUUO+f
 BdCJ4OwP+EeCsWyGRKwUkO4H0DPHEs6hrkoCzK6vCAUF299sVFLiiSail
 5BXQAqPyiqcFqU0xKZCd8o+nGCKl6k4YR0Dzycfpon7DnxdBBahe6oDW3
 pJOHvZ+g7knAwBr+X37VwQmir8Aemscz2JUWrWFCL5VwhuUPyNRxROiOT
 2Kj8v19IlbVnT0sAIC6I6ZMmtRbcAfdEthVYpoFilgb1K9cqugpVq80WU
 HsJ3DfQ+AYZRf3dLhXVMQL2+ws+T719ciP/+LLMHMpRqSIrQXVI8XbnDA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="371639163"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="371639163"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 07:19:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="1057240589"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="1057240589"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 26 Jul 2023 07:19:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 07:19:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 07:19:09 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 07:19:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ORibnQvVSs6CJ2dHEeViBV4feMsWaIsXrstA+zczNnzH9Wl7J9rQV1/uFHNEg1R8D+saU0KfMkmEV6NOXcF5b7c76q0+sW33DPdk0boltp/y1IfEgG/todwm6FtZeGKQ4MZz6uX7O3v4P7tcjCi9TKSSC2EfdbbKMki2PWARA31QGKoLUWw07J6WoOzvSPS21nnSw++Q5cm6NWzDavZaNBRAaxioJBBL1y/IrCj5lWlU9k3PDsEhtSQUSt3uZyLpWet7JzHMOQWoP7COdIneakhnA8rL9zD4OXYJfegGtj4Hnj/WDNdtOR1dGlaXcrn9M88WkwRts4wGmyvvbaccDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qX4vjwJlR6txr0J9KAqwEhJzWKsW3bmOSD/dHhcaq74=;
 b=TMae2yyRPwgfST56uQ/av+nrgP5vt/dEkMgvF0LAw9MKgZO21lEFTVD95xUhgZYOvw59NWGyslJAcHS8cJ1uOV/jJkqcw5AK5atK8k/kvM3VI/SsKTC4hrtVZuBojSyxmodLy5XzmN+q/zKDZBKZ71abIc7DqQ4xv50TMJwAXNyGzSXPjcAF5HSuRhHBTGwmksk7SxwOPXRKpj7+MCWMC0NVpOiI67el9623gMgBraKbDPZwB9mCLEmsWk4zILI0ntAQJaZtrSel2d5APOBD6W0wA+8QL1f+kReJHcY9JaFVOP+3tdaM/JjCyQh3wNJFjkwLzsJUGQ/vVG6ecEpZPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB5153.namprd11.prod.outlook.com (2603:10b6:303:95::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 14:19:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0%3]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 14:19:05 +0000
Date: Wed, 26 Jul 2023 14:17:57 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <ZMErFd6Kquei++tq@DUT025-TGLU.fm.intel.com>
References: <20230726132550.846300-1-tejas.upadhyay@intel.com>
 <20230726132550.846300-7-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230726132550.846300-7-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BY3PR05CA0042.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB5153:EE_
X-MS-Office365-Filtering-Correlation-Id: c0475c3a-af81-4fa5-2b14-08db8de344f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dKUCOfgC830cYsE0gy8CvnmSa1L9P9vQv11IBjytbOObO0v3Ex343VInqDlHHFCGhfqq23bK8PLJ8H5snltmQ+EHEXt4q4+yhaRpAvgpcJYuy/KWLGKfQzLje7or6YQ3+PWkgTeAoRMJ3BBQRnGGnvricuYj969a7bCAidN+mYpkpu47YbSMQzZhxUEiG2B6XivSv6FntWQoXCFjE3cC9qIKc1PUwzPc3Wp6Wm006/jxPDVLL8ByCMSMtXXSVEIBGCh0uYtPq0prnCiW6kVLiHSSqjC6vljR5zEZr80wyXJxzRRqGncCPRjle4hcQbCbCH7yekZ7AXLldLSqIOPWMxlZmWHUMhRA+DYxCUG0CshPDz9q+ZF8ZbQa+2p4iA/ebS/zkmL+q6gFgQ4tDKo+AaHaLPxdr0MpVoOtk6tVzqEQ+B47UnQnJVllYoL7dKDMea0yP3XuzT6PgANjAHsxgzs5WLJgdrQ+pvN14xpVChkj3Q2YI97MRFSHZ6+jECS7dSVhQZQLz1KJQMc3X+NOAqDUBBbkL426Onldw62UC1bpX58VLFd4z0z+AlR0zBre
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(366004)(346002)(396003)(39860400002)(451199021)(316002)(6506007)(26005)(8936002)(6862004)(8676002)(41300700001)(107886003)(19627235002)(82960400001)(478600001)(66556008)(66946007)(6636002)(6512007)(66476007)(4326008)(6666004)(6486002)(38100700002)(30864003)(2906002)(83380400001)(86362001)(44832011)(186003)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uFofu3jbiEZUcVvN41FV14wKBZ08yG5JvMBDDUFnLe0s1ASocacuDEViLIOL?=
 =?us-ascii?Q?RYOCUc+oLulV26hT28HxJUY2AQGyrS0rf7OMFA4+HHA9mfm+FaPxoHxwnYnf?=
 =?us-ascii?Q?alnWyXI6/UsNuxzOQ8fUOlefw7U36nkmNxWNYvyaJFJShAMrMnFyaxZRtfQe?=
 =?us-ascii?Q?NptxPC1NAfMBKqpwwgiS0V8k1Y1LJUgK4m7Xk90po4z4e7ycW5y8Iyeo4MX2?=
 =?us-ascii?Q?JjBfXUB9q6hy8bTQnRhgvpbPL+E5mW7cHwWHELR116yE+tkuqveAcSSFa8Ry?=
 =?us-ascii?Q?kzCo/5M4ywayITgZgn8G/mgThCQ+KA9oHEAbbMQm4YmR2lvq3JDCQ/tbVSnZ?=
 =?us-ascii?Q?RrMtv4bikuT/z1e9Pz1t0piklMA/gwMu/0fooj1mr5HIw1mrbNgD4EtA1zlT?=
 =?us-ascii?Q?QM1y17Yz4S6UmNCm/c5LTbnJEdllbEYzXLqkCRFepm4b4aDLHCoR6krr/e5A?=
 =?us-ascii?Q?3TgUQ3ro56ihOwoPdqdhFlEUDMHQG5oFpzKXoDMlEs1vy/Kkot7YYUnfzv6U?=
 =?us-ascii?Q?aWAUVEW5pikzflYX7Q1xQGJ3CHWDL5bYrlJXkvXmMSv4q7fvIJOcMKHE/Jk+?=
 =?us-ascii?Q?3pnL1534T14F0FltT6PDL/Vyt9rl2AKVsohcOOY19JRtIVH6/fTMR93X1dth?=
 =?us-ascii?Q?6gGNxiul2JUT5BixmZ3rK7fhlDVYuNQHiP3fBnuEG4eYmibpfEDTigIKBmtX?=
 =?us-ascii?Q?xVVAu+CXgWxRHXnUbSudXIAaC29jYlxAzdG7QuQVQpER0Hjndrz1DP9bLivk?=
 =?us-ascii?Q?zoPv+hyYEHJt9/0uRzB0Rr5pLuOi15E47hkpmyNtTbemfOtes2P6ikBdHig8?=
 =?us-ascii?Q?AQCCMADPAX36vNe8cjz9Ytt2GtENuu9lpwnftjg94779LQoSQ08zHDEldtKU?=
 =?us-ascii?Q?z6va1l4loI6D4iU+LL1ukklAQ92URjFl1TP/q5Jr60OoXl+SDmVYsoMjpbwB?=
 =?us-ascii?Q?EDEdBXXZRTuSeGsomQmJzUFqMV+kMxWZh2dWPFET0MLO/xKgjd/mvfxZetTp?=
 =?us-ascii?Q?zZPixrNiL/kP3fGILKuvukSnRcoAAy61mF70DvvfIGEr2QuiwURjdHNK7iKu?=
 =?us-ascii?Q?n/FiiXikZ8qwyH8XbYcasefNmxB5LK7U/sG7TPWHVTPVACFJMdz7x8qLL3R0?=
 =?us-ascii?Q?OW8foK3hBkqFLLkqdJSNSQh7RxMg/hleXWKE42EkMoXY/gnohhgrMGu1dPl0?=
 =?us-ascii?Q?bkphqWJp6P8IXqwlR3+7VCbgz23Q/rFrZIaH1eqAdGUN52bispkUmQi87C5m?=
 =?us-ascii?Q?pyFaZod7uC0JCcNIdcdAApFcBhZuosVmGBORWLkeHzld+3F8w7xeUaEk5SAB?=
 =?us-ascii?Q?5hDmZ7j7Jm4igPI3PnuE1N71xtf/RJN/ip/5bKilFTOQPdTYzs7iKHpK71B/?=
 =?us-ascii?Q?iGcgAIesDwsesw+jce6oBcuy/3IlVLUfsnJHZttxnxyjRwLWcBihHnIx/HIn?=
 =?us-ascii?Q?jC1sNks6G68McH28MGXrmxQJqV9rqRk/E1l7Zz8WiUEECO/s965NYWBIJ5fi?=
 =?us-ascii?Q?7va05eiHDlDNhQSw/g+T6Ow8JdyeOp400j2EYJzo7WP7tF/n4t5TRTai5Mxy?=
 =?us-ascii?Q?iN4j1N8Bt5Z0hs/XxW+EVvXwc/iTz6L/gbvKIK37h576U3E0uL0hCkuqTy47?=
 =?us-ascii?Q?Ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0475c3a-af81-4fa5-2b14-08db8de344f4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 14:19:05.8665 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s+n0csGThw6Gza7a0TJIuaWlmrH4O/Mc6UG7Q5KQcU2ORwxZ2/pFsdGmhXYinhfyN568Azmvp5iOqO0SJjndtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5153
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V8 6/6] drm/xe: Add min/max cap for engine
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

On Wed, Jul 26, 2023 at 06:55:50PM +0530, Tejas Upadhyay wrote:
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
> V8 :
>    - fix enforce_sched_limit and avoid code duplication - Niranjana
>    - Make sure min < max - Niranjana
> V7 :
>    - Rebase to replace hw engine with eclass interface
>    - return EINVAL in place of EPERM
>    - Use some APIs to avoid code duplication
> V6 :
>    - Rebase changes to reflect per engine class props interface - MattB
>    - Use #if ENABLED - MattB
>    - Remove MAX_SCHED_TIMEOUT check as range validation is enough
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
>  drivers/gpu/drm/xe/Kconfig                 |   6 +
>  drivers/gpu/drm/xe/Kconfig.profile         |  46 +++
>  drivers/gpu/drm/xe/xe_engine.c             |  40 ++-
>  drivers/gpu/drm/xe/xe_engine_class_sysfs.c | 354 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_engine_class_sysfs.h |   2 +
>  drivers/gpu/drm/xe/xe_hw_engine.c          |   8 +
>  drivers/gpu/drm/xe/xe_hw_engine.h          |  31 ++
>  7 files changed, 481 insertions(+), 6 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/Kconfig.profile
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index d44794f99338..0a4ea965645b 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -83,3 +83,9 @@ depends on DRM_XE
>  depends on EXPERT
>  source "drivers/gpu/drm/xe/Kconfig.debug"
>  endmenu
> +
> +menu "drm/xe Profile Guided Optimisation"
> +	visible if EXPERT
> +	depends on DRM_XE
> +	source "drivers/gpu/drm/xe/Kconfig.profile"
> +endmenu
> diff --git a/drivers/gpu/drm/xe/Kconfig.profile b/drivers/gpu/drm/xe/Kconfig.profile
> new file mode 100644
> index 000000000000..e72f15ec4bf6
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/Kconfig.profile
> @@ -0,0 +1,46 @@
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
> +	 Configures the enablement of limitation on scheduler timeout
> +	 to apply to applicable user. For elevated user, all above MIN
> +	 and MAX values will apply when this configuration is enable to
> +	 apply limitation. By default limitation is applied.
> diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
> index 9e167b113963..a558918f9a64 100644
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
> @@ -191,8 +192,17 @@ static int engine_set_priority(struct xe_device *xe, struct xe_engine *e,
>  static int engine_set_timeslice(struct xe_device *xe, struct xe_engine *e,
>  				u64 value, bool create)
>  {
> -	if (!capable(CAP_SYS_NICE))
> -		return -EPERM;
> +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> +	u32 min = XE_HW_ENGINE_TIMESLICE_MIN;
> +	u32 max = XE_HW_ENGINE_TIMESLICE_MAX;
> +#else
> +	u32 min = e->hwe->eclass->sched_props.timeslice_min;
> +	u32 max = e->hwe->eclass->sched_props.timeslice_max;
> +#endif

The min / max here should just be e->hwe->eclass->sched_props, right? We
enforce that the user cannot change these values via sysfs to an illegal
value.

Matt

> +
> +	if (enforce_schedule_limit() &&
> +	    !engine_timeout_in_range(value, min, max))
> +		return -EINVAL;
>  
>  	return e->ops->set_timeslice(e, value);
>  }
> @@ -201,8 +211,17 @@ static int engine_set_preemption_timeout(struct xe_device *xe,
>  					 struct xe_engine *e, u64 value,
>  					 bool create)
>  {
> -	if (!capable(CAP_SYS_NICE))
> -		return -EPERM;
> +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> +	u32 min = XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
> +	u32 max = XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
> +#else
> +	u32 min = e->hwe->eclass->sched_props.preempt_timeout_min;
> +	u32 max = e->hwe->eclass->sched_props.preempt_timeout_max;
> +#endif
> +
> +	if (enforce_schedule_limit() &&
> +	    !engine_timeout_in_range(value, min, max))
> +		return -EINVAL;
>  
>  	return e->ops->set_preempt_timeout(e, value);
>  }
> @@ -266,11 +285,20 @@ static int engine_set_persistence(struct xe_device *xe, struct xe_engine *e,
>  static int engine_set_job_timeout(struct xe_device *xe, struct xe_engine *e,
>  				  u64 value, bool create)
>  {
> +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> +	u32 min = XE_HW_ENGINE_JOB_TIMEOUT_MIN;
> +	u32 max = XE_HW_ENGINE_JOB_TIMEOUT_MAX;
> +#else
> +	u32 min = e->hwe->eclass->sched_props.job_timeout_min;
> +	u32 max = e->hwe->eclass->sched_props.job_timeout_max;
> +#endif
> +
>  	if (XE_IOCTL_DBG(xe, !create))
>  		return -EINVAL;
>  
> -	if (!capable(CAP_SYS_NICE))
> -		return -EPERM;
> +	if (enforce_schedule_limit() &&
> +	    !engine_timeout_in_range(value, min, max))
> +		return -EINVAL;
>  
>  	return e->ops->set_job_timeout(e, value);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
> index 569d5f89310e..4a749e91de5d 100644
> --- a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
> @@ -11,6 +11,20 @@
>  
>  static int xe_add_engine_class_defaults(struct kobject *parent);
>  
> +bool enforce_schedule_limit(void)
> +{
> +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> +	return true;
> +#else
> +	return !capable(CAP_SYS_NICE);
> +#endif
> +}
> +
> +bool engine_timeout_in_range(u64 timeout, u64 min, u64 max)
> +{
> +	return timeout >= min && timeout <= max;
> +}
> +
>  static void kobj_xe_engine_release(struct kobject *kobj)
>  {
>  	kfree(kobj);
> @@ -39,11 +53,92 @@ kobj_xe_engine(struct kobject *parent, char *name)
>  	return keclass;
>  }
>  
> +static ssize_t job_timeout_max_store(struct kobject *kobj,
> +				     struct kobj_attribute *attr,
> +				     const char *buf, size_t count)
> +{
> +	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
> +	u32 timeout;
> +	int err;
> +
> +	err = kstrtou32(buf, 0, &timeout);
> +	if (err)
> +		return err;
> +
> +	if (timeout < eclass->sched_props.job_timeout_min)
> +		return -EINVAL;
> +
> +	if (enforce_schedule_limit() &&
> +	    !engine_timeout_in_range(timeout,
> +				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
> +				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
> +		return -EINVAL;
> +
> +	WRITE_ONCE(eclass->sched_props.job_timeout_max, timeout);
> +
> +	return count;
> +}
> +
> +static ssize_t job_timeout_max_show(struct kobject *kobj,
> +				    struct kobj_attribute *attr, char *buf)
> +{
> +	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
> +
> +	return sprintf(buf, "%u\n", eclass->sched_props.job_timeout_max);
> +}
> +
> +static struct kobj_attribute job_timeout_max_attr =
> +__ATTR(job_timeout_max, 0644, job_timeout_max_show, job_timeout_max_store);
> +
> +static ssize_t job_timeout_min_store(struct kobject *kobj,
> +				     struct kobj_attribute *attr,
> +				     const char *buf, size_t count)
> +{
> +	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
> +	u32 timeout;
> +	int err;
> +
> +	err = kstrtou32(buf, 0, &timeout);
> +	if (err)
> +		return err;
> +
> +	if (timeout > eclass->sched_props.job_timeout_max)
> +		return -EINVAL;
> +
> +	if (enforce_schedule_limit() &&
> +	    !engine_timeout_in_range(timeout,
> +				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
> +				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
> +		return -EINVAL;
> +
> +	WRITE_ONCE(eclass->sched_props.job_timeout_min, timeout);
> +
> +	return count;
> +}
> +
> +static ssize_t job_timeout_min_show(struct kobject *kobj,
> +				    struct kobj_attribute *attr, char *buf)
> +{
> +	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
> +
> +	return sprintf(buf, "%u\n", eclass->sched_props.job_timeout_min);
> +}
> +
> +static struct kobj_attribute job_timeout_min_attr =
> +__ATTR(job_timeout_min, 0644, job_timeout_min_show, job_timeout_min_store);
> +
>  static ssize_t job_timeout_store(struct kobject *kobj,
>  				 struct kobj_attribute *attr,
>  				 const char *buf, size_t count)
>  {
>  	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
> +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> +	u32 min = XE_HW_ENGINE_JOB_TIMEOUT_MIN;
> +	u32 max = XE_HW_ENGINE_JOB_TIMEOUT_MAX;
> +#else
> +	u32 min = e->hwe->eclass->sched_props.job_timeout_min;
> +	u32 max = e->hwe->eclass->sched_props.job_timeout_max;
> +#endif
>  	u32 timeout;
>  	int err;
>  
> @@ -51,6 +146,10 @@ static ssize_t job_timeout_store(struct kobject *kobj,
>  	if (err)
>  		return err;
>  
> +	if (enforce_schedule_limit() &&
> +	    !engine_timeout_in_range(timeout, min, max))
> +		return -EINVAL;
> +
>  	WRITE_ONCE(eclass->sched_props.job_timeout_ms, timeout);
>  
>  	return count;
> @@ -78,11 +177,40 @@ static ssize_t job_timeout_default(struct kobject *kobj,
>  static struct kobj_attribute job_timeout_def =
>  __ATTR(job_timeout_ms, 0444, job_timeout_default, NULL);
>  
> +static ssize_t job_timeout_min_default(struct kobject *kobj,
> +				       struct kobj_attribute *attr, char *buf)
> +{
> +	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
> +
> +	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_min);
> +}
> +
> +static struct kobj_attribute job_timeout_min_def =
> +__ATTR(job_timeout_min, 0444, job_timeout_min_default, NULL);
> +
> +static ssize_t job_timeout_max_default(struct kobject *kobj,
> +				       struct kobj_attribute *attr, char *buf)
> +{
> +	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
> +
> +	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_max);
> +}
> +
> +static struct kobj_attribute job_timeout_max_def =
> +__ATTR(job_timeout_max, 0444, job_timeout_max_default, NULL);
> +
>  static ssize_t timeslice_duration_store(struct kobject *kobj,
>  					struct kobj_attribute *attr,
>  					const char *buf, size_t count)
>  {
>  	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
> +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> +	u32 min = XE_HW_ENGINE_TIMESLICE_MIN;
> +	u32 max = XE_HW_ENGINE_TIMESLICE_MAX;
> +#else
> +	u32 min = e->hwe->eclass->sched_props.timeslice_min;
> +	u32 max = e->hwe->eclass->sched_props.timeslice_max;
> +#endif
>  	u32 duration;
>  	int err;
>  
> @@ -90,11 +218,92 @@ static ssize_t timeslice_duration_store(struct kobject *kobj,
>  	if (err)
>  		return err;
>  
> +	if (enforce_schedule_limit() &&
> +	    !engine_timeout_in_range(duration, min, max))
> +		return -EINVAL;
> +
>  	WRITE_ONCE(eclass->sched_props.timeslice_us, duration);
>  
>  	return count;
>  }
>  
> +static ssize_t timeslice_duration_max_store(struct kobject *kobj,
> +					    struct kobj_attribute *attr,
> +					    const char *buf, size_t count)
> +{
> +	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
> +	u32 duration;
> +	int err;
> +
> +	err = kstrtou32(buf, 0, &duration);
> +	if (err)
> +		return err;
> +
> +	if (duration < eclass->sched_props.timeslice_min)
> +		return -EINVAL;
> +
> +	if (enforce_schedule_limit() &&
> +	    !engine_timeout_in_range(duration,
> +				     XE_HW_ENGINE_TIMESLICE_MIN,
> +				     XE_HW_ENGINE_TIMESLICE_MAX))
> +		return -EINVAL;
> +
> +	WRITE_ONCE(eclass->sched_props.timeslice_max, duration);
> +
> +	return count;
> +}
> +
> +static ssize_t timeslice_duration_max_show(struct kobject *kobj,
> +		struct kobj_attribute *attr,
> +		char *buf)
> +{
> +	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
> +
> +	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_max);
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
> +	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
> +	u32 duration;
> +	int err;
> +
> +	err = kstrtou32(buf, 0, &duration);
> +	if (err)
> +		return err;
> +
> +	if (duration > eclass->sched_props.timeslice_max)
> +		return -EINVAL;
> +
> +	if (enforce_schedule_limit() &&
> +	    !engine_timeout_in_range(duration,
> +				     XE_HW_ENGINE_TIMESLICE_MIN,
> +				     XE_HW_ENGINE_TIMESLICE_MAX))
> +		return -EINVAL;
> +
> +	WRITE_ONCE(eclass->sched_props.timeslice_min, duration);
> +
> +	return count;
> +}
> +
> +static ssize_t timeslice_duration_min_show(struct kobject *kobj,
> +					   struct kobj_attribute *attr, char *buf)
> +{
> +	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
> +
> +	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_min);
> +}
> +
> +static struct kobj_attribute timeslice_duration_min_attr =
> +	__ATTR(timeslice_duration_min, 0644, timeslice_duration_min_show,
> +	       timeslice_duration_min_store);
> +
>  static ssize_t timeslice_duration_show(struct kobject *kobj,
>  		struct kobj_attribute *attr, char *buf)
>  {
> @@ -118,11 +327,40 @@ static ssize_t timeslice_default(struct kobject *kobj,
>  static struct kobj_attribute timeslice_duration_def =
>  __ATTR(timeslice_duration_us, 0444, timeslice_default, NULL);
>  
> +static ssize_t timeslice_min_default(struct kobject *kobj,
> +				     struct kobj_attribute *attr, char *buf)
> +{
> +	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
> +
> +	return sprintf(buf, "%u\n", eclass->defaults.timeslice_min);
> +}
> +
> +static struct kobj_attribute timeslice_duration_min_def =
> +__ATTR(timeslice_duration_min, 0444, timeslice_min_default, NULL);
> +
> +static ssize_t timeslice_max_default(struct kobject *kobj,
> +				     struct kobj_attribute *attr, char *buf)
> +{
> +	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
> +
> +	return sprintf(buf, "%u\n", eclass->defaults.timeslice_max);
> +}
> +
> +static struct kobj_attribute timeslice_duration_max_def =
> +__ATTR(timeslice_duration_max, 0444, timeslice_max_default, NULL);
> +
>  static ssize_t preempt_timeout_store(struct kobject *kobj,
>  				     struct kobj_attribute *attr,
>  				     const char *buf, size_t count)
>  {
>  	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
> +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> +	u32 min = XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
> +	u32 max = XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
> +#else
> +	u32 min = e->hwe->eclass->sched_props.preempt_timeout_min;
> +	u32 max = e->hwe->eclass->sched_props.preempt_timeout_max;
> +#endif
>  	u32 timeout;
>  	int err;
>  
> @@ -130,6 +368,10 @@ static ssize_t preempt_timeout_store(struct kobject *kobj,
>  	if (err)
>  		return err;
>  
> +	if (enforce_schedule_limit() &&
> +	    !engine_timeout_in_range(timeout, min, max))
> +		return -EINVAL;
> +
>  	WRITE_ONCE(eclass->sched_props.preempt_timeout_us, timeout);
>  
>  	return count;
> @@ -158,17 +400,129 @@ static ssize_t preempt_timeout_default(struct kobject *kobj,
>  static struct kobj_attribute preempt_timeout_def =
>  __ATTR(preempt_timeout_us, 0444, preempt_timeout_default, NULL);
>  
> +static ssize_t preempt_timeout_min_default(struct kobject *kobj,
> +					   struct kobj_attribute *attr,
> +					   char *buf)
> +{
> +	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
> +
> +	return sprintf(buf, "%u\n", eclass->defaults.preempt_timeout_min);
> +}
> +
> +static struct kobj_attribute preempt_timeout_min_def =
> +__ATTR(preempt_timeout_min, 0444, preempt_timeout_min_default, NULL);
> +
> +static ssize_t preempt_timeout_max_default(struct kobject *kobj,
> +					   struct kobj_attribute *attr,
> +					   char *buf)
> +{
> +	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
> +
> +	return sprintf(buf, "%u\n", eclass->defaults.preempt_timeout_max);
> +}
> +
> +static struct kobj_attribute preempt_timeout_max_def =
> +__ATTR(preempt_timeout_max, 0444, preempt_timeout_max_default, NULL);
> +
> +static ssize_t preempt_timeout_max_store(struct kobject *kobj,
> +					 struct kobj_attribute *attr,
> +					 const char *buf, size_t count)
> +{
> +	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
> +	u32 timeout;
> +	int err;
> +
> +	err = kstrtou32(buf, 0, &timeout);
> +	if (err)
> +		return err;
> +
> +	if (timeout < eclass->sched_props.preempt_timeout_min)
> +		return -EINVAL;
> +
> +	if (enforce_schedule_limit() &&
> +	    !engine_timeout_in_range(timeout,
> +				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
> +				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
> +		return -EINVAL;
> +
> +	WRITE_ONCE(eclass->sched_props.preempt_timeout_max, timeout);
> +
> +	return count;
> +}
> +
> +static ssize_t preempt_timeout_max_show(struct kobject *kobj,
> +					struct kobj_attribute *attr, char *buf)
> +{
> +	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
> +
> +	return sprintf(buf, "%u\n", eclass->sched_props.preempt_timeout_max);
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
> +	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
> +	u32 timeout;
> +	int err;
> +
> +	err = kstrtou32(buf, 0, &timeout);
> +	if (err)
> +		return err;
> +
> +	if (timeout > eclass->sched_props.preempt_timeout_max)
> +		return -EINVAL;
> +
> +	if (enforce_schedule_limit() &&
> +	    !engine_timeout_in_range(timeout,
> +				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
> +				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
> +		return -EINVAL;
> +
> +	WRITE_ONCE(eclass->sched_props.preempt_timeout_min, timeout);
> +
> +	return count;
> +}
> +
> +static ssize_t preempt_timeout_min_show(struct kobject *kobj,
> +					struct kobj_attribute *attr, char *buf)
> +{
> +	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
> +
> +	return sprintf(buf, "%u\n", eclass->sched_props.preempt_timeout_min);
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
> index 683726563059..33c458606117 100644
> --- a/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
> +++ b/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
> @@ -10,6 +10,8 @@
>  
>  #define MAX_ENGINE_CLASS_NAME_LEN    16
>  int xe_engine_class_sysfs_init(struct xe_gt *gt);
> +bool enforce_schedule_limit(void);
> +bool engine_timeout_in_range(u64 timeout, u64 min, u64 max);
>  
>  /**
>   * struct kobj_eclass - A eclass's kobject struct that connects the kobject and the
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 96c32a815c90..06a98ea9800b 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -364,8 +364,16 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  
>  	if (!gt->eclass[hwe->class].init_done) {
>  		gt->eclass[hwe->class].sched_props.job_timeout_ms = HZ * 5;
> +		gt->eclass[hwe->class].sched_props.job_timeout_min = XE_HW_ENGINE_JOB_TIMEOUT_MIN;
> +		gt->eclass[hwe->class].sched_props.job_timeout_max = XE_HW_ENGINE_JOB_TIMEOUT_MAX;
>  		gt->eclass[hwe->class].sched_props.timeslice_us = 1 * 1000;
> +		gt->eclass[hwe->class].sched_props.timeslice_min = XE_HW_ENGINE_TIMESLICE_MIN;
> +		gt->eclass[hwe->class].sched_props.timeslice_max = XE_HW_ENGINE_TIMESLICE_MAX;
>  		gt->eclass[hwe->class].sched_props.preempt_timeout_us = 640 * 1000;
> +		gt->eclass[hwe->class].sched_props.preempt_timeout_min =
> +								XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
> +		gt->eclass[hwe->class].sched_props.preempt_timeout_max =
> +								XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
>  		/* Record default props */
>  		gt->eclass[hwe->class].defaults = gt->eclass[hwe->class].sched_props;
>  		gt->eclass[hwe->class].init_done = true;
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
> -- 
> 2.25.1
> 
