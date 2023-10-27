Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E84C25B6E
	for <intel-xe@archiver.kernel.org>; Fri, 27 Oct 2023 22:29:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA6410EA1C;
	Fri, 27 Oct 2023 22:29:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E43F10EA1C
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Oct 2023 22:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698445780; x=1729981780;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eVRVZTtbXN6+IhllgbGN2XemYrKMVewcBfzjxeuX9aw=;
 b=KrBYWBc7OXWpvpre4advC0fGZg53T9xBVJmIdcjmy19DqcpFpaDbF7QF
 +LnU72vWNtWQaYOnH1vy6etIsaaOednaRuUHHtKfY547tTj33T3Wxfa/b
 5F8540RqOq0Du6RNmXsqkf1kZLyfu+0IhWLtgfZbezKCYMo8+WjwXf0TG
 /kf5s2q2gXijmoosVP647RJHgzXLxsbUq/293PNVJKxebTl3YUjb6uEZk
 ZDi/Jsb2MEH+A/QTJ6DtsYTBskAyh8Ed9rYkBxzSV86fCiCgPQyuLO07v
 H0yWXwcz8L3jU7hODu2hSKS9lNGtC8YfAt6KekN2DqUG70zW95sQE2GOY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="9397771"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; 
   d="scan'208";a="9397771"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 15:29:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="763360351"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; d="scan'208";a="763360351"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 15:29:39 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 27 Oct 2023 15:29:16 -0700
Message-ID: <20231027222928.1981633-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 02/12] fixup! drm/xe/guc: Report submission
 version of GuC firmware
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

Major GuC versions greater than 70 will have the submission version in
the herader irrespective of their minor version number.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 3032c4f148d4..91d4a2272ee7 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -278,7 +278,7 @@ static void guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
 	xe_gt_assert(gt, uc_fw->type == XE_UC_FW_TYPE_GUC);
 	xe_gt_assert(gt, uc_fw->major_ver_found >= 70);
 
-	if (uc_fw->minor_ver_found >= 6) {
+	if (uc_fw->major_ver_found > 70 || uc_fw->minor_ver_found >= 6) {
 		/* v70.6.0 adds CSS header support */
 		guc->submission_state.version.major =
 			FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
-- 
2.41.0

