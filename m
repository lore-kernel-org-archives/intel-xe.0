Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C686CC10DCE
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 21:33:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D5EA10E550;
	Tue,  5 Dec 2023 21:33:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6612010E550
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 21:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701812032; x=1733348032;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=l3oiPpOGkpfN3BwYtveps+9pmqZbKcV9CEN7ixyrSUg=;
 b=F6hc8FjavXfttbFH8GgRms+87hIlJZGP8hV7u6p867y7QOF1Nn7WTBYM
 7qg9HSk00g0GtNYV308ZzjJHU0IcRV2IfPv6ibebVN/gJ88kF21x3IrZi
 c6mR9rklyN3OfLZ8OgR6oOgu44z1NMbWmalugVKBPhY2C3BfnnYHp34yo
 Rt/cief3AuEeSJe7ivxFPyMwxEnKWLPjiqchsoAVpsZArXeletNzAeZej
 O1k3y8ADycODBRgOoYavllaRwsHhUGguNRyhKctYc4HGjVvv2baZFM7k1
 TyRtecqymE8ZthUeatx9e5ilTNEomjJrVgkA91IxDmBAzL6TJM2M8GX+N A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="378983004"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="378983004"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 13:33:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="889079405"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="889079405"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmsmga002.fm.intel.com with ESMTP; 05 Dec 2023 13:33:50 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  6 Dec 2023 03:11:26 +0530
Message-Id: <20231205214135.958847-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 0/9] Enable compression handling on LNL.
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

Series enables flat ccs on xe2 igfx platforms and handles clearing and copy 
of ccs metadata during bo creation and xe_bo_move respectively.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Himal Prasad Ghimiray (9):
  drm/xe/xe2: Determine bios enablement for flat ccs on igfx
  drm/xe/xe2: Allocate extra pages for ccs during bo create
  drm/xe/xe2: Updates on XY_CTRL_SURF_COPY_BLT
  drm/xe/xe_migrate: Use NULL 1G PTE mapped at 255GiB VA for ccs clear
  drm/xe/xe2: Update chunk size for each iteration of ccs copy
  drm/xe/xe2: Update emit_pte to use compression enabled PAT index
  drm/xe/xe2: Handle flat ccs move for igfx.
  drm/xe/xe2: Modify xe_bo_test for system memory
  drm/xe/xe2: Support flat ccs

 drivers/gpu/drm/xe/regs/xe_gpu_commands.h |   3 +-
 drivers/gpu/drm/xe/regs/xe_gt_regs.h      |   3 +
 drivers/gpu/drm/xe/tests/xe_bo.c          |  23 ++-
 drivers/gpu/drm/xe/tests/xe_migrate.c     |   2 +-
 drivers/gpu/drm/xe/xe_bo.c                |  39 +++--
 drivers/gpu/drm/xe/xe_bo_types.h          |   4 +
 drivers/gpu/drm/xe/xe_device.c            |  31 +++-
 drivers/gpu/drm/xe/xe_migrate.c           | 198 +++++++++++-----------
 drivers/gpu/drm/xe/xe_pci.c               |   2 +-
 9 files changed, 183 insertions(+), 122 deletions(-)

-- 
2.25.1

