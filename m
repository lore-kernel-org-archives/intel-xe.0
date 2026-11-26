Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7702D606A321
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 09:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mL/2aMlE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27A0B10E954;
	Thu, 26 Nov 2026 09:43:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 990E710E3EC
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 09:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795686207; x=1827222207;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Yz1asVuIQyVGX4ilid/piPkwtfPwrl+QYOeXoghKdXM=;
 b=mL/2aMlElIiD+AD1gqeZaaD9Mt3+u8+xo/xTjv3Sqqe0nQa2/tUHpf6d
 iO1QdE6A3d3kie4ovB2lOjEpcNSZGrG1wOpFzPvIIAYCJmDfaxoLer+Nk
 uRsW4q4aRkuh8e6JAVbmgpSe3auCa60Tg+L+W5sjU0y5mC0Rqe1U4p9sR
 iM4JvQfFPYeczlmoDMFbARbysBSD6dcXMrxRwfBKkj1gjXbLNVTbLoT5K
 uWA/dFCaZJgimxYiUdMf6w0jSYjyijs8ub2JZjjxYp5dp1BYCOa+GP3aE
 1dqbM2HDklYAN35wCtGxz0q5jE9hYQWtTw63XGYR0cEgDt/+sc04VegEN w==;
X-CSE-ConnectionGUID: S2K1NmfITPejvemmnQ3a8w==
X-CSE-MsgGUID: V6vtvaBZSYWDe4N2sdrh7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4638556"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4638556"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 01:41:51 -0800
X-CSE-ConnectionGUID: 70BcbIKiTGiFazi3jNEzLg==
X-CSE-MsgGUID: ZqT34HmISLCmYtSkELUmpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12447417"
Received: from psoham-ms-7e03.iind.intel.com ([10.223.55.64])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 01:41:48 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 anshuman.gupta@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, raag.jadav@intel.com, rodrigo.vivi@intel.com
Cc: soham.purkait@intel.com
Subject: [PATCH 0/2] Wedge device if page offline list is full
Date: Thu, 26 Nov 2026 15:11:41 +0530
Message-ID: <20261126094140.2102442-4-soham.purkait@intel.com>
X-Mailer: git-send-email 2.43.0
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When the firmware's page offline list is full, no more pages can be
offlined. Wedge the device with an unknown recovery method in this
case, at probe and at runtime.

v1:
 - Refactor subject lines. (Riana)
 - Split the patch. (Riana)

Soham Purkait (2):
  drm/xe/ras: Wedge device if page offline list is full during offlining
  drm/xe/ras: Wedge device if page offline list is full at probe

 drivers/gpu/drm/xe/xe_ras.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

-- 
2.43.0

