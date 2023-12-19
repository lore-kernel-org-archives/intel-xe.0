Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FDCDC41535
	for <intel-xe@archiver.kernel.org>; Tue, 19 Dec 2023 20:00:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F6C10E205;
	Tue, 19 Dec 2023 20:00:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE1AC10E205
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Dec 2023 20:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703016050; x=1734552050;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r5nLNtE/iF0IMwmFF1Lo9DhnxUnGKhIPJIiJxcw4jQw=;
 b=IOIIwthlCB4gOBiMRkrnqvq8ud8aXn7Y88a1fpAEOJHdgQb10+8C3jcy
 +F3DBDrgGkzCrZNb1EQNAleYtIcglP79EzF6nMPOo2iGBSp58Aqp8Msir
 Hkag7YV8foqkzBw8tKUMYKme/ZaMKStVueqBOUjE0VI35/Q1r8LuOEx4j
 CHAGIeFiuQwlLXnxLrS8sEZU9cLnrekRpgfIBCMPAvA+3KAR8f0We7TuF
 J2oBY2oIw6H2ejofaBYSVz6JSo3oVjYqLfK9Q/3mk87IH+taXowQ9IjdE
 RN2opahk3+Fs581HWNJSh41WzpufWV9Rp+F4mGsbH8ywOrFGMpCax5ilj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="380695055"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; d="scan'208";a="380695055"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 12:00:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="779589329"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; d="scan'208";a="779589329"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 12:00:50 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 3/3] drm/xe/guc: define LNL FW
Date: Tue, 19 Dec 2023 12:00:22 -0800
Message-ID: <20231219200023.2502159-3-daniele.ceraolospurio@intel.com>
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

Add LNL GuC FW definition. This FW is not ready to be pushed to
linux-firmware yet, so this patch is for CI-only and it is meant
for the topic/core-for-CI branch.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 92940199ba4a..73d6938c921d 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -102,6 +102,7 @@ struct fw_blobs_by_type {
 };
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
+	fw_def(LUNARLAKE,	mmp_ver(xe,	guc,	lnl,	70, 6, 8))	\
 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 7))		\
 	fw_def(PVC,		mmp_ver(xe,	guc,	pvc,	70, 9, 1))	\
 	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 5))		\
-- 
2.43.0

