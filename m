Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB74EC76196
	for <intel-xe@archiver.kernel.org>; Tue, 28 Mar 2023 16:11:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC8710E487;
	Tue, 28 Mar 2023 16:11:08 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECCE910E477
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Mar 2023 16:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680019866; x=1711555866;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=aXbQKJwwbmLsq68owN2aAW+3bvQK4AvnFnnRp4si+PA=;
 b=CGK6USyyKMQVMFMTnOyk6TrHXf62amQBKJGjnLmHp5koFzrd969m8V+i
 JL7vNi8l6GYuwOMakjJU+3btov64x1T/6qFr/Ne/4hqBwup1/4IADCB5a
 oc6Eoy0KdqZslzkwaXBCFcmwo3D/od6JQduX3Sfl+a0uFOXFPh//01REw
 M2OS/OCG6egh5UTNpFyESrTNMFMNUR8jGSdrWHSVz++PtfjyAotsmtoeW
 Rli76pN3/fEEmgCMOP24LOaMBeXLUkYWx5gV6IZzG2NeDRP36y+6nxqzO
 lbNzdwh5fniJvPMbJ+4TGFUBpLz0V4xAOUZ+Otoi/k2QCgoJsqA2AB3db A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="338115945"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="338115945"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 09:10:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="807896499"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="807896499"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 28 Mar 2023 09:10:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 28 Mar 2023 09:10:43 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 28 Mar 2023 09:10:43 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 28 Mar 2023 09:10:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gHTV5h24LZTfaIQFLNqtFu99tHiS49by+vc8H7J2CyxRxEZBmibtDgLhD6OSCepmN1UITdjwR6dUelxX5UvWudc/NzVB8xAV23Uo6ETx3z22yyM5n08lNrgud+dl7SdtWRVmuNQgsvGcmklgGEge8elR5A9sr10l8mSM0O7Es1cRFbgYMAETAqdwT7TaUb0AMvDns75OlqsrCFuIceBZ6qXRGnh4ykueRsvORgZuP8YbtUzW1LfSJRbBuCaiKoStibSQqAESNyCwGX8+43qozFysoujUMyuhMvfP44gr7MDiosvpBGPIH4juTyfmdCXwGm5yMipbXkj+BwZsPyOgFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NeqCA+Y4knEeLxKL2ce5qAQGyxHQpdZf7um4Atvs9K0=;
 b=Mt2tRm+haP9OtTG0AFjZj6Nmx6la8J6PDz2m6duGc070AbC/YDD9V7STVj6qMuk/AY57V5AsMmgr0NGBT90il1LFx/f/5RXiEbjUz1T0+weUt0+Z8Mwm5C8xEodAIhmXo6Q2FmB4ak0WE0F/2ICmktlDs4CPHhC7CEqx/5wT2fEbAraRnw+McsRmI2HMqLCP4CkMSeNW/WlPZC1bOQKltGJLFl8ZG62pgyilp+f250gIuwl/pndoWYji4b/CFfu826LghERWTQKX3THSCDng3/42XwfP7EmCh7EwxbflPaH7VFFK0Gbzt31BGeFxluuotlbDs26zzIKe1WQdT1lASw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB6870.namprd11.prod.outlook.com (2603:10b6:806:2b4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 16:10:40 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18%6]) with mapi id 15.20.6222.032; Tue, 28 Mar 2023
 16:10:40 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 28 Mar 2023 12:10:19 -0400
Message-ID: <20230328161021.669017-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230328161021.669017-1-rodrigo.vivi@intel.com>
References: <20230328161021.669017-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0030.namprd08.prod.outlook.com
 (2603:10b6:a03:100::43) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB6870:EE_
X-MS-Office365-Filtering-Correlation-Id: 593a19e3-be8b-4ffd-3a38-08db2fa6f97e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YKpo6eeUvaCjhUKpboq0UpZuIJToLaCiB4q0egKSqHRA4ElM8tEiZtIGwp8OjC2+tZmS7rGZHW4jEqJfZT0ZdzN4WI6WTtUD5AemoJfSm1pzJohOcfKggO+ea5XK4aoKC6By3YuvHHzqEWmpgVaDNOWkaJ+4hvOG1N/A6m9G58Y9mSP924LMb3qAh2iyYf+/6RU5JuDQ3T8zQ/cDLhRTEkNGju7TFOCtpVme6qGPAA06OcW9Xhrb6XVveA+13mqK+STSnG+Nfo1tB1oOxbYpaQ1TQQRpniI/E2mZYZftSt5sJ+tlTPn/8YdgT1fIHDjvwdSaCqYOiJMT5sRT4MyjQZylvWlm8cbQOXLY4TPBh7Mg4WnwT4r+hngUlctOLX6A9JMpgjgmzUfVNXkShcHXVgB9DlfoYj7xClLkujL+fMnEqVuoChux2iQLwDuGWo6cUbMV0I3MwUDIqJs4nOuA6SVyxkNvCGgmHZYgKPO1yW1UZu2zjKerPjgPSV7wQsflqnfqfMKSa7sOHLPvxZ9RmLEg/3Fme2t89pE3fAiie+WUhn2fpaGzIv4pVpXZUK9N
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(396003)(136003)(376002)(39860400002)(451199021)(4326008)(66476007)(6916009)(8676002)(66946007)(66556008)(41300700001)(82960400001)(36756003)(2906002)(86362001)(30864003)(5660300002)(8936002)(44832011)(38100700002)(478600001)(6486002)(316002)(6506007)(1076003)(6512007)(26005)(186003)(107886003)(6666004)(2616005)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BJPoechUsui9eNpeiliHrUvVyz3N7B2NGWgbt500LD6myMVJxdOIWoBoAs5L?=
 =?us-ascii?Q?BkdJCbWTrBMdqRZqO1aBn2g7Tgc6Oklm89nJ0N16QW4/wWZo3idm+r8VNZMq?=
 =?us-ascii?Q?K+lW/pUmkQXvBK/GhRuwPBdfLiVXi2xIpfUFnlT5V6VEaYFi42SpWXYG8iHO?=
 =?us-ascii?Q?8fiJD+klO8+OfPUz5Om4RXTX17fbw7nEzDyVUaOCkiTBgRGXlVdthNtFhSaC?=
 =?us-ascii?Q?cKJYUC1yp8iQRg7ZwoaBfd6rR2j65bB8q/VZA+isn1Ad3UykFYwDqhZn9nb7?=
 =?us-ascii?Q?bEMQbm93VvEeBIAq0d/kAHoAw+qRCjwc3yButLxZ0EFWCuWcsaz0wTRkjB+X?=
 =?us-ascii?Q?Dx5heol1+wLyy8tzz0uvcaciN63n4SQxMIT6DI46gMWWV/Imj9Z18PeDC3Gk?=
 =?us-ascii?Q?HaWxAGCuDudsixPGYG2a5VB+WRvHBr4SIGskeCQDtuz//UeBdXQrNY/6wku9?=
 =?us-ascii?Q?Uyog8jZu7gfW9uiXvAtG7pqowWml3Xb2+JDbJCHWZbagGM1qVyA86adxvmIK?=
 =?us-ascii?Q?xSxXfw1meiNpqtpPhGODh4IrUSLtx5t49Ej9eFxklxgnbG6qA6legeR3rt16?=
 =?us-ascii?Q?xmH/xGGUhBWEabQ+AtFxnRT8/8fEwxbH7yMDLymvj072o4ikXQ8jOx52GlBf?=
 =?us-ascii?Q?EFULh81/Rim9WTC/Fw29XA/dj00CxxZhb0LItP4lWQrTBXeyymceyNp50CRj?=
 =?us-ascii?Q?2c50PSsJKsKPDbAL2uovrFZHmhUNADomK27yipYFNP6evCnFGbw3S8/lOgdo?=
 =?us-ascii?Q?fzkoXilQ7997l7U2+vdB3DwM0cJqL5xWny6Rq65zUQ37I2UGexLWWhu0vGH9?=
 =?us-ascii?Q?m46lD+1ouA/sgPr923+NCgWvl1qgf9e+MMPbI/qu4/CtKasyhdLhGomO9lpo?=
 =?us-ascii?Q?8ESda1PP9mfvEx+G30Q5NaYoWaBc2FDcx1Atbs13ol2lZ96TWYIb9Ir14/Xo?=
 =?us-ascii?Q?hDroKNZsTf3fTXoUUwzQEXjZ9EO/P9V6hDrORguOgIoqMSDjjidCCJdwcOM+?=
 =?us-ascii?Q?wOmFa2t3X2pkurSHkoxnyUBdRN62fh7fZMmKoEZdrKjlLYnuaKSP7mxL2W9t?=
 =?us-ascii?Q?k4PB8lVJg7lcXlWP8fiiH+SgjECikbjYUdSKCqvYPksiZxLxWu1xgRPKhhrA?=
 =?us-ascii?Q?JVNDQHif7gW/pumFt7INHedKF68fihK/Exl0S13QnxBXWGe00mNDv3q+7S6K?=
 =?us-ascii?Q?OMQbqy+ZLuiz1BKWyEuEjNc3Qcj7BfsNw67sQNlYaY7KxcYdvJbnf+Qy7xZn?=
 =?us-ascii?Q?BFCroowrN8JocsiDUg4QM2NBI101NGQKcdH4r52gVI30d6vjkXHFC0NMVhwK?=
 =?us-ascii?Q?YJxUrFAdojhoB/mmTjKrfjUe9rYIVfCf7ekQXZ7CLYHhmOlcb0p3a85eaXEJ?=
 =?us-ascii?Q?Mp4iEbUjwMhUKD/VK894s8OEYjla2cyxSyz2XpA4Jd29fyQoaVq3tI+W68Bc?=
 =?us-ascii?Q?Y9W4smKcVm5C2iSxl/IPsbXV+l+cecPvhPLnJQW19psA+uLM4QW1fmOJfwWm?=
 =?us-ascii?Q?mRjqzGLCE4TTV60lbwhaEc7pHgneqxKKoIB0+RqPcvHuhaUMcrjx60QX0uNu?=
 =?us-ascii?Q?O6OWIDT3l3u8MTUPFyuOxtS7Pyd0ST31nNgPkPqP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 593a19e3-be8b-4ffd-3a38-08db2fa6f97e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 16:10:40.3551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3fc5sohxPQKGJPdpdY367+dN2MH8g+FuTbJcKs7XhM0+pzl1PL628IMxdraT8197qGu5tyYB0srTS1IkhK2gSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6870
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [RFC 3/5] drm/xe: Remove useless XE_WARN_ON.
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

If that ever becomes useful for something we bring it
back with some written reasoning.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c      |  2 +-
 drivers/gpu/drm/xe/xe_bo.c                  | 12 +++++-----
 drivers/gpu/drm/xe/xe_debugfs.c             |  4 ++--
 drivers/gpu/drm/xe/xe_device.c              |  4 ++--
 drivers/gpu/drm/xe/xe_device.h              |  2 +-
 drivers/gpu/drm/xe/xe_dma_buf.c             |  2 +-
 drivers/gpu/drm/xe/xe_engine.c              |  2 +-
 drivers/gpu/drm/xe/xe_execlist.c            |  2 +-
 drivers/gpu/drm/xe/xe_ggtt.c                |  6 ++---
 drivers/gpu/drm/xe/xe_gt.c                  | 24 +++++++++----------
 drivers/gpu/drm/xe/xe_gt_debugfs.c          |  4 ++--
 drivers/gpu/drm/xe/xe_gt_pagefault.c        |  2 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  2 +-
 drivers/gpu/drm/xe/xe_guc.c                 |  4 ++--
 drivers/gpu/drm/xe/xe_guc.h                 |  2 +-
 drivers/gpu/drm/xe/xe_guc_ads.c             |  2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c              |  6 ++---
 drivers/gpu/drm/xe/xe_guc_debugfs.c         |  2 +-
 drivers/gpu/drm/xe/xe_guc_pc.c              | 18 +++++++-------
 drivers/gpu/drm/xe/xe_guc_submit.c          | 10 ++++----
 drivers/gpu/drm/xe/xe_huc_debugfs.c         |  2 +-
 drivers/gpu/drm/xe/xe_hw_fence.c            |  6 ++---
 drivers/gpu/drm/xe/xe_macros.h              |  1 -
 drivers/gpu/drm/xe/xe_migrate.c             |  2 +-
 drivers/gpu/drm/xe/xe_mocs.c                |  4 ++--
 drivers/gpu/drm/xe/xe_pt.c                  | 10 ++++----
 drivers/gpu/drm/xe/xe_reg_sr.c              |  4 ++--
 drivers/gpu/drm/xe/xe_res_cursor.h          |  2 +-
 drivers/gpu/drm/xe/xe_rtp.c                 |  2 +-
 drivers/gpu/drm/xe/xe_sync.c                |  4 ++--
 drivers/gpu/drm/xe/xe_uc.c                  |  2 +-
 drivers/gpu/drm/xe/xe_uc_debugfs.c          |  2 +-
 drivers/gpu/drm/xe/xe_uc_fw.c               |  2 +-
 drivers/gpu/drm/xe/xe_vm.c                  | 26 ++++++++++-----------
 drivers/gpu/drm/xe/xe_vm_madvise.c          |  2 +-
 35 files changed, 91 insertions(+), 92 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 65c0bc28a3d1..ef37dc1e9a5c 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -190,7 +190,7 @@ static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
 		return ERR_PTR(-ENODEV);
 
 	/* Remapped view is only required on ADL-P, which xe doesn't support. */
-	if (XE_WARN_ON(view->type == I915_GTT_VIEW_REMAPPED)) {
+	if (WARN_ON(view->type == I915_GTT_VIEW_REMAPPED)) {
 		ret = -ENODEV;
 		goto err;
 	}
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index e4d079b61d52..eb00b0a67abe 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -424,7 +424,7 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 							MAX_SCHEDULE_TIMEOUT);
 			if (timeout > 0) {
 				ret = xe_vm_invalidate_vma(vma);
-				XE_WARN_ON(ret);
+				WARN_ON(ret);
 			} else if (!timeout) {
 				ret = -ETIME;
 			} else {
@@ -661,7 +661,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 				void *new_addr = gt->mem.vram.mapping +
 					(new_mem->start << PAGE_SHIFT);
 
-				if (XE_WARN_ON(new_mem->start == XE_BO_INVALID_OFFSET)) {
+				if (WARN_ON(new_mem->start == XE_BO_INVALID_OFFSET)) {
 					ret = -EINVAL;
 					xe_device_mem_access_put(xe);
 					goto out;
@@ -721,7 +721,7 @@ static bool xe_ttm_bo_lock_in_destructor(struct ttm_buffer_object *ttm_bo)
 {
 	bool locked;
 
-	XE_WARN_ON(kref_read(&ttm_bo->kref));
+	WARN_ON(kref_read(&ttm_bo->kref));
 
 	/*
 	 * We can typically only race with TTM trylocking under the
@@ -732,7 +732,7 @@ static bool xe_ttm_bo_lock_in_destructor(struct ttm_buffer_object *ttm_bo)
 	spin_lock(&ttm_bo->bdev->lru_lock);
 	locked = dma_resv_trylock(ttm_bo->base.resv);
 	spin_unlock(&ttm_bo->bdev->lru_lock);
-	XE_WARN_ON(!locked);
+	WARN_ON(!locked);
 
 	return locked;
 }
@@ -748,7 +748,7 @@ static void xe_ttm_bo_release_notify(struct ttm_buffer_object *ttm_bo)
 		return;
 
 	bo = ttm_to_xe_bo(ttm_bo);
-	XE_WARN_ON(bo->created && kref_read(&ttm_bo->base.refcount));
+	WARN_ON(bo->created && kref_read(&ttm_bo->base.refcount));
 
 	/*
 	 * Corner case where TTM fails to allocate memory and this BOs resv
@@ -966,7 +966,7 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 	/* Only kernel objects should set GT */
 	XE_BUG_ON(gt && type != ttm_bo_type_kernel);
 
-	if (XE_WARN_ON(!size))
+	if (WARN_ON(!size))
 		return ERR_PTR(-EINVAL);
 
 	if (!bo) {
diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 7827a785b020..fc88ee32a006 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -71,7 +71,7 @@ static int forcewake_open(struct inode *inode, struct file *file)
 	u8 id;
 
 	for_each_gt(gt, xe, id)
-		XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+		WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 
 	return 0;
 }
@@ -83,7 +83,7 @@ static int forcewake_release(struct inode *inode, struct file *file)
 	u8 id;
 
 	for_each_gt(gt, xe, id)
-		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+		WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index a79f934e3d2d..49dec0b6516f 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -411,7 +411,7 @@ void xe_device_mem_access_get(struct xe_device *xe)
 	if (resumed)
 		xe_pm_runtime_put(xe);
 
-	XE_WARN_ON(ref == S32_MAX);
+	WARN_ON(ref == S32_MAX);
 }
 
 void xe_device_mem_access_put(struct xe_device *xe)
@@ -422,5 +422,5 @@ void xe_device_mem_access_put(struct xe_device *xe)
 	if (!ref && hold)
 		xe_pm_runtime_put(xe);
 
-	XE_WARN_ON(ref < 0);
+	WARN_ON(ref < 0);
 }
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index d277f8985f7b..5f725ed2ca6b 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -97,7 +97,7 @@ static inline bool xe_device_mem_access_ongoing(struct xe_device *xe)
 
 static inline void xe_device_assert_mem_access(struct xe_device *xe)
 {
-	XE_WARN_ON(!xe_device_mem_access_ongoing(xe));
+	WARN_ON(!xe_device_mem_access_ongoing(xe));
 }
 
 static inline bool xe_device_in_fault_mode(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 9b252cc782b7..485aa5ccbeca 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -219,7 +219,7 @@ static void xe_dma_buf_move_notify(struct dma_buf_attachment *attach)
 	struct drm_gem_object *obj = attach->importer_priv;
 	struct xe_bo *bo = gem_to_xe_bo(obj);
 
-	XE_WARN_ON(xe_bo_evict(bo, false));
+	WARN_ON(xe_bo_evict(bo, false));
 }
 
 static const struct dma_buf_attach_ops xe_dma_buf_attach_ops = {
diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index 37209b13bcd6..cdd2349524d6 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -705,7 +705,7 @@ static void engine_kill_compute(struct xe_engine *e)
  */
 bool xe_engine_is_idle(struct xe_engine *engine)
 {
-	if (XE_WARN_ON(xe_engine_is_parallel(engine)))
+	if (WARN_ON(xe_engine_is_parallel(engine)))
 		return false;
 
 	return xe_lrc_seqno(&engine->lrc[0]) ==
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 02021457b1f0..127ca8c6e279 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -373,7 +373,7 @@ static int execlist_engine_init(struct xe_engine *e)
 		sprintf(e->name, "ccs%d", ffs(e->logical_mask) - 1);
 		break;
 	default:
-		XE_WARN_ON(e->class);
+		WARN_ON(e->class);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index a430d1568890..bd079e823661 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -205,7 +205,7 @@ void xe_ggtt_invalidate(struct xe_gt *gt)
 		int seqno;
 
 		seqno = xe_gt_tlb_invalidation_guc(gt);
-		XE_WARN_ON(seqno <= 0);
+		WARN_ON(seqno <= 0);
 		if (seqno > 0)
 			xe_gt_tlb_invalidation_wait(gt, seqno);
 	} else if (xe_device_guc_submission_enabled(gt_to_xe(gt))) {
@@ -294,7 +294,7 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
 		alignment = SZ_64K;
 
-	if (XE_WARN_ON(bo->ggtt_node.size)) {
+	if (WARN_ON(bo->ggtt_node.size)) {
 		return 0;
 	}
 
@@ -351,7 +351,7 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node)
 
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
-	if (XE_WARN_ON(!bo->ggtt_node.size))
+	if (WARN_ON(!bo->ggtt_node.size))
 		return;
 
 	xe_ggtt_remove_node(ggtt, &bo->ggtt_node);
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 6322e0689a9e..7d8b4cffcc2d 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -356,7 +356,7 @@ int xe_gt_init_noalloc(struct xe_gt *gt)
 
 err_force_wake:
 	err2 = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
-	XE_WARN_ON(err2);
+	WARN_ON(err2);
 	xe_device_mem_access_put(gt_to_xe(gt));
 err:
 	return err;
@@ -401,7 +401,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 		goto err_force_wake;
 
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
-	XE_WARN_ON(err);
+	WARN_ON(err);
 	xe_device_mem_access_put(gt_to_xe(gt));
 
 	return 0;
@@ -482,7 +482,7 @@ static int all_fw_domain_init(struct xe_gt *gt)
 		goto err_force_wake;
 
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	XE_WARN_ON(err);
+	WARN_ON(err);
 	xe_device_mem_access_put(gt_to_xe(gt));
 
 	return 0;
@@ -623,16 +623,16 @@ static int gt_reset(struct xe_gt *gt)
 
 	xe_device_mem_access_put(gt_to_xe(gt));
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	XE_WARN_ON(err);
+	WARN_ON(err);
 
 	drm_info(&xe->drm, "GT reset done\n");
 
 	return 0;
 
 err_out:
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 err_msg:
-	XE_WARN_ON(xe_uc_start(&gt->uc));
+	WARN_ON(xe_uc_start(&gt->uc));
 	xe_device_mem_access_put(gt_to_xe(gt));
 	drm_err(&xe->drm, "GT reset failed, err=%d\n", err);
 
@@ -663,12 +663,12 @@ void xe_gt_reset_async(struct xe_gt *gt)
 void xe_gt_suspend_prepare(struct xe_gt *gt)
 {
 	xe_device_mem_access_get(gt_to_xe(gt));
-	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 
 	xe_uc_stop_prepare(&gt->uc);
 
 	xe_device_mem_access_put(gt_to_xe(gt));
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 }
 
 int xe_gt_suspend(struct xe_gt *gt)
@@ -692,13 +692,13 @@ int xe_gt_suspend(struct xe_gt *gt)
 		goto err_force_wake;
 
 	xe_device_mem_access_put(gt_to_xe(gt));
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 	drm_info(&xe->drm, "GT suspended\n");
 
 	return 0;
 
 err_force_wake:
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 err_msg:
 	xe_device_mem_access_put(gt_to_xe(gt));
 	drm_err(&xe->drm, "GT suspend failed: %d\n", err);
@@ -721,13 +721,13 @@ int xe_gt_resume(struct xe_gt *gt)
 		goto err_force_wake;
 
 	xe_device_mem_access_put(gt_to_xe(gt));
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 	drm_info(&xe->drm, "GT resumed\n");
 
 	return 0;
 
 err_force_wake:
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 err_msg:
 	xe_device_mem_access_put(gt_to_xe(gt));
 	drm_err(&xe->drm, "GT resume failed: %d\n", err);
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 9fab8017490f..639b2486803b 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -150,7 +150,7 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 	sprintf(name, "gt%d", gt->info.id);
 	root = debugfs_create_dir(name, minor->debugfs_root);
 	if (IS_ERR(root)) {
-		XE_WARN_ON("Create GT directory failed");
+		WARN_ON("Create GT directory failed");
 		return;
 	}
 
@@ -162,7 +162,7 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 #define DEBUGFS_SIZE	ARRAY_SIZE(debugfs_list) * sizeof(struct drm_info_list)
 	local = drmm_kmalloc(&gt_to_xe(gt)->drm, DEBUGFS_SIZE, GFP_KERNEL);
 	if (!local) {
-		XE_WARN_ON("Couldn't allocate memory");
+		WARN_ON("Couldn't allocate memory");
 		return;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 1677640e1075..de0abd322fce 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -346,7 +346,7 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
 		pf_queue->tail = (pf_queue->tail + len) % PF_QUEUE_NUM_DW;
 		queue_work(gt->usm.pf_wq, &pf_queue->worker);
 	} else {
-		XE_WARN_ON("PF Queue full, shouldn't be possible");
+		WARN_ON("PF Queue full, shouldn't be possible");
 	}
 	spin_unlock_irqrestore(&pf_queue->lock, flags);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index f279e21300aa..6c9a96cf3d5f 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -319,7 +319,7 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	/* Sanity check on seqno */
 	expected_seqno = (gt->tlb_invalidation.seqno_recv + 1) %
 		TLB_INVALIDATION_SEQNO_MAX;
-	XE_WARN_ON(expected_seqno != msg[0]);
+	WARN_ON(expected_seqno != msg[0]);
 
 	gt->tlb_invalidation.seqno_recv = msg[0];
 	smp_wmb();
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 58b9841616e4..bccdfb914f08 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -805,7 +805,7 @@ void xe_guc_reset_wait(struct xe_guc *guc)
 
 void xe_guc_stop_prepare(struct xe_guc *guc)
 {
-	XE_WARN_ON(xe_guc_pc_stop(&guc->pc));
+	WARN_ON(xe_guc_pc_stop(&guc->pc));
 }
 
 int xe_guc_stop(struct xe_guc *guc)
@@ -830,7 +830,7 @@ int xe_guc_start(struct xe_guc *guc)
 		return ret;
 
 	ret = xe_guc_pc_start(&guc->pc);
-	XE_WARN_ON(ret);
+	WARN_ON(ret);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index 74a74051f354..903069a07ca4 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -51,7 +51,7 @@ static inline u16 xe_engine_class_to_guc_class(enum xe_engine_class class)
 		return GUC_COMPUTE_CLASS;
 	case XE_ENGINE_CLASS_OTHER:
 	default:
-		XE_WARN_ON(class);
+		WARN_ON(class);
 		return -1;
 	}
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 304a9501b447..d5a089694f80 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -313,7 +313,7 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
 	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
 	ads->regset_size = calculate_regset_size(gt);
 
-	XE_WARN_ON(ads->golden_lrc_size +
+	WARN_ON(ads->golden_lrc_size +
 		   (ads->regset_size - prev_regset_size) >
 		   MAX_GOLDEN_LRC_SIZE);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 5e00b75d3ca2..fec09ba412a8 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -378,7 +378,7 @@ static void g2h_reserve_space(struct xe_guc_ct *ct, u32 g2h_len, u32 num_g2h)
 static void __g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
 {
 	lockdep_assert_held(&ct->fast_lock);
-	XE_WARN_ON(ct->ctbs.g2h.space + g2h_len >
+	WARN_ON(ct->ctbs.g2h.space + g2h_len >
 		   ct->ctbs.g2h.size - ct->ctbs.g2h.resv_space);
 
 	ct->ctbs.g2h.space += g2h_len;
@@ -778,7 +778,7 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		return 0;
 	}
 
-	XE_WARN_ON(fence != g2h_fence->seqno);
+	WARN_ON(fence != g2h_fence->seqno);
 
 	if (type == GUC_HXG_TYPE_RESPONSE_FAILURE) {
 		g2h_fence->fail = true;
@@ -1009,7 +1009,7 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
 							   adj_len);
 		break;
 	default:
-		XE_WARN_ON("NOT_POSSIBLE");
+		WARN_ON("NOT_POSSIBLE");
 	}
 
 	if (ret)
diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
index 6b72db4d5bb2..5ee500b8c3f1 100644
--- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
@@ -90,7 +90,7 @@ void xe_guc_debugfs_register(struct xe_guc *guc, struct dentry *parent)
 #define DEBUGFS_SIZE	ARRAY_SIZE(debugfs_list) * sizeof(struct drm_info_list)
 	local = drmm_kmalloc(&guc_to_xe(guc)->drm, DEBUGFS_SIZE, GFP_KERNEL);
 	if (!local) {
-		XE_WARN_ON("Couldn't allocate memory");
+		WARN_ON("Couldn't allocate memory");
 		return;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 5a8d827ba770..9160bcd83206 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -392,7 +392,7 @@ static ssize_t freq_act_show(struct device *dev,
 
 	ret = sysfs_emit(buf, "%d\n", decode_freq(freq));
 
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 	return ret;
 }
 static DEVICE_ATTR_RO(freq_act);
@@ -420,7 +420,7 @@ static ssize_t freq_cur_show(struct device *dev,
 	freq = REG_FIELD_GET(REQ_RATIO_MASK, freq);
 	ret = sysfs_emit(buf, "%d\n", decode_freq(freq));
 
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 	return ret;
 }
 static DEVICE_ATTR_RO(freq_cur);
@@ -483,7 +483,7 @@ static ssize_t freq_min_show(struct device *dev,
 	ret = sysfs_emit(buf, "%d\n", pc_get_min_freq(pc));
 
 fw:
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 out:
 	mutex_unlock(&pc->freq_lock);
 	xe_device_mem_access_put(pc_to_xe(pc));
@@ -620,7 +620,7 @@ static ssize_t rc6_residency_show(struct device *dev,
 
 	ret = sysfs_emit(buff, "%u\n", reg);
 
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 	return ret;
 }
 static DEVICE_ATTR_RO(rc6_residency);
@@ -749,7 +749,7 @@ static int pc_gucrc_disable(struct xe_guc_pc *pc)
 	xe_mmio_write32(gt, GEN6_RC_CONTROL.reg, 0);
 	xe_mmio_write32(gt, GEN6_RC_STATE.reg, 0);
 
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 	return 0;
 }
 
@@ -758,7 +758,7 @@ static void pc_init_pcode_freq(struct xe_guc_pc *pc)
 	u32 min = DIV_ROUND_CLOSEST(pc->rpn_freq, GT_FREQUENCY_MULTIPLIER);
 	u32 max = DIV_ROUND_CLOSEST(pc->rp0_freq, GT_FREQUENCY_MULTIPLIER);
 
-	XE_WARN_ON(xe_pcode_init_min_freq_table(pc_to_gt(pc), min, max));
+	WARN_ON(xe_pcode_init_min_freq_table(pc_to_gt(pc), min, max));
 }
 
 static int pc_init_freqs(struct xe_guc_pc *pc)
@@ -801,7 +801,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
 	int ret;
 
-	XE_WARN_ON(!xe_device_guc_submission_enabled(xe));
+	WARN_ON(!xe_device_guc_submission_enabled(xe));
 
 	xe_device_mem_access_get(pc_to_xe(pc));
 
@@ -836,7 +836,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 
 out:
 	xe_device_mem_access_put(pc_to_xe(pc));
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 	return ret;
 }
 
@@ -876,7 +876,7 @@ static void pc_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_guc_pc *pc = arg;
 
-	XE_WARN_ON(xe_guc_pc_stop(pc));
+	WARN_ON(xe_guc_pc_stop(pc));
 	sysfs_remove_files(pc_to_gt(pc)->sysfs, pc_attrs);
 	xe_bo_unpin_map_no_vm(pc->bo);
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index e857013070b9..8df5513796f1 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -715,7 +715,7 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
 	if (!ret) {
 		struct drm_gpu_scheduler *sched = &e->guc->sched;
 
-		XE_WARN_ON("Pending enable failed to respond");
+		WARN_ON("Pending enable failed to respond");
 		sched->timeout = MIN_SCHED_TIMEOUT;
 		drm_sched_run_wq_start(sched);
 		xe_gt_reset_async(e->gt);
@@ -794,8 +794,8 @@ guc_engine_timedout_job(struct drm_sched_job *drm_job)
 	int i = 0;
 
 	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags)) {
-		XE_WARN_ON(e->flags & ENGINE_FLAG_KERNEL);
-		XE_WARN_ON(e->flags & ENGINE_FLAG_VM && !engine_killed(e));
+		WARN_ON(e->flags & ENGINE_FLAG_KERNEL);
+		WARN_ON(e->flags & ENGINE_FLAG_VM && !engine_killed(e));
 
 		drm_warn(&xe->drm, "Timedout job: seqno=%u, guc_id=%d, flags=0x%lx",
 			 xe_sched_job_seqno(job), e->guc->id, e->flags);
@@ -847,7 +847,7 @@ guc_engine_timedout_job(struct drm_sched_job *drm_job)
 					 !engine_pending_disable(e) ||
 					 guc_read_stopped(guc), HZ * 5);
 		if (!ret) {
-			XE_WARN_ON("Schedule disable failed to respond");
+			WARN_ON("Schedule disable failed to respond");
 			sched->timeout = MIN_SCHED_TIMEOUT;
 			list_add(&drm_job->list, &sched->pending_list);
 			drm_sched_run_wq_start(sched);
@@ -1124,7 +1124,7 @@ static int guc_engine_init(struct xe_engine *e)
 		sprintf(e->name, "ccs%d", e->guc->id);
 		break;
 	default:
-		XE_WARN_ON(e->class);
+		WARN_ON(e->class);
 	}
 
 	trace_xe_engine_create(e);
diff --git a/drivers/gpu/drm/xe/xe_huc_debugfs.c b/drivers/gpu/drm/xe/xe_huc_debugfs.c
index ee3d8315036a..b88076242fcf 100644
--- a/drivers/gpu/drm/xe/xe_huc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_huc_debugfs.c
@@ -56,7 +56,7 @@ void xe_huc_debugfs_register(struct xe_huc *huc, struct dentry *parent)
 #define DEBUGFS_SIZE	ARRAY_SIZE(debugfs_list) * sizeof(struct drm_info_list)
 	local = drmm_kmalloc(&huc_to_xe(huc)->drm, DEBUGFS_SIZE, GFP_KERNEL);
 	if (!local) {
-		XE_WARN_ON("Couldn't allocate memory");
+		WARN_ON("Couldn't allocate memory");
 		return;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index ffe1a3992ef5..bbfce9f58cd6 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -88,14 +88,14 @@ void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq)
 	int err;
 	bool tmp;
 
-	if (XE_WARN_ON(!list_empty(&irq->pending))) {
+	if (WARN_ON(!list_empty(&irq->pending))) {
 		tmp = dma_fence_begin_signalling();
 		spin_lock_irqsave(&irq->lock, flags);
 		list_for_each_entry_safe(fence, next, &irq->pending, irq_link) {
 			list_del_init(&fence->irq_link);
 			err = dma_fence_signal_locked(&fence->dma);
 			dma_fence_put(&fence->dma);
-			XE_WARN_ON(err);
+			WARN_ON(err);
 		}
 		spin_unlock_irqrestore(&irq->lock, flags);
 		dma_fence_end_signalling(tmp);
@@ -202,7 +202,7 @@ static const struct dma_fence_ops xe_hw_fence_ops = {
 
 static struct xe_hw_fence *to_xe_hw_fence(struct dma_fence *fence)
 {
-	if (XE_WARN_ON(fence->ops != &xe_hw_fence_ops))
+	if (WARN_ON(fence->ops != &xe_hw_fence_ops))
 		return NULL;
 
 	return container_of(fence, struct xe_hw_fence, dma);
diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
index 0d24c124d202..0a42112eb247 100644
--- a/drivers/gpu/drm/xe/xe_macros.h
+++ b/drivers/gpu/drm/xe/xe_macros.h
@@ -9,7 +9,6 @@
 #include <linux/bug.h>
 
 #define XE_EXTRA_DEBUG 1
-#define XE_WARN_ON WARN_ON
 #define XE_BUG_ON BUG_ON
 
 #define XE_IOCTL_ERR(xe, cond) \
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 11c8af9c6c92..a98e4bad39bf 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -463,7 +463,7 @@ static void emit_pte(struct xe_migrate *m,
 				/* Is this a 64K PTE entry? */
 				if ((m->eng->vm->flags & XE_VM_FLAGS_64K) &&
 				    !(cur_ofs & (16 * 8 - 1))) {
-					XE_WARN_ON(!IS_ALIGNED(addr, SZ_64K));
+					WARN_ON(!IS_ALIGNED(addr, SZ_64K));
 					addr |= GEN12_PTE_PS64;
 				}
 
diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index e09c6242aafc..1f0d9772e6d9 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -437,9 +437,9 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
 	 * is still 0 at this point, we'll assume that it was omitted by
 	 * mistake in the switch statement above.
 	 */
-	XE_WARN_ON(info->unused_entries_index == 0);
+	WARN_ON(info->unused_entries_index == 0);
 
-	if (XE_WARN_ON(info->size > info->n_entries)) {
+	if (WARN_ON(info->size > info->n_entries)) {
 		info->table = NULL;
 		return 0;
 	}
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 6b2943efcdbc..ffb0e6d8f9f7 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -67,7 +67,7 @@ u64 gen8_pde_encode(struct xe_bo *bo, u64 bo_offset,
 	pde = xe_bo_addr(bo, bo_offset, GEN8_PAGE_SIZE, &is_vram);
 	pde |= GEN8_PAGE_PRESENT | GEN8_PAGE_RW;
 
-	XE_WARN_ON(IS_DGFX(xe_bo_device(bo)) && !is_vram);
+	WARN_ON(IS_DGFX(xe_bo_device(bo)) && !is_vram);
 
 	/* FIXME: I don't think the PPAT handling is correct for MTL */
 
@@ -636,7 +636,7 @@ xe_pt_stage_bind_entry(struct drm_pt *parent, pgoff_t offset,
 	if (level == 0 || xe_pt_hugepte_possible(addr, next, level, xe_walk)) {
 		struct xe_res_cursor *curs = xe_walk->curs;
 
-		XE_WARN_ON(xe_walk->va_curs_start != addr);
+		WARN_ON(xe_walk->va_curs_start != addr);
 
 		pte = __gen8_pte_encode(xe_res_dma(curs) + xe_walk->dma_offset,
 					xe_walk->cache, xe_walk->pte_flags,
@@ -650,7 +650,7 @@ xe_pt_stage_bind_entry(struct drm_pt *parent, pgoff_t offset,
 		if (level == 0 && !xe_parent->is_compact) {
 			if (xe_pt_is_pte_ps64K(addr, next, xe_walk))
 				pte |= GEN12_PTE_PS64;
-			else if (XE_WARN_ON(xe_walk->needs_64K))
+			else if (WARN_ON(xe_walk->needs_64K))
 				return -EINVAL;
 		}
 
@@ -1248,7 +1248,7 @@ static int invalidation_fence_init(struct xe_gt *gt,
 		dma_fence_put(&ifence->base.base);	/* Creation ref */
 	}
 
-	XE_WARN_ON(ret && ret != -ENOENT);
+	WARN_ON(ret && ret != -ENOENT);
 
 	return ret && ret != -ENOENT ? ret : 0;
 }
@@ -1677,7 +1677,7 @@ __xe_pt_unbind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
 		list_del_init(&vma->rebind_link);
 
 	if (unbind_pt_update.locked) {
-		XE_WARN_ON(!xe_vma_is_userptr(vma));
+		WARN_ON(!xe_vma_is_userptr(vma));
 
 		if (!vma->gt_present) {
 			spin_lock(&vm->userptr.invalidated_lock);
diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index 9eaf1be27886..c1b240c4dba6 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -183,7 +183,7 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
 		apply_one_mmio(gt, reg, entry);
 
 	err = xe_force_wake_put(&gt->mmio.fw, XE_FORCEWAKE_ALL);
-	XE_WARN_ON(err);
+	WARN_ON(err);
 
 	return;
 
@@ -224,7 +224,7 @@ void xe_reg_sr_apply_whitelist(struct xe_reg_sr *sr, u32 mmio_base,
 				RING_NOPID(mmio_base).reg);
 
 	err = xe_force_wake_put(&gt->mmio.fw, XE_FORCEWAKE_ALL);
-	XE_WARN_ON(err);
+	WARN_ON(err);
 
 	return;
 
diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
index 4e99fae26b4c..b34eb906dbb0 100644
--- a/drivers/gpu/drm/xe/xe_res_cursor.h
+++ b/drivers/gpu/drm/xe/xe_res_cursor.h
@@ -129,7 +129,7 @@ static inline void xe_res_first(struct ttm_resource *res,
 	cur->remaining = size;
 	cur->node = NULL;
 	cur->mem_type = XE_PL_TT;
-	XE_WARN_ON(res && start + size > res->size);
+	WARN_ON(res && start + size > res->size);
 	return;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index cb9dd894547d..bcaa111fd63f 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -77,7 +77,7 @@ static bool rule_matches(struct xe_gt *gt,
 			break;
 
 		default:
-			XE_WARN_ON(r->match_type);
+			WARN_ON(r->match_type);
 		}
 
 		if (!match)
diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 99f1ed87196d..30a582c82689 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -75,7 +75,7 @@ static void user_fence_worker(struct work_struct *w)
 	if (mmget_not_zero(ufence->mm)) {
 		kthread_use_mm(ufence->mm);
 		if (copy_to_user(ufence->addr, &ufence->value, sizeof(ufence->value)))
-			XE_WARN_ON("Copy to user failed");
+			WARN_ON("Copy to user failed");
 		kthread_unuse_mm(ufence->mm);
 		mmput(ufence->mm);
 	}
@@ -246,7 +246,7 @@ bool xe_sync_entry_signal(struct xe_sync_entry *sync, struct xe_sched_job *job,
 		if (err == -ENOENT) {
 			kick_ufence(sync->ufence, fence);
 		} else if (err) {
-			XE_WARN_ON("failed to add user fence");
+			WARN_ON("failed to add user fence");
 			user_fence_put(sync->ufence);
 			dma_fence_put(fence);
 		}
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 70eabf567156..cbc55ccc5918 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -162,7 +162,7 @@ int xe_uc_init_hw(struct xe_uc *uc)
 
 	/* We don't fail the driver load if HuC fails to auth, but let's warn */
 	ret = xe_huc_auth(&uc->huc);
-	XE_WARN_ON(ret);
+	WARN_ON(ret);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_uc_debugfs.c b/drivers/gpu/drm/xe/xe_uc_debugfs.c
index 0a39ec5a6e99..2248fc07ab3d 100644
--- a/drivers/gpu/drm/xe/xe_uc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_uc_debugfs.c
@@ -17,7 +17,7 @@ void xe_uc_debugfs_register(struct xe_uc *uc, struct dentry *parent)
 
 	root = debugfs_create_dir("uc", parent);
 	if (IS_ERR(root)) {
-		XE_WARN_ON("Create UC directory failed");
+		WARN_ON("Create UC directory failed");
 		return;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index e9b30e620fd9..3ebe651b9a1b 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -202,7 +202,7 @@ static void guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
 	struct xe_guc *guc = &gt->uc.guc;
 
 	XE_BUG_ON(uc_fw->type != XE_UC_FW_TYPE_GUC);
-	XE_WARN_ON(uc_fw->major_ver_found < 70);
+	WARN_ON(uc_fw->major_ver_found < 70);
 
 	if (uc_fw->minor_ver_found >= 6) {
 		/* v70.6.0 adds CSS header support */
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index bdf82d34eb66..fb6b563378ea 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -501,7 +501,7 @@ void xe_vm_unlock_dma_resv(struct xe_vm *vm,
 	 * and holding the dma_resv of an object is required for list
 	 * addition, and we shouldn't add ourselves.
 	 */
-	XE_WARN_ON(!list_empty(&vm->notifier.rebind_list));
+	WARN_ON(!list_empty(&vm->notifier.rebind_list));
 
 	ttm_eu_backoff_reservation(ww, objs);
 	if (tv && tv != tv_onstack)
@@ -641,7 +641,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
 
 	free_preempt_fences(&preempt_fences);
 
-	XE_WARN_ON(err < 0);	/* TODO: Kill VM or put in error state */
+	WARN_ON(err < 0);	/* TODO: Kill VM or put in error state */
 	trace_xe_vm_rebind_worker_exit(vm);
 }
 
@@ -703,11 +703,11 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
 	err = dma_resv_wait_timeout(&vm->resv,
 				    DMA_RESV_USAGE_BOOKKEEP,
 				    false, MAX_SCHEDULE_TIMEOUT);
-	XE_WARN_ON(err <= 0);
+	WARN_ON(err <= 0);
 
 	if (xe_vm_in_fault_mode(vm)) {
 		err = xe_vm_invalidate_vma(vma);
-		XE_WARN_ON(err);
+		WARN_ON(err);
 	}
 
 	trace_xe_vma_userptr_invalidate_complete(vma);
@@ -797,7 +797,7 @@ struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 
 	xe_vm_assert_held(vm);
 	list_for_each_entry_safe(vma, next, &vm->rebind_list, rebind_link) {
-		XE_WARN_ON(!vma->gt_present);
+		WARN_ON(!vma->gt_present);
 
 		list_del_init(&vma->rebind_link);
 		dma_fence_put(fence);
@@ -948,7 +948,7 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
 	XE_BUG_ON(!list_empty(&vma->unbind_link));
 
 	if (xe_vma_is_userptr(vma)) {
-		XE_WARN_ON(!vma->destroyed);
+		WARN_ON(!vma->destroyed);
 		spin_lock(&vm->userptr.invalidated_lock);
 		list_del_init(&vma->userptr.invalidate_link);
 		spin_unlock(&vm->userptr.invalidated_lock);
@@ -969,7 +969,7 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
 						 vma_destroy_cb);
 
 		if (ret) {
-			XE_WARN_ON(ret != -ENOENT);
+			WARN_ON(ret != -ENOENT);
 			xe_vma_destroy_late(vma);
 		}
 	} else {
@@ -995,7 +995,7 @@ static void xe_vma_destroy_unlocked(struct xe_vma *vma)
 		list_add(&tv[1].head, &objs);
 	}
 	err = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
-	XE_WARN_ON(err);
+	WARN_ON(err);
 
 	xe_vma_destroy(vma, NULL);
 
@@ -1271,7 +1271,7 @@ static void vm_error_capture(struct xe_vm *vm, int err,
 	}
 
 	if (copy_to_user(address, &capture, sizeof(capture)))
-		XE_WARN_ON("Copy to user failed");
+		WARN_ON("Copy to user failed");
 
 	if (in_kthread) {
 		kthread_unuse_mm(vm->async_ops.error_capture.mm);
@@ -1366,7 +1366,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	if (vm->async_ops.error_capture.addr)
 		wake_up_all(&vm->async_ops.error_capture.wq);
 
-	XE_WARN_ON(!list_empty(&vm->extobj.list));
+	WARN_ON(!list_empty(&vm->extobj.list));
 	up_write(&vm->lock);
 
 	mutex_lock(&xe->usm.lock);
@@ -1390,7 +1390,7 @@ static void vm_destroy_work_func(struct work_struct *w)
 	void *lookup;
 
 	/* xe_vm_close_and_put was not called? */
-	XE_WARN_ON(vm->size);
+	WARN_ON(vm->size);
 
 	if (!(vm->flags & XE_VM_FLAG_MIGRATION)) {
 		xe_device_mem_access_put(xe);
@@ -1399,7 +1399,7 @@ static void vm_destroy_work_func(struct work_struct *w)
 		if (xe->info.has_asid) {
 			mutex_lock(&xe->usm.lock);
 			lookup = xa_erase(&xe->usm.asid_to_vm, vm->usm.asid);
-			XE_WARN_ON(lookup != vm);
+			WARN_ON(lookup != vm);
 			mutex_unlock(&xe->usm.lock);
 		}
 	}
@@ -1660,7 +1660,7 @@ static void add_async_op_fence_cb(struct xe_vm *vm,
 		dma_fence_put(afence->wait_fence);
 		dma_fence_put(&afence->fence);
 	}
-	XE_WARN_ON(ret && ret != -ENOENT);
+	WARN_ON(ret && ret != -ENOENT);
 }
 
 int xe_vm_async_fence_wait_start(struct dma_fence *fence)
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 29815852985a..267f16dd969c 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -192,7 +192,7 @@ static int madvise_priority(struct xe_device *xe, struct xe_vm *vm,
 static int madvise_pin(struct xe_device *xe, struct xe_vm *vm,
 		       struct xe_vma **vmas, int num_vmas, u64 value)
 {
-	XE_WARN_ON("NIY");
+	WARN_ON("NIY");
 	return 0;
 }
 
-- 
2.39.2

