Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93704C02193
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 18:05:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A3AF10E370;
	Tue,  4 Feb 2025 18:05:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q/VWZpUE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9455B10E370
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Feb 2025 18:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738692331; x=1770228331;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rn7i0b1NdFRazTzswPruRTC0U7mtOpE8Ju01LI/Oy7U=;
 b=Q/VWZpUE7y5bHa5wX3lG7g/GA+YG/5G7C6hgpW7Cy0ZTGt3J0qHBGbtD
 5b+OScVUOFLY25Wue1RC8rgdR8NoH6gOwzLvA4kj8GE3yRkWWBu0pWbqT
 DnK7YNswdlYYCQSMNN3cKNbu4s8S7oT05ctsLimXXY7w/JAZi49Bc02av
 M1MI884JLCtT/f+j44iM6QBEFItqnSJJfDamEHJJXsziCzPCIvCPeoICU
 4cEg74u6KBHFdQZp2lueXTnhl1RzH+D4+V3cbpA/XLZIDnAtjlOU8jVBa
 APth6cFbWt0Kx0iqnSfT0MX3ofRBt/lqZ9i5D1U7VIiu/mjQ18OYnJKUK A==;
X-CSE-ConnectionGUID: 0v1wQ/6pR9SpVZcErtr0TQ==
X-CSE-MsgGUID: KvQzwcnRRfGhAy/Mj5ggyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50651322"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50651322"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 10:05:31 -0800
X-CSE-ConnectionGUID: tPSS2DSDTPyi6bM8/SoR4w==
X-CSE-MsgGUID: UvM5IUrQRFujOJ1lzFqAdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="115701585"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.83.184])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 10:05:29 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 0/3] VF: Avoid reading inaccessible RING_TIMESTAMP
Date: Tue,  4 Feb 2025 19:05:19 +0100
Message-Id: <20250204180522.2327214-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

RING_TIMESTAMP registers are not available for VF (Virtual Function)
drivers. Return -EOPNOTSUPP when the DRM_XE_DEVICE_QUERY_ENGINE_CYCLES
ioctl is invoked on a VF device.

Modify xe_hw_engine_read_timestamp() to return an error code instead
of a u64 timestamp. Return -EOPNOTSUPP when called from Virtual Function
(VF) mode to avoid reading the inaccessible RING_TIMESTAMP register.

Ensure show_run_ticks() only prints drm-total-cycles when timestamp
retrieval succeeds.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Marcin Bernatowicz (3):
  drm/xe/vf: Return EOPNOTSUPP for DRM_XE_DEVICE_QUERY_ENGINE_CYCLES if
    VF
  drm/xe/vf: Return error code from xe_hw_engine_read_timestamp()
  drm/xe/client: Skip drm-total-cycles if unable to read timestamp

 drivers/gpu/drm/xe/xe_drm_client.c |  9 ++++++---
 drivers/gpu/drm/xe/xe_hw_engine.c  | 10 ++++++++--
 drivers/gpu/drm/xe/xe_hw_engine.h  |  2 +-
 drivers/gpu/drm/xe/xe_query.c      |  3 +++
 4 files changed, 18 insertions(+), 6 deletions(-)

-- 
2.31.1

