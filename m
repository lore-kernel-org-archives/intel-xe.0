Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EE8D637DF
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 01:26:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 502AF10E9BD;
	Wed, 17 Dec 2025 01:26:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L4MO2V11";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C09B410E80A
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Dec 2025 01:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765934795; x=1797470795;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cpnQi62sWWF5Sez5/ej8cGxj9xHgLUMrDeGrPznRCHE=;
 b=L4MO2V11gaCMohbQnqgEqIWjrPTZ5FtU1Q54y4FmSdTfud5cl2jk2jLU
 CPo/70Tuv48m9Xf0YXiTGOgDGqtEou1etGXdxTAR3THTI3eSjzDgUN2+y
 I3QzCfUEdWLt16Ixe5bAYpA5WUSVga4r7LoOddCQPhgLn6v9F/E2Tdgo9
 KvCQ1OPN92+8chdsbvn4xDwNKJYEDRXoNfXB5Jc5UOlxd/q1zWajGuRxB
 SmZzlK9G7mLXfFHdGlLqXRp0tckiF70OK71j9bTgD9o6jz2tNBYVlD7cY
 KU1LU4lNc71COs/A3Mwu2ETsUkOrkL3a5Y9nyMvhMlurd0vFY9MpDcml+ w==;
X-CSE-ConnectionGUID: 1xshWzpCQAKiWX5thana5A==
X-CSE-MsgGUID: 04ES3qYPSAqQuU6ICIB8ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67903829"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; d="scan'208";a="67903829"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 17:26:35 -0800
X-CSE-ConnectionGUID: wynNLB/6TkumEgcdqvmmiw==
X-CSE-MsgGUID: AIMgYMyaSau/32deHgfRvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; d="scan'208";a="202360602"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 17:26:34 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v4 01/13] DO_NOT_MERGE: PF: Add handling for new adverse event
 thresholds
Date: Tue, 16 Dec 2025 17:26:21 -0800
Message-ID: <20251217012620.758252-16-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217012620.758252-15-daniele.ceraolospurio@intel.com>
References: <20251217012620.758252-15-daniele.ceraolospurio@intel.com>
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

This patch is a squash of the entire series called "PF: Add handling
for new adverse event thresholds" [1], which is a dependency for the
follow up patches.
The series is being reviewed separately, this patch is only include so
that the next ones build correctly.

[1] https://patchwork.freedesktop.org/series/158874/
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h         |  9 ++++
 drivers/gpu/drm/xe/tests/xe_args_test.c       | 54 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_args.h                  | 27 ++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 19 ++++---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  9 ++--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c |  2 +-
 drivers/gpu/drm/xe/xe_guc.h                   | 21 ++++++++
 drivers/gpu/drm/xe/xe_guc_ads.c               |  4 +-
 .../drm/xe/xe_guc_klv_thresholds_set_types.h  |  6 +++
 9 files changed, 138 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 265a135e7061..89a4f8c504e6 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -352,6 +352,12 @@ enum  {
  *      :1: NORMAL = schedule VF always, irrespective of whether it has work or not
  *      :2: HIGH = schedule VF in the next time-slice after current active
  *          time-slice completes if it has active work
+ *
+ * _`GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT` : 0x8A0D
+ *      Given that multi-LRC contexts are incompatible with SRIOV scheduler
+ *      groups and cause the latter to be turned off when registered with the
+ *      GuC, this config allows the PF to set a threshold for multi-LRC context
+ *      registrations by VFs to monitor their behavior.
  */
 
 #define GUC_KLV_VF_CFG_GGTT_START_KEY		0x0001
@@ -410,6 +416,9 @@ enum  {
 #define   GUC_SCHED_PRIORITY_NORMAL		1u
 #define   GUC_SCHED_PRIORITY_HIGH		2u
 
+#define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_KEY	0x8a0d
+#define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_LEN	1u
+
 /*
  * Workaround keys:
  */
diff --git a/drivers/gpu/drm/xe/tests/xe_args_test.c b/drivers/gpu/drm/xe/tests/xe_args_test.c
index f3fb23aa5d2e..8bef24cf8c70 100644
--- a/drivers/gpu/drm/xe/tests/xe_args_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_args_test.c
@@ -78,6 +78,24 @@ static void pick_arg_example(struct kunit *test)
 #undef buz
 }
 
+static void if_args_example(struct kunit *test)
+{
+	enum { Z = 1, Q };
+
+#define foo	X, Y
+#define bar	IF_ARGS(Z, Q, foo)
+#define buz	IF_ARGS(Z, Q, DROP_FIRST_ARG(FIRST_ARG(foo)))
+
+	KUNIT_EXPECT_EQ(test, bar, Z);
+	KUNIT_EXPECT_EQ(test, buz, Q);
+	KUNIT_EXPECT_STREQ(test, __stringify(bar), "Z");
+	KUNIT_EXPECT_STREQ(test, __stringify(buz), "Q");
+
+#undef foo
+#undef bar
+#undef buz
+}
+
 static void sep_comma_example(struct kunit *test)
 {
 #define foo(f)	f(X) f(Y) f(Z) f(Q)
@@ -198,6 +216,40 @@ static void last_arg_test(struct kunit *test)
 	KUNIT_EXPECT_STREQ(test, __stringify(LAST_ARG(MAX_ARGS)), "-12");
 }
 
+static void if_args_test(struct kunit *test)
+{
+	bool with_args = true;
+	bool no_args = false;
+	enum { X = 100 };
+
+	KUNIT_EXPECT_TRUE(test, IF_ARGS(true, false, FOO_ARGS));
+	KUNIT_EXPECT_FALSE(test, IF_ARGS(true, false, NO_ARGS));
+
+	KUNIT_EXPECT_TRUE(test, CONCATENATE(IF_ARGS(with, no, FOO_ARGS), _args));
+	KUNIT_EXPECT_FALSE(test, CONCATENATE(IF_ARGS(with, no, NO_ARGS), _args));
+
+	KUNIT_EXPECT_STREQ(test, __stringify(IF_ARGS(yes, no, FOO_ARGS)), "yes");
+	KUNIT_EXPECT_STREQ(test, __stringify(IF_ARGS(no, no, NO_ARGS)), "no");
+
+	KUNIT_EXPECT_EQ(test, IF_ARGS(CALL_ARGS(COUNT_ARGS, FOO_ARGS), -1, FOO_ARGS), 4);
+	KUNIT_EXPECT_EQ(test, IF_ARGS(CALL_ARGS(COUNT_ARGS, FOO_ARGS), -1, NO_ARGS), -1);
+	KUNIT_EXPECT_EQ(test, IF_ARGS(CALL_ARGS(COUNT_ARGS, NO_ARGS), -1, FOO_ARGS), 0);
+	KUNIT_EXPECT_EQ(test, IF_ARGS(CALL_ARGS(COUNT_ARGS, NO_ARGS), -1, NO_ARGS), -1);
+
+	KUNIT_EXPECT_EQ(test,
+			CALL_ARGS(FIRST_ARG,
+				  CALL_ARGS(CONCATENATE, IF_ARGS(FOO, MAX, FOO_ARGS), _ARGS)), X);
+	KUNIT_EXPECT_EQ(test,
+			CALL_ARGS(FIRST_ARG,
+				  CALL_ARGS(CONCATENATE, IF_ARGS(FOO, MAX, NO_ARGS), _ARGS)), -1);
+	KUNIT_EXPECT_EQ(test,
+			CALL_ARGS(COUNT_ARGS,
+				  CALL_ARGS(CONCATENATE, IF_ARGS(FOO, MAX, FOO_ARGS), _ARGS)), 4);
+	KUNIT_EXPECT_EQ(test,
+			CALL_ARGS(COUNT_ARGS,
+				  CALL_ARGS(CONCATENATE, IF_ARGS(FOO, MAX, NO_ARGS), _ARGS)), 12);
+}
+
 static struct kunit_case args_tests[] = {
 	KUNIT_CASE(count_args_test),
 	KUNIT_CASE(call_args_example),
@@ -209,6 +261,8 @@ static struct kunit_case args_tests[] = {
 	KUNIT_CASE(last_arg_example),
 	KUNIT_CASE(last_arg_test),
 	KUNIT_CASE(pick_arg_example),
+	KUNIT_CASE(if_args_example),
+	KUNIT_CASE(if_args_test),
 	KUNIT_CASE(sep_comma_example),
 	{}
 };
diff --git a/drivers/gpu/drm/xe/xe_args.h b/drivers/gpu/drm/xe/xe_args.h
index 4dbc7e53c624..f550b5e3b993 100644
--- a/drivers/gpu/drm/xe/xe_args.h
+++ b/drivers/gpu/drm/xe/xe_args.h
@@ -121,6 +121,33 @@
 #define PICK_ARG11(args...)		PICK_ARG10(DROP_FIRST_ARG(args))
 #define PICK_ARG12(args...)		PICK_ARG11(DROP_FIRST_ARG(args))
 
+/**
+ * IF_ARGS() - Make selection based on optional argument list.
+ * @then: token to return if arguments are present
+ * @else: token to return if arguments are empty
+ * @...: arguments to check (optional)
+ *
+ * This macro allows to select a token based on the presence of the argument list.
+ *
+ * Example:
+ *
+ *	#define foo	X, Y
+ *	#define bar	IF_ARGS(Z, Q, foo)
+ *	#define buz	IF_ARGS(Z, Q, DROP_FIRST_ARG(FIRST_ARG(foo)))
+ *
+ *	With above definitions bar expands to Z while buz expands to Q.
+ */
+#if defined(CONFIG_CC_IS_CLANG) || GCC_VERSION >= 100100
+#define IF_ARGS(then, else, ...)	FIRST_ARG(__VA_OPT__(then,) else)
+#else
+#define IF_ARGS(then, else, ...)	_IF_ARGS(then, else, CALL_ARGS(FIRST_ARG, __VA_ARGS__))
+#define _IF_ARGS(then, else, ...)	__IF_ARGS(then, else, CALL_ARGS(COUNT_ARGS, __VA_ARGS__))
+#define __IF_ARGS(then, else, n)	___IF_ARGS(then, else, CALL_ARGS(CONCATENATE, ___IF_ARG, n))
+#define ___IF_ARGS(then, else, if)	CALL_ARGS(if, then, else)
+#define ___IF_ARG1(then, else)		then
+#define ___IF_ARG0(then, else)		else
+#endif
+
 /**
  * ARGS_SEP_COMMA - Definition of a comma character.
  *
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 59c5c6b4d994..6e8507c24986 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -269,7 +269,8 @@ static u32 encode_config_ggtt(u32 *cfg, const struct xe_gt_sriov_config *config,
 }
 
 /* Return: number of configuration dwords written */
-static u32 encode_config(u32 *cfg, const struct xe_gt_sriov_config *config, bool details)
+static u32 encode_config(struct xe_gt *gt, u32 *cfg, const struct xe_gt_sriov_config *config,
+			 bool details)
 {
 	u32 n = 0;
 
@@ -303,9 +304,11 @@ static u32 encode_config(u32 *cfg, const struct xe_gt_sriov_config *config, bool
 	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_PREEMPT_TIMEOUT);
 	cfg[n++] = config->preempt_timeout;
 
-#define encode_threshold_config(TAG, ...) ({					\
-	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_THRESHOLD_##TAG);			\
-	cfg[n++] = config->thresholds[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)];	\
+#define encode_threshold_config(TAG, NAME, VER...) ({					\
+	if (IF_ARGS(GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, VER), true, VER)) {		\
+		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_THRESHOLD_##TAG);			\
+		cfg[n++] = config->thresholds[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)];	\
+	}										\
 });
 
 	MAKE_XE_GUC_KLV_THRESHOLDS_SET(encode_threshold_config);
@@ -328,7 +331,7 @@ static int pf_push_full_vf_config(struct xe_gt *gt, unsigned int vfid)
 		return -ENOBUFS;
 
 	cfg = xe_guc_buf_cpu_ptr(buf);
-	num_dwords = encode_config(cfg, config, true);
+	num_dwords = encode_config(gt, cfg, config, true);
 	xe_gt_assert(gt, num_dwords <= max_cfg_dwords);
 
 	if (xe_gt_is_media_type(gt)) {
@@ -2518,7 +2521,7 @@ ssize_t xe_gt_sriov_pf_config_save(struct xe_gt *gt, unsigned int vfid, void *bu
 			ret = -ENOBUFS;
 		} else {
 			config = pf_pick_vf_config(gt, vfid);
-			ret = encode_config(buf, config, false) * sizeof(u32);
+			ret = encode_config(gt, buf, config, false) * sizeof(u32);
 		}
 	}
 	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
@@ -2551,11 +2554,13 @@ static int pf_restore_vf_config_klv(struct xe_gt *gt, unsigned int vfid,
 		return pf_provision_preempt_timeout(gt, vfid, value[0]);
 
 	/* auto-generate case statements */
-#define define_threshold_key_to_provision_case(TAG, ...)				\
+#define define_threshold_key_to_provision_case(TAG, NAME, VER...)			\
 	case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):					\
 		BUILD_BUG_ON(MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG) != 1u);		\
 		if (len != MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG))			\
 			return -EBADMSG;						\
+		if (IF_ARGS(!GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, VER), false, VER))	\
+			return -EKEYREJECTED;						\
 		return pf_provision_threshold(gt, vfid,					\
 					      MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG),	\
 					      value[0]);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index 0fd863609848..ece9eed5d7c5 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -21,6 +21,7 @@
 #include "xe_gt_sriov_pf_monitor.h"
 #include "xe_gt_sriov_pf_policy.h"
 #include "xe_gt_sriov_pf_service.h"
+#include "xe_guc.h"
 #include "xe_pm.h"
 #include "xe_sriov_pf.h"
 #include "xe_sriov_pf_provision.h"
@@ -301,9 +302,11 @@ static void pf_add_config_attrs(struct xe_gt *gt, struct dentry *parent, unsigne
 				   &sched_priority_fops);
 
 	/* register all threshold attributes */
-#define register_threshold_attribute(TAG, NAME, ...) \
-	debugfs_create_file_unsafe("threshold_" #NAME, 0644, parent, parent, \
-				   &NAME##_fops);
+#define register_threshold_attribute(TAG, NAME, VER...) ({				\
+	if (IF_ARGS(GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, VER), true, VER))		\
+		debugfs_create_file_unsafe("threshold_" #NAME, 0644, parent, parent,	\
+					   &NAME##_fops);				\
+});
 	MAKE_XE_GUC_KLV_THRESHOLDS_SET(register_threshold_attribute)
 #undef register_threshold_attribute
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index 3174a8dee779..7410e7b93256 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -1026,7 +1026,7 @@ static void action_ring_cleanup(void *arg)
 
 static void pf_gt_migration_check_support(struct xe_gt *gt)
 {
-	if (GUC_FIRMWARE_VER(&gt->uc.guc) < MAKE_GUC_VER(70, 54, 0))
+	if (!GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 54))
 		xe_sriov_pf_migration_disable(gt_to_xe(gt), "requires GuC version >= 70.54.0");
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index fdb08658d05a..a169f231cbd8 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -18,10 +18,16 @@
  */
 #define MAKE_GUC_VER(maj, min, pat)	(((maj) << 16) | ((min) << 8) | (pat))
 #define MAKE_GUC_VER_STRUCT(ver)	MAKE_GUC_VER((ver).major, (ver).minor, (ver).patch)
+#define MAKE_GUC_VER_ARGS(ver...) \
+	(BUILD_BUG_ON_ZERO(COUNT_ARGS(ver) < 2 || COUNT_ARGS(ver) > 3) + \
+	 MAKE_GUC_VER(PICK_ARG1(ver), PICK_ARG2(ver), IF_ARGS(PICK_ARG3(ver), 0, PICK_ARG3(ver))))
+
 #define GUC_SUBMIT_VER(guc) \
 	MAKE_GUC_VER_STRUCT((guc)->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY])
 #define GUC_FIRMWARE_VER(guc) \
 	MAKE_GUC_VER_STRUCT((guc)->fw.versions.found[XE_UC_FW_VER_RELEASE])
+#define GUC_FIRMWARE_VER_AT_LEAST(guc, ver...) \
+	xe_guc_fw_version_at_least((guc), MAKE_GUC_VER_ARGS(ver))
 
 struct drm_printer;
 
@@ -96,4 +102,19 @@ static inline struct drm_device *guc_to_drm(struct xe_guc *guc)
 	return &guc_to_xe(guc)->drm;
 }
 
+/**
+ * xe_guc_fw_version_at_least() - Check if GuC is at least of given version.
+ * @guc: the &xe_guc
+ * @ver: the version to check
+ *
+ * The @ver should be prepared using MAKE_GUC_VER(major, minor, patch).
+ *
+ * Return: true if loaded GuC firmware is at least of given version,
+ *         false otherwise.
+ */
+static inline bool xe_guc_fw_version_at_least(const struct xe_guc *guc, u32 ver)
+{
+	return GUC_FIRMWARE_VER(guc) >= ver;
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index e06c6aa335bf..5feeb91426ee 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -347,10 +347,10 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
 		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
 				 GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET);
 
-	if (GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 44, 0) && XE_GT_WA(gt, 16026508708))
+	if (GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 44) && XE_GT_WA(gt, 16026508708))
 		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
 				 GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH);
-	if (GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 47, 0) && XE_GT_WA(gt, 16026007364)) {
+	if (GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 47) && XE_GT_WA(gt, 16026007364)) {
 		u32 data[] = {
 			0x0,
 			0xF,
diff --git a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
index 0a028c94756d..45ab5a3b5218 100644
--- a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
@@ -24,6 +24,11 @@
  * ABI and the associated &NAME, that may be used in code or debugfs/sysfs::
  *
  *	define(TAG, NAME)
+ *
+ * If required, KLVs can be labeled with GuC firmware version that added them::
+ *
+ *	define(TAG, NAME, MAJOR, MINOR)
+ *	define(TAG, NAME, MAJOR, MINOR, PATCH)
  */
 #define MAKE_XE_GUC_KLV_THRESHOLDS_SET(define)		\
 	define(CAT_ERR, cat_error_count)		\
@@ -32,6 +37,7 @@
 	define(H2G_STORM, guc_time_us)			\
 	define(IRQ_STORM, irq_time_us)			\
 	define(DOORBELL_STORM, doorbell_time_us)	\
+	define(MULTI_LRC_COUNT, multi_lrc_count, 70, 53)\
 	/* end */
 
 /**
-- 
2.43.0

