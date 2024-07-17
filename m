Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F10A1C3DA4B
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 13:08:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BDED10EAF1;
	Wed, 17 Jul 2024 13:08:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y10NfSRZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7156E10EAEF
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 13:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721221724; x=1752757724;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6G2N6r9BMsvypuFdXDZ0tMVvTeZZmtjAmx4B/bwSsXw=;
 b=Y10NfSRZjFUyRIhu+9CIVwXvYZj8qSGO+Efvvgut1dKl0DA2ozZdzsLi
 CiB5mpmbMp8Sj2w2xEB/m+6XSceVqX7wNyni+65Dsyoq1zZwkvs4spfF+
 e3o1cK8TmViblgg1/dX/WtdHAIkglWCJVf0NZxJ9WOUeO/pnkIxa0dRKH
 Qn8vR95xlOu5UhAqvm9QHwEta0PpHZwWIruXrvKohlEvxBMKR8pFW+AD7
 2wnA0IzqOSGiovfL5FNBaxhoKxpYD/D1iZ2mKHOa79vu/BqYMXYwv+9dP
 YMqv8RFlsqoD2f6WQwq5T5rdoK7sQjDq2dwhV8JpDtKHk0lPtUyLjBW1U A==;
X-CSE-ConnectionGUID: NeU9zl+4Ty+hYNtRgLYIfg==
X-CSE-MsgGUID: b3AWP/A7S/OB5qZmDInOkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18832050"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="18832050"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 06:08:44 -0700
X-CSE-ConnectionGUID: LcMjkJrrTDWrB+BOYEXoCg==
X-CSE-MsgGUID: CDbyX/d+S2CDC7EHpbphMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="55532006"
Received: from rajritu-mobl2.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.251.217.45])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 06:08:42 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Francois Dugast <francois.dugast@intel.com>
Subject: [RFC v1 2/9] drm/xe/exec_queue: Add list link for the hw engine group
Date: Wed, 17 Jul 2024 15:07:23 +0200
Message-ID: <20240717130821.1073379-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240717130821.1073379-1-francois.dugast@intel.com>
References: <20240717130821.1073379-1-francois.dugast@intel.com>
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

The exec queues running on hw engines belonging to the same hw engine
group share hardware resources. It will be necessary to navigate
between exec queues within a group for synchronization, hence this
new list link.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 201588ec33c3..7df2b532f340 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -143,6 +143,8 @@ struct xe_exec_queue {
 	u64 old_run_ticks;
 	/** @run_ticks: hw engine class run time in ticks for this exec queue */
 	u64 run_ticks;
+	/** @hw_engine_group_link: link into exec queues in the same hw engine group */
+	struct list_head hw_engine_group_link;
 	/** @lrc: logical ring context for this exec queue */
 	struct xe_lrc *lrc[];
 };
-- 
2.43.0

