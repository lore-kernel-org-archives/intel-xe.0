Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459BBC02198
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 17:08:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1598010E93A;
	Wed, 12 Feb 2025 17:08:17 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 204AB10E92D;
 Wed, 12 Feb 2025 17:08:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Add_support_for_Mesa?=
 =?utf-8?q?_GPU_hang_replay_tool_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 12 Feb 2025 17:08:16 -0000
Message-ID: <173938009612.1363296.14514115741824221278@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250211022006.23234-1-carlos.santa@intel-corp-partner.google.com>
In-Reply-To: <20250211022006.23234-1-carlos.santa@intel-corp-partner.google.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Add support for Mesa GPU hang replay tool (rev2)
URL   : https://patchwork.freedesktop.org/series/143868/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: b9696aa14a67 drm-tip: 2025y-02m-12d-16h-46m-44s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Add properties line to VM snapshot capture
Applying: drm/xe: Add "null_sparse" type to VM snap properties
Applying: drm/xe: Add mem_region to properties line in VM snapshot capture
Applying: drm/xe/uapi: Add DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
Applying: drm/xe: Add replay_offset and replay_length lines to LRC HWCTX snapshot
Applying: drm/xe: Implement DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE


