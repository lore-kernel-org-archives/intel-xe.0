Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0BEC4332F
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 17:01:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F0C10EA55;
	Fri, 15 Dec 2023 17:01:50 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2D26010EA55;
 Fri, 15 Dec 2023 17:01:49 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 24A55AADE0;
 Fri, 15 Dec 2023 17:01:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_uAPI_Alignment_-_Mor?=
 =?utf-8?q?e_cleanup_before_upstream?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Fri, 15 Dec 2023 17:01:49 -0000
Message-ID: <170265970911.27834.16439080634476220156@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231215154553.7-1-francois.dugast@intel.com>
In-Reply-To: <20231215154553.7-1-francois.dugast@intel.com>
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
Reply-To: intel-xe@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: uAPI Alignment - More cleanup before upstream
URL   : https://patchwork.freedesktop.org/series/127878/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: d25c0edf6 drm/xe: Enable W=1 warnings by default
=== git am output follows ===
Applying: drm/xe/uapi: add exec_queue_id member to drm_xe_wait_user_fence structure
Applying: drm/xe/uapi: Return correct error code for xe_wait_user_fence_ioctl
Applying: drm/xe/uapi: Remove DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY
Applying: drm/xe/uapi: Remove DRM_XE_UFENCE_WAIT_MASK_*
Applying: drm/xe/pmu: Remove PMU from Xe till uapi is finalized
Applying: drm/xe/uapi: Ensure every uapi struct has drm_xe prefix
Applying: drm/xe/uapi: Remove sync binds
Applying: drm/xe/uapi: Add a comment to each struct
Applying: drm/xe/uapi: Add missing documentation for struct members
Applying: drm/xe/uapi: Document use of size in drm_xe_device_query
Applying: drm/xe/uapi: Document drm_xe_query_config keys
Applying: drm/xe/uapi: Document DRM_XE_DEVICE_QUERY_HWCONFIG
Applying: drm/xe/uapi: Make constant comments visible in kernel doc
Applying: drm/xe/uapi: Order sections
Applying: drm/xe/uapi: More uAPI documentation additions and cosmetic updates
Applying: drm/xe/uapi: Document the memory_region bitmask
Applying: drm/xe/uapi: Add block diagram of a device
Applying: drm/xe/uapi: Add examples of user space code
Applying: drm/xe/uapi: Move CPU_CACHING defines before doc
Applying: drm/xe/uapi: Move DRM_XE_ACC_GRANULARITY_* where they are used
Applying: drm/xe/uapi: Remove reset uevent for now


