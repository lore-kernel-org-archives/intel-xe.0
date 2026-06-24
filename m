Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB7F4CDB479
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jun 2026 14:37:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 783FB10E0B5;
	Wed, 24 Jun 2026 14:37:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GAJ1UKkD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4174D10E0B5;
 Wed, 24 Jun 2026 14:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782311822; x=1813847822;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iWYlX6dOIDWpAffql5w+OuL+aWRQG8aIL0i60v/Atmw=;
 b=GAJ1UKkD5MZ/l3Q4gdk1PqGAHnor266fX+dEt1LXlK0FWOBvuO8hBL99
 NpNOqkOPtySxZurQeF84XGHnnabQ+Kc2Ge21Pk09uxzIkdU8GfZzVP2KZ
 i3QA+/b9x3KGr1GcyniSp01YC0VyInxkfYlv1/cak+3c5X83hbspJUKhD
 Yo0JZWqbCf9sgjz3KB0BCxKnV+iP6y3tdNaCkgsYreKzbATm4sakRshuR
 r5cpwAwXLuSdWjN+NRDi8tc6zDGN0TwO9slfbfhR8hOX2YQuQa3WuU1Ks
 jc1PGPhz6g6s7S8v00AYJmtdUZvOaKF8GFo40YTzW3ZlUMBv2eUwJajWq A==;
X-CSE-ConnectionGUID: vm8azhl+QYWI3Obo0ax4Tg==
X-CSE-MsgGUID: 2MUW4D8qReqpr9aU9nnFqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="86920286"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="86920286"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 07:37:02 -0700
X-CSE-ConnectionGUID: 2m9sR5IsRhGzn5ZIGCMzJA==
X-CSE-MsgGUID: q9hFESk+SJCpP2PB+IpuSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="253798923"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.187])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 07:37:00 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, rodrigo.vivi@intel.com,
 ville.syrjala@linux.intel.com
Subject: [PATCH v2 0/8] drm/{i915,xe}: unify runtime pm calls
Date: Wed, 24 Jun 2026 17:36:47 +0300
Message-ID: <cover.1782311749.git.jani.nikula@intel.com>
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

Another stab at unifying the i915/xe runtime pm calls for display.

v1 at [1].

I dropped some R-b's due to the changes from v1.

BR,
Jani.


[1] https://lore.kernel.org/r/cover.1781527161.git.jani.nikula@intel.com


Jani Nikula (8):
  drm/i915: call intel_uncore_runtime_resume() for each gt
  drm/i915: call intel_display_power_runtime_resume() on suspend error
    path
  drm/i915: move some display runtime suspend operations earlier
  drm/i915: add intel_display_driver_pm_runtime*() functions
  drm/{i915,xe}: add new
    intel_display_driver_runtime_pm_{enable,disable}()
  drm/xe/display: separate d3cold handling from
    xe_display_pm_runtime_suspend_late()
  drm/xe/display: add xe_display_pm_runtime_resume_early()
  drm/xe/display: unify runtime suspend/resume with i915 for non-d3cold

 .../drm/i915/display/intel_display_driver.c   | 71 +++++++++++++++++++
 .../drm/i915/display/intel_display_driver.h   |  8 +++
 drivers/gpu/drm/i915/i915_driver.c            | 58 ++++-----------
 drivers/gpu/drm/xe/display/xe_display.c       | 44 ++++++++----
 drivers/gpu/drm/xe/display/xe_display.h       |  1 +
 drivers/gpu/drm/xe/xe_pm.c                    |  2 +
 6 files changed, 125 insertions(+), 59 deletions(-)

-- 
2.47.3

