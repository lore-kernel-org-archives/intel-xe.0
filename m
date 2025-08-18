Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F647CA0EE4
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 03:36:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D331310E18C;
	Mon, 18 Aug 2025 03:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Og5Y4d5L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 588BD10E18C
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 03:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755488212; x=1787024212;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2tqQm3OfNQy1I+NoKFPq94YJZKp1LtS6wNdG5P+iw+Q=;
 b=Og5Y4d5L+1A7Cdx2tz4r+9p/MrCMffGR2BKMmFWOa4uWFDCmkR8ryo11
 M7p8pJiG7AixE7XvwBYYPHdtjaPEsKIYFB3lOt8KdIkODzUpuPvyTEwOI
 BDkyVShCWcPpqZc87LZX/HVx16dKq4aKHalOUnh6sTEy1vHaep/an1sXz
 F1UJLSfGsQUNnpH+Q5dlWR8BiL7oKDWr0ei5E+GM7xgy5I1gNNPKMF55x
 63nx0Uxw1Pbym5ER7Lt6x1zzVsKhIQGZ6xniHzoOE9ObOSXOnVMcg6+S4
 1cw03WYQAjjkQYT+zmpaSInUMV8td8vDf559Ppa9T13yK0lxvzgjBpE6D A==;
X-CSE-ConnectionGUID: 1Zi4bfZ0TFG5VATqOE3xLg==
X-CSE-MsgGUID: 9GpZ3X1+R6aK3owbdr6ttw==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="75157083"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="75157083"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2025 20:36:51 -0700
X-CSE-ConnectionGUID: 6giSm/RkRw+A7SZasDbHhw==
X-CSE-MsgGUID: j845AHVuSaOl9G5bJ4ucBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="167442910"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2025 20:36:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com,
	tomasz.lis@intel.com
Subject: [PATCH v3 0/1] Document GuC submission backend
Date: Sun, 17 Aug 2025 20:36:45 -0700
Message-Id: <20250818033646.2622613-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Long overdue: this documents the GuC submission backend’s design and
implementation, including the presumed VF resume flow.

v3:
 - Sorry for churn but the more I think about this, the more I needed to
   document

Matt

Matthew Brost (1):
  drm/xe/guc: Document GuC submission backend

 Documentation/gpu/xe/index.rst         |   1 +
 Documentation/gpu/xe/xe_guc_submit.rst |   8 +
 drivers/gpu/drm/xe/xe_guc_submit.c     | 300 +++++++++++++++++++++++++
 3 files changed, 309 insertions(+)
 create mode 100644 Documentation/gpu/xe/xe_guc_submit.rst

-- 
2.34.1

