Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9910CCF2D6
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 13:00:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8493110E569;
	Mon, 19 Oct 2026 13:00:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E177910E569;
 Mon, 19 Oct 2026 13:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792414818; x=1823950818;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0w3XcBiHY4pgTbQSqnam52nawFGP+gi288PUcZ/JLTg=;
 b=WeFbOq6YWq0l8e25t5Wt+2hvgKbdS0AX8h33hoIjzCLDlGFMdaf+4ZTK
 Rw03YvIC9I2Ik1xHtwnkRGWK56IBr2WCSbNUocejL9lf5eN1VYUR8ZrWW
 VauTqWoqDn8gubvF0QA75a7BtVy2/7mb3lTzrgTgBMYQtiZv+UYigYufH
 28gKTjHjKTgYKMQ+bAokM1QTwqv+VguE84LjxGMbKfgRp1qEQ8/qGpXsP
 7boC6BPVkZ1tcLOt+vFPercEedx1oKkLuol5gFt55YGi9lBeU0U5yoyyb
 N/inyKREA5fypeg6AKy5z3zFxzJzuFiYXpQyuB1a31OrWy3G2N5d+ccIL w==;
X-CSE-ConnectionGUID: yZFUi57jQgSxB7xi/vBPew==
X-CSE-MsgGUID: kWN6saJCR62F7IUPXQsdHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1095410"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1095410"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:00:18 -0700
X-CSE-ConnectionGUID: 2c9Gdj4yQ06VoYR3O+gLnw==
X-CSE-MsgGUID: te48p73RQdqqaZ+hMQdjJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2893993"
Received: from alekseim-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.34])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:00:16 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/3] drm/i915: Display VT-d cleanup
Date: Mon, 19 Oct 2026 16:00:11 +0300
Message-ID: <20261019130014.8851-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Drop bogus VLV/CHV VT-d things, and polish the VT-d related code a bit.

Ville Syrjälä (3):
  drm/i915: Drop bogus VLV/CHV VT-d stuff
  drm/i915: Optimize VT-d w/a handling a bit
  drm/i915: Document which platforms have VT-d

 drivers/gpu/drm/i915/display/i9xx_plane.c     | 23 +++++++---------
 drivers/gpu/drm/i915/display/intel_cursor.c   | 20 ++++++++------
 .../drm/i915/display/intel_display_utils.c    |  6 +++++
 drivers/gpu/drm/i915/display/intel_sprite.c   | 27 +++++++++----------
 4 files changed, 40 insertions(+), 36 deletions(-)

-- 
2.55.0

