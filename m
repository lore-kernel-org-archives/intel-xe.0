Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554A8C87FCA
	for <intel-xe@archiver.kernel.org>; Thu,  7 Aug 2025 16:17:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DB5210E886;
	Thu,  7 Aug 2025 16:17:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="grO49euO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E4E210E88B
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Aug 2025 16:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754583428; x=1786119428;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MT3SE+BBfKbqGREwE5NkH40yAMeKRzLiRlngmmeI4I4=;
 b=grO49euOrlz0ON6/Smr9MNmRsT4CfRnB5valDW1tOOqMTxVw+Ed/gTcB
 b3qzRgD7OeE8G+/GN9o7X5Ju/c/JOkGSHMGEkdPIww0XNhmgAD0iIcf6L
 eK83NNDHeYr5QIoqtLa/E3SdXJ63/r8OXXh6siJmpQmpoYkeGRmCe5hYI
 unF28WasrjqtoSJpw0y9veP5ncI3bXFOm2964N2vjKldf+GHYJIeD1J5A
 kwGGsyVEniLB/Ahb2OgQzw6ATErvtbDnnz18QDBB7HYqmb3lAaiBY3HcF
 Q2313pRi+gpjB3CIjzuMqVQSePr4a7DIDFUtxVWCgN6XcsIsLlmII29Tv w==;
X-CSE-ConnectionGUID: WrK1T9bnQ8aHY/NZBWHNYA==
X-CSE-MsgGUID: Ytv06B0rRJSYO0xwQhQPLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56845605"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="56845605"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 09:17:08 -0700
X-CSE-ConnectionGUID: jlLrYMIZRau0XdLQFwtl2g==
X-CSE-MsgGUID: inISZCHMQROG6pVIZ65icw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="195937874"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa001.fm.intel.com with ESMTP; 07 Aug 2025 09:17:06 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v6 16/26] drm/xe/pat: Add helper for compression mode of pat
 index
Date: Thu,  7 Aug 2025 22:13:28 +0530
Message-Id: <20250807164338.1832254-17-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250807164338.1832254-1-himal.prasad.ghimiray@intel.com>
References: <20250807164338.1832254-1-himal.prasad.ghimiray@intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

Add `xe_pat_index_get_comp_mode()` to extract compression mode from a
PAT index.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 10 ++++++++++
 drivers/gpu/drm/xe/xe_pat.h | 10 ++++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 2e7cb99ae87a..ac1767c812aa 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -154,6 +154,16 @@ static const struct xe_pat_table_entry xe2_pat_table[] = {
 static const struct xe_pat_table_entry xe2_pat_ats = XE2_PAT( 0, 0, 0, 0, 3, 3 );
 static const struct xe_pat_table_entry xe2_pat_pta = XE2_PAT( 0, 0, 0, 0, 3, 0 );
 
+bool xe_pat_index_get_comp_mode(struct xe_device *xe, u16 pat_index)
+{
+	WARN_ON(pat_index >= xe->pat.n_entries);
+
+	if (xe->pat.table != xe2_pat_table)
+		return false;
+
+	return xe->pat.table[pat_index].value & XE2_COMP_EN;
+}
+
 u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)
 {
 	WARN_ON(pat_index >= xe->pat.n_entries);
diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
index fa0dfbe525cd..8be2856a73af 100644
--- a/drivers/gpu/drm/xe/xe_pat.h
+++ b/drivers/gpu/drm/xe/xe_pat.h
@@ -58,4 +58,14 @@ void xe_pat_dump(struct xe_gt *gt, struct drm_printer *p);
  */
 u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index);
 
+/**
+ * xe_pat_index_get_comp_mode() = Extract the compression mode for the given
+ * pat_index.
+ * @xe: xe device
+ * @pat_index: The pat_index to query
+ *
+ * Return: True if pat_index is compressed, False otherwise
+ */
+bool xe_pat_index_get_comp_mode(struct xe_device *xe, u16 pat_index);
+
 #endif
-- 
2.34.1

