Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4917D637AE
	for <intel-xe@archiver.kernel.org>; Tue, 16 Dec 2025 21:12:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2416210E33A;
	Tue, 16 Dec 2025 21:12:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WY3ne2s9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E3410E33A;
 Tue, 16 Dec 2025 21:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765919540; x=1797455540;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=8OrsPb5avHPD4rHDzG5d1vsUMVEDHIsHGNMxD8tZOgY=;
 b=WY3ne2s9RLGtkRXpOMnAr89MUiRujV+C1Vb+QqNen8p0Z53T2qB5RNvq
 N1zqiqxpAi1d53TIhv+mNzo3f4s55Ju607Z8z21UPrNi885qTHcuW8L6J
 uikmCudLM1k6z8TFuxPG5S5BxwDYWjOPFYf7QUqyneN/EHkd1bVmkuoic
 Fp1XXEizIhb2cTqhkDQCJ9e5iSHbAsx+TzSgbxmK26ARsR4h+o4mpVfAO
 gfoYN+pmtP0b+D9KQE4UQRRD0mUCSvqNT4DLLiXcVIsivo3uxxjNvUGUO
 YwRMgxkQbZcN/LWKzUbeV/HHKBsGdmI9Rwp8LkOJywcJcMkZU+I2Cf3F4 Q==;
X-CSE-ConnectionGUID: VAHPQ2BQT0iGPUVCEh/Jag==
X-CSE-MsgGUID: CWVP1BBqRpiTudtHgvodEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67732977"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; d="scan'208";a="67732977"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 13:12:20 -0800
X-CSE-ConnectionGUID: oBUjLv59QN2FnPTMe5lSsg==
X-CSE-MsgGUID: gNJon+hzSwCE49VjVt4qlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; d="scan'208";a="198017045"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.223.67])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 13:12:18 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH 0/2] Toggle powerdown states for C10 on HDMI
Date: Tue, 16 Dec 2025 18:11:59 -0300
Message-Id: <20251216-wa_14026084006-c10-hdmi-toggle-powerdown-v1-0-08677b03e2f1@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACDLQWkC/x3NQQrCMBBA0auUWTswCUlsvYoUqcmYDmhSEjFC6
 d0NLt/m/x0qF+EKl2GHwh+pklOHOg3g1yVFRgndoElbpZXDttyUIe1oNEQOvSJcw0vwnWN8Mm6
 5cQm5JdRsrfH+Pp3HCXpuK/yQ7391nY/jB7xQiKF6AAAA
X-Change-ID: 20251216-wa_14026084006-c10-hdmi-toggle-powerdown-2e554ccb9789
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

A new step has been added to Bspec with respect to the C10 PHY, which
instructs the driver to toggle powerdown value for boths PHY lanes to P0
and then P2 when driving an HDMI connector.  This series implements
that.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
Gustavo Sousa (2):
      drm/i915/cx0: Use a more accurate message for powerdown change failure
      drm/i915/cx0: Toggle powerdown states for C10 on HDMI

 drivers/gpu/drm/i915/display/intel_cx0_phy.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)
---
base-commit: 72428bdb20b6c86beaeddb9d69bf698d0697aa41
change-id: 20251216-wa_14026084006-c10-hdmi-toggle-powerdown-2e554ccb9789

Best regards,
--  
Gustavo Sousa <gustavo.sousa@intel.com>

