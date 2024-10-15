Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6018CFC280
	for <intel-xe@archiver.kernel.org>; Tue, 15 Oct 2024 09:47:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7196D10E092;
	Tue, 15 Oct 2024 09:47:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FNDiVsIh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4890510E092
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Oct 2024 09:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728985677; x=1760521677;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xdd1LUxBjZfyMGQ/OAO4icCNnaif8sZQ/DDUri/t6YA=;
 b=FNDiVsIhcjH67hACUmIRgF+ELduv8uNwwdO4Y4u/bkKOc9Dfx2JYbiZ3
 JNQXPN62e8EmndgE8T4a9SPakhzml3is1cYQ5ucQdgNR/TSnfbgDCd5+H
 6xO/ETX0y61UBcBwa//Fr5uYliMVipqBpGHu8CQH1KsAxXHameVosBBme
 Rnr2mlMl+wH2/7UHViut0TSH4dE3PsuuE9R6U/85EI8ao1oJ4rbs34hbX
 TKjYr09zhDNIHxiubi5YMEFPEyjbk1HNgjZfbQbXOTDeJaVHC13TqitCr
 T6jJYCcR2dxk8fcyNs03n9CLWgbC7rO76LGYik4gzeiJOYxmciCgc/UzJ g==;
X-CSE-ConnectionGUID: G+vscH0pRqqlU4RP2K8tfw==
X-CSE-MsgGUID: gzi1juaJSe+ZL3FMEqB7cA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="27850220"
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; d="scan'208";a="27850220"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 02:47:57 -0700
X-CSE-ConnectionGUID: 9y9Fx8J2QmmZk7QiHm+h3Q==
X-CSE-MsgGUID: EAb0L0mKToukm/hAIEk3Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; d="scan'208";a="82888581"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 02:47:56 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 1/2] drm/xe/ufence: Prefetch ufence addr to catch bogus address
Date: Tue, 15 Oct 2024 11:05:45 +0200
Message-ID: <20241015090546.3082719-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241015090546.3082719-1-nirmoy.das@intel.com>
References: <20241015090546.3082719-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

access_ok() only checks for addr overflow so also try to read the addr
to catch invalid addr sent from userspace.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index c6cf227ead40..2e72c06fd40d 100644
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
2.46.0

