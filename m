Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94720CD6E56
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 10:35:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39FB61130B9;
	Mon,  1 Jun 2026 10:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cHYEeLNY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4626E1130B9;
 Mon,  1 Jun 2026 10:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780310113; x=1811846113;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vYy48uZL6sjrl3CGhJvmogVknACGqMQCeRHEwwwkfy8=;
 b=cHYEeLNYk/QvGuFzsLvvd+0izGGWyGH0syC3lHD1oQdxXPRaTA4C3TNj
 ODoZ0caZSPopnmk5k5TZRzEIqgsZXoBN1jVrsGXpu6CHo19IQY3Cza5C3
 lHefjamoWBcDeXiqKinv01nAGYB+1o+lNI3PMyWqXeZeUQ5iAHECt5Mlg
 y3YyRF+6ZbKMIt47e105RlpiYRDRHe0WIY1lm67fRQnTRanJfPss6zkFi
 8xrDas5GGE2Py9RWbhXEm+VspLkpTNe64RYHYc9u52kA3mvjXWAs6MXxb
 WCT9kg0GSUtAfQnI1ID503FDA38U9f+w0rXRyO9KyphucpXBUZ4rYuAT3 w==;
X-CSE-ConnectionGUID: lvSetwNsR9Oa/ogJCVmLCQ==
X-CSE-MsgGUID: rr2DefYBQsmMhwLHD+dJ7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="80797230"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="80797230"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 03:35:12 -0700
X-CSE-ConnectionGUID: yLFEWXOYQLO5z0ZWOoG86w==
X-CSE-MsgGUID: nBqIQUOhQWm95cnr4blLqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="242728390"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.121])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 03:35:10 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: imre.deak@intel.com, ville.syrjala@linux.intel.com, jani.nikula@intel.com
Subject: [CI 0/5] drm/{i915,
 xe}: display (runtime) suspend/resume/shutdown unification, part 1
Date: Mon,  1 Jun 2026 13:34:55 +0300
Message-ID: <cover.1780310011.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
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

This is the first part of [1] for CI and merging.

BR,
Jani.

[1] https://lore.kernel.org/r/cover.1780051905.git.jani.nikula@intel.com

Imre Deak (2):
  drm/i915: Keep display IRQs enabled for encoder suspend/shutdown
  drm/i915/xe: Enable HPD polling later during system resume

Jani Nikula (3):
  drm/i915: add flush_workqueue(display->wq.cleanup) on shutdown
  drm/xe/display: remove intel_display_flush_cleanup_work() calls on
    suspend/shutdown
  drm/xe/display: drop duplicate intel_dp_mst_suspend() call

 drivers/gpu/drm/i915/i915_driver.c      | 15 +++++++++++++--
 drivers/gpu/drm/xe/display/xe_display.c |  6 +-----
 2 files changed, 14 insertions(+), 7 deletions(-)

-- 
2.47.3

