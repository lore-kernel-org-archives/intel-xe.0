Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F733D13570
	for <intel-xe@archiver.kernel.org>; Mon, 28 Oct 2024 10:52:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D126F10E47A;
	Mon, 28 Oct 2024 10:52:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="I0aCgGXD";
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEEAC10E478;
 Mon, 28 Oct 2024 10:52:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1A14F5C5A18;
 Mon, 28 Oct 2024 10:51:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00300C4CEC3;
 Mon, 28 Oct 2024 10:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730112727;
 bh=AWjY+Jh4gtpC1T5OPEmBU/M+2xT84tsdA88vaJts8HU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I0aCgGXD4b69btwrFx5cW1WpiCGMiTVRJIsYuf9mLnruQuL8g00YUZXCjyyjxHYMo
 6RN69aI2hCp17rc8E4InXWj78V7mvi8OYKtSi/AjD1QgVQ5EOBho2egyZ3pap4erjF
 JYr5ucVExdS92euVSEdClIqJQMDtB5EyanScJpbwK8kzNKS3NCrs6oKWtPOm/YCQaL
 NSMXfM508xLUOYEf91Lc6iGES8LPU1xBkv81PvfRqA+VNQEL227p7zE9QkIWgLz3ap
 xKUB/XdFM6kdxLgM1tZgHgthHwtJT+xu/BN/Fv7NHMRXuI/KYKPZaHgPD840hVFspg
 ZAeTUW4kG2fiQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Sasha Levin <sashal@kernel.org>, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.11 31/32] drm/xe/ufence: Prefetch ufence addr to
 catch bogus address
Date: Mon, 28 Oct 2024 06:50:13 -0400
Message-ID: <20241028105050.3559169-31-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028105050.3559169-1-sashal@kernel.org>
References: <20241028105050.3559169-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.5
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

From: Nirmoy Das <nirmoy.das@intel.com>

[ Upstream commit 9c1813b3253480b30604c680026c7dc721ce86d1 ]

access_ok() only checks for addr overflow so also try to read the addr
to catch invalid addr sent from userspace.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20241016082304.66009-2-nirmoy.das@intel.com
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
(cherry picked from commit 9408c4508483ffc60811e910a93d6425b8e63928)
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xe/xe_sync.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index de80c8b7c8913..9d77f2d4096f5 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -54,8 +54,9 @@ static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
 {
 	struct xe_user_fence *ufence;
 	u64 __user *ptr = u64_to_user_ptr(addr);
+	u64 __maybe_unused prefetch_val;
 
-	if (!access_ok(ptr, sizeof(*ptr)))
+	if (get_user(prefetch_val, ptr))
 		return ERR_PTR(-EFAULT);
 
 	ufence = kzalloc(sizeof(*ufence), GFP_KERNEL);
-- 
2.43.0

