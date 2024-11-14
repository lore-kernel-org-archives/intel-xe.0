Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B64CAD68B34
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 15:22:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 825A910E804;
	Thu, 14 Nov 2024 15:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nCogZc6F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 705BA10E7FE
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 15:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731597778; x=1763133778;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZcEde6unMCP6eNBI5MDi186MahiYLtKfhT8xJmYtQ3Q=;
 b=nCogZc6F2KM5fJ/3lavutQzWS1oM5TyDYrPTekz+V+I/CNklStnM2v9E
 7BzxUMul3zx45Y5uSekNxE6p3hJ7qfJayZ7rx9A8oy5fQE+6A7ApiW7Z1
 7cysvPowbr4bVQ11bYL7jhO3MFdw/PxDFEJERhHet9yXlIXNbLnAjMa0K
 z5l4oNFQ+/i+5w/bF2YY6cw9hK5mm7MEZ0AdIHMTYrEuMQQhhla8pahPG
 Tx7HCZ7Rz2RtNcIRH8pkuEiyLq4gmW0tVkD2CCJZBC94tMx6vDY1nvF1l
 d+TntaY38+q4ugWOgBGZ6p8n+GtpzFbPo6VSRdBl889vqsckRXndcNg4c A==;
X-CSE-ConnectionGUID: T8ohjL/tSR+1rAf+QsJ2qQ==
X-CSE-MsgGUID: vmzJ7cz/Tk+sRRdQOqUV+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="49004053"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="49004053"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 07:22:58 -0800
X-CSE-ConnectionGUID: IDgRHD8BR+WhoZ7BpnyIIw==
X-CSE-MsgGUID: PqO16/xfSQGFTYv8qYBIAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="93189383"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 07:22:57 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 0/4] drm/xe: Trivial header/flags cleanups
Date: Thu, 14 Nov 2024 07:21:44 -0800
Message-ID: <20241114152148.572447-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
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

A few patches to keep code base consistent, semi-related to each other
and grouped just for convenience.

Lucas De Marchi (4):
  drm/xe: Sort again info flags
  drm/xe: Include xe_oa_types.h
  drm/xe: Drop HAS_HECI_*
  drm/xe: Split xe_gt_stat.h

 drivers/gpu/drm/xe/xe_device.c         |  1 +
 drivers/gpu/drm/xe/xe_device_types.h   | 24 +++++++++++-------------
 drivers/gpu/drm/xe/xe_gt_stats.h       |  8 ++------
 drivers/gpu/drm/xe/xe_gt_stats_types.h | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_gt_types.h       |  4 ++--
 drivers/gpu/drm/xe/xe_heci_gsc.c       |  8 ++++----
 drivers/gpu/drm/xe/xe_irq.c            |  8 ++++----
 drivers/gpu/drm/xe/xe_query.c          |  1 +
 8 files changed, 40 insertions(+), 29 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_stats_types.h

-- 
2.47.0

