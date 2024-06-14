Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD07FC27C6E
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 21:48:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5361A10EE84;
	Fri, 14 Jun 2024 21:48:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="de87lz6a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A121310EE69
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 21:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718401654; x=1749937654;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=9EvT4DZwkVy2p7pfntDSU4LS2Fw+vQ717AJvpUsqUKo=;
 b=de87lz6a077CLu9edhFVpQHX/fCviwxP+V5jOPwdgiNDvAQH7P1yZPZd
 Kmj0XLyt6PAGPn9qo/Ane7ExhRP2PGrw7bSVZxCq7OUtyQZZFLSgw2sLb
 In6/lOhunogVBIqMcH8wQKZcKA5np+ywkJikgxG3c+kdN/mLRNaI+mgnH
 +Z0uI7fa3CQpuF7orULJs0UJq+Yw1X/w5ovXyPiugxBB4VBzjJWid5FGV
 IsGRP3f/jP9wuQC1MPJ/EezmdqkWbR3SPPjUFYsedPkK9C4SqDDFYiUYm
 OfzF+5wbH0DzPsAYLicWyD1lFMKi9BfoMdYM+BSDEt6HT7KOduUsyQtLA w==;
X-CSE-ConnectionGUID: EiLseMDaSo6uRv98iIqYWA==
X-CSE-MsgGUID: QU5E2g9aSbmnYQCyxoHHHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="25886582"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="25886582"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:47:27 -0700
X-CSE-ConnectionGUID: n5pQXanPS9mXPNiFyrv4Zw==
X-CSE-MsgGUID: IGK9yvNPRpOTIi8yiHZbSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="45572418"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:47:28 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 24/44] drm/xe: Add a helper to calculate userptr end address
Date: Fri, 14 Jun 2024 17:57:57 -0400
Message-Id: <20240614215817.1097633-24-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240614215817.1097633-1-oak.zeng@intel.com>
References: <20240614215817.1097633-1-oak.zeng@intel.com>
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

