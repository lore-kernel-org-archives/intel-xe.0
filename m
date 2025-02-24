Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B892AC021A4
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 16:55:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8588810E480;
	Mon, 24 Feb 2025 16:55:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GtbwFh6k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0427E10E478
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 16:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740416123; x=1771952123;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jYbe6djRT3KZHaWXOuoAZs8jOf39G8diRBFRrbvJrX8=;
 b=GtbwFh6kk+OF0ecpjPTXwtjZMTM59E+vHbzxEXJqdRxJ2JZvav0AIMms
 cuFN8iSQoH7APAyDBfMXzHbAAHeyfYRiVZZSY+B3SRLL3ZxZwcwQzWN12
 2HG3dx5LuqKzwr77/LnYDeaBiuaUr3Xyag9TSe9UrTI9QJR0L9cTM/Fe/
 fwJZlq2NSSr0x0jjAcvZfi3QhF+tbYX3KFQYS3/kFU8IuLjYPJfLwCx3h
 HbI/i3mxPTeBVmGmzwc9Z2o+G8wSi3kWdBIt0C3ZrvQH0IMTUnPnj+Chm
 wYWgBAJ+TtAK1WoUzMmpGSjMx+SsPMl/yX55PhfeShgvxrZB3faEKkyr/ w==;
X-CSE-ConnectionGUID: BBX4+tLhQSOkVqvSvVX/bw==
X-CSE-MsgGUID: BVh5DmvZSvCkoWkv9LYVFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="44838074"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="44838074"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 08:55:22 -0800
X-CSE-ConnectionGUID: dyVzimcSRoeG8fYwFxN94A==
X-CSE-MsgGUID: pGQvemc8Qp6ARh7YoUHdQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="120730798"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 08:55:21 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	matthew.auld@intel.com
Subject: [PATCH v3 0/2] Userptr fixes
Date: Mon, 24 Feb 2025 08:56:21 -0800
Message-Id: <20250224165623.3077583-1-matthew.brost@intel.com>
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

Tested with below tests on BMG + CONFIG_DRM_XE_USERPTR_INVAL_INJECT
xe_exec_basic; xe_exec_compute_mode; xe_exec_fault_mode; xe_vm; xe_exec_threads

Matt

Matthew Brost (2):
  drm/xe: Userptr invalidation race with binds fixes
  drm/xe: Add staging tree for VM binds

 drivers/gpu/drm/xe/xe_pt.c      | 74 +++++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_pt_walk.c |  3 +-
 drivers/gpu/drm/xe/xe_pt_walk.h |  4 ++
 drivers/gpu/drm/xe/xe_vm.c      |  4 +-
 4 files changed, 60 insertions(+), 25 deletions(-)

-- 
2.34.1

