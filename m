Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A92D767DB
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 15:37:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F43610E8D1;
	Thu, 31 Oct 2024 15:37:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N8gzynSm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8913F10E8D0
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Oct 2024 15:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730389064; x=1761925064;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Nhcehc1qdejaDxH3DBZh57qPdYOC98sUdSEL+Pu9Vss=;
 b=N8gzynSmPdx5wd1e7v1JiibOkj9A2tumz3fzpby0Ps8W5n4/2tlANsoT
 HKWqnsAOYTkNsn4KzijhJ6qpVwECJAuS4DX2dHZgejBqmcBWSwm8Bmhfh
 H4zFcLKHl1uq7CrlvqmxNfvTG0O8NZ48x1mYr9z+uCRFOC0mz0UuvevVr
 r8ZRTwqp2araB0WV7vxuNP2l0v2SsBQ/1XNKX0o/spl9N/BCJh9WjcmHb
 hyyKGVDNJPM+Qljrdw642jZTuIo4KfaaNyeYT8FlZa0Fb51CHDdQCoy0E
 yx213df+QT3kJnhX7cwKCSpHShSyANSIPgWQHEZ3qOnrMkiqRh136unY1 A==;
X-CSE-ConnectionGUID: Rga+zKS0TR+Z8KOG0UxWAg==
X-CSE-MsgGUID: TE81bmmVTCWjDGmUkX+gMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30089074"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30089074"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 08:37:44 -0700
X-CSE-ConnectionGUID: 4oooxGCYRKKaZDQo02h6Yg==
X-CSE-MsgGUID: Ff0431vdQxy1cW2TPg75IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="87446035"
Received: from carterle-desk.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.213])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 08:37:43 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v2 0/2] drm/xe: Avoid unnecessary OOM kills 
Date: Thu, 31 Oct 2024 16:37:30 +0100
Message-ID: <20241031153732.164995-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.46.2
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

On kernel memory allocations where invoking the OOM killer is to be
avoided, but trying pretty hard to fulfill the allocation is still
desirable, one can use __GFP_RETRY_MAYFAIL.

Use that for buffer memory allocation-and validation and for
multiple bind memory allocation.

v2:
- Add __GFP_NOWARN to __GFP_RETRY_MAYFAIL allocations

Thomas Hellström (2):
  drm/xe: Avoid the OOM killer on buffer object memory allocation
  drm/xe: Don't unnecessarily invoke the OOM killer on multiple binds

 drivers/gpu/drm/xe/xe_bo.c |  9 ++++++++-
 drivers/gpu/drm/xe/xe_vm.c | 11 +++++++----
 2 files changed, 15 insertions(+), 5 deletions(-)

-- 
2.46.2

