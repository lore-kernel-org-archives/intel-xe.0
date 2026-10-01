Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA3ECA5FCE
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 22:04:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B44D310E494;
	Thu,  1 Oct 2026 22:04:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZTyENHMe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2595D10E453
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 22:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790892242; x=1822428242;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nfS9/TC6e0333cbeFdTAlCNsRPsUcCP0MU0tGa2jJbU=;
 b=ZTyENHMe8Cc/ZYC+AFcEY4DtwrJASlEnw6IPtfC8i4iMtvonHpoLkd7z
 ovYjipKyncHh+fdEnW0z2dzglxK/ct+l9ghA1cDc8FQIV2Fm2AGunEkU9
 frdz8h2ecFz3ZTNK/WvhZ8B3ij8x8bRrPCmiQu3C5CPjbO4K4G+/DWoRN
 DWybz6FDtFfd3Mml91fV0KOWWfIF6OOGlDcPztMMdCqPGPt4GKUS1qLAY
 t1kg+8Jl7bMx9epeA3YoDZ586KgS4kMGR7lNzLPE93W7qjQ8HXmIFkGBX
 nyc4IcClFeDzIZPUzV/6o4yuaTt5ILiPxD+vyRZ2zQq+9plWmTPeo6xCU w==;
X-CSE-ConnectionGUID: yHTcT+1bSe28P7+qV0XINQ==
X-CSE-MsgGUID: 9GPIKJqoT3uB60PDBJZWGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="91684108"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; d="scan'208";a="91684108"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 15:04:02 -0700
X-CSE-ConnectionGUID: atrvW6AGSWysJenpngdLHg==
X-CSE-MsgGUID: 446A0lqKQduZXQK/XkH35Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; d="scan'208";a="276206247"
Received: from debox1-desk4.jf.intel.com ([10.54.77.98])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 15:04:01 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: ilpo.jarvinen@linux.intel.com, david.e.box@linux.intel.com,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 rodrigo.vivi@intel.com, michael.j.ruhl@intel.com, ayaz.siddiqui@intel.com,
 syed.abdul.muqthyar.ahmed@intel.com, intel-xe@lists.freedesktop.org,
 hansg@kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 2/3] platform/x86/intel/vsec: Fix inverted walk_header() test
 in get_features()
Date: Thu,  1 Oct 2026 15:03:47 -0700
Message-ID: <20261001220351.1592138-3-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001220351.1592138-1-david.e.box@linux.intel.com>
References: <20261001220351.1592138-1-david.e.box@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

intel_vsec_walk_header() used to return a bool that was true when devices
were found. It was converted to return 0 on success and a negative errno
on failure, but the boolean test in intel_vsec_get_features() was left
unchanged, so its meaning is now inverted.

A successful walk returns 0 and leaves found set to false, while a failed
walk returns an error that evaluates to true. When no other capabilities
are present, intel_vsec_pci_init() then returns -ENODEV even though the
auxiliary devices were created, and the driver core tears them back down.

This affects platforms that have no DVSEC or VSEC capabilities and
describe their features through device_data instead, which today means
DG1. Test the return value for success explicitly.

Fixes: a6ce8bf3c993 ("platform/x86/intel/vsec: Return real error codes from=
 registration path")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 drivers/platform/x86/intel/vsec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel=
/vsec.c
index 5ab2215fdd7f..7d51f27f09bc 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -641,7 +641,7 @@ static bool intel_vsec_get_features(struct pci_dev *pde=
v,
 		found =3D true;
=20
 	if (info && (info->quirks & VSEC_QUIRK_NO_DVSEC) &&
-	    intel_vsec_walk_header(&pdev->dev, info))
+	    !intel_vsec_walk_header(&pdev->dev, info))
 		found =3D true;
=20
 	return found;
--=20
2.43.0

