Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 299B5C54ED0
	for <intel-xe@archiver.kernel.org>; Fri, 23 May 2025 17:42:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE91610E0AE;
	Fri, 23 May 2025 17:42:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jc12vLgf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4596F10E098
 for <intel-xe@lists.freedesktop.org>; Fri, 23 May 2025 17:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748022171; x=1779558171;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9Puk+nFJLjx8vplpxlKSmB6oVlh5hzzw6EBVHPKunE8=;
 b=Jc12vLgf0H6RmXH0iSh5EhVz/mtqenZ/N7n8XRrRo7BhjCtxm8sa6Pev
 y5NWkpWYEpRHGDoX+KzQ8FxIvvISLtVcOd8mkF70gVjjL+Tut7LFFU8FI
 OafFXryXDOmx9w3HpDwJnrKR1SuMHr7HeNXPt9izu+q2SLW8rCfOnRXQd
 TSQuT+Wyj8Yj+GmISgbU4OAO1Pj7p2tQls5O5evYoyV0LyRY1V8EORZlN
 o85o5EeF3c/6gYrQF4F0TQacUxcd58rHFeRPtRZsN49N3v30tHn9UoPgs
 jxiQz21iuhYiiPD53gwqQsGDuMXOmhiYoH0PUXQol9sJgAXLAfxrZRTvD A==;
X-CSE-ConnectionGUID: XNLS6HwyRLSgNJNidcZaRA==
X-CSE-MsgGUID: Kucn3x7sR/ae3J4fqu3XaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="53881257"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="53881257"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 10:42:51 -0700
X-CSE-ConnectionGUID: ADWvXroJRFKJwF6YxpMDPw==
X-CSE-MsgGUID: qINGZ1DvS0Ot8tYXtx7Clg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="141098134"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 10:42:51 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH v3 1/3] drm/xe/configfs: Drop trailing semicolons
Date: Fri, 23 May 2025 10:42:31 -0700
Message-ID: <20250523-engine-mask-v3-1-11817dc6eb63@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523-engine-mask-v3-0-11817dc6eb63@intel.com>
References: <20250523-engine-mask-v3-0-11817dc6eb63@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-f7671
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

Drop the semicolons from the dummy implementation: they shouldn't be
there.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index d7d041ec26117..ef6d231b3024b 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -15,10 +15,10 @@ void xe_configfs_exit(void);
 bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
 void xe_configfs_clear_survivability_mode(struct pci_dev *pdev);
 #else
-static inline int xe_configfs_init(void) { return 0; };
-static inline void xe_configfs_exit(void) {};
-static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; };
-static inline void xe_configfs_clear_survivability_mode(struct pci_dev *pdev) {};
+static inline int xe_configfs_init(void) { return 0; }
+static inline void xe_configfs_exit(void) { }
+static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
+static inline void xe_configfs_clear_survivability_mode(struct pci_dev *pdev) { }
 #endif
 
 #endif

-- 
2.49.0

