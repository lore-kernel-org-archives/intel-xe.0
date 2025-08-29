Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA8A2CA0FF9
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 18:00:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE3C10EC20;
	Fri, 29 Aug 2025 18:00:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SWH0kox6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5089F10EC20
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 18:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756490423; x=1788026423;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UXHpiTJkjXptMEH4YOB80bXOFz+9f79hYmGA8rSvIwE=;
 b=SWH0kox6GL0d3oIXewlL/vsLLD5LMRfQMgOkLQGUpb4HuxIhh0khn7ZS
 qrL57128MX9+2EW6dAEnNjPB8l/UYNSGIYPeYfLZ2RxGUTiQhz0bkaoeZ
 G6ETwlvkLRo2hLcmmrmcJM+xe5GkHpQLrYv70zNxaOCgWER2KFGPbNZe1
 jmzevbS6vLXxCZJUY3qM3I9n/DXX0DpzmgHVN6ckJN0Z3qkS343ta2hhP
 F9tEF5N/1YgiKr8/VEJVHJxkcEVvONJvjgBKQ4i8BJmBOdcnWxUAaVasE
 XS7bySF6ddpWyV3DxagQq6yJ9NkZ1feQvoK4BDaNgkZTnlDpG+ecKosQ/ A==;
X-CSE-ConnectionGUID: 1FKS2zi0TNKIpWqAZM1nsg==
X-CSE-MsgGUID: HKwycAy+TpGqZxyiqWtgOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58853091"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58853091"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 11:00:23 -0700
X-CSE-ConnectionGUID: nVkF/96kT4eeHsnODpUN9A==
X-CSE-MsgGUID: eNgrhJoDRD+4GgXPRdlR+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="175718607"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 11:00:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 0/2] Different sized pages support in migrate layer 
Date: Fri, 29 Aug 2025 11:00:16 -0700
Message-Id: <20250829180018.1333174-1-matthew.brost@intel.com>
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

Add support for CPU pages larger than the GPU, enable 2M pages migration.

Matt

Matthew Brost (2):
  drm/xe: Add support larger CPU pages to build_pt_update_batch_sram
  drm/xe: Enable 2M pages in xe_migrate_vram

 drivers/gpu/drm/xe/xe_migrate.c | 72 ++++++++++++++++++++++++++++-----
 1 file changed, 62 insertions(+), 10 deletions(-)

-- 
2.34.1

