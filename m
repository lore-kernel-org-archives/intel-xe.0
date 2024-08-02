Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C0BC3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  2 Aug 2024 02:01:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D1D910E95A;
	Fri,  2 Aug 2024 02:01:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dmBLp2wI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D968310E8DA
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Aug 2024 02:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722564068; x=1754100068;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=w8fGiXtEL6b5EVjOr1mrogeW3X1PNRP/BUx6C4mAX58=;
 b=dmBLp2wII5Qzu40t1kXrfHajhbHUep6gqLDRm1O79uTrH0SXj9dXAxCN
 nhylzJ4Mp9pMp2OBo2BqodHYqbVkZW08c+rj+fAsjJmQ4QKCBNOjC87gY
 UvfM5+/PiUeljRBfL2skWGNlYHxtBUNIHcOlFGbzdkz0W73LttWZwWQvy
 76iCu8wttdKIQbmblzOksY0sOqhcnotTd4Xztq5GISncWaXxe8Y1R0dYT
 bngZgHnLW1oBnaLaJQ2rFNaTalpTs/XK4IovHX+cQCsynebS5jdeiazZx
 GCKl9F3lBNGbH+fi0P+Vh7IOGiz9u3hBsx8NMuXDy1sOe6YZxw8KcW3sY Q==;
X-CSE-ConnectionGUID: i5/G1G00TrKT0ipg0FrGEg==
X-CSE-MsgGUID: bWZGkv2IR5eNuatkuQLkMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="24353852"
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; d="scan'208";a="24353852"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 19:01:06 -0700
X-CSE-ConnectionGUID: Hc5Hhg+YQ1urYAmoJW1Tyg==
X-CSE-MsgGUID: uZAzFamvQhGEuC+JXdDOmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; d="scan'208";a="60083556"
Received: from saurabhg-nuc10i5fnh.jf.intel.com ([10.165.21.155])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 19:01:05 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, tejas.upadhyay@intel.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH v3 0/1] drm/xe/xe2: Introduce performance changes
Date: Fri,  2 Aug 2024 07:12:02 -0700
Message-Id: <cover.1722607628.git.akshata.jahagirdar@intel.com>
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

Add Compression Performance Improvement Changes in Xe2

v2: Rebase

v3: Rebase, updated as per latest changes on bspec,
    Removed unnecessary default actions (Matt)
    formatting nits (Tejas)

v4: Formatting nits, removed default set action for bit 14 (Matt)


Akshata Jahagirdar (1):
  drm/xe/xe2: Introduce performance changes

 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 +++
 drivers/gpu/drm/xe/xe_tuning.c       | 5 +++++
 2 files changed, 8 insertions(+)

-- 
2.34.1

