Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1718CD5BB1
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 16:05:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72BF010E3B0;
	Mon, 25 May 2026 16:05:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lPfaG2o/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 205EB10E225
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 16:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779725139; x=1811261139;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=W8q9DHlmuobAtnsQPcvoc7jB1OVYE3nlh7tYlC343+U=;
 b=lPfaG2o/wpvQ1kbzR1tL7df5IB+aNKBgh7QQj6V0arZWO1Q1ut/obJ5s
 23AUq2gowCDS1SUhTobUSItKjHwpDzXX8ElY4k549uDUuHSBz0rLyxKST
 ldLSH+K1xyF1gsC6Ctcp35t/OWdK110dTxLXdVIQjUwSKF4KPNPZ7+sKe
 OGfKyHZMocSkCgqKLd+9RcIdI213npNE56hzvEjIfOvg2ADEq7ceeuYe4
 X+AGR6bcV9Ar5/O4Gkp3fk7oT9H/s+Rzh3PZT9DuRM6jkf0/xYCBzEyRq
 tN8+pus1O6ahQ8TXv+VPvQHn4FumeJKC1Hge912MVW2FuB7GDCCvC82BS g==;
X-CSE-ConnectionGUID: pum8Uq+RQFSG19oCnEjV+w==
X-CSE-MsgGUID: sesK/vIIQNyDzCIjetgPQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80275428"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="80275428"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 09:05:38 -0700
X-CSE-ConnectionGUID: SHysY1n4QWiliwVx3S/Y8w==
X-CSE-MsgGUID: NwR+NhfuQ/SSYLMO4xFnyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="235275230"
Received: from gkearney-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.250.94])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 09:05:37 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/6] drm/xe: Misc initialization improvements
Date: Mon, 25 May 2026 18:05:23 +0200
Message-ID: <20260525160529.15890-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This minor cleanup is also a yet another small step towards making the
fake kunit xe_device more powerful, which will come next.

Michal Wajdeczko (6):
  drm/xe: Drop unused param from xe_device_create()
  drm/xe: Move xe->info.force_execlist initialization
  drm/xe: Move xe->info.devid|revid initialization
  drm/xe: Separate early xe_device initialization
  drm/xe/pm: Don't access device in init_early()
  drm/xe/pm: Do early initialization in init_early()

 drivers/gpu/drm/xe/tests/xe_pci.c      | 12 ++++++
 drivers/gpu/drm/xe/tests/xe_pci_test.h |  2 +
 drivers/gpu/drm/xe/xe_device.c         | 57 ++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_device.h         |  4 +-
 drivers/gpu/drm/xe/xe_pci.c            | 20 ++++++---
 drivers/gpu/drm/xe/xe_pm.c             | 42 +++++++++++++++----
 drivers/gpu/drm/xe/xe_pm.h             |  1 +
 7 files changed, 106 insertions(+), 32 deletions(-)

-- 
2.47.1

