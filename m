Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFEAC3DA61
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 20:57:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F268210EB18;
	Thu, 18 Jul 2024 20:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TD9ZmQtf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 549EF10EB18
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 20:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721336241; x=1752872241;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rKltZSKfTJBnDusT3xL8t7oZWEme+oPYnzwleOdeXfk=;
 b=TD9ZmQtfneXTGaBhd3OAeFF0Q/AVHb4zyTRc3VL12VnfUZIx1iM80o+O
 hV+vxOHCGIMHZPNkk73wLvlqaKkK8WWhElD6uIegsQvLI1lBTUqE5+/na
 hrKCGQDTOoDjHe0p1u+VRqfDVm6qHrNpAKac26jm4KT/F5UPHSEuEbtyE
 MvYNZDab2Hit7Dyw2Lb80UfgxSiIdyN85Ti6pxpw9XZjCSVbKt4haSLku
 w3xym9l/JHklXWr1l6Zy0P5IHV5vUxlwcimMyxi2nwaKDUkYyYiOkwuEU
 6fkPYvFSVSrP+jzIv/CbqAVp3HkRgYRRuPosKACjuS+tRA07f0mjgnMxu Q==;
X-CSE-ConnectionGUID: ZpeGNyN7QdyW5ZwTfZiiGQ==
X-CSE-MsgGUID: u0IP4hFpRxaZ7LAwc1KI8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="12614544"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="12614544"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 13:57:21 -0700
X-CSE-ConnectionGUID: 94Ne0JtQSXOu4LzmRdEFag==
X-CSE-MsgGUID: 4Pa+4ofOSjaOB2Qd248kow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="51175622"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 13:57:20 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [CI] drm/xe/huc: Test newer HuC blobs for LNL and BMG
Date: Thu, 18 Jul 2024 13:57:12 -0700
Message-ID: <20240718205712.2862494-1-daniele.ceraolospurio@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This patch is for testing only.

These are the blobs that the media team wants in linux-firmware, so if
the testing is successful we'll move them to the official branch and
replace the CI patch in the xe-for-ci with a proper patch in
drm-xe-next.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index c1dcf58d25d7..0f6e1acb05ec 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -118,8 +118,8 @@ struct fw_blobs_by_type {
 	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 19, 2))
 
 #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
-	fw_def(BATTLEMAGE,	mmp_ver(intel-ci/xe, huc_gsc, bmg, 8, 2, 6))	\
-	fw_def(LUNARLAKE,	mmp_ver(intel-ci/xe, huc_gsc, lnl, 9, 4, 6))	\
+	fw_def(BATTLEMAGE,	no_ver(intel-ci/xe, huc_gsc, bmg))		\
+	fw_def(LUNARLAKE,	no_ver(intel-ci/xe, huc_gsc, lnl))		\
 	fw_def(METEORLAKE,	no_ver(i915,	huc_gsc,	mtl))		\
 	fw_def(DG1,		no_ver(i915,	huc,		dg1))		\
 	fw_def(ALDERLAKE_P,	no_ver(i915,	huc,		tgl))		\
-- 
2.43.0

