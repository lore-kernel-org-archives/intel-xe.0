Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E3C3C25B75
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 14:42:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E1810E10F;
	Thu, 23 May 2024 14:42:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="baDI9kGR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 079C210E318
 for <intel-xe@lists.freedesktop.org>; Thu, 23 May 2024 14:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716475365; x=1748011365;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KDS7SSuNQvoYR61sOt07Eh/8IIbsM20MQNo3HgVq3CU=;
 b=baDI9kGRzJf563B7p7ruN0xjsnmtEl0j5XvUAFtNHp1aEBkikRebAAT6
 Ypx2BWRuZ+L9rDziPcY7BMOVtmW6yArdICAXPPJm3MNjUvJnrOVDzWtMD
 82ryW+jR8DARFkOwI05Av/4LxTLDIldefiD09P8nrErB4pPfqBp9UjwVY
 U5h6ZBwRlc0jGqucnvSS7wk28dsv8OlKAqdEFSqqG4EhLtf0iawpeCLsQ
 yFT7mNnbiqGgCRRTH+y8l1+jMxVjcvZ7lEL9XTKbcSJRSp4zNM5GrlotU
 MudlrgVwRjxsTrpLbSGbnO08iPZ/ELUlIARYWZ8rP43vn52tvDtaOHmf9 Q==;
X-CSE-ConnectionGUID: 0QjX3s1DQJed5STdKsX2Fg==
X-CSE-MsgGUID: k9SKia/HSGmMB9yRX+cWRQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="16585087"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="16585087"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 07:42:45 -0700
X-CSE-ConnectionGUID: Wag7jyrGTwiwB6hhZYkkKQ==
X-CSE-MsgGUID: 7qsiUGpySEeYikHwTwWMow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="34155692"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 07:42:44 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Badal Nilawar <badal.nilawar@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH 0/2] Add HWMON support for BMG
Date: Thu, 23 May 2024 20:13:49 +0530
Message-Id: <20240523144351.4040131-1-balasubramani.vivekanandan@intel.com>
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

Karthik Poosa (2):
  drm/xe/hwmon: Add HWMON support for BMG
  drm/xe/hwmon: Expose card power and energy attributes of BMG

 drivers/gpu/drm/xe/regs/xe_pcode_regs.h |  7 ++++++
 drivers/gpu/drm/xe/xe_hwmon.c           | 30 ++++++++++++++++++++-----
 2 files changed, 31 insertions(+), 6 deletions(-)

-- 
2.25.1

