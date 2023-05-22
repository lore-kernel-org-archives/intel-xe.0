Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BC4C77B75
	for <intel-xe@archiver.kernel.org>; Mon, 22 May 2023 11:01:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 992BF10E2C0;
	Mon, 22 May 2023 11:01:53 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE4010E2C0
 for <intel-xe@lists.freedesktop.org>; Mon, 22 May 2023 11:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684753312; x=1716289312;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=is5f1QL8lHy2S0kS0Y6JpnB+63gAuSoqVEr5m/ZflmE=;
 b=EWs8VjDvWUsChvBDYUpVPsQf3xL+cxjsIDSbN9WWLXmqecfCe8bDGjsT
 gKSLRJAvvoj+sWWBpOQqcHfmeNNjQNzF9xILipjZaZk9bAnCUg7HmfWMW
 OxNiuGnZBHUQ32KifjMX4bZVhRG43xjNcAs920Eaf7xinkHdj3i+loWYN
 vucpFIq4rbNX1XutME7eq4u4qOFKMtTwmZGWlo9XoklSCe4Gq6aHDACuh
 P7GbBhQPBMoW9k0hgZeFDzsHiStVPesX5wh5DAPxZf+8hDUEBlhvLd4kg
 FZZUosadPuuoixqgnD6mrW6NQV/2vjpBN4PTtjCrlXeuVg7zLRjY/QA9P g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="351738665"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="351738665"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 04:01:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="703463931"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="703463931"
Received: from amigon-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.249.128.230])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 04:01:50 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 22 May 2023 12:01:33 +0100
Message-Id: <20230522110133.25968-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: fix kernel-doc issues
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

drivers/gpu/drm/xe/xe_guc_submit_types.h:47: warning: cannot understand
function prototype: 'struct guc_submit_parallel_scratch '

drivers/gpu/drm/xe/xe_devcoredump_types.h:38: warning: Function
parameter or member 'ct' not described in 'xe_devcoredump_snapshot'

CI doesn't appear to be running BAT anymore, assuming this is caused by
the CI.Hooks now failing due to above warnings.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump_types.h | 2 +-
 drivers/gpu/drm/xe/xe_guc_submit_types.h  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index 350b905d1797..c0d711eb6ab3 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -27,7 +27,7 @@ struct xe_devcoredump_snapshot {
 	ktime_t boot_time;
 
 	/* GuC snapshots */
-	/** @ct_snapshot: GuC CT snapshot */
+	/** @ct: GuC CT snapshot */
 	struct xe_guc_ct_snapshot *ct;
 	/** @ge: Guc Engine snapshot */
 	struct xe_guc_submit_engine_snapshot *ge;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit_types.h b/drivers/gpu/drm/xe/xe_guc_submit_types.h
index 88e855dae056..6765b2c6eab1 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit_types.h
@@ -41,7 +41,7 @@ struct sync_semaphore {
 };
 
 /**
- * Struct guc_submit_parallel_scratch - A scratch shared mapped buffer.
+ * struct guc_submit_parallel_scratch - A scratch shared mapped buffer.
  */
 struct guc_submit_parallel_scratch {
 	/** @wq_desc: Guc scheduler workqueue descriptor */
-- 
2.40.1

