Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A74C25B75
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 18:14:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F57510E125;
	Thu, 23 May 2024 18:14:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j6irolBI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E30CC10E125
 for <intel-xe@lists.freedesktop.org>; Thu, 23 May 2024 18:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716488048; x=1748024048;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yc27okeMyXrhj3R1FlyMmR5N+h8JJA9stz+uakhQHd8=;
 b=j6irolBIhM84k75c7dBh3vMVQ+9qxSnIRWOeTXU935PXHnZ52aan+QbG
 XaRV//W/HiS1ovgDeGcZmIBQw7aHvt+8xu1LxbSVpH3ZeWgKpUdXEVFT8
 aecDZLrmR6+L3W1H0/N9mHw4z8PMZ88x62QPaZfa0U7JcmJ+mX45hbsgB
 jGBiox1WbG5y/y2tTru0RQgsSh4boHyPjNsgZxe677Mv3AOxLwmz0/zGE
 KDnJhqig7VG02+A5Ovrk6l1W3EOJiTvsx0O09xb2NgHU+/0PoZgaEPrvH
 b44xOTMWnaEfff07rIbnkBxxqNRf+zxa9Sv/vEltRKedBw20xiAh/tkG3 A==;
X-CSE-ConnectionGUID: 8eQ2+Q9URMGnysb40CjX2Q==
X-CSE-MsgGUID: vfQjzdfNSRC4EAnO79uYIQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12947255"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="12947255"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 11:14:08 -0700
X-CSE-ConnectionGUID: bwSCWv3nTjyHdsTet1uTFw==
X-CSE-MsgGUID: n7AAV8l4RISpULlq5Wy8TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="38605749"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 11:14:04 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 lucas.demarchi@intel.com, ashutosh.dixit@intel.com, rodrigo.vivi@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v2 0/1] drm/xe/hwmon: Remove xe_hwmon_process_reg
Date: Thu, 23 May 2024 23:55:39 +0530
Message-Id: <20240523182540.2777895-1-karthik.poosa@intel.com>
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

Removing xe_hwmon_process_reg as per review comments from Lucas in
https://patchwork.freedesktop.org/patch/587830/?series=131765&rev=7.

It was reviewed as an umbrella function which can be avoided.

v2:
 - Rebase.
 - Improve commit message of patch and cover letter.

Karthik Poosa (1):
  drm/xe/hwmon: Remove xe_hwmon_process_reg

 drivers/gpu/drm/xe/xe_hwmon.c | 80 ++++++++++++++---------------------
 1 file changed, 31 insertions(+), 49 deletions(-)

-- 
2.25.1

