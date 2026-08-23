Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD0BFC5DF8C
	for <intel-xe@archiver.kernel.org>; Sun, 23 Aug 2026 10:18:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F94910E009;
	Sun, 23 Aug 2026 10:18:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LXfm05Ng";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE9C410E009
 for <intel-xe@lists.freedesktop.org>; Sun, 23 Aug 2026 10:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787480317; x=1819016317;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=w3cqvBeaAGMIPbIHtIxXPfevMxXirh+Sr3fJSbarUQw=;
 b=LXfm05NgOgsA9MKm/sEUt4vAu8oAfAYWxw/H9OVfBfGWb4bRmn5djR6b
 n5Gb6fMuEODK0GZYFbNkNaDjtrA9KKsRpDl4QhT5poCRK7SJI/rfQdBaI
 7B3KGCUSD/nUAk7KDDZTBJWuMbXAR9+6CQNpHydOJlSWvTdgJfLUH2q6H
 TRaAlPBRp17jQpAGP1ug56t+iV1M61N1ViYq2+7a3uLil/WRVME5VSJBr
 vl5QmIneBZobN7rdkl1vANkaWYk+VzSHa4iyn8NhONHsZHd6IIhQUiUhL
 iKKdbgtf05l0WtkuR2YaGyRTxOCy8aKld+xKVsspUb+IszQYjhLfSppAA g==;
X-CSE-ConnectionGUID: b4owHhvIRAq+07KKbvDYZA==
X-CSE-MsgGUID: vFYjF1c+SuG4ccvaYsV/ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="98547676"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; d="scan'208";a="98547676"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2026 03:18:36 -0700
X-CSE-ConnectionGUID: VBbgzymDQU2AEip1hRPsEA==
X-CSE-MsgGUID: DxP1HE6DRNi6eLOQn1iCKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; d="scan'208";a="266222461"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2026 03:18:35 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, heikki.krogerus@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH 0/2] Expose AMC alert reason sysfs
Date: Sun, 23 Aug 2026 16:05:24 +0530
Message-ID: <20260823103523.554184-4-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
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

Expose AMC alert reason sysfs.

Badal Nilawar (1):
  drm/xe/i2c: Expose AMC Alert reason sysfs

Heikki Krogerus (1):
  drm/xe/i2c: Not for review, Squash of I2C/AMC series

 .../ABI/testing/sysfs-driver-intel-xe-amc     |  21 ++
 MAINTAINERS                                   |   1 +
 drivers/gpu/drm/xe/Makefile                   |   4 +-
 drivers/gpu/drm/xe/regs/xe_i2c_regs.h         |   2 +
 drivers/gpu/drm/xe/xe_amc.c                   | 258 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_amc.h                   |  25 ++
 drivers/gpu/drm/xe/xe_i2c.c                   | 165 ++++++-----
 drivers/gpu/drm/xe/xe_i2c.h                   |  14 +-
 drivers/i2c/busses/i2c-designware-common.c    |   2 +
 drivers/i2c/busses/i2c-designware-core.h      |  85 +-----
 drivers/i2c/busses/i2c-designware-master.c    |   2 +
 drivers/i2c/busses/i2c-designware-slave.c     |   2 +
 include/linux/designware_i2c.h                | 107 ++++++++
 13 files changed, 523 insertions(+), 165 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-amc
 create mode 100644 drivers/gpu/drm/xe/xe_amc.c
 create mode 100644 drivers/gpu/drm/xe/xe_amc.h
 create mode 100644 include/linux/designware_i2c.h

-- 
2.54.0

