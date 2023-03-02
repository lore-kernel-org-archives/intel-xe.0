Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310E9C6FA8E
	for <intel-xe@archiver.kernel.org>; Thu,  2 Mar 2023 15:28:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD10F10E115;
	Thu,  2 Mar 2023 15:28:48 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B0F510E115
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Mar 2023 15:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677770926; x=1709306926;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=E+P/CGyp5Ogj8fpaR1FlkqrYwAQyarN8tkNY7zsjUO4=;
 b=GoDX/PMcxLrGj7ZN7wk6XXX39S9ACOPxH7Md9IecCphl1ewde647JTQV
 YX8wNV/n40EARypavyFN0cKWqaQ1zeSuRbcL0+dy3rRkHjAwPo34t4N2l
 f2mAAqHYxEPiDjaeh6SFTYP+3KKOncmzH23yrWT7gaBFaoN9Tc5tl6SLv
 JJRJATqvPllZO+Ruuohshc1xnttN0L9thpktRKLUolQT8+4Lf4/36J3TB
 o74ymE6AG79zeruFMnsp8BbxgyBYzG9b+ZnWSGQaEJaSqoL1yxI1Ax4w+
 iqNTyJaeqLDTWnJNngt1DzFw3bprZxxK/qoOFFEczhLsvQeHDglrID+os Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="421010765"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; d="scan'208";a="421010765"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 07:28:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="764039091"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; d="scan'208";a="764039091"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 02 Mar 2023 07:28:45 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 2 Mar 2023 07:28:45 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 2 Mar 2023 07:28:44 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 2 Mar 2023 07:28:44 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 2 Mar 2023 07:28:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UC065MomZXX4T8i5YjJH0fRIXy9PqDiSDSOgprX61dXTz46L1RFuYhpKHfbeTSyLC+Hfq5ZMlt2fgRWPvbZHgjJGoo/UEUtcdeM8whDsSbyDR2L+S7OGOWPU3B/hHyPkjfVaAeqZLsDDI1sxS8lpu1c+/d3st7gNFR7yidMX/y95XSmFygDqiuELhXky2Gx7y59pdxp6f3LeJo8oSPwt4Qjxt2gpnNLrVtV5bHLy9SZaII1BDzJnJtkgJU4ZzfhapC8WkImAEMl5Uf+lREUZcPtbaLH0ppr11iYGcTeHMklJlDHRsNLDT+u2pofsD1xKB9KFG53JoCMc/eFiCMzk3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wFwqWfsSKOoTpJfL/ZCGHBdRg+Lae+gXQtZSGWzrf64=;
 b=fu6Pq+pfg2paTrhURaZQEuilfgyR+ydGfjDoW9xiYxJFK7gG1u/x3VvGMEh2eLm9Hd9uXYaJ7+AN4zrgy+jElayl7DyAyoHGUQATzJq1r6DwKH4dYKtMQM553wWsJamFVMuHs75glG3tcZmvwQHM5ex3xhTlVgXNciS+vCTpUUhSN7vZz0nbWQr3YG06UhsTuN2X8lincc9Ha9PhmwIzt/IIM1GgzqGiKcv3ClN1E1dccsr4GyJX1h01Ui7Ww6x2XWplA2mmSWHvju/JGbCnOK7NNqgoykc5NnhZNjTpHuFxKR9t54Trgc7wg0yoRtzuL7ifhpMuFydLuWSatapoIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7073.namprd11.prod.outlook.com (2603:10b6:510:20c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Thu, 2 Mar
 2023 15:28:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%7]) with mapi id 15.20.6156.018; Thu, 2 Mar 2023
 15:28:41 +0000
Date: Thu, 2 Mar 2023 07:28:37 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <20230302152837.5lpnbzwciupdbkoa@ldmartin-desk2.lan>
References: <20230302141230.2804699-1-jani.nikula@intel.com>
 <20230302141230.2804699-2-jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230302141230.2804699-2-jani.nikula@intel.com>
X-ClientProxiedBy: MW4PR04CA0278.namprd04.prod.outlook.com
 (2603:10b6:303:89::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7073:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c82ff0b-33d0-4483-0b99-08db1b32cd1c
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: URsyUKQM4fI0rq1iPsTSqGWKs7EttVPdjkkbb4yTtY63TPN7CQFFeVKimEDDjO0ae7pYI0r6kfZ6CeKDWad0bs9eg4siMETjndJX4UCb/bpy4Utz8ZCusCejSOWpBGlPkDN/raWqGzELG8Lc/O/mzdocYHwHuHnOPjf+9ZePwFNnQNiXexYP3gV5wyz3/xY85h/Ilxa2LO14cOGT/eIndwOqfVLzdWmNvJ5f+hj8m84moyehK+4m+00mqwVaPFi5B3JoXxQhkqiVLkqtlqAKUn/lXzx90k5ReKbacz6N65BiOEB31MOM5GiX/E2uD/ygoPDO4FyEWUZnSZECpi8ajNp55bsbcWX7xQ0HRVP6DHXiAjnSG3+rWvuJW5WIOzuDmCOb2dOQ7ZUGozTTFiQqdN60fdTHGOzx0imVlJ8aFfXVu820q4uy3WxuAz6alYJ+d9GqMzLbZVYxwbYFheRHVrAvHJcXhf1F1gvTb+gCfK6aVXmfjPJDtdH74kTmmrlDs7h7p1Y6wvDxqTPGcMax6/ujJyhFaKjBV97Eu5a9YbzyGfKfjOJBTR0u2r53SmMGqVToyNW+0kLY4tCgVrKI0DoPimZI794EC8HqUpv3WZRzb5eOO216nUyOfYvIEE+3Ot87Uys9U/ESB6hKXdjHKA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(39860400002)(396003)(346002)(366004)(136003)(451199018)(8936002)(6862004)(41300700001)(5660300002)(2906002)(478600001)(6636002)(6486002)(186003)(26005)(4326008)(8676002)(66946007)(6666004)(6512007)(6506007)(9686003)(1076003)(66556008)(66476007)(316002)(83380400001)(82960400001)(36756003)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yB54YMWXqYnTGFbPl1AJONtaeBA4ZJpL7Dc4IOOsbT8YcrJD4ALrujx8kwtS?=
 =?us-ascii?Q?RuVUeusM1GOCOGbp2o0yWz7P0Y+yTl68C/+wkp600ri3AuhASq9/QmFhgjvU?=
 =?us-ascii?Q?ZQ1zClxSBsLDVvfkgbN86+gI6XjPksdXbdAyGiiW4v8CA9NENtGiTwYq474c?=
 =?us-ascii?Q?Lj9fQDayAc/ADRS3TNuXB/LVjy/8AX50T5GEgBkoI+32DL1uBEL53yQg7vfu?=
 =?us-ascii?Q?xsbNlHpjs9vw80jtb8I4xwpR4gf6xly4Fsdcgx11sAp+C41xQMCkJQUiDH7e?=
 =?us-ascii?Q?pELN75CG6SfVi7rUZIeQfgkh2AfjAqjEIz2lo2QABYYF9bpfyGuOE9ESygiW?=
 =?us-ascii?Q?Ww/vkiLYkdiv1AAHIchVMcK5B9URSmZ9lFPYOeDJzYZ/ZY+7KTu7iNqF2hlO?=
 =?us-ascii?Q?tcpOPOqtuAn2IDF/ueOShGhGl77//lxkoOEDKL7Q3IOJwd0AvXlCMGs3z3Wb?=
 =?us-ascii?Q?B9+coNkpeqpw77lmeYswRIQR8Mdf2peaKcnmwHb1i8cMWvtu4KPOw/xsiD3c?=
 =?us-ascii?Q?NGn7iXqmS+3K/HXbbHyjHNy4ru4cauragh9TjwQihiVpZVgIA7r+qmncm3BA?=
 =?us-ascii?Q?9kR1LB5vdqb5sRCPD81FHqB47J8yc40Igrwc5zuviehiRkQmsoBbwvABlFpK?=
 =?us-ascii?Q?n105vf4EmjA8NFBDQsqciicBMeehPiLm9hIyVWRrXSgwGXNaf0gkZhWghWPp?=
 =?us-ascii?Q?fDhlFJhwMkHrnXt2Ked2TTK7o521ZxzV4+CQSPm400Q03uEV92ICEqknMMIL?=
 =?us-ascii?Q?D2TO4wYBk/5zTdJT2WoGHiXUc/tZkxZz9Viaxr+uX/sE0r8i8xMaR7d702TJ?=
 =?us-ascii?Q?zDQJ34qan4oqHUQVzQNn/TtqMSewvfq3R1v+ZM3VrvZn+42TGAEoUiun0TKi?=
 =?us-ascii?Q?zTPUiYWgk+HQhoUJr3VtIRPov3T/EmSW0w4sEsQVRPNu36CLIUkgJin6yMUb?=
 =?us-ascii?Q?HgJ9SBCxAKxtuJ6pnBL2yzygmfU6gOHYV0XFaB0FNXOKic2kmzMP5xx9VPpA?=
 =?us-ascii?Q?OslSHAaQUvtBSBKBByWd95YvmjDnHbYyzZXoLoXRwhyr70cAzBQGLgWxYGxH?=
 =?us-ascii?Q?1Me4aymKvLseRBW1+bUDkQSFMiUuNkQwb2a1RQ9hjnSdOJUMaUf5GeiospO1?=
 =?us-ascii?Q?xXZQX1zKO2vBPfb+ApClnQYXllr5QhfcCpZkaKETqD+yzUgLyUNJUz1l2oOh?=
 =?us-ascii?Q?Fui0EigVDS6PtSimtHR82efQYhJLUVBIxgN6sTW0jkbvuYWvHr07fDK+d7Ac?=
 =?us-ascii?Q?BMtPgsPQj0MlNXXR2ERt9g5WnBIVfNK5uXq5Y1OXdapdY5sM31JbLlSJiHY1?=
 =?us-ascii?Q?kb3gnPVlS96kZvZsOB/SY70OPfXzuVMnKHpQ9EYd8CL8nuhoNVoAs+ONR57u?=
 =?us-ascii?Q?AGcdjl0ANvkMqt6MOhBdHiXq6jCeD8NpwM+ylxsWorn/XyG8mNnsP6rXPSsk?=
 =?us-ascii?Q?1I8AJrwbD16vDfh3xyemvPkK87Yia6KMFQyXXGwI4E39Wn/kibG9y4L0gwsj?=
 =?us-ascii?Q?f93pFtPVbj25q9GIyginx0ugUIMOzK9ktlpwogrtPU9OTATPezc0jyYVRX3E?=
 =?us-ascii?Q?H9bh2s9mX8P6vNV3gAtqc2TkTIc1q7KDGrf+7n2xPAxOIc/b/OupmeA/yV3X?=
 =?us-ascii?Q?nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c82ff0b-33d0-4483-0b99-08db1b32cd1c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 15:28:40.8725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MfoJFsR7lm0w3RpqHo9bzJvB6c5KISAczqHF+A0DBN9g1yzQWoNqGypM08qVE56moHdYKgOC+jx4kwqlWKswfO0qpTMhJ7FHDnTsVd7WTcM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7073
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/8] drm/i915/display: don't use relative
 ../i915 includes
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

On Thu, Mar 02, 2023 at 04:12:23PM +0200, Jani Nikula wrote:
>We can't have this in upstream i915, so don't try that here either.
>
>Note: This should be squashed to the commit adding the relative
>includes.

is this a requirement?  I think squashing this is not very problematic,
but it may not work as the build infra with the different -I also
changes in the tree.

I'm also wondering why we have these changes at all in the xe side. Was
it maybe a temporary solution not needed anymore due to the -I added to
the build system?

Another idea would be not to squash it now, but only at the end
with all the i915 changes together.

>
>Signed-off-by: Jani Nikula <jani.nikula@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/i915/display/intel_backlight.c     | 2 +-
> drivers/gpu/drm/i915/display/intel_bw.c            | 2 +-
> drivers/gpu/drm/i915/display/intel_cdclk.c         | 4 ++--
> drivers/gpu/drm/i915/display/intel_display_power.c | 2 +-
> drivers/gpu/drm/i915/display/intel_gmbus.c         | 2 +-
> drivers/gpu/drm/i915/display/intel_opregion.c      | 2 +-
> drivers/gpu/drm/i915/display/skl_watermark.c       | 2 +-
> 7 files changed, 8 insertions(+), 8 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/display/intel_backlight.c b/drivers/gpu/drm/i915/display/intel_backlight.c
>index e63eb43622e0..5b7da72c95b8 100644
>--- a/drivers/gpu/drm/i915/display/intel_backlight.c
>+++ b/drivers/gpu/drm/i915/display/intel_backlight.c
>@@ -19,7 +19,7 @@
> #include "intel_dp_aux_backlight.h"
> #include "intel_dsi_dcs_backlight.h"
> #include "intel_panel.h"
>-#include "../i915/intel_pci_config.h"
>+#include "intel_pci_config.h"
> #include "intel_pps.h"
> #include "intel_quirks.h"
>
>diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
>index 67b4e947589c..54e03a3eaa0f 100644
>--- a/drivers/gpu/drm/i915/display/intel_bw.c
>+++ b/drivers/gpu/drm/i915/display/intel_bw.c
>@@ -15,7 +15,7 @@
> #include "intel_display_core.h"
> #include "intel_display_types.h"
> #include "skl_watermark.h"
>-#include "../i915/intel_mchbar_regs.h"
>+#include "intel_mchbar_regs.h"
>
> /* Parameters for Qclk Geyserville (QGV) */
> struct intel_qgv_point {
>diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
>index 3b6a37403f25..ecb87542ebb6 100644
>--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
>+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
>@@ -32,8 +32,8 @@
> #include "intel_crtc.h"
> #include "intel_de.h"
> #include "intel_display_types.h"
>-#include "../i915/intel_mchbar_regs.h"
>-#include "../i915/intel_pci_config.h"
>+#include "intel_mchbar_regs.h"
>+#include "intel_pci_config.h"
> #include "intel_psr.h"
>
> #ifdef I915
>diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
>index 00e32a423708..3315d2bbebc7 100644
>--- a/drivers/gpu/drm/i915/display/intel_display_power.c
>+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
>@@ -16,7 +16,7 @@
> #include "intel_display_power_well.h"
> #include "intel_display_types.h"
> #include "intel_dmc.h"
>-#include "../i915/intel_mchbar_regs.h"
>+#include "intel_mchbar_regs.h"
> #include "intel_pch_refclk.h"
> #include "intel_snps_phy.h"
> #include "skl_watermark.h"
>diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
>index 2d099f4c52cd..0bc4f6b48e80 100644
>--- a/drivers/gpu/drm/i915/display/intel_gmbus.c
>+++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
>@@ -39,7 +39,7 @@
> #include "intel_de.h"
> #include "intel_display_types.h"
> #include "intel_gmbus.h"
>-#include "../i915/display/intel_gmbus_regs.h"
>+#include "intel_gmbus_regs.h"
>
> struct intel_gmbus {
> 	struct i2c_adapter adapter;
>diff --git a/drivers/gpu/drm/i915/display/intel_opregion.c b/drivers/gpu/drm/i915/display/intel_opregion.c
>index 057a68237efe..e0184745632c 100644
>--- a/drivers/gpu/drm/i915/display/intel_opregion.c
>+++ b/drivers/gpu/drm/i915/display/intel_opregion.c
>@@ -37,7 +37,7 @@
> #include "intel_backlight.h"
> #include "intel_display_types.h"
> #include "intel_opregion.h"
>-#include "../i915/intel_pci_config.h"
>+#include "intel_pci_config.h"
>
> #define OPREGION_HEADER_OFFSET 0
> #define OPREGION_ACPI_OFFSET   0x100
>diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
>index 381d4f75e7c8..e254fb21b47f 100644
>--- a/drivers/gpu/drm/i915/display/skl_watermark.c
>+++ b/drivers/gpu/drm/i915/display/skl_watermark.c
>@@ -16,7 +16,7 @@
> #include "skl_watermark.h"
>
> #include "i915_drv.h"
>-#include "../i915/i915_fixed.h"
>+#include "i915_fixed.h"
> #include "i915_reg.h"
> #include "intel_pm.h"
>
>-- 
>2.39.1
>
