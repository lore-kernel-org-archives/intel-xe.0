Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58DEC02198
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 20:48:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A6AE10E0B4;
	Fri, 14 Feb 2025 20:48:40 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2167310E0B4;
 Fri, 14 Feb 2025 20:48:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe/xe=5Fdrm=5Fcl?=
 =?utf-8?q?ient=3A_Add_per_drm_client_reset_stats?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Feb 2025 20:48:40 -0000
Message-ID: <173956612013.2160688.15088301278673631175@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250214203757.27895-1-jonathan.cavitt@intel.com>
In-Reply-To: <20250214203757.27895-1-jonathan.cavitt@intel.com>
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

Series: drm/xe/xe_drm_client: Add per drm client reset stats
URL   : https://patchwork.freedesktop.org/series/144903/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: cbd747025a1e drm-tip: 2025y-02m-14d-20h-41m-39s UTC integration manifest
=== git am output follows ===
.git/rebase-apply/patch:40: trailing whitespace.
 *		
warning: 1 line adds whitespace errors.
Applying: drm/xe/xe_exec_queue: Add ID param to exec queue struct
Applying: drm/xe/xe_gt_pagefault: Migrate pagefault struct to header
Applying: FIXME: drm/xe/xe_drm_client: Add per drm client pagefault info
Applying: drm/xe/xe_drm_client: Add per drm client reset stats


