Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CB8C67861
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 18:10:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B0710E610;
	Fri,  5 Apr 2024 18:10:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZHpESkAq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A49710E610
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 18:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712340627; x=1743876627;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5n4zq4kqtkJe3TLvUIcHCOogBFw2OytoowzICqi8ik0=;
 b=ZHpESkAqHTdtpibwpUfSu59h4F0l0O5CK3BmTOuJLkRlhjffhfJ7m8WH
 obLITH/ReYP7a5H2DAt32rZOGbPajD5/s5PGl/UhVYpsLfTq4QUid7Z1Q
 +ris8OiYbMAqrHB96FLmiEkDsRxckfccUSM5MYFKZdc5+HKcq8/W+BQtt
 XfIMGdYHRjMiWWmmO4HvfVVh5WgbOK7yP7cSVot0TNNIPwECeOaoCEEw2
 E7n14BjXpLSTO+/NqS8BZYvd9S+vdMx3haw/SOE0XhahvJODE+GEJHqFZ
 RuIYGnXqUYKMM5jdSUuVHCiYo1vABLN+GL7akUg71wgaXh37zRoU2CYnS g==;
X-CSE-ConnectionGUID: XT2O+jBeRA+z0Bf5A3RpWg==
X-CSE-MsgGUID: y8v8qrx5Suy052byA/6JWQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="19116688"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="19116688"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 11:10:24 -0700
X-CSE-ConnectionGUID: iXcbwaISR5O5vcIjuFirGQ==
X-CSE-MsgGUID: Gg38B2NfRLaha/UzsC+6FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="19273128"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 11:10:23 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, jonathan.cavitt@intel.com,
 matthew.brost@intel.com, lucas.demarchi@intel.com,
 john.c.harrison@intel.com
Subject: [PATCH v4 3/3] drm/xe/xe_guc_submit: Declare reset if banned or killed
Date: Fri,  5 Apr 2024 10:55:05 -0700
Message-Id: <20240405175505.1161756-3-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240405175505.1161756-1-jonathan.cavitt@intel.com>
References: <20240405175505.1161756-1-jonathan.cavitt@intel.com>
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

Add an additional condition to the reset_status guc_exec_queue_op that
returns true if the exec queue has been banned or killed.  The
reset_status op is only used for exiting any xe_wait_user_fence_ioctl
that waits on an exec queue without timing out, so doing this will exit
the ioctl early in cases where the exec queue can no longer function,
such as after a GuC stop during a reset.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index e72f2a6cad60a..d5182f66177f1 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1371,7 +1371,7 @@ static void guc_exec_queue_resume(struct xe_exec_queue *q)
 
 static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
 {
-	return exec_queue_reset(q);
+	return exec_queue_reset(q) || exec_queue_killed_or_banned(q);
 }
 
 /*
-- 
2.25.1

