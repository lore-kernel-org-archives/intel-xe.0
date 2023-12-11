Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B061AC4167B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 13:34:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE0810E403;
	Mon, 11 Dec 2023 13:34:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC4110E3F9
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 13:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702301668; x=1733837668;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CbRRY+dEsDurTdmDJgYpTiGIZVgY39Tdw5MxZiOhoFE=;
 b=Rhovd9tuKzMdYRxCkf7no97SdrdOMiLlBdUfbQaWEizA3U27am8fn8/i
 MneN2ptQ4WsTeAr0BZzMh6AT8g99T1s28JHVG8LoMQi9MOq49LHAPTnN0
 omPBE6pUd/CVjn1/2mMGreE0Ali+J3y0Sn1ZJuYYVIUvhjsSqkSg0umgl
 cqrOtppxWQfQP/j2lBdD29Tsa+a5g3hI+XlEnXOCXVzrWF9WLgQTX7Tyf
 aJN3jIUMV+KGWShd71AGWC/onMACtaJ2ZhQdVCCMNoiItnIr3njp5N/V1
 2I5BFIt+SXlJPP8ZHMhwd0+aFHBsM2RsS6B6q/dlV0DAGogAcJQKqJJal A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="461126586"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="461126586"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 05:33:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="722788041"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="722788041"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga003.jf.intel.com with ESMTP; 11 Dec 2023 05:33:36 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v7 02/10] drm/xe/xe2: Modify main memory to ccs memory ratio.
Date: Mon, 11 Dec 2023 19:11:15 +0530
Message-Id: <20231211134123.1645793-3-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211134123.1645793-1-himal.prasad.ghimiray@intel.com>
References: <20231211134123.1645793-1-himal.prasad.ghimiray@intel.com>
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On xe2 platforms each byte of CCS data now represents 512 bytes of
main memory data.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gpu_commands.h | 2 +-
 drivers/gpu/drm/xe/xe_device.c            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
index f1c5bf203b3d..1f9c32e694c6 100644
--- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
+++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
@@ -16,7 +16,7 @@
 #define   XY_CTRL_SURF_MOCS_MASK	GENMASK(31, 26)
 #define   XE2_XY_CTRL_SURF_MOCS_INDEX_MASK	GENMASK(31, 28)
 #define   NUM_CCS_BYTES_PER_BLOCK	256
-#define   NUM_BYTES_PER_CCS_BYTE	256
+#define   NUM_BYTES_PER_CCS_BYTE(_xe)	(GRAPHICS_VER(_xe) >= 20 ? 512 : 256)
 #define   NUM_CCS_BLKS_PER_XFER		1024
 
 #define XY_FAST_COLOR_BLT_CMD		(2 << 29 | 0x44 << 22)
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 91f5807d2d20..f8e1b809f944 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -615,7 +615,7 @@ void xe_device_wmb(struct xe_device *xe)
 u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
 {
 	return xe_device_has_flat_ccs(xe) ?
-		DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE) : 0;
+		DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE(xe)) : 0;
 }
 
 bool xe_device_mem_access_ongoing(struct xe_device *xe)
-- 
2.25.1

