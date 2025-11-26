Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA52DD10377
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 03:52:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D5F10E4FF;
	Wed, 26 Nov 2025 03:52:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SoKDiPXI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DDD210E4FF
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Nov 2025 03:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764129145; x=1795665145;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PmgMkfS5iNaCVIyV9eFtmaVA8JHItoTk0WfTiEQX/z0=;
 b=SoKDiPXISOIEpM8IuSW+KWhsbdok9WTgbNNjcYHewkFKTgiT+rnDbnvE
 6w3TmaOWoFFINjQGeIsIDBmGYTuAI3pOUmDz2S+WmrB708ihl8zt/yJGe
 O/tY6hf/J17QypWr4W3oto1Z3ckWwuTeYiWPm+XAR40vVXqWkfl7CEHkv
 vbs1hGTPqSyvYZxk2wab7jT8s/bAl/uvbayoKDvUu93wXo6p5DXI2KgSy
 671ZsRlv4rei1XaYKQJV8xQqj1Nyjyhcb+pp81ZbzMyq5wse9vF7SUANq
 9PL1kMXwy241SRha9Mk8td4QbTkP/+x/7Omz52V9BD5GimnM9Sn9+hLM7 Q==;
X-CSE-ConnectionGUID: 3JFk7M2kQnKBdJddrOfrzA==
X-CSE-MsgGUID: SKemwJnWRNCZFua8h2HbLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="76778732"
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; d="scan'208";a="76778732"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 19:52:25 -0800
X-CSE-ConnectionGUID: cilHz08eTyCHCLiVnOH3/w==
X-CSE-MsgGUID: gAWOUq9KRxKz5014pJF7gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; d="scan'208";a="193260117"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 19:52:25 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 0/5] OA: More OA and register whitelist changes
Date: Tue, 25 Nov 2025 19:52:15 -0800
Message-ID: <20251126035220.13089-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
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

Test-with: 20251126035012.12967-1-ashutosh.dixit@intel.com

Ashutosh Dixit (5):
  drm/xe/oa: Use explicit struct initialization for struct xe_oa_regs
  drm/xe/oa/uapi: Add gt_id to struct drm_xe_oa_unit
  drm/xe/oa: Allow exec_queue's to be specified only for OAG OA unit
  drm/xe/rtp: Refactor OAG MMIO trigger register whitelisting
  drm/xe/rtp: Whitelist OAM MMIO trigger registers

 drivers/gpu/drm/xe/regs/xe_oa_regs.h  |  8 ++++
 drivers/gpu/drm/xe/xe_oa.c            | 49 +++++++++++----------
 drivers/gpu/drm/xe/xe_oa_types.h      |  1 +
 drivers/gpu/drm/xe/xe_query.c         |  4 +-
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 62 +++++++++++++++++----------
 include/uapi/drm/xe_drm.h             |  6 ++-
 6 files changed, 84 insertions(+), 46 deletions(-)

-- 
2.48.1

