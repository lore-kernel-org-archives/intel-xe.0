Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC1BD1118C
	for <intel-xe@archiver.kernel.org>; Sun,  3 Nov 2024 20:16:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E24C10E294;
	Sun,  3 Nov 2024 20:16:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SJRsNUGD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42C0B10E170
 for <intel-xe@lists.freedesktop.org>; Sun,  3 Nov 2024 20:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730665006; x=1762201006;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6IpKbX/j4ImFbOruNrNn0oNLO8QCOYBqOsn7cqqtvWw=;
 b=SJRsNUGD5ocu/xsH58eH4Co76HE8ZK/v8ZmKgHNK/PdwH0oBawdFo+GG
 1RvzB5PZwDe1IH3g5pil4FNoWDHZwTSmebKtqajNESLiwt8MrG4dnbN7E
 x+BdJndfhDXbao1R0Ej0RXZ+6XZwlFjS6r8YinQ6ClU/EhnhEoJSv1hFM
 zoXzpWHDyz/3f33cbgjNQO1T3H8Nt4RBssHY+x5xcqZerUkLPV78acDce
 OIRtBKNmC6JIUrNKcqaTwQUwZw3/NMnTCXLs8fKa11XDcicIq9ApXThoE
 wHUHe6Y6EwFC/QA6DG/nmomz/ljc5EoNBby6sv1JJyFywcF5mXmQnEfxV w==;
X-CSE-ConnectionGUID: VzXUmzSZTDCDKg/t/53PBw==
X-CSE-MsgGUID: dYgAPlPbRoSK9QJXCtwpPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="30462110"
X-IronPort-AV: E=Sophos;i="6.11,255,1725346800"; d="scan'208";a="30462110"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2024 12:16:45 -0800
X-CSE-ConnectionGUID: HWnuguq8TiS21nTqmG8UwQ==
X-CSE-MsgGUID: W2hop5Y6TXC7CN3Lz10Uyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,255,1725346800"; d="scan'208";a="87982571"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.85.128])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2024 12:16:45 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/2] PF: Expose access to the VF GGTT PTEs over debugfs
Date: Sun,  3 Nov 2024 21:16:31 +0100
Message-Id: <20241103201633.1859-1-michal.wajdeczko@intel.com>
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

The access to the VF GGTT PTEs is needed for early enabling and testing
of the VF save/restore feature.

Michal Wajdeczko (2):
  drm/xe: Add read/write debugfs helpers for GGTT node
  drm/xe/pf: Expose access to the VF GGTT PTEs over debugfs

 drivers/gpu/drm/xe/xe_ggtt.c                | 178 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.h                |   7 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c |  62 +++++++
 3 files changed, 247 insertions(+)

-- 
2.43.0

