Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 361C3FB518A
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 03:02:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB2D10E337;
	Tue,  7 Apr 2026 03:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KRU733I7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A5E10E335
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 03:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775530948; x=1807066948;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=y0wqeurIkjOhYhnERDoKjbwQb83XhW6nbXjoAVnofjM=;
 b=KRU733I7r/mL41pq2bK5kp6nSAjfbac3iMJTjZsjIrluI+yrnHfo6cSk
 YfKk/fLHarqQWMGo19IKE3u344o7P++Xcw8UNpht2BiWRg6lW/rbv9IH0
 37OF/zQwFHU+m4d4rDsgo4YWVGccz/cEFQ0QLpsvQhd0eUp+rwTiL9bo6
 VmLjKeWiCof7H4vpfzgDU/VCyLufuRZIFe+5YK0v/fw6oC8FXbz6MnSGq
 gFpkJt469OUrQAiQzclu6d1z6U4OZ4kZ47QLcVWoLrQ+/BsonXGQWWd1j
 GQtIwHJhc/d87vv59issB8ZlR9TOoI0w5BCL1u4yVjvZmSrk0gpoKURkC g==;
X-CSE-ConnectionGUID: l/E/D5RcSZ2mWQ3JcLx4Eg==
X-CSE-MsgGUID: 9+o2sy1zS+SEeIq6l598xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="80377326"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="80377326"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 20:02:27 -0700
X-CSE-ConnectionGUID: Hn+OrbJ3Tq64wTgiOroCcg==
X-CSE-MsgGUID: a8k1/l7QS4ydTypiukHpbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="232084948"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 20:02:25 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 0/3] drm/xe/oa: Wa_14026633728
Date: Mon,  6 Apr 2026 20:02:16 -0700
Message-ID: <20260407030219.444060-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
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

Ashutosh Dixit (3):
  drm/xe/oa: Use xe_map layer
  drm/xe/oa: Use drm_gem_mmap_obj for OA buffer mmap
  drm/xe/oa: Implement Wa_14026633728

 drivers/gpu/drm/xe/xe_oa.c         | 117 +++++++++++++++--------------
 drivers/gpu/drm/xe/xe_oa_types.h   |   3 -
 drivers/gpu/drm/xe/xe_wa_oob.rules |   1 +
 3 files changed, 62 insertions(+), 59 deletions(-)

-- 
2.48.1

