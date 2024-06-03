Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8017CC25B75
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 10:49:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B2C210E15A;
	Mon,  3 Jun 2024 10:49:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bcdXuFp4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D6A10E15A
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 10:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717411768; x=1748947768;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XujsphWylZuWspCWg76it5DdnBkc+gv9E787Jtdj1t8=;
 b=bcdXuFp4UbaHb63kkwUi4532oMQndWCI6ckbuFy4tOBgJhiOm6yXoDWt
 bFOwgjjjO5esMk+pGMELB738VuLso3HgVdlA5nzed9QietNAtqzp5zPI3
 OrdGTUcXEkEMvKkotmSWjSTlydJ1vUEo+tCUxvy7GkMuLAIzMbn8J0uol
 1scKlzp6+oITSEVUnGS5+KmrpdRpnxwdAxBAGTw7L7TtKezo84Odg0tGA
 DuJRKnb0ES4WtHKdtoMnzQ3xctD9uMyeWu7JqeaS2DOzPD/UykFgufUVu
 wk5sPLCH5J/DDF8b4PEIZ4UVzX2kk2SGg28eHnopesxg2qNG1aMOzZaSG A==;
X-CSE-ConnectionGUID: c3s2vs8PSieYAsVZ/bbm5g==
X-CSE-MsgGUID: r7wbclk/S/KWSMs7zXhR5Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="13645864"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="13645864"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 03:49:27 -0700
X-CSE-ConnectionGUID: rI9OizCGSQq+iKgTsKYDPA==
X-CSE-MsgGUID: rLWELdXTSJSxYdvgLhR5HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="36827127"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa008.fm.intel.com with ESMTP; 03 Jun 2024 03:49:26 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V4 0/2] Extend wa_14020756599 to xe2lpg/lpm
Date: Mon,  3 Jun 2024 16:19:49 +0530
Message-Id: <20240603104951.705603-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
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

wa_14020756599 applies to xe2_lpg as well as xe2_lpm all
steppings.

V4:
  - Handle xe2_lpm differently as wa applies on primary GT only 
    when media 2000 is present on platform
V2:
  - Remove engine filter video_decode
  - Fix GRAPHICS/MEDIA/s - Himal


Tejas Upadhyay (2):
  drm/xe/xe2lpm: Add permanent Wa_14020756599
  drm/xe/xe2lpg: Add permanent wa_14020756599

 drivers/gpu/drm/xe/xe_rtp.c |  6 ++++++
 drivers/gpu/drm/xe/xe_rtp.h | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_wa.c  | 11 +++++++++++
 3 files changed, 31 insertions(+)

-- 
2.25.1

