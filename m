Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1BABEF99E5
	for <intel-xe@archiver.kernel.org>; Sat, 14 Feb 2026 01:04:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A292210E852;
	Sat, 14 Feb 2026 01:04:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QZSM+Xeu";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B99A10E852
 for <intel-xe@lists.freedesktop.org>; Sat, 14 Feb 2026 01:04:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 16EA94381B;
 Sat, 14 Feb 2026 01:04:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB6CC16AAE;
 Sat, 14 Feb 2026 01:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771031076;
 bh=j2tHpRfH2AXto0QuNBhQC0zyM0XVJryZRltGbvGtj20=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QZSM+XeuNpkOmtLzMZGpxQqiYvT/oQoehHYgsqA7W91Lti7QYiVAvUv3EyngnaB3w
 D4yGVEELCg/2WRXaz7vzyPBJRO4gsVsSgK0IDzQd9fDUdriEEJQxs/o8joSC1PN6rn
 z5AG+I6KtEF1EfVmvvrOIcNVMFR3Egm9KZWEuz32UjQz2QyDPMfM4TJ4Gzs/7zmM0e
 AGXxKciXeFPypqMIBwfnKfcRV3rYpK2CTYuOM/B/vYUlKlJoR5py1Y0cir4vGydODD
 j8NCu58x3xN7oPLKbXJN3iHut2K2KFluT97cI14j92C0cDue/tc5Eq4SUzA8kKL98H
 dRzZ1no4hBjiA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>, Sasha Levin <sashal@kernel.org>,
 matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.19-6.18] drm/xe/ggtt: Use scope-based runtime pm
Date: Fri, 13 Feb 2026 19:58:51 -0500
Message-ID: <20260214010245.3671907-51-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260214010245.3671907-1-sashal@kernel.org>
References: <20260214010245.3671907-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19
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

From: Matt Roper <matthew.d.roper@intel.com>

[ Upstream commit 8a579f4b2476fd1df07e2bca9fedc82a39a56a65 ]

Switch the GGTT code to scope-based runtime PM for consistency with
other parts of the driver.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Link: https://patch.msgid.link/20251118164338.3572146-51-matthew.d.roper@intel.com
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:



 drivers/gpu/drm/xe/xe_ggtt.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 793d7324a395d..9e6b4e9835424 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -396,9 +396,8 @@ static void ggtt_node_remove_work_func(struct work_struct *work)
 						 delayed_removal_work);
 	struct xe_device *xe = tile_to_xe(node->ggtt->tile);
 
-	xe_pm_runtime_get(xe);
+	guard(xe_pm_runtime)(xe);
 	ggtt_node_remove(node);
-	xe_pm_runtime_put(xe);
 }
 
 /**
-- 
2.51.0

