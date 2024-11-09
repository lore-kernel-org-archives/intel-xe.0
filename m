Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972EFD6409D
	for <intel-xe@archiver.kernel.org>; Sat,  9 Nov 2024 01:59:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C00B10E33A;
	Sat,  9 Nov 2024 01:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JzU4uE/J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF6D110E326
 for <Intel-Xe@lists.freedesktop.org>; Sat,  9 Nov 2024 01:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731117577; x=1762653577;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pWANHdY3OA7gxQTxS5whKvt9+MEuDOQyC6khpBTplPg=;
 b=JzU4uE/JoFUaRuWV4lSckZJ0whw9ecCiuC5vztuhq7eCZ11ezUZYsoJk
 /8V57aaB7ve4SAkc6EunBlyzlhH+QmEK83lX2jqcM3YlXF63b/0nfInqW
 VJRiP5VmqSyjLNInW/JRzzaOICTI4MQqTkwgdP6ZDWuzlIcZYZuaBl18F
 f5TKCO/iqxOIMNGis0PAAoTEkStZwsvDnRqWOcA/t7mApPPaFlKiuGMb9
 BsuJDvGgnfOa6vNqKZ8a3n+kjbhhwUKMIFNjOByaILw92FniSk21hQDql
 tR2sJZRDChW33DoMhmSoxMPPFAYB/9l71WTu5ccwIr19xoL7RiKndt+W7 g==;
X-CSE-ConnectionGUID: jAJn0GgUSoKxsW9IqpovMw==
X-CSE-MsgGUID: u9oR81BgRgOFGaosUVcqWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="34799509"
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="34799509"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 17:59:36 -0800
X-CSE-ConnectionGUID: qzPiDEsyRcWK0s/G0JxmXg==
X-CSE-MsgGUID: LiB032F5Tvml03zWLo1i4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="90369002"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa005.fm.intel.com with ESMTP; 08 Nov 2024 17:59:35 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [RFC 0/5] drm/xe: Support capture and dump of devcoredump for general
 debug
Date: Fri,  8 Nov 2024 17:59:29 -0800
Message-ID: <20241109015934.2203462-1-John.C.Harrison@Intel.com>
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

It is useful to be able to dump driver/hardware state when various
unexpected errors occur. E.g. on an internal error in the GuC
communication layer, there is a dump of the GuC state. Currently the
CT code rolls its own capture and print. However, the devcoredump
mechanism is basically doing exactly the same thing. So tweak that to
allow it to be called from arbitrary places and use it instead.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (5):
  drm/xe/devcoredump: Support coredumps without jobs
  drm/xe: Trigger a devcoredump capture on a GT reset
  drm/xe: Disconnect coredump structure from xe_device structure
  drm/xe: Make coredump printing to in-memory cache optional
  drm/xe: Support devcoredump capture from dead CT handler

 drivers/gpu/drm/xe/xe_devcoredump.c       | 266 ++++++++++++++++------
 drivers/gpu/drm/xe/xe_devcoredump.h       |   9 +-
 drivers/gpu/drm/xe/xe_devcoredump_types.h |   2 +
 drivers/gpu/drm/xe/xe_gt.c                |   4 +
 drivers/gpu/drm/xe/xe_guc_ct.c            |  57 +++--
 drivers/gpu/drm/xe/xe_guc_ct_types.h      |   6 +-
 drivers/gpu/drm/xe/xe_guc_submit.c        |   2 +-
 7 files changed, 241 insertions(+), 105 deletions(-)

-- 
2.47.0

