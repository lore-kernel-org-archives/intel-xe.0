Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8409109E556
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 06:41:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 983A810E2B7;
	Thu, 26 Mar 2026 06:41:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ctXbF8Ep";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2BB010E2B7
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 06:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774507293; x=1806043293;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pBM1jplurNwkKRXh/QrwL+vtl8OpTxEisTTJ0R98meQ=;
 b=ctXbF8Ep4DEqke+3gaZXYgigkE7p6/Xnn54YbpM1sz+kXxa3YWN90SUf
 XFTmgOsHQRq11QgckHBcsYkaapHpo7T9B6WO9f74OQDyyk50S9d3FXeIx
 dS3MkH8o7lmz/3hQIormllyjdMkB3B5VL64hiF/TEwRmMZr3Az072v8dN
 elHTrxfk/Iig05vyoM6pVnZQ/sawS878hWhSCTcxQK1a6jlxlXjtd8mvf
 R7fPAgVZq0MoVKTzKYDR4o4aBbXhdY66q/iiZhGrFaWMv7F4qtE8fO++p
 HpGqbottp9ud5hwfsELysBasvvgjafinuZHR/NDmwhc2a3Gzcv8/tbwD1 A==;
X-CSE-ConnectionGUID: e9gGXO8pRp+8nKkdu24QUQ==
X-CSE-MsgGUID: 5gL9B5BNQmyFTE7kAow+/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="85862984"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="85862984"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 23:41:30 -0700
X-CSE-ConnectionGUID: epEVMRwsRHuDv7Xwd52ieg==
X-CSE-MsgGUID: AUT8e65BTGGKiY+ADw1zwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="262830426"
Received: from nkumarg-desk.iind.intel.com ([10.190.216.171])
 by orviesa001.jf.intel.com with ESMTP; 25 Mar 2026 23:41:28 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com, stuart.summers@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v4 0/1] drm/xe: Set GT rp min frequency as 1.2GHz default for
 BMG/CRI
Date: Thu, 26 Mar 2026 12:04:08 +0530
Message-ID: <20260326063407.985568-3-naresh.kumar.g@intel.com>
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

Performance degradation occurs in multi-BMG GPU configurations 
during Peer-to-Peer transactions when one of the two GPUs remains idle
with no engine activity.
The root cause has been identified as frequency downscaling:
the idle remote GPU reduces its operating frequency to the minimum 400MHz,
which negatively impacts the bandwidth available for P2P transactions 
initiated by the active local GPU.

To address above problem this patch ensures for the platform BMG/CRI
of graphics(GT0) tile.the default GT rp frquency min set as 1.2GHz
to ensure effetive P2P transaction bandwidth.

Frequency boosting improves performance, but at the expense of
power consumption.Note that this change only impacts active frequency,
so idle power consumption should remain the same.

v2:
- Fix Indentation(Thomas)
- Add comment about power impact(Stuart)

v3:(Thomas/Ankur/Matt Roper)
- Add setting frequency to only GT0(Graphics) Tile of BMG/CRI

v4:(Stuart)
- Move WA check to pc_needs_min_freq_change function

Nareshkumar Gollakoti (1):
  drm/xe: Set GT rp min frequency as 1.2GHz default for BMG/CRI

 drivers/gpu/drm/xe/xe_guc_pc.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

-- 
2.43.0

