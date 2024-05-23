Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75682C25B75
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 13:35:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB7810E769;
	Thu, 23 May 2024 13:35:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k3PGmiyh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB2710E8D2
 for <intel-xe@lists.freedesktop.org>; Thu, 23 May 2024 13:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716471333; x=1748007333;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h0N/m07IvlI4/1pfhSBYw7PzwYkaaBzHPEbhmbq5kRQ=;
 b=k3PGmiyhZEHa4Tn3ln66kA4MqmB/nwXkE+UE3DVNiTv28piyzBR2xiX/
 nvqLPmMdDaghuUgQ3COvJSNd9Zh1bS4gfCBtbfgsrQ/yw3cyyhKtEXQqT
 QZzxqnoZ/Bx4rxB+rSOH0f7NzTT862wOv2cjLbXVYJDTJaqTW/vTdLc1Z
 vZKDHxvAvq3MEc9h84zVDWi5gCGkngN2mWjPvBCYMThWOabWpuimby/IO
 ODI+LqcYlj6p7dsq6LcFxi2ngLOHIVbtgU0Bmgh8/UKS/aK9+kC8E7dJx
 cShI01q4bGB+D+yXBqGOez/3kLwV5SoVaSvYnYq/rlgAEx1ZYwLsMFe7n Q==;
X-CSE-ConnectionGUID: fU1M0BE8TrecGBO4mGLieA==
X-CSE-MsgGUID: f6quBmBSQqKU0GhGL7S+1g==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="11661614"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="11661614"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 06:35:12 -0700
X-CSE-ConnectionGUID: CJhZXbOmTlKp9U2EdthGkQ==
X-CSE-MsgGUID: qnYoHrKqQ7O7dyamR1XJ2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="38068674"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 06:35:11 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com
Subject: [PATCH v3 0/2] Enable Coarse Power Gating
Date: Thu, 23 May 2024 19:17:08 +0530
Message-Id: <20240523134710.102037-1-riana.tauro@intel.com>
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

Enable power gating for all units and sub-pipes that
are disabled by default.

Also standardize power gating registers

Rev2: re-phrase commit messages
      fix review comments

Rev3: set hysteresis value for render and media pg
      skip CPG for PVC

Riana Tauro (2):
  drm/xe: Standardize power gate registers
  drm/xe: Enable Coarse Power Gating

 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 12 +++---
 drivers/gpu/drm/xe/xe_gt.c           | 12 ++++--
 drivers/gpu/drm/xe/xe_gt_idle.c      | 57 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_gt_idle.h      |  4 +-
 drivers/gpu/drm/xe/xe_wa.c           | 10 ++---
 5 files changed, 76 insertions(+), 19 deletions(-)

-- 
2.40.0

