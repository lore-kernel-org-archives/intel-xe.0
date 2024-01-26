Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788BAC47422
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 20:32:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 429AC10FE64;
	Fri, 26 Jan 2024 20:32:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A55410FE64
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 20:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706301153; x=1737837153;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=WVlRcahDSt/6U9MDB2ou85p0yyZmFc8R4eAyi29Do4U=;
 b=inkOzcq6p7azu8zg/2QXK3pG/S1EgQxMJQh8qrOEeCHFyNR7OS6UIqfF
 wSDA2dgJze4JSu3HOn3Mn7Ed+hOHrkk7bUp/QTJnLyp6K06oTMbKHyKu/
 bVh1/xXkS9C6QNglcLV9qejMxMxiPqyStF4PGS7HilWmJhyeYUJqljFdD
 6Ch5UpqCCq2oMwVeRJbrkevtiTzZAckPLF3ZaKADdYoGkzfp++c4caWLZ
 ugJUYXVyLx9kCXOPH0ylFIhRyeXax0MNh3GeVm7KrqXQpGDY2rfM3i3xr
 e3LYkhtCs1imZZsx2WizIMQBuQI8hwUqS0GZVuc3Ulbl2nFrtCSJfvc5j A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="1494770"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1494770"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 12:32:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="821245454"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="821245454"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 12:32:32 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:32:32 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 12:32:32 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 12:32:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WfkzAZN3xLt63eEzTU0AaJQ+XdsOUdJSohGVHh1CDslUNkZoHqZ40DwzFEHYUfkQBGn9TptPC9KH3vrlCsqAsup1Z/lxp6TEkEFDHkNlm6RSJsuTByqheCJi9WVY8ceA/7HJP8INpd0+IRJXpetoCifIXuc28wiJOdPUFXkukvO/0k3BTxS0bhW4Qtb4rOWxcRpeFrGCc4WEfvVXwBUVBe198FdawEmxUZhrHQhH24VSEo9xDoCdEAdHbHC6PSIgyIqBwlOTRu/SSNLsTUE0yF4aeRRE3sD3+szOWpquZhHuKGoMp3KfFXW9fNbrWdDW+H0EiIWHbnHuK/8cCk98Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGW2SkPWvho8ISgw/B9XVeuxXNnW4aTmWZ5qCS3kuzw=;
 b=P3gFQbxr+VaUOtBc+uqlKFs0loq1TNbFVr7woywcLnOiJP0ZCTYN7ZSsvJkn09GnUcpn/hpkywlCrcvHsfyfFeQVBHvCd3jet2XsQ07K3HbP25OP5T2MRpRaNCpgDjZeCOou8iEF2GErP5aeRy813xKeBO3JfT3NQHQfO0WQbLMGRQRyXdy+RohAKNhQaLn7Uf72kZkDD2NGwTajgw6F136d7nSs1C01D64XDKnVHLn8nswI/JGHdzQIQIcYNCUDYTqvbjup3uCzCeTK9JlybpcKQJs2m5RMnzI+A+sS8pTpaGX8nGsF3uTV28yOt6b6C7g2IHylEsS33ywNiQ/uvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5769.namprd11.prod.outlook.com (2603:10b6:a03:420::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26; Fri, 26 Jan
 2024 20:32:29 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 20:32:28 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 32/34] drm/xe: Kill xe_device_mem_access_{get*,put}
Date: Fri, 26 Jan 2024 15:30:41 -0500
Message-ID: <20240126203044.1104705-33-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0035.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::48) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: 3627d745-4cbd-4774-d509-08dc1eadea36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ED6vpuB8TEXiJuFVtKfCZI99GaPcaVwkXFM/Y6b9+jkAKNqH+cGDlDy/NgcSDx7WD8S3c2yVfI3gh0fcbSN2RWFeK/3fefi0X4Ul2AJj9AJfdbFrz4jRb54EFmpGk1/sVd210RNZkJnYfBpOB0o//VX0VRK+zeXmqI1nIlN71krpHkHHRJIVDm7wAVyKC2R//eCkvZcbMNSsO/D+LswC3jUvrWFL7m0GW65QT3mDiqq9P65hzK/7bIYZOPWjcD4ryCeSzBi5GVDc9wrKKl+DCqG6d1ZKYKz9PqtCjBVpSejtDsbIsXeBu1JmhxVK9RbIKjmtAMOJJOaMxNuJnTbISQ7MluK3YW+Rl8Ri1dAz1YdW8mfdJiykrrPy9DNJw5cnrTU6Q+se0jcYaoUjsA0JmQA085kcFOVCd/uPSHZ4S087OvK/zTv5swBIyPOGhM7xddo8PUgwbHQpEqRhC6/FiKN8vv3Yegjm/6YO+Vz+0ZsP5rDBSCC/LHiE3r6ev7b/ro958HheC1G+Jm4c0KaOAVwuhxWaMQJ0j9cl0pW0HAXHeWBMEAhR6jv2C6ceuwvy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(366004)(376002)(396003)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(83380400001)(41300700001)(66556008)(6512007)(2616005)(107886003)(26005)(38100700002)(8936002)(6506007)(1076003)(5660300002)(4326008)(8676002)(66946007)(44832011)(66476007)(2906002)(6486002)(478600001)(6666004)(316002)(6916009)(36756003)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uWshzSFDXBTLo2aLzgjeXRqBjFL2BDWuHKELUct3o5a6ug+EiPlWdFlzx4+S?=
 =?us-ascii?Q?liWCAeENGtGS7tQrZ686YmzUWrAU22RNKLMYlALNQSWyOIBVgxpSIzm+dUdI?=
 =?us-ascii?Q?hZFdWHZcNd5Us71N5wtibsx0oVf3RqsXCHv94fCmkatljoeQSLaMbljvQakg?=
 =?us-ascii?Q?CK2HGB/k9gwietsq0b2EL+WFD2syWd/dCkMWutgHxXD6kv7TGJ37ne/gBbm3?=
 =?us-ascii?Q?hJhR9pIfsgoN+aBJ6tuKIxof6Y0XVv0dBGJlbFtdAEoBaBBl2ptoQ+7R30ki?=
 =?us-ascii?Q?iNMh/p4yZ522KcAvmr6bbsd2tJfPicGQT6CiSatvy1vbeBvjZ3bX4QKVTrKY?=
 =?us-ascii?Q?Wi8qDs/v204mCdVTGdphU7UbBUTThJ8Fk/iOCyM4Dqf8+eTj95k59kI672z9?=
 =?us-ascii?Q?oWtCpOVUZiZqLZtkUYpnwl29fKTY/NplgJ4GoJU+6P6019X2wgxGU70ugdRR?=
 =?us-ascii?Q?Piz9lOtUo7lber1wqT3p39Etlq8snkBg9oO3Ve9EzTsKF2P7quYbAzMSXzDU?=
 =?us-ascii?Q?JOeFxC+4ivJaf62GUqpJMIPAHt5zcbUEKIHlC1NLMxaY7cb007nZCAsbn31Q?=
 =?us-ascii?Q?9Co+0B8fpaCm/PNBL3L7VbWmOuHkTGAK6b49ctTWIY+rVk8SEPItSIJ94PRA?=
 =?us-ascii?Q?dfaEbVjzjHZZGmk8yj515wnHBOP6MIxBGg1AwF7p8JXvHgUuo1X1qhgiXulZ?=
 =?us-ascii?Q?OagdGJ5krTpx5e4UmipMfFl2uOG7odrXa/eNiUiN5FXpSpX3Dozrmj7EoNk1?=
 =?us-ascii?Q?DQRzolR2UoGVFyfU6JjuBIPz6W+GHyXdPijbAU+O1aBEqUhcebLCn88K1TaH?=
 =?us-ascii?Q?c/JKVE9DNqhGxYKr7JzzIg7i1lqYfdwgEj4ehm49Uw8BxdrPKH6o1yq1Eqp9?=
 =?us-ascii?Q?7hyCpRDlp5/Ne2FdEm+lkBj0sfk66GJrRPJGQRVHjmO98cW6MXdlWjW3Z5ah?=
 =?us-ascii?Q?mIDlMpiPb4Gy9ML1n2y3tUYk1lG2pFbDcdZrVcHC7IFiTqMWuJc3GrTWKm3I?=
 =?us-ascii?Q?QEQO5pq1SJoDt8bJlyIYpt9ErhwCEeQDpqk9DWjY1BHjTRT/j7WVgUDjmc6p?=
 =?us-ascii?Q?ZS0x3wzx3PuYSWSRH5yuAOKFIcwh8PXfcllCDBbjS7NTIJ57CTOaJyv1w95k?=
 =?us-ascii?Q?SL5sA7veOmVxXW3L8BXcr59ZiSbwHeO9qtAIyDGfLQTGPe5UBA2YG8Uney3H?=
 =?us-ascii?Q?tnaFxWZL5G/xJKR2hmd653wFBYpS2RRnxexEl38CZRtTH4GTKUkCiK4NzJWa?=
 =?us-ascii?Q?Hopy9jQea/YARGgfVDkNARURWF6BjrYEie2LK+ty7S5StTom+4tVyyGuE6iR?=
 =?us-ascii?Q?N80JI9gBQ4ohWVM0/3nj/24MJdUQwAGgi/k0ZpN0eplmIar++V9t4MqkYvQi?=
 =?us-ascii?Q?fmGit6/LPu1k/4oGLaDBmbFHua7V8tXiJFXMkox/yPMXmvoxws17hXZWMa/F?=
 =?us-ascii?Q?7cnTSaW0B5O30ZuE+7mpWEkzbzeQaRE+vWX8U6RIiLZmIP27m5mtYDgMz8Yq?=
 =?us-ascii?Q?hIKuzT9ihtCS3QJYhC8ts0tx5a6TZsD0UyEGUSDheCEHLH0lkysi8Uqrp4rO?=
 =?us-ascii?Q?IjB/Xw/tak6AjN+zN+IdZ7d5gQSJ634uAw9zAXm4EKWoz4WsutkpqR/Kf0Nb?=
 =?us-ascii?Q?YA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3627d745-4cbd-4774-d509-08dc1eadea36
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 20:32:28.9139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1bOsgqcYVY8Fmppjik6TF6Y2kefOh50bGs+k7Be76I8jfS9q91MKRocWS2Be9VZ3hoVAvpCTnnn+pRRYA7MBxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5769
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

No extra callers, so let's simply kill them for good.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       | 53 ----------------------------
 drivers/gpu/drm/xe/xe_device.h       |  4 ---
 drivers/gpu/drm/xe/xe_device_types.h |  3 --
 3 files changed, 60 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 0b27e09b3db9..c76e12ec673a 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -683,59 +683,6 @@ void xe_device_assert_mem_access(struct xe_device *xe)
 	XE_WARN_ON(xe_pm_runtime_suspended(xe));
 }
 
-bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe)
-{
-	bool active;
-
-	if (xe_pm_read_callback_task(xe) == current)
-		return true;
-
-	active = xe_pm_runtime_get_if_active(xe);
-	if (active) {
-		int ref = atomic_inc_return(&xe->mem_access.ref);
-
-		xe_assert(xe, ref != S32_MAX);
-	}
-
-	return active;
-}
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
-
 void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p)
 {
 	struct xe_gt *gt;
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 050d4b6cdc65..2761ee741e7b 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -137,10 +137,6 @@ static inline struct xe_force_wake *gt_to_fw(struct xe_gt *gt)
 	return &gt->mmio.fw;
 }
 
-void xe_device_mem_access_get(struct xe_device *xe);
-bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe);
-void xe_device_mem_access_put(struct xe_device *xe);
-
 void xe_device_assert_mem_access(struct xe_device *xe);
 
 static inline bool xe_device_in_fault_mode(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 6914cab9191d..78817778234b 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -385,9 +385,6 @@ struct xe_device {
 	 * triggering additional actions when they occur.
 	 */
 	struct {
-		/** @mem_access.ref: ref count of memory accesses */
-		atomic_t ref;
-
 		/**
 		 * @mem_access.vram_userfault: Encapsulate vram_userfault
 		 * related stuff
-- 
2.43.0

