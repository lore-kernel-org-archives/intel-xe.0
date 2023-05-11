Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D91C7EE22
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 23:30:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A8710E5FB;
	Thu, 11 May 2023 23:30:18 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E2F10E5FB
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 23:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683847816; x=1715383816;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=738nEgDLtWhngi3XoFG4xrgocznh/s+ASvWhbtcKYqY=;
 b=hn1/iMHKn4bDgAg7UOke6Vk4hi2G32s+OV9hexBWlLxbdtxo6KKUwrh/
 wxaVb/xJfI440aj0bWMYqlDsjqY+GVpy8WDTBkwQFKcmUO7btvAMVXxn3
 Z48c9gYvto3K6p1KV7VdKAQCDa/88VP9cl15T25Jd4mGj3G06q4HLW68e
 TSerdO1lYLepG88z09JyM95CWc32wMa0MAoearuIckhql88aIzVwd3pdq
 /Aou6bcgH+Pmyt3YJte7CXeCf549m0h8OT1QgQB6aDEiiDAFrSjh4gQJ5
 2JXY0i9qltL3aiGf58zANXIffkO+CYUexBwKQFKLoD/jiop/1jXzH6f56 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="348153237"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="348153237"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 16:30:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="844181089"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="844181089"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga001.fm.intel.com with ESMTP; 11 May 2023 16:30:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 16:30:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 16:30:00 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 11 May 2023 16:30:00 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 11 May 2023 16:30:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UUUjQfQpwXDACLFF5iQrcZR6RsHi5MwkQcZx1vdajmiXYreFZBdeyIHPsi4ZVb7tInKCJoOrkPkD0CTWhEEpazefcrDidS6lqG95uWkBanDxYGjBGWHtYTtpHKgkLQP6yYAw5LryjvxRsZWED1xdZyAG4McPDTjVM/3pYq4C9PJFaHOmDubQ8wykpjYhbmo/M4zM/7SiH7v6vQ/p1dsn8Nftj/B3dHwD3tNB0OhPtmvhvhXkR65CJSOHUILNyBiLqVRpYXxJrET7KES8YFDAjG3vAMtuVzpenld8Tsbf8Yy7vqlG/SDbC58NOFn4KqvHR0FZ2p0sGD79427kd9iufQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OK1wovdTl/8CEZ+tYlfYjSGfU/1lCIJ7agBuVTUB7CU=;
 b=FTxwZUwDr1L8wZAbO//0ynJvpULoFUjy7dwJLyJnuMNXj1wwIi/tqOh8OPfD7N5hvT4PK1rFJOM3Qvb51eDN7mFokkkzCjbPeyN5CmcnaCNuOOkSud3YulQJ1JRbQuGf/QbuWbmgoeCvG9xF9jqDolwkrcpn08M417SNvjqmJ5MeISXCbHbA/VP6oZW9NZn16+RZl/S+MBxhVdKRuZP2iZRo5EcfD+MZYn/AtYgKeGtpTmDHfldNfs/bcIDYHKR2B2IPn+bzQuKhP4lr31+497yK8hw27zAGxgOn8Mf7TAaWEr1Q+xBvOIgP1u60vvFXLRbyjAJzpkFnUE2yW4G2nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW5PR11MB5929.namprd11.prod.outlook.com (2603:10b6:303:194::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Thu, 11 May
 2023 23:29:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 23:29:58 +0000
Date: Thu, 11 May 2023 16:29:55 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <4yoscvqo3xq6my647273h25mqnx23ena7mcnj7vvog3k4o2ane@azity4pbplx2>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
 <20230511034722.1929038-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230511034722.1929038-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: BYAPR07CA0010.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW5PR11MB5929:EE_
X-MS-Office365-Filtering-Correlation-Id: a1df5769-08b4-40d6-3cab-08db5277a279
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rs643H5J8AyWPozurz52ziPSNWvBNRlAmB//t5PbZBjqfcwvawsvnsUG7Rgcob8OBA3IJoKdC0tTdgdCqtDNdixsoNHJQsLzsGvMXTgZR7Qd3iKTOdx91FmT4EE+5rdkMeiBLpO60WXzdB5ChqsQZHmwSAWw9+hKyFX2JOzaNKUK+GwbQtY83cQwmuwl4Iz8kYjhfS2fbU0PkRmPSblZukTMhBguHrbZI6L5FLI+Pp7Wk/7wC2vfXnd6mVo9J2N+72e/ciFaMhye1MG2RgkRDSBlCQzPGCOAka+ISrzd6LlQoEqYuDIdjU9yAdjzqL7FrcNxYfK6wYUNcGyAEgz+eFr8Ch9lGdgYlQiCMe3FZOKwSaUtD6xkh2nsJih5yv889ABphlYdaXbhwRhe9Gux15NYdlT08zU8VpXtLkn9v2tGoGN8sKJATY7FIZfhaBvPF7FKfMAG61D/ywteNmP90hF2V3VVbwN7Nm7EHHgJMsD9m7eM173qggEiamU+yq8mwlb//QG0TC5FDdu61dKjJDLlkl8H+C5mePa3XrjXKvRPbMyWwaAJ72WkW9VyK/2T
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(39860400002)(396003)(366004)(376002)(136003)(451199021)(38100700002)(6486002)(6666004)(5660300002)(33716001)(8936002)(8676002)(6862004)(478600001)(316002)(82960400001)(66946007)(66556008)(6636002)(4326008)(66476007)(86362001)(2906002)(186003)(83380400001)(41300700001)(9686003)(6512007)(26005)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kcr+4F8l9aou8BSkgHPcQtVkVeeVXkM1YsviQ4W5iz0M6Kwbl7mdvoCN66Iv?=
 =?us-ascii?Q?i+NlR2igOIl1zgWt1+/rH4wqRMDy3pJkm+ka0+9NlNgjhvuOxTlW8f6Z7Xnf?=
 =?us-ascii?Q?n4Esln2Wbohfwp4Sj3qEYMsXpnPKD05LperB92oMgBlmY471Oo8n+hMzTDLZ?=
 =?us-ascii?Q?Hr2Q0o1mph8DxHZ1EXEovVHPotig7kH3N240ln98TW+Fv24/cKUZygUj99xB?=
 =?us-ascii?Q?MwUEzMZa0daQAk+vNZSByUWhflBxZPmn6BKa2Xn22q4XsJa0PH49iGlueInq?=
 =?us-ascii?Q?lS+fak+ovHY1UKY8/o4uoK6rWLvwk3PLrFnuQdc+0yPndaoL2J/dL5g6b9/t?=
 =?us-ascii?Q?1IeGmESRpAdyC+plcs5KPnIlnUiua8D6DnF3r8zgS8whNV+Wk5+qpf3OHvQw?=
 =?us-ascii?Q?i6agH9Hqp1NYwSTEszqTkN+Nh4vkw8a3/igVUFrzEB9ALqYhOvrCkIS3hiDe?=
 =?us-ascii?Q?gIVe1+PPXxTrHGiE+JxVPblltVXNk4ZMm3zfyumh7Njxe/IQ3RDe1xFkk6Z0?=
 =?us-ascii?Q?jQYdsGj1o0LG1B6IISrxuPudbGHkOPsDAeNbCXOSbzNxuysSKWBMLhEMHIJL?=
 =?us-ascii?Q?/Xm4YGyQDUM+YWkJWOJyFeK2TkQ4cN/v4nhg+GLCgmLUJOU6tRuzQiMMzRtA?=
 =?us-ascii?Q?IME9eotHGCvQPyLtd4l8tFmvW3UcmHtY6MYndoKycT6Rfmj55jWp6kVnSTSX?=
 =?us-ascii?Q?dXE3QGu0aDH90VhTQxjwcMDbTZgQTlzIrit3t/iYiw/+jFxJVrwkunQBYjjM?=
 =?us-ascii?Q?Rr0y4oQ5RdXcQIzvrHPYR5COpbCC2P3+EQ6de6Mdbvf3Kn4zM+sx1CKNvmsP?=
 =?us-ascii?Q?D4iX+ZZKi/5JmYXurOE32G7VSWLXm1mhvzqpFTgPIO7TiAkv81i2Qg2rdc/e?=
 =?us-ascii?Q?SCKq7QUc5U/zZb9RA/Wn6PTOm8xkynI2rluIIn2iiB/JgbX17KUAfRtMVE0X?=
 =?us-ascii?Q?HO1qLaFQWIhSmDVfpe/++x2bjRWBRoLeDgvC/Oc2cYpKamBP0Aeeb66SH/d6?=
 =?us-ascii?Q?jVOOV8MFU/Q8O8vNDFnY4BTTev8pjGVkw9k8FOi9xSjtA9d1AAipEnXqVy4O?=
 =?us-ascii?Q?y00JsTfj/W145jaxGXMyefZf6BW5E7Aj090vQv5CpSM1eUVTS6yMeffjxpHA?=
 =?us-ascii?Q?KG8sUsSdhwL6+1rYvo9BptFlJDLv0ZAI1by5Om7z7G4ffxlZF1H46Jms2rmm?=
 =?us-ascii?Q?bmZ9EsmUSAgEdpHuS2nuuXoCq4rkRsOa+DmEMSffVWmLjzj4FQMDxpatAYzx?=
 =?us-ascii?Q?KYDghc2AX5ODqWptVZvKqlavvArKZR+SqKBdX9E0Bi5A+wJrF8ht0N7diKrK?=
 =?us-ascii?Q?W97VnULExOhaIkVcf9YLUTvmwom39OgJqhC60gEay2B0viTMZkWQ5gzQOcm3?=
 =?us-ascii?Q?m7Ql8sx43T3W4ZQz8lUP1K0fTUP4uK5d1OaIm0KdftYhkUHoZmZTtr6dSseL?=
 =?us-ascii?Q?+rB6TDIjkLjPeOk0q0MNGJr9fiMqcapKRDsLATEaj5g1Jlj+N+wlNDOZESQZ?=
 =?us-ascii?Q?MxK85ChPbeU1if6h7ZWNxUw9ikgqEZJls4o9ZsPo/6sZsycN3UXsLysxCTlK?=
 =?us-ascii?Q?6WpmWfAtVvpwX8poWybUzQPNtqkzhzN8HLeBCj4ZGQiZP1bhiCGPO15RYYNf?=
 =?us-ascii?Q?ZA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1df5769-08b4-40d6-3cab-08db5277a279
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 23:29:58.4977 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8l4LJInHCIfrjACfDdNJ/A4R9ynRVaybi9r4pi7vDeHk0x4U4FzRA9lLe+6hYMk8j7heAJYxNukEyv8MfbJ3O0oiLeliolKfpFkwl2H81Lw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5929
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 01/26] drm/xe/mtl: Disable media GT
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

On Wed, May 10, 2023 at 08:46:57PM -0700, Matt Roper wrote:
>Xe incorrectly conflates the concept of 'tile' and 'GT.'  Since MTL's
>media support is not yet functioning properly, let's just disable it
>completely for now while we fix the fundamental driver design.  Support
>for media GTs on platforms like MTL will be re-added later.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt_mcr.c |  2 +-
> drivers/gpu/drm/xe/xe_mmio.c   |  2 --
> drivers/gpu/drm/xe/xe_pci.c    | 15 ++-------------
> 3 files changed, 3 insertions(+), 16 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
>index 3db550c85e32..be80fdc4b5a2 100644
>--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
>+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
>@@ -293,7 +293,7 @@ void xe_gt_mcr_init(struct xe_gt *gt)
>
> 	spin_lock_init(&gt->mcr_lock);
>
>-	if (gt->info.type == XE_GT_TYPE_MEDIA) {
>+	if (xe_gt_is_media_type(gt)) {

was there a squashing issue here?  if media GT is being removed,
why are you replacing the gt type check xe_gt_is_media_type()?
Shouldn't you then remove xe_gt_is_media_type() is all this branch here
since it's for MEDIA_VER(xe) >= 13?

or just leave this branch as is...

> 		drm_WARN_ON(&xe->drm, MEDIA_VER(xe) < 13);
>
> 		gt->steering[OADDRM].ranges = xelpmp_oaddrm_steering_table;
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index c7fbb1cc1f64..4804616a3c44 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -301,8 +301,6 @@ static void xe_mmio_probe_tiles(struct xe_device *xe)
> 	mtcfg = xe_mmio_read64(gt, XEHP_MTCFG_ADDR);
> 	adj_tile_count = xe->info.tile_count =
> 		REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
>-	if (xe->info.media_verx100 >= 1300)
>-		xe->info.tile_count *= 2;
>
> 	drm_info(&xe->drm, "tile_count: %d, adj_tile_count %d\n",
> 		 xe->info.tile_count, adj_tile_count);
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index a6858fc7fe8d..bf2c234c4f6e 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -19,6 +19,7 @@
> #include "xe_device.h"
> #include "xe_display.h"
> #include "xe_drv.h"
>+#include "xe_gt.h"
> #include "xe_macros.h"
> #include "xe_module.h"
> #include "xe_pci_types.h"
>@@ -271,20 +272,10 @@ static const struct xe_device_desc pvc_desc = {
> 	.extra_gts = pvc_gts,
> };
>
>-static const struct xe_gt_desc xelpmp_gts[] = {
>-	{
>-		.type = XE_GT_TYPE_MEDIA,
>-		.vram_id = 0,
>-		.mmio_adj_limit = 0x40000,
>-		.mmio_adj_offset = 0x380000,
>-	},
>-};
>-
> static const struct xe_device_desc mtl_desc = {
> 	/* .graphics and .media determined via GMD_ID */
> 	.require_force_probe = true,
> 	PLATFORM(XE_METEORLAKE),
>-	.extra_gts = xelpmp_gts,
> };
>
> #undef PLATFORM
>@@ -528,8 +519,6 @@ static int xe_info_init(struct xe_device *xe,
> 	 * treats it as the number of GTs rather than just the number of tiles.
> 	 */
> 	xe->info.tile_count = 1 + graphics_desc->max_remote_tiles;
>-	if (MEDIA_VER(xe) >= 13)
>-		xe->info.tile_count++;
>
> 	xe->info.subplatform = subplatform_desc ?
> 		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
>@@ -553,7 +542,7 @@ static int xe_info_init(struct xe_device *xe,
> 		} else {
> 			gt->info.type = desc->extra_gts[id - 1].type;
> 			gt->info.vram_id = desc->extra_gts[id - 1].vram_id;
>-			gt->info.__engine_mask = (gt->info.type == XE_GT_TYPE_MEDIA) ?
>+			gt->info.__engine_mask = xe_gt_is_media_type(gt) ?

same thing here. /me confused

The rest of the patch makes sense and we could leave these lines alone.
It seems the main goal of this patch is actually to free up the
tile_count to be used with proper tile in later patches rather than gt.

Lucas De Marchi

> 				media_desc->hw_engine_mask :
> 				graphics_desc->hw_engine_mask;
> 			gt->mmio.adj_limit =
>-- 
>2.40.0
>
