Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1DD8C2BA15
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 02:15:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5072010E773;
	Wed, 12 Jun 2024 02:15:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XZ7u3XG1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F68310E771
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 02:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718158540; x=1749694540;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=9EvT4DZwkVy2p7pfntDSU4LS2Fw+vQ717AJvpUsqUKo=;
 b=XZ7u3XG1Seu4WG5BKHnG7lEbzfl4cYpJbLNgPb2yPL6MymZ1QbTr/lZ7
 ZnJy0JtTgSvmN7DIxkEdz6+hsUSnkqkzSHJlDXUgHjIMRJG8Vr9iVN0r6
 hgsnZqyae4MQp5bJQGbDxKaXlHIqwWrzAk/+pq7Tqo8swPhAFY2GxkGDg
 oiWoH3SR8Fo0G6s66R0uNKAh3i1v45psVTHEkpFL/01IHPREqVPQxrcOW
 i7FkCI7hKVOG52NXb7mDq5CHdiy5pGe73lToydxJ+InAIKen2nlYLI+BB
 2Zqszlm4JWR6j/c/ItGMHfaKouVrmmsAjkoBzZxcEdaZqHK6AZr2fv4vQ A==;
X-CSE-ConnectionGUID: HF8R03JGSD6LEcYACCqSYw==
X-CSE-MsgGUID: JQ4N6TVqSfGM6Ft6M7W7qQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="37427806"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="37427806"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 19:15:27 -0700
X-CSE-ConnectionGUID: lcwgc0OPTPmeg9YRPR4/Kw==
X-CSE-MsgGUID: y3EzJBJrQ9Ob4NVxmFsrPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="44763640"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 19:15:27 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 23/43] drm/xe: Add a helper to calculate userptr end address
Date: Tue, 11 Jun 2024 22:25:45 -0400
Message-Id: <20240612022605.385062-23-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240612022605.385062-1-oak.zeng@intel.com>
References: <20240612022605.385062-1-oak.zeng@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

xe_vma_userptr_end is added to calculate a userptr end.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 1a5aed678214..89f3306561ad 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -146,6 +146,11 @@ static inline u64 xe_vma_userptr(struct xe_vma *vma)
 	return vma->gpuva.gem.offset;
 }
 
+static inline u64 xe_vma_userptr_end(struct xe_vma *vma)
+{
+	return vma->gpuva.gem.offset + xe_vma_size(vma);
+}
+
 static inline bool xe_vma_is_null(struct xe_vma *vma)
 {
 	return vma->gpuva.flags & DRM_GPUVA_SPARSE;
-- 
2.26.3

