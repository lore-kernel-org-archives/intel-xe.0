Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD28D767F4
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 18:10:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53D0710E90C;
	Thu, 31 Oct 2024 18:10:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Au/rdhBJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C8610E03D
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Oct 2024 18:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730398222; x=1761934222;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Pk3a+05XGOMdPPPt1aJRCfhcKxtW+JkNMZymJFt+gSo=;
 b=Au/rdhBJCuOGndRmhBDIwFtNtc3p8AZUFhIwaUlvcWgMspKJq0czMNfw
 qTojSG8FXP0ob5SWDZI366vhDcGuqx4rPs2EZE1SkkeJEr/B+uVM1QOAo
 nNYo581oNshYh60NG89os7dGO9ADaNLyyhXwRUBjnyvc9TOHqT9RjPW1Q
 A+K38mc44U6m8BVrmp+vRQemR9nmE6R95rSkI4pDgKh65Z1AStuvj7Qe2
 WTOgQt3XArKIZAO8MVWWu6vFivUTVYbIoOiNxSvyqJrz+vLqnJSS/sP8U
 yRzOX3DEpgog3Huxp5Owtq0GIcbFaVloA6zM8WlGJWqRgY0S10irhBN/7 A==;
X-CSE-ConnectionGUID: l8Q8CvhaS5KAmYHgJGal0Q==
X-CSE-MsgGUID: IpGl0TblTrCXiWw1lrnfxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41255866"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41255866"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 11:10:22 -0700
X-CSE-ConnectionGUID: H4CYlbFyRsCBtBcNam9Cng==
X-CSE-MsgGUID: kulEsTCvQK22TbTMz1rUng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="86637556"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 11:10:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com
Subject: [PATCH v6 0/8] Fix non-contiguous VRAM BO access in Xe
Date: Thu, 31 Oct 2024 11:10:40 -0700
Message-Id: <20241031181048.2948948-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Fully reviewed and resending for final CI.

Dropping non-visible patch for now as it a bit larger, not strickly
required to unblock EU debug, and be sent independently in a follow up.

Matt

Matthew Brost (8):
  drm/xe: Add xe_bo_vm_access
  drm/ttm: Add ttm_bo_access
  drm/xe: Add xe_ttm_access_memory
  drm/xe: Take PM ref in delayed snapshot capture worker
  drm/xe/display: Update intel_bo_read_from_page to use ttm_bo_access
  drm/xe: Use ttm_bo_access in xe_vm_snapshot_capture_delayed
  drm/xe: Set XE_BO_FLAG_PINNED in migrate selftest BOs
  drm/xe: Only allow contiguous BOs to use xe_bo_vmap

 drivers/gpu/drm/ttm/ttm_bo_util.c     | 86 +++++++++++++++++++++++
 drivers/gpu/drm/ttm/ttm_bo_vm.c       | 65 +-----------------
 drivers/gpu/drm/xe/display/intel_bo.c | 25 +------
 drivers/gpu/drm/xe/tests/xe_migrate.c | 13 ++--
 drivers/gpu/drm/xe/xe_bo.c            | 99 +++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_devcoredump.c   |  6 ++
 drivers/gpu/drm/xe/xe_vm.c            | 17 ++---
 include/drm/ttm/ttm_bo.h              |  2 +
 8 files changed, 197 insertions(+), 116 deletions(-)

-- 
2.34.1

