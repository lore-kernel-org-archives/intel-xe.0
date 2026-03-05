Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD376F513E6
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 23:00:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DEEF10EC85;
	Thu,  5 Mar 2026 23:00:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DQszu8Wy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FCF810E112
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 23:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772751636; x=1804287636;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=KVjRLtDk1CIaZzU3d8GNJ/WKKHfBE70/oWJanH5+f4Y=;
 b=DQszu8WyMpZvII6zwF4LrXwOAP0gvqUfrVmxYLpOktOCr5TZbE4ubXW1
 dG4ruz7cJuvAr4m99cNtsscF1wHesPNaAnt2qTkEH+UEYqjPo3+ye3xHt
 lZWjMp9tt0980O8mEwR60FE0FbEEr0xe4sAui5ZDG8+/T3RXd+NSTejDQ
 Odo2NmQDhafUpZ1QWJXztcSoBHQRXf+rBfip0a8ld+gCGE/EVxwkSKmuv
 iyLu3rWuzUwCKCg3TOi2iER7Zu9qkmi8bjVOen+VX+dGQnmq2iy/02Rg8
 ecUmTE2V7o8naywNGAlustA7qjD6BgdZ4N8IN5AWSyPc/ALXlVkXvB32y g==;
X-CSE-ConnectionGUID: jp/BGtxATECm+worlGWDGQ==
X-CSE-MsgGUID: Ib7qCaP9RraKGtqV1ydwtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="84940884"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="84940884"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 15:00:36 -0800
X-CSE-ConnectionGUID: PYpdj1gYSyKZcyvroO1f8Q==
X-CSE-MsgGUID: vcAkmtmSR42t8e6fNJD3GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="216004876"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 15:00:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 0/2] Add type-specific GT loop iterator
Date: Thu, 05 Mar 2026 14:59:26 -0800
Message-Id: <20260305-gt-type-loops-v1-0-aa42e9fc3f06@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM4KqmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwNT3fQS3ZLKglTdnPz8gmLdVItUk6Rkk5QUQ8tUJaCegqLUtMwKsHn
 RsbW1AIneC+FfAAAA
X-Change-ID: 20260305-gt-type-loops-e8e4bc4dd19e
To: intel-xe@lists.freedesktop.org
Cc: Farah Kassabri <farah.kassabri@intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=916;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=KVjRLtDk1CIaZzU3d8GNJ/WKKHfBE70/oWJanH5+f4Y=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpqgsT1Fxpdo8SdMdoi0QlY1Fw5oEhXMwtMo3fN
 BVN0re9lhqJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaaoLEwAKCRBNeSQFyHKQ
 BEzeD/wKrL151HyunQrISyAoBpsWBAH+u4g2y2Scl7KJemPw0QiBuKBK+vgjpad4Cf3pW5Ml8nG
 I4fIIwdZ+f3MSCnPfOXBMn1vYsyWaL8v2o4rIpY80MHzQCzIpoJsqP9m4YpMwrGLby8+u9DOJvU
 JhJex8j/ErKnoY8tDMTNv5X4PigCK7kK+8W9IEDHRXGgGr79z7WKVn82aayTDF0utsV3NY0xQNq
 codISD99tB79U1cY+peUeqaqXCXvpzrtaJJLiHd0NPqJRT0jLKdag2TpLxiyaYfC1Oxr2htmwRe
 /W1S73ll/1to/UaGa/kQgRJ2ACer19Ma/6SqTXACUs0ddz82xwdy5y5eQcivQQ1FKEebPl09jIj
 ZymXULDZLDK/0He94jyS5XZymmK45/6BQgquDwXdaDA0223uRqiYthAmD7MXCUTS86sO0r3zSvN
 TNjMPKPPyIO3USnvMZA1Z1/ooEDaJCj2dNhq+tXefvhezAOvaiIaeUAanLRiBzcCu0ZXqedpx1O
 bfWuhd9KfpzN9xllYnwc5nZacE4ysktnsBUNm79CcOwG1M/i3BKwG/CNdhcFvS0a5SbMOBwjUOv
 NGrtDhv2dnjfgaDKNW7Bn7qsJU/8Em7GFcBejnyGp+C3JXANhi3ito2C1Zw14efNNeqoIi+I4K/
 IDU7K7Si3SQklUA==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

Although we don't have too many GT loops in the driver today that are
restricted to a specific GT type, we expect more to show up in some
upcoming work.  Add a new iterator macro to make this slightly simpler
and convert the existing type-specific loops over to use it.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
Matt Roper (2):
      drm/xe: Add for_each_gt_with_type() iterator
      drm/xe: Utilize for_each_gt_with_type() for type-specific GT loops

 drivers/gpu/drm/xe/xe_device.c             | 5 +----
 drivers/gpu/drm/xe/xe_device.h             | 4 ++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 5 +----
 3 files changed, 6 insertions(+), 8 deletions(-)
---
base-commit: ce63d46cc8fc3bb754efb93026b55acaa616cfa2
change-id: 20260305-gt-type-loops-e8e4bc4dd19e

Best regards,
-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

