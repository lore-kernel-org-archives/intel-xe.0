Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498F7CD5BA6
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 06:09:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A67510F20C;
	Thu, 21 May 2026 06:09:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QcjPf04T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 940FD10E164
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 06:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779343798; x=1810879798;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O2hjS+Sb1bzSZ8K3MLEYufVvR9TXeyBLiwBJ30DUh1s=;
 b=QcjPf04TpTFBpeWrkuVIG9mSMUc4PgO8YrEOg2QXKd9G2YsGAHHKon6o
 JNVG8JoAn5T4XaO5RlplzBUU1AtP+jF1eTI7FtUxP4JfMAgtEwe+7gNzW
 ykzatfq2px1YZ2S9vM3iqbMmAaK4+6EawjLKrKX7ggAzyCZuhlHg7z3Iu
 yg8hkOtxGFSWzDarwKSSujXB8Nnhv+kycmOBLTswhtEI1a84m5EnbYW+P
 hdMV8qoL3n2kTcDcvTx/wis4nigOUm2gAhCO7Ml+kyw6f9/mq+uUZi5a4
 1D41X/+MiPgg88oVSoaBCYCU5wd4ghNgxs/rI7SgvU9ufhYCZm9+ISDRk A==;
X-CSE-ConnectionGUID: HkJFvW2ZQUqxfx80IYw1sw==
X-CSE-MsgGUID: 8vQobHAKQPOpJLvt69E4Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80288819"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="80288819"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 23:09:58 -0700
X-CSE-ConnectionGUID: 3t1g/DP/Q8qtwHj3YcJQpA==
X-CSE-MsgGUID: jBIiYZTDQ5qCETVCSxRQ0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="278552346"
Received: from cs2n1.iind.intel.com (HELO cs2n1..) ([10.223.246.13])
 by orviesa001.jf.intel.com with ESMTP; 20 May 2026 23:09:56 -0700
From: Mohanram Meenakshisundaram <mohanram.meenakshisundaram@intel.com>
To: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 rodrigo.vivi@intel.com
Cc: Mohanram Meenakshisundaram <mohanram.meenakshisundaram@intel.com>
Subject: [PATCH v2 2/2] drm/xe: Adjust variable initialization in xe_debugfs
Date: Thu, 21 May 2026 11:33:38 +0530
Message-Id: <20260521060338.2112191-3-mohanram.meenakshisundaram@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260521060338.2112191-1-mohanram.meenakshisundaram@intel.com>
References: <20260521060338.2112191-1-mohanram.meenakshisundaram@intel.com>
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

remove '0' initializations for the 'len' variable in
four debugfs show functions (wedged_mode_show,
atomic_svm_timeslice_ms_show,
min_run_period_lr_ms_show, min_run_period_pf_ms_show).
The variable is updated immediately on next line by scnprintf(), so the
initialize to '0' not required.

Signed-off-by: Mohanram Meenakshisundaram <mohanram.meenakshisundaram@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 9800e3fc4c07..675cc0ddd83b 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -282,7 +282,7 @@ static ssize_t wedged_mode_show(struct file *f, char __user *ubuf,
 {
 	struct xe_device *xe = file_inode(f)->i_private;
 	char buf[32];
-	int len = 0;
+	int len;
 
 	len = scnprintf(buf, sizeof(buf), "%d\n", xe->wedged.mode);
 
@@ -411,7 +411,7 @@ static ssize_t atomic_svm_timeslice_ms_show(struct file *f, char __user *ubuf,
 {
 	struct xe_device *xe = file_inode(f)->i_private;
 	char buf[32];
-	int len = 0;
+	int len;
 
 	len = scnprintf(buf, sizeof(buf), "%d\n", xe->atomic_svm_timeslice_ms);
 
@@ -446,7 +446,7 @@ static ssize_t min_run_period_lr_ms_show(struct file *f, char __user *ubuf,
 {
 	struct xe_device *xe = file_inode(f)->i_private;
 	char buf[32];
-	int len = 0;
+	int len;
 
 	len = scnprintf(buf, sizeof(buf), "%d\n", xe->min_run_period_lr_ms);
 
@@ -480,7 +480,7 @@ static ssize_t min_run_period_pf_ms_show(struct file *f, char __user *ubuf,
 {
 	struct xe_device *xe = file_inode(f)->i_private;
 	char buf[32];
-	int len = 0;
+	int len;
 
 	len = scnprintf(buf, sizeof(buf), "%d\n", xe->min_run_period_pf_ms);
 
-- 
2.34.1

