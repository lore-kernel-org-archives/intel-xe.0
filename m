Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93532C02183
	for <intel-xe@archiver.kernel.org>; Sun, 19 Jan 2025 12:48:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27B1510E0D7;
	Sun, 19 Jan 2025 12:48:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nPDlUz0L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFFA710E0D7
 for <intel-xe@lists.freedesktop.org>; Sun, 19 Jan 2025 12:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737290923; x=1768826923;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=X88Il5zJoIon37xGm65H9v5CEZAqU2b676FxD5c8f2o=;
 b=nPDlUz0L/AP8bzmtSfsR4NE6pU19bnKa8gBKMG8pX3Q8lfchye1A7bQe
 aS+CSw/ydqDX/c8vIdgLg4jvbEivOC6jnYRIHd69iDkWI7MNu0+p5TaG5
 Qx6ct4X94SEDefDHWovs6qrekNLjX+HECPaJnsgosV0+pUHMa6ga475Uh
 hoqFvO15VsRPshl1+ltFTeJomuwpyMy3tYXRYKgiQBkDNmG9HJo3qfIaM
 eyLiRZjlIVtwxqzraqY9KkzsFlY/A4Q8WQq+X1Oy5AsB9Td0V4t0rHEyo
 oaKkr1O7dH6mxK78IYGeU7YGwz0Sur/WZK5aZrbyzzqJZiEE7N+trY7py Q==;
X-CSE-ConnectionGUID: InqZOxHvQMSRJe6ywQlWcQ==
X-CSE-MsgGUID: AaJSJAwOTSey6jxmHK/2UA==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="40473024"
X-IronPort-AV: E=Sophos;i="6.13,217,1732608000"; d="scan'208";a="40473024"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2025 04:48:42 -0800
X-CSE-ConnectionGUID: SO7lgdAOS8+0K6RGWyrWBw==
X-CSE-MsgGUID: x+bCn8qTQ9ae7/u4oeC+8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,217,1732608000"; d="scan'208";a="106077882"
Received: from spottumu-desk.iind.intel.com ([10.145.152.200])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2025 04:48:40 -0800
From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	sai.teja.pottumuttu@intel.com
Subject: [PATCH v2 0/2] Refactor some graphics descriptor flags
Date: Sun, 19 Jan 2025 18:06:42 +0530
Message-Id: <20250119123644.2881474-1-sai.teja.pottumuttu@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Refactor dma_mask_size and max_remote_tiles and place them in
the platform descriptor as they are more related to the platform
than the graphics IP.

v2:
 - Rebase

Sai Teja Pottumuttu (2):
  drm/xe: Refactor dma_mask_size
  drm/xe: Refactor max_remote_tiles

 drivers/gpu/drm/xe/xe_pci.c       | 31 +++++++++++++++++++------------
 drivers/gpu/drm/xe/xe_pci_types.h |  3 ---
 2 files changed, 19 insertions(+), 15 deletions(-)

-- 
2.34.1

