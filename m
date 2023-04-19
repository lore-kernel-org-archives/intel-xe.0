Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A7EC6FD18
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 21:56:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C34910E1F4;
	Wed, 19 Apr 2023 21:56:12 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5361110E1F4
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 21:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681941370; x=1713477370;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=t9Lvy7ziJ7zssUMJZTcm4nD+nD7NSV9rqG8vKj204LA=;
 b=SAs1772k/rV8Sj+JiLgaf5egvFHh6DZptOilERyIvERiQPj7o4YCVDP3
 zgBRLOC5kebXlK+xnz/21uVQ/UNXQA6gkRWp1Ba37Jh9iBKqj/9Ylg4B8
 hhS33nEyJ//wyvluKLq2LkEyYBRdQsIsUaHmnTtcnjDfrC1F8eBzn9/Ls
 rvSOKON25Jd245vJ8PDD/IQUxhWuJ5Fmo2Htf4pU04dm5Eu0BKXO9/309
 ooTL9hyGKMy4O5mWzUiu7q9xD2AZakL1ms7d6NLKD/08JNDkVxcCzpgbm
 o2tQ9pE05Ia7LWegtM1B7PfV40oA2kyM2W+SalYmiVnAoQBJdJIApg3CH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="329743892"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="329743892"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 14:56:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="937820909"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="937820909"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 19 Apr 2023 14:56:07 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 14:56:07 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 14:56:07 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 14:56:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nzlb28NCJcqB0Xi2y5PnrTLZv46eb2FIn/9XlVs7HQDJgx6zs7r4msYrSvKUE+x2rEVTEC/89vSCvLMu2edNO4130Nj8xKfoIvlbG42eeT4o4kYZnar5Svd4UmsCZkhqkzhhsSqdh9EdxhNXROQ4+fDpCaTx1UL7PRQL4CxGiR/yvBhViqE7wxzQgIW5138ti3dTmjdBMls3eVFzI7Pq4pCvZw+mBwCpf1kxWnaYN3J9WdtWMEoi7fyhnIA5543cTsrdr5KpqTMBBb67wfnwFvNDlBIIMt2xHcwDoih0LT+rRi9WbauFC/mJBHJY9vy9/eNLfGP41nZwty7FTVzsRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+BCpd9L9DdVCYbl+9GqIMXsX2gal4TTIfwLOKu+uVY=;
 b=HlYYpqUIZoy4PhfuXiKn4HamRNxHFjLg8fqIrpOKjlLL21Hwe3uRyUQDB4hYAgXtNHetoQWtIn6Q3g7eHB7ezxNJBq0YFK6Uub4a/BH9eo1lrPxAp8LMXb0/ozk+4376NWsnEqnrOp6klF4jg2meOMC/DZhzflIRsHdqXdbJszyQDMT9za2b0d/vHDhxPR7WwjbRAHhgXjNotNM/kSqefsQiSlgwJDFHKp2ocjWeHKULpQVDqCRPY5bDP2V0gAEG0WHQwQYiiUt9P1gUVddxxGuMzO26UzktfUWR7v+QvIT9uUA3PmBIz/qA9IkIqfsDFhev82nVG66ZcRgTaGUr7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB6847.namprd11.prod.outlook.com (2603:10b6:806:29e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 21:56:05 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6319.022; Wed, 19 Apr 2023
 21:56:05 +0000
Date: Wed, 19 Apr 2023 14:56:03 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <nqx26axz3idy7up674v7i3nobnu5hjtwuyrn46ghdbzp7c2qo3@bjczno54ijhb>
References: <20230419123947.543175-1-jani.nikula@intel.com>
 <20230419123947.543175-2-jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230419123947.543175-2-jani.nikula@intel.com>
X-ClientProxiedBy: SJ0PR03CA0349.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB6847:EE_
X-MS-Office365-Filtering-Correlation-Id: 2065d136-54ae-4b40-b2f6-08db4120dfbb
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dcuUae2ueHCTN0m4mTF1ahgiz+SvMff44DDSRpfitlUsLpJ3v48FIGlAtdzUkM1xCthbBGYDBOL8602y49AB7gZ+k6RvTIDbmHq2PD96SZPfgnww+5Ev6jthBxjE8iKWvvmUQ6JvcA0W5UceCj94b+0goF3gQd62IEZFwdOe0zvibd0Bp7vn4knU65DCCkKo5jlkbsPeMlkMkm3UlKRTehmW98i+PnjTAh9c0tY6pj8sNbU0m5CLO899LrgdhRbyN0wx/+UnZzJLd2IExa/ryKW0zVx9oaTix6/VnZAw0lK4o3Svvpg/UjnoY/IxioKjDalntfABHTNf7Mz39L1rYjelzVNg+B3T4V7AXZKk9QiSIagFncemP7jwNwxG911oZVbBAhDb+cEm83RRDm8voUq8DfiRDdX+j8Pn4IRGJrPINTjoja0HJo8jhZz6hFhGjIxF4RACW+6yoO6rXY7FNwbKD0cN7d1QE9GVuR6oLdbVBmqiWUH7dUhYQbqAHT6LFPLF8HX9yc7gdFa795DCacpGLq00KyBGL7n34xgI+8Uq6gDRCWvJT8F+ta1wXxac
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(136003)(396003)(376002)(39860400002)(366004)(451199021)(6636002)(4326008)(316002)(66946007)(66556008)(66476007)(6486002)(41300700001)(478600001)(33716001)(6862004)(5660300002)(8676002)(8936002)(2906002)(86362001)(38100700002)(6506007)(9686003)(26005)(83380400001)(82960400001)(186003)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OrnHM0U9QpMiVe6/VKt/RTE/e9akeUHwBXazh6NIaLBqOrUlVeKZZ+DWmTZg?=
 =?us-ascii?Q?HFi2DsJH0rI36K+scJgyTziRJcPJGtHl8Meq2dIGOOdVLZZyh7wrEw7Rxhue?=
 =?us-ascii?Q?a/RPtNGpAy2nJA5kRDjPSKRWsRDQf4klGgq4YB+/fIFRyqYH7Ce2HmkxZH97?=
 =?us-ascii?Q?2HNAM/FAZmmzBf3XGThdvCS8JprX7tI3CS2gRfEeoOYh6C/IlohyX21rA/29?=
 =?us-ascii?Q?phLoLihj3qvXkAEVN03t1TXpa4zKranAxSnZhzELhlNw7jMFPkgLy/3qPw6T?=
 =?us-ascii?Q?WEBbp7n4I2icxjPnXuRPayUxTucLaUoIgNa+uSlFaxq2/rd6oKGS5FSHg0DQ?=
 =?us-ascii?Q?Ex4VXYVjAaqLBQpp+iVg46ss3AvPKm/INbtV2dW4sfB5m8+HBmqpTB0Cdzr8?=
 =?us-ascii?Q?dmIcxI2A136td3OdTb7fXN2pIdxOICJ5+Ya5zw9xXT7GxQDhCZH02GQsWmZo?=
 =?us-ascii?Q?LfKiR+5QfN3kqLYoGL2M6oMg3X1X81E2ogGuInTV8LFwyhOLS/yRZ4ncCcOg?=
 =?us-ascii?Q?9VcEZVlk6yLR9C2uj1s883nFNfeL3zhdAWcgJRDE3415MSTc4PfgDMhjZ7ar?=
 =?us-ascii?Q?fQugBcEy4rzDDRTPRBudFxCiBEln/on5s52biSixNAN8/Qk6d8WDlUN0Cfmw?=
 =?us-ascii?Q?folugpv85+tIGi7jEcT4I8CHCqOJ2LLmbG2sgsqGf45gsej2esSBxi8CzOcJ?=
 =?us-ascii?Q?fP3mCHmIphXXJZcz2BDF46bT5BqV3JY+lBs5nb9Af11qmOoAh2VdyOorIjX5?=
 =?us-ascii?Q?dMyKjYEsglGtLRT9CvE90BCCNoVIPd74QceL3ambSISRifSPasR3l+0ur7BY?=
 =?us-ascii?Q?8tK6UAtc5VTdSAoD7Vnptvf3tUuvwbzuiFnGO+24E8eJgQPrlUGiYHx/yb4u?=
 =?us-ascii?Q?ITgwrwlZLPGMMbR5wFOpunQ4Fqp685dckOEv3wX8xOq5HBXGGUtoXYdpDYeX?=
 =?us-ascii?Q?TRRreZQ2EvA+LvAgGSpQ0iCoipPEYmsIhtgtNmsxixQJnm8Wxvis8pF5dUG4?=
 =?us-ascii?Q?TJ9vZEz1Ug4DembVRJWfjh37xkKyx1fqqz6E4hMIZt7MpeuyIZDn2D1r/Soy?=
 =?us-ascii?Q?A7hpQxJRjpQu7+D6TDouUBGm6wdNzKjBNCNaZgUQt/Y+9fH0D02h3Yt8nK4p?=
 =?us-ascii?Q?B6GuL8eIr37ls6bm+KNgVGiChUMPrmIPBgRdneUvgTne764EasYhwHXP8Rnt?=
 =?us-ascii?Q?HvCgP2qLMVFcnzUx44FNa3zimZTq1rRXAoBXZm9qYtGTNomy+n7TSrKE1o5B?=
 =?us-ascii?Q?RTRFM2WdhJXJDkpaaeVK0j5qr+Lw/Iws9lTzUXo4T8WkxV1i/rTXpB4JweH5?=
 =?us-ascii?Q?ZuIbRWcaAMxR9WTZ80sFQ1oPj/c5qHX7U+5PrrmX74KY03sQKKsXz96vzELb?=
 =?us-ascii?Q?Z/lVau3K4B9GHwf94VrQVMWK8qCSkdFbQg5gbU4aEzyQzJLVVplJunc7KXxW?=
 =?us-ascii?Q?g4NBcytND+WrXsJZzekJibwvUg2wus2rkCXd4Bjq0KZY11hnDAVOy4l6jR8j?=
 =?us-ascii?Q?q997O3jp07PvvbrJ1HTCm/NSDjzQkqvt9tv0eomOfwjlz9xqgRLoxjUJkJVt?=
 =?us-ascii?Q?ZWH5rInlgQbGArTbTIyy+wc+ZB31yhjcS6C1FpcjjeEYkp3n/hu7NmV0HRvv?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2065d136-54ae-4b40-b2f6-08db4120dfbb
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 21:56:05.3667 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5w5nLm81OHJzTH77UvYJiZKzWl0TMOl7iyA6pOKKTqezm3T8mA9vWF+IuROvMEX914RRYP4eozaTeYaBwlN62ojO/+NyMqK4pVEi3VZx61s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6847
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/9] fixup! drm/xe/display: Implement display
 support
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
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Apr 19, 2023 at 03:39:39PM +0300, Jani Nikula wrote:
>Build the i915 display object files in i915-display sub-directory, to
>increase clarity over what's coming from i915, and to simplify the rule
>to build the object files.
>
>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>---
> drivers/gpu/drm/xe/Makefile | 165 +++++++++++++++++-------------------
> 1 file changed, 78 insertions(+), 87 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index aceca651de57..9fa4aaad6b8f 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -105,100 +105,20 @@ subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
> 	-Ddrm_i915_gem_object=xe_bo \
> 	-Ddrm_i915_private=xe_device

by leaving them on the same dir I was actually thinking if it would not
be possible to add a display/Makefile  so these additional defines here
are added as subdir-ccflags only there.

could we still do something like that for both display/ and i915-display/?


Also wondering if the part about being easy to track could be
accomplished by just having 2 `xe-$(CONFIG_DRM_XE_DISPLAY) +=`
with a comment above it or if being on separate dirs is a requirement.


anyway.... I'm ok with this


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>
>-CFLAGS_display/intel_fbdev.o = $(call cc-disable-warning, override-init)
>+CFLAGS_i915-display/intel_fbdev.o = $(call cc-disable-warning, override-init)
>
>-$(obj)/display/i915_%.o: $(srctree)/drivers/gpu/drm/i915/display/i915_%.c FORCE
>+# Rule to build display code shared with i915
>+$(obj)/i915-display/%.o: $(srctree)/drivers/gpu/drm/i915/display/%.c FORCE
> 	$(call cmd,force_checksrc)
> 	$(call if_changed_rule,cc_o_c)
>
>-
>-$(obj)/display/skl_%.o: $(srctree)/drivers/gpu/drm/i915/display/skl_%.c FORCE
>-	$(call cmd,force_checksrc)
>-	$(call if_changed_rule,cc_o_c)
>-
>-$(obj)/display/icl_dsi.o: $(srctree)/drivers/gpu/drm/i915/display/icl_dsi.c FORCE
>-	$(call cmd,force_checksrc)
>-	$(call if_changed_rule,cc_o_c)
>-
>-$(obj)/display/intel_%.o: $(srctree)/drivers/gpu/drm/i915/display/intel_%.c FORCE
>-	$(call cmd,force_checksrc)
>-	$(call if_changed_rule,cc_o_c)
>-
>-# Display..
>+# Display code specific to xe
> xe-$(CONFIG_DRM_XE_DISPLAY) += \
> 	xe_display.o \
>-	display/icl_dsi.o \
>-	display/intel_atomic.o \
>-	display/intel_atomic_plane.o \
>-	display/intel_audio.o \
>-	display/intel_backlight.o \
>-	display/intel_bios.o \
>-	display/intel_bw.o \
>-	display/intel_cdclk.o \
>-	display/intel_color.o \
>-	display/intel_combo_phy.o \
>-	display/intel_connector.o \
>-	display/intel_crtc_state_dump.o \
>-	display/intel_crtc.o \
>-	display/intel_cursor.o \
>-	display/intel_ddi_buf_trans.o \
>-	display/intel_ddi.o \
>-	display/intel_display.o \
>-	display/intel_display_debugfs.o \
>-	display/intel_display_power.o \
>-	display/intel_display_power_map.o \
>-	display/intel_display_power_well.o \
>-	display/intel_display_trace.o \
>-	display/intel_dkl_phy.o \
>-	display/intel_dmc.o \
>-	display/intel_dp_aux_backlight.o \
>-	display/intel_dp_aux.o \
>-	display/intel_dp.o \
>-	display/intel_dp_hdcp.o \
>-	display/intel_dp_link_training.o \
>-	display/intel_dp_mst.o \
>-	display/intel_dpll.o \
>-	display/intel_dpll_mgr.o \
>-	display/intel_dpt.o \
>-	display/intel_drrs.o \
>-	display/intel_dsb.o \
>-	display/intel_dsi.o \
>-	display/intel_dsi_dcs_backlight.o \
>-	display/intel_dsi_vbt.o \
>-	display/intel_fb.o \
>-	display/intel_fbc.o \
>-	display/intel_fdi.o \
>-	display/intel_fifo_underrun.o \
>-	display/intel_frontbuffer.o \
>-	display/intel_global_state.o \
>-	display/intel_gmbus.o \
>-	display/intel_hdcp.o \
>-	display/intel_hdmi.o \
>-	display/intel_hotplug.o \
>-	display/intel_hti.o \
>-	display/intel_lspcon.o \
>-	display/intel_modeset_setup.o \
>-	display/intel_modeset_verify.o \
>-	display/intel_panel.o \
>-	display/intel_pipe_crc.o \
>-	display/intel_pps.o \
>-	display/intel_psr.o \
>-	display/intel_qp_tables.o \
>-	display/intel_quirks.o \
>-	display/intel_snps_phy.o \
>-	display/intel_tc.o \
>-	display/intel_vblank.o \
>-	display/intel_vdsc.o \
>-	display/intel_vga.o \
>-	display/intel_vrr.o \
>-	display/intel_wm.o \
> 	display/xe_fb_pin.o \
> 	display/xe_hdcp_gsc.o \
> 	display/xe_plane_initial.o \
> 	display/xe_display_rps.o \
>-	display/skl_scaler.o \
>-	display/skl_universal_plane.o \
>-	display/skl_watermark.o \
> 	display/ext/i915_irq.o \
> 	display/ext/i9xx_wm.o \
> 	display/ext/intel_device_info.o \
>@@ -206,14 +126,85 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
> 	display/ext/intel_pch.o \
> 	display/ext/intel_pm.o
>
>+# Display code shared with i915
>+xe-$(CONFIG_DRM_XE_DISPLAY) += \
>+	i915-display/icl_dsi.o \
>+	i915-display/intel_atomic.o \
>+	i915-display/intel_atomic_plane.o \
>+	i915-display/intel_audio.o \
>+	i915-display/intel_backlight.o \
>+	i915-display/intel_bios.o \
>+	i915-display/intel_bw.o \
>+	i915-display/intel_cdclk.o \
>+	i915-display/intel_color.o \
>+	i915-display/intel_combo_phy.o \
>+	i915-display/intel_connector.o \
>+	i915-display/intel_crtc.o \
>+	i915-display/intel_crtc_state_dump.o \
>+	i915-display/intel_cursor.o \
>+	i915-display/intel_ddi.o \
>+	i915-display/intel_ddi_buf_trans.o \
>+	i915-display/intel_display.o \
>+	i915-display/intel_display_debugfs.o \
>+	i915-display/intel_display_power.o \
>+	i915-display/intel_display_power_map.o \
>+	i915-display/intel_display_power_well.o \
>+	i915-display/intel_display_trace.o \
>+	i915-display/intel_dkl_phy.o \
>+	i915-display/intel_dmc.o \
>+	i915-display/intel_dp.o \
>+	i915-display/intel_dp_aux.o \
>+	i915-display/intel_dp_aux_backlight.o \
>+	i915-display/intel_dp_hdcp.o \
>+	i915-display/intel_dp_link_training.o \
>+	i915-display/intel_dp_mst.o \
>+	i915-display/intel_dpll.o \
>+	i915-display/intel_dpll_mgr.o \
>+	i915-display/intel_dpt.o \
>+	i915-display/intel_drrs.o \
>+	i915-display/intel_dsb.o \
>+	i915-display/intel_dsi.o \
>+	i915-display/intel_dsi_dcs_backlight.o \
>+	i915-display/intel_dsi_vbt.o \
>+	i915-display/intel_fb.o \
>+	i915-display/intel_fbc.o \
>+	i915-display/intel_fdi.o \
>+	i915-display/intel_fifo_underrun.o \
>+	i915-display/intel_frontbuffer.o \
>+	i915-display/intel_global_state.o \
>+	i915-display/intel_gmbus.o \
>+	i915-display/intel_hdcp.o \
>+	i915-display/intel_hdmi.o \
>+	i915-display/intel_hotplug.o \
>+	i915-display/intel_hti.o \
>+	i915-display/intel_lspcon.o \
>+	i915-display/intel_modeset_setup.o \
>+	i915-display/intel_modeset_verify.o \
>+	i915-display/intel_panel.o \
>+	i915-display/intel_pipe_crc.o \
>+	i915-display/intel_pps.o \
>+	i915-display/intel_psr.o \
>+	i915-display/intel_qp_tables.o \
>+	i915-display/intel_quirks.o \
>+	i915-display/intel_snps_phy.o \
>+	i915-display/intel_tc.o \
>+	i915-display/intel_vblank.o \
>+	i915-display/intel_vdsc.o \
>+	i915-display/intel_vga.o \
>+	i915-display/intel_vrr.o \
>+	i915-display/intel_wm.o \
>+	i915-display/skl_scaler.o \
>+	i915-display/skl_universal_plane.o \
>+	i915-display/skl_watermark.o
>+
> ifeq ($(CONFIG_ACPI),y)
> 	xe-$(CONFIG_DRM_XE_DISPLAY) += \
>-		display/intel_acpi.o \
>-		display/intel_opregion.o
>+		i915-display/intel_acpi.o \
>+		i915-display/intel_opregion.o
> endif
>
> ifeq ($(CONFIG_DRM_FBDEV_EMULATION),y)
>-	xe-$(CONFIG_DRM_XE_DISPLAY) += display/intel_fbdev.o
>+	xe-$(CONFIG_DRM_XE_DISPLAY) += i915-display/intel_fbdev.o
> endif
>
> obj-$(CONFIG_DRM_XE) += xe.o
>-- 
>2.39.2
>
