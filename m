Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCBDD5CC97
	for <intel-xe@archiver.kernel.org>; Tue, 16 Dec 2025 09:42:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E39D910E474;
	Tue, 16 Dec 2025 09:42:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L6glIHVm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CAE610E893
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Dec 2025 09:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765878167; x=1797414167;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GNkmor0BvqRaW77mHr/UKxyH52weemzvyscSbeoW0II=;
 b=L6glIHVm0GHHA5vN1fUFyvmsBC7U00uHE7H54IeAAsb3fh6REqBbViWA
 TVEjE3eXP/7TOOLKUIZpsUrEApLTlNEUxb2XFzsRXfqZFqDzdWE9KTESq
 c2t1F23sj8Ktyhg1KlV2CC+TulMWp7z6xyU/Ydz6ctL/WsR8D1FCevg/d
 HwBdQv3ZX7HhDvDvLpm77ej+CsdDuPKxhZXmTyGjPGX2ik7PX5QAJPXRL
 1N98ZF2rYF9U9G3bvYB/g7ipC2v456UWygNxUZI0Dwg3sS5/ctJ+pv0yu
 6voHH3AH/7MxskCB+6riZ32kRyj70arOjR6O3fIaJag2nZxZkY23EBV37 A==;
X-CSE-ConnectionGUID: /PZtdEb8Qs6TDr9M9rvSWw==
X-CSE-MsgGUID: Kd2+1P23Q8SG4uNkvQeEKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67946625"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="67946625"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 01:42:46 -0800
X-CSE-ConnectionGUID: N6FtOXJQSWmICKo5Er4yCw==
X-CSE-MsgGUID: vJcAOPmGQUC8gGtICVLGSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="197868091"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 01:42:44 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 badal.nilawar@intel.com, raag.jadav@intel.com
Subject: [PATCH 0/2] Survivability mode fixes
Date: Tue, 16 Dec 2025 15:42:00 +0530
Message-ID: <20251216101159.332558-4-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
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

Fix unused index and static analysis tool reported errors.

Riana Tauro (2):
  drm/xe/xe_survivability: remove unused index
  drm/xe/xe_survivability: Fix static analysis issues

 drivers/gpu/drm/xe/xe_survivability_mode.c | 31 +++++++++++-----------
 1 file changed, 15 insertions(+), 16 deletions(-)

-- 
2.47.1

