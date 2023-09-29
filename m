Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C35FE71D58
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 21:36:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1531710E13D;
	Fri, 29 Sep 2023 21:36:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C32910E13D
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 21:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696023389; x=1727559389;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vfKtk0f6OsTAacC672XjVhrHsbd58gIg++8nRWkeFSo=;
 b=guiEcC4o+50pdHmKLyzl8l9U+PnaqQk8Pudw8ltj1E+bafhstWH4Ml9D
 kOG4AqsQR+1Tat3qXUMt5NMAlxeDS220W6vlFYRaBuUZWtCRJ6o0cs7hb
 GPBlQdNPOCWg6yw8iAKNZBK8VqmaycczJgrYJpso8WRrajWNkbX5+U3If
 g3muBrFajH00GPWCRbrGT9q9qjgnA1/nDR9qru8HAi8t7e/zRS29HYDOh
 ajLE4eow6bsCmX8o5RZc+lMZiJanAk/G5u+0GAXRgh0H3gpvAnhXdE0+Z
 qZOOc+HDHnSn5XBru/jktFWeBuGDvukqal3hchosljWq3aPWiTsypO6oD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="367440741"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="367440741"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 14:36:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="726709908"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="726709908"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 14:36:28 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 29 Sep 2023 14:36:36 -0700
Message-Id: <20230929213640.3189912-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/4] xe2: mocs and blitter commands
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

Adapt the blitter commands that gained support for specifying the
dst/src mocs in xe2.

v2: Handle review comments with small rewords and changes

Haridhar Kalvala (4):
  drm/xe: Adjust mocs field mask definitions
  drm/xe: Rename MEM_SET instruction
  drm/xe/xe2: Set tile y type in XY_FAST_COPY_BLT to Tile4
  drm/xe/xe2: Update MOCS fields in blitter instructions

 drivers/gpu/drm/xe/regs/xe_gpu_commands.h | 16 +++++---
 drivers/gpu/drm/xe/xe_migrate.c           | 47 ++++++++++++++++-------
 drivers/gpu/drm/xe/xe_mocs.h              | 12 ------
 3 files changed, 45 insertions(+), 30 deletions(-)

-- 
2.40.1

