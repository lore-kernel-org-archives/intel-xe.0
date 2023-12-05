Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E88C4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 17:49:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 448F210E5C7;
	Tue,  5 Dec 2023 17:49:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18DE610E5C7
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 17:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701798553; x=1733334553;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sixq84EkL/ffMQAp9GLphhqywUZwW0I6Ta1TzWSj3mI=;
 b=Qu2+08ntrTY1PodcM98guJZae+Fx0GndHtaGTN/mhw+28PjN7c6wDzCy
 iXKwApz2fFwTxynZ/0Tmia45RA5w2e7dLYp5aV9Uq9kl+mq4HQ89MnJu6
 2qAlwLYXhtselMGLvhze6fpT0soynbUUZfrPN7tHndEwZk2GVez2EIH3W
 FZO7zKAMPZ+KhnBHjazJE9cGrJFdPR1tG5/l0MLiDZoTXGB0vx9UTZl9H
 3RraHmh7W5R1SDWd8JAgQoFKJN2neP2GhhkPQEwNafRFY/oJ4Zu9BHRNN
 ogZ2VjFgrDkJCNYQvENUi3f8sE+5JTv5IaSQfp/39daT8qJNhRehadMeJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="773980"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="773980"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 09:49:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="805354578"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="805354578"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 09:49:12 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  5 Dec 2023 09:43:49 -0800
Message-Id: <20231205174349.2169863-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] fixup! drm/xe: Make DRM_XE_DEVICE_QUERY_ENGINES
 future proof
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Fix kerneldoc build, as being warned by CI with the Hooks execution.

	$ find drivers/gpu/drm/xe/ -name '*.[ch]' -not -path 'drivers/gpu/drm/xe/display/*' | \
		xargs ./scripts/kernel-doc -Werror -none include/uapi/drm/xe_drm.h
	include/uapi/drm/xe_drm.h:152: warning: Function parameter or member 'engine_class' not described in 'drm_xe_engine_class_instance'
	include/uapi/drm/xe_drm.h:152: warning: Function parameter or member 'engine_instance' not described in 'drm_xe_engine_class_instance'
	include/uapi/drm/xe_drm.h:152: warning: Function parameter or member 'gt_id' not described in 'drm_xe_engine_class_instance'
	3 warnings as Errors

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 include/uapi/drm/xe_drm.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index eb03a49c17a1..0895e4d2a981 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -129,7 +129,6 @@ struct xe_user_extension {
  * It is returned as part of the @drm_xe_engine, but it also is used as
  * the input of engine selection for both @drm_xe_exec_queue_create and
  * @drm_xe_query_engine_cycles
- *
  */
 struct drm_xe_engine_class_instance {
 #define DRM_XE_ENGINE_CLASS_RENDER		0
@@ -143,9 +142,11 @@ struct drm_xe_engine_class_instance {
 	 */
 #define DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC	5
 #define DRM_XE_ENGINE_CLASS_VM_BIND_SYNC	6
+	/** @engine_class: engine class id */
 	__u16 engine_class;
-
+	/** @engine_instance: engine instance id */
 	__u16 engine_instance;
+	/** @gt_id: Unique ID of this GT within the PCI Device */
 	__u16 gt_id;
 	/** @pad: MBZ */
 	__u16 pad;
-- 
2.40.1

