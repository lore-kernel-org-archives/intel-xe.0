Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2610EB64D9
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jun 2023 22:29:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 837EE10E341;
	Tue, 27 Jun 2023 22:29:12 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A6010E341
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jun 2023 22:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687904950; x=1719440950;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fvhR06jzCuN+aVklXMefVIrjfzZTgB69foXB6C3PYp4=;
 b=nYoAW+ZALnXKVA39eaHHmTTZn2qXV1AamwX6H9kvmHoA5hjg04hXvQu/
 +jPmwTEgg6hEKEfc/EH/LQ5MKBUX8eTq10Tl5TIp0fmcCrDDReZnNkGEc
 yIEM/9HTYqcG2ksufhd8Jo8CGr3oeg8WQyk5LEBqgzeoAaX4P5+WE9Dd7
 /XDwHAkh1fHn7IrDlTNQNqto5c7sxo6p1r6xwitYFvf55yj1dlNdUD/g8
 lwpSYSJEjfwTOrsIK9XOm4HvuCLAvufGmnN1IWSQMkvkNh5VCY7RyH/r7
 4NLopFuhG/rMpR4mjYe3xySth3bCIkmzS9fEsxj98L0/1EBBPN1/K0IV9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="361738486"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="361738486"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 15:29:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="963365106"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="963365106"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 15:29:08 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 27 Jun 2023 15:28:56 -0700
Message-ID: <20230627222856.3165647-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: fix HuC FW ordering for DG1
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

The firmware definitions must be ordered based on platform, from newer
to older, which means that the DG1 FW must come before the ADL one.

References: https://gitlab.freedesktop.org/drm/intel/-/issues/8699
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index b05038921e02..1aa9a4925574 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -111,9 +111,9 @@ struct fw_blobs_by_type {
 	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 5))
 
 #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)				\
+	fw_def(DG1,		no_ver(i915,	huc,	dg1))			\
 	fw_def(ALDERLAKE_P,	no_ver(i915,	huc,	tgl))			\
 	fw_def(ALDERLAKE_S,	no_ver(i915,	huc,	tgl))			\
-	fw_def(DG1,		no_ver(i915,	huc,	dg1))			\
 	fw_def(ROCKETLAKE,	no_ver(i915,	huc,	tgl))			\
 	fw_def(TIGERLAKE,	no_ver(i915,	huc,	tgl))
 
-- 
2.41.0

