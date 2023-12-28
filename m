Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1594C46CD2
	for <intel-xe@archiver.kernel.org>; Thu, 28 Dec 2023 02:13:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 644AA10E25D;
	Thu, 28 Dec 2023 02:13:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B198F10E252
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Dec 2023 02:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703729627; x=1735265627;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=dKta+9Q3kyQcIGdZe+u5a6qBQfl02/bYezLU/qLjGjs=;
 b=g8v99MIgDBdXySzOeErrjtWkfOsG3VwBZKSU7is8Sxk/mvu33sPhWh4a
 Fqg4v7j87PQkVUoJWIitrdcupMfANQMKDgXpCuClf3wRmE7ZLrjzsZAM3
 SOp3kQV8G5F2XYUDyEQ1Uo5WM4HUvGw+dcjwmFu5EaF23e8iXPOVYihXv
 9pMik98lNq/Zb3bVF8VUCbmHhqUM2I2NoehYTellRM4gLLllfDM4kH93m
 Wxudwrjg6Rej5e+KulGgRIbXw+VzfoPrUKU7B+9NkYYL/qe58di6bRCeW
 a0v6aMebGv60TTu8niaKrHnFk2cRyVBLIf4PwMRwtyCs4fb716xzYBIIA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="10062215"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="10062215"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 18:13:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="869014378"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="869014378"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Dec 2023 18:13:47 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 18:13:47 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Dec 2023 18:13:47 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Dec 2023 18:13:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mImgWh3wZ9hYqleewCHc7WD+zZC6o+rsB4yD1D9gsUWhHBrkOpF/qr63gppRV45w846dtz+GHH4k80zroWqEx906m5NNTrj/AJvb0HCO3n0RxYqQ+MytdRDOvQaQL3kYhgcvbf+6/De1OlY1zY3hMzDOXWJNuQtYkCsNmqDp7xoDP/5NyvI8VxnhNO3dsZn2j8lymm7r8naUIgDol++tEDF2n/ISLpnPGTa7LNIvaWt1DXFT/nabmRVsHvEqhu8cQvoVvtIgllXphf4H69pNlSzuvX0i1sYb11KLJoEtzvfKkl2qmEkaeIZf+CJ4C31k7SkFmw+4nq1y0EGzG6I/Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KaMfqho8RCpRWCgpmS/XlsAO7oCCEKLEx0GUVfvhrpg=;
 b=XLURj66+iOVjZIbtg36wXKS7d+//8C0RSsJ6ORbsUVlK9yAE5a3hdzV5pDd5L1uRAlvMWNaHG462f01o97t9BXg5TYHYuDMXSO2T85ZeWUBuIVOR/D9Ctpyze65FTj7Jb0A6bSOFmOzDuxKhRjG41OYXQXOCL7iv51T+KZhfkucZtbHIx14N2KcDgSuos9CXTi1HwTvFfWASUe9b61FZOzWDFho/rZzgJUFoTuUqc4N7wx1GfCfImxd6tOQthznKIHDNw0c7+d+dWZh2YzBRPsw1l/tcXlisfr3pbm4jz9ten7+Rl1xZZLandf8jC3Q2w1Vy6rYwhou9DzSFVfDEBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB7146.namprd11.prod.outlook.com (2603:10b6:510:1ed::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Thu, 28 Dec
 2023 02:13:43 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7113.027; Thu, 28 Dec 2023
 02:13:43 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 20/20] drm/xe: Mega Kill of mem_access
Date: Wed, 27 Dec 2023 21:12:32 -0500
Message-ID: <20231228021232.2366249-21-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
References: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR13CA0034.namprd13.prod.outlook.com
 (2603:10b6:a03:180::47) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: d833c038-87ca-4b54-2b8c-08dc074a9d8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3uPfMk+LBJTCo55LpP5lG/36iNpaKmA2rHc8oQWsxy+ihia3IhowD0x0o0LTGfpv4ljAz5ejQkTnotLfi2FFgddfu5AqtXJGVCtDQepjiDGqOIQOmcV84fZ+/5yAoZK/Y9SFWrSglWqRWBodc8n8U1H0+mHev6/OfzkejC5cIjQSY4fNItKORWW2GbD4KVfzDjwWl3YJXo+B6YQtm5uD2sqUMMAtUcvZjAL6pCJM3DvQxJTHsdiYN+qJhZd8TY+EhsagL8LWFMXwuwy7bg9YYBOsZ4cj5WAW5jJyCI8bMR5f92kP1W17c6uoOsFMmERGwM15h0ZRgwvV9mTfyxxquU4ICeHLkYE04DIeILpkAqlhh8Kf/cmjnPU6uzvJMiNd0xvQVSDKyC72h5aJ3zp9Kn5tfG00EA5t/nkAzQjROi6u/yJPnotg/YVe2Wl7f/631GWZOFXGEVSvIW9BsH/FWxO4lRjLaq80aSGPoTPb2DrOuTa8D6NW94O7Qi0Gmprhq/tNKu/ThJIrOpMFryNnuPOCQsKM8KXo/w1nwcXVpb/7bQh9B4u4Nd/luOXMPGba
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(30864003)(82960400001)(2906002)(38100700002)(36756003)(86362001)(41300700001)(66556008)(66476007)(316002)(6916009)(83380400001)(66946007)(6506007)(478600001)(6486002)(26005)(2616005)(107886003)(1076003)(6666004)(8676002)(44832011)(8936002)(6512007)(4326008)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dzzlAx99Llbj7B3Ke6RhhUEdcBJoPM/9GvjNASeYzDo+lFfZ3vwkARyO5ngX?=
 =?us-ascii?Q?c6l4fJRj1Sr3W0JSwgx3QGF0zlJQXE4jb1g7BNAQJFG1HF5m9fWyE0oOQbnG?=
 =?us-ascii?Q?JxQSuwKzUkpoYLmzOFyD5vmG+lkWRHos7PEx6tz+IWlS3uubcj1wrnAaqu6r?=
 =?us-ascii?Q?yCoRklGSnVdBb/rirEx/wtSYjfSoD4UQdnLSGIoIaumekYc+jBI9RPRpQ5G7?=
 =?us-ascii?Q?py/TyHKOdXlVRMO7FNV1cEKyZG+GjhgJHn61oqMDjZ17xawmpPH4iYXYdylE?=
 =?us-ascii?Q?xyADsT8UfisnhrCNCiuiUw+uLtViBgxNGDZ+6bBoJ5sFDx+LCnTkoFuPqeT1?=
 =?us-ascii?Q?pfIypl0VnQrKISO8svJr1H2+X/T9lINt+BWj/sRYgp6YfL0HZr/53tP8Xlk7?=
 =?us-ascii?Q?WY6ygH0E2GoH41h4AjmEBk3F3J7Q5xKa3ctrTSm4r6zROLeKSCCSmK9/e5hS?=
 =?us-ascii?Q?YkJc2gdkV7xm88mqkxqa9Ut9rHSwUHl9rRnXDyXfMU2ppet6pmF6RtxWP1IV?=
 =?us-ascii?Q?mq5CgE0pAwdFZpAlhsQ/2bI4GI06ZQQkRigtZnGpPA0EhsDgAKGkVSYRKWYJ?=
 =?us-ascii?Q?/MAmMvGWtg3EtIoX+Enxzdbhxu5D4y9RbT9+cDx5I/FSNcje0qG0FUMQu2dT?=
 =?us-ascii?Q?jiqDv5DZ9w+BV2HJ1iueRLaP6DdeOa95GDBNPbsk5Oep7xNKqY2I7Amuo7+S?=
 =?us-ascii?Q?oz4RCFbAVQsZkk4umO4MuqIOa6pGui1SaaFP2AbsQaCzsMqk1XGVheVrgxol?=
 =?us-ascii?Q?cD+sjvcwEWXDJAFQ3sL3opHz0fC33YZLlIx6Q9/YMLU7ti5VnWQsJ5YAYUHw?=
 =?us-ascii?Q?wcpwRua/TiEAxX1DCsx63lRUFgPVeWYBP4YU8dVw8nWriLUF9WB/ctRKcxEj?=
 =?us-ascii?Q?LJbCc4S6qHq08gtQhrKmt/ARCQ3S5LTHh5YYeKbN2Eu9nMa2kicqnUgcC/IC?=
 =?us-ascii?Q?6ADE3dpCShgWrMnqwVk3qgx44oomKttZqwn/5+p/rWq68F13PT+uy7Pv+q5U?=
 =?us-ascii?Q?om6t98iVNW6rL5OWwzPfx9s3DqHg3zljvLMRVJENiWolxrwGuHuDMtb3Sq3O?=
 =?us-ascii?Q?ykdTPpBTnBX3a16LCY6HWmh4wgwfmPhO5omxLska4SqDlRFovDei/zcWoxgn?=
 =?us-ascii?Q?P37e7JrPbXTK9jsweXKrgHONvnKw4cuc0b/caMQjXBr4F8wMYf9OSvp6gqQP?=
 =?us-ascii?Q?7ixzkmPpis6ruti1VCO/vRcliaSRo0nCm7Fo25dbaxUuRR/0bys8SnZcOCtE?=
 =?us-ascii?Q?5A4gocn1mSNZH2zth12hhCmYMMsKefyyDhYV1NJA2qk3af9Md7dq11SrQlFC?=
 =?us-ascii?Q?xFaz0y4PTdwin+quT03WCYdD/ZqhQ0XY96y31MyZrZ46gX681lcOS0k2QeJT?=
 =?us-ascii?Q?c0yhP6rGjGTdY/LjP/OPqNZPwLT7n3t50BniGDcVkPZBpH1m1LNdrBZt9liO?=
 =?us-ascii?Q?z0Z/aRlefHzfpfnoXtlEOYYhfU5n4tLx0QQmQD7gnc0IMFWyaUJ8OTCDiiVF?=
 =?us-ascii?Q?NadzdA164ER2+nz/N+5srKMWhfyzyrrrkVRLj5CUYPuCwD142Hnwqb1IcHaI?=
 =?us-ascii?Q?A+jN4ZlS20rCyFcCrRR9e8DcVrDxVsfZb4MNcLwcSebb6bMr6twmmhVOrkK3?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d833c038-87ca-4b54-2b8c-08dc074a9d8c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2023 02:13:43.5285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Z/qGuBIuYxjqmagsnYEZZ+KhtarKWZlPfEfAZCYxQzExbnBRk17xR4mgJvZQ/6rtZ/4bm+yg8WY/2Coq1EnDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7146
X-OriginatorOrg: intel.com
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

All of these remaining cases should already be protected
by the outer bound calls of runtime_pm

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c |  7 +--
 drivers/gpu/drm/xe/tests/xe_bo.c       |  8 ----
 drivers/gpu/drm/xe/tests/xe_mocs.c     |  4 --
 drivers/gpu/drm/xe/xe_bo.c             |  5 ---
 drivers/gpu/drm/xe/xe_device.c         | 59 --------------------------
 drivers/gpu/drm/xe/xe_device.h         |  7 ---
 drivers/gpu/drm/xe/xe_device_types.h   |  9 ----
 drivers/gpu/drm/xe/xe_ggtt.c           |  6 ---
 drivers/gpu/drm/xe/xe_gsc.c            |  3 --
 drivers/gpu/drm/xe/xe_gt.c             | 17 --------
 drivers/gpu/drm/xe/xe_huc_debugfs.c    |  2 -
 drivers/gpu/drm/xe/xe_pat.c            | 10 -----
 drivers/gpu/drm/xe/xe_pm.c             | 27 ------------
 drivers/gpu/drm/xe/xe_query.c          |  4 --
 drivers/gpu/drm/xe/xe_tile.c           | 10 ++---
 drivers/gpu/drm/xe/xe_vm.c             |  7 ---
 16 files changed, 5 insertions(+), 180 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 722c84a566073..077294ec50ece 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -190,10 +190,9 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
 	/* TODO: Consider sharing framebuffer mapping?
 	 * embed i915_vma inside intel_framebuffer
 	 */
-	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
 	ret = mutex_lock_interruptible(&ggtt->lock);
 	if (ret)
-		goto out;
+		return ret;
 
 	align = XE_PAGE_SIZE;
 	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
@@ -241,8 +240,6 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
 	xe_ggtt_invalidate(ggtt);
 out_unlock:
 	mutex_unlock(&ggtt->lock);
-out:
-	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
 	return ret;
 }
 
@@ -381,4 +378,4 @@ struct i915_address_space *intel_dpt_create(struct intel_framebuffer *fb)
 void intel_dpt_destroy(struct i915_address_space *vm)
 {
 	return;
-}
\ No newline at end of file
+}
diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 412b2e7ce40cb..97b10e597f0ad 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -164,8 +164,6 @@ static int ccs_test_run_device(struct xe_device *xe)
 		return 0;
 	}
 
-	xe_device_mem_access_get(xe);
-
 	for_each_tile(tile, xe, id) {
 		/* For igfx run only for primary tile */
 		if (!IS_DGFX(xe) && id > 0)
@@ -173,8 +171,6 @@ static int ccs_test_run_device(struct xe_device *xe)
 		ccs_test_run_tile(xe, tile, test);
 	}
 
-	xe_device_mem_access_put(xe);
-
 	return 0;
 }
 
@@ -336,13 +332,9 @@ static int evict_test_run_device(struct xe_device *xe)
 		return 0;
 	}
 
-	xe_device_mem_access_get(xe);
-
 	for_each_tile(tile, xe, id)
 		evict_test_run_tile(xe, tile, test);
 
-	xe_device_mem_access_put(xe);
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
index 7dd34f94e8094..a12e7e2bb5861 100644
--- a/drivers/gpu/drm/xe/tests/xe_mocs.c
+++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
@@ -45,7 +45,6 @@ static void read_l3cc_table(struct xe_gt *gt,
 
 	struct kunit *test = xe_cur_kunit();
 
-	xe_device_mem_access_get(gt_to_xe(gt));
 	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	KUNIT_ASSERT_EQ_MSG(test, ret, 0, "Forcewake Failed.\n");
 	mocs_dbg(&gt_to_xe(gt)->drm, "L3CC entries:%d\n", info->n_entries);
@@ -65,7 +64,6 @@ static void read_l3cc_table(struct xe_gt *gt,
 				   XELP_LNCFCMOCS(i).addr);
 	}
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
-	xe_device_mem_access_put(gt_to_xe(gt));
 }
 
 static void read_mocs_table(struct xe_gt *gt,
@@ -80,7 +78,6 @@ static void read_mocs_table(struct xe_gt *gt,
 
 	struct kunit *test = xe_cur_kunit();
 
-	xe_device_mem_access_get(gt_to_xe(gt));
 	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	KUNIT_ASSERT_EQ_MSG(test, ret, 0, "Forcewake Failed.\n");
 	mocs_dbg(&gt_to_xe(gt)->drm, "Global MOCS entries:%d\n", info->n_entries);
@@ -100,7 +97,6 @@ static void read_mocs_table(struct xe_gt *gt,
 				   XELP_GLOBAL_MOCS(i).addr);
 	}
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
-	xe_device_mem_access_put(gt_to_xe(gt));
 }
 
 static int mocs_kernel_test_run_device(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 8e4a3b1f6b938..056c65c2675d8 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -715,7 +715,6 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	xe_assert(xe, migrate);
 
 	trace_xe_bo_move(bo);
-	xe_device_mem_access_get(xe);
 
 	if (xe_bo_is_pinned(bo) && !xe_bo_is_user(bo)) {
 		/*
@@ -739,7 +738,6 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 
 				if (XE_WARN_ON(new_mem->start == XE_BO_INVALID_OFFSET)) {
 					ret = -EINVAL;
-					xe_device_mem_access_put(xe);
 					goto out;
 				}
 
@@ -757,7 +755,6 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 						new_mem, handle_system_ccs);
 		if (IS_ERR(fence)) {
 			ret = PTR_ERR(fence);
-			xe_device_mem_access_put(xe);
 			goto out;
 		}
 		if (!move_lacks_source) {
@@ -782,8 +779,6 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		dma_fence_put(fence);
 	}
 
-	xe_device_mem_access_put(xe);
-
 out:
 	return ret;
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index c1c19264a58b4..cb08a4369bb9e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -44,12 +44,6 @@
 #include "xe_wait_user_fence.h"
 #include "xe_hwmon.h"
 
-#ifdef CONFIG_LOCKDEP
-struct lockdep_map xe_device_mem_access_lockdep_map = {
-	.name = "xe_device_mem_access_lockdep_map"
-};
-#endif
-
 static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 {
 	struct xe_device *xe = to_xe_device(dev);
@@ -666,56 +660,3 @@ void xe_device_assert_mem_access(struct xe_device *xe)
 {
 	XE_WARN_ON(xe_pm_runtime_suspended(xe));
 }
-
-void xe_device_mem_access_get(struct xe_device *xe)
-{
-	int ref;
-
-	/*
-	 * This looks racy, but should be fine since the pm_callback_task only
-	 * transitions from NULL -> current (and back to NULL again), during the
-	 * runtime_resume() or runtime_suspend() callbacks, for which there can
-	 * only be a single one running for our device. We only need to prevent
-	 * recursively calling the runtime_get or runtime_put from those
-	 * callbacks, as well as preventing triggering any access_ongoing
-	 * asserts.
-	 */
-	if (xe_pm_read_callback_task(xe) == current)
-		return;
-
-	/*
-	 * Since the resume here is synchronous it can be quite easy to deadlock
-	 * if we are not careful. Also in practice it might be quite timing
-	 * sensitive to ever see the 0 -> 1 transition with the callers locks
-	 * held, so deadlocks might exist but are hard for lockdep to ever see.
-	 * With this in mind, help lockdep learn about the potentially scary
-	 * stuff that can happen inside the runtime_resume callback by acquiring
-	 * a dummy lock (it doesn't protect anything and gets compiled out on
-	 * non-debug builds).  Lockdep then only needs to see the
-	 * mem_access_lockdep_map -> runtime_resume callback once, and then can
-	 * hopefully validate all the (callers_locks) -> mem_access_lockdep_map.
-	 * For example if the (callers_locks) are ever grabbed in the
-	 * runtime_resume callback, lockdep should give us a nice splat.
-	 */
-	lock_map_acquire(&xe_device_mem_access_lockdep_map);
-	lock_map_release(&xe_device_mem_access_lockdep_map);
-
-	xe_pm_runtime_get(xe);
-	ref = atomic_inc_return(&xe->mem_access.ref);
-
-	xe_assert(xe, ref != S32_MAX);
-
-}
-
-void xe_device_mem_access_put(struct xe_device *xe)
-{
-	int ref;
-
-	if (xe_pm_read_callback_task(xe) == current)
-		return;
-
-	ref = atomic_dec_return(&xe->mem_access.ref);
-	xe_pm_runtime_put(xe);
-
-	xe_assert(xe, ref >= 0);
-}
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index d5ab7c62d5f62..fb4d6ed4a3d2a 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -16,10 +16,6 @@ struct xe_file;
 #include "xe_force_wake.h"
 #include "xe_macros.h"
 
-#ifdef CONFIG_LOCKDEP
-extern struct lockdep_map xe_device_mem_access_lockdep_map;
-#endif
-
 static inline struct xe_device *to_xe_device(const struct drm_device *dev)
 {
 	return container_of(dev, struct xe_device, drm);
@@ -141,9 +137,6 @@ static inline struct xe_force_wake *gt_to_fw(struct xe_gt *gt)
 	return &gt->mmio.fw;
 }
 
-void xe_device_mem_access_get(struct xe_device *xe);
-void xe_device_mem_access_put(struct xe_device *xe);
-
 void xe_device_assert_mem_access(struct xe_device *xe);
 
 static inline bool xe_device_in_fault_mode(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 71f23ac365e66..8f0185c773d0b 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -378,15 +378,6 @@ struct xe_device {
 	/** @tiles: device tiles */
 	struct xe_tile tiles[XE_MAX_TILES_PER_DEVICE];
 
-	/**
-	 * @mem_access: keep track of memory access in the device, possibly
-	 * triggering additional actions when they occur.
-	 */
-	struct {
-		/** @ref: ref count of memory accesses */
-		atomic_t ref;
-	} mem_access;
-
 	/**
 	 * @pat: Encapsulate PAT related stuff
 	 */
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index c639dbf3bdd27..96df4b553c18b 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -198,14 +198,12 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
 	u64 start, end;
 
 	/* Display may have allocated inside ggtt, so be careful with clearing here */
-	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
 	mutex_lock(&ggtt->lock);
 	drm_mm_for_each_hole(hole, &ggtt->mm, start, end)
 		xe_ggtt_clear(ggtt, start, end - start);
 
 	xe_ggtt_invalidate(ggtt);
 	mutex_unlock(&ggtt->lock);
-	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
 }
 
 int xe_ggtt_init(struct xe_ggtt *ggtt)
@@ -366,14 +364,12 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	if (err)
 		return err;
 
-	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
 	mutex_lock(&ggtt->lock);
 	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node, bo->size,
 					  alignment, 0, start, end, 0);
 	if (!err)
 		xe_ggtt_map_bo(ggtt, bo);
 	mutex_unlock(&ggtt->lock);
-	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
 
 	return err;
 }
@@ -391,7 +387,6 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 
 void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node)
 {
-	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
 	mutex_lock(&ggtt->lock);
 
 	xe_ggtt_clear(ggtt, node->start, node->size);
@@ -401,7 +396,6 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node)
 	xe_ggtt_invalidate(ggtt);
 
 	mutex_unlock(&ggtt->lock);
-	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
 }
 
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index a8a895cf4b448..cbd3f5b2f6a78 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -251,10 +251,8 @@ static void gsc_work(struct work_struct *work)
 {
 	struct xe_gsc *gsc = container_of(work, typeof(*gsc), work);
 	struct xe_gt *gt = gsc_to_gt(gsc);
-	struct xe_device *xe = gt_to_xe(gt);
 	int ret;
 
-	xe_device_mem_access_get(xe);
 	xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
 
 	ret = gsc_upload(gsc);
@@ -271,7 +269,6 @@ static void gsc_work(struct work_struct *work)
 
 out:
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
-	xe_device_mem_access_put(xe);
 }
 
 int xe_gsc_init(struct xe_gsc *gsc)
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 3af2adec12956..00aa8a52e9076 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -336,7 +336,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 {
 	int err, i;
 
-	xe_device_mem_access_get(gt_to_xe(gt));
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		goto err_hw_fence_irq;
@@ -388,7 +387,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 	XE_WARN_ON(err);
-	xe_device_mem_access_put(gt_to_xe(gt));
 
 	return 0;
 
@@ -398,7 +396,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 err_hw_fence_irq:
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
 		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
-	xe_device_mem_access_put(gt_to_xe(gt));
 
 	return err;
 }
@@ -407,7 +404,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
 {
 	int err, i;
 
-	xe_device_mem_access_get(gt_to_xe(gt));
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (err)
 		goto err_hw_fence_irq;
@@ -470,7 +466,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
 
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	XE_WARN_ON(err);
-	xe_device_mem_access_put(gt_to_xe(gt));
 
 	return 0;
 
@@ -479,7 +474,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
 err_hw_fence_irq:
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
 		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
-	xe_device_mem_access_put(gt_to_xe(gt));
 
 	return err;
 }
@@ -606,7 +600,6 @@ static int gt_reset(struct xe_gt *gt)
 
 	xe_gt_sanitize(gt);
 
-	xe_device_mem_access_get(gt_to_xe(gt));
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (err)
 		goto err_msg;
@@ -630,7 +623,6 @@ static int gt_reset(struct xe_gt *gt)
 		goto err_out;
 
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	xe_device_mem_access_put(gt_to_xe(gt));
 	XE_WARN_ON(err);
 
 	xe_gt_info(gt, "reset done\n");
@@ -641,7 +633,6 @@ static int gt_reset(struct xe_gt *gt)
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 err_msg:
 	XE_WARN_ON(xe_uc_start(&gt->uc));
-	xe_device_mem_access_put(gt_to_xe(gt));
 err_fail:
 	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
 
@@ -671,13 +662,11 @@ void xe_gt_reset_async(struct xe_gt *gt)
 
 void xe_gt_suspend_prepare(struct xe_gt *gt)
 {
-	xe_device_mem_access_get(gt_to_xe(gt));
 	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 
 	xe_uc_stop_prepare(&gt->uc);
 
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
-	xe_device_mem_access_put(gt_to_xe(gt));
 }
 
 int xe_gt_suspend(struct xe_gt *gt)
@@ -686,7 +675,6 @@ int xe_gt_suspend(struct xe_gt *gt)
 
 	xe_gt_sanitize(gt);
 
-	xe_device_mem_access_get(gt_to_xe(gt));
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (err)
 		goto err_msg;
@@ -696,7 +684,6 @@ int xe_gt_suspend(struct xe_gt *gt)
 		goto err_force_wake;
 
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
-	xe_device_mem_access_put(gt_to_xe(gt));
 	xe_gt_info(gt, "suspended\n");
 
 	return 0;
@@ -704,7 +691,6 @@ int xe_gt_suspend(struct xe_gt *gt)
 err_force_wake:
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 err_msg:
-	xe_device_mem_access_put(gt_to_xe(gt));
 	xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
 
 	return err;
@@ -714,7 +700,6 @@ int xe_gt_resume(struct xe_gt *gt)
 {
 	int err;
 
-	xe_device_mem_access_get(gt_to_xe(gt));
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (err)
 		goto err_msg;
@@ -724,7 +709,6 @@ int xe_gt_resume(struct xe_gt *gt)
 		goto err_force_wake;
 
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
-	xe_device_mem_access_put(gt_to_xe(gt));
 	xe_gt_info(gt, "resumed\n");
 
 	return 0;
@@ -732,7 +716,6 @@ int xe_gt_resume(struct xe_gt *gt)
 err_force_wake:
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 err_msg:
-	xe_device_mem_access_put(gt_to_xe(gt));
 	xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(err));
 
 	return err;
diff --git a/drivers/gpu/drm/xe/xe_huc_debugfs.c b/drivers/gpu/drm/xe/xe_huc_debugfs.c
index 4d9f2bb0eee2e..3a888a40188b9 100644
--- a/drivers/gpu/drm/xe/xe_huc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_huc_debugfs.c
@@ -38,9 +38,7 @@ static int huc_info(struct seq_file *m, void *data)
 	struct drm_printer p = drm_seq_file_printer(m);
 
 	xe_pm_runtime_get(xe);
-	xe_device_mem_access_get(xe);
 	xe_huc_print_info(huc, &p);
-	xe_device_mem_access_put(xe);
 	xe_pm_runtime_put(xe);
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 1ff6bc79e7d44..b253ef863c274 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -173,7 +173,6 @@ static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
 	struct xe_device *xe = gt_to_xe(gt);
 	int i, err;
 
-	xe_device_mem_access_get(xe);
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		goto err_fw;
@@ -191,7 +190,6 @@ static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 err_fw:
 	xe_assert(xe, !err);
-	xe_device_mem_access_put(xe);
 }
 
 static const struct xe_pat_ops xelp_pat_ops = {
@@ -204,7 +202,6 @@ static void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
 	struct xe_device *xe = gt_to_xe(gt);
 	int i, err;
 
-	xe_device_mem_access_get(xe);
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		goto err_fw;
@@ -224,7 +221,6 @@ static void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 err_fw:
 	xe_assert(xe, !err);
-	xe_device_mem_access_put(xe);
 }
 
 static const struct xe_pat_ops xehp_pat_ops = {
@@ -237,7 +233,6 @@ static void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
 	struct xe_device *xe = gt_to_xe(gt);
 	int i, err;
 
-	xe_device_mem_access_get(xe);
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		goto err_fw;
@@ -255,7 +250,6 @@ static void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 err_fw:
 	xe_assert(xe, !err);
-	xe_device_mem_access_put(xe);
 }
 
 static const struct xe_pat_ops xehpc_pat_ops = {
@@ -268,7 +262,6 @@ static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
 	struct xe_device *xe = gt_to_xe(gt);
 	int i, err;
 
-	xe_device_mem_access_get(xe);
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		goto err_fw;
@@ -291,7 +284,6 @@ static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 err_fw:
 	xe_assert(xe, !err);
-	xe_device_mem_access_put(xe);
 }
 
 /*
@@ -324,7 +316,6 @@ static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 	int i, err;
 	u32 pat;
 
-	xe_device_mem_access_get(xe);
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		goto err_fw;
@@ -369,7 +360,6 @@ static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 err_fw:
 	xe_assert(xe, !err);
-	xe_device_mem_access_put(xe);
 }
 
 static const struct xe_pat_ops xe2_pat_ops = {
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 16ead90f3cab5..4cfe1f5d2085b 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -277,29 +277,6 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	/* Disable access_ongoing asserts and prevent recursive pm calls */
 	xe_pm_write_callback_task(xe, current);
 
-	/*
-	 * The actual xe_device_mem_access_put() is always async underneath, so
-	 * exactly where that is called should makes no difference to us. However
-	 * we still need to be very careful with the locks that this callback
-	 * acquires and the locks that are acquired and held by any callers of
-	 * xe_device_mem_access_get(). We already have the matching annotation
-	 * on that side, but we also need it here. For example lockdep should be
-	 * able to tell us if the following scenario is in theory possible:
-	 *
-	 * CPU0                          | CPU1 (kworker)
-	 * lock(A)                       |
-	 *                               | xe_pm_runtime_suspend()
-	 *                               |      lock(A)
-	 * xe_device_mem_access_get()    |
-	 *
-	 * This will clearly deadlock since rpm core needs to wait for
-	 * xe_pm_runtime_suspend() to complete, but here we are holding lock(A)
-	 * on CPU0 which prevents CPU1 making forward progress.  With the
-	 * annotation here and in xe_device_mem_access_get() lockdep will see
-	 * the potential lock inversion and give us a nice splat.
-	 */
-	lock_map_acquire(&xe_device_mem_access_lockdep_map);
-
 	if (xe->d3cold.allowed) {
 		err = xe_bo_evict_all(xe);
 		if (err)
@@ -319,7 +296,6 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	if (xe->d3cold.allowed)
 		xe_display_pm_suspend_late(xe);
 out:
-	lock_map_release(&xe_device_mem_access_lockdep_map);
 	xe_pm_write_callback_task(xe, NULL);
 	return err;
 }
@@ -339,8 +315,6 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	/* Disable access_ongoing asserts and prevent recursive pm calls */
 	xe_pm_write_callback_task(xe, current);
 
-	lock_map_acquire(&xe_device_mem_access_lockdep_map);
-
 	/*
 	 * It can be possible that xe has allowed d3cold but other pcie devices
 	 * in gfx card soc would have blocked d3cold, therefore card has not
@@ -379,7 +353,6 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 			goto out;
 	}
 out:
-	lock_map_release(&xe_device_mem_access_lockdep_map);
 	xe_pm_write_callback_task(xe, NULL);
 	return err;
 }
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 9b35673b286c8..86222c80a874b 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -147,7 +147,6 @@ query_engine_cycles(struct xe_device *xe,
 	if (!hwe)
 		return -EINVAL;
 
-	xe_device_mem_access_get(xe);
 	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 
 	__read_timestamps(gt,
@@ -159,7 +158,6 @@ query_engine_cycles(struct xe_device *xe,
 			  cpu_clock);
 
 	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	xe_device_mem_access_put(xe);
 	resp.width = 36;
 
 	/* Only write to the output fields of user query */
@@ -437,9 +435,7 @@ static int query_hwconfig(struct xe_device *xe,
 	if (!hwconfig)
 		return -ENOMEM;
 
-	xe_device_mem_access_get(xe);
 	xe_guc_hwconfig_copy(&gt->uc.guc, hwconfig);
-	xe_device_mem_access_put(xe);
 
 	if (copy_to_user(query_ptr, hwconfig, size)) {
 		kfree(hwconfig);
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 044c20881de7e..74ecb5f39438f 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -160,23 +160,19 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
 {
 	int err;
 
-	xe_device_mem_access_get(tile_to_xe(tile));
-
 	err = tile_ttm_mgr_init(tile);
 	if (err)
-		goto err_mem_access;
+		return err;
 
 	tile->mem.kernel_bb_pool = xe_sa_bo_manager_init(tile, SZ_1M, 16);
 	if (IS_ERR(tile->mem.kernel_bb_pool))
-		err = PTR_ERR(tile->mem.kernel_bb_pool);
+		return PTR_ERR(tile->mem.kernel_bb_pool);
 
 	xe_wa_apply_tile_workarounds(tile);
 
 	xe_tile_sysfs_init(tile);
 
-err_mem_access:
-	xe_device_mem_access_put(tile_to_xe(tile));
-	return err;
+	return 0;
 }
 
 void xe_tile_migrate_wait(struct xe_tile *tile)
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 1ca917b8315c2..92223e6ca687c 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1279,9 +1279,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 
 	vm->pt_ops = &xelp_pt_ops;
 
-	if (!(flags & XE_VM_FLAG_MIGRATION))
-		xe_device_mem_access_get(xe);
-
 	vm_resv_obj = drm_gpuvm_resv_object_alloc(&xe->drm);
 	if (!vm_resv_obj) {
 		err = -ENOMEM;
@@ -1389,8 +1386,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	for_each_tile(tile, xe, id)
 		xe_range_fence_tree_fini(&vm->rftree[id]);
 	kfree(vm);
-	if (!(flags & XE_VM_FLAG_MIGRATION))
-		xe_device_mem_access_put(xe);
 	return ERR_PTR(err);
 }
 
@@ -1511,8 +1506,6 @@ static void vm_destroy_work_func(struct work_struct *w)
 	xe_assert(xe, !vm->size);
 
 	if (!(vm->flags & XE_VM_FLAG_MIGRATION)) {
-		xe_device_mem_access_put(xe);
-
 		if (xe->info.has_asid && vm->usm.asid) {
 			mutex_lock(&xe->usm.lock);
 			lookup = xa_erase(&xe->usm.asid_to_vm, vm->usm.asid);
-- 
2.43.0

