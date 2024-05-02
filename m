Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9252AC04FFE
	for <intel-xe@archiver.kernel.org>; Thu,  2 May 2024 22:33:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BFF610EE05;
	Thu,  2 May 2024 22:33:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L22uwnfE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCBA110E330
 for <intel-xe@lists.freedesktop.org>; Thu,  2 May 2024 22:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714689206; x=1746225206;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oQ9ZFeMKRJ0XNSq2vvYHE67AE54ZbfmHIN5LZddcSBo=;
 b=L22uwnfEfbyJjOPjoMgaD68fVrWFWtKTpTazRJq2D3nxJHpSbDJu+OI+
 sW4opR4EgUDPBmQOAsG1MiQ12g+CNgucuGiGnPxgpbLEUN+4E/pGkKCZA
 EumQqFT69BJXNT4gA+ZuaatKuUi6tA/AFgU66juqrFcwEy6txPUHXjQp/
 HRWX6xFiD0oIqQ/K9F5qRGlbqVGgCzgUzVUEBlJEhn9tapovB8znBhey/
 pUVZei5QKSVmjm3hxpRzliIfscE8oFKZhkK+7vHJuCc3J3m4VUbdXuzB2
 QSYIWBdRKkg6Ytzu9KxHAPEHOgIPHoxdMGEoZ1abYfO7h/1HgxB0cYnG0 Q==;
X-CSE-ConnectionGUID: f3VytVj5TzC9T207E2xk6A==
X-CSE-MsgGUID: UhY1cekSQDOf2TJbWJo0GQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="10312968"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="10312968"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 15:33:25 -0700
X-CSE-ConnectionGUID: 03b18IcETlSGjnnHsGhc6g==
X-CSE-MsgGUID: ijuotal+Q1u3tqzHvGBoyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="32061533"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.17.255])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 15:33:25 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v3 0/3] Define generic helpers for manipulating macro arguments
Date: Fri,  3 May 2024 00:33:10 +0200
Message-Id: <20240502223313.2527-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

v1: https://patchwork.freedesktop.org/series/133123/#rev1
v2: don't pollute linux/args.h yet (Andy, Lucas)
v3: add explicit comment on future use inside the code (Lucas)
    add xe_args kunit tests (Michal)

Michal Wajdeczko (3):
  drm/xe: Add helpers for manipulating macro arguments
  drm/xe/kunit: Add simple tests for new xe_args macros
  drm/xe/rtp: Prefer helper macros from xe_args.h

 drivers/gpu/drm/xe/tests/Makefile       |   1 +
 drivers/gpu/drm/xe/tests/xe_args_test.c | 190 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_args.h            | 121 +++++++++++++++
 drivers/gpu/drm/xe/xe_rtp.h             |   4 +-
 drivers/gpu/drm/xe/xe_rtp_helpers.h     |  26 ++--
 5 files changed, 324 insertions(+), 18 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_args_test.c
 create mode 100644 drivers/gpu/drm/xe/xe_args.h

-- 
2.43.0

