Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99192C87FD1
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 22:07:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE11810E6E4;
	Tue,  5 Aug 2025 22:06:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bhIMVIMX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6216410E3A2
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 22:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754431619; x=1785967619;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RRa2CY/wYHZEPYJmH9u0ZfiRg3iB5aAi4ZELMupEG7k=;
 b=bhIMVIMXpldiQ0Ml+hI3N81yFQaTrvYf8IwzgyM0jjDami1DJ9ezEd7B
 ZKFyL6V7VKDZ4VMkmXAly0XBan4sLpY6Jvm5RiqQ8UX+dLxOCjIUUhXBG
 Xu2T0Z6o2Mrhv7owbkROdIeiJA+t9IjthkuzuN8RAiJY/h9Now5jCU6pE
 XM6aGbbvF+XuGINEF3gZ1VcP21ZzteJWX+aVxHJSlNWkpGus9LebElj5t
 xUROr8VxTozsgNqWrnlUUMHyMKt9ypQ+tvEHL0Tu1640IuHQHfg7QDsL+
 BHwXe6Q8G3gwBxhZVOA5EuSJnwMvmzEckXE5lhbY0Vt0A62zBCiPgjBnp g==;
X-CSE-ConnectionGUID: yNuW+wHyQUGzv9bs3w4fEQ==
X-CSE-MsgGUID: 0TVjjGrpT0S8tpDsfSX+wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="56885226"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="56885226"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 15:06:58 -0700
X-CSE-ConnectionGUID: BMHbMltlSnC36bFafXajPw==
X-CSE-MsgGUID: B++0bIAmRDGZbqHVH+gkpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="164622549"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 15:06:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com,
	himal.prasad.ghimiray@intel.com
Subject: [PATCH v2 0/1] Disable compression on SVM 
Date: Tue,  5 Aug 2025 15:06:52 -0700
Message-Id: <20250805220653.745400-1-matthew.brost@intel.com>
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

We can likely make compression work with SVM, but that will require a
bit thought. Disable for now as this does not work.

Matt

Matthew Brost (1):
  drm/xe: Disable compression on SVM

 drivers/gpu/drm/xe/xe_pat.c | 10 ++++++++++
 drivers/gpu/drm/xe/xe_pat.h | 10 ++++++++++
 drivers/gpu/drm/xe/xe_vm.c  |  7 ++++++-
 3 files changed, 26 insertions(+), 1 deletion(-)

-- 
2.34.1

