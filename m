Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B45C369D9
	for <intel-xe@archiver.kernel.org>; Wed, 30 Apr 2025 04:26:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBC3010E6D0;
	Wed, 30 Apr 2025 04:26:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jGO5EZI7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 847B610E6D0
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Apr 2025 04:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745987163; x=1777523163;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bF8P3m+i1SCjT5PpWoigWBuRvnr+VbHLtYVNJRDsmu8=;
 b=jGO5EZI7CDqaxC47XHfDIkYUKXsoplf6I0FxPJ3TM5jeOcMppvI5dia5
 eTCCDSwIOcA6iY6Z3VkEc98QxApqrw1UIzpjmymXDHH+swXHSZN2dgW6n
 v7K9Ff/Csjl6bMfwIb5wFi2U6LTjWdYpqJ8ei66ykoJybqYg2Go/207Ke
 +PEiovQsTLYjWaKWaB0rt/bUfLQSEvgEmiAG/jE3Kl0/BLQMVZ6GSvAbh
 s2SMi6GT1JYoRHzwo1g8lB2R+aUTijG8UFDbmBQUPcdJjuZaqtACGM4bV
 UbR8r4KveXNv1K8ePQCzBrExnjQPQIh5kqZJGCqr6Y38Gs5tl8dZqVBNR w==;
X-CSE-ConnectionGUID: J18s06/AQ7GTZI5e9hT9qg==
X-CSE-MsgGUID: jbsw0fiNRgaJxqGnW73U6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="59009475"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="59009475"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 21:26:02 -0700
X-CSE-ConnectionGUID: WVOqHD1xQ5uICh5HO8sAwg==
X-CSE-MsgGUID: yHal8riTTUO3OUR501ihbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="138841592"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa005.fm.intel.com with ESMTP; 29 Apr 2025 21:26:00 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v5 3/3] drm/xe/doc: Wire up PCIe Gen5 limitations
Date: Wed, 30 Apr 2025 09:54:19 +0530
Message-Id: <20250430042419.3256029-4-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250430042419.3256029-1-raag.jadav@intel.com>
References: <20250430042419.3256029-1-raag.jadav@intel.com>
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

Append PCIe Gen5 limitations to xe_firmware document.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 Documentation/gpu/xe/xe_firmware.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/gpu/xe/xe_firmware.rst b/Documentation/gpu/xe/xe_firmware.rst
index afcb561cd37d..5d23e9f27391 100644
--- a/Documentation/gpu/xe/xe_firmware.rst
+++ b/Documentation/gpu/xe/xe_firmware.rst
@@ -31,6 +31,12 @@ GuC Power Conservation (PC)
 .. kernel-doc:: drivers/gpu/drm/xe/xe_guc_pc.c
    :doc: GuC Power Conservation (PC)
 
+PCIe Gen5 Limitations
+=====================
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_device_sysfs.c
+   :doc: PCIe Gen5 Limitations
+
 Internal API
 ============
 
-- 
2.34.1

