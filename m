Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FB6C27C6E
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 08:11:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB6110E1B4;
	Mon, 17 Jun 2024 08:11:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eso8HSvE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A27FE10E2D5
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 08:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718611916; x=1750147916;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LoESmIskQOU+JsoLCGZBBiK7qFkfrNMgaV4kcJtkK24=;
 b=Eso8HSvEwEhAxv57KcbB/ot3eywYqi/2cJ114NPqwzKyV4AZoAdVnkns
 czOkcOK1LOh4Zv8lCBhGmKcHG9HikJNBrEfidUD9+LaQQVgwCYT/fdZI8
 vDKoMGtNGoTa7tQnaUd/7XaulE6AHpbWMtwyANj4OsTeKIww1oGst2YPn
 vcuoFpIVvH5jCrKdKfPAJlQQIqegK3qXEISUwQyyD0XYH0D8mqu9wPPv/
 Bj0rg9fh0pIWm/MvEKZOHYWHo7qh2tzzoS9Wv53rAb2XzzBpgQ9NqKC6j
 xXkyw2P0SSWANnYZLm0MXeliT3FMD0DDBlD3ozBHu/ccFbQDuza+5f4hs A==;
X-CSE-ConnectionGUID: /3ysw1x2So+jUXrvUUNAJQ==
X-CSE-MsgGUID: q6wruCt5SIiTpjOKk43agQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="26544001"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="26544001"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 01:11:56 -0700
X-CSE-ConnectionGUID: a2n6brpTTSaDqOBLduonIw==
X-CSE-MsgGUID: u+3QE342QCKe4nXlcqXtJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="78602779"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by orviesa001.jf.intel.com with ESMTP; 17 Jun 2024 01:11:56 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v4 0/2] Apply Wa_22019338487
Date: Mon, 17 Jun 2024 01:10:49 -0700
Message-Id: <20240617081051.3340442-1-vinay.belgaumkar@intel.com>
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

Apply WA for LNL and also ensure frequency request is raised in the
resume path as well. The WA applies to the resume path too.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Vinay Belgaumkar (2):
  drm/xe/lnl: Apply Wa_22019338487
  drm/xe/guc: Request max GT freq during resume

 drivers/gpu/drm/xe/Makefile          |  2 +
 drivers/gpu/drm/xe/xe_device.c       |  3 +
 drivers/gpu/drm/xe/xe_ggtt.c         | 22 ++++++++
 drivers/gpu/drm/xe/xe_ggtt_types.h   |  2 +
 drivers/gpu/drm/xe/xe_gsc.c          |  5 ++
 drivers/gpu/drm/xe/xe_gt.c           | 24 ++++++++
 drivers/gpu/drm/xe/xe_gt.h           |  1 +
 drivers/gpu/drm/xe/xe_guc.c          |  4 +-
 drivers/gpu/drm/xe/xe_guc_pc.c       | 84 +++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_pc.h       |  3 +
 drivers/gpu/drm/xe/xe_guc_pc_types.h |  4 ++
 drivers/gpu/drm/xe/xe_wa_oob.rules   |  1 +
 12 files changed, 152 insertions(+), 3 deletions(-)

-- 
2.38.1

