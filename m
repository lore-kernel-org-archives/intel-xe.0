Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87475C44507
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 04:09:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48DC210E3FB;
	Fri, 17 Jul 2026 04:09:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MbqqD1Uk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A421710E3FB
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Jul 2026 04:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784261346; x=1815797346;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B3qTsrHsQh90hd86YPzWt70vcQ3Lq9lgdajn19StApQ=;
 b=MbqqD1UkouYmx26uRR1ElvIR11VyTQPR6KgWQ07suHNeWfs1x0iov+jk
 W+PXs1eluvb0BCQmTM8EV+Gnmj5sZg9plqzFow5i8n+MkKgrQWacqCw4y
 QZ1vWzrex8dxAbtez8xSSKH1vMeV2lrPHc0Sy87Hx+aGUHPFptRO3LKXK
 igCf7PjasOoaLY3OdmN2vCuJ7wtpmiX4K4SyNdjZ0lKkWb1ssz3Nz5/w5
 PQ53UciRxzGpK2RycpDHXQz/qFkCr7ZmVivHShlwetxyhBeUi8n6azzzu
 pX8OmNLrwKCMpLqlIWFx2qOSMMADFWBRcIb3JCRqjWToikWDDeOQCVun2 w==;
X-CSE-ConnectionGUID: LPoI5N0WSDCuZwnavP51nA==
X-CSE-MsgGUID: sC/HRrQnTJG69df9SN/v2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="85129343"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="85129343"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 21:09:05 -0700
X-CSE-ConnectionGUID: OWWx0Qc3SwuQ7t5w1/mqiQ==
X-CSE-MsgGUID: Utyo1lkzR+C6dsdMtRQ0Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="255538852"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 21:09:03 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v2 1/9] drm/xe/pcode: Introduce xe_pcode_read_timeout() API
Date: Fri, 17 Jul 2026 09:47:49 +0530
Message-Id: <20260717041757.2759084-2-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260717041757.2759084-1-karthik.poosa@intel.com>
References: <20260717041757.2759084-1-karthik.poosa@intel.com>
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

Add the xe_pcode_read_timeout() helper to allow callers to specify
custom timeout values for pcode read operations.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_pcode.c | 11 +++++++++++
 drivers/gpu/drm/xe/xe_pcode.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index ccc3bdeed6bb..7386113e60b3 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -147,6 +147,17 @@ int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1)
 	return err;
 }
 
+int xe_pcode_read_timeout(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1, u32 timeout_ms)
+{
+	int err;
+
+	mutex_lock(&tile->pcode.lock);
+	err = pcode_mailbox_rw(tile, mbox, val, val1, timeout_ms, true, false);
+	mutex_unlock(&tile->pcode.lock);
+
+	return err;
+}
+
 static int pcode_try_request(struct xe_tile *tile, u32 mbox,
 			     u32 request, u32 reply_mask, u32 reply,
 			     u32 *status, bool atomic, int timeout_us, bool locked)
diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
index 8fb3e4ba13a6..c9647c5f305e 100644
--- a/drivers/gpu/drm/xe/xe_pcode.h
+++ b/drivers/gpu/drm/xe/xe_pcode.h
@@ -24,6 +24,7 @@ int xe_pcode_ready(struct xe_device *xe, bool locked);
 int xe_pcode_init_min_freq_table(struct xe_tile *tile, u32 min_gt_freq,
 				 u32 max_gt_freq);
 int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1);
+int xe_pcode_read_timeout(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1, u32 timeout_ms);
 int xe_pcode_write_timeout(struct xe_tile *tile, u32 mbox, u32 val,
 			   int timeout_ms);
 int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 data0,
-- 
2.25.1

