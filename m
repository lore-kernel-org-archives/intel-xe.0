Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A32CD11DB
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 22:12:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8CC010E25A;
	Mon, 25 Mar 2024 22:12:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EXFQNUPF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC6D10EB32
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 22:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711404740; x=1742940740;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BGdCC48RMd/QxEum8bv/R0Opn+JQXGEkIKfm7iC6kkE=;
 b=EXFQNUPFrDiaJtAaZweMoOb6osaiaX1mq7Vz4YqNziKFF7EE8oJpNkmK
 IdLvGbaWPqzXR1dDXPRaieS3pRu1XqOI8R8QXy7ubu6jxGfw7hz6q1GLr
 gS07ZwgXY1Iph/gwr+JWT79AYjEHAZxs07IWK1I90t06wH4f9SaugOWY4
 Ko0I0u7zylA4gbq4O1RVjG6RfBWAxGp0dv9QvCR7TEysHvEYzb1mlJBXB
 WvYHIydSM4OtxMeKfadh7GqoWhMA+5T4EPAD670e5ZlhF6h2CAw6WiHWf
 aUroT6cgBX4OJVjcDT7BFcJcyfacJbPv3o0l4TEkg6CxAcy/0OAZRK0Wa g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6562149"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="6562149"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:12:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; d="scan'208";a="53217162"
Received: from saurabhg-nuc10i5fnh.jf.intel.com ([10.165.21.145])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:12:19 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 akshata.jahagirdar@intel.com
Subject: [PATCH v2 0/1] Send flat_ccs value in struct drm_xe_query_config
Date: Tue, 26 Mar 2024 03:10:30 -0700
Message-Id: <cover.1711447408.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
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

Currently, we don't have any check in IGT testcases if platform supports
compression or not. Send this flat_ccs value as part of the struct
drm_xe_query_config so that we can read this value in the igt testcases
and proceed accordingly.
Fixes: VLK-56136

Akshata Jahagirdar (1):
  drm/xe/xe2: Send flat_ccs value in config

 drivers/gpu/drm/xe/xe_query.c | 3 +++
 include/uapi/drm/xe_drm.h     | 1 +
 2 files changed, 4 insertions(+)

-- 
2.34.1

