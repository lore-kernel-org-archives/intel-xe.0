Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73857CAC592
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 22:11:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BAFB10E1E6;
	Mon, 22 Sep 2025 22:11:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iYlSQ6AN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 003AD10E1E6
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Sep 2025 22:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758579110; x=1790115110;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BeM3U2p+zDLnHqbOw6B/7dnAeSzLlYf/I5sPTmitLhU=;
 b=iYlSQ6AN1SfMJDF6ck1YBHj9IqG1qkTyPN9ABCWClIC8uvgm/yt+JZD2
 zRgnhJrLjZb8BZX2KQTn3XdB4GvX6cIgBO/HTfZWdiqs7q8ro/nrZlnwY
 bi1K4lWHncRyzm09i294U6YrZl+50tI7HJAYYCfWGum4M8BZmRFNRC84P
 btsHPzfJ8SDxMLzaasVMpCHk16qBV/7VXt6dmPCRZkJHcI/3YiHEt3ZOl
 fVnKFDM+P1tRc1ioQ6ZuVrrLHzOMNdZXJmNimoA003r5NY+FocsGT/iio
 o3wq//kFfgvEigFwB33FpZcKkaOpjubjGpOdTszSNWX2Z/7DaTaG4dn18 g==;
X-CSE-ConnectionGUID: aZ29N+sgRAOMQxJGG63kWw==
X-CSE-MsgGUID: c1bgcqiKT/WwNVvNyNRIsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="59892366"
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; d="scan'208";a="59892366"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 15:11:49 -0700
X-CSE-ConnectionGUID: um0Rc2mHQWmHdEPXK9rHmw==
X-CSE-MsgGUID: SMfSsB7uQTKeJoJrJPexZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; d="scan'208";a="207328955"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 15:11:50 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH] drm/xe/psmi: Do not return NULL
Date: Mon, 22 Sep 2025 15:11:34 -0700
Message-ID: <20250922221133.109921-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.50.1
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

The checks for id and bo_size are impossible conditions. If they were
possible, then the caller should not be using IS_ERR(). Just replace
them with asserts which should be compiled out when not debugging and
at the same time prevent other refactors to break this assumption.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/aK1nZjyAF0s7bnHg@stanley.mountain
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_psmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_psmi.c b/drivers/gpu/drm/xe/xe_psmi.c
index 45d142191d600..6a54e38b81ba9 100644
--- a/drivers/gpu/drm/xe/xe_psmi.c
+++ b/drivers/gpu/drm/xe/xe_psmi.c
@@ -70,8 +70,8 @@ static struct xe_bo *psmi_alloc_object(struct xe_device *xe,
 {
 	struct xe_tile *tile;
 
-	if (!id || !bo_size)
-		return NULL;
+	xe_assert(xe, id);
+	xe_assert(xe, bo_size);
 
 	tile = &xe->tiles[id - 1];
 
-- 
2.50.1

