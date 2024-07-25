Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C59C3DA61
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 00:32:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D87010E1AA;
	Thu, 25 Jul 2024 00:32:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M216rVxN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7458910E1AA
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 00:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721867559; x=1753403559;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tef8yVIl0CI7osK7KFurmel91oZaQFY/jGhEqbAFFtg=;
 b=M216rVxNgVKmujW+w4NjwHwWINZ85mBp1Tjeg+bIViLz9IBGZCqHil7n
 tdbNj6/JpTv/tp3ADYr3f9oHzYCh0s6Kl66MY8br2llDBraJ+gXBRAcWu
 VDLMDlXIBuY8ZMUuZkRBSH4QmtObw1A9pcBCPooeRltWcUxkD+48pvKro
 IXXa8JxtQ0mSGZb8XOZFKdtfmd9S0XRVMyLx9ROsoybaR49uaks2ptl4L
 DKWcoT87reTaBvfppxsvOQP0KLYYeQQDQyVRo5JDMk9mGFgsaVmLKeb1N
 XhaDT7uT27HW/w+6HYWi5Uv6nSeFphks3E97rwx5Ph6ZE0g5QhE1Su+Et A==;
X-CSE-ConnectionGUID: ODIYWgp6T7iYsZqoN1Mozg==
X-CSE-MsgGUID: 0VPrxYgQSvOdibaoFLCq9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19192539"
X-IronPort-AV: E=Sophos;i="6.09,234,1716274800"; d="scan'208";a="19192539"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 17:32:39 -0700
X-CSE-ConnectionGUID: M+USqA3WS+uoJpplMU7kDg==
X-CSE-MsgGUID: ES65WtPyRYuqERrwFBwG3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,234,1716274800"; d="scan'208";a="75976375"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 17:32:39 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH 4/6] drm/xe/huc: Define HuC binary for LNL
Date: Wed, 24 Jul 2024 17:32:21 -0700
Message-ID: <20240725003224.516233-5-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240725003224.516233-1-daniele.ceraolospurio@intel.com>
References: <20240725003224.516233-1-daniele.ceraolospurio@intel.com>
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

Add the unversioned define for the LNL HuC FW.

All new binaries are GSC-enabled (and even if they weren't the driver
can detect the type of HuC binary), so the new lnl HuC filename doesn't
use the _gsc postfix to avoid confusion with the GSC binary.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index aef0aae614b8..24c165011265 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -118,6 +118,7 @@ struct fw_blobs_by_type {
 	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 19, 2))
 
 #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
+	fw_def(LUNARLAKE,	no_ver(xe,	huc,		lnl))		\
 	fw_def(METEORLAKE,	no_ver(i915,	huc_gsc,	mtl))		\
 	fw_def(DG1,		no_ver(i915,	huc,		dg1))		\
 	fw_def(ALDERLAKE_P,	no_ver(i915,	huc,		tgl))		\
-- 
2.43.0

