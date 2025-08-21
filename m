Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE3BCA0EF8
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 11:46:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0B5310E94E;
	Thu, 21 Aug 2025 11:46:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P6p/ayHK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83CB10E949;
 Thu, 21 Aug 2025 11:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755776816; x=1787312816;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zG9D5IJGziXZh5X5/ZDBlNBPklZZ3+iRqN2cmyda1XA=;
 b=P6p/ayHKWIOsGsiiZs0/jFO2i9hCmWlVCsaeIntVpBXoa7S3o+a79Zmn
 2mJjvtrl560bx2HKyxrFRB40lVhg95KMXQSIgwof4sbPkUG1M95OyujdR
 67ltos0SwsFipaU5ysVHlv0eYafPSdpMqImT/JLrtr44NzICKx9G/xJRL
 v171mt1K+NH4+lKthwBaTgyXTwiT/H+MAKbxbS4grAulke83nTJXRWDAa
 7Gw7cII3AUHQik6yNXN4QnE7ep/GcVmh0UAUEN6K4lDQaT4gh1OPrF3+m
 27CHbTMYe+GzFVnrQ/r8molb6gAuFk6rQm7Aopuvlr8sJrDa/xgUeBGQl Q==;
X-CSE-ConnectionGUID: qG6916M7QRmyRCdsXmFHPg==
X-CSE-MsgGUID: /MuCpYigStOm1+wW3pXgQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57989465"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="57989465"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 04:46:56 -0700
X-CSE-ConnectionGUID: qdZ++VWhTXucPh8rN3toAg==
X-CSE-MsgGUID: 4lMvbybTQVaYaBlBGfqb/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="172613641"
Received: from johunt-mobl9.ger.corp.intel.com (HELO fedora) ([10.245.245.201])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 04:46:53 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Andrew Morton <akpm@linux-foundation.org>,
 Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] drm/gpusvm: Add drm_gpusvm_in_notifier_* helpers
Date: Thu, 21 Aug 2025 13:46:23 +0200
Message-ID: <20250821114626.89818-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821114626.89818-1-thomas.hellstrom@linux.intel.com>
References: <20250821114626.89818-1-thomas.hellstrom@linux.intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

Abstract drm_gpusvm_in_notifier_lock/unlock with helpers. Intended usage
is a client side 2nd pass of a MMU notifier.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/drm/drm_gpusvm.h | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
index 48b90c44849b..eb3f5f9396e2 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -313,7 +313,7 @@ void drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range *range,
 #endif
 
 /**
- * drm_gpusvm_notifier_lock() - Lock GPU SVM notifier
+ * drm_gpusvm_notifier_lock() - Lock GPU SVM notifier, client side
  * @gpusvm__: Pointer to the GPU SVM structure.
  *
  * Abstract client usage GPU SVM notifier lock, take lock
@@ -322,7 +322,7 @@ void drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range *range,
 	down_read(&(gpusvm__)->notifier_lock)
 
 /**
- * drm_gpusvm_notifier_unlock() - Unlock GPU SVM notifier
+ * drm_gpusvm_notifier_unlock() - Unlock GPU SVM notifier, client side
  * @gpusvm__: Pointer to the GPU SVM structure.
  *
  * Abstract client usage GPU SVM notifier lock, drop lock
@@ -330,6 +330,24 @@ void drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range *range,
 #define drm_gpusvm_notifier_unlock(gpusvm__)	\
 	up_read(&(gpusvm__)->notifier_lock)
 
+/**
+ * drm_gpusvm_in_notifier_lock() - Lock GPU SVM notifier, in notifier
+ * @gpusvm__: Pointer to the GPU SVM structure.
+ *
+ * Abstract in notifier (2nd pass) usage GPU SVM notifier lock, take lock
+ */
+#define drm_gpusvm_in_notifier_lock(gpusvm__)	\
+	down_write(&(gpusvm__)->notifier_lock)
+
+/**
+ * drm_gpusvm_in_notifier_unlock() - Unlock GPU SVM notifier, in notifier
+ * @gpusvm__: Pointer to the GPU SVM structure.
+ *
+ * Abstract in notifier (2nd pass) GPU SVM notifier lock, drop lock
+ */
+#define drm_gpusvm_in_notifier_unlock(gpusvm__)	\
+	up_write(&(gpusvm__)->notifier_lock)
+
 /**
  * drm_gpusvm_range_start() - GPU SVM range start address
  * @range: Pointer to the GPU SVM range
-- 
2.50.1

