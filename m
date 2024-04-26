Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A53D1C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 26 Apr 2024 11:11:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42EA51121F6;
	Fri, 26 Apr 2024 11:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EdTDarZ/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F62B1121F6
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Apr 2024 11:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714129896; x=1745665896;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/UcH6J1Q077kdfltwPG03zdFaHuLWpJKTNH7rTy079U=;
 b=EdTDarZ/TT8jU3Gk4cpx3BPvMRXtz/4wDDuKXbT2sXL4CD4JlgsYOmua
 Nt71CHJ6FlrO2H5+5i7KuS/BqZI9mfKgyUMoYS6SLKKI6alPRdjZczPnF
 w6XMTo3vLhS879sNKS7KpUS6c3R4EmjJx5Duf0cZ76i3c1HxWOhkINq1E
 Ej1G1UQEoT0kZ6r+Tn3ciBPvpzY5/4tqBSocNmNXV541/rPyTU9QOLMbV
 slSKURd5HihM3+h7lqIREz/QhWX8xGk+w48JebhTh8coJ0uNEYvX8TIhJ
 xyu3C3ZxdDE0f1UxsocTdbNSrm5bjacLw3WiGtbSHI0dGGnhfhm/wYHOZ A==;
X-CSE-ConnectionGUID: TpagfTCkSJC6g9horSU48A==
X-CSE-MsgGUID: 6RFIZ3soTw6HUwP0L3sLrQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9712817"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="9712817"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 04:11:36 -0700
X-CSE-ConnectionGUID: RjZ0ihKWRfSMze9Un1Awyw==
X-CSE-MsgGUID: cYnBdgDCRRqRlImoq7/p3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="25384216"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 04:11:35 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH v5 4/5] drm/xe: Add function to check if BO has single
 placement
Date: Fri, 26 Apr 2024 12:56:54 +0200
Message-ID: <20240426105655.23738-5-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240426105655.23738-1-nirmoy.das@intel.com>
References: <20240426105655.23738-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

A new helper function xe_bo_has_single_placement() to check
if a BO has single placement.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_bo.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index bc1f794e3e61..37df8c5aa707 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -95,6 +95,20 @@ bool xe_bo_is_stolen(struct xe_bo *bo)
 	return bo->ttm.resource->mem_type == XE_PL_STOLEN;
 }
 
+/**
+ * xe_bo_has_single_placement - check if BO is placed only in one memory location
+ * @bo: The BO
+ *
+ * This function checks whether a given BO is placed in only one memory location.
+ *
+ * Returns: true if the BO is placed in a single memory location, false otherwise.
+ *
+ */
+bool xe_bo_has_single_placement(struct xe_bo *bo)
+{
+	return bo->placement.num_placement == 1;
+}
+
 /**
  * xe_bo_is_stolen_devmem - check if BO is of stolen type accessed via PCI BAR
  * @bo: The BO
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index a885b14bf595..6de894c728f5 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -206,6 +206,7 @@ bool mem_type_is_vram(u32 mem_type);
 bool xe_bo_is_vram(struct xe_bo *bo);
 bool xe_bo_is_stolen(struct xe_bo *bo);
 bool xe_bo_is_stolen_devmem(struct xe_bo *bo);
+bool xe_bo_has_single_placement(struct xe_bo *bo);
 uint64_t vram_region_gpu_offset(struct ttm_resource *res);
 
 bool xe_bo_can_migrate(struct xe_bo *bo, u32 mem_type);
-- 
2.42.0

