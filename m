Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682D8C61DF7
	for <intel-xe@archiver.kernel.org>; Thu, 23 Nov 2023 14:14:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 278CC10E76C;
	Thu, 23 Nov 2023 14:14:24 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2610310E76F;
 Thu, 23 Nov 2023 14:14:23 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 20476AADD1;
 Thu, 23 Nov 2023 14:14:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Date: Thu, 23 Nov 2023 14:14:23 -0000
Message-ID: <170074886309.8135.13210781296679071217@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231122143833.7-1-francois.dugast@intel.com>
In-Reply-To: <20231122143833.7-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_uAPI_Alignment_-_Cleanup_and_future_proof_=28rev5=29?=
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

Series: uAPI Alignment - Cleanup and future proof (rev5)
URL   : https://patchwork.freedesktop.org/series/126535/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 501feae7a drm/xe/xe2: Add workaround 14019449301
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
Applying: drm/xe/uapi: Remove bogus engine list from the wait_user_fence IOCTL
Applying: drm/xe/uapi: Add Tile ID information to the GT info query
Applying: drm/xe/uapi: Fix various struct padding for 64b alignment
Applying: drm/xe/uapi: Move xe_exec after xe_exec_queue


