Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197BFC04FEE
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 19:52:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C188D10E089;
	Wed, 20 Sep 2023 19:52:03 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5FBFD10E53B;
 Wed, 20 Sep 2023 19:52:02 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 62EDFA00E6;
 Wed, 20 Sep 2023 19:52:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Wed, 20 Sep 2023 19:52:02 -0000
Message-ID: <169523952240.6465.13283262615462840883@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230920192940.135004-1-rodrigo.vivi@intel.com>
In-Reply-To: <20230920192940.135004-1-rodrigo.vivi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_uAPI_Alignment_-_take_1_v2?=
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

Series: uAPI Alignment - take 1 v2
URL   : https://patchwork.freedesktop.org/series/124000/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 805557401 fixup! drm/xe/display: Implement display support
=== git am output follows ===
Applying: drm/xe: Fix array bounds check for queries
Applying: drm/xe: Set the correct type for xe_to_user_engine_class
Applying: drm/xe: Correlate engine and cpu timestamps with better accuracy
Applying: drm/xe/uapi: Separate VM_BIND's operation and flag
Applying: drm/xe/vm: Remove VM_BIND_OP macro
Applying: drm/xe/uapi: Remove MMIO ioctl
Applying: drm/xe: Fix xe_exec_queue_is_idle for parallel exec queues
Applying: drm/xe: Deprecate XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE implementation
Applying: drm/xe: Rename exec_queue_kill_compute to xe_vm_remove_compute_exec_queue
Applying: drm/xe: Remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from uAPI
Applying: drm/xe/uapi: Use common drm_xe_ext_set_property extension
Applying: drm/xe: Kill XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS extension
Applying: drm/xe/uapi: Document drm_xe_query_gt
Applying: drm/xe/uapi: Replace useless 'instance' per unique gt_id
Applying: drm/xe/uapi: Remove unused field of drm_xe_query_gt
Applying: drm/xe/uapi: Rename gts to gt_list
Applying: drm/xe/uapi: Fix naming of XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY
Applying: drm/xe/uapi: Add documentation for query
Applying: drm/xe/uapi: Crystal Reference Clock updates
Applying: drm/xe: Extend drm_xe_vm_bind_op


