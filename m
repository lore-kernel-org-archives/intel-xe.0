Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 274D6CFC500
	for <intel-xe@archiver.kernel.org>; Mon, 14 Oct 2024 07:37:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E1110E3A8;
	Mon, 14 Oct 2024 07:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M08I3ytR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1ECF10E3A7
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Oct 2024 07:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728891444; x=1760427444;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rcGLLrmFmIQlUUJB7lZ8m2CHUniJFsv+NM0FPqPvMR8=;
 b=M08I3ytRkSJHrzUgll/KcYbbxLfpdMk2ItPFf3JlLV9q1f2/zPS7uZzA
 fRUOXODdzHOPh3mEgofysvx65ruJ5x+BaP8FTUHludaVSiH9X8KMtIUTR
 v4GPTefgpzERRGVS92SXJHV8XU5MVqz46pq8vKGoKf7X+90VC/3aG52gK
 qQ9VpQZ6F9web8bUur7BPJ4IzAzecc/RmkMbATnox3fw1l+kZX7z4xLBZ
 yPWxYcpJqOXEPfmecRTNsrGIaDsRwdZGSs43gnPthS4aACORCPjPF95kg
 IzyR0CJSuVgJsofb7z47mHGnYqccprgivT5ZFMTm8YdYzAcGVMywTh2VH A==;
X-CSE-ConnectionGUID: YAnxNj6CT8W82onMi5a8Gg==
X-CSE-MsgGUID: LV/FAStuTBSO5b7OTMAJzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="27686708"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="27686708"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 00:37:23 -0700
X-CSE-ConnectionGUID: HZX1TlqBQPOiYaMac/yuUQ==
X-CSE-MsgGUID: Lol48C0JS1KZoS2F9dJGgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="82268574"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa005.jf.intel.com with ESMTP; 14 Oct 2024 00:37:22 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v9 02/26] drm/xe/forcewake: Change awake_domain datatype
Date: Mon, 14 Oct 2024 13:25:37 +0530
Message-Id: <20241014075601.2324382-3-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
References: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
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

Change the datatype of awake_domains to unsigned int to accommodate
values that differ from the enum xe_force_wake_domains.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake_types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/gpu/drm/xe/xe_force_wake_types.h
index 494240777d03..fde17dc3d01e 100644
--- a/drivers/gpu/drm/xe/xe_force_wake_types.h
+++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
@@ -78,7 +78,7 @@ struct xe_force_wake {
 	/** @lock: protects everything force wake struct */
 	spinlock_t lock;
 	/** @awake_domains: mask of all domains awake */
-	enum xe_force_wake_domains awake_domains;
+	unsigned int awake_domains;
 	/** @initialized_domains: mask of all initialized domains */
 	unsigned int initialized_domains;
 	/** @domains: force wake domains */
-- 
2.34.1

