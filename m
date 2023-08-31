Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC754C83F32
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 15:00:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84B8010E68B;
	Thu, 31 Aug 2023 15:00:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5682C10E187
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Aug 2023 15:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693494041; x=1725030041;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xS458A/Ag7vdZE33MbmMTI/QcYE4eRTaBeS18e3IlsU=;
 b=HV8RaBi2EKXo9MvtUERo52e+XTrfM5X6GPKi4w57uVzHhNU5jytkEh5Q
 0l/1NaXzHHUptRnHN2R2dZT4BDgeE0JpEUoRqWidJsqcuNX5e3ogC1Ups
 tnUzdgbBIOxRCEllBooxTfVAj47/qEQt2dqpDA+WmpxzTA7wAFeiI0OPI
 oYqxFZEqTwuDdiTWqLqjsYTaXul5b/A3bpz/cjUiNnyLNgBFcVHUT3jfS
 gjRNGAbrGRtpkkWOYlB0urxFkhm3fW3ziYR40LNu7p9xnEZFWpqGy/VTQ
 NZrD9KNf3f/8D2CXOrtdw2pUjLN0n1a8P93NxDEoAqCRCIdB86Ed0Ord8 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="462334571"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="462334571"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 08:00:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="809667109"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="809667109"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 08:00:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 31 Aug 2023 08:00:47 -0700
Message-Id: <20230831150048.1760018-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230831150048.1760018-1-matthew.brost@intel.com>
References: <20230831150048.1760018-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/4] drm/gpuva: Add drm_gpuva_for_each_op_reverse
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

Xe will make use of this, add helper to walk op list in reverse when
unwinding GPUVA operations.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/drm/drm_gpuva_mgr.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/drm/drm_gpuva_mgr.h b/include/drm/drm_gpuva_mgr.h
index ed8d50200cc3..b2024ae19fd4 100644
--- a/include/drm/drm_gpuva_mgr.h
+++ b/include/drm/drm_gpuva_mgr.h
@@ -557,6 +557,16 @@ struct drm_gpuva_ops {
 #define drm_gpuva_for_each_op_from_reverse(op, ops) \
 	list_for_each_entry_from_reverse(op, &(ops)->list, entry)
 
+/**
+ * drm_gpuva_for_each_op_reverse - iterator to walk over &drm_gpuva_ops in reverse
+ * @op: &drm_gpuva_op to assign in each iteration step
+ * @ops: &drm_gpuva_ops to walk
+ *
+ * This iterator walks over all ops within a given list of operations in reverse
+ */
+#define drm_gpuva_for_each_op_reverse(op, ops) \
+	list_for_each_entry_reverse(op, &(ops)->list, entry)
+
 /**
  * drm_gpuva_first_op() - returns the first &drm_gpuva_op from &drm_gpuva_ops
  * @ops: the &drm_gpuva_ops to get the fist &drm_gpuva_op from
-- 
2.34.1

