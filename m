Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4814AC25B78
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 12:34:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D3C11224D;
	Tue, 28 May 2024 12:34:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c1jwaDUJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 519CC10E231
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 12:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716899655; x=1748435655;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=yKcrcHLWEpQmDIHm5Vx2DzXuQwW3iP6Rwi0lJG+dDQ0=;
 b=c1jwaDUJ2d3P+AAlYRVi73gGvfmFiEOIsU7cs5okP1i11kSF8r039vMD
 OSPC0Ov5wDc6k9hIZADMh2eGSDtUSg06yPjIXv0yyeU5638mo8btJmks6
 DlHyESR1o2/RXh1JBKjJ8i0YjUl0PQvqVO8VT0XcYFIIUvsByvZsx91Hk
 z2wdetomV8eeUrRfJxDpmN9C7ZRTiWbaC19CSkj91iqdeCIdsAJfHvo9R
 ZgrmKl1c2roYBda6VQfXOxWVJh9Y1zQkLFkRUd9speftgYXepNZchEHeZ
 JYIH4/D6F5DysgnLrwrmPVpm+kquMIyM/QDP7972ZrSintnfGkFWek6AY w==;
X-CSE-ConnectionGUID: qPLQIM3DQSiS2WpZTeFZQQ==
X-CSE-MsgGUID: rSEuwq5fRz+DJ775eIq4UA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13065061"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="13065061"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 05:34:15 -0700
X-CSE-ConnectionGUID: BIHsLu5HS3S5KuQ5xyrbNw==
X-CSE-MsgGUID: dPh7K+1RRVOHzHpdHDcUVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="39880513"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.233])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 05:34:15 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v5 22/22] HAX: drm/tests: Add a missing Kconfig select
Date: Tue, 28 May 2024 14:33:43 +0200
Message-ID: <20240528123343.169970-23-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240528123343.169970-1-thomas.hellstrom@linux.intel.com>
References: <20240528123343.169970-1-thomas.hellstrom@linux.intel.com>
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

Fix the following warning:

WARNING: unmet direct dependencies detected for DRM_DISPLAY_HDMI_STATE_HELPER
  Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_DISPLAY_HELPER [=y] && DRM_DISPLAY_HDMI_HELPER [=n]
  Selected by [y]:
  - DRM_KUNIT_TEST [=y] && HAS_IOMEM [=y] && DRM [=y] && KUNIT [=y] && MMU [=y]

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 928cf13ff537..00c7dcb80806 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -79,6 +79,7 @@ config DRM_KUNIT_TEST
 	depends on DRM && KUNIT && MMU
 	select DRM_BUDDY
 	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_DISPLAY_HDMI_STATE_HELPER
 	select DRM_DISPLAY_HELPER
 	select DRM_EXEC
-- 
2.44.0

