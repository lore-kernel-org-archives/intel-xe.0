Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D7ACDD556
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 20:48:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF77210E0A0;
	Wed, 18 Sep 2024 20:48:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dYFgUMhF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 176C310E0A0
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Sep 2024 20:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726692523; x=1758228523;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Mtk5Sh9u7Jf+U6dHcNEQQqP+DAL3KUEwcTbVZJ/uxHo=;
 b=dYFgUMhF9cAh2/L30W/ZlvQKuuGUJ4Wb+5fD4ZGwOabKk+ms1CmHpKsf
 hSNZIXHr7liRGFrJP6av5fNoyY3Aphe9Q18tpRT3oOH3F9d7iywkW6IzJ
 B9KMwxXA2DGDGUSPvwNs3EUsIM1nHyab80C0JLoRCY8eroiBAx2/djm1a
 F53mFvyRXY6Ja9j6wmzJZfcza1+zSKy/y993H97xuzSJM7tP+S+qayUHL
 FL4kIS+ShLMJf4KtHFOSP9Yik66zojDnXtsA3lZLgVDa0z84HSN+EHXQ4
 VkMSntEP3gEoE2FcNcUm0Z4tFUwtaooGg828J3SdJB11lQA0prDDl2SGv g==;
X-CSE-ConnectionGUID: vfE3U+UMRZS3ka53b9QDVA==
X-CSE-MsgGUID: 0zQjZpfORHuNjcYJa4PWmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25509477"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="25509477"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 13:48:43 -0700
X-CSE-ConnectionGUID: 6KrpBO0XS4iRuunRp5d9Lw==
X-CSE-MsgGUID: gNc67dTQThq88Kiy7GZYew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="74246600"
Received: from rfrazer-mobl3.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.125.109.171])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 13:48:42 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 0/3] Xe2 performance tuning updates
Date: Wed, 18 Sep 2024 17:47:28 -0300
Message-ID: <20240918204830.49880-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.46.1
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

This series contains updates for Xe2 recommended performance tuning
settings. It brings over a v2 of [1] as patch #1 and adds other relevant
updates with patches #2 and #3.

[1] https://patchwork.freedesktop.org/series/138776/

Gustavo Sousa (3):
  drm/xe/xe2: Extend performance tuning to media GT
  drm/xe/xe2: Assume tuning settings also apply for future media GT
  drm/xe/xe2: Add performance tuning for L3 cache flushing

 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 12 ++++++++++
 drivers/gpu/drm/xe/xe_tuning.c       | 34 +++++++++++++++++++++++++++-
 2 files changed, 45 insertions(+), 1 deletion(-)

-- 
2.46.1

