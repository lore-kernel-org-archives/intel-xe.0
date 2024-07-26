Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DB3C3DA49
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 01:26:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 458D010E8DC;
	Fri, 26 Jul 2024 01:26:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xjah/Qh7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C19110E838
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 01:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721957187; x=1753493187;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ElE+tUW/7Bg4DriVzQRc0DJLucRov+QSLLHPKiG7ftk=;
 b=Xjah/Qh7uzlevckHDaytCQKVMXO95m8Jm9Xwh5PY8niwWL87MXkm9xuV
 GnfHFvcgN5VUzhKw84deXpqVBKC0aLoUQtXB+oIgR8vUglP2OvU9ymZS7
 7rN+Kkp6a5qhVnDK2zHRC7QpCvhoe5KZi3jziqsmOoNB1OnyOa8Tg9Y0N
 NIRConyHoKZIPaIC63jAn1dhXrczJi9VtOL27u1ToqSqEexk21mq6+j4U
 +FuCcUTVFZcVhFmfUO6FsHIvk7oKt0iuvghqt4cR6Lx9I7CT5XHRLJ/iJ
 HlLdRr1t5vzlvxgWJ0R10kfTd51aVBbo2YEXczII+7O51rz/4FiHA9Y8b Q==;
X-CSE-ConnectionGUID: h/sjnBfsRgeiFdDv1PJL+A==
X-CSE-MsgGUID: TJQx2GeKT5622/ACg+3VMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="30393940"
X-IronPort-AV: E=Sophos;i="6.09,237,1716274800"; d="scan'208";a="30393940"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 18:26:27 -0700
X-CSE-ConnectionGUID: hWZjaKDAT9W31ug8/9HIPg==
X-CSE-MsgGUID: 5byERY0UR56dBcYgGMqlSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,237,1716274800"; d="scan'208";a="84081331"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 18:26:26 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH 3/3] drm/xe/guc: Add BMG GuC definition
Date: Thu, 25 Jul 2024 18:26:10 -0700
Message-ID: <20240726012610.706749-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240726012610.706749-1-daniele.ceraolospurio@intel.com>
References: <20240726012610.706749-1-daniele.ceraolospurio@intel.com>
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

Set the minimum recommended version to 70.29.1 as this is the release
that includes all the fixes and WAs required on BMG.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index cc84484d3372..b2219ddc6f65 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -105,6 +105,7 @@ struct fw_blobs_by_type {
 };
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
+	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 1))	\
 	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 1))	\
 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 19, 2))	\
 	fw_def(PVC,		mmp_ver(intel-ci/xe, guc, pvc,	70, 24, 0))	\
-- 
2.43.0

