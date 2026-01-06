Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3EEDCEFD0C
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jan 2026 21:28:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F04810E1A1;
	Tue,  6 Jan 2026 21:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FD+Da9Qv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE7D910E16F
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jan 2026 21:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767734931; x=1799270931;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PDkGi1hxetdi+N/MTT/uLIe5Mmw8HdS20JNOti6sJ3k=;
 b=FD+Da9Qv40oA/LcAz4+nBht0xmkhl4nL2YyXjvAb4CvRooaOZykT58eq
 VSbNYYA7zsjTDav+HDavWuZ6gRn8KJoySwrQqMYkt6nruNuDSOYcNVoZ7
 ghryxf3XQA60hL+hh7ndvVCF3UQrhJZeUoOkReKv6plyO+rdbAMVXv27J
 mVyH7bB8/Y2H7yD03d1Bmr5ZRTZHheMjEyXnciniER3VZm7W8oq6cGgJH
 Ge3yQW9op+/11x+gkKl/G/0PG675YTuv8eCpz7YlPEZ37yT1UyWJuq5q3
 olZzaVYdIz49BxthYV2gpVkJupxpBTJ+y1SaDKkbJnYJY41D741uDyjBV A==;
X-CSE-ConnectionGUID: AJnIdwBjQE6ZMMwVaLzhcg==
X-CSE-MsgGUID: 4Y/zNytGQFelfa1CGvW4Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="72737008"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="72737008"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 13:28:51 -0800
X-CSE-ConnectionGUID: mmdJlNMVRwCQffugyH0A4Q==
X-CSE-MsgGUID: NhHGC4RISxWbIDFMOPZEYA==
X-ExtLoop1: 1
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 13:28:51 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH topic/xe-for-CI 0/4] drm/xe/guc: Bump GUC version for NVL-S,
 CRI
Date: Tue,  6 Jan 2026 13:27:03 -0800
Message-ID: <20260106212758.1172984-6-julia.filipchuk@intel.com>
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

