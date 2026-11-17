Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D64D606A323
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 05:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i9/gh6RO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A465110E045;
	Tue, 17 Nov 2026 05:46:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D83D210E045;
 Tue, 17 Nov 2026 05:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794894392; x=1826430392;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Cs3WwgVM7+1xJT1iHAFpwmyyahC167TSPyN41b12X+M=;
 b=i9/gh6ROuX7yrn8O70ITUdmRgVgi/SxO2Ycgdg2aVGFvsIa9D2GY5kbf
 P2lZspX6e5nytxNaWyMixol7rLy0AsafXKzXRQK0jcHF/f/RIvOcFs0vI
 jLOHqSVWov09HdINKLBm5pVfZmg+Qlhz0zFSQYFRvfNDV0HZyl4DOYCwT
 ypelEvaeH/o5a6xRFOdvQKfz/SAkC0LCIa705ISQoUbj8y0LSdw2k8zAL
 my4KEjzBcTd3L8no7bbsf7LL4fIoh6uYc8M4I8C8Nq7xrTG2bkWOSJVAW
 VMdYbwqGX9AABL2tw8FQERAElVvZ2Zyx9Zb/ktuZyzy22O+n5dGKUemv5 g==;
X-CSE-ConnectionGUID: NOcn2ZpuQd2I0B3GCj4jNg==
X-CSE-MsgGUID: l6G0tN8iR2aRgT3aSHa9QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3649149"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3649149"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 21:46:31 -0800
X-CSE-ConnectionGUID: PTHkcAtITaKO2kCBt14hoA==
X-CSE-MsgGUID: xvicYrG/SzuSEmlAVS8UHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; d="scan'208";a="10264567"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 21:46:30 -0800
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [CI v2] drm/i915/dmc: Test Xe3p_LPD DMC v2.44
Date: Tue, 17 Nov 2026 11:14:36 +0530
Message-ID: <20261117054435.2400369-2-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105091559.1784255-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20261105091559.1784255-1-dibin.moolakadan.subrahmanian@intel.com>
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

NOT TO BE REVIEWED/MERGED

Hardcode path to DMC firmware for CI purposes only.

Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 56e831b2a..864b41909 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -126,7 +126,7 @@ static bool dmc_firmware_param_disabled(struct intel_display *display)
 #define DISPLAY_VER13_DMC_MAX_FW_SIZE	0x20000
 #define DISPLAY_VER12_DMC_MAX_FW_SIZE	ICL_DMC_MAX_FW_SIZE
 
-#define XE3P_LPD_DMC_PATH		DMC_PATH(xe3p_lpd)
+#define XE3P_LPD_DMC_PATH		"i915/xe3p_lpd_dmc_ver2_44.bin"
 MODULE_FIRMWARE(XE3P_LPD_DMC_PATH);
 
 #define XE3LPD_3002_DMC_PATH		DMC_PATH(xe3lpd_3002)
