Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE5C7C36010
	for <intel-xe@archiver.kernel.org>; Tue,  1 Apr 2025 15:36:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F6810E5E5;
	Tue,  1 Apr 2025 15:36:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kADkIWjd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E01F710E5E5
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Apr 2025 15:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743521810; x=1775057810;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZpTd5OkMjuoDC2SxjqRXjmiHErjVUtHrIzbrcRffy/g=;
 b=kADkIWjdvU2mkBfbMukMjY3VJdeJjFizpmQCcmA5928ndUO4CLMsB9KY
 c9Tp1G0jm6cRv86HqY/osrXvnMkd4cxaN1IOAmcU4m0BNl/IgCaUin2dT
 x5AlD92VQ9Rs30BBSbZ3bzCZPfT5L/L0uNgm7hNrKfKcPICdCQe0GrJSF
 QdnHn/Q3hjTLslzyF/PXVs0/8EX6UdY3UIZ8bw4ZcITdgIIJwuXPCFMu8
 Nwhvt0+xKuRYAXczQGb1IHLzl3fSdue8XD4tNVqkBkpIsD0UBBXAQhNmx
 2YlJ5jExpGt2WXknOwligO5g51ZCS6gl9ofq6xbGSOWqUOyrRc8vD+Xhz w==;
X-CSE-ConnectionGUID: HPXAFv+SR8KYLWJm4J8QDA==
X-CSE-MsgGUID: OTXdD+cqS0y36CIPnbgF/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="67324997"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="67324997"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 08:36:50 -0700
X-CSE-ConnectionGUID: K+jpO5U1RgmjmUwqZV+vhg==
X-CSE-MsgGUID: SBoJ7e8zQ1OlP/+wBFG1Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="126411018"
Received: from anshuma1-desk.iind.intel.com ([10.190.239.112])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 08:36:46 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-xe@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org
Cc: rafael@kernel.org, lenb@kernel.org, bhelgaas@google.com,
 ilpo.jarvinen@linux.intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, badal.nilawar@intel.com, anshuman.gupta@intel.com,
 varun.gupta@intel.com, ville.syrjala@linux.intel.com, uma.shankar@intel.com
Subject: [PATCH 12/12] drm/xe/vrsr: Introduce a debugfs node named vrsr_capable
Date: Tue,  1 Apr 2025 21:02:25 +0530
Message-ID: <20250401153225.96379-13-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250401153225.96379-1-anshuman.gupta@intel.com>
References: <20250401153225.96379-1-anshuman.gupta@intel.com>
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

From: Badal Nilawar <badal.nilawar@intel.com>

Add a debugfs node named vrsr_capable to check if the device supports
VRSR

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index d0503959a8ed..9f8d635c750c 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -191,6 +191,23 @@ static const struct file_operations wedged_mode_fops = {
 	.write = wedged_mode_set,
 };
 
+static ssize_t vrsr_capable_show(struct file *f, char __user *ubuf,
+				size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	char buf[32];
+	int len = 0;
+
+	len = scnprintf(buf, sizeof(buf), "%s\n", xe->d3cold.vrsr_capable ? "true" : "false");
+
+	return simple_read_from_buffer(ubuf, size, pos, buf, len);
+}
+
+static const struct file_operations vrsr_capable_fops = {
+	.owner = THIS_MODULE,
+	.read = vrsr_capable_show,
+};
+
 void xe_debugfs_register(struct xe_device *xe)
 {
 	struct ttm_device *bdev = &xe->ttm;
@@ -211,6 +228,9 @@ void xe_debugfs_register(struct xe_device *xe)
 	debugfs_create_file("wedged_mode", 0600, root, xe,
 			    &wedged_mode_fops);
 
+	debugfs_create_file("vrsr_capable", 0400, root, xe,
+			    &vrsr_capable_fops);
+
 	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
 		man = ttm_manager_type(bdev, mem_type);
 
-- 
2.43.0

