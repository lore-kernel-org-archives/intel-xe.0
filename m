Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63B1C77B75
	for <intel-xe@archiver.kernel.org>; Fri, 12 May 2023 23:37:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7506D10E52D;
	Fri, 12 May 2023 23:37:16 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E63710E52D
 for <intel-xe@lists.freedesktop.org>; Fri, 12 May 2023 23:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683934634; x=1715470634;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B8P3XHwGU56yxKrz6dTdd0zyRY+aKCbr398mNc5RZoQ=;
 b=XQpoYk7SIPwCvwFuzSgl2CuweGyUW4QcmDKYKcKYYyLOrYcUR2Mh4rZC
 LcLWcLNrBpQgzF9giem6KVmyvf2HRWBIcRrvKyFMStBZACBxDKpo7pkqr
 OijYrohwHjOVR6aqnFyBRGlqSbEiaU/DQe5z64EREC7Ccb11t5L+YN8BU
 AabULxu4L3mFPOwhGwqNc79L3dl/n6iaQjm+gys/Q2H8zt7O4+e77clQh
 1p4AyxCD9jl6zMxnMb04L/wApaU9x6/lwpZLEGTdQ1/4e8wGyBFrt+C38
 lwYUT036ThXVbH9PfyikP7acp2M+lKrTQuFMa2Sa7aaUYLYdYbVmwq02g g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="414284515"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="414284515"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 16:37:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="730993230"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="730993230"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 16:37:12 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 12 May 2023 16:36:49 -0700
Message-Id: <20230512233649.3218736-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Load HuC on Alderlake P
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Alderlake P uses TGL HuC and it was not added together with ADL-S,
because it was failing for unrelated reasons. Now that those are fixed,
allow it to load HuC.

	# cat /sys/kernel/debug/dri/0/gt0/uc/huc_info
	HuC firmware: i915/tgl_huc.bin
		status: RUNNING
		version: wanted 0.0, found 7.9
		uCode: 589504 bytes
		RSA: 256 bytes

	HuC status: 0x00090001

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 305e7f8992ea..317c541753fb 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -111,6 +111,7 @@ struct fw_blobs_by_type {
 	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 5))
 
 #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)				\
+	fw_def(ALDERLAKE_P,	no_ver(i915,	huc,	tgl))			\
 	fw_def(ALDERLAKE_S,	no_ver(i915,	huc,	tgl))			\
 	fw_def(DG1,		no_ver(i915,	huc,	dg1))			\
 	fw_def(ROCKETLAKE,	no_ver(i915,	huc,	tgl))			\
-- 
2.40.1

