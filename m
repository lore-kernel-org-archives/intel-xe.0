Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13971C54E4A
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 04:23:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 965E310EB93;
	Fri,  8 Mar 2024 04:23:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H+LqH1gn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC77410EB93
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 04:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709871827; x=1741407827;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bOiLxC8uUNTmApAUn8P/oZ+4YCW5eUh7m3kko42qJQQ=;
 b=H+LqH1gnbBRr8XgU0FdH2YQICEVhCSn0tGswupVK5xqj7BHq2WBECAUj
 d7395V0JFMYfqO8C4IqiKA03mV9271u1h7QcK8FgVpXl1koy/MZBkJ9mx
 ABATxxG8diPCOoQpGrFH1Bzg+tZsqZt74AMRrsJVdeW6pf76QBv7xTzD4
 xN7/8osejgnbUNU+q8jh12rHKPEbyEFSkrqRt73FkOtZeFS8K+Rdbos35
 zSklSn091F5Jsxi2IpLng0cOZNOi36ao7N3RDDPsKJ19bhQV/7FFxzDNo
 MhjVn2zWZx5t857Q2cKF9724oP5ta3ofcIM5v2cYejXAn+jYjxPAJ0WxN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4431960"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="4431960"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 20:23:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; d="scan'208";a="10456301"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa006.fm.intel.com with ESMTP; 07 Mar 2024 20:23:46 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 0/3] Minor fixes for errors reported by static analyzer
Date: Fri,  8 Mar 2024 10:06:48 +0530
Message-Id: <20240308043651.2010165-1-himal.prasad.ghimiray@intel.com>
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

Series focuses on addressing few issues reported by static analyzer
tool.

Himal Prasad Ghimiray (3):
  drm/xe: Return if kobj creation is failed
  drm/xe/vf: Remove lmtt->ops null check in xe_lmtt_estimate_pt_size
  drm/xe/xe_exec : In xe_exec_ioctl remove deadcode

 drivers/gpu/drm/xe/xe_exec.c      | 5 +----
 drivers/gpu/drm/xe/xe_lmtt.c      | 1 -
 drivers/gpu/drm/xe/xe_vram_freq.c | 4 +++-
 3 files changed, 4 insertions(+), 6 deletions(-)

-- 
2.25.1

