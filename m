Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C151C27C40
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 20:32:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 646AD10E318;
	Wed, 22 Nov 2023 20:32:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6480210E318
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 20:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700685138; x=1732221138;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ome2cPPcdCN3HGaOG2+RvtPia2qG5WR2AQqAJ6fahko=;
 b=OC8tNzCC+VcxaMGIJDzRkURqa8aAsAj2z0im/s5hY4CvLPtAL+dxqcVr
 BIS9PuTqsjalTEiO2jQyQAKn78LbHbS/Bpij5GOB4Q30956Q+qJdajaHs
 4ZpqG7Kx8++etVlXoUjzmmqcBREskOVjsjavKM0GI6nsuNDgbH18YzlBb
 WuR1d13awdfzd58HU6ICcJyQQqAf/mbHpLC8AuYiAwlyfoSD7cPnlWasT
 3Xr8ShB9zMx3f8WupHqXStgEHi0MRjzHaOdjVwbjtgPkPlOzTG6GVlhkR
 bYAqN32p45lXXwY5y4vjg9WrBch+RXYaXK5nT8HL+/iDTJrppPy7KY3cV A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="13702684"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="13702684"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 12:32:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="910964488"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="910964488"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 12:32:17 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 22 Nov 2023 12:31:45 -0800
Message-Id: <20231122203147.988021-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] Group kunit tests
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

Group kunit tests in 2 sets: normal and live tests. We don't need one
kernel module for each compilation unit. Running the "normal" kunit
tests via UMD continues to work in the same way as kunit.py figures out
from the attributes what is the module to use. For the live kunit tests,
it will need a patch in igt that I will provide.

Lucas De Marchi (2):
  drm/xe: Group normal kunit tests in a single module
  drm/xe: Group live kunit tests

 drivers/gpu/drm/xe/tests/Makefile           | 10 ++++++++--
 drivers/gpu/drm/xe/tests/xe_bo_test.c       |  5 -----
 drivers/gpu/drm/xe/tests/xe_dma_buf_test.c  |  5 -----
 drivers/gpu/drm/xe/tests/xe_live_test_mod.c | 10 ++++++++++
 drivers/gpu/drm/xe/tests/xe_migrate_test.c  |  5 -----
 drivers/gpu/drm/xe/tests/xe_mocs_test.c     |  4 ----
 drivers/gpu/drm/xe/tests/xe_pci_test.c      |  5 -----
 drivers/gpu/drm/xe/tests/xe_rtp_test.c      |  5 -----
 drivers/gpu/drm/xe/tests/xe_test_mod.c      | 10 ++++++++++
 drivers/gpu/drm/xe/tests/xe_wa_test.c       |  5 -----
 10 files changed, 28 insertions(+), 36 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_live_test_mod.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_test_mod.c

-- 
2.40.1

