Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1AEDC001DC
	for <intel-xe@archiver.kernel.org>; Mon, 31 Jul 2023 14:00:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97FE010E199;
	Mon, 31 Jul 2023 14:00:18 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9890C10E199
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Jul 2023 14:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690812015; x=1722348015;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Z6Yhayv+EJfg371RUg+TvygPaX0bzz2bF+1atAl8aAI=;
 b=lt2V4/yDB5+WV+JYTAA9UUifbDb3+ZKd0vjUMjPybrc+9w++Ld+MMBeL
 nfVTQmvkR0a1eJl19j5YFWB//u7lhrE/ysubO08+OdHczv2V7LYA9os8C
 NCiLOOTZldVS2FM7YKr4Mkmeds5j+8LVCyP5ODaBKUsqHL2ZLnd4IUUf9
 mYgrmJt0lJi6W1+IgCre5WD/hq+sur1SpMcLij194lW8/rSu4e5DX1vsW
 ETHlAGtfr4EfkE06Vc0jzh633oTROpxqrzlztjwBubN+XQGLrcD1Pm91h
 XWqpBIVaQy6ODJ/z5Mb7F/Ej+k1NKbuorlh81mDpQnu9WH2A4hAN2Y9Ce g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="435334145"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="435334145"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 07:00:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="902149138"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="902149138"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 31 Jul 2023 07:00:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 07:00:14 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 31 Jul 2023 07:00:14 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 31 Jul 2023 07:00:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U8oEgvEujhfdU0NcXiR9eDZqtrV2mLojQD+SPrgXiqZ+FEiQHE4iPSFTRqTl3gBKq3zWbIp3t4/HqXPZumxc9d2TX2LvADmO0IFjKi8XAihVif791nTO7xlhwrNJf0Ff5FxDhzc5ttoNjXMLZPpPCfKXyyw3dcXzhZL+JtqJ+rBxXHxZS+Gf7gQRUdTDvKmKicG4WaSYW6MglHxgSKM0u+2mlRyecD8PS78kU5Y5jQhm0SMoyLpmlL0FYDGQIqGQO7Iqb7rrRAssfLbFX3OJ+eZ6hmFzh62ADQFfXywjYY8gbt30BSNrfj5BuC3BsNIrK2nBa8t7E9SMXNFONMHx3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQF/9gex9pNAHiKKx391+6TV0r/274AXAqh7zd7eMiA=;
 b=WPFJXnEsKHX//8+gtlR+P8zrkzJDnY2h/ADjLEma2Jgkn4Inx4budY3cQEqkGdwbVnaE7HYI3O3QLyfnRiV+3Rq6jOQ4/+WKQvLV0PAC7OQx8CMlumlufuDBaRetwas8LyRtAz90fg2rgknGwQbPYK3l00Si/6rRiY1jyOg5AzS5hnkgFW9t/m18okA7TZJyO6d9XAzQfdRofsXC/ZKCXpAgABxv69OVdvrVVlrr+i4ql93i+SOcmFutnzXNHmHt7jRnS3Yld5OF26gk8nCEZLGYtExQATf+rCPgYeBQqdI38CL6qOU7VTM/05rgM5O7G/Eg8pWguv8t1zkzaunTuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8381.namprd11.prod.outlook.com (2603:10b6:610:17b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 14:00:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522%4]) with mapi id 15.20.6631.042; Mon, 31 Jul 2023
 14:00:11 +0000
Date: Mon, 31 Jul 2023 13:59:24 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <ZMe+PEY7lxQAgw8p@DUT025-TGLU.fm.intel.com>
References: <20230731131337.1100068-1-tejas.upadhyay@intel.com>
 <20230731131337.1100068-7-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230731131337.1100068-7-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0PR03CA0133.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8381:EE_
X-MS-Office365-Filtering-Correlation-Id: c1f27966-0668-45ca-3933-08db91ce74a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dNDH8bWqEHYhTpaLjgWnFfz4I4x/erRMoY2iowOyXo/k35XreNKterW3iowyQ9l5mlI0r30qCzoq6kN/hMxAO39Vh/jiSgD+gWUWgXW3o7Ph+vmc7iIM48y89eHnokEdzxv8yaZG1cEGgsw6sVrZ54BCJ2yXjFUjILq4Ek6oEycizh8VDwjjc2x5D900OqCDp0ne03kuWzPo37G0pMaVle9zANhFMzL2w4kN+l3MWjjb+GrAUPSVV3hjXA9qq11uQbzzuhdUO4vIVBT2Sbjoqfcs9OqZ16xipNX92SwfHyOymkPXRVBib8qcnFjZWsOUk9y8JYvj+eLU6BKR0EIp0R32pqbJgA0ivFuvwUHGQCZLo67NwlImVvsoIzqZkPZcH4jZnFRtx9dllq0I1BlIgLCW/L0HGxfclS6Z2Ih5ouYA+0TdtBluf3e0Ztu2wes77gmqW7Yta54NrIMpJ6vTCwy+jARVxqN6qXbTtYEZRli3HnhLGqK3uXl2trnQExE/9IBb2eQCmYlfC49UcNVAI+Sd1+Hs6uhcJwkIdNPPYXHwryiQtKW0WbrW6kcolpdB2pdNQ/+qmdwCupaIiFMI7dpb/G+fuiMDNFVBpP18wN8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(396003)(366004)(136003)(39860400002)(451199021)(66476007)(86362001)(8676002)(6862004)(8936002)(316002)(6636002)(4326008)(5660300002)(19627235002)(41300700001)(66556008)(66946007)(82960400001)(478600001)(30864003)(38100700002)(2906002)(6666004)(44832011)(6512007)(6486002)(107886003)(6506007)(26005)(83380400001)(186003)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cZeXAJu3BOHbDjbqn/i5rMxEXnGdRw17CtKxNu0TuesB5AGc2FvSUEQrI4Nn?=
 =?us-ascii?Q?vL95ILScdryDDyBONcd3TTldgm74DC48W+yiRGAbe/5FYASUIxuu73bHobuv?=
 =?us-ascii?Q?wgSsy6u2EJUeSZA1wDV3nN9NTt1ZCAiLMYLkT9XwdZXVcS8r829aGQLnww2/?=
 =?us-ascii?Q?hzIpMfh0c/JDlWEwfSeZcTwOuTMgfWiav0NVlut9+rESXmdF9H1N2neEXXRv?=
 =?us-ascii?Q?6KCIf7YO861dWYMjVplmM/Q8efUdREIcs1XT5pziUjkIG6I5FRA1HqYbZV0E?=
 =?us-ascii?Q?sza64WRiZp7wgCA9jqgd6t6kqTXtfos+dDxUhRsRzaPBBKdtiR+COq7NDhcf?=
 =?us-ascii?Q?7A2F/793yb9RqAOWm1sX4mqmeAePdPXot87pKaR/USMmTzhObvGn0nWgQDlp?=
 =?us-ascii?Q?79SI52adef6yPXMrLnsRwXFdyjIItjy85ovvCN6JMXKuTc6iJjNKuCdeuGSS?=
 =?us-ascii?Q?fUx/rZVqZXTK0zsm6ecBUTMfELNTaERp0wmcxtGcL7vQqee3xo9Ppa8wJBBX?=
 =?us-ascii?Q?M4zeEtGft9Y+MB+mfJYRQDq5MiEbqPQXtX0DZB91ZNpXFt+zA2nG4lZ2zf21?=
 =?us-ascii?Q?vHjQ2Ihte6JOpZnLo9CjWO3Uzi5g4x2iZzLerEJeN0jOugoSsDQAGxZ6Z3dR?=
 =?us-ascii?Q?n5/Zx8s6ca5JcCr1u0nIgEpYj2J7/PaffLwxI16Yg6e+sNd0zkhWzxaQ7FSp?=
 =?us-ascii?Q?plS3Whoq8Wh+fb4sp0CCH3qa01U1Pslj83tUxc/sW0oNokliZNiHZyWJaWJ3?=
 =?us-ascii?Q?4PfI0AIXvlVUu8KDu3oj/0IVqwFOKn0PbRtGuPZR+b6qqHELCuf6we8EQj+J?=
 =?us-ascii?Q?oZtEkWoDLme5WKoVMQ5dM0UfKJxH5lUNBEbmM1q6OPvZ8giYtATKiLgEvwcV?=
 =?us-ascii?Q?RqD8bQXhboRVqfPUJsMZPJbrE4Z5IXNEzmuQ7jKvfK370ERuyFG28X1/SvMl?=
 =?us-ascii?Q?vXzXP2GdTJe5TDpI601A1iH3DN/cGbrdQBuFu4DEydDhvJEaGuH/kX72SjN+?=
 =?us-ascii?Q?qC4AaLU7Bonw89+B4L/q91TM7f2ZPbfUjs8AJA7jB+VoD3tArDmTFwRjsafZ?=
 =?us-ascii?Q?vQ8ZAedTLctytvHZP6tRt8lJGpCI+9zzCpzkrimtuI6yOuN3PENFendZNu/w?=
 =?us-ascii?Q?atVPay1zgMJiwnunMZZTm0FmLRtNfwnLwyHNJc2b2IHuo30J2iA6exJN6XBe?=
 =?us-ascii?Q?AzuVqyh4XgUlS1C/2TgRK0I6+mfXloVN3RsDgfW7CigQ1tjLgbAY4fW+pbS7?=
 =?us-ascii?Q?j1TmszIs+7KMPobn3/WXHra+IXfk5ydI1Vmnd6BFryQYOuPGJGvkdJnHc70L?=
 =?us-ascii?Q?JpROu1EKLm7qJ48CFBP8vvNRIJUPjJ1vJb9ZbfJEcwarcISDZnYbSnQjaLiE?=
 =?us-ascii?Q?P2YC0dOi4eheTAOUzc+xmDnCtAmDCbmfBImmcmcJlENa/1rojTZ1lGZUTXUj?=
 =?us-ascii?Q?VTS7r4oIzOe09Gm785nC1HIcLPRKCwYSTCfvndx/lNndTiGmSD//atMdSJnc?=
 =?us-ascii?Q?Q/Q1Hnk1y0AzUGcoLambSjsoABEYJxXAQf8sGaz+ZLptE3/jnm3C2xCSTFtY?=
 =?us-ascii?Q?E7NdkWOWoXmOSfaffbdarJ6NbooTicvn1yegN/5TDfoeRnbexPG8cFx1uR4h?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1f27966-0668-45ca-3933-08db91ce74a7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 14:00:11.0602 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UXr4iSStxRSRTfTJGqtT//Gplb/Qvm+2uovGZ2+Erjz0caz0f8JCeI+r520ve9XgKPXDppTYcHX65IgTCRaS2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8381
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V10 6/6] drm/xe: Add min/max cap for engine
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

On Mon, Jul 31, 2023 at 06:43:37PM +0530, Tejas Upadhyay wrote:
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
> V10:
>    - Add kernel doc for non-static func
>    - Make helper to get min/max for range validation - Matt
>    - Filter min/max per user type
> V9 :
>    - Rebase to use s/xe_engine/xe_hw_engine/ - Matt
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
>  drivers/gpu/drm/xe/Kconfig                    |   6 +
>  drivers/gpu/drm/xe/Kconfig.profile            |  46 ++
>  drivers/gpu/drm/xe/xe_engine.c                |  28 +-
>  drivers/gpu/drm/xe/xe_hw_engine.c             |   8 +
>  drivers/gpu/drm/xe/xe_hw_engine.h             |  31 ++
>  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 402 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h |   4 +
>  7 files changed, 519 insertions(+), 6 deletions(-)
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
> index f4eb67915bfc..b7af890e0447 100644
> --- a/drivers/gpu/drm/xe/xe_engine.c
> +++ b/drivers/gpu/drm/xe/xe_engine.c
> @@ -13,6 +13,7 @@
>  
>  #include "xe_device.h"
>  #include "xe_gt.h"
> +#include "xe_hw_engine_class_sysfs.h"
>  #include "xe_hw_fence.h"
>  #include "xe_lrc.h"
>  #include "xe_macros.h"
> @@ -204,8 +205,13 @@ static int engine_set_priority(struct xe_device *xe, struct xe_engine *e,
>  static int engine_set_timeslice(struct xe_device *xe, struct xe_engine *e,
>  				u64 value, bool create)
>  {
> -	if (!capable(CAP_SYS_NICE))
> -		return -EPERM;
> +	u32 min = 0, max = 0;
> +
> +	engine_get_prop_minmax(e->hwe->eclass, "timeslice", &min, &max);

Rather than a string, use an enum or #define. This enum or define won't
need to be in *.h file either as this function will be static so just
include in the c file.

> +
> +	if (enforce_schedule_limit() &&
> +	    !engine_timeout_in_range(value, min, max))
> +		return -EINVAL;
>  
>  	return e->ops->set_timeslice(e, value);
>  }
> @@ -214,8 +220,13 @@ static int engine_set_preemption_timeout(struct xe_device *xe,
>  					 struct xe_engine *e, u64 value,
>  					 bool create)
>  {
> -	if (!capable(CAP_SYS_NICE))
> -		return -EPERM;
> +	u32 min = 0, max = 0;
> +
> +	engine_get_prop_minmax(e->hwe->eclass, "preempt_timeout", &min, &max);
> +
> +	if (enforce_schedule_limit() &&
> +	    !engine_timeout_in_range(value, min, max))
> +		return -EINVAL;
>  
>  	return e->ops->set_preempt_timeout(e, value);
>  }
> @@ -279,11 +290,16 @@ static int engine_set_persistence(struct xe_device *xe, struct xe_engine *e,
>  static int engine_set_job_timeout(struct xe_device *xe, struct xe_engine *e,
>  				  u64 value, bool create)
>  {
> +	u32 min = 0, max = 0;
> +
>  	if (XE_IOCTL_DBG(xe, !create))
>  		return -EINVAL;
>  
> -	if (!capable(CAP_SYS_NICE))
> -		return -EPERM;
> +	engine_get_prop_minmax(e->hwe->eclass, "job_timeout", &min, &max);
> +
> +	if (enforce_schedule_limit() &&
> +	    !engine_timeout_in_range(value, min, max))
> +		return -EINVAL;
>  
>  	return e->ops->set_job_timeout(e, value);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index b7be7b0acb35..b8fcc6e985cf 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -364,8 +364,16 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  
>  	if (!gt->eclass[hwe->class].sched_props.job_timeout_ms) {
>  		gt->eclass[hwe->class].sched_props.job_timeout_ms = 5 * 1000;
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
>  	}
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
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> index 7f84f35c3122..7b66045a92ff 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> @@ -12,6 +12,80 @@
>  #define MAX_ENGINE_CLASS_NAME_LEN    16
>  static int xe_add_hw_engine_class_defaults(struct kobject *parent);
>  
> +/**
> + * enforce_schedule_limit - Helper to check if schedule timeout min
> + * max limit to be applied.
> + *
> + * This helper helps to validate if schedule timeout limitation to be
> + * applied for the use or not.
> + *
> + * Returns: Returns false value for failure and true for success.
> + */
> +bool enforce_schedule_limit(void)
> +{
> +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> +	return true;
> +#else
> +	return !capable(CAP_SYS_NICE);
> +#endif
> +}
> +
> +/**
> + * engine_timeout_in_range - Helper to check if timeout is in range
> + * @timeout: timeout to validate
> + * @min: min value of valid range
> + * @max: max value of valid range
> + *
> + * This helper helps to validate if schedule timeout is in min-max
> + * range.
> + *
> + * Returns: Returns false value for failure and true for success.
> + */
> +bool engine_timeout_in_range(u64 timeout, u64 min, u64 max)
> +{
> +	return timeout >= min && timeout <= max;
> +}
> +
> +/**
> + * engine_get_prop_minmax - Helper to get min/max of engine scheduler prop
> + * @*eclass: hw engine class interface
> + * @*prop: prop name for which min/max will be fetched
> + * @*min: pointer to min value of valid range
> + * @*max: pointer to max value of valid range
> + *
> + * This helper helps to get min/max values of HW engine scheduler is property.
> + *
> + * Returns: Void.
> + */
> +void engine_get_prop_minmax(struct xe_hw_engine_class_intf *eclass, char *prop,
> +			    u32 *min, u32 *max)
> +{

Changing the char -> enum or define this can now be a switch statement.

> +	if (strcmp(prop, "timeslice") == 0) {
> +		*min = eclass->sched_props.timeslice_min;
> +		*max = eclass->sched_props.timeslice_max;
> +	} else if (strcmp(prop, "preempt_timeout") == 0) {
> +		*min = eclass->sched_props.preempt_timeout_min;
> +		*max = eclass->sched_props.preempt_timeout_max;
> +	} else if (strcmp(prop, "job_timeout") == 0) {
> +		*min = eclass->sched_props.job_timeout_min;
> +		*max = eclass->sched_props.job_timeout_max;
> +	}
> +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> +	if (capable(CAP_SYS_NICE)) {
> +		if (strcmp(prop, "timeslice") == 0) {
> +			*min = XE_HW_ENGINE_TIMESLICE_MIN;
> +			*max = XE_HW_ENGINE_TIMESLICE_MAX;
> +		} else if (strcmp(prop, "preempt_timeout") == 0) {
> +			*min = XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
> +			*max = XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
> +		} else if (strcmp(prop, "job_timeout") == 0) {
> +			*min = XE_HW_ENGINE_JOB_TIMEOUT_MIN;
> +			*max = XE_HW_ENGINE_JOB_TIMEOUT_MAX;
> +		}
> +	}
> +#endif
> +}
> +
>  static void kobj_xe_hw_engine_release(struct kobject *kobj)
>  {
>  	kfree(kobj);
> @@ -40,11 +114,86 @@ kobj_xe_hw_engine_class(struct kobject *parent, char *name)
>  	return keclass;
>  }
>  
> +static ssize_t job_timeout_max_store(struct kobject *kobj,
> +				     struct kobj_attribute *attr,
> +				     const char *buf, size_t count)
> +{
> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
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

No need for enforce_schedule_limit rather check the range if
XE_HW_ENGINE_JOB_TIMEOUT_MIN/MAX. See my comment enforce_schedule_limit
below.

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
> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
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
> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
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
> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
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
>  	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> +	u32 min = 0, max = 0;
>  	u32 timeout;
>  	int err;
>  
> @@ -52,6 +201,12 @@ static ssize_t job_timeout_store(struct kobject *kobj,
>  	if (err)
>  		return err;
>  
> +	engine_get_prop_minmax(eclass, "job_timeout", &min, &max);
> +
> +	if (enforce_schedule_limit() &&
> +	    !engine_timeout_in_range(timeout, min, max))
> +		return -EINVAL;
> +

Again just check the sysfs entries, not sure why I need to say this
again.

But let me explain.

Here cap_nice is always true, you can't write sysfs entries without at
least that much permission. This makes enforce_schedule_limit kinda
useless.

Again when checking the range (min, max) we know the min / max are with
Kconfig range, the sysfs min / max may be a sub range of that, this is
the range we want to check. With that, we don't need
engine_get_prop_minmax here.

Putting this all together engine_get_prop_minmax &
enforce_schedule_limit are now static functions with an export.

>  	WRITE_ONCE(eclass->sched_props.job_timeout_ms, timeout);
>  
>  	return count;
> @@ -79,11 +234,34 @@ static ssize_t job_timeout_default(struct kobject *kobj,
>  static struct kobj_attribute job_timeout_def =
>  __ATTR(job_timeout_ms, 0444, job_timeout_default, NULL);
>  
> +static ssize_t job_timeout_min_default(struct kobject *kobj,
> +				       struct kobj_attribute *attr, char *buf)
> +{
> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
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
> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
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
>  	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> +	u32 min = 0, max = 0;
>  	u32 duration;
>  	int err;
>  
> @@ -91,11 +269,94 @@ static ssize_t timeslice_duration_store(struct kobject *kobj,
>  	if (err)
>  		return err;
>  
> +	engine_get_prop_minmax(eclass, "timeslice", &min, &max);
> +
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
> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
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
> +					   struct kobj_attribute *attr,
> +					   char *buf)
> +{
> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
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
> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
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
> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> +
> +	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_min);
> +}
> +
> +static struct kobj_attribute timeslice_duration_min_attr =
> +	__ATTR(timeslice_duration_min, 0644, timeslice_duration_min_show,
> +	       timeslice_duration_min_store);
> +
>  static ssize_t timeslice_duration_show(struct kobject *kobj,
>  				       struct kobj_attribute *attr, char *buf)
>  {
> @@ -119,11 +380,34 @@ static ssize_t timeslice_default(struct kobject *kobj,
>  static struct kobj_attribute timeslice_duration_def =
>  __ATTR(timeslice_duration_us, 0444, timeslice_default, NULL);
>  
> +static ssize_t timeslice_min_default(struct kobject *kobj,
> +				     struct kobj_attribute *attr, char *buf)
> +{
> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
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
> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
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
>  	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> +	u32 min = 0, max = 0;
>  	u32 timeout;
>  	int err;
>  
> @@ -131,6 +415,12 @@ static ssize_t preempt_timeout_store(struct kobject *kobj,
>  	if (err)
>  		return err;
>  
> +	engine_get_prop_minmax(eclass, "preempt_timeout", &min, &max);
> +
> +	if (enforce_schedule_limit() &&
> +	    !engine_timeout_in_range(timeout, min, max))
> +		return -EINVAL;
> +
>  	WRITE_ONCE(eclass->sched_props.preempt_timeout_us, timeout);
>  
>  	return count;
> @@ -159,17 +449,129 @@ static ssize_t preempt_timeout_default(struct kobject *kobj,
>  static struct kobj_attribute preempt_timeout_def =
>  __ATTR(preempt_timeout_us, 0444, preempt_timeout_default, NULL);
>  
> +static ssize_t preempt_timeout_min_default(struct kobject *kobj,
> +					   struct kobj_attribute *attr,
> +					   char *buf)
> +{
> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
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
> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
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
> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
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
> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
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
> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
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
> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
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
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> index c6199c75c234..8e499217b2fa 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> @@ -9,6 +9,10 @@
>  #include "xe_gt.h"
>  
>  int xe_hw_engine_class_sysfs_init(struct xe_gt *gt);
> +bool enforce_schedule_limit(void);
> +bool engine_timeout_in_range(u64 timeout, u64 min, u64 max);
> +void engine_get_prop_minmax(struct xe_hw_engine_class_intf *eclass, char *prop,
> +			    u32 *min, u32 *max);

Public functions must have xe_ prefix, really functions should. Also
these are hw_engine not engine functions.

In the end we only need enforce_schedule_limit, with
s/engine_timeout_in_range/xe_hw_engine_timeout_in_range/

Matt 

>  
>  /**
>   * struct kobj_eclass - A eclass's kobject struct that connects the kobject and the
> -- 
> 2.25.1
> 
