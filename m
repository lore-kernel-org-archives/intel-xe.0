Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547B0C5B572
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 17:58:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C601110E34F;
	Tue, 11 Aug 2026 17:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b4bD71x8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30EC610E34F;
 Tue, 11 Aug 2026 17:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786471131; x=1818007131;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BRVFgibiEbyMHfJnL9AJ72DYGkdGbKHeGebF1FcdxeY=;
 b=b4bD71x8/DJVoM474koUQiLEyb57GpJCZyXd62SMFixvPkUxiZgrT4YA
 MuQEhsDCl5Uf58G1H/knLJOgkEZH+7oeMiaKk/6mASKCfymgDtQ8KgSPB
 NseqfIP1GSOFjl+K0Z1QObjJM4blosInQ+96PbtMOn3/1AnQfDKIKF1gs
 I9L/CTfYa5hWi3p8R4qoMY97rIRgUUt+gIYWQwyrwD5IcZPxSBiZ3wJQc
 UsSBmbwyQCtg8AoTsRm/bSlRUTstXkU0aJqEERRb9VuLyKR6RxqoXxjDB
 5oeAK/8Syd8moKs/cVtnmLdu+9jciEr7Kp6cnYDDxKq5iX0dPrxMhlh9h Q==;
X-CSE-ConnectionGUID: edvCilsTTTG2Dd4uxuEQYQ==
X-CSE-MsgGUID: OKsP0dp5RyWjzwCokgDZJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="86941285"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="86941285"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 10:58:50 -0700
X-CSE-ConnectionGUID: a5VnJQpoQqq5DBRbMcEMVQ==
X-CSE-MsgGUID: /5vuFsPIQZaSLicJnxUvgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="260083587"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa007.fm.intel.com with ESMTP; 11 Aug 2026 10:58:48 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2 0/3] Fix value being written to DDI_CLK_VALFREQ
Date: Tue, 11 Aug 2026 23:28:41 +0530
Message-Id: <20260811175844.2613721-1-suraj.kandpal@intel.com>
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

Currently we write the portclock as is into DDI_CLK_VALFREQ register.
Which is fine for HDMI TMDS and DP 8b/10b encoding but for DP
128b/132b and HDMI FRL port clock needs to be modified to the
appropriate symbol clock and then be written into this register.
H/w has not thrown a bug yet because this is a validation register
and has no functional impact on H/w.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

Suraj Kandpal (3):
  drm/i915/ddi: add helper to compute DDI clock frequency
  drm/i915/cx0: program DDI_CLK_VALFREQ with DDI clock frequency
  drm/i915/lt_phy: program DDI_CLK_VALFREQ with DDI clock frequency

 drivers/gpu/drm/i915/display/intel_cx0_phy.c |  5 +++--
 drivers/gpu/drm/i915/display/intel_ddi.c     | 11 +++++++++++
 drivers/gpu/drm/i915/display/intel_ddi.h     |  1 +
 drivers/gpu/drm/i915/display/intel_lt_phy.c  |  6 ++++--
 4 files changed, 19 insertions(+), 4 deletions(-)

-- 
2.34.1

