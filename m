Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B87C5AC67
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 12:10:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D029210EB6F;
	Tue, 11 Aug 2026 12:10:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bol1XCq9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A3210EB6F
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Aug 2026 12:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786450214; x=1817986214;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=l8TDFyXePN2HC17RzFVwsk7gmjyxAVDNYUckPsfjbxU=;
 b=Bol1XCq9s6o2czoM1YyxZCsWQtx/GxBZutg3ARdqvtZUXhOhg109JExV
 cl/k1qYD4lDsytfcJ+qPJol0hk+HT1UHG7so0bgcr9K8c6eX6ZXCi+o+i
 E+CgIDY3So2awflMcDa+tq+6FhBEBH98ZzZSvb8a6q8CakmZzEAbylzTV
 f/STrfEYz5uMOPNaE1KoJ4VD2J84uBlPp/8YY+bHhF2Cv3Aw7VRGKilSv
 S2JQwh8fThea3kkoGVXyEGAoV4yS6Ia9fbRR40TANO9h8vorNlRbtFT7I
 qdA1VE+J7a/NPBR5hr+AX8Nve16cuzEaKNcyLuSBo2UpYh/xVc0svMmII w==;
X-CSE-ConnectionGUID: ZXe9kxWuSIKTwZNQkgyEKQ==
X-CSE-MsgGUID: X1ZDBLq7SDSI7zQEkpU/Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="85941371"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="85941371"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 05:10:14 -0700
X-CSE-ConnectionGUID: lWDI6FDVSp+d9h9bokhUNA==
X-CSE-MsgGUID: sP8ENv7hRSqcm89IUkyfIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="261560035"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa006.jf.intel.com with ESMTP; 11 Aug 2026 05:10:09 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Raag Jadav <raag.jadav@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
 Ramesh Babu B <ramesh.babu.b@intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>, linux-kernel@vger.kernel.org,
 intel-xe@lists.freedesktop.org, stable@vger.kernel.org
Subject: [PATCH v7 0/3] drm/xe/i2c: alerts and controller enabling
 modifications
Date: Tue, 11 Aug 2026 14:10:05 +0200
Message-ID: <20260811121008.1493015-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.50.1
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

Hi,

Changed since v6:
- Print the alert reason.

v6: https://lore.kernel.org/lkml/20260722133554.2079612-1-heikki.krogerus@linux.intel.com/
v5: https://lore.kernel.org/lkml/20260715153153.1243751-1-heikki.krogerus@linux.intel.com/
v4: https://lore.kernel.org/lkml/20260713155601.711389-1-heikki.krogerus@linux.intel.com/
v2: https://lore.kernel.org/lkml/20260625125939.429078-1-heikki.krogerus@linux.intel.com/
v1: https://lore.kernel.org/lkml/20260622114759.3464047-1-heikki.krogerus@linux.intel.com/

Heikki Krogerus (3):
  i2c: designware: Global register definitions
  drm/xe/i2c: Fix the interrupt handling
  drm/xe/i2c: Keep the i2c controller always enabled

 MAINTAINERS                                |   1 +
 drivers/gpu/drm/xe/Makefile                |   4 +-
 drivers/gpu/drm/xe/regs/xe_i2c_regs.h      |   2 +
 drivers/gpu/drm/xe/xe_amc.c                | 197 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_amc.h                |  25 +++
 drivers/gpu/drm/xe/xe_i2c.c                | 165 +++++++++--------
 drivers/gpu/drm/xe/xe_i2c.h                |  14 +-
 drivers/i2c/busses/i2c-designware-common.c |   2 +
 drivers/i2c/busses/i2c-designware-core.h   |  85 +--------
 drivers/i2c/busses/i2c-designware-master.c |   2 +
 drivers/i2c/busses/i2c-designware-slave.c  |   2 +
 include/linux/designware_i2c.h             | 107 +++++++++++
 12 files changed, 441 insertions(+), 165 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_amc.c
 create mode 100644 drivers/gpu/drm/xe/xe_amc.h
 create mode 100644 include/linux/designware_i2c.h

-- 
2.50.1

