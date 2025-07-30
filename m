Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5408C87FCC
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 12:34:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D2010E699;
	Wed, 30 Jul 2025 12:34:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ixVlfj3H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BAD710E694
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 12:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753878873; x=1785414873;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7r9gEQexUSkNnFM93yYxPeYXvNoHNtIxlWIWe8oDCi8=;
 b=ixVlfj3Ho63h53dGrKAeOB/yuGTJElYvaDRxnFS+s9L5OS9ftSL8yHph
 bsTEbkS72TDAw8El1c/fH8/+XYinNEwtcKbfidWfoA+ZCHwHmwiQS0HkP
 lgo1hZMowz/qWkbVfOQbCfNJDtRzYDj2UDYVRtVVhsBb+GCe/xL+kgENU
 dbFKrMLYgzLu6ieabonrIVdiGM2oekc2iI8fOU5dmSklwx6afeWPLDMNB
 rn5s3fLOKEUW2KY2z+O4nn1PGfGaG7l/9C7Cedtg11YYY71alTgl53cLv
 JAzthHQFRdcuELtCKPoWZU8KtMwCFVjNbYumvTXNv3lFmFOhguDv/RGco w==;
X-CSE-ConnectionGUID: OsnyYyxWQdWq6tYun5caxA==
X-CSE-MsgGUID: MQY93QFsRlihiYKBzqcFHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="66450176"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="66450176"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 05:34:33 -0700
X-CSE-ConnectionGUID: LGzyhJdkRTqL+lXS7tl/4g==
X-CSE-MsgGUID: KecU4TcwS4+hBbwzcQmOCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="186649506"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa002.fm.intel.com with ESMTP; 30 Jul 2025 05:34:32 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v5 19/25] drm/xe/bo: Add attributes field to xe_bo
Date: Wed, 30 Jul 2025 18:30:44 +0530
Message-Id: <20250730130050.1001648-20-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
References: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
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

A single BO can be linked to multiple VMAs, making VMA attributes
insufficient for determining the placement and PTE update attributes
of the BO. To address this, an attributes field has been added to the
BO.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo_types.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index cf604adc13a3..314652afdca7 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -61,6 +61,14 @@ struct xe_bo {
 	 */
 	struct list_head client_link;
 #endif
+	/** @attr: User controlled attributes for bo */
+	struct {
+		/**
+		 * @atomic_access: type of atomic access bo needs
+		 * protected by bo dma-resv lock
+		 */
+		u32 atomic_access;
+	} attr;
 	/**
 	 * @pxp_key_instance: PXP key instance this BO was created against. A
 	 * 0 in this variable indicates that the BO does not use PXP encryption.
-- 
2.34.1

