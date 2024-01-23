Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7CDC47258
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 05:06:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D1FE10E04B;
	Tue, 23 Jan 2024 05:06:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B0E010E04B
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jan 2024 05:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705986361; x=1737522361;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=S9pusBv2PiDYa76VS8pbMyReZv356ebyuSklBTzycTw=;
 b=Z0O5z0F8g+s/vnxvg32tpPdSCZAGoOSVAksEZ4ZxR9AnuMMmEzLXtvNt
 0QV3xgFx7Se3LK5LFFHqgfueVzj7yzwp7qeKd8Djarh6a+mnk5hTBhnxq
 4NuPJOXjUTWYybAEJ60ul1tQZhOBs6jBYEP5K3+V3YGgbAoedon4ZfBLa
 jQgGRkGGr/NoJ2cfFOVzLhwHG1ZGKdSY7Z4qNvKoNESYvFChpIhSy1a8H
 tJTt62Lgep8wuWVx6X/1KMio4b7nKYfQ/kHDKf472rcln1BSOoLiRm5bg
 H1Tw8Erhks2M61JZ/+dtms5U/ewzowW9VLR+72f2ndp9914npG975yvxV A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="398565272"
X-IronPort-AV: E=Sophos;i="6.05,213,1701158400"; d="scan'208";a="398565272"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 21:06:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="819964347"
X-IronPort-AV: E=Sophos;i="6.05,213,1701158400"; d="scan'208";a="819964347"
Received: from shekharc-desk.iind.intel.com ([10.190.239.16])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 21:05:58 -0800
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 0/1] drm/xe/xe2_lpg: Introduce performance guide changes
Date: Tue, 23 Jan 2024 10:35:51 +0530
Message-Id: <20240123050552.2250699-1-shekhar.chauhan@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

v1: Add performance guide changes to Xe2_LPG.
v2: Change GRAPHICS_VERSION_RANGE to END_VERSION_UNDEFINED for incorporating future platforms, if any.
v3: Remove irrelevant register changes.
v4: Misplaced CLR() with SET() for a bit. Fixed that.

Shekhar Chauhan (1):
  drm/xe/xe2_lpg: Introduce performance guide changes

 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 6 ++++++
 drivers/gpu/drm/xe/xe_tuning.c       | 9 ++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

-- 
2.34.1

