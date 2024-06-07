Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934B3C27C53
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 20:36:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E4B510ED01;
	Fri,  7 Jun 2024 20:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VZiRp5uA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D44A10ECF8
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 20:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717792568; x=1749328568;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8esnmfQWNngKtDi11/N/98bocmBNhbUS8oKzQkNoXeY=;
 b=VZiRp5uAoUNJpIT7HqYrF1YkSyAKMRutjry802HOPy7W5PEGWKcuQv82
 NROgHsHKiK7QWcqNcI5D6buCEnkMYtloeP9Smbiow+nHBAxi97iC/WTem
 m3De2Q1RY/tNmKZVWiqaSmYXuGQNLzZFixCWEIl2ZpBJneHOuE2YB8njI
 iJj/oUwPKXeAvwRmKV9jVECKTCCyC9hCaGcgQB6L/pT4wQC6O3yq/fjx/
 82H/TkI/jWTV7wMuTTQcZAPE058NPkD1qtKIxaIQ6vugsXjF7fSAT4Mx4
 xAfeKebigAmDpg6P57ZY5umL6Ylt8rttasCshnrR2gAqgWCacU2eyQWN9 Q==;
X-CSE-ConnectionGUID: o/kD014kTAal37hri88Olg==
X-CSE-MsgGUID: LZ2mVLIFSqWx/NSXuGAc5Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14372474"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14372474"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 13:36:08 -0700
X-CSE-ConnectionGUID: fDEczC41Q2SZ3FMT707UOw==
X-CSE-MsgGUID: pq3ptjkWS4O7dul7iZoJcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38377908"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 13:36:08 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/1] Xe OA Consolidated Diffs
Date: Fri,  7 Jun 2024 13:36:02 -0700
Message-ID: <20240607203603.1966481-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

Because Xe OA changes between successive revisions are distributed across
multiple patches, I am providing a combined diff of all changes in a single
patch to help with the code review.

These changes pertain to: https://patchwork.freedesktop.org/series/121084/

Ashutosh Dixit (1):
  drm/xe/oa: Combined diff of changes between v15 and v16

 drivers/gpu/drm/xe/xe_device.c |  4 ++--
 drivers/gpu/drm/xe/xe_oa.c     | 10 +++++-----
 2 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.41.0

