Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE7FAC10F04
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 15:19:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B74910E554;
	Tue,  5 Dec 2023 15:19:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EBD010E34C
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 15:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701789564; x=1733325564;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=pPK/uJg0avEPDDOBE8DZ+o9smL1Ughfg1K1Nu/8EiEc=;
 b=RObvM3AhjUdVWtgG2NypGHxfbM9Wgyb109FDxn+QpO9ub5rSgfaYEU1b
 nYNAnb0Q0/t5kQD3K3c/Ut+mLn0zFp4KmOednO+DEpMlDIzsTUMMypkua
 rpC0b9YR/4rnKMvQ6/cQaGElodmDL5q7TPyUo/NyrAwV3WSx/5ZS40C+S
 9Lu6fwm1SEtAetwvz//JhjcG0bXJHlxI+8Oo4NrnAMratFdaQsqiXyEXN
 gEvRX3C9rLQ+x5KzkRXvbzGFeqQWK2GSY8fUqXlGqUKoNn9RSff9xKs3A
 OymWFxj6T2KlaN74iT26hS4OG6wKNlXta+IqQx1MEjsNcXMcGtTFGfgOP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="393641570"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="393641570"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 07:19:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="770956771"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="770956771"
Received: from mstribae-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.119])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 07:19:23 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  5 Dec 2023 16:18:59 +0100
Message-ID: <20231205151913.4259-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231205151913.4259-1-thomas.hellstrom@linux.intel.com>
References: <20231205151913.4259-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 03/16] drm/gpuvm: export drm_gpuvm_range_valid()
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

From: Danilo Krummrich <dakr@redhat.com>

Drivers may use this function to validate userspace requests in advance,
hence export it.

Acked-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231108001259.15123-4-dakr@redhat.com
(cherry picked from commit 9297cfc9405bc6b60540b8b8aaf930b7e449e15a)
---
 drivers/gpu/drm/drm_gpuvm.c | 14 +++++++++++++-
 include/drm/drm_gpuvm.h     |  1 +
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 1cbeb4169f9c..dd46d14fd3e6 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -649,7 +649,18 @@ drm_gpuvm_in_kernel_node(struct drm_gpuvm *gpuvm, u64 addr, u64 range)
 	return krange && addr < kend && kstart < end;
 }
 
-static bool
+/**
+ * drm_gpuvm_range_valid() - checks whether the given range is valid for the
+ * given &drm_gpuvm
+ * @gpuvm: the GPUVM to check the range for
+ * @addr: the base address
+ * @range: the range starting from the base address
+ *
+ * Checks whether the range is within the GPUVM's managed boundaries.
+ *
+ * Returns: true for a valid range, false otherwise
+ */
+bool
 drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
 		      u64 addr, u64 range)
 {
@@ -657,6 +668,7 @@ drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
 	       drm_gpuvm_in_mm_range(gpuvm, addr, range) &&
 	       !drm_gpuvm_in_kernel_node(gpuvm, addr, range);
 }
+EXPORT_SYMBOL_GPL(drm_gpuvm_range_valid);
 
 /**
  * drm_gpuvm_init() - initialize a &drm_gpuvm
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index baa1a96c038c..ed766dd9d96b 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -253,6 +253,7 @@ void drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
 		    const struct drm_gpuvm_ops *ops);
 void drm_gpuvm_destroy(struct drm_gpuvm *gpuvm);
 
+bool drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm, u64 addr, u64 range);
 bool drm_gpuvm_interval_empty(struct drm_gpuvm *gpuvm, u64 addr, u64 range);
 
 static inline struct drm_gpuva *
-- 
2.42.0

