Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADCFC27C75
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 14:40:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 842EE10E19B;
	Tue, 11 Jun 2024 14:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZuwuZwfv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C7B10E681
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jun 2024 14:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718116832; x=1749652832;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=phnNhOiyD5DNC/13ciS6sIuEsJbrRMTjDXuC00Lf6Fs=;
 b=ZuwuZwfvvPYtRze0mb4/Xxxpy40Ou8Idr7z0dMi+xweURIiZ2mkIGbWQ
 dixXdpdpE4etBrOxLIIpkHTI39PEEoCQ5iLCSpIHPT1agfmwANmBiEEWl
 jxuQge5FQAhrcQQzpKd0zL4V8frlK8aVoOdHgcoTBii9kbPrNakqf8/Sz
 lxs8HwqIxfJ0j9Db6dNTp2NToA/MMJXGN35V1CpomaOFbgK8/I8GND77v
 oe9iFsx350mOjFJIk/39TJbE2fqltvI5a415EVUY6CgbluhaJAT2A1wVj
 Bc587G5jmNQ7Dg03xhro+p2/Tp9/J3yNWnFGsjGpe5ElsxwCcUZiXFjds A==;
X-CSE-ConnectionGUID: BIMwrUWwTHuq095JkZYnhQ==
X-CSE-MsgGUID: xt0bZ7DJQHq21Fm2PvkqzQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="14784567"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="14784567"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 07:40:21 -0700
X-CSE-ConnectionGUID: 3yoZDSmcR8qaF9Hu29pGNA==
X-CSE-MsgGUID: 1N38S/0kRIaqmYK/xxHYiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="44590320"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 07:40:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 08/11] drm/xe: Add GuC state asserts to
 deregister_exec_queue
Date: Tue, 11 Jun 2024 07:40:50 -0700
Message-Id: <20240611144053.2805091-9-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240611144053.2805091-1-matthew.brost@intel.com>
References: <20240611144053.2805091-1-matthew.brost@intel.com>
MIME-Version: 1.0
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

Will help catch bugs in GuC state machine.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index ab0dc93d7740..26c27ca51b2e 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1587,6 +1587,11 @@ static void deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
 		q->guc->id,
 	};
 
+	xe_gt_assert(guc_to_gt(guc), exec_queue_destroyed(q));
+	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
+	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
+	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_enable(q));
+
 	trace_xe_exec_queue_deregister(q);
 
 	xe_guc_ct_send_g2h_handler(&guc->ct, action, ARRAY_SIZE(action));
-- 
2.34.1

