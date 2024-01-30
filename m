Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73907C48285
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jan 2024 13:57:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9866610F389;
	Tue, 30 Jan 2024 13:56:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C344D10F389
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jan 2024 13:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706623014; x=1738159014;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=A3Er6K780wszFly3oHVGX8e5L+Z9I7jGd8rdtMC9Rw4=;
 b=QTsnBj2A62TVTB4JnbKA93XGgECek4nTWMh3VXzuinQs/jUbCDvaAy/c
 7dXbV70LPmY8Cl6YlO7AzXYz1T2TCgPAKNtSN5GOEabtHd3C2f9qQ+6oQ
 QvyTcmaSlAgSnvG7Iha0hZc/qZZrL9jcFIl5WsoJy73CYsRW4YzUFdexs
 Ob0R56f5A2Hzv7vd01BL69vtuLjQcgLaz42XcuaTXPT8EUIDlFb2aqBhX
 PtY+MpY4J39mjilqdawrmCZDwT72rUlD+n8VsVXyZ3s3BG45UTv4TKvuj
 oBcA4/Nv4LF59YJWAzHeEsTwyUFkm0fmY+uEmsEQYaR1cla59XFISL5W+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="400422282"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; d="scan'208";a="400422282"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 05:56:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; d="scan'208";a="22437364"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 05:56:52 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 1/2] drm/xe: Add functions to convert regular address to
 canonical address and back
Date: Tue, 30 Jan 2024 05:56:47 -0800
Message-ID: <20240130135648.30211-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.43.0
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
Cc: Jani Nikula <jani.nikula@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>, Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Some instructions requires canonical address like
MI_BATCH_BUFFER_START(UMDs must call xe_exec with a canonical address
for Xe2+).

So here adding functions to convert regular address to canonical
address and back, the first user of this functions will be added
in the next patch.

v3:
- inline removed
- rename highest_address_bit_get() to ppgtt_msb_get()

v4:
- use xe->info.va_bits instead of xe->info.dma_mask_size

BSpec: 47626
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 10 ++++++++++
 drivers/gpu/drm/xe/xe_device.h |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 6faa7865b1aab..8e8567e06f0bc 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -747,3 +747,13 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p)
 		drm_printf(p, "\tCS reference clock: %u\n", gt->info.reference_clock);
 	}
 }
+
+u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address)
+{
+	return sign_extend64(address, xe->info.va_bits - 1);
+}
+
+u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
+{
+	return address & GENMASK_ULL(xe->info.va_bits - 1, 0);
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

