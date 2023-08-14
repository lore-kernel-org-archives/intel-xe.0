Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBF2C04FDF
	for <intel-xe@archiver.kernel.org>; Mon, 14 Aug 2023 22:37:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D157110E237;
	Mon, 14 Aug 2023 22:37:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9560810E132
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Aug 2023 22:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692052662; x=1723588662;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GeKKOZfyzGqLzfbTyafgFibX1y4rZn15QTMWx1oyAeY=;
 b=AWTYD+8Dp6Do25Rq6ZCESFedz27nfbBGCo8UEIHPbB358P0Q92NqltzR
 VnGzaolClLvgh3VHAcJK6QQIemrQHYS0q5iy7smM6nJtEjupiQvm+FP1b
 gA5aM5uUUAbeVNR0ErHEeSsFH4zL5CPF6rHnN9HqjXrfo8m6uMmrae/QG
 +EXSYv7see2AQXquOkK0rXKqDOU6kxG6usT55NjWwgSTaBdn5j71Rhzmb
 7aP0LHAWcxFfEsbTy0m3wdOYse69HdGTjqz0NHDd1tuGaMihVW0DOkVsZ
 DvNduQOyVlrzpnRpgQJfaZL3HHNVoEvx6qzANfBEiRD9bJjLnv+cGb0RY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="403130426"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; d="scan'208";a="403130426"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 15:37:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="1064239867"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; d="scan'208";a="1064239867"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 15:37:40 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 14 Aug 2023 15:37:30 -0700
Message-Id: <20230814223734.375449-1-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/4] Port CPU-GPU timestamp correlation to XE
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
Cc: Lionel G Landwerlin <lionel.g.landwerlin@linux.intel.com>
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

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Umesh Nerlige Ramappa (4):
  fixup! drm/xe: Introduce a new DRM driver for Intel GPUs
  fixup! drm/xe: Introduce a new DRM driver for Intel GPUs
  fixup! drm/xe: Introduce a new DRM driver for Intel GPUs
  drm/xe: Correlate engine and cpu timestamps with better accuracy

 drivers/gpu/drm/xe/xe_query.c | 149 +++++++++++++++++++++++++++++++++-
 include/uapi/drm/xe_drm.h     |  92 +++++++++++++++++----
 2 files changed, 219 insertions(+), 22 deletions(-)

-- 
2.38.1

