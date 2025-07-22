Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 024FBC83F1A
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 13:09:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE00210E698;
	Tue, 22 Jul 2025 13:09:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ia8XLsFM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D3F10E67B
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Jul 2025 13:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753189750; x=1784725750;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qr6VTnm+/L1hIX9vtGBDhS3j8tAEdQMToYQUVDn/4II=;
 b=Ia8XLsFM28nvo2eFJFPKveLKsyjui6x5ghY1+WvcDSHJdGWWei8UJpJ/
 IdbExKpSEycifIVzcxBW+LhhD50hoeQ2f0snPbxAZDUvX5m0pA/K+Uahb
 TGRixMbiv/jLzID2Vsr4wZKXaqKrVFA+MYeauyYaq1Jc+pFnbWnvHu2kQ
 B+oK5LgfjZibl0E/TeFy21aV+9AYyuA4hfWWL0bkUk+Ol132zsrGQWMTK
 T2UISIK/IxiFEeCF1G9pxioX4tPRegLF1tkQOk4OmIf2l5a8hBwjdcVke
 3KXEn4pmdRRPC9VRGsHzujKviPJZM1ECCXUdeZ9mhxDQpmja/GnVnVWU9 g==;
X-CSE-ConnectionGUID: kyPkW9miSZGKGpE26ZzOjA==
X-CSE-MsgGUID: I1piX1EnQAehFAo07z7vng==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55530392"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="55530392"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 06:09:10 -0700
X-CSE-ConnectionGUID: eUgPXjrUTBGo4pmx9KGmvA==
X-CSE-MsgGUID: mq7tQpHJTmKFlfYtVhWf8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="163420670"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa005.fm.intel.com with ESMTP; 22 Jul 2025 06:09:09 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v5 16/23] drm/xe/bo: Add attributes field to xe_bo
Date: Tue, 22 Jul 2025 19:05:19 +0530
Message-Id: <20250722133526.3550547-17-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
References: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
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
index ff560d82496f..ad6bc01386d4 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -60,6 +60,14 @@ struct xe_bo {
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

