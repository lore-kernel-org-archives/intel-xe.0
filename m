Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B8FCD343B
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 06:37:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0250B10EF76;
	Thu,  7 May 2026 06:37:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZdLHkkmY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C20910EF76
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 06:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778135852; x=1809671852;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RbLbmOaHttShi4RnNkOTsj2XbiMzactGwBLVVlq8doY=;
 b=ZdLHkkmYKM0d7VDWtpUsQASaxI1oXsY0IM9H9awXXCZS2aHzwTgB7Uy3
 +bp/R7oT59Vhgsp+joxJ1GFNHC4dWN+YgRWJAnZPnPuDLYwF3a5tJMUMW
 Qk1HTHRm6yR76saOhTD2xjdOQg80UzFj+PSOsv4HPu1dK/ELmpS9bNBTp
 eiK7oPaBqE1AycO2TUQVVSWhIJRlP8UgrCyH0YU1DrpT4reudc0T/x5HC
 CsNTkygzhL4eGntqVxzYv4598TTJXJPGFWqL5uZRUh0Arx52JgZKYRBff
 7uMMmsgfS6kfYYjFAsKPZgbyMFqIBFjimeOBCovDO4qVuOTlbhMzXKoBe w==;
X-CSE-ConnectionGUID: NtcpDQQSSAmWtqNTAIlfew==
X-CSE-MsgGUID: 1nQNIeWmQUGY6cxaFTVMZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="101752633"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="101752633"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 23:37:32 -0700
X-CSE-ConnectionGUID: Pe28mx+dSwi3jfbA0LWJdg==
X-CSE-MsgGUID: nZp2k7CiTSyi/yAMiZVQPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="229984781"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 23:37:30 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH 0/3] Refactor functions implementing the blt batch buffer
Date: Thu,  7 May 2026 12:12:30 +0530
Message-ID: <20260507064229.397673-5-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.43.0
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

Functions implementing batch buffer for blitter instructions MEM_SET,
MEM_COPY, XY_FAST_COPY and XY_FAST_COLOR use a fixed instruction length
hardcoded inside the function.
In future platforms the length of these instructions will be increased.
Replace those fixed instruction length with a function which returns the
length of the instruction based on the platform.
For now those functions still return the fixed length but will be
extended while adding support for future platforms.
This series is a prep work for supporting the upcoming platforms.

Balasubramani Vivekanandan (3):
  drm/xe: Refactor emit_clear_main_copy
  drm/xe: Refactor emit_clear_link_copy
  drm/xe: Refactor emit_xy_fast_copy and emit_mem_copy functions

 .../gpu/drm/xe/instructions/xe_gpu_commands.h |  6 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c         |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c               | 57 +++++++++++++++----
 3 files changed, 50 insertions(+), 15 deletions(-)

-- 
2.43.0

