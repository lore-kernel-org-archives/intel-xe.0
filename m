Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D07BE82CD6
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 20:38:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D17510E5AC;
	Wed, 27 Sep 2023 20:38:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B542A10E5AC
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 20:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695847087; x=1727383087;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=o3fzWD292Y5QYIu8pFzFeu0qpm/DtcYiHFQthqPA6Cc=;
 b=VEz/rpLuDKsAKjokObcSlJo5W0xA+NTHDjkDLi+2+b6r5YUVz6W7/Ywn
 tkMrHRY+y2YYsOZQP3Mlp+pnQDT4FB0VzZfD1JN2SVBuhTQk7wEnFai1n
 awfeT3Bdfnxd0nWJhRdoOqc/fIqJPbbq6KJNb5/BvSV91jFSiDelU79KK
 KTG0/yUasjG7cSbIBqIw2IFE/vzq7PvjsheD5pM8977UL6AgS561xA2d6
 EyjwP6SL8MjBKFckMJahoqvUReFFUMsls9wwix4hJCzLUyPNw5VJqu741
 +E7UlzEKVsYfeLsUlk1dy1YkuVRkirNEYZqcCIyXavNVTQXYG6ptfV6ln A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="381826955"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; d="scan'208";a="381826955"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 13:38:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="1080311073"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; d="scan'208";a="1080311073"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2023 13:38:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 13:38:05 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 13:38:05 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 13:38:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YKxe5PQcIG5mm7+DbOQ39B2EBddVdzkQjfn0yAjOKSKCpXSOWBNAQeAQmxHP11ik53FrEPJWYFccCv1ejcSDFOY6U9D92qWSkVm+7JioWh3c4g8B3lm7k/7OhBgRZ7F7cjUJsJOh8NNTTvxgjITN2z82o3C6fqk6GYV/43aaOoeB4Eo768uSm6oegLJ1wCxBnJX7x0lRdGwjWWjj+4puc++n/IHJEqQfYunuiHHpxP/1ajlcnS1ghIZUkFjk0g0kASqCiSyJrEhp3VWVm6Wbp5rqIja0QetDjzqVQBCn9W0OjJKMUd5sMxbmNKgeinNerbIZXdgP6j+M4Exne/ZBow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+bjCk6IwsOfec61rHEymArJruvh/JhFjCJRnHm5PfKg=;
 b=cm/odbif5hfoZPcf1zl4L7l09saza4H497VlsrDGNDMQ+7R4ISs+V+kuTt5Az/L2TjAPWuOI38O4w674vfCKhbWfJRAWMLKBGMqBhRT1K85Z27BwLSMz8cLEqmyhxl1rpPxkVqCmOf/oMDo9ilwqCQPd2pmTmvXlOvVBehTn/9c/SZrUHfzqmGqAJc8J5pmZZ+RPWTdb0k0ZUUsb9e9pO61ASC3o+PWUuYFaIW/B0jScU/iS5Twct4qkBUCE6zKDZPolkZ3PnwdIfossR3tiQRf4zObMCsvOEDGUhxZM3PRr44ocWroLzCe3cb1iv+nacmKw8V3bZxTzamRJGnGfSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by PH7PR11MB6030.namprd11.prod.outlook.com (2603:10b6:510:1d1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Wed, 27 Sep
 2023 20:38:02 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042%3]) with mapi id 15.20.6813.017; Wed, 27 Sep 2023
 20:38:02 +0000
Date: Wed, 27 Sep 2023 13:37:59 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Bommithi Sakeena <bommithi.sakeena@intel.com>
Message-ID: <ZRSSpwCp1jocJXU2@nvishwa1-DESK>
References: <20230927165012.9048-1-bommithi.sakeena@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230927165012.9048-1-bommithi.sakeena@intel.com>
X-ClientProxiedBy: BY5PR03CA0030.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::40) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|PH7PR11MB6030:EE_
X-MS-Office365-Filtering-Correlation-Id: 8251bc98-7805-4197-9e3f-08dbbf99a50f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dseuLZyNz9D0WDkaOFNa0B4jsXEmIOwjt10a+3rcONPlvrWyAREVy8PWstv+97u+pjuDMTZC3DGKHjA8ZKW8gHhDGstX5X9HNr53/UdW5dufbO04BzSXtj40gPhorTzuS/TrdXw6NhFhWocAItiiguvmJIJzBzJPsIhz4wAtlQMf3MiDqAcOU3ve8wSW2zMu0d4hy3i+I8GbMVgwcN1IFIaQDVV1XwGkdXQDqctf/qkIs8lQ7op5k1D83SLJK3IrGgFv5wS4jxNFa7ATQdtkjUocXqq5qcS4FTepASLcfJXb1eDCaJOLAUBcYf0DmKHDOYeyQnwWOS8guVZXPv76kTAaeXOWiLyrfGAII1TXCs52CTSFL3HGAxDzUF0KjBpDiBSV1ZlYMdpYevE/i8KAePsXylgd66+fbmOyyng1yTSmEPaGorgDvq7DeDFmhas3KyTtDekUNDxcKGK83mBYjD2O5c4UYlaCuK9a4WN6YNE8L+j54gVDN9Qg6a0FJFCIAh54VVbUsbAeiV2fB8GJH9ydnWoTsdWtJdawU9b4RRjZmIFX5yqlOyPQDppiOQjs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(346002)(396003)(376002)(136003)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(8936002)(86362001)(8676002)(44832011)(38100700002)(4326008)(5660300002)(66476007)(66556008)(33716001)(41300700001)(6636002)(316002)(2906002)(6862004)(66946007)(83380400001)(478600001)(6512007)(9686003)(82960400001)(26005)(6506007)(6486002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rzfUoauuvrSAgao7zdk2MdqTd235Z/BkEPYA2g7l+Uhj5dPXBWy/QnbSg7pg?=
 =?us-ascii?Q?cUQ38fRWKce1VlkSrbU53HYrDr3zhUBukZrH5sSKh+K9EuK4KjolBqUWJ6/o?=
 =?us-ascii?Q?HyacnrTbKode4UzOMKUAg3B1c5qMsOU5C2rTHiEXmPwbKdUJF3b9PC99LdQB?=
 =?us-ascii?Q?r+gHIKtyQtVS9uFOLBC6svMoLODqPbf3BloO/IZ4P1FLbpJjFvEW7eYxa8os?=
 =?us-ascii?Q?1ki47ChxhGAgvdlpE9I1AY+jW/fnK0BGPFWyTME92x+OERgS9GrABqQyzC9l?=
 =?us-ascii?Q?sNwGLZQ014E2HN4Swv+YYr5ZHganQ+BPoFcvaumThXQy++l8YPXHHiEgTkIb?=
 =?us-ascii?Q?HpTRJRtCzv6ZMbXjgfr3WcJ57x2qWKnU+2W5rUCZ3QDq4c0ear/OQ0/5xfHH?=
 =?us-ascii?Q?MjKflUpfKPP+Asv8AgwNjOrqowocSQLZKiCFxEqla/a55jEO0eITYMD9UREx?=
 =?us-ascii?Q?QjO04u/N+gUJwwlWlQaz8luxxqmi8d5cFOpkBTWrBRPEILv8bLprXSndFy7x?=
 =?us-ascii?Q?tECRVlB4OIS9hBJN8LwHyh1Of7dYMVZ95O7N01s6J2nJn9pYjk1y+SRtmnoi?=
 =?us-ascii?Q?q+IFasQBqQfZpvd93v4v05w9gmvFKjW/NucEYcKEaMUKhNsqbtIs+spmgvYX?=
 =?us-ascii?Q?bindk9XdeC2wEUOfAjBsGNaur+Ko6mL3UOCRg76szgUcIyuJ9IQGpAPEHZRz?=
 =?us-ascii?Q?w0JNrqKafxCtz+0/d3RpLJjYb8MLlaT9n0/uI4dOBHk7LfpHRP0o9BcbVtKr?=
 =?us-ascii?Q?zaYu1PFdYVnsC3I9QNBg+LypvLOr34mdG/fQTEKBl392DUIFmdL2YPtz5q/M?=
 =?us-ascii?Q?iZXKTc1xfppjuB3v9PD9CH098BrMND8ajvLI9xkd7ViPPmd4Xumn2bC3zRfk?=
 =?us-ascii?Q?/XuhaNHVKx7WQEhjXu1h6T82X3XNItREN8OAC3t+ds7adLZ2Br+pbtb601VP?=
 =?us-ascii?Q?cN+rw9+1AnMzPPdAKUzMwNwtXaVoC6MKznq6ezpNOe0g9g2khNz2y+GXvtux?=
 =?us-ascii?Q?hQq8hG0tCF5qWclJ7gKIU6r8eTvD7bCIijWFNREfctsQXcbFa05Vt48yi3xu?=
 =?us-ascii?Q?OAu0hz6ckkSznpD3r3ESusx1V2zW0kzA/qe+qYjuh2ArGfjSz41qkUTXxxUg?=
 =?us-ascii?Q?9kbsfq/uUX/tt0WixpiDausci79iIUwP1G0LxliibmF6Er5l5L/11sXQGe5A?=
 =?us-ascii?Q?Pv5yIHE8s5c0UMp5TdHQ1rnSlCx31zF+K6EZn719FrD/odzOKl1j+8BoN2Tp?=
 =?us-ascii?Q?hKWeWx6XxowPvOO+usnO2DrR9wTrVdDJRI17gnxdRQIWbC0yM4Y2zPQf0O79?=
 =?us-ascii?Q?PW6s11Chfamp2CXVVs6/6lGYHAa7RXEIl5cvg4TBK2uN/9OSeOu/vtwJGkbH?=
 =?us-ascii?Q?tb/VNQgXxR+Z5da+Mn4nSPZ2hN5C99dWZT1GG8DQdPUWp4LhXmeU0d3Dw3Ba?=
 =?us-ascii?Q?EuPzaUInD8C9FDL9unI7KufBbJK9EvDbsmShDIzo6MM32FRKHTdeT/hrsGc0?=
 =?us-ascii?Q?Asc16pyKGfyZDA6bgyHHd7S/oNV3wrxxRrdziDoclXmfjs2Dp5CdS7B73b+8?=
 =?us-ascii?Q?kvKflVwy9qWGu6ashmd10xd0lWl2f7y/mBTaG3xlBQhD7wDKtn4gtCIQKQgR?=
 =?us-ascii?Q?kfaQn4zxLYT8lfkbFINPHpU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8251bc98-7805-4197-9e3f-08dbbf99a50f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 20:38:02.5786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6V7JRN8CT1+PvAijhSZ49///oN2YNmOwOvN4rhTjfpSmsyldLzDSHQuKHSHxX4uL0ZzxfS2y9XptGLfIOjYfAfMaQmIvTiX74hPOiin+fS9YFU01ddaIORfDTvS3Y9vL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6030
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Ensure mutex are destroyed
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

On Wed, Sep 27, 2023 at 04:50:11PM +0000, Bommithi Sakeena wrote:
>Add missing mutex_destroy calls to fini functions or convert to
>drmm_mutex_init where fini function is not available.
>
>Fixes: c639b8b60dfe ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>Cc: Matthew Brost <matthew.brost@intel.com>
>Signed-off-by: Bommithi Sakeena <bommithi.sakeena@intel.com>

Can we use 'fixup!' tag (instead of 'Fixes') if they can be
squashed to the originating patch?
In either case,
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>---
> drivers/gpu/drm/xe/xe_guc_ct.c     | 2 +-
> drivers/gpu/drm/xe/xe_guc_pc.c     | 1 +
> drivers/gpu/drm/xe/xe_guc_submit.c | 1 +
> drivers/gpu/drm/xe/xe_pcode.c      | 4 +++-
> 4 files changed, 6 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>index 2046bd269bbd..8b686c8b3339 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ct.c
>+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>@@ -137,7 +137,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>
> 	xe_assert(xe, !(guc_ct_size() % PAGE_SIZE));
>
>-	mutex_init(&ct->lock);
>+	drmm_mutex_init(&xe->drm, &ct->lock);
> 	spin_lock_init(&ct->fast_lock);
> 	xa_init(&ct->fence_lookup);
> 	INIT_WORK(&ct->g2h_worker, g2h_worker_func);
>diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>index 8a4d299d6cb0..d9375d1d582f 100644
>--- a/drivers/gpu/drm/xe/xe_guc_pc.c
>+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>@@ -890,6 +890,7 @@ void xe_guc_pc_fini(struct xe_guc_pc *pc)
> 	XE_WARN_ON(xe_guc_pc_stop(pc));
> 	sysfs_remove_files(pc_to_gt(pc)->sysfs, pc_attrs);
> 	xe_bo_unpin_map_no_vm(pc->bo);
>+	mutex_destroy(&pc->freq_lock);
> }
>
> /**
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index ac5fc2c797a7..f7bb3d0eed56 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -194,6 +194,7 @@ static void guc_submit_fini(struct drm_device *drm, void *arg)
> 	xa_destroy(&guc->submission_state.exec_queue_lookup);
> 	ida_destroy(&guc->submission_state.guc_ids);
> 	bitmap_free(guc->submission_state.guc_ids_bitmap);
>+	mutex_destroy(&guc->submission_state.lock);
> }
>
> #define GUC_ID_MAX		65535
>diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
>index 7f1bf2297f51..4a240acf7625 100644
>--- a/drivers/gpu/drm/xe/xe_pcode.c
>+++ b/drivers/gpu/drm/xe/xe_pcode.c
>@@ -8,6 +8,8 @@
> #include <linux/delay.h>
> #include <linux/errno.h>
>
>+#include <drm/drm_managed.h>
>+
> #include "xe_gt.h"
> #include "xe_mmio.h"
> #include "xe_pcode_api.h"
>@@ -276,7 +278,7 @@ int xe_pcode_init(struct xe_gt *gt)
>  */
> int xe_pcode_probe(struct xe_gt *gt)
> {
>-	mutex_init(&gt->pcode.lock);
>+	drmm_mutex_init(&gt_to_xe(gt)->drm, &gt->pcode.lock);
>
> 	if (!IS_DGFX(gt_to_xe(gt)))
> 		return 0;
>-- 
>2.34.1
>
