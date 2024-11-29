Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA74DD729E6
	for <intel-xe@archiver.kernel.org>; Fri, 29 Nov 2024 15:18:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9607710E27B;
	Fri, 29 Nov 2024 15:18:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZR8DZTq7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D43CC10E27B;
 Fri, 29 Nov 2024 15:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732893487; x=1764429487;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1DtNvyMczbjIPDapiiSQRBolX6FmfJbX++55XMkn1Tg=;
 b=ZR8DZTq7ZHzELUV14yt0a++Bgw731O1ppjbk41O6bQVtS1lTtFVSyKXx
 X9d/JqDtuHK5lEHHV/I1lp1IQwqSxflSa9fKcyf939t7g9NUe1yoHw3V2
 HJbdcnBvAhY15hTUa/L9oLqSDVrRK2ZBbTu0sWSg7gYWQqEVJ4+lIrJ8z
 LS8AkqQb7H0kK+paIF6dkOFGk1AlgEelQGZiL40ZI+GrsJ1aUutLoi1yB
 OooFxmpJerX6m9hKsE+aK1YLMdshHQGZv6vGEpIIdWobXTxQveSW8HXxV
 fus6LJNjV3khazukH+swUukaMr5g4SNAxC1rHjslQQwmmWfkllEXuyXt9 A==;
X-CSE-ConnectionGUID: 8qSZSe2tQUeOvG3JfX8ZkA==
X-CSE-MsgGUID: K6cyMthARCuWLIZXykmbeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="44513490"
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; d="scan'208";a="44513490"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 07:18:06 -0800
X-CSE-ConnectionGUID: I7+JxL/XSiWg1QauX3Zg0g==
X-CSE-MsgGUID: 8vbPW+TQTfS+IajgObtdog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; d="scan'208";a="92394979"
Received: from eamartin-mobl1.amr.corp.intel.com (HELO
 gjsousa-mobl2.corp.amr.intel.com) ([10.125.111.90])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 07:18:05 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Luca Coelho <luciano.coelho@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 0/3] Flush DMC wakelock release work at the end of runtime
 suspend
Date: Fri, 29 Nov 2024 12:17:43 -0300
Message-ID: <20241129151754.22015-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.47.0
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

We currently are not calling display runtime suspend functions when
D3cold is not allowed. That end up causing DMC wakelock to be enabled
because of dynamic DC states. Because of that, we need to make sure we
flush the release worker at the end of display runtime suspend.

Gustavo Sousa (3):
  drm/i915/dmc_wl: Extract intel_dmc_wl_flush_release_work()
  drm/xe/display: Extract xe_display_pm_runtime_suspend_late()
  drm/xe/display: Flush DMC wakelock release work on runtime suspend

 drivers/gpu/drm/i915/display/intel_dmc_wl.c | 12 +++++++++++-
 drivers/gpu/drm/i915/display/intel_dmc_wl.h |  1 +
 drivers/gpu/drm/xe/display/xe_display.c     | 19 +++++++++++++++++++
 drivers/gpu/drm/xe/display/xe_display.h     |  1 +
 drivers/gpu/drm/xe/xe_pm.c                  |  4 ++--
 5 files changed, 34 insertions(+), 3 deletions(-)

-- 
2.47.0

