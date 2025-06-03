Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9941DC5AD49
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 20:28:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EFDA10E0AB;
	Tue,  3 Jun 2025 20:28:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cXbpxaIz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A385510E0AB
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 20:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748982516; x=1780518516;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x/2R+Am2opDpjGLhcXN1ADHvU+qDVZp0+Eo7GbV49S0=;
 b=cXbpxaIzb7ffked2TAYGm8qj/KZFy7gaYfOZALAN2gExRJ2YWinvZqbf
 Wof8ZqgHvm7Kf7si+IDAL2Ra8pKb1wCQqs5ktAeWDtSJYQVhD/WpLZIOd
 0HcGpvav5jHINehsighUUgTUqX1sQ478f+AJ1WSI+WDNNbfk3NYONz6m0
 kvK9jgY1wfeDNSckBsQtUnnmtv6YRN1I9rq9z/fZBU1n0UGJABbsjyoBp
 XRydZ/6AJ3/SoSAp9jNBzFonmexYQxnea/rXyZcIbL3zrBF6DJQacAgl5
 UhICiMq9S8mnGfMajHmwmXGps0PdGQgfZpfOPj0w0VMf9AXT+1DeyLx5u w==;
X-CSE-ConnectionGUID: BZS+yaO1SFuiX+uI1L4hzQ==
X-CSE-MsgGUID: Fxj/Rm/aTyuWMbg/rIjuhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="62396645"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="62396645"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 13:28:36 -0700
X-CSE-ConnectionGUID: Rknk7nk9RoSjCLeH1LLqow==
X-CSE-MsgGUID: uT8s83SIQuWMUZAvzCh/5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="145583159"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.253.198])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 13:28:35 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/4] Some more _types.h cleanups
Date: Tue,  3 Jun 2025 22:28:22 +0200
Message-Id: <20250603202826.681-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
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

Promote xe_mmio and xe_tile definitions to own files.

Michal Wajdeczko (4):
  drm/xe: Move xe_root_tile_mmio() to xe_device.h
  drm/xe: Promote struct xe_mmio definition to own file
  drm/xe: Promote struct xe_tile definition to own file
  drm/xe: Drop unnecessary include from xe_tile.h

 drivers/gpu/drm/xe/xe_device.h       |   5 +
 drivers/gpu/drm/xe/xe_device_types.h | 197 +--------------------------
 drivers/gpu/drm/xe/xe_mmio.h         |   8 +-
 drivers/gpu/drm/xe/xe_mmio_types.h   |  53 +++++++
 drivers/gpu/drm/xe/xe_tile.h         |   3 +-
 drivers/gpu/drm/xe/xe_tile_sysfs.c   |   2 +-
 drivers/gpu/drm/xe/xe_tile_types.h   | 172 +++++++++++++++++++++++
 7 files changed, 236 insertions(+), 204 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_mmio_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_tile_types.h

-- 
2.47.1

