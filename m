Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1415C41513
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 04:31:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8860610E3E8;
	Thu, 17 Aug 2023 04:31:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A9C710E3E8
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 04:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692246706; x=1723782706;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=drPhbxP+Fyw7sUFmHEgMI+ikGtO70dl2d2HH9Gpkjpk=;
 b=TRQnLQW6pvyHIGvyrnncKfAOPFwC3Yzj9gr01S6Hcg8qIuK6nv6F7Omv
 F6SzObiuF5lV2TLHiUjnUjs8rqepaikIfs3IUmHI5D71rpsbV2h6SXAhp
 Y65ho2d/7ujt+9amGOuYPXLYqdMiqLDembjIorm8aLyxLJBf/PHS2T9yO
 EF3aG81zHxIpPDin9SdGX1lzeix6lVgS9gL0YzmKX8m3YLOkiYU9gTXzJ
 6cdbvQjps9PM1Rknjp2qXIXKisysxeVVQjLOOCy58OYKfQauRClrAK4kh
 2zkbUPNUr7ZcJ1cRq0zby+wujfs097nsOIkXXpO6o8NPH0SdzWrgOdiUK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="371608920"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="371608920"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 21:31:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="799875026"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="799875026"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 21:31:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 16 Aug 2023 21:31:47 -0700
Message-Id: <20230817043148.740495-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817043148.740495-1-matthew.brost@intel.com>
References: <20230817043148.740495-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/3] drm/gpuva: Add drm_gpuva_for_each_op_reverse
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

Xe will make use of this, add helper to walk op list in reverse.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/drm/drm_gpuva_mgr.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/drm/drm_gpuva_mgr.h b/include/drm/drm_gpuva_mgr.h
index c6678b1dc5d2..455eef90db21 100644
--- a/include/drm/drm_gpuva_mgr.h
+++ b/include/drm/drm_gpuva_mgr.h
@@ -616,6 +616,16 @@ struct drm_gpuva_ops {
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
  * drm_gpuva_first_op - returns the first &drm_gpuva_op from &drm_gpuva_ops
  * @ops: the &drm_gpuva_ops to get the fist &drm_gpuva_op from
-- 
2.34.1

