Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3134C79FA1
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 23:18:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2F9810EDE8;
	Tue,  8 Sep 2026 23:18:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OgzfJoYK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3859210EDE8
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 23:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788909537; x=1820445537;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CJUxcCXumP/LS42n3C1tTI/wuuWpeCBJOWVIngb4F6Y=;
 b=OgzfJoYKF8p20+RkH4WKuQDVseSRb9nSCBTs1WOmhmHkJPUnn5C59Uph
 Er6k2Abc7Ojt4GXpSspKUH7wPgyA8FN3kLdurAbEnT3x9HkvaBrjDP9OS
 HW5q4CD2zUJS3/IXy74AQO5MIhC5BMU7XB0Xxf038MoFZgdV0z79ds+LY
 YllPqPWf0ISDJVwvYzpV17SHN2zsvmqZB9Z0hi3sVpnf6ttha8bso5M+q
 ei0hInjWZIIgrdeQJ3QrcBu5q58O5d+3VgxTZdrqT2bSZSiPSxW4/0IQN
 3rq0qitZSnoYLepikKkgeCMDcz4vKHVrMifcci8LGABwK/l4wTrEJQJ5F Q==;
X-CSE-ConnectionGUID: sYu0I2TpQjaf3CYFMqRvCA==
X-CSE-MsgGUID: 3qRW3eBuQ0yqQCAHumgY1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89530423"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="89530423"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 16:18:56 -0700
X-CSE-ConnectionGUID: yPvFRxDpRxaRZ/9maRbTtA==
X-CSE-MsgGUID: N6Azc3ZFTUC2Swm2AZZ2Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="267485710"
Received: from unerlige-desk1.jf.intel.com ([10.24.80.43])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 16:18:56 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, daniele.ceraolospurio@intel.com,
 alan.previn.teres.alexis@intel.com, julia.filipchuk@intel.com
Subject: [PATCH 0/2] Some error handling improvements in GuC
Date: Tue,  8 Sep 2026 16:18:55 -0700
Message-ID: <20260908231854.1218934-4-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.53.0
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

Fix some issues found in static analysis.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (2):
  drm/xe/guc: Reject a duplicate deregister-done G2H
  drm/xe/guc: Sanity check GuC-reported hwconfig table size

 drivers/gpu/drm/xe/xe_guc_hwconfig.c | 19 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.c   | 11 +++++++++--
 2 files changed, 28 insertions(+), 2 deletions(-)

-- 
2.53.0

