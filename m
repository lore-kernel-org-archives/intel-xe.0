Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E15606A31E
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 22:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fSISVQQf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9023A10EC87;
	Mon, 23 Nov 2026 22:51:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B4710E811;
 Mon, 23 Nov 2026 22:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795474305; x=1827010305;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=V81g2nDET8Gvx4Nu4xfP5YyM9mCKcUm0sfUgx2Gbtx0=;
 b=fSISVQQfAFQkmoB1rOuyjLbadigjU9w+/O67EEBU/vnvbLTLZAsMUQvl
 V4xQoXCMkfagv1xsFmT3ZseEUOAXlx0n3xMBb/Wwd2KVrufrFsmtXzaN8
 YDWhfx/PZEZBLC535PFj8Pge3x8J35m9C/f2g/alIMWhLog4y7s4SUQeK
 SUnwsi9jkX2sZhL9liH9xo7bDyuVP0J3bXsy4+ROWR4c0KcV52trEjHR7
 1vtbprUZ2fWMf72T75F19dmn6qoZPtlGwWJOku3JjRcwCFp+H5Wn9rUOt
 Mv+pfLGY30jV+aZpKcuuQFfj/9/oaxoCz2QWJHgzgiAh2eaZOOziUDlq1 w==;
X-CSE-ConnectionGUID: wgdIdIx7RaK5x1hBi0OH6A==
X-CSE-MsgGUID: xdhzULCaQIanJQidm9LGew==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4172959"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4172959"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 14:51:44 -0800
X-CSE-ConnectionGUID: oHTRF5FhQCuIfX/xPkgnCw==
X-CSE-MsgGUID: NNAhyuiEQwWIYhMhOzl5qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; d="scan'208";a="13400316"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.100])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 14:51:43 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/9] drm/i915: Eliminate foo_state->state pointer usage
Date: Tue, 24 Nov 2026 00:51:30 +0200
Message-ID: <20261123225139.23087-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The foo_state->state pointer is dangerous. Stop using it
as much as possible. I think we're down to one use after
this, but eliminating that one requires drm subsystem wide
changes.

Ville Syrjälä (9):
  drm/i915/ddi: Pass the atomic state to
    intel_ddi_port_sync_transcoders()
  drm/i915/mst: Pass the full atomic state to
    intel_dp_mtp_tu_compute_config()
  drm/i915/hdmi: Pass the full atomic state to intel_hdmi_bpc_possible()
  drm/i915/fdi: Pass the full atomic state to ilk_check_fdi_lanes()
  drm/i915/hdcp: Pass the full atomic state to intel_hdcp_atomic_check()
  drm/i915/global_state: Pass the full atomic state into
    intel_atomic_{lock,serialize}_global_state()
  drm/i915/global_state: Store the display in the global object and use
    it
  drm/i915/global_state: Remove the obj_state->state footgun
  drm/i915/sdvo: Add a FIXME about the connector_state->state footgun

 drivers/gpu/drm/i915/display/g4x_hdmi.c       |   2 +-
 drivers/gpu/drm/i915/display/intel_atomic.c   |   2 +-
 drivers/gpu/drm/i915/display/intel_bw.c       |  25 ++--
 drivers/gpu/drm/i915/display/intel_cdclk.c    |  18 +--
 drivers/gpu/drm/i915/display/intel_dbuf_bw.c  |   2 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      |   9 +-
 drivers/gpu/drm/i915/display/intel_dp.c       | 109 +++++++++++-------
 drivers/gpu/drm/i915/display/intel_dp.h       |   6 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  63 +++++-----
 drivers/gpu/drm/i915/display/intel_dp_mst.h   |   3 +-
 drivers/gpu/drm/i915/display/intel_fdi.c      |  22 ++--
 .../gpu/drm/i915/display/intel_global_state.c |  14 +--
 .../gpu/drm/i915/display/intel_global_state.h |   8 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c     |   6 +-
 drivers/gpu/drm/i915/display/intel_hdcp.h     |   4 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  56 +++++----
 drivers/gpu/drm/i915/display/intel_hdmi.h     |   7 +-
 drivers/gpu/drm/i915/display/intel_pmdemand.c |   4 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c     |   4 +
 drivers/gpu/drm/i915/display/skl_watermark.c  |  16 +--
 20 files changed, 218 insertions(+), 162 deletions(-)

-- 
2.56.1

