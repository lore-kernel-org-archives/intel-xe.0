Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88868C5B572
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 14:13:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF1F10F01E;
	Wed, 12 Aug 2026 14:13:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WHXSiAvQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A94810F022;
 Wed, 12 Aug 2026 14:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786543987; x=1818079987;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N4yfRAAJ1Wd10N0p2ZgCQfOyRP+o6s8sNm9hVJ7C03I=;
 b=WHXSiAvQCE2t5GQpB3Nc31wDWykghn+5jmVHnr4pitu2lzFlydzzdfiF
 Kupg+Jgvm1KFX0hCbIxLZcGqSSz1mDBX5JG7VfTXNiIYEsbhzK0inV9eF
 iCAuNPACi/dsnmxEphVzbK9NCm+4z0dap4mPWoz1wor0K0gw7LpAW3rs3
 OP90cxuW1UTt7LLK4unnfyqjjPXF+bnPnEc7BPfZkqfns+J0jO9wEEr3P
 gsY1J0SzsEzfRLa+x1sZ1YMzaUpS7iRiBAFfZdHTB1WmjvjI4b/lGNbMt
 PT+u8bLN7XbzZ394EOaLdK6CyoUA/Rq2nUmIHlny8XQYfv8kysShYoMzp w==;
X-CSE-ConnectionGUID: gdAqD16GS2y0XD6h+kNGuw==
X-CSE-MsgGUID: Pbg0YDJPQNqZSnIt4DZCaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="104632750"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="104632750"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 07:13:05 -0700
X-CSE-ConnectionGUID: 32aZpx49S0y7s5cl0d5xjw==
X-CSE-MsgGUID: XjTFOVAWSp24iUkC1gfXyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="287096136"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 07:13:03 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: alex.zuo@intel.com, jonathan.cavitt@intel.com, imre.deak@intel.com,
 michal.grzelak@intel.com, jani.nikula@linux.intel.com,
 intel-xe@lists.freedesktop.org
Subject: [PATCH v3] drm/i915/kunit: DP Link: Use if statements instead of for
 loops
Date: Wed, 12 Aug 2026 22:13:00 +0800
Message-ID: <20260812141300.184053-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.53.0
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

The static functions get_target_config and get_fallback_config in
intel_dp_link_test.c use for loops to determine if the requested index of
the config set is in the bounds of the config set entry list.

Reconfigure these functions to use if statements instead, as these for
loops are only run for a single iteration.

Issue caught by static analysis.

v2: (Michal)
- Change i <= 0 check to i == 0, as i cannot be negative by assertion
- Remove unnecessary newlines

v3:
- Misc. checkpatch fixes
- Resubmit to exercise target kunit test

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Imre Deak <imre.deak@intel.com>
Cc: Michal Grzelak <michal.grzelak@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
---
 .../i915/display/tests/intel_dp_link_test.c   | 34 ++++++++-----------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c b/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c
index 67c6fe9f1812..608b7a9d60bf 100644
--- a/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c
+++ b/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c
@@ -1215,22 +1215,20 @@ static bool get_fallback_config(const struct test_config_table *expected_table,
 	struct kunit *test = expected_table->test;
 	const struct link_config_set *config_set =
 		get_fallback_configs_for_output_type(test, output_type);
+	const struct intel_dp_link_config *config;
 	int i;
 
 	i = lookup_config(config_set, target_config);
 	KUNIT_ASSERT_GE(test, i, 0);
 
-	for (i--; i >= 0; i--) {
-		const struct intel_dp_link_config *config =
-			&config_set->entries[i];
+	if (!i)
+		return false;
 
-		assert_config_is_supported(expected_table, config);
-		*fallback_config = *config;
+	config = &config_set->entries[i - 1];
+	assert_config_is_supported(expected_table, config);
+	*fallback_config = *config;
 
-		return true;
-	}
-
-	return false;
+	return true;
 }
 
 static bool get_target_config(const struct test_config_table *expected_table,
@@ -1240,19 +1238,17 @@ static bool get_target_config(const struct test_config_table *expected_table,
 	struct kunit *test = expected_table->test;
 	const struct link_config_set *config_set =
 		get_target_configs_for_output_type(test, output_type);
-	int i;
+	const struct intel_dp_link_config *config;
+	int i = config_set->size - 1;
 
-	for (i = config_set->size - 1; i >= 0; i--) {
-		const struct intel_dp_link_config *config =
-			&config_set->entries[i];
+	if (i < 0)
+		return false;
 
-		assert_config_is_supported(expected_table, config);
-		*target = *config;
+	config = &config_set->entries[i];
+	assert_config_is_supported(expected_table, config);
+	*target = *config;
 
-		return true;
-	}
-
-	return false;
+	return true;
 }
 
 static void test_fallback_seq(struct kunit *test,
-- 
2.53.0

