Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C81FBC25B74
	for <intel-xe@archiver.kernel.org>; Mon, 27 May 2024 21:19:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 629AE10EF84;
	Mon, 27 May 2024 21:19:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BxrTqjEX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C4310E56E
 for <intel-xe@lists.freedesktop.org>; Mon, 27 May 2024 21:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716844778; x=1748380778;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SJH/GjB0WzQMndPqEOebNThBJUNbFtY1unaJmzd5gWo=;
 b=BxrTqjEX01LRqoImM8f5VTHmlTVOB7oC73NxK7wXiTUzZ2PXlpilKVnS
 BCaXWpXyyt9NJ93Id1fNBMRwjMzoLIQ56/DZKp4iNajvdzuClfc2YpPTk
 R7IdvPkwTHNnml5Jz/sErPrw84Cb5EqJCYl+doDqLvWiRbr/7ngy5TBEB
 yrx1CClewFHdrE2Ly9CJTN/E5frgrasDO/eH73P5WbdOdpIjNwPFs6dvd
 cynh20lAPZ8vZXOlqKw+YXmJSu8ymcZv7AgvpR4s/cY0EbnMr78ssBqSa
 6V0rADV/xW4mu3OfAt/M9/D2+kFoJgnSgySLMK82Yt0ccbfC1AXVZk0JP A==;
X-CSE-ConnectionGUID: YK7h68DkQQuMkf3aKwG0vg==
X-CSE-MsgGUID: kK16Ys+UTwWgLy6cZu4bcA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13296446"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; d="scan'208";a="13296446"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 14:19:38 -0700
X-CSE-ConnectionGUID: lJqoO0VSTXy7XTChlx6h0Q==
X-CSE-MsgGUID: gdQ4tqw0SECT3OEGkqBOcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; d="scan'208";a="65666797"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 14:19:38 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [CI 0/2] Test GSC loading with Wa_22019338487
Date: Mon, 27 May 2024 14:19:26 -0700
Message-ID: <20240527211928.1179357-1-daniele.ceraolospurio@intel.com>
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

In my local testing I wasn't able to repro the hang we see with the GSC
loading with Wa_22019338487 applied, so sending this series to test on
a bigger pool to confirm if this indeed fixes the issue or if it was
just a timing change that managed to avoid it on that particular machine.

This series is not meant for review. The WA is in review separately while
for the GSC we'll just drop the revert from the for-ci branch.

Daniele Ceraolo Spurio (1):
  Reapply "drm/xe/gsc: define GSC FW for LNL"

Vinay Belgaumkar (1):
  drm/xe/lnl: Apply Wa_22019338487

 drivers/gpu/drm/xe/Makefile        |  2 ++
 drivers/gpu/drm/xe/xe_device.c     |  8 ++++++++
 drivers/gpu/drm/xe/xe_gsc.c        |  8 ++++++++
 drivers/gpu/drm/xe/xe_guc_pc.c     | 31 ++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_pc.h     |  2 ++
 drivers/gpu/drm/xe/xe_uc_fw.c      |  1 +
 drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
 7 files changed, 51 insertions(+), 2 deletions(-)

-- 
2.43.0

