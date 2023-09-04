Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDB2C71153
	for <intel-xe@archiver.kernel.org>; Mon,  4 Sep 2023 11:55:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAABC10E1D7;
	Mon,  4 Sep 2023 11:55:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C39F510E11A;
 Mon,  4 Sep 2023 11:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693828548; x=1725364548;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LxhDZNF8r8nAjFsuxM+r/iy4Ft0fOMfn6B2ajSF7N+M=;
 b=aNJY56KGqkkT/FoL/snd/wRmP53OQxEMDe1rFjjpMpbx17Cy99fkQE+M
 Ue+Vny7VWLq2rIhm+qnnoditDG+nT5oYdYcVrw6xPcVoroDwvG/ycqfVB
 a22368aSU6u3H+QpFOnIaaNqIB6JMU76a/dvu/ZeeGb6i4KFzpAfEZuFU
 T1XgChENqMoZfLNCL7KTV+anYu2UdaYPINtPOwmYbWIXqgRzteGgvV9Ev
 1U6UZt3GKhI5PO3cCLZr5m+nqiAnzD8RjsU/KhekXRGGw7XrT36K8/IaI
 +PLt55G8NzaT4xIOnkcLgelnEokdtZ0T99aEjW7KE45xe+smU0reInJ4R A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="440549070"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; d="scan'208";a="440549070"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2023 04:55:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="810882573"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; d="scan'208";a="810882573"
Received: from bagbokpo-mobl1.ger.corp.intel.com (HELO
 vgovind2-mobl3.intel.com) ([10.251.215.150])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2023 04:55:44 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  4 Sep 2023 14:55:15 +0300
Message-Id: <20230904115517.458662-1-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 0/2] fbc on any planes
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
Cc: matthew.d.roper@intel.com, intel-gfx@lists.freedesktop.org,
 ville.syrjala@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

FBC can be supported in first three planes in lnl

Vinod Govindapillai (2):
  drm/i915/lnl: possibility to enable FBC on first three planes
  drm/i915/lnl: FBC is supported with per pixel alpha

 drivers/gpu/drm/i915/display/intel_fbc.c           | 6 +++++-
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 9 ++++++---
 drivers/gpu/drm/i915/i915_reg.h                    | 2 ++
 3 files changed, 13 insertions(+), 4 deletions(-)

-- 
2.34.1

