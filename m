Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 760C5C3DA41
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 09:13:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49CDC10E9BC;
	Thu, 11 Jul 2024 09:13:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V4BGVxBO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ACE510E9B8
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 09:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720689224; x=1752225224;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DEk2hFAjd6dNeUEq0cpx49KbFqRnrH5AT6VQ99wrS0Y=;
 b=V4BGVxBOQdnijHprPGYRKHPEdAX+sUbAtVmSc5rHmvJIP/dqEt4Et5Nb
 zOHzdLYdCrKkvnVZa+Dz+bIYRUGFjLUuwwwZ66JpY/z790TJFiWtsJVwd
 mKvN4c1qLmJKeWw+TTCwEncS3fVZSVODYuYdRNMQlSRJAuQN3+rG06dPE
 xz0edPIabnVz9okV4IA9JmRUZLVfeY9CES67MaQmfBMQV7zeGvSf7kLUo
 xME5JTWYHm1TCGImrZ1ZmfFwxAl4chJ+DN6hmSshoLDo4zV3vTVdJmk8H
 tnFfLBVqALD2MeUIEeINxrxZTaa76nPlmnodpeuknBjsKgxNxFO7D+t07 Q==;
X-CSE-ConnectionGUID: 4cZ5hxZNSv+7piRe5FNYwQ==
X-CSE-MsgGUID: igayrvrUTly92dMTu2KCrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="12495468"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="12495468"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP; 11 Jul 2024 02:09:32 -0700
X-CSE-ConnectionGUID: m+IJZs/DQbGueAJDSbeU3Q==
X-CSE-MsgGUID: uEPQynoLR/SLZiCwiwq+Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="48467809"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.210])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 02:09:31 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 0/3] Restrict BMG to use 64K pages for scanout buffers
Date: Thu, 11 Jul 2024 11:09:22 +0200
Message-Id: <20240711090925.179366-1-zbigniew.kempczynski@intel.com>
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

Requires also changes from userspace perspective, due to necessity
allocating buffers with 64K pages.

Patches separated to distinct intention, but it may be squashed if
necessary.

v2: Limit restriction to BMG
v3: Expose display alignment config to userspace

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Zbigniew Kempczyński (3):
  drm/xe: Separate 64K physical allocation for display
  drm/xe: Expose display alignment requirement
  drm/xe: Use 64K pages for scanout buffers for Battlemage

 drivers/gpu/drm/xe/xe_bo.c           | 9 +++++++--
 drivers/gpu/drm/xe/xe_device_types.h | 1 +
 drivers/gpu/drm/xe/xe_pci.c          | 9 ++++++++-
 drivers/gpu/drm/xe/xe_query.c        | 4 +++-
 include/uapi/drm/xe_drm.h            | 3 +++
 5 files changed, 22 insertions(+), 4 deletions(-)

-- 
2.34.1

