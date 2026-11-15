Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D905606A31A
	for <intel-xe@archiver.kernel.org>; Sun, 15 Nov 2026 12:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FYya7ELs
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA3810E076;
	Sun, 15 Nov 2026 12:24:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8909210E076
 for <intel-xe@lists.freedesktop.org>; Sun, 15 Nov 2026 12:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794745492; x=1826281492;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GvYCbcKHInBdPL9sDpJxiLJutj27P/FFZS1LFobKA60=;
 b=FYya7ELs+dSZdjWoEk89BNpZEq3DPNGt1v7JBOIrC2w+ASxtx3v+nexO
 whBoZyix24MKB1GkFqiT5xaF1JpMKkyyh5cvdnA6IQeABcBv9sa8XCEb3
 CJ9ey3ArAy8Sj6l34YYnS+2gy/BdZyqO7UXHpCek2i8t899/JUGBl3UuQ
 GxaIxce2dLjA9u7/uP8k45ioPWsaGj130bZX9QJ2dFmM9/x0D9n7OwUm3
 zctaOLJvrtsGFadCJdfLTevMFKO7lL3Gh+Fihwx+b/ltqal2+pv8agu83
 AuQ6oIPEh14mUBOHV0WxTYInIVRCi+OJgGBIfT6/hbaBiyTsjQRxO3seC A==;
X-CSE-ConnectionGUID: Eay0zPzbRE64erchIGiH4A==
X-CSE-MsgGUID: oVt+6PlVQu6B4Le3UwZ8Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3481535"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3481535"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2026 04:24:52 -0800
X-CSE-ConnectionGUID: 2u8Dl+LdSTKmSWwUiZ/sJw==
X-CSE-MsgGUID: luyRQeetTQ2/A2Aamgcszg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9160019"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2026 04:24:51 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [CI v1 0/1] tty: vblank waiting out on crtc 0
Date: Sun, 15 Nov 2026 13:24:40 +0100
Message-ID: <20261115122441.3141883-1-michal.grzelak@linux.intel.com>
X-Mailer: git-send-email 2.45.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Not for review. Sent for general mailing list since there's no trybot
for xe.

This commit aims at fixing [1]. Fingers crossed.

BR,
Michał

[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9362

Michał Grzelak (1):
  Revert "serial: 8250: Switch to nbcon console, take 2"

 .../accessibility/braille/braille_console.c   |  57 +---
 drivers/tty/serial/8250/8250.h                |   5 +-
 drivers/tty/serial/8250/8250_core.c           |  65 +----
 drivers/tty/serial/8250/8250_dw.c             |   2 +-
 drivers/tty/serial/8250/8250_mid.c            |  14 +-
 drivers/tty/serial/8250/8250_port.c           | 261 +++---------------
 drivers/tty/serial/amba-pl011.c               |   2 +-
 drivers/tty/serial/imx.c                      |   2 +-
 drivers/tty/serial/sifive.c                   |   2 +-
 include/linux/console.h                       |  15 -
 include/linux/serial_8250.h                   |  16 +-
 kernel/printk/nbcon.c                         |  80 ------
 12 files changed, 70 insertions(+), 451 deletions(-)

-- 
2.45.2

