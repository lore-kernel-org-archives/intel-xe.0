Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2DFAC6FD19
	for <intel-xe@archiver.kernel.org>; Mon, 13 Mar 2023 23:11:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71B5110E08D;
	Mon, 13 Mar 2023 23:11:48 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0578B10E08D
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Mar 2023 23:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678749107; x=1710285107;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lIOutTxQC6Gt3yY4HEarQJXqBlHGF+6Uwo/bt2n0stU=;
 b=eneI1dORLfR2dEcYWLfg+DoSNb2cwW7E3ObiitiOCp5dklsVEmdOE8Kb
 YA6/ilXVoQPfa0N74awOssuIjwjolYgn+9WZfNueUN2SFbkYd4qSGEORY
 MHrKnb3T+/tm07nWA/rY5nrX//sBDkQfaJCtPTFxVt9p7b6agYNeqXKJr
 +P58/XLpKOkC/RbO4r+JSeJsLSMJmwIXx/+uyOv8s7sA7/ldGGisAdhaI
 jXWoSSfLvLiTdXmOaIHJ3hWgkcJeD2ii3DuRDgQ9v5ciphSbpkXzaUGoB
 sw7qLqWGlC4ViuFxD2Pltr+LJE4FPYREMcIJ6sElEZ7dygWMjHRYNjpwO w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="338828237"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; d="scan'208";a="338828237"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 16:11:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="681203854"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; d="scan'208";a="681203854"
Received: from hongyoun-mobl.amr.corp.intel.com (HELO
 anushasr-mobl7.intel.com) ([10.252.143.121])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 16:11:46 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 13 Mar 2023 16:11:20 -0700
Message-Id: <20230313231120.319346-1-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/huc: Load HuC on Alderlake P and
 Alderlake S
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Extending HUC loading support on more platforms.

Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index ff94eec9cafe..5a28ec79fb9d 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -51,8 +51,10 @@ static struct xe_device *uc_fw_to_xe(struct xe_uc_fw *uc_fw)
 	fw_def(TIGERLAKE,    0, guc_def(tgl,  70, 5, 2))
 
 #define XE_HUC_FIRMWARE_DEFS(fw_def, huc_def) \
-	fw_def(DG1,          0, huc_def(dg1,  7, 9, 3)) \
-	fw_def(TIGERLAKE,    0, huc_def(tgl,  7, 9, 3))
+	fw_def(DG1,            0, huc_def(dg1,  7, 9, 3)) \
+	fw_def(TIGERLAKE,      0, huc_def(tgl,  7, 9, 3)) \
+	fw_def(ALDERLAKE_P,    0, huc_def(tgl,  7, 9, 3)) \
+	fw_def(ALDERLAKE_S,    0, huc_def(tgl,  7, 9, 3))
 
 #define __MAKE_UC_FW_PATH_MAJOR(prefix_, name_, major_) \
 	"xe/" \
-- 
2.25.1

