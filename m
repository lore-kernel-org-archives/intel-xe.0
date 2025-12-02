Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4896D116F3
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 02:51:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9352510E513;
	Tue,  2 Dec 2025 02:51:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fDbQ75l9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D27F210E513
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 02:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764643880; x=1796179880;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=PqUbvQA9RAvq8mHah3Ttzb8l58ZVgj/MP+fHu1yVfXU=;
 b=fDbQ75l9gk0Yf627Jsk1L8lSPd1o2oMjm+PMiUVZ+yNKCXNY5pYSTfCz
 WS2njIUR+BxwqS6UPABPwUZNmPKQv03u/PNIPbTm01+HFmbYURnzkRmVG
 4Vxm7cTAhvyEQvmwXIGkSxzDEm+EmWOrie0cMQcOj+efZOd1yC/BuBN/y
 xIT/9Kc7TB+2QJ13vhOTkNhRJhTFudUpnD+4ee1iZcRL5Q3jDJcmvK3e5
 R7OyVdRCK6ewEs6JIwIxCCjEKLbQxVA/Yl1Wzm3vQY/c2iPho9wU7qWPV
 EvXClH1GMZn/s7meQ0mDZQtQ7LKWMPjxtbryqwXedHCrjadU2HoJFkOXZ A==;
X-CSE-ConnectionGUID: kzPxgK/uTPiLmALLQHUhkA==
X-CSE-MsgGUID: g4Uq1yoTRE6AApdV49r7GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66635557"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="66635557"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 18:51:19 -0800
X-CSE-ConnectionGUID: aooeIMVCQtmg+U/Uirmqgw==
X-CSE-MsgGUID: 0KKhQVn6SkGb37ez4Eevbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="194077387"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 18:51:19 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/5] drm/xe/oa: Allow exec_queue's to be specified only for
 OAG OA unit
Date: Mon,  1 Dec 2025 18:51:13 -0800
Message-ID: <20251202025115.373546-4-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251202025115.373546-1-ashutosh.dixit@intel.com>
References: <20251202025115.373546-1-ashutosh.dixit@intel.com>
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

Exec_queue's are only used for OAR/OAC functionality for OAG unit. Make
this requirement explicit, which avoids complications in the code for
other (non-OAG) OA units.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 75db5530cb557..d63c04e2d4922 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -2032,6 +2032,10 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
 		return ret;
 
 	if (param.exec_queue_id > 0) {
+		/* An exec_queue is only needed for OAR/OAC functionality on OAG */
+		if (XE_IOCTL_DBG(oa->xe, param.oa_unit->type != DRM_XE_OA_UNIT_TYPE_OAG))
+			return -EINVAL;
+
 		param.exec_q = xe_exec_queue_lookup(xef, param.exec_queue_id);
 		if (XE_IOCTL_DBG(oa->xe, !param.exec_q))
 			return -ENOENT;
-- 
2.48.1

