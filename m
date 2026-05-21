Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A8FCD343F
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 06:15:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD9F810F20C;
	Thu, 21 May 2026 06:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IjxmNDEx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9237710E450
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 06:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779344130; x=1810880130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O2hjS+Sb1bzSZ8K3MLEYufVvR9TXeyBLiwBJ30DUh1s=;
 b=IjxmNDExeHvNnDjNH4qVbD7i9y+E03KZ+G7fB66G3d2Eq3unEKPQp6UY
 zZ27TDdfBo3r9nbDJ4NYEuiy2e7OWjUhFF+eok++ZkQwiJ8S3A8tsWIZ+
 7+nTWP5tI26Qn+uO7oi6YHHjoo5+Gdx+NRqp7/qIGFEh1P/LX6sRI0FXD
 T3emHlgC/pobVydj6slF7nAHJ3h3UYuc7N3DMFnk+jBmD2I9JI/4jxElr
 9Ch8a6RH+OWHkDPuYq5w080AKpQVXWf+3qGiAC2IoKlgrqlmF7jcE7qp3
 SKH7Jwn5M3rZRQ8vlxPO2nrWePxy1h7eU0OLLVRWjkdkMY6zu50yAKDQw Q==;
X-CSE-ConnectionGUID: Ttyzlf/gSXyT6eyN+/cjpA==
X-CSE-MsgGUID: SU917cweRXe+PEWIyGlCLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80376377"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="80376377"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 23:15:30 -0700
X-CSE-ConnectionGUID: IEdSR02DT1qxZ0mIdsXGkw==
X-CSE-MsgGUID: Rl0XpU+eQCutAdzAAj/Nkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="270791794"
Received: from cs2n1.iind.intel.com (HELO cs2n1..) ([10.223.246.13])
 by orviesa002.jf.intel.com with ESMTP; 20 May 2026 23:15:29 -0700
From: Mohanram Meenakshisundaram <mohanram.meenakshisundaram@intel.com>
To: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 rodrigo.vivi@intel.com
Cc: Mohanram Meenakshisundaram <mohanram.meenakshisundaram@intel.com>
Subject: [PATCH v2 2/2] drm/xe: Adjust variable initialization in xe_debugfs
Date: Thu, 21 May 2026 11:39:11 +0530
Message-Id: <20260521060911.2112210-3-mohanram.meenakshisundaram@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260521060911.2112210-1-mohanram.meenakshisundaram@intel.com>
References: <20260520070255.2021100-1-mohanram.meenakshisundaram@intel.com>
 <20260521060911.2112210-1-mohanram.meenakshisundaram@intel.com>
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

