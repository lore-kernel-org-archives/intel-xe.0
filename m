Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4911CA0EED
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 10:22:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A59DF10E95F;
	Thu, 28 Aug 2025 10:22:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fAN+pkcU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF4C810E95F
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 10:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756376529; x=1787912529;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gUWtdT2kaJ4PYlCoLdt9LS76XYlbvN4g2I0q4/J2d5M=;
 b=fAN+pkcUpsu1Mio/owBd1q0blzZh1hok+Z/vVYZxTZivkQSlxxxFAzES
 HqXkWpPC8GVntTHkeZwqZhOIaMWib8xQ4+peX2EVAUi5Ufq1lzHVDrvae
 +XVjVcrO1jWf3D41v/C2EvbjGw1VptVQ0PQyHkGCYN0YfHZO35tchOCnH
 EwDwsz7C0Partj7SUXjZ3JJCxTZW/op+o+vTNE0BdO0oNin4WYcH6tqfB
 rdGTZOMvujvFTGyvO+wvl7nl6U8/fME9DXL0SsgZvY7IwBrZcM0nh/bUu
 uqwdseY/403dG76k6+KFJo/XQnm4D5pLy/qy0QGpCDyF9SE127gy5fy9m w==;
X-CSE-ConnectionGUID: 42DnJy+KS1i6CN1oumaPmA==
X-CSE-MsgGUID: Wb9rJoY6TCOHVQadMCTFQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58741876"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="58741876"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 03:22:08 -0700
X-CSE-ConnectionGUID: zr0KJWfeQiOy34XtWF6SXQ==
X-CSE-MsgGUID: dFfoWZZhSKOLlqkHMdYJ4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="201040282"
Received: from himal-super-server.iind.intel.com ([10.190.239.34])
 by orviesa002.jf.intel.com with ESMTP; 28 Aug 2025 03:22:08 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 0/2] Smatch static checker warning fixes
Date: Thu, 28 Aug 2025 16:19:31 +0530
Message-Id: <20250828104933.3839825-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
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

Himal Prasad Ghimiray (2):
  drm/xe: Fix indentation in xe_zap_ptes_in_madvise_range
  drm/xe/vm: Fix error handling in xe_vm_query_vmas_attrs_ioctl()

 drivers/gpu/drm/xe/xe_vm.c         |  2 ++
 drivers/gpu/drm/xe/xe_vm_madvise.c | 12 ++++++------
 2 files changed, 8 insertions(+), 6 deletions(-)

-- 
2.34.1

