Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B154D1D486
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 18:21:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 303AD10E377;
	Thu,  8 Jan 2026 18:21:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jTBFKR1q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE05C10E377
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 18:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767896488; x=1799432488;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gr3FJ+5mFGf87H5lb9FQb1xLdSOX0doUpULLfNHakhg=;
 b=jTBFKR1qPv4sn9oYENtuD7N8mTTnehifsX+rXiW5E8vyN93ODtS1jqIL
 Vcp5ijSivdOVTBFg6yqJiNybyb2yHRyRJqzGc+BBeAhTfcIqaUSIkaqyu
 PoZd+LErfpLsQ5YkNzksDdIlvNQLZVdhUSURb+2nOusZS/6Oc3At4h/ri
 xCUhDpyYD/WWpOA/jLphtWhYZzQCdX9PklbjaBZaz9ymosN7bxi6nJQKK
 QxWzFGmtJj/d2akAp8qnZNXkIgGvomC7hM1tUdV7kXH+gkDZqb+T3cir+
 t4Zh/G1twfducsSZkVcl8G0nBhzg92s6H2llbar5XTKsBVLiq8A1/DJ2R A==;
X-CSE-ConnectionGUID: cJQmQuJbQEyO62WXpgU+Rg==
X-CSE-MsgGUID: dIWnzgmTTqG4BRyWi+ocqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69355181"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="69355181"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 10:21:27 -0800
X-CSE-ConnectionGUID: t6HST/6iQrOQz7a5qkravw==
X-CSE-MsgGUID: 5P9WHzWTQG+RYKq6Ln23eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="202394534"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 10:21:27 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 0/4] drm/xe/guc: Bump GUC version for NVL-S, CRI
Date: Thu,  8 Jan 2026 10:19:42 -0800
Message-ID: <20260108181956.1254908-6-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
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

On drm/xe:topic/xe-for-ci branch use GUC version v70.55.4 for platforms
NVL-S, CRI. UAPI version 1.28.4.

Patch set reverts original patches and reapplies commits with updated
version.

v2: Sign patches.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>

Balasubramani Vivekanandan (1):
  topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI

Julia INTEL (2):
  Revert "topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI"
  Revert "drm/xe/nvls: Define GuC firmware for NVL-S"

Matt Roper (1):
  drm/xe/nvls: Define GuC firmware for NVL-S

 drivers/gpu/drm/xe/xe_uc_fw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.51.0

