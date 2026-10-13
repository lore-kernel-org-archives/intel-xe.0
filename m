Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FFDCCC6B15
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 20:47:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D7C10F9A5;
	Tue, 13 Oct 2026 20:47:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1761810E734;
 Tue, 13 Oct 2026 20:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791924466; x=1823460466;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+oPsgPSMBWEHfbRisRu4SZJORj4+vk+hM90sPsUaMB8=;
 b=T+U9jf0GWClJBaxxD75pZa3GXH957nzqDH8WMvS6PDrdzZmFfWm9IC13
 BWnHf3c+z362iz8vfIJiAwNzx8MFfXsNXdq3MCtHHc0CK+Fdx4ld5umCS
 pdj/va6XcNSUvfTalbhYJ9jj4UZSl3LILgDnZVQEKKkCZ8Q9Thrx+/99L
 M87+8So30fAL62XTG9ETqX9RNy0Grk4fnZWvq8Ad8rpg/TidyQoSaH9G1
 ymX0rqj+/I9NDb7xLzEP19a8awN10hJsBYL/KA9wuIedrZLWQac02Mk8+
 7d2i436g+qsqca1A5Wynhb2NtNQp4rWGkRSSVjYRl5/7ispUsvVEccgcO Q==;
X-CSE-ConnectionGUID: uWQd1Dr2Q1uYWCo6wRujyA==
X-CSE-MsgGUID: pxSZyQrRTQmXgVR10lCZNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="539277"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="539277"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 13:47:45 -0700
X-CSE-ConnectionGUID: sJuL4IGQTweP6dm9Iw4PGQ==
X-CSE-MsgGUID: WVnFMhy0RE6Qtpza80qb5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1189015"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 13:47:44 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v4 0/5] SKL_DSSM / DE_CAP cleanup
Date: Tue, 13 Oct 2026 22:46:59 +0200
Message-ID: <20261013204705.1574475-1-michal.grzelak@linux.intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Next version of [1]. Compared with previous version, merged all parts
together.

BR,
Michał

[1] https://lore.kernel.org/intel-gfx/20260918232510.3583453-1-michal.grzelak@linux.intel.com/

---
Changelog:
v3->v4
- merge all parts

v2->v3
- s/fix/clean/ (Jani)

v1->v2
- s/REG_GENMASK/REG_FIELD_PREP/ (Jani)
- use either runtime info flag or display version check (Jani)
- don't initialize runtime info flag to 0 (Jani)

Michał Grzelak (5):
  drm/i915/display: clean SKL_DSSM register macros
  drm/i915/3dlut: disable 3D LUT for pre-GLK
  drm/i915/3dlut: log 3D LUT's status
  drm/i915/3dlut: disable 3D LUT if unsupported
  drm/i915/display: log eDP TC support and DBuf overlap detection state

 drivers/gpu/drm/i915/display/intel_color.c          |  3 +++
 drivers/gpu/drm/i915/display/intel_display_device.c | 13 +++++++++++++
 drivers/gpu/drm/i915/display/intel_display_device.h |  4 +++-
 drivers/gpu/drm/i915/display/intel_display_regs.h   |  9 +++++----
 4 files changed, 24 insertions(+), 5 deletions(-)

-- 
2.45.2

