Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7BD6C4828E
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 20:03:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6563C10E434;
	Fri,  2 Feb 2024 20:03:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O1ZRh5Qc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE61C10E1DF
 for <Intel-Xe@lists.freedesktop.org>; Fri,  2 Feb 2024 20:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706904181; x=1738440181;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZFVPkUk8hRmEVOaNQEDWE5xYYlmFSfOdxWr5IeG4hrI=;
 b=O1ZRh5Qc+/oOH7JjCCvYTT/QsMtL5TSVKQvZy5fXh7le0kg/2VRlVzkf
 jcxfhQvqWfs5Zq9ud25uu+3QYCzKYpbLVyc2q4oX079fcuVrhfTBcLbwT
 AxJTL4pUX+OHRvi8NP1RjVp4OAjyURF5TztlxaOkn6D/fKoVi45PZJvgX
 d2y4kAF8bsfsMx0ElHeQ2Y4tR3wsJ4gc99Pk4/Vrm7b3SqdOTmkvQOMz6
 pJGZOKRdg1oMXn5pYOd4CQZp1YSIl35Lidj2cRhXBxglAMs+M9KqwZCzR
 6jz3KYbyOpCnaL6N0zcQ67FM2Jkg/qVPGdPhER8/uXIftil1zToilb4yG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="3188618"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="3188618"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 12:02:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="439116"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa006.fm.intel.com with ESMTP; 02 Feb 2024 12:02:59 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v2 0/6] Update to GuC 70.19.2 and add LNL
Date: Fri,  2 Feb 2024 12:00:11 -0800
Message-ID: <20240202200017.2133438-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

Update to the latest GuC release including the first release for LNL.
Also include the patch version in the expectation check as it can be
important.

This patch set also includes fix up patches for the 'topic/xe-for-CI'
branch - two reverts followed by one update (the PVC patch). This is
to allow the patch series as a whole to build and run for CI testing.
Those patches are not to be merged to the main tree.

v2: Fix xe directory for LNL and add topic branch fix ups (review
feedback by Lucas).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


Daniele Ceraolo Spurio (1):
  drm/xe/guc: define PVC FW

John Harrison (5):
  Revert "drm/xe/guc: define LNL FW"
  Revert "drm/xe/guc: define PVC FW"
  drm/xe/uc: Include patch version in expectations
  drm/xe/guc: Update to GuC firmware 70.19.2
  drm/xe/guc: Add support for LNL firmware

 drivers/gpu/drm/xe/xe_uc_fw.c | 53 +++++++++++++++++++----------------
 1 file changed, 29 insertions(+), 24 deletions(-)

-- 
2.43.0

