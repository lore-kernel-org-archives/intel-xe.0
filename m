Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84070C02194
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 18:05:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E49D10E370;
	Tue,  4 Feb 2025 18:05:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gE+PDFjB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D9510E37B
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Feb 2025 18:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738692343; x=1770228343;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AXX4+WnS5NT05ftOx+9ssmqhErjSlgN/p9qhISAs36g=;
 b=gE+PDFjBtpv8uqgM2qnvYJaII2ocZG2tMtvphscdykHx3vgr18UK7n+y
 UeASlXlukViK4IdowiflQaIa4RDge/r9ndJ8WemxP5gSyCt8tsIR79rEt
 8TeSAT3D72gmOprkhx7DuEg5zc3PS7RYyPbE0G+YqYs2FZWyKFYOOl560
 IN2N4aYbOPhfjYzUqqrsRdHYntPGDzkWCeXlfDtvhoTsqECUdCIwlHXjI
 ouWfGhU+fll77dtAVy4lvNUiWFgOpIv6+t2JKzfARo5nsdAhYRRcsPDvD
 HezYDw2njhD3cq/D1KWVkrqGtU+VJo7MKfPLxRNxXs8QyVEW9oIz4HuWY w==;
X-CSE-ConnectionGUID: cV0kTESOTRKubY+x1+/4qw==
X-CSE-MsgGUID: OxjDtQf8QXGGLxNLtidKLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50651347"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50651347"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 10:05:43 -0800
X-CSE-ConnectionGUID: Msw92HMXQEqxPCgqF3GeCg==
X-CSE-MsgGUID: pdUWq+v0S0yXvsWcpm1UOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="115701689"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.83.184])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 10:05:41 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 2/3] drm/xe/vf: Return error code from
 xe_hw_engine_read_timestamp()
Date: Tue,  4 Feb 2025 19:05:21 +0100
Message-Id: <20250204180522.2327214-3-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250204180522.2327214-1-marcin.bernatowicz@linux.intel.com>
References: <20250204180522.2327214-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Modify xe_hw_engine_read_timestamp() to return an error code instead
of a u64 timestamp. Return -EOPNOTSUPP when called from Virtual Function
(VF) mode to avoid reading the inaccessible RING_TIMESTAMP register.

Update function signature to pass the timestamp via a pointer argument.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 10 ++++++++--
 drivers/gpu/drm/xe/xe_hw_engine.h |  2 +-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index fc447751fe78..ab91c15f3a8b 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -981,9 +981,15 @@ const char *xe_hw_engine_class_to_str(enum xe_engine_class class)
 	return NULL;
 }
 
-u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe)
+int xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe, u64 *gpu_timestamp)
 {
-	return xe_mmio_read64_2x32(&hwe->gt->mmio, RING_TIMESTAMP(hwe->mmio_base));
+	if (IS_SRIOV_VF(gt_to_xe(hwe->gt)))
+		return -EOPNOTSUPP;
+
+	*gpu_timestamp = xe_mmio_read64_2x32(&hwe->gt->mmio,
+					     RING_TIMESTAMP(hwe->mmio_base));
+
+	return 0;
 }
 
 enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct xe_hw_engine *hwe)
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index 6b5f9fa2a594..df377da82770 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -73,7 +73,7 @@ static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
 }
 
 const char *xe_hw_engine_class_to_str(enum xe_engine_class class);
-u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe);
+int xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe, u64 *gpu_timestamp);
 enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct xe_hw_engine *hwe);
 
 void xe_hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg, u32 val);
-- 
2.31.1

