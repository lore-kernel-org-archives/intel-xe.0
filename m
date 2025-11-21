Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2946CFA478
	for <intel-xe@archiver.kernel.org>; Fri, 21 Nov 2025 03:52:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 767D910E7F4;
	Fri, 21 Nov 2025 03:52:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bY+/PkdM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A3A10E7E5
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Nov 2025 03:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763697143; x=1795233143;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WME7FvSxyXBcWHW4kJm/AWfWivSrIUyr6c7409yD9V0=;
 b=bY+/PkdMcWsPL+n9P45Y4AgnQ+jxFBG6td0Br41vHhB1nF6MZmuRE0OH
 wF0WkXaX+KRmCz4ywO/mYiyvESzUNCqlqCsamWYRWNxg1zmXYOuEHB0Sx
 7pcfBdKkM+1ARZjp6gsqIpIMbNWPhtKeDS/T1sTTi4RLwMvLwZ8+UDDxi
 czGt9hB0o9SfrdtYJPKVID9WLdXNoqItwsFMiwyb7wU1ji6SfLTUcvtQW
 OnUlGKwKYrbe2Mdz/iacITuQmupYDB5Wg3RWnhubbcDIf+PjDnekfLkby
 L792Ab06O59SQMhsS14b9EhRKDFSY9ZImqSdBESTpGKVMSIIbcmj6/eks A==;
X-CSE-ConnectionGUID: aoFuTejVSb2hzoNnLyKTLw==
X-CSE-MsgGUID: 5M0qx5rQTSS4a6BrZ/58lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="76110547"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="76110547"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 19:52:23 -0800
X-CSE-ConnectionGUID: uPp9INwFRt6K0FkuUqjXhw==
X-CSE-MsgGUID: pjfmewxKRc6MRNdYmMLixQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="190857842"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 19:52:22 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH v3 18/18] drm/xe/multi_queue: Enable multi_queue on xe3p_xpc
Date: Thu, 20 Nov 2025 19:51:52 -0800
Message-ID: <20251121035147.766072-38-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121035147.766072-20-niranjana.vishwanathapura@intel.com>
References: <20251121035147.766072-20-niranjana.vishwanathapura@intel.com>
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

xe3p_xpc supports multi_queue, enable it.

v2: Rename multi_queue_enable_mask to multi_queue_engine_class_mask
    (Matt Brost)

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index f9464398e3ea..5c703b0db6f3 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -111,6 +111,8 @@ static const struct xe_graphics_desc graphics_xe3p_xpc = {
 	.hw_engine_mask =
 		GENMASK(XE_HW_ENGINE_BCS8, XE_HW_ENGINE_BCS1) |
 		GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0),
+	.multi_queue_engine_class_mask = BIT(XE_ENGINE_CLASS_COPY) |
+					 BIT(XE_ENGINE_CLASS_COMPUTE),
 };
 
 static const struct xe_media_desc media_xem = {
-- 
2.43.0

