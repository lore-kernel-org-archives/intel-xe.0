Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA64C43458
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 10:08:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4852810E347;
	Wed,  1 Jul 2026 10:08:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b8KJNMp4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB6C10E347;
 Wed,  1 Jul 2026 10:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782900505; x=1814436505;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qjNIa7U/DXfZpbOozs1P5eSaxzt6Yfzd23M+deEXRTY=;
 b=b8KJNMp4HlyU92VVWlmNtxo5EOXTu9I9As25ukyMhVMJofWcu2JT9xTl
 OOCURCkZAKvifJTW5O1mQ8iIShjZHRxA/aGr1TRJ6Bd0G1AJy/uXZaq/8
 vh246I5Y555f13gfdxZfe3sR6ZvvibgDkLPXKaVGKfDL7ZFMZS4MyOBVA
 QAzzCcUn/eSUnzUTfMEN9FvDza49VySN2Z7YQhMW1vzTmgmEbfbY6h04H
 eJkj3VX4jeMnUcRYT2dkTtwcM7jW6/n7CbhDPrpL5PsN1y5NlnlrnR+ER
 3u48+zwRCuyU83oPI4XZ6WOj2ZwEO+QX28bR2voMDuZY+G8BU10Y/gYJo w==;
X-CSE-ConnectionGUID: /Kmr6PBEQ+Gtl6kqMqx+dA==
X-CSE-MsgGUID: FpRjCiAVSGqHdHJ1NAi0zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="83827731"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; d="scan'208";a="83827731"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 03:08:24 -0700
X-CSE-ConnectionGUID: cd+pWPGHTXyRgm9GcrnA2A==
X-CSE-MsgGUID: WCkTeUj4RI+Qs3v5d1Ijlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; d="scan'208";a="248064822"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 03:08:21 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: animesh.manna@intel.com,
	uma.shankar@intel.com,
	suraj.kandpal@intel.com
Subject: [PATCH v2 0/1] drm/i915/display/psr: PSR2 DC3CO fix
Date: Wed,  1 Jul 2026 15:36:49 +0530
Message-ID: <20260701100650.1689665-1-dibin.moolakadan.subrahmanian@intel.com>
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

On Xe3P, DC3CO entry during an active frame can leave the pipe in a
bad state and does not recover well.

Set CHICKEN_DCPR_4 bit 24 to inform DMC to block DC3CO entry.

v2:
- Add HSD number to intel_display_wa framework.

Dibin Moolakadan Subrahmanian (1):
  drm/i915/psr: Block DC3CO entry during active frame

 .../gpu/drm/i915/display/intel_display_regs.h    |  3 +++
 drivers/gpu/drm/i915/display/intel_display_wa.c  |  2 ++
 drivers/gpu/drm/i915/display/intel_display_wa.h  |  1 +
 drivers/gpu/drm/i915/display/intel_psr.c         | 16 ++++++++++++++++
 4 files changed, 22 insertions(+)

-- 
2.43.0

