Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A13C5DF9C
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 18:43:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526D110E818;
	Mon, 24 Aug 2026 18:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NeHxnd1g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E650110E818
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 18:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787596983; x=1819132983;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8pHnZT/JD/aNpPdVJWvuAQoWw69y2Pn6iMfQ+WvVios=;
 b=NeHxnd1grwDQ7vZtNYTxVImyawZJfCF37XIPSJ++UPTcFczH0Si3b6Tv
 Nvvq02axHNkBiVgfKk3A9gyYVQqzF/rPrBHJOJuXWmXezFlQ1N6se15rc
 PFhXPkSM4qOw5v2NC6yfMe04IV2wuBIGQu4qHnlc1qA0fpXLeY4lZI8cR
 d3UbExeDQKBLFS7vOh5KACJtWfNHqgm3xUlHq0GgT5o1xkLltOXMfMKmd
 e9j44v6r7H9tWNl9m2ySAWxKOcPnxoJWAQ42YSMa+FLBbnNcGZMunzUCs
 XwJtT07QZYF6Mpf8Qd6vHpoVpW3Wna5ZcUDdaG9NrRcUf9EsCxfQ9yhA5 Q==;
X-CSE-ConnectionGUID: 2utA76qFRtu80m8WJSEfKQ==
X-CSE-MsgGUID: xncmZmObTjufyIHLJMa1lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="110841004"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="110841004"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 11:43:03 -0700
X-CSE-ConnectionGUID: msQbKwk7QgOTYp8kSzmNzQ==
X-CSE-MsgGUID: 9k17P0IqTwO/O+nN99esRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="262776588"
Received: from unknown (HELO sinjan-Super-Server.iind.intel.com)
 ([10.190.239.39])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 11:42:59 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH 0/3] drm/xe/hwmon: Update hwmon thermal mailbox handling
Date: Tue, 25 Aug 2026 00:11:34 +0530
Message-Id: <20260824184137.2164727-5-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260824184137.2164727-1-karthik.poosa@intel.com>
References: <20260824184137.2164727-1-karthik.poosa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This series adds CRI-specific temperature sensor handling to the Xe
hwmon implementation.
 
CRI platforms may report unavailable temperature sensors and support
a variable number of VRAM temperature channels depending on platform
configuration. This series adds the required sensor presence checks and
uses platform-reported thermal configuration data to expose only valid
temperature-related hwmon attributes.
 
The series also corrects the telemetry group selection used for memory
controller temperature reporting.

Karthik Poosa (3):
  drm/xe/hwmon: Detect unavailable temperature sensors
  drm/xe/hwmon: Use VRAM temperature sensor count from thermal config on
    CRI
  drm/xe/hwmon: Correct group selection for memory controller
    temperature

 drivers/gpu/drm/xe/xe_hwmon.c     | 116 +++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_pcode_api.h |   1 +
 2 files changed, 98 insertions(+), 19 deletions(-)

-- 
2.25.1

