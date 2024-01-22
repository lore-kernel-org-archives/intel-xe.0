Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980FBC47DDB
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 17:05:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 476A210EC9B;
	Mon, 22 Jan 2024 17:05:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80EC710ECA3
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 17:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705943103; x=1737479103;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P7BKRxL6ubhssquOnxnINpUdYC5XJcBxc9GDC2YkEA4=;
 b=NyBQXDZ4v3gU5oFua1nVaNzGH4ZSJlppkwRJruKPh2nMnRhCw401o0qc
 lsmxkzdPSifHBaA3w9LkXNyJj6cZWRcmyc1Xn4NSwSco8oEtEDDQl4qrC
 QVpPvyEc95VKb1w347ytcyH4uTeRHM+IC9J89UMa4/Yr0/idTxp8agdBT
 XVtMvAvu8gm+7pDsksAySLByxJt3Pxr1Tx0PO3B7hlAxgKZ4iZtyrVtZC
 swyTN7qCXv1qYa4N/m5YSzoUr7LM6rSgPl5cYHbRx1z4X7YaZ+K1wLFul
 bEsEVD5AZs5buU8xdzn5OWH5l6YqNtKajqO/8GcLT9ufkVXxXj2UmQogL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="8020201"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="8020201"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 09:05:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="735228256"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="735228256"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 09:05:00 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/9] drm/xe: Add functions to convert regular address to
 canonical address and back
Date: Mon, 22 Jan 2024 09:04:39 -0800
Message-ID: <20240122170445.108856-3-jose.souza@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122170445.108856-1-jose.souza@intel.com>
References: <20240122170445.108856-1-jose.souza@intel.com>
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
Cc: Maarten Lankhorst <dev@lankhorst.se>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Some instructions requires canonical address like
MI_BATCH_BUFFER_START(UMDs must call xe_exec with a canonical address
for Xe2+).

So here adding functions to convert regular address to canonical
address and back, the first user of this functions will be added
in the next patches.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_device.h |  3 +++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index ab417f4f7d2a7..b4cdcf1b2081a 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -727,3 +727,18 @@ void xe_device_mem_access_put(struct xe_device *xe)
 
 	xe_assert(xe, ref >= 0);
 }
+
+static inline int highest_address_bit_get(struct xe_device *xe)
+{
+	return xe->info.dma_mask_size > 48 ? 57 : 47;
+}
+
+u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address)
+{
+	return sign_extend64(address, highest_address_bit_get(xe));
+}
+
+u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
+{
+	return address & GENMASK_ULL(highest_address_bit_get(xe), 0);
+}
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index af8ac2e9e2709..ce20f6fe6219a 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -175,4 +175,7 @@ static inline bool xe_device_has_memirq(struct xe_device *xe)
 
 u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
 
+u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
+u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
+
 #endif
-- 
2.43.0

