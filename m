Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784D2CE7AB8
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 06:57:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E9DE10E7FB;
	Fri,  6 Sep 2024 06:57:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cMzpqhC4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51BE610E7FB
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 06:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725605848; x=1757141848;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5/dJ+HfbZEts31NOO0mZqQzDaU8A+p8YQDPZU6JpXa0=;
 b=cMzpqhC4oCMUNy4bex2oxJwaMIPrRzP5cXVsmunS3rZJl4YuBEyPrANe
 HIdY5YI2+ddAyCEGaux3wr9+q0dG72XHXL1ofFgKhkZ1vQR389JeQkBul
 f9476rqrLuZD8E1VqpwQb20B20sGJIpyrYmqNRLMEGu/8+D+IZSimuoHp
 MJxzX35Xc32a/Ct1lYzzTGzrMBc3D90hkyKm8/4N7JkXwq5AMPMXFcdmB
 jcxcqxVkXagXOUKKnxs+dMl27HuraaxKc4LemT5+r6BYuR68qZx/E2LRy
 hCUR99QAWoeZLqK25fUEopXptwG+Nl/0re/jfQHYJ2yc8r+aGnpr/VW64 w==;
X-CSE-ConnectionGUID: 5iczxcXxRuWEdQFFYWTcOQ==
X-CSE-MsgGUID: xsypS/c3Rr6FYLcUrtNTBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="35740147"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="35740147"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 23:57:28 -0700
X-CSE-ConnectionGUID: AGRwfNM8QKy5fHj8eHxjPg==
X-CSE-MsgGUID: 9jzS2aX/Rsa23Nx0IviLDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="65684833"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 23:57:26 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com, badal.nilawar@intel.com
Subject: [PATCH v5 0/2] drm/xe/xe_gt_idle: add debugfs entry for powergating
 info
Date: Fri,  6 Sep 2024 12:41:24 +0530
Message-Id: <20240906071126.28078-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
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

Add debugfs entry for powergating info

Rev3: do not wake GT if in C6 to read powergating info
Rev4: modify condition to enable powergating
Rev5: fix commit message and kernel-doc

Riana Tauro (2):
  drm/xe/xe_gt_idle: modify powergate enable condition
  drm/xe/xe_gt_idle: add debugfs entry for powergating info

 drivers/gpu/drm/xe/regs/xe_gt_regs.h  |   8 ++
 drivers/gpu/drm/xe/xe_gt_debugfs.c    |  13 +++
 drivers/gpu/drm/xe/xe_gt_idle.c       | 115 ++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_gt_idle.h       |   2 +
 drivers/gpu/drm/xe/xe_gt_idle_types.h |   2 +
 5 files changed, 133 insertions(+), 7 deletions(-)

-- 
2.40.0

