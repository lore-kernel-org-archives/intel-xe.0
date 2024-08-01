Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB8D8C3DA64
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 09:39:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 902B510E8CC;
	Thu,  1 Aug 2024 09:39:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SS5qrTCK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D34B10E8CC
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 09:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722505193; x=1754041193;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7s4Sj/e1KdY0SUBons3pmFfeam6zkeocGrZ3xkuuTMg=;
 b=SS5qrTCK/DReAnbn9gp8/eQHOrL9rU8vWLJZEzAgYuG3VNRjUm+9HxDW
 UcO2ZfhNWRK4B68xcBX9t2np32Dz/D+mXbZf3UwjT7iM9U9gGl2PoM+F6
 0N6Gs9/uH0xRIGatysXW6sAB2w5W/Cp1ZbOK+2jP2C3fZ0+XvZ4Gt7xo6
 ALmRCQ74Az+1lR7Y1QBUgB8G3/hOtotfdSdq4fqnWg6r4JnAnStZgTBy4
 2gwxFs27DOAU0zAgRRWbzAcM82BF3SrMtRcrX1oEoPYl2zqCdTZ2j5tCe
 vsaPlQH0BYP0obS1QRAPnnhr4Fex4P9m0Dy3QoUugvkr+AQQaXm7Nld+t A==;
X-CSE-ConnectionGUID: aRq3xFlXTASYqRL2ihP73g==
X-CSE-MsgGUID: eTIudyCpSjmi1+D19BqvOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="45859381"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="45859381"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 02:39:48 -0700
X-CSE-ConnectionGUID: od8Ezom2QvesiEV0epO0Mg==
X-CSE-MsgGUID: fspN5bKsRU2feXTSXfjWWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="55221557"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 02:39:46 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 vinay.belgaumkar@intel.com, matthew.d.roper@intel.com,
 badal.nilawar@intel.com
Subject: [PATCH v3 0/2] drm/xe/xe_gt_idle: add debugfs entry for powergating
 info
Date: Thu,  1 Aug 2024 15:23:03 +0530
Message-Id: <20240801095305.1209046-1-riana.tauro@intel.com>
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

Riana Tauro (2):
  drm/xe/xe_gt_idle: store powergate enable bits in gtidle
  drm/xe/xe_gt_idle: add debugfs entry for powergating info

 drivers/gpu/drm/xe/regs/xe_gt_regs.h  |   8 ++
 drivers/gpu/drm/xe/xe_gt_debugfs.c    |  13 ++++
 drivers/gpu/drm/xe/xe_gt_idle.c       | 107 ++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_gt_idle.h       |   2 +
 drivers/gpu/drm/xe/xe_gt_idle_types.h |   2 +
 5 files changed, 125 insertions(+), 7 deletions(-)

-- 
2.40.0

