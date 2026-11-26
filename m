Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106FD606A327
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 12:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PbLVam70
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C964010E29A;
	Thu, 26 Nov 2026 12:43:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 793B510E29A
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 12:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795697002; x=1827233002;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AyesUnkJOXel6tJEfjF+HBr1uDba19PpjqeJ7nrp08o=;
 b=PbLVam70iCraGdKswlGTfTRZsiGuX5Kega1xfaKs1mkx+d71bl021Qk1
 6zQ5m7i2PVe7mR+LBWpkXiCmMCtCPwkQk5mHvYHrgt2HJo46AsJpNLaoz
 iX0MvuEPPr3J2WdnvFG8M6avsSnxCRTXY4BXKEMlA6oR3xzt1FdF0deFz
 RLdpb7fg+F1Wjwp3+WuUKFmbzZ4ZSgmLqCtG5kNMZRtWX+TwK1U937RpD
 l/zdDbuI5QI81liscxSotSRcWJaPjuCPxACFqOXgRkS75xrRqnkL5fSyu
 Sinzd4mUXu2HEDlaNZ4/fxcphAiFnEMcciqdwFrHwEggCDeaWLJMn5s+M Q==;
X-CSE-ConnectionGUID: 9KCiI4G5QVet2/Td684LqQ==
X-CSE-MsgGUID: otQ21Vx7QpaZEAx5n38Q+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4559379"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4559379"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 04:43:21 -0800
X-CSE-ConnectionGUID: CfkIxSmFRe+jZQOuc864AA==
X-CSE-MsgGUID: ZyPd1u+yT7K0oOXY244yzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12055529"
Received: from psoham-ms-7e03.iind.intel.com ([10.223.55.64])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 04:43:18 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 anshuman.gupta@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, raag.jadav@intel.com, rodrigo.vivi@intel.com
Cc: soham.purkait@intel.com
Subject: [PATCH v2 0/2] Wedge device if page offline list is full
Date: Thu, 26 Nov 2026 18:13:11 +0530
Message-ID: <20261126124310.2187015-4-soham.purkait@intel.com>
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

 drivers/gpu/drm/xe/xe_ras.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

-- 
2.43.0

