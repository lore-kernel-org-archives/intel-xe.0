Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF8DC46CA2
	for <intel-xe@archiver.kernel.org>; Tue, 19 Dec 2023 20:00:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D19E810E1F2;
	Tue, 19 Dec 2023 20:00:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE81310E1F2
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Dec 2023 20:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703016048; x=1734552048;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PMIkFGrkqKpMk2NsJBulEiFYn6ZuKun3JSENyR7SoPA=;
 b=Qs26KuWH6ZC7UTdZBnv7gnWK/5oAxh0TfVz97v0bP9Cagjd5zuR6Navk
 jP8pgi6exjH1Mm89/OwWdC1NWEF810CU4rZlvGur7Ag0WjI4GJUZ+EFMp
 rrRteXNZ7LjKk4SqVrO8FC+Zr/ep58+l8aef/VxM3vaFbBLVlWABtiOYp
 CZuvq+vpVSpTAt74zmrvZiRgPiKYu0ycoH0gj6GZS4+1E0fbUOCW/3MaQ
 0m3QGT0KIO80A4z1Al6Ktf0hMJOUEd65xhJ1gjWgKH91Vggwbixc42nFx
 ViDvw798iyALSFXQb1W/akQETYYaYDokNTH8PXWPq+/PNxDXokXGh0gnY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="380695049"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; d="scan'208";a="380695049"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 12:00:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="779589324"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; d="scan'208";a="779589324"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 12:00:48 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 2/3] drm/xe/guc: define PVC FW
Date: Tue, 19 Dec 2023 12:00:21 -0800
Message-ID: <20231219200023.2502159-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231219200023.2502159-1-daniele.ceraolospurio@intel.com>
References: <20231219200023.2502159-1-daniele.ceraolospurio@intel.com>
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

Add PVC GuC FW definition. This is patch is for CI-only and it is meant
for the topic/core-for-CI branch.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 9dff96dfe455..92940199ba4a 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -103,6 +103,7 @@ struct fw_blobs_by_type {
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 7))		\
+	fw_def(PVC,		mmp_ver(xe,	guc,	pvc,	70, 9, 1))	\
 	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 5))		\
 	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 5))		\
 	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 5))		\
-- 
2.43.0

