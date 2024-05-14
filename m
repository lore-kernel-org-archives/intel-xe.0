Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48579C04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 19:08:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ECFE10E53F;
	Tue, 14 May 2024 19:08:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WUKVQVck";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA68D10E4B0
 for <Intel-Xe@lists.freedesktop.org>; Tue, 14 May 2024 19:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715713701; x=1747249701;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=z41DKzm2ZyHo/XL8vgzok72MR6Zcpj8utqQlEWIFI3k=;
 b=WUKVQVckNLFwWBS8kwLiVskuM3mdkdGgnBXJDTQyTQjJmGEYhfcUbgVq
 4mjiVChv9XrSZsnjD0ppGd1/Uz4NJHldMFObdGeJp3Jc7bFc0r7pBfvPm
 rCiNxaPlKHBkXSMiqw6t9ex7rNvJlubsaq4baylFirs2SiIiDA4V2Jw0S
 ZHmsgRRM6RPHk36b9xnTfrrXZbS4dh0oT7wh03OXLDsEyUoRQmoTQAu0a
 BSzHaijlKchrYvW4E7XqrrAjwVVGdyNoHN0OklqjT1sByfyOfaaet9qE0
 CCW8nz1T9JxglT8HpoWlxGf5Z+yHjAy6uTPpPd4IljwuyfA0LM4Gqm+v3 A==;
X-CSE-ConnectionGUID: fbasoStmRtWYXfHhMUfCIA==
X-CSE-MsgGUID: 2Xp5pq1jTgq6tpRFLzKhZw==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11552837"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11552837"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 12:08:20 -0700
X-CSE-ConnectionGUID: q0o3SWcGSJGlap3IOZEzgA==
X-CSE-MsgGUID: WvSVefXwSG+8+3jtViOKkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="35270766"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa005.fm.intel.com with ESMTP; 14 May 2024 12:08:20 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v4 0/2] Imrpove GuC debug log/status output
Date: Tue, 14 May 2024 12:08:17 -0700
Message-ID: <20240514190819.1970533-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.2
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

Improve the robustness and decodeability of GuC log output, especially
when dumped via dmesg. Also remove a spurious line feed that messes up
the GuC status dump when sent to dmesg.

v2: Remove pm calls (Matthew Brost).
v3: Add more info and fix spurious line feed.
v4: Add kernel doc and macro clean up (Michal W).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (2):
  drm/xe/guc: Remove spurious line feed in debug print
  drm/xe/guc: Improve robustness of GuC log dumping to dmesg

 drivers/gpu/drm/xe/regs/xe_guc_regs.h |   1 +
 drivers/gpu/drm/xe/xe_guc_ct.c        |   2 +-
 drivers/gpu/drm/xe/xe_guc_log.c       | 101 ++++++++++++++++++++++----
 3 files changed, 88 insertions(+), 16 deletions(-)

-- 
2.43.2

