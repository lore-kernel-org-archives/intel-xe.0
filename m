Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B3A6CD5BAC
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 17:37:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE2DC10E4E1;
	Thu, 21 May 2026 17:37:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EBYvNrWC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAECB10E4E1
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 17:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779385052; x=1810921052;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OhKGwZRYVw3ZHkk9xw8S1IpceG/EXun5JJsu+d0POgo=;
 b=EBYvNrWCojAX34q3E1fI05LjrxftOu0Fp0qESmpM7f/SR+eznKzJLqzK
 601deOKG9nENBgt78UJBuUWkhTM84Eqc8VmZseM56huN6Z8cZL8F+nqD9
 Vmbcoq9uS/T025FYeqM8PrNFbx9eJ3zNH5GO58j4pPYpDY1eXlmX4wEIL
 VH2ibL9OQQsF+wmGZAlRYz6hjt+9ZJ0D2yLm+dzSit5QzmNg6kxw1wexs
 r+oVpM2NXDcgne708AHHpNbaOk195diI9A0Jrdc5b5vzNRexskUii3zIB
 x/mKKgGbYDM1qJ2pyT6Kb8ltqBxj6HZgePwzxB+iYcXdWkWRrfuaP71Fs A==;
X-CSE-ConnectionGUID: 8XLX33HlQHSDw6XDE8P7kQ==
X-CSE-MsgGUID: ZzTxUZKaTN+TMub4vHUeKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="105772584"
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; d="scan'208";a="105772584"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 10:37:32 -0700
X-CSE-ConnectionGUID: ZxC4HGuQQXOKWm/UnWk21Q==
X-CSE-MsgGUID: Pmgl/c7WRxOpfInOsS+F9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; d="scan'208";a="236345274"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 10:37:29 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, michael.j.ruhl@intel.com,
 soham.purkait@intel.com, sk.anirban@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v2 0/2] drm/xe/debugfs: Add a debugfs for pcode information
Date: Thu, 21 May 2026 23:16:40 +0530
Message-Id: <20260521174642.1021590-1-karthik.poosa@intel.com>
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

Introduce a pcode_info debugfs entry to report pcode details.
This initial implementation exposes the pcode version which is got from PMT
telemetry.
This can aid debugging when the pcode version is needed.

v2: Enable the debugfs only for supported platform which is BMG and CRI
as of now.

Karthik Poosa (2):
  drm/xe/pcode: Add support to get pcode version from PMT
  drm/xe/debugfs: Add debugfs for pcode information

 drivers/gpu/drm/xe/regs/xe_pmt.h |  2 ++
 drivers/gpu/drm/xe/xe_debugfs.c  | 19 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_pcode.c    | 23 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pcode.h    |  7 +++++++
 4 files changed, 51 insertions(+)

-- 
2.25.1

