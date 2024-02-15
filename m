Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28DB5C4829E
	for <intel-xe@archiver.kernel.org>; Thu, 15 Feb 2024 16:45:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC29710E9E0;
	Thu, 15 Feb 2024 16:45:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dh8lDNZ8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40C2010E9E0
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Feb 2024 16:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708015551; x=1739551551;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QsQjCqOhhwpaaovdKEXmbzlYmB8H0+e2rdVz/mS9+r0=;
 b=Dh8lDNZ8VfJyxXawUvjiLbHI8SPzgEovShz2E3WDZgJ3Jgi5fZhJobHz
 154xmYuQb9sOjezrHXIfTAbYJDE1tWm+TJ3HPrVii0M5QtnXI0GsW2aqM
 e67Np0NIiv/VKQyF81OPgjeznvV8NLE8XlyGYl9pg8gOkyea0dWA9zFXl
 WAzt6dXj/M4kRvgy6qk5I4CDMvUb8/LAPM8tUcmx2vxBgNp/D2L54wwIh
 HEzN7Iu28mG/C8RWqU4du5x1zc5NcTBe+gsxN8VcO7AU58QLaVxMCC3kL
 11p3nDWBBJFmYl9ZOBrKtf02V2cp2hZ6ItDTgZ7PtXWXWAUfNNN0FbsBe Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="12742407"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="12742407"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 08:45:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="3508332"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 08:45:48 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH 0/2] Deny unbinds if user fence pending
Date: Thu, 15 Feb 2024 18:40:19 +0200
Message-Id: <20240215164021.438913-1-mika.kuoppala@linux.intel.com>
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

 drivers/gpu/drm/xe/xe_sync.c       | 56 +++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_sync.h       |  4 +++
 drivers/gpu/drm/xe/xe_sync_types.h |  2 +-
 drivers/gpu/drm/xe/xe_vm.c         | 35 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm_types.h   |  7 ++++
 5 files changed, 94 insertions(+), 10 deletions(-)

-- 
2.34.1

