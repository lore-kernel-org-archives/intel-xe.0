Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D36606A321
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 11:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LLF9Iocn
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C39D910FBD4;
	Wed, 25 Nov 2026 11:46:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D794F10FBB8;
 Wed, 25 Nov 2026 11:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795607200; x=1827143200;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EtjL3gQubKU6gYdkSgiFslqEhgzN97C5nP3VumqQ3Rw=;
 b=LLF9IocndNmvFWiCojYm4BzL0hsAMIKNu9XRdVYch6A6TX84ZZyAD51i
 +rDHliWstaegfZNsOlpuUuAVuiFjfAyDRfX5IH2Hp1688mYXlEBh5G7cI
 eThp08WNWYCcSS6PPeZd5urK3STanbrIco5u73zunBlLfmeXz7oEr1Bkf
 0mZWYCDquusRz9Gvf/LIrP/EhcHeNlPrcXeR5MRnaVoLI8qx+TXREjp/f
 FMCNBuPokI16Pn5/deIMbbBCeKytoZmExH8l9IP1UOV++aS1Dh7q0/DjW
 D7JxMfkWIBBb3dLa9J6C7ODYTA0DpInWnC2JJ90ZvVynHWr/iCHHt1t8x Q==;
X-CSE-ConnectionGUID: RjOGTRwoSYO09GgzL6Z84w==
X-CSE-MsgGUID: VvF+7RV1Q36Asv4kE+JKCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4341538"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4341538"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 03:46:39 -0800
X-CSE-ConnectionGUID: O+QHSlMgSk+dmHrXkvSPpA==
X-CSE-MsgGUID: PUgJXSZ6T2WxRZNhB9bN2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="13874739"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.40])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 03:46:39 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH v2 0/6] drm/i915: gmbus refactors and str_enable_disable()
 usage
Date: Wed, 25 Nov 2026 13:46:29 +0200
Message-ID: <cover.1795607055.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is a kind of v2 of the series [1] except the patches there are
unchanged. Sashiko noticed another "%sabling" usage had popped up, and
instead of just converting that, I ended up deduplicating it, and then
some.

BR,
Jani.

[1] https://lore.kernel.org/r/20261124141146.1560208-1-jani.nikula@intel.com

Jani Nikula (6):
  drm/i915/gmbus: move debugfs stuff at the end of the file
  drm/i915/gmbus: pass struct i2c_adapter to debugfs functions
  drm/i915/gmbus: remove and open-code intel_gmbus_is_adapter()
  drm/i915/gmbus: deduplicate setting force bit-banging
  drm/i915/display: don't be cute about printing enabling/disabling
  drm/i915/display: use str_enable_disable() more

 drivers/gpu/drm/i915/display/intel_dp_hdcp.c |   4 +-
 drivers/gpu/drm/i915/display/intel_fdi.c     |   3 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c   | 168 +++++++++----------
 drivers/gpu/drm/i915/display/intel_hdmi.c    |   4 +-
 drivers/gpu/drm/i915/display/intel_hotplug.c |   4 +-
 5 files changed, 86 insertions(+), 97 deletions(-)


base-commit: 09315cbb73fb43ffc105b3cadb370886bdf09484
-- 
2.47.3

