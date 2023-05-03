Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30CE4C77B7F
	for <intel-xe@archiver.kernel.org>; Wed,  3 May 2023 06:40:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF47310E058;
	Wed,  3 May 2023 06:40:52 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5983B10E058
 for <intel-xe@lists.freedesktop.org>; Wed,  3 May 2023 06:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683096050; x=1714632050;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+7SHE//mAA+hBm0XxORGQr7KXRN+PZnuqsLdSoRvCJU=;
 b=Epob8lVVtGg/zQI77DPkLM4mBmyjlRAsfjiVG5TVQAePwB+sU15yuyRI
 hg4zHzSqHi6dLttGT3TRbKhjuetwj/1AhTGv6a77yBOFmcnGnhiFIn8Az
 g1j0/IYa9Urpubd28E+r/VYxdEH3f5BKTT8Ra9ZtIgFdCbp7I+ladJMDi
 wsa4fFgvFkXdQYBmRhc9IlEbSzlzCBVhfwHIQq3NboXGnFBIFYGRlW7Jo
 ATZYoLwh9pum4+rVb5zcRHahOs8BxxRGPC6wmD2tKaGTK+4k68Dp+QVaN
 YNJUKORDHGq6BIy/sxo+F5ojq3sXYD9Ml7i0mN80ClZ21juEMdVra+yxA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="348624087"
X-IronPort-AV: E=Sophos;i="5.99,246,1677571200"; d="scan'208";a="348624087"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 23:40:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="673962962"
X-IronPort-AV: E=Sophos;i="5.99,246,1677571200"; d="scan'208";a="673962962"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 23:40:46 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  3 May 2023 12:12:49 +0530
Message-Id: <20230503064252.830641-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 0/3] Add Render C state properties under
 gpu_idle
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
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add rc_status and rc6_residency_ms under device/gt#/gpu_idle.
Handle counter wrap for the rc6_residency counter and remove existing
files under device/gt#/

Riana Tauro (3):
  drm/xe: add a new sysfs directory for gpu idle properties
  drm/xe : add rc6_residency in ms
  drm/xe/guc_pc : Remove render c state files

 drivers/gpu/drm/xe/Makefile        |   1 +
 drivers/gpu/drm/xe/xe_gt.c         |   5 +
 drivers/gpu/drm/xe/xe_gt_types.h   |   4 +
 drivers/gpu/drm/xe/xe_guc_pc.c     |  58 ----------
 drivers/gpu/drm/xe/xe_idle.c       | 179 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_idle.h       |  13 +++
 drivers/gpu/drm/xe/xe_idle_types.h |  32 ++++++
 7 files changed, 234 insertions(+), 58 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_idle.c
 create mode 100644 drivers/gpu/drm/xe/xe_idle.h
 create mode 100644 drivers/gpu/drm/xe/xe_idle_types.h

-- 
2.40.0

