Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E04C77B75
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 17:47:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1019910E2DC;
	Mon,  8 May 2023 17:47:52 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C60810E2DC
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 17:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683568070; x=1715104070;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=67AMGDeOLCkKq4ipMTVp3cX9crYAdGBCltNeRW5XCwg=;
 b=JvdNygXogVSzK1cDnbqxLR6PxK5NARa8//YI/sIKSyV9jSec+zQiH2Yk
 pFolCdOQhPpFyg8Ski9LNueYvycnJ7o4EGjmMuQl+60ZvO9nS1/omyXzz
 oNGRiUAEozHoFVNOcFgY+41bjJu2GhIDS90DHXrfnGEXobspSF35uZrfW
 NJJU2V92qbPRXBrmLAKJOGZDTHyWm5L4QRntZMgRaUExYs3kuNQPWOSco
 M0nmi31tEbI3myGAvBuXN+fdI6HjREmAuHPaxdr+Gde1adWl1JGrbhDop
 PrwbNHOmEUuHTfjmJeuwpwuT18nNtWXCwqjsxC0DRlC0uizJCtP/L3E8x A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="377810741"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="377810741"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 10:47:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="648987285"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="648987285"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 08 May 2023 10:47:25 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 10:47:25 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 10:47:25 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 10:47:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJQ8dTVwymLrSN8Bjo882VwxUO0UqOhaH8omypq9jtPIdGjJVq6z6ccxc5bGpMmCEvGzIdBNqA3pT9pRiKPwWCJi1cbvo+ijK5Oc2O39JlyiEl9carm29zFR3p7RRnSdFlgLKMs75KbAAyo2dhE4k+tBQGU6meU84Gs/rx9SI4ehilD9rKLw97pAeNP4EIOZPizX6JO2rJkRk6PybFlgSBws+wCPk4FY/U+O5/PzQkhCEFpGh8JctzZexA1I1+X87d6gtFlsdnLDaSeNnbGnW7lQS1U0sVb3eOMW09FilqZBGAozvBTfuFfcHsrod+aD0nnFuMpz5e2aBrsW95BDlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=52U/P4T0VAT6gRPUZU8ZOXFN0Kd4MnSHaoxyzdY8NL0=;
 b=kqKL3cWSuBbk9j3L4/puGFxHhJIxmTriiZuah+aLHz/FajmuHJr8bphS1ZisY74mevY3RlGxMq5RkrkKXM5ZNjomwWTTQKzt5U3c4bDFFNZ3b/d8j6Qk5MXtyXo2wEfELhh857XuHIyivxujfq1R2D3c21Qrdi5aVFZnh5dQc7fOC80tf/7P3Iat7F4b2lovXse2/QymH/moDDayrioteNTlqZ9o2mqHCmZ7px0lO7FTD3K7ySPkgr1HZJKeIWD4u0sd9Gvxiqj045d2en1kHbwuWUkbqtsSvKWDa07H5ZVvSnNCj3KSjKi/tcYQM9/Ld7+2Ku9bTmFBDaJEc75Pzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB8044.namprd11.prod.outlook.com (2603:10b6:806:2ef::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 17:47:23 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 17:47:23 +0000
Date: Mon, 8 May 2023 13:47:18 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <ZFk1phAb5RdmmY+h@intel.com>
References: <20230508144618.162140-1-jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230508144618.162140-1-jani.nikula@intel.com>
X-ClientProxiedBy: SJ0PR03CA0360.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB8044:EE_
X-MS-Office365-Filtering-Correlation-Id: ecd7624a-24b9-4d22-4414-08db4fec471d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 696AVA4mFJAT0vK7YHGrM5Q/Zi5inmky46DGegAx9hbN09gjM51OMghPUYUDMd2tA5J9zEpseUcUmSkNQv15bVpUZHLbcRXRU3L3vfn/1Sb2g3tovEZYy2sg3dwRUfR+uWVj172x0d7Bl6su8XvLm9vjp+y2bFTgXrsji5HgFLNKFdcVGeOfMUMr17jv5CWXfiU5Byoq/dZ1ciM1/RpG9MXpZ7jhEZCanij6RskwRFW5/cdV10v02NUNP+Ygl9kBz+HN6tDG8oHTS34YRmDCWmxoyDbO2rwBA13SVf5v8Mn0C344EY91Y9p+KmxFhHBODoFJrt4EmwsXpOkaDM0jON5mxFlzQKQZ/Vy6tn2asUjU37GyxESEwdvRidyNmbkUcyy9CUDDHiAEUmuqDR+R+5hvWnU8fH3cMbZpFObNmFP0oxms7wQZwQXiS2+Pht/XbwmGLAjzQ5kpYXdePXLwAuL3CxDlsSAiC3DYzzA92fBnJ5kmgpRq2HxiDTFU+yWsvza7omTeAJgWalgi19F5K0zM1FbbDkGd3I/Y+UktFzXLkMAKtbAxEtcYhjdjtQlesblxjQW43EbQ66ZL01qTEONuFKmGEH7+kDOmXKh6D20=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(376002)(136003)(39860400002)(346002)(451199021)(86362001)(316002)(966005)(37006003)(6636002)(4326008)(478600001)(66476007)(66556008)(66946007)(6486002)(36756003)(6666004)(2906002)(5660300002)(8676002)(6862004)(44832011)(8936002)(41300700001)(82960400001)(38100700002)(186003)(6512007)(26005)(6506007)(2616005)(83380400001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GX0wQ/r/FADVw1ffY9wiQQrjB8qH/r+Se5GshYcPghDCK7iC7ip5PnzdGe/5?=
 =?us-ascii?Q?2pO/O8NhuZl5xPvOLwJw3Nu9tFZJgRpjMeL+S6iuwcMPA/nr6HQQFYU7CoqN?=
 =?us-ascii?Q?Ttm+f+z4aTUXclT0UECuOY8xshIljr/SdbRQdJRF7X/fE9L8ouT/8I4+5RGj?=
 =?us-ascii?Q?5z2Et22tOk5oTsc+QhOTeleFOMbqLprDy/jvfMOoxeVrLUq6kLlgA/JdgNLc?=
 =?us-ascii?Q?eLEIwS+RPNOiYsJ+lOypV7cXUfxMrh3kRvMbz9gz0lLqu1nQv5r+/bVGE+nB?=
 =?us-ascii?Q?NWR73QOdxKldm8DboWJvO3x8hGrNJ5ULFRvit3hyP+Qu9NlWCAC+5wOdkrdY?=
 =?us-ascii?Q?44W8UiG9HhuP1q8vbr6GJYWod/YqeVylRNDbXlaUbbPbgLtXwO8q2K4u+JUB?=
 =?us-ascii?Q?XhT5C3caXjBJNxs3XVo+788kW92Dqytd9MrokxGxGDRuQxECF2xQpBHDnqwB?=
 =?us-ascii?Q?A6C7cAyKa4nIhov9ev8ajSCLiCuCDiLi1tHhCfIjRpYwBsY2YW2LX/PbH6ni?=
 =?us-ascii?Q?SMvdB5D2DCL52rsBoNDB/i9SxQLRqpM9q/05vZu7eLEwhLUr0PMlktsF1XS9?=
 =?us-ascii?Q?IAATkg9a3nOCNV/UEqV1cBxZU1H8EYlAmIdVQBl6E6BJbjYBJWl9/14Th01i?=
 =?us-ascii?Q?tGieUzFcaXaKEjjF75VqtJ+e19CXsrHwa7pDqkNwAhuGtFoFQE6Loqb9ujxG?=
 =?us-ascii?Q?WrFaYiJJJROwm3x7tPL3HdHvKFlG9vBp8daIh60gacGLd3jFmfFI+/mMuXYL?=
 =?us-ascii?Q?OeQ50PL+xyJ0sKtXIpLSp7SW3zAJ7br7l/9JNnQshmw97jQBiisCWc2+gRxA?=
 =?us-ascii?Q?BwkGZcggj2Mn47e3YiXcZegcgpP7qNrhbtQK8GoQo9GIhS0I2+BlN+3djZJi?=
 =?us-ascii?Q?3xqoSoFSw1A9AMzxyC1DCJbKHdOX5iWVnbSh+pX19kZE8029CDRiXFVqXlCO?=
 =?us-ascii?Q?GrSakg8g7MHjz4UT+oL2q1Uw4+J1S6isExmkeXUeo/qWOYaC/u/ttN/7Xuni?=
 =?us-ascii?Q?+aohqumrJ/0HtRnBI211I3Iiz9Yu+LWFubjN4zbDjQ69aIgZt9rpDFj4yV2x?=
 =?us-ascii?Q?tSUkdvykDMGwGi2idCKZP0pMWXdKuAj12TEnBsheZJD7i3z6Fdy9DNqXplTz?=
 =?us-ascii?Q?ZlrvaTdrw0jhD87kP0QDi/LMta3rTsoDFCrAoJ9CFBdNCng2K1b914hLSqrj?=
 =?us-ascii?Q?5JdY8QzMuhCtui0187UdirWnXNrvBSjF29gAIAr13gD5IyfIUkaGoZf5T/CJ?=
 =?us-ascii?Q?SmWjekpoem9H1vPo4L+OT8DY12k/WFhcG4FOn8vCo1XiYlAngGxXBjcLXWp2?=
 =?us-ascii?Q?3e4X/I7kHGqF8h0yfNVUHqK1MkUoUkah+Cyn19jBnnNHGvRNHFF5yaV4D8L1?=
 =?us-ascii?Q?tvtvoSWCVl0HWiSJ8hLeSmsfhqp2Ej2JNq3TF8GhziAgLwnFVx0AXAZMbyCS?=
 =?us-ascii?Q?z5N6HqN6g9VO1/GMINx4NdI9jgFkCUvk4ctKvf9r68peiGrJY3nk5BvAoMVc?=
 =?us-ascii?Q?kkrcrkxDbY02Luk0ghiAjRdyo2tI3qt9z33+H2Uh/WreaFMfdrtJlEyBRaoT?=
 =?us-ascii?Q?gJS+wQUlbnxRFKaq9A8TqBkwrJsVNms+SUPqvY03Sk7SNConHTSa9el/g46u?=
 =?us-ascii?Q?Zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ecd7624a-24b9-4d22-4414-08db4fec471d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 17:47:22.9705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fcRMX1T/CebPQmjcO69BonNAh+LIEPsI07s4LVUkqyk0ONxppQYk3Lmmwy4GzyR01t5V/gJPN2gdGMYeyzLQXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8044
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 00/18] xe&i915 display integration: add
 uncore and pcode compat layers
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

On Mon, May 08, 2023 at 05:46:00PM +0300, Jani Nikula wrote:
> v2 of
> https://lore.kernel.org/r/20230503131005.1602412-1-jani.nikula@intel.com
> 
> - rebase
> - fix rmw now that xe follows i915 rmw arguments

Thanks for the rebase.
I tested here on my DG2 and pushed as is to drm-xe-next.

I will soon perform the rebase --auto-squash rounds...

> 
> 
> Jani Nikula (18):
>   fixup! drm/xe/display: Implement display support
>   fixup! drm/xe/display: Implement display support
>   fixup! drm/xe/display: Implement display support
>   fixup! drm/xe/display: Rename intel_de.h to xe_de.h
>   fixup! drm/xe/display: Implement display support
>   fixup! drm/i915/display: Remaining changes to make xe compile
>   fixup! drm/xe/display: Implement display support
>   fixup! drm/i915/display: Add more macros to remove all direct calls to
>     uncore
>   fixup! drm/i915/display: Remove all uncore mmio accesses in favor of
>     intel_de
>   fixup! drm/i915/display: Remaining changes to make xe compile
>   fixup! drm/xe: Introduce a new DRM driver for Intel GPUs
>   fixup! drm/xe/display: Implement display support
>   fixup! drm/i915/display: Remaining changes to make xe compile
>   fixup! drm/i915/display: Remaining changes to make xe compile
>   fixup! drm/xe/display: Implement display support
>   fixup! drm/xe/display: Implement display support
>   fixup! drm/xe/display: Implement display support
>   fixup! drm/xe/display: Implement display support
> 
>  drivers/gpu/drm/i915/display/hsw_ips.c        |   7 +-
>  drivers/gpu/drm/i915/display/intel_bios.c     |  19 +-
>  drivers/gpu/drm/i915/display/intel_bw.c       |  34 ++--
>  drivers/gpu/drm/i915/display/intel_cdclk.c    |  45 ++---
>  drivers/gpu/drm/i915/display/intel_de.h       |  54 ------
>  drivers/gpu/drm/i915/display/intel_display.c  |   1 +
>  .../drm/i915/display/intel_display_power.c    |   3 +-
>  .../i915/display/intel_display_power_well.c   |   7 +-
>  drivers/gpu/drm/i915/display/intel_dpio_phy.c |   9 +-
>  drivers/gpu/drm/i915/display/intel_hdcp.c     |   9 +-
>  drivers/gpu/drm/i915/display/skl_watermark.c  |  23 +--
>  .../gpu/drm/xe/compat-i915-headers/i915_drv.h |   1 +
>  .../drm/xe/compat-i915-headers/intel_pcode.h  |  42 +++++
>  .../drm/xe/compat-i915-headers/intel_uncore.h |  98 +++++++++++
>  drivers/gpu/drm/xe/display/ext/i915_irq.c     | 118 ++++++-------
>  .../drm/xe/display/ext/intel_clock_gating.c   |   1 +
>  .../drm/xe/display/ext/intel_device_info.c    |   1 +
>  drivers/gpu/drm/xe/display/ext/intel_dram.c   |   3 +-
>  drivers/gpu/drm/xe/display/xe_de.h            | 163 ------------------
>  drivers/gpu/drm/xe/xe_device_types.h          |   4 +
>  drivers/gpu/drm/xe/xe_display.c               |   3 +
>  drivers/gpu/drm/xe/xe_mmio.h                  |   8 +
>  22 files changed, 298 insertions(+), 355 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_pcode.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>  delete mode 100644 drivers/gpu/drm/xe/display/xe_de.h
> 
> -- 
> 2.39.2
> 
