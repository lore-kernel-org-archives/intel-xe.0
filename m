Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D02BCCA464
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 19:09:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0518112462;
	Thu, 15 Oct 2026 19:08:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E64F111244C
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 19:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792091328; x=1823627328;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CPnkh/7mvrerlY/S05XESnC4sOE6c1q/aRsNWeyn1vU=;
 b=d4VWS1NCiwACVSG2BD6683m3DN5Pt8QsMcQ4l0OW+aIsxCyq9ZZlUXtx
 JFbeQwJK50/hgYSXlNvusacVDahw1fBGm8xJHyk1ecqnyG0H0RZOxPG/0
 /DKGC8apkN5/+Ikvf2usjwsxcH2WYpKRUGQT26ovj4anHUudq2nVlXEY2
 QUczN3x1W9psXSux+yJwthMy4S5l6hFODl5kt3Q+CpjaMPI6gBsm2aDiY
 SwYOE8Kx4fsInWUOxmsQ3aIxxqy+83OzK0/Nm3UwhXNdRQcIviGk6xko+
 floLbuGT1H+F2xUcVL+PPhkVcEFEqMCpQgcTSh1S45P3/yS9Wrw2AI88O g==;
X-CSE-ConnectionGUID: sZtlJ+WLTdqOhiPweo2dkQ==
X-CSE-MsgGUID: aIxMasj5QTeNFH3ZXElsbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="770365"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="770365"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 12:08:48 -0700
X-CSE-ConnectionGUID: bMxP0X7wTxu75Q+MOZmSuA==
X-CSE-MsgGUID: oD0rK7ISS9m8pFAVLrzrag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1835231"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 12:08:46 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 ravi.kishore.koppuravuri@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v3 3/9] drm/xe/pcode: add ordered write batch helper
Date: Fri, 16 Oct 2026 00:37:45 +0530
Message-Id: <20261015190751.1268916-4-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261015190751.1268916-1-karthik.poosa@intel.com>
References: <20261015190751.1268916-1-karthik.poosa@intel.com>
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

Provide a pcode write helper that keeps the mailbox lock held while issuing
an ordered sequence of writes.
This will be used while writing the fan table ensuring that is not
interleaved by any other pcode mailbox command.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_pcode.c | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pcode.h |  7 +++++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index 266deecbb100..ca107b0234d9 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -124,6 +124,26 @@ int xe_pcode_write_timeout(struct xe_tile *tile, u32 mbox, u32 data, int timeout
 	return err;
 }
 
+int xe_pcode_write_batch(struct xe_tile *tile, const struct xe_pcode_write *writes,
+			 unsigned int count)
+{
+	unsigned int i;
+	int err = 0;
+
+	mutex_lock(&tile->pcode.lock);
+	for (i = 0; i < count; i++) {
+		u32 data = writes[i].data;
+
+		err = pcode_mailbox_rw(tile, writes[i].mbox, &data, NULL, PCODE_DEFAULT_TIMEOUT_MS,
+				       false, false);
+		if (err)
+			break;
+	}
+	mutex_unlock(&tile->pcode.lock);
+
+	return err;
+}
+
 int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 data0, u32 data1, int timeout)
 {
 	int err;
diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
index 7e43792b0037..74bd553ab390 100644
--- a/drivers/gpu/drm/xe/xe_pcode.h
+++ b/drivers/gpu/drm/xe/xe_pcode.h
@@ -18,6 +18,11 @@ struct xe_pcode_version {
 	u32 engg;
 };
 
+struct xe_pcode_write {
+	u32 mbox;
+	u32 data;
+};
+
 #define PCODE_DEFAULT_TIMEOUT_MS	10
 
 int xe_pcode_init_early(struct xe_tile *tile);
@@ -28,6 +33,8 @@ int xe_pcode_init_min_freq_table(struct xe_tile *tile, u32 min_gt_freq,
 int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val0, u32 *val1);
 int xe_pcode_write_timeout(struct xe_tile *tile, u32 mbox, u32 val,
 			   int timeout_ms);
+int xe_pcode_write_batch(struct xe_tile *tile, const struct xe_pcode_write *writes,
+			 unsigned int count);
 int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 data0,
 			     u32 data1, int timeout);
 int xe_get_pcode_version(struct xe_device *xe, struct xe_pcode_version *version);
-- 
2.25.1

