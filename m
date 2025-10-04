Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC667CAC5BB
	for <intel-xe@archiver.kernel.org>; Sat,  4 Oct 2025 16:20:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69D9210E232;
	Sat,  4 Oct 2025 16:20:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kyzi7UaR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6549810E232
 for <intel-xe@lists.freedesktop.org>; Sat,  4 Oct 2025 16:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759594850; x=1791130850;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GkSEB6yNV9jTtnWoQYvbuURo6OjHIBMIBchzZhXekbs=;
 b=Kyzi7UaRTae1jqVLC4QVMGsAdoK8PaCGuPgDaWfrUM+x2uLTj2bxpEvZ
 EuM0h83qxR2aYzYEOHhR9FLy4m07+vA/3bV8OiZaija8Hwx2rdQJAVJsv
 G1j/iyrLiG6Ea/ddh++oacgSmFGAaDT0P1jBlNBoxrLMArOcA/YbAnH9s
 QsrzmNoCHOyLaVYpjopJ7yqqIschvIM6OpgNslUwigs3iovzdbFC+Dkyt
 kWRPmcMEJxYpZFDEZZHMmaTkVId1wD6o/4MYedcU7gp0rgHvZLkrO7IQh
 xluuZlJYE4nCrWwpS7IHt+NCubJl28Hpqr7KD436QQLVjfWgg3p7Msim2 w==;
X-CSE-ConnectionGUID: 6AKAl+v5QuSs1Qd7uWOdxA==
X-CSE-MsgGUID: Hn1KDQwuQQqH8XxtkSRM+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11572"; a="84465967"
X-IronPort-AV: E=Sophos;i="6.18,315,1751266800"; d="scan'208";a="84465967"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2025 09:20:50 -0700
X-CSE-ConnectionGUID: u+LfkVOWRgmOB5FN7XK1Og==
X-CSE-MsgGUID: +nVVzJQiQtGFJ1Fau5ZZrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,315,1751266800"; d="scan'208";a="178809136"
Received: from smanmadh-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.173])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2025 09:20:49 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe/pf: Improve reading VF config blob from debugfs
Date: Sat,  4 Oct 2025 18:20:34 +0200
Message-ID: <20251004162036.1800-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Due to the use of the file operation flows, we might encode the
VF config blob multiple times. Avoid that by capturing it once
during the open() operation instead of the read() operation.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 44 +++++++++++++++------
 1 file changed, 33 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index 44fec2aae536..c026a3910e7e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -436,15 +436,19 @@ static const struct file_operations guc_state_ops = {
  *                  :   ├── config_blob
  */
 
-static ssize_t config_blob_read(struct file *file, char __user *buf,
-				size_t count, loff_t *pos)
+struct config_blob_data {
+	size_t size;
+	u8 blob[];
+};
+
+static int config_blob_open(struct inode *inode, struct file *file)
 {
 	struct dentry *dent = file_dentry(file);
 	struct dentry *parent = dent->d_parent;
 	struct xe_gt *gt = extract_gt(parent);
 	unsigned int vfid = extract_vfid(parent);
+	struct config_blob_data *cbd;
 	ssize_t ret;
-	void *tmp;
 
 	ret = xe_gt_sriov_pf_config_save(gt, vfid, NULL, 0);
 	if (!ret)
@@ -452,16 +456,27 @@ static ssize_t config_blob_read(struct file *file, char __user *buf,
 	if (ret < 0)
 		return ret;
 
-	tmp = kzalloc(ret, GFP_KERNEL);
-	if (!tmp)
+	cbd = kzalloc(struct_size(cbd, blob, ret), GFP_KERNEL);
+	if (!cbd)
 		return -ENOMEM;
 
-	ret = xe_gt_sriov_pf_config_save(gt, vfid, tmp, ret);
-	if (ret > 0)
-		ret = simple_read_from_buffer(buf, count, pos, tmp, ret);
+	ret = xe_gt_sriov_pf_config_save(gt, vfid, cbd->blob, ret);
+	if (ret < 0) {
+		kfree(cbd);
+		return ret;
+	}
 
-	kfree(tmp);
-	return ret;
+	cbd->size = ret;
+	file->private_data = cbd;
+	return nonseekable_open(inode, file);
+}
+
+static ssize_t config_blob_read(struct file *file, char __user *buf,
+				size_t count, loff_t *pos)
+{
+	struct config_blob_data *cbd = file->private_data;
+
+	return simple_read_from_buffer(buf, count, pos, cbd->blob, cbd->size);
 }
 
 static ssize_t config_blob_write(struct file *file, const char __user *buf,
@@ -498,11 +513,18 @@ static ssize_t config_blob_write(struct file *file, const char __user *buf,
 	return ret;
 }
 
+static int config_blob_release(struct inode *inode, struct file *file)
+{
+	kfree(file->private_data);
+	return 0;
+}
+
 static const struct file_operations config_blob_ops = {
 	.owner		= THIS_MODULE,
+	.open		= config_blob_open,
 	.read		= config_blob_read,
 	.write		= config_blob_write,
-	.llseek		= default_llseek,
+	.release	= config_blob_release,
 };
 
 static void pf_add_compat_attrs(struct xe_gt *gt, struct dentry *dent, unsigned int vfid)
-- 
2.47.1

