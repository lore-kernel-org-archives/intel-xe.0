Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E69C61DD9
	for <intel-xe@archiver.kernel.org>; Sun, 30 Aug 2026 06:56:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B6A810E011;
	Sun, 30 Aug 2026 06:56:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BStlF1UL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A706410E011
 for <intel-xe@lists.freedesktop.org>; Sun, 30 Aug 2026 06:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788072976; x=1819608976;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2ktHrhR2OwPGirj3W50j2dIQUT41I3mtDqrddE1tWzc=;
 b=BStlF1ULkCME28xrDqjvGmYn/QBhqogRYdosb98/YQI5Lbge/yFvPkIx
 5fb3giiTd2Dskurihhb2dekVAe2ZyJJzzQQxhvjBCP2rjHB9srRuYpcHd
 CW44jA4K6rZn6TuWexVS8gSaKSxcyguFBLQMRJr9/CCMosbC1+CPZg2+P
 aOgtzGc4Exz4joJ7Xi9FzjGCEbofOvBFFEdh0O8TJm/HgF/IVhi30Q3Gi
 pBteOALzc4veayPk1EFeV9YYh5MsPd4WsuON6Nl/GgaXy0tMiaIqEnN8o
 XMDF8wbm78EUobu6boWQVP6WpjpRij98hd6/mmjjxLS7kfb2r6ED8YSq+ g==;
X-CSE-ConnectionGUID: 69b5tgYGSE6mMtCUwpjjwQ==
X-CSE-MsgGUID: OIG13rdmRlyDfMiOlS8Jxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11890"; a="105890219"
X-IronPort-AV: E=Sophos;i="6.25,251,1779174000"; d="scan'208";a="105890219"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2026 23:56:16 -0700
X-CSE-ConnectionGUID: C099pafsQ0KDwIwZpm56Sg==
X-CSE-MsgGUID: Awc426I1Rc+oZ8kEkcFXDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,251,1779174000"; d="scan'208";a="268560030"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2026 23:56:14 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com
Subject: [PATCH 0/3] Handle non-fatal errors routed via IRQ
Date: Sun, 30 Aug 2026 12:26:04 +0530
Message-ID: <20260830065603.419055-5-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
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

Process, log and recover non-fatal errors routed via direct IRQ. For errors,
that cannot be recovered locally wedge the device with bus-reset as the
recovery action.

Raag Jadav (2):
  drm/xe/hw_error: Reuse CSC worker for generic error handling
  drm/xe/hw_error: Initialize hw_error_work per tile

Riana Tauro (1):
  drm/xe/xe_hw_error: Handle non-fatal errors routed via MSI

 drivers/gpu/drm/xe/xe_hw_error.c   | 62 +++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_tile_types.h |  4 +-
 2 files changed, 54 insertions(+), 12 deletions(-)

-- 
2.47.1

