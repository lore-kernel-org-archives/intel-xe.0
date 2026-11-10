Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BE5606A325
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 11:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dCniZXBd
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED8B10F4C8;
	Tue, 10 Nov 2026 11:56:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E72A10F4C8;
 Tue, 10 Nov 2026 11:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794311773; x=1825847773;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E9ZwEO3MGQWmNoGhjXm7+UeE0nIJiRJsIGpJxb1o3Z8=;
 b=dCniZXBdqjWfKVyNrB4NZ1e03CzmT7Rr2ipyujBBCXsXWlLx7XJ8zuUW
 SJl3UzKCvvN6Qda4k1bWGB6JBVSMTNys2xP9qplsSGiemIuc+1lxR2wm6
 aYOzGm/N/C+UU1CsyDz4yBdqNwmx5Xra7XoKa7YKKoI1X574hyZ5qJ4qX
 K6GnHznNnTTe1nKMcilZIMgcVYTKiKw+mSF+QlITos4i4ay1Sp8XPps2B
 582AvP2REbqgObFOX5E4+2dZC9h2+TadMNf7MX6dQ2QuWaQ2wIxeHw+zF
 W6wNgIBmCZ0YWJFfPcfPLhIlWbh6LJmPNgOk9HG/BKLjn4LwPH+Txppe5 A==;
X-CSE-ConnectionGUID: bqRHhiu8RCyWWeN8b8DIEA==
X-CSE-MsgGUID: 1ZHKVL+JQmqdDyPRyzbTqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3055633"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3055633"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 03:56:12 -0800
X-CSE-ConnectionGUID: 5JY0IXJDTvGxMaaLAXz71w==
X-CSE-MsgGUID: /kkEv/tPSyWz+EFxkmTUfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8004335"
Received: from shawnle1-z890-eagle-wifi7.itwn.intel.com ([10.225.64.208])
 by orviesa005.jf.intel.com with ESMTP; 10 Nov 2026 03:56:11 -0800
From: Lee Shawn C <shawn.c.lee@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH 0/4] drm/i915/dp: Use the VBT eDP fast link training params
Date: Tue, 10 Nov 2026 11:54:28 +0000
Message-ID: <20261110115432.894616-1-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The VBT provides per-panel eDP fast link training params, which the
driver parses but doesn't use. Use them when fast link training is
enabled in the VBT:

- Patch 1-2: parse the params only if the enable bit is set.
- Patch 3: start link training from the VBT vswing/pre-emphasis levels.
- Patch 4: use the VBT link rate and lane count.

The existing AUX handshake based link training sequence is kept; link
training without AUX handshake is not implemented.

Lee Shawn C (4):
  drm/i915/bios: Split out parsing the eDP fast link training params
  drm/i915/bios: Parse eDP fast link training params only if enabled
  drm/i915/dp: Start eDP link training from VBT fast link train
    vswing/pre-emphasis levels
  drm/i915/dp: Use the VBT fast link training link config for eDP

 drivers/gpu/drm/i915/display/intel_bios.c     | 85 ++++++++++++++-----
 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 58 +++++++++++++
 .../drm/i915/display/intel_dp_link_training.c | 76 +++++++++++++++++
 4 files changed, 197 insertions(+), 23 deletions(-)

-- 
2.53.0

