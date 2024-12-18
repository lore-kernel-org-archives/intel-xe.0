Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 401EBE77187
	for <intel-xe@archiver.kernel.org>; Wed, 18 Dec 2024 16:34:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0897310E445;
	Wed, 18 Dec 2024 16:34:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L0AABNkp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 763F610EC02
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Dec 2024 16:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734539666; x=1766075666;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=76IYMBpCPQr3/n75Rt82BA+8f+S7g5A4J+MapXKoJxA=;
 b=L0AABNkphk4Q0Z/pRCBCyCPdiKpEn6EGKOzpYIDKXKJ1H0R5b2fBeeKG
 k/YBdqCn7Yrpolha+bjPsO6UC46tuCP65XN+ZtO9GGfxdwz/yTeiElftV
 Jj693b9gRua0Ktm6VhxNrbaskdSe/CLRtg087tGzqrLqqRGomyjmK0cW2
 maRNZ7vocAhsXZSFb45iFbup6oeInIKOv4wWM10VaaIAZd5I1dOLoDCKT
 7dT5HSoNBuJ1JqbmBmA6ao764PxFd1TxHOPhDs5XeTJj0LZbTdltMVpbF
 lwQ33Mw+u96GgbHODgB9fIclzEl0pObIHexu+pxSi66aOJplScA086Tkl A==;
X-CSE-ConnectionGUID: QZnu4pBeTz6o8kvuHn+uYw==
X-CSE-MsgGUID: L0vd0oEfRnO1RMm8gqV+YA==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="34914889"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="34914889"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 08:34:26 -0800
X-CSE-ConnectionGUID: xzChXBitSKKdOl1xivaNmw==
X-CSE-MsgGUID: Edtm2Oz3Ss2dkWVrDYPL5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="98397201"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 08:34:26 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com
Subject: [PATCH 0/3] drm/xe: Small trace print improvements
Date: Wed, 18 Dec 2024 11:48:30 -0500
Message-Id: <20241218164833.2364049-1-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
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

1. Trace bo create
2. Print vm flags in xe_vm trace print
3. Print vm parameter in xe_vma trace

Oak Zeng (3):
  drm/xe: trace bo create
  drm/xe: Print vm flags in xe_vm trace print
  drm/xe: Print vm parameter in xe_vma trace

 drivers/gpu/drm/xe/xe_bo.c       |  1 +
 drivers/gpu/drm/xe/xe_trace_bo.h | 19 +++++++++++++++----
 2 files changed, 16 insertions(+), 4 deletions(-)

-- 
2.26.3

