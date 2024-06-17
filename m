Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB93CC2BA1A
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 18:25:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B6B310E4A1;
	Mon, 17 Jun 2024 18:25:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OV+ZJ/hj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D23A010E4AD
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 18:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718648735; x=1750184735;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WogJxYMd1gxaqbqCn/Ng4hpLlqp27qFSv7K4WJ26ddk=;
 b=OV+ZJ/hjHE2O7FM4glwJvQt0ABqwlVFELCf0eQ2B3/j65D9823NFZpkB
 NjXF/ZdU0jTjoOcNPcZcAWKXO5fgPUb3mm26QGK0xknUw/ndNIVQiSDnV
 ZBYjkFt/9xPhxubjBcpfFk8B4cBqWP+hN3Xam9856zf+xh24EeGaMGQFT
 fnH6vR7CP01ZBpuIVeCvXNFK0/Mb0sd21lS2OuXz7D4XDcrMM3/PrBpD6
 rZcJA0rIlK+UZhy5QzbDahKPUQK+A/6cdqhrBKE2YwfYqkeAJ4i1WrLbj
 3l1+9yF+0eGQ1zGv8kMSBGmopA8vPwJnGkS4q1GeIJ1wnV0j1YIkFwfKL Q==;
X-CSE-ConnectionGUID: LoBllEK/QHKKkkGcpK+tiA==
X-CSE-MsgGUID: 1zrsqG/iSjWrkiB6hOv4KQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="19276230"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="19276230"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 11:25:34 -0700
X-CSE-ConnectionGUID: Y8qU8Ae5RHq3K44BhIKKjA==
X-CSE-MsgGUID: A3ObvevvRAOip3SK710OxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="45642433"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 11:25:34 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 1/5] drm/xe/rtp: Allow to match 0 sr entries
Date: Mon, 17 Jun 2024 11:25:14 -0700
Message-ID: <20240617182518.280975-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240617182518.280975-1-lucas.demarchi@intel.com>
References: <20240617182518.280975-1-lucas.demarchi@intel.com>
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

If none of the rules match, there should be 0 entriese in the sr xarray,
so none of them should have a register matching.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_rtp_test.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
index 06759d754783..474a0b222ce1 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
@@ -255,9 +255,14 @@ static void xe_rtp_process_tests(struct kunit *test)
 	}
 
 	KUNIT_EXPECT_EQ(test, count, param->expected_count);
-	KUNIT_EXPECT_EQ(test, sr_entry->clr_bits, param->expected_clr_bits);
-	KUNIT_EXPECT_EQ(test, sr_entry->set_bits, param->expected_set_bits);
-	KUNIT_EXPECT_EQ(test, sr_entry->reg.raw, param->expected_reg.raw);
+	if (count) {
+		KUNIT_EXPECT_EQ(test, sr_entry->clr_bits, param->expected_clr_bits);
+		KUNIT_EXPECT_EQ(test, sr_entry->set_bits, param->expected_set_bits);
+		KUNIT_EXPECT_EQ(test, sr_entry->reg.raw, param->expected_reg.raw);
+	} else {
+		KUNIT_EXPECT_NULL(test, sr_entry);
+	}
+
 	KUNIT_EXPECT_EQ(test, reg_sr->errors, param->expected_sr_errors);
 }
 
-- 
2.43.0

