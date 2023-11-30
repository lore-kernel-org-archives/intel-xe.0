Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7877C4167B
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 07:26:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D67B10E6BA;
	Thu, 30 Nov 2023 07:26:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4330D10E6BA
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 07:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701329211; x=1732865211;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=V025QGRVfV9pm53e/1z1De0+teg6bIGhvayYlbaHok0=;
 b=m+IXhGzK7TEWFN6tpBVNUHyu/LzO+swFqZNi6C2/65LfIOUFkIhgU1dX
 44EEm61gCyO+Nv26nBXLfMEBxVdcqMULzYDhUOf2GiIe6FuCEXRaxLjx/
 1XaimJRQoZ55CT4aVNkC74iVa2tHSFw/aD7lSSkqXp3G3qjT6GHIbqASZ
 4LNziwVcfwjP6EIBa3jJGJXQd6C1HqV+gQnlIyZGUgue8obelrEEn0sht
 O90ERBYgXd+ceUDZx7aYxwHqzPGO0IiLVEu+WMQfk/5VQin/3trwr1IXc
 tg8pN5u91NGx7SM8Uax6dehakgoWOIBsy6TTalcmpKoC9Yu/HEJmb3lkl w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="390442144"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="390442144"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 23:26:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="17290768"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa001.jf.intel.com with ESMTP; 29 Nov 2023 23:26:49 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 30 Nov 2023 12:44:01 +0530
Message-Id: <20231130071407.606176-1-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/6] DSB refactoring
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
 drivers/gpu/drm/xe/display/xe_dsb_buffer.c    |  70 ++++++++
 7 files changed, 218 insertions(+), 121 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_dsb_buffer.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_dsb_buffer.h
 create mode 100644 drivers/gpu/drm/xe/display/xe_dsb_buffer.c

-- 
2.29.0

