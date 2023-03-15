Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D349C61DA4
	for <intel-xe@archiver.kernel.org>; Wed, 15 Mar 2023 23:19:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5633810E013;
	Wed, 15 Mar 2023 23:19:23 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE4410E067
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Mar 2023 23:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678922361; x=1710458361;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ncJK+x1efFas9V7VogwAQ8sAW7MGxCobF0w0kytNyCk=;
 b=HJMB5xYc1UAa7rYO/pIiMTCjF0ZAHlysIPpmOzRtZBYv5YON2FllGrD1
 a7tOkmk1ohlYWLxWlRH9FbWt7imt50dFMoRE6yGeDBISvOXg1BlMilgZ0
 UT3/IKbv3uCfZ1y7RV9xLrdEtHy4tHS5wM1hZHXnYyZjNJVQ4/k6Q57aN
 bwhmTNUNG6qAtb2Poa/rDPtrdf0lEW/jnD6IixuqciMoywXCbWvTT7T8K
 V5hLjjNcDDS2iGmEMpJ5pjlVA8pDVJy4u2YfKgbKc5ahIcoGFTZKW+zNy
 44hHqGdfdCx2nbf/uiuaunppexcAWifaMIr2dMvtjB1rO28c7hcQ4fYms w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="317491012"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="317491012"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 16:19:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="790018443"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="790018443"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 16:19:18 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 15 Mar 2023 16:19:16 -0700
Message-Id: <20230315231920.4095284-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230315231920.4095284-1-matthew.brost@intel.com>
References: <20230315231920.4095284-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/6] maple_tree: Export mas_preallocate
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
Cc: paulo.r.zanoni@intel.com, lionel.g.landwerlin@intel.com, dakr@redhat.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The DRM GPUVA implementation needs this function.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 lib/maple_tree.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index df352f6ccc24..312cc1ceb534 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -5726,6 +5726,7 @@ int mas_preallocate(struct ma_state *mas, void *entry, gfp_t gfp)
 	mas_reset(mas);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(mas_preallocate);
 
 /*
  * mas_destroy() - destroy a maple state.
-- 
2.34.1

