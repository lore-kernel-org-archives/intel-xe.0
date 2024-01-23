Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CDD8C47258
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 20:45:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E0B710E5D3;
	Tue, 23 Jan 2024 20:45:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC77510E617
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jan 2024 20:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706042717; x=1737578717;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q7y1jcLQr3zkUnsD6AdY46QtpI9RiZovc49jjIRcBVE=;
 b=Zg8ghQpQCRspaQ3Olig+O1D7xy6Jrf7pIMy6/R4MN1xzBiqPzUXNW7El
 JVD6iNkrS9AAUil9QUnkTNIlFzBu4JeL0nHz6W2kODMB7aT2WCVdcWA8p
 0mWb+mJ+Qj2baHgZTcBY6HTazgXlEU84SyFJOAe6DlbwgYjNx+ZcKNnzb
 zlp7LHgg2DUwchvBf88/hd6qxfUAyuEM0yCEYCnkExjLORO2VJWGYegAX
 xr6aYgcRTYdN8xWDbkZhIoRjcSol9eBjnds0NX0yJwQKCf3htTxSdxJFl
 JSapb5EDTlrCkAlUP4ETBDylzIQiS36LAEig6G5w4+3aT3s4q/R2VWM0o A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8319877"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="8319877"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 12:45:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="909421988"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="909421988"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 12:45:14 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 8/9] drm/xe: Add functions to convert regular address to
 canonical address and back
Date: Tue, 23 Jan 2024 12:44:53 -0800
Message-ID: <20240123204454.246788-8-jose.souza@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240123204454.246788-1-jose.souza@intel.com>
References: <20240123204454.246788-1-jose.souza@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, Maarten Lankhorst <dev@lankhorst.se>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Some instructions requires canonical address like
MI_BATCH_BUFFER_START(UMDs must call xe_exec with a canonical address
for Xe2+).

So here adding functions to convert regular address to canonical
address and back, the first user of this functions will be added
in the next patches.

v3:
- inline removed from highest_address_bit_get()

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_device.h |  3 +++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 6faa7865b1aab..c830da883732c 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -747,3 +747,18 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p)
 		drm_printf(p, "\tCS reference clock: %u\n", gt->info.reference_clock);
 	}
 }
+
+static int highest_address_bit_get(struct xe_device *xe)
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
index 270124da1e00e..462f59e902b12 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -177,4 +177,7 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
 
 void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
 
+u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
+u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
+
 #endif
-- 
2.43.0

