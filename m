Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962C3CCD183
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 00:43:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A2E10E512;
	Tue, 14 Oct 2025 00:43:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="htyyPHze";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B6710E512
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 00:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760402594; x=1791938594;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0soPZDgRWLFhBwdM+SStg5hS3jvxlRg+WqPdHE8MFhc=;
 b=htyyPHzeiC+5kOnRNz2kPYXDQOK+7PZ/1cvwAnrz+S9xxOgT0nRg0K9M
 HEIAnwk8hiz7sR2Zlwk0/h1z5DAxMmyIZ12lJ03yTQ5Ln33okZQYVahsR
 kjcxcyMrfKhfi/5y5B8RHpLSezRjL29CdIxb7JnwhV4XFhNq2aLNJxX9H
 OfeorQUDUXWxFe57I7DgOSnsSGoI0/DoLYq+MpdReeFe5vG+zSO6BFnD8
 ISR5zJBBneBguDKs5YxCB45+ifs93Oy102PtyqYxfw9Y3xax57hFIhdtU
 SEpGBgy6N8vUfBVGLk7SsqDPsFEXckY61RK2rP67jXGw+NfVOL2mG4Clw w==;
X-CSE-ConnectionGUID: 4l9kCUEoRcKBglUkmMJUEQ==
X-CSE-MsgGUID: jxRoS4sPQNKKfReEjuuhAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="80191840"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="80191840"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 17:43:14 -0700
X-CSE-ConnectionGUID: L+6VgSGFQ7Sm/AfMeURBEQ==
X-CSE-MsgGUID: 3P7+ZA+hTbmpw2l4M8abww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="185994732"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa004.jf.intel.com with ESMTP; 13 Oct 2025 17:43:12 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v1 3/3] drm/xe/vf: Do not disable VF migration on ATS-M
Date: Tue, 14 Oct 2025 02:44:18 +0200
Message-Id: <20251014004418.378928-4-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251014004418.378928-1-tomasz.lis@intel.com>
References: <20251014004418.378928-1-tomasz.lis@intel.com>
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

The ATS-M does support VF migration, and it has graphics ver below
the currently allowed range. This change rectifies that, allowing
ATS-M support.

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_vf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 911d5720917b..4a4f44f33870 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -159,8 +159,8 @@ static void vf_migration_init_early(struct xe_device *xe)
 		return vf_disable_migration(xe,
 					    "experimental feature not available on production builds");
 
-	if (GRAPHICS_VER(xe) < 20)
-		return vf_disable_migration(xe, "requires gfx version >= 20, but only %u found",
+	if (GRAPHICS_VER(xe) < 12)
+		return vf_disable_migration(xe, "requires gfx version >= 12, but only %u found",
 					    GRAPHICS_VER(xe));
 
 	if (!IS_DGFX(xe)) {
-- 
2.25.1

