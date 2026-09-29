Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60123CA5FB3
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 18:10:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F11E210EFE9;
	Tue, 29 Sep 2026 18:10:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WwYsILL1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E3E410E423
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 18:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790705430; x=1822241430;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Qusj0pzt9UreVkqx5Rm0p26tr96Pkjq6IcvSWB2TB2A=;
 b=WwYsILL1WC3VyB2LA6JCNFss6zKQj0pdV0CpMq1mKTYv0hd6HT1GGCQF
 QejLDDFrw6Ods3Lx14Mo94cYEvsY+fCFOSqggpSj7yw/Cov3SPS3vqq0A
 9euWmfZZQG8vyBVD7snqz6Stu6LzSFlDck7rLzRVbHl3/uPmIrjj6Zwy8
 s6VDp7ii8j4JrK/GAI2akv0F9toBCEBj+/cwB8M3nzAiZzIUSyCWZ0zIQ
 EB64VSBHds3zsyn8ue6/DMzy93NKyuvdGZXj3a0HohJiYZf/xkfjr/ocT
 pJQZPm5MdHy2k9JQpgFT9Dq/MbVz7cBozHjDrzxoBG+dp543Z8RJUNCxh Q==;
X-CSE-ConnectionGUID: LuLMQA2UQVe9zmJPoCX4Jw==
X-CSE-MsgGUID: tGJxKxMeS1m9njHbJlWANA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="95247043"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="95247043"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 11:10:30 -0700
X-CSE-ConnectionGUID: SFBq3hJwSBGdu+HTB2Pg1Q==
X-CSE-MsgGUID: XMt1ymUXRumwyX0LgWYQSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="304949132"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 11:10:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/3] Elide clear on full SVM copies 
Date: Tue, 29 Sep 2026 11:10:21 -0700
Message-Id: <20260929181024.2743854-1-matthew.brost@intel.com>
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

Clearing a BO whose contents will be fully overwritten immediately afterward
provides little benefit and reduces page-fault and prefetch bandwidth.
Elide the initial clear for SVM-allocated BOs, and only perform a clear in
the copy_to_device vfunc when the CPU pages are not fully populated.

Matt

Matthew Brost (3):
  drm/xe: Add XE_BO_FLAG_SKIP_CLEAR
  drm/xe: Add xe_migrate_clear_vram
  drm/xe: Do not clear SVM device memory allocations up front

 drivers/gpu/drm/xe/xe_bo.c      |   3 +
 drivers/gpu/drm/xe/xe_bo.h      |   1 +
 drivers/gpu/drm/xe/xe_migrate.c |  89 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_migrate.h |   5 ++
 drivers/gpu/drm/xe/xe_svm.c     | 150 ++++++++++++++++++++++++++++++--
 5 files changed, 241 insertions(+), 7 deletions(-)

-- 
2.34.1

