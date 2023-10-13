Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11689CDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 10:22:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC4E810E5E2;
	Fri, 13 Oct 2023 10:22:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13AE110E0DE
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 10:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697192571; x=1728728571;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/UOkS8AWotB//W9ipKB12AEIcEtaBsEACOr54ufBOyQ=;
 b=Q5/OVpC6tXZ3hGJGvAgphsjf0UxhOawB84h2pR+sUjEpSCnuzTfh3l+B
 vTyDJcg/wtYb3jcwCK271YgXvzmL7CDPwLlG9TgsyUzlWmKp5yToZ4Cb+
 +N24qCXz5bpqY0pAvxbKWUUQU6sQZ4wAxIh8D4Ry6q6pBV9FEhW4CNy02
 LukOpD+DdxvUWpPltSHOY8seJUH9oAMUzuetaVXlriN4B7pLwxPKynexC
 9D06nk2C5qyPfWuPekw5ZVFI16vR17BJ7dgdGhfj7WrTLTSDiNAq6i2eQ
 N7NRFD717etKCGToVVrIHhGqxtQDCO/B23fduiNL4t89zZRiyIoUm3n7g g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="3747553"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="3747553"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 03:22:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="825012262"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; d="scan'208";a="825012262"
Received: from dstacken-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.172])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 03:22:47 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 13 Oct 2023 12:22:26 +0200
Message-ID: <20231013102226.2961-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH] drm/xe/uAPi: Clarify the meaning of
 min_page_size and MIN_ALIGNMENT
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

In particular, don't *enforce* alignment of buffer object sizes to
MIN_ALIGNMENT, as enforcing that for imported dma-bufs would not
really make sense.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 include/uapi/drm/xe_drm.h | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index d48d8e3c898c..5895c95879d1 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -167,11 +167,10 @@ struct drm_xe_query_mem_region {
 	 *
 	 * When the kernel allocates memory for this region, the
 	 * underlying pages will be at least @min_page_size in size.
-	 *
-	 * Important note: When userspace allocates a GTT address which
-	 * can point to memory allocated from this region, it must also
-	 * respect this minimum alignment. This is enforced by the
-	 * kernel.
+	 * Buffer objects with an allowable placement in this region may
+	 * be created with a smaller size, but for increased performance,
+	 * user-space drivers should align sizes of such buffer objects
+	 * to this value whenever possible.
 	 */
 	__u32 min_page_size;
 	/**
@@ -252,6 +251,14 @@ struct drm_xe_query_config {
 #define XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
 #define XE_QUERY_CONFIG_FLAGS			1
 	#define XE_QUERY_CONFIG_FLAGS_HAS_VRAM		(0x1 << 0)
+/*
+ * XE_QUERY_CONFIG_MIN_ALIGNMENT - GPU VM bind address - and size alignment.
+ * GPU virtual address mappings of buffer objects must have their VM addr and
+ * range aligned to this value, with the exception of buffer objects with
+ * allowable placement in system memory only. If this alignment results in
+ * a mapping beyond the end of the buffer object, accesses beyond the
+ * end of the buffer object have undefined reslut.
+ */
 #define XE_QUERY_CONFIG_MIN_ALIGNMENT		2
 #define XE_QUERY_CONFIG_VA_BITS			3
 #define XE_QUERY_CONFIG_GT_COUNT		4
-- 
2.41.0

