Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F2E9EE14C3
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 21:24:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B6F710E1FF;
	Wed,  6 Sep 2023 21:24:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B7D10E20B
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 21:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694035440; x=1725571440;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pVWHuRsMbsLOXXMwz3D/paudItChvQ4ZKWVnRle1N2c=;
 b=Wx3r0phhwOUQlG1c3N9Z4urZ9w70Hc7Aim9NrEb1VI6r52ro7FYZLTl5
 LGwVVDaAc3fnOzQ60QmvTFZ3q1nGrB3VRUDIwZfIYdeUtW1ylgqQJaDBe
 mIoXZMhqB09z+1BKQUU6Aj4aBlTnw+yJiN9WmStlepjesYrAxURobhB1B
 KgU1V9Pe3i2HN5Aj97yxl5h1r++WqCfJ3yqJzgGJhYZpygJBuRqs+V46b
 e+Z9hPhnrfv++cCdhaMunMUvB5kB03pnuwT0DlHMWTmFGSiuc9QmSwYwD
 tbSQPZcsiqXfW9V1XJFyqAFrl16vpdgmVolR6SGsXMRJVihXqpIxqnXes A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="362219238"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; d="scan'208";a="362219238"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 14:24:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="884896770"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; d="scan'208";a="884896770"
Received: from jeknudse-mobl4.amr.corp.intel.com (HELO
 gjsousa-mobl2.intel.com) ([10.212.96.218])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 14:23:47 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  6 Sep 2023 18:23:32 -0300
Message-ID: <20230906212333.61119-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/1] Properly return -EPROBE_DEFER if
 xe_display_driver_probe_defer()
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The function xe_display_driver_probe_defer() was supposed to return
-EPROBE_DEFER when not yet ready to continue the probing, but the
current implementation is actually returning 1 instead of the proper
value, which would probably keep the probe operation to be attempted
again.

Fix that by making xe_display_driver_probe_defer() return a boolean just
like intel_display_driver_probe_defer() and return -EPROBE_DEFER on the
caller if necessary.

Note that this is a v2 of [1], which will get spawned as a new series
because of the change in the title.

v2:
  - Make xe_display_driver_probe_defer() return a boolean and return
    -EPROBE_DEFER on the caller. (Lucas)

[1] https://patchwork.freedesktop.org/series/123356/

Gustavo Sousa (1):
  fixup! drm/xe/display: Implement display support

 drivers/gpu/drm/xe/xe_display.c | 4 ++--
 drivers/gpu/drm/xe/xe_display.h | 2 +-
 drivers/gpu/drm/xe/xe_pci.c     | 5 ++---
 3 files changed, 5 insertions(+), 6 deletions(-)

-- 
2.41.0

