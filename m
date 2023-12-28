Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BB5C46CD2
	for <intel-xe@archiver.kernel.org>; Thu, 28 Dec 2023 02:13:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B858110E25A;
	Thu, 28 Dec 2023 02:13:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6714710E25A
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Dec 2023 02:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703729613; x=1735265613;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=H99iDHBp0nsltPnUCHH388fnsjApyxAqTKDk0tAbHL4=;
 b=LORzu4nUwNj4EoUhtfXtwz/l9ZjGAr7wkrmtW84bcOqPR/aG0KejxpoM
 bDfnp572AM3x0dk/PUF2xbzDkQFnpW71YFQq7p4rUQr9dW7DjXKobkVJE
 6kXF0Ro31e/7GRqvaLGQs8DpqicWFGVlY+dATdnF6skM5D2f+un0mfU18
 pwunl7ZRV8uZZlbnHzSKakzk2thIiMWx2igN62/XNy7BqOLSq3J8Gh2Wv
 RaTdApG6M6rrfYymMhkk44BrppPpc0pDL7UVv2sKDYef/P9ku3ddm22IH
 Le+kQ8wHxClrWJBUSzE+KY/knvrAnXD8Us4Tc3I3Y7JUWJBqLbLtlBWhr w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="10062207"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="10062207"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 18:13:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="869014365"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="869014365"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Dec 2023 18:13:33 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 18:13:32 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 18:13:32 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Dec 2023 18:13:32 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Dec 2023 18:13:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IakHUxNnWnmia9YUXMGu06QqRGR0xLFYlUqa4TqrJ9J5JTVq6p/+WkBHtz0R4jCstm3j+44r7iQNkD0my5Ir82ArOWPWxZWsOKXqAWLz06764RirqaCDZ/iNnQYV+Dc7OdRqF6UXxcbML1xBJwHChr0S2SoFirOxdx5qS0QfXMROA2jsWlm1C98i8xoIXcJDzE2N7xgfzEcbCYjJOg9R1l1bN/op5IWku/Cz/6UBFX0wIFgXhcsQLK4sI898MZymGXNXzKi7vyOx9/aw/y/VGVz1Fk2D488jW4PwOm7A3d6U8AuPDN/cF/1fvbCveH0gzDfy6WY9Ge+WhD80Lo0cfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NOwEfUAf0E3xbjQ9dv+r8yLfJ+hRz0aW14A6U6wautk=;
 b=JSNnHoIcC7OVScMOy2tyIreGyr80EN6gmtPsXtm3EkqJke/2Xkir5KeZkbig6ja1parlpPNGUHW2ig9tSZg/pB2wW7N2+X9h0e+tKR1CciCEhUkxXd4WdSIa3Fcw4lhJJbPqU7bPvbKJASdb4NjORyPV2Rx/OEW0ebHOsWlrDGwpCjVFiXUQV+ej40XhUJCrKjCWTHZ3FmGJP80xyExGX0Q3E3y2xTPMvHLeYKduGTmNFX1YhOGATKdYZk7+Y+5Ot2OnM7fw5B0P4O6feJxFCwAG3nLf/3ZTj6xqNRtBFPrd8nhV+UqFU3lK/Za9c9Nh3jv8D4zcTxhe4r1wxQedHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB7146.namprd11.prod.outlook.com (2603:10b6:510:1ed::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Thu, 28 Dec
 2023 02:13:30 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7113.027; Thu, 28 Dec 2023
 02:13:30 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 16/20] drm/xe: Remove mem_access calls from migration
Date: Wed, 27 Dec 2023 21:12:28 -0500
Message-ID: <20231228021232.2366249-17-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
References: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0100.namprd03.prod.outlook.com
 (2603:10b6:a03:333::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: 89076391-0af2-4d22-7a02-08dc074a95ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3IlMx5iJhVXksGHUhLvn2tebb6n36Ms5jEMlYyX/Sycbj1s6SN0U5awZYwdKxrmR88F58HMODy0pppJP3pQQaFn8ZKlBHqG2Qr6+8BffGegEmlJLb1nTGpY/6d+rR/GIO1DfhKzCBuXaQjA3s2w/3NRuq4su3vFNDIgSFSg7fDA1YkoHgd4Fg3hF77K+PecfvnJs3OlkVnum0NTpQefIc2SIU5kHqbComDBJRDJxqbfO181mJ/KGvqfhRi0NEJuBVDDS6dKD+UoAAM6egmyCcr/8VKtC/f/PZHj5sznc5ElOjUSO9XD7fanKIOnQBn02oKrJhX0SrJpOZHbSu4v+nz2Ll2l1qr8hFR607B5oJN7CVTzmsCseKMr9C9vOsFn0Dm7pkL2HlgPpWf0IKktPqK7yH/KuF946gzeCDbQkfTrL/WvBTz4TVaHker38RkG2eTFfFgFBTodisCvXavSxK80odhcBdjWqkSjPv3r62KCms9jXPtMOhhdOdyj18vv5bplINu1JvZqnpj69x6sHsZNnioxlgDUlzC5khMx1rwExC/5PHh2ggjQvuNWWytCP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(66899024)(82960400001)(2906002)(38100700002)(36756003)(86362001)(41300700001)(66556008)(66476007)(316002)(6916009)(83380400001)(66946007)(6506007)(478600001)(6486002)(26005)(2616005)(107886003)(1076003)(8676002)(44832011)(8936002)(6512007)(4326008)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w5YhUNLJniOlbJDedVxM/p0/xUlEQO7e7gf0c0FG9u6tLuUPdX3LIzADfnS6?=
 =?us-ascii?Q?4eQo0oOe9wa7ezu7eIMKQR/zqsMKUa1imu9LVxgVR0eWF9n0GZ4XI5OKgq80?=
 =?us-ascii?Q?OzcWGWowLeGB7vAr013ukma1HxXo/xLuO74BkQkDW1O0sC4NM3sLXvqfJj6t?=
 =?us-ascii?Q?5bdCX69kj8CQEyJ78RKnkjIwqZo2gK7XLXB5IW9kMU9ivrrXqFDRuer280M+?=
 =?us-ascii?Q?4uslWcUUyMIRfuDLNy4fOmDUFeOwafLmHUykjOeDLzKKnC5Is2zHVrdBq17G?=
 =?us-ascii?Q?LdZ7ucjAzOBqYU6usCHA9gvAyNqPqd6N3pokjaIOvENM3Y1v91r0GzgfJokA?=
 =?us-ascii?Q?2gTPTEZyP7p0uAce3IIYfcZOIfuVdNTi91Lsgi3itklSmLf6Pjjb3a6EupZI?=
 =?us-ascii?Q?gMGOi2e6qLMPAjV/eM+cGsprw2C3lLuMZYZQxUV31t4MmpdtfYmvVbZtIjJe?=
 =?us-ascii?Q?POH07zFqjUYKmFqQGk4if7N8V9xAQIvcCNJI4QMILX3sw141HwhJ0Ms3LJMi?=
 =?us-ascii?Q?c76k4rx8K3fhz5C9yPXYT2ZtqUF3Wzkiye3iNVrS4sJjCUeNnGGxPIuQi/u9?=
 =?us-ascii?Q?mLqm9eY2I8bhPp7QvelEDEIrFRkG27vg1AtqqQUZwv5v5bkK8PniwAw43Wx/?=
 =?us-ascii?Q?fCLwlC63XcvJnyNghQ4nH10F9vyDBXtI1uuHi2oY0hGRFlHLmRTguYiucGjK?=
 =?us-ascii?Q?q+t2pGEcqf/RFVtuoPxvklm1cewISiCOTA8B+3Mw2w11HbhrtV3xbCM1D6zP?=
 =?us-ascii?Q?6UIK1+qmePVUYjw1q6ov9CaFFELQekTt0kzMXRwJsstsyZso0iZYLvSED0Co?=
 =?us-ascii?Q?0/Vl99RCmnomIw4tgkjqlzao0XA0cU4Y63tmquNxIv6qLmAly/z8BrwKRZSJ?=
 =?us-ascii?Q?bbPYmUed3OoBiL42J5BDRH/QBNrAn1WKYwv+iAX/zHMFiPF7DlQ+uFvErb25?=
 =?us-ascii?Q?TFekcvtfjoNQCI9IuXkLrbr/r50l9BnDbUQ/b4+mVzGBFxFb/LVCsVphY4ux?=
 =?us-ascii?Q?Kd21C4G89PJKcW/hlfKigzFQ8Bp0nxxV3x6kuGjpEqJYBn5n6mZ+sIa2ABCh?=
 =?us-ascii?Q?/GL6ndATnCNkMNe21n8ie7cyBAFojfp/eBZamnSjcN2sve0+CkdplL2UReO0?=
 =?us-ascii?Q?tzSQ3VXtHHs9gl5ZMnoL/i10NVYWPb+NU+B5ERcb9oK5/zANH0JUOdKz5juW?=
 =?us-ascii?Q?fOKH+BjZkLRHsuHJiWpiw2CiXgwaqVK2cw8IS4u1h320W2eslyJIbLOssfPT?=
 =?us-ascii?Q?sVfXErSeCe1JPkY5Oeci+wJvxzcEVHEHn+NE//9Pz1D/Tc3e6ZmVQpjm0YSp?=
 =?us-ascii?Q?uzWlFvI88utDSRcFgHAjQPUxG2UfWyxloo/joUyTr/GT7XbNf5NWx79Qn9Og?=
 =?us-ascii?Q?BqxZmlwoGJxqgpW2kkWOO/tb9p5aGUDrv/balCpZxiwO8gZRGo/kjcUR4Bvh?=
 =?us-ascii?Q?9fLaX6USe9SMTJ2W8qIipg6fsoHseFavVnqHaxBbDqJPz8Y4fzvoKM/37trZ?=
 =?us-ascii?Q?/TqDPAG3Kiym1rm+UtQ9PMvkMa/V6pOg1Qt9FNsmV4zOxipGkTIUz+dN7LTC?=
 =?us-ascii?Q?H2EjA8X4IqAzuWunsVogH+7GU0mO0988GDcnCuatxXWHtz3d1MKTgQeriSnT?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89076391-0af2-4d22-7a02-08dc074a95ad
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2023 02:13:30.2482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cPmY/VNkLwDObmVnUTkrcs2UyFLIfR5gDNeJ0xUw6QSKnbfQ+SEcKJBSq7QC1DG17UNLX/cR/A6nyeLbK6KyBg==
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

The sched jobs runtime pm calls already protects every execution,
including these migration ones.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c |  2 --
 drivers/gpu/drm/xe/xe_device.c        | 17 -----------------
 drivers/gpu/drm/xe/xe_device.h        |  1 -
 drivers/gpu/drm/xe/xe_exec_queue.c    | 18 ------------------
 4 files changed, 38 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 7a32faa2f6888..2257f0a28435b 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -428,9 +428,7 @@ static int migrate_test_run_device(struct xe_device *xe)
 
 		kunit_info(test, "Testing tile id %d.\n", id);
 		xe_vm_lock(m->q->vm, true);
-		xe_device_mem_access_get(xe);
 		xe_migrate_sanity_test(m, test);
-		xe_device_mem_access_put(xe);
 		xe_vm_unlock(m->q->vm);
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index ee9b6612eec43..a7bec49da49fa 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -675,23 +675,6 @@ void xe_device_assert_mem_access(struct xe_device *xe)
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
 void xe_device_mem_access_get(struct xe_device *xe)
 {
 	int ref;
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index af8ac2e9e2709..4acf4c2973390 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -142,7 +142,6 @@ static inline struct xe_force_wake *gt_to_fw(struct xe_gt *gt)
 }
 
 void xe_device_mem_access_get(struct xe_device *xe);
-bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe);
 void xe_device_mem_access_put(struct xe_device *xe);
 
 void xe_device_assert_mem_access(struct xe_device *xe);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 44fe8097b7cda..d3a8d2d8caaaf 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -87,17 +87,6 @@ static struct xe_exec_queue *__xe_exec_queue_create(struct xe_device *xe,
 	if (err)
 		goto err_lrc;
 
-	/*
-	 * Normally the user vm holds an rpm ref to keep the device
-	 * awake, and the context holds a ref for the vm, however for
-	 * some engines we use the kernels migrate vm underneath which offers no
-	 * such rpm ref, or we lack a vm. Make sure we keep a ref here, so we
-	 * can perform GuC CT actions when needed. Caller is expected to have
-	 * already grabbed the rpm ref outside any sensitive locks.
-	 */
-	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !vm))
-		drm_WARN_ON(&xe->drm, !xe_device_mem_access_get_if_ongoing(xe));
-
 	return q;
 
 err_lrc:
@@ -172,8 +161,6 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
 
 	for (i = 0; i < q->width; ++i)
 		xe_lrc_finish(q->lrc + i);
-	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
-		xe_device_mem_access_put(gt_to_xe(q->gt));
 	if (q->vm)
 		xe_vm_put(q->vm);
 
@@ -643,9 +630,6 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 			if (XE_IOCTL_DBG(xe, !hwe))
 				return -EINVAL;
 
-			/* The migration vm doesn't hold rpm ref */
-			xe_device_mem_access_get(xe);
-
 			migrate_vm = xe_migrate_get_vm(gt_to_tile(gt)->migrate);
 			new = xe_exec_queue_create(xe, migrate_vm, logical_mask,
 						   args->width, hwe,
@@ -655,8 +639,6 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 						    EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD :
 						    0));
 
-			xe_device_mem_access_put(xe); /* now held by engine */
-
 			xe_vm_put(migrate_vm);
 			if (IS_ERR(new)) {
 				err = PTR_ERR(new);
-- 
2.43.0

