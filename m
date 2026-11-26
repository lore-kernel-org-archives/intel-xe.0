Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD84A606A32D
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 18:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Af/QNB52
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6E510EA0E;
	Thu, 26 Nov 2026 18:09:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7EB810EA03;
 Thu, 26 Nov 2026 18:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795716412; x=1827252412;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZqEub2tipw75WqzRAHlRaTRY6h/7+95vWwaeNNxb3uc=;
 b=Af/QNB52JWr3VhE4hn1+HOYCwkM3uyPOCdXaaPXZQZwX0n5aWMwfXCfg
 QZnCuN+AgfC3KfFVGKwQbCr4a6eBwdYZv6JeYqzpfzMf+FSlc07uRj72m
 F1vNQyLUpBJBIhPSUyaP2n2gZRYZ4bkyph3seJAl/K4TY9E9/QJw4DA1o
 RCcXYtm4TMzSGK6zq74GgiKtfJaEorhVMQ2YZ9DYEkygkLaYObo16jxVr
 3I58VAXWS9cJE9xlLrNgNw1R0xWL4F6oQOIFcuVa0QDVs3yw6ROidppqS
 xXKP6pe+1DsALHW+sAZ2WZgSFDb2ufN6EYsVFLnHzjDShCGeOHrziSC/h A==;
X-CSE-ConnectionGUID: tkqK9bzpSQCgodqbOjqbyA==
X-CSE-MsgGUID: kV2CiR5cSFyQqUf8/+QJCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4702452"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4702452"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 10:06:52 -0800
X-CSE-ConnectionGUID: 57wBBqGJRe6c/X4Rse3NaQ==
X-CSE-MsgGUID: Uj4NGzhRQhGV1XXiQv4ygQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12454542"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 10:06:49 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH v1 0/4] drm/i915: vbt/modparams-related cleanups
Date: Thu, 26 Nov 2026 19:06:10 +0100
Message-ID: <20261126180614.224327-1-michal.grzelak@linux.intel.com>
X-Mailer: git-send-email 2.45.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Michał Grzelak (4):
  drm/i915/display: remove edp_vswing modparam
  drm/i915/display: s/vbt_firmware/i915_vbt/
  drm/i915/bios: s/parse_ddi_ports/parse_each_ddi_port/
  drm/i915/bios: s/init_bdb_blocks/init_each_bdb_block/

 drivers/gpu/drm/i915/display/intel_bios.c     | 22 +++++++------------
 .../drm/i915/display/intel_display_params.c   |  8 +------
 .../drm/i915/display/intel_display_params.h   |  3 +--
 3 files changed, 10 insertions(+), 23 deletions(-)

-- 
2.45.2

