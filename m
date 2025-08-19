Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD84CA0EE9
	for <intel-xe@archiver.kernel.org>; Tue, 19 Aug 2025 06:39:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F332010E536;
	Tue, 19 Aug 2025 06:39:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HCROiqEz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0386F10E538
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Aug 2025 06:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755585585; x=1787121585;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sQboZYynZWopqcVHegfQGKXQVIVSHxmgTQN9zJSfSDE=;
 b=HCROiqEzX3W3Jtmi3s5ekA4KiwctiGw9m8bMFVSE35AcZmEJXyqxkCbA
 4KL+ahyxZszLcfUeUL+wYaQBzWKM8FK40wWccVWZbF46EraTmRjH/ZxDk
 c6Bqe/7N0KTAqKga6pI7W1A0dblNXAYnjxDwZjPmR7Ato28Jfmx2mnokh
 lfdpbOiRTZBjzgvRc5nVJSB5Q48dyXplvuw8tZtJSb0+BaNx4KP3YHDpu
 7LhyMI56jL+Bc7mgOh0sIeUBpkLA1Q+JeLTtPY+9SC1bU9jK/dcY5TSyD
 /rKdknmSBe74f2WeHJtYnzW8x/Xc8UO6tOUjlrPq1EBnwjUZ04Cq1cBC2 w==;
X-CSE-ConnectionGUID: 3RXMD8KnTJSlMNgr+nEMJg==
X-CSE-MsgGUID: 4VaW4HA/TU6awFvql+zq5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57966995"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="57966995"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 23:39:39 -0700
X-CSE-ConnectionGUID: im8VFDlpSj+dI7ulpfFg7g==
X-CSE-MsgGUID: gnFZ5TGnQ+GBAIUu3elf8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="172009516"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by orviesa003.jf.intel.com with ESMTP; 18 Aug 2025 23:39:39 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com,
	S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH 7/8] drm/xe: Integrate GPU frequency tracer into device
 initialization
Date: Tue, 19 Aug 2025 12:04:16 +0530
Message-Id: <20250819063417.918666-8-s.sebinraj@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250819063417.918666-1-s.sebinraj@intel.com>
References: <20250819063417.918666-1-s.sebinraj@intel.com>
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

Add xe_gpufreqtracer_init() call to xe_device_probe() to initialize
the GPU frequency tracer during device setup.

Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 3e0402dff423..9bdf3fda7c77 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -34,6 +34,7 @@
 #include "xe_exec_queue.h"
 #include "xe_force_wake.h"
 #include "xe_ggtt.h"
+#include "xe_gpufreqtracer.h"
 #include "xe_gsc_proxy.h"
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
@@ -896,6 +897,10 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = xe_gpufreqtracer_init(xe);
+	if (err)
+		return err;
+
 	err = xe_oa_init(xe);
 	if (err)
 		return err;
-- 
2.34.1

