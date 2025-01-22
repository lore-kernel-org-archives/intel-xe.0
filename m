Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACAE2C02182
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 04:02:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53CEE10E656;
	Wed, 22 Jan 2025 04:02:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b5JlpqCR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5991C10E656
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jan 2025 04:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737518529; x=1769054529;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hL1oNpp318YS5oJO4wG8wtJCcpRdoiTOcrpWcZgV4ZU=;
 b=b5JlpqCRrGIDET8pBZVMFHiaNUuGPI0HWNPtRPgftAjhTZa0tiy4Cps7
 KgZA2ZmrxPNmHHDmxOziBqN233nTrdRbzecEfYwH/qjPIe9fAd6XkAkie
 O5sDsjuohtSN+UHUEgwaUoEtfhMFGdMEe3XIBRb+ONbW7dZ6EAfFLGKOh
 Ms6PuDEJLHwS9ZqY1cZgS1ZvmEbYT1GaGZblCGfXy5dVA9cp1OPSyUb17
 FiCPFMZzZPCVid3S2dwmFaIWfRZJM8J1P4bVzhQnnHJO89PSGGvFqjETw
 FxlJWTi0KlH5fudrsRbl5DiCjBenc5SmA7CqZPwP3b5kvJO1qc+6JAs6x Q==;
X-CSE-ConnectionGUID: orzyCiTKTVKai04oSYR/pw==
X-CSE-MsgGUID: 5msqHC7ISZaOxjuMUWFV8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="38112771"
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; d="scan'208";a="38112771"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 20:02:08 -0800
X-CSE-ConnectionGUID: gUfYpN6KSrWhnKEsF7/QkQ==
X-CSE-MsgGUID: DS5KoxW+R/6JIGcNP95zsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112088663"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 20:02:08 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 2/2] drm/xe/oa: Fix locking for stream->pollin
Date: Tue, 21 Jan 2025 20:02:04 -0800
Message-ID: <20250122040204.3239397-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250122040204.3239397-1-ashutosh.dixit@intel.com>
References: <20250122040204.3239397-1-ashutosh.dixit@intel.com>
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

Previously locking was skipped for stream->pollin. This "mostly" worked
because pollin is u32/bool, even when stream->pollin is accessed
concurrently in multiple threads. However, with stream->pollin moving under
stream->oa_buffer.ptr_lock in this series, implement the correct way to
access stream->pollin, which is to access it under
stream->oa_buffer.ptr_lock.

v2: Update commit message to explain the "why" of this change (Rodrigo)
    Document the change in scope for stream->oa_buffer.ptr_lock (Rodrigo)

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c       | 6 ++++++
 drivers/gpu/drm/xe/xe_oa_types.h | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index fa873f3d0a9d1..9de62ce4b9e42 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -530,6 +530,7 @@ static ssize_t xe_oa_read(struct file *file, char __user *buf,
 			  size_t count, loff_t *ppos)
 {
 	struct xe_oa_stream *stream = file->private_data;
+	unsigned long flags;
 	size_t offset = 0;
 	int ret;
 
@@ -562,8 +563,10 @@ static ssize_t xe_oa_read(struct file *file, char __user *buf,
 	 * Also in case of -EIO, we have already waited for data before returning
 	 * -EIO, so need to wait again
 	 */
+	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
 	if (ret != -ENOSPC && ret != -EIO)
 		stream->pollin = false;
+	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
 
 	/* Possible values for ret are 0, -EFAULT, -ENOSPC, -EIO, -EINVAL, ... */
 	return offset ?: (ret ?: -EAGAIN);
@@ -573,6 +576,7 @@ static __poll_t xe_oa_poll_locked(struct xe_oa_stream *stream,
 				  struct file *file, poll_table *wait)
 {
 	__poll_t events = 0;
+	unsigned long flags;
 
 	poll_wait(file, &stream->poll_wq, wait);
 
@@ -582,8 +586,10 @@ static __poll_t xe_oa_poll_locked(struct xe_oa_stream *stream,
 	 * in use. We rely on hrtimer xe_oa_poll_check_timer_cb to notify us when there
 	 * are samples to read
 	 */
+	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
 	if (stream->pollin)
 		events |= EPOLLIN;
+	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
 
 	return events;
 }
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index 52e33c37d5ee8..5c4ea13f646fc 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -159,7 +159,7 @@ struct xe_oa_buffer {
 	/** @vaddr: mapped vaddr of the OA buffer */
 	u8 *vaddr;
 
-	/** @ptr_lock: Lock protecting reads/writes to head/tail pointers */
+	/** @ptr_lock: Lock protecting reads/writes to head/tail pointers and stream->pollin */
 	spinlock_t ptr_lock;
 
 	/** @head: Cached head to read from */
-- 
2.47.1

