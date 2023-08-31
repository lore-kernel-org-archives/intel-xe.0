Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 975C2C83F2E
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 15:00:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5552D10E0C1;
	Thu, 31 Aug 2023 15:00:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F419B10E0C1
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Aug 2023 15:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693494040; x=1725030040;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o+e0Bz8umsmfuL30CD2l3lM3FLqQ3iCIY2XvRjSnCvA=;
 b=BqVV4LN9XMkbPnAztvAONf6HzzC8I8oWiPhrz4uEWptvr/AaAlogr7wC
 Mb5C9PxBIfJFQREYKCVKjBHhva74sIXKKtdZwpW2FA8nNj0EwKDDVVwtV
 6kc055AljVeLFzBcCDWfx05KUhJM0p+XDvKKmM+PeeSi4PPGxw9pV+ufk
 IHmGaSCIJkzk6ZWspg7wdEG+GNv6jfFWCjR3/RZrDOIgTV2JBJgenNELA
 e+h38f24NMVKP1mooR665hzp+J4qNrl/A7b0dq1aJANlZ329PjfrlBVdi
 d+jiqQPvlXw420MDXCp0QrPoox2QWziCHzrtol4kZ7bQp+0r1kBuwC+pC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="462334569"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="462334569"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 08:00:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="809667085"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="809667085"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 08:00:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 31 Aug 2023 08:00:45 -0700
Message-Id: <20230831150048.1760018-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230831150048.1760018-1-matthew.brost@intel.com>
References: <20230831150048.1760018-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/4] drm/xe: Covert xe_vma_op_flags to BIT macros
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

Rather than open code the shift for values, use BIT macros.

Signed-of-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_types.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 3681a5ff588b..4bcb54ccd93a 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -377,11 +377,11 @@ struct xe_vma_op_prefetch {
 /** enum xe_vma_op_flags - flags for VMA operation */
 enum xe_vma_op_flags {
 	/** @XE_VMA_OP_FIRST: first VMA operation for a set of syncs */
-	XE_VMA_OP_FIRST		= (0x1 << 0),
+	XE_VMA_OP_FIRST		= BIT(0),
 	/** @XE_VMA_OP_LAST: last VMA operation for a set of syncs */
-	XE_VMA_OP_LAST		= (0x1 << 1),
+	XE_VMA_OP_LAST		= BIT(1),
 	/** @XE_VMA_OP_COMMITTED: VMA operation committed */
-	XE_VMA_OP_COMMITTED	= (0x1 << 2),
+	XE_VMA_OP_COMMITTED	= BIT(2),
 };
 
 /** struct xe_vma_op - VMA operation */
-- 
2.34.1

