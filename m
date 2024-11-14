Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910AFD6A224
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 18:00:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F52E10E023;
	Thu, 14 Nov 2024 18:00:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SjMTKieR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D749210E023
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 18:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731607213; x=1763143213;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pjAMnn1lK7jOBcCWpcFu5yv9h/+ZBLCucucUe7VwGVY=;
 b=SjMTKieR6iyc7D9L4csCvp9C3nflm71of5N9+J35uYWneuU08gx4HWXz
 w8mHx8QVrVB1y7XSq6PVlLLD/V/pHsD5aAiAPDLWuFBAFrT3MpZYWly5g
 Qrskjnc4ETAbbVP9PUG5yqBGdjaEQcL2Y334jSuOIf77TNQShr47q5eTj
 D6ta+1TqHJ9HnE7baDop/esPAVc8JSQT+oQ3EVDVxX3pcydjJjHyuTBm5
 3bW8VlgYQBGaNcrAypN3vYKjcxjXpPJGZUN2ZVy6QuArkYgtCsWVJRNZB
 cybygV/0C8IeNct5IY4xRln0IDm1sHh+mk/WOPk2WYWn4yZ24PbdugdQh w==;
X-CSE-ConnectionGUID: d2vSszvfQueZ2rKP/Xg4FQ==
X-CSE-MsgGUID: TQe+dZxZQg6/XsxKAJ/TXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="35290761"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="35290761"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 10:00:12 -0800
X-CSE-ConnectionGUID: rTUinO3/QCahrYLFW7A9tQ==
X-CSE-MsgGUID: ocyvQ4c1SJarrNQ8tt3wTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="119224711"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.98.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 10:00:11 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/2] VF: Fix early read of GDMID
Date: Thu, 14 Nov 2024 18:59:53 +0100
Message-Id: <20241114175955.2299-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

It was broken due to recent refactoring of the MMIO code and was
not noticed till now.

Michal Wajdeczko (2):
  drm/xe: Always setup GT MMIO adjustment data
  drm/xe/vf: Perform early GT MMIO initialization to read GMDID

 drivers/gpu/drm/xe/xe_gt.c  | 3 +++
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 2 files changed, 4 insertions(+)

-- 
2.43.0

