Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD968C3600B
	for <intel-xe@archiver.kernel.org>; Mon, 31 Mar 2025 14:24:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 938A510E054;
	Mon, 31 Mar 2025 14:24:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pid5yJWI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8300E10E054
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Mar 2025 14:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743431084; x=1774967084;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7Yfl+MRMEmwy6Z+2Y3CH1Y9lJkYod34GPrDUs/X65wM=;
 b=Pid5yJWIk2xVs3m7SEXg3vyVjLi026dXpB8ogRC+p57NPrQhwkw9hMMe
 7smSh6W6HVjOjjj8oOqn/RTt1Exi06HWNg+udRRkNY49BZs9wKWmGpZJ7
 IPeYY8SleTqbzHsrPiluYdAUI91e8J3nRjY0ZJh/gOq2L0RPLTsAteEc7
 +Vz4jmBOyOtpnGBFVkZzGnuFwbZ9hHPYborSPVYyzQACVqWnw9Y5i5wij
 /Rd2JQPrGJNwSgywIm+qLOH/oV903w0DzGrF+ofKSsbkEE+VDkQRuGUzm
 hdOF6Yqw7Q4JkQ+z31lnO0hll+bN3F+LYKX2KEfV/ctXlvs3Y/j2y8x6u Q==;
X-CSE-ConnectionGUID: tJVHyv+HSTStv5US8LvlCw==
X-CSE-MsgGUID: pY4FjKZNT4qozRBjo0i7Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44606190"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="44606190"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 07:24:44 -0700
X-CSE-ConnectionGUID: crU1C803RUaQhkLtHDX2WA==
X-CSE-MsgGUID: u/7RPNJCT6GPFu6ThMKtwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="130808252"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa005.fm.intel.com with ESMTP; 31 Mar 2025 07:24:42 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 0/2] DGFX PCIe Gen5 update telemetry and usage
Date: Mon, 31 Mar 2025 19:53:34 +0530
Message-Id: <20250331142336.640226-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
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

This series exposes debugfs telemetry for PCIe Gen5 update for discrete
GPUs and documents its usage.

Raag Jadav (2):
  drm/xe/debugfs: Expose PCIe Gen5 update telemetry
  drm/xe/doc: Wire up PCIe Gen5 update limitations

 Documentation/gpu/xe/xe_firmware.rst |  6 ++
 drivers/gpu/drm/xe/xe_debugfs.c      | 93 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pcode_api.h    |  4 ++
 3 files changed, 103 insertions(+)

-- 
2.34.1

