Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA884C55184
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 23:05:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2595810E3C7;
	Mon,  3 Aug 2026 23:05:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EGRKSOnx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A571E10E071
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Aug 2026 23:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785798339; x=1817334339;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JKCag0fA4IYpVNbjru2EeZSMLxy2NhgIks7N/W2prTQ=;
 b=EGRKSOnxOe7kK/ZuzKGty85MSTF+iaK/rv+EomEOY3VuI9FxGDcv/7nh
 IXEJBQd+L4DRrPUovjEQ4QcsH932b2/M7BAkuYzxWb066Vy56ld/AS46A
 QrgnfhgrxGUVYEz9UmQETmTyRUvTmv+st4tvfPbJt/mOStcCRVgqq50Vz
 MLsHjAO9PGwSih6cLvlFl8nD2t6ohT0F6LltBe3utAsGciz6bwTSRGnnC
 bQl5SVmuKOASAn6ob4UqRWUDCEQs98dD6j50jWzQ0F/TWoF7PW9Z4cdWy
 CEo96EuLwPW4CRkmQW63R5OTBHH0HtD2E0RaJcpSzeGH4ddv2mLci2Ltc w==;
X-CSE-ConnectionGUID: OjlTJtmZS+CvfGyC0SfEzA==
X-CSE-MsgGUID: zstnmyieTkGxr9wyESfddQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="111899765"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="111899765"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 16:05:38 -0700
X-CSE-ConnectionGUID: y0QvawfMSTG5MK2G/nXQiQ==
X-CSE-MsgGUID: TtE3yuxQQz6tNIGUy9wPZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="255054425"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 16:05:37 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH v3 0/4] drm/xe/multi_queue: Handle lost message during VF
 migration
Date: Mon,  3 Aug 2026 16:05:29 -0700
Message-ID: <20260803230528.3428029-6-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

During VF migration, CGP_SYNC message to GuC might get lost.
Handle it by resending the message again.
Also handle cgp_sync wait woken up by vf migration.

v2: Redesign to cover all corner cases

Assisted-by: Github-Copilot:Claude-opus-4.8
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Niranjana Vishwanathapura (4):
  drm/xe: split VF pause into prepare and revert phases
  drm/xe/multi_queue: handle CGP_SYNC wait timeout during VF recovery
  drm/xe/multi_queue: track and recover lost CGP updates across VF
    migration
  drm/xe/multi_queue: replay dynamic CGP updates lost during VF
    migration

 drivers/gpu/drm/xe/xe_exec_queue_types.h     |   7 +
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  32 +++-
 drivers/gpu/drm/xe/xe_guc_submit.c           | 173 +++++++++++++++++--
 3 files changed, 196 insertions(+), 16 deletions(-)

-- 
2.43.0

