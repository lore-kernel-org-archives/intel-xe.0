Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65607FF8875
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 03:29:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A5D10F1EA;
	Thu, 30 Apr 2026 03:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AVwQ+0bX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C6210F1EA;
 Thu, 30 Apr 2026 03:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777519749; x=1809055749;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a4oeWuCJUd2YltEyT7dE2TppyO4Mbmhge1qPIZzk+Lo=;
 b=AVwQ+0bXS9xlayiC3qL9xn4NlLgvKlyye/JEM4mjckSY0OUMMWw7jrCC
 8U2TFvWcgYMXwCbWupkOhBLMcrMZ4AXwon40k2PGWpIHZEFkVKAXkm+aA
 oy3kHdmcmn54pu8OclocEr7ngqBDheoj0yHbiKb7VcgKSUAFz8lYcwm8i
 ffao9QYIH+Wcd6an3mYYhBum50U2hGK4wfgijkNAEenwvVxBKpQsXqLTL
 mUbwYY5szFlhCOQU8qQgBGgpRpHW7jnGwAm2MUoc+c3t5u8aaT7I582md
 0Jnjow1dkSEWyVXQ4IEzMnB6qulL0uLvqRAz53ipYKxOi8n0CqTg4LiZe w==;
X-CSE-ConnectionGUID: /xUSFtVTTD+pa9iMQN+N4g==
X-CSE-MsgGUID: 3N0xhTegSIalq8ki2TZNFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="65993082"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="65993082"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 20:29:08 -0700
X-CSE-ConnectionGUID: rer0MSY+RciX4UnW3yCa7w==
X-CSE-MsgGUID: RBPfW1lVSBesPVtuNhSzsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="238431552"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa003.jf.intel.com with ESMTP; 29 Apr 2026 20:29:07 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, fnu.vishwanatha@intel.com,
 santhosh.reddy.guddati@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Fix MST VCPI lookup and modeset-lock splat
Date: Thu, 30 Apr 2026 08:59:00 +0530
Message-Id: <20260430032902.3409731-1-suraj.kandpal@intel.com>
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
  drm/915/hdcp: Use new MST topology state in intel_conn_to_vcpi()
  drm/i915/hdcp: Drop mgr->base.lock acquisition in intel_conn_to_vcpi()

 drivers/gpu/drm/i915/display/intel_hdcp.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

-- 
2.34.1

