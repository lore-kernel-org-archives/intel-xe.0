Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A788AE7545C
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 18:09:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 768CF10E313;
	Tue,  3 Oct 2023 18:09:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A12D210E311
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 18:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696356558; x=1727892558;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gwiU7kKzG1+tFSTThWO8Ox/Hri3VK2UMu8RlDYIkwKw=;
 b=FW/80iCjawBCB3lvekg5ovN+QyDO3Qo41XDIVQGA0ydwaDu7qWVDO4td
 pCoR646srrRx3jI0lSP4MebnFke1DahH92wylcOUaN0wq6hBV5ID18tzU
 dd71t6sGTN2LihJeAMPjXaw2iMGQdSv7lNzHqSq4NgD1hsDAbiPWr8vnB
 +QK8ByYZ4tyGnVoYft8D4lrPt+p8DyFxdH6SfB2oRPl7WzIydDjduul8Y
 WYMbcmAbgrgON2VbH7YRw+CiJGUPTV15Dr+XyPrxxXmFbIHlpsjVmKAMn
 iSl9hwX4nhwgUHk6P1I/sdXxq5SSyhBmdyP6tkdornkmUe+r+fTnzrxq7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="386813748"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="386813748"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 11:09:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="866977599"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="866977599"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 11:09:16 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, francois.dugast@intel.com,
 jose.souza@intel.com
Date: Tue,  3 Oct 2023 11:09:06 -0700
Message-Id: <20231003180909.3241390-1-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 0/3] Port CPU-GPU timestamp correlation to XE
 KMD
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
Cc: rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This is a port of prior work from i915 to support fine-grained CPU-GPU
timestamp correlation. Prior work is linked in this issue:
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/384

Mesa and Perfetto are the consumers for this and the issue documents the
need for higher accuracy in correlation. 

v2:
- Change commit headers to fixup!
- Fix kernel-doc errors
- Include review comments

v3:
- s/rsvd/pad/ in struct drm_xe_engine_class_instance (Jose)
- Initialize pad

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (3):
  drm/xe: Fix array bounds check for queries
  drm/xe: Set the correct type for xe_to_user_engine_class
  drm/xe: Correlate engine and cpu timestamps with better accuracy

 drivers/gpu/drm/xe/xe_query.c | 147 +++++++++++++++++++++++++++++++++-
 include/uapi/drm/xe_drm.h     | 104 ++++++++++++++++++------
 2 files changed, 224 insertions(+), 27 deletions(-)

-- 
2.38.1

