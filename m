Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08265C5AC7C
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 12:34:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6160110F4AD;
	Fri,  7 Aug 2026 12:34:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G68n7AsC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E02C710E413;
 Fri,  7 Aug 2026 12:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786106056; x=1817642056;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+dzOSffzL9jnTe1JSZ7J5cPyJoxa9GuOzbTf7kqI9kM=;
 b=G68n7AsCSnu9yyeENSYs+olE51y/Be8AWh3YU6rMRdDGH8Nq96TVC5Vt
 I+8y8NnhKXunw8tH86m9oVuagbMaLkT0FhsJwVI33H/9blEj3RmHnqyQz
 zxdwwG9vWrBL8IYtTolgGvs3bVBeM0PQOoPTJwCSCAf+jVcYdJ311WwmK
 ICTthUx1+TGlg2zMGMfX5Zbak4VKjFndsLO1icC07dsALGxF4bWMri0Qf
 jDOjokwFH6Zuzt7aZyHPWTbPpUqbYgCTm2TQANEd2XDavTY5pQ/r5wPdM
 olK/5lAB5ZQKuAEPrnLj69gGFZJHKvMUC8VNrnre2vzKEjvbDdREXueRi g==;
X-CSE-ConnectionGUID: gPk/TzrQQC6QfkVC1iqQlQ==
X-CSE-MsgGUID: LOw3Nx/7S2Sqk0jgipyvWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86824028"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="86824028"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 05:34:15 -0700
X-CSE-ConnectionGUID: DtKbQWpNQxGd+ov00UMFKQ==
X-CSE-MsgGUID: W2dQjf7kTQetcCbrgUtX/w==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.152])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 05:34:13 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	jani.nikula@intel.com
Subject: [PATCH 0/4] drm/i915/display: Limit invalid joiner combinations harder
Date: Fri,  7 Aug 2026 15:34:03 +0300
Message-ID: <cover.1786105831.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
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

A bunch of fixes to limit invalid joiner combinations earlier, during
mode enumeration and compute config. Patch 1 is v2 of [1], the rest are
new.

I decided to drop Fixes: and Cc: stable for now, just to thread
carefully. There are no bug reports about this that I know of, and we
can trivially ask for backports as needed.

BR,
Jani.



[1] https://lore.kernel.org/r/20260806143738.2710312-1-jani.nikula@intel.com

Jani Nikula (4):
  drm/i915/display: Limit max joined dotclock on joiner pipes available
  drm/i915/dp: Limit for_each_joiner_candidate() on joiner pipes
    available
  drm/i915/dp: Limit compute config joining to pipes that can actually
    join
  drm/i915/debugfs: Reject invalid force_joined_pipes harder

 drivers/gpu/drm/i915/display/intel_display.c  | 51 ++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_display.h  |  1 +
 .../drm/i915/display/intel_display_debugfs.c  | 19 ++-----
 drivers/gpu/drm/i915/display/intel_dp.c       | 17 +++----
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  4 ++
 5 files changed, 64 insertions(+), 28 deletions(-)

-- 
2.47.3

