Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C178C761A6
	for <intel-xe@archiver.kernel.org>; Tue, 28 Mar 2023 21:09:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCF9A10E98E;
	Tue, 28 Mar 2023 21:09:18 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F21C10E4AA
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Mar 2023 21:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680037757; x=1711573757;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PA+5O9dqDUToWNmofraSo26Pkid6dtg+bOq7qwP5mNA=;
 b=TolgPmShLnD0v4gkdKWW5orcq76Aaz92f7K9gZFTotRHpeMGy2B8XBaO
 GsB4PreiD3NMF6NjGuV3I64YP1QeAlTDrLE2cTy9iLqxc7dI5G4FNx50g
 jnC8+tU+YKlulbDnbaooLoP5aqbw7hyLrv+YCXlbgOxzyD55Ch1q467kc
 JssUGDzyiOmECAfpNlXGIn5YEzNccMO7ydJCKLTYEnNkV8EeGIAzY558E
 +JlLknvNMNDnh5iOF3iQ3B7W70mfbpGUh7Dk2QYBUVr99Sprw/Yttva3N
 L3yNmvC4nXc2O5xv9Loztr25WuEl4CWQZtfdpxMOKrZ3GiwVQjZ9SB8ZS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="320346719"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="320346719"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 14:09:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="716607494"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="716607494"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 14:09:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 28 Mar 2023 14:09:16 -0700
Message-Id: <20230328210920.2110910-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/4] GuC submission with doorbells
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

More details:
https://gitlab.freedesktop.org/drm/xe/kernel/-/merge_requests/305
https://gitlab.freedesktop.org/drm/xe/kernel/-/merge_requests/288/

Matthew Brost (4):
  drm/xe/guc: Read HXG fields from DW1 of G2H response
  drm/xe/guc: Return the lower part of blocking H2G message
  drm/xe/guc: Use doorbells for submission if possible
  drm/xe/guc: Print doorbell ID in GuC engine debugfs entry

 drivers/gpu/drm/xe/xe_guc.c              |   6 +
 drivers/gpu/drm/xe/xe_guc_ct.c           |  12 +-
 drivers/gpu/drm/xe/xe_guc_engine_types.h |   7 +
 drivers/gpu/drm/xe/xe_guc_pc.c           |   6 +-
 drivers/gpu/drm/xe/xe_guc_submit.c       | 302 ++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_submit.h       |   1 +
 drivers/gpu/drm/xe/xe_guc_types.h        |   4 +
 drivers/gpu/drm/xe/xe_huc.c              |   2 +-
 drivers/gpu/drm/xe/xe_trace.h            |   5 +
 9 files changed, 333 insertions(+), 12 deletions(-)

-- 
2.34.1

