Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78346CF3962
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 17:15:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4201D10E733;
	Thu, 19 Sep 2024 17:15:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="atFZFOo7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0FD310E733
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Sep 2024 17:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726766150; x=1758302150;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9QscscTqgx7yqtVK16k/4H8kd38elGQj/7g5iUHm0nA=;
 b=atFZFOo7b642X/ip2u2fIOcQpQb2S6VtiM0AyHdA11d9X8/v3FZGoenK
 LRAMFs3yCoYLvDIb//T2KwfeEZ6m6/LFbX2jPpVYiFi5c6vZ6rJWjuqow
 sgrPh5MVmh6O0qt5/HcmVIgu5vH/0TpZXkrfRW4K11nk2HC0MgYrGfBZ4
 MlVdU9h4Wjh/Yyh2Hmwkl01SKGI9chQa3Hs+BbJpGtzFL0bpLqZJzt80V
 CwpKToS/kFVpUpTFCRYMQ+1uYrAEJNDGSTZuqELix/l8F5iWiW+DqMJD2
 MLQRJkhXL0MiCp339oc3Bdpj74IiBf3Az6hoX2uHAVXrFWPNOLUfFT4i1 A==;
X-CSE-ConnectionGUID: QyRIwJLLRkKnlJcxgYIB2A==
X-CSE-MsgGUID: T8mWpu60S2SoRUEjJ3QY2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="29534499"
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="29534499"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 10:15:50 -0700
X-CSE-ConnectionGUID: zdNmLzSvR4eWtYATh8gbGg==
X-CSE-MsgGUID: ue7lMuiLTWqxhIGkeow8Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="107481149"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.120.199])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 10:15:50 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 5/5] drm/xe/pf: Allow to save and restore VF config blob from
 debugfs
Date: Thu, 19 Sep 2024 19:15:28 +0200
Message-Id: <20240919171528.1451-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240919171528.1451-1-michal.wajdeczko@intel.com>
References: <20240919171528.1451-1-michal.wajdeczko@intel.com>
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

For feature enabling and testing purposes, allow to capture and
replace full VF configuration using debugfs blob file, but only
under strict debug config.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 78 +++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index ccbcf6e572d0..91fc42e386d8 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -417,6 +417,81 @@ static const struct file_operations guc_state_ops = {
 	.llseek		= default_llseek,
 };
 
+/*
+ *      /sys/kernel/debug/dri/0/
+ *      ├── gt0
+ *      │   ├── vf1
+ *      │   │   ├── config_blob
+ */
+static ssize_t config_blob_read(struct file *file, char __user *buf,
+				size_t count, loff_t *pos)
+{
+	struct dentry *dent = file_dentry(file);
+	struct dentry *parent = dent->d_parent;
+	struct xe_gt *gt = extract_gt(parent);
+	unsigned int vfid = extract_vfid(parent);
+	ssize_t ret;
+	void *tmp;
+
+	ret = xe_gt_sriov_pf_config_save(gt, vfid, NULL, 0);
+	if (!ret)
+		return -ENODATA;
+	if (ret < 0)
+		return ret;
+
+	tmp = kzalloc(ret, GFP_KERNEL);
+	if (!tmp)
+		return -ENOMEM;
+
+	ret = xe_gt_sriov_pf_config_save(gt, vfid, tmp, ret);
+	if (ret > 0)
+		ret = simple_read_from_buffer(buf, count, pos, tmp, ret);
+
+	kfree(tmp);
+	return ret;
+}
+
+static ssize_t config_blob_write(struct file *file, const char __user *buf,
+				 size_t count, loff_t *pos)
+{
+	struct dentry *dent = file_dentry(file);
+	struct dentry *parent = dent->d_parent;
+	struct xe_gt *gt = extract_gt(parent);
+	unsigned int vfid = extract_vfid(parent);
+	ssize_t ret;
+	void *tmp;
+
+	if (*pos)
+		return -EINVAL;
+
+	if (!count)
+		return -ENODATA;
+
+	if (count > SZ_4K)
+		return -EINVAL;
+
+	tmp = kzalloc(count, GFP_KERNEL);
+	if (!tmp)
+		return -ENOMEM;
+
+	if (copy_from_user(tmp, buf, count)) {
+		ret = -EFAULT;
+	} else {
+		ret = xe_gt_sriov_pf_config_restore(gt, vfid, tmp, count);
+		if (!ret)
+			ret = count;
+	}
+	kfree(tmp);
+	return ret;
+}
+
+static const struct file_operations config_blob_ops = {
+	.owner		= THIS_MODULE,
+	.read		= config_blob_read,
+	.write		= config_blob_write,
+	.llseek		= default_llseek,
+};
+
 /**
  * xe_gt_sriov_pf_debugfs_register - Register SR-IOV PF specific entries in GT debugfs.
  * @gt: the &xe_gt to register
@@ -471,6 +546,9 @@ void xe_gt_sriov_pf_debugfs_register(struct xe_gt *gt, struct dentry *root)
 			debugfs_create_file("guc_state",
 					    IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV) ? 0600 : 0400,
 					    vfdentry, NULL, &guc_state_ops);
+			debugfs_create_file("config_blob",
+					    IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV) ? 0600 : 0400,
+					    vfdentry, NULL, &config_blob_ops);
 		}
 	}
 }
-- 
2.43.0

