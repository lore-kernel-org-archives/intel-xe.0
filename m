Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C5CC4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 16:05:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD8110E8E0;
	Thu,  9 Nov 2023 16:05:47 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 88DCE10E8E0;
 Thu,  9 Nov 2023 16:05:05 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 076AFAADEF;
 Thu,  9 Nov 2023 16:05:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Thu, 09 Nov 2023 16:05:05 -0000
Message-ID: <169954590502.26591.3932335501664776093@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231109154457.7-1-francois.dugast@intel.com>
In-Reply-To: <20231109154457.7-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_uAPI_Alignment_-_take_2?=
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

Series: uAPI Alignment - take 2
URL   : https://patchwork.freedesktop.org/series/126203/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 2096aea11 fixup! drm/xe/gsc: add gsc device support
=== git am output follows ===
Applying: drm/xe/uapi: Add documentation for query
Applying: drm/xe: Extend drm_xe_vm_bind_op
Applying: drm/xe: Add uAPI to query micro-controler firmware version
Applying: drm/xe/uapi: Document DRM_XE_DEVICE_QUERY_HWCONFIG
Applying: drm/xe: Extend uAPI to query HuC micro-controler firmware version
Applying: drm/xe/uapi: Remove useless XE_QUERY_CONFIG_NUM_PARAM
Applying: drm/xe/uapi: Add missing DRM_ prefix in uAPI constants
Applying: drm/xe/uapi: Add _FLAG to uAPI constants usable for flags
Applying: drm/xe/uapi: Make constant comments visible in kernel doc
Applying: drm/xe/uapi: Change rsvd to pad in struct drm_xe_class_instance
Applying: drm/xe/uapi: Remove GT_TYPE_REMOTE
Applying: drm/xe/uapi: Kill VM_MADVISE IOCTL
Applying: drm/xe/uapi: Separate bo_create placement from flags
Applying: drm/xe/uapi: Remove unused inaccessible memory region
Applying: drm/xe/uapi: Remove unused QUERY_CONFIG_MEM_REGION_COUNT
Applying: drm/xe/uapi: Remove unused QUERY_CONFIG_GT_COUNT
Applying: drm/xe/uapi: Rename *_mem_regions masks
Applying: drm/xe/uapi: Rename query's mem_usage to mem_regions
Applying: drm/xe: Make DRM_XE_DEVICE_QUERY_ENGINES future proof
Applying: drm/xe/uapi: Replace BO with GEM in documentation
Applying: drm/xe/pmu: Drop interrupt pmu event
Applying: drm/xe/uapi: Reject bo creation of unaligned size
Applying: drm/xe/uapi: Fix indentation issues that sometimes causes build warning
Applying: drm/xe/uapi: Order sections
Applying: drm/xe/uapi: More uAPI documentation additions and cosmetic updates
Applying: drm/xe/uapi: Split xe_sync types from flags
Applying: drm/xe/uapi: Standardize the FLAG naming and assignment
Applying: drm/xe/uapi: Differentiate WAIT_OP from WAIT_MASK
Applying: drm/xe/uapi: Move xe_exec after xe_exec_queue
Applying: drm/xe/uapi: Move memory_region masks from GT to engine
Applying: drm/xe/uapi: Document the memory_region bitmask
Applying: drm/xe/uapi: Be more specific about the vm_bind prefetch region
Applying: drm/xe/uapi: Convert tile_mask to a pt_placement_hint
Applying: drm/xe/uapi: Exec queue documentation and variable renaming
Applying: drm/xe/uapi: Refactor engine information
Applying: drm/xe/uapi: Crystal Reference Clock updates
Applying: drm/xe/uapi: Add Tile ID information to the GT info query
Applying: drm/xe/uapi: Remove bogus engine list from the wait_user_fence IOCTL
Applying: drm/xe/uapi: Align on a common way to return arrays (memory regions)
Applying: drm/xe/uapi: Align on a common way to return arrays (gt)
Applying: drm/xe/uapi: Align on a common way to return arrays (engines)
Applying: drm/xe/uapi: Add block diagram of a device
Applying: drm/xe/uapi: Add examples of user space code


