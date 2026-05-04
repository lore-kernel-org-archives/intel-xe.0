Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BEECD342C
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 10:11:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F45010E5CF;
	Mon,  4 May 2026 10:11:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dFOmZnGs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1A0F10E200;
 Mon,  4 May 2026 10:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777889487; x=1809425487;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G75fVvkIrtp9sS6FOeKTFyKdKMUa8H0PHfuVJwLP9OE=;
 b=dFOmZnGsVmFUq3xOZmxdVFsj3xqnxhNjNehMfEX1JK1789BG52xsMXXj
 gBuq4Nl4SpdG8YAGNhAWfpZsChV+nuoDZTtAMgkqx03YVDglDUANa42FF
 iZ3oJO7DLMbzNecuS6i3opQmBK9INSTMguObgIbvCFxlyIk7M+bKtgBXX
 5dpeYUVuAEuEI6QZpX4gjt6cBRRdqodb9DfRXeuBMytmWdiGygnJaIoYx
 3EktQz/N3tTpLArqcBDQ/VX6PUzxlGXpCrDmtqcJ6hJ5eyG+lP916oO+a
 AzmYkYHRDBqsjbApS9/e0a0euyspF1Gc0KzIUkgZ3mxNIg05lRqhK5o0f w==;
X-CSE-ConnectionGUID: 2Xmdcqd/R8ipZHwKYgS4FQ==
X-CSE-MsgGUID: OJoQ92EYTx2fGjvWtXn/iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="82356832"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="82356832"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 03:11:27 -0700
X-CSE-ConnectionGUID: qUx/rCauR9S+adJAbx2nJw==
X-CSE-MsgGUID: D2FuOQWFS/G8p0rMwv0h2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="232327132"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa007.fm.intel.com with ESMTP; 04 May 2026 03:11:25 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, fnu.vishwanatha@intel.com,
 santhosh.reddy.guddati@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2 0/2] Fix MST VCPI lookup and modeset-lock splat
Date: Mon,  4 May 2026 15:41:16 +0530
Message-Id: <20260504101117.3619984-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
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

intel_conn_to_vcpi() is called from the HDCP enable path in commit_tail
to look
up the VCPI of the MST stream that HDCP is being enabled on. Today it
reads the
topology state directly from mgr->base.state and takes mgr->base.lock
with the
in-flight state->base.acquire_ctx.

This breaks in two ways on MST + HDCP, especially when an
ALLOCATE_PAYLOAD
transaction is being driven on the mgr just before HDCP enable runs:

- mgr->base.state's payload list is being mutated in place by the MST
  payload code, so drm_atomic_get_mst_payload_state() can fail to find
  the entry for this connector's port. That trips drm_WARN_ON(!payload)
  and HDCP ends up programmed with VCPI 0.

- By the time we reach commit_tail/encoder enable,
  state->base.acquire_ctx
  is no longer valid for acquiring new modeset locks. Taking
  mgr->base.lock here produces a modeset-lock splat.

This series fixes both.

Suraj Kandpal (2):
  drm/i915/hdcp: Use new MST topology state in intel_conn_to_vcpi()
  drm/i915/hdcp: Drop mgr->base.lock acquisition in intel_conn_to_vcpi()

 drivers/gpu/drm/i915/display/intel_hdcp.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

-- 
2.34.1

