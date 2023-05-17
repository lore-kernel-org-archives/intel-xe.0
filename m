Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98570C77B7D
	for <intel-xe@archiver.kernel.org>; Wed, 17 May 2023 04:56:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B6710E3A1;
	Wed, 17 May 2023 04:56:59 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA6210E3A1
 for <intel-xe@lists.freedesktop.org>; Wed, 17 May 2023 04:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684299416; x=1715835416;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=R2ZO8jSwXOWWlvIIQ73EPsOaVdeHVmdXlPvormgPqi8=;
 b=nnb7UIHLgm2/gu07agFxCEYDKsudfkEaTC0sc2HB4bcvu557Dhflcmdl
 L02iliuu92nk1e7heDhPwKhVWwalZ9K3aIruEDJCUEapg5MwaBlzDNUZo
 /DwBSKsG0AujJNhP7NTDM7Ktk/oYV8yswAU9QuudlCpEeRm//+aHhjnXs
 QVbLY0xPBUw4pPhWuIcXasBM2NfNKctQRUoQcMqFKI+gtkWVN1z3rai/h
 YmumuG3usJfYKN3zjCuJ4JhcuMyS95I/tUTKb+MxJysvjJ1q7darG/mJd
 yHoMG0bY4i6OuCreRQvoOW1C67gJCaeWDUHFxBgOeQFQXh2i4DiFdw1IO Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="351690574"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; d="scan'208";a="351690574"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 21:56:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="679128608"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; d="scan'208";a="679128608"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP; 16 May 2023 21:56:55 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 21:56:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 21:56:54 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 16 May 2023 21:56:54 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 16 May 2023 21:56:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nocRoqbwKn2av+NKOM+FHspZfdPLgH/NYUvlLMSBUq19m/S1TkDIMBAacTCkcp2M9lcq5cDAFhBHJiqsT/RcbQztAH0udaYuJClsuvcLXOUfqOH3rBhFxT/cYKYpv0xwixszqaNiuqOkX404W5jzhYr6ZkVs3h18NN9n6gdaliM/gaT/uVfy3JYsv8xLaaJSRHYhhWrHXC6ufQ/oRGEKaFO0gK9+VXx3qkBXZ/GmE+TyOxG248OTeBiHFQtOeIe+CcXAyhjowd8FlWnWZSdhs3eVXA9JPB00+4WhESTBaQMuRAENZXuv+FGnbXkmfVKc1I+xA2ss6Bu/R0UhWXN2Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RmVB7vLrAcLokH+zcIPUS3H1JUygZqI+X3BfTLKhWj4=;
 b=ld9OITwBt16fhZ4jWMo5vRGfPYc2/20/hisirMr8HTvolc+jSiKyXfQQRrJPNeRdboe26yA7zriN9yLAoHtatJOy6LhIrDgAd2Qox4q9T0uhLp3blS2S8bKZOh3vbBcMhM89IZgrol3v5YNFvEncXiloEnkhQZBCZ2ltggSLN39y4Z+mpYakXZe2JU8gkH/lsAyO61E3bSpsn0bYu2+0xoGJ73ydxachaSSdH1mG8A254lLIY7wM3qQvhXh7TrG4EZLpC8SzqUj6aczmOvBdZH1MMAN8HwY5ZhJoU6mLRMTKOM/u7m+iioFtGmo2eIXwDpcY4UqBs3MGM597U6Apnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB7667.namprd11.prod.outlook.com (2603:10b6:806:32a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Wed, 17 May
 2023 04:56:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6387.033; Wed, 17 May 2023
 04:56:52 +0000
Date: Tue, 16 May 2023 21:56:47 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <tcfd26usimv7yyberpf5u7aj5ay24sil2hlkbjrlfmebhaazda@rd5qldjig2vw>
X-Patchwork-Hint: comment
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
 <20230511034722.1929038-8-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230511034722.1929038-8-matthew.d.roper@intel.com>
X-ClientProxiedBy: BYAPR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::38) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB7667:EE_
X-MS-Office365-Filtering-Correlation-Id: 39eb13f8-c7d5-4982-a339-08db569320a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e+Q4v20f70eelRHIez2qpKhyJCwYfq6pf6m5z6kQIqcR9QTYwNVkuTEf6yn5n/hVFiR2oZiYq6HHvPjWuY6wbhNLS8RElJo/dtw7ns+SGF0O6B6axtMuMsSHRjx6+uNbjQdPGnrD2gLU3Ps7tJKGH2rCmLbL+FUuFD8LkX48lGG2RYGP0lzGSb1+qhfktU3YDapEmQ+MwMDz79ioUAFOgd3teuoMlKKiLbj9s2leopxi8BjqQ5tSutMFfsSGBDuA9j1dK1Gc2XYsXZYfP796s6ejjxDz3/cGVwLxBNZeu9FG6RoFDVkaJWNdX77S4V4GzxbMHISaiRu7Vu9w7q8BlrHbQ30tZuybThvcWfE8y2u+WM4iHKbBdW+wTi+6alMGRchQaNZXPCeI7riUtvWSwB1tdryh6uMuqAucsGK/NkuvVDVxkxL45x1Wfnc0KGPWhUglMa0GGt2tc3oNV5QzbaMVHvlPGwEy1sGqSu623+vlZdXlgqKF7004gyGm6GtLEMpw1vxx0JoJRL2dBc0/IQSDzhnC3O6wQHqGyBFp3Yux6EmqwfgMyubcmM0CO5+y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(366004)(346002)(396003)(136003)(376002)(451199021)(4326008)(6636002)(6666004)(33716001)(6486002)(316002)(478600001)(66556008)(66476007)(66946007)(86362001)(5660300002)(41300700001)(6862004)(8676002)(8936002)(6512007)(26005)(6506007)(9686003)(186003)(38100700002)(30864003)(83380400001)(2906002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z5B5jQ27xIIPzolUM0ytcDv8Wl9KGWDOXio+lAKf8JZbqVHVzEF9e737FHtN?=
 =?us-ascii?Q?f+5WF4xmj8jKZAAxtznVoE0bbn0JKaIPh7b7tuWoGuRErhxQE755EHuIuu9M?=
 =?us-ascii?Q?9OpBQHCEVsUyCUCI0ayatZD9MWu2A8wmz9FIXgghBHWuaLqxMbttwoYCV4kp?=
 =?us-ascii?Q?ORu+hV55AhHmiCLC44tF1XP5jQWpd9BWJYMQ7fm64VpSUoy6tYHGluXfnH25?=
 =?us-ascii?Q?rMGVl7gs6bv8wA6G5LQSByl7zVb9mF6I0CwS+qF71nDpn1s0klPrdl9+7J0K?=
 =?us-ascii?Q?xZ01k24055ZbyBdvmcLfpMWMT1s4o5I2Q+ubRVItqSa2633bCyKj/XS6gHFy?=
 =?us-ascii?Q?6eVoW7yqzwi6AdT4UW5wcSFX5UBH2+n2jxaihmCBeZh6CfsJKRSQVeSErZoo?=
 =?us-ascii?Q?SD7xpRDmy5hMK5jQuYPGEbilN5+QqTS+q59s6786XEFRSe0iN0Kv1yPi/F+e?=
 =?us-ascii?Q?FNXTLILIIjE32RN8WnysYkk9YWh/mZzHjFEV+bjhh7OsjQjpWWCRU9Sb4XmP?=
 =?us-ascii?Q?/K4pUvCf+AMKA8509ifpinaX22qB3HEoOvBEB/4aJ1c6/osgCHepUnhD3lIi?=
 =?us-ascii?Q?Jk1gEsM8Vt13AzitkrRlLajnVNDWQZJqPTM/ILCUqebIy/rTlT2OG8eq3Wnr?=
 =?us-ascii?Q?PgFj2HqkhhkQDzP202XQHxtpHs3g3W2KOuCjZ5chPjY2mMKG4DEWYgckrQa1?=
 =?us-ascii?Q?VCjlAYHeG7M2JGKYItjkl7bIcwS/FUywM2ZUoIRGteafQ4jj5iHLNr0Y01s2?=
 =?us-ascii?Q?688Z7CS9xRUGuktbCjWY3dg2L0Uf2O5mtqk3r0v6Rbi19CmPFhM6+xVgs23f?=
 =?us-ascii?Q?TAR7RbZvF2OkQI8pL6GYz2vQJ4GV9fdxWzZdVNhm9ZfeKQxC1UfvS1P3RVoV?=
 =?us-ascii?Q?D+2KdDGPl5MO/V/oJIjcK5K+RcGiJhGIvcEmkPCM4wD3Iszleefox1Qz1+VK?=
 =?us-ascii?Q?xXqJVU5On3Nk8sVno5uByzx5ysy4Hf26UB9TcsJuixBr0mQ9F3bL2cdpAM1K?=
 =?us-ascii?Q?fQbXHVBRqfCCSxbJDAiTgscRQw2mPh+MRMfZU4ZHzBhMFCwaz+ct/h/kukTR?=
 =?us-ascii?Q?cRJEbMY+ILPke2Bt1XlOYj1IgRaQcAWC6iAS2TlR+4N1fLVz/mBPjlx3HTTM?=
 =?us-ascii?Q?EKZgTpwjupk+uiuDUbtQC/XnwosKj1eBJTCsvW51z2zBxpjcAo6kfqC8HYAH?=
 =?us-ascii?Q?RSn5IBcMJ4YU8jvickznIKne25z5pcRVq/3B9Ltd2QgmvJIQVavzdL5lAC6A?=
 =?us-ascii?Q?tlbaqPfg+QYT81Gntaq1Vr2cFO89lUlVxZQuAw+9wk1zBQSKsMwu5np6cIRn?=
 =?us-ascii?Q?PEYLrkrXWkfIzPUJwzoeMBXjA/fvZlskNrWmrFAnsSIm35dA73i54l5m1eHQ?=
 =?us-ascii?Q?mi7dQh8vmpkb8UUJ1G8kJY10A5jEVVjsFdSWbCMd+VPPPmq0jVAouhrrsHtj?=
 =?us-ascii?Q?pPI9RcD644U7MiAceoyuDlaz5mUQB4AkRII67AQOvcwkfv8w5Izhkd5GcyBu?=
 =?us-ascii?Q?66vgI8Ksmf99cwW7RI5+/GalgoryVJe4byhC33EsbO2a+hPuSV6PUnO4gCmn?=
 =?us-ascii?Q?AjB2N5zymp5/Nj1ukt0dUptBY2LS+37CytGES0tsAArGy0AYe4AijZ4BSIWE?=
 =?us-ascii?Q?jA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39eb13f8-c7d5-4982-a339-08db569320a7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 04:56:51.4127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RyKOpV/yqP+6pNKDNSMnlCkq4FDBwf3tb+Vos7oWtnXcWpTQtgVjoetgGJrVNJKPBZi9L58IqohmFZxC9mbdpPkXpTERkWJSu8eM+Yb3G6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7667
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 07/26] drm/xe: Memory allocations are
 tile-based, not GT-based
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

On Wed, May 10, 2023 at 08:47:03PM -0700, Matt Roper wrote:
>Since memory and address spaces are a tile concept rather than a GT
>concept, we need to plumb tile-based handling through lots of
>memory-related code.
>
>Note that one remaining shortcoming here that will need to be addressed
>before media GT support can be re-enabled is that although the address
>space is shared between a tile's GTs, each GT caches the PTEs
>independently in their own TLB and thus TLB invalidation should be
>handled at the GT level.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/i915/display/intel_dsb.c      |   5 +-
> drivers/gpu/drm/i915/display/intel_fbc.c      |   3 +-
> drivers/gpu/drm/i915/display/intel_fbdev.c    |   7 +-
> drivers/gpu/drm/xe/display/xe_fb_pin.c        |   7 +-
> drivers/gpu/drm/xe/display/xe_plane_initial.c |   2 +-
> drivers/gpu/drm/xe/tests/xe_bo.c              |   2 +-
> drivers/gpu/drm/xe/tests/xe_migrate.c         |  15 +-
> drivers/gpu/drm/xe/xe_bb.c                    |   3 +-
> drivers/gpu/drm/xe/xe_bo.c                    |  66 ++++----
> drivers/gpu/drm/xe/xe_bo.h                    |  18 +--
> drivers/gpu/drm/xe/xe_bo_evict.c              |   2 +-
> drivers/gpu/drm/xe/xe_bo_types.h              |   4 +-
> drivers/gpu/drm/xe/xe_device_types.h          |   7 +
> drivers/gpu/drm/xe/xe_ggtt.c                  |   5 +-
> drivers/gpu/drm/xe/xe_gt.c                    |  21 +--
> drivers/gpu/drm/xe/xe_gt_debugfs.c            |   6 +-
> drivers/gpu/drm/xe/xe_gt_pagefault.c          |  10 +-
> drivers/gpu/drm/xe/xe_gt_types.h              |   7 -
> drivers/gpu/drm/xe/xe_guc_ads.c               |   5 +-
> drivers/gpu/drm/xe/xe_guc_ct.c                |   5 +-
> drivers/gpu/drm/xe/xe_guc_hwconfig.c          |   5 +-
> drivers/gpu/drm/xe/xe_guc_log.c               |   6 +-
> drivers/gpu/drm/xe/xe_guc_pc.c                |   5 +-
> drivers/gpu/drm/xe/xe_hw_engine.c             |   5 +-
> drivers/gpu/drm/xe/xe_lrc.c                   |  13 +-
> drivers/gpu/drm/xe/xe_lrc_types.h             |   4 +-
> drivers/gpu/drm/xe/xe_migrate.c               |  23 +--
> drivers/gpu/drm/xe/xe_migrate.h               |   5 +-
> drivers/gpu/drm/xe/xe_pt.c                    | 146 ++++++++---------
> drivers/gpu/drm/xe/xe_pt.h                    |  14 +-
> drivers/gpu/drm/xe/xe_sa.c                    |  13 +-
> drivers/gpu/drm/xe/xe_sa.h                    |   4 +-
> drivers/gpu/drm/xe/xe_tile.c                  |   7 +
> drivers/gpu/drm/xe/xe_uc_fw.c                 |   5 +-
> drivers/gpu/drm/xe/xe_vm.c                    | 152 +++++++++---------
> drivers/gpu/drm/xe/xe_vm.h                    |   2 +-
> drivers/gpu/drm/xe/xe_vm_types.h              |  12 +-
> include/uapi/drm/xe_drm.h                     |   4 +-
> 38 files changed, 307 insertions(+), 318 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
>index 7c93580282b4..3830309aacf4 100644
>--- a/drivers/gpu/drm/i915/display/intel_dsb.c
>+++ b/drivers/gpu/drm/i915/display/intel_dsb.c
>@@ -379,9 +379,10 @@ struct intel_dsb *intel_dsb_prepare(struct intel_crtc *crtc,
> #else
> 	/* ~1 qword per instruction, full cachelines */
> 	size = ALIGN(max_cmds * 8, 64);
>-	obj = xe_bo_create_pin_map(i915, to_gt(i915), NULL, PAGE_ALIGN(size),
>+	obj = xe_bo_create_pin_map(i915, xe_device_get_root_tile(i915),
>+				   NULL, PAGE_ALIGN(size),
> 				   ttm_bo_type_kernel,
>-				   XE_BO_CREATE_VRAM_IF_DGFX(to_gt(i915)) |
>+				   XE_BO_CREATE_VRAM_IF_DGFX(xe_device_get_root_tile(i915)) |
> 				   XE_BO_CREATE_GGTT_BIT);
> 	if (IS_ERR(obj)) {
> 		kfree(dsb);
>diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
>index 9dc7083fe974..0e8e899f596b 100644
>--- a/drivers/gpu/drm/i915/display/intel_fbc.c
>+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
>@@ -71,7 +71,8 @@ static int i915_gem_stolen_insert_node_in_range(struct xe_device *xe, struct xe_
> 	int err;
> 	u32 flags = XE_BO_CREATE_PINNED_BIT | XE_BO_CREATE_STOLEN_BIT;
>
>-	*bo = xe_bo_create_locked_range(xe, to_gt(xe), NULL, size, start, end,
>+	*bo = xe_bo_create_locked_range(xe, xe_device_get_root_tile(xe),
>+					NULL, size, start, end,
> 					ttm_bo_type_kernel, flags);
> 	if (IS_ERR(*bo)) {
> 		err = PTR_ERR(*bo);
>diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
>index 6362c4ce15b6..814b89b99718 100644
>--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
>+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
>@@ -205,7 +205,8 @@ static int intelfb_alloc(struct drm_fb_helper *helper,
> 	}
> #else
> 	if (!IS_DGFX(dev_priv)) {
>-		obj = xe_bo_create_pin_map(dev_priv, to_gt(dev_priv), NULL, size,
>+		obj = xe_bo_create_pin_map(dev_priv, xe_device_get_root_tile(dev_priv),
>+					   NULL, size,
> 					   ttm_bo_type_kernel, XE_BO_SCANOUT_BIT |
> 					   XE_BO_CREATE_STOLEN_BIT |
> 					   XE_BO_CREATE_PINNED_BIT);
>@@ -215,9 +216,9 @@ static int intelfb_alloc(struct drm_fb_helper *helper,
> 			drm_info(&dev_priv->drm, "Allocated fbdev into stolen failed: %li\n", PTR_ERR(obj));
> 	}
> 	if (IS_ERR(obj)) {
>-		obj = xe_bo_create_pin_map(dev_priv, to_gt(dev_priv), NULL, size,
>+		obj = xe_bo_create_pin_map(dev_priv, xe_device_get_root_tile(dev_priv), NULL, size,
> 					  ttm_bo_type_kernel, XE_BO_SCANOUT_BIT |
>-					  XE_BO_CREATE_VRAM_IF_DGFX(to_gt(dev_priv)) |
>+					  XE_BO_CREATE_VRAM_IF_DGFX(xe_device_get_root_tile(dev_priv)) |
> 					  XE_BO_CREATE_PINNED_BIT);
> 	}
> #endif
>diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>index 78ac58244f24..e5999a01daa1 100644
>--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>@@ -45,6 +45,7 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
> 			       struct i915_vma *vma)
> {
> 	struct xe_device *xe = to_xe_device(fb->base.dev);
>+	struct xe_tile *tile0 = xe_device_get_root_tile(xe);
> 	struct xe_bo *bo = intel_fb_obj(&fb->base), *dpt;
> 	u32 dpt_size, size = bo->ttm.base.size;
>
>@@ -55,17 +56,17 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
> 		dpt_size = ALIGN(intel_rotation_info_size(&view->rotated) * 8,
> 				 XE_PAGE_SIZE);
>
>-	dpt = xe_bo_create_pin_map(xe, to_gt(xe), NULL, dpt_size,
>+	dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
> 				  ttm_bo_type_kernel,
> 				  XE_BO_CREATE_VRAM0_BIT |
> 				  XE_BO_CREATE_GGTT_BIT);
> 	if (IS_ERR(dpt))
>-		dpt = xe_bo_create_pin_map(xe, to_gt(xe), NULL, dpt_size,
>+		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
> 					   ttm_bo_type_kernel,
> 					   XE_BO_CREATE_STOLEN_BIT |
> 					   XE_BO_CREATE_GGTT_BIT);
> 	if (IS_ERR(dpt))
>-		dpt = xe_bo_create_pin_map(xe, to_gt(xe), NULL, dpt_size,
>+		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
> 					   ttm_bo_type_kernel,
> 					   XE_BO_CREATE_SYSTEM_BIT |
> 					   XE_BO_CREATE_GGTT_BIT);
>diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
>index 556ede2e459e..5e43ae9f9c4b 100644
>--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
>+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
>@@ -115,7 +115,7 @@ initial_plane_bo(struct xe_device *xe,
> 			page_size);
> 	size -= base;
>
>-	bo = xe_bo_create_pin_map_at(xe, &tile0->primary_gt, NULL, size, phys_base,
>+	bo = xe_bo_create_pin_map_at(xe, tile0, NULL, size, phys_base,
> 				     ttm_bo_type_kernel, flags);
> 	if (IS_ERR(bo)) {
> 		drm_dbg(&xe->drm,
>diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
>index 9bd381e5b7a6..bee5a2031153 100644
>--- a/drivers/gpu/drm/xe/tests/xe_bo.c
>+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
>@@ -173,7 +173,7 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
> {
> 	struct xe_bo *bo, *external;
> 	unsigned int bo_flags = XE_BO_CREATE_USER_BIT |
>-		XE_BO_CREATE_VRAM_IF_DGFX(gt);
>+		XE_BO_CREATE_VRAM_IF_DGFX(gt_to_tile(gt));
> 	struct xe_vm *vm = xe_migrate_get_vm(xe->gt[0].migrate);
> 	struct ww_acquire_ctx ww;
> 	int err, i;
>diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
>index 0f4371ad1fd9..fe8331f116c2 100644
>--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
>+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
>@@ -240,6 +240,7 @@ static void test_pt_update(struct xe_migrate *m, struct xe_bo *pt,
> static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
> {
> 	struct xe_gt *gt = m->gt;
>+	struct xe_tile *tile = gt_to_tile(m->gt);
> 	struct xe_device *xe = gt_to_xe(gt);
> 	struct xe_bo *pt, *bo = m->pt_bo, *big, *tiny;
> 	struct xe_res_cursor src_it;
>@@ -256,18 +257,18 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
> 		return;
> 	}
>
>-	big = xe_bo_create_pin_map(xe, m->gt, m->eng->vm, SZ_4M,
>+	big = xe_bo_create_pin_map(xe, tile, m->eng->vm, SZ_4M,
> 				   ttm_bo_type_kernel,
>-				   XE_BO_CREATE_VRAM_IF_DGFX(m->gt) |
>+				   XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> 				   XE_BO_CREATE_PINNED_BIT);
> 	if (IS_ERR(big)) {
> 		KUNIT_FAIL(test, "Failed to allocate bo: %li\n", PTR_ERR(big));
> 		goto vunmap;
> 	}
>
>-	pt = xe_bo_create_pin_map(xe, m->gt, m->eng->vm, XE_PAGE_SIZE,
>+	pt = xe_bo_create_pin_map(xe, tile, m->eng->vm, XE_PAGE_SIZE,
> 				  ttm_bo_type_kernel,
>-				  XE_BO_CREATE_VRAM_IF_DGFX(m->gt) |
>+				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> 				  XE_BO_CREATE_PINNED_BIT);
> 	if (IS_ERR(pt)) {
> 		KUNIT_FAIL(test, "Failed to allocate fake pt: %li\n",
>@@ -275,10 +276,10 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
> 		goto free_big;
> 	}
>
>-	tiny = xe_bo_create_pin_map(xe, m->gt, m->eng->vm,
>+	tiny = xe_bo_create_pin_map(xe, tile, m->eng->vm,
> 				    2 * SZ_4K,
> 				    ttm_bo_type_kernel,
>-				    XE_BO_CREATE_VRAM_IF_DGFX(m->gt) |
>+				    XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> 				    XE_BO_CREATE_PINNED_BIT);
> 	if (IS_ERR(tiny)) {
> 		KUNIT_FAIL(test, "Failed to allocate fake pt: %li\n",
>@@ -286,7 +287,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
> 		goto free_pt;
> 	}
>
>-	bb = xe_bb_new(m->gt, 32, xe->info.supports_usm);
>+	bb = xe_bb_new(gt, 32, xe->info.supports_usm);
> 	if (IS_ERR(bb)) {
> 		KUNIT_FAIL(test, "Failed to create batchbuffer: %li\n",
> 			   PTR_ERR(bb));
>diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
>index bf7c94b769d7..f9b6b7adf99f 100644
>--- a/drivers/gpu/drm/xe/xe_bb.c
>+++ b/drivers/gpu/drm/xe/xe_bb.c
>@@ -30,6 +30,7 @@ static int bb_prefetch(struct xe_gt *gt)
>
> struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
> {
>+	struct xe_tile *tile = gt_to_tile(gt);
> 	struct xe_bb *bb = kmalloc(sizeof(*bb), GFP_KERNEL);
> 	int err;
>
>@@ -42,7 +43,7 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
> 	 * space to accomodate the platform-specific hardware prefetch
> 	 * requirements.
> 	 */
>-	bb->bo = xe_sa_bo_new(!usm ? gt->kernel_bb_pool : gt->usm.bb_pool,
>+	bb->bo = xe_sa_bo_new(!usm ? tile->mem.kernel_bb_pool : gt->usm.bb_pool,
> 			      4 * (dwords + 1) + bb_prefetch(gt));
> 	if (IS_ERR(bb->bo)) {
> 		err = PTR_ERR(bb->bo);
>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>index 5dbca5bbca8f..9d613fc5d309 100644
>--- a/drivers/gpu/drm/xe/xe_bo.c
>+++ b/drivers/gpu/drm/xe/xe_bo.c
>@@ -452,7 +452,7 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
> 			}
>
> 			xe_vm_assert_held(vm);
>-			if (list_empty(&vma->rebind_link) && vma->gt_present)
>+			if (list_empty(&vma->rebind_link) && vma->tile_present)
> 				list_add_tail(&vma->rebind_link, &vm->rebind_list);
>
> 			if (vm_resv_locked)
>@@ -559,7 +559,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
> 	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
> 	struct ttm_resource *old_mem = ttm_bo->resource;
> 	struct ttm_tt *ttm = ttm_bo->ttm;
>-	struct xe_gt *gt = NULL;
>+	struct xe_tile *tile = NULL;
> 	struct dma_fence *fence;
> 	bool move_lacks_source;
> 	bool needs_clear;
>@@ -629,15 +629,15 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
> 		goto out;
> 	}
>
>-	if (bo->gt)
>-		gt = bo->gt;
>+	if (bo->tile)
>+		tile = bo->tile;
> 	else if (resource_is_vram(new_mem))
>-		gt = &mem_type_to_tile(xe, new_mem->mem_type)->primary_gt;
>+		tile = mem_type_to_tile(xe, new_mem->mem_type);
> 	else if (resource_is_vram(old_mem))
>-		gt = &mem_type_to_tile(xe, old_mem->mem_type)->primary_gt;
>+		tile = mem_type_to_tile(xe, old_mem->mem_type);
>
>-	XE_BUG_ON(!gt);
>-	XE_BUG_ON(!gt->migrate);
>+	XE_BUG_ON(!tile);
>+	XE_BUG_ON(!tile->primary_gt.migrate);
>
> 	trace_xe_bo_move(bo);
> 	xe_device_mem_access_get(xe);
>@@ -658,7 +658,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>
> 			/* Create a new VMAP once kernel BO back in VRAM */
> 			if (!ret && resource_is_vram(new_mem)) {
>-				void *new_addr = gt_to_tile(gt)->mem.vram.mapping +
>+				void *new_addr = tile->mem.vram.mapping +
> 					(new_mem->start << PAGE_SHIFT);
>
> 				if (XE_WARN_ON(new_mem->start == XE_BO_INVALID_OFFSET)) {
>@@ -675,9 +675,9 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
> 		}
> 	} else {
> 		if (move_lacks_source)
>-			fence = xe_migrate_clear(gt->migrate, bo, new_mem);
>+			fence = xe_migrate_clear(tile->primary_gt.migrate, bo, new_mem);
> 		else
>-			fence = xe_migrate_copy(gt->migrate, bo, old_mem, new_mem);
>+			fence = xe_migrate_copy(tile->primary_gt.migrate, bo, old_mem, new_mem);
> 		if (IS_ERR(fence)) {
> 			ret = PTR_ERR(fence);
> 			xe_device_mem_access_put(xe);
>@@ -958,7 +958,7 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
> 	WARN_ON(!list_empty(&bo->vmas));
>
> 	if (bo->ggtt_node.size)
>-		xe_ggtt_remove_bo(gt_to_tile(bo->gt)->mem.ggtt, bo);
>+		xe_ggtt_remove_bo(bo->tile->mem.ggtt, bo);
>
> 	if (bo->vm && xe_bo_is_user(bo))
> 		xe_vm_put(bo->vm);
>@@ -1080,7 +1080,7 @@ void xe_bo_free(struct xe_bo *bo)
> }
>
> struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>-				    struct xe_gt *gt, struct dma_resv *resv,
>+				    struct xe_tile *tile, struct dma_resv *resv,
> 				    size_t size, enum ttm_bo_type type,
> 				    u32 flags)
> {
>@@ -1093,7 +1093,7 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> 	int err;
>
> 	/* Only kernel objects should set GT */
>-	XE_BUG_ON(gt && type != ttm_bo_type_kernel);
>+	XE_BUG_ON(tile && type != ttm_bo_type_kernel);
>
> 	if (XE_WARN_ON(!size))
> 		return ERR_PTR(-EINVAL);
>@@ -1114,7 +1114,7 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> 		alignment = SZ_4K >> PAGE_SHIFT;
> 	}
>
>-	bo->gt = gt;
>+	bo->tile = tile;
> 	bo->size = size;
> 	bo->flags = flags;
> 	bo->ttm.base.funcs = &xe_gem_object_funcs;
>@@ -1196,7 +1196,7 @@ static int __xe_bo_fixed_placement(struct xe_device *xe,
>
> struct xe_bo *
> xe_bo_create_locked_range(struct xe_device *xe,
>-			  struct xe_gt *gt, struct xe_vm *vm,
>+			  struct xe_tile *tile, struct xe_vm *vm,
> 			  size_t size, u64 start, u64 end,
> 			  enum ttm_bo_type type, u32 flags)
> {
>@@ -1219,7 +1219,7 @@ xe_bo_create_locked_range(struct xe_device *xe,
> 		}
> 	}
>
>-	bo = __xe_bo_create_locked(xe, bo, gt, vm ? &vm->resv : NULL, size,
>+	bo = __xe_bo_create_locked(xe, bo, tile, vm ? &vm->resv : NULL, size,
> 				   type, flags);
> 	if (IS_ERR(bo))
> 		return bo;
>@@ -1229,16 +1229,16 @@ xe_bo_create_locked_range(struct xe_device *xe,
> 	bo->vm = vm;
>
> 	if (bo->flags & XE_BO_CREATE_GGTT_BIT) {
>-		if (!gt && flags & XE_BO_CREATE_STOLEN_BIT)
>-			gt = xe_device_get_gt(xe, 0);
>+		if (!tile && flags & XE_BO_CREATE_STOLEN_BIT)
>+			tile = xe_device_get_root_tile(xe);
>
>-		XE_BUG_ON(!gt);
>+		XE_BUG_ON(!tile);
>
> 		if (flags & XE_BO_FIXED_PLACEMENT_BIT) {
>-			err = xe_ggtt_insert_bo_at(gt_to_tile(gt)->mem.ggtt, bo,
>+			err = xe_ggtt_insert_bo_at(tile->mem.ggtt, bo,
> 						   start + bo->size, U64_MAX);
> 		} else {
>-			err = xe_ggtt_insert_bo(gt_to_tile(gt)->mem.ggtt, bo);
>+			err = xe_ggtt_insert_bo(tile->mem.ggtt, bo);
> 		}
> 		if (err)
> 			goto err_unlock_put_bo;
>@@ -1252,18 +1252,18 @@ xe_bo_create_locked_range(struct xe_device *xe,
> 	return ERR_PTR(err);
> }
>
>-struct xe_bo *xe_bo_create_locked(struct xe_device *xe, struct xe_gt *gt,
>+struct xe_bo *xe_bo_create_locked(struct xe_device *xe, struct xe_tile *tile,
> 				  struct xe_vm *vm, size_t size,
> 				  enum ttm_bo_type type, u32 flags)
> {
>-	return xe_bo_create_locked_range(xe, gt, vm, size, 0, ~0ULL, type, flags);
>+	return xe_bo_create_locked_range(xe, tile, vm, size, 0, ~0ULL, type, flags);
> }
>
>-struct xe_bo *xe_bo_create(struct xe_device *xe, struct xe_gt *gt,
>+struct xe_bo *xe_bo_create(struct xe_device *xe, struct xe_tile *tile,
> 			   struct xe_vm *vm, size_t size,
> 			   enum ttm_bo_type type, u32 flags)
> {
>-	struct xe_bo *bo = xe_bo_create_locked(xe, gt, vm, size, type, flags);
>+	struct xe_bo *bo = xe_bo_create_locked(xe, tile, vm, size, type, flags);
>
> 	if (!IS_ERR(bo))
> 		xe_bo_unlock_vm_held(bo);
>@@ -1271,7 +1271,7 @@ struct xe_bo *xe_bo_create(struct xe_device *xe, struct xe_gt *gt,
> 	return bo;
> }
>
>-struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_gt *gt,
>+struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_tile *tile,
> 				      struct xe_vm *vm,
> 				      size_t size, u64 offset,
> 				      enum ttm_bo_type type, u32 flags)
>@@ -1285,7 +1285,7 @@ struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_gt *gt,
> 	    xe_ttm_stolen_cpu_access_needs_ggtt(xe))
> 		flags |= XE_BO_CREATE_GGTT_BIT;
>
>-	bo = xe_bo_create_locked_range(xe, gt, vm, size, start, end, type, flags);
>+	bo = xe_bo_create_locked_range(xe, tile, vm, size, start, end, type, flags);
> 	if (IS_ERR(bo))
> 		return bo;
>
>@@ -1309,18 +1309,18 @@ struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_gt *gt,
> 	return ERR_PTR(err);
> }
>
>-struct xe_bo *xe_bo_create_pin_map(struct xe_device *xe, struct xe_gt *gt,
>+struct xe_bo *xe_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
> 				   struct xe_vm *vm, size_t size,
> 				   enum ttm_bo_type type, u32 flags)
> {
>-	return xe_bo_create_pin_map_at(xe, gt, vm, size, ~0ull, type, flags);
>+	return xe_bo_create_pin_map_at(xe, tile, vm, size, ~0ull, type, flags);
> }
>
>-struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_gt *gt,
>+struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
> 				     const void *data, size_t size,
> 				     enum ttm_bo_type type, u32 flags)
> {
>-	struct xe_bo *bo = xe_bo_create_pin_map(xe, gt, NULL,
>+	struct xe_bo *bo = xe_bo_create_pin_map(xe, tile, NULL,
> 						ALIGN(size, PAGE_SIZE),
> 						type, flags);
> 	if (IS_ERR(bo))
>@@ -1949,7 +1949,7 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
> 			   page_size);
>
> 	bo = xe_bo_create(xe, NULL, NULL, args->size, ttm_bo_type_device,
>-			  XE_BO_CREATE_VRAM_IF_DGFX(to_gt(xe)) |
>+			  XE_BO_CREATE_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
> 			  XE_BO_CREATE_USER_BIT | XE_BO_SCANOUT_BIT);
> 	if (IS_ERR(bo))
> 		return PTR_ERR(bo);
>diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>index 7a79f3893260..ccb0fae2966e 100644
>--- a/drivers/gpu/drm/xe/xe_bo.h
>+++ b/drivers/gpu/drm/xe/xe_bo.h
>@@ -21,8 +21,8 @@
> 					 XE_BO_CREATE_VRAM1_BIT)
> /* -- */
> #define XE_BO_CREATE_STOLEN_BIT		BIT(4)
>-#define XE_BO_CREATE_VRAM_IF_DGFX(gt) \
>-	(IS_DGFX(gt_to_xe(gt)) ? XE_BO_CREATE_VRAM0_BIT << gt_to_tile(gt)->id : \
>+#define XE_BO_CREATE_VRAM_IF_DGFX(tile) \
>+	(IS_DGFX(tile_to_xe(tile)) ? XE_BO_CREATE_VRAM0_BIT << (tile)->id : \
> 	 XE_BO_CREATE_SYSTEM_BIT)
> #define XE_BO_CREATE_GGTT_BIT		BIT(5)
> #define XE_BO_CREATE_IGNORE_MIN_PAGE_SIZE_BIT BIT(6)
>@@ -80,27 +80,27 @@ struct xe_bo *xe_bo_alloc(void);
> void xe_bo_free(struct xe_bo *bo);
>
> struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>-				    struct xe_gt *gt, struct dma_resv *resv,
>+				    struct xe_tile *tile, struct dma_resv *resv,
> 				    size_t size, enum ttm_bo_type type,
> 				    u32 flags);
> struct xe_bo *
> xe_bo_create_locked_range(struct xe_device *xe,
>-			  struct xe_gt *gt, struct xe_vm *vm,
>+			  struct xe_tile *tile, struct xe_vm *vm,
> 			  size_t size, u64 start, u64 end,
> 			  enum ttm_bo_type type, u32 flags);
>-struct xe_bo *xe_bo_create_locked(struct xe_device *xe, struct xe_gt *gt,
>+struct xe_bo *xe_bo_create_locked(struct xe_device *xe, struct xe_tile *tile,
> 				  struct xe_vm *vm, size_t size,
> 				  enum ttm_bo_type type, u32 flags);
>-struct xe_bo *xe_bo_create(struct xe_device *xe, struct xe_gt *gt,
>+struct xe_bo *xe_bo_create(struct xe_device *xe, struct xe_tile *tile,
> 			   struct xe_vm *vm, size_t size,
> 			   enum ttm_bo_type type, u32 flags);
>-struct xe_bo *xe_bo_create_pin_map(struct xe_device *xe, struct xe_gt *gt,
>+struct xe_bo *xe_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
> 				   struct xe_vm *vm, size_t size,
> 				   enum ttm_bo_type type, u32 flags);
>-struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_gt *gt,
>+struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_tile *tile,
> 				      struct xe_vm *vm, size_t size, u64 offset,
> 				      enum ttm_bo_type type, u32 flags);
>-struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_gt *gt,
>+struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
> 				     const void *data, size_t size,
> 				     enum ttm_bo_type type, u32 flags);
>
>diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
>index a72963c54bf3..9226195bd560 100644
>--- a/drivers/gpu/drm/xe/xe_bo_evict.c
>+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
>@@ -149,7 +149,7 @@ int xe_bo_restore_kernel(struct xe_device *xe)
> 		}
>
> 		if (bo->flags & XE_BO_CREATE_GGTT_BIT) {
>-			struct xe_tile *tile = gt_to_tile(bo->gt);
>+			struct xe_tile *tile = bo->tile;
>
> 			mutex_lock(&tile->mem.ggtt->lock);
> 			xe_ggtt_map_bo(tile->mem.ggtt, bo);
>diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
>index 06de3330211d..f6ee920303af 100644
>--- a/drivers/gpu/drm/xe/xe_bo_types.h
>+++ b/drivers/gpu/drm/xe/xe_bo_types.h
>@@ -29,8 +29,8 @@ struct xe_bo {
> 	u32 flags;
> 	/** @vm: VM this BO is attached to, for extobj this will be NULL */
> 	struct xe_vm *vm;
>-	/** @gt: GT this BO is attached to (kernel BO only) */
>-	struct xe_gt *gt;
>+	/** @tile: Tile this BO is attached to (kernel BO only) */
>+	struct xe_tile *tile;
> 	/** @vmas: List of VMAs for this BO */
> 	struct list_head vmas;
> 	/** @placements: valid placements for this BO */
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 6b9e7847161c..c6365b6f14ba 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -131,6 +131,13 @@ struct xe_tile {
>
> 		/** @ggtt: Global graphics translation table */
> 		struct xe_ggtt *ggtt;
>+
>+		/**
>+		 * @kernel_bb_pool: Pool from which batchbuffers are allocated.
>+		 *
>+		 * Media GT shares a pool with its primary GT.
>+		 */
>+		struct xe_sa_manager *kernel_bb_pool;
> 	} mem;
> };
>
>diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>index 52d293d61cc0..b11f22b68bb8 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt.c
>+++ b/drivers/gpu/drm/xe/xe_ggtt.c
>@@ -149,7 +149,6 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
> int xe_ggtt_init(struct xe_ggtt *ggtt)
> {
> 	struct xe_device *xe = tile_to_xe(ggtt->tile);
>-	struct xe_gt *gt = &ggtt->tile->primary_gt;
> 	unsigned int flags;
> 	int err;
>
>@@ -162,9 +161,9 @@ int xe_ggtt_init(struct xe_ggtt *ggtt)
> 	if (ggtt->flags & XE_GGTT_FLAGS_64K)
> 		flags |= XE_BO_CREATE_SYSTEM_BIT;
> 	else
>-		flags |= XE_BO_CREATE_VRAM_IF_DGFX(gt);
>+		flags |= XE_BO_CREATE_VRAM_IF_DGFX(ggtt->tile);
>
>-	ggtt->scratch = xe_bo_create_pin_map(xe, gt, NULL, XE_PAGE_SIZE,
>+	ggtt->scratch = xe_bo_create_pin_map(xe, ggtt->tile, NULL, XE_PAGE_SIZE,
> 					     ttm_bo_type_kernel,
> 					     flags);
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 1e424ce8ef3e..d769bc93d15c 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -95,7 +95,7 @@ static int emit_nop_job(struct xe_gt *gt, struct xe_engine *e)
> 	if (IS_ERR(bb))
> 		return PTR_ERR(bb);
>
>-	batch_ofs = xe_bo_ggtt_addr(gt->kernel_bb_pool->bo);
>+	batch_ofs = xe_bo_ggtt_addr(gt_to_tile(gt)->mem.kernel_bb_pool->bo);
> 	job = xe_bb_create_wa_job(e, bb, batch_ofs);
> 	if (IS_ERR(job)) {
> 		xe_bb_free(bb, NULL);
>@@ -144,7 +144,7 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_engine *e)
> 		}
> 	}
>
>-	batch_ofs = xe_bo_ggtt_addr(gt->kernel_bb_pool->bo);
>+	batch_ofs = xe_bo_ggtt_addr(gt_to_tile(gt)->mem.kernel_bb_pool->bo);
> 	job = xe_bb_create_wa_job(e, bb, batch_ofs);
> 	if (IS_ERR(job)) {
> 		xe_bb_free(bb, NULL);
>@@ -364,31 +364,16 @@ static int all_fw_domain_init(struct xe_gt *gt)
> 		goto err_force_wake;
>
> 	if (!xe_gt_is_media_type(gt)) {

I believe at this point this doesn't make sense anymore as there is no
media gt. Reviewing this with --color-words, looks ok.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
