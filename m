Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 881E6C25B78
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 21:22:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8CBB10E558;
	Tue,  4 Jun 2024 21:22:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rr7plDC5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E27B10E0F0
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jun 2024 21:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717536162; x=1749072162;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KTqwCWO15/vLgnuSN80mPGULihIfjnyhWE5dgjFadB8=;
 b=Rr7plDC51+fbGviMq//HOfhgaiXcH5lDXdlGGqz0uKzr0MqeriWtfe4p
 jtosy7Q8I4ogOXHjQcP5HOYKAu9skIB4iNpx/2owR6w5PZMKnqHfvBT2/
 Rjo6KThMFhnQpwQ2oA7Fp6WDt6gLOhSY1Jy6qQoWxomfi+bYMfrlZSifF
 0UJVmVjwmvo27pUbac8VdgYWIkuWRB/GKzTtNTGHfbAU7q19xaX9532Zb
 +s6ISC1EoovdHvZV5LH2C0dJbWj72zMPdy8r+w9TnTVFDvpz53jJXNvmy
 TZoWZbCqWIZrvBSmOoSbpbBs4B62MdRW2MIIKqhoIaS936lL/rHU820Yx A==;
X-CSE-ConnectionGUID: I/djCfNYSXOmHXRtpeRTWQ==
X-CSE-MsgGUID: xQKS+3OPRfe/GS4aHQg5oQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="13996091"
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="13996091"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 14:22:41 -0700
X-CSE-ConnectionGUID: eUpXIAZdS0mH/7wio+ub5w==
X-CSE-MsgGUID: njAk47mITwOh+QAuRVUSIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="41799394"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.19.248])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 14:22:39 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/4] VF: Custom init and reset steps
Date: Tue,  4 Jun 2024 23:22:27 +0200
Message-Id: <20240604212231.1416-1-michal.wajdeczko@intel.com>
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

Michal Wajdeczko (4):
  drm/xe/vf: Support only GuC/HuC firmwares
  drm/xe/vf: Custom uC initialization
  drm/xe/vf: Custom GuC reset
  drm/xe/vf: Custom GT restart

 drivers/gpu/drm/xe/xe_gt.c    | 22 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc.c   |  3 +++
 drivers/gpu/drm/xe/xe_uc.c    | 33 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_uc_fw.c |  4 ++++
 4 files changed, 62 insertions(+)

-- 
2.43.0

