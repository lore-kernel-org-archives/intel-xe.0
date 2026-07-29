Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037A4C53219
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jul 2026 17:06:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D6010ED17;
	Wed, 29 Jul 2026 17:06:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aqODTY05";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 309C210ED17
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jul 2026 17:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785344792; x=1816880792;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B3qTsrHsQh90hd86YPzWt70vcQ3Lq9lgdajn19StApQ=;
 b=aqODTY05yhBg9Pgw4V/L6uKCFFUwmYTYPJMtI9/foNyVROZlT8H5Xkqm
 l9r83DoXH5LFa5616t3kaAhVnbQ1G9tHYp3+8ILOCtoU8Vp+Im9nAcZHR
 fsGzv+iawc46GxtjO3v/ekutn2mvwfivbGWssBbFaxCCGhww/Wbz4owGa
 jSmNQdT1wJ6aF44df1RHUnOub+gpJErwvxD7nMK8GmwlxfIzP9vR7M+xI
 PGxxgMDaa8gv66GegqxzADnR8XhKtfHH7Gr6Wi+mAYIZs6LHir1GRy4d/
 Sk9mOhtqTGKHJhAMn3BlF65IyeghMtgHJiqaG22MbKmuENwnBBNVkLm3K g==;
X-CSE-ConnectionGUID: DhJo1V4rRPyXGYYNVX6eNQ==
X-CSE-MsgGUID: dIT6RUJRS7eYeXJunATKHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="73494415"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="73494415"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 10:06:32 -0700
X-CSE-ConnectionGUID: DG8fcBtWRlqlh0D7hxMUMA==
X-CSE-MsgGUID: Ydv/k7MgQneA0nn3P+mSWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="298284752"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 10:06:29 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH 1/2] drm/xe/pcode: Introduce xe_pcode_read_timeout() API
Date: Wed, 29 Jul 2026 22:45:45 +0530
Message-Id: <20260729171546.3368457-2-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260729171546.3368457-1-karthik.poosa@intel.com>
References: <20260729171546.3368457-1-karthik.poosa@intel.com>
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

