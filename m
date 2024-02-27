Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE13C54798
	for <intel-xe@archiver.kernel.org>; Tue, 27 Feb 2024 05:34:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4438210F2C5;
	Tue, 27 Feb 2024 05:34:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CuEne5CN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D26AE10E86B;
 Tue, 27 Feb 2024 05:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709012043; x=1740548043;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vPqiEEkSZ0w6soHa/K8KC6tZhM4hudHF2t8kdyufQfU=;
 b=CuEne5CNp4eGYV9prnGJeSeNJnDNWWNI3iHiMyuD/93c5PGMW51KL08C
 Mm4llB7TV6eHiHcX9kpO1MYbx5HbOFNB9eKzJ2nYPwvCLTumGWaNEbM14
 b9lJsvSA3Lf/OQOQ/6xYralcQsWEMs9YjQYpekUqPBuGc10rlw3GSwBRO
 OdUVlrzP30eeq3WKK2vtcLtew7IvkdkVsq+no4IkTpBMuHovhY1g87u8t
 LMaWLRV3a8MNocboW+fb8EeT4zX4ibYPq5trhUT800hdVnFJhn940FskO
 tnOSyg5ODpt09wqlhL6z2w6/QMUepPkvGAXkVXGTR7ANAfKquen83FFKb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3182898"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="3182898"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 21:34:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="6857575"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by fmviesa009.fm.intel.com with ESMTP; 26 Feb 2024 21:34:01 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 0/4] XE HDCP Enablement
Date: Tue, 27 Feb 2024 11:02:00 +0530
Message-ID: <20240227053204.1748920-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.43.2
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

This patch series enables HDCP on XE.
Mainly includes rewriting functions that were responsible for
sending hdcp messages via gsc cs.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

Suraj Kandpal (4):
  drm/i915/hdcp: Move intel_hdcp_gsc_message def away from header file
  drm/xe/hdcp: Use xe_device struct
  drm/xe: Use gsc_proxy_init_done to check proxy status
  drm/xe/hdcp: Enable HDCP for XE

 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c |   6 +
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.h |   7 +-
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c      | 241 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_gsc_proxy.c             |   4 +-
 drivers/gpu/drm/xe/xe_gsc_proxy.h             |   1 +
 drivers/gpu/drm/xe/xe_gsc_submit.c            |  15 ++
 drivers/gpu/drm/xe/xe_gsc_submit.h            |   1 +
 8 files changed, 258 insertions(+), 18 deletions(-)

-- 
2.43.2

