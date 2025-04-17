Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77850C369D0
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 19:52:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F38E10E3B1;
	Thu, 17 Apr 2025 19:52:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uvwaqxjv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E5B110E3AF
 for <Intel-Xe@lists.freedesktop.org>; Thu, 17 Apr 2025 19:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744919535; x=1776455535;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5FVE40b+RurV1dVTTp2lreGK8BZx3AIqv9HrqI4SzUA=;
 b=UvwaqxjvK2UuyBBoMoymW/VtUhlccoTYBmGudHqmjSq9dXEazYOej1NT
 BjSFfraaJY2uzUctHNT8cYDlO3UlyfiZMHfzeJFhRkxiNbr/MUIQ8lr9W
 bO0JdDziTu5CUYwURg1bwI0si4t6FyF3NLE9zXCg0m/Tz7q7fsxJjtH8/
 7cuWpFef33wR+UfFDjPHLzOXMFR801so/h433pCX7Id1JSr4pshOEPaBV
 Y+tJUA9xLZa4ee06qL4+TRyf8EO99+7lFRPFblWSdUlIepQLIUXoACcwm
 vSBo43Zo5TlQQTW1enHKSqu6gxZYOOxE59sskZsi9o3jKF1Y/tJ0ACxv7 Q==;
X-CSE-ConnectionGUID: kbDD3+FvQyWGEIhGGGNZGQ==
X-CSE-MsgGUID: IJiRqD53QjyO7JhjmX+AyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="46456363"
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="46456363"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 12:52:15 -0700
X-CSE-ConnectionGUID: C4SYlTTTSTKyXzjPv4MpOg==
X-CSE-MsgGUID: tJdMmCu7S+KplNvq0rTqIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="135765206"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa003.jf.intel.com with ESMTP; 17 Apr 2025 12:52:15 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 0/3] Fixes for steered register capture
Date: Thu, 17 Apr 2025 12:52:11 -0700
Message-ID: <20250417195215.3002210-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

Capture of steered registers was broken. So, fix that. It was also
causing memory operations on every dump rather than only at init time.
So, fix that too.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (3):
  drm/xe/guc: Fix capture of steering registers
  drm/xe/guc: Use the steering flag when printing registers
  drm/xe/guc: Cache DSS info when creating capture register list

 drivers/gpu/drm/xe/xe_guc_capture.c       | 98 +++++++++++------------
 drivers/gpu/drm/xe/xe_guc_capture_types.h |  2 +
 2 files changed, 48 insertions(+), 52 deletions(-)

-- 
2.49.0

