Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AAEAD6AAF8
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 19:18:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BFAB10E531;
	Thu,  2 Apr 2026 19:18:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q7vn1oxW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6105510E531
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 19:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775157489; x=1806693489;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K68dptcHYmNgQLwnRp7iozeVBa4e4vo1DW4QsCRAoG0=;
 b=Q7vn1oxWrAi9L8CdsgmXKK52NDF8e+Cvvbye4ciQdxIS08+g0jd6/dqQ
 K3zQ/hQ1rJBtp4Cu+5+Fd9W2pXwj8WZLLpymCI1TCTnYexeXNOe7GSZYw
 jx3LHpZRQcOtX5sXEtzjMI35WZRObkegnLAqzl0M3QdDu6KddWqefq9/x
 9u577iQoS4aUavr2bi8W+TnHQpp2ZR66FOovHWIJjmVwrPasCD9PW5KC2
 no6mbHO4ut14/euJQDL82b7pOmfSja2nC9kKC7IayMFhgVNbod4wVlghU
 y4BBXpuLkKKcOUm52TJUI6o0cgzwOYXab4I+MBBB3gw8s0qHYwfoLI/jC A==;
X-CSE-ConnectionGUID: kHYhVVD+SuWmRTQlprk9yA==
X-CSE-MsgGUID: A8BCyT1xR/mmn4C3K/ouwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76241085"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="76241085"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 12:18:09 -0700
X-CSE-ConnectionGUID: Nty6PzN+Rky1VvZbMEbq7g==
X-CSE-MsgGUID: nT4OWNtcS8myTIFaaILGtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="222212936"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 12:18:06 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 01/13] drm/xe/guc: Update POLICY_SCHED_IF_IDLE documentation
Date: Thu,  2 Apr 2026 21:17:14 +0200
Message-ID: <20260402191726.4932-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402191726.4932-1-michal.wajdeczko@intel.com>
References: <20260402191726.4932-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Starting from the GuC firmware version 70.12.0 the meaning of the
POLICY_SCHED_IF_IDLE has changed, which now acts as a bulk update
of the VF_CFG_SCHED_PRIORITY configurations of all VFs.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index e33bd622ab44..7106fad7beef 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -192,6 +192,13 @@ enum  {
  * `GuC KLV`_ keys available for use with PF2GUC_UPDATE_VGT_POLICY.
  *
  * _`GUC_KLV_VGT_POLICY_SCHED_IF_IDLE` : 0x8001
+ *      [From 70.12.0]
+ *      This config allows to update scheduling priority of PF and all VFs at once.
+ *      Setting this policy to 0 updates all VFs scheduling priorities to LOW, and
+ *      setting this policy to 1 updates all VFs scheduling priorities to NORMAL.
+ *      Those changes will take effect on the next VF-Switch event.
+ *
+ *      [Before 70.12.0]
  *      This config sets whether strict scheduling is enabled whereby any VF
  *      that doesn’t have work to submit is still allocated a fixed execution
  *      time-slice to ensure active VFs execution is always consistent even
-- 
2.47.1

