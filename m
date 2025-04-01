Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C658C3601A
	for <intel-xe@archiver.kernel.org>; Tue,  1 Apr 2025 20:42:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E0D110E66D;
	Tue,  1 Apr 2025 20:42:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lbyJmAJ5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 630D410E16B
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Apr 2025 20:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743540160; x=1775076160;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3CxwTx0kqAxUtGaFxecCzVWixwaDNe7zqkzMHHuFkhQ=;
 b=lbyJmAJ56rfS8/vsh1dGQcggr1JJbu73koM9r6w6NtOKm3LQHMV+ro+R
 0S4D/rzmNnLAu5Q8h7l4q5YC3yJy65ntMhHNu3MahR0G3wwkPk8YJqiMx
 ar3qqQoOADYExQ8kymHZ6X/g/DrPJX7qN9sd5rp98mYY9Rzo64GhMqn4H
 CmNFfrr0aBACXmLjN6QJKEQlpPN/J2+b6Toh5CN7m5HHBPrapCP1jBl7U
 YU2hYuPzbnk4iLPrdc66TYgfMrM0KtlnhpR+Rc+vU20UKAZ746FynNvXU
 T7maSmjh/MWLmvZ9xEcnpYxs48vVjyqpwKKonCsO0ugU3StfWhqqMJTGp Q==;
X-CSE-ConnectionGUID: evZG6Yh5RJGRyOv1sbysXA==
X-CSE-MsgGUID: m/Xc7uOWSH6Dkf9WTTavHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44892553"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; d="scan'208";a="44892553"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 13:42:39 -0700
X-CSE-ConnectionGUID: HvHbG2/FQwS/gCfJfAs7Pw==
X-CSE-MsgGUID: bfWNMnIlTnWJfG73qmqCNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; d="scan'208";a="126742347"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 13:42:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/2] Large devcoredump file support 
Date: Tue,  1 Apr 2025 13:43:49 -0700
Message-Id: <20250401204351.4130873-1-matthew.brost@intel.com>
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

Devcoredump were truncated at 2G, remove this restriction. While here,
add support for GPU copies of BOs to increase devcoredump speed.
 
Matthew Brost (2):
  drm/xe: Add devcoredump chunking
  drm/xe: Update xe_ttm_access_memory to use GPU for non-visible access

 drivers/gpu/drm/xe/xe_bo.c                |  15 +-
 drivers/gpu/drm/xe/xe_devcoredump.c       |  59 ++++--
 drivers/gpu/drm/xe/xe_devcoredump_types.h |   2 +
 drivers/gpu/drm/xe/xe_guc_hwconfig.c      |   2 +-
 drivers/gpu/drm/xe/xe_migrate.c           | 219 ++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_migrate.h           |   4 +
 6 files changed, 271 insertions(+), 30 deletions(-)

-- 
2.34.1

