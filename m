Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1BB606A334
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 08:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iN7aj3iC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E393310E55B;
	Mon, 16 Nov 2026 08:11:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AD5D10E3CD;
 Mon, 16 Nov 2026 08:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794816669; x=1826352669;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YJfUV7klD2uoavNMaRb+bzTSbxxID3deva/BnmtO9KY=;
 b=iN7aj3iCZH7aTGOSrB+QhaeE9tw21zPhiPI187p9gkZnaqobgAbMZ8a4
 ubnq2R1YhMpLleSIfvmgXOljcsXE2mV2ewJAJWfARvUztOOPerXVgweEC
 cxbpKQcj9pD8mh36uYs6Bpn9FRaskwq3wRHXE/heFUDYE4J7YaNFw6d8f
 p8nuBbgMFuWX4xFQDOy3T+C6eweekkYMY0AZ6LpObVuP/6TLUSyk2wOgR
 1rk+oBRV6ofrioxzPddEI4ZFUAhqXATowjGZ/FYAFuqFpkgLMvD5WfQx6
 GSDZ+Wa84wY3bWbOswd03LLoSEHH2A3mR81Qej8jLL8RbhOQdb3ww4EQm g==;
X-CSE-ConnectionGUID: XxhN5w14QcSk5ocdploh8A==
X-CSE-MsgGUID: xKo/iSBYQH6hjw5+Y7jPDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3553550"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3553550"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 00:10:47 -0800
X-CSE-ConnectionGUID: UUhz53rbTvG6fbxSmV7ICw==
X-CSE-MsgGUID: R/8vQPIvRKObNy0CYzcJVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9557686"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.93])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 00:10:46 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/7] drm/i915/dsb: Optimize indexed register writes
Date: Mon, 16 Nov 2026 10:10:34 +0200
Message-ID: <20261116081041.6519-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Optimize the indexed register write handling.

This speeds up the DSB buffer preparation stage quite a bit
for LUT updates on my DG2. Didn't measure BMG or any of the
iGPU platforms.

Ville Syrjälä (7):
  drm/i915/dsb: Remove old comment about stale contents of the DSB
    buffer
  drm/i915/dsb: Eliminate intel_dsb_prev_ins_is_write()
  drm/i915/dsb: Carve up intel_dsb_prev_ins_is_indexed_write()
  drm/i915/dsb: Extract intel_dsb_set_ins()
  drm/i915/dsb: Update previous instruction tracking in
    intel_dsb_align_tail() & co.
  drm/i915/dsb: Skip redundant zeroing of every second indexed write DW
  drm/i915/dsb: Avoid redundant writes to the DSB buffer for indexed
    register writes

 drivers/gpu/drm/i915/display/intel_dsb.c | 107 +++++++++++++----------
 1 file changed, 59 insertions(+), 48 deletions(-)

-- 
2.56.0

