Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1857DC87FCB
	for <intel-xe@archiver.kernel.org>; Sat,  9 Aug 2025 13:52:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44D910E2DD;
	Sat,  9 Aug 2025 13:52:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZKrliwjS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C4F110E2D6;
 Sat,  9 Aug 2025 13:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754747539; x=1786283539;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F1Va4a7oL3sStdI3GcwWNaFyPom4HkNAVRRrhM+iPZs=;
 b=ZKrliwjSMqhQXrECsMFuVhRW05yTv0n1j62GSsC31hnzIPF83h6fiHzK
 weDaZ1/MdIsFxHVVEFlztTPmgJG3oWvAxLQ1zCEubugYbV9Ifi2eMqlWs
 0TKsTw/9OmJmRD9nlM/aQo5B/Q7+VnjqXP8C3CPzgDMtYn+R9b8+dtvOW
 NsnP9EX2Sxa4L4lLBdCPSYilxVkGJxk6eyg/mfaXknlpQ7e/G5sEqECRa
 V3FWCWcJGxMfEC3/YSAul2qkqxQwQip3tHa9v/Z606nizFxlpzF08CBdZ
 vSGGnoYZx57Ls8Cz7wLdL65YVGUBXTbZo2QmojcwFJNyTqpUdzppS2X9E A==;
X-CSE-ConnectionGUID: nUn0C6QHQsem6IDunAPDnQ==
X-CSE-MsgGUID: QJzqX6SpTtS+rcZOdgLZgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="68153562"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="68153562"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2025 06:52:19 -0700
X-CSE-ConnectionGUID: S6yn9jfERgeI3j+fOzlZuw==
X-CSE-MsgGUID: jliW7cJOStiKkBK0r/YuOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="165903758"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.244.28])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2025 06:52:16 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Andrew Morton <akpm@linux-foundation.org>,
 Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 3/6] drm/gpusvm: Add drm_gpusvm_in_notifier_* helpers
Date: Sat,  9 Aug 2025 15:51:34 +0200
Message-ID: <20250809135137.259427-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250809135137.259427-1-thomas.hellstrom@linux.intel.com>
References: <20250809135137.259427-1-thomas.hellstrom@linux.intel.com>
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
index 8b5e159857fc..4bdbe10685cf 100644
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

