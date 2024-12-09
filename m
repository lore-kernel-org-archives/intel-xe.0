Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B5BE77173
	for <intel-xe@archiver.kernel.org>; Mon,  9 Dec 2024 08:10:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A479210E4A0;
	Mon,  9 Dec 2024 08:10:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GK0gosIp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 274FB10E4A0
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Dec 2024 08:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733731838; x=1765267838;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jESJsyDhLGdExWU9F5SzfGUqZ9Pp+VrJz4iT5S+Jp8Y=;
 b=GK0gosIpqC1Cz24u01mwcTXGzOEfPQBBsM9pnSDBO/oL12UTFnAqpvP8
 UmQmdv9xd5j6OyPbUeJl7Sj359V8lM6dwtW6x36m3q3RvL6XIXbEqRJZK
 zxop88Yt6vbqlokDlhvggKTtwD/OZkhqg4iOViGbq9iW5gQfa++y7BahK
 T+heMjvULBaTfHQ9e2MghdBZeb8b1jsHiWoA01pDj10z5PjvTp/UrQ2iL
 cJ2QQjwmmCK10NMkqB7VclLPSNuUghlAnhM9ReGuhmZTVOv+FRCcnXq29
 UljITd7XPvrNMZJ5bH5nyyjRGFJZtEJ0PVg9YhKvN+9cOzWgpHfA+St2Z Q==;
X-CSE-ConnectionGUID: 84JjX0uhRha9JIhAfJITTg==
X-CSE-MsgGUID: vi3x61h/TUq4SOBUa58hKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="33359754"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; d="scan'208";a="33359754"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 00:10:38 -0800
X-CSE-ConnectionGUID: f7DGGnA7S+O/NKgImCg3DA==
X-CSE-MsgGUID: G+j/tmR3TTGAGx/QiosypQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="100031576"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa003.jf.intel.com with ESMTP; 09 Dec 2024 00:10:36 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com, jani.nikula@intel.com, jeevan.b@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v2 0/2] LOBF enablement fix
Date: Mon,  9 Dec 2024 13:20:36 +0530
Message-Id: <20241209075038.3976877-1-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
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

Signed-off-by: Animesh Manna <animesh.manna@intel.com>

Animesh Manna (2):
  drm/i915/lobf: Add lobf enablement in post plane update
  drm/i915/lobf: Add debug print for LOBF

 drivers/gpu/drm/i915/display/intel_alpm.c    | 29 +++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_alpm.h    |  4 +++
 drivers/gpu/drm/i915/display/intel_display.c |  3 ++
 3 files changed, 35 insertions(+), 1 deletion(-)

-- 
2.29.0

