Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369C6C3DA41
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jul 2024 23:17:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB5C10E92C;
	Wed, 10 Jul 2024 23:17:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WvT+REj6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8BB210E92C
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jul 2024 23:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720653443; x=1752189443;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZbRwXDTpowOp526BGcBGYM0n5s/oBfPRskFoSwouC9k=;
 b=WvT+REj6f32zuMtmlk7wHsAQFNmmnhayJZZ9ngzA6NqRcTKAJaICgL+3
 IPI8w+J7cn0An3uypirsiqxWnRckb8oW+KVeMnPdjo1ZrhMFjoNrhPD8e
 NUvk3f3WWeKh4wCzUur48iOrKs/FHM41FysCLLZmjn3u8yd0JlsBnC5a5
 6HaYJK86tVbGixUXEtfIj/jqJj/mA0aqRayIL30bT3S565Zioet04ggiK
 3Xd+XVnhxQ9GvyF8GDhKUqZXvIbazFi2Rrn0pv7QYHLje1hAomD5X7sAz
 sL4aP0Eq00Ht4iSIIYlh5UWRH/c3du6KtuhJP4NMyJFG0GSazexF+1/vK A==;
X-CSE-ConnectionGUID: 3COeHPEyQtKEGl2gowULew==
X-CSE-MsgGUID: qmmYlrSvSGKayE5A/R52ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="18120787"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="18120787"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 16:17:23 -0700
X-CSE-ConnectionGUID: PoZJr3aiR5OkZY6s+ggDdw==
X-CSE-MsgGUID: 84/Hw0jYTn+idyYXugPWqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="52672240"
Received: from saurabhg-nuc10i5fnh.jf.intel.com ([10.165.125.7])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 16:17:21 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, lucas.demarchi@gmail.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH 0/6] Implement compression support on BMG
Date: Thu, 11 Jul 2024 04:27:04 -0700
Message-ID: <cover.1720515376.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Message-ID: <20240711112704.bzKgJ3z-dcIvBsvaJplPOFmaksW2RMX-vL-4z2RRIUg@z>

According to the SAS for BMG compression, we need to decompress during eviction,
and not recompress on restore. Due to this, we need to introduce encoding pat_index
in case of vram too. This patch explores the solution of setting up an additional
identity map for the vram, this time at the end of previous mapping offset and
with compressed pat_index. 
We then select the appropriate mapping during eviction/restore/clear.

Akshata Jahagirdar (6):
  drm/xe/xe2: Introduce identity map for compressed pat for vram
  drm/xe/migrate: Handle clear ccs logic for xe2 dgfx
  drm/xe/migrate: Add kunit to test clear functionality
  drm/xe/xe_migrate: Handle migration logic for xe2+ dgfx
  drm/xe/migrate: Add kunit to test migration functionality for BMG
  drm/xe/xe2: Do not run xe_bo_test for xe2+ dgfx

 drivers/gpu/drm/xe/tests/xe_bo.c           |   6 +
 drivers/gpu/drm/xe/tests/xe_migrate.c      | 388 +++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_migrate_test.c |   1 +
 drivers/gpu/drm/xe/tests/xe_migrate_test.h |   1 +
 drivers/gpu/drm/xe/xe_device.h             |   5 +
 drivers/gpu/drm/xe/xe_migrate.c            |  66 +++-
 6 files changed, 449 insertions(+), 18 deletions(-)

-- 
2.34.1

