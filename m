Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461B0CA0EE4
	for <intel-xe@archiver.kernel.org>; Sat, 16 Aug 2025 03:36:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFCE010E2CC;
	Sat, 16 Aug 2025 03:36:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lHFgXZRy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBAC010E2CC
 for <intel-xe@lists.freedesktop.org>; Sat, 16 Aug 2025 03:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755315371; x=1786851371;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tGpK4A54Wbi5JQuKMLlPCsdPzycnSup4pXcQcx6Of7I=;
 b=lHFgXZRywnqpPG3cRdKDrqKUeSGGCcFdoliDEXG5l1Zsvpvj3YBI28R9
 Mf/EQRqx5Y1wk1ZV+65apRXiD64NUrYMyVzxh1koOIkDrLAPDoTmP00BI
 83DR3TsK0M/550rNUidQeKhIZ9iT3gPvhQU3Eka6eEXxc3OfaUleEzuho
 r+dJCIX5Tc6d/m3bu8BUw/95+ol3CL9F7bUaUGlOLxym2iwRDGJFc8aiR
 nfnO8bwzvYl1bOvjQtlZGkSQeRS8mxCMSngGDxDQv4LLaLzVtWyTNKF4h
 qBGHOaZXcGfuku+7eH4qji6F1aYwbt2mSBLF4b6YTZxplmkT/TDD1hFqC Q==;
X-CSE-ConnectionGUID: FaqmhmjdSTCNIgGc//RrWA==
X-CSE-MsgGUID: qTOzHGkoSp+jXWtrKSQRyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="57586163"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="57586163"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 20:36:11 -0700
X-CSE-ConnectionGUID: GCVwBMkZT9y0UqUIaCi5iA==
X-CSE-MsgGUID: BOKk5wPkTGScNgbqMoJuJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="166768337"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 20:36:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com,
	tomasz.lis@intel.com
Subject: [PATCH v2 0/1] Document GuC submission backend
Date: Fri, 15 Aug 2025 20:36:04 -0700
Message-Id: <20250816033605.2551575-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Long overdue: this documents the GuC submission backend’s design and
implementation, including the presumed VF resume flow.

Matt

Matthew Brost (1):
  drm/xe/guc: Document GuC submission backend

 Documentation/gpu/xe/index.rst         |   1 +
 Documentation/gpu/xe/xe_guc_submit.rst |   8 +
 drivers/gpu/drm/xe/xe_guc_submit.c     | 221 +++++++++++++++++++++++++
 3 files changed, 230 insertions(+)
 create mode 100644 Documentation/gpu/xe/xe_guc_submit.rst

-- 
2.34.1

