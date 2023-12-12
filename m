Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C88AC4167B
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 10:02:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C5710E1B5;
	Tue, 12 Dec 2023 10:02:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4923610E1B3
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 10:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702375322; x=1733911322;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xZ8+1Qx6sbIkXxCKAMJ5T4DUsnIajF3gA1zNu59mugg=;
 b=ZGdSNHMCKoQSFZnhQRI2LCGpQs5ReHVFxTz9jzbKP9WunRuxJ19eCx32
 Ym1JhobkjpO5BkhkZILKfV5XsEaX/saG/l8+1Lr690ZuS2VnjLx1ggO8p
 QcZAefRnCJTd69JIALb17AzlFOHXvhl580Bhr2lk3B8P1FXjrhV5HpDj3
 tKNKIS8pauqO5C9TjzI4ZEGhli7ktiW5b5nxrzakQvBqUCpw49X7DlZjk
 0Ly3MxUrE2g+BElE5wxw8ttgwOX5oFt7nFLFNiTYwjxyow6eOZUnJMUnl
 FWJ7pmYcF9nAG8d0+CFODWrJkzG2qy3u13VwDS+I26/Wkman51aY1n6UR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1598433"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="1598433"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 02:02:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="17630565"
Received: from skallurr-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.140])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 02:02:00 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 0/2] Use DRM_GPUVM helpers for the vm evict and exobj lists
Date: Tue, 12 Dec 2023 11:01:42 +0100
Message-ID: <20231212100144.6833-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.42.0
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The first patch replaces our driver-specific code with calls to DRM_GPUVM,
and selects to use the DRM_GPUVM fine-grained locking.

The second patch sets a flag that makes DRM_GPUVM assume dma_resv locking
instead, that we've previously using in the Xe driver.

v2:
- Don't lock all bos and validate on LR exec submissions (Matthew Brost)
- Add some kerneldoc

Thomas Hellström (2):
  drm/xe: Use DRM GPUVM helpers for external- and evicted objects
  drm/xe: Use DRM_GPUVM_RESV_PROTECTED for gpuvm

 drivers/gpu/drm/xe/xe_bo.c       |  63 +++----
 drivers/gpu/drm/xe/xe_exec.c     |  74 ++------
 drivers/gpu/drm/xe/xe_vm.c       | 296 ++++++++-----------------------
 drivers/gpu/drm/xe/xe_vm.h       |  19 +-
 drivers/gpu/drm/xe/xe_vm_types.h |  67 ++-----
 5 files changed, 131 insertions(+), 388 deletions(-)

-- 
2.42.0
