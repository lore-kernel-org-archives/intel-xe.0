Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40772C001DC
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 15:27:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0631810E5AE;
	Thu, 27 Jul 2023 15:27:43 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36BDC10E5AE
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jul 2023 15:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690471661; x=1722007661;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RNgv6H7tzxSlzIOfU8lFXkITXF14pPz7nBHPF14mGHY=;
 b=Rn2PwjgIUsGmOrmDACtrNZszEibYuZQgsJrnXjt/TW6T6wIJGYRY23XH
 5M6ZbYJEpqwGLXH8Z5YqYu1JsXuOdW2BVBsCQm7Ys0pxM12uT5VDaW5FA
 fXuMdYDaOFRJFuxVcxsmGMPXUSnlW27Mcry/lhKBWLRlL40yahcJ6ocSE
 Ut3rDxB2L10sSsGBBvF4/TkmsKyQ4PwHmeTijSaIJc5GDin7wMJqJvyEL
 bsbpHLfWXeQ010STElHlZFxNB64MstES6nmvlpL3DwBoAgGQ3SPJCZ8u0
 oFKk4QqD+HQyrneOPvTOvaTzn/FIJ1VJUQHAL3NWcVr5ocVtKrA6xLI+E A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="365804139"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="365804139"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 08:27:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="817129725"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="817129725"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 27 Jul 2023 08:27:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 08:27:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 27 Jul 2023 08:27:40 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 27 Jul 2023 08:27:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ftwGxz1x6JXc6DEzc3HIJED58JEcZlPSQ7EwVVC5BbGGK6yj3CvRG2nBfQx01VWVCtosBo3RUv+J0cQyjsPCSIlRbWeU5iVQn6O6BLO0msWLVmAFR3K1xnI/xryY5EjS5SIFPsiQtfsXykaHP235QzC95ZcYWWZfgrrDc39WvZmsOnSOM26uY4M9NzCCxusBrr1WSgLgYnGku/GgItBvTEmGZP0MAw4JyGy3JZGhxhOneeJP0FdzElETZWQIFp65dnsP6GdD7QlI6FrJnnYFWtCTBrmMG97tJZhEzjjmWnt0T5GFvw1BnFPIfflGN5pIIXzumKQciAA3Rjv7O42A4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mOKGNGMUysXFRmCILS3vsHfiltgqHF73B+2Ztm6Hi2I=;
 b=g4/GeFbF5jeClA7gQSwslAE8aRxr6a1dKCtr0SlNlk/j8Lj6yUbFarBGeXffm7BsRlb83kH6vgDntYnzAys0JULZtk3SrjF8PtjeT9AMzfV6l0Qvhw+CRqzAr/kitfpeqP5DPUdy5Ut90HyF6HPHChKWGzPkpk6U+gtcJ+gmtP1RL4moNiH0HqUka5RtWwYE1asmm2sxYgL+FUGHG4Ku4hMntKo1o3KrsL6CzyE2SHcN623UagSPzziqD6Q4gIEbNYaUAdYDGl3T1THvNGCbWlRhOopup3g7esBB49l4cU7PD/oEUOZRaKpxsmXjm6ZIWs7AL/M7G5Qlkz75H/y0ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7076.namprd11.prod.outlook.com (2603:10b6:510:20f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 15:27:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0%3]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 15:27:36 +0000
Date: Thu, 27 Jul 2023 15:26:49 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <ZMKMuWeQBXsSo2Sb@DUT025-TGLU.fm.intel.com>
References: <20230727082235.905240-1-tejas.upadhyay@intel.com>
 <20230727082235.905240-7-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230727082235.905240-7-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0PR13CA0222.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7076:EE_
X-MS-Office365-Filtering-Correlation-Id: b43c6ead-c17e-4349-06da-08db8eb6016e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n3NTReZws3WYbyt27py4lwzKRyft16B23a3aGRTmshAqkdKQVx2Z+K7nvdcg5p8jTZbvqGtm9TV7hyVCAQg+poRlh3cW3V2rlOF7qm64rhMthInhjiI8OqbVjsdQdpRh7MN0iAomTQog8NZ5BLDQ4NbVNDuvynZrpbjdxRh2BFBSp3Z0d6SJbfPtqUOKHv+10bfgNhIIa7zUkqRfRqPe5nUGZAvtDZs0WMrA5gQhYmIZ6j8sJmlQvO2W/ht5q3YzAKwTePTG0zYdnGfcv6Van1WWqSSrnMhmbaoeDIJI8+si2NiTt/P8s8wg5mldxigvM/+DQwz/qBfzZ4ZiWoqkC4fH28CPaQ8l1Yu4IADjmZCjYjOY4I8qhVDevD8t+zPp4HsZQJCyfs1+RlOCr4kbnzQJ6b7+NM7BaFQRPpOdz7+iYJ11bkqcFvGyfpL43FMvLI4FJqr7JriIG+YVYxcKpnxaHslPuYN0Ti7QjRm/FelePmC4P/qNddtm5a1GCgpIArCctTyz3DsvkE0pLqm7G/FTx+aF49KijNPgZaQkQmHXNJmUnLf2PauaJQ5E6QsT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(136003)(39860400002)(346002)(396003)(451199021)(82960400001)(6666004)(6486002)(478600001)(83380400001)(26005)(6506007)(107886003)(6512007)(38100700002)(19627235002)(66476007)(66556008)(66946007)(6636002)(4326008)(186003)(5660300002)(44832011)(41300700001)(30864003)(316002)(2906002)(8936002)(8676002)(6862004)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OMYNhU5zSrFfDVfI2Iv0ZD+iGOFzmYjLNvnwuVupRCt+QkUvnU+bOJjUXitt?=
 =?us-ascii?Q?NjaQyP4HksiKzGcGFmOwZYAwgjWNlvY7p33Kx+iOg0OBiVZwbtU+zox1kTxZ?=
 =?us-ascii?Q?hNW9VctiSSmg0OSH4iwgJMfPs5POuaotO3qutVFVzgyF49ywRhKaFrBGKMu9?=
 =?us-ascii?Q?WBCMrb+mNfFSWSGI+XhyIYS+2wV3+4qXdsCwJbYBWdmQAW1hguISVDiU+R8H?=
 =?us-ascii?Q?3wNd5DzTTEgnFKjdLRolL4i/3xFnAycC2llFXQIa/R1ezafFIfKRAmWmwvlh?=
 =?us-ascii?Q?bJsOMGX6CyBaH8R0Maxtxf4ZjgSZVmFAMvOg2+Tz8yoCNUjhTPPEBeTssa2W?=
 =?us-ascii?Q?0Vd5TaIckU/KLL6FbjvDBrq8Zauwn2kJ+gYMfp7+bWqN6XDlRZFat4tdExe5?=
 =?us-ascii?Q?tT0UCbbH/IFvXnJwdJeu6i3DFlCK2W88FLduUZ1ZQlI3ur2iln9w6jJhat/W?=
 =?us-ascii?Q?2EteEh7xIoC0+WHgELhII53k1cX9ZwWa3i07IwdAKjtOrqgu5BBL89YVFAue?=
 =?us-ascii?Q?u5e4kdCaR11Nr2modyy6KQq390QGhVKWA/8dbnNINdNrw+wjF+5BLhVRrPME?=
 =?us-ascii?Q?3EYD0+/GzKm3AkHA59VOQFHHrEPVl/O94KFDwLf4YYRzHE0s3GKWyjMC5u3A?=
 =?us-ascii?Q?DbGwZMWd+5ndP5btWlOt51/7y0fEKJREMYsxuGI+1s4pkHvvD26jDVcXxwro?=
 =?us-ascii?Q?7b++wzvwLYjPrJ6g7b2xN14HqiLbQedxYofs853kTr06MK6qOl/i1TqqoxjM?=
 =?us-ascii?Q?/DlvxR+Y2Zfs+8c4TIOQ0yzWHme7omb98lf/wXDSRtd66tm9Lei3FNrDipdK?=
 =?us-ascii?Q?rRUBwlvIzCcOei7If7ql0QO966IeHdBYkOoHUUGqQrOTJVNEfsU3VSbi5wsd?=
 =?us-ascii?Q?wEFjKZ9lFyqw1aPLvGooebEedrjDia7M9jknnKYVnKDM6yitByN48isy2Ulp?=
 =?us-ascii?Q?o+IUPOLV1lm6bDE1EqLYBQbLgupNy0ocT2v1vXivCQRX7JXYX16tKYgSpv/v?=
 =?us-ascii?Q?MftaFZnQS6z+0hq5Y6JCZTcI2FMvSQu2jOcW7digIPobhF/Rj5e/NUx7l3ft?=
 =?us-ascii?Q?uBmaCfmhxN3NlUFgt6fk3DA8RLYQ17ySInooA7ULD17Z5dhuLhn7AqMcc3b8?=
 =?us-ascii?Q?M2Nc1nV/Q3Cw8theMCDoKNHqajc4YEqDJyO6EBLNKseAwaBYfrygiSdY0Gf1?=
 =?us-ascii?Q?/3eCev/+lBgPMTK+hI90Y7HSosIFD/UdXYlTdBKh88NAOsj37neApPvxcDsr?=
 =?us-ascii?Q?MK8OsJ6vVZ/hQceJM1Jghy6gm40d1ckUo0kcZtV5pR5RbPp+ohe0ZNYByayX?=
 =?us-ascii?Q?tLUFO4qZFzDIYSfpLEjPB5u0yUE/LjHaXEEXl2P553nSxIcnLv/q10xhFT6x?=
 =?us-ascii?Q?tW4Sa6TNfpFuBQkOiIZ0435JjBIAA7kTRnDGI9jw9S7TKhxW7GO79Qp/atQs?=
 =?us-ascii?Q?jTF2ebnCq8uEMLssLMCDOi5uZKWmE+EO7cCo9+7L2A77IdgZrHMroNvrp9cn?=
 =?us-ascii?Q?XKHBXsHHZq8v5H7Z3LsSuFZas4s1Gepa/w0gZbXEGkq3VkKCGFPFA+HO61H1?=
 =?us-ascii?Q?l9klB7AhTF/sCuJHW0icobYkFZViTqwfoKhi12kUXP+cz2LpiU/nkF6yLWsU?=
 =?us-ascii?Q?Ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b43c6ead-c17e-4349-06da-08db8eb6016e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 15:27:36.8912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3TCtwv93Z/SK6v+PiJnUvlxt7dFc9iddACtT1qGWKljxZE2NrDonali6DEOVoBzcvixJ3IZYXCIf9pLwctKmXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7076
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V9 6/6] drm/xe: Add min/max cap for engine
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

On Thu, Jul 27, 2023 at 01:52:35PM +0530, Tejas Upadhyay wrote:
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
>  drivers/gpu/drm/xe/Kconfig.profile            |  46 +++
>  drivers/gpu/drm/xe/xe_engine.c                |  25 +-
>  drivers/gpu/drm/xe/xe_hw_engine.c             |   8 +
>  drivers/gpu/drm/xe/xe_hw_engine.h             |  31 ++
>  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 354 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h |   2 +
>  7 files changed, 466 insertions(+), 6 deletions(-)
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
> index 9e167b113963..d934196eb79f 100644
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
> @@ -191,8 +192,12 @@ static int engine_set_priority(struct xe_device *xe, struct xe_engine *e,
>  static int engine_set_timeslice(struct xe_device *xe, struct xe_engine *e,
>  				u64 value, bool create)
>  {
> -	if (!capable(CAP_SYS_NICE))
> -		return -EPERM;
> +	u32 min = e->hwe->eclass->sched_props.timeslice_min;
> +	u32 max = e->hwe->eclass->sched_props.timeslice_max;

So I screwed this up in my last comment, sorry.

min = cap_nice ? KConfig option for min : e->hwe->eclass->sched_props.timeslice_min;
same logic for max;

Probably add helper for this.

> +
> +	if (enforce_schedule_limit() &&
> +	    !engine_timeout_in_range(value, min, max))

Then I think logic works too...

if cap nice && !Kconfig option to enfore limits (enforce_schedule_limit returns false):
	user can do whatever
else if cap nice
	user within Kconfig range
else
	user within sysfs range

This is what we want in the end.

> +		return -EINVAL;
>  
>  	return e->ops->set_timeslice(e, value);
>  }
> @@ -201,8 +206,12 @@ static int engine_set_preemption_timeout(struct xe_device *xe,
>  					 struct xe_engine *e, u64 value,
>  					 bool create)
>  {
> -	if (!capable(CAP_SYS_NICE))
> -		return -EPERM;
> +	u32 min = e->hwe->eclass->sched_props.preempt_timeout_min;
> +	u32 max = e->hwe->eclass->sched_props.preempt_timeout_max;
> +
> +	if (enforce_schedule_limit() &&
> +	    !engine_timeout_in_range(value, min, max))
> +		return -EINVAL;
>  
>  	return e->ops->set_preempt_timeout(e, value);
>  }
> @@ -266,11 +275,15 @@ static int engine_set_persistence(struct xe_device *xe, struct xe_engine *e,
>  static int engine_set_job_timeout(struct xe_device *xe, struct xe_engine *e,
>  				  u64 value, bool create)
>  {
> +	u32 min = e->hwe->eclass->sched_props.job_timeout_min;
> +	u32 max = e->hwe->eclass->sched_props.job_timeout_max;
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
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index afa7d25c3852..e601bffe3b13 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -364,8 +364,16 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  
>  	if (!gt->eclass[hwe->class].sched_props.job_timeout_ms) {
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
> index 990bb675d1e0..2b7ac4e02db6 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> @@ -11,6 +11,20 @@
>  
>  static int xe_add_hw_engine_class_defaults(struct kobject *parent);
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
>  static void kobj_xe_hw_engine_release(struct kobject *kobj)
>  {
>  	kfree(kobj);
> @@ -39,11 +53,92 @@ kobj_xe_hw_engine_class(struct kobject *parent, char *name)
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
> +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> +	u32 min = XE_HW_ENGINE_JOB_TIMEOUT_MIN;
> +	u32 max = XE_HW_ENGINE_JOB_TIMEOUT_MAX;
> +#else
> +	u32 min = e->hwe->eclass->sched_props.job_timeout_min;
> +	u32 max = e->hwe->eclass->sched_props.job_timeout_max;
> +#endif

I don't think we need this, just make sure default is within min / max
of the sched_props.

Matt

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
>  		struct kobj_attribute *attr, char *buf)
>  {
> @@ -118,11 +327,40 @@ static ssize_t timeslice_default(struct kobject *kobj,
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
> index 757136614672..2e2ab351a991 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> @@ -10,6 +10,8 @@
>  
>  #define MAX_ENGINE_CLASS_NAME_LEN    16
>  int xe_hw_engine_class_sysfs_init(struct xe_gt *gt);
> +bool enforce_schedule_limit(void);
> +bool engine_timeout_in_range(u64 timeout, u64 min, u64 max);
>  
>  /**
>   * struct kobj_eclass - A eclass's kobject struct that connects the kobject and the
> -- 
> 2.25.1
> 
