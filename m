Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4898EB64DA
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jun 2023 17:58:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 791C910E4DF;
	Fri, 30 Jun 2023 17:58:01 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF09A10E4DB
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jun 2023 17:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688147878; x=1719683878;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hPC6UhbHeto50gxBYeTLR+JAmqcIceLMpPwrLNuHz5Q=;
 b=Lf4xocjisbukW3y+X0RyIsk57acjz7bXS0ZO5iQVx0I23zcs+uW+wv1E
 qUYxs5QUpJGjaaBwgOMXcGethi3wv2YE6B53jlq1nywqjsKXuxcmSsNwQ
 oPLYZPWmOk1tuHWo/VwVypuZWlXlC/Z3HJHnLnvQT8a5FZNk/hbB7fhvs
 TIm4ntHSCug+GN1XIaw40zMFfxGR4gJeAkYu1MQrnNdO4vejNUtWevdjM
 rWo2hQ2+9M8G4K9qDi/bElPIx+pC+PqEEhy+O9CVya2YeKZzB83v5nMJo
 m9VszMY9+U5CwQPusW94h4/6V8DhI52XoZPKSYKnmLRZVNnvKxNLWY8Gp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="365942722"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; d="scan'208";a="365942722"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 10:57:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="841925445"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; d="scan'208";a="841925445"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 10:57:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 30 Jun 2023 10:57:58 -0700
Message-Id: <20230630175804.1096370-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230630175804.1096370-1-matthew.brost@intel.com>
References: <20230630175804.1096370-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 3/9] maple_tree: Export mas_preallocate
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

The DRM GPUVA implementation needs this function.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 lib/maple_tree.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index 1281a40d5735..4a6ecdb12a92 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -5815,6 +5815,7 @@ int mas_preallocate(struct ma_state *mas, gfp_t gfp)
 	mas_reset(mas);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(mas_preallocate);
 
 /*
  * mas_destroy() - destroy a maple state.
-- 
2.34.1

