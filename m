Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39191C7EE29
	for <intel-xe@archiver.kernel.org>; Sat, 10 Jun 2023 00:12:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C8810E121;
	Sat, 10 Jun 2023 00:12:31 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0686510E121
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Jun 2023 00:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686355950; x=1717891950;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rZtLb3jAsZmHbiOwjUHh74IGyUpAhgyd0iVxCnttz2w=;
 b=Um3+dlWt1nVijobyOFxk+UD6UanciYkLiwpIvnDWyyMpq8zCsAGvQ4Sj
 AV/446EdfK3PYNvDpcJL4rGqEHANa83NrdWyMJR/wEo44VExB+eYfXFqS
 mkuHC8TTiAHcz4Z+QIP1GJb5D4s/YgjZjnYPYaoOJuXhVq3zHaz4mf+Br
 Lsf+N/01kiGigcm3krdmVMbhardWeQvGi3HWqKJR5p2lrH6hBsFtjQayq
 w6ve+ol8FLPra72h9f/FnaEahtTQpiDlZMKuhoejKtezVK43UdbH28qmL
 qnSdtF7TI4DefwnS4gtRJtdz8nQrMnejS2wh3azyWNSuRsFITVJ96H3po w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="355199677"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; d="scan'208";a="355199677"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 17:12:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="743647061"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; d="scan'208";a="743647061"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 17:12:29 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  9 Jun 2023 17:12:23 -0700
Message-Id: <20230610001226.4577-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 0/3] drm/xe: Add preemption timeout config options
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
Cc: thomas.hellstrom@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Allow preemption timeouts to be specified as a config options.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (3):
  drm/xe: Add CONFIG_DRM_XE_PREEMPT_TIMEOUT
  drm/xe: Add DRM_XE_PREEMPT_TIMEOUT_COMPUTE
  drm/xe: Add DRM_XE_PREEMPT_TIMEOUT_COMPUTE_COPY

 drivers/gpu/drm/xe/Kconfig         |  6 +++++
 drivers/gpu/drm/xe/Kconfig.profile | 40 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_engine.c     | 30 +++++++++++++++++++++-
 3 files changed, 75 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/Kconfig.profile

-- 
2.21.0.rc0.32.g243a4c7e27

