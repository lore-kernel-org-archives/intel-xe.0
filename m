Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA910606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 00:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YVZwSuVW
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5847310F83D;
	Wed, 11 Nov 2026 00:08:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9801E10F83D
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Nov 2026 00:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794355700; x=1825891700;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LWosPYm15egnBAni2GxSBdSqSXdJYoFwDrUtvogiUjc=;
 b=YVZwSuVWoNLgYP1IFph8boSigfNHH30BM1PIA5qtxeVGLYtgxCQscon1
 gYOeH5T3agNiNSyJH7SQpx/KYKzQPwED17Xtoecfo6H9SFvfnx6F+Zs5D
 CDYg4lDTnpE9BcjHZHZVldxGSYI0j7c5JgTCCwo8T2pxBqhn3NVg56K7N
 KYCKx/vJDpSrlpva/phAs5DyGD4CWyXHm1iLNQzfCwSvJF7Zwj4ko1cJ/
 kiwRVXKFRkL61Ea0LFM0wq3JIEDjB3lXGEP2twWica2SxseIpWQZgVu9C
 fjoTYEqB7NZSC5IckWKdqqov6xZUpmSiKWgnNTcUkWjGiLCwsE6oh5/jO w==;
X-CSE-ConnectionGUID: M/+RrwPyQquBy0+92iV5tg==
X-CSE-MsgGUID: ofxtJ9WZToezP4Pa9IuBRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3153570"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3153570"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 16:08:20 -0800
X-CSE-ConnectionGUID: zM/xnhcYS8iqdA0PGD6cBQ==
X-CSE-MsgGUID: HaG0rtbjSqyjV7bBe+5NWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8381949"
Received: from dut4463arlhx.fm.intel.com ([10.105.9.57])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 16:08:20 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, fei.yang@intel.com, rodrigo.vivi@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 0/1] Add a configfs to program the hwconfig
Date: Wed, 11 Nov 2026 00:08:17 +0000
Message-ID: <20261111000818.238585-3-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
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

For debugging it can be interesting to program different values
than the ones being decrypted from the GuC firmware for the
hwconfig. This isn't intended to be used in production as these
values are defined by architecture for the given platform.

Developed in collaboration with claude opus 5.

Stuart Summers (1):
  drm/xe/configfs: Allow overriding the GuC hwconfig table

 drivers/gpu/drm/xe/xe_configfs.c     | 119 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_configfs.h     |   6 ++
 drivers/gpu/drm/xe/xe_guc_hwconfig.c |  36 +++++---
 3 files changed, 150 insertions(+), 11 deletions(-)

-- 
2.43.0

