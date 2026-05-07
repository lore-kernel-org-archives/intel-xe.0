Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D2ACD3442
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 19:37:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E28CA10F206;
	Thu,  7 May 2026 19:37:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WoZdsN76";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17C6D10E590;
 Thu,  7 May 2026 19:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778182621; x=1809718621;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0jWC/Y+l/QXEpUEHpLgyrPP4nurxRRFu7mNO+QbcntM=;
 b=WoZdsN769U/gDvOFdbGukC6LHZbH5jC6/y0IfIAEBrXyyqzAEJKeV6Bl
 /tvp1gtKG9FOdJeOQkhERaj0TrI2VBjLHcZDo/B0CrAlSL8CLGFRCBw7a
 /dyFlpkTOeYQ5gdNCHtuaKu2Gf6d+K800g+7oKWLVnh6XYCAuP8q74V1J
 CqcZAn+UuVAjd5ltdQGMSoH1rzA9Dbf2iothXuJMJw9MHC9tP1AtDDUM0
 NDIWvJ0t94U8NRcT4racA3ylL2Qrju048sfywB48pqmbXCmJxRBmh+iHh
 pPDaJ471OB21o5+1Zr4i00hmBTtcIlaxgpl1dS+x3x6ef+JcXFC8ehwwD A==;
X-CSE-ConnectionGUID: T3o4ZNQmRPWBlmB4lMh25Q==
X-CSE-MsgGUID: zPSl0p17QLiXEpT6qmuURg==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="89842401"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; d="scan'208";a="89842401"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 12:37:01 -0700
X-CSE-ConnectionGUID: gJ+rhvXASmmrrEaH1HUJRA==
X-CSE-MsgGUID: N4R/KKZWRqCP6Arilvyz6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; d="scan'208";a="240545345"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa003.jf.intel.com with ESMTP; 07 May 2026 12:37:00 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v3 0/1] match GEN6_PCODE_DATA naming with spec
Date: Thu,  7 May 2026 21:36:00 +0200
Message-ID: <20260507193601.533356-1-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Next version of [1].

[1] https://lore.kernel.org/intel-gfx/20260123194109.680186-1-michal.grzelak@intel.com/

BR,
Michał

---
Changelog:
v2->v3
- resolve conflict from rebase

v1->v2
- rebase onto drm-tip (Jani)

Michał Grzelak (1):
  drm/{i915,xe}/pcode: rename GEN6_PCODE_DATA to match spec

 drivers/gpu/drm/i915/display/intel_parent.c   |  4 ++--
 drivers/gpu/drm/i915/display/intel_parent.h   |  2 +-
 drivers/gpu/drm/i915/gvt/handlers.c           |  2 +-
 drivers/gpu/drm/i915/i915_reg.h               |  2 +-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c   |  2 +-
 drivers/gpu/drm/i915/intel_pcode.c            | 14 +++++++-------
 drivers/gpu/drm/i915/intel_pcode.h            |  2 +-
 drivers/gpu/drm/xe/display/xe_display_pcode.c |  4 ++--
 drivers/gpu/drm/xe/xe_pcode.c                 |  4 ++--
 drivers/gpu/drm/xe/xe_pcode.h                 |  2 +-
 10 files changed, 19 insertions(+), 19 deletions(-)

-- 
2.45.2

