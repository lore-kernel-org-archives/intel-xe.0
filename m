Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CEE606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 04:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ln4YoI5K
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 902F210EC3A;
	Wed, 21 Oct 2026 04:14:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD1010E2E4
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 04:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792556037; x=1824092037;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fg/GMVdbcnOVhHkUK2fUhrcgT6J+Ki9oZHbZwTWvnIw=;
 b=Ln4YoI5KWJfybTba/QxQI98Dg3wdtoYkEe7zS4xueFMpFv4IDO/v/D5S
 dqmqzJDLzOCOOE0F1dedksZt29CIXABIlJAgniWIATceLocfZOfoiWH1Y
 ISEZy5TmJSCzbF5PPCgnOI2cAYHMoM6hUVJQhuJvLJk4jHZGx2A4OIH98
 xaN3ptcjO6LYPvIsXndtgnBepLO7xQfp+p7AYw1MEsoHEe5RzYgKTjsT0
 eee6dNDURGwfy2EJH7BDY4fBIgGsz8NZ3AhHwVKUcK5ab6rNZARFScMq5
 fNaqtOdJwAsKemTq1wwmFiNoR0NG/85tF7imoCsvD5VX7Icrhym+JGqH3 Q==;
X-CSE-ConnectionGUID: 1/Von2GqQjWDE6gboGPPiw==
X-CSE-MsgGUID: THIAf5DFTEytmdsGFGa4Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1264318"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1264318"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 21:13:55 -0700
X-CSE-ConnectionGUID: O9Ti58+HQFmcuUuVl9lrYQ==
X-CSE-MsgGUID: mPeXfk9zSrazw1sUIYeBqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="2868701"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa008.jf.intel.com with ESMTP; 20 Oct 2026 21:13:54 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH 5/6] drm/xe/pci: add helper for ATS/PASID without PRI
Date: Wed, 21 Oct 2026 09:41:16 +0530
Message-ID: <20261021041117.1774877-6-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021041117.1774877-1-naresh.kumar.g@intel.com>
References: <20261021041117.1774877-1-naresh.kumar.g@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On platforms where ATS and PASID are enabled but PRI is not available,
SVA faults cannot rely on the IOMMU to fault in missing CPU mirror
bindings. Those faults must instead be recovered in driver.

Add a small PCI helper to report this condition so fault-handling code
can use a single predicate for the PRI-less SVA case.

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.h b/drivers/gpu/drm/xe/xe_pci.h
index 5f784229a5ec..cd22d316883b 100644
--- a/drivers/gpu/drm/xe/xe_pci.h
+++ b/drivers/gpu/drm/xe/xe_pci.h
@@ -18,4 +18,13 @@ static inline bool xe_pci_ats_pasid_enabled(struct pci_dev *pdev)
 	return pdev->ats_enabled && pdev->pasid_enabled;
 }
 
+/*
+ * True when SVA faults must be serviced in software: ATS/PASID is
+ * enabled but PRI is not available, so the IOMMU has no self-healing path.
+ */
+static inline bool xe_pci_svm_needs_sw_iopf(struct pci_dev *pdev)
+{
+	return xe_pci_ats_pasid_enabled(pdev) && !pdev->pri_enabled;
+}
+
 #endif
-- 
2.43.0

