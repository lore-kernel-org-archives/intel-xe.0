Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D9FCD98FC
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jun 2026 22:25:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A694110F402;
	Thu, 18 Jun 2026 22:25:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OxUTm0cA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 246D810F402
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jun 2026 22:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781821554; x=1813357554;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jDiJ8qaMls3HaKTM0k0cMoUAitXKNdWeMaBdHTJG6+k=;
 b=OxUTm0cAqLmIRJIjQI+qQoKEbb6JbT/uw7MVh+1pSFahx5HPap7dVzeR
 6coRdE7HU7FJ9A756c/ZgVoNLHnc07nMU0R7Ga3yjZNQw7lULJ3ziS6/0
 j5EvUGN5aAOg3xoq3acyTynoLybT/eDHjbUF5wwsZM2ikn2zeDEmgl6+L
 1xXtyFUEC1XKJb+39jALMVtxDsUoX2HgDml+Fl1cS08NMh3UxAGwxfdAl
 rpOUl9PWjL0bwjPPeJMTA7em20aHScpg24Xm/4agKBb7yM7XJjUsSfpMi
 o/J+WjRKLzl7O+vIvUI526RrL6LRJqMK+T3xgtRcYDVzAfZ1sCzXe60GK A==;
X-CSE-ConnectionGUID: Up72kuBvQP+xcPySrTlmbw==
X-CSE-MsgGUID: Yjl1qx2KRomEVm1SK8Ic/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="81785795"
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="81785795"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 15:25:53 -0700
X-CSE-ConnectionGUID: KkubeO18RCaiaMPP9cM11A==
X-CSE-MsgGUID: KE7TwNX6StuRw2PuMNKurg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="278661347"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 15:25:54 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCHES topic/xe-for-CI 5/6] topic/for-xe-CI: drm/xe/cri: Define GuC
 firmware for CRI
Date: Thu, 18 Jun 2026 15:25:32 -0700
Message-ID: <20260618222536.3351750-13-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260618222536.3351750-8-julia.filipchuk@intel.com>
References: <20260618222536.3351750-8-julia.filipchuk@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Define GuC firmware, still using the mpp version that is intended to be
merged only to help with the platform enabling in topic/for-xe-CI.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Link: https://patch.msgid.link/20251021-cri-v1-2-bf11e61d9f49@intel.com
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Link: https://lore.kernel.org/r/20260108181956.1254908-10-julia.filipchuk@intel.com
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Link: https://patch.msgid.link/20260529193558.185436-13-daniele.ceraolospurio@intel.com
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
(cherry picked from commit 70680e8c7300e361d46a466288abfdd673e927ef)
Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 3ef3b3740e29..02502a954144 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,6 +115,7 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
+	fw_def(CRESCENTISLAND,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	cri,	70, 70, 0))	\
 	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 70, 0))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 54, 0))	\
-- 
2.51.0

