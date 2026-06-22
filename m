Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C6A6CDB470
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jun 2026 13:23:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E37AD10E6D6;
	Mon, 22 Jun 2026 13:23:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z75TsC3m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A799B10E6D4
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jun 2026 13:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782134637; x=1813670637;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tkXHYS0zcZp7/PxwMn3RlELwGaM19QYTh81YHflXK5M=;
 b=Z75TsC3mAbTqEYE7n37vl5gYZVPKM9FM3zpNOjGC4etX2WNKd4i3H5pZ
 WKZz1p4JpDcCR56NruOBAcFnlkNlOy5fNX3oVYLXhunRbAx+IxapxADS/
 T63//H3HUbes/hzOop5MO4dFftv9KQg+Km73b+wdzZLCQj5zWgjdTy8rb
 ye1KBjAOuoYCM5ZRpLINicFoY5nN1TV7W4fZ/rQvv8jm0XcObEaqY647a
 s/73fQNXbdH2g1OzQPSmwyvvUDWP807h7c8NRiKYsroXaBktA0VU7Ke0k
 RoZBgIYG5EmRkT+6wuNLunGZ/vzAjv70/W/YLoupAAxVg3DytedZ6pSsk A==;
X-CSE-ConnectionGUID: 7os36m75SMqTkZp5J82xcg==
X-CSE-MsgGUID: xO3y4Cn0QIKp5H+25MvI4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="93228674"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="93228674"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 06:23:57 -0700
X-CSE-ConnectionGUID: PP+dR1zgT8GP1kzm8LkJxQ==
X-CSE-MsgGUID: 5oCOXVPORTyN5CzYSTzwQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="279407147"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 06:23:56 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v3 0/6] drm/xe/mmio: Small improvements
Date: Mon, 22 Jun 2026 15:23:36 +0200
Message-ID: <20260622132342.19600-1-michal.wajdeczko@intel.com>
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

v1: https://patchwork.freedesktop.org/series/167104/#rev1
v2: https://patchwork.freedesktop.org/series/168108/#rev1
v3: apply Sashiko review

Cc: Matthew Auld <matthew.auld@intel.com>

Michal Wajdeczko (6):
  drm/xe/mmio: Verify MMIO is available
  drm/xe/mmio: Map MMIO BAR using managed version of pci_iomap
  drm/xe/mmio: Add check for minimal BAR size
  drm/xe/mmio: Drop tiles_fini action
  drm/xe/mmio: Check MMIO BAR size when initializing tiles
  drm/xe/mmio: Prefer tile-based WARN message

 drivers/gpu/drm/xe/xe_mmio.c | 98 ++++++++++++++++++++++++------------
 1 file changed, 65 insertions(+), 33 deletions(-)

-- 
2.47.1

