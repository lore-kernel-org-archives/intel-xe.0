Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B23C25B7D
	for <intel-xe@archiver.kernel.org>; Mon, 27 May 2024 01:37:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16BB410EACC;
	Mon, 27 May 2024 01:37:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mTucJohz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 109F310EAB5
 for <intel-xe@lists.freedesktop.org>; Mon, 27 May 2024 01:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716773819; x=1748309819;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ks/rojGUbt0agKMTSXIp2PFs8KfHJPDBTQcKNFwoNfQ=;
 b=mTucJohz5n+fh91cTru1AUMbdrsqza7ygJJ/OadwrVlkAyD01gPwTtf5
 w9qQQwPPqUq1lN713q0bGEJ1l9zqOlArO/8sbKxC+6iaeSdrty4KGrX3E
 0iy/uwb38bKYlSds2yUUgxNzMDkU7UdL9tPWtF2zMGQ6kOltXH6H7hOvj
 QU7IWbdt7nxZnHXeiEbs+48WJJo4yUE9/ogQGgwgCxHesh9SyjgU0PsNq
 oO1nLZTlMsRkGN48KBj+75BxAQu8xeQwAgvCaaihh4PbNhz+pAshkM4Uq
 EG8wkrsTYc5GtLAqN6TDyCg819zDLH6vTdVAnXQrSNje1X250E40p5yue g==;
X-CSE-ConnectionGUID: zt8GfalUSWCI7jEpkwUvGA==
X-CSE-MsgGUID: qhBdufiVRJKe9K9g2GKTYQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="16899141"
X-IronPort-AV: E=Sophos;i="6.08,191,1712646000"; d="scan'208";a="16899141"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2024 18:36:58 -0700
X-CSE-ConnectionGUID: B7SdRkd3Rcm6Y5zpeHNg7A==
X-CSE-MsgGUID: vnVYap3+RvmMeo6PjncCRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,191,1712646000"; d="scan'208";a="34494491"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2024 18:36:58 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/1] Xe OA Consolidated Diffs
Date: Sun, 26 May 2024 18:36:54 -0700
Message-ID: <20240527013655.603514-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

Because Xe OA changes between successive revisions are distributed across
multiple patches, I am providing a combined diff of all changes in a single
patch to help with the code review.

These changes pertain to: https://patchwork.freedesktop.org/series/121084/

Ashutosh Dixit (1):
  drm/xe/oa: Combined diff of changes between v14 and v15

 drivers/gpu/drm/xe/xe_oa.c   | 16 +++++++---------
 drivers/gpu/drm/xe/xe_oa.h   |  9 +++------
 drivers/gpu/drm/xe/xe_perf.c |  6 +++---
 3 files changed, 13 insertions(+), 18 deletions(-)

-- 
2.41.0

