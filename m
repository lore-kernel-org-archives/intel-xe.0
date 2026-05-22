Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA1FCD5BB4
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 14:31:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 109A810E22B;
	Fri, 22 May 2026 14:31:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JGR5Y1kn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3279310E22B
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 14:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779460285; x=1810996285;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=feXQaD7BUpTU6nJD6IMrUy+haz4udalczl7PlSIsFFI=;
 b=JGR5Y1knoJLMtoZBhOEhxWInfGbWZP6b2jOyoyaNfv94MHCw6JaByDFN
 kMZLbHq/5tsWOrp3JBB1LFoabJDxTTIPmwVys9UfnmrgWHrxfqeipbUKc
 OmkEOF4pKBuhlqROhn24ZBqe93Yq1dBwywj6PH+PMeDwG8dV5w5ShERZh
 KwG7CeP68XAdoU9oscF5JpNzxkye0ikroazLxMapTbFWkt1FTZjuo4548
 PVDyuYoz5cZwytjPkAXbsk5wvIuc6s9MNc19fLbg3x9xJjNHQjY5zanU2
 KAaKaM/bpeZ/GHKoIabxoxAw3U47VNGbv6v5bRxFCliQJ9b6hmiHvFBk4 Q==;
X-CSE-ConnectionGUID: lMPk8J5cQ5uUuW+irIHENg==
X-CSE-MsgGUID: +Tn7YIHzTVuJBGR0TRyN4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="91861624"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="91861624"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 07:31:25 -0700
X-CSE-ConnectionGUID: krWObX1DRS+8Wr8JzQcvrQ==
X-CSE-MsgGUID: wH+8cfvNTEeauN5mQEDBMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="240795085"
Received: from dmitriyo-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.81])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 07:31:22 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/4] drm/xe/mmio: Small improvements
Date: Fri, 22 May 2026 16:31:08 +0200
Message-ID: <20260522143112.10643-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

Michal Wajdeczko (4):
  drm/xe/mmio: Map MMIO BAR using managed version of pci_iomap
  drm/xe/mmio: Add check for minimal BAR size
  drm/xe/mmio: Drop tiles_fini action
  drm/xe/mmio: Check MMIO BAR size when initializing tiles

 drivers/gpu/drm/xe/xe_mmio.c | 81 +++++++++++++++++++-----------------
 1 file changed, 43 insertions(+), 38 deletions(-)

-- 
2.47.1

