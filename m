Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4AACDB474
	for <intel-xe@archiver.kernel.org>; Fri, 20 Oct 2023 04:54:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E38310E07B;
	Fri, 20 Oct 2023 04:54:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A8710E07B
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Oct 2023 04:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697777642; x=1729313642;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=S5i6OeAuRPFSWNQ70D1U0W4w5furxZzbpy5+GgQuonM=;
 b=DrOGFuF6k1kemVFQoQg71xR1G7xnKxUU2vBjU+0v1kdK1UIeDzJeyEgM
 CKa7li0+oOaeldYmIzGzpunNbl5jzBDu56MouW67bm0e87PX12EQy74g9
 /fAss7opC42Wxvpbtw664b60BOzLUAbWdF2sA1FkZEnpcpt4JP2hlTwnE
 fJ04TcrSJT+Twu1dH/2hA853t8ucni5jYwBRsCK05lrDDV4LIKuKn9Eng
 nggSI5ov6yuc9Da1QOsmDX6DFz9YTOCajTBTVgBpeKiu1eHsiFp5MQ/Cs
 sU1Zip2YK8bKNYUnOYqBrK6Y6qNfau3DRRfIUIETLFRMaCrXdyVtdLI+Z A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="385306666"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="385306666"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 21:54:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="733837994"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="733837994"
Received: from dut-dii-e5ff.iind.intel.com ([10.145.169.50])
 by orsmga006.jf.intel.com with ESMTP; 19 Oct 2023 21:53:59 -0700
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, oak.zeng@intel.com,
 intel-xe@lists.freedesktop.org, janga.rahul.kumar@intel.com
Date: Fri, 20 Oct 2023 10:20:13 +0530
Message-Id: <20231020045013.2042971-1-priyanka.dandamudi@intel.com>
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

Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Reviewed-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 3 +++
 include/uapi/drm/xe_drm.h          | 5 +++++
 2 files changed, 8 insertions(+)

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
index 24bf8f0f52e8..8b5e7e212f61 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -126,6 +126,11 @@ struct xe_user_extension {
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 #define DRM_IOCTL_XE_VM_MADVISE			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
 
+#define XE_ACC_GRANULARITY_128K 0
+#define XE_ACC_GRANULARITY_2M 1
+#define XE_ACC_GRANULARITY_16M 2
+#define XE_ACC_GRANULARITY_64M 3
+
 /** struct drm_xe_engine_class_instance - instance of an engine class */
 struct drm_xe_engine_class_instance {
 #define DRM_XE_ENGINE_CLASS_RENDER		0
-- 
2.25.1

