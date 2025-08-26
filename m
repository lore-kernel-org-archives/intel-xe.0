Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31759CA0FF0
	for <intel-xe@archiver.kernel.org>; Tue, 26 Aug 2025 23:30:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBCEB10E6DD;
	Tue, 26 Aug 2025 23:30:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TW9LcrIM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1211D10E6DD
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Aug 2025 23:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756251039; x=1787787039;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8gBkP93V5M3ou0rbwPNA2ViVeqp877a6VwNGcMZMUmg=;
 b=TW9LcrIMxSPIpYj3Q7f73t5dLgPh+vY70VeOov3XCNqyIh9ethMHXgCX
 Uyskymsk85++Q6hxJF0BUSrr04QR+BaEstu4NLMjqu2HEBqHmiCeu4Th7
 9r/ofbpmPazjRaBK/iJuESEyOULKUAGbmlIEFkFr8O4/4jUupueaZ+V0T
 XKgIRO4DY3vf5zpaUybjR4/alF7uffosQjXXwfyvCrpOTXe7rvjt1vzjD
 E1M3yZ1gqhveZIVeHK/7moWa2f9hOA2Ml0bRu0BcZ1b8FOBEt+woGQ5k4
 d9ha+Y4B5O1eRVuZLW9qlEVMsbejfMQFNqCwYfNI+RyVnnZ2Llfn1SfSd w==;
X-CSE-ConnectionGUID: jpecCB5+TtSTmw7Rj1OHqA==
X-CSE-MsgGUID: Bx0PcrDFR1q3tdgHFZygEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58560010"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58560010"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 16:30:38 -0700
X-CSE-ConnectionGUID: 3+sKRajjSOi4x13Qgu2Yww==
X-CSE-MsgGUID: uj2edMJ6TnaHGmzqk4ak1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="169309910"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa009.jf.intel.com with ESMTP; 26 Aug 2025 16:30:37 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: alan.previn.teres.alexis@intel.com, Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH] fixup! drm/xe/guc: Add capture size check in GuC log buffer
Date: Tue, 26 Aug 2025 19:30:35 -0400
Message-Id: <20250826233035.860363-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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

Fixup buffer type value, make buffer types equal to guc_log_buffer_type
in intel_guc_fwif.h.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_log_abi.h | 2 +-
 drivers/gpu/drm/xe/xe_guc_log.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_log_abi.h b/drivers/gpu/drm/xe/abi/guc_log_abi.h
index 554630b7ccd9..b1819679fa35 100644
--- a/drivers/gpu/drm/xe/abi/guc_log_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_log_abi.h
@@ -10,8 +10,8 @@
 
 /* GuC logging buffer types */
 enum guc_log_buffer_type {
-	GUC_LOG_BUFFER_CRASH_DUMP,
 	GUC_LOG_BUFFER_DEBUG,
+	GUC_LOG_BUFFER_CRASH_DUMP,
 	GUC_LOG_BUFFER_CAPTURE,
 };
 
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index c01ccb35dc75..470c83ead543 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -330,7 +330,7 @@ u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_typ
 	enum guc_log_buffer_type i;
 	u32 offset = PAGE_SIZE;/* for the log_buffer_states */
 
-	for (i = GUC_LOG_BUFFER_CRASH_DUMP; i < GUC_LOG_BUFFER_TYPE_MAX; ++i) {
+	for (i = 0; i < GUC_LOG_BUFFER_TYPE_MAX; ++i) {
 		if (i == type)
 			break;
 		offset += xe_guc_get_log_buffer_size(log, i);
-- 
2.34.1

