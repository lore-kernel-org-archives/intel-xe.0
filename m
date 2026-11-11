Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D223360A2614
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 07:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cZcBp1e3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A0610F867;
	Wed, 11 Nov 2026 07:52:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C39E910F867;
 Wed, 11 Nov 2026 07:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794383571; x=1825919571;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=knxtNGSV6nOPOuNqsVhm6T6nXQjf2imljdB5dibnoGY=;
 b=cZcBp1e31HEqE0C8KI9YkU9epm5f0aujdritQf7RKNG/kqsgp4ebZYdN
 4u/deERbc7+1+Uqxj/CQv48HlR8SgKazdMh+oaNd1jjG0vP7cI+GNhcXt
 3iAv3H505m6HRpmG6I5qHSIk5nTj0cUCaSnog0WwZNCfkIgzX+NYEZp9Z
 ULI11pzcutRFq4PINe6T8et5IM/NjokzBeLVWo+VSjj4dGD+XG5OrPtdt
 Ib09HL05p10JPIVojJQiOHkk8IELRGQPQPVnE1DjX4tXDDr/MWRBXXgAx
 lrbR7tAAiC1lvLJ7NymcQIonr4dvJIfs+jhd592qjWKJ1pMg7mZUp5qyz g==;
X-CSE-ConnectionGUID: 8UYuwVs/RhyHhxzzt7sabg==
X-CSE-MsgGUID: Opj/aIejRhS0ktlAARmw7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3032730"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3032730"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 23:52:50 -0800
X-CSE-ConnectionGUID: oTy/JNh7TumoCCXpOXKjeA==
X-CSE-MsgGUID: uADtqCJrQiG2rm6F7BLAtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8780575"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 23:52:49 -0800
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: luciano.coelho@intel.com,
	uma.shankar@intel.com,
	imre.deak@intel.com
Subject: [PATCH v2 2/2] drm/i915/dmc_wl: Avoid blocking on delayed wakelock
 release
Date: Wed, 11 Nov 2026 13:21:08 +0530
Message-ID: <20261111075105.2166760-6-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111075105.2166760-4-dibin.moolakadan.subrahmanian@intel.com>
References: <20261111075105.2166760-4-dibin.moolakadan.subrahmanian@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

intel_dmc_wl_disable() flushes the pending wakelock release work,
disables the wakelock mechanism and sets wl->enabled to false.
It then clears DMC_WAKELOCK_CTL_REQ and sets wl->taken to false.

Flushing the work forces it to run immediately and waits for completion.
When the refcount is zero, the worker clears DMC_WAKELOCK_CTL_REQ and
waits for ACK to clear. This adds workqueue scheduling and ACK polling
to the DC-exit path, just before disable clears the request itself.

Since intel_dmc_wl_put() queues the release DMC_WAKELOCK_HOLD_TIME later
and the DC-exit path reaches disable well before that, the work remains
pending and is forced to run. This delays the POWER_DOMAIN_DC_OFF get
in intel_atomic_commit_tail() for the DC3CO case, where DC3CO is entered
and exited on every flip. On a 3840x2400@120 eDP panel, dropping the
forced run reduced that get by roughly 330 us.

Cancel the pending work instead, so it is dropped rather than run. Once
wl->enabled is false, subsequent puts do not queue release work.

Use the sync variant so that an already-running worker is still waited
for, as it was with the flush.

Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
Reviewed-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc_wl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc_wl.c b/drivers/gpu/drm/i915/display/intel_dmc_wl.c
index c181c1a7ba08..829ffe3b7745 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc_wl.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc_wl.c
@@ -400,7 +400,7 @@ void intel_dmc_wl_disable(struct intel_display *display)
 	if (!__intel_dmc_wl_supported(display))
 		return;
 
-	intel_dmc_wl_flush_release_work(display);
+	cancel_delayed_work_sync(&wl->work);
 
 	spin_lock_irqsave(&wl->lock, flags);
 
-- 
2.43.0

