Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5434DC282D0
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 10:44:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B91010EC6B;
	Fri, 28 Feb 2025 10:44:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IK+py+PM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE84F10EC64
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Feb 2025 10:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740739476; x=1772275476;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PI7AQYw8LNHvki4KbcVolZUj4Xr77RhvwWtv53ZbaKU=;
 b=IK+py+PMcZN8fNmLhHTCQVJhzZNsEbN6GT36gm24e+zx7L1FimSj8JJe
 XMr1TndDnwkNE+3A7csWM9RoDYogTs/4C87jnDRb0/k6YtE8gE5958gUW
 vKbxRDWSNRAuBXYNwXgl1xd+zXGidVClfRouIR8EVQmAeecNv62i/SCPD
 XAUzy+lmO0hxgKfE9duSZhfH+oF9199ywRXkHDOn4lLJwlEx41X4yldO6
 +oh8xIt3ExhTnNhz5Mk1FXB3BLkY3BKrtJMwG+V0jStC1OlBAs3oLXLz6
 0vHSpJ4lMICKtWm8AbaHX+j9G1SJcQIVJtLGqsaXroB0vPhU4e+vICIJi w==;
X-CSE-ConnectionGUID: h3BvGJHeQSmqBmKw4TbZkA==
X-CSE-MsgGUID: p2KbzLsCTuCpmQjFfM5HoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="40840560"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="40840560"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 02:44:32 -0800
X-CSE-ConnectionGUID: zcae4e3dRrKKyKufkIhSXg==
X-CSE-MsgGUID: aVWCq5VRTH+EC9JTsfaNLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="148114573"
Received: from monicael-mobl3 (HELO fedora..) ([10.245.246.40])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 02:44:32 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 0/3] drm/xe: Userptr invalid page access fixes
Date: Fri, 28 Feb 2025 11:44:15 +0100
Message-ID: <20250228104418.44313-1-thomas.hellstrom@linux.intel.com>
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

Thomas Hellström (3):
  drm/xe/hmm: Style- and include fixes
  drm/xe/hmm: Don't dereference struct page pointers without notifier
    lock
  drm/xe/userptr: Unmap userptrs in the mmu notifier

 drivers/gpu/drm/xe/xe_hmm.c      | 165 +++++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_hmm.h      |   7 ++
 drivers/gpu/drm/xe/xe_vm.c       |   4 +
 drivers/gpu/drm/xe/xe_vm_types.h |   4 +
 4 files changed, 139 insertions(+), 41 deletions(-)

-- 
2.48.1

