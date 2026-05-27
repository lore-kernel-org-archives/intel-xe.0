Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134F7CD5BD5
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 13:06:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD23110E268;
	Wed, 27 May 2026 13:06:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BXVZdy+b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5F5B10E7B4;
 Wed, 27 May 2026 13:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779887192; x=1811423192;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eAAv9pFpAFZKh3mc08x6245C/O5qmDdlqFl7efGK6aU=;
 b=BXVZdy+bWi/LJ/UrEcnmMd1vh4R9yl/1hQ+hzDcV0JqqtriT9qALXVbL
 JkcgjHooNSFWP999dF0MMak8d/8hyLAHj9pxH+y6fmvRdsFyheYc86/Ht
 rUgWs61uyi8taddtpRlbm/lDOHb6ubtLUa08Rm4hkHS7yaYJdag7HkzyU
 nCnOf81Y+6xnivixWgZ7kbkpNcAmw4OKExLUniW3NaVnjTBCFCrzd+8RP
 smIpuRL8QMggDcTOAVh6syTJYGKatqEjnqZvPzxIf4zx2VMhCX63JwBdy
 37LfzyCCQuYAuECEvxwq4UyDJ4LfOyyi06GC/2erau49el0UPi6R2x0+O Q==;
X-CSE-ConnectionGUID: 5IJ1AxYGSj22q8DvIvFUfQ==
X-CSE-MsgGUID: AxDSsKHoRu6ADufcpGmsRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="79751338"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="79751338"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 06:06:31 -0700
X-CSE-ConnectionGUID: wgr7nTtdRn61dhHQ7G82UA==
X-CSE-MsgGUID: /BW8VKw+TBCY9k/WLa49Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="246512502"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.38])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 06:06:29 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 0/3] drm/{i915,
 xe}: relocate shutdown and pm hooks from xe to display
Date: Wed, 27 May 2026 16:06:23 +0300
Message-ID: <cover.1779887154.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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


Jani Nikula (3):
  drm/xe/display: rename xe_display_pm_shutdown*() to
    xe_display_shutdown*()
  drm/{i915,xe}: move xe display shutdown and pm hooks to
    intel_display_driver.c
  drm/i915/display: move d3cold allowed handling to parent interface

 .../drm/i915/display/intel_display_driver.c   | 203 +++++++++++++++++
 .../drm/i915/display/intel_display_driver.h   |  10 +
 drivers/gpu/drm/i915/display/intel_parent.c   |   5 +
 drivers/gpu/drm/i915/display/intel_parent.h   |   1 +
 drivers/gpu/drm/xe/display/xe_display.c       | 204 ++----------------
 drivers/gpu/drm/xe/display/xe_display.h       |  10 +-
 drivers/gpu/drm/xe/xe_device.c                |   4 +-
 include/drm/intel/display_parent_interface.h  |   3 +
 8 files changed, 250 insertions(+), 190 deletions(-)

-- 
2.47.3

