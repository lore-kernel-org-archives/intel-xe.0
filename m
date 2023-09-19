Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5648ECD5BCD
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 14:32:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F1C10E292;
	Tue, 19 Sep 2023 14:32:15 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id B242010E292;
 Tue, 19 Sep 2023 14:32:13 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id B4DD0A0003;
 Tue, 19 Sep 2023 14:32:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Tue, 19 Sep 2023 14:32:13 -0000
Message-ID: <169513393373.3669.6345625632772350773@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230919142504.91652-1-rodrigo.vivi@intel.com>
In-Reply-To: <20230919142504.91652-1-rodrigo.vivi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_uAPI_Alignment_-_take_1?=
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

Series: uAPI Alignment - take 1
URL   : https://patchwork.freedesktop.org/series/123917/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: fac2e20c7 Revert "FIXME: drm/i915/hpd: skip intel_hpd_poll_fini() for non-display paths"
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


