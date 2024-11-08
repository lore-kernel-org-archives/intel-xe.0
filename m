Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52AC6D6408D
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 21:27:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1547010E0AA;
	Fri,  8 Nov 2024 21:27:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QA9Xfmpl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35BF710E0AA
 for <Intel-Xe@lists.freedesktop.org>; Fri,  8 Nov 2024 21:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731101258; x=1762637258;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UJ9zCuXpE3esmv/fiLgXmzvmMSgl9tUBUwSon8+eHgI=;
 b=QA9XfmplT09WR3njIPOfLSENgVq67W+CTzK3xzE7UIk4E18w68WAuwll
 mcMSJE9Ucy5xHrwb+I0dE8URyY+TKXdzohlq2fKihMzvXaQXB2lRt1C6e
 xYnKmV8RkLPQ43VO/Lz1+CSUdiercYq9g3eget3pXBsG+ujX7Fqqy3+qr
 yYe1y/09r08/ZTZfbkpWMi9jabqsgtezzMY5eRiH6SBp+mdl3KFD5cjke
 zzCsPFcmp4SPINZ9Rq/dpxx1H7TsUicbElNMg1idVJearbpa5yayDQVqD
 uWCyXza8ciG3ib6BuJqvdhNOnRqhxDzNzmadrm3jn3x24oIlBDPhMu/QI Q==;
X-CSE-ConnectionGUID: da47/r63QkS1ciC3RAwvdw==
X-CSE-MsgGUID: X6cFAJRiT/SepRix2qO5/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30854863"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30854863"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 13:27:38 -0800
X-CSE-ConnectionGUID: LGqYXafNQESmp3vTVV9z7g==
X-CSE-MsgGUID: d0FnV0XuRRW2zin9Wq9APQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="85744254"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa010.jf.intel.com with ESMTP; 08 Nov 2024 13:27:38 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 0/2] drm/xe/guc: Handle crash notifications & drop default log
 verbosity
Date: Fri,  8 Nov 2024 13:27:35 -0800
Message-ID: <20241108212737.2044007-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
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

If an internal error occurs in the GuC firmware, it can send a crash
notification message to the KMD. So add support for handling that by
dumping state and triggering a reset.

Also, lower the default GuC log verbosity as max level is not
generally required but is very verbose.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (2):
  drm/xe/guc: Reduce default GuC log verbosity
  drm/xe/guc: Support crash dump notification from GuC

 drivers/gpu/drm/xe/xe_guc_ct.c | 23 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_module.c |  2 +-
 2 files changed, 24 insertions(+), 1 deletion(-)

-- 
2.47.0

