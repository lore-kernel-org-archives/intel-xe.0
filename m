Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E1DC77B7A
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 23:38:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E217E10E571;
	Wed,  7 Jun 2023 23:38:15 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00BD10E571
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 23:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686181093; x=1717717093;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=i2406Ly2pxw2pc4lVwByCWieDIHUIMao2FLSz3av3ug=;
 b=fA2hMUb1fmsklGqW7njmY5p+C16xrJDXRd8uO9dMZmdhKo0S4JXm2UFU
 Kf5dY1BI4iFOilBvbYyCg4rGjrvwIVxLwRNvOlvEh5SQT3mtWm+odAHE7
 IPwxYbMRinIXvifSanAsbjZC9ajVdxmmtPaA4IOKHlD3FDoVaFt12gFSg
 PNeCyROVeXXx4eioxf83baxrWO6xdB71521Q2jiVbLxiZErkaiDFfu5vv
 OPAuhDzP77Zd9M4KYusDFJZnQnOpSJA4HkzpDORCIprlnCR4ix8DODLlA
 c24QipoVbW77uiCpx3L421SMGH3Th2QMHTsQc9O4XwBhJmpFeC1wc0oNk Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="355997698"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; d="scan'208";a="355997698"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 16:38:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="822372625"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; d="scan'208";a="822372625"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 07 Jun 2023 16:38:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 16:38:11 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 7 Jun 2023 16:38:11 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 7 Jun 2023 16:38:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fo2rzyu09VwcJlvJm8WMWm7Aai7q3L/Vrz7A+qwOw/U9lRZpvHdXfzYEXDlyaRiGdNAaIG6sHqFDxEgY2KF41z+k76sUxWJmoniLT6S/eD+/srBQtcigs53nshoxQol4oeoqUM/JdlF9Q1XVbxRj6GXZxXHsjaPTvXiX6xLbzLshSF2BMWUBNuc3cet98a5EDkH/CNTdn7oakpdwxEJyfeQECy/kV+QSUlvHqneyi2S1FJsCYBhtzXZW0R+paJx+4LxCTCsCgi4Vedt6tWjg+2vSsF712mgEzMpXWOztn+6Ji3iVKDcswTIAXQ/SV70qST53n18ymIeZqKk12Y07Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XilLCW1P/x9VcCJmde/E5CYG5cwS4H8xBPBi6UEHEaQ=;
 b=W8Q6YeZNN5uYr0zKgz+Y4kpV5v0s2rnU3jn03zyWPH+VsXZCyUZqISh6McZJkwVRHXimhjit4yKs3Yaiqiu4RmXBamWjO4Gw84ikTLxqwOvWDy8KbG13UdK2RYqhFZgZE2eCKFujUZy3bhch7koafhEWkuRDxLJIeeIoeRDby6y7nbUFZT5FhwGP/upqEHuzlq/96V2G+57bcMMe1su6OmJWxPNszPCbsWcoqQ2CTHTnxYuphcK4UPN0xIksxmajXMZaNo+SvsYnihjUzRDr4ZCTdwet9TGbTWUxNnPF5Gr2a8/4jxsDLngBSArhRohBZz3CMziCGREDdAK+U2P5Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 BN0PR11MB5696.namprd11.prod.outlook.com (2603:10b6:408:14b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 23:38:09 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%6]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 23:38:09 +0000
Date: Wed, 7 Jun 2023 16:38:05 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230607233805.GX6953@mdroper-desk1.amr.corp.intel.com>
References: <20230606235242.1895643-1-matthew.d.roper@intel.com>
 <20230606235242.1895643-11-matthew.d.roper@intel.com>
 <yyl6dwbd4nyw47xoxrx3fr4cfiw4pkrp6ewv67tnjsaq3fg3wy@4xlctzwxqd4k>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <yyl6dwbd4nyw47xoxrx3fr4cfiw4pkrp6ewv67tnjsaq3fg3wy@4xlctzwxqd4k>
X-ClientProxiedBy: SJ0PR03CA0161.namprd03.prod.outlook.com
 (2603:10b6:a03:338::16) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|BN0PR11MB5696:EE_
X-MS-Office365-Filtering-Correlation-Id: b4260d7e-b4f4-4d84-ca38-08db67b03f9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8uFjSc7Dl9VHg9gmlVxq08M7Dvj8BmsxEoKtDYAVstXGcay4+60TqMqt5uGPeAE2F10euMqJXHD28/o6oigXsdMdWu2sXuRscanlQeutNSGr61sj611x6P/C9NgYdY1B54cNkMbapy34+bLBaDN9ckAcSV1BR6Y4Wg0OKxfIUMtYtGmwE+OplMp5GJFhU//QlWZ67pql7fHSViiYl8s0QHh0wkK+I1OJp0X8gQb5QPZfchngf/rKeAoXLW8VtqrLCXamEXHXbruJiWljzEa9s1tP/mQYv3uplGeeSwoUB9SzvJadLN4SRbNTcrcu7LLLgOhz5mX7MDftr8z1HStryZY+4D/3Dx6io2zJRKsdl07cOWXD1aTEG6qlDty637v3V/GXwNMWL3j/lhY86kA3EJXmNsI8rcTX4b/mhKhRINjJxQmZ1E8Xct3WSjo2GaTCLKjR3hEOF/evnJBWyyyKjqjZilh3AMU0QeUvu7QKnSVaFPSArIN1p+2pJwrJQsNKZhAraDQCa7qBDXV1RKb1VS7yilCkExzZW9E7Zp/g0pbHNouhkXqN1Ead1/ajAIY8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(136003)(346002)(376002)(396003)(451199021)(6486002)(6666004)(26005)(83380400001)(6512007)(33656002)(6506007)(1076003)(86362001)(186003)(38100700002)(2906002)(82960400001)(5660300002)(316002)(478600001)(41300700001)(4326008)(6862004)(66476007)(8936002)(6636002)(8676002)(66946007)(66556008)(30864003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wcgq5T13/Tv6XQDoUThbV0bQ5RRZojRDEYvKoQn6Gw7Cppi2Lf3dz3Ro316T?=
 =?us-ascii?Q?w+7azfWX5/sJeSEJGjMDHZ5Ai5Zf/MK7KymwF53K5vfDvU1rHfiQNRh49j88?=
 =?us-ascii?Q?qbl+5piVPI3dmqNe2L6vY3EWHdNQg86u7ZBtbBzUwOrO2/Enj7b19T6mCOen?=
 =?us-ascii?Q?Jtg84t0AAsu7p+NLqJS72bRhASxmoFyeL3WB2D+594GiwsL4J878RQY4G82E?=
 =?us-ascii?Q?RxTrGlQDpv+YaA2cLie4VDLaGpR+hFAxBzmrNJdVxE3bDo1V8TtkAQ5RcK+c?=
 =?us-ascii?Q?CfUDG/E15pHmsaalhndaVXRLqy3mW/CxK5BTOhL5srGjhGSKCDm0641fnLHS?=
 =?us-ascii?Q?DKbonH3PgY6MMInuOMe43PGEIA2xnB09wlqAvEgBzq+cBQGIqspznBdEAIvR?=
 =?us-ascii?Q?aGUw15D7E+8vY2FtniVzvdNSptI0uc2wQa7Nms1VKAnsdnVHsMzW+F86rDGu?=
 =?us-ascii?Q?R5fhYN4qSNc6tbqd3eHuRIWwqT9DpHHBKWpqweS5OztPRjrUSsM5gh5Fietv?=
 =?us-ascii?Q?/h4ggIRQ2QxmX3MJiT8DHVsOEu4c1xakGjGh4glstkp3WfvDq72Xg7OZI5k2?=
 =?us-ascii?Q?kdkSMpY9Zgri2M/wOiUhagWR5ZOikpX/CBIq5DaRWwo45nc7QktzOAe35LTk?=
 =?us-ascii?Q?ElyJ7iVuftezulHxhEoPNvfjEYd8yEu4lvbht8z488QB6Fm8a1169QnoZFMZ?=
 =?us-ascii?Q?y8zGEvuOWm8w9SOJCdH/2uDqpPJFs9G/3HiywvSPsGu2pi8+jyNK5+v34o03?=
 =?us-ascii?Q?9BiKzgQV7Mo5Wo7wnhMTXZ+xNKwqkrd0r99F41z1jhY0OcGOARdMCVcndXVS?=
 =?us-ascii?Q?bIpIpW0Hz+TWSz/tCkHMWZ58/YeHqAvfLMMh74jLEjTPpufcXkKgaRxOGhE0?=
 =?us-ascii?Q?3tuddb+uTxn216jNDkkBUGAwHM9oHwNxnmfW6UAGVOGpvUOVOiAFBcfIRmkv?=
 =?us-ascii?Q?09aMpRugcrSNEF4eYhP7BxUJSlla+AUIWDqaDmYkA1Kuc4uaSjkuahDgiPOJ?=
 =?us-ascii?Q?XKgKlQSVT1QqXMQ6IE0odPriwCl1XvdJ3Tazaop9EVjRrJVjWowiboM+5VDw?=
 =?us-ascii?Q?lk3nJv190wGUEc7YrwZBV2MHGcjBGZHBwsELXn2WewrQ2K//4ED8nCyuwJQ4?=
 =?us-ascii?Q?wX1AOoHoIW2Xvs9GqZ1tKEUbsyd/EUbqr5f5DJbV8dnXs9HEeDHIRHCqeKkG?=
 =?us-ascii?Q?sezOXyDgbWvrruSQD/+TTJJYcG0qDXYsIW4VM0ZT39aZx3fSWOqe2/EaFUj5?=
 =?us-ascii?Q?I7Y6jHTSA/1vg88ve86UrnA7V+c8Ax/QetYK7/l+PBha/EAb5EspgsLt3ZLG?=
 =?us-ascii?Q?ESFVT2ST7W2K/ElzsIHYD8qIJi6opciteZQINWrCdsXkxuU+6RDvMfVZcWLY?=
 =?us-ascii?Q?evWWhy4u2rfuREhXXQLcu5k6BEcm00BqqyAAiLPWHoZEoKIIfyO+UVs8Kqdi?=
 =?us-ascii?Q?G3VNenqwMENxXkgiBzRzewwfIo5eg+McsA5D1oWZDj93wZbEB9rpzw6bEBpF?=
 =?us-ascii?Q?JTsynzfK+EWV1bHFrobYnxuBlcQECF/7ml0OEGcSRzpT7F+4fe5SqotK2+8C?=
 =?us-ascii?Q?c2rMTvs4LzQZfH11bjdAjAq9VllVUWdyWihjsK+1zoWBcTCN8GCbiymSuH9a?=
 =?us-ascii?Q?YQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4260d7e-b4f4-4d84-ca38-08db67b03f9d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 23:38:08.5639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ptmtxaEiBqhsatHCFH1w6W9YWLiVewCWSXNHWAnTQDSz+KNQbATOdUjwehnmnBC8Pi1huP+RF/rD4U4GS1blfBDOUOIdN2Oh/zBpojLxcQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5696
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

On Tue, Jun 06, 2023 at 09:41:36PM -0700, Lucas De Marchi wrote:
> On Tue, Jun 06, 2023 at 04:52:42PM -0700, Matt Roper wrote:
> > ---
> > drivers/gpu/drm/xe/Makefile                   |   2 +
> > .../gpu/drm/xe/compat-i915-headers/i915_drv.h |  40 +----
> > .../drm/xe/display/ext/intel_device_info.c    |  94 ++--------
> > drivers/gpu/drm/xe/xe_device_types.h          |  56 +-----
> > drivers/gpu/drm/xe/xe_display.c               | 166 +++---------------
> > 5 files changed, 51 insertions(+), 307 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index f34d4bdd510b..0fbbbc6e247c 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -122,6 +122,7 @@ subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
> > 	-Ddrm_i915_private=xe_device
> > 
> > CFLAGS_i915-display/intel_fbdev.o = $(call cc-disable-warning, override-init)
> > +CFLAGS_i915-display/intel_display_device.o = $(call cc-disable-warning, override-init)
> > 
> > # Rule to build display code shared with i915
> > $(obj)/i915-display/%.o: $(srctree)/drivers/gpu/drm/i915/display/%.c FORCE
> > @@ -161,6 +162,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
> > 	i915-display/intel_ddi.o \
> > 	i915-display/intel_ddi_buf_trans.o \
> > 	i915-display/intel_display.o \
> > +	i915-display/intel_display_device.o \
> > 	i915-display/intel_display_driver.o \
> > 	i915-display/intel_display_debugfs.o \
> > 	i915-display/intel_display_power.o \
> > diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> > index 8a4ce3420c55..59bf1d4a61d6 100644
> > --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> > +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> > @@ -84,44 +84,14 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
> > #define IS_BDW_ULT(dev_priv) (dev_priv && 0)
> > #define IS_BDW_ULX(dev_priv) (dev_priv && 0)
> > 
> > -#define INTEL_NUM_PIPES(xe) (hweight8((xe)->info.display.pipe_mask))
> > -#define HAS_DISPLAY(xe) ((xe)->info.display.pipe_mask != 0)
> > #define INTEL_DISPLAY_ENABLED(xe) (HAS_DISPLAY((xe)) && !intel_opregion_headless_sku((xe)))
> > -#define HAS_CDCLK_CRAWL(xe) ((xe)->info.display.has_cdclk_crawl)
> > -#define HAS_CDCLK_SQUASH(xe) ((xe)->info.display.has_cdclk_squash)
> > -#define HAS_PSR(xe) ((xe)->info.display.has_psr)
> > -#define HAS_PSR2_SEL_FETCH(xe) (xe || 1)
> > -#define HAS_PSR_HW_TRACKING(xe) ((xe)->info.display.has_psr_hw_tracking)
> > -#define HAS_IPC(xe) ((xe)->info.display.has_ipc)
> > -#define HAS_IPS(xe) (xe && false)
> > -#define HAS_SAGV(xe) (xe || 1)
> > -#define HAS_DP_MST(xe) ((xe)->info.display.has_dp_mst)
> > -#define HAS_DMC(xe) ((xe)->info.display.has_dmc)
> > -#define HAS_DSB(xe) ((xe)->info.display.has_dsb)
> > -#define HAS_DSC(xe) ((xe)->info.display.has_dsc)
> > -#define HAS_CUR_FBC(xe) (xe || 1)
> > -#define HAS_DOUBLE_BUFFERED_M_N(xe) ((xe) || 1)
> > -#define I915_HAS_HOTPLUG(xe) (true)
> > -#define HAS_D12_PLANE_MINIMIZATION(dev_priv) (IS_ROCKETLAKE(dev_priv) || \
> > -					      IS_ALDERLAKE_S(dev_priv))
> > -#define DISPLAY_VER(xe) ((xe)->info.display.ver)
> > +#define DISPLAY_VER(xe) ((xe)->info.display_runtime.ip.ver)
> > #define IS_DISPLAY_VER(xe, first, last) ((DISPLAY_VER(xe) >= first && DISPLAY_VER(xe) <= last))
> > #define IS_GRAPHICS_VER(xe, first, last) \
> > 	((xe)->info.graphics_verx100 >= first * 100 && \
> > 	 (xe)->info.graphics_verx100 <= (last*100 + 99))
> > #define IS_MOBILE(xe) (xe && 0)
> > -#define HAS_GMCH(xe) (xe && 0)
> > -#define HAS_DDI(xe) (xe || 1)
> > #define HAS_LLC(xe) (!IS_DGFX((xe)))
> > -#define HAS_GMBUS_IRQ(xe) (xe || 1)
> > -#define HAS_GMBUS_BURST_READ(xe) (xe || 1)
> > -#define HAS_VRR(xe) (xe || 1)
> > -#define HAS_ASYNC_FLIPS(xe) (xe || 1)
> > -#define HAS_FBC(xe) ((xe)->info.display.fbc_mask)
> > -#define SUPPORTS_TV(xe) (xe && 0)
> > -#define HAS_MBUS_JOINING(xe) (xe && 0)
> > -#define HAS_HW_SAGV_WM(xe) (DISPLAY_VER(xe) >= 13 && !IS_DGFX(xe))
> > -#define HAS_DPT(xe) (DISPLAY_VER(xe) >= 13)
> > 
> > /* Workarounds not handled yet */
> > #define IS_DISPLAY_STEP(xe, first, last) ({u8 __step = (xe)->info.step.display; first <= __step && __step <= last;})
> > @@ -162,15 +132,11 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
> > #define IS_DG2_G12(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_DG2_G12)
> > #define IS_ADLP_RPLU(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_ADLP_RPLU)
> > #define IS_ICL_WITH_PORT_F(xe) (xe && 0)
> > -#define HAS_LSPCON(xe) (xe && 0)
> > -#define HAS_MSO(xe) (xe || 1)
> > -#define HAS_DP20(xe) (IS_DG2(xe))
> > #define HAS_FLAT_CCS(xe) (xe_device_has_flat_ccs(xe))
> > #define HAS_4TILE(xe) ((xe)->info.has_4tile)
> > #define to_intel_bo(x) gem_to_xe_bo((x))
> > #define mkwrite_device_info(xe) (INTEL_INFO(xe))
> > 
> > -#define HAS_TRANSCODER(dev_priv, trans)  ((INTEL_INFO(dev_priv)->display.cpu_transcoder_mask & BIT(trans)) != 0)
> > #define HAS_128_BYTE_Y_TILING(xe) (xe || 1)
> > 
> > #define intel_has_gpu_reset(a) (a && 0)
> > @@ -225,7 +191,9 @@ static inline void intel_runtime_pm_put(struct xe_runtime_pm *pm, bool wakeref)
> > 
> > #define intel_step_name xe_step_name
> > #define pdev_to_i915 pdev_to_xe_device
> > -#define RUNTIME_INFO(xe) (&(xe)->info.display)
> > +#define DISPLAY_INFO(xe)		((xe)->info.display)
> > +#define RUNTIME_INFO(xe)		(&(xe)->info.i915_runtime)
> > +#define DISPLAY_RUNTIME_INFO(xe)	(&(xe)->info.display_runtime)
> > 
> > #define FORCEWAKE_ALL XE_FORCEWAKE_ALL
> > #define HPD_STORM_DEFAULT_THRESHOLD 50
> > diff --git a/drivers/gpu/drm/xe/display/ext/intel_device_info.c b/drivers/gpu/drm/xe/display/ext/intel_device_info.c
> > index 9a54611037b5..d1bb1e12013f 100644
> > --- a/drivers/gpu/drm/xe/display/ext/intel_device_info.c
> > +++ b/drivers/gpu/drm/xe/display/ext/intel_device_info.c
> > @@ -30,89 +30,6 @@
> > #include "i915_reg.h"
> > #include <drm/drm_drv.h>
> > 
> > -/**
> > - * intel_device_info_runtime_init - initialize runtime info
> > - * @dev_priv: the i915 device
> > - *
> > - * Determine various intel_device_info fields at runtime.
> > - *
> > - * Use it when either:
> > - *   - it's judged too laborious to fill n static structures with the limit
> > - *     when a simple if statement does the job,
> > - *   - run-time checks (eg read fuse/strap registers) are needed.
> > - *
> > - * This function needs to be called:
> > - *   - after the MMIO has been setup as we are reading registers,
> > - *   - after the PCH has been detected,
> > - *   - before the first usage of the fields it can tweak.
> > - */
> > -void intel_device_info_runtime_init(struct drm_i915_private *dev_priv)
> > -{
> > -	struct intel_runtime_info *runtime = RUNTIME_INFO(dev_priv);
> > -	enum pipe pipe;
> > -
> > -	/* Wa_14011765242: adl-s A0,A1 */
> > -	if (IS_ADLS_DISPLAY_STEP(dev_priv, STEP_A0, STEP_A2)) {
> > -		for_each_pipe(dev_priv, pipe)
> > -			runtime->num_scalers[pipe] = 0;
> > -	} else if (DISPLAY_VER(dev_priv) >= 11) {
> > -		for_each_pipe(dev_priv, pipe)
> > -			runtime->num_scalers[pipe] = 2;
> > -	} else if (DISPLAY_VER(dev_priv) >= 9) {
> > -		runtime->num_scalers[PIPE_A] = 2;
> > -		runtime->num_scalers[PIPE_B] = 2;
> > -		runtime->num_scalers[PIPE_C] = 1;
> > -	}
> > -
> > -	if (DISPLAY_VER(dev_priv) >= 13 || HAS_D12_PLANE_MINIMIZATION(dev_priv)) {
> > -		for_each_pipe(dev_priv, pipe)
> > -			runtime->num_sprites[pipe] = 4;
> > -	} else if (DISPLAY_VER(dev_priv) >= 11) {
> > -		for_each_pipe(dev_priv, pipe)
> > -			runtime->num_sprites[pipe] = 6;
> > -	}
> > -
> > -	if (HAS_DISPLAY(dev_priv) && DISPLAY_VER(dev_priv) >= 9) {
> > -		u32 dfsm = intel_de_read(dev_priv, SKL_DFSM);
> > -
> > -		if (dfsm & SKL_DFSM_PIPE_A_DISABLE) {
> > -			runtime->pipe_mask &= ~BIT(PIPE_A);
> > -			runtime->cpu_transcoder_mask &= ~BIT(TRANSCODER_A);
> > -			runtime->fbc_mask &= ~BIT(INTEL_FBC_A);
> > -		}
> > -		if (dfsm & SKL_DFSM_PIPE_B_DISABLE) {
> > -			runtime->pipe_mask &= ~BIT(PIPE_B);
> > -			runtime->cpu_transcoder_mask &= ~BIT(TRANSCODER_B);
> > -		}
> > -		if (dfsm & SKL_DFSM_PIPE_C_DISABLE) {
> > -			runtime->pipe_mask &= ~BIT(PIPE_C);
> > -			runtime->cpu_transcoder_mask &= ~BIT(TRANSCODER_C);
> > -		}
> > -
> > -		if (DISPLAY_VER(dev_priv) >= 12 &&
> > -		    (dfsm & TGL_DFSM_PIPE_D_DISABLE)) {
> > -			runtime->pipe_mask &= ~BIT(PIPE_D);
> > -			runtime->cpu_transcoder_mask &= ~BIT(TRANSCODER_D);
> > -		}
> > -
> > -		if (dfsm & SKL_DFSM_DISPLAY_HDCP_DISABLE)
> > -			runtime->has_hdcp = 0;
> > -
> > -		if (dfsm & SKL_DFSM_DISPLAY_PM_DISABLE)
> > -			runtime->fbc_mask = 0;
> > -
> > -		if (DISPLAY_VER(dev_priv) >= 11 && (dfsm & ICL_DFSM_DMC_DISABLE))
> > -			runtime->has_dmc = 0;
> > -
> > -		if (DISPLAY_VER(dev_priv) >= 10 &&
> > -		    (dfsm & GLK_DFSM_DISPLAY_DSC_DISABLE))
> > -			runtime->has_dsc = 0;
> > -	}
> > -
> > -	runtime->rawclk_freq = intel_read_rawclk(dev_priv);
> > -	drm_dbg(&dev_priv->drm, "rawclk rate: %d kHz\n", runtime->rawclk_freq);
> > -}
> > -
> > bool i915_vtd_active(struct drm_i915_private *i915)
> > {
> > 	if (device_iommu_mapped(i915->drm.dev))
> > @@ -128,3 +45,14 @@ int __i915_inject_probe_error(struct drm_i915_private *i915, int err,
> > {
> > 	return 0;
> > }
> > +int i8xx_enable_vblank(struct drm_crtc *crtc) { return 0; }
> > +void intel_dvo_init(struct drm_i915_private *i915) {}
> > +int i965_enable_vblank(struct drm_crtc *crtc) { return 0; }
> > +int intel_tv_init(struct drm_i915_private *i915) { return 0; }
> > +int assert_dsi_pll_enabled(struct drm_i915_private *i915) { return 0; }
> > +bool intel_sdvo_init(struct drm_i915_private *dev_priv,
> > +		     i915_reg_t sdvo_reg, enum port port) { return false; }
> > +void i965_disable_vblank(struct drm_crtc *crtc) {}
> > +void i8xx_disable_vblank(struct drm_crtc *crtc) {}
> > +void g4x_hdmi_init(struct drm_i915_private *dev_priv,
> > +		   i915_reg_t hdmi_reg, enum port port) {}
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 17b6b1cc5adb..0226d44a6af2 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -21,6 +21,7 @@
> > #include "ext/intel_device_info.h"
> > #include "ext/intel_pch.h"
> > #include "intel_display_core.h"
> 
> can we now remove this?

No, we still need this one for the definition of 'struct intel_display'
that is used inside 'struct xe_device.'  We might be able to convert
that to a pointer at some point in the future, eliminating the need for
the header, but we aren't there yet.

> 
> > +#include "intel_display_device.h"
> > #endif
> > 
> > struct xe_ggtt;
> > @@ -217,58 +218,11 @@ struct xe_device {
> > 		u8 enable_display:1;
> > 
> > #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> > -		struct xe_device_display_info {
> > -			u8 ver;
> > -
> > -			u8 pipe_mask;
> > -			u8 cpu_transcoder_mask;
> > -			u8 fbc_mask;
> > -			u8 abox_mask;
> > -
> > -			struct {
> > -				u16 size; /* in blocks */
> > -				u8 slice_mask;
> > -			} dbuf;
> > -
> > -#define DEV_INFO_DISPLAY_FOR_EACH_FLAG(func) \
> > -			/* Keep in alphabetical order */ \
> > -			func(has_cdclk_crawl); \
> > -			func(has_cdclk_squash); \
> > -			func(has_dmc); \
> > -			func(has_dp_mst); \
> > -			func(has_dsb); \
> > -			func(has_dsc); \
> > -			func(has_fpga_dbg); \
> > -			func(has_hdcp); \
> > -			func(has_hti); \
> > -			func(has_ipc); \
> > -			func(has_psr); \
> > -			func(has_psr_hw_tracking);
> > -
> > -#define DEFINE_FLAG(name) u8 name:1
> > -			DEV_INFO_DISPLAY_FOR_EACH_FLAG(DEFINE_FLAG);
> > -#undef DEFINE_FLAG
> > -
> > -			/* Register offsets for the various display pipes and transcoders */
> > -			u32 pipe_offsets[I915_MAX_TRANSCODERS];
> > -			u32 trans_offsets[I915_MAX_TRANSCODERS];
> > -			u32 cursor_offsets[I915_MAX_PIPES];
> > -
> > -			struct {
> > -				u32 degamma_lut_size;
> > -				u32 gamma_lut_size;
> > -				u32 degamma_lut_tests;
> > -				u32 gamma_lut_tests;
> > -			} color;
> > -
> > -			/* Populated by intel_device_runtime_init() */
> > -			u8 num_sprites[I915_MAX_PIPES];
> > -			u8 num_scalers[I915_MAX_PIPES];
> > +		const struct intel_display_device_info *display;
> > +		struct intel_display_runtime_info display_runtime;
> > +		struct {
> > 			u32 rawclk_freq;
> > -
> > -			/* Unused by xe, but for compat */
> > -			u32 mmio_offset;
> > -		} display;
> > +		} i915_runtime;
> > #endif
> > 	} info;
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
> > index 1a9e9c78966d..5745065b70de 100644
> > --- a/drivers/gpu/drm/xe/xe_display.c
> > +++ b/drivers/gpu/drm/xe/xe_display.c
> > @@ -196,7 +196,7 @@ int xe_display_init_noirq(struct xe_device *xe)
> > 
> > 	intel_bw_init_hw(xe);
> > 
> > -	intel_device_info_runtime_init(xe);
> > +	intel_display_device_info_runtime_init(xe);
> > 
> > 	err = intel_display_driver_probe_noirq(xe);
> > 	if (err)
> > @@ -320,7 +320,7 @@ static void intel_suspend_encoders(struct xe_device *xe)
> > 	struct drm_device *dev = &xe->drm;
> > 	struct intel_encoder *encoder;
> > 
> > -	if (!xe->info.display.pipe_mask)
> > +	if (xe->info.display_runtime.pipe_mask)
> > 		return;
> > 
> > 	drm_modeset_lock_all(dev);
> > @@ -340,7 +340,7 @@ void xe_display_pm_suspend(struct xe_device *xe)
> > 	 * properly.
> > 	 */
> > 	intel_power_domains_disable(xe);
> > -	if (xe->info.display.pipe_mask)
> > +	if (xe->info.display_runtime.pipe_mask)
> > 		drm_kms_helper_poll_disable(&xe->drm);
> > 
> > 	intel_display_driver_suspend(xe);
> > @@ -385,7 +385,7 @@ void xe_display_pm_resume(struct xe_device *xe)
> > 
> > 	intel_dmc_resume(xe);
> > 
> > -	if (xe->info.display.pipe_mask)
> > +	if (xe->info.display_runtime.pipe_mask)
> > 		drm_mode_config_reset(&xe->drm);
> > 
> > 	intel_display_driver_init_hw(xe);
> > @@ -397,7 +397,7 @@ void xe_display_pm_resume(struct xe_device *xe)
> > 	intel_display_driver_resume(xe);
> > 
> > 	intel_hpd_poll_disable(xe);
> > -	if (xe->info.display.pipe_mask)
> > +	if (xe->info.display_runtime.pipe_mask)
> > 		drm_kms_helper_poll_enable(&xe->drm);
> > 
> > 	intel_opregion_resume(xe);
> > @@ -411,142 +411,34 @@ void xe_display_pm_resume(struct xe_device *xe)
> > __diag_push();
> > __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
> > 
> > -#define __DISPLAY_DEFAULTS \
> > -	.pipe_mask = BIT(PIPE_A) | BIT(PIPE_B) |			\
> > -		     BIT(PIPE_C) | BIT(PIPE_D),				\
> > -	.cpu_transcoder_mask =						\
> > -	BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |				\
> > -	BIT(TRANSCODER_C) | BIT(TRANSCODER_D) |				\
> > -	BIT(TRANSCODER_DSI_0) | BIT(TRANSCODER_DSI_1),			\
> > -	.pipe_offsets = {						\
> > -		[TRANSCODER_A] = PIPE_A_OFFSET,				\
> > -		[TRANSCODER_B] = PIPE_B_OFFSET,				\
> > -		[TRANSCODER_C] = PIPE_C_OFFSET,				\
> > -		[TRANSCODER_D] = PIPE_D_OFFSET,				\
> > -		[TRANSCODER_DSI_0] = PIPE_DSI0_OFFSET,			\
> > -		[TRANSCODER_DSI_1] = PIPE_DSI1_OFFSET,			\
> > -	},								\
> > -	.cursor_offsets = { \
> > -		[PIPE_A] = CURSOR_A_OFFSET, \
> > -		[PIPE_B] = CURSOR_B_OFFSET, \
> > -		[PIPE_C] = CURSOR_C_OFFSET, \
> > -		[PIPE_D] = CURSOR_D_OFFSET, \
> > -	}, \
> > -	.trans_offsets = {						\
> > -		[TRANSCODER_A] = TRANSCODER_A_OFFSET,			\
> > -		[TRANSCODER_B] = TRANSCODER_B_OFFSET,			\
> > -		[TRANSCODER_C] = TRANSCODER_C_OFFSET,			\
> > -		[TRANSCODER_D] = TRANSCODER_D_OFFSET,			\
> > -		[TRANSCODER_DSI_0] = TRANSCODER_DSI0_OFFSET,		\
> > -		[TRANSCODER_DSI_1] = TRANSCODER_DSI1_OFFSET,		\
> > -	}
> > -
> > -#define GEN12_DISPLAY \
> > -	__DISPLAY_DEFAULTS,						\
> > -	.ver = 12,							\
> > -	.abox_mask = GENMASK(2, 1),					\
> > -	.has_dmc = 1,							\
> > -	.has_dp_mst = 1,						\
> > -	.has_dsb = 0, /* FIXME: LUT load is broken with huge DSB */	\
> > -	.dbuf.size = 2048,						\
> > -	.dbuf.slice_mask = BIT(DBUF_S1) | BIT(DBUF_S2),			\
> > -	.has_dsc = 1,							\
> > -	.fbc_mask = BIT(INTEL_FBC_A),					\
> > -	.has_fpga_dbg = 1,						\
> > -	.has_hdcp = 1,							\
> > -	.has_ipc = 1,							\
> > -	.has_psr = 1,							\
> > -	.has_psr_hw_tracking = 0,					\
> > -	.color = { .degamma_lut_size = 33, .gamma_lut_size = 262145 }
> > -
> > -#define XE_LPD								\
> > -	__DISPLAY_DEFAULTS,						\
> > -	.ver = 13,							\
> > -	.abox_mask = GENMASK(1, 0),					\
> > -	.color = {							\
> > -		.degamma_lut_size = 128, .gamma_lut_size = 1024,	\
> > -		.degamma_lut_tests = DRM_COLOR_LUT_NON_DECREASING |	\
> > -		DRM_COLOR_LUT_EQUAL_CHANNELS,				\
> > -	},								\
> > -	.dbuf.size = 4096,						\
> > -	.dbuf.slice_mask = BIT(DBUF_S1) | BIT(DBUF_S2) | BIT(DBUF_S3) |	\
> > -	BIT(DBUF_S4),							\
> > -	.has_dmc = 1,							\
> > -	.has_dp_mst = 1,						\
> > -	.has_dsb = 1,							\
> > -	.has_dsc = 1,							\
> > -	.fbc_mask = BIT(INTEL_FBC_A),					\
> > -	.has_fpga_dbg = 1,						\
> > -	.has_hdcp = 1,							\
> > -	.has_ipc = 1,							\
> > -	.has_psr = 1,							\
> > -	.has_psr_hw_tracking = 0
> > -
> > -#define XE_LPDP								\
> > -	XE_LPD,								\
> > -	.ver = 14,							\
> > -	.has_cdclk_crawl = 1,						\
> > -	.has_cdclk_squash = 1
> > -
> > -
> > void xe_display_info_init(struct xe_device *xe)
> > {
> > -	if (!xe->info.enable_display) {
> > -		unset_display_features(xe);
> > -		return;
> > -	}
> > +	u16 gmdid_ver, gmdid_rel, gmdid_step;
> > +	bool has_gmdid = GRAPHICS_VERx100(xe) >= 1270;
> > +
> > +	if (!xe->info.enable_display)
> > +		goto no_display;
> > +
> > +	xe->info.display = intel_display_device_probe(xe, has_gmdid, &gmdid_ver,
> > +						      &gmdid_rel, &gmdid_step);
> > +	memcpy(&xe->info.display_runtime,
> > +	       &xe->info.display->__runtime_defaults,
> > +	       sizeof(xe->info.display->__runtime_defaults));
> > 
> > -	switch (xe->info.platform) {
> > -	case XE_TIGERLAKE:
> > -	case XE_DG1:
> > -		xe->info.display = (struct xe_device_display_info) {
> > -			GEN12_DISPLAY,
> > -			.has_psr_hw_tracking = 1,
> > -		};
> > -		break;
> > -	case XE_ROCKETLAKE:
> > -		xe->info.display = (struct xe_device_display_info) {
> > -			GEN12_DISPLAY,
> > -			.abox_mask = BIT(0),
> > -			.has_hti = 1,
> > -			.cpu_transcoder_mask =
> > -				BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
> > -				BIT(TRANSCODER_C),
> > -			.pipe_mask =
> > -				BIT(PIPE_A) | BIT(PIPE_B) | BIT(PIPE_C),
> > -		};
> > -		break;
> > -	case XE_ALDERLAKE_S:
> > -		xe->info.display = (struct xe_device_display_info) {
> > -			GEN12_DISPLAY,
> > -			.has_hti = 1,
> > -		};
> > -		break;
> > -	case XE_ALDERLAKE_P:
> > -	case XE_ALDERLAKE_N:
> > -		xe->info.display = (struct xe_device_display_info) {
> > -			XE_LPD,
> > -			.has_cdclk_crawl = 1,
> > -		};
> > -		break;
> > -	case XE_DG2:
> > -		xe->info.display = (struct xe_device_display_info) {
> > -			XE_LPD,
> > -			.cpu_transcoder_mask =
> > -				BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
> > -				BIT(TRANSCODER_C) | BIT(TRANSCODER_D),
> > -			.has_cdclk_squash = 1,
> > -		};
> > -		break;
> > -	case XE_METEORLAKE:
> > -		xe->info.display = (struct xe_device_display_info) { XE_LPDP };
> > -		break;
> > -	default:
> > -		drm_warn(&xe->drm, "Unknown display IP\n");
> > -		xe->info.enable_display = false;
> > -		unset_display_features(xe);
> > -		return;
> > +	if (!xe->info.display_runtime.pipe_mask)
> > +		goto no_display;
> > +
> > +	if (has_gmdid) {
> > +		xe->info.display_runtime.ip.ver = gmdid_ver;
> > +		xe->info.display_runtime.ip.rel = gmdid_rel;
> > +		xe->info.display_runtime.ip.step = gmdid_step;
> > 	}
> > +
> > +	return;
> > +
> > +no_display:
> > +	xe->info.enable_display = false;
> > +	unset_display_features(xe);
> 
> 
> cool. I think it will be a little bit hard amend this since we have
> other commits on top of the initial display support touching  it, but I
> think it will be worthy.
> 
> thanks
> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Thanks.  Series applied to drm-xe-next.


Matt

> 
> Lucas De Marchi
> 
> > }
> > 
> > __diag_pop();
> > -- 
> > 2.40.1
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
