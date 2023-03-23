Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84949C6FD1F
	for <intel-xe@archiver.kernel.org>; Thu, 23 Mar 2023 02:58:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65B2810E432;
	Thu, 23 Mar 2023 02:58:01 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D197910E42E
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Mar 2023 02:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679540278; x=1711076278;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sUulvKRiZXwyhnEsIg3ZbCNBWsezdaw+Z01gIV9/KU8=;
 b=JB5pqjs1v2Lzj4r8QIhRANibIUj3vbgoPdJpx9yu/aUTxEycqnli5xTT
 2iGoxfyYf6h8hydH+N82SdB3AwXcZpU/WZ3q16YdWl9nnxGIXaM0xTBF5
 iR5m++Es/Dr5zwzjblLRq/hqvT8aVyUVQ0HGtX4WVBQsar3a4W2exPLnW
 gEP5khTCNvgH7JAKwOY0rovfgJUB2Cc8PdIwO58z4AeOOcpEaQQ50H6JP
 hfe2XU0zf1McaRR9kZlg+WSXiweL3ZVaXYlGYbn7WUqh6eIkVikgrQMil
 xGI4LQF0C1592mIOmkePV/R3k5/sMiGBF3qU11TO1WVcYFE7XpaFuj60h A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="338103028"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="338103028"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 19:57:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="675538692"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="675538692"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 19:57:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 22 Mar 2023 19:57:59 -0700
Message-Id: <20230323025801.822678-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH v3 0/2] Proposal for engine query uAPI
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

Adding a new IOCTL rather than reworking the DRM_IOCTL_XE_DEVICE_QUERY
IOCTL. Reworking that is an option is people have a strong opinion on
it but I personally like what I put together.

The media UMD needs something like this.

Let's agree on the uAPI and then get this implemented.

v2: Forgot local changes on the patch
v3: Add 'hw' prefix to hardware engines

Matthew Brost (2):
  drm/xe/uapi: Use hw prefix for hardware engines
  drm/xe/uapi: Add query engines uAPI

 drivers/gpu/drm/xe/xe_engine.c          | 12 +++---
 drivers/gpu/drm/xe/xe_query.c           | 12 +++---
 drivers/gpu/drm/xe/xe_wait_user_fence.c |  8 ++--
 include/uapi/drm/xe_drm.h               | 49 +++++++++++++++++++++++--
 4 files changed, 61 insertions(+), 20 deletions(-)

-- 
2.34.1

