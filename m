Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B944BCD37AC
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 05:56:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D09D10E47A;
	Mon, 11 May 2026 05:56:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VS9Mg2/C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 851C110E47A;
 Mon, 11 May 2026 05:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778479005; x=1810015005;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=30dTCmx+wfWqq6fJAi9YX2Yoa4kkHHtIJ6jYXYB0ZHo=;
 b=VS9Mg2/C/YOYPh5ehmGGkkUiD2Uryhn998DSXQWzPLjqJw+BnFzqjSLd
 bRTTvdhSL+tQ1SFAOyuDD/kdNeO8SAchU7NsFw5JKXM245gT+fXEygTe6
 X0OHC0Cn2oL2MJVEgMKUYK600VQNVAfBM+DaNtEYdac/3coj5BhrngoUd
 CNY57lPc1s4w0c1J38MnJGyPQKu2V7tutRWO40551vb58Fx3tS9xesIMp
 yPO9NGue7RQvvBD2S1pT/jn7ZCgl4KlIExgbdUFt5Q1wpyNTg9czPwspm
 1VtL112zZ5oicDD9B5s+ZHpJljnmoQBeH0Zi854zImrXoLeS0H9Be4TJp w==;
X-CSE-ConnectionGUID: i42v06MXSgGbdTm9qjCFig==
X-CSE-MsgGUID: G/ddt9SQTGaKb+V8fJRWSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="81922839"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="81922839"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2026 22:56:45 -0700
X-CSE-ConnectionGUID: 9Mr9ZBJcQlGlWAlA6Hqr0w==
X-CSE-MsgGUID: YB078D2bQ36Wj6cwZWwcoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="241719924"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orviesa004.jf.intel.com with ESMTP; 10 May 2026 22:56:43 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, uma.shankar@intel.com,
 chaitanya.kumar.borah@intel.com, pranay.samala@intel.com
Subject: [PATCH v3 0/4] More Fixes for color pipeline
Date: Mon, 11 May 2026 11:02:09 +0530
Message-Id: <20260511053213.3122314-1-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

v3:
- Re-arrange patches

v2:
- Make dependency on atomic state more explicit (Ville)
- handle blobs in hw state clear

Chaitanya Kumar Borah (4):
  drm/i915/display: Copy color pipeline from plane in the primary joiner
    pipe
  drm/i915/display: Don’t use atomic state back-pointer to derive color
    pipeline
  drm/i915: Avoid programming color HW blocks for NV12 Y planes
  drm/i915: Fix color blob reference handling in intel_plane_state

 drivers/gpu/drm/i915/display/intel_cursor.c   |  2 +-
 .../drm/i915/display/intel_initial_plane.c    |  2 +-
 drivers/gpu/drm/i915/display/intel_plane.c    | 77 ++++++++++++++-----
 drivers/gpu/drm/i915/display/intel_plane.h    |  5 +-
 4 files changed, 61 insertions(+), 25 deletions(-)

-- 
2.25.1

