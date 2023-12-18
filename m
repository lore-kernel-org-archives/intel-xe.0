Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 802A7C46CA2
	for <intel-xe@archiver.kernel.org>; Mon, 18 Dec 2023 21:27:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD5810E2C6;
	Mon, 18 Dec 2023 21:27:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84ABA10E2C6
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Dec 2023 21:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702934851; x=1734470851;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CgPtM/O4HVx6Tvlr6koutyFt+9biKBxGttQb00cOQ+k=;
 b=F6UvgKGv1OyTfflHCOF+nUkbhoSTw3fSOc2rztv1s3jq6wpvrILSWQs8
 zGl8jXxtopKAGyvKcb3ETUOmjel4hyyoUzxDDzThDQ0fkSG+gbGt8v+33
 LnCy8iLUDb36uzsElgElrv6r6HBggkqdR9tMth3RVVXcMJZl4vBXrRe8x
 jIYhfAtvZUwFlZdq50fD4mO9xRDfiUDoLsg5ftD0fJqDl0HlIKBnwDini
 6YLJ0GfG/ee7+1cJEMRnjnOZVx9tK+r4Ln8zZWgyacS8Y20uoxl2nO48A
 iEUGi6UO0fFZQ3SajAKbVI7DOhIvNWdGjo0lmS8CkdNr0Q7BWFHAtMev3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="394448800"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="394448800"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 13:27:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="1107101559"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="1107101559"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 13:27:29 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Remove ci-only GuC FW definitions
Date: Mon, 18 Dec 2023 13:27:47 -0800
Message-ID: <20231218212747.1136433-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

As part of the FW definitions, we declare each blob as required via the
MODULE_FIRMWARE() macro. This causes the initramfs update (or equivalent
process) to look for the blobs on disk when the kernel is installed;
therefore, we need to make sure that all FWs we define are available in
linux-firmware.

We currently don't plan to push the PVC and LNL blobs to linux-firmware,
so we need to remove them from the list. we can then re-add them in the
topic/core-for-CI branch until we're ready to push them to the official
repo.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---

This patch is intended to be added to the PR sent for drm-next, with a
revert of it being added to topic/core-for-CI afterwards. It is expected
that PVC CI will fail due to the lack of FW, but the other platforms
should still work.

Note that this patch remove the last uses of the mmp FWs, but the
support for those has been left in because we do plan to use mmp tags
for early FW drops in the CI branch.

 drivers/gpu/drm/xe/xe_uc_fw.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 73d6938c921d..9dff96dfe455 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -102,9 +102,7 @@ struct fw_blobs_by_type {
 };
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
-	fw_def(LUNARLAKE,	mmp_ver(xe,	guc,	lnl,	70, 6, 8))	\
 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 7))		\
-	fw_def(PVC,		mmp_ver(xe,	guc,	pvc,	70, 9, 1))	\
 	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 5))		\
 	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 5))		\
 	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 5))		\
-- 
2.43.0

