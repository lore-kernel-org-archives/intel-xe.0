Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9BFAC41513
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jul 2023 16:16:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8545810E337;
	Mon, 24 Jul 2023 16:16:57 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4801610E337
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Jul 2023 16:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690215416; x=1721751416;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OsM/mYsiN6pJ3pOjj1RDewJgaqrllALvL06bPoPZicY=;
 b=k1TMWOW3lYO2kAcHeGoCGl94h6KozA7WytVFns7JWfqaqrUq21UtH6N5
 YgiyoGavpQuGzZHj7xQgUMH9e2pZxA9BUgWkFFzjsWVDaUuyQ8zcxN7fX
 AFl9BgDV9Ky/H2rHHv0WPiP7lHqXN+fLFeXz3xZFR8hfmlO+xaaWY/nRP
 tqpsTXUtRS1bw9xq7gx6nZqH01eOlujYO/JEB6dGRaUuXslhWtrhpEKZ+
 GrJF7mSmY/zf4FkAhjPCGlryQHXTe8bm+AHF2kljFDJwUReMRFqQe9LqF
 ERzruj25RD60KMP+IPw/Nu0xAmKR0DUGQ/Zu+DHLtV8QuM1oAMfToplAB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="364946232"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="364946232"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 09:15:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="728962459"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="728962459"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 24 Jul 2023 09:15:18 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 09:15:15 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 24 Jul 2023 09:15:15 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 24 Jul 2023 09:15:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R39N3y40s69Jx5scPP7e+pd27QCSds6qc+JYZTdi9bwhmZvAjJ8EFj3RfdiWjxR/5ib2V68cgSKPr9kC9Brhf1XgQ9y6Nyc64qkUlPOavYfgzJBm6zvfSF7jQaIPKeaMfePqvfvfD7mIaIjPJc6tP1pgj2J0n5Zz9gI6LHBg+hoML3Mk+Ra4Z/ylWuNVW+Xve7Bz+4fzueYvYkWucN2ibqBrB125+4oge4TbKwCOWSY/0JimesdXuYw+0nwqQuo6Sl6A6omYdOZiJu1osmWKDzJ9TCIAGbqQcKz+i8tvCrUsUm+YJNuJl4n6aZK6VLez/9r6wFG7qJoKfAOl3RA7dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XKEtePnhh5bLI494PximsFXgEy3iO2ckUhpxwWBrbJs=;
 b=hSRIiEH+b7AGBs39h0BH9IspTrvoyrgJzmoLXQtDD+Md9FYwP+37Aj4QDhj0am5DwndkF0FHCnUUvWCDlCUR3QsEtfqNUzMzhJnB7fFxIF9JjuGeT7SdGtG9gHX5oK3n1Z1XnSNNN+rLLZJ+S+8kCA2TP42QLy2DdfW938iO0yQy2UgjYrEjM8F4gPRCIhvACeZNcJDk3kNHXWLjNLJPwhMq9YQ8RR5jTnNH285e3+83GIsr047CJxPPlP/uccW2zMZJtBQN+l0HhX2wdIsCkjilP1Pzgrpch1gH/LVoYZm+7V5zw5v1vz9Nz5SunhekUQlG7uEhxOIARqOYaxmk8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by PH0PR11MB5628.namprd11.prod.outlook.com (2603:10b6:510:d4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 16:15:13 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::fe5e:ee9:8806:c9fa]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::fe5e:ee9:8806:c9fa%7]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 16:15:13 +0000
Date: Mon, 24 Jul 2023 09:15:06 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <ZL6jimuSheIhllN5@nvishwa1-DESK>
References: <20230724094733.720266-1-tejas.upadhyay@intel.com>
 <20230724094733.720266-7-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230724094733.720266-7-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0PR13CA0047.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::22) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|PH0PR11MB5628:EE_
X-MS-Office365-Filtering-Correlation-Id: e5754c1b-e602-40cd-3ecf-08db8c612916
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 76ci/cVwdgiO22ixilj3seBk1chP4uOAbB37dwu9CI4XNXdFrN/oajeD81GumzAtTEThjnBdh0OTs94crSXYUGW1W7bXOSa+Xatk+CSzPjUc+959eeOjhpbgvSVqNJ62G7/o1tGD51kFobGSyJaH/92FK8BZlYxPPyD3mDrlf3E1ei6BVdWJdMNJrZ9/Nku5SEzus+YF36mC+MMJfvtcoHboVp7l6NaYPOj4Oo3aWSkwG7zPWdlGdIkdYe59yK8AsWSqDZm6a6Q+AXd+eQpjfVzB20J40vUTKNtpCxb5uiV3WxZ0680dH/iPv/qcETNJhPZVC1uY5Gt4/vbuH0jN2PStdTKm7TpfhzEIt0FG0uiK7ihB5D4sft27TWx8EOmzNu8V47Pq7V5gK4x+nDp2yZtyu2f4aPUmcvghMr8Qq6vNIA24OAtIjaT9JfVLTbhWh9KOkAi7ZACRRjfYVW8jXaiSGnO8eVtZV4obJeGeJyaSaQLN53C01li7E2nmJFGu4co2tuV2eGXG4C9R6NmYzr60a/fYuGXmdzpc87UjZyL8eCWjJzc5n0xP4rvO2l/N
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(396003)(39860400002)(376002)(346002)(136003)(451199021)(30864003)(2906002)(83380400001)(4326008)(6636002)(9686003)(316002)(6486002)(6512007)(66476007)(66556008)(66946007)(41300700001)(478600001)(19627235002)(86362001)(33716001)(6666004)(44832011)(38100700002)(82960400001)(186003)(6862004)(26005)(6506007)(5660300002)(8936002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+H+gU3KDFzuVJlMITYgIewNxZO1o13jpiL7vnYKjy3ktmNHboo9lWT6z/KZ+?=
 =?us-ascii?Q?59upqvRNe/myCS4nMkUN3aYGlSiVSZ9eFqB7VvUNi/OhqZ2UV0re9Su6grGd?=
 =?us-ascii?Q?20RPXkuUWcTywoCCzlyCaFF3W09a+LiW4fKNJrWLEGfWWoR4we47PUNArZtV?=
 =?us-ascii?Q?RlpaPox288UShdZ7Kpsxp5ehWGH4ayKXQIaKeM4egPACO+eulw6kZ8Iexf81?=
 =?us-ascii?Q?mU+m8l+XfLNUGo0UhBmndAtHsgy7WX3g5LEeua2S1NZb1ZSMQwApiBXcqbSi?=
 =?us-ascii?Q?k6ave5DySbCApUiyVgn+exd6dsgVa2SIZwZriWrozWcIQE5Ci5OsGDH6/YAG?=
 =?us-ascii?Q?FRoAQ04EIUBm3/nL8eKcP23ihWi/yGHkHWxQfLJdyuXeayP8IZR7/f/2YP7C?=
 =?us-ascii?Q?1HUn5yAOHYnIJEUFdL52MnCzbpWr3K1hh4J0wooWAE2u1z2S92Z+a+gf8EAo?=
 =?us-ascii?Q?Cr1zUoczrcUjZqCugfg2NG5rwFlRy5jn6O9CMXg8/afv7O9VKCceQ3biXkuY?=
 =?us-ascii?Q?n5eat1yftpWFEWTUxjgd2ZwgsI81pqjeVpVqNh135bl2KUazgKP4sB9fLGiJ?=
 =?us-ascii?Q?jdPo2vLcp4aiA6dBtp/EaIzBLMHdBMXx0SV5H5dt+fSd6zgZDg/vvm/9ShQw?=
 =?us-ascii?Q?mMOcLq9acXVDwoAQpvpMp7UadewrSTjSnb+9H2PaKsU0fOZisU8GWdrtzRA1?=
 =?us-ascii?Q?6as4Xcni5LtEnryoisX5h6eW2ya3xmBDmzDZOcfUOGS6ZwKzFLMFoOKB3Lgb?=
 =?us-ascii?Q?uXxI+1pyMRZh8ssWbfM3i846QkJyeCAOhqhWsdZxXKelBKqvFzxnXao7+Rvr?=
 =?us-ascii?Q?Q0yjIHU9MQ31dDYg/2EiJCgAivXGi1kpAp4FO1J5ZjN/hfUZECPOCeaOv5Y6?=
 =?us-ascii?Q?oe02+/QQsbMjyBITfYtWNhUjTjQUJz+KCRrc5/a02WEejG06SjTvsX6fqLbh?=
 =?us-ascii?Q?zU4CT1C13CvRvD0HoMW/gcVdOTygZG5yXfBiU84PWI7ChGiMRtH9HZ9G1LAB?=
 =?us-ascii?Q?g3SfJ4nLqDfqQ51twObVymANdY+U3rEpjW9/rmzzBLuzNUWp6RnLwzaV6dHg?=
 =?us-ascii?Q?UseBKbQPRUv0u51cgZjMNBIg9/NN5kk42lw779iv2nMph1qbatSjiEAJJfEl?=
 =?us-ascii?Q?VqVfeiSdVXBFc61Cyvt5XzTOrcaeY5+Hy5K3P1tTjEoM16CbKuXO9kGZ24hk?=
 =?us-ascii?Q?8ar3XpTseyOpGk0RaYmtULQ2wOlX2W270qzq72/l+2XoMghfg32Rg2YjX5cl?=
 =?us-ascii?Q?/M+2um3RvcXds9nMIKRGsZ5aLDENnjG/lGNxmZwXSU5TlhJaoGgYN8quWdg1?=
 =?us-ascii?Q?6+apVQ9NTwnJckjpoqgku72O3v2o6H73WEJIL0kaXAo2zFigpXSHpinESYyw?=
 =?us-ascii?Q?M98ag4VM/YVCe//bK9KUzXMwg7g8uDT6pxdy285cl0eXZLOf98ZlL/XWtf6E?=
 =?us-ascii?Q?l0PcBuY1mclHgDgzQdnbMXIPvpycdluKBxFJMqTHOa4PNnku/5G5rYfQs1dC?=
 =?us-ascii?Q?BAGrg1YLEhA0EsBF9WayR2Mc1R7xKmjb39L9E9YVE4pW5t6lyiRuDneOQyEn?=
 =?us-ascii?Q?z+Lh8v8mdZ6QYEr99ZuV8akh5oxqdvKWcQdr3tNQ3zrrDNPHtJ0O7dE2hOvh?=
 =?us-ascii?Q?YAFbhaKijd8Rdbe+JFiPnlc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5754c1b-e602-40cd-3ecf-08db8c612916
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 16:15:13.3307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JHgqvmsBA1YGgWcCl3upgMQbsEXS5eHwo9+UGy72e6/R5ct/4OG1X3bqmMAP62sYNEAYid83f+5VRfdF6RWJ9GcakM4eH+U6hAyDU9RmootkMw5gPO5RqyR4WGyUBpw7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5628
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V6 6/6] drm/xe: Add min/max cap for engine
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

On Mon, Jul 24, 2023 at 03:17:33PM +0530, Tejas Upadhyay wrote:
>Add sysfs entries for the min, max, and defaults for each of
>engine scheduler controls for every hardware engine class.
>
>Non-elevated user IOCTLs to set these controls must be within
>the min-max ranges of the sysfs entries, elevated user can set
>these controls to any value. However, introduced compile time
>CONFIG min-max values which restricts elevated user to be in
>compile time min-max range if at all sysfs min/max are violated.
>
>Sysfs entries examples are,
>DUT# cat /sys/class/drm/cardX/device/tileN/gtN/engines/ccs/.defaults/
>job_timeout_max         job_timeout_ms          preempt_timeout_min     timeslice_duration_max  timeslice_duration_us
>job_timeout_min         preempt_timeout_max     preempt_timeout_us      timeslice_duration_min
>
>DUT# cat /sys/class/drm/card1/device/tileN/gtN/engines/ccs/
>.defaults/              job_timeout_min         preempt_timeout_max     preempt_timeout_us      timeslice_duration_min
>job_timeout_max         job_timeout_ms          preempt_timeout_min     timeslice_duration_max  timeslice_duration_us
>
>V6 :
>   - Rebase changes to reflect per engine class props interface - MattB
>   - Use #if ENABLED - MattB
>   - Remove MAX_SCHED_TIMEOUT check as range validation is enough
>V5 :
>   - Rebase to resolve conflicts - CI
>V4 :
>   - Rebase
>   - Update commit to reflect tile addition
>   - Use XE_HW macro directly as they are already filtered
>     for CONFIG checks - Niranjana
>   - Add CONFIG for enable/disable min/max limitation
>     on elevated user. Default is enable - Matt/Joonas
>V3 :
>   - Resolve CI hooks warning for kernel-doc
>V2 :
>   - Restric min/max setting to #define default min/max for
>     elevated user - Himal
>   - Remove unrelated changes from patch - Niranjana
>
>Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>---
> drivers/gpu/drm/xe/Kconfig                 |   6 +
> drivers/gpu/drm/xe/Kconfig.profile         |  46 +++
> drivers/gpu/drm/xe/xe_engine.c             |  40 ++-
> drivers/gpu/drm/xe/xe_engine_class_sysfs.c | 381 ++++++++++++++++++++-
> drivers/gpu/drm/xe/xe_engine_class_sysfs.h |   1 +
> drivers/gpu/drm/xe/xe_hw_engine.c          |   8 +
> drivers/gpu/drm/xe/xe_hw_engine.h          |  31 ++
> 7 files changed, 507 insertions(+), 6 deletions(-)
> create mode 100644 drivers/gpu/drm/xe/Kconfig.profile
>
>diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>index d44794f99338..0a4ea965645b 100644
>--- a/drivers/gpu/drm/xe/Kconfig
>+++ b/drivers/gpu/drm/xe/Kconfig
>@@ -83,3 +83,9 @@ depends on DRM_XE
> depends on EXPERT
> source "drivers/gpu/drm/xe/Kconfig.debug"
> endmenu
>+
>+menu "drm/xe Profile Guided Optimisation"
>+	visible if EXPERT
>+	depends on DRM_XE
>+	source "drivers/gpu/drm/xe/Kconfig.profile"
>+endmenu
>diff --git a/drivers/gpu/drm/xe/Kconfig.profile b/drivers/gpu/drm/xe/Kconfig.profile
>new file mode 100644
>index 000000000000..e72f15ec4bf6
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/Kconfig.profile
>@@ -0,0 +1,46 @@
>+config DRM_XE_JOB_TIMEOUT_MAX
>+       int "Default max job timeout (ms)"
>+       default 10000 # milliseconds
>+       help
>+         Configures the default max job timeout after which job will
>+         be forcefully taken away from scheduler.
>+config DRM_XE_JOB_TIMEOUT_MIN
>+       int "Default max job timeout (ms)"
>+       default 1 # milliseconds
>+       help
>+         Configures the default min job timeout after which job will
>+         be forcefully taken away from scheduler.
>+config DRM_XE_TIMESLICE_MAX
>+       int "Default max timeslice duration (us)"
>+       default 10000000 # microseconds
>+       help
>+         Configures the default max timeslice duration between multiple
>+         contexts by guc scheduling.
>+config DRM_XE_TIMESLICE_MIN
>+       int "Default min timeslice duration (us)"
>+       default 1 # microseconds
>+       help
>+         Configures the default min timeslice duration between multiple
>+         contexts by guc scheduling.
>+config DRM_XE_PREEMPT_TIMEOUT_MAX
>+       int "Default max  preempt timeout (us)"
>+       default 10000000 # microseconds
>+       help
>+         Configures the default max preempt timeout after which context
>+         will be forcefully taken away and higher priority context will
>+         run.
>+config DRM_XE_PREEMPT_TIMEOUT_MIN
>+       int "Default min  preempt timeout (us)"
>+       default 1 # microseconds
>+       help
>+         Configures the default min preempt timeout after which context
>+         will be forcefully taken away and higher priority context will
>+         run.
>+config DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
>+       bool "Default configuration of limitation on scheduler timeout"
>+       default y
>+       help
>+	 Configures the enablement of limitation on scheduler timeout
>+	 to apply to applicable user. For elevated user, all above MIN
>+	 and MAX values will apply when this configuration is enable to
>+	 apply limitation. By default limitation is applied.
>diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
>index 19a7a05bbbc3..7efc3a239f4f 100644
>--- a/drivers/gpu/drm/xe/xe_engine.c
>+++ b/drivers/gpu/drm/xe/xe_engine.c
>@@ -12,6 +12,7 @@
> #include <drm/xe_drm.h>
>
> #include "xe_device.h"
>+#include "xe_engine_class_sysfs.h"
> #include "xe_gt.h"
> #include "xe_hw_fence.h"
> #include "xe_lrc.h"
>@@ -191,9 +192,20 @@ static int engine_set_priority(struct xe_device *xe, struct xe_engine *e,
> static int engine_set_timeslice(struct xe_device *xe, struct xe_engine *e,
> 				u64 value, bool create)
> {
>-	if (!capable(CAP_SYS_NICE))
>+	if (!capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(value,
>+				     e->hwe->eclass->sched_props.timeslice_min,
>+				     e->hwe->eclass->sched_props.timeslice_max))
> 		return -EPERM;
>
>+#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
>+	if (capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(value,
>+				     XE_HW_ENGINE_TIMESLICE_MIN,
>+				     XE_HW_ENGINE_TIMESLICE_MAX))
>+		return -EPERM;

Hmm...probably -EINVAL is the right error code here?

>+#endif
>+
> 	return e->ops->set_timeslice(e, value);
> }
>
>@@ -201,8 +213,19 @@ static int engine_set_preemption_timeout(struct xe_device *xe,
> 					 struct xe_engine *e, u64 value,
> 					 bool create)
> {
>-	if (!capable(CAP_SYS_NICE))
>+	if (!capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(value,
>+				     e->hwe->eclass->sched_props.preempt_timeout_min,
>+				     e->hwe->eclass->sched_props.preempt_timeout_max))
>+		return -EPERM;
>+
>+#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
>+	if (capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(value,
>+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
>+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
> 		return -EPERM;
>+#endif
>
> 	return e->ops->set_preempt_timeout(e, value);
> }
>@@ -269,8 +292,19 @@ static int engine_set_job_timeout(struct xe_device *xe, struct xe_engine *e,
> 	if (XE_IOCTL_DBG(xe, !create))
> 		return -EINVAL;
>
>-	if (!capable(CAP_SYS_NICE))
>+	if (!capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(value,
>+				     e->hwe->eclass->sched_props.job_timeout_min,
>+				     e->hwe->eclass->sched_props.job_timeout_max))
>+		return -EPERM;
>+
>+#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
>+	if (capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(value,
>+				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
>+				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
> 		return -EPERM;
>+#endif
>
> 	return e->ops->set_job_timeout(e, value);
> }
>diff --git a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
>index 8e0021cdb10d..3dc9922cb3c4 100644
>--- a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
>+++ b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
>@@ -11,6 +11,11 @@
>
> static int xe_add_engine_class_defaults(struct kobject *parent);
>
>+bool engine_timeout_in_range(u64 timeout, u64 min, u64 max)
>+{
>+	return timeout >= min && timeout <= max;
>+}
>+
> static void kobj_xe_engine_release(struct kobject *kobj)
> {
> 	kfree(kobj);
>@@ -39,6 +44,90 @@ kobj_xe_engine(struct kobject *parent, char *name)
> 	return khwe;
> }
>
>+static ssize_t job_timeout_max_store(struct kobject *kobj,
>+				     struct kobj_attribute *attr,
>+				     const char *buf, size_t count)
>+{
>+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
>+	u32 timeout;
>+	int err;
>+
>+	err = kstrtou32(buf, 0, &timeout);
>+	if (err)
>+		return err;
>+
>+	if (!capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(timeout,
>+				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
>+				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
>+		return -EINVAL;
>+
>+#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
>+	if (capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(timeout,
>+				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
>+				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
>+		return -EINVAL;
>+#endif
>+

NIT...here and in other places, would below format be better?

static bool enforce_schedule_limit()
{
#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
      return true;
#else
      return !capable(CAP_SYS_NICE);
#endif
}

      if (enforce_schedule_limit() &&
          !engine_timeout_in_range(timeout,
                                   XE_HW_ENGINE_JOB_TIMEOUT_MIN,
                                   XE_HW_ENGINE_JOB_TIMEOUT_MAX))
           return -EINVAL;

Avoids some code duplication.

>+	WRITE_ONCE(hwe->eclass->sched_props.job_timeout_max, timeout);
>+
>+	return count;
>+}
>+
>+static ssize_t job_timeout_max_show(struct kobject *kobj,
>+				    struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
>+
>+	return sprintf(buf, "%u\n", hwe->eclass->sched_props.job_timeout_max);
>+}
>+
>+static struct kobj_attribute job_timeout_max_attr =
>+__ATTR(job_timeout_max, 0644, job_timeout_max_show, job_timeout_max_store);
>+
>+static ssize_t job_timeout_min_store(struct kobject *kobj,
>+				     struct kobj_attribute *attr,
>+				     const char *buf, size_t count)
>+{
>+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
>+	u32 timeout;
>+	int err;
>+
>+	err = kstrtou32(buf, 0, &timeout);
>+	if (err)
>+		return err;
>+
>+	if (!capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(timeout,
>+				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
>+				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
>+		return -EINVAL;
>+
>+#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
>+	if (capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(timeout,
>+				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
>+				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
>+		return -EINVAL;
>+#endif
>+
>+	WRITE_ONCE(hwe->eclass->sched_props.job_timeout_min, timeout);
>+

How are we ensuring job_timeout_max > job_timeout_min?
Or, we simply allow it as the range check will fail during actual
sched_prop setting?

Niranjana

>+	return count;
>+}
>+
>+static ssize_t job_timeout_min_show(struct kobject *kobj,
>+				    struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
>+
>+	return sprintf(buf, "%u\n", hwe->eclass->sched_props.job_timeout_min);
>+}
>+
>+static struct kobj_attribute job_timeout_min_attr =
>+__ATTR(job_timeout_min, 0644, job_timeout_min_show, job_timeout_min_store);
>+
> static ssize_t job_timeout_store(struct kobject *kobj,
> 				 struct kobj_attribute *attr,
> 				 const char *buf, size_t count)
>@@ -51,8 +140,19 @@ static ssize_t job_timeout_store(struct kobject *kobj,
> 	if (err)
> 		return err;
>
>-	if (timeout > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
>+	if (!capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(timeout,
>+				     hwe->eclass->sched_props.job_timeout_min,
>+				     hwe->eclass->sched_props.job_timeout_max))
>+		return -EINVAL;
>+
>+#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
>+	if (capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(timeout,
>+				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
>+				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
> 		return -EINVAL;
>+#endif
>
> 	WRITE_ONCE(hwe->eclass->sched_props.job_timeout_ms, timeout);
>
>@@ -81,6 +181,28 @@ static ssize_t job_timeout_default(struct kobject *kobj,
> static struct kobj_attribute job_timeout_def =
> __ATTR(job_timeout_ms, 0444, job_timeout_default, NULL);
>
>+static ssize_t job_timeout_min_default(struct kobject *kobj,
>+				       struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);
>+
>+	return sprintf(buf, "%u\n", hwe->eclass->defaults.job_timeout_min);
>+}
>+
>+static struct kobj_attribute job_timeout_min_def =
>+__ATTR(job_timeout_min, 0444, job_timeout_min_default, NULL);
>+
>+static ssize_t job_timeout_max_default(struct kobject *kobj,
>+				       struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);
>+
>+	return sprintf(buf, "%u\n", hwe->eclass->defaults.job_timeout_max);
>+}
>+
>+static struct kobj_attribute job_timeout_max_def =
>+__ATTR(job_timeout_max, 0444, job_timeout_max_default, NULL);
>+
> static ssize_t timeslice_duration_store(struct kobject *kobj,
> 					struct kobj_attribute *attr,
> 					const char *buf, size_t count)
>@@ -93,14 +215,112 @@ static ssize_t timeslice_duration_store(struct kobject *kobj,
> 	if (err)
> 		return err;
>
>-	if (duration > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
>+	if (!capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(duration,
>+				     hwe->eclass->sched_props.timeslice_min,
>+				     hwe->eclass->sched_props.timeslice_max))
> 		return -EINVAL;
>
>+#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
>+	if (capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(duration,
>+				     XE_HW_ENGINE_TIMESLICE_MIN,
>+				     XE_HW_ENGINE_TIMESLICE_MAX))
>+		return -EINVAL;
>+#endif
>+
> 	WRITE_ONCE(hwe->eclass->sched_props.timeslice_us, duration);
>
> 	return count;
> }
>
>+static ssize_t timeslice_duration_max_store(struct kobject *kobj,
>+					    struct kobj_attribute *attr,
>+					    const char *buf, size_t count)
>+{
>+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
>+	u32 duration;
>+	int err;
>+
>+	err = kstrtou32(buf, 0, &duration);
>+	if (err)
>+		return err;
>+
>+	if (!capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(duration,
>+				     XE_HW_ENGINE_TIMESLICE_MIN,
>+				     XE_HW_ENGINE_TIMESLICE_MAX))
>+		return -EINVAL;
>+
>+#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
>+	if (capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(duration,
>+				     XE_HW_ENGINE_TIMESLICE_MIN,
>+				     XE_HW_ENGINE_TIMESLICE_MAX))
>+		return -EINVAL;
>+#endif
>+
>+	WRITE_ONCE(hwe->eclass->sched_props.timeslice_max, duration);
>+
>+	return count;
>+}
>+
>+static ssize_t timeslice_duration_max_show(struct kobject *kobj,
>+		struct kobj_attribute *attr,
>+		char *buf)
>+{
>+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
>+
>+	return sprintf(buf, "%u\n", hwe->eclass->sched_props.timeslice_max);
>+}
>+
>+static struct kobj_attribute timeslice_duration_max_attr =
>+	__ATTR(timeslice_duration_max, 0644, timeslice_duration_max_show,
>+	       timeslice_duration_max_store);
>+
>+static ssize_t timeslice_duration_min_store(struct kobject *kobj,
>+					    struct kobj_attribute *attr,
>+					    const char *buf, size_t count)
>+{
>+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
>+	u32 duration;
>+	int err;
>+
>+	err = kstrtou32(buf, 0, &duration);
>+	if (err)
>+		return err;
>+
>+	if (!capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(duration,
>+				     XE_HW_ENGINE_TIMESLICE_MIN,
>+				     XE_HW_ENGINE_TIMESLICE_MAX))
>+		return -EINVAL;
>+
>+#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
>+	if (capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(duration,
>+				     XE_HW_ENGINE_TIMESLICE_MIN,
>+				     XE_HW_ENGINE_TIMESLICE_MAX))
>+		return -EINVAL;
>+#endif
>+
>+	WRITE_ONCE(hwe->eclass->sched_props.timeslice_min, duration);
>+
>+	return count;
>+}
>+
>+static ssize_t timeslice_duration_min_show(struct kobject *kobj,
>+					   struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
>+
>+	return sprintf(buf, "%u\n", hwe->eclass->sched_props.timeslice_min);
>+}
>+
>+static struct kobj_attribute timeslice_duration_min_attr =
>+	__ATTR(timeslice_duration_min, 0644, timeslice_duration_min_show,
>+	       timeslice_duration_min_store);
>+
> static ssize_t timeslice_duration_show(struct kobject *kobj,
> 		struct kobj_attribute *attr, char *buf)
> {
>@@ -124,6 +344,28 @@ static ssize_t timeslice_default(struct kobject *kobj,
> static struct kobj_attribute timeslice_duration_def =
> __ATTR(timeslice_duration_us, 0444, timeslice_default, NULL);
>
>+static ssize_t timeslice_min_default(struct kobject *kobj,
>+				     struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);
>+
>+	return sprintf(buf, "%u\n", hwe->eclass->defaults.timeslice_min);
>+}
>+
>+static struct kobj_attribute timeslice_duration_min_def =
>+__ATTR(timeslice_duration_min, 0444, timeslice_min_default, NULL);
>+
>+static ssize_t timeslice_max_default(struct kobject *kobj,
>+				     struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);
>+
>+	return sprintf(buf, "%u\n", hwe->eclass->defaults.timeslice_max);
>+}
>+
>+static struct kobj_attribute timeslice_duration_max_def =
>+__ATTR(timeslice_duration_max, 0444, timeslice_max_default, NULL);
>+
> static ssize_t preempt_timeout_store(struct kobject *kobj,
> 				     struct kobj_attribute *attr,
> 				     const char *buf, size_t count)
>@@ -136,8 +378,19 @@ static ssize_t preempt_timeout_store(struct kobject *kobj,
> 	if (err)
> 		return err;
>
>-	if (timeout > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
>+	if (!capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(timeout,
>+				     hwe->eclass->sched_props.preempt_timeout_min,
>+				     hwe->eclass->sched_props.preempt_timeout_max))
>+		return -EINVAL;
>+
>+#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
>+	if (capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(timeout,
>+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
>+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
> 		return -EINVAL;
>+#endif
>
> 	WRITE_ONCE(hwe->eclass->sched_props.preempt_timeout_us, timeout);
>
>@@ -167,17 +420,139 @@ static ssize_t preempt_timeout_default(struct kobject *kobj,
> static struct kobj_attribute preempt_timeout_def =
> __ATTR(preempt_timeout_us, 0444, preempt_timeout_default, NULL);
>
>+static ssize_t preempt_timeout_min_default(struct kobject *kobj,
>+					   struct kobj_attribute *attr,
>+					   char *buf)
>+{
>+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);
>+
>+	return sprintf(buf, "%u\n", hwe->eclass->defaults.preempt_timeout_min);
>+}
>+
>+static struct kobj_attribute preempt_timeout_min_def =
>+__ATTR(preempt_timeout_min, 0444, preempt_timeout_min_default, NULL);
>+
>+static ssize_t preempt_timeout_max_default(struct kobject *kobj,
>+					   struct kobj_attribute *attr,
>+					   char *buf)
>+{
>+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);
>+
>+	return sprintf(buf, "%u\n", hwe->eclass->defaults.preempt_timeout_max);
>+}
>+
>+static struct kobj_attribute preempt_timeout_max_def =
>+__ATTR(preempt_timeout_max, 0444, preempt_timeout_max_default, NULL);
>+
>+static ssize_t preempt_timeout_max_store(struct kobject *kobj,
>+					 struct kobj_attribute *attr,
>+					 const char *buf, size_t count)
>+{
>+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
>+	u32 timeout;
>+	int err;
>+
>+	err = kstrtou32(buf, 0, &timeout);
>+	if (err)
>+		return err;
>+
>+	if (!capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(timeout,
>+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
>+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
>+		return -EINVAL;
>+
>+#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
>+	if (capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(timeout,
>+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
>+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
>+		return -EINVAL;
>+#endif
>+
>+	WRITE_ONCE(hwe->eclass->sched_props.preempt_timeout_max, timeout);
>+
>+	return count;
>+}
>+
>+static ssize_t preempt_timeout_max_show(struct kobject *kobj,
>+					struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
>+
>+	return sprintf(buf, "%u\n", hwe->eclass->sched_props.preempt_timeout_max);
>+}
>+
>+static struct kobj_attribute preempt_timeout_max_attr =
>+	__ATTR(preempt_timeout_max, 0644, preempt_timeout_max_show,
>+	       preempt_timeout_max_store);
>+
>+static ssize_t preempt_timeout_min_store(struct kobject *kobj,
>+					 struct kobj_attribute *attr,
>+					 const char *buf, size_t count)
>+{
>+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
>+	u32 timeout;
>+	int err;
>+
>+	err = kstrtou32(buf, 0, &timeout);
>+	if (err)
>+		return err;
>+
>+	if (!capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(timeout,
>+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
>+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
>+		return -EINVAL;
>+
>+#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
>+	if (capable(CAP_SYS_NICE) &&
>+	    !engine_timeout_in_range(timeout,
>+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
>+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
>+		return -EINVAL;
>+#endif
>+
>+	WRITE_ONCE(hwe->eclass->sched_props.preempt_timeout_min, timeout);
>+
>+	return count;
>+}
>+
>+static ssize_t preempt_timeout_min_show(struct kobject *kobj,
>+					struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
>+
>+	return sprintf(buf, "%u\n", hwe->eclass->sched_props.preempt_timeout_min);
>+}
>+
>+static struct kobj_attribute preempt_timeout_min_attr =
>+	__ATTR(preempt_timeout_min, 0644, preempt_timeout_min_show,
>+	       preempt_timeout_min_store);
>+
> static const struct attribute *defaults[] = {
> 	&job_timeout_def.attr,
>+	&job_timeout_min_def.attr,
>+	&job_timeout_max_def.attr,
> 	&timeslice_duration_def.attr,
>+	&timeslice_duration_min_def.attr,
>+	&timeslice_duration_max_def.attr,
> 	&preempt_timeout_def.attr,
>+	&preempt_timeout_min_def.attr,
>+	&preempt_timeout_max_def.attr,
> 	NULL
> };
>
> static const struct attribute *files[] = {
> 	&job_timeout_attr.attr,
>+	&job_timeout_min_attr.attr,
>+	&job_timeout_max_attr.attr,
> 	&timeslice_duration_attr.attr,
>+	&timeslice_duration_min_attr.attr,
>+	&timeslice_duration_max_attr.attr,
> 	&preempt_timeout_attr.attr,
>+	&preempt_timeout_min_attr.attr,
>+	&preempt_timeout_max_attr.attr,
> 	NULL
> };
>
>diff --git a/drivers/gpu/drm/xe/xe_engine_class_sysfs.h b/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
>index 492a84a22c30..7b4ae8b726a3 100644
>--- a/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
>+++ b/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
>@@ -10,6 +10,7 @@
>
> #define MAX_ENGINE_CLASS_NAME_LEN    16
> int xe_engine_class_sysfs_init(struct xe_gt *gt);
>+bool engine_timeout_in_range(u64 timeout, u64 min, u64 max);
>
> /**
>  * struct kobj_hwe - A hwe's kobject struct that connects the kobject and the
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>index 96c32a815c90..06a98ea9800b 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>@@ -364,8 +364,16 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>
> 	if (!gt->eclass[hwe->class].init_done) {
> 		gt->eclass[hwe->class].sched_props.job_timeout_ms = HZ * 5;
>+		gt->eclass[hwe->class].sched_props.job_timeout_min = XE_HW_ENGINE_JOB_TIMEOUT_MIN;
>+		gt->eclass[hwe->class].sched_props.job_timeout_max = XE_HW_ENGINE_JOB_TIMEOUT_MAX;
> 		gt->eclass[hwe->class].sched_props.timeslice_us = 1 * 1000;
>+		gt->eclass[hwe->class].sched_props.timeslice_min = XE_HW_ENGINE_TIMESLICE_MIN;
>+		gt->eclass[hwe->class].sched_props.timeslice_max = XE_HW_ENGINE_TIMESLICE_MAX;
> 		gt->eclass[hwe->class].sched_props.preempt_timeout_us = 640 * 1000;
>+		gt->eclass[hwe->class].sched_props.preempt_timeout_min =
>+								XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
>+		gt->eclass[hwe->class].sched_props.preempt_timeout_max =
>+								XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
> 		/* Record default props */
> 		gt->eclass[hwe->class].defaults = gt->eclass[hwe->class].sched_props;
> 		gt->eclass[hwe->class].init_done = true;
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
>index 7eca9d53c7b1..3d37d6d44261 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.h
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
>@@ -10,6 +10,37 @@
>
> struct drm_printer;
>
>+#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN
>+#define XE_HW_ENGINE_JOB_TIMEOUT_MIN CONFIG_DRM_XE_JOB_TIMEOUT_MIN
>+#else
>+#define XE_HW_ENGINE_JOB_TIMEOUT_MIN 1
>+#endif
>+#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MAX
>+#define XE_HW_ENGINE_JOB_TIMEOUT_MAX CONFIG_DRM_XE_JOB_TIMEOUT_MAX
>+#else
>+#define XE_HW_ENGINE_JOB_TIMEOUT_MAX (10 * 1000)
>+#endif
>+#ifdef CONFIG_DRM_XE_TIMESLICE_MIN
>+#define XE_HW_ENGINE_TIMESLICE_MIN CONFIG_DRM_XE_TIMESLICE_MIN
>+#else
>+#define XE_HW_ENGINE_TIMESLICE_MIN 1
>+#endif
>+#ifdef CONFIG_DRM_XE_TIMESLICE_MAX
>+#define XE_HW_ENGINE_TIMESLICE_MAX CONFIG_DRM_XE_TIMESLICE_MAX
>+#else
>+#define XE_HW_ENGINE_TIMESLICE_MAX (10 * 1000 * 1000)
>+#endif
>+#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
>+#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
>+#else
>+#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 1
>+#endif
>+#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
>+#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
>+#else
>+#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX (10 * 1000 * 1000)
>+#endif
>+
> int xe_hw_engines_init_early(struct xe_gt *gt);
> int xe_hw_engines_init(struct xe_gt *gt);
> void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec);
>-- 
>2.25.1
>
