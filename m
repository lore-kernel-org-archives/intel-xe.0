Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42956C55165
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 15:33:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED9BE10EFAC;
	Thu, 30 Jul 2026 15:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="boAdY1Pk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51B6210EFA9
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 15:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785425603; x=1816961603;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H7p69HlDSi4VTtH/MitqQI3HfxtM6KfF+bZYV3IARdk=;
 b=boAdY1PkgQxAhgcPlP3LLURhrNw8pm/MZpdaNcYRa/HS/jRqFlSpviod
 4scm+JctpFKYGlEJ022d+LfjJZNC+ThtUpURrW2Hh9dt+ER4Pcf4Us57F
 cU9Kcc4l05tEIYWKPyAr/WopMeu8zAQHRqB3kkgfVzmHSzQoRxxzsYvi+
 YlVnHltvncaYSSAznVAiMMP8j/o6f9T0wftNEsEy4FMH+IX6hzjoA1pis
 rj0vowiLspju6CkW5kEmBmV4A7qVDPTtU1DtdjytCo9IpHtewC1psbMGy
 aLz3T5ob9Dg9W4+GUQVijrDP0EE41F3ZHJrWfmhCYc+8h5EalEpyaHlDX Q==;
X-CSE-ConnectionGUID: C3pF5s4DRQaojuDWrG+wLA==
X-CSE-MsgGUID: +gIPgKMpR3yD8CDqFF/1+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="73583056"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="73583056"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 08:33:21 -0700
X-CSE-ConnectionGUID: j7Bw9068S8m+RnbTkwttkA==
X-CSE-MsgGUID: 0bSH70w6SRu6PplucaeVxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="260387584"
Received: from psiebies-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.250.135])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 08:33:20 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v3 13/23] drm/xe/kunit: Setup driver data in the test device
Date: Thu, 30 Jul 2026 17:21:09 +0200
Message-ID: <20260730152121.576-14-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730152121.576-1-michal.wajdeczko@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
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

While we have helpers pdev_to_xe_device() and kdev_to_xe_device()
to obtain the xe_device pointer from the struct device pointer or
from the struct pci_dev pointer, we must also setup the drm_device
pointer as driver data in the device to make them work.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
index bc5156966ce9..27740b40c8ae 100644
--- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
+++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
@@ -39,6 +39,10 @@ struct xe_device *xe_kunit_helper_alloc_xe_device(struct kunit *test,
 					       struct xe_device,
 					       drm, DRIVER_GEM);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);
+
+	dev_set_drvdata(xe->drm.dev, &xe->drm);
+	KUNIT_ASSERT_PTR_EQ(test, xe, kdev_to_xe_device(dev));
+
 	return xe;
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_alloc_xe_device);
-- 
2.47.1

