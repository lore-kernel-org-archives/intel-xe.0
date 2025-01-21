Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1286FC0218B
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jan 2025 18:04:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF78810E61B;
	Tue, 21 Jan 2025 18:03:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d2cvNzA5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 982FC10E61B
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jan 2025 18:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737482639; x=1769018639;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YDzfovw/+3+79dX9rVwW0JedK9/gQd8E1ryqhApGSlA=;
 b=d2cvNzA59bNkmt8FZZwyJqjzVdAGdTmVf1lkOzYTvKjQDliTmSUe/QHl
 n3SyivvsT6B4qKEaX0ru0O5lsmruMdpuF5FeCnAjtWVUQciNWHtNBtyQw
 zFpGIJqXw2z3HQ7PgJfTXSNAHSYLU0IfCGAykSxrXa6Lj+iYDMg7evT/z
 YTqYUQgh/+l+gTt92C3nvIxKNdMr7Ea9d5YE5vTkcpW0MZou00upt+9j0
 TUUsdtaWhQkOf0YY/m4GfcMK0IOoEkwWeXHJ1v/8XP3exBP/Ld7ogSMZ9
 NyuEazN1GZG1DajGt4XNCBouVdnfsKtHD56429mUtyM360S8kQ8XlZB5K g==;
X-CSE-ConnectionGUID: ZVvZbHoYQ8yIzda2diH7nQ==
X-CSE-MsgGUID: DrlIKSo+TeG29x+H7AOXqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37933930"
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="37933930"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 10:03:59 -0800
X-CSE-ConnectionGUID: 2841iNJYQmug0NdRud9vxg==
X-CSE-MsgGUID: guTBrEmyRdOyjIF/Iewx2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="106663487"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 10:03:58 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 2/2] drm/xe/oa: Fix locking for stream->pollin
Date: Tue, 21 Jan 2025 10:03:54 -0800
Message-ID: <20250121180354.3221570-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121180354.3221570-1-ashutosh.dixit@intel.com>
References: <20250121180354.3221570-1-ashutosh.dixit@intel.com>
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

Previously locking was not implemented for stream->pollin. Now
stream->pollin should be accessed under stream->oa_buffer.ptr_lock.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 6 ++++++
 1 file changed, 6 insertions(+)

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
-- 
2.47.1

