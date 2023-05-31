Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E57C7EE23
	for <intel-xe@archiver.kernel.org>; Wed, 31 May 2023 15:23:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE5110E0F4;
	Wed, 31 May 2023 15:23:59 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2527510E0F4
 for <intel-xe@lists.freedesktop.org>; Wed, 31 May 2023 15:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685546638; x=1717082638;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=u0n4LtJ2U3tPQxsEgjwqB4bSgo8fkk3vbADcuLf9gmo=;
 b=L/0mOGk/xlFVz0h4nKkPMs6F2Rify1ClBXk434kRkzRcBZAwVlZhcWAH
 vckkosC8zK2oHS23Ky+7djEfa2XhLX+xyn+k6unuEfyCk7SjFAOcJQVgg
 MM5GrgffGFwBAkk8DaBrYaWpNF7UETOnV753bQL84Bz16Ito32TarurUP
 d1aC5I0IkMLaSHbaEdihhbzxNfsVgr2EdYhyVf13TMWhrb/ZmsH63migg
 qOQ5ltZYMK+dHI0vd8GNAN7HhY6jYD+z5Wom6zZfkP387VFgNCpBgdITH
 mPN9y6nJ4pESFlVS6qqLWh1AboyA5GNLedYFVQ3LTx4kRbpUv8NVpXwRl w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="339865484"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="339865484"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 08:23:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="796747875"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="796747875"
Received: from amokrov-mobl1.ccr.corp.intel.com (HELO 9d3bf2d3f760.intel.com)
 ([10.251.208.253])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 08:23:55 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 31 May 2023 15:23:33 +0000
Message-Id: <20230531152338.6-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/5] drm/xe: uAPI cleanup
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

This series addresses some feedback on xe_drm.h provided here:
https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.html

It is based on xe-rev1-2023-05-02, not on drm-xe-next, so it will
likely break CI.

v2: fix ordering of defines and fields in uAPI (Lucas De Marchi)

Francois Dugast (5):
  drm/xe: Use SPDX-License-Identifier instead of license text
  drm/xe: Group engine related structs
  drm/xe: Move defines before relevant fields
  drm/xe: Document usage of struct drm_xe_device_query
  drm/xe: Fix some formatting issues in uAPI

 include/uapi/drm/xe_drm.h | 171 ++++++++++++++++++++------------------
 1 file changed, 90 insertions(+), 81 deletions(-)

-- 
2.34.1

