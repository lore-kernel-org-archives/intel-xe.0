Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B410C7EE37
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jun 2023 18:49:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2939B10E0AE;
	Fri,  9 Jun 2023 18:49:25 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52ED110E0AE
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jun 2023 18:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686336563; x=1717872563;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UwvKhWNWgsm6GQJm+CESMHQw/Eoto6ynxJWpFx2QyPg=;
 b=SfDLtVjpMEjcocGzHVUftOs6rLwdvWs7XLugoUCUfRFMjX0MoE9FSZAx
 R6zVa5lehdzhmBYMXYCvAMKCeqqtfFAuwmg3QGY/2+w0h9uK8VeaoYu8b
 clLK1Iba+YJHWWTIQAxXpD9KONE1z3AABh/hta1FD82qXxOtDhf4B22pY
 tUK4T9wr5lSlMoA0nbA/9GWIbt0SbwzLVKDH4mezU5o9Gbn/j8wnpDNIW
 6SCLcnZTeZLIoTptosFP5AGJ45IJKNqNeVJjnG42Y2i0eksaiWZdJ9e/H
 R4w2V0wqf2Njn4v6eikGSoI1mRa3DAFDI4pXZ2aklAjbYdSbCszxnZybA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="360148661"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; d="scan'208";a="360148661"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 11:49:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="1040581377"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; d="scan'208";a="1040581377"
Received: from aravind-dev.iind.intel.com ([10.145.162.80])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 11:49:20 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Sat, 10 Jun 2023 00:22:48 +0530
Message-Id: <20230609185249.2032370-1-aravind.iddamsetty@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/1] Fix stolen memory size calculation
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The stolen memory is not being calculated properly, DSMBASE is
considered as stolen base which is wrong. The stolen base should be
either GSMBASE or FLAT_CCS_BASE_ADDR when flat ccs is enabled.

debugfs output showing wrong stolen size as 8MiB while it should be 16MiB:
# cat /sys/kernel/debug/dri/1/stolen_mm
  use_type: 1
  use_tt: 0
  size: 8388608
  usage: 0
default_page_size: 64KiB
visible_avail: 8MiB
visible_size: 8MiB
chunk_size: 64KiB, total: 8MiB, free: 8MiB
order-7 free: 8MiB, pages: 1
order-6 free: 0KiB, pages: 0
order-5 free: 0KiB, pages: 0
order-4 free: 0KiB, pages: 0
order-3 free: 0KiB, pages: 0
order-2 free: 0KiB, pages: 0
order-1 free: 0KiB, pages: 0
order-0 free: 0KiB, pages: 0
man size:8388608

output with this patch:
# cat /sys/kernel/debug/dri/1/stolen_mm
  use_type: 1
  use_tt: 0
  size: 16777216
  usage: 0
default_page_size: 64KiB
visible_avail: 16MiB
visible_size: 16MiB
chunk_size: 64KiB, total: 16MiB, free: 16MiB
order-8 free: 16MiB, pages: 1
order-7 free: 0KiB, pages: 0
order-6 free: 0KiB, pages: 0
order-5 free: 0KiB, pages: 0
order-4 free: 0KiB, pages: 0
order-3 free: 0KiB, pages: 0
order-2 free: 0KiB, pages: 0
order-1 free: 0KiB, pages: 0
order-0 free: 0KiB, pages: 0
man size:16777216

Cc: Matt Roper <matthew.d.roper@intel.com>

Aravind Iddamsetty (1):
  drm/xe: Fix stolen memory size calculation

 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

-- 
2.25.1

