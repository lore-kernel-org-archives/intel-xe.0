Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F09CF6BE2
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jan 2026 01:04:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EBB110E18A;
	Wed,  7 Jan 2026 01:04:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cT4JRD9j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D95710E04B
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jan 2026 01:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767747889; x=1799283889;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZgVV2XGFoBGuO7zG+Ee0CdE9ZJnR8b9D4ZdC5qO4Cko=;
 b=cT4JRD9jS158r6DQ9TUiHOgU27mfyZ+LEQw+ZltK43Za/tjxFZiJAdBz
 gOLkYH2v+UlV3ohu8d6JrRVUGEMMM5S4A7AHHEKo3/fvL4QTY5ZjJr7Cd
 7HZ8za675Cz8alpACdrupYGroGqes1kR151Yk5K/HjPGLeMA4piezZs2v
 BuCUAOrpQ7nqQ0oqdo9W7kwIvhCxAZfobUhnRZB7KPR3ViqY0VnIE26Hh
 CIVTDNeORCDV7H7k1YKGR0IpP+QCBK+aaF+G2zVE+XjE3Z+bUzA4VQjx3
 TgGjaIzpWi0bmcsaH/gFuRYporDprs5pLol9vPgokE1BpmovtulB4kpuj g==;
X-CSE-ConnectionGUID: 8jfWLPHdT5mO53PqhL7i2g==
X-CSE-MsgGUID: Nmv1IDY7Q7yW1mCbVhy4Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="72964794"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="72964794"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 17:04:49 -0800
X-CSE-ConnectionGUID: oVaslXJbRDaJnonnSX3IKg==
X-CSE-MsgGUID: 6LefbDu0Sr+yJltuoUBMBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="206937242"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by orviesa003.jf.intel.com with ESMTP; 06 Jan 2026 17:04:51 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH 1/4] drm/xe: Remove debug comment in page reclaim
Date: Wed,  7 Jan 2026 09:04:49 +0800
Message-ID: <20260107010447.4125005-7-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107010447.4125005-6-brian3.nguyen@intel.com>
References: <20260107010447.4125005-6-brian3.nguyen@intel.com>
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

Drop debug comment erronenously added in patch commit.

Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_page_reclaim.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.c b/drivers/gpu/drm/xe/xe_page_reclaim.c
index fd8c33761127..94d4608ebd74 100644
--- a/drivers/gpu/drm/xe/xe_page_reclaim.c
+++ b/drivers/gpu/drm/xe/xe_page_reclaim.c
@@ -108,7 +108,6 @@ void xe_page_reclaim_list_invalidate(struct xe_page_reclaim_list *prl)
  */
 void xe_page_reclaim_list_init(struct xe_page_reclaim_list *prl)
 {
-	// xe_page_reclaim_list_invalidate(prl);
 	prl->entries = NULL;
 	prl->num_entries = 0;
 }
-- 
2.52.0

