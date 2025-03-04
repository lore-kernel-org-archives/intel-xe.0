Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD9AC282D9
	for <intel-xe@archiver.kernel.org>; Tue,  4 Mar 2025 17:34:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 222B310E659;
	Tue,  4 Mar 2025 17:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WWnJ+IR4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D7A310E305
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Mar 2025 17:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741109638; x=1772645638;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5PQR2OnfHweKpkn3u1BC05tsmr9EDGbzKzImpCwAkfo=;
 b=WWnJ+IR4Zn27HyWGXNCmfY8OUTZsDYn9oyyA/degX0Dt2FZ7WHuYh6Pc
 gsVS+2g0TeckwAtYBGDXt4AkgihPwM/d1oHYiCuq08emwpFpaTEl0VU9l
 w76SbBULGzfLskxXYnFHZl50xdbScE5Gm+ceBFJ7Z1KC09WVPJybAyffz
 spuuY4HHMskv3wyWT1zppWb8Rt8IlzKBKjbsjPHUn+8cXq6muxYLCPb7M
 VG0DkGGAIsZ3X4gnp/MO2cSQsnDxXAlViqRFVSnAkFSHPdqW2Zhz4JxjT
 shVstRyHD542dWA6kzwLwzE+AF0bnzLwtEbLm9z5eYPQD3ByK7HyfxTPk w==;
X-CSE-ConnectionGUID: RGHvfpEsTvyEdS3VD36Qag==
X-CSE-MsgGUID: lmrX3Xk9TAygKaIfStHG9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42172071"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="42172071"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 09:33:56 -0800
X-CSE-ConnectionGUID: gX9jkA82RLmt/oqh+1lLDA==
X-CSE-MsgGUID: NZ4vTmCbSfar9bYqWppBIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="119123282"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.227])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 09:33:55 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Oak Zeng <oak.zeng@intel.com>
Subject: [PATCH v3 0/3] drm/xe: Userptr invalid page access fixes 
Date: Tue,  4 Mar 2025 18:33:39 +0100
Message-ID: <20250304173342.22009-1-thomas.hellstrom@linux.intel.com>
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

 drivers/gpu/drm/xe/xe_hmm.c      | 170 +++++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_hmm.h      |   7 ++
 drivers/gpu/drm/xe/xe_vm.c       |   4 +
 drivers/gpu/drm/xe/xe_vm_types.h |   4 +
 4 files changed, 145 insertions(+), 40 deletions(-)

-- 
2.48.1

