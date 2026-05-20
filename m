Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8470ACD4F5E
	for <intel-xe@archiver.kernel.org>; Wed, 20 May 2026 07:09:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4201D10EF1C;
	Wed, 20 May 2026 07:09:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EoeUCfyc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 511F010EF18
 for <intel-xe@lists.freedesktop.org>; Wed, 20 May 2026 07:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779260965; x=1810796965;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0JrsTRuX6IwW+7cCB2kZxTHFfe48DL+tlsx2Eyti4F0=;
 b=EoeUCfyceFqJSHi7rpxJVbDCLfAMmrKJIt/MPh96O2Dfc8X3wQewEcfG
 EHVQZ8aTkerG7bG6HIWa479aKP8Kt00isOBItMZyZApOJaDvdVwi8nY8N
 6vhsCX0+AghYBBPmdzAWs6AuynFImz/iWgc6rhSv4U3aBx9ZkIOxufhpV
 z0Hunbfm2j4UGzFtcKRVTXjbX1c/Fgm3578Y6TVdm6gMS00paoR7usvf+
 /fFJQMPBlYrcpDIJau8rdWpjqnZQCjAsqYuMjyhp0S1qqWm/xqvUQMN7f
 uTIeUeUWoWhnQ4EDFaeWDKGKGveUzkzPqbMv2voZJX1iOVbg6jS0VXiv7 g==;
X-CSE-ConnectionGUID: UBQEKuBfTzOPABDe+fsoBQ==
X-CSE-MsgGUID: EX9lRPEvR2+wMVg4bFZE9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="80208202"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="80208202"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 00:09:20 -0700
X-CSE-ConnectionGUID: o8cvrqbBTwyb9sEGy7uj9A==
X-CSE-MsgGUID: s5VjDkbQQmmpmBJfHgn9dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="235791975"
Received: from cs2n1.iind.intel.com (HELO cs2n1..) ([10.223.246.13])
 by fmviesa010.fm.intel.com with ESMTP; 20 May 2026 00:09:18 -0700
From: Mohanram Meenakshisundaram <mohanram.meenakshisundaram@intel.com>
To: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 rodrigo.vivi@intel.com
Cc: Mohanram Meenakshisundaram <mohanram.meenakshisundaram@intel.com>
Subject: [PATCH] drm/xe: Fix return type of disable_late_binding_set() in
 debugfs
Date: Wed, 20 May 2026 12:32:55 +0530
Message-Id: <20260520070255.2021100-1-mohanram.meenakshisundaram@intel.com>
X-Mailer: git-send-email 2.34.1
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

Fix disable_late_binding_set() to declare 'ret' as ssize_t instead of
int, consistent with the function's return type.

Also remove '0' initializations for the 'len' variable in
four debugfs show functions (wedged_mode_show,
atomic_svm_timeslice_ms_show,
min_run_period_lr_ms_show, min_run_period_pf_ms_show).
The variable is updated immediately on next line by scnprintf(), so the
initialize to '0' not required.

Fixes: 62519b77aeca ("drm/xe: Fix memory leak when handling pagefault vma")
Signed-off-by: Mohanram Meenakshisundaram <mohanram.meenakshisundaram@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 22b471303984..675cc0ddd83b 100644
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
 
@@ -528,7 +528,7 @@ static ssize_t disable_late_binding_set(struct file *f, const char __user *ubuf,
 	struct xe_device *xe = file_inode(f)->i_private;
 	struct xe_late_bind *late_bind = &xe->late_bind;
 	bool val;
-	int ret;
+	ssize_t ret;
 
 	ret = kstrtobool_from_user(ubuf, size, &val);
 	if (ret)
-- 
2.34.1

