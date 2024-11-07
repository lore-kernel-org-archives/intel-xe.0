Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C551D4337C
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 16:35:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB6510E194;
	Thu,  7 Nov 2024 16:35:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uyc5LkOp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F1010E194
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Nov 2024 16:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730997305; x=1762533305;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WVukMqPCZ/St6naa+qTnbTU9PWTOYMZHCqJ2q93NY7M=;
 b=Uyc5LkOp8uOmu7K26M+vx1nR9F4yORbA8/EvLiTeYJaBJ/UCfcalIRua
 JY6xq1OYzT1RoYZMMSCZanRVIIoVXINyE984kSbYoZYsgDUqw6AXywEQI
 K3hhRb1cFXDFuZRfP36Wzdszzz5J2pK7vj4LRiDt8gPbB4CVBu8wfJUVX
 o5Pa8rXyRhpwRA1WjG0/VECZrPrZmg544x/UPy8frlEqpUlxzwzVqzjZN
 qj33NtFB20lIUZUajyYNWX9/rBlFzbBrN0J0qQTR5PQvb107BcqHMgmGn
 Og1TKkReZlLvq+bohec9U9Ik90uqt5wPFO8OtCflfcqGEUDuGg10q7p2Z w==;
X-CSE-ConnectionGUID: q0dqg2wqTSutZqJOWj2h7A==
X-CSE-MsgGUID: fsdj8o/ES1Odu0ORiE92jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="18480121"
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; d="scan'208";a="18480121"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 08:35:04 -0800
X-CSE-ConnectionGUID: QU95xq5dTMSGTBZYHU49LA==
X-CSE-MsgGUID: T6lFau12S/2gThGVU1+C9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; d="scan'208";a="89796988"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.2.138])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 08:35:03 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: [PATCH 0/4] Add iomem helpers for use from debugfs
Date: Thu,  7 Nov 2024 17:34:44 +0100
Message-Id: <20241107163448.2123-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

This series attempts to promote helpers used by Xe [1] to libfs.
Earlier attempt [2] with similar helper was unnoticed.

[1] https://patchwork.freedesktop.org/series/140848/#rev1
[2] https://patchwork.freedesktop.org/series/133507/#rev1

Cc: linux-kernel@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org

Michal Wajdeczko (4):
  iov_iter: Provide copy_iomem_to|from_iter()
  libfs: Provide simple_read_from|write_to_iomem()
  drm/xe: Add read/write debugfs helpers for GGTT node
  drm/xe/pf: Expose access to the VF GGTT PTEs over debugfs

 drivers/gpu/drm/xe/xe_ggtt.c                | 52 ++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.h                |  7 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 62 ++++++++++++++++
 fs/libfs.c                                  | 78 +++++++++++++++++++++
 include/linux/fs.h                          |  5 ++
 include/linux/uio.h                         |  4 ++
 lib/iov_iter.c                              | 42 +++++++++++
 7 files changed, 250 insertions(+)

-- 
2.43.0

