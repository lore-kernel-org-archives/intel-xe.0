Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2D3C67861
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 18:52:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8165D10FA6A;
	Fri,  5 Apr 2024 18:52:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cI/G8fZm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC8CD10FA6A
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 18:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712343137; x=1743879137;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pQyC98b0CzbgVtvez6W90FrcWnGP35wt8lg3ZkZtYK0=;
 b=cI/G8fZm7tmA/rvvhB0Y2KAOSd/cdx92iBPUfBzxx9CZH5BPn7iUjuwS
 HgC60e4qv6vHFei1ptFHDk7TQ6CACEWh4QBym51bK0awz75tYQSRaBvZ3
 J7RDvXXMwFaJjB7IRDVLGHEmhiW3zEdr4/MBC/fUVNSBlXEzguHapx0pN
 JiNUbEpfgUgm0uBkIs1ZVnpvZBgr9E/3bd1qV/y72X+XUCN5T06kbVrbs
 ZoeyvFo2f7K6ogUpi7KfpYkLt8jyOzpFvA/k6MLFHDkL6qKnZRIwDCDFo
 LyZV7IfP7l69IVvJyRqLf2j1ayoSCm57H3K0L0M5iz3xju2S2Uk5jLSxE w==;
X-CSE-ConnectionGUID: NelFM13CTGiUqDYToVffDw==
X-CSE-MsgGUID: BUN9kKK8RWqdpO83Kk+GOg==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="7546787"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7546787"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 11:51:31 -0700
X-CSE-ConnectionGUID: S1duqrGoQnGt8ljo9WNrKA==
X-CSE-MsgGUID: VIF2dXrJRjGmQ3eE4hTw3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="19794100"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa008.jf.intel.com with ESMTP; 05 Apr 2024 11:51:30 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v3 0/2] Use hmm_range_fault to populate user page
Date: Sat,  6 Apr 2024 00:35:06 +0530
Message-Id: <20240405190508.244177-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
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

This is an effort to unify hmmptr (system allocator) and userptr.
A helper xe_userptr_populate_range is created to populate a user
page using hmm_range_fault, instead of using get_user_pages_fast.
This helper is then used to replace some userptr codes.

The same helper will be used later for hmmptr.

This is part of the hmmptr (system allocator) codes. Since this
part can be merged separately, send it out for CI and review first.
It will be followed by other hmmptr codes.

-v3
Squashed patches 1 and 2.
Address review comments.

Oak Zeng (2):
  drm/xe: Introduce helper to populate userptr
  drm/xe: Use hmm_range_fault to populate user pages

 drivers/gpu/drm/xe/Kconfig  |   1 +
 drivers/gpu/drm/xe/Makefile |   2 +
 drivers/gpu/drm/xe/xe_hmm.c | 253 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hmm.h |  11 ++
 drivers/gpu/drm/xe/xe_vm.c  | 117 +----------------
 5 files changed, 273 insertions(+), 111 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_hmm.c
 create mode 100644 drivers/gpu/drm/xe/xe_hmm.h

-- 
2.25.1

