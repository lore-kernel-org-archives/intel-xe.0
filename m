Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EAABCA5FD7
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 18:02:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030A410E63E;
	Tue, 20 Jan 2026 18:02:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O3Hm3uuv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C86A910E63E
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 18:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768932155; x=1800468155;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FGLk9mn2gMCOXwoe1024955jN2VrGOghqdxEAHTWIBw=;
 b=O3Hm3uuvpLooJz3WyoUHEpL6Dlc5JjyZ6Y8jNkvM1yoRqbhMFBpFe2Q0
 7jyUFnmMJH4ajnvJCt/iZChh59nIrXcdGEG6u5n74HkFQAu9okalVIglz
 v2x4OdXqSbJtF+ksJ8CobWs44FVS2/8mbjbd3iYSqkwZzvALEumXSV+fU
 mYQuOKPf62N9KhpYYb7cjIO/MX7dfbBXnUX/lPihjnQe1+IYuY0C6DuMr
 gHSdYv+0HROpevhpy3chSF5UQBllwhMy8bkCfsUW6cCNwM3NqO9omAonB
 HWK5p9UNTNw8YxnFLFgSaeGrPuzPZShwuNvOCEtiKiugliv1URE+D9BgU A==;
X-CSE-ConnectionGUID: csPpONeTQZ6oU1JIo2e5gA==
X-CSE-MsgGUID: TYGJILM4TlShByFD/YJc3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="80453915"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="80453915"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 10:02:34 -0800
X-CSE-ConnectionGUID: 4jEVtGrkReKksKEHiJFQiQ==
X-CSE-MsgGUID: I1cj5GBURf6LejM6UUp0Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="206103880"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa006.fm.intel.com with ESMTP; 20 Jan 2026 10:02:33 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH v3 0/3] Fix nvm aux resource cleanup
Date: Tue, 20 Jan 2026 17:59:23 +0000
Message-ID: <20260120175922.2961847-5-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260109220026.2468067-2-shuicheng.lin@intel.com>
References: <20260109220026.2468067-2-shuicheng.lin@intel.com>
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

v2: create patch2 to "Fix double-free on aux add failure".

v3: drop goto in patch2 and create patch3 to drop the clear of xe->nvm.

Shuicheng Lin (3):
  drm/xe/nvm: Manage nvm aux cleanup with devres
  drm/xe/nvm: Fix double-free on aux add failure
  drm/xe/nvm: Defer xe->nvm assignment until init succeeds

 drivers/gpu/drm/xe/xe_device.c             |  2 -
 drivers/gpu/drm/xe/xe_nvm.c                | 59 ++++++++++------------
 drivers/gpu/drm/xe/xe_nvm.h                |  2 -
 drivers/gpu/drm/xe/xe_survivability_mode.c |  4 --
 4 files changed, 28 insertions(+), 39 deletions(-)

-- 
2.50.1

