Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D66C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 15:42:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F07BA10E61A;
	Wed, 29 Nov 2023 15:42:28 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id DF2F110E61A;
 Wed, 29 Nov 2023 15:42:27 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id D9DE8AADDD;
 Wed, 29 Nov 2023 15:42:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Animesh Manna" <animesh.manna@intel.com>
Date: Wed, 29 Nov 2023 15:42:27 -0000
Message-ID: <170127254788.12093.9643742108887902484@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231129135054.564076-1-animesh.manna@intel.com>
In-Reply-To: <20231129135054.564076-1-animesh.manna@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_DSB_refactoring?=
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

Series: DSB refactoring
URL   : https://patchwork.freedesktop.org/series/127049/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 85b250055 drm/xe: explicitly set GGTT access for GuC DMA
=== git am output follows ===
.git/rebase-apply/patch:94: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: Revert "FIXME: drm/i915/dsb: xe changes for dsb"
Applying: drm/i915/dsb: Allocate command buffer from local memory
Applying: drm/i915/dsb: Correct DSB command buffer cache coherency settings
Applying: drm/i915/dsb: Re-instate DSB for LUT updates
Applying: drm/i915/dsb: DSB code refactoring
Applying: drm/xe/dsb: DSB implementation for xe


