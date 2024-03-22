Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BB0C47DD9
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 14:25:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 530851124D9;
	Fri, 22 Mar 2024 14:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OxWko1LS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 568901124D9
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 14:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711117511; x=1742653511;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/iNu/3sXvVimb1IdZD2IhY3fw2keWnVslC65nH5mZgY=;
 b=OxWko1LSDzrLBRj6yhNnQyKpMIl+WHBHQ7hBZsGBH0J+UtIFwxt/75GL
 vRqcHI04u/qRCXIl7T1anFC+tpyk51GaSNhcqjP86fzEsX2jH8FbhBGrc
 DjZUXUMvLN56IH50KxSdmjUbuqgFWENSRpMYfcKrRSQ9Nj65YTdas2mhC
 lO1pYp138Yl+uPIYaRTneXAJRC6I3hb7pBmp0s2JaZOr/URtdYGz41Rco
 GQEuKEgV0UZErr9S/a+M9irs2ysgyXxOv7YPCXWMFLyosjG5Xw2fYZacW
 IFb+88F2skqx/gtyhcdKnyYp0If8nPFSzgGaU9HHdN0tTEpDNWqikjSNj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="23622627"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="23622627"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 07:25:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="15334204"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 07:25:09 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH 0/2] drm/xe: Fix issues reported by static analysis tool
Date: Fri, 22 Mar 2024 20:05:21 +0530
Message-Id: <20240322143523.2531519-1-karthik.poosa@intel.com>
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

Add fixes for issues reported by static analysis in xe hwmon and xe_pm.

Karthik Poosa (2):
  drm/xe: Fix static analysis tool reported errors
  drm/xe/hwmon: Fix static analysis tool reported issues

 drivers/gpu/drm/xe/xe_hwmon.c | 18 +++++++++---------
 drivers/gpu/drm/xe/xe_pm.c    |  6 ++++++
 2 files changed, 15 insertions(+), 9 deletions(-)

-- 
2.25.1

