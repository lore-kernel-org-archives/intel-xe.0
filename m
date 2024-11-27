Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C91D609A7
	for <intel-xe@archiver.kernel.org>; Wed, 27 Nov 2024 08:09:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D00F10EA16;
	Wed, 27 Nov 2024 08:09:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iuKPqNEt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AFC410EA16
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Nov 2024 08:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732694991; x=1764230991;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cubTYsZlY956EwV9IDc8NOVVMY2JTv5s1A2k9kI9bTs=;
 b=iuKPqNEtd2Nl0FTt8g3Q9O8W/EXe2UTladfuDe6d8v4OPUuzR+elO4De
 DYMT70BkWJjmSwKYGv0qRQJEHqmEl/fz6SEfAzak1EoDlql3nnFQcr0ZB
 Xo+A1CQ7io67ZwvvTYyQ0lPNeOVDy/viAXsaE73Bci5aGY0HqZho59p8H
 yLcb2oBVLls7vYe74cdbpjo0qzuZvqEQvgmsjedex4OLZhgBZE+f4b7rF
 gj0zgwBb6Fuoi9KFZywtBQLtkw6yZd0EytWCLYtNlKJjMNrYbTZjuAZLE
 0/fB93GR8MecdcgBLnTr/HfPDtQaGrQ8jZWvxtQokh48vsqrCZ8F7pfur g==;
X-CSE-ConnectionGUID: jjKqWKLoTQCyqgRIKvu3dg==
X-CSE-MsgGUID: MhDf/TXdSO+U9gP0Zn6T+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="36810231"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="36810231"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 00:09:51 -0800
X-CSE-ConnectionGUID: 8g8kIP4NQkaJnzggQaBhVg==
X-CSE-MsgGUID: ZsH8feGOSKWQe2n92keUWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="92689697"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa008.jf.intel.com with ESMTP; 27 Nov 2024 00:09:49 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 0/3] Revert accidentally and unintentionally pushed
Date: Wed, 27 Nov 2024 14:00:39 +0530
Message-Id: <20241127083042.358726-1-himal.prasad.ghimiray@intel.com>
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


Himal Prasad Ghimiray (3):
  Revert "drm/xe: Add mutex locking to devcoredump"
  Revert "drm/xe: Move the coredump registration to the worker thread"
  Revert "drm/xe: Add a reason string to the devcoredump"

 drivers/gpu/drm/xe/xe_devcoredump.c       | 115 +++++++---------------
 drivers/gpu/drm/xe/xe_devcoredump.h       |   5 +-
 drivers/gpu/drm/xe/xe_devcoredump_types.h |   8 +-
 drivers/gpu/drm/xe/xe_guc_submit.c        |  14 +--
 4 files changed, 40 insertions(+), 102 deletions(-)

-- 
2.34.1

