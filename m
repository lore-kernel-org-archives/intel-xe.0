Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669F6D30CDB
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 22:10:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED9310E55C;
	Tue, 13 Jan 2026 22:10:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KfoLMWRt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5948710E55C
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 22:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768342255; x=1799878255;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sYa/Js21bYQ4U0X1v4tg49G+RCxi1rEKn6y1QBfjJCU=;
 b=KfoLMWRt15Zz5o3z+2eECK1BxJYNlH6mxK+gxj5end8y+fXS55ajYVXA
 +kbWXMqpNX/WF+ugfcC93Oiti+3wHwP9IGslP8pjn6wOrKZ90b6zDQKwJ
 LlBnk+IZuaDxT2S0rI9/JphDrQVfR1R1UBQNpjf+0CR9ZAzRjXMecxxd+
 IVoLiKM7jkPgsZzwXWwAL5dxxy6nG+jHdJAsXtoG67QQF1sAfsIIQXbce
 /DxBVT53Y8Fkfo7iD13ptiQKmFNmvYzSU23Lu/NIuZXRxEbkhccHoi/3k
 dOvH5ed4CmzIRz5QH/HbkWmuVUFBaIfiHi5DAEZQTXvg4oTf3JWHY8VSX A==;
X-CSE-ConnectionGUID: sTWjV1HeSJeOprIZnjT5Rg==
X-CSE-MsgGUID: nB9XnduITXexwx2F4KJX/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="87221053"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="87221053"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 14:10:54 -0800
X-CSE-ConnectionGUID: bhMnZe1rT5CIBJ4KrjqQOA==
X-CSE-MsgGUID: SjgYhh/eRMSnV8/TjziVqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="227669050"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.23])
 by fmviesa002.fm.intel.com with ESMTP; 13 Jan 2026 14:10:54 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH v5 0/2] drm/xe: drm/xe: Separate out GuC RC code
Date: Tue, 13 Jan 2026 14:07:59 -0800
Message-Id: <20260113220801.2198264-1-vinay.belgaumkar@intel.com>
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

This allows us to independently toggle GuC RC feature.

v2: Address review comments (Michal W)
v3: Add info about guc_rc, guc_pc and gtidle interaction (Michal W)
v4: Address remaining comments from v3 (Michal W)
v5: Remove rc_start/rc_init and just use enable/disable (Riana)

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Vinay Belgaumkar (2):
  drm/xe: Decouple GuC RC code from xe_guc_pc
  drm/xe: Add a wrapper for set/unset params

 drivers/gpu/drm/xe/Makefile    |   1 +
 drivers/gpu/drm/xe/xe_gt.c     |   1 -
 drivers/gpu/drm/xe/xe_guc.c    |   2 +
 drivers/gpu/drm/xe/xe_guc_pc.c | 110 ++++++++------------------
 drivers/gpu/drm/xe/xe_guc_pc.h |   3 +-
 drivers/gpu/drm/xe/xe_guc_rc.c | 140 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_rc.h |  17 ++++
 drivers/gpu/drm/xe/xe_oa.c     |   9 +--
 drivers/gpu/drm/xe/xe_uc.c     |  10 +--
 drivers/gpu/drm/xe/xe_uc.h     |   1 -
 10 files changed, 203 insertions(+), 91 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.h

-- 
2.38.1

