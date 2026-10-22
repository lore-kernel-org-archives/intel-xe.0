Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D1E606A319
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 11:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lNZhDwB0
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52F8A1124FF;
	Thu, 22 Oct 2026 11:56:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ABB31124F7;
 Thu, 22 Oct 2026 11:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792670154; x=1824206154;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h/JWciE/zqOawMBc4eu8WWLPnO2WMTYl5jgLGWINQfw=;
 b=lNZhDwB0/Kx+3uZPF0oPqNIPh9KeVR83ujOMuYGdFSJNIT0jdGGnU/5o
 Km6SuCd5kelRVUy1TuS9ptiwNLYrdaU1LxuLY1URpHAGSr9ot9uwcws/U
 ny8VhpT5TQ/70kOKmy+Gzti/WuZHWiRw2+jfvNLIl/nSDxfR13fPwOPPs
 WJWRmQ2T+aoMd2XwEs5JATMf2fd8wte5nHF9OtALCnYDNdZrqCFGLBnva
 YLkjSE2KcToT8ZmQA6OAyPL2FAbDFBl4L9D88DBbLoUP0qaUufWvMlJ8G
 /rdn9rF4t9PHOdMVNC/kNFq3juPtecI6JmgyJhXDZbuWIBaVR52GEtFQS Q==;
X-CSE-ConnectionGUID: CxHBJ8s3RwWBmAhC2ltztg==
X-CSE-MsgGUID: GbrIf+9FR5OmpF/BTR6Hkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1520050"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1520050"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 04:55:53 -0700
X-CSE-ConnectionGUID: kchFZ5gzS8OlaR5l/naZ4Q==
X-CSE-MsgGUID: c1cK8P+8RZe0gA3qwpVCLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3351452"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.245])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 04:55:52 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/4] drm/i915: Optimize registers accesses in irq handlers
Date: Thu, 22 Oct 2026 14:55:44 +0300
Message-ID: <20261022115548.32678-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
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

MMIO is incredible expensive on some of our platforms (especially
the new ones). Switch to the cheaper _fw() register accessors
in irq handlers to avoid adding a lot more costly FPGA_DBG MMIO
reads to them when I (eventually) hoist the unclaimed register
detection to the display code (and thus bring it over to xe
as well).

ILK-HSW are still left with the more costly variants. I'm thinking
I might try to convert them as well at some point, but that'll
need some extra testing (especially on IVB/HSW which might
suffer from some system hangs from parallel MMIO accesses to the
same cacheline). MMIO isn't super expnsive on those platforms
so might not matter too much. SNB/IVB are epscially cheap with
~70 ns for both reads and writes. ILK and HSW are bit more
expensive in the 100-200 ns range.

Ville Syrjälä (4):
  drm/i915: Use intel_de_read64_2x32_volatile_fw() for
    IVB_TIMESTAMP_CTR+PIPE_FRMTMSTMP query
  drm/i915: Use intel_de_{read,write})fw() in BDW+ irq handlers
  drm/i915: Use intel_de_{read,write})fw() in VLV/CHV irq handlers
  drm/i915: Skip redundant frame/scanline/time reads for async flips

 drivers/gpu/drm/i915/display/intel_crtc.c     | 10 +-
 .../gpu/drm/i915/display/intel_display_irq.c  | 94 +++++++++----------
 drivers/gpu/drm/i915/display/intel_dmc.c      |  6 +-
 .../gpu/drm/i915/display/intel_hotplug_irq.c  | 26 ++---
 drivers/gpu/drm/i915/display/intel_vblank.c   | 34 +++----
 5 files changed, 81 insertions(+), 89 deletions(-)

-- 
2.55.0

