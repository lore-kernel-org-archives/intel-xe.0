Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E0CC46CD2
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 21:17:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7933210EF6F;
	Mon, 22 Jan 2024 21:17:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB2A10EBBE
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 21:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705958242; x=1737494242;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fTx9q+yJzXR/G86bUMwcQivdEPU7/LW32y+u7tQ9AGI=;
 b=i2Lf7y6KORaC78bdFUycb8VmXgyxJ7g3hl92Tt/+hrCJMD1I/C2lQU6I
 xvQ/LwXWr31uwV2MO6hp0yPo78Ikt3gmiBVtcqVVA9nTYg8tIp9rFiusw
 rNm/QFFWAT3I+4owTsxpM7DGvdAacJGg4YVSgk+XOJKvdP5114Peei4T9
 nimXN3yfdrCR2FUfqqhQf3opIU2fvGE0LyKj/Nbi02onlsWKbTXyGhYZl
 hlUawb+2ufD5sPk3ht7xmLMWqTZ+thveVvUApThJU7vatYP5OT/XycNSu
 1DyoUVQIVY+wVHIDRGQ1mOMiAVrocMfQIhlZ1qh+VJpsWb7Eb614Hd5V1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="432486549"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="432486549"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 13:17:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="27495059"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 13:17:20 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 3/9] drm/xe: Add functions to convert regular address to
 canonical address and back
Date: Mon, 22 Jan 2024 13:17:03 -0800
Message-ID: <20240122211709.224419-3-jose.souza@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122211709.224419-1-jose.souza@intel.com>
References: <20240122211709.224419-1-jose.souza@intel.com>
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
Cc: Stuart Summers <stuart.summers@intel.com>
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

