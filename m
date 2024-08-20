Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5290C3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 08:56:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8111910E20A;
	Tue, 20 Aug 2024 08:56:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="meDah6fW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B656410E117
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 08:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724144163; x=1755680163;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nJTuQ09KfZmLwGHCJ0hqH0Ec1AtG+MMho+UIFwe55Kg=;
 b=meDah6fWiuubFPb06XSbRiyb8ZP1mWobhYDSAZQ7gseoBZnKIxgiLLB9
 sd+t2/1uZnI7h7gRM4g6bg4sE6U1L2k2IdjDrLMEhwZsdwTbYCnPpZuRu
 OiTA2yKzwVnRAB664hMDSPHIy4GKjVoylRProU7fpLwT7eFjXDUJB4U6r
 bPkrkGY8/OS9svcyXlKsZCJNCo6LiX/Ur6D8Ej9s+n4zPqQ7baGgOxL5d
 PnxVrkN+g0QF5hrvTS9GWbQiZYu3eagkUatsB2KeURoz1hkgspV8h9DhI
 S8LJc5cD6eHZXUFIrn6IfARi7pF1wsH7zZfo18W6HZ3pCRWWb24kacGIn w==;
X-CSE-ConnectionGUID: BYY/rzsMSVumlPlIPk9WrQ==
X-CSE-MsgGUID: sUyhY9qdQDCUvQwd1GcP6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="13110533"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="13110533"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 01:56:03 -0700
X-CSE-ConnectionGUID: QbnvQRfkSTKI37rZTK1sww==
X-CSE-MsgGUID: NhPucdsZSOq5lxTFMDiyeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="65619997"
Received: from singhapo-nuc7i7bnh.iind.intel.com ([10.145.169.50])
 by orviesa004.jf.intel.com with ESMTP; 20 Aug 2024 01:56:01 -0700
From: apoorva.singh@intel.com
To: intel-xe@lists.freedesktop.org
Cc: Apoorva Singh <apoorva.singh@intel.com>
Subject: [PATCH 1/1] drm/xe: Add NULL check before dereferencing pointer
 lrc->bo in xe_lrc_snapshot_capture()
Date: Tue, 20 Aug 2024 14:24:54 +0530
Message-Id: <20240820085454.976636-2-apoorva.singh@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240820085454.976636-1-apoorva.singh@intel.com>
References: <20240820085454.976636-1-apoorva.singh@intel.com>
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

From: Apoorva Singh <apoorva.singh@intel.com>

Add NULL check before deferencing of lrc->bo in
xe_lrc_snapshot_capture().

Free the dynamically allocated memory for snapshot
to avoid memory leak.

Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 974a9cd8c379..8ab1af4b4057 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1649,7 +1649,12 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
 	if (!snapshot)
 		return NULL;
 
-	if (lrc->bo && lrc->bo->vm)
+	if (!lrc->bo) {
+		kfree(snapshot);
+		return NULL;
+	}
+
+	if (lrc->bo->vm)
 		xe_vm_get(lrc->bo->vm);
 
 	snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
-- 
2.34.1

