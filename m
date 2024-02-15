Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADAF3C48BC4
	for <intel-xe@archiver.kernel.org>; Thu, 15 Feb 2024 18:17:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65B0510E6EE;
	Thu, 15 Feb 2024 18:17:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bXAyh9YB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F82D10E6EE
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Feb 2024 18:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708021042; x=1739557042;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ik+8dixCnKKh56VlLipcyVFtk/Drk9hGogi6PEXQvAM=;
 b=bXAyh9YBQnRXqWTFeJvfkCf22mQyK4MMh+RV4KM1vfmacqIcTXXRJZ0K
 F7V+udjohAcxmE2HH5+km+AtDq3bO6kVg06G4qnrxBDS1Cmqnnim7n4+h
 a9oAwVQeLCg4x3Bw+mS8XcK3fEZA5cSO8e7hYfJuCyvzph6jsd/JCP9Jk
 kT5w6TJZTokiTvuYn8aENZlv6EHQkPJDQxXhY28jwYHPjteIQ7uvFjCiQ
 HRn90e+a7qeOa2KMmxmiTdO6RJuNQjvRJLwXN/3VKY2+Mitui+706yk7R
 avQOQMfYObhOpsP/Ujx6h7YpxNiSq8syml9EEb/BtXl/1D32fexpRecnR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="13528555"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="13528555"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 10:17:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="34408109"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 10:17:18 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v2 0/2] Deny unbinds if user fence pending
Date: Thu, 15 Feb 2024 20:11:50 +0200
Message-Id: <20240215181152.450082-1-mika.kuoppala@linux.intel.com>
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

If we ever want to intercept OP_MAP through
user fence, we need to make sure that sequences
of OP_MAP and OP_UNMAP can be tracked without them
coalescing and thus vanishing.

Enforce vm_bind_ioctl by enforcing wait on associated
user fences on bind, before unbinding: If there is
non signalled user fence pending when the unmap is
attempted, deny it with -EBUSY.

[1] states that -EINVAL should be returned if
the ufence was part of the previous OP_MAP inside
this ioctl. This can be added if there is need to
distinguish these apart. This series returns -EBUSY 
regardless if the OP_MAP was part of this or previous
ioctl.

[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1159

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Mika Kuoppala (2):
  drm/xe: Expose user fence from xe_sync_entry
  drm/xe: Deny unbinds if uapi ufence pending

 drivers/gpu/drm/xe/xe_sync.c       | 58 ++++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_sync.h       |  4 +++
 drivers/gpu/drm/xe/xe_sync_types.h |  2 +-
 drivers/gpu/drm/xe/xe_vm.c         | 37 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm_types.h   |  7 ++++
 5 files changed, 97 insertions(+), 11 deletions(-)

-- 
2.34.1

