Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F055C4167B
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 23:27:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC4B10E328;
	Thu, 30 Nov 2023 23:27:34 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id B0C6510E077;
 Thu, 30 Nov 2023 23:27:32 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9AE5EAADE1;
 Thu, 30 Nov 2023 23:27:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Souza, Jose" <jose.souza@intel.com>
Date: Thu, 30 Nov 2023 23:27:32 -0000
Message-ID: <170138685261.15643.11435696921761906540@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231130183955.7-1-francois.dugast@intel.com>
In-Reply-To: <20231130183955.7-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_uAPI_Alignment_-_Cleanup_and_future_proof_=28rev6=29?=
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

Series: uAPI Alignment - Cleanup and future proof (rev6)
URL   : https://patchwork.freedesktop.org/series/126535/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 84f2c2ade drm/xe/xe2: Respond to TRTT faults as unsuccessful page fault
=== git am output follows ===
Applying: drm/xe: Extend drm_xe_vm_bind_op
Applying: drm/xe/uapi: Separate bo_create placement from flags
Applying: drm/xe: Make DRM_XE_DEVICE_QUERY_ENGINES future proof
Applying: drm/xe/uapi: Reject bo creation of unaligned size
Applying: drm/xe/uapi: Align on a common way to return arrays (memory regions)
Applying: drm/xe/uapi: Align on a common way to return arrays (gt)
Applying: drm/xe/uapi: Align on a common way to return arrays (engines)
Applying: drm/xe/uapi: Split xe_sync types from flags
Applying: drm/xe/uapi: Kill tile_mask
Applying: drm/xe/uapi: Crystal Reference Clock updates
Applying: drm/xe/uapi: Add Tile ID information to the GT info query
Applying: drm/xe/uapi: Fix various struct padding for 64b alignment
Applying: drm/xe/uapi: Move xe_exec after xe_exec_queue
Applying: drm/xe/uapi: Use LR abbrev for long-running vms
Applying: drm/xe: Remove unused extension definition
Applying: drm/xe/uapi: Kill exec_queue_set_property


