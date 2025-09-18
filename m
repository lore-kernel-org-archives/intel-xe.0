Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E242FCAC597
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 07:32:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7795610E665;
	Thu, 18 Sep 2025 07:32:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kEBf+kZs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE4310E664
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Sep 2025 07:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758180733; x=1789716733;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Py2t6CUkpGH8XWv9GZXGkFlSFUJ8/0MVPoJN4DNZ9ds=;
 b=kEBf+kZsbuh+WdoP9Se1SA1fwbg1Y61sKb6PMvFRiaRApmBCVecW+9L4
 +BzCkP4SCrrf4holbk4k5BZHjcS2pPKm5Rz/iIyJIH+vqGC0pEghsNTu0
 L+DirxZzLQj3s5YXk/oqbTq5QQ+nW9bhUnm83OsQa0texWIWQmnxU7SXs
 JjDHcTALXG+CFHmKx/YtJCh27Fm06BPrPEMqxhgri4DDpKjM1Gg25AKec
 /FdJu4nOrl8tl21A85M7YCZM6nPvsnt6QbWPeIc6Iar7wVbzbdf3GqPyj
 yMgtVqwg6HFIwBHV+quBovgyePdvp+BER6PqWYIKkSh5V+76Ozj8rjVKl Q==;
X-CSE-ConnectionGUID: 2PKlnxJZT+OWn1ki/tnyOw==
X-CSE-MsgGUID: D6tsRDFxQWmWGTgA4+uXgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="71132716"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="71132716"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 00:32:12 -0700
X-CSE-ConnectionGUID: 624gUbTNSC68ZWohBtf/4g==
X-CSE-MsgGUID: hlMZvNCgSmuOvtjiuRzgpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="174587625"
Received: from himal-super-server.iind.intel.com ([10.190.239.34])
 by orviesa006.jf.intel.com with ESMTP; 18 Sep 2025 00:32:11 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 0/2] MADVISE to support multiple PAT indeces
Date: Thu, 18 Sep 2025 13:30:01 +0530
Message-Id: <20250918080003.153906-1-himal.prasad.ghimiray@intel.com>
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

Extend uapi to provide pat for multiple memory regions, smem, local vram
and remote gpu vram

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
 
Himal Prasad Ghimiray (2):
  drm/xe/pat: Improve PAT index handling in xe_vma_mem_attr
  drm/xe/uapi: Enable madvise to pass multiple pat indeces

 drivers/gpu/drm/xe/xe_pt.c         |  3 ++-
 drivers/gpu/drm/xe/xe_svm.c        | 21 ++++++++-------
 drivers/gpu/drm/xe/xe_vm.c         | 24 ++++++++++++-----
 drivers/gpu/drm/xe/xe_vm_madvise.c | 28 ++++++++++++++++----
 drivers/gpu/drm/xe/xe_vm_types.h   | 34 ++++++++++++++++--------
 include/uapi/drm/xe_drm.h          | 42 +++++++++++++++++++++++++-----
 6 files changed, 112 insertions(+), 40 deletions(-)

-- 
2.34.1

