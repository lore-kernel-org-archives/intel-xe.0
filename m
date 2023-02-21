Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA593C61DA3
	for <intel-xe@archiver.kernel.org>; Tue, 21 Feb 2023 23:34:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84EB310E39E;
	Tue, 21 Feb 2023 23:34:08 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D630E10E391
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Feb 2023 23:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677022446; x=1708558446;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ECCohzcu8d2mwocFCAcyM5uJFODVqY/IGYy2uCCHI9I=;
 b=fMzLnndtux5uIFJcuF6f/sjgaM2J4JU5RsVxmzTOrdc4I1kyCqUDrtRB
 GfrR8Zvtf1n2JNSBuGnjDTWzC/bINBRRpgUGFWjSESoTOBdW5grkph6HE
 DhDInvTitRzlg6jafDBAD0DZXZM48T/yq4t0LuWuH1/wxSJlc1pdz2JEs
 7lEVZceblYIPAUsC/GJUmL4hfSTHCo0ikzrScGl0XE/qMFO63NB3sU3QD
 w73jj1cPk4wZrxHgUH4lYXXviOpC4ylEZoNbb6na3eL2tvrS8h/pPRnhA
 fxCd6u2s942hkhw/uIRaqoORftQ9ijnhQXY66SIpQixzmvW38urTG+ca9 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="313156253"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; d="scan'208";a="313156253"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 15:34:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="621691848"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; d="scan'208";a="621691848"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 15:34:05 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Feb 2023 15:33:48 -0800
Message-Id: <20230221233348.883897-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230221233348.883897-1-lucas.demarchi@intel.com>
References: <20230221233348.883897-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 6/6] drm/xe: Add missing include
 xe_wait_user_fence.h
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Make xe_wait_user_fence.c include xe_wait_user_fence.h so it doesn't
rely on indirect includes and also doesn't fail the build due to missing
prototype for xe_wait_user_fence_ioctl().

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_wait_user_fence.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index 977c963a8cd0..15c2e5aa08d2 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -3,6 +3,8 @@
  * Copyright © 2022 Intel Corporation
  */
 
+#include "xe_wait_user_fence.h"
+
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
 #include <drm/xe_drm.h>
-- 
2.39.0

