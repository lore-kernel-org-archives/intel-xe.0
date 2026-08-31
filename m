Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B92C7C61DD3
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 13:18:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB1810E288;
	Mon, 31 Aug 2026 13:18:45 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C1C110E288;
 Mon, 31 Aug 2026 13:18:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_KUnit_test_for_VF_provisi?=
 =?utf-8?q?oning_error_handling_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 31 Aug 2026 13:18:44 -0000
Message-ID: <178818232411.101591.990348565614505429@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260831083605.2115328-12-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20260831083605.2115328-12-satyanarayana.k.v.p@intel.com>
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
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: KUnit test for VF provisioning error handling (rev7)
URL   : https://patchwork.freedesktop.org/series/170198/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 76103119c573dd1dce3de7f39b094e8be367e540
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Date:   Mon Aug 31 14:06:12 2026 +0530

    drm/xe/tests: Add KUnit tests for VF provisioning error handling
    
    VF relies on the PF to provide a valid hardware configuration via GuC
    KLV responses. In unlikely event of PF malfunction or misconfiguration,
    a VF may receive incomplete, zero, or out-of-range values for its
    submission contexts, doorbells, VRAM or GGTT assignment.
    
    Add KUnit test cases that use the xe_guc_mmio_send_recv() stub to inject
    bad KLV responses and verify that VF can survive without crashing for
    the invalid configuration data received.
    
    Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 3901cae80806f8db9ca96389c7727dbfeb60fbaf drm-intel
111f9bd0aa48 drm/xe/guc: Allow to replace xe_guc_mmio_send_recv() with KUNIT stub
be79d8f52525 drm/xe/vf: Split submission config query helpers
48c2cbd321e7 drm/xe/vf: Add bounds checking for queried context and doorbell counts
13c0c994d504 drm/xe: use SZ_4K for default VRAM region page size
ba6a4f31dfa9 drm/xe: Introduce helpers for xe_vram size
6cd7297ebd4d drm/xe/ggtt: Avoid integer overflow when validating VF GGTT range
efca07a9b844 drm/xe/vf: Add bounds checking for queried GGTT base and size
791f7069eb0e drm/xe/vf: Add alignment check for queried VRAM size
167c7b8a30c8 drm/xe/ggtt: Add KUNIT stub for xe_ggtt_shift_nodes()
76103119c573 drm/xe/tests: Add KUnit tests for VF provisioning error handling
-:20: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#20: 
new file mode 100644

-:47: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'test' - possible side-effects?
#47: FILE: drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c:23:
+#define TEST_VALIDATE_IN_PARAMS(test, len, request, key)	\
+	do {	\
+		KUNIT_ASSERT_EQ(test,	\
+				FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, request[0]),	\
+				GUC_ACTION_VF2GUC_QUERY_SINGLE_KLV);	\
+		KUNIT_EXPECT_EQ(test, len, VF2GUC_QUERY_SINGLE_KLV_REQUEST_MSG_LEN);	\
+		KUNIT_ASSERT_EQ(test,	\
+				FIELD_GET(VF2GUC_QUERY_SINGLE_KLV_REQUEST_MSG_1_KEY, request[1]), \
+				key);	\
+	} while (0)

-:47: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'request' - possible side-effects?
#47: FILE: drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c:23:
+#define TEST_VALIDATE_IN_PARAMS(test, len, request, key)	\
+	do {	\
+		KUNIT_ASSERT_EQ(test,	\
+				FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, request[0]),	\
+				GUC_ACTION_VF2GUC_QUERY_SINGLE_KLV);	\
+		KUNIT_EXPECT_EQ(test, len, VF2GUC_QUERY_SINGLE_KLV_REQUEST_MSG_LEN);	\
+		KUNIT_ASSERT_EQ(test,	\
+				FIELD_GET(VF2GUC_QUERY_SINGLE_KLV_REQUEST_MSG_1_KEY, request[1]), \
+				key);	\
+	} while (0)

-:58: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'resp' - possible side-effects?
#58: FILE: drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c:34:
+#define TEST_FILL_RESP_BUFF(resp, c, type)	\
+	do {	\
+		if (type == sizeof(u32)) {	\
+			resp[0] = sizeof(u32) / sizeof(u32);	\
+			resp[1] = (c)->query;	\
+		} else if (type == sizeof(u64)) {	\
+			resp[0] = sizeof(u64) / sizeof(u32);	\
+			resp[1] = lower_32_bits((c)->query);	\
+			resp[2] = upper_32_bits((c)->query);	\
+		}	\
+	} while (0)

-:58: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'c' - possible side-effects?
#58: FILE: drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c:34:
+#define TEST_FILL_RESP_BUFF(resp, c, type)	\
+	do {	\
+		if (type == sizeof(u32)) {	\
+			resp[0] = sizeof(u32) / sizeof(u32);	\
+			resp[1] = (c)->query;	\
+		} else if (type == sizeof(u64)) {	\
+			resp[0] = sizeof(u64) / sizeof(u32);	\
+			resp[1] = lower_32_bits((c)->query);	\
+			resp[2] = upper_32_bits((c)->query);	\
+		}	\
+	} while (0)

total: 0 errors, 1 warnings, 4 checks, 398 lines checked


