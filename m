Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93CBBC77B7E
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 17:55:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 736D010E1D2;
	Wed, 19 Apr 2023 17:55:10 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A20D10EA39
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 17:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681926904; x=1713462904;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3t2u/MW+Ce6weDQIFi5hCcD2PtEEUIg51/cLLswOX4A=;
 b=JhRdtO8eUsB0itjzRJKC58+ANtwtD0PHbvo81J82yZ3F2u3IQAja3tyR
 bTgX4aGToUmaU8BE95RvPMnUMaaQpAuBpCrN4evXAHH9bhp3ypZQWQmG3
 JcsENEkKO9mzphEx4K3cx92VA9gLR9bgsnsy74o2P5c85xyt78os2S2Jh
 5y95XruJ8fzrSuEb3IFphaoCUiqMuaDXeOG+I2OB3gawa0KQ3JrXXo2Ur
 dF7/6OBDtOsmHQt21m3FigwT8llK5yGpbTYJwkB0XB0hfzVGf4lTf90p6
 UUvX6G0mMNQPzcuSCFPx8OeWcerikXd+2GFfstWvn76VBHAtf0kKGS60P w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="408429380"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="408429380"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 10:55:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="722022444"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="722022444"
Received: from dut125tglh.fm.intel.com ([10.105.23.23])
 by orsmga008.jf.intel.com with ESMTP; 19 Apr 2023 10:55:02 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Date: Wed, 19 Apr 2023 17:54:59 +0000
Message-Id: <20230419175501.155319-3-stuart.summers@intel.com>
X-Mailer: git-send-email 2.38.1.143.g1fc3c0ad40
In-Reply-To: <20230419175501.155319-1-stuart.summers@intel.com>
References: <20230419175501.155319-1-stuart.summers@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/4] drm/xe: Refactor debugfs into an early and
 late part
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
Cc: stuart.summers@intel.com, matthew.d.roper@intel.com,
 lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Split the device info piece of debugfs into an earlier
call to allow the device info to be defined prior to
full device initialization in the xe_device_probe()
routine.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 14 ++++++++++----
 drivers/gpu/drm/xe/xe_debugfs.h |  1 +
 drivers/gpu/drm/xe/xe_pci.c     |  2 ++
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 7827a785b020..4b381861344a 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -94,6 +94,16 @@ static const struct file_operations forcewake_all_fops = {
 	.release = forcewake_release,
 };
 
+void xe_debugfs_register_early(struct xe_device *xe)
+{
+	struct drm_minor *minor = xe->drm.primary;
+	struct dentry *root = minor->debugfs_root;
+
+	drm_debugfs_create_files(debugfs_list,
+				 ARRAY_SIZE(debugfs_list),
+				 root, minor);
+}
+
 void xe_debugfs_register(struct xe_device *xe)
 {
 	struct ttm_device *bdev = &xe->ttm;
@@ -104,10 +114,6 @@ void xe_debugfs_register(struct xe_device *xe)
 	u32 mem_type;
 	u8 id;
 
-	drm_debugfs_create_files(debugfs_list,
-				 ARRAY_SIZE(debugfs_list),
-				 root, minor);
-
 	debugfs_create_file("forcewake_all", 0400, root, xe,
 			    &forcewake_all_fops);
 
diff --git a/drivers/gpu/drm/xe/xe_debugfs.h b/drivers/gpu/drm/xe/xe_debugfs.h
index 715b8e2e0bd9..5fe31520ac98 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.h
+++ b/drivers/gpu/drm/xe/xe_debugfs.h
@@ -8,6 +8,7 @@
 
 struct xe_device;
 
+void xe_debugfs_register_early(struct xe_device *xe);
 void xe_debugfs_register(struct xe_device *xe);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index c968c9a19de3..f8ca179254fa 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -452,6 +452,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	xe_display_info_init(xe);
 
+	xe_debugfs_register_early(xe);
+
 	err = xe_device_init(xe);
 	if (err)
 		return err;
-- 
2.38.1.143.g1fc3c0ad40

