Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0011606A31E
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 08:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VCkbs4Lt
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E052112159;
	Thu, 26 Nov 2026 08:35:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35912112157
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 08:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795682142; x=1827218142;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pufiWe/neV6MC2Jt8+EcslDCyaO7KCqTkJtTSX99otQ=;
 b=VCkbs4LtedP+FPAKIshwY+M0TZ44YdsXPzXzrzGXqGfn9H9r4Mp3LNMA
 zCVIpYbhSyaVfGrSTUFrPWPbJXPdNQxOdi6TfLaiDeDgImyPh9D84N2cT
 JwhpqXe0S9Y7wH7F3RMPMND+flyoeDeMcHF0K0EVv9lW92U25NEjsC/VR
 XBHWlvck3fHu/3NnXS3cf0alA4D/oaa/2VXhqIzPy3vl0+oDDZoWsi88D
 MD88B20Xk4RrY15QzmQ5Udaq8vjRsnx7v78QoeFriDQTvL/R03G/5LOOu
 L1bKTei17A5mYTkymR6Kay55VP5gtHvSJCFXXRZKwuOmSXQLoedWllSyK Q==;
X-CSE-ConnectionGUID: VnpSaxxzSVah8q1fqkIZ+Q==
X-CSE-MsgGUID: 4PuSACrkQdORraeU10Sl2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4581191"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4581191"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 00:35:30 -0800
X-CSE-ConnectionGUID: l/7lcf0sRK+JMnqJrq0YSA==
X-CSE-MsgGUID: IJM0EkydRceq80JeIv169Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12147415"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 00:35:27 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 badal.nilawar@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, tejas.upadhyay@intel.com
Subject: [PATCH v4 0/3] Handle sysctrl event for page offline full
Date: Thu, 26 Nov 2026 14:05:17 +0530
Message-ID: <20261126083516.1932195-5-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The firmware raises a System Controller event when its page offline
queue is full and cannot track further pages until the queue is read.
Handle it by draining the queue and offlining the returned pages, so the
firmware can resume queueing new pages.

Riana Tauro (3):
  drm/xe/ras: Wedge the device on page offline failure in all callers
  drm/xe/sysctrl: Drain page offline queue on queue-full event
  drm/xe/ras: Skip offline queue processing after device unplug

 drivers/gpu/drm/xe/xe_ras.c                 | 55 ++++++++++++++-------
 drivers/gpu/drm/xe/xe_ras.h                 |  1 +
 drivers/gpu/drm/xe/xe_ras_types.h           |  3 ++
 drivers/gpu/drm/xe/xe_sysctrl_event.c       | 13 +++--
 drivers/gpu/drm/xe/xe_sysctrl_event_types.h |  4 +-
 5 files changed, 55 insertions(+), 21 deletions(-)

-- 
2.47.1

