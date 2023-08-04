Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0389C001DB
	for <intel-xe@archiver.kernel.org>; Fri,  4 Aug 2023 21:33:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9078810E761;
	Fri,  4 Aug 2023 21:33:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B001B10E009
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Aug 2023 21:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691184779; x=1722720779;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VFWedceHqS8RA5o7ei9pa1CZdcagqai49qyE11Fkze0=;
 b=RLB1GkpNfyDPhL1AYI6TGmO/CSFwuXqFjLXm5hCVTQt/wxAuVAUI3JTW
 XySqVGarE/r7UueWtLplmxW7n0LwfShnn7T7z/ALHKS2VhSVuj8NtmTiY
 mBpS4GSLE2pnVq8Z8/x3hsHnRgVc5bf8TZhzRqlYxEMG8RCIC7xwtVAbT
 sk3WwOu7lysH+kgvFmiZ4XuW2jofIM0wLVJvKHJEFNx+P+rcbgfVEE3Jq
 eBr6XT83K0+I00q+9VCO5M0sRLk1QZQoICtzFV3+mEVSukT7tGlSiNw6Q
 Wla5R205kVDgv5wmphrIvXp4kUL4yB/OJIStItnMkHL7EvNF3L0crcvBp A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="370241004"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; d="scan'208";a="370241004"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 14:32:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="820295548"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; d="scan'208";a="820295548"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 14:32:53 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: jose.souza@intel.com,
 Lionel G Landwerlin <lionel.g.landwerlin@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Date: Fri,  4 Aug 2023 14:32:50 -0700
Message-Id: <20230804213253.2381705-1-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/3] Port CPU-GPU timestamp correlation to XE KMD
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

This is a port of prior work from i915 to support fine-grained CPU-GPU
timestamp correlation. Prior work is linked in this issue:
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/384

Mesa and Perfetto are the consumers for this and the issue documents the
need for higher accuracy correlation. 

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (3):
  drm/xe: Fix array bounds check for queries
  drm/xe: Set the correct type for xe_to_user_engine_class
  drm/xe: Correlate engine and cpu timestamps with better accuracy

 drivers/gpu/drm/xe/xe_query.c | 145 +++++++++++++++++++++++++++++++++-
 include/uapi/drm/xe_drm.h     |  95 +++++++++++++++++-----
 2 files changed, 220 insertions(+), 20 deletions(-)

-- 
2.38.1

