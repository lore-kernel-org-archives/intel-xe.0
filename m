Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB850C44501
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 07:57:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CF6C10E2B4;
	Thu, 16 Jul 2026 07:57:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j0v3tAlV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC68510E2B4
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 07:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784188635; x=1815724635;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=watm7KZvQ68Ds7Pba/SaaTdd44bDlUyqba6sulM3EtU=;
 b=j0v3tAlVwAkYz+AueR8556/McELmZ8xt5lLRDBG1+RQXcrmAxsk+GQNs
 HE+qfx7lIzsUCujSyvCQc9iciIjib8dXJCP5bOCpj2qjtOG5f7xKoffxk
 CwaxlhSWZtOZZ8AR9GWzchN+9qebVlGw+PfmL/Kpbfh7FAVCNoeJvyRYs
 Lr/I8IP/B9qdm+78bN0enanOw3VW2z0zPcuN1Lfz+t2A96ExkLaiwk+Mc
 CXw/TJOYvl6fzuq211q39eKx2+4Wbff4AKZs6iae3y/ryFaBJq9Sr8+As
 5aiyt2ccAB1OrPnb8i5wwMF5/balWAomkOhjR9lNRzUo51lYwdLF3ckQK A==;
X-CSE-ConnectionGUID: 6293LEhYQDSyzGa1xXUVVQ==
X-CSE-MsgGUID: Xen9slm3Tdy2OIyKMP8K3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84800885"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="84800885"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 00:57:15 -0700
X-CSE-ConnectionGUID: 1Ls//PeETym2nT0J6GtaKg==
X-CSE-MsgGUID: 8OkSRa6VTs+dehW06/3G+Q==
X-ExtLoop1: 1
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 00:57:11 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v9 0/2] Add error handling for uncorrectable soc-internal
 errors
Date: Thu, 16 Jul 2026 13:27:02 +0530
Message-ID: <20260716075701.2194254-4-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
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

This series adds support for handling uncorrectable soc-internal errors
and is a split from [1] for CI

Most of the uncorrectable SoC internal errors are recovered using a
Secondary Bus Reset (SBR) apart from CSC firmware and Punit errors.
CSC firmware errors requires a firmware flash to be recovered and 
Punit error requires cold-reset which is handled by [2].

[1] https://lore.kernel.org/intel-xe/20260608084700.640376-17-riana.tauro@intel.com/
[2] https://lore.kernel.org/intel-xe/20260713083939.251872-6-mallesh.koujalagi@intel.com/

Riana Tauro (2):
  drm/xe/xe_survivability: Decouple survivability info from boot
    survivability
  drm/xe/xe_ras: Handle uncorrectable SoC Internal errors

 drivers/gpu/drm/xe/xe_ras.c                | 45 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras_types.h          | 50 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_survivability_mode.c | 13 +++++-
 3 files changed, 106 insertions(+), 2 deletions(-)

-- 
2.47.1

