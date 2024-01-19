Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26204C47DAF
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jan 2024 12:58:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3943610E9FA;
	Fri, 19 Jan 2024 12:58:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E6410E9EC
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jan 2024 12:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705669113; x=1737205113;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Vm8L9y2dKSOweLA23nv0Fqwgfifx37y0cOeQJX1unZY=;
 b=TDIiG1BNHU3rf8FAopoj3FAnNZrbWX+qIxU/bnEDa4+PbctWAkfUUefg
 ue1JJL8MAfF4Sms7lvVLF8kRpVYT4JixS6NexpctkvflGX6OiThHOUHv8
 sqY1UzE221S6+1NlOOx0cv6qkgyR84bq3t306c/wv1oPFTvcFmbjvSqjl
 +8b/8O0fSwi0TSaEEKh2fcbQzHJtSg6JQhzobVWQAZSUIvCU/2QB4m3ny
 54Ls6j96qFneF7j2NBuVzNihvV3UNMLBsrnjBjfcf3p75nc2N5TxRGLGF
 tPe6spuPjuQvum1J6LSYL7TCmVEfdXPW9F2f3mK4411JtCPiqkGAnMk5J g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7495415"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="7495415"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 04:58:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="19403325"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 04:58:27 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/xe_debugfs: Print skip_guc_pc in xe info
Date: Fri, 19 Jan 2024 18:40:25 +0530
Message-Id: <20240119131025.1872947-1-badal.nilawar@intel.com>
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
Cc: rodrigo.vivi@intel.com, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Print xe->info.skip_guc_pc in xe info

Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index c56fd7d59f05..01db5b27bec5 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -55,6 +55,7 @@ static int info(struct seq_file *m, void *data)
 	drm_printf(&p, "force_execlist %s\n", str_yes_no(xe->info.force_execlist));
 	drm_printf(&p, "has_flat_ccs %s\n", str_yes_no(xe->info.has_flat_ccs));
 	drm_printf(&p, "has_usm %s\n", str_yes_no(xe->info.has_usm));
+	drm_printf(&p, "skip_guc_pc %s\n", str_yes_no(xe->info.skip_guc_pc));
 	for_each_gt(gt, xe, id) {
 		drm_printf(&p, "gt%d force wake %d\n", id,
 			   xe_force_wake_ref(gt_to_fw(gt), XE_FW_GT));
-- 
2.25.1

