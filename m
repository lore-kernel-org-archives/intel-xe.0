Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E6CEDE990
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 08:06:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30EC910E519;
	Thu, 14 Sep 2023 08:06:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75FEC10E518
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 08:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694678764; x=1726214764;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=alarmb21xDs8/wpKmjdMyWqIYrA8sjPPUobI9aXdkIA=;
 b=Gr4Ixok6gVqj5VvJT1QTz6IBxV23tTUFFi0WCPKN1MIs658ut70tMP2g
 ktmXeiAcG1dMhx9mdkuIVdA2XDeQ/r4kR1NQtw6iV7U2bhON7X5ES19Ys
 3oJuM4NYKyLcKa7SHZcIPPwTs26UN9i3scsKGv/639NE1QAPH+Z7vtwlk
 1iNAni/L+mch8FkpFR+DRDMb0Tk0Ti7YgTHDWlsDwzf0NQbjURs2cn1oh
 kYfhqsnh8oEUdCMc/h3+LSpxxbegzdXjQWgRoPy51YGnfGgskO1CSs3A2
 PzTx9Xc/021Ff/HHyLIqu1w7wMMurApAHSyQIi8KQ7R76EmtVS3ELUDy9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="442917346"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; d="scan'208";a="442917346"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 01:06:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="887691557"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; d="scan'208";a="887691557"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 01:05:29 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Thu, 14 Sep 2023 11:01:34 +0300
Message-Id: <20230914080138.4178295-1-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/4] drm/xe/gsc: add initial gsc support
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

V2: Added heci_ to struct and APIs
    heci_gsc moved under xe_device as GSC is not under GT

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>

Vitaly Lubart (4):
  drm/xe/gsc: add HECI2 register offsets
  drm/xe/gsc: add has_heci_gscfi indication to device
  drm/xe/gsc: add gsc device support
  mei: gsc: add support for auxiliary device created by Xe driver

 drivers/gpu/drm/xe/Kconfig           |   1 +
 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/regs/xe_regs.h    |   4 +
 drivers/gpu/drm/xe/xe_device.c       |   4 +
 drivers/gpu/drm/xe/xe_device_types.h |   7 +
 drivers/gpu/drm/xe/xe_heci_gsc.c     | 205 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_heci_gsc.h     |  35 +++++
 drivers/gpu/drm/xe/xe_irq.c          |  14 +-
 drivers/gpu/drm/xe/xe_pci.c          |   9 +-
 drivers/misc/mei/gsc-me.c            |   5 +
 10 files changed, 281 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_heci_gsc.c
 create mode 100644 drivers/gpu/drm/xe/xe_heci_gsc.h

-- 
2.34.1

