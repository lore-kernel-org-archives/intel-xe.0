Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC6EC44500
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 21:41:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D5FE10EAE3;
	Mon,  6 Jul 2026 21:41:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WDA3QQjq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 413AD10E908
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jul 2026 21:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783374086; x=1814910086;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OSq/2CZNPRcJHS29y9niplHdWXlYJPoqxC4WREHUC+g=;
 b=WDA3QQjqqxSKJDVZ/MFiUQpQVdWoGDGO9aHNT6VJWeKLBfPlIg+v1U2h
 1lSldb0ScLcfZwowulwW0xgOAEqHHlYsueQsehg0r2z8HQq+z/Y8/P2ZI
 pJ+wejMO3A/Q6/LRdBKwIpxdnd4qHelJeyEYSE5w5zHLf16J1DCyzYHr5
 AGYNfc95j71ZKUeT5Jqzm+tjFHce/Jm+sE8p/gdBxMViNXvo8k7fLkYE1
 jQs1DAuJNi1osHgHBwBR/yHU4iTOqgnc12McoMcQS6QnBqX6tg0m4G1Lm
 12jWcWobqFNY0Ow9vbWCqcBUEqluhbmmfvN+EexNPcgyauZxgaxVd9HIj w==;
X-CSE-ConnectionGUID: 5+xm3T+TRQ6fh6D9P/DoqA==
X-CSE-MsgGUID: qMnyUsU3T4GCXuZ+CgGC3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="83996120"
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; d="scan'208";a="83996120"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 14:41:26 -0700
X-CSE-ConnectionGUID: nFwxb/rZSSO2dH9vQTDxgQ==
X-CSE-MsgGUID: m6lvfOruR2+/mIG+wVs4UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; d="scan'208";a="258140372"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.16])
 by orviesa005.jf.intel.com with ESMTP; 06 Jul 2026 14:41:26 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 0/2] drm/xe: Use IBC v3 on PTL
Date: Mon,  6 Jul 2026 14:36:34 -0700
Message-Id: <20260706213636.2743937-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

Also add a sysfs entry to monitor the bias values.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Vinay Belgaumkar (2):
  drm/xe: Use IBC v3 on PTL
  drm/xe: Add sysfs for GT/IA bias

 drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h |  1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |  2 +
 drivers/gpu/drm/xe/xe_gt_freq.c               | 71 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_pc.c                |  9 +++
 4 files changed, 83 insertions(+)

-- 
2.38.1

