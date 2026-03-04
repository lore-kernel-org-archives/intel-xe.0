Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A57EDEBFD
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 00:56:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C1310E906;
	Wed,  4 Mar 2026 00:56:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hLldbM7x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F79210E907
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Mar 2026 00:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772585771; x=1804121771;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1uP3oENYOClZixw7DAaHGe2l4F0G40JqNuV/DMgpZq4=;
 b=hLldbM7xsuD4R85pz2w+jSdLW2WPcF7fN2zXwIEMxKZjEWPxHKZicy7C
 zu7bBRA/MKXrG5gdDlDL9BQnpvlMkac6hkt7ZF26YdL50Eq9odtU2vLc/
 pkkUwjnh0S9sJbKMJNPME/8W1/Q/0V2fcUPtKVYmfOv3yW+Hg4ZQynI6c
 lFIsMHekL0kk7LbRzcRLbHZkmM6RTteCxl98XnhyebZ9BGD8n/U7ei7dv
 Pfrx2/J/5xf3BaunzaTLeFQN0fkTXuIxn0f+Fce+Cmhf1D8D8HKkIuEHa
 6Gsl4dB+zMvHFo+9pHrbkEncz8Q37l3ivjaBqBk3+6VR5KeIn9nV3PXuK A==;
X-CSE-ConnectionGUID: CTyxHQaXT9OWkYc37qtqfw==
X-CSE-MsgGUID: migDT/RxR/ijSFqQfu+omg==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73705477"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="73705477"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 16:56:09 -0800
X-CSE-ConnectionGUID: mD52kt3lS2SMp/2qR76Abw==
X-CSE-MsgGUID: qgiCFTKMQPa2EhgDLhGA0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="218130216"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.192])
 by orviesa009.jf.intel.com with ESMTP; 03 Mar 2026 16:56:09 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Brian Nguyen <brian3.nguyen@intel.com>
Subject: [PATCH v3 3/3] drm/xe: Skip adding PRL entry to NULL VMA
Date: Wed,  4 Mar 2026 00:56:11 +0000
Message-ID: <20260304005607.2511440-8-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304005607.2511440-5-brian3.nguyen@intel.com>
References: <20260304005607.2511440-5-brian3.nguyen@intel.com>
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

NULL VMAs have no corresponding PTE, so skip adding a PRL entry to avoid
an unnecessary PRL abort during unbind.

Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
---
 drivers/gpu/drm/xe/xe_page_reclaim.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.c b/drivers/gpu/drm/xe/xe_page_reclaim.c
index 60b0fda59ce3..da1ed99cd3f8 100644
--- a/drivers/gpu/drm/xe/xe_page_reclaim.c
+++ b/drivers/gpu/drm/xe/xe_page_reclaim.c
@@ -27,12 +27,18 @@
  * flushes.
  * - pat_index is transient display (1)
  *
+ * For cases of NULL VMA, there should be no corresponding PRL entry
+ * so skip over.
+ *
  * Return: true when page reclamation is unnecessary, false otherwise.
  */
 bool xe_page_reclaim_skip(struct xe_tile *tile, struct xe_vma *vma)
 {
 	u8 l3_policy;
 
+	if (xe_vma_is_null(vma))
+		return true;
+
 	l3_policy = xe_pat_index_get_l3_policy(tile->xe, vma->attr.pat_index);
 
 	/*
-- 
2.43.0

