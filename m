Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C44C2C44501
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 09:11:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8352A10E71E;
	Wed, 21 Jan 2026 09:11:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ny33davI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 275F710E71B;
 Wed, 21 Jan 2026 09:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768986679; x=1800522679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UREthQeCI198mcq0lfuPLhq2mZmaPzhXQ3nN7LIeK1k=;
 b=Ny33davI3mzA/7i8hrHySOSaBXDWCFUS0ccy898TZL1fureUF3WEuMuI
 U2ciQjhG2J1YW6BkqYGnanzlgUJuFrdz7uU/rThL9cQ3t7nl6F9gPPNcg
 8xlTDTUUIPOo3m3sRSIN6Wza4PfV+m97+k3ySKQoh/UOxjBk9R8QEROE5
 v4zHA2DFNhLUzQVRw0ATSdTHXnNCcSMsrHIvDXKxJPXQ0ughhFJRemWdo
 KxFmmprWeGLrdyBHMUlQJds5RmOtCKSJC5d1eeBM6oMgn8MSo2OOiak5y
 JCkFgOnyDjnCT1Un0S94BeIP4I+h1ObQVB0t9O5fCSf/bhmF6Ny//EIgj Q==;
X-CSE-ConnectionGUID: VkSVITTkRd68p37c12oVjQ==
X-CSE-MsgGUID: da+TCNslQ06B6E4KSG9l6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="95682070"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="95682070"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 01:11:19 -0800
X-CSE-ConnectionGUID: 8pWVPNSdTmixfwEAAuP2ZQ==
X-CSE-MsgGUID: W1zu2wqWRDa93QgtpUUktw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="210847870"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO fedora)
 ([10.245.245.107])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 01:11:17 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/2] drm/xe: Select CONFIG_DEVICE_PRIVATE when
 DRM_XE_GPUSVM is selected
Date: Wed, 21 Jan 2026 10:10:48 +0100
Message-ID: <20260121091048.41371-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260121091048.41371-1-thomas.hellstrom@linux.intel.com>
References: <20260121091048.41371-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

CONFIG_DEVICE_PRIVATE is a prerequisite for DRM_XE_GPUSVM.
Explicitly select it so that DRM_XE_GPUSVM is not unintentionally
left out from distro configs not explicitly enabling
CONFIG_DEVICE_PRIVATE.

v2:
- Select also CONFIG_ZONE_DEVICE since it's needed by
  CONFIG_DEVICE_PRIVATE.
v3:
- Depend on CONFIG_ZONE_DEVICE rather than selecting it.

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index c34be1be155b..4d7dcaff2b91 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -80,8 +80,9 @@ config DRM_XE_GPUSVM
 	bool "Enable CPU to GPU address mirroring"
 	depends on DRM_XE
 	depends on !UML
-	depends on DEVICE_PRIVATE
+	depends on ZONE_DEVICE
 	default y
+	select DEVICE_PRIVATE
 	select DRM_GPUSVM
 	help
 	  Enable this option if you want support for CPU to GPU address
-- 
2.52.0

