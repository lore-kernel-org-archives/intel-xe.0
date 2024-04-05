Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A402FCD1297
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 21:16:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4198510EA70;
	Fri,  5 Apr 2024 21:16:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nUxygJNv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8300A10EA72
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 21:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712351769; x=1743887769;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/zJrS9d/gJ1WL44ym3Uy0LkFIeQVgidyzFCEJBqu4Co=;
 b=nUxygJNvUKMYU9jLc7lvgkKwcu8eKBXS14ezF18TaY0wQRgOXbaMCfls
 h5Mk6ziI0O77eCUDsV36AWOEqVKD8FaezW483XBKVuNgH/T8FxeRMzeFw
 Y4gNIBennJDc+2rNN+VEFhDc88WeLWY1Zy3J69gNkkWXmY/eSmsBByqAA
 2+5+X8OxI7nmXMty8M/ZRWhuW8GHMJETKTydYh9dLswTeFh2Z29O67s3X
 xl6kZ22aL1HcCFnPGTqoAIFpSXaZLJ+9zekvliVvFpCG4my9N1sbYl1Nn
 U0f2LYNWJ/z7Af2ZIUslF5Du0NkjxqDat8n9zAaAP7RYS9y3L+LxhZ1Zv w==;
X-CSE-ConnectionGUID: cRzdXb4kQ6Gqa+0YVd5vGQ==
X-CSE-MsgGUID: /MFuNPXaQ5yn9g4r0n1Ilw==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="19132695"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; d="scan'208";a="19132695"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 14:16:08 -0700
X-CSE-ConnectionGUID: akEnWAKvRcmxb0kdIsyuPA==
X-CSE-MsgGUID: bWOXPo8WTy+zOKHbLJAEMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; d="scan'208";a="50249173"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 14:16:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 0/2] Snapshot updates
Date: Fri,  5 Apr 2024 14:16:30 -0700
Message-Id: <20240405211632.223568-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Found a few issues when working on [1] related to snapshots. Simple,
orthogonal fixes. Let's get these in ahead of [1].

[1] https://patchwork.freedesktop.org/series/132099/

Matthew Brost (2):
  drm/xe: Always capture exec queues on snapshot
  drm/xe: Capture GuC CT snapshot when stopped

 drivers/gpu/drm/xe/xe_devcoredump.c |  2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c      |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c  | 25 +++----------------------
 drivers/gpu/drm/xe/xe_guc_submit.h  |  4 ++--
 4 files changed, 7 insertions(+), 26 deletions(-)

-- 
2.34.1

