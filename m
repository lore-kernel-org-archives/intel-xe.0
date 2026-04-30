Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5871CD13D3
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 07:27:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC6510F231;
	Thu, 30 Apr 2026 07:27:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gZ5UYhGa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C10C010F231
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 07:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777534021; x=1809070021;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UXH2p2IIhAleNqT9xY9c22+eW0i5qWeV4wedmMUaAQM=;
 b=gZ5UYhGalgQNiZuzwPlybrQAVf9GuKIkAswoRwnVKbjJyDpINDClGAnU
 aiLCSFFteDy30Pe7uwFcdlq14Tt2BO5RouUoMHaWJQ9SoeeQA+1ufUo7W
 Nq3De2/eOjzeyA20BqLDnkYgExGQX3W1lxAR5XHrigMiXv/6Co/EdHJgo
 c22IWMIoMT4q+rgRhvknzJDRTN5nqwC0lZUWTkVd2Fmyhv+8LC/Bd7Fq4
 cX6fw7KltAl4MwsJk360ooothRNxXi0C3YonwQaVtLkYpsesLIfeRiNYz
 WwpYCxtcZiHIWG6FBGFOvqwbdg9+PurP9VnoHRx4ca6mWaHm9jOJjyhab Q==;
X-CSE-ConnectionGUID: I275fjGPRyiZFSkaITfNTA==
X-CSE-MsgGUID: kjU4V/ndQo2efj45pgBR0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78343798"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="78343798"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 00:26:54 -0700
X-CSE-ConnectionGUID: myjRQuQvS56SjbgZbXQ8zw==
X-CSE-MsgGUID: 3/eeLJ3QR76e2x6aSXLjxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="231370598"
Received: from gsd-build.iind.intel.com ([10.190.229.141])
 by fmviesa007.fm.intel.com with ESMTP; 30 Apr 2026 00:26:53 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH 0/1] Do not include LRC indirect ring state size in engine
 state size
Date: Thu, 30 Apr 2026 07:26:46 +0000
Message-ID: <20260430072645.3592885-3-satyanarayana.k.v.p@intel.com>
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

The engine state size reported to GuC via ADS should only include the
engine state portion and should not include the indirect ring state page
that comes after it in the context image. The GuC uses this size to restore
only the engine state portion on watchdog resets.


Satyanarayana K V P (1):
  drm/xe/guc: Skip LRC indirect ring state size in engine state size

 drivers/gpu/drm/xe/xe_guc_ads.c |  2 +-
 drivers/gpu/drm/xe/xe_lrc.c     | 10 ++++++++--
 drivers/gpu/drm/xe/xe_lrc.h     |  2 +-
 3 files changed, 10 insertions(+), 4 deletions(-)

-- 
2.43.0

