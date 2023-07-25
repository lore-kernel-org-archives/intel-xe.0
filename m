Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33CCC001DE
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 17:53:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77FDC10E194;
	Tue, 25 Jul 2023 17:53:09 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 20E9910E132;
 Tue, 25 Jul 2023 17:53:07 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 1DCE5AADE0;
 Tue, 25 Jul 2023 17:53:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Tue, 25 Jul 2023 17:53:07 -0000
Message-ID: <169030758711.27664.8789009831096927306@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230725173245.159053-5-matthew.auld@intel.com>
In-Reply-To: <20230725173245.159053-5-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_series_starting_with_=5BCI=2C1/4=5D_drm/xe/bo=3A_support_tie?=
 =?utf-8?q?red_vram_allocation_for_small-bar?=
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

Series: series starting with [CI,1/4] drm/xe/bo: support tiered vram allocation for small-bar
URL   : https://patchwork.freedesktop.org/series/121327/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: c7ed76839 drm/xe: xe_engine_create_ioctl should check gt_count, not tile_count
=== git am output follows ===
Applying: drm/xe/bo: support tiered vram allocation for small-bar
Applying: drm/xe/uapi: add the userspace bits for small-bar
Applying: drm/xe: fully turn on small-bar support
Applying: HAX: force small-bar


