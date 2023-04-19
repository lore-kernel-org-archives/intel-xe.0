Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A4A6C77B73
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 19:33:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE4110EAC6;
	Wed, 19 Apr 2023 19:33:56 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 675C410E1D4
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 19:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681932834; x=1713468834;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gZtcboH6cABD4EoMG5UDID4XWZP1cdAivcKsDtLRL/k=;
 b=Asq5euaNCitKiVnHR7w7UN6Al8C5dEL3wXukmtEuj05dxl5XLmcETn+o
 7+O0DcH/uMiAZ328emCa4lEXskUmAfyugDyFS39yJRRfcZpRLEIP4qBEy
 0sveAtuOMNKtat6RS1FF0OxKnS63n/FSkMoTZMrdcxZ1QV90gd2hlvipj
 9NkulsXOt2eagSYz3vJoi/tL306Sr63pHNg4Jw3b98doqTCp5yNDumrDu
 9rTR263HW6FwZpaLznGqb6rHHvlhXeHO0T1lf1ka4Wtj+3gwGw5yl/zQC
 LyCVlYTfN/4Vi7Oh6yoM5oJKxXONaRb1GPXpKX+ReJ1UZaeuOXWsO9nk2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="325154220"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="325154220"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 12:33:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="865955043"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="865955043"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 19 Apr 2023 12:33:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 12:33:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 12:33:53 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 12:33:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aiXGMtW/hq10vJL3JzSbw7NfDRj4IjzracCuCkmJTz7YpFx0E/vB2+msyIrwCfARXj1K40bgX6nmzguPOmsfANdknln2yDr3haWE/wBAmHC0UP9fVV7YUSljq6dSa3K90jm+Ym36+WDVvtm5V5mHbhiLKOlGUKnJvXI6dHDo81nvU+VeDpuMfh0HhSoRGo360YjLlwy/kzNI8oKAZFIegs+ty9gDvSrVpCJCdWlRi33A6wsNpWARIBoIqZFE/3iclg9NYI5jtJrZNPanEUQCFIFpUv5tn8R2vFmDQn5Ty7XH5NuGc9VdugFNWqhJ9ouwZY6UNIOI17+MvzfWAga8IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ma7tb0P3wLe2HnHh4VDPP89Ftpt3XMdosgnT43myKHw=;
 b=mA+twSqH3ocPsVY2ekWzpRVjmmSlDo/KvUyI8qfCadLu0I3afmZhocFPCfiAgiu61y8xUV+Nh+RIfQiS2bBCY1l79g20fHuaX+E5aRLvEqoo4xd5tjOcXXwtIpZJSNhutDJiK8O6CY8SWV9aLnah2dZ2hUqiRUOfzkCA0CuX+bY8yKp7Wd/P81/B49GSimREk9ulaxAbztSnurwteDV1eD9uIHOEYEIYDjpqboiG1lhUVTtnJxV8qCiP/0qqyOArq3pyMl0i+7lwtGbWjXEAPrYRyoI3Zga7RO5QHPYNJAZbH4HAOt4fB2nlZN1dWwAQnBkz4Q4HN8+mMTTTSuNLyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB7019.namprd11.prod.outlook.com (2603:10b6:806:2ae::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Wed, 19 Apr
 2023 19:33:51 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%5]) with mapi id 15.20.6298.030; Wed, 19 Apr 2023
 19:33:50 +0000
Date: Wed, 19 Apr 2023 15:33:45 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <ZEBCGWMjfgsj/v0m@intel.com>
References: <20230419123947.543175-1-jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230419123947.543175-1-jani.nikula@intel.com>
X-ClientProxiedBy: BYAPR05CA0068.namprd05.prod.outlook.com
 (2603:10b6:a03:74::45) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB7019:EE_
X-MS-Office365-Filtering-Correlation-Id: 2815d6b9-99f0-4556-9baa-08db410d00a8
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pfs7Tkp0gHiNC2e2eyz8H8QXB6+wcBtdbbCotqXDwYO5PA3NRdyCo1xSSv8wJNR8xhfpOgA9mUN+CXdfoOIKilzWNkhRoLO69EdVlVMzAFDtO6cOZIqvbrJj1U5GJ2L1Uk+/WHsChx6PW1W4OsDmdZs0ntUK4sgDu/WGCkoXA774OqPYBqN9scLr7LcpFjgT4ZBZMhRlMu63l06D7iONbVJTruwjCjLqr537FRhzZoqaxG6P9uUqJp9jSfXP4DMVyiuxnLx9FcY3eq5c9UzPe26v/rAF3kiGeVid/a7r3/2OsTErMXf1fa1fyhYo1/BVYIiSEiZcI/vIjGN1PERbfV970JIWJy+Hgz+6BKYmnWY1y+QAoqOrBP5YiFZ5NDyDi1FYfhpUTtYDNp+P7kJPE2HayoeHRDnWz76tT8zsnI9lOvL+14TxZgOkPFk0pAai5BeirK7VrnJ449J9m38TEq+mMRfo8QzvxqM6bBi45qYS1tH64X0she7lC3CiFIirSKiRhPOVW5+hogmUeBRlGkow6CbKlWTb+gxsl1LwcD1FJIejksv8221OeuVvsykC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(136003)(396003)(366004)(39860400002)(451199021)(8936002)(83380400001)(2616005)(6506007)(37006003)(6666004)(82960400001)(6636002)(26005)(478600001)(6486002)(6512007)(186003)(44832011)(2906002)(38100700002)(36756003)(5660300002)(66946007)(316002)(66556008)(86362001)(4326008)(41300700001)(66476007)(8676002)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U7xFLYUi3PFiDJ0QK/0ZEaYm1YKr/d6JQxPHqCmDPlJ0Ntei2PzWnM9PpKRS?=
 =?us-ascii?Q?rR6vYwxh0zW00+C5eozyxWQb1LItzBkReLjqABXszaaPlH64B0qklsDdPNFD?=
 =?us-ascii?Q?GEFnml0gWlgueYor6IpYinEVvcOFzCPIyZaL27l/qbQYX3cLACJPM1YcEJ5D?=
 =?us-ascii?Q?qrXr10BaDgund1N6UKLSAXUL0RDS1hM36Lshq2eJRcjsZYbkiWUFRjiZUv4H?=
 =?us-ascii?Q?OY+kvFzlbx2+i77LgG/YXD03/7cvd9d0gOwc9A0JkwmMRNSFvFKrkM5TQNfS?=
 =?us-ascii?Q?RnrZDuEBoXHn8bNyfy+TSbnhNhxxVvQdmlS1KQ3GXHC4g1uHR6KJCK+UV7MN?=
 =?us-ascii?Q?59qCei39udN1DkqDzCqUU7WjcnoCRqDiW14Gc8QUOh7QUQeTsot9tSNtCK2U?=
 =?us-ascii?Q?PKquYf3YbmUBc7zdSGEEMMFbvO+jqJhSWgvcjQ0fQWUsZNbqkjUpihPCqpAe?=
 =?us-ascii?Q?JO5jvJwnyjeMBrRh3DJVE8gzb6qJhpyE1+XDDA9Cz/Xjxa8PB3LcblDH29T8?=
 =?us-ascii?Q?6wn1gQVtB+/mukLVFMvJSFN+G62iWaZbxGUQOrlEdp6NiVSJMZlznBXZtdqL?=
 =?us-ascii?Q?t8OEE5tx2yp1mvwraFmHNJuQPybQFjk1DyF57mvyGfhqq4G0rZGQ18m4WOH9?=
 =?us-ascii?Q?F9xze1U8miSp2W1SE1iZ2jQocnqBhgzW7ZeOkt+T7WNoC1l0iUR5QC7xxcfa?=
 =?us-ascii?Q?g2cRRAi1rk2RCG0mmPJPIE+3jIBWsLbDEINhAL9NfCZBG/M7I+6rOcuH2Gfc?=
 =?us-ascii?Q?OaSUbADtqgK4fMYmSfg5ssCoCbM9/RwrkNsSsGheQRiUftcP24a594e/+12g?=
 =?us-ascii?Q?GrAwCOelOwuPMdfNraGEWuoY5744XhS+rc85Aum4AcWS1hwr/NqMrDQYR5F0?=
 =?us-ascii?Q?q56/nsf8DNFfFVYdAWhlbtt8KuCkVkOhI3PLQOEcHyzrL7y3IN9tEquOnDwj?=
 =?us-ascii?Q?ja1SkJX256c7EAvo5IqLY9OlnKIcgUzuHFUOFa3cfxhSo9wYsuMp5FtAzJkR?=
 =?us-ascii?Q?LofuG7+LahCqMcIqrlIY23h6M9VNDiSqJzWuAYLDDGIWt74vuOhAdYAmbgVG?=
 =?us-ascii?Q?CtOrUVKT/2VWEe5lmMIZD6SCfrR+1l8nzzekAJ1Zeg99gTM3rdIgfGC9MFMc?=
 =?us-ascii?Q?lTMDAnaSkxnJU28r9BFE7Kn90rn71eM8A9S0YoVNox4CmpLyQxIr5v9MQDBg?=
 =?us-ascii?Q?u/mGcS98UE4nDMYw/7cD9nUN0Nf/yR7GqhJcwyjl8KOhdYQ3ZiuZojWgGYAI?=
 =?us-ascii?Q?gw45OqxEuKQEMhx6RhtZeK/2C22R6y9w7obgvhSpxWU5CrUd2MsSsX5J8Ecz?=
 =?us-ascii?Q?HXrV7n8CBoypFBGBFCl0iWdGXIC7mvZgXCnzykmV+v9OipseRAJnn3kwNKls?=
 =?us-ascii?Q?EqJWJBZ1CRwrPoz58BVX3FIgwH4XF3Mc6uxvQU+PLfdFiVQUpnTwJfEqdI/q?=
 =?us-ascii?Q?0Iw2urCy57GJdTbIAsGq4FtGNTjvvuxPUiGSlOijSo24jA8L4wZRIOG7/WBP?=
 =?us-ascii?Q?19GDnAqDlfQmNmgxebkJRjLnjRMoPvCU2hrQFhoY5lORhqx1YEmlGxDzK8/Q?=
 =?us-ascii?Q?A5pKqyFK29OBvenudaSQ4U3E9qqGnqbJ00HVZ6XK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2815d6b9-99f0-4556-9baa-08db410d00a8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 19:33:50.7361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1DnqbBg3dEeqiYy6jk35MkwJkZsgIKdlHi6TwHmBOiMVYfsiBHZvi9Iur/iot25fUJPGmfUyBwh0E2OlwccLHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7019
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/9] xe & i915 display integration cleanups
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
Cc: lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Apr 19, 2023 at 03:39:38PM +0300, Jani Nikula wrote:
> Change the way i915 display gets built for xe. Additional cleanups and
> backports on top to make future changes simpler.

Everything looks clean to me. Let's push this.

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

I was going to do a local rebase --autosquash, but I will wait
this to land.

> 
> Jani Nikula (9):
>   fixup! drm/xe/display: Implement display support
>   drm/i915/wm: remove stale and unused ilk_wm_max_level() declaration
>   drm/i915/display: add I915 conditional build to i9xx_wm.h
>   fixup! drm/xe/display: Implement display support
>   drm/i915: rename intel_pm.[ch] to intel_clock_gating.[ch]
>   fixup! drm/xe/display: Implement display support
>   drm/i915: use explicit includes for i915_reg.h and i915_irq.h
>   fixup! drm/xe/display: Implement display support
>   fixup! drm/i915/display: Remaining changes to make xe compile
> 
>  drivers/gpu/drm/i915/Makefile                 |   2 +-
>  drivers/gpu/drm/i915/display/i9xx_wm.c        |   1 +
>  drivers/gpu/drm/i915/display/i9xx_wm.h        |  18 +-
>  drivers/gpu/drm/i915/display/intel_display.c  |   4 +-
>  .../drm/i915/display/intel_display_power.c    |   1 +
>  .../i915/display/intel_display_power_well.c   |   1 +
>  .../drm/i915/display/intel_display_reg_defs.h |   4 -
>  .../drm/i915/display/intel_display_trace.h    |   1 -
>  drivers/gpu/drm/i915/display/intel_fbc.c      |   1 +
>  .../drm/i915/display/intel_fifo_underrun.c    |   2 +
>  drivers/gpu/drm/i915/gt/intel_gt_irq.c        |   1 +
>  drivers/gpu/drm/i915/gt/intel_reset.c         |   1 +
>  drivers/gpu/drm/i915/gt/intel_rps.c           |   1 +
>  drivers/gpu/drm/i915/gt/selftest_rps.c        |   1 +
>  drivers/gpu/drm/i915/gt/uc/intel_guc.c        |   1 +
>  drivers/gpu/drm/i915/i915_debugfs.c           |   1 +
>  drivers/gpu/drm/i915/i915_driver.c            |   8 +-
>  drivers/gpu/drm/i915/i915_gem.c               |   8 +-
>  drivers/gpu/drm/i915/i915_irq.c               |   1 +
>  drivers/gpu/drm/i915/i915_irq.h               |   2 +-
>  .../i915/{intel_pm.c => intel_clock_gating.c} |   9 +-
>  drivers/gpu/drm/i915/intel_clock_gating.h     |  14 ++
>  drivers/gpu/drm/i915/intel_pm.h               |  18 --
>  drivers/gpu/drm/i915/vlv_suspend.c            |   4 +-
>  drivers/gpu/drm/xe/Makefile                   | 170 +++++++++---------
>  .../compat-i915-headers/intel_clock_gating.h  |   1 +
>  drivers/gpu/drm/xe/display/ext/i915_irq.c     |   2 +-
>  drivers/gpu/drm/xe/display/ext/i9xx_wm.c      |  24 ---
>  drivers/gpu/drm/xe/display/ext/i9xx_wm.h      |  20 ---
>  .../ext/{intel_pm.c => intel_clock_gating.c}  |   4 +-
>  drivers/gpu/drm/xe/display/ext/intel_pm.h     |  29 ---
>  drivers/gpu/drm/xe/xe_device_types.h          |   3 +
>  drivers/gpu/drm/xe/xe_display.c               |   4 +-
>  33 files changed, 152 insertions(+), 210 deletions(-)
>  rename drivers/gpu/drm/i915/{intel_pm.c => intel_clock_gating.c} (99%)
>  create mode 100644 drivers/gpu/drm/i915/intel_clock_gating.h
>  delete mode 100644 drivers/gpu/drm/i915/intel_pm.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_clock_gating.h
>  delete mode 100644 drivers/gpu/drm/xe/display/ext/i9xx_wm.c
>  delete mode 100644 drivers/gpu/drm/xe/display/ext/i9xx_wm.h
>  rename drivers/gpu/drm/xe/display/ext/{intel_pm.c => intel_clock_gating.c} (97%)
>  delete mode 100644 drivers/gpu/drm/xe/display/ext/intel_pm.h
> 
> -- 
> 2.39.2
> 
