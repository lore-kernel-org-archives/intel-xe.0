Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A2AC02181
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 23:33:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68C7F10E004;
	Wed, 22 Jan 2025 23:33:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ANyGSr8R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94FAB10E26F
 for <Intel-Xe@lists.freedesktop.org>; Wed, 22 Jan 2025 23:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737588805; x=1769124805;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iPYyLfDTq236NXMAHf4WjodOEj1Um7l12xOUGooceGI=;
 b=ANyGSr8RRABMebt0msOanKdwF7ffjyqCAEeP2x0d3Cg0bsG+YOvjbHYG
 XpUetlXFnv8RYuJJO/V/9WItzFsQie/IHEvasoX4wDVr0e6w6pPse1XJM
 5jq7IVOsf2Rd8axhN863EvtRcY7C+po5OUG4KS0aGEPSy2CZk7v2FRnHk
 1bXHbb+9prbHLbgFt7HQ94FPaeDXHZKEUmbOffVSeq2nWza/hXLDBGo4M
 4RD/JUB7iM73ZDBE+MZr3wXyfcCZuy9jClH1DsC7WwwJCgVqQRYo8lyh5
 SHuDJP07KBRe+qzX2c9qETKJn+2A+WgsSdiSGG6RaHZT5sFzRZq/nKcKl g==;
X-CSE-ConnectionGUID: maeRPfmjTEun9m3u7sAazQ==
X-CSE-MsgGUID: 9nTqK/nLSz+YDHwIZ2iddw==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37950135"
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; d="scan'208";a="37950135"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 15:33:25 -0800
X-CSE-ConnectionGUID: zCnUbNaASTOgeAGn6MQe8A==
X-CSE-MsgGUID: 0OCMrOJ/TTKVOfE1Soj6Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; d="scan'208";a="112315796"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa004.jf.intel.com with ESMTP; 22 Jan 2025 15:33:05 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v2 0/3] Re-instate GuC logs in debugfs & devcoredump
Date: Wed, 22 Jan 2025 15:33:01 -0800
Message-ID: <20250122233305.3667730-1-John.C.Harrison@Intel.com>
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

Remove the appareance of line wrapping in the GuC log output to
prevent confusing a mesa tool and re-instate GuC logs in both
devcoredump and debugfs.

v2: Fix string size.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (3):
  drm/xe/guc: Explicitly name each chunk of GuC log data in a dump
  drm/xe/devcoredump: Temporarily disable the line wrapping of ASCII85
    output
  Partially revert "drm/xe: Revert some changes that break a mesa debug
    tool"

 drivers/gpu/drm/xe/xe_devcoredump.c | 12 ++----------
 drivers/gpu/drm/xe/xe_guc_log.c     |  4 +++-
 2 files changed, 5 insertions(+), 11 deletions(-)

-- 
2.47.0

