Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9DC4CCD1BF
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 12:25:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A72A310E0D2;
	Tue, 28 Oct 2025 12:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mlnlf0cH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F36310E0D2
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 12:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761654307; x=1793190307;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IHCgES0QroA+G7z+dUOB6iMBpF0TIs0RN57Vnat+bh4=;
 b=Mlnlf0cHY4BeNz387NktEGi7ZY1JPqhnJyOeWsif49nk4d1VMyhvoHlx
 riwu9lOXCaWdlUJUujBbUWClVFWhI66XGm0ENjFRXHXRQqesptBtl72L7
 mrrO7rZxcWV+D6fssFgPKYBDppKlvBJMtCQJy70zGc7YlbwFpD1/Rbbfn
 fmle7LzrTHtEXfhuFryUZcbOenRvfIz8N8zt1qBaXgvYUF+NNumyDUqcC
 iy3cqMvemzv0gE9uL+fOgWMNNfjRNoXX2D2IVNM938SKdAt4sTFGM7jFu
 HaEl/7hyqdK6A+oups4nP2yV5bWFRSXu9TmX1bj1mgyHzt/jA5adolJQI w==;
X-CSE-ConnectionGUID: yrWtqkzERAqlf0B+cG3Sig==
X-CSE-MsgGUID: 3bGiUx7oTMioEpdw3SOgKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62956615"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="62956615"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 05:25:02 -0700
X-CSE-ConnectionGUID: s8lRTPiwTFerF/9q0p4cww==
X-CSE-MsgGUID: 0fo63n0ORNCUAKljHd7zuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="190524404"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 05:25:01 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [RFC PATCH 0/9] drm/xe/madvise: Add support for purgeable buffer
 objects
Date: Tue, 28 Oct 2025 17:54:06 +0530
Message-ID: <20251028122415.1136721-1-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
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

This patch series introduces support for purgeable buffer objects (BOs) in the Xe driver. 
This feature allows userspace applications to provide memory usage hints to the kernel,
enabling more effective memory management, especially under system memory pressure.

When an application no longer needs the contents of a buffer, it can mark it as DONTNEED
via the DRM_XE_MADVISE ioctl. This makes the BO a candidate for purging. If the kernel
experiences memory pressure, it can reclaim the backing store of these BOs,
freeing up GPU memory and helping to prevent Out-Of-Memory (OOM) situations.

The lifecycle of a purgeable BO is as follows:

A BO starts in the default WILLNEED state.
Userspace marks it as DONTNEED when its contents are discardable.
Under memory pressure, the kernel may purge the BO, transitioning it to the PURGED state.
Any attempt to use a purged BO (e.g., binding, mapping, or CPU access) will result in an error,
signaling to the application that the contents are gone. The application can then re-validate
the BO by marking it WILLNEED, at which point new backing store is allocated. To prevent data corruption,
a critical safety check ensures that only non-shared buffers can be marked as purgeable. 

Arvind Yadav (7):
  drm/xe/bo: Add purgeable bo state tracking and field madv to xe_bo
  drm/xe/madvise: Implement purgeable buffer object support
  drm/xe/bo: Prevent purging of shared buffer objects
  drm/xe/bo: Handle CPU faults on purged buffer objects
  drm/xe/bo: Prevent mmap of purged buffer objects
  drm/xe/vm: Prevent binding of purged buffer objects
  drm/xe: Add support for querying purgeable BO states

Himal Prasad Ghimiray (2):
  drm/xe/uapi: Add UAPI support for purgeable buffer objects
  drm/xe/uapi: Add UAPI for purgeable bo state to madvise query response

 drivers/gpu/drm/xe/xe_bo.c         | 91 ++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_bo.h         | 51 +++++++++++++++++
 drivers/gpu/drm/xe/xe_bo_types.h   |  3 +
 drivers/gpu/drm/xe/xe_vm.c         | 11 ++++
 drivers/gpu/drm/xe/xe_vm_madvise.c | 67 ++++++++++++++++++++++
 include/uapi/drm/xe_drm.h          | 34 +++++++++++
 6 files changed, 245 insertions(+), 12 deletions(-)

-- 
2.43.0

