Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC4ECCFA19
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 18:24:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 881DE10EB62;
	Fri,  7 Nov 2025 18:24:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g2d28Q2c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2573410E1D2
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 18:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762539860; x=1794075860;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PiBfkp5aCpguOyskSnxqK4d9R2eXZ1SOirIA1BL3bGA=;
 b=g2d28Q2czcJknR6WwR8nCa5iy+QB7ifrpctHIw3zSoZjeT6T1EuB8SJR
 cU9x93MYDIO9Oj3fx3ONCmmvjWcYr814W2sSrpeL7nLPFTIREa14Ngo6T
 1IT18xFj+8cEhak9c8jUPoZuo/Fj9ZKQVctYCf/EUaDR8CODV7qbaD8kA
 8lGuwwyQaErUvMbDTo55pd7JH5gnKf2FxL7gZz1dqK94308qUxV8YsKlz
 IC6T95hydLSB6PSu/PjRuAm+DCXXVOnjTXqkCc5CRFb/qwrYfbvJ+aHU8
 6ODDUQRbwfnMO2YMQUIjMvUBZMey/UlMvH/3QLfcY6vjXpXGQMxTd8H7b g==;
X-CSE-ConnectionGUID: Gp94Qo9qSfmDwNeM9i/wHw==
X-CSE-MsgGUID: CLmDEGhhRDCgVbBysOq3sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64601682"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64601682"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:24:20 -0800
X-CSE-ConnectionGUID: 2bOR5B6tRRu4gWqGYrkcig==
X-CSE-MsgGUID: teaNYbZySs2t03R1A5xV9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="218756749"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:24:20 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, fei.yang@intel.com,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 0/2] drm/xe: Tile address change
Date: Fri,  7 Nov 2025 10:23:43 -0800
Message-ID: <20251107-tile-addr-v1-0-a3014aadc2e7@intel.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20251107-tile-addr-39f7f5cfbd71
X-Mailer: b4 0.15-dev-50d74
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

Same patch as https://lore.kernel.org/all/20250930232645.600251-1-fei.yang@intel.com/
but with the additional suggestions taken care of, one of them as
a separate patch.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Fei Yang (1):
      drm/xe: Use SG_TILE_ADDR_RANGE instead of TILE_ADDR_RANGE

Lucas De Marchi (1):
      drm/xe/vram: Move forcewake down to get_flat_ccs_offset()

 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 -
 drivers/gpu/drm/xe/regs/xe_regs.h    |  2 ++
 drivers/gpu/drm/xe/xe_vram.c         | 26 +++++++++++++++-----------
 3 files changed, 17 insertions(+), 12 deletions(-)

base-commit: c52463739ee9b9e6cdc34d31aa705c75c82679ec
change-id: 20251107-tile-addr-39f7f5cfbd71

Lucas De Marchi

