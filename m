Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FFEFCFC500
	for <intel-xe@archiver.kernel.org>; Mon, 14 Oct 2024 07:38:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D21F810E3A6;
	Mon, 14 Oct 2024 07:38:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LIJU83dL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B6A210E3A6
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Oct 2024 07:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728891500; x=1760427500;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ch8GTwHZbiZSk3wSdAn5riIWfqNSF96r7mOZUj59pJk=;
 b=LIJU83dLEgCPMDK4E4g+DDEcuPaNv/jFCsE4VH5N74EYZ8jWWCB3dU7v
 id6D4qjgFPuS1+e1d/c1RivORybjJkBRQVs8BssvhNyxShmTqhLY6yhcp
 gpMWEfHmuW7RqrGI+wzbBZngFVILs06Gyh6k3jcP+n7cNNx48RVFiIeNZ
 oT2o1cfhB8jdQ7eeZx7qHN31sxa6ntOHv6/DAfoiN+JnV03oaWt5UEbAP
 iIyIaHJxKe2p8PcC7WmfTldXUWTfl+TYbS/K9okBu9F4BP16i4pr9u7Qz
 4JNbk1BF8tZAUtId9v5KVpzWUEPizZyOg4jhA6T5l1Is2E4wdSoqubdpv w==;
X-CSE-ConnectionGUID: IFNEHiYoRUGOF0JREaz0NA==
X-CSE-MsgGUID: qUPihCJ/SC6xhl8N4rwxZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="27686825"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="27686825"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 00:38:17 -0700
X-CSE-ConnectionGUID: 4v8OFtUkRviLTK6m4VjmWg==
X-CSE-MsgGUID: x6yI0p+kQMC243Vhg3kkhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="82268813"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa005.jf.intel.com with ESMTP; 14 Oct 2024 00:38:13 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v9 26/26] drm/xe: Change return type to void for
 xe_force_wake_put
Date: Mon, 14 Oct 2024 13:26:01 +0530
Message-Id: <20241014075601.2324382-27-himal.prasad.ghimiray@intel.com>
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

There is no need to return an error from xe_force_wake_put(), as a
failure implicitly indicates that the domain failed to sleep.

v3
- Move kernel-doc to this patch (Badal)

v5
- change parameter to unsigned int in xe_force_wake_put()

v6
- Remove unneccsary wrapping (Michal)
- Remove non required header (Michal)
- Mention timeout(Michal)

v8
- Fix kernel-doc

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c | 16 ++++++++++++----
 drivers/gpu/drm/xe/xe_force_wake.h |  3 +--
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index c60db78c44e6..f5067dea59c9 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -211,8 +211,17 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
 	return ref_incr;
 }
 
-int xe_force_wake_put(struct xe_force_wake *fw,
-		      unsigned int fw_ref)
+/**
+ * xe_force_wake_put - Decrement the refcount and put domain to sleep if refcount becomes 0
+ * @fw: Pointer to the force wake structure
+ * @fw_ref: return of xe_force_wake_get()
+ *
+ * This function reduces the reference counts for domains in fw_ref. If
+ * refcount for any of the specified domain reaches 0, it puts the domain to sleep
+ * and waits for acknowledgment for domain to sleep within 50 milisec timeout.
+ * Warns in case of timeout of ack from domain.
+ */
+void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
 {
 	struct xe_gt *gt = fw->gt;
 	struct xe_force_wake_domain *domain;
@@ -225,7 +234,7 @@ int xe_force_wake_put(struct xe_force_wake *fw,
 	 * in error path of individual domains.
 	 */
 	if (!fw_ref)
-		return 0;
+		return;
 
 	if (xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
 		fw_ref = fw->initialized_domains;
@@ -249,5 +258,4 @@ int xe_force_wake_put(struct xe_force_wake *fw,
 
 	xe_gt_WARN(gt, ack_fail, "Forcewake domain%s %#x failed to acknowledge sleep request\n",
 		   str_plural(hweight_long(ack_fail)), ack_fail);
-	return ack_fail;
 }
diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index 70faec9ae2d9..0e3e84bfa51c 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -17,8 +17,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt,
 				struct xe_force_wake *fw);
 unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
 					    enum xe_force_wake_domains domains);
-int xe_force_wake_put(struct xe_force_wake *fw,
-		      unsigned int fw_ref);
+void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref);
 
 static inline int
 xe_force_wake_ref(struct xe_force_wake *fw,
-- 
2.34.1

