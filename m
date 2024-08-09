Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C444C531DC
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 16:52:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC7710E999;
	Fri,  9 Aug 2024 16:52:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PpV3pWk0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF5710E999
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 16:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723222346; x=1754758346;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XxWM9RhlF9r8J6EsiBspkUemyWqrVXze8oTddxkTbks=;
 b=PpV3pWk0+h3CgXfRntSgjuUFDxJqF5KwwK081Mi0uUVAgI+d26VhDIwH
 /QdRngSl0SGvWmRCi+oWt3g/Ko7ncFDVmbg0a43q/K91WH9vBckQQRPxn
 gFtiiuKIe0H++52/CgcGoMFBFp9u3to8qE6404ticVOA3fF9hqt/3B14m
 +tYPAJ1Am4SX/LHwsbr/yX2LizrxaPJ3RJDQ6igrmgT0ux/TvcDIPCHpg
 rr6Lf32c1U4LBllUbZ4qgI0SBhJVj2wF9hoGkKPutYW214k9IcGwhx5CZ
 Brjrh2MDympl5G1FfL9bn7YMaWAPHheKkwhSQJ+Ia1xIgeWt/nqAM48gs Q==;
X-CSE-ConnectionGUID: sSbKqGehQmuRhFh/RwZrFw==
X-CSE-MsgGUID: 6ZjEzA3WSAWK9mwl+Np1MA==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21379418"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="21379418"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 09:52:25 -0700
X-CSE-ConnectionGUID: uSvlQEynTeCxAwpOfQadgA==
X-CSE-MsgGUID: Re1NE2ljRAKY65cKJYcdfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="57569311"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.1.253])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 09:52:24 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 05/12] drm/xe/tests: Allow deferred function call during KUnit
 test
Date: Fri,  9 Aug 2024 18:51:52 +0200
Message-Id: <20240809165159.662-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240809165159.662-1-michal.wajdeczko@intel.com>
References: <20240809165159.662-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

For some advanced test cases we might want to simulate external
activity that will stimulate function under test. Add set of
helper functions to implement such requirement. Usage example:

  static void foo(struct xe_device *xe)
  {
      WRITE_ONCE(xe->foo, 1);
  }

  static void foo_test(struct kunit *test)
  {
      struct xe_device *xe = test->priv;

      xe_kunit_helper_delayed_call(test, HZ / 2, foo, xe);

      KUNIT_EXPECT_EQ(test, 0, READ_ONCE(xe->foo));
      schedule_timeout_uninterruptible(HZ);
      KUNIT_EXPECT_EQ(test, 1, READ_ONCE(xe->foo));
  }

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c | 148 ++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.h |  38 +++++
 2 files changed, 186 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
index bc5156966ce9..8fe1a0918b32 100644
--- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
+++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
@@ -127,3 +127,151 @@ int xe_kunit_helper_xe_device_live_test_init(struct kunit *test)
 	return 0;
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_xe_device_live_test_init);
+
+struct xe_kunit_call {
+	struct delayed_work work;
+	struct kunit *test;
+	struct {
+		int (*int_gt)(struct xe_gt *gt);
+		int (*int_gt_uint)(struct xe_gt *gt, unsigned int n);
+		void (*void_gt)(struct xe_gt *gt);
+		void (*void_gt_uint)(struct xe_gt *gt, unsigned int n);
+		void (*void_xe)(struct xe_device *xe);
+	} func;
+	struct {
+		struct xe_device *xe;
+		struct xe_gt *gt;
+		unsigned int n;
+	} args;
+};
+
+static void call_work_func(struct work_struct *work)
+{
+	struct xe_kunit_call *call = container_of(work, typeof(*call), work.work);
+
+	if (call->func.void_xe) {
+		kunit_info(call->test, "calling %ps(xe)\n", call->func.void_xe);
+		call->func.void_xe(call->args.xe);
+		kunit_info(call->test, "%ps(xe) completed\n", call->func.void_xe);
+	} else if (call->func.void_gt) {
+		kunit_info(call->test, "%ps(gt)\n", call->func.void_gt);
+		call->func.void_gt(call->args.gt);
+		kunit_info(call->test, "%ps(gt) completed\n", call->func.void_gt);
+	} else if (call->func.int_gt_uint) {
+		int ret;
+
+		kunit_info(call->test, "calling %ps(gt,%u)\n",
+			   call->func.int_gt_uint, call->args.n);
+		ret = call->func.int_gt_uint(call->args.gt, call->args.n);
+		if (ret < 0) {
+			kunit_info(call->test, "%ps(gt,%u) reported error %pe\n",
+				   call->func.int_gt_uint, call->args.n, ERR_PTR(ret));
+		} else {
+			kunit_info(call->test, "%ps(gt,%u) returned %d\n",
+				   call->func.int_gt_uint, call->args.n, ret);
+		}
+	}
+}
+
+static struct xe_kunit_call *prepare_call(struct kunit *test)
+{
+	struct xe_kunit_call *call;
+
+	call = kunit_kzalloc(test, sizeof(*call), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, call);
+
+	INIT_DELAYED_WORK(&call->work, call_work_func);
+	call->test = test;
+
+	return call;
+}
+
+KUNIT_DEFINE_ACTION_WRAPPER(cancel_call, cancel_delayed_work_sync, struct delayed_work *);
+
+static void queue_call(struct kunit *test, struct xe_kunit_call *call, unsigned long delay)
+{
+	queue_delayed_work(system_wq, &call->work, delay);
+	KUNIT_ASSERT_EQ(test, 0, kunit_add_action_or_reset(test, cancel_call, &call->work));
+}
+
+/**
+ * xe_kunit_helper_delayed_call_void_xe_device - Queue a function call during KUnit test
+ * @test: the &kunit test case
+ * @delay: number of jiffies to wait before queueing
+ * @func: the &xe_device function to call
+ * @xe: the &xe_device argument
+ *
+ * This function uses KUNIT_ASSERT to detect any failures.
+ */
+void xe_kunit_helper_delayed_call_void_xe_device(struct kunit *test,
+						 unsigned long delay,
+						 void (*func)(struct xe_device *xe),
+						 struct xe_device *xe)
+{
+	struct xe_kunit_call *call = prepare_call(test);
+
+	KUNIT_ASSERT_NOT_NULL(test, func);
+	KUNIT_ASSERT_NOT_NULL(test, xe);
+
+	call->func.void_xe = func;
+	call->args.xe = xe;
+
+	return queue_call(test, call, delay);
+}
+EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_delayed_call_void_xe_device);
+
+/**
+ * xe_kunit_helper_delayed_call_void_xe_gt - Queue a function call during KUnit test
+ * @test: the &kunit test case
+ * @delay: number of jiffies to wait before queueing
+ * @func: the &xe_gt function to call
+ * @gt: the &xe_gt function argument
+ *
+ * This function uses KUNIT_ASSERT to detect any failures.
+ */
+void xe_kunit_helper_delayed_call_void_xe_gt(struct kunit *test,
+					     unsigned long delay,
+					     void (*func)(struct xe_gt *gt),
+					     struct xe_gt *gt)
+{
+	struct xe_kunit_call *call = prepare_call(test);
+
+	KUNIT_ASSERT_NOT_NULL(test, func);
+	KUNIT_ASSERT_NOT_NULL(test, gt);
+
+	call->func.void_gt = func;
+	call->args.gt = gt;
+
+	return queue_call(test, call, delay);
+}
+EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_delayed_call_void_xe_gt);
+
+/**
+ * xe_kunit_helper_delayed_call_int_xe_gt_uint - Queue a function call during KUnit test
+ * @test: the &kunit test case
+ * @delay: number of jiffies to wait before queueing
+ * @func: the &xe_gt function to call
+ * @gt: the &xe_gt function argument
+ * @n: the function argument
+ *
+ * This function uses KUNIT_ASSERT to detect any failures.
+ */
+void xe_kunit_helper_delayed_call_int_xe_gt_uint(struct kunit *test,
+						 unsigned long delay,
+						 int (*func)(struct xe_gt *gt,
+							     unsigned int vfid),
+						 struct xe_gt *gt,
+						 unsigned int n)
+{
+	struct xe_kunit_call *call = prepare_call(test);
+
+	KUNIT_ASSERT_NOT_NULL(test, func);
+	KUNIT_ASSERT_NOT_NULL(test, gt);
+
+	call->func.int_gt_uint = func;
+	call->args.gt = gt;
+	call->args.n = n;
+
+	return queue_call(test, call, delay);
+}
+EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_delayed_call_int_xe_gt_uint);
diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
index 83665f7b1254..ec5287947ee4 100644
--- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
+++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
@@ -9,6 +9,7 @@
 struct device;
 struct kunit;
 struct xe_device;
+struct xe_gt;
 
 struct xe_device *xe_kunit_helper_alloc_xe_device(struct kunit *test,
 						  struct device *dev);
@@ -16,4 +17,41 @@ int xe_kunit_helper_xe_device_test_init(struct kunit *test);
 
 int xe_kunit_helper_xe_device_live_test_init(struct kunit *test);
 
+void xe_kunit_helper_delayed_call_void_xe_device(struct kunit *test,
+						 unsigned long delay,
+						 void (*func)(struct xe_device *xe),
+						 struct xe_device *xe);
+
+void xe_kunit_helper_delayed_call_void_xe_gt(struct kunit *test,
+					     unsigned long delay,
+					     void (*func)(struct xe_gt *gt),
+					     struct xe_gt *gt);
+
+void xe_kunit_helper_delayed_call_int_xe_gt_uint(struct kunit *test,
+						 unsigned long delay,
+						 int (*func)(struct xe_gt *gt,
+							     unsigned int vfid),
+						 struct xe_gt *gt,
+						 unsigned int n);
+
+/**
+ * xe_kunit_helper_delayed_call - Queue a function call during KUnit test
+ * @test: the &kunit test case
+ * @delay: number of jiffies to wait before queueing
+ * @func: the &xe_device or &xe_gt function to call
+ * @args: the &xe_device or &xe_gt and other function arguments
+ *
+ * This is a helper macro that compiles into dedicated function call based on
+ * the provided argument types.
+ */
+#define xe_kunit_helper_delayed_call(test, delay, func, args...)	\
+	_Generic(func,							\
+		 void (*)(struct xe_device *) :				\
+			xe_kunit_helper_delayed_call_void_xe_device,	\
+		 void (*)(struct xe_gt *) :				\
+			xe_kunit_helper_delayed_call_void_xe_gt,	\
+		 int (*)(struct xe_gt *, unsigned int) :		\
+			xe_kunit_helper_delayed_call_int_xe_gt_uint	\
+	)(test, delay, func, args)
+
 #endif
-- 
2.43.0

