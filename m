Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE72C5B553
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 21:54:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E766610E6D7;
	Wed, 28 May 2025 21:54:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gdjIIWTS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F357610E6D1
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 21:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748469258; x=1780005258;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QThMzhKXjg5PYCx/I59EVT1GL92JL0UaW9/C4R6u6/0=;
 b=gdjIIWTSmuVrLV52jBrfS0/6ZepcRp7ukYpejQkP5ULNk0mjsMuJNcZ8
 TSS+I5/b1hOvECI6e6yL0jRpK1Chu/3MWG+DGbRCJW9UrC1WF5Lvx6wql
 xa186RCf3Am1AarLjUs7yTL5nVLCJyV5eA7bjxZypkWDeINVDGnvOzRyx
 9sj5X59S6A2adZgNySJht8Yy5A9ArYMFM2KwM/esL955fA/3VURIoJgUH
 Q7R45fsd+GSsBhykwqgfa/iF0Q/cQ2xdIY9fs+zwsKD3hZ+xMXojnQcf+
 EOnZKg+/7nlin+wJqUngstxEUquT3mUIQXZ0Kb94jz0rXfaQZSo5s1Jw0 g==;
X-CSE-ConnectionGUID: sTZyCgOtQt2ivzBpvhv0Kg==
X-CSE-MsgGUID: 0QlBIRmpSnuNNwWPGyYdgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="73044757"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="73044757"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 14:54:17 -0700
X-CSE-ConnectionGUID: t81F7VIZSaCPtCXH8GMoEg==
X-CSE-MsgGUID: 9qYccoTLRCaVrfGdSKD6Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="143201063"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 14:54:17 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v4 1/5] drm/xe/configfs: Drop trailing semicolons
Date: Wed, 28 May 2025 14:54:04 -0700
Message-ID: <20250528-engine-mask-v4-1-f4636d2a890a@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528-engine-mask-v4-0-f4636d2a890a@intel.com>
References: <20250528-engine-mask-v4-0-f4636d2a890a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-d9694
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

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
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

