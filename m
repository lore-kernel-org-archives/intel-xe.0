Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933C5C88E53
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 18:33:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F26A10E51C;
	Fri, 11 Sep 2026 18:33:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IbUFvLzI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B12E10E51C
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Sep 2026 18:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789151587; x=1820687587;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8SMffek05bJdSW9K4F8wQ7thm/calXgkmnBZ3HaqWEo=;
 b=IbUFvLzIq0+YXk7DVjS+Nce2kUWA/fKCWgBFOqh7WhejrzXtF+udfUG5
 He5IyaXdxUuRewAkVp5uMdBFkRmOswwS4wZT6qwS7Ugmvt6+4KbTzTzMA
 ReWA1VYE83OmV+p4HQiGL5M906fEyfqXvUxYeoaZmjXz81so2KvXYbDaC
 kcced+mQBOKkoKg6jXqbLndnwcBMqAo5YsDXmYJ/giQJdnnOk9DyRXP4V
 f00wBBcKp0NFEarWf1dtUsIdd2gsGA6p3xUV12B2erZPx3JNWMoXtk3Pm
 fMzLM5ya7TM02Oo2HVINkkpMUjf6a7RJ8AoIy1SdQrYsrl3p6OS667IOX w==;
X-CSE-ConnectionGUID: T//vdyjhRBqsdX/blc5tNw==
X-CSE-MsgGUID: PJdZp1PuTBGKSxs5R69OLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="89383770"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="89383770"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 11:33:07 -0700
X-CSE-ConnectionGUID: nBRxtlOZSAuA96uxGhmuEQ==
X-CSE-MsgGUID: 5r4cjqILSNWq4A7gY1nr2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; d="scan'208";a="275747968"
Received: from ncataldi-mobl3.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.174])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 11:33:06 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/3] drm/xe/pf: Add _locked variant of config functions
Date: Fri, 11 Sep 2026 20:32:54 +0200
Message-ID: <20260911183257.14999-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

Michal Wajdeczko (3):
  drm/xe/pf: Add _locked variant of the priority config function
  drm/xe/pf: Add _locked variant of the release config function
  drm/xe/pf: Add _locked variant of the fair sched config function

 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 78 ++++++++++++++++++----
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  4 ++
 2 files changed, 69 insertions(+), 13 deletions(-)

-- 
2.47.1

