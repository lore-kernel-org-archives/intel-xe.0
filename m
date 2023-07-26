Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110BEC0015E
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 06:51:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF2DC10E41F;
	Wed, 26 Jul 2023 06:51:35 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C2D10E41C
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 06:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690354293; x=1721890293;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=omJaboiaPZrf5acsTAjynaip2xFR+d8zQaso1gtBrWM=;
 b=QnJyDPhaS470yKQP8i4OPd7eOmvVw/qOh9jmRmh/d0Mzu/Ss8CODSeIQ
 aikvshM0qYSZsRrobYN+vpS/UxQYZeQzw1hD7ZnLfVfbQ+pAQYeg9icY9
 YxQmX+KCc6b8+qKJUHNrSSi0SPfhLLP/JxA8r18XlDuUanj3DHRqAOuSb
 TGDHqMVU0I7lbDIzYaVFf9Jdth+I0SJILh8XjiuwSqzIvlbTDvRFfIhdP
 1b66N3zyBo1i2D7/9AgCl89yZmdGQH0AGPaIeKQWjpc8A2JkHJdzi/oWs
 ThZ0ICr02zTmvSDiOSt2pTYjvp52A/K4m2E7g2rBzeoSiwUCjjdarXvvv w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="357936301"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="357936301"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 23:51:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="756095095"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="756095095"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP; 25 Jul 2023 23:51:05 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 23:51:05 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 23:51:04 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 25 Jul 2023 23:51:04 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 25 Jul 2023 23:51:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XEe19IGeEAHosSGfQV1vze+Z8pl2BnznGJUBfCgvpY71khl/x5UOev2N/aa9Lc2pgdKKtfmRdGuDMekxM67O/FTFjr768eLaWKyXFoM1nB2nS54HPln16ANwaZFWcQk3q9AkjqD+14w70Rutxh0pwzuahFfXdE5QnfiIcKjjqoMTLg6zIDTHyxebAKRJk6ycho1UENhNt6iXjiXztB8PyLKk+UrxFgqiUbUz2f4wiGH9UwwqDhDISgLvv3JCn/ZQ+9xzKmXyjp43C1OQ43CcxX3K/c7islq+j1sngO/e7+XDAE4BygWX9p49cKzipUp2Ttlcg1PEu4FNmgHxT58zGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQG1sPThzYEGJzIDCx4IsnjWWKDTMvBo0kIJ27/8NjI=;
 b=BWXMPwUSFpysxrZtjivcdMlagD/fNrfQTPXHGbzYydB7n09g15ogx1V1RMLD+Yh+ee3rP1q3Yprx6I6Xs9k0h8d7BbFZ6ibJLdqKVhrzIYX6nys7tKRP5OtR9bg7MNRyCus4U69RiohSLfIHAlVR6rrTrOZkCn2r/Ww0m5E0pMho9U/YOKcksEaoQJNcFTZEvEjK0+DnzbqstMnP7Jt28OuxHZS7xtvZNH+0BO8ZAIAHynf6n/L3QYtqS3cq2AeyvwK/9DX65dTHGMCkfLc5ezUovwlDlpmz9b3IJ9dVEKmO+4x/TFukOg/qZawvCK7J9b//KwY6WoQy1kdhNEcjVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by DM4PR11MB5472.namprd11.prod.outlook.com (2603:10b6:5:39e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 06:51:01 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::fe5e:ee9:8806:c9fa]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::fe5e:ee9:8806:c9fa%7]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 06:51:01 +0000
Date: Tue, 25 Jul 2023 23:50:53 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <ZMDCTaB8883lAh9K@nvishwa1-DESK>
References: <20230725115003.785982-1-tejas.upadhyay@intel.com>
 <20230725115003.785982-7-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230725115003.785982-7-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BY5PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::13) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|DM4PR11MB5472:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f830859-adc0-40eb-fd59-08db8da4ac76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L0bRRnmKGI+T0h8v//LboWEQ8h3+WSeYHnu1vYquwWB/QbdQrYzD2Oe+QLtaG3bt75phYwtToQ6fFrtSsPyHsBYO9H4PTfKklp+pHctv8J9ygxpI5iSe+xNVkfP9gItXBNO7L3hlL0NPZACHocZIAO8c247cK7ou2OAuHHtgm6PrLagIYHvqX4DCrEALXdHk90PpSMpj4exoCDyx0+AJZXWU5cs6j4ZmQ/ATc8+i5ulzaJUEDFK/EA+SIIHlTvVUVF43bHSQMcDZM7PnyrB0E1OPS0hVAbUSxEcZcNdov68ulMtIXoTqKziKNNizx4R+IcNsMFf3S7wc6V190NDiMPNgZ+DFTyT1wC0af8Izl9su78YGSZ0xijNSkHa7N8CS1NkAU5Arl7iK62B7h0yiJIeMFMKKtCp/+zVRd5/C12CcWTUmGAlz7YM1WdfZzmY9tKSCaPhBml9+s/nZC+2y4xn7G0gWPpyC0Dtkzln+V+cAPsUhQePBX4Ac/XtQv1CyshHe7O7gacElchexCosJIBBIzHasdeEwQjV6Dv7K2Arm1a6FTidfF9FZytaNBXoI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(136003)(346002)(376002)(366004)(396003)(451199021)(86362001)(33716001)(30864003)(2906002)(44832011)(83380400001)(186003)(6506007)(107886003)(26005)(6666004)(19627235002)(478600001)(6486002)(6512007)(9686003)(38100700002)(6636002)(4326008)(66946007)(316002)(66476007)(66556008)(8676002)(8936002)(82960400001)(41300700001)(6862004)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uPETjBq67kSloOdQTOirhGVeX6ad5BZ2RqRgbwFPRwODirSR/+Sa6k/uhmqu?=
 =?us-ascii?Q?EmdorusPdaAb5uRMBgc/02RafY0ZBaTpod3r0SZdlOi9BF6am5ELc2RFKPWj?=
 =?us-ascii?Q?VFGITzfOLzxoo5nCqB/AeWGszXISWQCy579JuwjLF7MtM+Pzg2h7DxcDU2JN?=
 =?us-ascii?Q?pA1WG/wwmoYfOBWVqsHWzxkQquhY1x+rANbNOdVkvfG+EUiIL0kWyr9z/UAP?=
 =?us-ascii?Q?N0HTzVwmUu97S5TIMdZPWzrMhhH5xntaNwES27p4byD70hL3BoM9Q7PVYBe1?=
 =?us-ascii?Q?6nEg1FkGnjUeuTnc95kwClbLXPxrg3i/huIgOjafMBBQlb1J2exRYmzu89Wc?=
 =?us-ascii?Q?zuYZa1PCIqSXDsOVnnH+jG6YFi2wCweF3VOyDFEGKUb/ke4c83j06u4N/oPS?=
 =?us-ascii?Q?tMXbg7VxROyduFJpMgXO1qIs9faG9cWC8JSKE5YVBgkdDI5PJFrSXhKZ9Fsv?=
 =?us-ascii?Q?QylEhsQup9aPIxSo7ZQv0DhJYkW0UmFcVmJACPsC0jIFmtjFotE2hXEJpzHi?=
 =?us-ascii?Q?ahzBjWUUqxKdyts/hdnm8RssUa5ep+urHaa6QEMoVnlKGwYxpu0MzzpnFNDo?=
 =?us-ascii?Q?GcNH0Lh4xnJg7cC9FFCOY4TfVY7pmBcIZRUeQYWiXJUzudAOyeYpD01vs/UM?=
 =?us-ascii?Q?3Ctk0w2kB75BVhAEUvyl+XhltABZsMuaLs3fiBCCe/MuVM4VyzRoiGT4X4JA?=
 =?us-ascii?Q?j/bMaQ3iFPyvpkDZ3PcpC/4ycMUhRNt3Gk3bv0XLOF29oZZpiQ6FhGv9o30n?=
 =?us-ascii?Q?bTc/LOkrfmLcvqxqGjpBiXqz6Nj9IOxDYoYMFZixr6XLByluE2gaF5w/j3Im?=
 =?us-ascii?Q?L6jcxFMYLthtyQ2juuddbNdfOViSBFm+GIhh0mZOifw9D7sFWlnMqkq6TAkQ?=
 =?us-ascii?Q?TX+HHqOvLC2Q7X/nU3/c9qdDfQatLz1tgxeLRWbhiR71tVweWxMoXXeMtbjf?=
 =?us-ascii?Q?PIfBXcJyvicrkEjdN8k74fhA29MMvqrVHvnnXXrawux13Ic00pg+IQUL/T5b?=
 =?us-ascii?Q?ksf3lGH/N4AuOcDwuaZ44s7o2/QpYhHFgI0ogLGYe+9c0Ds2PCk0qubaN85q?=
 =?us-ascii?Q?hhp2AHTPkdvWTURZWI7DSLfmv/5U7rM6vBEL8ue6IVFgU3z9jtzkrfFskU5u?=
 =?us-ascii?Q?8DnKoJW8KaNKs0GfYT4FOCu47SQrCFk0zt3lDc95vq3U6G/AfNVwPqQ3A1my?=
 =?us-ascii?Q?PsEWFzAhrGZqfSl5EXbTKrWbusEbb2/twklApYne+uH561EVgHkyfTfAphNk?=
 =?us-ascii?Q?o++CefvoaWJdM/cUAN5zAjyOob52G9oAr7KCS9ylii7A094CAMrztjYdYwQu?=
 =?us-ascii?Q?g78nf/Zprcidx3jn0h/qHmTbS45xvEhZsPDPVZqlGFhWL0v9j4f5+7iv01HY?=
 =?us-ascii?Q?ozZxn40rEDTuhDO1pBElUPWe8Pr6unjLO9Ss18JlGt1ZwTpgbFEsLrPJmGcw?=
 =?us-ascii?Q?WSEHM1HFP0iVQF0DwekKrsOrh73phKGTJ9BWBaMGA3/DNR7q95qnaWKGROMi?=
 =?us-ascii?Q?g5uXGhtIPqkE79LAhxtTJjorJO+KkvzXYOKVoew1Jv/TWo6DfZNiUtkn9ln1?=
 =?us-ascii?Q?F+wp302breyzzyWYFMsyHOdD96ETbYn9TRYRpetwCXtZMvvKot74tc0Oxlsy?=
 =?us-ascii?Q?rk7W7N3ShiJyeimugyXLXOQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f830859-adc0-40eb-fd59-08db8da4ac76
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 06:51:01.1862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V4s/HdIc2R44n8Om9oq1ifSa7gXcX1PSKHoNSRCfh8kSg1Yow1sBvMhDFtF86F7D3Rb1IkgqhzBP7V0CjdsY7sLvq3dNG5t266/Oy8qTbcc1YzRSn/wFZPUkhZePb3vx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5472
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V7 6/6] drm/xe: Add min/max cap for engine
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

On Tue, Jul 25, 2023 at 05:20:03PM +0530, Tejas Upadhyay wrote:
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
>V7 :
>   - Rebase to replace hw engine with eclass interface
>   - return EINVAL in place of EPERM
>   - Use some APIs to avoid code duplication
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
> drivers/gpu/drm/xe/xe_engine_class_sysfs.c | 336 ++++++++++++++++++++-
> drivers/gpu/drm/xe/xe_engine_class_sysfs.h |   2 +
> drivers/gpu/drm/xe/xe_hw_engine.c          |   8 +
> drivers/gpu/drm/xe/xe_hw_engine.h          |  31 ++
> 7 files changed, 460 insertions(+), 9 deletions(-)
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
>index 19a7a05bbbc3..d516c4555ee3 100644
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
>@@ -191,8 +192,17 @@ static int engine_set_priority(struct xe_device *xe, struct xe_engine *e,
> static int engine_set_timeslice(struct xe_device *xe, struct xe_engine *e,
> 				u64 value, bool create)
> {
>-	if (!capable(CAP_SYS_NICE))
>-		return -EPERM;
>+	if (enforce_schedule_limit() &&
>+	    !engine_timeout_in_range(value,
>+				     e->hwe->eclass->sched_props.timeslice_min,
>+				     e->hwe->eclass->sched_props.timeslice_max))
>+		return -EINVAL;
>+
>+	if (enforce_schedule_limit() &&
>+	    !engine_timeout_in_range(value,
>+				     XE_HW_ENGINE_TIMESLICE_MIN,
>+				     XE_HW_ENGINE_TIMESLICE_MAX))
>+		return -EINVAL;

These checks doesn't seem correct.
For these xe_engine sched_prop setting (through xe_engine ioctls) and for the
hwe sched_prop setting (through sysfs), I think the rule should be

"Always apply sysfs limit, period. If user wants to go beyond this limit,
user must first broaden the limit and then set this sched_prop."

Using the config limit here and enforce_schedule_limit() check here seems
confusing and incorrect.

>
> 	return e->ops->set_timeslice(e, value);
> }
>@@ -201,8 +211,17 @@ static int engine_set_preemption_timeout(struct xe_device *xe,
> 					 struct xe_engine *e, u64 value,
> 					 bool create)
> {
>-	if (!capable(CAP_SYS_NICE))
>-		return -EPERM;
>+	if (enforce_schedule_limit() &&
>+	    !engine_timeout_in_range(value,
>+				     e->hwe->eclass->sched_props.preempt_timeout_min,
>+				     e->hwe->eclass->sched_props.preempt_timeout_max))
>+		return -EINVAL;
>+
>+	if (enforce_schedule_limit() &&
>+	    !engine_timeout_in_range(value,
>+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
>+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
>+		return -EINVAL;
>
> 	return e->ops->set_preempt_timeout(e, value);
> }
>@@ -269,8 +288,17 @@ static int engine_set_job_timeout(struct xe_device *xe, struct xe_engine *e,
> 	if (XE_IOCTL_DBG(xe, !create))
> 		return -EINVAL;
>
>-	if (!capable(CAP_SYS_NICE))
>-		return -EPERM;
>+	if (enforce_schedule_limit() &&
>+	    !engine_timeout_in_range(value,
>+				     e->hwe->eclass->sched_props.job_timeout_min,
>+				     e->hwe->eclass->sched_props.job_timeout_max))
>+		return -EINVAL;
>+
>+	if (enforce_schedule_limit() &&
>+	    !engine_timeout_in_range(value,
>+				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
>+				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
>+		return -EINVAL;
>
> 	return e->ops->set_job_timeout(e, value);
> }
>diff --git a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
>index 5e44b7a621d1..ccebf8248567 100644
>--- a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
>+++ b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
>@@ -11,6 +11,20 @@
>
> static int xe_add_engine_class_defaults(struct kobject *parent);
>
>+bool enforce_schedule_limit(void)
>+{
>+#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
>+	return capable(CAP_SYS_NICE);

My understanding is, for the sysfs limit (min, max) setting we need,

1. If not CAP_SYS_NICE capable, always enforce config limit.
2. If CAP_SYS_NICE capable, only apply config limit if
    CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT is defined.

If that is correct, when CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT is
defined, we always need to enforce config limit. ie., we should have
'return true;' above.

>+#else
>+	return !capable(CAP_SYS_NICE);
>+#endif
>+}
>+
>+bool engine_timeout_in_range(u64 timeout, u64 min, u64 max)
>+{
>+	return timeout >= min && timeout <= max;
>+}
>+
> static void kobj_xe_engine_release(struct kobject *kobj)
> {
> 	kfree(kobj);
>@@ -39,6 +53,74 @@ kobj_xe_engine(struct kobject *parent, char *name)
> 	return keclass;
> }
>
>+static ssize_t job_timeout_max_store(struct kobject *kobj,
>+				     struct kobj_attribute *attr,
>+				     const char *buf, size_t count)
>+{
>+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
>+	u32 timeout;
>+	int err;
>+
>+	err = kstrtou32(buf, 0, &timeout);
>+	if (err)
>+		return err;
>+
>+	if (enforce_schedule_limit() &&
>+	    !engine_timeout_in_range(timeout,
>+				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
>+				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
>+		return -EINVAL;
>+
>+	WRITE_ONCE(eclass->sched_props.job_timeout_max, timeout);
>+
>+	return count;
>+}
>+
>+static ssize_t job_timeout_max_show(struct kobject *kobj,
>+				    struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
>+
>+	return sprintf(buf, "%u\n", eclass->sched_props.job_timeout_max);
>+}
>+
>+static struct kobj_attribute job_timeout_max_attr =
>+__ATTR(job_timeout_max, 0644, job_timeout_max_show, job_timeout_max_store);
>+
>+static ssize_t job_timeout_min_store(struct kobject *kobj,
>+				     struct kobj_attribute *attr,
>+				     const char *buf, size_t count)
>+{
>+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
>+	u32 timeout;
>+	int err;
>+
>+	err = kstrtou32(buf, 0, &timeout);
>+	if (err)
>+		return err;
>+
>+	if (enforce_schedule_limit() &&
>+	    !engine_timeout_in_range(timeout,
>+				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
>+				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
>+		return -EINVAL;
>+
>+	WRITE_ONCE(eclass->sched_props.job_timeout_min, timeout);
>+
>+	return count;
>+}
>+
>+static ssize_t job_timeout_min_show(struct kobject *kobj,
>+				    struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
>+
>+	return sprintf(buf, "%u\n", eclass->sched_props.job_timeout_min);
>+}
>+
>+static struct kobj_attribute job_timeout_min_attr =
>+__ATTR(job_timeout_min, 0644, job_timeout_min_show, job_timeout_min_store);
>+
> static ssize_t job_timeout_store(struct kobject *kobj,
> 				 struct kobj_attribute *attr,
> 				 const char *buf, size_t count)
>@@ -51,7 +133,16 @@ static ssize_t job_timeout_store(struct kobject *kobj,
> 	if (err)
> 		return err;
>
>-	if (timeout > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
>+	if (enforce_schedule_limit() &&
>+	    !engine_timeout_in_range(timeout,
>+				     eclass->sched_props.job_timeout_min,
>+				     eclass->sched_props.job_timeout_max))
>+		return -EINVAL;
>+
>+	if (enforce_schedule_limit() &&
>+	    !engine_timeout_in_range(timeout,
>+				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
>+				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
> 		return -EINVAL;
>
> 	WRITE_ONCE(eclass->sched_props.job_timeout_ms, timeout);
>@@ -81,6 +172,28 @@ static ssize_t job_timeout_default(struct kobject *kobj,
> static struct kobj_attribute job_timeout_def =
> __ATTR(job_timeout_ms, 0444, job_timeout_default, NULL);
>
>+static ssize_t job_timeout_min_default(struct kobject *kobj,
>+				       struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
>+
>+	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_min);
>+}
>+
>+static struct kobj_attribute job_timeout_min_def =
>+__ATTR(job_timeout_min, 0444, job_timeout_min_default, NULL);
>+
>+static ssize_t job_timeout_max_default(struct kobject *kobj,
>+				       struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
>+
>+	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_max);
>+}
>+
>+static struct kobj_attribute job_timeout_max_def =
>+__ATTR(job_timeout_max, 0444, job_timeout_max_default, NULL);
>+
> static ssize_t timeslice_duration_store(struct kobject *kobj,
> 					struct kobj_attribute *attr,
> 					const char *buf, size_t count)
>@@ -93,7 +206,16 @@ static ssize_t timeslice_duration_store(struct kobject *kobj,
> 	if (err)
> 		return err;
>
>-	if (duration > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
>+	if (enforce_schedule_limit() &&
>+	    !engine_timeout_in_range(duration,
>+				     eclass->sched_props.timeslice_min,
>+				     eclass->sched_props.timeslice_max))
>+		return -EINVAL;
>+
>+	if (enforce_schedule_limit() &&
>+	    !engine_timeout_in_range(duration,
>+				     XE_HW_ENGINE_TIMESLICE_MIN,
>+				     XE_HW_ENGINE_TIMESLICE_MAX))
> 		return -EINVAL;
>
> 	WRITE_ONCE(eclass->sched_props.timeslice_us, duration);
>@@ -101,6 +223,77 @@ static ssize_t timeslice_duration_store(struct kobject *kobj,
> 	return count;
> }
>
>+static ssize_t timeslice_duration_max_store(struct kobject *kobj,
>+					    struct kobj_attribute *attr,
>+					    const char *buf, size_t count)
>+{
>+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
>+	u32 duration;
>+	int err;
>+
>+	err = kstrtou32(buf, 0, &duration);
>+	if (err)
>+		return err;
>+
>+	if (enforce_schedule_limit() &&
>+	    !engine_timeout_in_range(duration,
>+				     XE_HW_ENGINE_TIMESLICE_MIN,
>+				     XE_HW_ENGINE_TIMESLICE_MAX))
>+		return -EINVAL;
>+
>+	WRITE_ONCE(eclass->sched_props.timeslice_max, duration);
>+
>+	return count;
>+}
>+
>+static ssize_t timeslice_duration_max_show(struct kobject *kobj,
>+		struct kobj_attribute *attr,
>+		char *buf)
>+{
>+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
>+
>+	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_max);
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
>+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
>+	u32 duration;
>+	int err;
>+
>+	err = kstrtou32(buf, 0, &duration);
>+	if (err)
>+		return err;
>+
>+	if (enforce_schedule_limit() &&
>+	    !engine_timeout_in_range(duration,
>+				     XE_HW_ENGINE_TIMESLICE_MIN,
>+				     XE_HW_ENGINE_TIMESLICE_MAX))
>+		return -EINVAL;
>+
>+	WRITE_ONCE(eclass->sched_props.timeslice_min, duration);
>+
>+	return count;
>+}
>+
>+static ssize_t timeslice_duration_min_show(struct kobject *kobj,
>+					   struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
>+
>+	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_min);
>+}
>+
>+static struct kobj_attribute timeslice_duration_min_attr =
>+	__ATTR(timeslice_duration_min, 0644, timeslice_duration_min_show,
>+	       timeslice_duration_min_store);
>+
> static ssize_t timeslice_duration_show(struct kobject *kobj,
> 		struct kobj_attribute *attr, char *buf)
> {
>@@ -124,6 +317,28 @@ static ssize_t timeslice_default(struct kobject *kobj,
> static struct kobj_attribute timeslice_duration_def =
> __ATTR(timeslice_duration_us, 0444, timeslice_default, NULL);
>
>+static ssize_t timeslice_min_default(struct kobject *kobj,
>+				     struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
>+
>+	return sprintf(buf, "%u\n", eclass->defaults.timeslice_min);
>+}
>+
>+static struct kobj_attribute timeslice_duration_min_def =
>+__ATTR(timeslice_duration_min, 0444, timeslice_min_default, NULL);
>+
>+static ssize_t timeslice_max_default(struct kobject *kobj,
>+				     struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
>+
>+	return sprintf(buf, "%u\n", eclass->defaults.timeslice_max);
>+}
>+
>+static struct kobj_attribute timeslice_duration_max_def =
>+__ATTR(timeslice_duration_max, 0444, timeslice_max_default, NULL);
>+
> static ssize_t preempt_timeout_store(struct kobject *kobj,
> 				     struct kobj_attribute *attr,
> 				     const char *buf, size_t count)
>@@ -136,7 +351,16 @@ static ssize_t preempt_timeout_store(struct kobject *kobj,
> 	if (err)
> 		return err;
>
>-	if (timeout > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
>+	if (enforce_schedule_limit() &&
>+	    !engine_timeout_in_range(timeout,
>+				     eclass->sched_props.preempt_timeout_min,
>+				     eclass->sched_props.preempt_timeout_max))
>+		return -EINVAL;
>+
>+	if (enforce_schedule_limit() &&
>+	    !engine_timeout_in_range(timeout,
>+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
>+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
> 		return -EINVAL;
>
> 	WRITE_ONCE(eclass->sched_props.preempt_timeout_us, timeout);
>@@ -167,17 +391,123 @@ static ssize_t preempt_timeout_default(struct kobject *kobj,
> static struct kobj_attribute preempt_timeout_def =
> __ATTR(preempt_timeout_us, 0444, preempt_timeout_default, NULL);
>
>+static ssize_t preempt_timeout_min_default(struct kobject *kobj,
>+					   struct kobj_attribute *attr,
>+					   char *buf)
>+{
>+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
>+
>+	return sprintf(buf, "%u\n", eclass->defaults.preempt_timeout_min);
>+}
>+
>+static struct kobj_attribute preempt_timeout_min_def =
>+__ATTR(preempt_timeout_min, 0444, preempt_timeout_min_default, NULL);
>+
>+static ssize_t preempt_timeout_max_default(struct kobject *kobj,
>+					   struct kobj_attribute *attr,
>+					   char *buf)
>+{
>+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
>+
>+	return sprintf(buf, "%u\n", eclass->defaults.preempt_timeout_max);
>+}
>+
>+static struct kobj_attribute preempt_timeout_max_def =
>+__ATTR(preempt_timeout_max, 0444, preempt_timeout_max_default, NULL);
>+
>+static ssize_t preempt_timeout_max_store(struct kobject *kobj,
>+					 struct kobj_attribute *attr,
>+					 const char *buf, size_t count)
>+{
>+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
>+	u32 timeout;
>+	int err;
>+
>+	err = kstrtou32(buf, 0, &timeout);
>+	if (err)
>+		return err;
>+
>+	if (enforce_schedule_limit() &&
>+	    !engine_timeout_in_range(timeout,
>+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
>+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
>+		return -EINVAL;
>+
>+	WRITE_ONCE(eclass->sched_props.preempt_timeout_max, timeout);
>+
>+	return count;
>+}
>+
>+static ssize_t preempt_timeout_max_show(struct kobject *kobj,
>+					struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
>+
>+	return sprintf(buf, "%u\n", eclass->sched_props.preempt_timeout_max);
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
>+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
>+	u32 timeout;
>+	int err;
>+
>+	err = kstrtou32(buf, 0, &timeout);
>+	if (err)
>+		return err;
>+
>+	if (enforce_schedule_limit() &&
>+	    !engine_timeout_in_range(timeout,
>+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
>+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
>+		return -EINVAL;
>+
>+	WRITE_ONCE(eclass->sched_props.preempt_timeout_min, timeout);
>+
>+	return count;
>+}
>+
>+static ssize_t preempt_timeout_min_show(struct kobject *kobj,
>+					struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
>+
>+	return sprintf(buf, "%u\n", eclass->sched_props.preempt_timeout_min);
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
>index 683726563059..33c458606117 100644
>--- a/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
>+++ b/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
>@@ -10,6 +10,8 @@
>
> #define MAX_ENGINE_CLASS_NAME_LEN    16
> int xe_engine_class_sysfs_init(struct xe_gt *gt);
>+bool enforce_schedule_limit(void);
>+bool engine_timeout_in_range(u64 timeout, u64 min, u64 max);
>
> /**
>  * struct kobj_eclass - A eclass's kobject struct that connects the kobject and the
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

NIT...ensure it is checkpatch clean.

Niranjana

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
