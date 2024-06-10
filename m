Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF4AC27C55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 18:38:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC0C510E379;
	Mon, 10 Jun 2024 18:38:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S4/x+czk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D4C10E379
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 18:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718044691; x=1749580691;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tbxVNyrfEdotiAhKCzeE047QtPaU8kF0D2gzv9J1aww=;
 b=S4/x+czkxR6RLCWuJgSPP3JprfsqIWkUq/e0pRlxo50dqub2oArgIjRO
 IMHJ7WUhuRAwTpC1BWauZ/aii2Sq4zUoiHSD4jwq4St0IhgjIBSB+bBsb
 eom4vbnORroAaUCDM0gtWtzuKkjPCkWrIW+a9Vya9+ahk7+wyOaXp7cHC
 EubtpdEYFIaEIKTZm4mx2fYspIPX7mDuT2oFfLEdLudvJK/Uskl4LnIZ/
 E2s7+aIBOBPAtlCaKeJHVNSSUxTD2I3fKUInLM5o7jRn0H0rTNJmk3UT4
 Si46mmmhj3uQOg+EUicORD+ISN9hmLc8vx/j+lzHN0nj3iqRLj7axR2q7 Q==;
X-CSE-ConnectionGUID: dXTgwMNBTiOs8WoiIJB6Kw==
X-CSE-MsgGUID: HAz4IrllSoeJyWVr8N4SCg==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14846241"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14846241"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 11:38:10 -0700
X-CSE-ConnectionGUID: o3CMtmdpRrSYtIrPPXq1nA==
X-CSE-MsgGUID: aJOJtzqVSnmovtfTCFYaQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="43726871"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.1.253])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 11:38:08 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>
Subject: [PATCH 0/4] Prepare Xe force-wake code for VFs
Date: Mon, 10 Jun 2024 20:37:53 +0200
Message-Id: <20240610183757.1812-1-michal.wajdeczko@intel.com>
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

The control and ack force-wake registers are not accessible for
the VF drivers. To avoid changing existing code logic that tracks
woken domains, simply ignore all attempts to access control or ack
registers if we are running as a VF driver.

But before doing that, make some improvements inside xe_force_wake.c

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>

Michal Wajdeczko (4):
  drm/xe: Prefer GT oriented messages in xe_force_wake.c
  drm/xe: Include additional info on failed force-wake operation
  drm/xe: Combine common force-wake code into helpers
  drm/xe/vf: Ignore force-wake requests if VF

 drivers/gpu/drm/xe/xe_force_wake.c | 57 +++++++++++++++++++-----------
 1 file changed, 36 insertions(+), 21 deletions(-)

-- 
2.43.0

