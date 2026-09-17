Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA16AC88E72
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 20:32:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D80610F0AB;
	Thu, 17 Sep 2026 20:32:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tvay5gjd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C2710F0AB
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Sep 2026 20:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789677127; x=1821213127;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Q72J2znbfuacFkTKeVhV5vggXUIH5p8bQ3Mz8EZ0q40=;
 b=Tvay5gjdHEC/hYNj7zgQxUtlIHgfvtwCOw8SCE6QsXVj27LoOqlksqDy
 N3102e40Sxu6+QPtc2GjASGBah1CSb/Wxm36yU8HUetJgCaZgxEnDAukU
 PDl3RLdez9ZaKpZqcEUnPlueUWwtEY9NVN66YFfbdJnogSb/kZ29tn0Eo
 xjUZzj3rSxbWw5eXoDFNZ+bDufG6WJK5Ee/TTe3weOiskosVKewxPHWzU
 88ze4vFVbkEwbKiDd+bH3nyiIs/XAKTGyVMBMu6vG6TU31qrglM6D0I9p
 8iybu/MRuZfsXMOOo7OuQlLoWY6BGhqCFXkJBmMsY8tBo0jaro8fk+bYF w==;
X-CSE-ConnectionGUID: 7lBzLEFzQCmqCeT/1kEXNg==
X-CSE-MsgGUID: WKK+HkFzRT2fpmAx0kfFag==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89076950"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89076950"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 13:32:06 -0700
X-CSE-ConnectionGUID: +RsW0BTfRie1TzjBCKnmlg==
X-CSE-MsgGUID: eHvFhu0qTd+pgypL9/7MQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="275975377"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 13:32:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2] drm/xe: Keep walking on SVM eviction failure
Date: Thu, 17 Sep 2026 13:31:58 -0700
Message-Id: <20260917203158.292823-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

The desired behavior for SVM eviction failures, which can occur due to
various uncontrollable races, is for TTM to continue walking the LRU
list and look for another eviction candidate. This is expressed by
returning -ENOSPC from the ->move() callback.

Adjust the SVM eviction failure path because of races in ->move() to
return -ENOSPC so that TTM continues searching for another buffer to
evict.

Fixes: 3ca608dc7561 ("drm/xe: Basic SVM BO eviction")
Cc: stable@vger.kernel.org
Signed-off-by: Matthew Brost <matthew.brost@intel.com>

---
v2:
 - Only convert -EBUSY (races) to -ENOSPC
---
 drivers/gpu/drm/xe/xe_bo.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 9f3f0cb95afa..f2ab9bf43a86 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1044,6 +1044,13 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		} else {
 			drm_dbg(&xe->drm, "Evict system allocator BO failed=%pe\n",
 				ERR_PTR(ret));
+			/*
+			 * The semantic we want upon SVM eviction failure
+			 * because of racing access is keep walking for
+			 * eviction, which is -ENOSPC.
+			 */
+			if (ret == -EBUSY)
+				ret = -ENOSPC;
 		}
 
 		goto out;
-- 
2.34.1

