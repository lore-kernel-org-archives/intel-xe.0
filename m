Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844B2CCA470
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 11:11:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EEBD10E0EE;
	Wed,  8 Oct 2025 11:11:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M+BnSxBn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 860BE10E0EE
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 11:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759921872; x=1791457872;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5yqtfouQ+OrWEKf1g4xXHPeJOZjzy0EflOYcc9cOBUc=;
 b=M+BnSxBnXARHHsrS/mNA8pmPES4ED3V0NUqFPw++/QUp1qjxDZHaPA1B
 cOGludwFb8rYnU0DYikJTfVTM0W/zUUv9EpgSYo+BfBfOofxkrSwKjBj7
 rv8laLNS0Q2SNKITznB+1czL11vo2WlGMQHg3UU1Llt16CHi3rHJcFiGz
 esMqZ+td4j2KVQ1UEsLj0GHXzWi8lZ0jCp42BfHFn8H3+15nW63PVSwXR
 tc0gUlLEtdHxy8rVwekzfpgK6eBfG9IltMuxaQMNxvwkBlux677G/VY9A
 +4CxZHOOZY+qcdA8c9iXopf2SUwFROavRTpg9upGhHfu0Mz2Nrv4mjLeO Q==;
X-CSE-ConnectionGUID: FFIrIZBiQSmjKf2ROXUx2g==
X-CSE-MsgGUID: 4PV99ADmTlKVLMeWpJmNRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="62154434"
X-IronPort-AV: E=Sophos;i="6.19,323,1754982000"; d="scan'208";a="62154434"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 04:11:12 -0700
X-CSE-ConnectionGUID: c4V6lGP8Q6CW3sNPdOqDcQ==
X-CSE-MsgGUID: Fu07C0xlT4SxjhUr/aGcPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,323,1754982000"; d="scan'208";a="211358684"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO fedora)
 ([10.245.244.126])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 04:11:10 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 0/2] SVM migration fixes
Date: Wed,  8 Oct 2025 13:10:48 +0200
Message-ID: <20251008111050.293151-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.0
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

Two small migration fixes. The first patch ensures
data is migrated to system on faults when there is
an madvise for the system location.

The second allows userptr data that was put in VRAM
by SVM migration to remain in VRAM also for
userptr maps.

Matthew Brost (1):
  drm/xe: Allow mixed mappings for userptr

Thomas Hellström (1):
  drm/xe/svm: Ensure data will be migrated to system if indicated by
    madvise.

 drivers/gpu/drm/drm_gpusvm.c    | 6 ++++--
 drivers/gpu/drm/xe/xe_svm.c     | 3 +++
 drivers/gpu/drm/xe/xe_userptr.c | 4 +++-
 include/drm/drm_gpusvm.h        | 4 ++++
 4 files changed, 14 insertions(+), 3 deletions(-)

-- 
2.51.0

