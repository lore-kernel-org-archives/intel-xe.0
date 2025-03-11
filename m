Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC21C282EC
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 13:57:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8346F10E1E1;
	Tue, 11 Mar 2025 13:57:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l5OuQTdo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B522F10E1E1
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Mar 2025 13:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741701457; x=1773237457;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GYAdOMPOaLgd+u2ip1VjZvStzUCzeRkWHKN8m0+Rgcc=;
 b=l5OuQTdoJSWdHjzNHlPIBPAhZtGZva5Sk2FWTdxFsgYab26icjP/wzim
 YBhGna6UzSE16Jp8PJjKGf1muz4ZuKLpBnNevb8Lq0BChFsPBgOfnPhOE
 NK70VBk5V6bvzTcld8N+05ccNtfUomxP9KuoDMhEfJBW8EvQEbMRxIW16
 HCjqrgFsdf94I+dVnhQ/uAfsbSdm9h+VA6b+5BNtbM7vSjc84LDrIX1Ia
 kcw4Ham2YLWH8U3CV52U5MiANGNB3N6oC6op8Bow3hJ6i7blI2zg58KWU
 wJcFliMrKbZ/nOfCX3BNco44faBvZOvUPREhaUIl740x9FaZIZMYk3105 A==;
X-CSE-ConnectionGUID: d7Oc/k7KT0uMAxkh5ZN/fA==
X-CSE-MsgGUID: r4QdvnLNSz+EN1GMm0t1iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="54122568"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="54122568"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 06:57:37 -0700
X-CSE-ConnectionGUID: 8ZNtwg+eTkiGIHTl5PfVcQ==
X-CSE-MsgGUID: KsoLcmR0Tvq5OVmOwPF76Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="121034394"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.5.201])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 06:57:36 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/2] VF: Catch all unexpected registers accesses
Date: Tue, 11 Mar 2025 14:57:24 +0100
Message-Id: <20250311135726.1998-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

Michal Wajdeczko (2):
  drm/xe/vf: Don't try Driver-FLR if VF
  drm/xe/vf: Catch all unexpected register reads

 drivers/gpu/drm/xe/xe_device.c | 14 ++++++++++----
 drivers/gpu/drm/xe/xe_mmio.c   | 10 ++++++----
 2 files changed, 16 insertions(+), 8 deletions(-)

-- 
2.47.1

