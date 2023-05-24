Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 809FEC7EE23
	for <intel-xe@archiver.kernel.org>; Wed, 24 May 2023 12:37:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50B9F10E671;
	Wed, 24 May 2023 12:37:24 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAA5B10E196
 for <intel-xe@lists.freedesktop.org>; Wed, 24 May 2023 12:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684931842; x=1716467842;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aoL/Gd0RlNqRTUlB0h6OUvj3g1tq6klWuO4mmTyD9Io=;
 b=SDN/jstEUlVlY8KDmtYNUWaQOpebNdG2Qpr+1f7sDYLpDKAtrCx6u4lb
 NMwJvI9Q1BTTiB8DH+A3/OOVjGnPBVJtiiQ5FOpWLYwoBdX/fj4BwBiut
 9qy7WVL2V0wrsTAxTZ2iX15HWwWs2X2Oq04XzwNmu8iIEpnE1Wost464k
 0Z5Rt485jJN5eRDOL8mPqjmCDxh7aI6tl5K1LvqXUlVRA4UImC6mAvh3T
 8RmCzVPKPKe6MHjETCcmzbwROfmI9YhMtJOPle8FVzWugSd6QcWtltPvx
 b5UIVIXSo6w0QqkBwzmvpyOamhr97dXPfJh7zveKTzVAE3FMXDVJNUaj/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="343010787"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="343010787"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 05:37:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="735186103"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="735186103"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 05:37:19 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 24 May 2023 14:36:46 +0200
Message-Id: <20230524123648.29955-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 0/2] Implement vma madvise ioctl
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
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Sending this initial RFC patch series for vma madvise ioctl
to gether feedback if this the correct way to do that.

I am adding two expected options for userspace to pass

DRM_XE_VMA_MADVISE_WILLNEED: 
	* Set ttm priority to normal/high(if cap permits)
	* Make sure VMAs are in allowed placement and bound.

DRM_XE_VMA_MADVISE_DONTNEED: 
	* Set ttm priority to low so the BO belong to the vma
	become early target for eviction.
	* Make sure VMAs are not bound.

Questions: 
Should this be part of DRM_IOCTL_XE_VM_MADVISE rather than creating new ioctl?

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com> 

Nirmoy Das (2):
  drm/xe: Expose vma bind-unbind functions
  drm/xe: Implement madvise ioctl for vma

 drivers/gpu/drm/xe/Makefile         |   1 +
 drivers/gpu/drm/xe/xe_device.c      |   2 +
 drivers/gpu/drm/xe/xe_vm.c          |  52 +++----
 drivers/gpu/drm/xe/xe_vm.h          |   3 +
 drivers/gpu/drm/xe/xe_vma_madvise.c | 223 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vma_madvise.h |  15 ++
 include/uapi/drm/xe_drm.h           |  28 ++++
 7 files changed, 296 insertions(+), 28 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_vma_madvise.c
 create mode 100644 drivers/gpu/drm/xe/xe_vma_madvise.h

-- 
2.39.0

