Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80AF7C52D6D
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 22:42:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AAAE10E128;
	Thu,  1 Aug 2024 22:42:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ThDRnAhy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F5910E122
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 22:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722552169; x=1754088169;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rSlWspdbWsjWPLzFHH3YSWPfBtkrc9hQuo+uk+Z80Lo=;
 b=ThDRnAhyNVN80HAOLYFtHeWvdxd9JwbCRa8BYpWNawtH3yqUPjJK0Co+
 +10CRv/ACQ0qyYJNATZWVBE5BRv/hgWJQW+u8jTVCbzNdwhO+AGGKEiEN
 bjaZfl61mjS78kGFaskzOfE/Al1584RqXsyg0Mz/N8hhXW2BqGsELPD3D
 Mw06XGyhfHvjbCUmhQEkwgmUJGr6/XDEJBIkKwf7ta+H6AevZksTvZ5Fj
 jex1o9FxAzP1GAKl/JWVMbF53mp4UR1/FSGdnVPTdpLSfYl4eia0XkYR+
 XjEWRYsblvFYBw/H/q+0s+lmVg+nSOEeGQeCfTifNzg+ZLC2PaN7c6mvt w==;
X-CSE-ConnectionGUID: vXxUlPBpSi2cRomkQNR39A==
X-CSE-MsgGUID: LnEb8Qr0THyBLzjKNyOVRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="38008322"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="38008322"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 15:42:48 -0700
X-CSE-ConnectionGUID: HNqOhkw5TG6jQC3OJIJrhg==
X-CSE-MsgGUID: tOtsQepQQ9+QDvvVQ1LfZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="55116253"
Received: from bfilipch-desk.jf.intel.com ([10.165.21.204])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 15:42:48 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH xe-for-ci v3 4/4] drm/xe/guc: Pick for-ci GuC v70.29.2 for PVC
Date: Thu,  1 Aug 2024 15:42:40 -0700
Message-ID: <20240801224241.3050352-5-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240801224241.3050352-1-julia.filipchuk@intel.com>
References: <20240801224241.3050352-1-julia.filipchuk@intel.com>
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

UAPI version 1.13.4

Restore ci config for pre-release PVC.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 05a3c5b80b5b..c1618d9672c0 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -109,6 +109,7 @@ struct fw_blobs_by_type {
 	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
 	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\
+	fw_def(PVC,		mmp_ver(intel-ci/xe, guc, pvc,	70, 29, 2))	\
 	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 29, 2))	\
 	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 29, 2))	\
 	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
-- 
2.45.2

