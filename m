Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE52EEAA51
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 15:29:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EA8E10E298;
	Thu, 14 Sep 2023 15:29:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64BBA10E144
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 15:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694705349; x=1726241349;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KyCIM3VtSUj/Qsz2qvKy4XeC4DrBd5S8ydjAvaMjLjM=;
 b=j/1lPJViQmd0YZ0MjH2aSs7tStCTlm/lkIQKh+aGzdJHVZ/21UcYEInb
 oGGnQCd4QoS0bDo+Dt1dKb81BrdX6H3ehAkC6zAVEHZqqs2KQkvCvE2Ye
 XpkPzHmD3FabZ3yOHmZDbM2vhaFWDlCBsaenoQl3yAuTn7xrfl7BIkquu
 75cBNoH0NaQlXiJRtmFDEZddW6BCmtCegqCk2sksdVLk6mmtY/3LfOHtB
 6DMjZHjsMFYAFOR9VJK+71NNOxGG+kncqBU1TQ5UQscQtCA+vdRzhJQ/k
 ItikeAx/2VtskvZfw6SWN2d/AA4sk56YYxqH6of9ZPi8XQFAq2ySCoA3N Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="381693176"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="381693176"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 08:12:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="887852086"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="887852086"
Received: from vgovind2-mobl3.tm.intel.com ([10.237.50.42])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 08:12:18 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 14 Sep 2023 18:12:39 +0300
Message-Id: <20230914151240.163434-1-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/1] Remove HAS_DISPLAY() check from
 intel_hpd_poll_fini
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reverts the following patch as this is not required

Revert "FIXME: drm/i915/hpd: skip intel_hpd_poll_fini() for
    non-display paths"

v2: resend the patch as a series

Vinod Govindapillai (1):
  Revert "FIXME: drm/i915/hpd: skip intel_hpd_poll_fini() for
    non-display paths"

 drivers/gpu/drm/i915/display/intel_display.c | 3 ---
 1 file changed, 3 deletions(-)

-- 
2.34.1

