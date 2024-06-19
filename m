Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC749C27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 01:07:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 746E510E19E;
	Wed, 19 Jun 2024 01:07:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HLKd5RyK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6438310E19E
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jun 2024 01:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718759272; x=1750295272;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HG6d/dr/ViI19RqxG+6uO6+PdwiZFysHcI7PySGRREM=;
 b=HLKd5RyKyE0CKxinBdVXbnG4AyteDQs/XB0aUVLxnXold1OUAMvQre0F
 3xKvBeewXQL8+tyIh1QEdIvmLZtq78S7IiYBp+L4OtvJCCdN16vgekdFU
 rm2ofjNDv36VqQDCRe2PJb6DvxObmL+XU4OlZrN2cDFOmxKoe5/lfD9AM
 e2nNjebeQKYtie5XKg1Qpdw3oy83TZzmbPaFOTAu9D5vJEArNzf39h7/m
 k7j9BPOd/XYnYUQNire8NpEXQm4BLfPwDWwD65w5XHEvbz63AQwkwQn/6
 D+19CRuVSNGl2GfDftyQLjvADi/YkY2ha5Y4Q6cxfvkx89AOqQNVE8V+K w==;
X-CSE-ConnectionGUID: /P7LCXwuQ+ygGfgvYrGYJg==
X-CSE-MsgGUID: Z56U9dvxSPG79adwuEEhIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15804505"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="15804505"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 18:07:51 -0700
X-CSE-ConnectionGUID: JrRrJWGTQ1SejjX0xFlK9g==
X-CSE-MsgGUID: sU7hqhAyROeNVDIPmTK+qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="41840949"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by orviesa009.jf.intel.com with ESMTP; 18 Jun 2024 18:07:52 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v5 0/2] Apply Wa_22019338487
Date: Tue, 18 Jun 2024 18:06:40 -0700
Message-Id: <20240619010642.3744702-1-vinay.belgaumkar@intel.com>
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

 drivers/gpu/drm/xe/Makefile          |  3 +
 drivers/gpu/drm/xe/xe_device.c       |  3 +
 drivers/gpu/drm/xe/xe_ggtt.c         | 40 +++++++++++--
 drivers/gpu/drm/xe/xe_ggtt.h         |  1 +
 drivers/gpu/drm/xe/xe_ggtt_types.h   | 12 ++--
 drivers/gpu/drm/xe/xe_gsc.c          |  5 ++
 drivers/gpu/drm/xe/xe_gt.c           | 24 ++++++++
 drivers/gpu/drm/xe/xe_gt.h           |  1 +
 drivers/gpu/drm/xe/xe_guc.c          |  4 +-
 drivers/gpu/drm/xe/xe_guc_pc.c       | 84 +++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_pc.h       |  2 +
 drivers/gpu/drm/xe/xe_guc_pc_types.h |  4 ++
 drivers/gpu/drm/xe/xe_wa_oob.rules   |  1 +
 13 files changed, 173 insertions(+), 11 deletions(-)

-- 
2.38.1

