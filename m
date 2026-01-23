Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A4D9D7789B
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 23:53:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE4110E2F5;
	Fri, 23 Jan 2026 23:53:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T6CCvAhu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E44010E2F5
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jan 2026 23:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769212402; x=1800748402;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ISK38q/UHTOAbYjHgqmuLw09kjLATXhiFdykFQTrMlg=;
 b=T6CCvAhu/whY4mxow6XcsocOF39eumHU13vG7dlfFn6KMjk0odD1NvWf
 n7vdueVDYyxiOPXSu5VxjxfFRx0Op14IbG+YBSpAQJ40VGI7CUfeJQSGo
 FO2CikcTSH5LwNJWn0AgtDmqU7Y4K1N2NO9Bh32c5ppFyzFDp4+BPMDJ0
 KryN3am8z4XRLb6Ry3kZLWXSMMGQB1epCzDZoiwqyZFiinY4TxRJomxb+
 eDn/iasJqcvxhNWZE8UOb6Ch7V23Rw/BJ1ALb1BDdUxvbjcWNqM/YlIjd
 lAFcnnqZ8TFkowpC9mpK54ebEGAMDMq5jbu6IRwxO4VM08XaQrgnR3NAK g==;
X-CSE-ConnectionGUID: hD1AbrUfT0aTtNIxCNhV1w==
X-CSE-MsgGUID: CXTf3yTlRLmce5Wi7Y+rpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="80775771"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; d="scan'208";a="80775771"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 15:53:22 -0800
X-CSE-ConnectionGUID: Ya4hR5JbTLWnYCVtw274iQ==
X-CSE-MsgGUID: akBAZFm1S2WshASglHrQMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; d="scan'208";a="206402552"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.23])
 by orviesa010.jf.intel.com with ESMTP; 23 Jan 2026 15:53:21 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH v6 0/2] drm/xe: Separate out GuC RC code
Date: Fri, 23 Jan 2026 15:50:25 -0800
Message-Id: <20260123235027.379891-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

This allows us to independently toggle GuC RC feature. The previous
review for this series was at https://patchwork.freedesktop.org/series/159128/

v2: Address review comments (Michal W)
v3: Add info about guc_rc, guc_pc and gtidle interaction (Michal W)
v4: Address remaining comments from v3 (Michal W)
v5: Review comments (Riana)
v6: Some more review comments (Riana)

Cc: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Vinay Belgaumkar (2):
  drm/xe: Decouple GuC RC code from xe_guc_pc
  drm/xe: Add a wrapper for set/unset params

 Documentation/gpu/xe/xe_firmware.rst |   3 +
 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/xe_gt.c           |   1 -
 drivers/gpu/drm/xe/xe_guc.c          |   2 +
 drivers/gpu/drm/xe/xe_guc_pc.c       | 118 ++++++++--------------
 drivers/gpu/drm/xe/xe_guc_pc.h       |   6 +-
 drivers/gpu/drm/xe/xe_guc_rc.c       | 144 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_rc.h       |  17 ++++
 drivers/gpu/drm/xe/xe_oa.c           |   9 +-
 drivers/gpu/drm/xe/xe_uc.c           |  10 +-
 drivers/gpu/drm/xe/xe_uc.h           |   1 -
 11 files changed, 218 insertions(+), 94 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.h

-- 
2.38.1

