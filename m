Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75322D374B1
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 22:52:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FDA910EBD5;
	Fri,  5 Dec 2025 22:52:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HgNZQW6E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D741A10EBD5
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Dec 2025 22:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764975161; x=1796511161;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=s/2ccgLkfpjjjmQXDHOGfFQKLSS8tsKJK8vECMGetzs=;
 b=HgNZQW6ECxYblkwLGhDTY9g9Ezv0E/LgegsLoQUFylOuqOrPjfp917jr
 QbFAtjWz49KuJZgOMfRnq62Kxh8jv3+5ahnDuze8VVxiPEwFUKvbBNC+E
 GByrc+ZkoysA58UaeJLe7xVOjCuaHRXktLfzyKMObzlUPc7jXU0qdhcw9
 YWkUaOWe2T+g7IV46OOX9lLuucYwFWDDWB8OBreG6p5FoTbscumQLx6gx
 OxBSv0wcTOxi58ntKHTesTzjaGtAMSQPa68BwgublCVv4DsgKxel1DvLp
 BexgxPmHIAn3FIB71iBkbTgbne2ZvI2Tv7CCFSZtTt36QYFJgGLFst95A A==;
X-CSE-ConnectionGUID: eWwBh7ggQt6n3AtcNTEmUQ==
X-CSE-MsgGUID: 1KBb7EZnRcSYHXuG7AS2xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="70862067"
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; d="scan'208";a="70862067"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 14:52:41 -0800
X-CSE-ConnectionGUID: 74+BYRjzSv+MBrJ6geY1Iw==
X-CSE-MsgGUID: OceZU33dTHyUxAvMXlgyZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; d="scan'208";a="195849016"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa009.fm.intel.com with ESMTP; 05 Dec 2025 14:52:40 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH v2 0/2] Limit num_syncs to prevent oversized allocations
Date: Fri,  5 Dec 2025 22:48:09 +0000
Message-ID: <20251205224808.2466416-4-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
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

Limit num_syncs to prevent oversized allocations

Shuicheng Lin (2):
  drm/xe: Limit num_syncs to prevent oversized allocations
  drm/xe/oa: Limit num_syncs to prevent oversized allocations

 drivers/gpu/drm/xe/xe_exec.c | 5 +++++
 drivers/gpu/drm/xe/xe_oa.c   | 3 +++
 drivers/gpu/drm/xe/xe_vm.c   | 3 +++
 include/uapi/drm/xe_drm.h    | 1 +
 4 files changed, 12 insertions(+)

-- 
2.50.1

