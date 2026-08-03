Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA96C55196
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 21:50:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D6510E0A1;
	Mon,  3 Aug 2026 21:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gz8V+p6u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C339510E0A1;
 Mon,  3 Aug 2026 21:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785793818; x=1817329818;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JzUo1gtCuMBso6ppq+b0G4Da4kc80X1UMx6ul2AgCsk=;
 b=gz8V+p6uhNUtuule+e5BU8YM4lbB5CVw1I0gnoA1QZtBqtrlb5+D+fp/
 9ZQzn7tsB/FNV9KY8Aag1AaZe8sG/Ys215XgYrKWdu3DKTRtjL6c2ik8S
 gJhqXQT9XD7/nCHf9F7LzswdcOxUwmGQpIQbHp95BB33YQMFotu7NUito
 LY7ygrNpg02Lu+Z1HkvVcD79mB0nA+W5sA6OWiVuNTNehP6myCwOkMBPt
 /vUIPl3DbaxzIiO1uZigfDUEbRI8qjMoAnT5oTEhUXxXRwO8LCm349Lsp
 y0ocDzexDBE2LiQqnDyCRUFonu5Ze+zCtNHw/VayhOQF/JUcLVU6bFNEb A==;
X-CSE-ConnectionGUID: C1tdebIUTZeFcU/gHYZcWg==
X-CSE-MsgGUID: 7F7OzsTWRsWZ1oB1QsO3jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="97849127"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="97849127"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 14:50:18 -0700
X-CSE-ConnectionGUID: M1gl3P/IShqYi/7zLeyWAQ==
X-CSE-MsgGUID: UleSWNoKTw+C6YFzhdQsOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="291272046"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa002.jf.intel.com with ESMTP; 03 Aug 2026 14:50:17 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v2 0/4] SKL_DSSM / DE_CAP fixes
Date: Mon,  3 Aug 2026 23:49:05 +0200
Message-ID: <20260803214909.3076716-1-michal.grzelak@intel.com>
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

BR,
Michał

[1] https://lore.kernel.org/intel-gfx/20260727222125.2459634-1-michal.grzelak@intel.com/

---
Changelog:
v1->v2
- s/REG_GENMASK/REG_FIELD_PREP/ (Jani)
- use either runtime info flag or display version check (Jani)
- don't initialize runtime info flag to 0 (Jani)

Michał Grzelak (4):
  drm/i915/display: fix SKL_DSSM register macros
  drm/i915/3dlut: disable 3D LUT for pre-GLK
  drm/i915/3dlut: log 3D LUT's status
  drm/i915/3dlut: disable 3D LUT if unsupported

 drivers/gpu/drm/i915/display/intel_color.c          |  3 +++
 drivers/gpu/drm/i915/display/intel_display_device.c | 10 ++++++++++
 drivers/gpu/drm/i915/display/intel_display_device.h |  2 ++
 drivers/gpu/drm/i915/display/intel_display_regs.h   |  9 +++++----
 4 files changed, 20 insertions(+), 4 deletions(-)

-- 
2.45.2

