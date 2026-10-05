Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB53CA5FCE
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 08:24:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D12F10EBEB;
	Mon,  5 Oct 2026 08:24:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h4rdef6K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C47DD10EBEB
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 08:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791188684; x=1822724684;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GZxGFuav3CWD61S2UcduGPPCdgo1tWD6aKgxbNyRuAU=;
 b=h4rdef6KVF3BDbCs8B2Y3zDKk/0/00uxRuguz+B6Ow9yk23hmAu1CmzJ
 Osotg8oItyBf4xXUT2c7LOs7P/ow1jJ3CG84V5bK1A55ppvhxvfhws+Nb
 XUB345E8Vcb369DjR1W3INLN0mfQn29YeVbJpPwU+/i6Ffqe7pjmauqTG
 iPfwEYfnLeI+j8fGD9aFsAMgYBWZWEszXYfL+S1sgcOaoqXp7jS9mw0QW
 z8ZkQGLwsae9imNEBG+BvRaDJ2+kTk6k8nBnsT9e8vkhpJd8drHc/TNoq
 otSGqsiP91nQ/aDjcKXh/swOykETUaPcspNH7viOeg5FRW1eUk5t4lmEr A==;
X-CSE-ConnectionGUID: u4LolfowQkOrGL1j8pDVTw==
X-CSE-MsgGUID: T6hE9fwbTpWhujAOarahag==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="109342641"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="109342641"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 01:24:44 -0700
X-CSE-ConnectionGUID: 7DZSxnSbQZKx0FbCmOKvkg==
X-CSE-MsgGUID: O/kGlOMqTA6Ro02A725jHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="314769408"
Received: from unknown (HELO cs1n4.iind.intel.com) ([10.223.104.24])
 by orviesa001.jf.intel.com with ESMTP; 05 Oct 2026 01:24:43 -0700
From: "Kumar, Sachin" <sachin.kumar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, matthew.brost@intel.com,
	"Kumar, Sachin" <sachin.kumar@intel.com>, Kumar@freedesktop.org
Subject: [PATCH] drm/xe/uc: Add missing HuC firmware entry for Alderlake-N
Date: Mon,  5 Oct 2026 13:45:49 +0530
Message-ID: <20261005081549.1594153-1-sachin.kumar@intel.com>
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

ALDERLAKE_N is listed in XE_GUC_FIRMWARE_DEFS but was missing from
XE_HUC_FIRMWARE_DEFS, so uc_fw_auto_select() never finds a HuC blob
for this platform. xe_huc_init() then silently treats HuC as
XE_UC_FIRMWARE_NOT_SUPPORTED and returns early with no log output,
so the gap is invisible in dmesg.

Media encode that depend on HuC (e.g. VP9 VDEnc BRC/header
probability update) assume HuC is available and still program
HuC-dependent HCP/VDEnc commands for the VDBOX engine. With HuC
firmware never loaded/authenticated, the first such command stalls
the only VCS engine on this single-VDBOX GT1 part, which shows up as:

xe 0000:00:02.0: [drm] Tile0: GT0: Engine memory CAT error: class=vcs ...
xe 0000:00:02.0: [drm] *ERROR* Tile0: GT0: GuC engine reset request failed

reproducing on every run, on the very first VP9 keyframe, at both
1080p and 4K. H264 encode is unaffected since this driver's AVC VDEnc
path does not depend on HuC. ADL-P/ADL-S/RKL/TGL are unaffected since
they already have a HuC table entry.

Note i915 never hit this: i915 has no distinct ALDERLAKE_N platform
at the GT/firmware level (ADL-N is only a display subplatform of
ALDERLAKE_P there), so it inherits TIGERLAKE's HuC blob automatically.
xe gives ALDERLAKE_N its own top-level platform enum, so it needs its
own explicit table row.

Fix by adding ALDERLAKE_N to XE_HUC_FIRMWARE_DEFS, reusing the same
"tgl" HuC blob already used by ALDERLAKE_P/ALDERLAKE_S/ROCKETLAKE/
TIGERLAKE, which share the identical Gen12/TGL-LP media IP block.

Fixes: 500f90620cce ("drm/xe/adln: Enable ADL-N")

Signed-off-by: Kumar, Sachin <sachin.kumar@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index a8e6f18cc9b4..80f657ada0ac 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -134,6 +134,7 @@ struct fw_blobs_by_type {
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	no_ver(xe,	huc,		lnl))		\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	no_ver(i915,	huc_gsc,	mtl))		\
 	fw_def(DG1,		GT_TYPE_ANY,	no_ver(i915,	huc,		dg1))		\
+	fw_def(ALDERLAKE_N,	GT_TYPE_ANY,	no_ver(i915,	huc,		tgl))		\
 	fw_def(ALDERLAKE_P,	GT_TYPE_ANY,	no_ver(i915,	huc,		tgl))		\
 	fw_def(ALDERLAKE_S,	GT_TYPE_ANY,	no_ver(i915,	huc,		tgl))		\
 	fw_def(ROCKETLAKE,	GT_TYPE_ANY,	no_ver(i915,	huc,		tgl))		\
-- 
2.43.0

