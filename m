Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43258C27C79
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 04:14:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE56710E966;
	Thu, 13 Jun 2024 04:14:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CWsgsAP3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8182A10E102
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 04:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718252030; x=1749788030;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=9EvT4DZwkVy2p7pfntDSU4LS2Fw+vQ717AJvpUsqUKo=;
 b=CWsgsAP3/+KpGyxTe6axYC+67Gux1S2P+7cptF1lmfqhc6UZXS/ldcnT
 UNN/Apau66XwqlgFN5pqPuZn6tpYXg7m38+zscu/jqwcTJEez/i1GCRth
 3YMQjIlNRJt29WQ1QMkWW7p76GF1MCimmmRBHmw2iFvnq+7WT4L0jjQbQ
 xZDKfwv/IoBqaYX3tr1pIjPGdo4Cqb8MpwN7TbTF//nQZFqfwou0tFvyh
 K6TbjdJTxLPyjJDvL4wOhRgOU3Gk+12Eg4r5jHrg25US/oWxtN+QVfzHC
 mMXN3MjTM0432XUCxNRiJjoQEimHICa91+HGhbaFfzfM5ROBE3VWT7vHm A==;
X-CSE-ConnectionGUID: JuB60wDSSxeFGxwYfEBFpg==
X-CSE-MsgGUID: uTuTm03CTpuEJu+x6kycsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14847973"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="14847973"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 21:13:48 -0700
X-CSE-ConnectionGUID: ibuTTOa5RAin9lxF8cLmGg==
X-CSE-MsgGUID: VFQiSRCFTKy3hVdnumePbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40476343"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 21:13:48 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 22/42] drm/xe: Add a helper to calculate userptr end address
Date: Thu, 13 Jun 2024 00:24:09 -0400
Message-Id: <20240613042429.637281-22-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240613042429.637281-1-oak.zeng@intel.com>
References: <20240613042429.637281-1-oak.zeng@intel.com>
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

