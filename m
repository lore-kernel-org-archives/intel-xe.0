Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 151DAD64074
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 17:42:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9BDA10E25E;
	Fri,  8 Nov 2024 17:42:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gy2nRIzh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A358D10E25E
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 17:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731087763; x=1762623763;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Z7mCGSVqAeMOP5V2Ijlj/C181Hh/t2vWLLoTz51dyks=;
 b=gy2nRIzhm+G8p120Njw0hIfkxMVA4f6D3F1zujUvkoKkcnc2hDJCy1rC
 CcPrBJL7FytJFufvb1EI/DBYSdnBtQn3ZOdrMckwONWcEL7NgKU9EjYLi
 ekbt0MhEJCRewnRQ0k+mn5KZ1QSwqIWPG6aFB4C8K51EK3zf57mAsefDG
 2/4CaDj21V6WQvLnrAieLNENBX5imQRYGjeitfGkJry8YFGVNwznmI8ac
 rTfkJvk192tQUKZz6YYjdW02TgRlBRZBLb8qZ+7VVKh4Ag/Jr/5VOB8iU
 WQdOVGxVao/WcKPvZPPF6Klqv+RyL5S/a3pGvqY8ffVSJ+Voytfm1YzdI w==;
X-CSE-ConnectionGUID: Mtj3uJGdRt2RLx1rm62m3w==
X-CSE-MsgGUID: BbZqn9A6QFyazBSHJkfORg==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="41598605"
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="41598605"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 09:42:42 -0800
X-CSE-ConnectionGUID: Lzqz236nQdile4Pnohj0sw==
X-CSE-MsgGUID: YstdqIY9SGiLMqHXB2T8iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="86001282"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 09:42:41 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: alan.previn.teres.alexis@intel.com, zhanjun.dong@intel.com,
 rodrigo.vivi@intel.com
Subject: [PATCH 0/7] Devcoredump Improvements
Date: Fri,  8 Nov 2024 09:43:05 -0800
Message-Id: <20241108174312.272792-1-matthew.brost@intel.com>
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

Mainly enabling devcoredump for LR queues. Missing is engine capture
from Zhanjun worked on to find one manually or from the GuC. Can be done
in a follow up.

Matt

Matthew Brost (7):
  drm/xe: Add xe_lrc_is_idle() helper
  drm/xe: Add ring address to LRC snapshot
  drm/xe: Add ring start to LRC snapshot
  drm/xe: Improve schedule disable response failure
  drm/xe: Add exec queue param to devcoredump
  drm/xe: Change xe_engine_snapshot_capture_for_job to be for_queue
  drm/xe: Wire devcoredump to LR TDR

 drivers/gpu/drm/xe/xe_devcoredump.c | 14 ++++++++------
 drivers/gpu/drm/xe/xe_devcoredump.h |  6 ++++--
 drivers/gpu/drm/xe/xe_guc_capture.c | 28 +++++++++++++---------------
 drivers/gpu/drm/xe/xe_guc_capture.h |  6 +++---
 drivers/gpu/drm/xe/xe_guc_submit.c  | 17 ++++++++++++-----
 drivers/gpu/drm/xe/xe_hw_engine.c   |  8 ++++----
 drivers/gpu/drm/xe/xe_hw_engine.h   |  4 ++--
 drivers/gpu/drm/xe/xe_lrc.c         | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_lrc.h         |  4 ++++
 9 files changed, 76 insertions(+), 37 deletions(-)

-- 
2.34.1

