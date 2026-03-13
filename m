Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0256106FD82
	for <intel-xe@archiver.kernel.org>; Fri, 13 Mar 2026 05:36:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9428410E02F;
	Fri, 13 Mar 2026 05:36:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mNtA2kTa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8472C10E02F
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Mar 2026 05:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773380195; x=1804916195;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KPrTs/5GA1TcazLS+1gWvz4+OeAgRj0Dt8ytqPPH5IU=;
 b=mNtA2kTafIq3xS/8R6SKEEpEumEGag76vGsIy1bnUmAwIeWQk6DG/4Qe
 tIheaeVZLh0C6KYvpkh/WuaNeC6uqUNuC9M2oOUnLJk1V3cK2vV6PLEig
 3H6iPPNGESnj9BqvdCCKX4N5JPcRZmkX9aQwZqFwtWtDvA4V+LOivJu7A
 SZnXxzQt96rW07TZkxpuOO1xrt6yirFqlBCun+LIlPcWs0OZNOVUpF2Xg
 +cb7i55YNXIgCmY1fgv3KcTKOmMZt+sL8x4ewfl2PE32NgS3MoOFvr1Wt
 421AlGIZpWVbklLbFNuVPvwCr/4YIR9GSziHod5Vmvve+YL4JeMIeY+Go w==;
X-CSE-ConnectionGUID: 1f6cSzFgSYCyq8OtfD+upg==
X-CSE-MsgGUID: mUWdnitQS46Yl2RHjjMaDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="73502477"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; d="scan'208";a="73502477"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 22:36:34 -0700
X-CSE-ConnectionGUID: 12fH1aeYSSuDbI5zl1kUVg==
X-CSE-MsgGUID: 08iEUvoKQmKFgAFdNUfWkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; d="scan'208";a="221258469"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 22:36:34 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH v2] drm/xe/oa: Allow reading after disabling OA stream
Date: Thu, 12 Mar 2026 22:36:30 -0700
Message-ID: <20260313053630.3176100-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
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

Some OA data might be present in the OA buffer when OA stream is
disabled. Allow UMD's to retrieve this data, so that all data till the
point when OA stream is disabled can be retrieved.

v2: Update tail pointer after disable (Umesh)

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index dcd393b0931a2..2efc16c3a95df 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -543,8 +543,7 @@ static ssize_t xe_oa_read(struct file *file, char __user *buf,
 	size_t offset = 0;
 	int ret;
 
-	/* Can't read from disabled streams */
-	if (!stream->enabled || !stream->sample)
+	if (!stream->sample)
 		return -EINVAL;
 
 	if (!(file->f_flags & O_NONBLOCK)) {
@@ -1456,6 +1455,10 @@ static void xe_oa_stream_disable(struct xe_oa_stream *stream)
 
 	if (stream->sample)
 		hrtimer_cancel(&stream->poll_check_timer);
+
+	/* Update stream->oa_buffer.tail to allow any final reports to be read */
+	if (xe_oa_buffer_check_unlocked(stream))
+		wake_up(&stream->poll_wq);
 }
 
 static int xe_oa_enable_preempt_timeslice(struct xe_oa_stream *stream)
-- 
2.48.1

