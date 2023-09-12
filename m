Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D156CA0ECA
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 13:13:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507F610E127;
	Tue, 12 Sep 2023 13:13:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D9710E127
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 13:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694524394; x=1726060394;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1b+OZOkcX/TneXJpyWQDBqUe1ZkRUHeBKCJz/xOyBbU=;
 b=Sp/1XoDbWrhjnvlWN3YFzHbxd1uWmwn9QVeGEPW7g3sXcu7o6oGxm06Y
 swTK4c244OlzIGX7RxwePK86ZLgFoJqlzTo2haNIUlGjYBHbGrWYq2GGC
 DATtXVTaWHEPXAdQE4aCQQmzduiDV9lMRYKT0/4JGkr5uJjIb8ECCOJXm
 066GMJZLnOldjwoWRRKm8YjjthaRDo3igvxWedCX5s7PCsIM7wlJoedhO
 LdUQ8aO+HUt+0iNQTgIlZVENd/SzgAeQtgpWQBZr45C10pNRpdNuN/dGw
 FAXkgK/F3rq4hj1zOtSBLDF3oCYB/ipFIzGM3VcAwI/RnyEgejWAJMygL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="464740066"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="464740066"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 06:13:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="737116336"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="737116336"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 06:13:11 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Tue, 12 Sep 2023 16:08:31 +0300
Message-Id: <20230912130835.2488728-1-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/4] drm/xe/gsc: add initial gsc support
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
Cc: linux-kernel@vger.kernel.org, Tomas Winkler <tomas.winkler@intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add initial GSC support for DG1 and DG2.
Create mei-gscfi auxiliary device and add
support for device created by Xe to the mei-gsc driver.

This series intended to be merged intto Xe tree,
the only patch that touches char-misc is addition
of id and alias in mei-gsc.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>

Vitaly Lubart (4):
  drm/xe/gsc: add HECI2 register offsets
  drm/xe/gsc: add has_heci_gscfi indication to device
  drm/xe/gsc: add gsc device support
  mei: gsc: add support for auxiliary device created by Xe driver

 drivers/gpu/drm/xe/Kconfig           |   1 +
 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/regs/xe_regs.h    |   4 +
 drivers/gpu/drm/xe/xe_device_types.h |   3 +
 drivers/gpu/drm/xe/xe_gt.c           |   4 +
 drivers/gpu/drm/xe/xe_gt_gsc.c       | 218 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_gsc.h       |  36 +++++
 drivers/gpu/drm/xe/xe_gt_types.h     |   4 +
 drivers/gpu/drm/xe/xe_irq.c          |  11 +-
 drivers/gpu/drm/xe/xe_pci.c          |   9 +-
 drivers/misc/mei/gsc-me.c            |   5 +
 11 files changed, 292 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_gsc.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_gsc.h

-- 
2.34.1

