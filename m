Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C9CC25B47
	for <intel-xe@archiver.kernel.org>; Fri, 27 Oct 2023 05:29:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F8310E91D;
	Fri, 27 Oct 2023 05:29:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C871E10E91D
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Oct 2023 05:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698384547; x=1729920547;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zLx92SvUUsCkH2ylHOWpOzG3J607wowneo1JotAYAow=;
 b=eYy7Hzmakg5UnmTFE1hwlFJEEeZmCW+8RdnDx57OhtK2LoJgbn6Rpn8h
 4aYJGQM8sSCrbVjzAPhLXf5xChdSRO7jhdWgevTcQrM6d//Uj3zavBgca
 7e2y6QHIrW6cjf9D8tM+M1USll5Jlf9wLHAFC493ORp6y03DIthaXPwtu
 x62G7aRVeQug3tXdtosekV2B2Oqp7voUi0o4sWiWzuPvjZUpLHAReCNCx
 hszGcHo3tYbKN2ZiYmiS4cUOqdXBw7V3JaefUTMSEiF8kyhc5+5zW8APv
 QbWD8p492N78q3DPEbh9LftTukAoGLoZ1XCuZhgtz5KJl3KCQrFoB7Dju g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="451951403"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="451951403"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 22:29:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="719810"
Received: from dut-dii-e5ff.iind.intel.com ([10.145.169.50])
 by fmviesa002.fm.intel.com with ESMTP; 26 Oct 2023 22:28:53 -0700
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, intel-xe@lists.freedesktop.org,
 janga.rahul.kumar@intel.com, oak.zeng@intel.com, brian.welty@intel.com
Date: Fri, 27 Oct 2023 10:55:07 +0530
Message-Id: <20231027052507.2064919-1-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/xe_exec_queue: Add check for access
 counter granularity
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Add conditional check for access counter granularity.
This check will return -EINVAL if granularity is beyond 64M
which is a hardware limitation.

v2: Defined
XE_ACC_GRANULARITY_128K 0
XE_ACC_GRANULARITY_2M 1
XE_ACC_GRANULARITY_16M 2
XE_ACC_GRANULARITY_64M 3
as part of uAPI.
So, that user can also use it.(Oak)

v3: Move uAPI to proper location and give proper
documentation.(Brian, Oak)

Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Reviewed-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c |  3 +++
 include/uapi/drm/xe_drm.h          | 14 ++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index dd61c4267e24..4fd44a9203e4 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -393,6 +393,9 @@ static int exec_queue_set_acc_granularity(struct xe_device *xe, struct xe_exec_q
 	if (XE_IOCTL_DBG(xe, !xe->info.supports_usm))
 		return -EINVAL;
 
+	if (value > XE_ACC_GRANULARITY_64M)
+		return -EINVAL;
+
 	q->usm.acc_granularity = value;
 
 	return 0;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 24bf8f0f52e8..9bd7092a7ea4 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -731,6 +731,20 @@ struct drm_xe_vm_bind {
 	__u64 reserved[2];
 };
 
+/* For use with XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY */
+
+/* Monitor 128KB contiguous region with 4K sub-granularity */
+#define XE_ACC_GRANULARITY_128K 0
+
+/* Monitor 2MB contiguous region with 64KB sub-granularity */
+#define XE_ACC_GRANULARITY_2M 1
+
+/* Monitor 16MB contiguous region with 512KB sub-granularity */
+#define XE_ACC_GRANULARITY_16M 2
+
+/* Monitor 64MB contiguous region with 2M sub-granularity */
+#define XE_ACC_GRANULARITY_64M 3
+
 /**
  * struct drm_xe_exec_queue_set_property - exec queue set property
  *
-- 
2.25.1

