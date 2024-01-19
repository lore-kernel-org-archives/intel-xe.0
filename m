Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7749C47DB7
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jan 2024 08:07:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9117D10E961;
	Fri, 19 Jan 2024 08:07:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D23BB10E961
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jan 2024 08:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705651622; x=1737187622;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bih00qyS2vh6mP0Hh5yzBPAixtYXUBFx0EK42Eq8GPQ=;
 b=VQL7E1lnnyqnq/Hu1/D08hDJz1sAhVw886EuqQPmYbcCVCHcGEhwruK1
 tSYtUsMooLudCtwFbL7pY0JizW1iVj8bayUdOMAZUJM+PfFIG4SVfze4N
 qHl6ZmbQcs/xoI9QCnbaiu3p1cHG9hKdkMtYTQrK1VbCNEabXquZuKee/
 EinIkMmEICGfeQuPwfSwDdDANYx8veQSDIMLt+Z1gazKhwtDYwG7i0/OP
 260lr170JtgwXpAdZfHhywFfY5dUrixRxoHc3qU0XIi1FeZeQkTl6+WhS
 OKqSdlX3hzax8RKvtdIfE8bKa1cELBnWybJo44aZT0HoVTozh5fCcDVM9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="19272385"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="19272385"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 00:06:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="26707272"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 00:06:56 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/debugfs: Expose debugfs entry to check guc pc support
Date: Fri, 19 Jan 2024 13:48:52 +0530
Message-Id: <20240119081852.1858212-1-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: matthew.d.roper@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Expose debugfs entry to check if platform support GuC PC (SLPC) feature.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index c56fd7d59f05..2f474bf0e7c7 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -30,6 +30,13 @@ static struct xe_device *node_to_xe(struct drm_info_node *node)
 	return to_xe_device(node->minor->dev);
 }
 
+static int is_gucpc_supported(struct seq_file *m, void *data)
+{
+	struct xe_device *xe = node_to_xe(m->private);
+
+	return (int)!xe->info.skip_guc_pc;
+}
+
 static int info(struct seq_file *m, void *data)
 {
 	struct xe_device *xe = node_to_xe(m->private);
@@ -67,6 +74,7 @@ static int info(struct seq_file *m, void *data)
 
 static const struct drm_info_list debugfs_list[] = {
 	{"info", info, 0},
+	{"is_gucpc_supported", is_gucpc_supported, 0},
 };
 
 static int forcewake_open(struct inode *inode, struct file *file)
-- 
2.25.1

