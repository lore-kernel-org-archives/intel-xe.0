Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1474DC678D4
	for <intel-xe@archiver.kernel.org>; Fri,  3 Mar 2023 06:28:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C756310E5EE;
	Fri,  3 Mar 2023 06:28:55 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF06110E5EE
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Mar 2023 06:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677824933; x=1709360933;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RAyt+xWupNENv7ukVvps0JImtWCWX6SAUggaSYHxqmI=;
 b=ORT0+2hU1R8ZR1lq5Xu089knSmGDg3SNJkYKDUTAGLsGcVXEZlfxvHxL
 Ex2gbZUWF83SgAovfSZkm95tMnU3mvbM6VIb4ZiCGRtV4CsXQme9DDz8T
 +ppjbRQ5hyJQGOnVuk7i/50uz3Kh3RXL35mLDmU5CZCNtfCOS4BxH6Mkw
 D59iJ+fdRuH8XmEBpWF/v96O43l8IuD9WyJOfVkx5atdHTvXgK/qeEZWN
 NSQGtlz2kkjCcPF/j8a1Ts/juD9vVAlKK9abfFGMFYSRXZq5QCDTNX2fu
 Z/xnI+0ci7QGqbn9nrCyzy5IbAUKBKR98DQa78o8PGFmCOoUPBvY42lP9 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="314626930"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; d="scan'208";a="314626930"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 22:28:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="744145676"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; d="scan'208";a="744145676"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 02 Mar 2023 22:28:53 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 2 Mar 2023 22:28:52 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 2 Mar 2023 22:28:52 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 2 Mar 2023 22:28:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JXjsG70i/T1et9WU7qZ6NQe1GfWjpRCwvtO9WKzQZ0QRZ5d02RtAmgm8zPOxG8zAMPt3hyR2benZhpE3BbNtMW3PmqX/B6Pk8wb+vHGlFgdTJ1gVSA5CdBQY5KexKMHWXTc6Oh1iQhZPRhRY+PzSNRsKBHbzHSau+hgHwlqZ3+03lnp+1uR79M9RNEzQu/BD+n1eL0YDH/m2eOKqcxR2x4dpGy4Nk9HBggPDjFA30VUWesezydqRC/AiW5s13ZrKdYIvmGAFA55zUWRzcXaoQ1g6iqa9efur+OFU3lL3qkW1ewYznq1rwfzjK1M8+r8Zc2fu1L5MJWtFA84ewMeq4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQ7GpgchnERlqs/US/Ar16xHYJafgYHcFu7hbfQnIzE=;
 b=g7uMxQitQAN0E0GfSz3GxVriY2NaWQYVq8A35SDd5pWuGgcwtfVi3r1zQPYxoXU1C4OHPfzbb+1aNDHYQge0NhBidMLBZxqt/KycajgkEd5lnVk5DN6KIPqddjHQBuS219QrXPzjr1BsxMd8Nirqu7Ggp3yaDhj8GKAW5Eidnam7eW1Tkic+oCs1T7xik7v27x3mM689MZ4CfVuP198ZzunBuqPgth8mGQGHzvH8J2bqkm7u5dBpalpdt5zLd67xfexEV7m4heiQuBPdIyfTEV0QX8FFyMAraEjUkrGyIEoLwgx8gwCAAK/ybjCPmvY5SALTm8AWmZTd/lAWh0AYpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7286.namprd11.prod.outlook.com (2603:10b6:8:13c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Fri, 3 Mar
 2023 06:28:50 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%7]) with mapi id 15.20.6156.018; Fri, 3 Mar 2023
 06:28:50 +0000
Date: Thu, 2 Mar 2023 22:28:47 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <20230303062847.woxogxs27o3vu4d5@ldmartin-desk2.lan>
References: <20230302141230.2804699-1-jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230302141230.2804699-1-jani.nikula@intel.com>
X-ClientProxiedBy: BY5PR16CA0020.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7286:EE_
X-MS-Office365-Filtering-Correlation-Id: aca814f2-2502-4958-7d4d-08db1bb08ce3
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x0rUwnLnrZz7SU+FR5Ai/qNUmlRnpHRLzsSt7TyTaF2vYy2iczMwkWaR8M5+bi8kCKsBemn7Up0UGfNsXAchSD/I2z+mpO9Hahv2KgXASTb7BgNzt9rTLh7/o/jv1HFlGlNhSXtcFxLS8ajGnVpJlQW5CSm0/b92dr8X85Co9ziyWhj5T50Ks8hNTWmwzwC6BY2O4zW0eD3NSDOpexhe/zukB/f2PJ+bc8aRWiGKAwr0PZAtMWZIyLw6QCnwfP9TNi/zrouIg24fXS6sXauGmMK5Wyck479Hf+2OZYvYHvxzi/AHLHT28R7TO2FsB6AME6NuYXpEXCSPSRAkjI6PsWWxHhzPd77ECCprFXYWsXSPUassjppSwgL2AoJcDk7uiGO4I8C/FijWIHBWrnqXh53lHm5BTmbvkHuAcBmADD+DBucoyLYfi8VPhYNQmbKJzWYE5ySVDbXZYFdatzAsiiBwnzcM6uaEY/ew6kDRsCd6BmZGrdzTT9KkiWHiIWvCcTbpggPPxA3UANTtuw4zVF9MPlNR00M3+haRjKZAC2tp2KmeL6UmhY1r9A+8TC9YzThsThwC4V7niEsXSBIpXA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(39860400002)(396003)(376002)(346002)(366004)(451199018)(86362001)(2906002)(66476007)(6862004)(66946007)(5660300002)(66556008)(8676002)(41300700001)(4326008)(38100700002)(8936002)(82960400001)(966005)(6636002)(6486002)(316002)(36756003)(478600001)(6666004)(9686003)(83380400001)(26005)(6512007)(6506007)(1076003)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VMLowho/sD4SI8Z2VHhIrfn5E1eHGpAD023dNOgPF1FzP43W/+qnn29ELUiJ?=
 =?us-ascii?Q?I03SAmK834P0E2MhUA3EMHdYdY1omMLH7PwHcXo8D+1c0ZRN5YZXP4BseTjv?=
 =?us-ascii?Q?i0C8RnjpgM08vtgzTjQWfK8KbnjuBEvn8aI3Xjjnc8H0dGLJ89Cdw6VeA0H6?=
 =?us-ascii?Q?yiCAbpaKXTXpe7+HDuCfZCM3MYY7u2YqAsnrZi6vUFJxZMAYA4qPJa4rbl9u?=
 =?us-ascii?Q?Oa5b0m7ByTiME5/83B8nY5RrRyzzhNvOvq6PVxYudYTHKYHA7fkwclxBgp6r?=
 =?us-ascii?Q?a7GUSJSHfsT99PMT9t+kSywlC6Dc+ZSnuS1o5ojv/AsHgLPik9h/VFS8Dmkb?=
 =?us-ascii?Q?Bi+2aYEQ0Qluxr/OWdoPA/YpMi4EMBSEv45UAnbj3KcCgrZINhhQnCfJ8MvR?=
 =?us-ascii?Q?FYFr45HhO0KfAgebWCf20/JQh/Gxu777JElEKr6tAMFXs+zyv8mrU5fiTnaA?=
 =?us-ascii?Q?3lerkWnGeFI01UL7CpOiecqgOgbaEyrC68xtYW3nNIr5gaf5mhigHNK22AK5?=
 =?us-ascii?Q?2tB/Df4fuKvuhfQpOLZUvhAmG9HplJnDTrfMGn19S6FcOUN4U7oUO38zwn16?=
 =?us-ascii?Q?dsnecVonw2xLTqrRPrBNTPGdARSVhKAOfFIKkwhG6mhwgSjs7GLO5mVIQSYM?=
 =?us-ascii?Q?Ktp9ORpfd1lsESFRecn2pTWFEWO2jqyPaBflB5V1C3+lxnko2gju3anQ1zE3?=
 =?us-ascii?Q?PrJKIvu5TgQpheHpBF9mPqvKdnl8Xfg4MCoX8u8JTy8cTSqgQBLGq6EoeO4M?=
 =?us-ascii?Q?+9xnxBl/itn57GqxfYW5W1yYlkWVBMUlpNzykKLSXB865fP2k3SxQGVDRmvg?=
 =?us-ascii?Q?G4ove9m2CuCMAqt/LMCWlxai+w36V7ea/D8zVWk+WmlG5n2FWxpnCQ//ZO9H?=
 =?us-ascii?Q?pMd8C0On8sIl/8vl7f1f9dXt0JDq6JXUj1pZgjB86zIF0+reu5FnTUiQPkAo?=
 =?us-ascii?Q?dvbGaEjdueZ6SFXA/aZrZykND23dMnnX9WP73FdBu1dWi0fQXyiHMedzwPSF?=
 =?us-ascii?Q?eTEbMHyTHEt5Ge9ql9hY4jZhs5d1gIGxsSkudhhRt6boJvKJ6URZ80anormD?=
 =?us-ascii?Q?3lZjMauqYCZCYAsOZHWYPgAiB5GNE/OW1rYKbq70k+unk3LVom8AAhqKnnIH?=
 =?us-ascii?Q?M0VpD3WgdcEtdYUFNiUuA/TdC9ZiG0xjlo4RSQrX2zYmBHHoV8BMALvy0VbZ?=
 =?us-ascii?Q?5A0dhpDW6UWuZ3NqIvtwfNJZyCRwEdmv2+j/mM7lQKe4lwnFMzwEY07IkaOj?=
 =?us-ascii?Q?358W7R4N8CM8/H7UeU0sBV49VUsdMNbzMjn5R3G6qnpL0W86EXWf1e9Vht9i?=
 =?us-ascii?Q?XJIU63NDmS5Q4ALXfITJ1FPoBJ8ZsQol/uZrbdk24Z7ZSnxtgbcCSS8Cw+66?=
 =?us-ascii?Q?kffmCxARIDZskkDx5g+/Xq3tmnn9ZBY7qP9Cr4hRdn3j8veqaSDTWRrwEKdM?=
 =?us-ascii?Q?Ya51new7PoYajrrmHCA2IW0L0QN3ktkTuPr+l6T+1hWrWVuS7Sozq53pWEqW?=
 =?us-ascii?Q?w6sr2shiX1gS3vp9tbyfgWI4CH8PMOn9gn4Cy0P0mky1cI0eBdVQRroQflDh?=
 =?us-ascii?Q?yuM1UY/z/hiwTadvsSNdhLjhDhRCFfroR2aeiGHUODi66YDDtBqDSkgDpp7u?=
 =?us-ascii?Q?LQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aca814f2-2502-4958-7d4d-08db1bb08ce3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 06:28:49.8406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: obGUGhHAxlzU5EGtIMyI1X5k5ojtHrivEwa1MVN1yTEIeSCP3L4uyp5WPYMlAaXz6wzLlKRSsgwnALkoKigIf89zD4jwcHA5gE8bABR3Zz4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7286
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/8] drm/xe: clean up i915 includes both sides
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

On Thu, Mar 02, 2023 at 04:12:22PM +0200, Jani Nikula wrote:
>This probably needs to be rebased on top of "Encapsulate display" from
>Lucas. Sending to present some ideas anyway.
>
>1) Clean up changes to i915 that would not be accepted to upstream i915
>
>2) Never add top level i915 directory to include search path with -I,
>   not even when building with CONFIG_DRM_XE_DISPLAY=y
>
>3) Instead, add the handful of proxy headers under compat-headers/ so
>   that we have an explicit list of headers that we include from i915,
>   instead of hidden by the search path
>
>4) Currently compat-headers is added to search path unconditionally, but
>   after Lucas' changes we can move that to CONFIG_DRM_XE_DISPLAY=y
>

I think everything here is sane and I like where this is heading.
I left some comments on the patches. Particularly the last one needs
to be adapted as it conflicts now


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

for the series


thanks
Lucas De Marchi


>
>BR,
>Jani.
>
>
>[1] https://patchwork.freedesktop.org/series/114541/
>
>
>
>Jani Nikula (8):
>  drm/i915/display: don't use relative ../i915 includes
>  drm/i915/display: drop redundant display/ from includes
>  drm/xe: drop unnecessary include
>  drm/xe: drop redundant display/ from includes
>  drm/xe: drop redundant ../ from includes
>  drm/xe: move all top level i915 compat headers to a separate
>    subdirectory
>  drm/xe: remove unnecessary include
>  drm/xe: drop top level i915 from include path
>
> .../gpu/drm/i915/display/intel_backlight.c    |  2 +-
> drivers/gpu/drm/i915/display/intel_bw.c       |  2 +-
> drivers/gpu/drm/i915/display/intel_cdclk.c    |  4 +-
> drivers/gpu/drm/i915/display/intel_display.c  | 48 +++++++++----------
> .../drm/i915/display/intel_display_power.c    |  2 +-
> drivers/gpu/drm/i915/display/intel_gmbus.c    |  2 +-
> drivers/gpu/drm/i915/display/intel_opregion.c |  2 +-
> drivers/gpu/drm/i915/display/intel_psr.c      |  2 +-
> drivers/gpu/drm/i915/display/skl_watermark.c  |  2 +-
> drivers/gpu/drm/xe/Makefile                   | 11 +++--
> .../i915_active_types.h                       |  0
> .../xe/{display => compat-headers}/i915_drv.h |  2 +-
> .../gpu/drm/xe/compat-headers/i915_fixed.h    |  1 +
> drivers/gpu/drm/xe/compat-headers/i915_reg.h  |  1 +
> .../gpu/drm/xe/compat-headers/i915_reg_defs.h |  1 +
> .../gpu/drm/xe/compat-headers/i915_utils.h    |  1 +
> .../xe/{display => compat-headers}/i915_vma.h |  0
> .../i915_vma_types.h                          |  0
> .../drm/xe/compat-headers/intel_mchbar_regs.h |  1 +
> .../drm/xe/compat-headers/intel_pci_config.h  |  1 +
> .../intel_pm_types.h                          |  2 -
> .../intel_runtime_pm.h                        |  0
> .../intel_wakeref.h                           |  0
> drivers/gpu/drm/xe/display/ext/i915_irq.c     | 18 +++----
> .../drm/xe/display/ext/intel_device_info.c    |  5 +-
> drivers/gpu/drm/xe/display/ext/intel_dram.c   |  2 +-
> drivers/gpu/drm/xe/display/ext/intel_pm.c     |  6 +--
> .../gpu/drm/xe/display/intel_display_core.h   |  2 +
> drivers/gpu/drm/xe/regs/xe_reg_defs.h         |  2 +-
> drivers/gpu/drm/xe/xe_display.c               | 26 +++++-----
> 30 files changed, 77 insertions(+), 71 deletions(-)
> rename drivers/gpu/drm/xe/{display => compat-headers}/i915_active_types.h (100%)
> rename drivers/gpu/drm/xe/{display => compat-headers}/i915_drv.h (99%)
> create mode 100644 drivers/gpu/drm/xe/compat-headers/i915_fixed.h
> create mode 100644 drivers/gpu/drm/xe/compat-headers/i915_reg.h
> create mode 100644 drivers/gpu/drm/xe/compat-headers/i915_reg_defs.h
> create mode 100644 drivers/gpu/drm/xe/compat-headers/i915_utils.h
> rename drivers/gpu/drm/xe/{display => compat-headers}/i915_vma.h (100%)
> rename drivers/gpu/drm/xe/{display => compat-headers}/i915_vma_types.h (100%)
> create mode 100644 drivers/gpu/drm/xe/compat-headers/intel_mchbar_regs.h
> create mode 100644 drivers/gpu/drm/xe/compat-headers/intel_pci_config.h
> rename drivers/gpu/drm/xe/{display => compat-headers}/intel_pm_types.h (95%)
> rename drivers/gpu/drm/xe/{display => compat-headers}/intel_runtime_pm.h (100%)
> rename drivers/gpu/drm/xe/{display => compat-headers}/intel_wakeref.h (100%)
> create mode 100644 drivers/gpu/drm/xe/display/intel_display_core.h
>
>-- 
>2.39.1
>
