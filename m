Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B64CA0FF0
	for <intel-xe@archiver.kernel.org>; Mon,  1 Sep 2025 08:38:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3975410E0AD;
	Mon,  1 Sep 2025 08:38:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JF7ce56m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D7FF10E0AD
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Sep 2025 08:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756715929; x=1788251929;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tA1Nsn95VC+3MTzfb25ZFwfQUA1WkW2IrzvmYMqn/mA=;
 b=JF7ce56mVZhMuJG18oNxh5O+BjAww7nMMmS+PM7kw4pUIDhJ0vxXwKhM
 PEiG+wqdqBnTGJJWxBS0vMmH8PsoBxxsqH1JVAMhMrJi46BDycQeePaYv
 iUCYYTE6aWl82qq4EUgFUzeRrL3yvF7ZrbKRC2XvSrEEGeQ0zCn4v4/0P
 AneJixXlKRr0oVygjx5MGbd9onsImzzIEiD69Eryt4klfaEfQcsFXGTGs
 RL+Y+j2XTIDk9h9jqdPg6Wdfq4WRReuMTAVLCpjpfMTJD8LDCa3JjB0KI
 89WqNlSuuwe1n2YKAV8v8uO8Ec28hbf5RZnO6H+bixJ+B6NqHEu8F94oX A==;
X-CSE-ConnectionGUID: b0Vgj+kTT86kqU5JfkdX9g==
X-CSE-MsgGUID: IN9dJ1OQTVeSVm7mYLYpKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11539"; a="58899193"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="58899193"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 01:38:48 -0700
X-CSE-ConnectionGUID: 1407SL/yQ1OZzWdHJDb3uw==
X-CSE-MsgGUID: 4YEdMkUxSRCQfGdxz4f3og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="201910231"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.244.171])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 01:38:46 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v2 0/3] drm/xe: Fixes around eviction and suspend
Date: Mon,  1 Sep 2025 10:38:26 +0200
Message-ID: <20250901083829.27341-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
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

Fixes to make evicted bos that are allowed both in VRAM and TT re-validated
into VRAM after eviction and suspend.

Also a fix to improve on a race where the pm notifier races with active
tasks when evicting bos for suspend.

Thomas Hellström (3):
  drm/xe: Attempt to bring bos back to VRAM after eviction
  drm/xe: Allow the pm notifier to continue on failure
  drm/xe: Block exec and rebind worker while evicting for suspend /
    hibernate

 drivers/gpu/drm/xe/tests/xe_bo.c      |  2 +-
 drivers/gpu/drm/xe/tests/xe_dma_buf.c | 10 +---------
 drivers/gpu/drm/xe/xe_bo.c            | 16 ++++++++++++----
 drivers/gpu/drm/xe/xe_bo.h            |  2 +-
 drivers/gpu/drm/xe/xe_device_types.h  |  2 ++
 drivers/gpu/drm/xe/xe_dma_buf.c       |  2 +-
 drivers/gpu/drm/xe/xe_exec.c          |  9 +++++++++
 drivers/gpu/drm/xe/xe_pm.c            | 21 +++++++++++----------
 drivers/gpu/drm/xe/xe_vm.c            | 14 ++++++++++++++
 9 files changed, 52 insertions(+), 26 deletions(-)

-- 
2.50.1

