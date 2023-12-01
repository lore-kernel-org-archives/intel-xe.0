Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ADD4C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Dec 2023 09:26:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2728B10E0DD;
	Fri,  1 Dec 2023 09:26:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC55110E0C4
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Dec 2023 09:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701422808; x=1732958808;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6pMm/Zyfz3cYEwPZ1G0qkTmrPn22dfHxReKoowpFLmc=;
 b=NM3l1gn1/+4kOKdHy8/QDZrb2qfxkhgg9LffaG8Pt6IhkDm6rdBT3bew
 a+AV7Jta76LUXbb9JnuuxgdRXJSAKT730CpCR2KKaGkxDrmf1tvhQKxys
 4kspluuQw/xQ9vB5Z6jD8tFQJxwb/8DfECsoxV+YsKD+ikzFtQaXqAJhd
 t1jD/Sl4tDeZTNALm/Dyow3EAb1tNOKjoxeFh36qFtSYsKQV8OUfrSkck
 Vy2ffIyfRYMe8U401U/0M/OyBS8XLarii2rmm6VQSqAkO3wWZ8nHRUjdi
 9bSJZWOrve8Ad99tgYuhvxg4/yD1XfAiMQ1SVscSJQHifsTnEYUnpykvf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="378498870"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="378498870"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 01:26:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="798655705"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="798655705"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orsmga008.jf.intel.com with ESMTP; 01 Dec 2023 01:26:47 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  1 Dec 2023 14:43:59 +0530
Message-Id: <20231201091405.658548-1-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 0/6] DSB refactoring
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

DSB refactoring for xe after cherry-picking DSB implementation of i915.

Acked-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>

Animesh Manna (3):
  Revert "FIXME: drm/i915/dsb: xe changes for dsb"
  drm/i915/dsb: DSB code refactoring
  drm/xe/dsb: DSB implementation for xe

Ville Syrjälä (3):
  drm/i915/dsb: Allocate command buffer from local memory
  drm/i915/dsb: Correct DSB command buffer cache coherency settings
  drm/i915/dsb: Re-instate DSB for LUT updates

 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/display/intel_color.c    |   3 -
 drivers/gpu/drm/i915/display/intel_dsb.c      | 153 ++++--------------
 .../gpu/drm/i915/display/intel_dsb_buffer.c   |  82 ++++++++++
 .../gpu/drm/i915/display/intel_dsb_buffer.h   |  29 ++++
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/display/xe_dsb_buffer.c    |  71 ++++++++
 7 files changed, 219 insertions(+), 121 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_dsb_buffer.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_dsb_buffer.h
 create mode 100644 drivers/gpu/drm/xe/display/xe_dsb_buffer.c

-- 
2.29.0

