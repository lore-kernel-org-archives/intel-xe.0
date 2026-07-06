Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64AF7C43602
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 11:59:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25F2110E908;
	Mon,  6 Jul 2026 11:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MVyRNGr4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A5A10E908;
 Mon,  6 Jul 2026 11:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783339187; x=1814875187;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GDpVzpk6hFfVqOrzm0joknxX9s6hjeFAITWGLrS49WM=;
 b=MVyRNGr43KNpZtV+5dS/YpZ01aaIlKXJivpfOueabQO0ALkZGPuRnZbH
 07f3E8H3/UVwHnDzvS1K/XoR9XhIvLNVAZWoYGRjDVv64Va6cMfB+bVDv
 RY6nWvWFcX5Q4vbklsMObWh3YgH6FSntgPvxRxF3SDvAHCEpmpAWiAGPc
 wdq48IVXpSIEICZpoppEP1oK6ceufHO+VGTv2DBH5owYLhVwuIzPtuAfw
 A/ZYuh/do1TOYNleiE3LdXM5v/ndD9i5mWv5wDKDkGpLkqPJN/e1KGS7T
 BcpMiQjkL8V0gz/uj11jbSD++p50U3ooDCiY3pT2o8GDeSRvUNYDoF1zT A==;
X-CSE-ConnectionGUID: e1Z4puDHRSiercWowpU4FA==
X-CSE-MsgGUID: lgWNfp7ARd6JlKto9ff6XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="95481106"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="95481106"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 04:59:47 -0700
X-CSE-ConnectionGUID: jtuqYc+/RLewnot7WaTUSg==
X-CSE-MsgGUID: ndFhQIWpQCejvcXOKMRwRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="253797488"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa007.jf.intel.com with ESMTP; 06 Jul 2026 04:59:46 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 0/6] Enable joiner cursor fast updates
Date: Mon,  6 Jul 2026 17:26:23 +0530
Message-Id: <20260706115629.2984258-1-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
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

    This series enables the cursor fast path for joiner mode
and adds the missing secondary-plane handling to keep updates
correct and synchronized.

Nemesa Garg (6):
  drm/i915/cursor: Check joiner cursor commit status
  drm/i915/cursor: Add helper to update cursor plane
  drm/i915/cursor: Handle secondary cursor state
  drm/i915/cursor: Program secondary cursor planes
  drm/i915/cursor: Schedule cursor unpin per joined pipe
  drm/i915/cursor: Allow joiner cursor fast path update

 drivers/gpu/drm/i915/display/intel_cursor.c | 274 +++++++++++++++-----
 1 file changed, 204 insertions(+), 70 deletions(-)

-- 
2.25.1

