Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743FE606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 16:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GA5CWHO3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2585610EFF0;
	Mon, 26 Oct 2026 16:28:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3097810F01D
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 16:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793032087; x=1824568087;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6HpqZVhPuOhPVw0dsauDrDTV9+rSkgxZGA7ONmjoP6Y=;
 b=GA5CWHO3S367I8agHk9XmLAOzphpKLtl3tU8e385qYimd6P4MmY2Qx/v
 c7qhk9fHlVWTKyXVHaxMeA7HGIiMJktmlysZhRjeMeXybZF7xOPBa/NbI
 NZxw58Ra0X3wU39XKYHgRWBurdqud0PMT1AK4sOCLXaW4vUyeEvcsfUBG
 aujLgWz1svcj/7/eXn5Sc33lxwduS+fftzvbHZ4G7rmiBOy1ahrA6x7pg
 NqVns3CXCeK6C/ol39pOtx0Jy/cOVC+oKOqyzAS4V6IgW6bwk6sUKIdbD
 D5aYyoluXcI4l9Kb29Uv537S70UD9RoZuhpDKg5Wl9AgWN+KjGp5f5BMQ A==;
X-CSE-ConnectionGUID: CR4TOHbBSnGzJG16spD3hg==
X-CSE-MsgGUID: 1IXClbpBSKCRWLKgamtyig==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1711159"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1711159"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 09:28:06 -0700
X-CSE-ConnectionGUID: cfI4aJNoS+KrIXdXkOLMVA==
X-CSE-MsgGUID: 8+kNK2YwRIWH7mMy8Oeo2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4255817"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa003.jf.intel.com with ESMTP; 26 Oct 2026 09:28:04 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, thomas.hellstrom@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH] drm/xe/bo: Protect pinned list check with pinned.lock
Date: Mon, 26 Oct 2026 21:55:30 +0530
Message-ID: <20261026162530.74757-1-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Move the pinned_link emptiness check under xe->pinned.lock to
serialize it with concurrent pinned list updates.

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 42a6aa1a2e4a..ffc2f467e44f 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -526,9 +526,10 @@ static void xe_bo_account_unpin(struct xe_bo *bo)
 	struct xe_device *xe = xe_bo_device(bo);
 	bool last_unpin = bo->ttm.pin_count == 1;
 
-	if (last_unpin && !list_empty(&bo->pinned_link)) {
+	if (last_unpin) {
 		spin_lock(&xe->pinned.lock);
-		list_del_init(&bo->pinned_link);
+		if (!list_empty(&bo->pinned_link))
+			list_del_init(&bo->pinned_link);
 		spin_unlock(&xe->pinned.lock);
 	}
 
-- 
2.43.0

