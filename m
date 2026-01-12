Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B72E1CF45C0
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 18:08:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73BBC10E111;
	Mon, 12 Jan 2026 18:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YPwv7IxI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7596A10E111
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 18:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768241300; x=1799777300;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vDo6tEHrc/LtH/mZY0yRTHrmzmr5sJ38CBZdssQiG+c=;
 b=YPwv7IxI+SeUkkFGEVJeNIwUh0dDBY/ZjfE2niBuIWdHjT8aGoDtWFyK
 gIGl47wMTOidJhgv/V+NeOU9YEoB4ZqEhwzHwc/EYZerPX09E3qplm4Qy
 kQV35dYNFFOYmRPl4V9+K7nIcnY/bGmOu+Ov8hJ4HBt1YXrM0uZjgAQ+t
 e/I7rfLZDvx1OL2Ns+TW13wIk6s+NacnwERd9LuFFy+eSuhUxa2aoUI1z
 L+rMVDIDDCzOkFurA0xu7FDYccG/KB9RCyIb/CAZK23dZcMAIPgoWNZ0Z
 nq1RSkLf5vHja6klqxn//eFjoyhpfyluwC2Te4W6RGk75Bkar9j5D8Drw Q==;
X-CSE-ConnectionGUID: oUUfQYJcQM64uYDHGmsyKQ==
X-CSE-MsgGUID: 6RkIC2AnS7+xDoCMdXjEHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80162716"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="80162716"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 10:08:20 -0800
X-CSE-ConnectionGUID: yRKLCdebQcqLg8rrcDuQQw==
X-CSE-MsgGUID: g3rFZLnQSI+Lvc5Ryknuyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="204561507"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 10:08:20 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 0/7] drm/xe/guc: Recommend GuC v70.55.3 for BMG, PTL
Date: Mon, 12 Jan 2026 10:07:35 -0800
Message-ID: <20260112180809.1474677-9-julia.filipchuk@intel.com>
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

Recommend GuC 70.55.3 for BMG, PTL. UAPI version 1.28.3.

Platforms PVC, NVL-S, CRI are not merged to upstream at present. The GuC
definitions for those only exist in the for-ci topic branches
drm-xe:topic/xe-for-ci and drm-intel:topic/core-for-ci. This patch set
reverts those patches, updates the recommended GuC versions for fully
upstream platforms, then re-adds the CI only platforms definitions.

Balasubramani Vivekanandan (1):
  topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI

Daniele INTEL (1):
  drm/xe/pvc: Add GuC firmware definition

Julia INTEL (4):
  Revert "topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI"
  Revert "drm/xe/nvls: Define GuC firmware for NVL-S"
  Revert "drm/xe/pvc: Add GuC firmware definition"
  drm/xe/guc: Recommend GuC v70.55.3 for BMG,PTL

Matt Roper (1):
  drm/xe/nvls: Define GuC firmware for NVL-S

 drivers/gpu/drm/xe/xe_uc_fw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.51.0

