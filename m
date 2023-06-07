Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD943C7EE25
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 04:41:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 955AE10E421;
	Wed,  7 Jun 2023 04:41:45 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35FC910E421
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 04:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686112904; x=1717648904;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4z2YFBqyNKy/PzALNwdwdi0mzINYY+bpz0JMGwzxUGU=;
 b=JORkmlsOttkm693q/ITr9oaGMbbGWbT4iGL2Z2qzdGhpUGuHXPGxiGrq
 kkBk9iWV8st5sRes2MAsEZeNdJ1NW5zw8yDDVLg+IzSrMRC5Sn1a+NSY2
 GuiMULMJVxWQIlMp1DTVAKHrliSwyAzkUzxsYgyfCnBgBU0SWWl4+AlUH
 rkf6t/NAhUst2gCsNV0LqMWWyjcfEHNWy3EzL785AaoBfM1vldznj2zRv
 SU0UkH7pz3tWTyGV1LQwrTxJjhGGzFEkvRuYH9M9en5cNR1/2r5J942nZ
 UI7SF7sC5czJfjubgg0y9a+rwYl5GUCQtyucuM2etnvWt+mZLuQZr/xTg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="354371328"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; d="scan'208";a="354371328"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 21:41:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="712441760"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; d="scan'208";a="712441760"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 06 Jun 2023 21:41:43 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 21:41:42 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 21:41:42 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 6 Jun 2023 21:41:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZPXxS+I0D8qY7sW9VYrw5JcHXlgQTUaoFzvPImP3xI30oHrljxbvIx74yazimvkMs5mDtNHH25FCQbIcWLFvTumJDPwkNH/ccAFYArshkw8W8xJi8wCDZxtp1nD9Sb2fcTCSjdRk+CFyXmFS5DCT0gN2KkNkLLd9/D9nAJRE3uZPquNK4L9m67X76Jv/M79u0EWjHlerGHYmN7SS4rI6Y/k4/hnvjx1n4ycAyiFhpPIzCK3Hl95F7DuaEC/2Ny2Wl1sRz+FM+sruKIp06sfWNmZwQettdm1OZxlkHbTPyVq/OUXAqo6yqCv+KKCqUWv+8M7rtsIHaADavxhxBbTw6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=upq3tbnEvMN9UX2tZolq6bZGYILewhPct8vSCbLl0xg=;
 b=UWHgzeBCXFemxL2ZWHY47gtNIePvTNs9N4KiRQfp9p9Dt35LpbeJXuu25X9rmiduaUp5asoNHMExc3TEwuhiz0EX0Ls0pild2/iTBd8aGwpEfTBRqN7nB/B1b6i9+rr1FrItqDKUuZqQufm8PgvRoz81qAGlgkGRO0mHda1QMytR9G4xTOOSzgzJWq/IUiuX/Fa4LNkOD8AbTinbke3tEyTBFGX7Bb5epJehe0+SaPejHHc1reQwpT6uG8Tz7l6SnMS6oJyf62wdIwkuJyVL6Vynuiiz5uyDuTc/6rIOgBASyOBh95o7A7VslY+qtuNcDQbe7vMeUumjuiuocIDIzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7987.namprd11.prod.outlook.com (2603:10b6:510:242::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 7 Jun
 2023 04:41:40 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%5]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 04:41:40 +0000
Date: Tue, 6 Jun 2023 21:41:36 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <yyl6dwbd4nyw47xoxrx3fr4cfiw4pkrp6ewv67tnjsaq3fg3wy@4xlctzwxqd4k>
References: <20230606235242.1895643-1-matthew.d.roper@intel.com>
 <20230606235242.1895643-11-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230606235242.1895643-11-matthew.d.roper@intel.com>
X-ClientProxiedBy: BY3PR10CA0002.namprd10.prod.outlook.com
 (2603:10b6:a03:255::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7987:EE_
X-MS-Office365-Filtering-Correlation-Id: 32bbdb7b-0f43-4488-c6f5-08db67117c6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /DptKrXG+v63QvUPGAB/AX3Q5BT+PVa1rhhelA3ICI+eccL7Epd1Oih7yiC6mneLWAqae9tyNrj2ej6YBGtBqhG4sg7sUJ9OhtPZQuoj3kiC+H5vPjVLe71JRFvk17jMsPuTHZG2ZtnRnHjR52WUCBFx0dYoxlJx1NHTgZ12u6fDrdcduh9n/l6udwAqcjJCcO7REGDe90mUUVjMGeCrPP2+QR8NOQVK+Zxd3BIiv/GlvllV6+nGC5CKI2ExjYo/MD73jag+PeKJHaSjJdkoqO7LCl4HzJjU946aO2VurleljlT9IOJRvN+G6uJe1ckMVoEXXnmls5vzO8uz8gD85xdpymj0DjSu9mn0jizLSfVTsshq9rr5HSTqIXvbVdbof7IefPpz6kz/qovHB2sbV8fBqfHM/FYGFOgLWGhg4mBFdOdIATt+VrWzO9BiqSqk963lk6waWck/LJwuuOZJsQUjvDcWGTREOyqVWh8Cvl3RhcCkQHFJlwSl6BYCAgf+kTUyHyV6FW+ZGc6kzQhzzZfYaoMZfX6HOQRwclJwYfyirtATwF2PRHizm3fXSltr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(346002)(376002)(136003)(396003)(39860400002)(451199021)(66946007)(478600001)(316002)(66556008)(4326008)(6636002)(66476007)(6512007)(6506007)(26005)(9686003)(186003)(30864003)(2906002)(33716001)(6862004)(8676002)(83380400001)(6486002)(6666004)(8936002)(5660300002)(38100700002)(41300700001)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5S2Kc7kx656yO4OrtzznioTXvAd9c3VA6/5DOgYKj54R2kbthBk4P8ZNuBCl?=
 =?us-ascii?Q?UtA4vsmlgA9s7d45am1l4FsRhL1KMOjKB3mKRWmdF/98tiL2NBEWFsm3PZZQ?=
 =?us-ascii?Q?AcD8PO/BeZduLGIGqlFeMvc12z7uOKhc0CElTt5/sVLlyY5ybPqviKgf3xp2?=
 =?us-ascii?Q?t/yS5HFmWQWCi4EON73+4gFY+pSv1OjrXQHtV0T6rtlAEWngZVr6zuf234i3?=
 =?us-ascii?Q?W9bCjV3pIpLXv1o/o/DeP+z3DoJW2oVcJEJOBTx8ok0TYUPRH1mxo38WkpXp?=
 =?us-ascii?Q?6KBMSOiMJ5Ljco/nk2XCeh5CVbGyvgnM2Cg2QmKyCOrXqK8xLNTpnCHDer+x?=
 =?us-ascii?Q?1WmUyisT5vcqZ+LTsvEdHc6sg5RW7fOA8bf9Ny7dJL3Xv5olAlN1DaVNDWkn?=
 =?us-ascii?Q?dp4BF+nSxstQULWgnXAChgteBmvuduFPJneMF3OkOOx7ZG8pV6Sspr9B1a5b?=
 =?us-ascii?Q?e/uYWaMFPoGOfC9QGuK9Rhl15MGuyyU3hVAl324s0mau+UCwjG/CR/jIyk70?=
 =?us-ascii?Q?Rh5PQmSGZX5jHARTPTMTq4nNqLsadutzxU1+uj+bX6dMjakXzz9MFy0rH/0I?=
 =?us-ascii?Q?jTtMmixxaWsTXhgvYQeEt3JTWyRV+/QRH8Yo06g5/k3Yk2wDF6w2KPQ7wZlP?=
 =?us-ascii?Q?NYHhYrn3VJgf6S4dCTxFOcUYYN0vkr0AmZ8b3kUkjjRoKQRESj0gPD96o7uL?=
 =?us-ascii?Q?bF32IA9cKhV4BNEyvZW2hUHkYvyOQ0CWItZ0epEQY9abj3Jzmy6PHiZk6EFI?=
 =?us-ascii?Q?dJcD01S/HqbxmtchxJaGaptltaEXS5KreNLzMtUC6KYmK08XK6Kkh5Je31jc?=
 =?us-ascii?Q?/COt82qImURF2TrnYF8PT+fgx7R4IqzTfJMl/i0Uq+FMVJ2tA/m2Zrm8PrrB?=
 =?us-ascii?Q?lFfwc6mldQi+TCwbP68StTQyxWfjZfYNUg5I7AMY7XkT5y7yzPzxK4DeWrv0?=
 =?us-ascii?Q?zHK58d8PLEKnE+UoFfPEcXSISzI7jOGwI/pEw9LAXagRuDdCC6jD3XSF5XBl?=
 =?us-ascii?Q?NCqY6N4kus59GbTuEloEi4WMWQ3ny4oSNkQp9kySLhFB8rLO50dirjCCVV/t?=
 =?us-ascii?Q?mCIpbuNhgcAL+8001rbBWJfUV840GVRX0BRAHn5KJzv2SuUhGzAOw4U7OitW?=
 =?us-ascii?Q?2cZ13Z0YhN5ju1zVHorID7V8DzIB4OeFgtir1S0gSl68u8SsDRqMxlaufVRn?=
 =?us-ascii?Q?wFmv56NUQca+qR5o+Ztk8PTACZ4AMzG4Nqj8W++/S+gvUa0OJlDvi6RcOmeC?=
 =?us-ascii?Q?Z8PYRwiwdslEZ0WNhpFOUnCU2+RBtIv8h/G0apJxYVnUsyvFHM9t+X8cIQrx?=
 =?us-ascii?Q?6eRI+vsqfqV4Efwuc6mDmHeA1YmHCNgv7AcuJaMBAkKFYJ5peq7QMFYrMUfQ?=
 =?us-ascii?Q?Vf6pj3Hmf7eTm6vfbOvHTjIihY2m3yXO7A/kJk/OxIQWVD8E9hqt10tv4ZQg?=
 =?us-ascii?Q?1T72+nvZ/GSBlzr6QvYPn6m1vSRhmtrhVQMVzIMfpQid3Xi1LOZm4D1yc2Qk?=
 =?us-ascii?Q?ZhFPhjcdHhjlyy+Nn7oOdvY0OQcI+D3aJ9or9XZH7/tiS+h7j0FAN4UFlcOe?=
 =?us-ascii?Q?46k1wcsd/mw29C5UULCelGylvRx7+YGXNCONe+CkmBDJcFvW94Y7hlte+ECq?=
 =?us-ascii?Q?BA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32bbdb7b-0f43-4488-c6f5-08db67117c6f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 04:41:40.4758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Ea9oJ130dn5ZwKcIpsDAURzjYv2OJPI68TBNYXvFcS+bFiGaIQjxI697b3EFzM9k40XoH/GUrXmrlvTwE4UB/gQL1D+4rOGI+CSFX3Km3E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7987
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 10/10] fixup! drm/xe/display: Implement
 display support
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

On Tue, Jun 06, 2023 at 04:52:42PM -0700, Matt Roper wrote:
>---
> drivers/gpu/drm/xe/Makefile                   |   2 +
> .../gpu/drm/xe/compat-i915-headers/i915_drv.h |  40 +----
> .../drm/xe/display/ext/intel_device_info.c    |  94 ++--------
> drivers/gpu/drm/xe/xe_device_types.h          |  56 +-----
> drivers/gpu/drm/xe/xe_display.c               | 166 +++---------------
> 5 files changed, 51 insertions(+), 307 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index f34d4bdd510b..0fbbbc6e247c 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -122,6 +122,7 @@ subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
> 	-Ddrm_i915_private=xe_device
>
> CFLAGS_i915-display/intel_fbdev.o = $(call cc-disable-warning, override-init)
>+CFLAGS_i915-display/intel_display_device.o = $(call cc-disable-warning, override-init)
>
> # Rule to build display code shared with i915
> $(obj)/i915-display/%.o: $(srctree)/drivers/gpu/drm/i915/display/%.c FORCE
>@@ -161,6 +162,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
> 	i915-display/intel_ddi.o \
> 	i915-display/intel_ddi_buf_trans.o \
> 	i915-display/intel_display.o \
>+	i915-display/intel_display_device.o \
> 	i915-display/intel_display_driver.o \
> 	i915-display/intel_display_debugfs.o \
> 	i915-display/intel_display_power.o \
>diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
>index 8a4ce3420c55..59bf1d4a61d6 100644
>--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
>+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
>@@ -84,44 +84,14 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
> #define IS_BDW_ULT(dev_priv) (dev_priv && 0)
> #define IS_BDW_ULX(dev_priv) (dev_priv && 0)
>
>-#define INTEL_NUM_PIPES(xe) (hweight8((xe)->info.display.pipe_mask))
>-#define HAS_DISPLAY(xe) ((xe)->info.display.pipe_mask != 0)
> #define INTEL_DISPLAY_ENABLED(xe) (HAS_DISPLAY((xe)) && !intel_opregion_headless_sku((xe)))
>-#define HAS_CDCLK_CRAWL(xe) ((xe)->info.display.has_cdclk_crawl)
>-#define HAS_CDCLK_SQUASH(xe) ((xe)->info.display.has_cdclk_squash)
>-#define HAS_PSR(xe) ((xe)->info.display.has_psr)
>-#define HAS_PSR2_SEL_FETCH(xe) (xe || 1)
>-#define HAS_PSR_HW_TRACKING(xe) ((xe)->info.display.has_psr_hw_tracking)
>-#define HAS_IPC(xe) ((xe)->info.display.has_ipc)
>-#define HAS_IPS(xe) (xe && false)
>-#define HAS_SAGV(xe) (xe || 1)
>-#define HAS_DP_MST(xe) ((xe)->info.display.has_dp_mst)
>-#define HAS_DMC(xe) ((xe)->info.display.has_dmc)
>-#define HAS_DSB(xe) ((xe)->info.display.has_dsb)
>-#define HAS_DSC(xe) ((xe)->info.display.has_dsc)
>-#define HAS_CUR_FBC(xe) (xe || 1)
>-#define HAS_DOUBLE_BUFFERED_M_N(xe) ((xe) || 1)
>-#define I915_HAS_HOTPLUG(xe) (true)
>-#define HAS_D12_PLANE_MINIMIZATION(dev_priv) (IS_ROCKETLAKE(dev_priv) || \
>-					      IS_ALDERLAKE_S(dev_priv))
>-#define DISPLAY_VER(xe) ((xe)->info.display.ver)
>+#define DISPLAY_VER(xe) ((xe)->info.display_runtime.ip.ver)
> #define IS_DISPLAY_VER(xe, first, last) ((DISPLAY_VER(xe) >= first && DISPLAY_VER(xe) <= last))
> #define IS_GRAPHICS_VER(xe, first, last) \
> 	((xe)->info.graphics_verx100 >= first * 100 && \
> 	 (xe)->info.graphics_verx100 <= (last*100 + 99))
> #define IS_MOBILE(xe) (xe && 0)
>-#define HAS_GMCH(xe) (xe && 0)
>-#define HAS_DDI(xe) (xe || 1)
> #define HAS_LLC(xe) (!IS_DGFX((xe)))
>-#define HAS_GMBUS_IRQ(xe) (xe || 1)
>-#define HAS_GMBUS_BURST_READ(xe) (xe || 1)
>-#define HAS_VRR(xe) (xe || 1)
>-#define HAS_ASYNC_FLIPS(xe) (xe || 1)
>-#define HAS_FBC(xe) ((xe)->info.display.fbc_mask)
>-#define SUPPORTS_TV(xe) (xe && 0)
>-#define HAS_MBUS_JOINING(xe) (xe && 0)
>-#define HAS_HW_SAGV_WM(xe) (DISPLAY_VER(xe) >= 13 && !IS_DGFX(xe))
>-#define HAS_DPT(xe) (DISPLAY_VER(xe) >= 13)
>
> /* Workarounds not handled yet */
> #define IS_DISPLAY_STEP(xe, first, last) ({u8 __step = (xe)->info.step.display; first <= __step && __step <= last;})
>@@ -162,15 +132,11 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
> #define IS_DG2_G12(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_DG2_G12)
> #define IS_ADLP_RPLU(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_ADLP_RPLU)
> #define IS_ICL_WITH_PORT_F(xe) (xe && 0)
>-#define HAS_LSPCON(xe) (xe && 0)
>-#define HAS_MSO(xe) (xe || 1)
>-#define HAS_DP20(xe) (IS_DG2(xe))
> #define HAS_FLAT_CCS(xe) (xe_device_has_flat_ccs(xe))
> #define HAS_4TILE(xe) ((xe)->info.has_4tile)
> #define to_intel_bo(x) gem_to_xe_bo((x))
> #define mkwrite_device_info(xe) (INTEL_INFO(xe))
>
>-#define HAS_TRANSCODER(dev_priv, trans)  ((INTEL_INFO(dev_priv)->display.cpu_transcoder_mask & BIT(trans)) != 0)
> #define HAS_128_BYTE_Y_TILING(xe) (xe || 1)
>
> #define intel_has_gpu_reset(a) (a && 0)
>@@ -225,7 +191,9 @@ static inline void intel_runtime_pm_put(struct xe_runtime_pm *pm, bool wakeref)
>
> #define intel_step_name xe_step_name
> #define pdev_to_i915 pdev_to_xe_device
>-#define RUNTIME_INFO(xe) (&(xe)->info.display)
>+#define DISPLAY_INFO(xe)		((xe)->info.display)
>+#define RUNTIME_INFO(xe)		(&(xe)->info.i915_runtime)
>+#define DISPLAY_RUNTIME_INFO(xe)	(&(xe)->info.display_runtime)
>
> #define FORCEWAKE_ALL XE_FORCEWAKE_ALL
> #define HPD_STORM_DEFAULT_THRESHOLD 50
>diff --git a/drivers/gpu/drm/xe/display/ext/intel_device_info.c b/drivers/gpu/drm/xe/display/ext/intel_device_info.c
>index 9a54611037b5..d1bb1e12013f 100644
>--- a/drivers/gpu/drm/xe/display/ext/intel_device_info.c
>+++ b/drivers/gpu/drm/xe/display/ext/intel_device_info.c
>@@ -30,89 +30,6 @@
> #include "i915_reg.h"
> #include <drm/drm_drv.h>
>
>-/**
>- * intel_device_info_runtime_init - initialize runtime info
>- * @dev_priv: the i915 device
>- *
>- * Determine various intel_device_info fields at runtime.
>- *
>- * Use it when either:
>- *   - it's judged too laborious to fill n static structures with the limit
>- *     when a simple if statement does the job,
>- *   - run-time checks (eg read fuse/strap registers) are needed.
>- *
>- * This function needs to be called:
>- *   - after the MMIO has been setup as we are reading registers,
>- *   - after the PCH has been detected,
>- *   - before the first usage of the fields it can tweak.
>- */
>-void intel_device_info_runtime_init(struct drm_i915_private *dev_priv)
>-{
>-	struct intel_runtime_info *runtime = RUNTIME_INFO(dev_priv);
>-	enum pipe pipe;
>-
>-	/* Wa_14011765242: adl-s A0,A1 */
>-	if (IS_ADLS_DISPLAY_STEP(dev_priv, STEP_A0, STEP_A2)) {
>-		for_each_pipe(dev_priv, pipe)
>-			runtime->num_scalers[pipe] = 0;
>-	} else if (DISPLAY_VER(dev_priv) >= 11) {
>-		for_each_pipe(dev_priv, pipe)
>-			runtime->num_scalers[pipe] = 2;
>-	} else if (DISPLAY_VER(dev_priv) >= 9) {
>-		runtime->num_scalers[PIPE_A] = 2;
>-		runtime->num_scalers[PIPE_B] = 2;
>-		runtime->num_scalers[PIPE_C] = 1;
>-	}
>-
>-	if (DISPLAY_VER(dev_priv) >= 13 || HAS_D12_PLANE_MINIMIZATION(dev_priv)) {
>-		for_each_pipe(dev_priv, pipe)
>-			runtime->num_sprites[pipe] = 4;
>-	} else if (DISPLAY_VER(dev_priv) >= 11) {
>-		for_each_pipe(dev_priv, pipe)
>-			runtime->num_sprites[pipe] = 6;
>-	}
>-
>-	if (HAS_DISPLAY(dev_priv) && DISPLAY_VER(dev_priv) >= 9) {
>-		u32 dfsm = intel_de_read(dev_priv, SKL_DFSM);
>-
>-		if (dfsm & SKL_DFSM_PIPE_A_DISABLE) {
>-			runtime->pipe_mask &= ~BIT(PIPE_A);
>-			runtime->cpu_transcoder_mask &= ~BIT(TRANSCODER_A);
>-			runtime->fbc_mask &= ~BIT(INTEL_FBC_A);
>-		}
>-		if (dfsm & SKL_DFSM_PIPE_B_DISABLE) {
>-			runtime->pipe_mask &= ~BIT(PIPE_B);
>-			runtime->cpu_transcoder_mask &= ~BIT(TRANSCODER_B);
>-		}
>-		if (dfsm & SKL_DFSM_PIPE_C_DISABLE) {
>-			runtime->pipe_mask &= ~BIT(PIPE_C);
>-			runtime->cpu_transcoder_mask &= ~BIT(TRANSCODER_C);
>-		}
>-
>-		if (DISPLAY_VER(dev_priv) >= 12 &&
>-		    (dfsm & TGL_DFSM_PIPE_D_DISABLE)) {
>-			runtime->pipe_mask &= ~BIT(PIPE_D);
>-			runtime->cpu_transcoder_mask &= ~BIT(TRANSCODER_D);
>-		}
>-
>-		if (dfsm & SKL_DFSM_DISPLAY_HDCP_DISABLE)
>-			runtime->has_hdcp = 0;
>-
>-		if (dfsm & SKL_DFSM_DISPLAY_PM_DISABLE)
>-			runtime->fbc_mask = 0;
>-
>-		if (DISPLAY_VER(dev_priv) >= 11 && (dfsm & ICL_DFSM_DMC_DISABLE))
>-			runtime->has_dmc = 0;
>-
>-		if (DISPLAY_VER(dev_priv) >= 10 &&
>-		    (dfsm & GLK_DFSM_DISPLAY_DSC_DISABLE))
>-			runtime->has_dsc = 0;
>-	}
>-
>-	runtime->rawclk_freq = intel_read_rawclk(dev_priv);
>-	drm_dbg(&dev_priv->drm, "rawclk rate: %d kHz\n", runtime->rawclk_freq);
>-}
>-
> bool i915_vtd_active(struct drm_i915_private *i915)
> {
> 	if (device_iommu_mapped(i915->drm.dev))
>@@ -128,3 +45,14 @@ int __i915_inject_probe_error(struct drm_i915_private *i915, int err,
> {
> 	return 0;
> }
>+int i8xx_enable_vblank(struct drm_crtc *crtc) { return 0; }
>+void intel_dvo_init(struct drm_i915_private *i915) {}
>+int i965_enable_vblank(struct drm_crtc *crtc) { return 0; }
>+int intel_tv_init(struct drm_i915_private *i915) { return 0; }
>+int assert_dsi_pll_enabled(struct drm_i915_private *i915) { return 0; }
>+bool intel_sdvo_init(struct drm_i915_private *dev_priv,
>+		     i915_reg_t sdvo_reg, enum port port) { return false; }
>+void i965_disable_vblank(struct drm_crtc *crtc) {}
>+void i8xx_disable_vblank(struct drm_crtc *crtc) {}
>+void g4x_hdmi_init(struct drm_i915_private *dev_priv,
>+		   i915_reg_t hdmi_reg, enum port port) {}
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 17b6b1cc5adb..0226d44a6af2 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -21,6 +21,7 @@
> #include "ext/intel_device_info.h"
> #include "ext/intel_pch.h"
> #include "intel_display_core.h"

can we now remove this?

>+#include "intel_display_device.h"
> #endif
>
> struct xe_ggtt;
>@@ -217,58 +218,11 @@ struct xe_device {
> 		u8 enable_display:1;
>
> #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>-		struct xe_device_display_info {
>-			u8 ver;
>-
>-			u8 pipe_mask;
>-			u8 cpu_transcoder_mask;
>-			u8 fbc_mask;
>-			u8 abox_mask;
>-
>-			struct {
>-				u16 size; /* in blocks */
>-				u8 slice_mask;
>-			} dbuf;
>-
>-#define DEV_INFO_DISPLAY_FOR_EACH_FLAG(func) \
>-			/* Keep in alphabetical order */ \
>-			func(has_cdclk_crawl); \
>-			func(has_cdclk_squash); \
>-			func(has_dmc); \
>-			func(has_dp_mst); \
>-			func(has_dsb); \
>-			func(has_dsc); \
>-			func(has_fpga_dbg); \
>-			func(has_hdcp); \
>-			func(has_hti); \
>-			func(has_ipc); \
>-			func(has_psr); \
>-			func(has_psr_hw_tracking);
>-
>-#define DEFINE_FLAG(name) u8 name:1
>-			DEV_INFO_DISPLAY_FOR_EACH_FLAG(DEFINE_FLAG);
>-#undef DEFINE_FLAG
>-
>-			/* Register offsets for the various display pipes and transcoders */
>-			u32 pipe_offsets[I915_MAX_TRANSCODERS];
>-			u32 trans_offsets[I915_MAX_TRANSCODERS];
>-			u32 cursor_offsets[I915_MAX_PIPES];
>-
>-			struct {
>-				u32 degamma_lut_size;
>-				u32 gamma_lut_size;
>-				u32 degamma_lut_tests;
>-				u32 gamma_lut_tests;
>-			} color;
>-
>-			/* Populated by intel_device_runtime_init() */
>-			u8 num_sprites[I915_MAX_PIPES];
>-			u8 num_scalers[I915_MAX_PIPES];
>+		const struct intel_display_device_info *display;
>+		struct intel_display_runtime_info display_runtime;
>+		struct {
> 			u32 rawclk_freq;
>-
>-			/* Unused by xe, but for compat */
>-			u32 mmio_offset;
>-		} display;
>+		} i915_runtime;
> #endif
> 	} info;
>
>diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
>index 1a9e9c78966d..5745065b70de 100644
>--- a/drivers/gpu/drm/xe/xe_display.c
>+++ b/drivers/gpu/drm/xe/xe_display.c
>@@ -196,7 +196,7 @@ int xe_display_init_noirq(struct xe_device *xe)
>
> 	intel_bw_init_hw(xe);
>
>-	intel_device_info_runtime_init(xe);
>+	intel_display_device_info_runtime_init(xe);
>
> 	err = intel_display_driver_probe_noirq(xe);
> 	if (err)
>@@ -320,7 +320,7 @@ static void intel_suspend_encoders(struct xe_device *xe)
> 	struct drm_device *dev = &xe->drm;
> 	struct intel_encoder *encoder;
>
>-	if (!xe->info.display.pipe_mask)
>+	if (xe->info.display_runtime.pipe_mask)
> 		return;
>
> 	drm_modeset_lock_all(dev);
>@@ -340,7 +340,7 @@ void xe_display_pm_suspend(struct xe_device *xe)
> 	 * properly.
> 	 */
> 	intel_power_domains_disable(xe);
>-	if (xe->info.display.pipe_mask)
>+	if (xe->info.display_runtime.pipe_mask)
> 		drm_kms_helper_poll_disable(&xe->drm);
>
> 	intel_display_driver_suspend(xe);
>@@ -385,7 +385,7 @@ void xe_display_pm_resume(struct xe_device *xe)
>
> 	intel_dmc_resume(xe);
>
>-	if (xe->info.display.pipe_mask)
>+	if (xe->info.display_runtime.pipe_mask)
> 		drm_mode_config_reset(&xe->drm);
>
> 	intel_display_driver_init_hw(xe);
>@@ -397,7 +397,7 @@ void xe_display_pm_resume(struct xe_device *xe)
> 	intel_display_driver_resume(xe);
>
> 	intel_hpd_poll_disable(xe);
>-	if (xe->info.display.pipe_mask)
>+	if (xe->info.display_runtime.pipe_mask)
> 		drm_kms_helper_poll_enable(&xe->drm);
>
> 	intel_opregion_resume(xe);
>@@ -411,142 +411,34 @@ void xe_display_pm_resume(struct xe_device *xe)
> __diag_push();
> __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
>
>-#define __DISPLAY_DEFAULTS \
>-	.pipe_mask = BIT(PIPE_A) | BIT(PIPE_B) |			\
>-		     BIT(PIPE_C) | BIT(PIPE_D),				\
>-	.cpu_transcoder_mask =						\
>-	BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |				\
>-	BIT(TRANSCODER_C) | BIT(TRANSCODER_D) |				\
>-	BIT(TRANSCODER_DSI_0) | BIT(TRANSCODER_DSI_1),			\
>-	.pipe_offsets = {						\
>-		[TRANSCODER_A] = PIPE_A_OFFSET,				\
>-		[TRANSCODER_B] = PIPE_B_OFFSET,				\
>-		[TRANSCODER_C] = PIPE_C_OFFSET,				\
>-		[TRANSCODER_D] = PIPE_D_OFFSET,				\
>-		[TRANSCODER_DSI_0] = PIPE_DSI0_OFFSET,			\
>-		[TRANSCODER_DSI_1] = PIPE_DSI1_OFFSET,			\
>-	},								\
>-	.cursor_offsets = { \
>-		[PIPE_A] = CURSOR_A_OFFSET, \
>-		[PIPE_B] = CURSOR_B_OFFSET, \
>-		[PIPE_C] = CURSOR_C_OFFSET, \
>-		[PIPE_D] = CURSOR_D_OFFSET, \
>-	}, \
>-	.trans_offsets = {						\
>-		[TRANSCODER_A] = TRANSCODER_A_OFFSET,			\
>-		[TRANSCODER_B] = TRANSCODER_B_OFFSET,			\
>-		[TRANSCODER_C] = TRANSCODER_C_OFFSET,			\
>-		[TRANSCODER_D] = TRANSCODER_D_OFFSET,			\
>-		[TRANSCODER_DSI_0] = TRANSCODER_DSI0_OFFSET,		\
>-		[TRANSCODER_DSI_1] = TRANSCODER_DSI1_OFFSET,		\
>-	}
>-
>-#define GEN12_DISPLAY \
>-	__DISPLAY_DEFAULTS,						\
>-	.ver = 12,							\
>-	.abox_mask = GENMASK(2, 1),					\
>-	.has_dmc = 1,							\
>-	.has_dp_mst = 1,						\
>-	.has_dsb = 0, /* FIXME: LUT load is broken with huge DSB */	\
>-	.dbuf.size = 2048,						\
>-	.dbuf.slice_mask = BIT(DBUF_S1) | BIT(DBUF_S2),			\
>-	.has_dsc = 1,							\
>-	.fbc_mask = BIT(INTEL_FBC_A),					\
>-	.has_fpga_dbg = 1,						\
>-	.has_hdcp = 1,							\
>-	.has_ipc = 1,							\
>-	.has_psr = 1,							\
>-	.has_psr_hw_tracking = 0,					\
>-	.color = { .degamma_lut_size = 33, .gamma_lut_size = 262145 }
>-
>-#define XE_LPD								\
>-	__DISPLAY_DEFAULTS,						\
>-	.ver = 13,							\
>-	.abox_mask = GENMASK(1, 0),					\
>-	.color = {							\
>-		.degamma_lut_size = 128, .gamma_lut_size = 1024,	\
>-		.degamma_lut_tests = DRM_COLOR_LUT_NON_DECREASING |	\
>-		DRM_COLOR_LUT_EQUAL_CHANNELS,				\
>-	},								\
>-	.dbuf.size = 4096,						\
>-	.dbuf.slice_mask = BIT(DBUF_S1) | BIT(DBUF_S2) | BIT(DBUF_S3) |	\
>-	BIT(DBUF_S4),							\
>-	.has_dmc = 1,							\
>-	.has_dp_mst = 1,						\
>-	.has_dsb = 1,							\
>-	.has_dsc = 1,							\
>-	.fbc_mask = BIT(INTEL_FBC_A),					\
>-	.has_fpga_dbg = 1,						\
>-	.has_hdcp = 1,							\
>-	.has_ipc = 1,							\
>-	.has_psr = 1,							\
>-	.has_psr_hw_tracking = 0
>-
>-#define XE_LPDP								\
>-	XE_LPD,								\
>-	.ver = 14,							\
>-	.has_cdclk_crawl = 1,						\
>-	.has_cdclk_squash = 1
>-
>-
> void xe_display_info_init(struct xe_device *xe)
> {
>-	if (!xe->info.enable_display) {
>-		unset_display_features(xe);
>-		return;
>-	}
>+	u16 gmdid_ver, gmdid_rel, gmdid_step;
>+	bool has_gmdid = GRAPHICS_VERx100(xe) >= 1270;
>+
>+	if (!xe->info.enable_display)
>+		goto no_display;
>+
>+	xe->info.display = intel_display_device_probe(xe, has_gmdid, &gmdid_ver,
>+						      &gmdid_rel, &gmdid_step);
>+	memcpy(&xe->info.display_runtime,
>+	       &xe->info.display->__runtime_defaults,
>+	       sizeof(xe->info.display->__runtime_defaults));
>
>-	switch (xe->info.platform) {
>-	case XE_TIGERLAKE:
>-	case XE_DG1:
>-		xe->info.display = (struct xe_device_display_info) {
>-			GEN12_DISPLAY,
>-			.has_psr_hw_tracking = 1,
>-		};
>-		break;
>-	case XE_ROCKETLAKE:
>-		xe->info.display = (struct xe_device_display_info) {
>-			GEN12_DISPLAY,
>-			.abox_mask = BIT(0),
>-			.has_hti = 1,
>-			.cpu_transcoder_mask =
>-				BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
>-				BIT(TRANSCODER_C),
>-			.pipe_mask =
>-				BIT(PIPE_A) | BIT(PIPE_B) | BIT(PIPE_C),
>-		};
>-		break;
>-	case XE_ALDERLAKE_S:
>-		xe->info.display = (struct xe_device_display_info) {
>-			GEN12_DISPLAY,
>-			.has_hti = 1,
>-		};
>-		break;
>-	case XE_ALDERLAKE_P:
>-	case XE_ALDERLAKE_N:
>-		xe->info.display = (struct xe_device_display_info) {
>-			XE_LPD,
>-			.has_cdclk_crawl = 1,
>-		};
>-		break;
>-	case XE_DG2:
>-		xe->info.display = (struct xe_device_display_info) {
>-			XE_LPD,
>-			.cpu_transcoder_mask =
>-				BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
>-				BIT(TRANSCODER_C) | BIT(TRANSCODER_D),
>-			.has_cdclk_squash = 1,
>-		};
>-		break;
>-	case XE_METEORLAKE:
>-		xe->info.display = (struct xe_device_display_info) { XE_LPDP };
>-		break;
>-	default:
>-		drm_warn(&xe->drm, "Unknown display IP\n");
>-		xe->info.enable_display = false;
>-		unset_display_features(xe);
>-		return;
>+	if (!xe->info.display_runtime.pipe_mask)
>+		goto no_display;
>+
>+	if (has_gmdid) {
>+		xe->info.display_runtime.ip.ver = gmdid_ver;
>+		xe->info.display_runtime.ip.rel = gmdid_rel;
>+		xe->info.display_runtime.ip.step = gmdid_step;
> 	}
>+
>+	return;
>+
>+no_display:
>+	xe->info.enable_display = false;
>+	unset_display_features(xe);


cool. I think it will be a little bit hard amend this since we have
other commits on top of the initial display support touching  it, but I
think it will be worthy.

thanks

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

> }
>
> __diag_pop();
>-- 
>2.40.1
>
