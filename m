Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00906C46CD2
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 11:24:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7FB210E424;
	Tue,  9 Jan 2024 11:24:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7196D10E424
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 11:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704799482; x=1736335482;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9AVnlMxHAoZWu78Mt1MsdzC5Hkr7b/7wiXE/qtZcvdI=;
 b=aAZqPeoQne943Qof9GoVjGHppP40vPt1JglTzIymU/pEjV7eoHSUTddb
 GR+fHS2UfkgTrjAYNil/6qeAPw9FYh1qLIC/qefwgQ6EFYBuG01sHnTsE
 5LF/paIJcyBDmc1Q101nLmBHqQe67eKG4ROLPWF7VZHBRwjL5zGS7vNag
 Gt+RJycoGQtLDTPA4WSzseAe6cvF7Of1DLm/0QMXaShwdy9mfYVtXiY4S
 dj+PQ82AXyap6BF+fWy0RoxnkztvB4erKyMMw/JKzjuhUBolpNXMmt9OM
 a4xIUB/HvjVRhJuCYxqn5eqvfQ6XKmsV7cj761ldfcydpFH2F5NKA1iVf A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5537247"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="5537247"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 03:24:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="900737630"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; d="scan'208";a="900737630"
Received: from djustese-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.147])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 03:24:32 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/4] drm/xe: Annotate multiple mmio pointers with __iomem
Date: Tue,  9 Jan 2024 12:24:04 +0100
Message-ID: <20240109112405.108136-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240109112405.108136-1-thomas.hellstrom@linux.intel.com>
References: <20240109112405.108136-1-thomas.hellstrom@linux.intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Moti Haimovski <mhaimovski@habana.ai>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

There are a couple of pointers pointing to MMIO space. Annotate them
with __iomem and fix the corresponding sparse warnings.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Fixes: 3b0d4a557996 ("drm/xe: Move register MMIO into xe_tile")
Fixes: 399a13323f0d ("drm/xe: add 28-bit address support in struct xe_reg")
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Koby Elbaz <kelbaz@habana.ai>
Cc: Ofir Bitton <obitton@habana.ai>
Cc: Moti Haimovski <mhaimovski@habana.ai>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 171e8615d184..e0da2e3ca426 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -147,7 +147,7 @@ struct xe_tile {
 		size_t size;
 
 		/** @regs: pointer to tile's MMIO space (starting with registers) */
-		void *regs;
+		void __iomem *regs;
 	} mmio;
 
 	/**
@@ -160,7 +160,7 @@ struct xe_tile {
 		size_t size;
 
 		/** @regs: pointer to tile's additional MMIO-extension space */
-		void *regs;
+		void __iomem *regs;
 	} mmio_ext;
 
 	/** @mem: memory management info for tile */
@@ -306,7 +306,7 @@ struct xe_device {
 		/** @size: size of MMIO space for device */
 		size_t size;
 		/** @regs: pointer to MMIO space for device */
-		void *regs;
+		void __iomem *regs;
 	} mmio;
 
 	/** @mem: memory info for device */
-- 
2.43.0

