Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761A2CAC5B0
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 19:28:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E91810E840;
	Thu,  2 Oct 2025 19:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IYwAWJij";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52A1710E13B
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 19:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759433299; x=1790969299;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=C4FVX/qJ5qkzDagJmLv3CoTzyAlZP4AV1dNl7rfd8LA=;
 b=IYwAWJijHImS20Fk8AmT49KRh1anghQ/4JZ5Ohtr8/7LtSbMvkj+EMIB
 LJ0G6yFsiBl5ctjV6DZffIW1qOXhSE0G0Tjtp8hE/OdkpNMnxHYrOmtXE
 nHh+0QWgrEQez4RxMAW3+3iWp37TfDdBkUwWiuKXuKyXc4kcwWydi/OgZ
 gMZcWHDdvSBjVYLqrRfnebxbKPW8mi7wqKiGMpgwj47JzbxR/7SUUUaAX
 PRaXQYP5ozIXxoV/GogUiuXRtPcSDliE2H8b3k1HJQQItctw7M+u8/gsA
 ipGfqFzR3p0m6gbja7Q3vCjqQK5BPqNCeaDrgwf0G6kxUrt+S3Fm9+t8p w==;
X-CSE-ConnectionGUID: pi59sU1pTjGGai0NBNa6YA==
X-CSE-MsgGUID: 0eAjOGdTSrGkJfTzfPzF7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="61770033"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="61770033"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 12:28:18 -0700
X-CSE-ConnectionGUID: U8Im6kKTQsuv7ZeMpgoFMA==
X-CSE-MsgGUID: UPh4vMHhR9avjCL/kpUbNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="178750684"
Received: from sachowdh-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.252.70])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 12:28:17 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe/xe_late_bind_fw: Fix and simplify parsing user input
Date: Thu,  2 Oct 2025 21:27:36 +0200
Message-ID: <20251002192736.203186-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

Code was wrongly passing sizeof(uval) as the number base to use,
and unlike other debugfs entries that represent bool data, it
wasn't use dedicated function to parse user input as bool.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
I'm not sure if this deserves:
Fixes: 67de7982d505 ("drm/xe/xe_late_bind_fw: Introduce debug fs node to disable late binding")
---
 drivers/gpu/drm/xe/xe_debugfs.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index dba0a9c4a4d2..34f622bef3e0 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -349,17 +349,14 @@ static ssize_t disable_late_binding_set(struct file *f, const char __user *ubuf,
 {
 	struct xe_device *xe = file_inode(f)->i_private;
 	struct xe_late_bind *late_bind = &xe->late_bind;
-	u32 uval;
-	ssize_t ret;
+	bool val;
+	int ret;
 
-	ret = kstrtouint_from_user(ubuf, size, sizeof(uval), &uval);
+	ret = kstrtobool_from_user(ubuf, size, &val);
 	if (ret)
 		return ret;
 
-	if (uval > 1)
-		return -EINVAL;
-
-	late_bind->disable = !!uval;
+	late_bind->disable = val;
 	return size;
 }
 
-- 
2.47.1

