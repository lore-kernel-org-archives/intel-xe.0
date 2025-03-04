Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D25C021B8
	for <intel-xe@archiver.kernel.org>; Tue,  4 Mar 2025 11:38:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CA9A10E2D8;
	Tue,  4 Mar 2025 11:38:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VRrsgt/C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEDD810E2D8
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Mar 2025 11:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741088296; x=1772624296;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=twvFmHisa/byBV1TKVwFDP5NH2dQCFAVhh0XOUohOxc=;
 b=VRrsgt/CggNrkeuyOPUClsAWQMK2cRqOwP2XHE2bomWjsgjGBB2F1OwN
 69tz/+O9WRa/FR2ndb8oKUEWFFTzJjErGA1cP6/y1kVwqn4iXifT8ALmm
 JGqXQiizK3zceD3oAvXoZegUOEMVaPVvKAATYpw5PpfCqC0T7zl/fsZ7U
 7XJTUMeXbc+yVA60Vmx3auxYZfN55Dzg0ibqxhpwQKe+n7RW4uHgg1N1i
 0w6yBfnhLeYNZNNSehJSbzhOuL7Tf2xKc8TmQkmILDJE6lFIdokij3I5b
 EzEZSn+QCulgipFCfiP5yrdgsxIYog0ZlemH4065ydMwab+XjVM4MSuOa Q==;
X-CSE-ConnectionGUID: gWMFHKIESsWj4pKJRcrrOQ==
X-CSE-MsgGUID: mqgqJs9TRWCCKVoGx+/duw==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="59413166"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="59413166"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 03:38:16 -0800
X-CSE-ConnectionGUID: 4IuJWlW/R9GsyE+Xj+ccKg==
X-CSE-MsgGUID: FT6QtaQ7StiP4SbvAQz55g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="123471659"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.227])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 03:38:14 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Oak Zeng <oak.zeng@intel.com>
Subject: [PATCH v2 0/3] drm/xe: Userptr invalid page access fixes 
Date: Tue,  4 Mar 2025 12:37:55 +0100
Message-ID: <20250304113758.67889-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.48.1
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

Fix a number of potential invalid page-accesses by the userptr code.

Patch 1:
- Some coding style fixes.
Patch 2:
- Avoids invalid struct page accesses during userptr pinning.
Patch 3:
- Block xe device accesses on mmu_invalidation on the iommu level.

v2:
- Address review comments by Matt Auld

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Oak Zeng <oak.zeng@intel.com>

Thomas Hellström (3):
  drm/xe/hmm: Style- and include fixes
  drm/xe/hmm: Don't dereference struct page pointers without notifier
    lock
  drm/xe/userptr: Unmap userptrs in the mmu notifier

 drivers/gpu/drm/xe/xe_hmm.c      | 175 ++++++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_hmm.h      |   7 ++
 drivers/gpu/drm/xe/xe_vm.c       |   4 +
 drivers/gpu/drm/xe/xe_vm_types.h |   4 +
 4 files changed, 150 insertions(+), 40 deletions(-)

-- 
2.48.1

