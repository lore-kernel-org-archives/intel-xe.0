Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7824FF8870
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 19:02:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A30B10E8F8;
	Mon, 27 Apr 2026 19:02:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SK7ItYpf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F089D10E8F3
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 19:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777316548; x=1808852548;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qwMLskef1RQCGb4hvcIJ2QY0Jrsugtk5oVO49UxBIKQ=;
 b=SK7ItYpf817179W9lFmjaIVfRKCHQtMqqODWkColvPCLb2YWDtx9w23w
 Q56ltly4UCtLO2RasoenDQrneRz5WHEdBm1CJcX1fJqp8ZXzZ19jISXMY
 3YEb+NpiYubnBcABJaMrQKr1zX62U6aHOK9b+lhC49luYT6VyvgTiVCWo
 bxNmkKlgP54Wxbh1e4JzHwMLFHwyTa+WtXW0UCFpzS+C3s5jRclp4YtZG
 Y+E/cdPCJ6H4mIlO9y/rvNBrf0lzJFWxQDPtl/v5c5vBQVtYE82QI2NqT
 h5b2/cvRREB5sNb50QgWyKsKr5vfOtr3DC3RnH6Gx8FXYlf01XGtv6V0R Q==;
X-CSE-ConnectionGUID: huLo6qdSSBK9uYBbOnjXWQ==
X-CSE-MsgGUID: gOjaGVOdS0KSDlWDhiHGRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78108215"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="78108215"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 12:02:28 -0700
X-CSE-ConnectionGUID: FNKO8SMrR++hz3YvFzhv/Q==
X-CSE-MsgGUID: 7YaLOQKkSbmdnnM4JvrOlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="232723302"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 12:02:28 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH v6 0/3] drm/xe/oa: Wa_14026633728
Date: Mon, 27 Apr 2026 12:02:20 -0700
Message-ID: <20260427190223.2487665-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
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

v6 though v2: Change to Patch 1 (see changelog in Patch 1)

Ashutosh Dixit (3):
  drm/xe/oa: Use xe_map layer
  drm/xe/oa: Use drm_gem_mmap_obj for OA buffer mmap
  drm/xe/oa: Implement Wa_14026633728

 drivers/gpu/drm/xe/xe_oa.c         | 123 ++++++++++++++++-------------
 drivers/gpu/drm/xe/xe_oa_types.h   |   4 +-
 drivers/gpu/drm/xe/xe_wa_oob.rules |   1 +
 3 files changed, 70 insertions(+), 58 deletions(-)

-- 
2.54.0

