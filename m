Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66DA4CC6B2A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 08:00:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D88710FBC2;
	Wed, 14 Oct 2026 08:00:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC5610FBF7;
 Wed, 14 Oct 2026 08:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791964800; x=1823500800;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vRXkYk18d1VH2GFfYDcKahq2+nnGzM8rlGwGQmjkO3M=;
 b=liLO2VXJ+Bmnjbv0V74rm/o9+6KBJvfGaR4gFW89QiIUZJ4CERzB1cOu
 e+1ICwgCOUPdkJLLvqXHe6qGSehUuk7iXSUlS6072Td+bsEPtyoRE+XBc
 ISzaJNDTQjKt7OdHs+Yc9Xn3TtlPGdYUUm/BfMpGC75clwiyXmE+h6h/z
 LXSbnCCqcYgp3yq8LFw5iAY8kEvQPMGeRwMPgDP/4DoA+g9yaU406WC+c
 RHoFuswatptRjzCAAUYEp47C2mbMpDiCSUQ8k7MQzeQcRxoBa9sik/+jJ
 NIanHCBgXV8RuLzJDS0LPUmp5AnjOSOLS4580+OC/33ySQPxCsDlbyP3c g==;
X-CSE-ConnectionGUID: znycvrZmTQKsoXXH/uOAsA==
X-CSE-MsgGUID: Xs7UR5HIR1KXGUPjFlRmKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="706512"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="706512"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 01:00:00 -0700
X-CSE-ConnectionGUID: arjGkOG+SzaLDS/g64SLnQ==
X-CSE-MsgGUID: wvxbWxpeTfq5rI9MhWzyDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1716883"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 00:59:58 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, jani.nikula@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH v5 0/1] drm/i915/gmbus: Add bit-banging debugfs control
Date: Wed, 14 Oct 2026 13:29:54 +0530
Message-ID: <20261014075956.2104356-1-ramanaidu.naladala@intel.com>
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

Add a connector debugfs file that forces EDID reads to use
GPIO bit-banging.

Naladala Ramanaidu (1):
  drm/i915/gmbus: Add bit-banging debugfs control

 .../drm/i915/display/intel_display_debugfs.c  |  2 +
 drivers/gpu/drm/i915/display/intel_gmbus.c    | 86 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_gmbus.h    |  2 +
 3 files changed, 90 insertions(+)

-- 
2.43.0

