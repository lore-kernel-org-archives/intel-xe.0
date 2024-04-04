Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5903DCD1284
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 09:58:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED1D11B018;
	Thu,  4 Apr 2024 09:58:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fn6hdF/U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76CEA10E67A
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 09:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712224680; x=1743760680;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uSShXejwk1JDNNO2P0SLTwFcXdTRvO8PjgipOO9m/Xg=;
 b=Fn6hdF/U/KVLB56GZ061yREvAPIx/WtyroSYMLdjjOvWX7fqfReEFA4v
 3moxhdlBA/dpzKImCA6K2V4fx+QcP1e6iaTAJMPOKb2JWPtRs2KQnP/Xx
 zkQLd7Nni47L1Z/wnIutC+w+ohHEx5O7QHltL6NfhwvQVvIcjsEENLqVx
 BwxtSSQqQfc/Z5GJyf2fbRVP/IVfAJi5k+0cdybjzwtAYLTmLtlUv7XRX
 dsT/BDKtL6r4whnJYWQasOPnV3sX9QvNZGYFO8yuvK4/Pc49NSBkUtZ59
 Xd0v5zQJ9XEi94B+7h45gHz2Db3GkAufHgBcJUlfpoBoUDDGMUaBMK2No A==;
X-CSE-ConnectionGUID: NI8sphu9Q/GVEsUYRw4leA==
X-CSE-MsgGUID: LBqCfx4KRp61xp3RWDiwng==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="18227723"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="18227723"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 02:57:58 -0700
X-CSE-ConnectionGUID: u8GeYKifTHSQ5GRVG/f2NQ==
X-CSE-MsgGUID: h3hT7nezTjmlUeDhcOOs2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="23422111"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 02:57:53 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v6 0/4] drm/xe/hwmon: Update xe hwmon with couple of fixes
Date: Thu,  4 Apr 2024 15:38:23 +0530
Message-Id: <20240404100827.1109447-1-karthik.poosa@intel.com>
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

Split changes in version 4 of this patch series into separate patches
as per comment from Lucas.

Made below changes as per review comments from Lucas, Badal, Rodrigo.

drm/xe/hwmon:
 - Update xe_hwmon_get_reg and xe_hwmon_process_reg protypes.
 - Address a potential overflow.

drm/xe:
 - Define XE_REG_IS_VALID.

v2:
 - Rebase.
 - Fix checkpatch warnings.

Karthik Poosa (4):
  drm/xe: Define XE_REG_IS_VALID
  drm/xe/hwmon: Update xe_hwmon_get_reg to return struct xe_reg
  drm/xe/hwmon: Update xe_hwmon_process_reg
  drm/xe/hwmon: Cast to output precision before multiplying operands

 drivers/gpu/drm/xe/regs/xe_reg_defs.h |   2 +
 drivers/gpu/drm/xe/xe_hwmon.c         | 106 +++++++++++++-------------
 2 files changed, 57 insertions(+), 51 deletions(-)

-- 
2.25.1

